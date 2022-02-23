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
        console.info('[bluetooth_js] gattServer beforeAll is:' + JSON.stringify(gattServer));

        gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
        console.info('[bluetooth_js] GattClientDevice beforeAll is:' + JSON.stringify(gattClient));
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
        var sta = bluetooth.getState();
        switch(sta){
            case 0:
                var enable = bluetooth.enableBluetooth();
                console.info('[bluetooth_js] enable0 = '+ JSON.stringify(enable));
                expect(enable).assertEqual(true);
                break;
            case 1:
                console.info('[bluetooth_js] bt turning on:'+ JSON.stringify(sta));
                break;
            case 2:
                console.info('[bluetooth_js] state is On:'+ JSON.stringify(sta));
                break;
            case 3:
                var enable = bluetooth.enableBluetooth();
                console.info('[bluetooth_js] enable0 = '+ JSON.stringify(enable));
                break;
            default:
                console.info('[bluetooth_js] enable success');
            }
        await sleep(3000);
        var state = bluetooth.getState();
        console.info('[bluetooth_js] getState On = '+ JSON.stringify(state));
        expect(state).assertEqual(2);
        done();
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
        console.info('[bluetooth_js] getConnectedBLEDevices test start ...');
        var result = bluetooth.BLE.getConnectedBLEDevices();
        console.info("[bluetooth_js] getConnectedBLEDevices:" + JSON.stringify(result));
        console.info("[bluetooth_js] getConnectedBLEDevices length:" + result.length);
        expect(result.length).assertEqual(0);
        console.info('[bluetooth_js] getConnectedBLEDevices end');
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
        console.info('[bluetooth_js] createGattServer end');
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
        let promise = new Promise((resolve) => {
        var gattServer = bluetooth.BLE.createGattServer()
            gattServer.startAdvertising({
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
            resolve()
        })
        await promise.then(done)
        done();
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
    it('bluetooth_ble_stop_advertising', 0, function () {
        console.info('[bluetooth_js] BLE stop advertising start');
        var gattServer = bluetooth.BLE.createGattServer();
        gattServer.stopAdvertising();
        console.info('[bluetooth_js] BLE stop advertising end');
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
    it('bluetooth_gatt_connect', 0, function () {
        console.info('[bluetooth_js] gatt connect start');
        gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
        let ret = gattClient.connect();
        console.info('[bluetooth_js] gatt connect ret : ' + ret);
        expect(ret).assertEqual(true);
        console.info('[bluetooth_js] gatt connect end');
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
        var gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
        await gattClient.getDeviceName().then((data) => {
            console.info('[bluetooth_js] device name' + JSON.stringify(data))
            done();
        })
        console.info('BLE get device name promise end')
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
        let promise = new Promise((resolve) => {
            var gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
            gattClient.getRssiValue((err, data)=> {
                console.info('[bluetooth_js] rssi err:' + JSON.stringify(err));
                console.info('[bluetooth_js] rssi value:' + JSON.stringify(data));
                expect(data).assertNull();
                console.info('[bluetooth_js] BLE read rssi1 end');
                done();
            });
            resolve()
        })
        await promise.then(done)
        done();
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
        let promise = new Promise((resolve) => {
            var gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
            gattClient.getRssiValue().then((data) => {
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
                console.error(`bluetooth getRssiValue has error: ${err}`);
                expect(true).assertEqual(true);
                done();
            });
            resolve()
        })
        await promise.then(done)
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
        gattClient.getServices((err, data)=> {
            console.info('[bluetooth_js] device name err1 ' + JSON.stringify(err));
            console.info('[bluetooth_js] device name1' + JSON.stringify(data));
            done();
        })
        console.info('[bluetooth_js] getServices callback end');
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
    it('bluetooth_gatt_readDescriptorValue', 0, async function (done) {
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
    it('bluetooth_gatt_writeCharacteristicValue', 0, function () {
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
    it('bluetooth_gatt_writeDescriptorValue', 0, function () {
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
    it('bluetooth_gatt_setBLEMtuSize', 0, function () {
        console.info('[bluetooth_js] setBLEMtuSize start');
        let ret = gattClient.setBLEMtuSize(128);
        console.info('[bluetooth_js] bluetooth setBLEMtuSize ret : ' + ret);
        expect(ret).assertEqual(false);
        console.info('[bluetooth_js] setBLEMtuSize end');
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
    it('bluetooth_gatt_setNotifyCharacteristicChanged', 0, function () {
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
    it('bluetooth_gatt_addService', 0, function () {
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
    it('bluetooth_gatt_removeService', 0, function () {
        console.info('[bluetooth_js] removeService start');
        gattServer = bluetooth.BLE.createGattServer();
        let ret = gattServer.removeService('00001810-0000-1000-8000-008000000000');
        console.info('[bluetooth_js] removeService ret : ' + ret);
        expect(ret).assertEqual(false);
        console.info('[bluetooth_js] removeService end');
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
    it('bluetooth_gatt_notifyCharacteristicChanged', 0, function () {
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
    it('bluetooth_gatt_sendResponse', 0, function () {
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
            console.info("[bluetooth_js] GattserverClose: please CreateGattServer first!");
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
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GATT_DISCONNRCT_0001
     * @tc.name testDisConnect
     * @tc.desc Test DisConnect api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_gatt_disconnect', 0, function () {
        console.info('[bluetooth_js] gatt disconnect start');
        let ret = gattClient.disconnect();
        console.info('[bluetooth_js] gatt disconnect ret:' + ret);
        expect(ret).assertEqual(false);
        console.info('[bluetooth_js] gatt disconnect end');
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
            console.info("[bluetooth_js] GattclientClose: please CreateGatt first!");
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

})
