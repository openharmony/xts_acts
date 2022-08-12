
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

let BluetoothState=
    {
        STATE_OFF : 0,
        STATE_TURNING_ON : 1,
        STATE_ON : 2,
        STATE_TURNING_OFF : 3,
        STATE_BLE_TURNING_ON : 4,
        STATE_BLE_ON : 5,
        STATE_BLE_TURNING_OFF : 6,
    }

let ScanMode =
    {
        SCAN_MODE_NONE : 0,
        SCAN_MODE_CONNECTABLE : 1,
        SCAN_MODE_GENERAL_DISCOVERABLE : 2,
        SCAN_MODE_LIMITED_DISCOVERABLE : 3,
        SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE : 4,
        SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE : 5,
    }

export default function bluetoothTEST() {
describe('bluetoothTEST', function() {
    beforeAll(function () {
        console.info('beforeAll called')
    })
    beforeEach(function () {
        console.info('beforeEach called')

    })
    afterEach(function () {
        console.info('afterEach called')
    })
    afterAll(function () {
        console.info('afterAll called')
    })

    function sleep(delay) {
        return new Promise(resovle => setTimeout(resovle, delay))
    }

    async function tryToEnableBt() {
        let sta = bluetooth.getState();
        switch(sta){
            case 0:
                console.info('[bluetooth_js] bt turn off:'+ JSON.stringify(sta));
                bluetooth.enableBluetooth();
                await sleep(3000);
                break;
            case 1:
                console.info('[bluetooth_js] bt turning on:'+ JSON.stringify(sta));
                await sleep(3000);
                break;
            case 2:
                console.info('[bluetooth_js] bt turn on:'+ JSON.stringify(sta));
                break;
            case 3:
                console.info('[bluetooth_js] bt turning off:'+ JSON.stringify(sta));
                bluetooth.enableBluetooth();
                await sleep(3000);
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
    }

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_LocalName_0500
     * @tc.name setLocalName
     * @tc.desc Test setLocalName api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
      it('SUB_COMMUNICATION_BLUETOOTH_BR_LocalName_0500', 0, async function (done) {
        await sleep(1000);
        await tryToEnableBt();
        let localName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_0500 localName = '+ JSON.stringify(localName));
        expect(true).assertEqual(localName!=null);
        let newName = 'my bluetooth';
        let result = bluetooth.setLocalName(newName);
        expect(result).assertTrue();
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_0500 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(newName == getNewName);
        result=bluetooth.setLocalName(localName);
        expect(result).assertTrue();
        let getLocalName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_0500 localName = '+ JSON.stringify(getLocalName));
        expect(true).assertEqual(localName == getLocalName);
        done();
      })

     /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_LocalName_0600
     * @tc.name TEST setLocalName
     * @tc.desc Test setLocalName api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
      it('SUB_COMMUNICATION_BLUETOOTH_BR_LocalName_0600', 0, async function (done) {
        await tryToEnableBt();
        let localName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_0600 localName = '+ JSON.stringify(localName));
        expect(true).assertEqual(localName!=null);
        let newName = 'bluetooth123';
        let result = bluetooth.setLocalName(newName);
        expect(result).assertTrue();
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_0600 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(newName == getNewName);
        result=bluetooth.setLocalName(localName);
        expect(result).assertTrue();
        let getLocalName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_0600 localName = '+ JSON.stringify(getLocalName));
        expect(true).assertEqual(localName == getLocalName);
        done();
      })

     /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_LocalName_0700
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
      it('SUB_COMMUNICATION_BLUETOOTH_BR_LocalName_0700', 0, async function (done) {
        await tryToEnableBt();
        let localName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_0700 localName = '+ JSON.stringify(localName));
        expect(true).assertEqual(localName!=null);
        let newName = '蓝牙设备bluetooth';
        let result = bluetooth.setLocalName(newName);
        expect(result).assertTrue();
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_0700 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(newName == getNewName);
        result=bluetooth.setLocalName(localName);
        expect(result).assertTrue();
        let getLocalName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_0700 localName = '+ JSON.stringify(getLocalName));
        expect(true).assertEqual(localName == getLocalName);
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_LocalName_1100
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
      it('SUB_COMMUNICATION_BLUETOOTH_BR_LocalName_1100', 0, async function (done) {
        await tryToEnableBt();
        let localName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_1100 localName = '+ JSON.stringify(localName));
        expect(true).assertEqual(localName!=null);
        let newName = '蓝牙设备123';
        let result = bluetooth.setLocalName(newName);
        expect(result).assertTrue();
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_1100 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(newName == getNewName);
        result=bluetooth.setLocalName(localName);
        expect(result).assertTrue();
        let getLocalName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_1100 localName = '+ JSON.stringify(getLocalName));
        expect(true).assertEqual(localName == getLocalName);
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_LocalName_1200
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
      it('SUB_COMMUNICATION_BLUETOOTH_BR_LocalName_1200', 0, async function (done) {
        await tryToEnableBt();
        let localName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_1200 localName = '+ JSON.stringify(localName));
        expect(true).assertEqual(localName!=null);
        let newName = '蓝牙设备bluetooth12';
        let result = bluetooth.setLocalName(newName);
        expect(result).assertTrue();
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_1200 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(newName == getNewName);
        result=bluetooth.setLocalName(localName);
        expect(result).assertTrue();
        let getLocalName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_1200 localName = '+ JSON.stringify(getLocalName));
        expect(true).assertEqual(localName == getLocalName);
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_LocalName_1400
     * @tc.name TEST setLocalName
     * @tc.desc TEST setLocalName api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
      it('SUB_COMMUNICATION_BLUETOOTH_BR_LocalName_1400', 0, async function (done) {
        await tryToEnableBt();
        let localName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_1400 localName = '+ JSON.stringify(localName));
        expect(true).assertEqual(localName!=null);
        let newName = '蓝牙设备*{bluetooth}';
        let result = bluetooth.setLocalName(newName);
        expect(result).assertTrue();
        let getNewName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_1400 NewName = '+ JSON.stringify(getNewName));
        expect(true).assertEqual(newName == getNewName);
        result=bluetooth.setLocalName(localName);
        expect(result).assertTrue();
        let getLocalName = bluetooth.getLocalName();
        console.info('[bluetooth_js] LocalName_1400 localName = '+ JSON.stringify(getLocalName));
        expect(true).assertEqual(localName == getLocalName);
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_ScanMode_0100
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
      it('SUB_COMMUNICATION_BLUETOOTH_BR_ScanMode_0100', 0, async function (done) {
        await tryToEnableBt();
        let oldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0100 oldScanMode = '+ JSON.stringify(oldScanMode));
        let result = bluetooth.setBluetoothScanMode(ScanMode.SCAN_MODE_NONE,0);
        expect(result).assertTrue();
        let getScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0100 newscanmode = '+ JSON.stringify(getScanMode));
        expect(true).assertEqual(getScanMode == ScanMode.SCAN_MODE_NONE);
        result=bluetooth.setBluetoothScanMode(oldScanMode,0);
        expect(result).assertTrue();
        let getOldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0100 setoldscanmode = '+ JSON.stringify(getOldScanMode));
        expect(true).assertEqual(oldScanMode == getOldScanMode);
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_ScanMode_0200
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
      it('SUB_COMMUNICATION_BLUETOOTH_BR_ScanMode_0200', 0, async function (done) {
        await tryToEnableBt();
        let oldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0200 oldScanMode = '+ JSON.stringify(oldScanMode));
        let result = bluetooth.setBluetoothScanMode(ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE,0);
        expect(result).assertTrue();
        let getScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0200 newscanmode = '+ JSON.stringify(getScanMode));
        expect(true).assertEqual(getScanMode == ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE);
        result=bluetooth.setBluetoothScanMode(oldScanMode,0);
        expect(result).assertTrue();
        let getOldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0200 setoldscanmode = '+ JSON.stringify(getOldScanMode));
        expect(true).assertEqual(oldScanMode == getOldScanMode);
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_ScanMode_0300
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
      it('SUB_COMMUNICATION_BLUETOOTH_BR_ScanMode_0300', 0, async function (done) {
        await tryToEnableBt();
        let oldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0200 oldScanMode = '+ JSON.stringify(oldScanMode));
        let result = bluetooth.setBluetoothScanMode(ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE,40000);
        expect(result).assertTrue();
        let getScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0200 getScanMode = '+ JSON.stringify(getScanMode));
        expect(true).assertEqual(getScanMode == ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE);
        result=bluetooth.setBluetoothScanMode(oldScanMode,0);
        expect(result).assertTrue();
        let getOldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0200 getOldScanMode = '+ JSON.stringify(getOldScanMode));
        expect(true).assertEqual(oldScanMode == getOldScanMode);
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_ScanMode_0400
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
      it('SUB_COMMUNICATION_BLUETOOTH_BR_ScanMode_0400', 0, async function (done) {
        await tryToEnableBt();
        let oldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0400 oldScanMode = '+ JSON.stringify(oldScanMode));
        let result = bluetooth.setBluetoothScanMode(ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE,40000);
        expect(result).assertTrue();
        let getScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0400 getScanMode = '+ JSON.stringify(getScanMode));
        expect(true).assertEqual(getScanMode == ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE);
        result=bluetooth.setBluetoothScanMode(oldScanMode,0);
        expect(result).assertTrue();
        let getOldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0400 getOldScanMode = '+ JSON.stringify(getOldScanMode));
        expect(true).assertEqual(oldScanMode == getOldScanMode);
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_ScanMode_0500
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
      it('SUB_COMMUNICATION_BLUETOOTH_BR_ScanMode_0500', 0, async function (done) {
        await tryToEnableBt();
        let oldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0500 oldScanMode = '+ JSON.stringify(oldScanMode));
        let result = bluetooth.setBluetoothScanMode(ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE,0);
        expect(result).assertTrue();
        let getScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0500 getScanMode = '+ JSON.stringify(getScanMode));
        expect(true).assertEqual(getScanMode == ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE);
        result=bluetooth.setBluetoothScanMode(oldScanMode,0);
        expect(result).assertTrue();
        let getOldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0500 getOldScanMode = '+ JSON.stringify(getOldScanMode));
        expect(true).assertEqual(oldScanMode == getOldScanMode);
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_ScanMode_0600
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
      it('SUB_COMMUNICATION_BLUETOOTH_BR_ScanMode_0600', 0, async function (done) {
        await tryToEnableBt();
        let oldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0600 oldScanMode = '+ JSON.stringify(oldScanMode));
        let result = bluetooth.setBluetoothScanMode(ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE,0);
        expect(result).assertTrue();
        let getScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0600 getScanMode = '+ JSON.stringify(getScanMode));
        expect(true).assertEqual(getScanMode == ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE);
        result=bluetooth.setBluetoothScanMode(oldScanMode,0);
        expect(result).assertTrue();
        let getOldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0600 getOldScanMode = '+ JSON.stringify(getOldScanMode));
        expect(true).assertEqual(oldScanMode == getOldScanMode);
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_ScanMode_0700
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
      it('SUB_COMMUNICATION_BLUETOOTH_BR_ScanMode_0700', 0, async function (done) {
        await tryToEnableBt();
        let oldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0700 oldScanMode = '+ JSON.stringify(oldScanMode));
        let result = bluetooth.setBluetoothScanMode(ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE,20000);
        expect(result).assertTrue();
        let getScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0700 getScanMode = '+ JSON.stringify(getScanMode));
        expect(true).assertEqual(getScanMode == ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE);
        result=bluetooth.setBluetoothScanMode(oldScanMode,0);
        expect(result).assertTrue();
        let getOldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0700 getOldScanMode = '+ JSON.stringify(getOldScanMode));
        expect(true).assertEqual(oldScanMode == getOldScanMode);
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_ScanMode_0800
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
      it('SUB_COMMUNICATION_BLUETOOTH_BR_ScanMode_0800', 0, async function (done) {
        await tryToEnableBt();
        let oldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0800 oldScanMode = '+ JSON.stringify(oldScanMode));
        let result = bluetooth.setBluetoothScanMode(ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE,0);
        expect(result).assertTrue();
        let getScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0800 getScanMode = '+ JSON.stringify(getScanMode));
        expect(true).assertEqual(getScanMode == ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE);
        result=bluetooth.setBluetoothScanMode(oldScanMode,0);
        expect(result).assertTrue();
        let getOldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0800 getOldScanMode = '+ JSON.stringify(getOldScanMode));
        expect(true).assertEqual(oldScanMode == getOldScanMode);
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_ScanMode_0900
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
      it('SUB_COMMUNICATION_BLUETOOTH_BR_ScanMode_0900', 0, async function (done) {
        await tryToEnableBt();
        let oldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0900 oldScanMode = '+ JSON.stringify(oldScanMode));
        let result = bluetooth.setBluetoothScanMode(ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE,30000);
        expect(result).assertTrue();
        let getScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0900 getScanMode = '+ JSON.stringify(getScanMode));
        expect(true).assertEqual(getScanMode == ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE);
        result=bluetooth.setBluetoothScanMode(oldScanMode,0);
        expect(result).assertTrue();
        let getOldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_0900 getOldScanMode = '+ JSON.stringify(getOldScanMode));
        expect(true).assertEqual(oldScanMode == getOldScanMode);
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_ScanMode_1000
     * @tc.name TEST scanmode
     * @tc.desc TEST scanmode api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 4
     */
      it('SUB_COMMUNICATION_BLUETOOTH_BR_ScanMode_1000', 0, async function (done) {
        await tryToEnableBt();
        let oldScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_1000 oldScanMode = '+ JSON.stringify(oldScanMode));
        let result = bluetooth.setBluetoothScanMode(-1,0);
        expect(result).assertFalse();
        let getScanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] ScanMode_1000 getScanMode = '+ JSON.stringify(getScanMode));
        expect(true).assertEqual(getScanMode == oldScanMode);
        done();
      })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_Pair_0400
     * @tc.name testGetRemoteDeviceClass
     * @tc.desc Test GetRemoteDeviceClass api 8.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_Pair_0400', 0, async function (done) {
        console.info('[bluetooth_js] getRemoteDeviceClass start');
        await tryToEnableBt();
        let ret = bluetooth.getRemoteDeviceClass("00:11:22:33:44:55");
        console.info('[bluetooth_js] getRemoteDeviceClass ret2 :' + JSON.stringify(ret) + 'majorClass:' +
        ret.majorClass + 'majorMinorClass:'+ ret.majorMinorClass + 'classOfDevice:' + ret.classOfDevice);
        expect(ret.majorClass).assertEqual(0);
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_SPP_LISTEN_0001
     * @tc.name testSppListen
     * @tc.desc Test SppListen api 8 by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNACATION_bluetooth_SPP_LISTEN_0001', 0, async function (done) {
        console.log("[bluetooth_js]: spp listen start");
        await tryToEnableBt();
        let sppOption = {uuid: '00001810-0000-1000-8000-00805F9B34FB',
            secure: true, type: 0};
        bluetooth.sppListen('server1', sppOption, function(code, serverSocketNumber) {
            console.info('[bluetooth_js] code is: ' + code.code);
            if (code.code == 0) {
                expect(true).assertEqual(true);
                done();
            } else {
                expect(true).assertEqual(false);
                done();
            }
        })
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0200
     * @tc.name testSppListen
     * @tc.desc Test SppListen api 8 by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0200', 0, async function (done) {
        console.log("[bluetooth_js]: spp listen start");
        await tryToEnableBt();
        let sppOption = {uuid: '00001810-0000-1000-8000-00805F9B34FB',
            secure: false, type: 0};
        let serverNumber = -1;
        function serverSocket(code, number) {
            console.log('[bluetooth_js] error code: ' + code.code);
            if (code.code == 0) {
              console.log('[bluetooth_js] serverSocket Number: ' + number);
              serverNumber = number;
             }
        }
        bluetooth.sppListen('server1', sppOption, serverSocket);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0300
     * @tc.name testSppListen
     * @tc.desc Test SppListen api 8 by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0300', 0, async function (done) {
        console.log("[bluetooth_js]: spp listen start");
        await tryToEnableBt();
        let sppOption = {uuid: '00000000',
            secure: true, type: 0};
        let serverNumber = -1;
        function serverSocket(code, number) {
            console.log('[bluetooth_js] error code: ' + code.code);
            if (code.code == 0) {
              console.log('[bluetooth_js] serverSocket Number: ' + number);
              serverNumber = number;
             }
        }
        bluetooth.sppListen('server1', sppOption, serverSocket);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0400
     * @tc.name testSppListen
     * @tc.desc Test SppListen api 8 by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0400', 0, async function (done) {
        console.log("[bluetooth_js]: spp listen start");
        await tryToEnableBt();
        let sppOption = {uuid: '00000000-0000-1000-8000-00805F9B34FB',
            secure: false, type: 0};
        let serverNumber = -1;
        function serverSocket(code, number) {
            console.log('[bluetooth_js] error code: ' + code.code);
            if (code.code == 0) {
              console.log('[bluetooth_js] serverSocket Number: ' + number);
              serverNumber = number;
             }
        }
        bluetooth.sppListen('server1', sppOption, serverSocket);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0500
     * @tc.name testSppAccept
     * @tc.desc Test SppAccept api 8 by callbck.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0500', 0, async function (done) {
        console.log("[bluetooth_js] spp accept start");
        await tryToEnableBt();
        function acceptClientSocket(code, number) {
            console.log('[bluetooth_js] error code: ' + code.code);
            if (code.code == 0) {
             console.log('[bluetooth_js] clientSocket Number: ' + number);
         }
        }
        bluetooth.sppAccept(0, acceptClientSocket);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0600
     * @tc.name testSppAccept
     * @tc.desc Test SppAccept api 8 by callbck.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0600', 0, async function (done) {
        console.log("[bluetooth_js] spp accept start");
        await tryToEnableBt();
        bluetooth.sppAccept(-1, function(code, clientSocketNumber) {
            console.info('[bluetooth_js] code is: ' + code.code);
            if (code.code == 0) {
                expect(true).assertEqual(true);
            } else {
                expect(true).assertEqual(false);
            }
        });
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0700
     * @tc.name testSppConnect
     * @tc.desc Test SppConnect api 8 by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0700', 0, async function (done) {
        console.info('[bluetooth_js] spp_connect start');
        await tryToEnableBt();
        let sppOption = {uuid: '00001810-0000-1000-8000-00805F9B34FB',
            secure: true, type: 0};
        bluetooth.sppConnect('00:11:22:33:44:55', sppOption, function(code, clientSocketNumber) {
            console.info('[bluetooth_js] code is: ' + code.code);
            if (code.code == 0) {
                expect(true).assertEqual(true);
            } else {
                expect(true).assertEqual(false);
            }
        });
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0800
     * @tc.name testSppConnect
     * @tc.desc Test SppConnect api 8 by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BR_SPP_0800', 0, async function (done) {
        console.info('[bluetooth_js] spp_connect start');
        await tryToEnableBt();
        let sppOption = {uuid: '0000',
            secure: false, type: 0};
        bluetooth.sppConnect('ABC', sppOption, function(code, clientSocketNumber) {
            console.info('[bluetooth_js] code is: ' + code.code);
            if (code.code == 0) {
                expect(true).assertEqual(true);
            } else {
                expect(true).assertEqual(false);
            }
        });
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_0100
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_0100', 0, async function (done) {
        console.info('[bluetooth_js] BLE advertising start');
        await tryToEnableBt();
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
            interval:1000,
            txPower:60,
            connectable:true,
        }
        let advData={
            serviceUuids : "00001888-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : "4567",
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001888-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let advResponse ={
            serviceUuids : "00001889-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : 1789,
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001889-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let gattServer =bluetooth.BLE.createGattServer();
        gattServer.startAdvertising(setting,advData,advResponse);
        gattServer.stopAdvertising();
        console.info('[bluetooth_js] BLE advertising end');
        done();
    })

     /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_0200
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_0200', 0, async function (done) {
        console.info('[bluetooth_js] BLE advertising start');
        await tryToEnableBt();
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
            txPower:60,
            connectable:true,
        }
        let advData={
            serviceUuids : "00001888-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : "4567",
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001888-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let advResponse ={
            serviceUuids : "00001889-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : 1789,
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001889-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let gattServer =bluetooth.BLE.createGattServer();
        gattServer.startAdvertising(setting,advData,advResponse);
        gattServer.stopAdvertising();
        console.info('[bluetooth_js] BLE advertising end');
        done();
    })



     /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_0300
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_0300', 0, async function (done) {
        console.info('[bluetooth_js] BLE advertising start');
        await tryToEnableBt();
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
            interval:16385,
            txPower:60,
            connectable:true,
        }
        let advData={
            serviceUuids : "00001888-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : "4567",
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001888-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let advResponse ={
            serviceUuids : "00001889-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : 1789,
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001889-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let gattServer =bluetooth.BLE.createGattServer();
        gattServer.startAdvertising(setting,advData,advResponse);
        gattServer.stopAdvertising();
        console.info('[bluetooth_js] BLE advertising end');
        done();
    })


     /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_0400
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_0400', 0, async function (done) {
        console.info('[bluetooth_js] BLE advertising start');
        await tryToEnableBt();
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
            interval:16400,
            txPower:60,
            connectable:true,
        }
        let advData={
            serviceUuids : "00001888-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : "4567",
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001888-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let advResponse ={
            serviceUuids : "00001889-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : 1789,
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001889-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let gattServer =bluetooth.BLE.createGattServer();
        gattServer.startAdvertising(setting,advData,advResponse);
        gattServer.stopAdvertising();
        console.info('[bluetooth_js] BLE advertising end');
        done();
    })


     /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_0500
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_0500', 0, async function (done) {
        console.info('[bluetooth_js] BLE advertising start');
        await tryToEnableBt();
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
            interval:19,
            txPower:60,
            connectable:true,
        }
        let advData={
            serviceUuids : "00001888-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : "4567",
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001888-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let advResponse ={
            serviceUuids : "00001889-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : 1789,
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001889-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let gattServer =bluetooth.BLE.createGattServer();
        gattServer.startAdvertising(setting,advData,advResponse);
        gattServer.stopAdvertising();
        console.info('[bluetooth_js] BLE advertising end');
        done();
    })

     /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_0800
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_0800', 0, async function (done) {
        console.info('[bluetooth_js] BLE advertising start');
        await tryToEnableBt();
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
            interval:1000,
            txPower:-10,
            connectable:true,
        }
        let advData={
            serviceUuids : "00001888-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : "4567",
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001888-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let advResponse ={
            serviceUuids : "00001889-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : 1789,
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001889-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }

        let gattServer =bluetooth.BLE.createGattServer();
        gattServer.startAdvertising(setting,advData,advResponse);
        gattServer.stopAdvertising();
        console.info('[bluetooth_js] BLE advertising end');
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_0900
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_0900', 0, async function (done) {
        console.info('[bluetooth_js] BLE advertising start');
        await tryToEnableBt();
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
            interval:1000,
            txPower:-127,
            connectable:true,
        }
        let advData={
            serviceUuids : "00001888-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : "4567",
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001888-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let advResponse ={
            serviceUuids : "00001889-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : 1789,
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001889-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let gattServer =bluetooth.BLE.createGattServer();
        gattServer.startAdvertising(setting,advData,advResponse);
        gattServer.stopAdvertising();
        console.info('[bluetooth_js] BLE advertising end');
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_1000
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_1000', 0, async function (done) {
        console.info('[bluetooth_js] BLE advertising start');
        await tryToEnableBt();
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
            interval:1000,
            txPower:1,
            connectable:true,
        }
        let advData={
            serviceUuids : "00001888-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : "4567",
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001888-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let advResponse ={
            serviceUuids : "00001889-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : 1789,
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001889-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let gattServer =bluetooth.BLE.createGattServer();
        gattServer.startAdvertising(setting,advData,advResponse);
        gattServer.stopAdvertising();
        console.info('[bluetooth_js] BLE advertising end');
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_1100
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_1100', 0, async function (done) {
        console.info('[bluetooth_js] BLE advertising start');
        await tryToEnableBt();
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
            interval:1000,
            txPower:10,
            connectable:true,
        }
        let advData={
            serviceUuids : "00001888-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : "4567",
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001888-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let advResponse ={
            serviceUuids : "00001889-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : 1789,
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001889-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let gattServer =bluetooth.BLE.createGattServer();
        gattServer.startAdvertising(setting,advData,advResponse);
        gattServer.stopAdvertising();
        console.info('[bluetooth_js] BLE advertising end');
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_1200
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_1200', 0, async function (done) {
        console.info('[bluetooth_js] BLE advertising start');
        await tryToEnableBt();
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
            interval:1000,
            txPower:-130,
            connectable:true,
        }
        let advData={
            serviceUuids : "00001888-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : "4567",
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001888-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let advResponse ={
            serviceUuids : "00001889-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : 1789,
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001889-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let gattServer =bluetooth.BLE.createGattServer();
        gattServer.startAdvertising(setting,advData,advResponse);
        gattServer.stopAdvertising();
        console.info('[bluetooth_js] BLE advertising end');
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_1400
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_1400', 0, async function (done) {
        console.info('[bluetooth_js] BLE advertising start');
        await tryToEnableBt();
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
            interval:1000,
            txPower:1,
            connectable:false,
        }
        let advData={
            serviceUuids : "00001888-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : "4567",
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001888-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let advResponse ={
            serviceUuids : "00001889-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : 1789,
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001889-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let gattServer =bluetooth.BLE.createGattServer();
        gattServer.startAdvertising(setting,advData,advResponse);
        gattServer.stopAdvertising();
        console.info('[bluetooth_js] BLE advertising end');
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_1500
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_1500', 0, async function (done) {
        console.info('[bluetooth_js] BLE advertising start');
        await tryToEnableBt();
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
            interval:1000,
            txPower:-70,
            connectable:true,
        }
        let advData={
            serviceUuids : "00001888-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : "4567",
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001888-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let advResponse ={
            serviceUuids : "00001889-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : 1789,
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001889-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let gattServer =bluetooth.BLE.createGattServer();
        gattServer.startAdvertising(setting,advData,advResponse);
        gattServer.stopAdvertising();
        console.info('[bluetooth_js] BLE advertising end');
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_1600
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_1600', 0, async function (done) {
        console.info('[bluetooth_js] BLE advertising start');
        await tryToEnableBt();
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
            interval:1000,
            txPower:-70,
            connectable:true,
        }
        let advData={
            serviceUuids : "00001888-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : "4567",
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001888-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let advResponse ={
            serviceUuids : "00001889-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : 1789,
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001889-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let gattServer =bluetooth.BLE.createGattServer();
        gattServer.startAdvertising(setting,advData,advResponse);
        gattServer.stopAdvertising();
        console.info('[bluetooth_js] BLE advertising end');
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_1700
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_1700', 0, async function (done) {
        console.info('[bluetooth_js] BLE advertising start');
        await tryToEnableBt();
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
            interval:1000,
            txPower:-70,
            connectable:true,
        }
        let advData={
            serviceUuids : "00001888-0000-1000-8000-00805f9b34fb-010203",
            manufactureData : {
                manufactureId : "4567",
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001888-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let advResponse ={
            serviceUuids : "00001889-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : 1789,
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001889-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let gattServer =bluetooth.BLE.createGattServer();
        gattServer.startAdvertising(setting,advData,advResponse);
        console.info('[bluetooth_js] BLE advertising end');
        gattServer.stopAdvertising();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_1800
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_1800', 0, async function (done) {
        console.info('[bluetooth_js] BLE advertising start');
        await tryToEnableBt();
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
            interval:1000,
            txPower:-70,
            connectable:true,
        }
        let advData={
            serviceUuids : "" ,
            manufactureData : {
                manufactureId : "4567",
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001888-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let advResponse ={
            serviceUuids : "00001889-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : 1789,
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001889-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let gattServer =bluetooth.BLE.createGattServer();
        gattServer.startAdvertising(setting,advData,advResponse);
        gattServer.stopAdvertising();
        console.info('[bluetooth_js] BLE advertising end');
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_1900
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_1900', 0, async function (done) {
        console.info('[bluetooth_js] BLE advertising start');
        await tryToEnableBt();
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
            interval:1000,
            txPower:-70,
            connectable:true,
        }
        let advData={
            serviceUuids : "00001888-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : "4567",
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001888-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let advResponse ={
            serviceUuids : "00001889-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : 1789,
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001889-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let gattServer =bluetooth.BLE.createGattServer();
        gattServer.startAdvertising(setting,advData,advResponse);
        gattServer.stopAdvertising();
        console.info('[bluetooth_js] BLE advertising end');
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_2000
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_2000', 0, async function (done) {
        console.info('[bluetooth_js] BLE advertising start');
        await tryToEnableBt();
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
            interval:1000,
            txPower:-70,
            connectable:true,
        }
        let advData={
            serviceUuids : "00001888-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : "4567",
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "",
                serviceValue : "",
            }
        }
        let advResponse ={
            serviceUuids : "00001889-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : 1789,
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001889-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let gattServer =bluetooth.BLE.createGattServer();
        gattServer.startAdvertising(setting,advData,advResponse);
        gattServer.stopAdvertising();
        console.info('[bluetooth_js] BLE advertising end');
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_2400
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AdvertiseData_2400', 0, async function (done) {
        console.info('[bluetooth_js] BLE advertising start');
        await tryToEnableBt();
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
            interval:1000,
            txPower:-70,
            connectable:true,
        }
        let advData={
            serviceUuids : "00001888-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : "4567",
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001888-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let advResponse ={
            serviceUuids : "00001889-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : 1789,
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001889-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let gattServer =bluetooth.BLE.createGattServer();
        gattServer.startAdvertising(setting,advData,advResponse);
        gattServer.stopAdvertising();
        console.info('[bluetooth_js] BLE advertising end');
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_StartAdvertise_0200
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_StartAdvertise_0200', 0, async function (done) {
        console.info('[bluetooth_js] BLE advertising start');
        await tryToEnableBt();
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
            interval:1000,
            txPower:-70,
            connectable:true,
        }
        let advData={
            serviceUuids : "00001888-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : "4567",
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001888-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        let advResponse ={
            serviceUuids : "00001889-0000-1000-8000-00805f9b34fb",
            manufactureData : {
                manufactureId : 1789,
                manufactureValue : manufactureValueBuffer.buffer,
            },
            serviceData :{
                serviceUuid : "00001889-0000-1000-8000-00805f9b34fb",
                serviceValue : serviceValueBuffer.buffer,
            }
        }
        for(let i = 0;i<10;i++)
        {
              let gattServer =bluetooth.BLE.createGattServer();
              gattServer.startAdvertising(setting,advData,advResponse);
              gattServer.stopAdvertising();
              console.info('[bluetooth_js] BLE advertising 第'+  JSON.stringify(i) +'次 end');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_StartAdvertise_0400
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_StartAdvertise_0400', 0, async function (done) {
        console.info('[bluetooth_js] BLE advertising start');
        await tryToEnableBt();
        let gattServer =bluetooth.BLE.createGattServer();
        gattServer.stopAdvertising();
        done();
    })
  })
}
