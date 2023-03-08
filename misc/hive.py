from ocpp.v16.enums import Action, AuthorizationStatus, ChargePointStatus, ChargePointErrorCode, DataTransferStatus, \
    RegistrationStatus
from ocpp.v16 import call_result
from ocpp.v16 import ChargePoint as cp
from config import getdb, db, dbp
from datetime import timedelta, datetime

current_datetime = datetime.utcnow()
expirational_datetime = current_datetime + timedelta(weeks=2, hours=5)


def authorizer(id_tag: str, is_true_for_start_and_stop_transaction: bool, *args):
    """
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

        """

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

        elif carte["isCharging"] == 1 and is_true_for_start_and_stop_transaction is False:
            print("The card is already in use")
            id_tag_info = dict(status=AuthorizationStatus.concurrent_tx, parent_id_tag=carte["parent_id"],
                               expiry_date=(expirational_datetime - timedelta(days=2)).isoformat())
            return id_tag_info

        else:
            y = carte["status"]

            def ver_res(availability):
                switch = {
                    'accepted': AuthorizationStatus.accepted,
                    'blocked': AuthorizationStatus.blocked,
                    'invalid': AuthorizationStatus.invalid,
                    'expired': AuthorizationStatus.expired,
                    'concurrent_tx': AuthorizationStatus.concurrent_tx
                }
                return switch.get(availability, AuthorizationStatus.invalid)

            if carte["isCharging"] == 1 and is_true_for_start_and_stop_transaction is True and demande == "start":
                print("The card is already in use")
                id_tag_info = dict(status=AuthorizationStatus.concurrent_tx, parent_id_tag=carte["parent_id"],
                                   expiry_date=(expirational_datetime - timedelta(days=2)).isoformat())
                return id_tag_info

            elif is_true_for_start_and_stop_transaction is True or (demande == "stop" and carte["isCharging"] == 1):
                def charging_status():
                    x = carte["isCharging"]
                    x ^= 1
                    carte["status"] = "accepted" if x == 0 else "concurrent_tx"
                    return x

                print("id_tags : %s" % id_tag)
                tog_charging = "UPDATE carte SET charging = %s, status = %s WHERE uuid = %s"
                db.execute(tog_charging, (charging_status(), carte["status"], id_tag))
                dbp.commit()
                print(db.rowcount, "affected")

                if demande == "start":
                    id_tag_info = dict(status=ver_res(y), parent_id_tag=carte["parent_id"],
                                       expiry_date=expirational_datetime.isoformat())
                    return id_tag_info
                else:  # demande == "stop":
                    id_tag_info = dict(status=ver_res(carte["status"]), parent_id_tag=carte["parent_id"],
                                       expiry_date=expirational_datetime.isoformat())
                    return id_tag_info

            # id_tag_info = dict(status=change2auth_status(carte["status"]), parent_id_tag=carte["parent_id"],
            #                   expiry_date=expirational_datetime.isoformat())
            # return id_tag_info


def on_start_transaction(id_tag):
    print("start")
    fake = authorizer("", False)
    id_tag_info = authorizer(id_tag, True, "start")

    if id_tag_info["status"] == AuthorizationStatus.accepted:
        print("start accepted")

        return id_tag_info

    elif id_tag_info["status"] == AuthorizationStatus.concurrent_tx:
        print("start ignored: card already in use")
        return id_tag_info == AuthorizationStatus.concurrent_tx

    else:
        print("start rejected")
        id_tag_info["status"] = AuthorizationStatus.invalid
        id_tag_info["expiry_date"] = current_datetime.isoformat()
        return id_tag_info


def on_stop_transaction(id_tag):
    print("stop_trans")
    fake = authorizer("", False)
    id_tag_info = authorizer(id_tag, True, "stop")

    if id_tag_info["status"] == AuthorizationStatus.accepted:
        print("stop_trans registered")

        return id_tag_info
    else:
        print("stop_trans rejected")
        print(id_tag_info["status"])
        return id_tag_info


truth = on_start_transaction("B1455FD6")
print("irst", truth)

frat = on_stop_transaction("B1455FD6")
print("ast", frat)

# async def authorizer(id_tag: str, is_true_for_start_and_stop_transaction: bool):
#     """
#     authorizer authorise a user for authorization, start and stop transaction by fetching the parent_id, status
#     and charging of the uuid from one database. if the response is none the auth is invalid.
#     if the res is not none create a dict denies auth if already in use, toggles charging for start and stop
#     transaction through another database otherwise authorise auth.
#
#     Args:
#         id_tag: str
#         is_true_for_start_and_stop_transaction: bool
#
#     Returns:
#         id_tag_info
#
#     """
#     ver_uuid = "SELECT status, charging, parent_id FROM carte WHERE uuid = %s"
#     getdb.execute(ver_uuid, (id_tag,))
#     res_sql = getdb.fetchone()
#
#     if res_sql is None:
#         print("try something else")  # FIXME STOP with local should count
#         print("id_tags : %s is an alien" % id_tag)
#         id_tag_info = dict(status=AuthorizationStatus.invalid, expiry_date=current_datetime.isoformat(),
#                            parent_id_tag=None)
#
#         return id_tag_info
#
#     else:
#         carte = {
#             "status": res_sql[0],
#             "isCharging": res_sql[1],
#             "parent_id": res_sql[2]
#         }
#
#         if carte["isCharging"] == 1 and is_true_for_start_and_stop_transaction is False:
#             print("The card is already in use")
#             id_tag_info = dict(status=AuthorizationStatus.concurrent_tx, parent_id_tag=carte["parent_id"],
#                                expiry_date=(expirational_datetime - timedelta(days=2)).isoformat())
#             return id_tag_info
#         else:
#             async def change2auth_status(availability):
#                 switch = {
#                     'accepted': AuthorizationStatus.accepted,
#                     'blocked': AuthorizationStatus.blocked,
#                     'invalid': AuthorizationStatus.invalid,
#                     'expired': AuthorizationStatus.expired,
#                     'concurrent_tx': AuthorizationStatus.concurrent_tx
#                 }
#                 return switch.get(availability, AuthorizationStatus.invalid)
#
#             if is_true_for_start_and_stop_transaction is True:
#                 async def toggle_charging_stat():
#                     x = carte["isCharging"]
#                     x ^= 1
#                     carte["status"] = "accepted" if x == 0 else "concurrent_tx"
#                     return x
#
#                 print("id_tags : %s" % id_tag)
#                 tog_charging = "UPDATE carte SET charging = %s, status = %s WHERE uuid = %s"
#                 db.execute(tog_charging, (await toggle_charging_stat(), carte["status"], id_tag))
#                 dbp.commit()
#                 print(db.rowcount, "affected")
#                 id_tag_info = dict(status=await change2auth_status(carte["status"]), parent_id_tag=carte["parent_id"],
#                                    expiry_date=expirational_datetime.isoformat())
#                 return id_tag_info
