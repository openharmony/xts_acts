
/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bluetooth from '@ohos.bluetoothManager';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'


export default function btManagerErrorCode202Test() {
describe('btManagerErrorCode202Test', function() {
    function sleep(delay) {
        return new Promise(resovle => setTimeout(resovle, delay))
    }

    async function tryToEnableBt() {
        let sta = bluetooth.getState();
        switch(sta){
            case 0:
                console.info('[bluetooth_js] bt turn off:'+ JSON.stringify(sta));
                bluetooth.enableBluetooth();
                await sleep(10000);
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
                await sleep(10000);
                break;
            default:
                console.info('[bluetooth_js] enable success');
        }
    }
    beforeAll(function () {
        console.info('beforeAll called')
    })
    beforeEach(async function (done) {
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
     * @tc.number SUB_COMMUNICATION_BTMANAGER_PAIR_ERROR202_0100
     * @tc.name test cancelPairedDevice
     * @tc.desc Test api 202 - Non-system applications are not allowed to use system APIs.
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_COMMUNICATION_BTMANAGER_PAIR_ERROR202_0100', 0, async function (done) {
          try {
               bluetooth.cancelPairedDevice('11:22:33:44:55:66');
          } catch (err) {
               console.info('errCode: ' + err.code + ',errMessage: ' + err.message);
               expect(err.code).assertEqual("202");
          }
          done();
     })

     /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_HOSTCONN_ERROR202_0200
     * @tc.name test hid host disconnect
     * @tc.desc Test api 202 - Non-system applications are not allowed to use system APIs.
     * @tc.type Function
     * @tc.level Level 0
     */
     it('SUB_COMMUNICATION_BTMANAGER_HOSTCONN_ERROR202_0200', 0, async function (done) {
          try {
               let hidHostProfile = bluetooth.getProfileInstance(bluetooth.ProfileId.PROFILE_HID_HOST);
               hidHostProfile.disconnect('11:22:33:44:55:66');
          } catch (err) {
               console.info('errCode: ' + err.code + ',errMessage: ' + err.message);
               expect(err.code).assertEqual('202');
          }
          done();
     })

     /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_PANDISCONN_ERROR202_0100
     * @tc.name test pan disconnect
     * @tc.desc Test api 202 - Non-system applications are not allowed to use system APIs.
     * @tc.type Function
     * @tc.level Level 0
     */
     it('SUB_COMMUNICATION_BTMANAGER_PANDISCONN_ERROR202_0100', 0, async function (done) {
          try {
               let panProfile = bluetooth.getProfileInstance(bluetooth.ProfileId.PROFILE_PAN_NETWORK);
               panProfile.disconnect('11:22:33:44:55:66');
          } catch (err) {
               console.info('errCode: ' + err.code + ',errMessage: ' + err.message);
               expect(err.code).assertEqual('202');
          }
          done();
     })

     /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_TETHERING_ERROR202_0100
     * @tc.name test setTethering
     * @tc.desc Test api 202 - Non-system applications are not allowed to use system APIs.
     * @tc.type Function
     * @tc.level Level 0
     */
     it('SUB_COMMUNICATION_BTMANAGER_TETHERING_ERROR202_0100', 0, async function (done) {
          try {
               let panProfile = bluetooth.getProfileInstance(bluetooth.ProfileId.PROFILE_PAN_NETWORK);
               panProfile.setTethering(true);
          } catch (err) {
               console.info('errCode: ' + err.code + ',errMessage: ' + err.message);
               expect(err.code).assertEqual('202');
          }
          done();
     })

     /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_TETHERING_ERROR202_0200
     * @tc.name test setTethering
     * @tc.desc Test api 202 - Non-system applications are not allowed to use system APIs.
     * @tc.type Function
     * @tc.level Level 0
     */
     it('SUB_COMMUNICATION_BTMANAGER_TETHERING_ERROR202_0200', 0, async function (done) {
          try {
               let panProfile = bluetooth.getProfileInstance(bluetooth.ProfileId.PROFILE_PAN_NETWORK);
               panProfile.setTethering(false);
          } catch (err) {
               console.info('errCode: ' + err.code + ',errMessage: ' + err.message);
               expect(err.code).assertEqual('202');
          }
          done();
     })

     /**
     * @tc.number SUB_COMMUNICATION_BTMANAGER_TETHERING_ERROR202_0300
     * @tc.name test isTetheringOn
     * @tc.desc Test api 202 - Non-system applications are not allowed to use system APIs.
     * @tc.type Function
     * @tc.level Level 0
     */
     it('SUB_COMMUNICATION_BTMANAGER_TETHERING_ERROR202_0200', 0, async function (done) {
          try {
               let panProfile = bluetooth.getProfileInstance(bluetooth.ProfileId.PROFILE_PAN_NETWORK);
               let ret = panProfile.isTetheringOn();
          } catch (err) {
               console.info('errCode: ' + err.code + ',errMessage: ' + err.message);
               expect(err.code).assertEqual('202');
          }
          done();
     })

})

}