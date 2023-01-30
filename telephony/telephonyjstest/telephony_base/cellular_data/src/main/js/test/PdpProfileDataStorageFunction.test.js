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

import featureAbility from '@ohos.ability.featureAbility';
import ohosDataAbility from '@ohos.data.dataAbility';
import { describe, beforeAll, beforeEach, afterAll, it, expect } from "@ohos/hypium";
export default function ActsBaseCellularDataTest() {

    var inItialState = false;
    const time = 2000;

    const pdpprofileabilityUrl = "dataability:///com.ohos.pdpprofileability";
    const pdpProfileUri = "net/pdp_profile";
    const pdpProfileFullUri = pdpprofileabilityUrl + '/' + pdpProfileUri;
    const dataAbilityHelper = featureAbility.acquireDataAbilityHelper(pdpprofileabilityUrl);

    describe("TelephonyCellularDataFunction", function () {
        const sleep = (time) => {
            return new Promise((resolve, reject) => {
                setTimeout(() => {
                    resolve();
                }, time);
            })
        };

        beforeAll(function () {
            let stringValue = {
                profile_Name: "test_profile_name",
                mcc: "460",
                mnc: "91"
            };
            dataAbilityHelper.insert(pdpProfileFullUri, stringValue).then(data => {
                console.log(`Telephony_DataStorage_beforeAll success, insetId=${data}`);
                expect(data > 0).assertTrue();
            }).catch(error => {
                expect().assertFail();
                console.log("Telephony_DataStorage_beforeAll failed");
                done();
            });
        })

        beforeEach(function () {
        })

        afterAll(function () {
            var condition = new ohosDataAbility.DataAbilityPredicates();
            condition.equalTo("profile_name", "test_profile_name");
            dataAbilityHelper.delete(pdpProfileFullUri, condition).then(data => {
                console.log("Telephony_DataStorage_PdpProfile_afterAll: delete success data: " + JSON.stringify(data));
                expect(data === 0).assertTrue();
            }).catch(error => {
                expect().assertFail();
                console.log("Telephony_DataStorage_PdpProfile_afterAll failed");
                done();
            });
        })

        /*
     * @tc.number   Telephony_DataStorage_InsetIntoPdpProfile_Async_0100
     * @tc.name     Insert into pdpProfile database
     * @tc.desc     Function test
     */
        it("Telephony_DataStorage_PdpProfile_Insert_Async_0100", 0, async function (done) {
            let stringValue = {
                profile_Name: "test_profile_name",
                mcc: "460",
                mnc: "91"
            };
            dataAbilityHelper.insert(pdpProfileFullUri, stringValue).then(data => {
                console.log(`Telephony_DataStorage_InsetIntoPdpProfile_Async_0100 success, insertId=${data}`);
                expect(data > 0).assertTrue();
                done();
            }).catch(error => {
                expect().assertFail();
                console.log("Telephony_DataStorage_InsetIntoPdpProfile_Async_0100 failed");
                done();
            });
        })

        /*
     * @tc.number   Telephony_DataStorage_PdpProfile_Query_Async_0100
     * @tc.name     query from pdpProfile database
     * @tc.desc     Function test
     */
        it("Telephony_DataStorage_PdpProfile_Query_Async_0100", 0, async function (done) {
            let condition = new ohosDataAbility.DataAbilityPredicates();
            let resultColumns = [
                "profile_name",
                "mcc",
                "mnc",
            ];
            condition.equalTo("profile_name", "test_profile_name");
            dataAbilityHelper.query(pdpProfileFullUri, resultColumns, condition).then(resultSet => {
                let pdpProfiles = [];
                console.log("Telephony_DataStorage_PdpProfile_Query_Async_0100 resultSet: "
                + JSON.stringify(resultSet));
                while (resultSet.goToNextRow()) {
                    let pdpProfile = {};
                    pdpProfile.profile_Name = resultSet.getString(0);
                    pdpProfile.mcc = resultSet.getString(1);
                    pdpProfile.mnc = resultSet.getString(2);
                    pdpProfiles.push(pdpProfile);
                }
                console.log("Telephony_DataStorage_PdpProfile_Query_Async_0100 pdpProfiles: "
                + JSON.stringify(pdpProfiles));
                expect(pdpProfiles.length >= 1).assertTrue();
                done();
            }).catch(error => {
                expect().assertFail();
                console.log("Telephony_DataStorage_PdpProfile_Query_Async_0100 failed");
                done();
            });
        })

        /*
     * @tc.number   Telephony_DataStorage_PdpProfile_Update_Async_0100
     * @tc.name     update test data of pdpProfile database
     * @tc.desc     Function test
     */
        it("Telephony_DataStorage_PdpProfile_Update_Async_0100", 0, async function (done) {
            var condition = new ohosDataAbility.DataAbilityPredicates();
            condition.equalTo("profile_name", "test_profile_name");
            var stringValue = {
                'mcc': "461",
                'mnc': "92",
            };
            dataAbilityHelper.update(pdpProfileFullUri, stringValue, condition).then(data => {
                console.log("Telephony_DataStorage_PdpProfile_Update_Async_0100: update success data: "
                + JSON.stringify(data));
                expect(data === 0).assertTrue();
                done();
            }).catch(error => {
                expect().assertFail();
                console.log("Telephony_DataStorage_PdpProfile_Update_Async_0100 failed");
                done();
            });
        })

        /*
     * @tc.number   Telephony_DataStorage_PdpProfile_Delete_Async_0100
     * @tc.name     delete test data from pdpProfile database
     * @tc.desc     Function test
     */
        it("Telephony_DataStorage_PdpProfile_Delete_Async_0100", 0, async function (done) {
            var condition = new ohosDataAbility.DataAbilityPredicates();
            condition.equalTo("profile_name", "test_profile_name");
            dataAbilityHelper.delete(pdpProfileFullUri, condition).then(data => {
                console.log("Telephony_DataStorage_PdpProfile_Delete_Async_0100: delete success data: "
                + JSON.stringify(data));
                expect(data === 0).assertTrue();
                done();
            }).catch(error => {
                expect().assertFail();
                console.log("Telephony_DataStorage_PdpProfile_Update_Async_0100 failed");
                done();
            });
        })
    })
}
