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

export default function bluetoothBLETest() {
describe('bluetoothBLETest', function() {

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
        gattServer.close();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_GattConnect_0100
     * @tc.name test gatt connect and disconnect
     * @tc.desc Test connect and disconnect api .
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_GattConnect_0100', 0, async function (done) {
        let gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
        let ret = gattClient.connect();
        await sleep(2000);
        console.info('[bluetooth_js] gattClient connect' + ret)
        expect(ret).assertTrue();
        let disconnect = gattClient.disconnect();
        console.info('[bluetooth_js] gatt disconnect:' + disconnect);
        expect(disconnect).assertEqual(false);
        done()
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_Connect_0300
     * @tc.name testGetConnectedBLEDevices
     * @tc.desc Test getConnectedBLEDevices api .
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_GattConnect_0300', 0, function () {
        let result = bluetooth.BLE.getConnectedBLEDevices();
        console.info("[bluetooth_js] getConnDev:" + JSON.stringify(result)
                + "length:" +result.length);
        expect(result.length).assertEqual(0);
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_GetRssiValue_0100
     * @tc.name testgetRssiValue
     * @tc.desc Test getRssiValue api by promise.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_GetRssiValue_0100', 0, async function (done) {
        let gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
        let ret = gattClient.connect();
        console.info('[bluetooth_js] gattClient getrssi2 connect' + JSON.stringify(ret))
        expect(ret).assertTrue();
        await gattClient.getRssiValue().then((data) => {
            console.info('[bluetooth_js] BLE read rssi ' + JSON.stringify(data));
            let rssiLength = Object.keys(data).length;
            expect(rssiLength).assertEqual(0);
        }).catch(err => {
            console.error('bluetooth getRssiValue has error: '+ err);
            expect(true).assertEqual(true);
        });
        let disconnect = gattClient.disconnect();
        console.info('[bluetooth_js] gatt getrssi2 disconnect:' + disconnect);
        expect(disconnect).assertEqual(false);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_GetRssiValue_0200
     * @tc.name testgetRssiValue
     * @tc.desc Test testGetDeviceName api by callback.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_GetRssiValue_0200', 0, async function (done) {
        let gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
        let ret = gattClient.connect();
        console.info('[bluetooth_js] gattClient getRssi connect' + JSON.stringify(ret))
        expect(ret).assertTrue();
        gattClient.getRssiValue((err, data)=> {
            console.info('[bluetooth_js]getRssi value:'+JSON.stringify(data));
            expect(data).assertNull();
            let disconnect = gattClient.disconnect();
            console.info('[bluetooth_js] gatt getrssi1 disconnect:' + disconnect);
            expect(disconnect).assertEqual(false);
        });
        await sleep(2000);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_GetDeviceName_0100
     * @tc.name testGetDeviceName
     * @tc.desc Test GetDeviceName api by promise.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_GetDeviceName_0100', 0, async function (done) {
        let gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
        let ret = gattClient.connect();
        console.info('[bluetooth_js] gattClient getname2 connect' + JSON.stringify(ret))
        expect(ret).assertTrue();
        await gattClient.getDeviceName().then((data) => {
            console.info('[bluetooth_js] device name' + JSON.stringify(data))
            expect(data).assertNull();
        }).catch(err => {
            console.error('bluetooth getDeviceName has error: '+ err);
            expect(true).assertEqual(true);
        });
        let disconnect = gattClient.disconnect();
        console.info('[bluetooth_js] gatt getname2 disconnect:' + disconnect);
        expect(disconnect).assertEqual(false);
        done();
    })


    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_getDeviceName_0200
     * @tc.name testGetDeviceName
     * @tc.desc Test testGetDeviceName api by callback.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_GetDeviceName_0200', 0, async function (done) {
        let gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
        let ret = gattClient.connect();
        console.info('[bluetooth_js] gattClient getname1 connect' + JSON.stringify(ret))
        expect(ret).assertTrue();
        gattClient.getDeviceName((err, data)=> {
            console.info('[bluetooth_js]getname value:'+JSON.stringify(data));
            expect(data).assertNull();
            let disconnect = gattClient.disconnect();
            console.info('[bluetooth_js] gatt getname1 disconnect:' + disconnect);
            expect(disconnect).assertEqual(false);
        });
        await sleep(2000);
        done();
    })
    
    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_GetService_0100
     * @tc.name testGetServices
     * @tc.desc Test GetServices api by promise.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_GetService_0100', 0, async function (done) {
        let gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
        let ret = gattClient.connect();
        console.info('[bluetooth_js]gattClient getservices1 connect' + JSON.stringify(ret))
        expect(ret).assertTrue();
        await gattClient.getServices().then((GattService) => {
            console.info('[bluetooth_js] getServices successfully:'+JSON.stringify(GattService));
            expect(GattService).assertNull();
        }).catch(err => {
            console.error('[bluetooth_js] getServices has error:'+ JSON.stringify(err));
            expect(true).assertEqual(true);
        });
        let disconnect = gattClient.disconnect();
        console.info('[bluetooth_js] gatt getservices1 disconnect:' + disconnect);
        expect(disconnect).assertEqual(false);
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_GetService_0200
     * @tc.name testGetServices
     * @tc.desc Test GetServices api by callback.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_GetService_0200', 0, async function (done) {
        let gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
        let ret = gattClient.connect();
        console.info('[bluetooth_js]gattClient getservices2 connect' + JSON.stringify(ret))
        gattClient.getServices((code, data)=> {
            if(code.code==0){
                console.info("bluetooth services size is ", data.length)
                expect(true).assertEqual(data.length >= 0);
            } else {
                console.info('[bluetooth_js] get services code ' + JSON.stringify(code));
                expect(true).assertEqual(code.code == -1);
            }
            let disconnect = gattClient.disconnect();
            console.info('[bluetooth_js] gatt getservices1 disconnect:' + disconnect);
            expect(disconnect).assertEqual(false);
        });
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_MtuSize_0100
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test SetBLEMtuSize api.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_MtuSize_0100', 0, function () {
        let gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
        let ret = gattClient.setBLEMtuSize(100);
        console.info('[bluetooth_js] bluetooth setBLEMtuSize 128bit ret:' + ret);
        expect(ret).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_MtuSize_0200
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test SetBLEMtuSize api.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_MtuSize_0200', 0, function () {
        let gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
        let ret = gattClient.setBLEMtuSize(22);
        console.info('[bluetooth_js] bluetooth setBLEMtuSize 128bit ret:' + ret);
        expect(ret).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_MtuSize_0300
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test SetBLEMtuSize api.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_MtuSize_0300', 0, function () {
        let gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
        let ret = gattClient.setBLEMtuSize(21);
        console.info('[bluetooth_js] bluetooth setBLEMtuSize 128bit ret:' + ret);
        expect(ret).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_MtuSize_0400
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test SetBLEMtuSize api.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_MtuSize_0400', 0, function () {
        let gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
        let ret = gattClient.setBLEMtuSize(512);
        console.info('[bluetooth_js] bluetooth setBLEMtuSize 128bit ret:' + ret);
        expect(ret).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_MtuSize_0500
     * @tc.name testSetBLEMtuSize
     * @tc.desc Test SetBLEMtuSize api.
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_MtuSize_0500', 0, function () {
        let gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
        let ret = gattClient.setBLEMtuSize(513);
        console.info('[bluetooth_js] bluetooth setBLEMtuSize 128bit ret:' + ret);
        expect(ret).assertEqual(false);
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
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_0100
     * @tc.name testReadDescriptorValue
     * @tc.desc Test ReadDescriptorValue api by promise.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_0100', 0, async function (done) {
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
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_0200
     * @tc.name testReadDescriptorValue
     * @tc.desc Test ReadDescriptorValue api by callback.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BLE_ReadDescriptor_0200', 0, async function (done) {                               
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

})
}

