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

let hfpGatewayProfile = bluetooth.getProfile(4);


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

function on(ON_VALUE_TEST_ELEMENT) {
    return new Promise((resolve, reject) => {
        hfpGatewayProfile.on(ON_VALUE_TEST_ELEMENT, function (err, data) {
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
        hfpGatewayProfile.off(OFF_VALUE_TEST_ELEMENT, function (err, data) {
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
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_GET_PROFILE_0001
     * @tc.name testgetprofile
     * @tc.desc Test getProfile api.
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNACATION_bluetooth_DEVICE_JS_HFP_GET_PROFILE_0001', 0, async function (done) {
        console.info('[bluetooth_js] hfp get profile start');
        await tryToEnableBt();
        let proFile = bluetooth.getProfile(4);
        console.info('[bluetooth_js] get profile:' + JSON.stringify(proFile));
        expect(proFile != null).assertEqual(true);
        done();
    })


    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_HFP_GATWAY_PROFILE_CONN_0001
     * @tc.name testhfpGatewayProfileconnect
     * @tc.desc Test hfpGatewayProfile connect api.
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNACATION_bluetooth_DEVICE_JS_HFP_GATWAY_PROFILE_CONN_0001', 0, async function (done) {
        console.info('[bluetooth_js] hfpGatewayProfile the connect start');
        await tryToEnableBt();
        let conn = hfpGatewayProfile.connect('00:00:00:00:00:01');
        expect(conn).assertTrue();
        await sleep(2000);
        let disConn = hfpGatewayProfile.disconnect('00:00:00:00:00:01');
        console.info('[bluetooth_js] hfpGatewayProfile disconnect:' + disConn);
        expect(disConn).assertTrue();
        await sleep(2000);
        done();
    })


    /**
     * @tc.number SUB_COMMUNACATION_bluetooth_DEVICE_JS_HFP_GATWAY_PROFILE_ON_0001
     * @tc.name testhfpGatewayProfileon
     * @tc.desc Test hfpGatewayProfile on api.
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNACATION_bluetooth_DEVICE_JS_HFP_GATWAY_PROFILE_ON_0001', 0, async function (done) {
        try {
            await tryToEnableBt();
            console.info('[bluetooth_js] hfpGatewayProfile the on start');
            on("connectionStateChange", function (data) {
                console.info("[bluetooth_js] hfpGateway_on data " + JSON.stringify(data));
                expect(true).assertEqual(data !=null);
            });
        }catch(e) {
            expect(null).assertFail();
        }
        try {
            console.info('[bluetooth_js] hfpGatewayProfile the off test start');
            off("connectionStateChange", function (data) {
                console.info("[bluetooth_js] hfpGateway_off data-> " + JSON.stringify(data));
                expect(true).assertEqual(data ==null);
            });
        }catch(e) {
            expect(null).assertFail();
        }
        done();
    })

})

