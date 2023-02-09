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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function bluetoothBLETest1() {
describe('bluetoothBLETest1', function() {

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
    beforeAll(async function (done) {
        console.info('beforeAll called')
        await tryToEnableBt()
        gattServer = bluetooth.BLE.createGattServer();
        gattClient = bluetooth.BLE.createGattClientDevice("11:22:33:44:55:66");
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
        gattServer.close();
    })


    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_Connect_0100
     * @tc.name test Server connectStateChange
     * @tc.desc Test on and off api .
     * @tc.size MEDIUM
     * @ since 7
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_Connect_0100', 0, async function (done) {
        try {
            function Connected(BLEConnectChangedState) {
                let deviceId = BLEConnectChangedState.deviceId;
                let status = BLEConnectChangedState.state;
                console.info("[bluetooth_js] connectStateChange jsondata:"
                 +'deviceId:' + deviceId + 'status:' + status);
                expect(true).assertEqual(BLEConnectChangedState !=null);
              }
            await gattServer.on("connectStateChange", Connected);
            gattClient.connect();
            await sleep(2000);
            await gattServer.off("connectStateChange");
            done()
        } catch (error) {
            console.error(`[bluetooth_js]Connect_0100 failed, code is ${error.code}, 
              message is ${error.message}`);
              expect(true).assertFalse();
        }
        
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_AddService_0100
     * @tc.name testAddService
     * @tc.desc Test api 401 - characteristics of service is null.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_AddService_0100', 0, async function (done) { 
        try {
            let service = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            isPrimary: true, includeServices: []};
            gattServer.addService(service);
            await sleep(1000);
            expect(true).assertFalse();
            gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
            await sleep(1000);
            done();
        } catch (error) {
            console.error('[bluetooth_js]AddService1 failed, error.code:'+JSON.stringify(error.code)
            +'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('401');  
            done()
        }
        
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_AddService_0200
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('COMMUNICATION_BLUETOOTH_BLE_AddService_0200', 0, async function (done) {
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
            await sleep(1000);
            gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
            await sleep(1000);
            done();
        } catch (error) {
            console.error(`[bluetooth_js]AddService2 failed, code is ${error.code},
                  message is ${error.message}`);
            expect(true).assertFalse();
            done()
        }       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_AddService_0300
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_AddService_0300', 0, async function (done) {
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
            let characteristicN = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001821-0000-1000-8000-00805F9B34FB', 
            characteristicValue: arrayBufferC, descriptors:descriptors};
            characteristics[0] = characteristic;
            characteristics[1] = characteristicN;
            let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FB', isPrimary: true,
            characteristics:characteristics, includeServices:[]};
            gattServer.addService(gattService);
            await sleep(1000);
            gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
            await sleep(1000);
            done();
        } catch (error) {
            console.error(`[bluetooth_js]AddService3 failed, code is ${error.code},
            message is ${error.message}`);
            expect(true).assertFalse();
            done()
        }
       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_AddService_0400
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_AddService_0400', 0, async function (done) {
        try {
            let characteristics = [];
            let arrayBufferC = new ArrayBuffer(8);
            let cccV = new Uint8Array(arrayBufferC);
            cccV[0] = 1;
            let characteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', 
            characteristicValue: arrayBufferC};
            characteristics[0] = characteristic;
            let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FB', isPrimary: true,
            characteristics:characteristics, includeServices:[]};
            gattServer.addService(gattService);
            await sleep(1000);
            expect(true).assertFalse();
            gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
            await sleep(1000);
            done();
        } catch (error) {
            console.error('[bluetooth_js]AddService4 failed, error.code:'+JSON.stringify(error.code)
            +'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('401');
            done()
        }
       
    })
 
    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_AddService_0500
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_AddService_0500', 0, async function (done) {
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
            await sleep(1000);
            gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
            await sleep(1000);
            done();
        } catch (error) {
            console.error(`[bluetooth_js]AddService5 failed, code is ${error.code},
            message is ${error.message}`);
            expect(true).assertFalse();
            done()
        }
       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_AddService_0600
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_AddService_0600', 0, async function (done) {
        try {
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
            gattServer.addService(gattService);
            await sleep(1000);
            gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
            await sleep(1000);
            done();
        } catch (error) {
            console.error(`[bluetooth_js]AddService6 failed, code is ${error.code},
            message is ${error.message}`);
            expect(true).assertFalse();
            done()
        }      
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_AddService_0700
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_AddService_0700', 0, async function (done) {
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
            await sleep(1000);
            gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
            await sleep(1000);
            done();
        } catch (error) {
            console.error(`[bluetooth_js]AddService7 failed, code is ${error.code},
            message is ${error.message}`);
            expect(true).assertFalse();
            done()
        }
        
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_AddService_0800
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_AddService_0800', 0, async function (done) {
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
            let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FB', isPrimary: false,
            characteristics:characteristics, includeServices:[]};
            gattServer.addService(gattService);
            await sleep(1000);
            gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
            await sleep(1000);
            done();
        } catch (error) {
            console.error(`[bluetooth_js]AddService8 failed, code is ${error.code},
            message is ${error.message}`);
            expect(true).assertFalse();
            done()
        }
        
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_AddService_0900
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_AddService_0900', 0, async function (done) {
        try {
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
            gattServer.addService(gattService);
            expect(true).assertFalse();
            await sleep(1000);
            gattServer.removeService('');
            await sleep(1000);
            done();
        } catch (error) {
            console.error('[bluetooth_js]AddService9 failed, error.code:'+JSON.stringify(error.code)
            +'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('401');
            done()
        }
        
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_AddService_1000
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_AddService_1000', 0, async function (done) {
        try {
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
            gattServer.addService(gattService);
            await sleep(1000);
            expect(true).assertFalse();
            gattServer.removeService('123@ad');
            await sleep(1000);
            done();
        } catch (error) {
            console.error('[bluetooth_js]AddService10 failed, error.code:'+JSON.stringify(error.code)
            +'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('401');
            done()
        }
        
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_AddService_1100
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_AddService_1100', 0, async function (done) {
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
            characteristicUuid: '00001820-0000-1000-8000-00805F9B34FB', descriptors:descriptors};
            characteristics[0] = characteristic;
            let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FB', isPrimary: true,
            characteristics:characteristics, includeServices:[]};
            gattServer.addService(gattService);
            await sleep(1000);
            expect(true).assertFalse();
            gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
            done();
        } catch (error) {
            console.error('[bluetooth_js]AddService11 failed, error.code:'+JSON.stringify(error.code)
            +'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('401');
            done()
        }
        
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_AddService_1200
     * @tc.name testAddService
     * @tc.desc Test AddService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_AddService_1200', 0, async function (done) {
        try {
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
            gattServer.addService(gattService);
            await sleep(1000);
            expect(true).assertFalse();
            gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
            done();
        } catch (error) {
            console.error('[bluetooth_js]AddService12 failed, error.code:'+JSON.stringify(error.code)
            +'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('401');
            done()
        }
       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_AddService_2000
     * @tc.name testAddService
     * @tc.desc Test api 401 - null gattService parameters.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('COMMUNICATION_BLUETOOTH_BLE_AddService_2000', 0, async function (done) {
        try {
            gattServer.addService();
            expect(true).assertFalse();
            await sleep(1000);
            done();
        } catch (error) {
            console.error('[bluetooth_js]addService20 error.code:'+JSON.stringify(error.code)+
                   'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('401');
            done()
        }       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_AddService_2100
     * @tc.name testAddService
     * @tc.desc Test api 401 -  parameters is null.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('COMMUNICATION_BLUETOOTH_BLE_AddService_2100', 0, async function (done) {
        try {
            gattServer.addService(null);
            expect(true).assertFalse();
            await sleep(1000);
            done();
        } catch (error) {
            console.error('[bluetooth_js]addService21 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('401');
            done()
        }       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_AddService_2200
     * @tc.name testAddService
     * @tc.desc Test api 401 - serviceUuid of gattService is null.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('COMMUNICATION_BLUETOOTH_BLE_AddService_2200', 0, async function (done) {
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
            let gattService = {isPrimary: true,
            characteristics:characteristics, includeServices:[]};
            gattServer.addService(gattService);
            await sleep(1000);
            gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
            await sleep(1000);
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error('[bluetooth_js]addService22 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('401');
            done()
        }       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_AddService_2300
     * @tc.name testAddService
     * @tc.desc Test api 401 - serviceUuid of gattService is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('COMMUNICATION_BLUETOOTH_BLE_AddService_2300', 0, async function (done) {
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
            let gattService = {serviceUuid:123123, isPrimary: true,
            characteristics:characteristics, includeServices:[]};
            gattServer.addService(gattService);
            await sleep(1000);
            gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
            await sleep(1000);
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error('[bluetooth_js]addService23 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('401');
            done()
        }       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_AddService_2400
     * @tc.name testAddService
     * @tc.desc Test api 401 - isPrimary of gattService is null.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('COMMUNICATION_BLUETOOTH_BLE_AddService_2400', 0, async function (done) {
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
            let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FB',
            characteristics:characteristics, includeServices:[]};
            gattServer.addService(gattService);
            await sleep(1000);
            gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
            await sleep(1000);
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error('[bluetooth_js]addService24 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('401');
            done()
        }       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_AddService_2500
     * @tc.name testAddService
     * @tc.desc Test api 401 - isPrimary of gattService is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('COMMUNICATION_BLUETOOTH_BLE_AddService_2500', 0, async function (done) {
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
            let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FB', isPrimary: '123S123',
            characteristics:characteristics, includeServices:[]};
            gattServer.addService(gattService);
            await sleep(1000);
            gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
            await sleep(1000);
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error('[bluetooth_js]addService25 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('401');
            done()
        }       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_AddService_2600
     * @tc.name testAddService
     * @tc.desc Test api 401 - characteristics of gattService is error type.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('COMMUNICATION_BLUETOOTH_BLE_AddService_2600', 0, async function (done) {
        try {
            let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FB', isPrimary: true,
            characteristics:"123sss",includeServices:[]};
            gattServer.addService(gattService);
            await sleep(1000);
            gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
            await sleep(1000);
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error('[bluetooth_js]addService26 error.code:'+JSON.stringify(error.code)+
            'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('401');
            done()
        }       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_RemoveService_0100
     * @tc.name testRemoveService
     * @tc.desc Test RemoveService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_RemoveService_0100', 0, async function (done) {
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
            let gattService = {serviceUuid:'00001810-0000-1000-8000-00805F9B34FB', 
                    isPrimary: true,characteristics:characteristics,includeServices:[]};
            let gattService1 = {serviceUuid:'00001888-0000-1000-8000-00805f9b34fb',
                    isPrimary: false,characteristics:characteristics,includeServices:[]};
            gattServer.addService(gattService);
            await sleep(1000);
            gattServer.addService(gattService1);
            await sleep(1000);
            gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
            done();
        } catch (error) {
            console.error(`[bluetooth_js]removeService1 failed, code is ${error.code},
            message is ${error.message}`);
            expect(true).assertFalse();
            done()
        }
        
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_RemoveService_0200
     * @tc.name testRemoveService
     * @tc.desc Test RemoveService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_RemoveService_0200', 0, async function (done) {
        try {
            gattServer.removeService('00001800-0000-1000-8000-00805f9b3442');
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error(`[bluetooth_js]removeService2 failed, code is ${error.code},
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }
       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_RemoveService_0300
     * @tc.name testRemoveService
     * @tc.desc Test RemoveService api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_RemoveService_0300', 0, async function (done) {
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
            await sleep(1000);
            gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
            await sleep(1000);
            gattServer.removeService('00001810-0000-1000-8000-00805F9B34FB');
            await sleep(1000);
            done();
        } catch (error) {
            console.error(`[bluetooth_js]removeService3 failed, code is ${error.code},
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }
    })
 
    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_RemoveService_0400
     * @tc.name testRemoveService
     * @tc.desc Test RemoveService 401-null parameter.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
      it('COMMUNICATION_BLUETOOTH_BLE_RemoveService_0400', 0, async function (done) {
        try {
            gattServer.removeService();
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error(`[bluetooth_js]removeService4 failed, code is ${error.code},
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }
       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_RemoveService_0500
     * @tc.name testRemoveService
     * @tc.desc Test RemoveService 401-error parameter.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_RemoveService_0500', 0, async function (done) {
        try {
            gattServer.removeService("sss");
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error(`[bluetooth_js]removeService5 failed, code is ${error.code},
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }   
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_notifyCharacteristic_0100
     * @tc.name testNotifyCharacteristicChanged
     * @tc.desc Test NotifyCharacteristicChanged api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_notifyCharacteristic_0100', 0, async function (done) {
        try {
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
            let NotifyCharacteristic = {serviceUuid: '00001810-0000-1000-8000-00805F9B34FB',
            characteristicUuid: '00001821-0000-1000-8000-00805F9B34FB', characteristicValue: 
            characteristic.characteristicValue, confirm: false};
            gattServer.notifyCharacteristicChanged('00:11:22:33:44:55', NotifyCharacteristic);
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error('[bluetooth_js]notifyCharacteristicChanged1 failed, code:'
            +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('401');
            done()
        }
        
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_notifyCharacteristic_0200
     * @tc.name testNotifyCharacteristicChanged
     * @tc.desc Test NotifyCharacteristicChanged api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('COMMUNICATION_BLUETOOTH_BLE_notifyCharacteristic_0200', 0, async function (done) {
        try {
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
            gattServer.notifyCharacteristicChanged('00:11:22:33:44:55', notifyCharacteristic);
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error('[bluetooth_js]notifyCharacteristicChanged2 failed, code:'
            +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('401');
            done()
        }
        
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_notifyCharacteristic_0300
     * @tc.name testNotifyCharacteristicChanged
     * @tc.desc Test NotifyCharacteristicChanged api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     */
    it('COMMUNICATION_BLUETOOTH_BLE_notifyCharacteristic_0300', 0, async function (done) {
        try {
            console.info('[bluetooth_js] COMMUNICATION_BLUETOOTH_BLE_notifyCharacteristic_0200');
            gattServer.notifyCharacteristicChanged('00:11:22:33:44:55', null);
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error('[bluetooth_js]notifyCharacteristicChanged3 failed, code:'
            +JSON.stringify(error.code)+'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('401');  
            done()
        }
       
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_sendResponse_0100
     * @tc.name testSendResponse success
     * @tc.desc Test SendResponse api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('COMMUNICATION_BLUETOOTH_BLE_sendResponse_0100', 0, async function (done) {
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
            console.error(`[bluetooth_js]sendResponse1 failed, code is ${error.code},
            message is ${error.message}`);
            expect(error.code).assertEqual('2900099');
            done()
        }
        
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_sendResponse_0200
     * @tc.name testSendResponse success
     * @tc.desc Test SendResponse api.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('COMMUNICATION_BLUETOOTH_BLE_sendResponse_0200', 0, async function (done) {
        try {
            let arrayBuffer = new ArrayBuffer(8);
            let value =  new Uint8Array(arrayBuffer);
            value[0] = 1;
            let ServerResponse = {deviceId: '00:11:22:33:44:55', transId: 1,
                status: -1, offset: 0, value: arrayBuffer};
            gattServer.sendResponse(ServerResponse);
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error(`[bluetooth_js]sendResponse2 failed, code is ${error.code},
            message is ${error.message}`);
            expect(error.code).assertEqual('2900099');
            done()
        }
        
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_sendResponse_0300
     * @tc.name testSendResponse success
     * @tc.desc Test SendResponse 401 -null parameter.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('COMMUNICATION_BLUETOOTH_BLE_sendResponse_0300', 0, async function (done) {
        try {
            gattServer.sendResponse();
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error('[bluetooth_js]sendResponse3 error.code:'+JSON.stringify(error.code)+
                   'error.message:'+JSON.stringify(error.message));
            expect(error.code).assertEqual('401');
            done()
        }
        
    })

    /**
     * @tc.number COMMUNICATION_BLUETOOTH_BLE_sendResponse_0400
     * @tc.name testSendResponse success
     * @tc.desc Test SendResponse 401 -error parameter.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('COMMUNICATION_BLUETOOTH_BLE_sendResponse_0400', 0, async function (done) {
        try {
            let arrayBuffer = new ArrayBuffer(8);
            let value =  new Uint8Array(arrayBuffer);
            value[0] = 1;
            let ServerResponse = {transId: 1,
                status: -1, offset: 0, value: arrayBuffer};
            gattServer.sendResponse(ServerResponse);
            expect(true).assertFalse();
            done();
        } catch (error) {
            console.error(`[bluetooth_js]sendResponse4 failed, code is ${error.code},
            message is ${error.message}`);
            expect(error.code).assertEqual('401');
            done()
        }
        
    })


})
}


