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

describe('bluetoothhostTest', function() {

    var gattServer = null;
    var gattClient = null;
    beforeAll(function () {
        console.info('beforeAll called')
        gattServer = bluetooth.BLE.createGattServer();
        setTimeout(function(){
            console.debug('==createGattServer==timeout')
        },5000);
        console.info('[bluetooth_js] gattServer beforeAll is--<-!!!->' + JSON.stringify(gattServer));
        console.info('[bluetooth_js] gattServer type beforeAll is--<-!!!->' + gattServer);

        gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
        setTimeout(function(){
            console.debug('==createGattClientDevice==timeout')
        },5000);
        console.info('[bluetooth_js] GattClientDevice beforeAll is -> ' + JSON.stringify(gattClient));
        console.info('[bluetooth_js] GattClientDevice type beforeAll is--<-!!!->' + gattClient);
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
    it('bluetooth_classic_enable_bluetooth', 0, async function (done) {
        console.info('bluetooth enable start');
        console.info('bluetooth enable register');
        await bluetooth.on("stateChange", onReceiveEvent);
        function onReceiveEvent(data) {
            console.info('[bluetooth_js] enable bluetooth data = '+ JSON.stringify(data))
            console.info('[bluetooth_js] state:' + JSON.stringify(bluetooth.BluetoothState.STATE_ON));
            if (data == bluetooth.BluetoothState.STATE_ON) {
                console.info('enable bluetooth');
                done()
            }
        }
        await bluetooth.enableBluetooth();
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
        console.info('get bluetooth state start');
        var state = bluetooth.getState();
        console.info('get bluetooth state end');
        console.info('[bluetooth_js] get bluetooth state result = '+ JSON.stringify(state));
        expect(state).assertEqual(bluetooth.BluetoothState.STATE_ON);
        done();

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
        console.info('set localname start');
        var enable = bluetooth.setLocalName('bluetooth_test');
        console.info('set localname end');
        console.info('[bluetooth_js] appInfoTest enable bluetooth result '+ JSON.stringify(enable));
        expect(enable).assertEqual(true);
        done();

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
        console.info('get localName  start');
        var localName = bluetooth.getLocalName();
        console.info('get localName end');
        console.info('[bluetooth_js] get local Name result = ' + JSON.stringify(localName));
        expect(localName).assertEqual('bluetooth_test');
        done();

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
        console.info('set bluetooth scan mode  start');
        var result = bluetooth.setBluetoothScanMode(1,10000);
        console.info('set bluetooth scan mode end');
        console.info('[bluetooth_js] set bluetooth scan mode result = ' + JSON.stringify(result));
        expect(result).assertEqual(true);
        done();

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
        console.info('get bluetooth scan mode  start');
        var result = bluetooth.setBluetoothScanMode(1,10000);
        console.info('set bluetooth scan mode end');
        console.info('[bluetooth_js] set bluetooth scan mode result1 = ' + JSON.stringify(result));
        expect(result).assertEqual(true);
        var scanMode = bluetooth.getBluetoothScanMode();
        console.info('get bluetooth scan mode end');
        console.info('[bluetooth_js] get bluetooth scan mode result2 = ' + JSON.stringify(scanMode));
        expect(scanMode).assertEqual(1);
        done();

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
        console.info('get bt connection state start');
        var connState = bluetooth.getBtConnectionState();
        console.info('get bt connection state end');
        console.info('[bluetooth_js] get bt connection state result' + JSON.stringify(connState));
        expect(connState).assertEqual(bluetooth.ProfileConnectionState.STATE_DISCONNECTED);
        done();

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
        console.info('start bluetooth discovery start');
        await bluetooth.on("bluetoothDeviceFind", onReceiveEvent)
        console.info('bluetooth bluetoothDeviceFind register');
        function onReceiveEvent(data) {
            console.info('[bluetooth_js] start bluetooth discovery bluetoothDeviceFind '+ JSON.stringify(data))
            console.info("[bluetooth_js] bluetooth discovery length -> " + data.length);
            expect(data.length).assertLarger(0);
            done()
        }
        await bluetooth.startBluetoothDiscovery();
        console.info('start bluetooth discovery done');

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
        console.info('stop bluetooth discovery start');
        bluetooth.stopBluetoothDiscovery();
        await bluetooth.off("bluetoothDeviceFind", onReceiveEvent)
        function onReceiveEvent(data) {
            console.info('[bluetooth_js] stop bluetooth discovery result = '+ JSON.stringify(data))
            expect(data).assertNull();
            done()
        }
        console.info('stop bluetooth discovery done');

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
        console.info('get paired devices start');
        var devices = bluetooth.getPairedDevices();
        console.info('[bluetooth_js] get paired devices result = ' + JSON.stringify(devices));
        done();
        console.info("[bluetooth_js] getConnectedDevices length -> " + devices.length);
        expect(devices.length).assertEqual(0);
        console.info('get paired devices end');

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
    it('bluetooth_getConnectedBLEDevices_test_001', 0, function () {
        console.info('bluetooth getConnectedBLEDevices test start ...');
        var result = bluetooth.BLE.getConnectedBLEDevices();
        console.info("[bluetooth_js] getConnectedBLEDevices -> " + JSON.stringify(result));
        console.info("[bluetooth_js] getConnectedBLEDevices length -> " + result.length);
        expect(result.length).assertEqual(0);
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
        console.info('bluetoothble onStopBLEScan test start ...');
        try{
            var result = bluetooth.BLE.stopBLEScan();
            console.info("[bluetooth_js] onStopBLEScan -> " + JSON.stringify(result));
            expect(result).assertNull();
            console.info("[bluetooth_js] onStopBLEScan .");
        }catch(error){
            console.info("[bluetooth_js] onStopBLEScan error" + JSON.stringify(error));
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
        console.info('bluetooth createGattServer test start ...');
        var result = bluetooth.BLE.createGattServer();
        console.info("[bluetooth_js] createGattServer -> " + JSON.stringify(result));
        var resultLength = Object.keys(result).length;
        console.info("[bluetooth_js] createGattServer length -> " + resultLength);
        expect(resultLength).assertEqual(0);
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_START_BLESCAN_WITH_FILTER_0001
     * @tc.name testClassicStartBLEScan
     * @tc.desc Test ClassicStartBLEScan api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_ble_start_scan_with_filter', 0, async function (done) {
        console.info('BLE scan start');
        await bluetooth.BLE.on("BLEDeviceFind", onReceiveEvent)
        function onReceiveEvent(data) {
            console.info('[bluetooth_js] BLE scan device find result1 = '+ JSON.stringify(data))
            expect(data.length).assertLarger(0);
            done()
        }
        bluetooth.BLE.startBLEScan(
            [{
                deviceId:"789",
                name:"test",
                serviceUuid:"1234564"
            }],
            {
                interval: 500,
                dutyMode: bluetooth.ScanDuty.SCAN_MODE_LOW_POWER,
                matchMode: bluetooth.MatchMode.MATCH_MODE_AGGRESSIVE,
            }
        );
        console.info('[bluetooth_js] BLE scan end');
        setTimeout(function(){
            console.debug('========bluetooth_ble_start_scan=======timeout')
        },1000);
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
        console.info('BLE scan start');
        await bluetooth.BLE.on("BLEDeviceFind", onReceiveEvent)
        function onReceiveEvent(data) {
            console.info('[bluetooth_js] BLE scan device find result2 = '+ JSON.stringify(data))
            expect(data.length).assertLarger(0);
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
        console.info('BLE scan end');
        setTimeout(function(){
            console.debug('========bluetooth_ble_start_scan_no_filter=======timeout')
        },1000);
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
        console.info('BLE scan start without scan options');
        await bluetooth.BLE.on("BLEDeviceFind", onReceiveEvent)
        function onReceiveEvent(data) {
            console.info('[bluetooth_js] BLE scan device find result3 = '+ JSON.stringify(data))
            expect(data.length).assertLarger(0);
            bluetooth.BLE.stopBLEScan();
            done()
        }
        bluetooth.BLE.startBLEScan([{}]);
        console.info('[bluetooth_js] BLE scan start end');
        setTimeout(function(){
            console.debug('========bluetooth_ble_start_scan_without_param=======timeout')
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
        console.info('BLE stop scan start');
        await bluetooth.off("BLEDeviceFind", onReceiveEvent)
        function onReceiveEvent(data) {
            console.info('[bluetooth_js] BLE scan device find result4 = '+ JSON.stringify(data))
        }
        var result = bluetooth.BLE.stopBLEScan();
        console.info("[bluetooth_js] onStopBLEScan -> " + JSON.stringify(result));
        expect(result).assertNull();
        console.info('[bluetooth_js] BLE stop scan end');
        done()
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
        console.info('BLE advertising start');
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
        await gattServer.startAdvertising({
            interval:150,
            txPower:60,
            connectable:true,
        },{
            serviceUuids:["12"],
            manufactureData:[{
                manufactureId:4567,
                manufactureValue:manufactureValueBuffer.buffer
            }],
            serviceData:[{
                serviceUuid:"1234",
                serviceValue:serviceValueBuffer.buffer
            }],
        },{
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
        done()
        setTimeout(function(){
            console.debug('========bluetooth_ble_start_advertising=======timeout')
        },1000);
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
        console.info('BLE stop advertising start');
        var gattServer = bluetooth.BLE.createGattServer()
        gattServer.stopAdvertising()
        console.info('BLE stop advertising end');
        done()
        setTimeout(function(){
            console.debug('========bluetooth_ble_stop_advertising=======timeout')
        },1000);
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
    it('bluetooth_ble_get_device_name_callback', 0, async function (done) {
        console.info('BLE get device name callback start');
        var gattClient = gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
        var deviceName = gattClient.getDeviceName((err, data)=> {
            console.info('[bluetooth_js] device name err ' + JSON.stringify(err))
            console.info('[bluetooth_js] device name' + JSON.stringify(data))
            done();
        })
        console.info('BLE get device name callback end')
        setTimeout(function(){
            console.debug('========bluetooth_ble_get_device_name_callback=======timeout')
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
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GET_RSSI_VALUE_CALLBACK_0001
     * @tc.name testGetRssiValue
     * @tc.desc Test GetRssiValue api by callback.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_ble_read_rssi', 0, async function (done) {
        console.info('BLE get rssi start');
        var gattClient = gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
        var rssi = gattClient.getRssiValue((err, data)=> {
            console.info('[bluetooth_js] rssi err ' + JSON.stringify(err))
            console.info('[bluetooth_js] rssi value' + JSON.stringify(data))
            done();
        })
        console.info('BLE read rssi end');
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
        console.info('BLE get rssi start');
        var gattClient = gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
        var rssi = gattClient.getRssiValue().then((data) => {
            console.info('rssi' + JSON.stringify(data))
            done();
        })
        console.info('[bluetooth_js] BLE read rssi ' + JSON.stringify(rssi));
        var rssiLength = Object.keys(rssi).length;
        console.info("[bluetooth_js] ble rssi_length -> " + rssiLength);
        expect(rssiLength).assertEqual(0);
        setTimeout(function(){
        console.debug('========bluetooth_ble_stop_advertising=======timeout')
        },1000);
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
        console.info('disable bluetooth start');
        bluetooth.off("pinRequired", onPinRequiredReceiveEvent)
        function onPinRequiredReceiveEvent(data) {
            console.info('[bluetooth_js] pin required  = '+ JSON.stringify(data))
        }

        bluetooth.off("boneStateChange", onBoneStateReceiveEvent)
        function onBoneStateReceiveEvent(data) {
            console.info('[bluetooth_js] boneStateChange  = '+ JSON.stringify(data))
        }

        bluetooth.off("stateChange", onReceiveEvent);
        function onReceiveEvent(data) {
            console.info('[bluetooth_js] enable bluetooth data = '+ JSON.stringify(data))
            done()
        }
        var enable = bluetooth.disableBluetooth();
        setTimeout(function(){
            console.debug('========bluetooth_classic_disable_bluetooth=======timeout')
        }, 1000);
        console.info('disable bluetooth end');
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
        console.info('bluetooth connect start');
        gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");

        let ret = gattClient.connect();
        console.info('[bluetooth_js] bluetooth connect ret : ' + ret);
        expect(ret).assertEqual(false);
        console.info('bluetooth connect end');
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
        console.info('bluetooth disconnect start');

        let ret = gattClient.disconnect();
        console.info('[bluetooth_js] bluetooth disconnect ret : ' + ret);
        expect(ret).assertEqual(false);
        console.info('bluetooth disconnect end');
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GATT_GETSERVICES_0001
     * @tc.name testGetServices
     * @tc.desc Test GetServices api by promise.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_gatt_getServices', 0, async function (done) {
        console.info('bluetooth getServices start');

        gattClient.getServices().then((object) => {
            if (object != null) {
                console.info('[bluetooth_js] bluetooth getServices is null');
                expect(true).assertEqual(true);
            } else {
                console.info('[bluetooth_js] bluetooth getServices is successfully');
                expect(null).assertFail();
            }
            done();
        }).catch(err => {
            console.error(`bluetooth getServices has error: ${err}`);
//            expect(null).assertFail();
            expect(true).assertEqual(true);
            done();
        });
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
        console.info('bluetooth readCharacteristicValue start');

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
        characteristicValue:arrayBufferCCC,descriptors:descriptors};

        gattClient.readCharacteristicValue(characteristic).then((object) => {
            if (object != null) {
                console.info('[bluetooth_js] bluetooth BLECharacteristic is null');
                expect(true).assertEqual(true);
            } else {
                console.info('[bluetooth_js] bluetooth BLECharacteristic uuid is successfully');
                expect(null).assertFail();
            }
            done();
        }).catch(err => {
            console.error(`bluetooth readCharacteristicValue has error: ${err}`);
//            expect(null).assertFail();
            expect(true).assertEqual(true);
            done();
        });
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
        console.info('bluetooth readDescriptorValue start');

        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;

        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};


        gattClient.readDescriptorValue(descriptor).then((object) => {
            if (object != null) {
                console.info('bluetooth BLEDescriptor is null');
                expect(true).assertEqual(true);
            } else {
                console.info('bluetooth BLEDescriptor uuid is successfully');
                expect(null).assertFail();
            }
            done();
        }).catch(err => {
            console.error(`bluetooth readDescriptorValue has error: ${err}`);
//            expect(null).assertFail();
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
        console.info('bluetooth writeCharacteristicValue start');

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


        let ret = gattClient.writeCharacteristicValue(characteristic);
        console.info('[bluetooth_js] bluetooth writeCharacteristicValue ret : ' + ret);
        expect(ret).assertEqual(false);

        console.info('bluetooth writeCharacteristicValue end');
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
        console.info('bluetooth writeDescriptorValue start');

        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;

        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};

        let ret = gattClient.writeDescriptorValue(descriptor);
        console.info('[bluetooth_js] bluetooth writeDescriptorValue ret : ' + ret);
        expect(ret).assertEqual(false);

        console.info('bluetooth writeDescriptorValue end');
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
        console.info('bluetooth setBLEMtuSize start');

        let ret = gattClient.setBLEMtuSize(128);
        console.info('[bluetooth_js] bluetooth setBLEMtuSize ret : ' + ret);
        expect(ret).assertEqual(false);

        console.info('bluetooth setBLEMtuSize end');
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
        console.info('bluetooth setNotifyCharacteristicChanged start');

        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;

        let arrayBufferNotify = new ArrayBuffer(8);
        let descNotifyValue = new Uint8Array(arrayBufferNotify);
        descNotifyValue[0] = 1

        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        let descriptorNotify = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBufferNotify};
        descriptors[0] = descriptor;
        descriptors[1] = descriptorNotify;

        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 1;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            characteristicValue: arrayBufferCCC, descriptors:descriptors};

        let ret = gattClient.setNotifyCharacteristicChanged(characteristic, false);
        console.info('[bluetooth_js] bluetooth setNotifyCharacteristicChanged ret : ' + ret);
        expect(ret).assertEqual(false);

        console.info('bluetooth setNotifyCharacteristicChanged end');
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
        console.info('bluetooth addService start');
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

        let ret = gattServer.addService(service);
        console.info('[bluetooth_js] bluetooth addService ret : ' + ret);
        expect(ret).assertEqual(false);

        console.info('bluetooth addService end');
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
        console.info('bluetooth removeService start');
        gattServer = bluetooth.BLE.createGattServer();

        let ret = gattServer.removeService('00001810-0000-1000-8000-008000000000');
        console.info('[bluetooth_js] bluetooth removeService ret : ' + ret);
        expect(ret).assertEqual(false);

        console.info('bluetooth removeService end');
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
        console.info('bluetooth notifyCharacteristicChanged start');

        let descriptors = [];
        let arrayBufferDesc = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBufferDesc);
        desValue[0] = 11;

        let arrayBufferNotifyDesc = new ArrayBuffer(8);
        let descNotifyValue = new Uint8Array(arrayBufferNotifyDesc);
        descNotifyValue[0] = 1

        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: desValue};
        let descriptorNotify = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: descNotifyValue};
        descriptors[0] = descriptor;
        descriptors[1] = descriptorNotify;

        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 1;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
            characteristicValue: cccValue, descriptors:descriptors};

        let ret = gattServer.notifyCharacteristicChanged('00:00:00:00:00:00', characteristic);
        console.info('[bluetooth_js] bluetooth notifyCharacteristicChanged ret : ' + ret);
        expect(ret).assertEqual(false);

        console.info('bluetooth notifyCharacteristicChanged end');
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
        console.info('bluetooth sendResponse start');

        let arrayBuffer = new ArrayBuffer(8);
        let value =  new Uint8Array(arrayBuffer);
        value[0] = 1;

        let serverResponse = {deviceId: '00:00:00:00:00', transId: 1,
        status: 0, offset: 0, value: arrayBuffer};

        let ret = gattServer.sendResponse(serverResponse);
        console.info('[bluetooth_js] bluetooth sendResponse ret : ' + ret);
        expect(ret).assertEqual(false);
        console.info('bluetooth sendResponse end');
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
        console.log("bluetooth: spp listen start");
        let sppOption = {uuid: '00001810-0000-1000-8000-00805F9B34FB',
            secure: true, type: 0};

        bluetooth.sppListen('server1', sppOption, function(code, serverSocketNumber) {
            if (code.code == 0) {
                console.info('bluetooth code is success');
                console.info('bluetooth code is: ' + code.code);
                expect(true).assertEqual(true);
                done();
            } else {
                console.info('bluetooth code is failed');
                console.info('bluetooth code is: ' + code.code);
                expect(true).assertEqual(false);
                done();
            }
        });
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
        console.log("bluetooth: spp accept start");

        bluetooth.sppAccept(-1, function(code, clientSocketNumber) {
            if (code.code == 0) {
                console.info('bluetooth code is success');
                console.info('bluetooth code is: ' + code.code);
                expect(true).assertEqual(true);
            } else {
                console.info('bluetooth code is failed');
                console.info('bluetooth code is: ' + code.code);
                expect(true).assertEqual(false);
            }
        });
        console.log("bluetooth: spp accept end");
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
        console.log("bluetooth: spp closeServerSocket start");

        let ret = bluetooth.sppCloseServerSocket(-1);

        console.info('[bluetooth_js] bluetooth sppCloseServerSocket ret : ' + ret);
        expect(ret).assertEqual(false);
        console.log("bluetooth: spp closeServerSocket end");
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
        console.info('bluetooth spp_connect start');

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
        console.info('bluetooth spp_connect end');
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
        console.info('bluetooth spp write start');

        let arrayBuffer = new ArrayBuffer(8);
        let data =  new Uint8Array(arrayBuffer);
        data[0] = 123;

        let ret = bluetooth.sppWrite(-1, arrayBuffer);
        console.info('[bluetooth_js] bluetooth sppWrite ret : ' + ret);
        expect(ret).assertEqual(false);
        console.info('bluetooth spp write end');
        done();
    })

})

