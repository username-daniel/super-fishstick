import asyncio
import logging
from datetime import timedelta, datetime

import websockets
from ocpp.routing import on
from ocpp.v16 import ChargePoint as cp
from ocpp.v16 import call_result
from ocpp.v16.enums import Action, AuthorizationStatus, DataTransferStatus, \
    RegistrationStatus

from config import db, dbp
from meter_values_sanitizer import cleaner

# nt = NOTE, exp = explication

# nt: !!!  TIME IS CALCULATED IN MILLISECONDS

# exp: functions to set logs with utctime
logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s¢[%(levelname)s]: %(message)s',
    datefmt='%d-%m-%Y_%H:%M:%S',
    filename="app.log"
)


class UTCFormatter(logging.Formatter):
    converter = datetime.utcfromtimestamp

    def formatTime(self, record, datefmt=None):
        dt = self.converter(record.created)
        if datefmt:
            return dt.strftime(datefmt)
        else:
            return dt.strftime("%d-%m-%Y_%H:%M:%S_UTC")


handler = logging.StreamHandler()
handler.setFormatter(UTCFormatter())

logger = logging.getLogger()
logger.addHandler(handler)
# exp: logs end here

logger.debug("We are live @@@@")

# exp: datetime for cache clearance
current_datetime = datetime.utcnow()
expirational_datetime = current_datetime + timedelta(weeks=2, hours=5)


# exp: shows the last 4 characters of vital data for debug
async def show_last(cred, kind):
    lth = len(cred)
    before_last4 = lth - 4

    vart = ""
    while before_last4 >= 1:
        vart += "*"
        before_last4 -= 1
    fake = vart + cred[-4:]
    logger.info("the %s { %s } is { %s } letters long." % (kind, fake, len(cred)))


# exp: func to change user charging status
async def change_charging_status(id_tag, carte):
    await show_last(id_tag, "id_tag")
    tog_charging = "UPDATE user_account SET current_charge_session_session_id = CAST(%s AS VARCHAR) WHERE id IN (" \
                   "SELECT id FROM user_rfid WHERE uid = %s)"
    db.execute(tog_charging, (await toggle_charging_stat(carte), id_tag))
    dbp.commit()

    logger.info(db.rowcount, "affected")


# exp: func to toggle user charging status before updating
async def toggle_charging_stat(carte):
    x = carte["isCharging"]
    x ^= 1
    return x


# exp: func to toggle user charging status to auth status
async def change2auth_status(availability):
    switch = {
        1: AuthorizationStatus.accepted,
        0: AuthorizationStatus.invalid,
    }
    return switch.get(availability, AuthorizationStatus.invalid)


# exp: func to auth user
async def authorizer(id_tag: str):
    logger.info("in authorizer µµµµµ")
    await show_last(id_tag, "id_tag")
    # FIXME: parent is fake and should be removed.!!
    ver_uuid = "SELECT enabled, CAST(current_charge_session_session_id AS INT), parent_tag FROM user_rfid WHERE uid = " \
               "%s"
    db.execute(ver_uuid, (id_tag,))
    res_sql = db.fetchone()
    logger.info("res_sql is %s", type(res_sql))

    if res_sql is None:
        logger.warning("pls, id is an alien. Try something else !!")
        carte = None
        return carte

    else:
        logger.info("matched a carte !!")
        carte = {
            "status": res_sql[0],
            "isCharging": res_sql[1],
            "parent_id": res_sql[2]
        }
        return carte


