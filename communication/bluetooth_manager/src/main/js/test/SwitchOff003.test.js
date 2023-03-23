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

import bluetooth from '@ohos.bluetoothManager';
import geolocation from '@ohos.geolocation';
import geolocationm from '@ohos.geoLocationManager';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundle from '@ohos.bundle';
import osaccount from '@ohos.account.osAccount';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function bluetoothBLETest3() {
describe('bluetoothBLETest3', function() {
    let gattServer = null;
    let gattClient = null;
    function sleep(delay) {
        return new Promise(resovle => setTimeout(resovle, delay))
    }

    async function tryToDisableBt() {
        let sta = bluetooth.getState();
        switch(sta){
            case 0:
                console.info('[bluetooth_js] bt turn off:'+ JSON.stringify(sta));
                break;
            case 1:
                console.info('[bluetooth_js] bt turning on:'+ JSON.stringify(sta));
                await sleep(3000);
                break;
            case 2:
                console.info('[bluetooth_js] bt turn on:'+ JSON.stringify(sta));
                bluetooth.disableBluetooth();
                await sleep(3000);
                break;
            case 3:
                console.info('[bluetooth_js] bt turning off:'+ JSON.stringify(sta));
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
    }
	async function applyPermission() {
		let osAccountManager = osaccount.getAccountManager();
		console.info("=== getAccountManager finish");
		let localId = await osAccountManager.getOsAccountLocalIdFromProcess();
		console.info("LocalId is :" + localId);
		let appInfo = await bundle.getApplicationInfo('ohos.acts.location.geolocation.function', 0, localId);
		let atManager = abilityAccessCtrl.createAtManager();
		if (atManager != null) {
        let tokenID = appInfo.accessTokenId;
        console.info('[permission] case accessTokenID is ' + tokenID);
        let permissionName1 = 'ohos.permission.LOCATION';
        let permissionName2 = 'ohos.permission.LOCATION_IN_BACKGROUND';
        await atManager.grantUserGrantedPermission(tokenID, permissionName1, 1).then((result) => {
            console.info('[permission] case grantUserGrantedPermission success :' + JSON.stringify(result));
        }).catch((err) => {
            console.info('[permission] case grantUserGrantedPermission failed :' + JSON.stringify(err));
        });
        await atManager.grantUserGrantedPermission(tokenID, permissionName2, 1).then((result) => {
            console.info('[permission] case grantUserGrantedPermission success :' + JSON.stringify(result));
        }).catch((err) => {
            console.info('[permission] case grantUserGrantedPermission failed :' + JSON.stringify(err));
        });
		} else {
        console.info('[permission] case apply permission failed, createAtManager failed');
		}
	}
    beforeAll(function () {
        console.info('beforeAll called')
        gattServer = bluetooth.BLE.createGattServer();
        gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
    })
    beforeEach(async function(done) {
        console.info('beforeEach called')
        await tryToDisableBt()
        done()
    })
    afterEach(function () {
        console.info('afterEach called')
    })
    afterAll(async function (done) {
        console.info('afterAll called')
        await sleep(6000);
        gattClient.close();
        done()
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_0100
     * @tc.name test bluetooth Profile ConnectionState
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_0100', 0, async function (done) {
        await sleep(3000);
        let sta = bluetooth.getState();
        console.info('[bluetooth_js] bt getState:'+ JSON.stringify(sta));
        try {
            let connState = bluetooth.getBtConnectionState();
            console.info('[bluetooth_js] get bt connection state result' 
                     + JSON.stringify(connState));
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error('[bluetooth_js]getBtConnectionState error.code:'
            +JSON.stringify(error.code)+ 'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }  
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_0200
     * @tc.name Test pairDevice api
     * @tc.desc Test 2900003 - Bluetooth switch is off
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_0200', 0, async function (done) {
        try {
            bluetooth.pairDevice("11:22:55:66:33:44");
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]pairDevice error.code:'+JSON.stringify(error.code)+
                   'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }  
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_0300
     * @tc.name test getRemoteDeviceName
     * @tc.desc Test 2900003 - Bluetooth switch is off
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_0300', 0, async function (done) {
        try {
            let ret = bluetooth.getRemoteDeviceName("00:00:00:00:00:00");
            console.info('[bluetooth_js] getRemoteDeviceName ret2:' + JSON.stringify(ret));
            expect(ret.length).assertEqual(0);
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]getRemoteDeviceName error.code:'+JSON.stringify(error.code)+
                   'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }  
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_0400
     * @tc.name test getRemoteDeviceClass
     * @tc.desc Test 2900003 - Bluetooth switch is off
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_0400', 0, async function (done) {
        try {
            let DeviceClass = bluetooth.getRemoteDeviceClass("00:00:00:00:00:00");
            console.info('[bluetooth_js] getRemoteDeviceClass ret2 :' + JSON.stringify(DeviceClass) 
            + 'majorClass:' +DeviceClass.majorClass + 'majorMinorClass:'+ DeviceClass.majorMinorClass 
            + 'classOfDevice:' + DeviceClass.classOfDevice);
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]getRemoteDeviceClass error.code:'+JSON.stringify(error.code)+
                   'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_0500
     * @tc.name test get PairedDevices
     * @tc.desc Test 2900003 - Bluetooth switch is off
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_0500', 0, async function (done) {
        try {
            let ret = bluetooth.getPairedDevices();
            console.info('[bluetooth_js] getPairedDevices ret2:' + JSON.stringify(ret));
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]getPairedDevices error.code:'+JSON.stringify(error.code)+
                   'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_0600
     * @tc.name test Get A2DP ConnectionState
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_0600', 0, async function (done) {
        try {
            let a2dpSrcConn = bluetooth.getProfileConnectionState(bluetooth.ProfileId.PROFILE_A2DP_SOURCE);
            console.info('[bluetooth_js]get a2dp result:' + JSON.stringify(a2dpSrcConn));
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]getProfileConnectionState error.code:'+JSON.stringify(error.code)+
                   'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_0700
     * @tc.name Test setDevicePairing
     * @tc.desc Test 2900003 - Bluetooth switch is off
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_0700', 0, async function (done) {
        try {
            bluetooth.setDevicePairingConfirmation("11:22:55:66:33:44",false);
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]setDevicePairingConfirmation error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_0800
     * @tc.name setLocalName
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
     it('COMMUNICATION_BLUETOOTH_SwitchOff_0800', 0, async function (done) {
        try {
            let newName = 'my bluetooth';
            bluetooth.setLocalName(newName);
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]setLocalName error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_0900
     * @tc.name TEST setBluetoothScanMode
     * @tc.desc TEST 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_0900', 0, async function (done) {
        try {
            bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE,0);
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]setBluetoothScanMode error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

     /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_1000
     * @tc.name TEST getBluetoothScanMode
     * @tc.desc TEST 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_1000', 0, async function (done) {
        try {
            let oldScanMode = bluetooth.getBluetoothScanMode();
            console.info('[bluetooth_js] getBluetoothScanMode = '+ JSON.stringify(oldScanMode));
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]getBluetoothScanMode error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_1100
     * @tc.name TEST startBluetoothDiscovery
     * @tc.desc TEST 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_1100', 0, async function (done) {
        try {
            bluetooth.startBluetoothDiscovery();
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]startBluetoothDiscovery error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_1200
     * @tc.name TEST stopBluetoothDiscovery
     * @tc.desc TEST 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_1200', 0, async function (done) {
        try {
            bluetooth.stopBluetoothDiscovery();
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]stopBluetoothDiscovery error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_1600
     * @tc.name test getDevice HFP State.
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 1
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_1600', 0, async function (done) {
        try {
            let hfpSrc = bluetooth.getProfileInstance(bluetooth.ProfileId.PROFILE_HANDS_FREE_AUDIO_GATEWAY);
            let retArray = hfpSrc.getConnectionDevices();
            console.info('[bluetooth_js]hfp getConnectionDevices:' + JSON.stringify(retArray));
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]getConnectionDevices error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_1700
     * @tc.name test getDeviceState.
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 1
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_1700', 0, async function (done) {
        try {
            let hfpSrc = bluetooth.getProfileInst(bluetooth.ProfileId.PROFILE_HANDS_FREE_AUDIO_GATEWAY);
            let ret = hfpSrc.getDeviceState('11:22:33:44:55:66');
            console.info('[bluetooth_js]hfp getDeviceState:' + JSON.stringify(ret));
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]getDeviceState error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_1800
     * @tc.name test A2DP Connect
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 1
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_1800', 0, async function (done) {
        try {
            let a2dpSrc = bluetooth.getProfile(bluetooth.ProfileId.PROFILE_A2DP_SOURCE);
            a2dpSrc.connect('11:22:33:44:55:77');
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]A2DPconnect error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

   
    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_1900
     * @tc.name test A2DP disconnect
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_1900', 0, async function (done) {
        try {
            let a2dpSrc = bluetooth.getProfile(bluetooth.ProfileId.PROFILE_A2DP_SOURCE);
            a2dpSrc.disconnect('11:22:33:44:55:77');
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]A2DPdisconnect error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_2000
     * @tc.name test  get A2DP Playing State
     * @tc.desc Test  2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_2000', 0, async function (done) {
        try {
            let a2dpSrc = bluetooth.getProfile(bluetooth.ProfileId.PROFILE_A2DP_SOURCE);
            console.info('[bluetooth_js]a2dp get profile result:' + JSON.stringify(a2dpSrc));
            let state = a2dpSrc.getPlayingState('11:22:33:44:55:66');
            console.info('[bluetooth_js]a2dp getPlayingState result:' + JSON.stringify(state));
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]getPlayingState error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_2100
     * @tc.name test HFP Connect
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 1
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_2100', 0, async function (done) {
        try {
            let hfpSrc = 
                bluetooth.getProfileInst(bluetooth.ProfileId.PROFILE_HANDS_FREE_AUDIO_GATEWAY);
            hfpSrc.connect('11:22:33:44:55:77');
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]HFPconnect error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })
   
    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_2200
     * @tc.name test HFP disconnect
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_2200', 0, async function (done) {
        try {
            let hfpSrc = 
               bluetooth.getProfileInst(bluetooth.ProfileId.PROFILE_HANDS_FREE_AUDIO_GATEWAY);
            hfpSrc.disconnect('11:22:33:44:55:77');
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]HFPdisconnect error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

        /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_2300
     * @tc.name test Hid Connect
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 1
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_2300', 0, async function (done) {
        try {
            let hidSrc = 
                bluetooth.getProfileInst(bluetooth.ProfileId.PROFILE_HID_HOST);
            hidSrc.connect('11:22:33:44:55:77');
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]Hidconnect error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })
   
    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_2400
     * @tc.name test Hid disconnect
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_2400', 0, async function (done) {
        try {
            let hidSrc = 
                bluetooth.getProfileInst(bluetooth.ProfileId.PROFILE_HID_HOST);
            hidSrc.disconnect('11:22:33:44:55:77');
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]Hiddisconnect error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_2500
     * @tc.name test PAN disconnect
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_2500', 0, async function (done) {
        try {
            let panSrc =
                bluetooth.getProfileInst(bluetooth.ProfileId.PROFILE_PAN_NETWORK);
            panSrc.disconnect('11:22:33:44:55:77');
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]Pandisconnect error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_2600
     * @tc.name test PAN setTethering
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_2600', 0, async function (done) {
        try {
            let panSrc =
                bluetooth.getProfileInst(bluetooth.ProfileId.PROFILE_PAN_NETWORK);
            panSrc.setTethering(true);
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]PansetTethering error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_2800
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_2800', 0, async function (done) {
        try {
            bluetooth.BLE.startBLEScan(
                [{
                    deviceId:"11:22:33:44:55:66",
                    name:"test",
                    serviceUuid:"00001888-0000-1000-8000-00805f9b34fb"
                }],
                {
                    interval: 500,
                    dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_POWER,
                    matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
                }
            );
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]startBLEScan error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_2900
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_2900', 0, async function (done) {
        try {
            bluetooth.BLE.stopBLEScan();
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]startBLEScan error.code:'
               +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_3000
     * @tc.name testStartAdvertising
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 0
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_3000', 0, async function (done) {
          let manufactureValueBuffer = new Uint8Array(4);
          manufactureValueBuffer[0] = 1;
          manufactureValueBuffer[1] = 2;
          manufactureValueBuffer[2] = 3;
          manufactureValueBuffer[3] = 4;
          let serviceValueBuffer = new Uint8Array(4);
          serviceValueBuffer[0] = 4;
          serviceValueBuffer[1] = 6;
          serviceValueBuffer[2] = 7;
          serviceValueBuffer[3] = 8;
          let setting={
            interval:20,
            txPower:-10,
            connectable:true,
            }
          let advData={
               serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
               manufactureData:[{
                    manufactureId:4567,
                    manufactureValue:manufactureValueBuffer.buffer
               }],
               serviceData:[{
                    serviceUuid:"00001888-0000-1000-8000-00805f9b34fb",
                    serviceValue:serviceValueBuffer.buffer
               }],
          }
          let advResponse ={
               serviceUuids:["00001889-0000-1000-8000-00805f9b34fb"],
               manufactureData:[{
                    manufactureId:1789,
                    manufactureValue:manufactureValueBuffer.buffer
               }],
               serviceData:[{
                    serviceUuid:"00001889-0000-1000-8000-00805f9b34fb",
                    serviceValue:serviceValueBuffer.buffer
               }],
          }
          try {
               gattServer.startAdvertising(setting,advData,advResponse);
               expect(true).assertFalse();
          }catch(error) {
               console.error('[bluetooth_js]startAdvertising error.code:'+JSON.stringify(error.code)+
                   'error.message:'+JSON.stringify(error.message));
               expect(error.code).assertEqual('2900003');
          }
          await sleep(2000);
          done();
     })

       /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_3100
     * @tc.name teststopAdvertising
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 0
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_3100', 0, async function (done) {
          let manufactureValueBuffer = new Uint8Array(4);
          manufactureValueBuffer[0] = 1;
          manufactureValueBuffer[1] = 2;
          manufactureValueBuffer[2] = 3;
          manufactureValueBuffer[3] = 4;
          let serviceValueBuffer = new Uint8Array(4);
          serviceValueBuffer[0] = 4;
          serviceValueBuffer[1] = 6;
          serviceValueBuffer[2] = 7;
          serviceValueBuffer[3] = 8;
          let advData={
               serviceUuids:["00001888-0000-1000-8000-00805f9b34fb"],
               manufactureData:[{
                    manufactureId:4567,
                    manufactureValue:manufactureValueBuffer.buffer
               }],
               serviceData:[{
                    serviceUuid:"00001888-0000-1000-8000-00805f9b34fb",
                    serviceValue:serviceValueBuffer.buffer
               }],
          }
          let advResponse ={
               serviceUuids:["00001889-0000-1000-8000-00805f9b34fb"],
               manufactureData:[{
                    manufactureId:1789,
                    manufactureValue:manufactureValueBuffer.buffer
               }],
               serviceData:[{
                    serviceUuid:"00001889-0000-1000-8000-00805f9b34fb",
                    serviceValue:serviceValueBuffer.buffer
               }],
          }
          try {
               gattServer.stopAdvertising();
               expect(true).assertFalse();
          }catch(error) {
               console.error('[bluetooth_js]stopAdvertising error.code:'+JSON.stringify(error.code)+
                   'error.message:'+JSON.stringify(error.message));
               expect(error.code).assertEqual('2900003');
          }
          done();
     })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_3200
     * @tc.name testAddService
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_3200', 0, async function (done) {
        try {
            let descriptors = [];
            let arrayBuffer = new ArrayBuffer(8);
            let descV = new Uint8Array(arrayBuffer);
            descV[0] = 11;
            let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
            descriptors[0] = descriptor;
            let characteristics = [];
            let arrayBufferC = new ArrayBuffer(8);
            let cccV = new Uint8Array(arrayBufferC);
            cccV[0] = 1;
            let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', 
            characteristicValue: arrayBufferC, descriptors:descriptors};
            characteristics[0] = characteristic;
            let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FB', isPrimary: true,
            characteristics:characteristics, includeServices:[]};
            gattServer.addService(gattService);
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error(`[bluetooth_js]AddService failed, code is ${error.code},
                  message is ${error.message}`);
            expect(error.code).assertEqual('2900003');
            done()
        }       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_3300
     * @tc.name test removeService
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_3300', 0, async function (done) {
        try {
            gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error(`[bluetooth_js]removeService failed, code is ${error.code},
                  message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_3400
     * @tc.name test removeService
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_3400', 0, async function (done) {
        try {
            gattServer.close();
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error(`[bluetooth_js]close failed, code is ${error.code},
                  message is ${error.message}`);
            expect(error.code).assertEqual('2900003');
            done()
        }       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_3600
     * @tc.name testSendResponse success
     * @tc.desc Test 2900003 - Bluetooth switch is off.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_3600', 0, async function (done) {
        try {
            let arrayBuffer = new ArrayBuffer(8);
            let value =  new Uint8Array(arrayBuffer);
            value[0] = 1;
            let ServerResponse = {deviceId: '00:11:22:33:44:55', transId: 1,
                status: 0, offset: 0, value: arrayBuffer};
            gattServer.sendResponse(ServerResponse);
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error(`[bluetooth_js]sendResponse failed, code is ${error.code},
            message is ${error.message}`);
            expect(error.code).assertEqual('2900003');
            done()
        }
        
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_3700
     * @tc.name test gatt connect 
     * @tc.desc Test 2900003 - Bluetooth switch is off
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_3700', 0, async function (done) { 
        try {
            gattClient.connect();
            await sleep(2000);
            expect(true).assertFalse();
        } catch(error) {
            console.error(`[bluetooth_js]connect failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('2900003');
        }
        done()
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_3800
     * @tc.name test gatt disconnect
     * @tc.desc Test 2900003 - Bluetooth switch is off
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_3800', 0, async function (done) {
        try {
            gattClient.disconnect();
            expect(true).assertFalse();
          } catch(error) {
            console.error(`[bluetooth_js]disconnect failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('2900003');
        }
        done()
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_3900
     * @tc.name test gatt close
     * @tc.desc Test 2900003 - Bluetooth switch is off
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_3900', 0, async function (done) {
        try {
            gattClient.close();
            expect(true).assertFalse();
          } catch(error) {
            console.error(`[bluetooth_js]gattClient close failed, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('2900003');
        }
        done()
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_SwitchOff_4000
     * @tc.name Test cancelPairedDevice api
     * @tc.desc Test 2900003 - Bluetooth switch is off
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_SwitchOff_4000', 0, async function (done) {

        try {
            bluetooth.cancelPairedDevice("11:22:55:66:33:44");
            expect(true).assertFalse();
            done()
        } catch (error) {
            console.error('[bluetooth_js]cancelPairedDevice error.code:'+JSON.stringify(error.code)+
                   'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('2900003');
            done()
        }
    })

})
}


