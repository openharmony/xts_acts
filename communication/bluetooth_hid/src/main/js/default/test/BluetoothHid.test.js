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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

let hidHostProfile = bluetooth.getProfile(6);

function on(ON_VALUE_TEST_ELEMENT) {
    return new Promise((resolve, reject) => {
        hidHostProfile.on(ON_VALUE_TEST_ELEMENT, function (err, data) {
            if (err != undefined) {
                reject(err);
            } else {
                resolve(data);
            }
        })
    });
}

function off(OFF_VALUE_TEST_ELEMENT) {
    return new Promise((resolve, reject) => {
        hidHostProfile.off(OFF_VALUE_TEST_ELEMENT, function (err, data) {
            if (err != undefined) {
                reject(err);
            } else {
                resolve(data);
            }
        })
    });
}

let ProfId = {
    PROFILE_A2DP_SINK : 0,
    PROFILE_A2DP_SOURCE : 1,
    PROFILE_AVRCP_CT : 2,
    PROFILE_AVRCP_TG : 3,
    PROFILE_HANDS_FREE_AUDIO_GATEWAY : 4,
    PROFILE_HANDS_FREE_UNIT : 5
}


describe('bluetoothhostTest', function () {
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
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GET_PROFILE_LOOP_0001
     * @tc.name looptestgetprofile(set parameterless)
     * @tc.desc Test getProfile api 1000 times.
     * @tc.author defu.zheng
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNACATION_bluetooth_DEVICE_JS_GET_PROFILE_LOOP_0001', 0, async function (done) {
        console.info('[bluetooth_js] loop get profile start');
        await tryToEnableBt();
        let proFile = bluetooth.getProfile(6);
        console.info('[bluetooth_js] loop get profile result:' + JSON.stringify(proFile));
        expect(proFile != null).assertEqual(true);
        done();
    })


    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GET_CONN_DEV_LOOP_0001
     * @tc.name looptestgetConnectionDevices(bluetooth mode is off)
     * @tc.desc Test getConnectionDevices api 1000 times.
     * @tc.author defu.zheng
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNACATION_bluetooth_DEVICE_JS_GET_CONN_DEV_LOOP_0001', 0, async function (done) {
        console.info('[bluetooth_js] loop get connection devices start');
        await tryToEnableBt();
        let arrDev = hidHostProfile.getConnectionDevices();
        console.info('[bluetooth_js] loop getconndev:' + JSON.stringify(arrDev)+ 'length'+ arrDev.length);
        expect(arrDev.length).assertEqual(0);
        done();
    })


    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GET_DEV_STATE_LOOP_0001
     * @tc.name looptestgetDeviceState(set a null value)
     * @tc.desc Test getDeviceState api 1000 times.
     * @tc.author defu.zheng
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNACATION_bluetooth_DEVICE_JS_GET_DEV_STATE_LOOP_0001', 0, async function (done) {
        console.info('[bluetooth_js] loop get device state start');
        await tryToEnableBt();
        let devState = hidHostProfile.getDeviceState('');
        console.info('[bluetooth_js] loop get device state result:' + JSON.stringify(devState));
        expect(devState).assertEqual(3);
        done();
    })


    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_HID_HOST_PROFILE_CONN_LOOP_0001
     * @tc.name looptesthidhostprofileconnect(set a null value)
     * @tc.desc Test hidHostProfile connect api 1000 times.
     * @tc.author defu.zheng
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNACATION_bluetooth_DEVICE_JS_HID_HOST_PROFILE_CONN_LOOP_0001', 0, async function (done) {
        console.info('[bluetooth_js] loop HidHostProfile the connect start');
        await tryToEnableBt();
        let conn = hidHostProfile.connect('');
        console.info('[bluetooth_js] loop HidHostProfile the connect result:' + JSON.stringify(conn));
        expect(conn).assertFalse();
        done();
    })


    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_HID_HOST_PROFILE_DISCONN_LOOP_0001
     * @tc.name looptesthidhostprofiledisconnect(set a null value)
     * @tc.desc Test hidHostProfile disconnect api 1000 times.
     * @tc.author defu.zheng
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNACATION_bluetooth_DEVICE_JS_HID_HOST_PROFILE_DISCONN_LOOP_0001', 0, async function (done) {
        console.info('[bluetooth_js] loop HidHostProfile the disconnect start');
        await tryToEnableBt();
        let disConn = hidHostProfile.disconnect('');
        console.info('[bluetooth_js] loop HidHostProfile the disconnect result:' + JSON.stringify(disConn));
        expect(disConn).assertFalse();
        done();
    })


    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_HID_HOST_PROFILE_ON_LOOP_0001
     * @tc.name looptesthidhostprofileon
     * @tc.desc Test hidHostProfile on api 1000 times.
     * @tc.author defu.zheng
     * @tc.size SMALL
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNACATION_bluetooth_DEVICE_JS_HID_HOST_PROFILE_ON_LOOP_0001', 0, async function (done) {
        try {
            await tryToEnableBt();
            console.info('[bluetooth_js] loop HidHostProfile the on start');
            on("connectionStateChange", function (data) {
                console.info("[bluetooth_js] HidHostProfile_on data " + JSON.stringify(data));
                expect(true).assertEqual(data !=null);
            });
        }catch(e) {
            expect(null).assertFail();
        }
        try {
            console.info('[bluetooth_js] HidHostProfile the off test start');
            off("connectionStateChange", function (data) {
                console.info("[bluetooth_js] HidHostProfile_off data-> " + JSON.stringify(data));
                expect(true).assertEqual(data ==null);
            });
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })

})

