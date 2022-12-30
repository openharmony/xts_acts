/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import featureAbility from '@ohos.ability.featureAbility'
import appManager from "@ohos.application.appManager"
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
export default function ActsAmsCallBackSecondScene() {
    describe('ActsAmsCallBackSecondScene', function () {
        console.info('----ActsAmsCallBackSecondScene----');
        beforeAll(async function (done) {
            await featureAbility.startAbility(
                {
                    want:
                    {
                        deviceId: "",
                        bundleName: "com.ix.verify.io",
                        abilityName: "com.example.VerifyIoThirdAbility",
                        action: "action1",
                        parameters:
                            {},
                    },
                }, (error, data) => {
                    console.info('ActsAmsCallBackSecondScene VerifyIoThirdAbility start, error.code \
                    ' + error.code + ', data length [' + data.length + ']');
                }
            );

            await featureAbility.startAbility(
                {
                    want:
                    {
                        deviceId: "",
                        bundleName: "com.ix.simulate.feature",
                        abilityName: "com.example.SimulateFeatureAbilityFir",
                        action: "action1",
                        parameters:
                            {},
                    },
                }, (error, data) => {
                    console.info('ActsAmsCallBackSecondScene SimulateFeatureAbilityFir start, error.code \
                    ' + error.code + ', data length [' + data.length + ']');
                }
            );
            sleep(500);
            done();
        });

        function timeout(done) {
            expect().assertFail();
            console.debug('Acts_Ams_test=========timeout========');
            done();
        }

        function sleep(delay) {
            let start = new Date().getTime();
            while (true) {
                if (new Date().getTime() - start > delay) {
                    break;
                }
            }
        }

        /*
        * @tc.number    : Acts_Ams_test_1800
        * @tc.name      : getProcessRunningInfos : Get All Running Processes Info
        * @tc.desc      : Get All Running Processes Info(by CallBack)
        */
        it('Acts_Ams_test_1800', 0, async function (done) {
            appManager.getProcessRunningInfos(
                (error, info) => {
                    console.info('Acts_Ams_test_1800 getProcessRunningInfos error.code \
                    ' + error.code + ', data length [' + info.length + ']');
                    expect(Array.isArray(info)).assertEqual(true);
                    expect(info.length).assertLarger(0);
                    for (let i = 0; i < info.length; i++) {
                        console.info('Acts_Ams_test_1800 getProcessRunningInfo[' + i + "]: " + JSON.stringify(info[i]));
                        expect(typeof (info[i].pid)).assertEqual("number");
                        expect(info[i].pid).assertLarger(0);

                        expect(typeof (info[i].processName)).assertEqual("string");
                        expect(info[i].processName.length).assertLarger(0);
                        expect(Array.isArray(info[i].bundleNames)).assertEqual(true);
                        expect(info[i].bundleNames.length).assertLarger(0);

                        expect(typeof (info[i].uid)).assertEqual("number");
                        expect(info[i].uid).assertLarger(0);
                    }
                    done();
                });
        })
    })
}