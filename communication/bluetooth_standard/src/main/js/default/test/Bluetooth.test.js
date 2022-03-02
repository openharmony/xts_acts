/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'



var SppType = {
    SPP_RFCOMM : 0
}

var MatchMode = {
    MATCH_MODE_AGGRESSIVE : 1,
    MATCH_MODE_STICKY : 2
}

var MajorClass = {
        MAJOR_MISC : 0x0000,
        MAJOR_COMPUTER : 0x0100,
        MAJOR_PHONE : 0x0200,
        MAJOR_NETWORKING : 0x0300,
        MAJOR_AUDIO_VIDEO : 0x0400,
        MAJOR_PERIPHERAL : 0x0500,
        MAJOR_IMAGING : 0x0600,
        MAJOR_WEARABLE : 0x0700,
        MAJOR_TOY : 0x0800,
        MAJOR_HEALTH : 0x0900,
        MAJOR_UNCATEGORIZED : 0x1F00
    }

describe('bluetoothhostTest', function() {

    var gattServer = null;
    var gattClient = null;
    beforeAll(function () {
        console.info('beforeAll called')
        gattServer = bluetooth.BLE.createGattServer();
        setTimeout(function(){
            console.debug('==createGattServer==timeout')
        },5000);
        console.info('[bluetooth_js] gattServer beforeAll is:' + JSON.stringify(gattServer));
        console.info('[bluetooth_js] gattServer type beforeAll is:' + gattServer);

        gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
        setTimeout(function(){
            console.debug('==createGattClientDevice==timeout')
        },5000);
        console.info('[bluetooth_js] GattClientDevice beforeAll is:' + JSON.stringify(gattClient));
        console.info('[bluetooth_js] GattClientDevice type beforeAll is:' + gattClient);
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


    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_ENABLE_0001
     * @tc.name testEnableBluetooth
     * @tc.desc Test EnableBluetooth api by promise.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_enable_bluetooth_001', 0, async function (done) {
        console.info('[bluetooth_js] enable start');
        console.info('[bluetooth_js] enable register');
        await bluetooth.on("stateChange", onReceiveEvent);
        function onReceiveEvent(data) {
            console.info('[bluetooth_js] enable data = '+ JSON.stringify(data));
            if (data == bluetooth.BluetoothState.STATE_ON) {
                console.info('enable bluetooth');
                done();
            }
        }
        console.info('[bluetooth_js]state on:' + JSON.stringify(bluetooth.BluetoothState.STATE_ON));
        console.info('[bluetooth_js]off :' + JSON.stringify(bluetooth.BluetoothState.STATE_OFF));
        console.info('[bluetooth_js] turning on :'
                + JSON.stringify(bluetooth.BluetoothState.STATE_TURNING_ON));
        console.info('[bluetooth_js] turning off :'
                 + JSON.stringify(bluetooth.BluetoothState.STATE_TURNING_OFF));
        console.info('[bluetooth_js] ble turning on :'
                + JSON.stringify(bluetooth.BluetoothState.STATE_BLE_TURNING_ON));
        console.info('[bluetooth_js] ble on:'
                      + JSON.stringify(bluetooth.BluetoothState.STATE_BLE_ON));
        console.info('[bluetooth_js] ble turning off :'
                     + JSON.stringify(bluetooth.BluetoothState.STATE_BLE_TURNING_OFF));
        await bluetooth.enableBluetooth();
        expect(enable).assertEqual(true);
        console.info('bluetooth enable done');
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GET_STATE_0001
     * @tc.name testGetState
     * @tc.desc Test GetState api by promise.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_get_state', 0, async function (done) {
        console.info('[bluetooth_js] get state start');
        var state = bluetooth.getState();
        console.info('get bluetooth state end');
        console.info('[bluetooth_js] get bluetooth state result = '+ JSON.stringify(state));
        expect(state).assertEqual(bluetooth.BluetoothState.STATE_ON);
        done();
        await(3000);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_SET_LOCALNAME_0001
     * @tc.name testClassicSetLocalName
     * @tc.desc Test ClassicSetLocalName api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_set_local_name', 0, async function (done) {
        console.info('[bluetooth_js] set localname start');
        var name = bluetooth.setLocalName('bluetooth_test');
        console.info('[bluetooth_js] appInfoTest enable bluetooth result = '+ JSON.stringify(name));
        expect(name).assertEqual(true);
        console.info('[bluetooth_js] set localname end');
        done();
        await(3000);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_PAIR_DEVICE_0001
     * @tc.name testClassicPairDevice
     * @tc.desc Test ClassicPairDevice api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNACATION_bluetooth_DEVICE_JS_PAIR_DEVICE_0001', 0, async function (done) {
        console.info('[bluetooth_js] pair device start');
        await bluetooth.on("pinRequired", onReceiveEvent)
        await bluetooth.on("bondStateChange", onReceivePairStateEvent)
        var device;
        function onReceiveEvent(data) {
            console.info('[bluetooth_js] pinRequired'+ JSON.stringify(data));
            bluetooth.setDevicePairingConfirmation(data,false);
            console.info('[bluetooth_js] pinRequired deviceId'+ data.deviceId);
            console.info('[bluetooth_js] pinRequired pinCode'+ data.pinCode);
        }
        function onReceivePairStateEvent(data) {
            console.info('[bluetooth_js] pair state  = '+ JSON.stringify(data))
            if (data == 0) {
                done();
            }
        }
        var enable = bluetooth.pairDevice("32:15:00:19:42:F6")
        console.info("[bluetooth_js] pairDevice result is:" + JSON.stringify(result));
        expect(JSON.stringify(result)).assertTrue();
        setTimeout(function(){
            console.debug('====bluetooth_classic_pair_device====timeout')
        },5000);
        console.info('[bluetooth_js] pair device end');
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_START_PAIR_0001
     * @tc.name testStartpair
     * @tc.desc Test Startpair api by promise.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_Startpair_test_001', 0, function () {
        console.info('[bluetooth_js] Startpair test start ...');
        var result = bluetooth.pairDevice("32:15:00:19:42:F6");
        console.info("[bluetooth_js] onStartpair -> " + JSON.stringify(result));
        expect(result).assertFalse();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GET_LOCALNAME_0001
     * @tc.name testClassicGetLocalName
     * @tc.desc Test ClassicGetLocalName api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_get_local_name', 0, async function (done) {
        console.info('[bluetooth_js] get localName start');
        var localName = bluetooth.getLocalName();
        console.info('[bluetooth_js] get local Name result = ' + JSON.stringify(localName));
        expect(localName).assertEqual('bluetooth_test');
        console.info('[bluetooth_js] get localName end');
        done();
        await(3000);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_SET_BLUETOOTH_SCAN_MODE_0001
     * @tc.name testClassicSetBluetoothScanMode
     * @tc.desc Test ClassicSetBluetoothScanMode api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_set_scan_mode', 0, async function (done) {
        console.info('[bluetooth_js] set scan mode start');
        var result = bluetooth.setBluetoothScanMode(1,10000);
        console.info('[bluetooth_js] set bluetooth scan mode result ' + JSON.stringify(result));
        console.info('[bluetooth_js] low power :'
                      + JSON.stringify(bluetooth.ScanDuty.SCAN_MODE_LOW_POWER));
        console.info('[bluetooth_js] balanced :'
                      + JSON.stringify(bluetooth.ScanDuty.SCAN_MODE_BALANCED));
        console.info('[bluetooth_js] low latency:' 
                  + JSON.stringify(bluetooth.ScanDuty.SCAN_MODE_LOW_LATENCY));
        expect(result).assertEqual(true);
        done();
        await(3000);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GET_BLUETOOTH_SCAN_MODE_0001
     * @tc.name testClassicGetBluetoothScanMode
     * @tc.desc Test ClassicGetBluetoothScanMode api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_get_scan_mode', 0, async function (done) {
        console.info('[bluetooth_js] get scan mode start');
        var result = bluetooth.setBluetoothScanMode(1,10000);

        console.info('[bluetooth_js] get scan mode result1 = ' + JSON.stringify(result));
        expect(result).assertEqual(true);
        var scanMode = bluetooth.getBluetoothScanMode();
        console.info('[bluetooth_js] get scan mode result2 = ' + JSON.stringify(scanMode));
        expect(scanMode).assertEqual(1);
        console.info('[bluetooth_js] mode1:' + JSON.stringify(bluetooth.ScanMode.SCAN_MODE_NONE));
        console.info('[bluetooth_js] mode2:'
                     + JSON.stringify(bluetooth.ScanMode.SCAN_MODE_CONNECTABLE));
        console.info('[bluetooth_js] mode3:'
                     + JSON.stringify(bluetooth.ScanMode.SCAN_MODE_GENERAL_DISCOVERABLE));
        console.info('[bluetooth_js] mode4:'
                      + JSON.stringify(bluetooth.ScanMode.SCAN_MODE_LIMITED_DISCOVERABLE));
        console.info('[bluetooth_js] mode5:'
                   + JSON.stringify(bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_GENERAL_DISCOVERABLE));
        console.info('[bluetooth_js] mode6:'
              + JSON.stringify(bluetooth.ScanMode.SCAN_MODE_CONNECTABLE_LIMITED_DISCOVERABLE));
        console.info('[bluetooth_js] get scan mode end');
        done();
        await(3000);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GET_BT_CONNECT_STATE_0001
     * @tc.name testClassicGetBtConnectionState
     * @tc.desc Test ClassicGetBtConnectionState api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_get_connection', 0, async function (done) {
        console.info('[bluetooth_js] get connection state start');
        var connState = bluetooth.getBtConnectionState();
        console.info('[bluetooth_js] get bt connection state result' + JSON.stringify(connState));
        expect(connState).assertEqual(bluetooth.ProfileConnectionState.STATE_DISCONNECTED);
        console.info('[bluetooth_js] pr1:'
                     + JSON.stringify(bluetooth.ProfileConnectionState.STATE_DISCONNECTED));
        console.info('[bluetooth_js] pr2:'
                   + JSON.stringify(bluetooth.ProfileConnectionState.STATE_CONNECTING));
        console.info('[bluetooth_js] pr3:'
                     + JSON.stringify(bluetooth.ProfileConnectionState.STATE_CONNECTED));
        console.info('[bluetooth_js] pr4:'
                       + JSON.stringify(bluetooth.ProfileConnectionState.STATE_DISCONNECTING));
        console.info('[bluetooth_js] get connection end');
        done();
        await(3000);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_START_BLUETOOTH_DISCOVERY_0001
     * @tc.name testClassicStartBluetoothDiscovery
     * @tc.desc Test ClassicStartBluetoothDiscovery api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_start_discovery', 0, async function (done) {
        console.info('[bluetooth_js] discovery start');
        await bluetooth.on("bluetoothDeviceFind", onReceiveEvent)
        console.info('[bluetooth_js] DeviceFind register');
        function onReceiveEvent(data) {
            console.info('[bluetooth_js] start discovery bluetoothDeviceFind '+ JSON.stringify(data))
            console.info("[bluetooth_js] bluetooth discovery length -> " + data.length);
            expect(data.length).assertLarger(0);
            done();
        }
        await bluetooth.startBluetoothDiscovery();
        console.info('[bluetooth_js] discovery end');
        done();
        await(3000);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_STOP_BLUETOOTH_DISCOVERY_0001
     * @tc.name testClassicStopBluetoothDiscovery
     * @tc.desc Test ClassicStopBluetoothDiscovery api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_stop_discovery', 0, async function (done) {
        console.info('[bluetooth_js] stop discovery start');
        bluetooth.stopBluetoothDiscovery();
        await bluetooth.off("bluetoothDeviceFind", onReceiveEvent)
        function onReceiveEvent(data) {
            console.info('[bluetooth_js] stop bluetooth discovery result = '+ JSON.stringify(data));
            expect(data).assertNull();
            done();
        }
        console.info('[bluetooth_js] stop discovery end');
        done();
        await(3000);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GET_PAIRED_DEVICES_0001
     * @tc.name testClassicGetPairedDevices
     * @tc.desc Test ClassicGetPairedDevices api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_get_paired_devices', 0, async function (done) {
        console.info('[bluetooth_js] get paired devices start');
        var devices = bluetooth.getPairedDevices();
        console.info('[bluetooth_js] get paired devices result:' + JSON.stringify(devices));
        console.info("[bluetooth_js] getConnectedDevices length:" + devices.length);
        expect(devices.length).assertEqual(0);
        console.info('[bluetooth_js] get paired devices end');
        done();
        await(3000);
    })


    /**
     * @tc.number SUB_COMMUNACATION_bluetoothble_DEVICE_JS_GET_CONNECTED_BLEDEVICES_0001
     * @tc.name testGetConnectedBLEDevices
     * @tc.desc Test getConnectedBLEDevices api .
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_getConnectedBLEDevices_test_001', 0, async function (done) {
        console.info('[bluetooth_js] getConnectedBLEDevices test start ...');
        var result = bluetooth.BLE.getConnectedBLEDevices();
        console.info("[bluetooth_js] getConnectedBLEDevices:" + JSON.stringify(result));
        console.info("[bluetooth_js] getConnectedBLEDevices length:" + result.length);
        expect(result.length).assertEqual(0);
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetoothble_DEVICE_JS_STOP_BLE_SCAN_0001
     * @tc.name testStopBLEScan
     * @tc.desc Test StopBLEScan api .
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetoothble_stopBLEScan_test_001', 0, function () {
        console.info('[bluetooth_js] StopBLEScan test start ...');
        try{
            var result = bluetooth.BLE.stopBLEScan();
            console.info("[bluetooth_js] StopBLEScan:" + JSON.stringify(result));
            expect(result).assertNull();
            console.info("[bluetooth_js] StopBLEScan end");
        }catch(error){
            expect(null).assertFail();
            console.info("[bluetooth_js] StopBLEScan err:" + JSON.stringify(error));
        }
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetoothble_DEVICE_JS_CREATE_GATT_SERVER_0002
     * @tc.name testCreateGattServer
     * @tc.desc Test CreateGattServer api .
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_createGattServer_test_001', 0, function () {
        console.info('[bluetooth_js] createGattServer test start ...');
        var result = bluetooth.BLE.createGattServer();
        console.info("[bluetooth_js] createGattServer:" + JSON.stringify(result));
        var resultLength = Object.keys(result).length;
        console.info("[bluetooth_js] createGattServer length:" + resultLength);
        expect(resultLength).assertEqual(1);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetoothble_DEVICE_JS_GET_CONNECTED_BLEDEVICES_0001
     * @tc.name testGetConnectedBLEDevices
     * @tc.desc Test getConnectedBLEDevices api .
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_getConnectedBLEDevices_test_001', 0, async function (done) {
        console.info('[bluetooth_js] getConnectedBLEDevices test start ...');
        var result = bluetooth.BLE.getConnectedBLEDevices();
        console.info("[bluetooth_js] getConnectedBLEDevices:" + JSON.stringify(result));
        console.info("[bluetooth_js] getConnectedBLEDevices length:" + result.length);
        expect(result.length).assertEqual(0);
        done();
        await(3000);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_START_BLESCAN_NO_FILTER_0001
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_ble_start_scan_no_filter', 0, async function (done) {
        console.info('[bluetooth_js] BLE scan start');
        await bluetooth.BLE.on("BLEDeviceFind", onReceiveEvent)
        function onReceiveEvent(data) {
            console.info('[bluetooth_js] BLE scan device find result2 = '+ JSON.stringify(data))
            expect(data.length).assertLarger(0);
            console.info('[bluetooth_js] BLEDevFind deviceId:' + data.deviceId);
            console.info('[bluetooth_js] BLEDevFind rssi:' + data.rssi);
            console.info('[bluetooth_js] BLEDevFind data: ' + data.data);
            done()
        }
        bluetooth.BLE.startBLEScan(
            [{}],
            {
                interval: 500,
                dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_POWER,
                matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
            }
        );
        console.info('[bluetooth_js] BLE scan2 end');
        done();
        await(3000);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_START_BLESCAN_WITHOUT_PARAM_0001
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_ble_start_scan_without_param', 0, async function (done) {
        console.info('[bluetooth_js] BLE scan start without scan options start');
        await bluetooth.BLE.on("BLEDeviceFind", onReceiveEvent)
        function onReceiveEvent(data) {
            console.info('[bluetooth_js] BLE scan device find result3 = '+ JSON.stringify(data))
            expect(data.length).assertLarger(0);
            bluetooth.BLE.stopBLEScan();
            done();
        }
        bluetooth.BLE.startBLEScan([{}]);
        console.info('[bluetooth_js] BLE scan start end');
        done();
        setTimeout(function(){
            console.debug('========bluetooth_ble_stop_scan=======timeout')
        },1000);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_STOP_BLESCAN_0001
     * @tc.name testClassicStopBLEScan
     * @tc.desc Test ClassicStopBLEScan api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_ble_stop_scan', 0, async function (done) {
        console.info('[bluetooth_js] BLE stop scan start');
        await bluetooth.off("BLEDeviceFind", onReceiveEvent)
        function onReceiveEvent(data) {
            console.info('[bluetooth_js] BLE scan device find result4 ='+ JSON.stringify(data))
        }
        var result = bluetooth.BLE.stopBLEScan();
        console.info("[bluetooth_js] onStopBLEScan -> " + JSON.stringify(result));
        expect(result).assertNull();
        console.info('[bluetooth_js] BLE stop scan end');
        done();
        setTimeout(function(){
            console.debug('========bluetooth_ble_stop_scan=======timeout')
        },1000);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_START_ADVERTISING_0001
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_ble_start_advertising', 0, async function (done) {
        console.info('[bluetooth_js] BLE advertising start');
        var manufactureValueBuffer = new Uint8Array(4);
        manufactureValueBuffer[0] = 1;
        manufactureValueBuffer[1] = 2;
        manufactureValueBuffer[2] = 3;
        manufactureValueBuffer[3] = 4;

        var serviceValueBuffer = new Uint8Array(4);
        serviceValueBuffer[0] = 4;
        serviceValueBuffer[1] = 6;
        serviceValueBuffer[2] = 7;
        serviceValueBuffer[3] = 8;
        console.info('manufactureValueBuffer = '+ JSON.stringify(manufactureValueBuffer))
        console.info('serviceValueBuffer = '+ JSON.stringify(serviceValueBuffer))
        var gattServer = bluetooth.BLE.createGattServer()
        let setting ={
            interval:150,
            txPower:60,
            connectable:true,
        };
        for (var key in setting ){
            console.info('[bluetooth_js] startAdv:' +setting[key]);
        }

        let advData = {
            serviceUuids:["12"],
            manufactureData:[{manufactureId:4567,manufactureValue:manufactureValueBuffer.buffer}],
            serviceData:[{serviceUuid:"1234",serviceValue:serviceValueBuffer.buffer}],
        };
        for (var key in advData ){
            console.info('[bluetooth_js] startAdv:' +advData[key]);
        }

        await gattServer.startAdvertising(setting,advData,{
            serviceUuids:["12"],
            manufactureData:[{
                manufactureId:1789,
                manufactureValue:manufactureValueBuffer.buffer
            }],
            serviceData:[{
                serviceUuid:"1794",
                serviceValue:serviceValueBuffer.buffer
            }],
        });
        console.info('[bluetooth_js] BLE start advertising end');
        done();
        setTimeout(function(){
            console.debug('====bluetooth_ble_start_advertising====timeout')
        },5000);
        await(3000);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_STOP_ADVERTISING_0001
     * @tc.name testStopAdvertising
     * @tc.desc Test StopAdvertising api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_ble_stop_advertising', 0, async function (done) {
        console.info('[bluetooth_js] BLE stop advertising start');
        var gattServer = bluetooth.BLE.createGattServer();
        gattServer.stopAdvertising();
        console.info('[bluetooth_js] BLE stop advertising end');
        done();
        setTimeout(function(){
            console.debug('====bluetooth_ble_stop_advertising====timeout')
        },1000);
        await(3000);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GET_DEVICE_NAME_CALLBACK_0001
     * @tc.name testGetDeviceName
     * @tc.desc Test GetDeviceName api by callback.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_ble_get_device_name_callback_001', 0, async function (done) {
        console.info('[bluetooth_js] get device name1 callback start');
        var gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
        var deviceName = gattClient.getDeviceName((err, data)=> {
            console.info('[bluetooth_js] device name err1 ' + JSON.stringify(err));
            console.info('[bluetooth_js] device name1' + JSON.stringify(data));
            done();
        })
        console.info('[bluetooth_js] get device name callback end');
        setTimeout(function(){
            console.debug('=====bluetooth_ble_get_device_name_callback1====timeout')
        },1000);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GET_DEVICE_NAME_PROMISE_0001
     * @tc.name testGetDeviceName
     * @tc.desc Test GetDeviceName api by promise.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_ble_get_device_name_promise', 0, async function (done) {
        console.info('BLE get device name promise start');
        var gattClient = gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
        var deviceName = gattClient.getDeviceName().then((data) => {
            console.info('[bluetooth_js] device name' + JSON.stringify(data))
            done()
        })
        console.info('BLE get device name promise end')
        setTimeout(function(){
            console.debug('========bluetooth_ble_stop_advertising=======timeout')
        },1000);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GET_RSSI_VALUE_CALLBACK
     * @tc.name testGetRssiValue
     * @tc.desc Test GetRssiValue api by callback.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_ble_read_rssi', 0, async function (done) {
        console.info('[bluetooth_js] BLE get rssi1 start');
        var gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
        await gattClient.getRssiValue((err, data)=> {
            console.info('[bluetooth_js] rssi err:' + JSON.stringify(err));
            console.info('[bluetooth_js] rssi value:' + JSON.stringify(data));
            expect(data).assertNull();
            done();
        });
        console.info('[bluetooth_js] BLE read rssi1 end');
        setTimeout(function(){
            console.debug('========bluetooth_ble_read_rssi=======timeout')
        },1000);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GET_RSSI_VALUE_PROMISE_0001
     * @tc.name testGetRssiValue
     * @tc.desc Test GetRssiValue api by promise.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_ble_read_rssi_promise', 0, async function (done) {
        console.info('[bluetooth_js] BLE get rssi start');
        var gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
        await gattClient.getRssiValue().then((data) => {
            if (data != null) {
                console.info('[bluetooth_js] rssi' + JSON.stringify(data));
                done();
                expect(true).assertEqual(true);
            } else {
                console.info('[bluetooth_js] BLE read rssi ' + JSON.stringify(data));
                var rssiLength = Object.keys(data).length;
                console.info("[bluetooth_js] ble rssi_length -> " + rssiLength);
                expect(rssiLength).assertEqual(0);
                done();
            }
        }).catch(err => {
            console.error(`bluetooth getDeviceName has error: ${err}`);
            expect(true).assertEqual(true);
            done();
        });
        setTimeout(function(){
        console.debug('====bluetooth_ble_stop_advertising====timeout')
        },1000);
        await(3000);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_DISABLE_BLUETOOTH_0001
     * @tc.name testDisableBluetooth
     * @tc.desc Test DisableBluetooth api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_disable_bluetooth', 0, async function (done) {
        console.info('[bluetooth_js] disable bluetooth start');
        bluetooth.off("pinRequired", onPinRequiredReceiveEvent)
        function onPinRequiredReceiveEvent(data) {
            console.info('[bluetooth_js] pin required  = '+ JSON.stringify(data));
        }

        bluetooth.off("bondStateChange", onBoneStateReceiveEvent)
        function onBoneStateReceiveEvent(data) {
            console.info('[bluetooth_js] bondStateChange  = '+ JSON.stringify(data));
            console.info('[bluetooth_js] bondStateChange deviceId: ' + data.deviceId);
            console.info('[bluetooth_js] bondStateChange state: ' + data.state);
        }
        console.info('[bluetooth_js]INVALID' + JSON.stringify(bluetooth.BondState.BOND_STATE_INVALID));
        console.info('[bluetooth_js]BONDING' + JSON.stringify(bluetooth.BondState.BOND_STATE_BONDING));
        console.info('[bluetooth_js]BONDED' + JSON.stringify(bluetooth.BondState.BOND_STATE_BONDED));
        bluetooth.off("stateChange", onReceiveEvent);
        function onReceiveEvent(data) {
            console.info('[bluetooth_js] enable bluetooth data = '+ JSON.stringify(data));
            done();
        }
        var enable = bluetooth.disableBluetooth();
        setTimeout(function(){
            console.debug('========bluetooth_classic_disable_bluetooth=======timeout')
        }, 1000);
        console.info('[bluetooth_js] disable bluetooth end');
        await(3000);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GATT_CONNRCT_0001
     * @tc.name testConnect
     * @tc.desc Test Connect api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_gatt_connect', 0, function (done) {
        console.info('[bluetooth_js] gatt connect start');
        gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
        let ret = gattClient.connect();
        console.info('[bluetooth_js] gatt connect ret : ' + ret);
        expect(ret).assertEqual(false);
        console.info('[bluetooth_js] gatt connect end');
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GATT_DISCONNRCT_0001
     * @tc.name testDisConnect
     * @tc.desc Test DisConnect api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_gatt_disconnect', 0, function (done) {
        console.info('[bluetooth_js] gatt disconnect start');
        let ret = gattClient.disconnect();
        console.info('[bluetooth_js] gatt disconnect ret:' + ret);
        expect(ret).assertEqual(false);
        console.info('[bluetooth_js] gatt disconnect end');
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GATT_GETSERVICES_CALLBACK_0001
     * @tc.name testGetServices
     * @tc.desc Test GetServices api by callback.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_ble_get_services_callback_001', 0, async function (done) {
        console.info('[bluetooth_js] getServices callback start');
        var gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
        var services = gattClient.getServices((err, data)=> {
            console.info('[bluetooth_js] device name err1 ' + JSON.stringify(err));
            console.info('[bluetooth_js] device name1' + JSON.stringify(data));
            done();
        })
        console.info('[bluetooth_js] getServices callback end');
        setTimeout(function(){
            console.debug('=====bluetooth_ble_getServices_callback====timeout')
        },1000);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GATT_GETSERVICES_PROMISE_0001
     * @tc.name testGetServices
     * @tc.desc Test GetServices api by promise.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_gatt_getServices_promise', 0, async function (done) {
        console.info('[bluetooth_js] getServices promise start');
        var gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
        await gattClient.getServices().then((object) => {
            if (object != null) {
                console.info('[bluetooth_js] getServices is null');
                expect(true).assertEqual(true);
            } else {
                console.info('[bluetooth_js] getServices is successfully');
                console.info('[bluetooth_js] getServices data:' + JSON.stringify(object));
                expect(null).assertFail();
            }
            done();
        }).catch(err => {
            console.error(`bluetooth getServices has error: ${err}`);
            expect(true).assertEqual(true);
            done();
        });
        await(3000);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GATT_READ_CHARA_VALUE_0001
     * @tc.name testReadCharacteristicValue
     * @tc.desc Test ReadCharacteristicValue api by promise.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_gatt_readCharacteristicValue', 0, async function (done) {
        console.info('[bluetooth_js] readCharacteristicValue start');

        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;

        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;

        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 32;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            characteristicValue: arrayBufferCCC, descriptors:descriptors};
        for (var key in characteristic ){
            console.info('[bluetooth_js] readCharValue:' +characteristic[key]);
        }
        gattClient.readCharacteristicValue(characteristic).then((object) => {
            if (object != null) {
                console.info('[bluetooth_js] bluetooth BLECharacteristic is null');
                expect(true).assertEqual(true);
            } else {
                console.info('[bluetooth_js] BLECharacteristic uuid is successfully');
                console.info('[bluetooth_js] readCharacValue data:' + JSON.stringify(data));
                expect(null).assertFail();
            }
            done();
        }).catch(err => {
            console.error(`bluetooth readCharacteristicValue has error: ${err}`);
            expect(true).assertEqual(true);
            done();
        });
        await(3000);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GATT_READ_DESCRI_VALUE_0001
     * @tc.name testReadDescriptorValue
     * @tc.desc Test ReadDescriptorValue api by promise.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_gatt_readDescriptorValue', 0, function (done) {
        console.info('[bluetooth_js] readDescriptorValue start');
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        gattClient.readDescriptorValue(descriptor).then((object) => {
            if (object != null) {
                console.info('[bluetooth_js] BLEDescriptor is null');
                expect(true).assertEqual(true);
            } else {
                console.info('[bluetooth_js] BLEDescriptor uuid is successfully');
                console.info('[bluetooth_js] BLEDescriptor data:' + JSON.stringify(object));
                expect(null).assertFail();
            }
            done();
        }).catch(err => {
            console.error(`bluetooth readDescriptorValue has error: ${err}`);
            expect(true).assertEqual(true);
            done();
        });
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GATT_WRITE_CHARACT_VALUE_0001
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test WriteCharacteristicValue api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_gatt_writeCharacteristicValue', 0, function (done) {
        console.info('[bluetooth_js] writeCharacteristicValue start');
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 32;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            characteristicValue: arrayBufferCCC, descriptors:descriptors};
        for (var key in characteristic ){
            console.info('[bluetooth_js] writeCharValue:' +characteristic[key]);
        }

        let ret = gattClient.writeCharacteristicValue(characteristic);
        console.info('[bluetooth_js] bluetooth writeCharacteristicValue ret : ' + ret);
        expect(ret).assertEqual(false);
        console.info('[bluetooth_js] writeCharacteristicValue end');
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GATT_WRITE_DESC_VALUE_0001
     * @tc.name testWriteDescriptorValue
     * @tc.desc Test WriteDescriptorValue api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_gatt_writeDescriptorValue', 0, function (done) {
        console.info('[bluetooth_js] writeDescriptorValue start');
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        let ret = gattClient.writeDescriptorValue(descriptor);
        console.info('[bluetooth_js] bluetooth writeDescriptorValue ret : ' + ret);
        expect(ret).assertEqual(false);
        console.info('[bluetooth_js] writeDescriptorValue end');
        done();

    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GATT_SET_BLE_MTUSIZE_0001
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test SetBLEMtuSize api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_gatt_setBLEMtuSize', 0, function (done) {
        console.info('[bluetooth_js] setBLEMtuSize start');
        let ret = gattClient.setBLEMtuSize(128);
        console.info('[bluetooth_js] bluetooth setBLEMtuSize ret : ' + ret);
        expect(ret).assertEqual(false);
        console.info('[bluetooth_js] setBLEMtuSize end');
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GATT_SET_NOTIFY_CHARA_CHANGED_0001
     * @tc.name testSetNotifyCharacteristicChanged
     * @tc.desc Test SetNotifyCharacteristicChanged api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_gatt_setNotifyCharacteristicChanged', 0, function (done) {
        console.info('[bluetooth_js] setNotifyCharacteristicChanged start');
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let arrayBufferNotify = new ArrayBuffer(8);
        let descNotifyValue = new Uint8Array(arrayBufferNotify);
        descNotifyValue[0] = 1
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
            descriptorValue: arrayBuffer};
        let descriptorNotify = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB',
            descriptorValue: arrayBufferNotify};
        descriptors[0] = descriptor;
        descriptors[1] = descriptorNotify;
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 1;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            characteristicValue: arrayBufferCCC, descriptors:descriptors};
        let ret = gattClient.setNotifyCharacteristicChanged(characteristic, false);
        console.info('[bluetooth_js] setNotifyCharacteristicChanged ret:' + ret);
        expect(ret).assertEqual(false);
        console.info('[bluetooth_js] setNotifyCharacteristicChanged end');
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GATT_ADD_SERVICE_0001
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_gatt_addService', 0, function (done) {
        console.info('[bluetooth_js] addService start');
        gattServer = bluetooth.BLE.createGattServer();

        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;

        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB',
            descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;

        let characteristics = [];
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 1;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            characteristicValue: arrayBufferCCC, descriptors:descriptors};
        characteristics[0] = characteristic;

        let service = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            isPrimary: true, characteristics: characteristics, includeServices: []};
        for (var key in service ){
            console.info('[bluetooth_js] addService:' +service[key]);
        }
        let ret = gattServer.addService(service);
        console.info('[bluetooth_js] bluetooth addService ret : ' + ret);
        expect(ret).assertEqual(false);

        console.info('[bluetooth_js] addService end');
        done();

    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GATT_REMOVE_SERVICE_0001
     * @tc.name testRemoveService
     * @tc.desc Test RemoveService api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_gatt_removeService', 0, function (done) {
        console.info('[bluetooth_js] removeService start');
        gattServer = bluetooth.BLE.createGattServer();
        let ret = gattServer.removeService('00001810-0000-1000-8000-008000000000');
        console.info('[bluetooth_js] removeService ret : ' + ret);
        expect(ret).assertEqual(false);
        console.info('[bluetooth_js] removeService end');
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GATT_NOTIFY_CHARA_CHANGED_0001
     * @tc.name testNotifyCharacteristicChanged
     * @tc.desc Test NotifyCharacteristicChanged api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_gatt_notifyCharacteristicChanged', 0, function (done) {
        console.info('[bluetooth_js] notifyCharacteristicChanged start');
        let descriptors = [];
        let arrayBufferDesc = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBufferDesc);
        desValue[0] = 11;
        let arrayBufferNotifyDesc = new ArrayBuffer(8);
        let descNotifyValue = new Uint8Array(arrayBufferNotifyDesc);
        descNotifyValue[0] = 1
        let
            descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: desValue};
        let descriptorNotify = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB',
            descriptorValue: descNotifyValue};
        descriptors[0] = descriptor;
        descriptors[1] = descriptorNotify;

        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 1;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            characteristicValue: cccValue,
            descriptors:descriptors,confirm:'false'};
        for (var key in characteristic ){
            console.info('[bluetooth_js] notifyCharChanged:' + characteristic[key]);
        }
        let ret = gattServer.notifyCharacteristicChanged('00:00:00:00:00:00', characteristic);
        console.info('[bluetooth_js] notifyCharacteristicChanged ret : ' + ret);
        expect(ret).assertEqual(false);
        console.info('[bluetooth_js] notifyCharacteristicChanged end');
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GATT_SEND_RESPONSE_0001
     * @tc.name testSendResponse
     * @tc.desc Test SendResponse api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_gatt_sendResponse', 0, function (done) {
        console.info('[bluetooth_js] sendResponse start');
        let arrayBuffer = new ArrayBuffer(8);
        let value =  new Uint8Array(arrayBuffer);
        value[0] = 1;
        let serverResponse = {deviceId: '00:00:00:00:00', transId: 1,
        status: 0, offset: 0, value: arrayBuffer};
        for (var key in serverResponse ){
            console.info('[bluetooth_js] serverResponse:'+ serverResponse[key]);
        }
        let ret = gattServer.sendResponse(serverResponse);
        console.info('[bluetooth_js] sendResponse ret : ' + ret);
        expect(ret).assertEqual(false);
        console.info('[bluetooth_js] sendResponse end');
        done();

    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_SPP_LISTEN_0001
     * @tc.name testSppListen
     * @tc.desc Test SppListen api by callback.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_spp_listen', 0, function (done) {
        console.log("[bluetooth_js]: spp listen start");
        let sppOption = {uuid: '00001810-0000-1000-8000-00805F9B34FB',
            secure: false, type: 0};
        for (var key in sppOption ){
            console.info('[bluetooth_js] sppListen:'+ sppOption[key]);
        }
        bluetooth.sppListen('server1', sppOption, function(code, serverSocketNumber) {
            if (code.code == 0) {
                console.info('[bluetooth_js] code is success');
                console.info('[bluetooth_js] code is: ' + code.code);
                expect(true).assertEqual(true);
                done();
            } else {
                console.info('[bluetooth_js] code is failed');
                console.info('[bluetooth_js] code is: ' + code.code);
                expect(true).assertEqual(false);
                done();
            }
        });
        console.log("[bluetooth_js] spp listen end");
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_SPP_ACCEPT_0001
     * @tc.name testSppAccept
     * @tc.desc Test SppAccept api by callbck.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_spp_Accept', 0, function (done) {
        console.log("[bluetooth_js] spp accept start");
        bluetooth.sppAccept(-1, function(code, clientSocketNumber) {
            if (code.code == 0) {
                console.info('[bluetooth_js] code is success');
                console.info('[bluetooth_js] code is: ' + code.code);
                expect(true).assertEqual(true);
            } else {
                console.info('[bluetooth_js] code is failed');
                console.info('[bluetooth_js] code is: ' + code.code);
                expect(true).assertEqual(false);
            }
        });
        console.log("[bluetooth_js] spp accept end");
        done();

    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_SPP_CLOSE_SERVER_SOCKET_0001
     * @tc.name testSppCloseServerSocket
     * @tc.desc Test SppCloseServerSocket api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_spp_closeServerSocket', 0, function (done) {
        console.log("[bluetooth_js] spp closeServerSocket start");
        let ret = bluetooth.sppCloseServerSocket(-1);
        console.info('[bluetooth_js] bluetooth sppCloseServerSocket ret : ' + ret);
        expect(ret).assertEqual(false);
        console.log("[bluetooth_js] spp closeServerSocket end");
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_SPP_CONNECT_0001
     * @tc.name testSppConnect
     * @tc.desc Test SppConnect api by callback.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_spp_connect', 0, function (done) {
        console.info('[bluetooth_js] spp_connect start');
        let sppOption = {uuid: '00001810-0000-1000-8000-00805F9B34FB',
            secure: true, type: 0};
        bluetooth.sppConnect(55, sppOption, function(code, clientSocketNumber) {
            if (code.code == 0) {
                console.info('bluetooth code is success');
                expect(true).assertEqual(true);
            } else {
                console.info('bluetooth code is failed');
                expect(true).assertEqual(false);
            }
        });
        console.info('[bluetooth_js] spp_connect end');
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_SPP_WRITE_0001
     * @tc.name testSppWrite
     * @tc.desc Test SppWrite api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_spp_write', 0, function (done) {
        console.info('[bluetooth_js] spp write start');
        let arrayBuffer = new ArrayBuffer(8);
        let data =  new Uint8Array(arrayBuffer);
        data[0] = 123;
        let ret = bluetooth.sppWrite(-1, arrayBuffer);
        console.info('[bluetooth_js] bluetooth sppWrite ret : ' + ret);
        expect(ret).assertEqual(false);
        console.info('[bluetooth_js] spp write end');
        done();

    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetoothble_DEVICE_JS_CHARAC_READ_ON_0001
     * @tc.name testonCharacteristicReadOn
     * @tc.desc Test CharacteristicReadOn api .
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetoothble_CharacteristicReadOn_test_001', 0, function () {
        console.info('[bluetooth_js] CharacteristicReadOn test start');
        if (gattServer == null) {
            console.info("[bluetooth_js] BlePerManager: please click CreateGattServer first!");
        }
        gattServer.on('characteristicRead', (err, data) => {
            if (err) {
                console.info("[bluetooth_js] charaRead callback err:" + JSON.stringify(err));
            } else {
                console.info('[bluetooth_js] charRead callback data ->');
                console.info('[bluetooth_js] CharRedReq deviceId: ' + data.deviceId);
                console.info('[bluetooth_js] CharRedReq transId: ' + data.transId);
                console.info('[bluetooth_js] CharRedReq offset: ' + data.offset);
                console.info('[bluetooth_js] CharRedReq charUuid: ' + data.characteristicUuid);
                console.info('[bluetooth_js] CharRedReq serviceUuid: ' + data.serviceUuid);
                var serverResponse = {
                    "deviceId": data.deviceId,
                    "transId": data.transId,
                    "status": 0,
                    "offset": data.offset,
                    "value": str2ab("characteristic read response", data.offset),
                };
                var result = gattServer.sendResponse(serverResponse);
                console.info("[bluetooth_js] sendResponse  -> " + JSON.stringify(result));
                expect(JSON.stringify(result)).assertContain("true");
                console.info("[bluetooth_js] onBlePeripheralManagerClose .");
            }
        });
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetoothble_DEVICE_JS_CHARAC_WRITE_ON_0001
     * @tc.name testonCharacteristicwriteOn
     * @tc.desc Test CharacteristicwriteOn api .
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetoothble_CharacteristicwriteOn_test_001', 0, function () {
        console.info('[bluetooth_js] CharacteristicwriteOn test start ...');
        if (gattServer == null) {
            console.info("[bluetooth_js] Charwrite: please click CreateGattServer first!");
        }
        gattServer.on('characteristicWrite', (err, data) => {
            if (err) {
                console.info("[bluetooth_js] characteristic callback error" + JSON.stringify(err));
            } else {
                console.info('[bluetooth_js] characteristicWrite callback data ->');
                console.info('[bluetooth_js] CharWriReq deviceId: ' + data.deviceId);
                console.info('[bluetooth_js] CharWriReq transId: ' + data.transId);
                console.info('[bluetooth_js] CharWriReq offset: ' + data.offset);
                console.info('[bluetooth_js] CharWriReq isPrep: ' + data.isPrep);
                console.info('[bluetooth_js] CharWriReq chaticUuid: ' + data.characteristicUuid);
                console.info('[bluetooth_js] CharWriReq serviceUuid: ' + data.serviceUuid);
                console.info('[bluetooth_js] CharWriReq value: ' + data.value);
                console.info('[bluetooth_js] CharWriReq needRsp: ' + data.needRsp);
                if (data.value instanceof ArrayBuffer) {
                    console.log(`[bluetooth_js] value: ${ab2hex(data.value)}`)
                }
                console.info('[bluetooth_js]  characteristicUuid: ' + data.characteristicUuid);
                console.info('[bluetooth_js]  serviceUuid: ' + data.serviceUuid);
                if (data.needRsp == false) {
                    return;
                }
                console.log(`data.value is ArraryBuffer: ${ab2hex(data.value)}`)
                var serverResponse = {
                    "deviceId": data.deviceId,
                    "transId": data.transId,
                    "status": 0,
                    "offset": data.offset,
                    "value": data.value,
                };
                var result = gattServer.sendResponse(serverResponse);
                console.info("[bluetooth_js] sendResponse:" + JSON.stringify(result));
                expect(JSON.stringify(result)).assertContain("true");
                console.info("[bluetooth_js] characteristicWrite end");
            }
        });

    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_DESC_READ_ON_0001
     * @tc.name testDescriptorReadOn
     * @tc.desc Test DescriptorReadOn api .
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_descriptorRead_On_test_001', 0, async function (done) {
        try {
            console.info('[bluetooth_js] descriptorReadOn test start ...');
            if (gattServer == null) {
                console.info("[bluetooth_js] onAddServiceHelper: click onCreateGattServer first!");
            }
            gattServer.on('descriptorRead', function (data) {
                console.info("[bluetooth_js] DesRedon jsondata:" + JSON.stringify(data));
                console.info("[bluetooth_js] DesRedon data:" + data);
                expect(true).assertEqual(data !=null);
                console.info('[bluetooth_js] desRead callback data ->');
                console.info('[bluetooth_js] DesRedReq deviceId:' + data.deviceId);
                console.info('[bluetooth_js] DesRedReq transId:' + data.transId);
                console.info('[bluetooth_js] DesRedReq offset:' + data.offset);
                console.info('[bluetooth_js] DesRedReq desUuid:' + data.descriptorUuid);
                console.info('[bluetooth_js] DesRedReq charUuid:' + data.characteristicUuid);
                console.info('[bluetooth_js] DesRedReq serUuid:' + data.serviceUuid);
            });
            await(3000);
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_DESC_READ_OFF_0001
     * @tc.name testDescriptorReadOff
     * @tc.desc Test DescriptorReadOff api.
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_descriptorRead_Off_test_001', 0, async function (done) {
        try {
            console.info('[bluetooth_js] descriptorReadOff test start ...');
            if (gattServer == null) {
                console.info("[bluetooth_js] onAddServiceHelper:click onCreateGattServer first!");
            }
            gattServer.off('descriptorRead', function (data) {
                console.info("[bluetooth_js] descriptorRead_off json_data-> " + JSON.stringify(data));
                console.info("[bluetooth_js] descriptorRead_off data -> " + data);
                expect(true).assertEqual(data !=null);
            });
            await(3000);
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_DESC_WRITE_ON_0001
     * @tc.name testDescriptorWriteOn
     * @tc.desc Test DescriptorWriteOn api .
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_descriptorWrite_On_test_001', 0, async function (done) {
        try {
            console.info('[bluetooth_js] descriptorWriteOn test start ...');
            if (gattServer == null) {
                console.info("[bluetooth_js] onAddServiceHelper: click onCreateGattServer first!");
            }
            gattServer.on('descriptorWrite', function (data) {
                console.info("[bluetooth_js] desWriOn jsondata: " + JSON.stringify(data));
                console.info("[bluetooth_js] desWriOn data:" + data);
                expect(true).assertEqual(data !=null);

                console.info('[bluetooth_js] desWrite callback data ->');
                console.info('[bluetooth_js] desWriOn deviceId: ' + data.deviceId);
                console.info('[bluetooth_js] desWriOn transId: ' + data.transId);
                console.info('[bluetooth_js] desWriOn offset: ' + data.offset);
                console.info('[bluetooth_js] desWriOn desUuid: ' + data.descriptorUuid);
                console.info('[bluetooth_js] desWriOn serUuid: ' + data.serviceUuid);
                console.info('[bluetooth_js] desWriOn charUuid: ' + data.characteristicUuid);
                console.info('[bluetooth_js] desWriOn value: ' + data.value);
                console.info('[bluetooth_js] desWriOn needRsp: ' + data.needRsp);
                console.info('[bluetooth_js] desWriOn isPrep: ' + data.isPrep);
            });
            await(3000);
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_DESC_WRITE_OFF_0001
     * @tc.name testDescriptorWriteOff
     * @tc.desc Test DescriptorWriteOff api .
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_descriptorWrite_Off_test_001', 0, async function (done) {
        try {
            console.info('[bluetooth_js] descriptorWriteOff test start ...');
            if (gattServer == null) {
                console.info("[bluetooth_js] onAddServiceHelper: please click CreateGattServer first!");
            }
            gattServer.off('descriptorWrite', function (data) {
                console.info("[bluetooth_js] desWriOff jsonData-> " + JSON.stringify(data));
                console.info("[bluetooth_js] desWriOff data -> " + data);
                expect(true).assertEqual(data !=null);
            });
            await(3000);
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_CONNE_STATE_CHANGE_ON_0001
     * @tc.name testConnectStateChangeOn
     * @tc.desc Test ConnectStateChangeOn api .
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_connectStateChange_On_test_001', 0, async function (done) {
        try {
            console.info('[bluetooth_js] ConnectStateChangeOn test start ...');
            if (gattServer == null) {
                console.info("[bluetooth_js] onAddServiceHelper: click CreateGattServer first!");
            }
            gattServer.on('connectStateChange', function (data) {
                console.info("[bluetooth_js] connectStaOn jsonData -> " + JSON.stringify(data));
                console.info("[bluetooth_js] connectStaOn data -> " + data);
                expect(true).assertEqual(data !=null);

                console.info('[bluetooth_js] connectStaOn callback data ->');
                console.info('[bluetooth_js] connectStaOn deviceId: ' + data.deviceId);
                console.info('[bluetooth_js] connectStaOn state: ' + data.state);
            });
            await(3000);
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_CONNE_STATE_CHANGE_OFF_0001
     * @tc.name testConnectStateChangeOff
     * @tc.desc Test ConnectStateChangeOff api .
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_connectStateChange_Off_test_001', 0, async function (done) {
        try {
            console.info('[bluetooth_js] ConnectStateChangeOff test start ...');
            if (gattServer == null) {
                console.info("[bluetooth_js] onAddServiceHelper: please click onCreateGattServer first!");
            }
            gattServer.off('connectStateChange', function (data) {
                console.info("[bluetooth_js] connectStateChange_off jsonData-> " + JSON.stringify(data));
                console.info("[bluetooth_js] connectStateChange_off data -> " + data);
                expect(true).assertEqual(data !=null);
            });
            await(3000);
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_BLE_CHAR_CHANGE_ON_0001
     * @tc.name testBLECharacteristicChangeOn
     * @tc.desc Test BLECharacteristicChangeOn api .
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_BLECharacteristicChange_On_test_001', 0, async function (done) {
        try {
            console.info('[bluetooth_js] BLECharacteristicChangeOn test start ...');
            if (gattClient == null) {
                console.info("[bluetooth_js] OnGattclientClose:click onCreateGattClientDevice first!");
            }
            gattClient.on('BLECharacteristicChange', function (data) {
                console.info("[bluetooth_js] BLECharacteristicChange data " + JSON.stringify(data));
                console.info("[bluetooth_js] BLECharacteristicChange_on data -> " + data);
                expect(true).assertEqual(data !=null);
            });
            await(3000);
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_BLE_CHAR_CHANGE_OFF_0001
     * @tc.name testBLECharacteristicChangeOff
     * @tc.desc Test BLECharacteristicChangeOff api .
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_BLECharacteristicChange_Off_test_001', 0, async function (done) {
        try {
            console.info('[bluetooth_js] BLECharacteristicChangeOff test start');
            if (gattClient == null) {
                console.info("[bluetooth_js] OnGattclientClose: CreateGattClientDevice first!");
            }
            gattClient.off('BLECharacteristicChange', function (data) {
                console.info("[bluetooth_js] BLECharcChange_off json_data-> " + JSON.stringify(data));
                console.info("[bluetooth_js] BLECharcChange_off data -> " + data);
                expect(true).assertEqual(data !=null);
            });
            await(3000);
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_BLE_CONNE_STATE_CHANGE_ON_0001
     * @tc.name testBLEConnectionStateChangeOn
     * @tc.desc Test BLEConnectionStateChangeOn api .
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_BLEConnectionStateChange_On_test_001', 0, async function (done) {
        try {
            console.info('[bluetooth_js] BLEConnectionStateChangeOn test start');
            if (gattClient == null) {
                console.info("[bluetooth_js] GattclientClose:CreateGattClientDevice first!");
            }
            gattClient.on('BLEConnectionStateChange', function (data) {
                console.info("[bluetooth_js] BLEConnecStateChange_on data " + JSON.stringify(data));
                console.info("[bluetooth_js] BLEConneStateChange_on data -> " + data);
                expect(true).assertEqual(data !=null);

                console.info('[bluetooth_js] BLEConneStateChange deviceId : ' + data.deviceId);
                console.info('[bluetooth_js] BLEConneStateChange state : ' + data.state);
            });
            await(3000);
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_BLE_CONNE_STATE_CHANGE_OFF_0001
     * @tc.name testBLEConnectionStateChangeOff
     * @tc.desc Test BLEConnectionStateChangeOff api .
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_BLEConnectionStateChange_Off_test_001', 0, async function (done) {
        try {
            console.info('[bluetooth_js] BLEConnectionStateChangeOff test start');
            if (gattClient == null) {
                console.info("[bluetooth_js] GattclientClose:click CreateGattClientDevice first!");
            }
            gattClient.on('BLEConnectionStateChange', function (result) {
                console.info("[bluetooth_js] BLEConneStateChange_on1 result: " + JSON.stringify(result));
                console.info("[bluetooth_js] BLEConneStateChange_on1 result: " + result);
                expect(true).assertEqual(result !=null);
            });
            await(3000);
            gattClient.off('BLEConnectionStateChange', function (data) {
                console.info("[bluetooth_js] BLEConneStateChange_off data-> " + JSON.stringify(data));
                console.info("[bluetooth_js] BLEConneStateChange_off data -> " + data);
                expect(true).assertEqual(data !=null);
            });
            await(3000);
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetoothble_DEVICE_JS_SPP_READ_ON_0001
     * @tc.name testonsppReadOn
     * @tc.desc Test sppReadOn api .
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_sppReadOn_test_001', 0, async function (done) {
        try {
            console.info('[bluetooth_js] sppReadOn test start');
            console.info('bluetooth sppReadOn test start ...');
            bluetooth.on("sppRead",-1, (result) => {
                console.info("[bluetooth_js] sppReadOn json_result -> " + JSON.stringify(result));
                console.info("[bluetooth_js] sppReadOn result -> " + result);
                expect(true).assertEqual(result !=null);
            });
            await(3000);
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetoothble_DEVICE_JS_SPP_READ_ON_0002
     * @tc.name testsppReadOn
     * @tc.desc Test sppReadOn api .
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_sppReadOn_test_002', 0, async function (done) {
        console.info('[bluetooth_js] sppReadOn test2 start ...');
        await bluetooth.on("sppRead",-1, onSppReadEvent)
        function onSppReadEvent(data) {
            console.info('[bluetooth_js] sppRead data1='+ JSON.stringify(data));
            console.info('[bluetooth_js] sppRead data2='+ data);
        }
        done();
        await(3000);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetoothble_DEVICE_JS_CHARAC_READ_OFF_0001
     * @tc.name testsppReadOff
     * @tc.desc Test sppReadOff api .
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_sppReadOff_test_001', 0, async function (done) {
        try {
            console.info('[bluetooth_js] sppReadOff test start ...');
            bluetooth.off("sppRead",-1, (result) => {
                console.info("[bluetooth_js] sppReadOff json_result -> " + JSON.stringify(result));
                console.info("[bluetooth_js] sppReadOff result -> " + result);
                expect(true).assertEqual(result !=null);
            });
            await(3000);
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetoothble_DEVICE_JS_BLE_PERIPHERA_MANAGER_CLOSE_0001
     * @tc.name testBlePeripheralManagerClose
     * @tc.desc Test BlePeripheralManagerClose api .
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetoothble_gattserver_close_test_001', 0, function () {
        console.info('[bluetooth_js] GattserverClose test start ...');
        if (gattServer == null) {
            console.info("[bluetooth_js] GattserverClose: please click CreateGattServer first!");
        }
        console.info('[bluetooth_js] gattclose_server is:' + JSON.stringify(gattServer));
        try{
            var result = gattServer.close();
            console.info("[bluetooth_js] GattserverClose res:"+ JSON.stringify(result));
            expect(result).assertTrue();
            console.info("[bluetooth_js] GattserverClose end.");
        }catch(error){
            console.info("[bluetooth_js] GattserverClose err:" + JSON.stringify(error));
            expect(null).assertFail();
        }
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GATT_CLIENT_CLOSE_0001
     * @tc.name testGattClientClose
     * @tc.desc Test GattClientClose api .
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_gattclient_close_test_001', 0, function () {
        console.info('[bluetooth_js] GattclientClose test start ...');
        if (gattClient == null) {
            console.info("[bluetooth_js] GattclientClose: please click CreateGattClientDevice first!");
        }
        console.info('[bluetooth_js] gattClient is:' + JSON.stringify(gattServer));
        try{
            var result = gattClient.close();
            console.info("[bluetooth_js] GattclientClose result: " + result);
            console.info("[bluetooth_js] GattclientClose json_result:" + JSON.stringify(result));
            expect(result).assertTrue();
            console.info("[bluetooth_js] GattclientClose end.");
        }catch(error){
            console.info("[bluetooth_js] GattclientClose err:" + JSON.stringify(error));
            expect(null).assertFail();
        }
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GET_REMO_DEV_NAME_0001
     * @tc.name testGetRemoteDeviceName
     * @tc.desc Test GetRemoteDeviceName api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_getRemoteDeviceName_test', 0, function (done) {
        console.info('[bluetooth_js] getRemoteDeviceName start');
        let ret = bluetooth.getRemoteDeviceName("00:00:00:00:00:00");
        console.info('[bluetooth_js] getRemoteDeviceName ret : ' + ret);
        console.info('[bluetooth_js] getRemoteDeviceName ret2 : ' + JSON.stringify(ret));
        expect(ret.length).assertEqual(0);
        console.info('[bluetooth_js] getRemoteDeviceName end.');
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GET_REMO_DEV_CLASS_0001
     * @tc.name testGetRemoteDeviceClass
     * @tc.desc Test GetRemoteDeviceClass api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_getRemoteDeviceClass_test', 0, function (done) {
        console.info('[bluetooth_js] getRemoteDeviceClass start');
        var MajorMinorClass = {
            COMPUTER_UNCATEGORIZED : 0x0100,
            COMPUTER_DESKTOP : 0x0104,
            COMPUTER_SERVER : 0x0108,
            COMPUTER_LAPTOP : 0x010C,
            COMPUTER_HANDHELD_PC_PDA : 0x0110,
            COMPUTER_PALM_SIZE_PC_PDA : 0x0114,
            COMPUTER_WEARABLE : 0x0118,
            COMPUTER_TABLET : 0x011C,
            PHONE_UNCATEGORIZED : 0x0200,
            PHONE_CELLULAR : 0x0204,
            PHONE_CORDLESS : 0x0208,
            PHONE_SMART : 0x020C,
            PHONE_MODEM_OR_GATEWAY : 0x0210,
            PHONE_ISDN : 0x0214,
            NETWORK_FULLY_AVAILABLE : 0x0300,
            NETWORK_1_TO_17_UTILIZED : 0x0320,
            NETWORK_17_TO_33_UTILIZED : 0x0340,
            NETWORK_33_TO_50_UTILIZED : 0x0360,
            NETWORK_60_TO_67_UTILIZED : 0x0380,
            NETWORK_67_TO_83_UTILIZED : 0x03A0,
            NETWORK_83_TO_99_UTILIZED : 0x03C0,
            NETWORK_NO_SERVICE : 0x03E0,
            AUDIO_VIDEO_UNCATEGORIZED : 0x0400,
            AUDIO_VIDEO_WEARABLE_HEADSET : 0x0404,
            AUDIO_VIDEO_HANDSFREE : 0x0408,
            AUDIO_VIDEO_MICROPHONE : 0x0410,
            AUDIO_VIDEO_LOUDSPEAKER : 0x0414,
            AUDIO_VIDEO_HEADPHONES : 0x0418,
            AUDIO_VIDEO_PORTABLE_AUDIO : 0x041C,
            AUDIO_VIDEO_CAR_AUDIO : 0x0420,
            AUDIO_VIDEO_SET_TOP_BOX : 0x0424,
            AUDIO_VIDEO_HIFI_AUDIO : 0x0428,
            AUDIO_VIDEO_VCR : 0x042C,
            AUDIO_VIDEO_VIDEO_CAMERA : 0x0430,
            AUDIO_VIDEO_CAMCORDER : 0x0434,
            AUDIO_VIDEO_VIDEO_MONITOR : 0x0438,
            AUDIO_VIDEO_VIDEO_DISPLAY_AND_LOUDSPEAKER : 0x043C,
            AUDIO_VIDEO_VIDEO_CONFERENCING : 0x0440,
            AUDIO_VIDEO_VIDEO_GAMING_TOY : 0x0448,
            PERIPHERAL_NON_KEYBOARD_NON_POINTING : 0x0500,
            PERIPHERAL_KEYBOARD : 0x0540,
            PERIPHERAL_POINTING_DEVICE : 0x0580,
            PERIPHERAL_KEYBOARD_POINTING : 0x05C0,
            PERIPHERAL_UNCATEGORIZED : 0x0500,
            PERIPHERAL_JOYSTICK : 0x0504,
            PERIPHERAL_GAMEPAD : 0x0508,
            PERIPHERAL_REMOTE_CONTROL : 0x05C0,
            PERIPHERAL_SENSING_DEVICE : 0x0510,
            PERIPHERAL_DIGITIZER_TABLET : 0x0514,
            PERIPHERAL_CARD_READER : 0x0518,
            PERIPHERAL_DIGITAL_PEN : 0x051C,
            PERIPHERAL_SCANNER_RFID : 0x0520,
            PERIPHERAL_GESTURAL_INPUT : 0x0522,
        
            IMAGING_UNCATEGORIZED : 0x0600,
            IMAGING_DISPLAY : 0x0610,
            IMAGING_CAMERA : 0x0620,
            IMAGING_SCANNER : 0x0640,
            IMAGING_PRINTER : 0x0680,
        
            WEARABLE_UNCATEGORIZED : 0x0700,
            WEARABLE_WRIST_WATCH : 0x0704,
            WEARABLE_PAGER : 0x0708,
            WEARABLE_JACKET : 0x070C,
            WEARABLE_HELMET : 0x0710,
            WEARABLE_GLASSES : 0x0714,
        
            TOY_UNCATEGORIZED : 0x0800,
            TOY_ROBOT : 0x0804,
            TOY_VEHICLE : 0x0808,
            TOY_DOLL_ACTION_FIGURE : 0x080C,
            TOY_CONTROLLER : 0x0810,
            TOY_GAME : 0x0814,
        
            HEALTH_UNCATEGORIZED : 0x0900,
            HEALTH_BLOOD_PRESSURE : 0x0904,
            HEALTH_THERMOMETER : 0x0908,
            HEALTH_WEIGHING : 0x090C,
            HEALTH_GLUCOSE : 0x0910,
            HEALTH_PULSE_OXIMETER : 0x0914,
            HEALTH_PULSE_RATE : 0x0918,
            HEALTH_DATA_DISPLAY : 0x091C,
            HEALTH_STEP_COUNTER : 0x0920,
            HEALTH_BODY_COMPOSITION_ANALYZER : 0x0924,
            HEALTH_PEAK_FLOW_MOITOR : 0x0928,
            HEALTH_MEDICATION_MONITOR : 0x092C,
            HEALTH_KNEE_PROSTHESIS : 0x0930,
            HEALTH_ANKLE_PROSTHESIS : 0x0934,
            HEALTH_GENERIC_HEALTH_MANAGER : 0x0938,
            HEALTH_PERSONAL_MOBILITY_DEVICE : 0x093C,
            HEALTH_PERSONAL_MOBILITY_DEVICE : 0x093C
        };

        let ret = bluetooth.getRemoteDeviceClass("00:00:00:00:00:00");
        console.info('[bluetooth_js] getRemoteDeviceClass ret : ' + ret);
        console.info('[bluetooth_js] getRemoteDeviceClass ret2 : ' + JSON.stringify(ret));
        expect(ret.majorClass).assertEqual(0);
        console.info('[bluetooth_js] majorClass : ' + ret.majorClass);
        console.info('[bluetooth_js] majorMinorClass : ' + ret.majorMinorClass);
        console.info('[bluetooth_js] classOfDevice : ' + ret.classOfDevice);
        console.info('[bluetooth_js] getRemoteDeviceClass end.');
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_CANCEL_PAIRED_DEV_0001
     * @tc.name testCancelPairedDevice
     * @tc.desc Test CancelPairedDevice api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_cancelPairedDevice_test', 0, function (done) {
        console.info('[bluetooth_js] cancelPairedDevice start');
        let ret = bluetooth.cancelPairedDevice("00:00:00:00:00:00");
        console.info('[bluetooth_js] cancelPairedDevice ret : ' + ret);
        console.info('[bluetooth_js] cancelPairedDevice ret2 : ' + JSON.stringify(ret));
        expect(ret).assertEqual(false);
        console.info('bluetooth cancelPairedDevice end.');
        done();
    })

})
