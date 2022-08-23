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

let SppType = {
    SPP_RFCOMM : 0
}
let MatchMode = {
    MATCH_MODE_AGGRESSIVE : 1,
    MATCH_MODE_STICKY : 2
}
let MajorClass = {
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

export default function bluetoothhostTest() {
describe('bluetoothhostTest', function() {

    let gattServer = null;
    let gattClient = null;
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
    beforeAll(function () {
        console.info('beforeAll called')
        gattServer = bluetooth.BLE.createGattServer();
        gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
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
     * @tc.number SUB_COMMUNACATION_bluetooth_ENABLE_0001
     * @tc.name testEnableBluetooth
     * @tc.desc Test EnableBluetooth api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNACATION_bluetooth_ENABLE_0001', 0, async function (done) {
        let state = bluetooth.getState();
        console.info('[bluetooth_js] getState On = '+ JSON.stringify(state));
        expect(state).assertEqual(2);
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetoothble_GET_CONNECTED_BLEDEVICES_0001
     * @tc.name testGetConnectedBLEDevices
     * @tc.desc Test getConnectedBLEDevices api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNACATION_bluetoothble_GET_CONNECTED_BLEDEVICES_0001', 0, async function (done) {
        let result = bluetooth.BLE.getConnectedBLEDevices();
        console.info("[bluetooth_js] getConnDev:" + JSON.stringify(result)+ "length:" +result.length);
        expect(result.length).assertEqual(0);
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_START_ADVERTISING_0001
     * @tc.name testStartAdvertising
     * @tc.desc Test StartAdvertising api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNACATION_bluetooth_START_ADVERTISING_0001', 0, async function (done) {
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
        let promise = new Promise((resolve) => {
            let gattServer = bluetooth.BLE.createGattServer()
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
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_STOP_ADVERTISING_0001
     * @tc.name testStopAdvertising
     * @tc.desc Test StopAdvertising api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNACATION_bluetooth_STOP_ADVERTISING_0001', 0, async function (done) {
        let gattServer = bluetooth.BLE.createGattServer();
        gattServer.stopAdvertising();
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_GATT_CONNRCT_0001
     * @tc.name testConnect
     * @tc.desc Test Connect api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNACATION_bluetooth_GATT_CONNRCT_0001', 0, async function (done) {
        gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
        let ret = gattClient.connect();
        expect(ret).assertTrue();
        done();
    })


    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_GET_RSSI_VALUE_CALLBACK
     * @tc.name testGetRssiValue
     * @tc.desc Test GetRssiValue api by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNACATION_bluetooth_GET_RSSI_VALUE_CALLBACK', 0, async function (done) {
        let promise = new Promise((resolve) => {
            let gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
            gattClient.getRssiValue((err, data)=> {
                console.info('[bluetooth_js] rssi err:' + JSON.stringify(err)+'value:'+JSON.stringify(data));
                expect(data).assertNull();
            });
            resolve()
        })
        await promise.then(done)
    })


    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_GET_RSSI_VALUE_PROMISE_0001
     * @tc.name testGetRssiValue
     * @tc.desc Test GetRssiValue api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNACATION_bluetooth_GET_RSSI_VALUE_PROMISE_0001', 0, async function (done) {
        let promise = new Promise((resolve) => {
            let gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
            gattClient.getRssiValue().then((data) => {
                if (data != null) {
                    expect(true).assertEqual(true);
                } else {
                    console.info('[bluetooth_js] BLE read rssi ' + JSON.stringify(data));
                    let rssiLength = Object.keys(data).length;
                    expect(rssiLength).assertEqual(0);
                }
            }).catch(err => {
                console.error(`bluetooth getRssiValue has error: ${err}`);
                expect(true).assertEqual(true);
            });
            resolve()
        })
        await promise.then(done)
        done();
    })


    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_GET_DEVICE_NAME_PROMISE_0001
     * @tc.name testGetDeviceName
     * @tc.desc Test GetDeviceName api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNACATION_bluetooth_GET_DEVICE_NAME_PROMISE_0001', 0, async function (done) {
        let promise = new Promise((resolve) => {
            let gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
            gattClient.getDeviceName().then((data) => {
                console.info('[bluetooth_js] device name' + JSON.stringify(data))
                expect(data).assertNull();
                done();
            })
            resolve()
        })
        await promise.then(done)
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_GET_DEVICE_NAME_CALLBACK_0001
     * @tc.name testGetDeviceName
     * @tc.desc Test GetDeviceName api by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNACATION_bluetooth_GET_DEVICE_NAME_CALLBACK_0001', 0, async function (done) {
        let promise = new Promise((resolve) => {
            let gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
            gattClient.getDeviceName((err, data)=> {
                console.info('[bluetooth_js] device name' + JSON.stringify(data))
                expect(data).assertNull();
                done();
            })
            resolve()
        })
        await promise.then(done)
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_GATT_GETSERVICES_CALLBACK_0001
     * @tc.name testGetServices
     * @tc.desc Test GetServices api by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNACATION_bluetooth_GATT_GETSERVICES_CALLBACK_0001', 0, async function (done) {
        let promise = new Promise((resolve) => {
            let gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
            gattClient.getServices((err, data)=> {
                console.info('[bluetooth_js] device name err1 ' + JSON.stringify(err) +'name1' + JSON.stringify(data));
                expect(true).assertEqual(err.code == -1);
                done();
            })
            resolve()
        })
        await promise.then(done)
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_GATT_GETSERVICES_PROMISE_0001
     * @tc.name testGetServices
     * @tc.desc Test GetServices api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNACATION_bluetooth_GATT_GETSERVICES_PROMISE_0001', 0, async function (done) {
        let promise = new Promise((resolve) => {
            let gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
            gattClient.getServices().then((object) => {
                if (object != null) {
                    expect(true).assertEqual(true);
                } else {
                    console.info('[bluetooth_js] getServices successfully:'+JSON.stringify(object));
                    expect(null).assertFail();
                }
                done();
            }).catch(err => {
                console.error(`bluetooth getServices has error: ${err}`);
                expect(true).assertEqual(true);
                done();
            });
            resolve()
        })
        await promise.then(done)
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_GATT_SET_BLE_MTUSIZE_0001
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test SetBLEMtuSize api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNACATION_bluetooth_GATT_SET_BLE_MTUSIZE_0001', 0, async function (done) {
        let gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
        let ret = gattClient.setBLEMtuSize(128);
        console.info('[bluetooth_js] bluetooth setBLEMtuSize ret:' + ret);
        expect(ret).assertEqual(false);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_0100
     * @tc.name testReadDescriptorValue
     * @tc.desc Test ReadDescriptorValue api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_0100', 0, async function (done) {
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
        let gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
        await gattClient.readCharacteristicValue(characteristic).then((object) => {
            if (object != null) {
                console.error('bluetooth readCharacteristicValue promise object :'
                +JSON.stringify(object));                       
                expect(true).assertEqual(true);
            } else {
                console.info('[bluetooth_js] readCharacValue promise null:' + JSON.stringify(object));
                expect(null).assertFail();
            }
            done();
        }).catch(error => {
            console.error('[bluetooth_js] readCharacteristicValue promise has error:'
            +JSON.stringify(error));
            expect(true).assertEqual(true);
            done();
        })
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_0200
     * @tc.name testReadDescriptorValue
     * @tc.desc Test ReadDescriptorValue api by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_ReadCharacteristic_0200', 0, async function(done) {                               
        function readCcc(code, BLECharacteristic) {
            if (code.code != 0) {
                return;
            }
            console.log('bluetooth characteristic uuid:'+ BLECharacteristic.characteristicUuid);
            let value = new Uint8Array(BLECharacteristic.characteristicValue);
            console.log('bluetooth characteristic value: ' 
            + value[0] +','+ value[1]+','+ value[2]+','+ value[3]);
        }                                                                                              
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue:arrayBuffer};
        let arrayBufferCCC = new ArrayBuffer(8);
        let cccValue = new Uint8Array(arrayBufferCCC);
        cccValue[0] = 32;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
           characteristicValue: arrayBufferCCC, descriptors:descriptor};
        let gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
        let data = await gattClient.readCharacteristicValue(characteristic,readCcc);
        console.log('[bluetooth_js] readCharacteristicValue callback: ' + JSON.stringify(data))
        expect(true).assertEqual(data==null);
        done()
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_readDescriptor_0100
     * @tc.name testReadDescriptorValue
     * @tc.desc Test ReadDescriptorValue api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_readDescriptor_0100', 0, async function (done) {
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        let gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
        await gattClient.readDescriptorValue(descriptor).then((object) => {
            if (object != null) {
                console.error('readDescriptorValue promise object:'+JSON.stringify(object));                       
                expect(true).assertEqual(true);
                            
            } else {
                console.info('[bluetooth_js]readDescriptorValue null:' + JSON.stringify(object));
                expect(null).assertFail();
            }
            done();
        }).catch(error => {
            console.error('[bluetooth_js]readDescriptorValue promise error:'+JSON.stringify(error));
            expect(true).assertEqual(true);
            done();
       })
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_readDescriptor_0200
     * @tc.name testReadDescriptorValue
     * @tc.desc Test ReadDescriptorValue api by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_readDescriptor_0200', 0, async function (done) {                               
        function readDesc(code, BLEDescriptor) {
            if (code.code != 0) {
               console.info('[bluetooth_js] descriptor code: ' + BLEDescriptor.descriptorUuid);
               return;
            }
            console.info('[bluetooth_js] descriptor uuid: ' + BLEDescriptor.descriptorUuid);
            let value = new Uint8Array(BLEDescriptor.descriptorValue);
            console.info('[bluetooth_js] descriptor value: '
            + value[0] +','+ value[1]+','+ value[2]+','+ value[3]);
        }                                                                   
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
        desValue[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        let gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
        let data1 = await gattClient.readDescriptorValue(descriptor,readDesc);
        console.log('[bluetooth_js] readDescriptorValue callback: ' + JSON.stringify(data1))
        expect(true).assertEqual(data1==null);
        done()
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_0100
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test Client WriteCharacteristicValue api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_0100', 0, function () {
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
        let gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
        let ret = gattClient.writeCharacteristicValue(characteristic);
        console.info('[bluetooth_js] writeCharacteristicValue ret : ' + ret);
        expect(ret).assertEqual(false);
    })

     /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_0200
     * @tc.name testWriteCharacteristicValue
     * @tc.desc Test Client WriteCharacteristicValue api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_WriteCharacteristic_0200', 0,  function () {
        let gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
        let ret = gattClient.writeCharacteristicValue("123");
        console.info('[bluetooth_js]  invaild writeCharacteristicValue ret : ' + ret);
        expect(ret).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_0100
     * @tc.name testWriteDescriptorValue
     * @tc.desc Test Client WriteDescriptorValue api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_0100', 0,  function () {
        let arrayBuffer = new ArrayBuffer(8);
        let desValue =  new Uint8Array(arrayBuffer);
            desValue[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
                descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        let gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
        let ret = gattClient.writeDescriptorValue(descriptor);
        console.info('[bluetooth_js] bluetooth writeDescriptorValue ret : ' + ret);
        expect(ret).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_0200
     * @tc.name testWriteDescriptorValue
     * @tc.desc Test WriteDescriptorValue api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_WriteDescriptor_0200', 0,  function () {
        let gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
        let ret = gattClient.writeDescriptorValue("");
        console.info('[bluetooth_js] bluetooth writeDescriptorValue ret : ' + ret);
        expect(ret).assertEqual(false);
    })

     /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_NotifyCharacteristic_0100
     * @tc.name testSetNotifyCharacteristicChanged
     * @tc.desc Test SetNotifyCharacteristicChanged api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_0100', 0, async function (done) {
        let gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
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
        let ret = gattClient.setNotifyCharacteristicChanged(characteristic, true);
        console.info('[bluetooth_js] setNotifyCharacteristicChanged ret:' + ret);
        expect(ret).assertEqual(false);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_NotifyCharacteristic_0200
     * @tc.name testSetNotifyCharacteristicChanged
     * @tc.desc Test SetNotifyCharacteristicChanged api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_0200', 0, async function(done) {
        let gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
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
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_NotifyCharacteristic_0300
     * @tc.name testSetNotifyCharacteristicChanged
     * @tc.desc Test SetNotifyCharacteristicChanged api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_SetNotifyCharacteristic_0300', 0, async function (done) {
        let gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
        let ret = gattClient.setNotifyCharacteristicChanged(null, false);
        console.info('[bluetooth_js] setNotifyCharacteristicChanged is null ret:' + ret);
        expect(ret).assertEqual(false);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0100
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0100', 0, async function (done) {                     
        let gattServer = bluetooth.BLE.createGattServer();
        let service = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            isPrimary: true, includeServices: []};
        let ret = gattServer.addService(service);
        console.info('[bluetooth_js] bluetooth addService characteristics is null result:' + ret);
        expect(ret).assertTrue();
        await sleep(3000);
        let ret1=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        await sleep(3000);
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertTrue();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0200
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0200', 0, async function (done) {
        let gattServer = bluetooth.BLE.createGattServer();
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
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService a characteristics result : ' + ret);
        expect(ret).assertTrue();
        await sleep(3000);
        let ret1=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        await sleep(3000);
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertTrue();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0300
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0300', 0, async function (done) {
        let gattServer = bluetooth.BLE.createGattServer();                                
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
        let characteristicN = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001821-0000-1000-8000-00805F9B34FB', 
        characteristicValue: arrayBufferC, descriptors:descriptors};
        characteristics[0] = characteristic;
        characteristics[1] = characteristicN;
        let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FB', isPrimary: true,
        characteristics:characteristics, includeServices:[]};
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService more characteristics result : ' + ret);
        expect(ret).assertTrue();
        await sleep(3000);
        let ret1=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        await sleep(3000);
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertTrue();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0400
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0400', 0, async function (done) {
        let gattServer = bluetooth.BLE.createGattServer();
        let characteristics = [];
        let arrayBufferC = new ArrayBuffer(8);
        let cccV = new Uint8Array(arrayBufferC);
        cccV[0] = 1;
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', 
        characteristicValue: arrayBufferC, descriptors:[]};
        characteristics[0] = characteristic;
        let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FB', isPrimary: true,
        characteristics:characteristics, includeServices:[]};
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService not descriptors result : ' + ret);
        expect(ret).assertFalse();
        await sleep(3000);
        let ret1=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        await sleep(3000);
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertFalse();
        done();
    })
 
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0500
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0500', 0, async function (done) {
        let gattServer = bluetooth.BLE.createGattServer();
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
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService a descriptors result : ' + ret);
        expect(ret).assertTrue();
        await sleep(3000);
        let ret1=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        await sleep(3000);
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertTrue();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0600
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0600', 0, async function (done) {
        let gattServer = bluetooth.BLE.createGattServer();
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        
        let descriptor1 = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001821-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00001830-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};

        descriptors[0] = descriptor;
        descriptors[1] = descriptor1;
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
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService more descriptors result : ' + ret);
        expect(ret).assertTrue();
        await sleep(3000);
        let ret1=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        await sleep(3000);
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertTrue();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0700
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0700', 0, async function (done) {
        let gattServer = bluetooth.BLE.createGattServer();
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
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService isPrimary result : ' + ret);
        expect(ret).assertTrue();
        await sleep(3000);
        let ret1=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        await sleep(3000);
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertTrue();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0800
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0800', 0, async function (done) {
        let gattServer = bluetooth.BLE.createGattServer();
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
        let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FB', isPrimary: false,
        characteristics:characteristics, includeServices:[]};
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService isNotPrimary result : ' + ret);
        expect(ret).assertTrue();
        await sleep(3000);
        let ret1=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        await sleep(3000);
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertTrue();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0900
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_0900', 0, async function (done) {
        let gattServer = bluetooth.BLE.createGattServer();
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor = {serviceUuid: '',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let characteristics = [];
        let arrayBufferC = new ArrayBuffer(8);
        let cccV = new Uint8Array(arrayBufferC);
        cccV[0] = 1;
        let characteristic = {serviceUuid: '',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', 
        characteristicValue: arrayBufferC, descriptors:descriptors};
        characteristics[0] = characteristic;
        let gattService = {serviceUuid:'', isPrimary: true,
        characteristics:characteristics, includeServices:[]};
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService null serviceUuid result : ' + ret);
        expect(ret).assertTrue();
        await sleep(3000);
        let ret1=gattServer.removeService('');
        await sleep(3000);
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertTrue();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_1000
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_1000', 0, async function (done) {
        let gattServer = bluetooth.BLE.createGattServer();
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor = {serviceUuid: '123@ad',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: arrayBuffer};
        descriptors[0] = descriptor;
        let characteristics = [];
        let arrayBufferC = new ArrayBuffer(8);
        let cccV = new Uint8Array(arrayBufferC);
        cccV[0] = 1;
        let characteristic = {serviceUuid: '123@ad',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', 
        characteristicValue: arrayBufferC, descriptors:descriptors};
        characteristics[0] = characteristic;
        let gattService = {serviceUuid:'123@ad', isPrimary: true,
        characteristics:characteristics, includeServices:[]};
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService invalid serviceUuid result : ' + ret);
        expect(ret).assertTrue();
        await sleep(3000);
        let ret1=gattServer.removeService('123@ad');
        await sleep(3000);
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertTrue();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_1100
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_1100', 0, async function (done) {
        let gattServer = bluetooth.BLE.createGattServer();
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
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', descriptors:descriptors};
        characteristics[0] = characteristic;
        let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FB', isPrimary: true,
        characteristics:characteristics, includeServices:[]};
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService null characteristicValue result : ' + ret);
        expect(ret).assertFalse();
        await sleep(3000);
        let ret1=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertFalse();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_1200
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_AddService_1200', 0, async function (done) {
        let gattServer = bluetooth.BLE.createGattServer();
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
        characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
        descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB'};
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
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService null descriptorValue result : ' + ret);
        expect(ret).assertFalse();
        await sleep(3000);
        let ret1=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertFalse();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_RemoveService_0100
     * @tc.name testRemoveService
     * @tc.desc Test RemoveService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_RemoveService_0100', 0, async function (done) {
        let gattServer = bluetooth.BLE.createGattServer();
        let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FB', 
                 isPrimary: true,includeServices:[]};
        let gattService1 = {serviceUuid:'00001888-0000-1000-8000-00805f9b34fb',
                isPrimary: false,includeServices:[]};
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService1 result : ' + ret);
        expect(ret).assertTrue();
        let retN = gattServer.addService(gattService1);
        console.info('[bluetooth_js] bluetooth addService2 result : ' + retN);
        expect(retN).assertTrue();
        await sleep(3000);
        let ret1=gattServer.removeService('00001888-0000-1000-8000-00805f9b34fb');
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertTrue();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_RemoveService_0200
     * @tc.name testRemoveService
     * @tc.desc Test RemoveService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_RemoveService_0200', 0, async function (done) {
        let gattServer = bluetooth.BLE.createGattServer();
        let ret1=gattServer.removeService('00001800-0000-1000-8000-00805f9b3442');
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertFalse();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_RemoveService_0300
     * @tc.name testRemoveService
     * @tc.desc Test RemoveService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_RemoveService_0300', 0, async function (done) {
        let gattServer = bluetooth.BLE.createGattServer();
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
        let ret = gattServer.addService(gattService);
        console.info('[bluetooth_js] bluetooth addService result : ' + ret);
        expect(ret).assertTrue();
        await sleep(3000);
        let ret1=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        await sleep(2000);
        console.info('[bluetooth_js]removeService ret:'+ret1);
        expect(ret1).assertTrue();
        let ret2=gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
        await sleep(2000);
        console.info('[bluetooth_js]removeService ret:'+ret2);
        expect(ret2).assertFalse();
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_notifyCharacteristic_0100
     * @tc.name testNotifyCharacteristicChanged
     * @tc.desc Test NotifyCharacteristicChanged api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_notifyCharacteristic_0100', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: descV};
        descriptors[0] = descriptor;
        let arrayBufferC = new ArrayBuffer(8);
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', characteristicValue:
           arrayBufferC, descriptors:descriptors};
        let notifyCharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001821-0000-1000-8000-00805F9B34FB', characteristicValue: 
          characteristic.characteristicValue, confirm: false};
        let ret = gattServer.notifyCharacteristicChanged('00:11:22:33:44:55', notifyCharacteristic);
        console.info('[bluetooth_js] notifyCharacteristicChanged ret : ' + ret);
        expect(ret).assertEqual(false);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_notifyCharacteristic_0200
     * @tc.name testNotifyCharacteristicChanged
     * @tc.desc Test NotifyCharacteristicChanged api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_notifyCharacteristic_0200', 0, async function (done) {
        let descriptors = [];
        let arrayBuffer = new ArrayBuffer(8);
        let descV = new Uint8Array(arrayBuffer);
        descV[0] = 11;
        let descriptor = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB',
          descriptorUuid: '00002902-0000-1000-8000-00805F9B34FB', descriptorValue: descV};
        descriptors[0] = descriptor;
        let arrayBufferC = new ArrayBuffer(8);
        let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', characteristicValue:
           arrayBufferC, descriptors:descriptors};
        let notifyCharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
          characteristicUuid: '00001821-0000-1000-8000-00805F9B34FB', characteristicValue: 
          characteristic.characteristicValue, confirm: false};
        let ret = gattServer.notifyCharacteristicChanged('00:11:22:33:44:55', notifyCharacteristic);
        console.info('[bluetooth_js] notifyCharacteristicChanged ret : ' + ret);
        expect(ret).assertEqual(false);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_notifyCharacteristic_0300
     * @tc.name testNotifyCharacteristicChanged
     * @tc.desc Test NotifyCharacteristicChanged api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_notifyCharacteristic_0300', 0, async function (done) {
        console.info('[bluetooth_js] SUB_COMMUNICATION_BLUETOOTH_BLE_notifyCharacteristic_0200');
        let ret = gattServer.notifyCharacteristicChanged('00:11:22:33:44:55', null);
        console.info('[bluetooth_js] notifyCharacteristicChanged ret : ' + ret);
        expect(ret).assertEqual(false);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_sendResponse_0200
     * @tc.name testSendResponse success
     * @tc.desc Test SendResponse api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_sendResponse_0100', 0, async function (done) {
        let arrayBuffer = new ArrayBuffer(8);
        let value =  new Uint8Array(arrayBuffer);
        value[0] = 1;
        let serverResponse = {deviceId: '00:11:22:33:44:55', transId: 1,
            status: 0, offset: 0, value: arrayBuffer};
        let ret = gattServer.sendResponse(serverResponse);
        console.info('[bluetooth_js] sendResponse ret : ' + ret);
        expect(ret).assertEqual(false);
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetoothble_GATTSERVER_CLOSE_0001
     * @tc.name testBlePeripheralManagerClose
     * @tc.desc Test BlePeripheralManagerClose api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNACATION_bluetoothble_GATTSERVER_CLOSE_0001', 0, async function (done) {
        try{
            let gattServer = bluetooth.BLE.createGattServer()
            let result = gattServer.close();
            console.info("[bluetooth_js] GattserverClose res:"+ JSON.stringify(result));
            expect(result).assertTrue();
        }catch(error){
            console.info("[bluetooth_js] GattserverClose err:" + JSON.stringify(error));
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_GATT_DISCONNRCT_0001
     * @tc.name testDisConnect
     * @tc.desc Test DisConnect api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNACATION_bluetooth_GATT_DISCONNRCT_0001', 0, async function (done) {
        let gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
        let ret = gattClient.disconnect();
        console.info('[bluetooth_js] gatt disconnect ret:' + ret);
        expect(ret).assertEqual(false);
        done();
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_GATT_CLIENT_CLOSE_0001
     * @tc.name testGattClientClose
     * @tc.desc Test GattClientClose api .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNACATION_bluetooth_GATT_CLIENT_CLOSE_0001', 0, async function (done) {
        try{
            let gattClient = bluetooth.BLE.createGattClientDevice("00:00:00:00:00:00");
            let result = gattClient.close();
            console.info("[bluetooth_js] GattclientClose result:" + JSON.stringify(result));
            expect(result).assertTrue();
        }catch(error){
            console.info("[bluetooth_js] GattclientClose err:" + JSON.stringify(error));
            expect(null).assertFail();
        }
        done();
    })

})
}

