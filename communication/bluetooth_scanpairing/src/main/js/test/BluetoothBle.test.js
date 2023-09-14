/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bluetooth from '@ohos.bluetooth.ble';
import btAccess from '@ohos.bluetooth.access';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

export default function bluetoothBleTest() {
describe('bluetoothBleTest', function() {
    function sleep(delay) {
        return new Promise(resovle => setTimeout(resovle, delay))
    }

    async function openPhone() {
        try{
            let drivers = Driver.create();
            console.info('[bluetooth_js] bt driver create:'+ drivers);            
            await drivers.delayMs(1000);
            await drivers.wakeUpDisplay();
            await drivers.delayMs(5000);
            await drivers.swipe(1500, 1000, 1500, 100);
            await drivers.delayMs(10000);
        } catch (error) {
            console.info('[bluetooth_js] driver error info:'+ error);
        }
    }

    async function clickTheWindow() {
        try{
            let driver = Driver.create();
            console.info('[bluetooth_js] bt driver create:'+ driver);            
            await driver.delayMs(1000);
            await driver.click(950, 2550);
            await driver.delayMs(5000);
            await driver.click(950, 2550);
            await driver.delayMs(3000);
        } catch (error) {
            console.info('[bluetooth_js] driver error info:'+ error);
        }
    }

    async function tryToEnableBt() {
        let sta = btAccess.getState();
        switch(sta){
            case 0:
                btAccess.enableBluetooth();
                await clickTheWindow();
                await sleep(10000);
                let sta1 = btAccess.getState();
                console.info('[bluetooth_js] bt turn off:'+ JSON.stringify(sta1));
                break;
            case 1:
                console.info('[bluetooth_js] bt turning on:'+ JSON.stringify(sta));
                await sleep(3000);
                break;
            case 2:
                console.info('[bluetooth_js] bt turn on:'+ JSON.stringify(sta));
                break;
            case 3:
                btAccess.enableBluetooth();
                await clickTheWindow();
                await sleep(10000);
                let sta2 = btAccess.getState();
                console.info('[bluetooth_js] bt turning off:'+ JSON.stringify(sta2));
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
    }
    beforeAll(async function (done) {
        console.info('beforeAll called')
        await openPhone();
        done();
    })
    beforeEach(async function(done) {
        console.info('beforeEach called')
        await tryToEnableBt()
        done();
    })
    afterEach(function () {
        console.info('afterEach called')
    })
    afterAll(function () {
        console.info('afterAll called')
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0100
     * @tc.name test startBLEScan
     * @tc.desc Test startBLEScan api10
     * @tc.type Function
     * @tc.level Level 0
     */
     it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0100', 0, async function (done) {
        function onReceiveEvent(data) {
            console.info('BLE scan device find result = '+ JSON.stringify(data));
        }
        try {
            bluetooth.on("BLEDeviceFind", onReceiveEvent);
            bluetooth.startBLEScan(
                [{
                    deviceId:"00:11:22:33:44:55",
                    name:"test",
                    serviceUuid:"00001888-0000-1000-8000-00805f9b34fb"
                }],
                {
                    interval: 500,
                    dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_POWER,
                    matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
                }
            );
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        bluetooth.off("BLEDeviceFind", onReceiveEvent);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0200
     * @tc.name test stopBLEScan
     * @tc.desc Test stopBLEScan api10
     * @tc.type Function
     * @tc.level Level 0
     */
     it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0200', 0, async function (done) {
        try {
            bluetooth.stopBLEScan();
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0300
     * @tc.name test on-BLEDeviceFind
     * @tc.desc Test on-BLEDeviceFind api10
     * @tc.type Function
     * @tc.level Level 0
     */
     it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0300', 0, async function (done) {
        function onReceiveEvent(data) {
            console.info('bluetooth device find = '+ JSON.stringify(data));
        }
        try {
            bluetooth.on('BLEDeviceFind', onReceiveEvent);
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        bluetooth.off('BLEDeviceFind', onReceiveEvent);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0400
     * @tc.name test off-BLEDeviceFind
     * @tc.desc Test off-BLEDeviceFind api10
     * @tc.type Function
     * @tc.level Level 0
     */
     it('SUB_COMMUNICATION_BLUETOOTHBLE_BLESCAN_0400', 0, async function (done) {
        function onReceiveEvent(data) {
            console.info('bluetooth device find = '+ JSON.stringify(data));
        }
        bluetooth.on('BLEDeviceFind', onReceiveEvent);
        try {
            bluetooth.off('BLEDeviceFind', onReceiveEvent);
        } catch (err) {
            console.error("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })
})
}

