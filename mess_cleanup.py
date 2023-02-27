# def cleaner(mess):
mess = [2, "3f20cecf-f3f0-408a-abc8-449debc1e9da", "MeterValues", {"connectorId": 1, "meterValue": [
    {"timestamp": "2022-11-04T14:59:24",
     "sampledValue": [{"value": "236.2", "measurand": "Voltage", "unit": "V", "phase": "L1"},
                      {"value": "0.0", "measurand": "Current.Export", "unit": "A", "phase": "L1"},
                      {"value": "237.2", "measurand": "Voltage", "unit": "V", "phase": "L2"},
                      {"value": "238.4", "measurand": "Current.Export", "unit": "A", "phase": "L2"},
                      {"value": "2384.5", "measurand": "Voltage", "unit": "V", "phase": "L3"},
                      {"value": "0.0", "measurand": "Current.Export", "unit": "A", "phase": "L1"},
                      {"value": "22", "measurand": "Temperature", "unit": "Celsius"},
                      {"value": "0", "measurand": "Power.Active.Export", "unit": "W"},
                      {"value": "0", "measurand": "Energy.Active.Export.Register", "unit": "Wh"}
                      ]
     }]}]

miss = [{'value': '232.8', 'measurand': 'Voltage', 'unit': 'V', 'phase': 'L1'},
        {'value': '0.0', 'measurand': 'Current.Export', 'unit': 'A', 'phase': 'L1'},
        {'value': '236.8', 'measurand': 'Voltage', 'unit': 'V', 'phase': 'L2'},
        {'value': '239.6', 'measurand': 'Current.Export', 'unit': 'A', 'phase': 'L2'},
        {'value': '2396.6', 'measurand': 'Voltage', 'unit': 'V', 'phase': 'L3'},
        {'value': '0.0', 'measurand': 'Current.Export', 'unit': 'A', 'phase': 'L1'},
        {'value': '18', 'measurand': 'Temperature', 'unit': 'Celsius'},
        {'value': '0', 'measurand': 'Power.Active.Export', 'unit': 'W'},
        {'value': '1', 'measurand': 'Energy.Active.Export.Register', 'unit': 'Wh'}]

meter_values = mess[3]

meter_val_connector_id = meter_values["connectorId"]

meter_conn_id = meter_val_connector_id

meter_val_meter_values = meter_values["meterValue"][0]

meter_val_meter_values_timestamp = meter_val_meter_values["timestamp"]

meter_stamp = meter_val_meter_values_timestamp

meter_val_meter_values_sampledValue = meter_val_meter_values["sampledValue"]

meter_val_meter_values_sampledValue_phase_one_voltage = meter_val_meter_values_sampledValue[0]
meter_val_meter_values_sampledValue_phase_one_voltage_value = meter_val_meter_values_sampledValue_phase_one_voltage[
    "value"]
meter_val_meter_values_sampledValue_phase_one_voltage_measurand = \
    meter_val_meter_values_sampledValue_phase_one_voltage[
        "measurand"]
meter_val_meter_values_sampledValue_phase_one_voltage_unit = meter_val_meter_values_sampledValue_phase_one_voltage[
    "unit"]
meter_val_meter_values_sampledValue_phase_one_voltage_phase = meter_val_meter_values_sampledValue_phase_one_voltage[
    "phase"]

l1v_value = meter_val_meter_values_sampledValue_phase_one_voltage_value
l1v_measurand = meter_val_meter_values_sampledValue_phase_one_voltage_measurand
l1v_unit = meter_val_meter_values_sampledValue_phase_one_voltage_unit
l1v_phase = meter_val_meter_values_sampledValue_phase_one_voltage_phase

meter_val_meter_values_sampledValue_phase_one_ampere = meter_val_meter_values_sampledValue[1]
meter_val_meter_values_sampledValue_phase_one_ampere_value = meter_val_meter_values_sampledValue_phase_one_ampere[
    "value"]
