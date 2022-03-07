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
        var enable = bluetooth.enableBluetooth();
        expect(enable).assertEqual(true);
        console.info('[bluetooth_js] enable On = '+ JSON.stringify(enable));
        await sleep(10000);
        var state = bluetooth.getState();
        console.info('[bluetooth_js] getState On = '+ JSON.stringify(state));
        await bluetooth.off('stateChange', result => {
            console.info("stateChange off:" + JSON.stringify(result));
            expect(true).assertEqual(result ==null);
            done();
        });
        console.info('bluetooth enable done');
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

        await bluetooth.off('bluetoothDeviceFind', result => {
            console.info("bluetoothDeviceFind off:" + JSON.stringify(result));
            expect(true).assertEqual(result ==null);
            done();
        });
        console.info('[bluetooth_js] discovery end');
        done();
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
        var enable = bluetooth.enableBluetooth();
        expect(enable).assertEqual(true);
        console.info('[bluetooth_js] enable On1 = '+ JSON.stringify(enable));
        await sleep(5000);
        var state = bluetooth.getState();
        console.info('[bluetooth_js] getState On1 = '+ JSON.stringify(state));

        await bluetooth.BLE.on("BLEDeviceFind", onReceiveEvent)
        function onReceiveEvent(data) {
            console.info('[bluetooth_js] BLE scan device find result3 = '+ JSON.stringify(data))
            expect(data.length).assertLarger(0);
            //bluetooth.BLE.stopBLEScan();
            done();
        }
        bluetooth.BLE.startBLEScan([{}]);
        bluetooth.BLE.off('BLEDeviceFind', result => {
            console.info("[bluetooth_js] BLE scan device find off2:" + JSON.stringify(result));
            expect(true).assertEqual(result ==null);
            done();
        });
        console.info('[bluetooth_js] BLE scan start end');
        done();
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
    it('bluetooth_classic_pair_device_0001', 0, async function (done) {
        console.info('[bluetooth_js] pair device start');
        await bluetooth.BLE.on('pinRequired', result => {
            console.info("[bluetooth_js] pinRequired on:" + JSON.stringify(result));
            bluetooth.setDevicePairingConfirmation(result,false);
            expect(true).assertEqual(result !=null);
            done();
        });
        var enable = bluetooth.pairDevice("00:00:00:00:00:00")
        bluetooth.BLE.off('pinRequired', result => {
            console.info("[bluetooth_js] pinRequired off:" + JSON.stringify(result));
            expect(true).assertEqual(result ==null);
            done();
        });
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_PAIR_DEVICE_0002
     * @tc.name testClassicPairDevice
     * @tc.desc Test ClassicPairDevice api.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_pair_device_0002', 0, async function (done) {
        console.info('[bluetooth_js] pair device start');
        await bluetooth.BLE.on('bondStateChange', result => {
            console.info("[bluetooth_js] bondStateChange on:" + JSON.stringify(result));
            console.info('[bluetooth_js] bondStateChange deviceId: ' + data.deviceId);
            console.info('[bluetooth_js] bondStateChange state: ' + data.state);
            expect(true).assertEqual(result !=null);
            done();
        });
        var enable = bluetooth.pairDevice("00:00:00:00:00:00")
        bluetooth.BLE.off('bondStateChange', result => {
            console.info("[bluetooth_js] bondStateChange off:" + JSON.stringify(result));
            expect(true).assertEqual(result ==null);
            done();
        });
        console.info('[bluetooth_js]INVALID' + JSON.stringify(bluetooth.BondState.BOND_STATE_INVALID));
        console.info('[bluetooth_js]BONDING' + JSON.stringify(bluetooth.BondState.BOND_STATE_BONDING));
        console.info('[bluetooth_js]BONDED' + JSON.stringify(bluetooth.BondState.BOND_STATE_BONDED));
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
    it('bluetooth_spp_listen', 0, async function (done) {
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
    it('bluetoothble_CharacteristicReadOn_test_001', 0, async function (done) {
        try {
            console.info('[bluetooth_js] CharacteristicReadOn test start');
            if (gattServer == null) {
                console.info("[bluetooth_js] : click onCreateGattServer first!");
            }
            await gattServer.on('characteristicRead', function (data) {
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
            });
        }catch(e) {
            expect(null).assertFail();
        }

        try {
            console.info('[bluetooth_js] characteristicRead test1 start');
            if (gattServer == null) {
                console.info("[bluetooth_js] :plese CreateGattServer first!");
            }
            await gattServer.off('characteristicRead', function (data) {
                console.info("[bluetooth_js] charaRead off jsdata1:" + JSON.stringify(data));
                console.info("[bluetooth_js] charaRead off data1:" + data);
                expect(true).assertEqual(data ==null);
            });
        }catch(e) {
            expect(null).assertFail();
        }
        done();
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
    it('bluetoothble_CharacteristicwriteOn_test_001', 0, async function (done) {
        try {
            console.info('[bluetooth_js] CharacteristicwriteOn test start');
            if (gattServer == null) {
                console.info("[bluetooth_js] : click onCreateGattServer first!");
            }
            await gattServer.on('characteristicWrite', function (data) {
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
            });
        }catch(e) {
            expect(null).assertFail();
        }

        try {
            console.info('[bluetooth_js] characteristicWrite test1 start');
            if (gattServer == null) {
                console.info("[bluetooth_js] :plese CreateGattServer first!");
            }
            await gattServer.off('characteristicWrite', function (data) {
                console.info("[bluetooth_js] charaWrite off jsdata2:" + JSON.stringify(data));
                console.info("[bluetooth_js] charaWrite off data2:" + data);
                expect(true).assertEqual(data ==null);
            });
        }catch(e) {
            expect(null).assertFail();
        }
        done();
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
            await gattServer.on('descriptorRead', function (data) {
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
        }catch(e) {
            expect(null).assertFail();
        }

        try {
            console.info('[bluetooth_js] descriptorReadOff test start ...');
            if (gattServer == null) {
                console.info("[bluetooth_js] onAddServiceHelper:click onCreateGattServer first!");
            }
            await gattServer.off('descriptorRead', function (data) {
                console.info("[bluetooth_js] descriptorRead_off json_data-> " + JSON.stringify(data));
                console.info("[bluetooth_js] descriptorRead_off data -> " + data);
                expect(true).assertEqual(data ==null);
            });
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
            await gattServer.on('descriptorWrite', function (data) {
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
        }catch(e) {
            expect(null).assertFail();
        }

        try {
            console.info('[bluetooth_js] descriptorWriteOff test start ...');
            if (gattServer == null) {
                console.info("[bluetooth_js] onAddServiceHelper: please click CreateGattServer first!");
            }
            await gattServer.off('descriptorWrite', function (data) {
                console.info("[bluetooth_js] desWriOff jsonData-> " + JSON.stringify(data));
                console.info("[bluetooth_js] desWriOff data -> " + data);
                expect(true).assertEqual(data ==null);
            });
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
                console.info("[bluetooth_js] on: click CreateGattServer first!");
            }
            await gattServer.on('connectStateChange', function (data) {
                console.info("[bluetooth_js] connectStaOn jsonData -> " + JSON.stringify(data));
                console.info("[bluetooth_js] connectStaOn data -> " + data);
                expect(true).assertEqual(data !=null);
                console.info('[bluetooth_js] connectStaOn callback data ->');
                console.info('[bluetooth_js] connectStaOn deviceId: ' + data.deviceId);
                console.info('[bluetooth_js] connectStaOn state: ' + data.state);
            });
        }catch(e) {
            expect(null).assertFail();
        }

        try {
            console.info('[bluetooth_js] ConnectStateChangeOff test start ...');
            if (gattServer == null) {
                console.info("[bluetooth_js] on: please click onCreateGattServer first!");
            }
            await gattServer.off('connectStateChange', function (data) {
                console.info("[bluetooth_js] connectStateChange_off jsonData-> " + JSON.stringify(data));
                console.info("[bluetooth_js] connectStateChange_off data -> " + data);
                expect(true).assertEqual(data ==null);
            });
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
            await gattClient.on('BLECharacteristicChange', function (data) {
                console.info("[bluetooth_js] BLECharacteristicChange data " + JSON.stringify(data));
                console.info("[bluetooth_js] BLECharacteristicChange_on data -> " + data);
                expect(true).assertEqual(data !=null);
            });
        }catch(e) {
            expect(null).assertFail();
        }

        try {
            console.info('[bluetooth_js] BLECharacteristicChangeOff test start');
            if (gattClient == null) {
                console.info("[bluetooth_js] OnGattclientClose: CreateGattClientDevice first!");
            }
            await gattClient.off('BLECharacteristicChange', function (data) {
                console.info("[bluetooth_js] BLECharcChange_off json_data-> " + JSON.stringify(data));
                console.info("[bluetooth_js] BLECharcChange_off data -> " + data);
                expect(true).assertEqual(data ==null);
            });
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
            await gattClient.on('BLEConnectionStateChange', function (data) {
                console.info("[bluetooth_js] BLEConnecStateChange_on data " + JSON.stringify(data));
                console.info("[bluetooth_js] BLEConneStateChange_on data -> " + data);
                expect(true).assertEqual(data !=null);

                console.info('[bluetooth_js] BLEConneStateChange deviceId : ' + data.deviceId);
                console.info('[bluetooth_js] BLEConneStateChange state : ' + data.state);
            });
        }catch(e) {
            expect(null).assertFail();
        }

        try {
            console.info('[bluetooth_js] BLEConnectionStateChangeOff test start');
            if (gattClient == null) {
                console.info("[bluetooth_js] GattclientClose:click CreateGattClientDevice first!");
            }
            await gattClient.off('BLEConnectionStateChange', function (data) {
                console.info("[bluetooth_js] BLEConneStateChange_off data-> " + JSON.stringify(data));
                console.info("[bluetooth_js] BLEConneStateChange_off data -> " + data);
                expect(true).assertEqual(data ==null);
            });
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
            await bluetooth.on("sppRead",-1, (result) => {
                console.info("[bluetooth_js] sppReadOn json_result -> " + JSON.stringify(result));
                console.info("[bluetooth_js] sppReadOn result -> " + result);
                expect(true).assertEqual(result !=null);
            });
        }catch(e) {
            expect(null).assertFail();
        }

        try {
            console.info('[bluetooth_js] sppReadOff test start ...');
            await bluetooth.off("sppRead",-1, (result) => {
                console.info("[bluetooth_js] sppReadOff json_result -> " + JSON.stringify(result));
                console.info("[bluetooth_js] sppReadOff result -> " + result);
                expect(true).assertEqual(result ==null);
            });
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })

})

