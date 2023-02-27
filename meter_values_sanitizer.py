async def cleaner(meter):
    # meter = [{'timestamp': '2023-02-23T14:07:06', 'sampled_value': [{'value': '234.4', 'measurand': 'Voltage', 'unit': 'V', 'phase': 'L1'}, {'value': '0.0', 'measurand': 'Current.Export', 'unit': 'A', 'phase': 'L1'}, {'value': '236.5', 'measurand': 'Voltage', 'unit': 'V', 'phase': 'L2'}, {'value': '239.2', 'measurand': 'Current.Export', 'unit': 'A', 'phase': 'L2'}, {'value': '2392.6', 'measurand': 'Voltage', 'unit': 'V', 'phase': 'L3'}, {'value': '0.0', 'measurand': 'Current.Export', 'unit': 'A', 'phase': 'L1'}, {'value': '17', 'measurand': 'Temperature', 'unit': 'Celsius'}, {'value': '0', 'measurand': 'Power.Active.Export', 'unit': 'W'}, {'value': '0', 'measurand': 'Energy.Active.Export.Register', 'unit': 'Wh'}]}]

    mess = meter[0].get("sampled_value")

    l1v = mess[0]
    l1v_value = l1v["value"]
    l1v_measurand = l1v["measurand"]
    l1v_unit = l1v["unit"]
    l1v_phase = l1v["phase"]

    l1a = mess[1]
    l1a_value = l1a["value"]
    l1a_measurand = l1a["measurand"]
    l1a_unit = l1a["unit"]
    l1a_phase = l1a["phase"]

    l2v = mess[2]
    l2v_value = l2v["value"]
    l2v_measurand = l2v["measurand"]
    l2v_unit = l2v["unit"]
    l2v_phase = l2v["phase"]

    l2a = mess[3]
    l2a_value = l2a["value"]
    l2a_measurand = l2a["measurand"]
    l2a_unit = l2a["unit"]
    l2a_phase = l2a["phase"]

    l3v = mess[4]
    l3v_value = l3v["value"]
    l3v_measurand = l3v["measurand"]
    l3v_unit = l3v["unit"]
    l3v_phase = l3v["phase"]

    l3a = mess[5]
    l3a_value = l3a["value"]
    l3a_measurand = l3a["measurand"]
    l3a_unit = l3a["unit"]
    l3a_phase = l3a["phase"]

    temp = mess[6]
    temp_value = temp["value"]
    temp_measurand = temp["measurand"]
    temp_unit = temp["unit"]

    watts = mess[7]
    watts_value = watts["value"]
    watts_measurand = watts["measurand"]
    watts_unit = watts["unit"]

    watts_perhour = mess[8]
    watts_perhour_value = watts_perhour["value"]
    watts_perhour_measurand = watts_perhour["measurand"]
    watts_perhour_unit = watts_perhour["unit"]

    resp = {
        "l1v": l1v,
        "l1v_value": l1v_value,
        "l1v_measurand": l1v_measurand,
        "l1v_unit": l1v_unit,
        "l1v_phase": l1v_phase,

        "l2v": l2v,
        "l2v_value": l2v_value,
        "l2v_measurand": l2v_measurand,
        "l2v_unit": l2v_unit,
        "l2v_phase": l2v_phase,

        "l3v": l3v,
        "l3v_value": l3v_value,
        "l3v_measurand": l3v_measurand,
        "l3v_unit": l3v_unit,
        "l3v_phase": l3v_phase,

        "l1a": l1a,
        "l1a_value": l1a_value,
        "l1a_measurand": l1a_measurand,
        "l1a_unit": l1a_unit,
        "l1a_phase": l1a_phase,

        "l2a": l2a,
        "l2a_value": l2a_value,
        "l2a_measurand": l2a_measurand,
        "l2a_unit": l2a_unit,
        "l2a_phase": l2a_phase,

        "l3a": l3a,
        "l3a_value": l3a_value,
        "l3a_measurand": l3a_measurand,
        "l3a_unit": l3a_unit,
        "l3a_phase": l3a_phase,

        "temp": temp,
        "temp_value": temp_value,
        "temp_measurand": temp_measurand,
        "temp_unit": temp_unit,

        "watts": watts,
        "watts_value": watts_value,
        "watts_measurand": watts_measurand,
        "watts_unit": watts_unit,

        "watts_perhour": watts_perhour,
        "watts_perhour_value": watts_perhour_value,
        "watts_perhour_measurand": watts_perhour_measurand,
        "watts_perhour_unit": watts_perhour_unit,
    }

    return resp