meter_val_meter_values_sampledValue_phase_one_ampere_measurand = \
    meter_val_meter_values_sampledValue_phase_one_ampere[
        "measurand"]
meter_val_meter_values_sampledValue_phase_one_ampere_unit = meter_val_meter_values_sampledValue_phase_one_ampere[
    "unit"]
meter_val_meter_values_sampledValue_phase_one_ampere_phase = meter_val_meter_values_sampledValue_phase_one_ampere[
    "phase"]

l1a_value = meter_val_meter_values_sampledValue_phase_one_ampere_value
l1a_measurand = meter_val_meter_values_sampledValue_phase_one_ampere_measurand
l1a_unit = meter_val_meter_values_sampledValue_phase_one_ampere_unit
l1a_phase = meter_val_meter_values_sampledValue_phase_one_ampere_phase

meter_val_meter_values_sampledValue_phase_two_voltage = meter_val_meter_values_sampledValue[2]
meter_val_meter_values_sampledValue_phase_two_voltage_value = meter_val_meter_values_sampledValue_phase_two_voltage[
    "value"]
meter_val_meter_values_sampledValue_phase_two_voltage_measurand = \
    meter_val_meter_values_sampledValue_phase_two_voltage[
        "measurand"]
meter_val_meter_values_sampledValue_phase_two_voltage_unit = meter_val_meter_values_sampledValue_phase_two_voltage[
    "unit"]
meter_val_meter_values_sampledValue_phase_two_voltage_phase = meter_val_meter_values_sampledValue_phase_two_voltage[
    "phase"]

l2v_value = meter_val_meter_values_sampledValue_phase_two_voltage_value
l2v_measurand = meter_val_meter_values_sampledValue_phase_two_voltage_measurand
l2v_unit = meter_val_meter_values_sampledValue_phase_two_voltage_unit
l2v_phase = meter_val_meter_values_sampledValue_phase_two_voltage_phase

meter_val_meter_values_sampledValue_phase_two_ampere = meter_val_meter_values_sampledValue[3]
meter_val_meter_values_sampledValue_phase_two_ampere_value = meter_val_meter_values_sampledValue_phase_two_ampere[
    "value"]
meter_val_meter_values_sampledValue_phase_two_ampere_measurand = \
    meter_val_meter_values_sampledValue_phase_two_ampere[
        "measurand"]
meter_val_meter_values_sampledValue_phase_two_ampere_unit = meter_val_meter_values_sampledValue_phase_two_ampere[
    "unit"]
meter_val_meter_values_sampledValue_phase_two_ampere_phase = meter_val_meter_values_sampledValue_phase_two_ampere[
    "phase"]

l2a_value = meter_val_meter_values_sampledValue_phase_two_ampere_value
l2a_measurand = meter_val_meter_values_sampledValue_phase_two_ampere_measurand
l2a_unit = meter_val_meter_values_sampledValue_phase_two_ampere_unit
l2a_phase = meter_val_meter_values_sampledValue_phase_two_ampere_phase

meter_val_meter_values_sampledValue_phase_three_voltage = meter_val_meter_values_sampledValue[4]
meter_val_meter_values_sampledValue_phase_three_voltage_value = \
    meter_val_meter_values_sampledValue_phase_three_voltage[
        "value"]
meter_val_meter_values_sampledValue_phase_three_voltage_measurand = \
    meter_val_meter_values_sampledValue_phase_three_voltage["measurand"]
meter_val_meter_values_sampledValue_phase_three_voltage_unit = \
    meter_val_meter_values_sampledValue_phase_three_voltage[
        "unit"]
meter_val_meter_values_sampledValue_phase_three_voltage_phase = \
    meter_val_meter_values_sampledValue_phase_three_voltage[
        "phase"]

l3v_value = meter_val_meter_values_sampledValue_phase_three_voltage_value
l3v_measurand = meter_val_meter_values_sampledValue_phase_three_voltage_measurand
l3v_unit = meter_val_meter_values_sampledValue_phase_three_voltage_unit
l3v_phase = meter_val_meter_values_sampledValue_phase_three_voltage_phase

