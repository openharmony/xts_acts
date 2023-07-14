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

export default function btManagerSwitchTest() {
describe('btManagerSwitchTest', function() {
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
     * @tc.number SUB_COMMUNICATION_BTMANAGER_STATECHANGE_0100
     * @tc.name Test On pair StateChange
     * @tc.desc Test bondStateChange ON api
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BTMANAGER_STATECHANGE_0100', 0, async function (done) {
        function BondStateParam(data) {
            console.info("[bluetooth_js] bondStateChange on:" + JSON.stringify(data)
            + 'bondStateChange deviceId:' + data.deviceId + 'bondStateChange state:' + data.state);
        }
    try {
        bluetoothManager.on('bondStateChange', BondStateParam);
        let result = bluetoothManager.pairDevice("11:22:55:66:33:44");
        expect(bluetoothManager.BondState.BOND_STATE_INVALID == 0).assertTrue();
        expect(bluetoothManager.BondState.BOND_STATE_BONDING == 1).assertTrue();
        expect(bluetoothManager.BondState.BOND_STATE_BONDED == 2).assertTrue();
        bluetoothManager.off('bondStateChange', BondStateParam);
    } catch (error) {
        console.error(`[bluetooth_js]bondStateChange error, code is ${error.code}, 
        message is ${error.message}`);
    }
        done();     
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_STATECHANGE_0200
     * @tc.name test EnableBluetooth and getState
     * @tc.desc Test EnableBluetooth 
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BTMANAGER_STATECHANGE_0200', 0, async function (done) {
        function onReceiveEvent(data) {
            console.info('bluetoothManager state001 =' + JSON.stringify(data));
        }
    try {
        await bluetoothManager.on('stateChange', onReceiveEvent);
        let state = bluetoothManager.getState();
        console.info('[bluetooth_js] get bluetooth state001' + JSON.stringify(state));
        if (state != bluetoothManager.BluetoothState.STATE_ON) {
            let enable = bluetoothManager.enableBluetooth();
            await sleep(10000);
            console.info('[bluetooth_js] bluetoothManager enable001' + JSON.stringify(enable));
            expect(enable).assertTrue();
            let state1 = bluetoothManager.getState();
            console.info('[bluetooth_js] enable state001 ' + JSON.stringify(state1));
            expect(state1).assertEqual(bluetoothManager.BluetoothState.STATE_ON);
        }
    } catch (error) {
        console.error(`[bluetooth_js]enable StateChange error, code is ${error.code}, 
        message is ${error.message}`);
    }    
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_STATECHANGE_0300
     * @tc.name test disableBluetooth and getState
     * @tc.desc Test disableBluetooth api 
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BTMANAGER_STATECHANGE_0300', 0, async function (done) {
        function onReceiveEvent(data) {
            console.info('bluetoothManager state001 =' + JSON.stringify(data));
        }
    try {
        await bluetoothManager.on('stateChange', onReceiveEvent);
        await sleep(3000);
        await bluetoothManager.off('stateChange', onReceiveEvent);
        let state = bluetoothManager.getState();
        console.info('[bluetooth_js] get bluetooth state001' + JSON.stringify(state));
        if (state != bluetoothManager.BluetoothState.STATE_OFF) {
            let disable = bluetoothManager.disableBluetooth();
            await sleep(10000);
            console.info('[bluetooth_js] bluetoothManager disable001' + JSON.stringify(disable));
            expect(disable).assertTrue();
            let state1 = bluetoothManager.getState();
            console.info('[bluetooth_js] disable state001 ' + JSON.stringify(state1));
            expect(state1).assertEqual(bluetoothManager.BluetoothState.STATE_OFF);
        }
    } catch (error) {
        console.error(`[bluetooth_js]disable StateChange error, code is ${error.code}, 
        message is ${error.message}`);
    }    
        done();
    })
})
}