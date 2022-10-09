// @ts-nocheck


/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import Utils from './Utils';
import featureAbility from "@ohos.ability.featureAbility";
import wantConstant from '@ohos.ability.wantConstant';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'

export default function StartAbilityForResult2() {
    var TAG = "";

    describe('StartAbilityForResult2', function () {
        var delegator = AbilityDelegatorRegistry.getAbilityDelegator();
        beforeAll(async function (done) {
            console.info("StartAbilityForResult before all called");
            var cmd = "bm install -p data/test/MockService.hap";
            console.info("cmd : " + cmd)
            delegator.executeShellCommand(cmd, (err: any, d: any) => {
                console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(500);
            var cmd1 = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry";
            delegator.executeShellCommand(cmd1, (err: any, d: any) => {
                console.info("executeShellCommand1 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(500);
            var cmd2 = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
            delegator.executeShellCommand(cmd2, (err: any, d: any) => {
                console.info("executeShellCommand2 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(500);
            var cmd3 = "cp data/test/AtomizationResultFaEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
                "entry/files";
            delegator.executeShellCommand(cmd3, (err: any, d: any) => {
                console.info("executeShellCommand3 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
                done();
            })
        });

        afterEach(async function (done) {
            console.info("StartAbilityForResult after each called");
            if ("FreeInstall_FA_StartAbilityForResult_2300" === TAG) {
                var cmd4 = "bm uninstall -n com.example.qianyiyingyong.hmservice";
                delegator.executeShellCommand(cmd4, (err: any, d: any) => {
                    console.info("executeShellCommand4: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
                })
                await Utils.sleep(500);
            }

            if ("FreeInstall_FA_StartAbilityForResult_2600" === TAG) {
                var cmd14 = "bm uninstall -n com.ohos.hag.famanager";
                delegator.executeShellCommand(cmd14, (err: any, d: any) => {
                    console.info("executeShellCommand14: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
                })
            }
            await Utils.sleep(500);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_2200
         * @tc.name: startAbilityForResult: The page A not in the foreground. Page A jumps to page B first.
                     The atomized HAP package has not been installed.
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_2200", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_2200-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_2200";
            var str1 = {
                'want': {
                    "bundleName": "com.open.harmony.startAbilityForResult",
                    "abilityName": "com.open.harmony.startAbilityForResult.PageAbility",
                    "moduleName": "entry",
                }
            }
            featureAbility.startAbilityForResult(str1)
                .then((data) => {
                    console.info(TAG + ' StartAbilityForResultPromise2200 successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    console.info(TAG + ' StartAbilityForResultPromise2200 failed. Cause: ' + JSON.stringify(error));
                })
            await Utils.sleep(3000);
            let wrong;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                }
            }
            await featureAbility.startAbilityForResult(str)
                .then((data) => {
                    console.info(TAG + ' StartAbilityForResultPromise2200 successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    wrong = error;
                    console.info(TAG + ' StartAbilityForResultPromise2200 failed. Cause: ' + JSON.stringify(error));
                })
            await Utils.sleep(2000);
            expect(wrong.code).assertEqual(13);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_2300
         * @tc.name: startAbilityForResult: The page A not in the foreground. Page A jumps to page B first.
                     The atomized HAP package has been installed.
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_2300", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_2300-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_2300";
            var cmd19 = "bm install -rp /data/test/AtomizationResultFaEntry.hap";
            console.log("------------start FreeInstall_FA_StartAbilityForResult_2300------install-------");
            delegator.executeShellCommand(cmd19, (err: any, d: any) => {
                console.info("executeShellCommand19: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(500);
            var str1 = {
                'want': {
                    "bundleName": "com.open.harmony.startAbilityForResult",
                    "abilityName": "com.open.harmony.startAbilityForResult.PageAbility",
                    "moduleName": "entry",
                }
            }
            featureAbility.startAbilityForResult(str1)
                .then((data) => {
                    console.info(TAG + ' StartAbilityForResultPromise2300 successful. Data1: ' + JSON.stringify(data))
                }).catch((error) => {
                    console.info(TAG + ' StartAbilityForResultPromise2300 failed. Cause1: ' + JSON.stringify(error));
                })
            await Utils.sleep(1000);
            setTimeout(async () => {
                var wrong;
                var str = {
                    'want': {
                        "bundleName": "com.example.qianyiyingyong.hmservice",
                        "abilityName": "com.example.qianyiyingyong.MainAbility",
                        "moduleName": "entry",
                        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                    }
                }
                await featureAbility.startAbilityForResult(str)
                    .then((data) => {
                        console.info(TAG + ' StartAbilityForResultPromise2300 successful. 1Data: ' + JSON.stringify(data))
                    }).catch((error) => {
                        wrong = error;
                        console.info(TAG + ' StartAbilityForResultPromise2300 failed. 1Cause: ' + JSON.stringify(error));
                    })
                    expect(wrong.code).assertEqual(13);
            }, 2000)
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_2600
         * @tc.name: startAbilityForResult: Free install timeout 30s.
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_2600", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_2600-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_2600";
            var cmd20 = "bm uninstall -n com.ohos.hag.famanager";
            delegator.executeShellCommand(cmd20, (err: any, d: any) => {
                console.info("executeShellCommand20: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            var cmd21 = "bm install -p data/test/MockServiceTimeout.hap";
            delegator.executeShellCommand(cmd21, (err: any, d: any) => {
                console.info("executeShellCommand21: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            var cmd1 = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry";
            delegator.executeShellCommand(cmd1, (err: any, d: any) => {
                console.info("executeShellCommand11 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            var cmd2 = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
            delegator.executeShellCommand(cmd2, (err: any, d: any) => {
                console.info("executeShellCommand21 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            var cmd3 = "cp data/test/AtomizationResultFaEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
                "entry/files";
            delegator.executeShellCommand(cmd3, (err: any, d: any) => {
                console.info("executeShellCommand31 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })

            setTimeout(async () => {
                var wrong;
                var str = {
                    'want': {
                        "bundleName": "com.example.qianyiyingyong.hmservice",
                        "abilityName": "com.example.qianyiyingyong.MainAbility",
                        "moduleName": "entry",
                        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                    }
                }
                await featureAbility.startAbilityForResult(str)
                    .then((data) => {
                        console.info(TAG + ' StartAbilityForResultPromise2600 successful. Data: ' + JSON.stringify(data))
                    }).catch((error) => {
                        wrong = error;
                        console.info(TAG + ' StartAbilityForResultPromise2600 failed. Cause: ' + JSON.stringify(error));
                    })
                    expect(wrong.code).assertEqual(3)
            }, 20000)
            done();
        });

    })
}
