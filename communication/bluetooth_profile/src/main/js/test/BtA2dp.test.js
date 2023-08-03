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

import bluetooth from '@ohos.bluetooth.a2dp';
import btAccess from '@ohos.bluetooth.access';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function btA2dpTest() {
describe('btA2dpTest', function() {
    let A2dpSourceProfile = null;
    function sleep(delay) {
        return new Promise(resovle => setTimeout(resovle, delay))
    }

    async function tryToEnableBt() {
        let sta = btAccess.getState();
        switch (sta) {
            case 0:
                btAccess.enableBluetooth();
                await sleep(10000);
                let sta1 = btAccess.getState();
                console.info('[bluetooth_js] bt turn off:' + JSON.stringify(sta1));
                break;
            case 1:
                console.info('[bluetooth_js] bt turning on:' + JSON.stringify(sta));
                await sleep(3000);
                break;
            case 2:
                console.info('[bluetooth_js] bt turn on:' + JSON.stringify(sta));
                break;
            case 3:
                btAccess.enableBluetooth();
                await sleep(10000);
                let sta2 = btAccess.getState();
                console.info('[bluetooth_js] bt turning off:' + JSON.stringify(sta2));
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
    }
    beforeAll(function () {
        console.info('beforeAll called')
        A2dpSourceProfile = bluetooth.createA2dpSrcProfile();
    })
    beforeEach(async function (done) {
        console.info('beforeEach called')
        await tryToEnableBt()
        done();
    })
    afterEach(function () {
        console.info('afterEach called')
    })
    afterAll(function () {
        console.info('afterAll called')
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHA2DP_STATE_0100
     * @tc.name test getPlayingState
     * @tc.desc Test getPlayingState api10.
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SUB_COMMUNICATION_BLUETOOTHA2DP_STATE_0100', 0, async function (done) {
        try {
            let state = A2dpSourceProfile.getPlayingState('11:22:33:44:55:66');
            assert(true).assertEqual(state == bluetooth.PlayingState.STATE_NOT_PLAYING || state == bluetooth.PlayingState.STATE_PLAYING);
        } catch (err) {
            console.error("bluetooth a2dp getPlayingState errCode:" + err.code + ",bluetooth a2dp getPlayingState errMessage:" + err.message);
            expect(err.code).assertEqual('2900099');
        }
        done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTHA2DP_STATE_0200
     * @tc.name test PlayingState
     * @tc.desc Test PlayingState api10.
     * @tc.type Function
     * @tc.level Level 1
     */
     it('SUB_COMMUNICATION_BLUETOOTHA2DP_STATE_0200', 0, async function (done) {
            let statePlaying = bluetooth.PlayingState.STATE_PLAYING;
            console.info("[bluetooth_js]PlayingState: " + JSON.stringify(statePlaying));
            expect(statePlaying).assertEqual(1);
            let stateNotPlaying = bluetooth.PlayingState.STATE_NOT_PLAYING;
            console.info("[bluetooth_js]PlayingState: " + JSON.stringify(stateNotPlaying));
            expect(stateNotPlaying).assertEqual(0);
            done();
    })

})
}