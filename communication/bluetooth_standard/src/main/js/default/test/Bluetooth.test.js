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
        var enable = bluetooth.enableBluetooth();
        expect(enable).assertEqual(true);
        console.info('[bluetooth_js] enable On = '+ JSON.stringify(enable));
        await sleep(2000);
        var state = bluetooth.getState();
        console.info('[bluetooth_js] getState On = '+ JSON.stringify(state));
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
        console.info('bluetooth enable done');
        done();
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
    it('bluetooth_classic_get_state', 0, function () {
        console.info('[bluetooth_js] get state start');
        var state = bluetooth.getState();
        console.info('get bluetooth state end');
        console.info('[bluetooth_js] get bluetooth state result = '+ JSON.stringify(state));
        expect(state).assertEqual(bluetooth.BluetoothState.STATE_ON);
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
    it('bluetooth_classic_set_local_name', 0, function () {
        console.info('[bluetooth_js] set localname start');
        var name = bluetooth.setLocalName('bluetooth_test');
        console.info('[bluetooth_js] appInfoTest enable bluetooth result = '+ JSON.stringify(name));
        expect(name).assertEqual(true);
        console.info('[bluetooth_js] set localname end');
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
        var result = bluetooth.pairDevice("00:00:00:00:00:00");
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
    it('bluetooth_classic_get_local_name', 0, function () {
        console.info('[bluetooth_js] get localName start');
        var localName = bluetooth.getLocalName();
        console.info('[bluetooth_js] get local Name result = ' + JSON.stringify(localName));
        expect(localName).assertEqual('bluetooth_test');
        console.info('[bluetooth_js] get localName end');
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
    it('bluetooth_classic_set_scan_mode', 0, function () {
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
    it('bluetooth_classic_get_scan_mode', 0, function () {
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
    it('bluetooth_classic_get_connection', 0, function () {
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
    it('bluetooth_classic_start_discovery', 0, function () {
        console.info('[bluetooth_js] discovery start');
        let result = bluetooth.startBluetoothDiscovery();
        console.info('[bluetooth_js] get bt connection state result' + JSON.stringify(result));
        expect(result).assertEqual(true);
        console.info('[bluetooth_js] discovery end');
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
    it('bluetooth_classic_stop_discovery', 0, function () {
        console.info('[bluetooth_js] stop discovery start');
        let result = bluetooth.stopBluetoothDiscovery();
        console.info("stopBluetoothDiscovery :" + JSON.stringify(result));
        expect(result).assertTrue();
        console.info('[bluetooth_js] stop discovery end');
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
    it('bluetooth_classic_get_paired_devices', 0, function () {
        console.info('[bluetooth_js] get paired devices start');
        var devices = bluetooth.getPairedDevices();
        console.info('[bluetooth_js] get paired devices result:' + JSON.stringify(devices));
        console.info("[bluetooth_js] getConnectedDevices length:" + devices.length);
        expect(devices.length).assertEqual(0);
        console.info('[bluetooth_js] get paired devices end');
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
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_SPP_ACCEPT_0001
     * @tc.name testSppAccept
     * @tc.desc Test SppAccept api by callbck.
     * @tc.author quanli 00313334
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_spp_Accept', 0, async function (done) {
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
        done();
        console.log("[bluetooth_js] spp accept end");
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
    it('bluetooth_spp_closeServerSocket', 0, function () {
        console.log("[bluetooth_js] spp closeServerSocket start");
        let ret = bluetooth.sppCloseServerSocket(-1);
        console.info('[bluetooth_js] bluetooth sppCloseServerSocket ret : ' + ret);
        expect(ret).assertEqual(false);
        console.log("[bluetooth_js] spp closeServerSocket end");
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
    it('bluetooth_spp_connect', 0, async function (done) {
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
    it('bluetooth_spp_write', 0, function () {
        console.info('[bluetooth_js] spp write start');
        let arrayBuffer = new ArrayBuffer(8);
        let data =  new Uint8Array(arrayBuffer);
        data[0] = 123;
        let ret = bluetooth.sppWrite(-1, arrayBuffer);
        console.info('[bluetooth_js] bluetooth sppWrite ret : ' + ret);
        expect(ret).assertEqual(false);
        console.info('[bluetooth_js] spp write end');
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
    it('bluetooth_getRemoteDeviceName_test', 0, function () {
        console.info('[bluetooth_js] getRemoteDeviceName start');
        let ret = bluetooth.getRemoteDeviceName("00:00:00:00:00:00");
        console.info('[bluetooth_js] getRemoteDeviceName ret : ' + ret);
        console.info('[bluetooth_js] getRemoteDeviceName ret2 : ' + JSON.stringify(ret));
        expect(ret.length).assertEqual(0);
        console.info('[bluetooth_js] getRemoteDeviceName end.');
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
    it('bluetooth_getRemoteDeviceClass_test', 0, function () {
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
    it('bluetooth_cancelPairedDevice_test', 0, function () {
        console.info('[bluetooth_js] cancelPairedDevice start');
        let ret = bluetooth.cancelPairedDevice("00:00:00:00:00:00");
        console.info('[bluetooth_js] cancelPairedDevice ret : ' + ret);
        console.info('[bluetooth_js] cancelPairedDevice ret2 : ' + JSON.stringify(ret));
        expect(ret).assertFalse();
        console.info('bluetooth cancelPairedDevice end.');
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_SET_LOCAL_NAME_0001
     * @tc.name testsetLocalName
     * @tc.desc Test setLocalName api.
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_set_local_name1', 0, async function () {
        console.info('[bluetooth_js] set localname start');
        var state = bluetooth.getState();
        console.info('[bluetooth_js] getState step1 = '+ JSON.stringify(state));
        var name = bluetooth.setLocalName('');
        console.info('[bluetooth_js] setLocalName result1 = '+ JSON.stringify(name));
        expect(name).assertFalse();
        var localName = bluetooth.getLocalName();
        console.info('[bluetooth_js] getLocalName result1 = ' + JSON.stringify(localName));
        console.info('[bluetooth_js] setLocalName end');
    })


    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_SET_LOCAL_NAME_0002
     * @tc.name testsetLocalName
     * @tc.desc Test setLocalName api.
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_set_local_name2', 0, function () {
        console.info('[bluetooth_js] set localname start');
        var name = bluetooth.setLocalName();
        console.info('[bluetooth_js] setLocalName result2 = '+ JSON.stringify(name));
        expect(name).assertNull();
        var localName = bluetooth.getLocalName();
        console.info('[bluetooth_js] getLocalName result2 = ' + JSON.stringify(localName));
        console.info('[bluetooth_js] setLocalName end');
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_SET_LOCAL_NAME_0003
     * @tc.name testsetLocalName
     * @tc.desc Test setLocalName api.
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_set_local_name3', 0, function () {
        console.info('[bluetooth_js] set localname start');
        var name = bluetooth.setLocalName('012345678901234567890123456789012345678901234567890123'
        +'45678901234567890123456789012345678901234567890123456789012345678901234567');
        console.info('[bluetooth_js] setLocalName result3 = '+ JSON.stringify(name));
        expect(name).assertTrue();
        var localName = bluetooth.getLocalName();
        console.info('[bluetooth_js] getLocalName result3 = ' + JSON.stringify(localName));
        console.info('[bluetooth_js] setLocalName end');
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_SET_LOCAL_NAME_0004
     * @tc.name testsetLocalName
     * @tc.desc Test setLocalName api.
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_set_local_name4', 0, function () {
        console.info('[bluetooth_js] set localname start');
        var name = bluetooth.setLocalName('01234567890123456789012345678901234567890123456'
        +'7890123456789012345678901234567890123456789012345678901234567890123456789012345678');
        console.info('[bluetooth_js] setLocalName result4 = '+ JSON.stringify(name));
        expect(name).assertTrue();
        var localName = bluetooth.getLocalName();
        console.info('[bluetooth_js] getLocalName result4 = ' + JSON.stringify(localName));
        console.info('[bluetooth_js] setLocalName end');
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_SET_LOCAL_NAME_0005
     * @tc.name testsetLocalName
     * @tc.desc Test setLocalName api.
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_set_local_name5', 0, function () {
        console.info('[bluetooth_js] set localname start');
        var name = bluetooth.setLocalName('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
        console.info('[bluetooth_js] setLocalName result5 = '+ JSON.stringify(name));
        expect(name).assertTrue();
        var localName = bluetooth.getLocalName();
        console.info('[bluetooth_js] getLocalName result5 = ' + JSON.stringify(localName));
        console.info('[bluetooth_js] setLocalName end');
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_SET_LOCAL_NAME_0006
     * @tc.name testsetLocalName
     * @tc.desc Test setLocalName api.
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_set_local_name6', 0, function () {
        console.info('[bluetooth_js] set localname start');
        var name = bluetooth.setLocalName('测试蓝牙名称是否正常测试蓝牙名称是否试蓝牙');
        console.info('[bluetooth_js] setLocalName result6 = '+ JSON.stringify(name));
        expect(name).assertTrue();
        var localName = bluetooth.getLocalName();
        console.info('[bluetooth_js] getLocalName result6 = ' + JSON.stringify(localName));
        console.info('[bluetooth_js] setLocalName end');
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_SET_LOCAL_NAME_0007
     * @tc.name testsetLocalName
     * @tc.desc Test setLocalName api.
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_set_local_name7', 0, function () {
        console.info('[bluetooth_js] set localname start');
        var name = bluetooth.setLocalName('*^_^* 、。·ˉˇ¨〃々—～‖·‘’“”「『』〖❂【±×'
        +'÷∶∧∨∑∏∪∩∈∷√⊥‖∠⌒⊙∫∮≡≌≈∽∝≠♂♀°℃＄¤￠￡‰§№☆★○●◎◇□■△※→←↑↓〓');
        console.info('[bluetooth_js] setLocalName result7 = '+ JSON.stringify(name));
        expect(name).assertTrue();
        var localName = bluetooth.getLocalName();
        console.info('[bluetooth_js] getLocalName result7 = ' + JSON.stringify(localName));
        console.info('[bluetooth_js] setLocalName end');
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_SET_LOCAL_NAME_0008
     * @tc.name testsetLocalName
     * @tc.desc Test setLocalName api.
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_set_local_name8', 0, function () {
        console.info('[bluetooth_js] set localname start');
        var name = bluetooth.setLocalName('测试蓝牙名称是否正试蓝牙\'名称是否[666]aaw');
        console.info('[bluetooth_js] setLocalName result8 = '+ JSON.stringify(name));
        expect(name).assertTrue();
        var localName = bluetooth.getLocalName();
        console.info('[bluetooth_js] getLocalName result8 = ' + JSON.stringify(localName));
        console.info('[bluetooth_js] setLocalName end');
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_SET_LOCAL_NAME_0009
     * @tc.name testsetLocalName
     * @tc.desc Test setLocalName api.
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_set_local_name9', 0, function () {
        console.info('[bluetooth_js] set localname start');
        var name = bluetooth.setLocalName('——◎◇◆□■△▲测试蓝牙');
        console.info('[bluetooth_js] setLocalName result9 = '+ JSON.stringify(name));
        expect(name).assertTrue();
        var localName = bluetooth.getLocalName();
        console.info('[bluetooth_js] getLocalName result9 = ' + JSON.stringify(localName));
        console.info('[bluetooth_js] setLocalName end');
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_SET_LOCAL_NAME_00010
     * @tc.name testsetLocalName
     * @tc.desc Test setLocalName api.
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_set_local_name10', 0, function () {
        console.info('[bluetooth_js] set localname start');
        var name = bluetooth.setLocalName('78453-、、。。◎◇◆□■△▲');
        console.info('[bluetooth_js] setLocalName result10 = '+ JSON.stringify(name));
        expect(name).assertTrue();
        var localName = bluetooth.getLocalName();
        console.info('[bluetooth_js] getLocalName result10 = ' + JSON.stringify(localName));
        console.info('[bluetooth_js] setLocalName end');
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_SET_LOCAL_NAME_00011
     * @tc.name testsetLocalName
     * @tc.desc Test setLocalName api.
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_set_local_name11', 0, function () {
        console.info('[bluetooth_js] set localname start');
        var name = bluetooth.setLocalName('hhhfdf-、、。。◎◇◆□■△▲');
        console.info('[bluetooth_js] setLocalName result11 = '+ JSON.stringify(name));
        expect(name).assertTrue();
        var localName = bluetooth.getLocalName();
        console.info('[bluetooth_js] getLocalName result11 = ' + JSON.stringify(localName));
        console.info('[bluetooth_js] setLocalName end');
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_SET_LOCAL_NAME_00012
     * @tc.name testsetLocalName
     * @tc.desc Test setLocalName api.
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_set_local_name12', 0, function () {
        console.info('[bluetooth_js] set localname start');
        var name = bluetooth.setLocalName('#01-5@<?;:!@$%^&*(1[]{【+-；：‘’“”测试=》《\'[6]');
        console.info('[bluetooth_js] setLocalName result12 = '+ JSON.stringify(name));
        expect(name).assertTrue();
        var localName = bluetooth.getLocalName();
        console.info('[bluetooth_js] getLocalName result12 = ' + JSON.stringify(localName));
        console.info('[bluetooth_js] setLocalName end');
    })

    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_SET_LOCAL_NAME_00013
     * @tc.name testsetLocalName
     * @tc.desc Test setLocalName api.
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_set_local_name13', 0, function () {
        console.info('[bluetooth_js] set localname start');
        var name = bluetooth.setLocalName('#01-567890@<>?/;:5675ASDF012345678!@'
        +'$%^&*()9012378901[]{}【】566~·67890blue');
        console.info('[bluetooth_js] setLocalName result13 = '+ JSON.stringify(name));
        expect(name).assertTrue();
        var localName = bluetooth.getLocalName();
        console.info('[bluetooth_js] getLocalName result13 = ' + JSON.stringify(localName));
        console.info('[bluetooth_js] setLocalName end');
    })


    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_SET_LOCAL_NAME_00014
     * @tc.name testsetLocalName
     * @tc.desc Test setLocalName api.
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('bluetooth_classic_set_local_name14', 0, function () {
        console.info('[bluetooth_js] set localname start');
        var name = bluetooth.setLocalName('0123456789012345678901234567890123456789012345678901'
        +'23456789012345678901234567890123456789012345678901234567890123456789012345678012'
        +'345678901234567890123456789012345678901234567890123456789012367890123456789012345568');
        console.info('[bluetooth_js] setLocalName result14 = '+ JSON.stringify(name));
        expect(name).assertTrue();
        var localName = bluetooth.getLocalName();
        console.info('[bluetooth_js] getLocalName result14 = ' + JSON.stringify(localName));
        console.info('[bluetooth_js] setLocalName end');
    })


    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_DISABLE_0001
     * @tc.name testdisablebluetooth
     * @tc.desc Test disablebluetooth api.
     * @tc.author zhangyujie zwx1079266
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */

    it('bluetooth_classic_disable_bluetooth', 0, function () {
        console.info('[bluetooth_js] disable test start');
        let disable = bluetooth.disableBluetooth();
        console.info('[bluetooth_js] disable:' + JSON.stringify(disable));
        expect(disable).assertTrue();
        var state = bluetooth.getState();
        console.info('[bluetooth_js] bt state:' + JSON.stringify(state));
        console.info('[bluetooth_js] disable end');
    })

})