# exp: func def chargepoint
class ChargePoint(cp):
    logger.info(cp)
    logger.info("----******----")

    @on(Action.BootNotification)
    async def on_boot_notification(self, *args, **kwargs):
        logger.info("in boot_notification µµµµµ")

        vendor = kwargs['charge_point_vendor']
        model = kwargs['charge_point_model']
        serial_number = kwargs['charge_point_serial_number']
        firmware_version = kwargs['firmware_version']

        def ver_res(availability):
            switch = {
                'accepted': RegistrationStatus.accepted,
                'pending': RegistrationStatus.pending,
                'rejected': RegistrationStatus.rejected,
            }
            return switch.get(availability, RegistrationStatus.rejected)

        find_charger = "SELECT state, vendor, model, serial_number, firmware_version FROM charger WHERE connector_id = %s"
        db.execute(find_charger, (self.id,))
        res_sql = db.fetchone()
        logger.info("res_sql is %s", type(res_sql))

        if type(res_sql) is tuple:
            if not all(res_sql):
                update_charger = "UPDATE charger SET vendor = %s, model = %s, serial_number = %s, " \
                                 "firmware_version = %s WHERE id = %s"
                db.execute(update_charger, (vendor, model, serial_number, firmware_version, self.id))
                dbp.commit()
                logger.info(db.rowcount, "affected")
                logger.info("boot info stockeds")
            else:
                logger.info("boot info updated")

            status = ver_res(res_sql[0])

        elif res_sql is None:
            logger.warning("no record")
            logger.warning("is not a tuple but %s" % type(res_sql))

            status = RegistrationStatus.rejected

        else:
            logger.warning("oops")
            logger.warning("is not a tuple but %s" % type(res_sql))
            status = RegistrationStatus.rejected

        logger.info(status)

        return call_result.BootNotificationPayload(
            current_time=current_datetime.isoformat(),
            interval=300,  # 1.5minutes =90000 pen : 3min rej : 5mins
            status=status
        )

    @on(Action.Heartbeat)
    async def on_heart_beat(self, *args, **kwargs):
        logger.info("in heartbeat µµµµµ")

        return call_result.HeartbeatPayload(
            current_time=current_datetime.isoformat() + "Z"
        )

    @on(Action.Authorize)
    async def on_auth(self, id_tag, *args, **kwargs):
        logger.info("in auth µµµµµ")
        await show_last(id_tag, "id_tag")

        res = await authorizer(id_tag)

        if res is None:
            id_tag_info = dict(status=AuthorizationStatus.invalid, expiry_date=current_datetime.isoformat(),
                               parent_id_tag=None)
            return id_tag_info
        else:
            if res["status"] == 1:
                expiring = expirational_datetime.isoformat()
            else:
                expiring = current_datetime.isoformat()

            carte_stat = await change2auth_status(res["status"])
            id_tag_info = dict(status=carte_stat, expiry_date=expiring,
                               parent_id_tag=res["parent_id"])

        return call_result.AuthorizePayload(
            id_tag_info=id_tag_info
        )

    @on(Action.DataTransfer)
    async def on_data_transfer(self, *args, **kwargs):
        logger.info("in data_transfer µµµµµ")

        return call_result.DataTransferPayload(
            status=DataTransferStatus.rejected
        )

    @on(Action.DiagnosticsStatusNotification)
    async def on_diagnostics(self, *args, **kwargs):
        logger.info("in on_diagnostics µµµµµ")

        return call_result.DiagnosticsStatusNotificationPayload(

        )

    @on(Action.FirmwareStatusNotification)
    async def on_firm_ware(self, *args, **kwargs):
        logger.info("in on_firm_ware µµµµµ")

        return call_result.FirmwareStatusNotificationPayload(

        )

    @on(Action.MeterValues)
    async def on_meter_values(self, connector_id, meter_value, *args, **kwargs):

        logger.info("in meter_value µµµµµ")
        logger.info(meter_value)

        transaction_id = kwargs.get('transaction_id', None)
        if transaction_id is None:
            trans_id = None
            logger.warning("trans_id is %", None)
        else:
            trans_id = kwargs['transaction_id']
            logger.info("trans_id is % ", trans_id)

        meterstamp = meter_value[0].get("timestamp")

        meterval = meter_value[0].get("sampled_value")
        logger.info("meter_stamp", meterstamp)

        meter = await cleaner(meter_value)

        l1v = meter.get("l1v_value")
        l2v = meter.get("l2v_value")
        l3v = meter.get("l3v_value")
        l1a = meter.get("l1a_value")
        l2a = meter.get("l2a_value")
        l3a = meter.get("l3a_value")
        temp = meter.get("temp_value")
        watts = meter.get("watts_value")
        consumed = meter.get("watts_perhour_value")

        find_trans = "SELECT temp, watts, consumed FROM feed WHERE connector_id = %s"
        db.execute(find_trans, (connector_id,))
        res_sql = db.fetchone()
        logger.info("res_sql is %s", type(res_sql))

        if type(res_sql) is tuple:
            update_consumption = "UPDATE feed SET trans_id = %s, l1v = %s, l2v = %s, " \
                                 "l3v = %s, l1a = %s, l2a = %s, l3a = %s, temp = %s, watts = %s," \
                                 "consumed = %s, timestamp = %s  WHERE connector_id = %s"
            db.execute(
                update_consumption,
                (trans_id, l1v, l2v, l3v, l1a, l2a, l3a, temp, watts, consumed, meterstamp, connector_id))
            dbp.commit()
            logger.info(db.rowcount, "affected")

        elif res_sql is None:
            logger.warning("res_sql is %", None)
            write_consumption = "INSERT INTO feed (trans_id, connector_id, l1v, l2v, l3v, l1a, l2a, l3a, temp, " \
                                "watts,consumed,timestamp) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            db.execute(write_consumption,
                       (trans_id, connector_id, l1v, l2v, l3v, l1a, l2a, l3a, temp, watts, consumed, meterstamp))
            dbp.commit()
            logger.info(db.rowcount, "affected")

        logger.info("conn id %s is of type %s" % (connector_id, type(connector_id)))

        return call_result.MeterValuesPayload(

        )

    @on(Action.StartTransaction)
    async def on_start_transaction(self, id_tag, meter_start, connector_id, timestamp, *args, **kwargs):
        logger.info("in start_trans µµµµµ")

        res = await authorizer(id_tag)

        if res is None:
            logger.warning("res is %s", None)
            id_tag_info = dict(status=AuthorizationStatus.invalid, expiry_date=current_datetime.isoformat(),
                               parent_id_tag=None)
            trans_id = None
        else:
            logger.info("res is matched !!")
            if res["status"] == 1:
                if res["isCharging"] == 1:
                    res["status"] = "concurrent_tx"
                    expiry = (expirational_datetime - timedelta(days=2)).isoformat()
                    trans_id = None
                    logger.warning(res, trans_id)
                    logger.warning("card already in use !!")
                else:
                    expiry = expirational_datetime.isoformat()
                    await change_charging_status(id_tag, res)

                    start_charging = "INSERT INTO session (id_tag, connector_id, meter_start, start_stamp) VALUES (%s, %s, %s, %s)"
                    db.execute(start_charging, (id_tag, connector_id, meter_start, timestamp))
                    dbp.commit()
                    logger.info(db.rowcount, "affected")
                    logger.info("start accepted")

                    fetch_last_start_id = "SELECT MAX(id) FROM session"
                    db.execute(fetch_last_start_id)
                    last_id = db.fetchone()
                    trans_id = last_id[0]

            else:
                logger.warning("start fell into Oops")
                trans_id = None
                expiry = current_datetime.isoformat()

            stats = await change2auth_status(res["status"])
            id_tag_info = dict(status=stats, expiry_date=expiry, parent_id_tag=res["parent_id"])

        return call_result.StartTransactionPayload(
            transaction_id=trans_id,
            id_tag_info=id_tag_info
        )

    @on(Action.StatusNotification)
    async def on_status_notification(self, connector_id, error_code, status, timestamp, *args, **kwargs):
        logger.info("in status_notif µµµµµ")

        stats = "UPDATE charger SET error_code = %s, status = %s, timestamp = %s  WHERE connector_id = %s"
        db.execute(stats, (error_code, status, timestamp, connector_id))
        dbp.commit()
        logger.info(db.rowcount, "affected")

        return call_result.StatusNotificationPayload(

        )

    @on(Action.StopTransaction)
    async def on_stop_transaction(self, id_tag, meter_stop, timestamp, transaction_id, reason, *args, **kwargs):
        logger.info("in stop_trans µµµµµ")

        res = await authorizer(id_tag)
        await change_charging_status(id_tag, res)

        logger.info("stop_trans registered")
        stop_charging = "UPDATE session SET meter_stop = %s, reason = %s, stop_stamp = %s WHERE id = %s"
        db.execute(stop_charging, (meter_stop, reason, timestamp, transaction_id))
        dbp.commit()
        logger.info(db.rowcount, "affected")

        stats = await change2auth_status(res["status"])
        expiry = (expirational_datetime - timedelta(days=2)).isoformat()
        id_tag_info = dict(status=stats, expiry_date=expiry, parent_id_tag=res["parent_id"])
        return call_result.StopTransactionPayload(
            id_tag_info=id_tag_info
        )


async def on_connect(websocket, path):
    try:
        requested_protocols = websocket.request_headers[
            'Sec-WebSocket-Protocol'
        ]
    except KeyError:
        print("Client hasn't requested any Subprotocol. Closing Connection")
        return await websocket.close()

    if websocket.subprotocol:
        print("Protocols Matched: %s", websocket.subprotocol)
    else:
        print('Protocols Mismatched | Expected Subprotocols: %s,'
              ' but client supports  %s | Closing connection',
              websocket.available_subprotocols,
              requested_protocols)
        return await websocket.close()

    charge_point_id = path.strip('/')
    cp = ChargePoint(charge_point_id, websocket)

    await cp.start()

async def main():
    server = await websockets.serve(
        on_connect,
        "0.0.0.0",
        9000,
        ping_interval=30000,  # 3mins = 180000
        ping_timeout=300000,  # 5 mins
        subprotocols=['ocpp1.6'],
    )

    print("Server Started listening to new connections...")

    await server.wait_closed()


if __name__ == "__main__":
    asyncio.run(main())
