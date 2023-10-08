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

import bluetooth from '@ohos.bluetooth.connection';
import btAccess from '@ohos.bluetooth.access';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

export default function btConnectionTest() {
describe('btConnectionTest', function() {
    let Btname = {
        LETTERS_TEST :'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
        CHINESES_TEST2 :'测试蓝牙名称正常',
    }

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
        switch (sta) {
            case 0:
                btAccess.enableBluetooth();
                await clickTheWindow();
                await sleep(10000);
                let sta1 = btAccess.getState();
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
                btAccess.enableBluetooth();
                await clickTheWindow();
                await sleep(10000);
                let sta2 = btAccess.getState();
                console.info('[bluetooth_js] bt turning off:' + JSON.stringify(sta2));
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
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0100
     * @tc.name Test pinRequired and setDevicePairing true
     * @tc.desc Test pinRequired off api10
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0100', 0, async function (done) {
        function onReceiveEvent(data) {
            console.info('pin required = '+ JSON.stringify(data));
        }
        try {
            bluetooth.on('pinRequired', onReceiveEvent);
            bluetooth.off('pinRequired', onReceiveEvent);
        } catch (error) {
            console.info(`[bluetooth_js]pinRequired error, code is ${error.code}, 
            message is ${error.message}`);
            expect(error.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0200
     * @tc.name test get PairedDevices
     * @tc.desc Test getPairedDevices api10
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0200', 0, async function (done) {
        try {
            let ret = bluetooth.getPairedDevices();
            console.info('[bluetooth_js] getPairedDevices ret2:' + JSON.stringify(ret));
            expect(true).assertEqual(ret.length >= 0);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0300
     * @tc.name test getRemoteDeviceName
     * @tc.desc Test get RemoteDeviceName api 10
     * @tc.type Function
     * @tc.level Level 3
     */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0300', 0, async function (done) {
         try {
            let ret = bluetooth.getRemoteDeviceName("00:00:00:00:00:00");
            console.info('[bluetooth_js] getRemoteDeviceName ret2:' + JSON.stringify(ret));
         } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0400
     * @tc.name Test pairDevice callback
     * @tc.desc Test pairDevice callback api10
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0400', 0, async function (done) {
        function BondStateParam(data) {
            console.info("[bluetooth_js] bondStateChange on:" + JSON.stringify(data)
            +'bondStateChange deviceId:' + data.deviceId + 'bondStateChange state:' + data.state);
        }
        try {
            bluetooth.on('bondStateChange', BondStateParam);
            bluetooth.pairDevice("11:22:55:66:33:44", err => {
                if (err) {
                    console.info('pairDevice errCode: ' + err.code + ', errMessage: ' + err.message);
                }
                console.info('pairDevice, err: ' + JSON.stringify(err));
            });
            bluetooth.off('bondStateChange', BondStateParam);
            expect(bluetooth.BondState.BOND_STATE_INVALID == 0).assertTrue();
            expect(bluetooth.BondState.BOND_STATE_BONDING == 1).assertTrue();
            expect(bluetooth.BondState.BOND_STATE_BONDED == 2).assertTrue();
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        bluetooth.off('bondStateChange', BondStateParam);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0500
     * @tc.name Test setDevicePairingConfirmation
     * @tc.desc Test setDevicePairingConfirmation api10
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0500', 0, async function (done) {
        function PinRequiredParam(data) {
            console.info("[bluetooth_js] pinRequired on:" + JSON.stringify(data));
            bluetooth.setDevicePairingConfirmation(data.deviceId, false);
            console.info("[bluetooth_js] setDevicePairingConfirmation data.deviceId:" + data.deviceId);
        }
        try {
            bluetooth.on('pinRequired', PinRequiredParam);
            await sleep(2000);
            bluetooth.off('pinRequired', PinRequiredParam);
        } catch (err) {
            console.info("setDevicePairingConfirmation errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0600
     * @tc.name test getRemoteDeviceClass
     * @tc.desc Test get RemoteDeviceClass api10
     * @tc.type Function
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0600', 0, async function (done) {
        try {
            let DeviceClass = bluetooth.getRemoteDeviceClass("00:00:00:00:00:00");
            console.info('[bluetooth_js]getRemoteDeviceClass majorClass:' + DeviceClass.majorClass);
            console.info('[bluetooth_js]getRemoteDeviceClass majorMinorClass:' + DeviceClass.majorMinorClass);
            console.info('[bluetooth_js]getRemoteDeviceClass classOfDevice:' + DeviceClass.classOfDevice);
        } catch (err) {
            console.info("getRemoteDeviceClass errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0700
     * @tc.name Test setDevicePinCode callback
     * @tc.desc Test setDevicePinCode api10
     * @tc.type Function
     * @tc.level Level 3
     */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0700', 0, async function (done) {
        try {
            bluetooth.setDevicePinCode('11:22:33:44:55:66', '12345', (err, data) => {
                console.info('setDevicePinCode callback,device name err:' + JSON.stringify(err) + ',device name:' + JSON.stringify(data));
            });
        } catch (err) {
            console.info("setDevicePinCode callback errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0800
     * @tc.name Test setDevicePinCode promise
     * @tc.desc Test setDevicePinCode api10
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0800', 0, async function (done) {
        try {
            bluetooth.setDevicePinCode('11:22:33:44:55:66', '12345').then(() => {
                console.info('setDevicePinCode promise');
            }, error => {
                console.info('setDevicePinCode promise: errCode:' + error.code + ',errMessage' + error.message);
            })
        } catch (err) {
            console.info("setDevicePinCode promise errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0900
     * @tc.name Test pairDevice promise
     * @tc.desc Test pairDevice promise api10
     * @tc.type Function
     * @tc.level Level 3
     */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PAIR_0900', 0, async function (done) {
        function BondStateParam(data) {
            console.info("[bluetooth_js] bondStateChange on:" + JSON.stringify(data)
            +'bondStateChange deviceId:' + data.deviceId + 'bondStateChange state:' + data.state);
        }
        try {
            bluetooth.on('bondStateChange', BondStateParam);
            bluetooth.pairDevice("11:22:55:66:33:44").then((data) => {
                console.info('pairDevice info success');
            }, err => {
                console.info('pairDevice:errCode' + err.code + ', errMessage: ' + err.message);
            });
            bluetooth.off('bondStateChange', BondStateParam);
            expect(bluetooth.BondState.BOND_STATE_INVALID == 0).assertTrue();
            expect(bluetooth.BondState.BOND_STATE_BONDING == 1).assertTrue();
            expect(bluetooth.BondState.BOND_STATE_BONDED == 2).assertTrue();
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        bluetooth.off('bondStateChange', BondStateParam);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0100
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api10 by promise.
     * @tc.type Function
     * @tc.level Level 2
     */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0100', 0, async function (done) {
        let state = btAccess.getState();
       console.info('[bluetooth_js] get bluetooth state001'+ JSON.stringify(state));
       if(state == 2)
       {
           let oldScanMode = bluetooth.getBluetoothScanMode();
           console.info('[bluetooth_js] ScanMode_0100 oldScanMode = '+ JSON.stringify(oldScanMode));
           let result = bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_NONE,0);
           expect(result).assertTrue();
           let getScanMode = bluetooth.getBluetoothScanMode();
           console.info('[bluetooth_js] ScanMode_0100 newscanmode = '+ JSON.stringify(getScanMode));
           expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_NONE);
           result=bluetooth.setBluetoothScanMode(oldScanMode,0);
           expect(result).assertTrue();
           let getOldScanMode = bluetooth.getBluetoothScanMode();
           console.info('[bluetooth_js] ScanMode_0100 setoldscanmode = '+ JSON.stringify(getOldScanMode));
           expect(true).assertEqual(oldScanMode == getOldScanMode);
           done();
       }
       else
       {
           console.info('[bluetooth_js] bluetooth switch  off,state is   = '+ JSON.stringify(state));
           expect(true).assertFalse();
           done();
       }

     })

     /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0200
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api by promise.
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_SCANMODE_0200', 0, async function (done) {

        let state = btAccess.getState();
       console.info('[bluetooth_js] get bluetooth state001'+ JSON.stringify(state));
       if(state == 2)
       {
           let oldScanMode = bluetooth.getBluetoothScanMode();
           console.info('[bluetooth_js] ScanMode_0200 oldScanMode = '+ JSON.stringify(oldScanMode));
           let result = bluetooth.setBluetoothScanMode(bluetooth.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE,0);
           expect(result).assertTrue();
           let getScanMode = bluetooth.getBluetoothScanMode();
           console.info('[bluetooth_js] ScanMode_0200 newscanmode = '+ JSON.stringify(getScanMode));
           expect(true).assertEqual(getScanMode == bluetooth.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE);
           result=bluetooth.setBluetoothScanMode(oldScanMode,0);
           expect(result).assertTrue();
           let getOldScanMode = bluetooth.getBluetoothScanMode();
           console.info('[bluetooth_js] ScanMode_0200 setoldscanmode = '+ JSON.stringify(getOldScanMode));
           expect(true).assertEqual(oldScanMode == getOldScanMode);
           done();
       }
        else
       {
           console.info('[bluetooth_js] bluetooth switch  off,state is   = '+ JSON.stringify(state));
           expect(true).assertFalse();
           done();
       }
   })

   /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_DISCOVERY_0100
     * @tc.name TEST bluetoothDeviceFind on&off 
     * @tc.desc TEST bluetoothDeviceFind api10
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_DISCOVERY_0100', 0, async function (done) {
        function onReceiveEvent(data) {
            console.info('[bluetooth_js] Device' + JSON.stringify(data) +
            'length' + data.length);
            expect(true).assertTrue(data.length > 0);
        }
    try {
        bluetooth.on("bluetoothDeviceFind", onReceiveEvent);
        let result = bluetooth.startBluetoothDiscovery();
        await sleep(3000);
        console.info('[bluetooth_js] startDiscovery' + result);
        expect(result).assertTrue();
        bluetooth.off('bluetoothDeviceFind', onReceiveEvent);
        result = bluetooth.stopBluetoothDiscovery();
        console.info('[bluetooth_js] stopDiscovery' + result);
        expect(true).assertTrue();
    } catch (error) {
        console.info(`[bluetooth_js]bluetoothDeviceFin error, code is ${error.code},message is ${error.message}`);
        expect(error.code).assertEqual('2900099');
    }
    bluetooth.off('bluetoothDeviceFind', onReceiveEvent);
    done(); 
    })

    

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0100
     * @tc.name setLocalName
     * @tc.desc Test setLocalName api10
     * @tc.type Function
     * @tc.level Level 1 
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0100', 0, async function (done) {
        let result = bluetooth.setLocalName(Btname.LETTERS_TEST);
        expect(result).assertTrue();
        await sleep(1000);
        try {
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_0100 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(Btname.LETTERS_TEST == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0200
     * @tc.name setLocalName
     * @tc.desc Test setLocalName api10
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_LOCALNAME_0200', 0, async function (done) {
        try {
            let result = bluetooth.setLocalName(Btname.CHINESES_TEST2);
            expect(result).assertTrue();
            await sleep(1000);
            let getNewName = bluetooth.getLocalName();
            console.info('[bluetooth_js] LocalName_0200 NewName = '+ JSON.stringify(getNewName));
            expect(true).assertEqual(Btname.CHINESES_TEST2 == getNewName);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PROFILE_0100
     * @tc.name test getBtConnectionState
     * @tc.desc Test getBtConnectionState api10
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PROFILE_0100', 0, async function (done) {
        try {
            let connectionState = bluetooth.getBtConnectionState();
            expect(true).assertEqual(connectionState == 0 || connectionState == 1 || connectionState == 2 || connectionState == 3);
        } catch (err) {
            console.info("errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_PROFILE_0200
     * @tc.name getProfileConnectionState
     * @tc.desc Test getProfileConnectionState api10
     * @tc.type Function
     * @tc.level Level 3
     */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_PROFILE_0200', 0, async function (done) {
        try {
            let result = bluetooth.getProfileConnectionState(1);
            expect(true).assertEqual(result == 0 || result == 1 || result == 2 || result == 3);
        } catch (err) {
            console.info("getProfileConnectionState errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('401');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONSTANT_0100
     * @tc.name BluetoothTransport
     * @tc.desc Test BluetoothTransport api10
     * @tc.type Function
     * @tc.level Level 3
     */
     it('SUB_COMMUNICATION_BLUETOOTHCONNECTION_CONSTANT_0100', 0, async function (done) {
        try {
            let TRANSPORT_BR_EDR = bluetooth.BluetoothTransport.TRANSPORT_BR_EDR;
            let TRANSPORT_LE = bluetooth.BluetoothTransport.TRANSPORT_LE;
            expect(TRANSPORT_BR_EDR).assertEqual(0);
            expect(TRANSPORT_LE).assertEqual(1);
        } catch (err) {
            console.info("BluetoothTransport errCode:" + err.code + ",errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })
})
}