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

import bluetoothManager from '@ohos.bluetoothManager';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function btManagerPairTest() {
describe('btManagerPairTest', function() {
    function sleep(delay) {
        return new Promise(resovle => setTimeout(resovle, delay))
    }

    async function tryToEnableBt() {
        let sta = bluetoothManager.getState();
        switch (sta) {
            case 0:
                bluetoothManager.enableBluetooth();
                await sleep(10000);
                let sta1 = bluetoothManager.getState();
                console.info('[bluetooth_js] bt turn off:' + JSON.stringify(sta1));
                break;
            case 1:
                console.info('[bluetooth_js] bt turning on:' + JSON.stringify(sta));
                await sleep(3000);
                break;
            case 2:
                console.info('[bluetooth_js] bt turn on:' + JSON.stringify(sta));
                break;
            case 3:
                bluetoothManager.enableBluetooth();
                await sleep(10000);
                let sta2 = bluetoothManager.getState();
                console.info('[bluetooth_js] bt turning off:' + JSON.stringify(sta2));
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
    }
    beforeAll(function () {
        console.info('beforeAll called')
    })
    beforeEach(async function (done) {
        console.info('beforeEach called')
        await tryToEnableBt()
        done()
    })
    afterEach(function () {
        console.info('afterEach called')
    })
    afterAll(function () {
        console.info('afterAll called')
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_PAIR_0100
     * @tc.name Test pinRequired and setDevicePairing true
     * @tc.desc Test pinRequired off api
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_PAIR_0100', 0, async function (done) {
        function onReceiveEvent(data) {
            console.info('pin required = '+ JSON.stringify(data));
        }
        try {
            bluetoothManager.on('pinRequired', onReceiveEvent);
            bluetoothManager.off('pinRequired', onReceiveEvent);
        } catch (error) {
            console.error(`[bluetooth_js]PairDevice error, code is ${error.code}, 
            message is ${error.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_PAIR_0200
     * @tc.name Test setDevicePinCode callback
     * @tc.desc Test setDevicePinCode api10
     * @tc.type Function
     * @tc.level Level 3
     */
     it('SUB_COMMUNICATION_BTMANAGER_PAIR_0200', 0, async function (done) {
        try {
            bluetoothManager.setDevicePinCode('11:22:33:44:55:66', '12345', (err, data) => {
                console.info('setDevicePinCode callback,device name err:' + JSON.stringify(err) + ',device name:' + JSON.stringify(data));
            });
        } catch (err) {
            console.error("setDevicePinCode callback errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_PAIR_0300
     * @tc.name Test setDevicePinCode promise
     * @tc.desc Test setDevicePinCode api10
     * @tc.type Function
     * @tc.level Level 3
     */
     it('SUB_COMMUNICATION_BTMANAGER_PAIR_0300', 0, async function (done) {
        try {
            bluetoothManager.setDevicePinCode('11:22:33:44:55:66', '12345').then(() => {
                console.info('setDevicePinCode promise');
            }, error => {
                console.info('setDevicePinCode promise: errCode:' + error.code + ',errMessage' + error.message);
            })
        
        } catch (err) {
            console.error("setDevicePinCode promise errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_PAIR_0400
     * @tc.name Test BluetoothTransport
     * @tc.desc Test BluetoothTransport api10
     * @tc.type Function
     * @tc.level Level 3
     */
     it('SUB_COMMUNICATION_BTMANAGER_PAIR_0400', 0, async function (done) {
        try {
            let TRANSPORT_BR_EDR = bluetoothManager.BluetoothTransport.TRANSPORT_BR_EDR;
            console.info("[bluetooth_js]TRANSPORT_BR_EDR : " + JSON.stringify(TRANSPORT_BR_EDR));
            expect(true).assertTrue(TRANSPORT_BR_EDR == 0);

            let TRANSPORT_LE = bluetoothManager.BluetoothTransport.TRANSPORT_LE;
            console.info("[bluetooth_js]TRANSPORT_LE : " + JSON.stringify(TRANSPORT_LE));
            expect(true).assertTrue(TRANSPORT_LE == 1);
        } catch (err) {
            console.error("BluetoothTransport errCode:" + err.code + ",errMessage:" + err.message);
        }
        done();
    })
})
}