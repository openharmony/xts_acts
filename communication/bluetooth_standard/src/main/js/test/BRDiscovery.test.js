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

import bluetooth from '@ohos.bluetooth';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

const PERMISSION_USER_SET = 1;
const PERMISSION_USER_NAME1 = "ohos.permission.LOCATION";
const PERMISSION_USER_NAME2 = 'ohos.permission.LOCATION_IN_BACKGROUND';
let tokenID = undefined;
async function grantPerm() {
    console.info("====grant Permission start====");
    let appInfo = await bundle.getApplicationInfo('ohos.acts.communication.bluetooth.bluetoothhost', 0, 100);
    tokenID = appInfo.accessTokenId;
    console.info("accessTokenId" + appInfo.accessTokenId + " bundleName:" + appInfo.bundleName);
    let atManager = abilityAccessCtrl.createAtManager();
    let result = await atManager.grantUserGrantedPermission(tokenID, PERMISSION_USER_NAME1, PERMISSION_USER_SET);
    console.info("tokenId" + tokenID + " result:" + result);
    let result1 = await atManager.grantUserGrantedPermission(tokenID, PERMISSION_USER_NAME2, PERMISSION_USER_SET);
    console.info("tokenId" + tokenID + " result1:" + result1);
    console.info("====grant Permission end====");
}
export default function bluetoothhostTest3() {
describe('bluetoothhostTest3', function() {
    function sleep(delay) {
        return new Promise(resovle => setTimeout(resovle, delay))
    }

    async function tryToEnableBt() {
        let sta = bluetooth.getState();
        switch(sta){
            case 0:
                bluetooth.enableBluetooth();
                await sleep(5000);
                let sta1 = bluetooth.getState();
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
                bluetooth.enableBluetooth();
                await sleep(3000);
                let sta2 = bluetooth.getState();
                console.info('[bluetooth_js] bt turning off:'+ JSON.stringify(sta2));
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
    }

    beforeAll(async function (done) {
        console.info('beforeAll called')
        await grantPerm();
        done()
    })
    beforeEach(async function(done) {
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
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_Discovery_0100
     * @tc.name TEST DISCOVERY
     * @tc.desc TEST DISCOVERY 
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_Discovery_0100', 0, async function (done) {
        function onReceiveEvent(data){
            console.info('[bluetooth_js] Device' + JSON.stringify(data)+ 
                 'length' + data.length);
            expect(true).assertTrue(data.length > 0);
        }
        bluetooth.on("bluetoothDeviceFind", onReceiveEvent);
        let result = bluetooth.startBluetoothDiscovery();
        await sleep(3000);
        console.info('[bluetooth_js] startDiscovery'+result);
        expect(result).assertTrue();
        bluetooth.off('bluetoothDeviceFind', onReceiveEvent);
        result = bluetooth.stopBluetoothDiscovery();
        console.info('[bluetooth_js] stopDiscovery'+result);
        expect(true).assertTrue();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_Discovery_0300
     * @tc.name TEST DISCOVERY
     * @tc.desc TEST DISCOVERY api 8.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_Discovery_0300', 0, async function (done) {
        let result1 = bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_CONNECTABLE,10);
        expect(result1).assertTrue();
        let getScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] getScanMode = '+ JSON.stringify(getScanMode));
        expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_CONNECTABLE);
        let result = bluetooth.startBluetoothDiscovery();
        await sleep(2000);
        console.info('[bluetooth_js] startDiscovery1'+result);
        expect(result).assertTrue();
        let result2 = bluetooth.startBluetoothDiscovery();
        console.info('[bluetooth_js] startDiscovery2'+result2);
        expect(result2).assertFalse();
        done();
    })
})
}


