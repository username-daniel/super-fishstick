import asyncio
import websockets
from datetime import timedelta, datetime
from ocpp.routing import on, after
from ocpp.v16.enums import Action, AuthorizationStatus, ChargePointStatus, ChargePointErrorCode, DataTransferStatus, \
    RegistrationStatus
from ocpp.v16 import call_result
from ocpp.v16 import ChargePoint as cp
from config import getdb, postdb, dbp
import logging
from meter_values_sanitizer import cleaner

# NOTE TIME IS CALCULATED IN MILLISECONDS
# id_tag = "17E38AFE"

# alien 526D94BA
logging.basicConfig(filename="archive.log", level=logging.INFO)
current_datetime = datetime.utcnow()
expirational_datetime = current_datetime + timedelta(weeks=2, hours=5)


async def change_charging_status(id_tag, carte):
    print("id_tags : %s" % id_tag)
    tog_charging = "UPDATE carte SET charging = %s WHERE uuid = %s"
    postdb.execute(tog_charging, (await charging_status(carte), id_tag))
    dbp.commit()

    print(postdb.rowcount, "affected")


async def charging_status(carte):
    x = carte["isCharging"]
    x ^= 1
    return x


async def change2auth_status(availability):
    switch = {
        'accepted': AuthorizationStatus.accepted,
        'blocked': AuthorizationStatus.blocked,
        'invalid': AuthorizationStatus.invalid,
        'expired': AuthorizationStatus.expired,
        'concurrent_tx': AuthorizationStatus.concurrent_tx
    }
    return switch.get(availability, AuthorizationStatus.invalid)


async def authorizer(id_tag: str):
    ver_uuid = "SELECT status, charging, parent_id FROM carte WHERE uuid = %s"
    postdb.execute(ver_uuid, (id_tag,))
    res_sql = postdb.fetchone()
    print(res_sql)

    if res_sql is None:
        print("try something else")
        print("id_tags : %s is an alien" % id_tag)
        carte = None
        return carte

    else:
        carte = {
            "status": res_sql[0],
            "isCharging": res_sql[1],
            "parent_id": res_sql[2]
        }
        return carte


