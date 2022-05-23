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



let ProfileId = {
    PROFILE_A2DP_SINK : 0,
    PROFILE_A2DP_SOURCE : 1,
    PROFILE_AVRCP_CT : 2,
    PROFILE_AVRCP_TG : 3,
    PROFILE_HANDS_FREE_AUDIO_GATEWAY : 4,
    PROFILE_HANDS_FREE_UNIT : 5,
    PROFILE_HID_HOST : 6,
    PROFILE_PAN_NETWORK : 7
}

let PlayingState = {
        STATE_NOT_PLAYING : 0x0000 ,
        STATE_PLAYING : 0x0001,
    }

let a2dpSourceProfile = bluetooth.getProfile(1);


function on(ON_VALUE_TEST_ELEMENT) {
    return new Promise((resolve, reject) => {
        a2dpSourceProfile.on(ON_VALUE_TEST_ELEMENT, function (err, data) {
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
        a2dpSourceProfile.off(OFF_VALUE_TEST_ELEMENT, function (err, data) {
            if (err != undefined) {
                reject(err);
            } else {
                resolve(data);
            }
        })
    });
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
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_A2DP_GET_PROFILE_0001
     * @tc.name testgetprofile
     * @tc.desc Test getProfile api.
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNACATION_bluetooth_DEVICE_JS_A2DP_GET_PROFILE_0001', 0, async function (done) {
        console.info('[bluetooth_js] a2dp get profile start');
        await tryToEnableBt();
        let proFile = bluetooth.getProfile(1);
        console.info('[bluetooth_js] a2dp get profile result:' + JSON.stringify(proFile));
        expect(proFile != null).assertEqual(true);
        done();
    })


    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_A2DP_SOURCCE_PROFILE_CONN_0001
     * @tc.name testa2dpSourceProfileconnect
     * @tc.desc Test a2dpSourceProfile connect api.
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNACATION_bluetooth_DEVICE_JS_A2DP_SOURCCE_PROFILE_CONN_0001', 0, async function (done) {
        console.info('[bluetooth_js] a2dpSourceProfile the connect start');
        await tryToEnableBt();
        let conn = a2dpSourceProfile.connect('00:00:00:00:00:02');
        expect(conn).assertTrue();
        await sleep(3000);
        let disConn = a2dpSourceProfile.disconnect('00:00:00:00:00:02');
        console.info('[bluetooth_js] a2dpSourceProfile disconnect:' + JSON.stringify(disConn));
        expect(disConn).assertTrue();
        done();
    })



    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_A2DP_GET_PLAYING_STATE_0001
     * @tc.name testgetPlayingState
     * @tc.desc Test getPlayingState api.
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNACATION_bluetooth_DEVICE_JS_A2DP_GET_PLAYING_STATE_0001', 0, async function (done) {
        console.info('[bluetooth_js] a2dpSourceProfile getPlayingState start');
        await tryToEnableBt();
        let state = a2dpSourceProfile.getPlayingState('00:00:00:00:00:02');
        console.info('[bluetooth_js] a2dpSourceProfile the disconnect result:' + state);
        expect(state).assertEqual(0);
        await sleep(3000);
        done();
    })


    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_A2DP_SOURCCE_PROFILE_ON_0001
     * @tc.name testa2dpSourceProfileon
     * @tc.desc Test a2dpSourceProfile on api.
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNACATION_bluetooth_DEVICE_JS_A2DP_SOURCCE_PROFILE_ON_0001', 0, async function (done) {
        try {
            await tryToEnableBt();
            console.info('[bluetooth_js] a2dpSourceProfile the on start');
            on("connectionStateChange", function (data) {
                console.info("[bluetooth_js] a2dpSource_on data " + JSON.stringify(data));
                expect(true).assertEqual(data !=null);
                console.info("[bluetooth_js] StateChangeParam deviceId" + data.deviceId +
                "ProfileConnectionState" + data.state);
            });
        }catch(e) {
            expect(null).assertFail();
        }
        try {
            console.info('[bluetooth_js] a2dpSourceProfile the off test start');
            off("connectionStateChange", function (data) {
                console.info("[bluetooth_js] a2dpSource_off data-> " + JSON.stringify(data));
                expect(true).assertEqual(data ==null);
            });
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })

})

