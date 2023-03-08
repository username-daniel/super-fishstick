from ocpp.v16.enums import Action, AuthorizationStatus, ChargePointStatus, ChargePointErrorCode, DataTransferStatus, \
    RegistrationStatus
from ocpp.v16 import call_result
from ocpp.v16 import ChargePoint as cp
from config import getdb, db, dbp, dbg
from datetime import timedelta, datetime

current_datetime = datetime.utcnow()
expirational_datetime = current_datetime + timedelta(weeks=2, hours=5)


def change_charging_status(id_tag, carte):
    print("id_tags : %s" % id_tag)
    tog_charging = "UPDATE carte SET charging = %s WHERE uuid = %s"
    db.execute(tog_charging, (charging_status(carte), id_tag))
    dbp.commit()

    print(db.rowcount, "affected")


def charging_status(carte):
    x = carte["isCharging"]
    x ^= 1
    return x


def ver_res(availability):
    switch = {
        'accepted': AuthorizationStatus.accepted,
        'blocked': AuthorizationStatus.blocked,
        'invalid': AuthorizationStatus.invalid,
        'expired': AuthorizationStatus.expired,
        'concurrent_tx': AuthorizationStatus.concurrent_tx
    }
    return switch.get(availability, AuthorizationStatus.invalid)


def authorizer(id_tag: str):
    ver_uuid = "SELECT status, charging, parent_id FROM carte WHERE uuid = %s"
    db.execute(ver_uuid, (id_tag,))
    res_sql = db.fetchone()
    print(res_sql)

    if res_sql is None:
        print("try something else")  # FIXME STOP with local should count
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


def auth(id_tag):
    print("auth")

    res = authorizer(id_tag)

    if res is None:
        id_tag_info = dict(status=AuthorizationStatus.invalid, expiry_date=current_datetime.isoformat(),
                           parent_id_tag=None)
        return id_tag_info
    else:
        if res["status"] == "accepted":
            print("res stats accepted")
            expiring = expirational_datetime.isoformat()
        else:
            expiring = current_datetime.isoformat()

        carte_stat = ver_res(res["status"])
        print(expiring)
        print(res["parent_id"])
        id_tag_info = dict(status=carte_stat, expiry_date=expiring,
                           parent_id_tag=res["parent_id"])
        return id_tag_info


def start(id_tag):
    print("start")

    res = authorizer(id_tag)

    if res is None:
        id_tag_info = dict(status=AuthorizationStatus.invalid, expiry_date=current_datetime.isoformat(),
                           parent_id_tag=None)
        trans_id = None
        return id_tag_info
    else:
        if res["status"] == "accepted":
            expiring = expirational_datetime.isoformat()
            if res["isCharging"] == 1:
                res["status"] = "concurrent_tx"
                trans_id = None
                print(res, trans_id)
            else:
                change_charging_status(id_tag, res)
                trans_id = 1
                print(res, trans_id)

        else:
            res["status"] = "invalid"
            trans_id = None
            print(res, trans_id)


def stop(id_tag):
    print("stop")
    res = authorizer(id_tag)
    change_charging_status(id_tag, res)


auth("B1455FD6")
start("B1455FD6")
start("B1455FD6")
stop("B1455FD6")


"""
async def authorizer(id_tag: str, is_true_for_start_and_stop_transaction: bool, *args):
    "/""
        authorizer authorise a user for authorization, start and stop transaction by fetching the parent_id, status
        and charging of the uuid from one database. if the response is none the auth is invalid.
        if the res is not none create a dict denies auth if already in use, toggles charging for start and stop
        transaction through another database otherwise authorise auth.

        Args:
            id_tag: str
            is_true_for_start_and_stop_transaction: bool
            *args: start / stop

        Returns:
            id_tag_info

        "/""

    demande = None

    if args:
        demande = args[0]

    print(demande)

    ver_uuid = "SELECT status, charging, parent_id FROM carte WHERE uuid = %s"
    getdb.execute(ver_uuid, (id_tag,))
    res_sql = getdb.fetchone()

    if res_sql is None:
        print("try something else")  # FIXME STOP with local should count
        print("id_tags : %s is an alien" % id_tag)
        id_tag_info = dict(status=AuthorizationStatus.invalid, expiry_date=current_datetime.isoformat(),
                           parent_id_tag=None)

        return id_tag_info

    else:
        carte = {
            "status": res_sql[0],
            "isCharging": res_sql[1],
            "parent_id": res_sql[2]
        }

        if carte["isCharging"] == 1 and is_true_for_start_and_stop_transaction is False:
            print("The card is already in use")
            id_tag_info = dict(status=AuthorizationStatus.concurrent_tx, parent_id_tag=carte["parent_id"],
                               expiry_date=(expirational_datetime - timedelta(days=2)).isoformat())
            return id_tag_info

        elif carte["isCharging"] == 1 and is_true_for_start_and_stop_transaction is True and demande == "start":
            print("The card is already in use")
            id_tag_info = dict(status=AuthorizationStatus.concurrent_tx, parent_id_tag=carte["parent_id"],
                               expiry_date=(expirational_datetime - timedelta(days=2)).isoformat())
            return id_tag_info
        elif carte["isCharging"] == 0 and is_true_for_start_and_stop_transaction is True and demande == "stop":
            print("you can't stop non started")
            id_tag_info = dict(status=AuthorizationStatus.concurrent_tx, parent_id_tag=carte["parent_id"],
                               expiry_date=(expirational_datetime - timedelta(days=2)).isoformat())
            return id_tag_info
        else:
            y = carte["status"]

            def change2auth_status(availability):
                switch = {
                    'accepted': AuthorizationStatus.accepted,
                    'blocked': AuthorizationStatus.blocked,
                    'invalid': AuthorizationStatus.invalid,
                    'expired': AuthorizationStatus.expired,
                    'concurrent_tx': AuthorizationStatus.concurrent_tx
                }
                return switch.get(availability, AuthorizationStatus.invalid)

            if is_true_for_start_and_stop_transaction is True:
                def toggle_charging_stat():
                    x = carte["isCharging"]
                    x ^= 1
                    carte["status"] = "accepted" if x == 0 else "concurrent_tx"
                    return x

                print("id_tags : %s" % id_tag)
                tog_charging = "UPDATE carte SET charging = %s, status = %s WHERE uuid = %s"
                db.execute(tog_charging, (toggle_charging_stat(), carte["status"], id_tag))
                dbp.commit()
                print(db.rowcount, "affected")

                if demande == "start":
                    id_tag_info = dict(status=change2auth_status(y), parent_id_tag=carte["parent_id"],
                                       expiry_date=expirational_datetime.isoformat())
                    return id_tag_info
                else:  # demande == "stop":
                    id_tag_info = dict(status=change2auth_status(carte["status"]), parent_id_tag=carte["parent_id"],
                                       expiry_date=expirational_datetime.isoformat())
                    return id_tag_info

            id_tag_info = dict(status=change2auth_status(carte["status"]), parent_id_tag=carte["parent_id"],
                               expiry_date=expirational_datetime.isoformat())
            return id_tag_info"""
"""ashim1970@gmailos.com"""