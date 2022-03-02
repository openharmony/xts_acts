/**
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
import {describe, it, expect} from "deccjsunit/index.ets";
import Utils from './Utils';
import ability_featureAbility from '@ohos.ability.featureAbility';
import abilityManager from "@ohos.app.abilitymanager"

const TAG_TEST_0100 = ' context_isUpdatingConfigurations_test_0100 ';
const TAG_TEST_0200 = ' context_isUpdatingConfigurations_test_0200 ';
const TAG_TEST_0300 = ' context_printDrawnCompleted_test_0100 ';
const TAG_TEST_0400 = ' context_printDrawnCompleted_test_0200 ';
const TAG_TEST_0500 = ' context_getAppMemorySize_test_0100 ';
const TAG_TEST_0600 = ' context_getAppMemorySize_test_0200 ';
const TAG_TEST_0700 = ' context_isRamConstrainedDevice_test_0100 ';
const TAG_TEST_0800 = ' context_isRamConstrainedDevice_test_0200 ';

export default function addContextAndAbilityJsunit() {
    describe('appInfoTest', function () {
        /*
     * @tc.number: context_isUpdatingConfigurations_test_0100
     * @tc.name: isUpdatingConfigurations : Obtains whether the configuration of the current ability is changing.
     * @tc.desc: Check the return value of the interface (by promise)
     * @tc.level   0
     */
        it(TAG_TEST_0100, 0, async function (done) {
            console.info(TAG_TEST_0100 + 'promise START');
            let detailed;
            var startTime = await Utils.getNowTime();
            var context = ability_featureAbility.getContext();
            await context.isUpdatingConfigurations().then((data) => {
                var endTime = Utils.getNowTime();
                Utils.getDurationTime(TAG_TEST_0100, startTime, endTime)
                console.info(TAG_TEST_0100 + ' promise data is:' + JSON.stringify(data));
                detailed = data;
            }).catch((error) => {
                console.error(TAG_TEST_0100 + 'promise errors is: ' + JSON.stringify(error));
            })
            expect(typeof (detailed)).assertEqual("boolean");
            expect(detailed).assertEqual(false);
            done();
            console.log('------------------ ' + TAG_TEST_0100 + ' end -------------------');
        });

        /*
     * @tc.number: context_isUpdatingConfigurations_test_0200
     * @tc.name: isUpdatingConfigurations : Obtains whether the configuration of the current ability is changing.
     * @tc.desc: Check the return value of the interface (by AsyncCallback)
     * @tc.level   0
     */
        it(TAG_TEST_0200, 0, async function (done) {
            let detailed;
            console.info(TAG_TEST_0200 + 'callBack START');
            try {
                var startTime = await Utils.getNowTime();
                var context = ability_featureAbility.getContext();
                context.isUpdatingConfigurations((error, data) => {
                    var endTime = Utils.getNowTime();
                    Utils.getDurationTime(TAG_TEST_0200, startTime, endTime)
                    detailed = data;
                    console.info(TAG_TEST_0200 + ' callBack succeeded. data is:' + JSON.stringify(data));
                });
            } catch (error) {
                console.error(TAG_TEST_0200 + 'Operation failed. Cause: ' + JSON.stringify(error));
            }
            await Utils.sleep(2000)
            expect(typeof (detailed)).assertEqual("boolean");
            expect(detailed).assertEqual(false);
            done();
            console.log('------------------ ' + TAG_TEST_0200 + ' end -------------------');
        });

            /*
         * @tc.number: context_printDrawnCompleted_test_0100
         * @tc.name: printDrawnCompleted : Inform the system of the time required to complete the drawing of the page
          capability.
         * @tc.desc: Check the return value of the interface (by promise)
         * @tc.level   0
         */
        it(TAG_TEST_0300, 0, async function (done) {
            let detailed;
            console.info(TAG_TEST_0300 + 'callBack START');
            var startTime = await Utils.getNowTime();
            var context = ability_featureAbility.getContext();
            await context.printDrawnCompleted().then((data) => {
                var endTime = Utils.getNowTime();
                Utils.getDurationTime(TAG_TEST_0300, startTime, endTime)
                console.info(TAG_TEST_0300 + ' promise data is:' + JSON.stringify(data));
                detailed = data;
            }).catch((error) => {
                console.error(TAG_TEST_0300 + 'promise error is: ' + JSON.stringify(error));
            });
            await Utils.sleep(2000)
            expect(detailed).assertEqual(null);
            done();
            console.log('------------------ ' + TAG_TEST_0300 + ' end -------------------');
        })


        /*
     * @tc.number: context_printDrawnCompleted_test_0200
     * @tc.name: printDrawnCompleted : Inform the system of the time required to complete the drawing of the page
      capability.
     * @tc.desc: Check the return value of the interface (by AsyncCallback)
     * @tc.level   0
     */
        it(TAG_TEST_0400, 0, async function (done) {
            let detailed;
            console.info(TAG_TEST_0400 + 'callBack START');
            try {
                var startTime = await Utils.getNowTime();
                var context = ability_featureAbility.getContext();
                context.printDrawnCompleted((error, data) => {
                    var endTime = Utils.getNowTime();
                    Utils.getDurationTime(TAG_TEST_0300, startTime, endTime)
                    detailed = data;
                    console.info(TAG_TEST_0400 + ' callBack succeeded. data is:' + JSON.stringify(data));
                });
            } catch (error) {
                console.error(TAG_TEST_0400 + 'Operation failed. Cause: ' + JSON.stringify(error));
            }
            await Utils.sleep(2000)
            expect(detailed).assertEqual(null);
            done();
            console.log('------------------ ' + TAG_TEST_0400 + ' end -------------------');
        })


        /*
     * @tc.number: context_getAppMemorySize_test_0100
     * @tc.name: getAppMemorySize : Obtains the memory size of the application.
     * @tc.desc: Check the return value of the interface (by promise)
     * @tc.level   0
     */
        it(TAG_TEST_0500, 0, async function (done) {
            console.info(TAG_TEST_0500 + 'promise START');
            let detailed;
            var startTime = await Utils.getNowTime();
            await abilityManager.getAppMemorySize()
                .then((data) => {
                    var endTime = Utils.getNowTime();
                    Utils.getDurationTime(TAG_TEST_0500, startTime, endTime)
                    console.info(TAG_TEST_0500 + ' promise data is:' + JSON.stringify(data));
                    detailed = data;
                }).catch((error) => {
                    console.error(TAG_TEST_0500 + 'promise errors is: ' + JSON.stringify(error));
                })
            await Utils.sleep(2000)
            expect(typeof (detailed)).assertEqual("number");
            expect(detailed).assertEqual(512);
            done();
            console.log('------------------ ' + TAG_TEST_0500 + ' end -------------------');
        });

        /*
     * @tc.number: context_getAppMemorySize_test_0200
     * @tc.name: getAppMemorySize : Obtains the memory size of the application.
     * @tc.desc: Check the return value of the interface (by AsyncCallback)
     * @tc.level   0
     */
        it(TAG_TEST_0600, 0, async function (done) {
            console.info(TAG_TEST_0600 + 'callBack START');
            var startTime = await Utils.getNowTime();
            abilityManager.getAppMemorySize((error, data) => {
                var endTime = Utils.getNowTime();
                Utils.getDurationTime(TAG_TEST_0500, startTime, endTime)
                console.info(TAG_TEST_0600 + ' callBack error is: ' + JSON.stringify(error));
                console.info(TAG_TEST_0600 + ' callBack data is:' + JSON.stringify(data));
                expect(typeof (data)).assertEqual("number");
                expect(data).assertEqual(512);
                console.log('------------------ ' + TAG_TEST_0600 + ' end -------------------');
                done();
            })
        });

        /*
     * @tc.number: context_isRamConstrainedDevice_test_0100
     * @tc.name: isRamConstrainedDevice : Obtains whether the current device has low ram.
     * @tc.desc: Check the return value of the interface (by promise)
     * @tc.level   0
     */
        it(TAG_TEST_0700, 0, async function (done) {
            let detailed;
            console.info(TAG_TEST_0700 + 'promise START');
            var startTime = await Utils.getNowTime();
            await abilityManager.isRamConstrainedDevice().then((data) => {
                var endTime = Utils.getNowTime();
                Utils.getDurationTime(TAG_TEST_0500, startTime, endTime)
                console.info(TAG_TEST_0700 + ' promise data is:' + JSON.stringify(data));
                detailed = data;
            }).catch((error) => {
                console.error(TAG_TEST_0700 + 'promise errors is: ' + JSON.stringify(error));
            })
            await Utils.sleep(1000)
            expect(typeof (detailed)).assertEqual("boolean");
            expect(detailed).assertEqual(false)
            done();
            console.log('------------------ ' + TAG_TEST_0700 + ' end -------------------');
        });

        /*
     * @tc.number: context_isRamConstrainedDevice_test_0200
     * @tc.name: isRamConstrainedDevice : Obtains whether the current device has low ram.
     * @tc.desc: Check the return value of the interface (by AsyncCallback)
     * @tc.level   0
     */
        it(TAG_TEST_0800, 0, async function (done) {
            console.info(TAG_TEST_0800 + 'callBack START');
            var startTime = await Utils.getNowTime();
            abilityManager.isRamConstrainedDevice((error, data) => {
                var endTime = Utils.getNowTime();
                Utils.getDurationTime(TAG_TEST_0500, startTime, endTime)
                console.info(TAG_TEST_0800 + ' callBack error is:' + error);
                console.info(TAG_TEST_0800 + ' callBack data is:' + JSON.stringify(data));
                expect(typeof (data)).assertEqual("boolean");
                expect(data).assertEqual(false);
                done();
            })
            console.log('------------------ ' + TAG_TEST_0800 + ' end -------------------');
        });
    })
}