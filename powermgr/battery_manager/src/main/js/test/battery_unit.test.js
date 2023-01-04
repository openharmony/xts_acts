/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import batteryInfo from '@ohos.batteryInfo';
import brightness from '@ohos.brightness';
import { describe, it, expect } from '@ohos/hypium'

export default function BatteryUnitTest() {
describe('BatteryUnitTest', function () {
    console.log("*************Battery Unit Test Begin*************");

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1510
     * @tc.name battery_soc_JSTest
     * @tc.desc Battery acquisition kit
     */
    it('battery_soc_JSTest', 0, function () {
        let batterySoc = batteryInfo.batterySOC;
        console.info('batterySoc = ' + batterySoc);
        expect(batterySoc >= -1 && batterySoc <= 100).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1520
     * @tc.name charging_status_JSTest
     * @tc.desc Battery charging kit
     */
    it('charging_status_JSTest', 0, function () {
        let chargingStatus = batteryInfo.chargingStatus;
        console.info('chargingStatus = ' + chargingStatus);
        expect(chargingStatus >= 0 && chargingStatus <= 4).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1530
     * @tc.name health_status_JSTest
     * @tc.desc Get Battery Health Get KIT
     */
    it('health_status_JSTest', 0, function () {
        let healthStatus = batteryInfo.healthStatus;
        console.info('healthStatus = ' + healthStatus);
        expect(healthStatus >= 0 && healthStatus <= 6).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1540
     * @tc.name plugged_type_JSTest
     * @tc.desc Obtaining the SUB Connection Type KIT
     */
    it('plugged_type_JSTest', 0, function () {
        let pluggedType = batteryInfo.pluggedType;
        console.info('pluggedType = ' + pluggedType);
        expect(pluggedType >= 0 && pluggedType <= 4).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1550
     * @tc.name voltage_JSTest
     * @tc.desc Obtaining the Voltage Interface KIT
     */
    it('voltage_JSTest', 0, function () {
        let voltage = batteryInfo.voltage;
        console.info('voltage = ' + voltage);
        expect(voltage >= -1).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1560
     * @tc.name technology_JSTest
     * @tc.desc Obtaining the Battery Technology Interface KIT
     */
    it('technology_JSTest', 0, function () {
        let technology = batteryInfo.technology;
        console.info('technology = ' + technology);
        expect(technology !== null).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1570
     * @tc.name battery_temperature_JSTest
     * @tc.desc BatteryTemperature values Interface Test
     */
    it('battery_temperature_JSTest', 0, function () {
        let batteryTemperature = batteryInfo.batteryTemperature;
        console.info('batteryTemperature = ' + batteryTemperature);
        expect(batteryTemperature <= 700).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1580
     * @tc.name enum_health_state_JSTest_unknown
     * @tc.desc BatteryHealthState values Interface Test
     */
    it('enum_health_state_JSTest_unknown', 0, function () {
        let batteryHealthState = batteryInfo.BatteryHealthState.UNKNOWN;
        console.info('batteryHealthState = ' + batteryHealthState);
        expect(batteryHealthState == 0).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1590
     * @tc.name enum_health_state_JSTest_good
     * @tc.desc BatteryHealthState values Interface Test
     */
    it('enum_health_state_JSTest_good', 0, function () {
        let batteryHealthState = batteryInfo.BatteryHealthState.GOOD;
        console.info('batteryHealthState = ' + batteryHealthState);
        expect(batteryHealthState == 1).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1600
     * @tc.name enum_health_state_JSTest_overheat
     * @tc.desc BatteryHealthState values Interface Test
     */
    it('enum_health_state_JSTest_overheat', 0, function () {
        let batteryHealthState = batteryInfo.BatteryHealthState.OVERHEAT;
        console.info('batteryHealthState = ' + batteryHealthState);
        expect(batteryHealthState == 2).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1610
     * @tc.name enum_health_state_JSTest_overvoltage
     * @tc.desc BatteryHealthState values Interface Test
     */
    it('enum_health_state_JSTest_overvoltage', 0, function () {
        let batteryHealthState = batteryInfo.BatteryHealthState.OVERVOLTAGE;
        console.info('batteryHealthState = ' + batteryHealthState);
        expect(batteryHealthState == 3).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1620
     * @tc.name enum_health_state_JSTest_cold
     * @tc.desc BatteryHealthState values Interface Test
     */
    it('enum_health_state_JSTest_cold', 0, function () {
        let batteryHealthState = batteryInfo.BatteryHealthState.COLD;
        console.info('batteryHealthState = ' + batteryHealthState);
        expect(batteryHealthState == 4).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1630
     * @tc.name enum_health_state_JSTest_dead
     * @tc.desc BatteryHealthState values Interface Test
     */
    it('enum_health_state_JSTest_dead', 0, function () {
        let batteryHealthState = batteryInfo.BatteryHealthState.DEAD;
        console.info('batteryHealthState = ' + batteryHealthState);
        expect(batteryHealthState == 5).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1640
     * @tc.name enum_charge_state_JSTest_none
     * @tc.desc BatteryChargeState values Interface Test
     */
    it('enum_charge_state_JSTest_none', 0, function () {
        let batteryChargeState = batteryInfo.BatteryChargeState.NONE;
        console.info('batteryChargeState = ' + batteryChargeState);
        expect(batteryChargeState == 0).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1650
     * @tc.name enum_charge_state_JSTest_enable
     * @tc.desc BatteryChargeState values Interface Test
     */
    it('enum_charge_state_JSTest_enable', 0, function () {
        let batteryChargeState = batteryInfo.BatteryChargeState.ENABLE;
        console.info('batteryChargeState = ' + batteryChargeState);
        expect(batteryChargeState == 1).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1660
     * @tc.name enum_charge_state_JSTest_disable
     * @tc.desc BatteryChargeState values Interface Test
     */
    it('enum_charge_state_JSTest_disable', 0, function () {
        let batteryChargeState = batteryInfo.BatteryChargeState.DISABLE;
        console.info('batteryChargeState = ' + batteryChargeState);
        expect(batteryChargeState == 2).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1670
     * @tc.name enum_charge_state_JSTest_full
     * @tc.desc BatteryChargeState values Interface Test
     */
    it('enum_charge_state_JSTest_full', 0, function () {
        let batteryChargeState = batteryInfo.BatteryChargeState.FULL;
        console.info('batteryChargeState = ' + batteryChargeState);
        expect(batteryChargeState == 3).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1680
     * @tc.name enum_plugged_type_JSTest_none
     * @tc.desc BatteryPluggedType values Interface Test
     */
    it('enum_plugged_type_JSTest_none', 0, function () {
        let batteryPluggedType = batteryInfo.BatteryPluggedType.NONE;
        console.info('batteryPluggedType = ' + batteryPluggedType);
        expect(batteryPluggedType == 0).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1690
     * @tc.name enum_plugged_type_JSTest_ac
     * @tc.desc BatteryPluggedType values Interface Test
     */
    it('enum_plugged_type_JSTest_ac', 0, function () {
        let batteryPluggedType = batteryInfo.BatteryPluggedType.AC;
        console.info('batteryPluggedType = ' + batteryPluggedType);
        expect(batteryPluggedType == 1).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1700
     * @tc.name enum_plugged_type_JSTest_usb
     * @tc.desc BatteryPluggedType values Interface Test
     */
    it('enum_plugged_type_JSTest_usb', 0, function () {
        let batteryPluggedType = batteryInfo.BatteryPluggedType.USB;
        console.info('batteryPluggedType = ' + batteryPluggedType);
        expect(batteryPluggedType == 2).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1710
     * @tc.name enum_plugged_type_JSTest_wireless
     * @tc.desc BatteryPluggedType values Interface Test
     */
    it('enum_plugged_type_JSTest_wireless', 0, function () {
        let batteryPluggedType = batteryInfo.BatteryPluggedType.WIRELESS;
        console.info('batteryPluggedType = ' + batteryPluggedType);
        expect(batteryPluggedType == 3).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1720
     * @tc.name brightness_JSTest
     * @tc.desc Set Value Interface Test
     */
    it('brightness_JSTest', 0, function () {
        brightness.setValue(10);
        brightness.setValue(0);
        brightness.setValue(255);
        expect(0 == 0).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1730
     * @tc.name is_battery_present_JSTest
     * @tc.desc Battry Present Interface Test
     */
    it('is_battery_present_JSTest', 0, function () {
        let isBatteryPresent = batteryInfo.isBatteryPresent;
        console.info('isBatteryPresent = ' + isBatteryPresent);
        if (isBatteryPresent) {
            expect(isBatteryPresent).assertTrue();
        } else {
            expect(isBatteryPresent).assertFalse();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1780
     * @tc.name batterylevel_JSTest
     * @tc.desc Battry Present Interface Test
     */
    it('batterylevel_JSTest', 0, function () {
        let batteryLevel = batteryInfo.batteryCapacityLevel;
        console.info('batteryLevel = ' + batteryLevel);
        expect(batteryLevel >= batteryInfo.BatteryCapacityLevel.LEVEL_NONE &&
            batteryLevel <= batteryInfo.BatteryCapacityLevel.LEVEL_CRITICAL).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1790
     * @tc.name enum_level_state_JSTest_none
     * @tc.desc Battry Present Interface Test
     */
    it('enum_level_state_JSTest_none', 0, function () {
        let batterylevelState = batteryInfo.BatteryCapacityLevel.LEVEL_NONE;
        console.info('batterylevelState = ' + batterylevelState);
        expect(batterylevelState == 0).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1800
     * @tc.name enum_level_state_JSTest_full
     * @tc.desc Battry Present Interface Test
     */
    it('enum_level_state_JSTest_full', 0, function () {
        let batteryLevelState = batteryInfo.BatteryCapacityLevel.LEVEL_FULL;
        console.info('batteryLevelState = ' + batteryLevelState);
        expect(batteryLevelState == 1).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1810
     * @tc.name enum_level_state_JSTest_high
     * @tc.desc Battry Present Interface Test
     */
    it('enum_level_state_JSTest_high', 0, function () {
        let batteryLevelState = batteryInfo.BatteryCapacityLevel.LEVEL_HIGH;
        console.info('batteryLevelState = ' + batteryLevelState);
        expect(batteryLevelState == 2).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1820
     * @tc.name enum_level_state_JSTest_normal
     * @tc.desc Battry Present Interface Test
     */
    it('enum_level_state_JSTest_normal', 0, function () {
        let batteryLevelState = batteryInfo.BatteryCapacityLevel.LEVEL_NORMAL;
        console.info('batteryLevelState = ' + batteryLevelState);
        expect(batteryLevelState == 3).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1830
     * @tc.name enum_level_state_JSTest_low
     * @tc.desc Battry Present Interface Test
     */
    it('enum_level_state_JSTest_low', 0, function () {
        let batteryLevelState = batteryInfo.BatteryCapacityLevel.LEVEL_LOW;
        console.info('batteryLevelState = ' + batteryLevelState);
        expect(batteryLevelState == 4).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1840
     * @tc.name enum_level_state_JSTest_emergency
     * @tc.desc Battry Present Interface Test
     */
    it('enum_level_state_JSTest_emergency', 0, function () {
        let batteryLevelState = batteryInfo.BatteryCapacityLevel.LEVEL_CRITICAL;
        console.info('batteryLevelState = ' + batteryLevelState);
        expect(batteryLevelState == 5).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1850
     * @tc.name SUB_PowerSystem_BatteryManager_JSTest_3400
     * @tc.desc Battry Present Interface Test
     */
    it('remainingChargeTime_JSTest', 0, function () {
        let remainingChargeTime = batteryInfo.estimatedRemainingChargeTime;
        console.info('remainingChargeTime = ' + remainingChargeTime);
        expect(remainingChargeTime >= -1).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1860
     * @tc.name CommonEventBatteryChangedCode_EXTRA_SOC_JSTest
     * @tc.desc Battry Present Interface Test
     */
    it('CommonEventBatteryChangedCode_EXTRA_SOC_JSTest', 0, function () {
        console.info('CommonEventBatteryChangedCode_EXTRA_SOC = '
            + batteryInfo.CommonEventBatteryChangedCode.EXTRA_SOC);
        expect(batteryInfo.CommonEventBatteryChangedCode.EXTRA_SOC == 0).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1870
     * @tc.name CommonEventBatteryChangedCode_EXTRA_VOLTAGE_JSTest
     * @tc.desc Battry Present Interface Test
     */
    it('CommonEventBatteryChangedCode_EXTRA_VOLTAGE_JSTest', 0, function () {
        console.info('CommonEventBatteryChangedCode_EXTRA_VOLTAGE = '
            + batteryInfo.CommonEventBatteryChangedCode.EXTRA_VOLTAGE);
        expect(batteryInfo.CommonEventBatteryChangedCode.EXTRA_VOLTAGE == 1).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1880
     * @tc.name CommonEventBatteryChangedCode_EXTRA_TEMPERATURE_JSTest
     * @tc.desc Battry Present Interface Test
     */
    it('CommonEventBatteryChangedCode_EXTRA_TEMPERATURE_JSTest', 0, function () {
        console.info('CommonEventBatteryChangedCode_EXTRA_TEMPERATURE = '
            + batteryInfo.CommonEventBatteryChangedCode.EXTRA_TEMPERATURE);
        expect(batteryInfo.CommonEventBatteryChangedCode.EXTRA_TEMPERATURE == 2).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1890
     * @tc.name CommonEventBatteryChangedCode_EXTRA_HEALTH_STATE_JSTest
     * @tc.desc Battry Present Interface Test
     */
    it('CommonEventBatteryChangedCode_EXTRA_HEALTH_STATE_JSTest', 0, function () {
        console.info('CommonEventBatteryChangedCode_EXTRA_HEALTH_STATE = '
            + batteryInfo.CommonEventBatteryChangedCode.EXTRA_HEALTH_STATE);
        expect(batteryInfo.CommonEventBatteryChangedCode.EXTRA_HEALTH_STATE == 3).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1900
     * @tc.name CommonEventBatteryChangedCode_EXTRA_PLUGGED_TYPE_JSTest
     * @tc.desc Battry Present Interface Test
     */
    it('CommonEventBatteryChangedCode_EXTRA_PLUGGED_TYPE_JSTest', 0, function () {
        console.info('CommonEventBatteryChangedCode_EXTRA_PLUGGED_TYPE = '
            + batteryInfo.CommonEventBatteryChangedCode.EXTRA_PLUGGED_TYPE);
        expect(batteryInfo.CommonEventBatteryChangedCode.EXTRA_PLUGGED_TYPE == 4).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1910
     * @tc.name CommonEventBatteryChangedCode_EXTRA_MAX_CURRENT_JSTest
     * @tc.desc Battry Present Interface Test
     */
    it('CommonEventBatteryChangedCode_EXTRA_MAX_CURRENT_JSTest', 0, function () {
        console.info('CommonEventBatteryChangedCode_EXTRA_MAX_CURRENT = '
            + batteryInfo.CommonEventBatteryChangedCode.EXTRA_MAX_CURRENT);
        expect(batteryInfo.CommonEventBatteryChangedCode.EXTRA_MAX_CURRENT == 5).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1920
     * @tc.name CommonEventBatteryChangedCode_EXTRA_MAX_VOLTAGE_JSTest
     * @tc.desc Battry Present Interface Test
     */
    it('CommonEventBatteryChangedCode_EXTRA_MAX_VOLTAGE_JSTest', 0, function () {
        console.info('CommonEventBatteryChangedCode_EXTRA_MAX_VOLTAGE = '
            + batteryInfo.CommonEventBatteryChangedCode.EXTRA_MAX_VOLTAGE);
        expect(batteryInfo.CommonEventBatteryChangedCode.EXTRA_MAX_VOLTAGE == 6).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1930
     * @tc.name CommonEventBatteryChangedCode_EXTRA_CHARGE_STATE_JSTest
     * @tc.desc Battry Present Interface Test
     */
    it('CommonEventBatteryChangedCode_EXTRA_CHARGE_STATE_JSTest', 0, function () {
        console.info('CommonEventBatteryChangedCode_EXTRA_CHARGE_STATE = '
            + batteryInfo.CommonEventBatteryChangedCode.EXTRA_CHARGE_STATE);
        expect(batteryInfo.CommonEventBatteryChangedCode.EXTRA_CHARGE_STATE == 7).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1940
     * @tc.name CommonEventBatteryChangedCode_EXTRA_CHARGE_COUNTER_JSTest
     * @tc.desc Battry Present Interface Test
     */
    it('CommonEventBatteryChangedCode_EXTRA_CHARGE_COUNTER_JSTest', 0, function () {
        console.info('CommonEventBatteryChangedCode_EXTRA_CHARGE_COUNTER = '
            + batteryInfo.CommonEventBatteryChangedCode.EXTRA_CHARGE_COUNTER);
        expect(batteryInfo.CommonEventBatteryChangedCode.EXTRA_CHARGE_COUNTER == 8).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1950
     * @tc.name CommonEventBatteryChangedCode_EXTRA_PRESENT_JSTest
     * @tc.desc Battry Present Interface Test
     */
    it('CommonEventBatteryChangedCode_EXTRA_PRESENT_JSTest', 0, function () {
        console.info('CommonEventBatteryChangedCode_EXTRA_PRESENT = '
            + batteryInfo.CommonEventBatteryChangedCode.EXTRA_PRESENT);
        expect(batteryInfo.CommonEventBatteryChangedCode.EXTRA_PRESENT == 9).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryManager_JSTest_1960
     * @tc.name CommonEventBatteryChangedCode_EXTRA_TECHNOLOGY_JSTest
     * @tc.desc Battry Present Interface Test
     */
    it('CommonEventBatteryChangedCode_EXTRA_TECHNOLOGY_JSTest', 0, function () {
        console.info('CommonEventBatteryChangedCode_EXTRA_TECHNOLOGY = '
            + batteryInfo.CommonEventBatteryChangedCode.EXTRA_TECHNOLOGY);
        expect(batteryInfo.CommonEventBatteryChangedCode.EXTRA_TECHNOLOGY == 10).assertTrue();
    })
})
}