meter_val_meter_values_sampledValue_phase_three_ampere = meter_val_meter_values_sampledValue[5]
meter_val_meter_values_sampledValue_phase_three_ampere_value = \
    meter_val_meter_values_sampledValue_phase_three_ampere[
        "value"]
meter_val_meter_values_sampledValue_phase_three_ampere_measurand = \
    meter_val_meter_values_sampledValue_phase_three_ampere["measurand"]
meter_val_meter_values_sampledValue_phase_three_ampere_unit = \
    meter_val_meter_values_sampledValue_phase_three_ampere[
        "unit"]
meter_val_meter_values_sampledValue_phase_three_ampere_phase = \
    meter_val_meter_values_sampledValue_phase_three_ampere[
        "phase"]

l3a_value = meter_val_meter_values_sampledValue_phase_three_ampere_value
l3a_measurand = meter_val_meter_values_sampledValue_phase_three_ampere_measurand
l3a_unit = meter_val_meter_values_sampledValue_phase_three_ampere_unit
l3a_phase = meter_val_meter_values_sampledValue_phase_three_ampere_phase

meter_val_meter_values_sampledValue_temperature = meter_val_meter_values_sampledValue[6]
meter_val_meter_values_sampledValue_temperature_value = meter_val_meter_values_sampledValue_temperature["value"]
meter_val_meter_values_sampledValue_temperature_measurand = meter_val_meter_values_sampledValue_temperature[
    "measurand"]
meter_val_meter_values_sampledValue_temperature_unit = meter_val_meter_values_sampledValue_temperature["unit"]

temp_value = meter_val_meter_values_sampledValue_temperature_value
temp_measurand = meter_val_meter_values_sampledValue_temperature_measurand
temp_unit = meter_val_meter_values_sampledValue_temperature_unit

meter_val_meter_values_sampledValue_watts = meter_val_meter_values_sampledValue[7]
meter_val_meter_values_sampledValue_watts_value = meter_val_meter_values_sampledValue_watts["value"]
meter_val_meter_values_sampledValue_watts_measurand = meter_val_meter_values_sampledValue_watts["measurand"]
meter_val_meter_values_sampledValue_watts_unit = meter_val_meter_values_sampledValue_watts["unit"]

watts_value = meter_val_meter_values_sampledValue_watts_value
watts_measurand = meter_val_meter_values_sampledValue_watts_measurand
watts_unit = meter_val_meter_values_sampledValue_watts_unit

meter_val_meter_values_sampledValue_watts_perhour = meter_val_meter_values_sampledValue[8]
meter_val_meter_values_sampledValue_watts_perhour_value = meter_val_meter_values_sampledValue_watts_perhour["value"]
meter_val_meter_values_sampledValue_watts_perhour_measurand = meter_val_meter_values_sampledValue_watts_perhour[
    "measurand"]
meter_val_meter_values_sampledValue_watts_perhour_unit = meter_val_meter_values_sampledValue_watts_perhour["unit"]

watts_perhour_value = meter_val_meter_values_sampledValue_watts_perhour_value
watts_perhour_measurand = meter_val_meter_values_sampledValue_watts_perhour_measurand
watts_perhour_unit = meter_val_meter_values_sampledValue_watts_perhour_unit

"""return meter_conn_id, meter_stamp, l1v_value, l1v_measurand, l1v_unit, l1v_phase, l2v_value, l2v_measurand, l2v_unit, l2v_phase, \
    l3v_value, l3v_measurand, l3v_unit, l3v_phase, l1a_value, l1a_measurand, l1a_unit, l1a_phase, l2a_value, l2a_measurand, l2a_unit, l2a_phase, \
    l3a_value, l3a_measurand, l3a_unit, l3a_phase, temp_value, temp_measurand, temp_unit, watts_value, watts_measurand, watts_unit, \
    watts_perhour_value, watts_perhour_measurand, watts_perhour_unit"""
print()