class ChargePoint(cp):
    print(cp)
    print("----******----")

    @on(Action.BootNotification)
    async def on_boot_notification(self, *args, **kwargs):
        print(self.id)

        for arg in args:
            print("arg : %s" % arg)

        for kwarg in kwargs:
            print("kwarg : %s" % kwarg)

        for key, value in kwargs.items():
            print("%s == %s" % (key, value))

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

        find_charger = "SELECT state, vendor, model, serial_number, firmware_version FROM charger WHERE id = %s"
        postdb.execute(find_charger, (self.id,))
        res_sql = postdb.fetchone()

        if type(res_sql) is tuple:
            if not all(res_sql):
                update_charger = "UPDATE charger SET vendor = %s, model = %s, serial_number = %s, " \
                                 "firmware_version = %s WHERE id = %s"
                postdb.execute(update_charger, (vendor, model, serial_number, firmware_version, self.id))
                dbp.commit()
                print(postdb.rowcount, "affected")
                print("boot info stockeds")
            else:
                print("boot info updated")

            status = ver_res(res_sql[0])

        elif res_sql is None:
            print("no record")
            print("is not a tuple but %s" % type(res_sql))

            status = RegistrationStatus.rejected

        else:
            print("oops")
            print("is not a tuple but %s" % type(res_sql))
            status = RegistrationStatus.rejected

        print("on boot")
        print(status)

        return call_result.BootNotificationPayload(
            current_time=current_datetime.isoformat(),
            interval=300,  # 1.5minutes =90000 pen : 3min rej : 5mins
            status=status
        )

    @on(Action.Heartbeat)
    async def on_heart_beat(self, *args, **kwargs):
        for arg in args:
            print("arg : %s" % arg)

        for key, value in kwargs.items():
            print("%s == %s" % (key, value))

        print("heartbeat")

        return call_result.HeartbeatPayload(
            current_time=current_datetime.isoformat() + "Z"
        )

    @on(Action.Authorize)
    async def on_auth(self, id_tag, *args, **kwargs):
        print("auth")
        print(id_tag)

        for arg in args:
            print("arg : %s" % arg)

        for key, value in kwargs.items():
            print("%s == %s" % (key, value))

        res = await authorizer(id_tag)

        if res is None:
            id_tag_info = dict(status=AuthorizationStatus.invalid, expiry_date=current_datetime.isoformat(),
                               parent_id_tag=None)
            return id_tag_info
        else:
            if res["status"] == "accepted":
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
        print("data transfer")

        for arg in args:
            print("arg : %s" % arg)

        for key, value in kwargs.items():
            print("%s == %s" % (key, value))

        return call_result.DataTransferPayload(
            status=DataTransferStatus.rejected
        )

    @on(Action.DiagnosticsStatusNotification)
    async def on_diagnostics(self, *args, **kwargs):
        print("diagnos")

        for arg in args:
            print("arg : %s" % arg)

        for key, value in kwargs.items():
            print("%s == %s" % (key, value))

    @on(Action.FirmwareStatusNotification)
    async def on_firm_ware(self, *args, **kwargs):
        print("firm ware")

        for arg in args:
            print("arg : %s" % arg)

        for key, value in kwargs.items():
            print("%s == %s" % (key, value))

    @on(Action.MeterValues)
    async def on_meter_values(self, connector_id, meter_value, *args, **kwargs):

        print("meter")
        print(meter_value)

        for arg in args:
            print("arg : %s" % arg)

        for key, value in kwargs.items():
            print("%s == %s" % (key, value))

        for kwarg in kwargs:
            print("kwarg : %s" % kwarg)

        transaction_id = kwargs.get('transaction_id', None)
        if transaction_id is None:
            trans_id = None
        else:
            trans_id = kwargs['transaction_id']

        meterstamp = meter_value[0].get("timestamp")

        meterval = meter_value[0].get("sampled_value")

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
        postdb.execute(find_trans, (connector_id,))
        res_sql = postdb.fetchone()

        if type(res_sql) is tuple:
            print("TUPLE")
            update_consumption = "UPDATE feed SET trans_id = %s, l1v = %s, l2v = %s, " \
                                 "l3v = %s, l1a = %s, l2a = %s, l3a = %s, temp = %s, watts = %s," \
                                 "consumed = %s, timestamp = %s  WHERE connector_id = %s"
            postdb.execute(
                update_consumption,
                (trans_id, l1v, l2v, l3v, l1a, l2a, l3a, temp, watts, consumed, meterstamp, connector_id))
            dbp.commit()
            print(postdb.rowcount, "affected")

        elif res_sql is None:
            print("NONE")
            write_consumption = "INSERT INTO feed (trans_id, connector_id, l1v, l2v, l3v, l1a, l2a, l3a, temp, " \
                                "watts,consumed,timestamp) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            postdb.execute(write_consumption,
                           (trans_id, connector_id, l1v, l2v, l3v, l1a, l2a, l3a, temp, watts, consumed, meterstamp))
            dbp.commit()
            print(postdb.rowcount, "affected")

        print("Meter Values")
        print("****************")
        print("conn id %s is of type %s" % (connector_id, type(connector_id)))
        print("****************")
        print("meter vals %s is of type %s" % (meter_value, type(meter_value)))

        print("meter")
        print(connector_id)
        print(meter_value)

        """
        SANITY CHECK
            def meterValues(values, *args, **kwargs):
            # Perform a sanity check on the input values
            if not isinstance(values, list):
            raise ValueError("Input values must be a list")
            if len(values) == 0:
            raise ValueError("Input values list cannot be empty")
            for value in values:
            if not isinstance(value, int):
            raise ValueError("Input values must be integers")
            if value < 0:
            raise ValueError("Input values must be positive")
        """
        return call_result.MeterValuesPayload(

        )

    @on(Action.StartTransaction)
    async def on_start_transaction(self, id_tag, meter_start, connector_id, timestamp, *args, **kwargs):
        print("start")
        for arg in args:
            print("arg : %s" % arg)

        for key, value in kwargs.items():
            print("%s == %s" % (key, value))

        res = await authorizer(id_tag)

        if res is None:
            id_tag_info = dict(status=AuthorizationStatus.invalid, expiry_date=current_datetime.isoformat(),
                               parent_id_tag=None)
            trans_id = None
        else:
            if res["status"] == "accepted":
                if res["isCharging"] == 1:
                    res["status"] = "concurrent_tx"
                    expiry = (expirational_datetime - timedelta(days=2)).isoformat()
                    trans_id = None
                    print(res, trans_id)
                else:
                    expiry = expirational_datetime.isoformat()
                    await change_charging_status(id_tag, res)

                    start_charging = "INSERT INTO session (id_tag, connector_id, meter_start, start_stamp) VALUES (%s, %s, %s, %s)"
                    postdb.execute(start_charging, (id_tag, connector_id, meter_start, timestamp))
                    dbp.commit()
                    print(postdb.rowcount, "affected")
                    print("start accepted")

                    fetch_last_start_id = "SELECT MAX(id) FROM session"
                    postdb.execute(fetch_last_start_id)
                    last_id = postdb.fetchone()
                    trans_id = last_id[0]

            else:
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
        for arg in args:
            print("arg : %s" % arg)

        for key, value in kwargs.items():
            print("%s == %s" % (key, value))

        print("stats")
        print(timestamp)

        stats = "UPDATE charger SET error_code = %s, status = %s, timestamp = %s  WHERE connector_id = %s"
        postdb.execute(stats, (error_code, status, timestamp, connector_id))
        dbp.commit()
        print(postdb.rowcount, "affected")

        return call_result.StatusNotificationPayload(

        )

    @on(Action.StopTransaction)
    async def on_stop_transaction(self, id_tag, meter_stop, timestamp, transaction_id, reason, *args, **kwargs):
        for arg in args:
            print("arg : %s" % arg)

        for key, value in kwargs.items():
            print("%s == %s" % (key, value))

        print("stop_trans")
        print(timestamp)

        print("stop")
        res = await authorizer(id_tag)
        await change_charging_status(id_tag, res)

        print("stop_trans registered")
        stop_charging = "UPDATE session SET meter_stop = %s, reason = %s, stop_stamp = %s WHERE id = %s"
        postdb.execute(stop_charging, (meter_stop, reason, timestamp, transaction_id))
        dbp.commit()
        print(postdb.rowcount, "affected")
        print("start accepted")
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
        "10.45.2.39",
        9000,
        ping_interval=30000,  # 3mins = 180000
        ping_timeout=300000,  # 5 mins
        subprotocols=['ocpp1.6']
    )

    print("Server Started listening to new connections...")

    await server.wait_closed()


if __name__ == "__main__":
    asyncio.run(main())
