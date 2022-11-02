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
import abilityManager from '@ohos.application.abilityManager';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'

export default function StartAbilityForResult() {
    var TAG = "";
    var DeviceId = "";


    describe('StartAbilityForResult', function () {
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
            var cmd3 = "cp data/test/AtomizationResultFaEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps" +
            "/entry/files";
            delegator.executeShellCommand(cmd3, (err: any, d: any) => {
                console.info("executeShellCommand3 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
                done();
            })
        });

        afterEach(async function (done) {
            console.info("StartAbilityForResult after each called");
            if ("FreeInstall_FA_StartAbilityForResult_0100" === TAG ||
            "FreeInstall_FA_StartAbilityForResult_0400" === TAG ||
            "FreeInstall_FA_StartAbilityForResult_0700" === TAG ||
            "FreeInstall_FA_StartAbilityForResult_1000" === TAG ||
            "FreeInstall_FA_StartAbilityForResult_1100" === TAG ||
            "FreeInstall_FA_StartAbilityForResult_1400" === TAG ||
            "FreeInstall_FA_StartAbilityForResult_1600" === TAG ||
            "FreeInstall_FA_StartAbilityForResult_1900" === TAG ||
            "FreeInstall_FA_StartAbilityForResult_2100" === TAG ||
            "FreeInstall_FA_StartAbilityForResult_3000" === TAG ||
            "FreeInstall_FA_StartAbilityForResult_3100" === TAG) {
                var cmd4 = "bm uninstall -n com.example.qianyiyingyong.hmservice";
                delegator.executeShellCommand(cmd4, (err: any, d: any) => {
                    console.info("executeShellCommand4: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
                })
                await Utils.sleep(500);
                var str = {
                'want': {
                    "bundleName": "com.open.harmony.startAbilityForResult",
                    "abilityName": "com.open.harmony.startAbilityForResult.MainAbility",
                   } 
                }
                await featureAbility.startAbility(str).then((data) => {
                    console.info(' StartAbilityPromise successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    console.info(' StartAbilityPromise failed. Cause: ' + JSON.stringify(error));
                })
                 await Utils.sleep(500);
            }

            if ("FreeInstall_FA_StartAbilityForResult_3200" === TAG) {
                var cmd14 = "bm uninstall -n com.ohos.hag.famanager";
                delegator.executeShellCommand(cmd14, (err: any, d: any) => {
                    console.info("executeShellCommand14: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
                })
                await Utils.sleep(500);
                var cmd26 = "bm uninstall -n com.example.myapplicationA.hmserviceA";
                delegator.executeShellCommand(cmd26, (err: any, d: any) => {
                    console.info("executeShellCommand26: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
                })
            }
            await Utils.sleep(500);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_0100
         * @tc.name: startAbilityForResult: Input empty deviceId,free install and start successfully.
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_0100", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_0100-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_0100";
            let details;
            var str = {
                'want': {
                    "deviceId": "",
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                }
            }
            await featureAbility.startAbilityForResult(str)
                .then((data) => {
                    details = data;
                    console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
                })
            await Utils.sleep(2000);
            console.log(TAG + " resultCode: " + details.resultCode);
            expect(details.resultCode).assertEqual(1);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_0200
         * @tc.name: startAbilityForResult: Send wrong yuanzihua under the path
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_0200", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_0200-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_0200";
            var cmd15 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationResultFaEntry.hap";
            delegator.executeShellCommand(cmd15, (err: any, d: any) => {
                console.info("executeShellCommand15: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(500);
            var cmd16 = "cp data/test/AtomizationResultA.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
            delegator.executeShellCommand(cmd16, (err: any, d: any) => {
                console.info("executeShellCommand16: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(500);
            let wrong;
            var str = {
                'want': {
                    "deviceId": "",
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                }
            }
            await featureAbility.startAbilityForResult(str)
                .then((data) => {
                    console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    wrong = error;
                    console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
                })
            await Utils.sleep(1000);
            expect(wrong.code).assertEqual(1);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_0300
         * @tc.name: startAbilityForResult: Remove the yuanzihua under the path
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_0300", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_0300-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_0300";
            var cmd17 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationResultA.hap";
            delegator.executeShellCommand(cmd17, (err: any, d: any) => {
                console.info("executeShellCommand17: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(500);
            let wrong;
            var str = {
                'want': {
                    "deviceId": "",
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                }
            }
            await featureAbility.startAbilityForResult(str)
                .then((data) => {
                    console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    wrong = error;
                    console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
                })
            await Utils.sleep(1000);
            expect(wrong.code).assertEqual(4);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_0400
         * @tc.name: startAbilityForResult: Free install and start successfully (add abilityStartSetting).
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_0400", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_0400-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_0400";
            var cmd18 = "cp data/test/AtomizationResultFaEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
            "entry/files";
            delegator.executeShellCommand(cmd18, (err: any, d: any) => {
                console.info("executeShellCommand18: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(500);
            let details;
            var str = {
                'want': {
                    "deviceId": "",
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                },
                'abilityStartSetting': {
                    "key": "test:let your heart guide you!"
                }
            }
            await featureAbility.startAbilityForResult(str)
                .then((data) => {
                    details = data;
                    console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
                })
            await Utils.sleep(2000);
            console.log(TAG + " resultCode: " + details.resultCode);
            expect(details.resultCode).assertEqual(1);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_0500
         * @tc.name: startAbilityForResult: Send wrong yuanzihua under the path (add abilityStartSetting).
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_0500", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_0500-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_0500";
            var cmd15 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationResultFaEntry.hap";
            delegator.executeShellCommand(cmd15, (err: any, d: any) => {
                console.info("executeShellCommand15: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(500);
            var cmd16 = "cp data/test/AtomizationResultA.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
            delegator.executeShellCommand(cmd16, (err: any, d: any) => {
                console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(500);
            let wrong;
            var str = {
                'want': {
                    "deviceId": "",
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                },
                'abilityStartSetting': {
                    "key": "test:let your heart guide you!"
                }
            }
            await featureAbility.startAbilityForResult(str)
                .then((data) => {
                    console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    wrong = error;
                    console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
                })
            await Utils.sleep(1000);
            expect(wrong.code).assertEqual(1);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_0600
         * @tc.name: startAbilityForResult: Remove the yuanzihua under the path (add abilityStartSetting).
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_0600", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_0600-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_0600";
            var cmd17 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationResultA.hap";
            delegator.executeShellCommand(cmd17, (err: any, d: any) => {
                console.info("executeShellCommand17: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(500);
            let wrong;
            var str = {
                'want': {
                    "deviceId": "",
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                },
                'abilityStartSetting': {
                    "key": "test:let your heart guide you!"
                }
            }
            await featureAbility.startAbilityForResult(str)
                .then((data) => {
                    console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    wrong = error;
                    console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
                })
            await Utils.sleep(1000);
            expect(wrong.code).assertEqual(4);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_0700
         * @tc.name: startAbilityForResult: No deviceId,free install and start successfully.
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_0700", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_0700-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_0700";
            var cmd18 = "cp data/test/AtomizationResultFaEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
            "entry/files";
            delegator.executeShellCommand(cmd18, (err: any, d: any) => {
                console.info("executeShellCommand18: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(1000);
            let details;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND
                }
            }
            await featureAbility.startAbilityForResult(str)
                .then((data) => {
                    details = data;
                    console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
                })
            await Utils.sleep(2000);
            console.log(TAG + " resultCode: " + details.resultCode);
            expect(details.resultCode).assertEqual(1);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_0800
         * @tc.name: startAbilityForResult: No deviceId,free install and start successfully (add abilityStartSetting).
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_0800", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_0800-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_0800";
            let details;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND
                },
                'abilityStartSetting': {
                    "key": "test:let your heart guide you!"
                }
            }
            await featureAbility.startAbilityForResult(str)
                .then((data) => {
                    details = data;
                    console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
                })
            await Utils.sleep(2000);
            console.log(TAG + " resultCode: " + details.resultCode);
            expect(details.resultCode).assertEqual(1);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_0900
         * @tc.name: startAbilityForResult: yuanzihua already installed,start successfully.
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_0900", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_0900-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_0900";
            var cmd900 = "bm install -p data/test/AtomizationResultFaEntry.hap";
            delegator.executeShellCommand(cmd900, (err: any, d: any) => {
                console.info("executeShellCommand900: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(1000);
            let details;
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
                    details = data;
                    console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
                })
            await Utils.sleep(2000);
            console.log(TAG + " resultCode: " + details.resultCode);
            expect(details.resultCode).assertEqual(1);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_1000
         * @tc.name: startAbilityForResult: yuanzihua already installed,start successfully (add abilityStartSetting).
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_1000", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_1000-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_1000";
            let details;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                },
                'abilityStartSetting': {
                    "key": "test:let your heart guide you!"
                }
            }
            await featureAbility.startAbilityForResult(str)
                .then((data) => {
                    details = data;
                    console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
                })
            await Utils.sleep(2000);
            console.log(TAG + " resultCode: " + details.resultCode);
            expect(details.resultCode).assertEqual(1);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_1100
         * @tc.name: startAbilityForResult: Input local deviceId,free install and start successfully.
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_1100", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_1100-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_1100";
            let details1;
            let details2;
            await abilityManager.getTopAbility().then((data) => {
                details1 = data;
                console.info(' getTopAbility succeeded data: ' + JSON.stringify(data));
            }).catch((error) => {
                console.error(' getTopAbility error: ' + JSON.stringify(error));
            });
            console.log(" checkAbilityInfo deviceId : " + details1.deviceId);
            DeviceId = details1.deviceId;
            await Utils.sleep(500);
            var str = {
                'want': {
                    "deviceId": DeviceId,
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                }
            }
            await featureAbility.startAbilityForResult(str)
                .then((data) => {
                    details2 = data;
                    console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
                })
            await Utils.sleep(2000);
            console.log(TAG + " resultCode: " + details2.resultCode);
            expect(details2.resultCode).assertEqual(1);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_1200
         * @tc.name: startAbilityForResult: Input local deviceId, add abilityStartSetting.
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_1200", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_1200-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_1200";
            let details1;
            let details2;
            await abilityManager.getTopAbility().then((data) => {
                details1 = data;
                console.info(' getTopAbility succeeded data: ' + JSON.stringify(data));
            }).catch((error) => {
                console.error(' getTopAbility error: ' + JSON.stringify(error));
            });
            console.log(" checkAbilityInfo deviceId : " + details1.deviceId);
            DeviceId = details1.deviceId;
            await Utils.sleep(1000);
            var str = {
                'want': {
                    "deviceId": DeviceId,
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                },
                'abilityStartSetting': {
                    "key": "test:let your heart guide you!"
                }
            }
            await featureAbility.startAbilityForResult(str)
                .then((data) => {
                    details2 = data;
                    console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
                })
            await Utils.sleep(2000);
            console.log(TAG + " resultCode: " + details2.resultCode);
            expect(details2.resultCode).assertEqual(1);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_1300
         * @tc.name: startAbilityForResult: Free install feature hap and start successfully.
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_1300", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_1300-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_1300";
            var cmd7 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationResultFaEntry.hap";
            delegator.executeShellCommand(cmd7, (err: any, d: any) => {
                console.info("executeShellCommand7: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(500);
            var cmd8 = "cp data/test/AtomizationResultFaHm2.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
            delegator.executeShellCommand(cmd8, (err: any, d: any) => {
                console.info("executeShellCommand8: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(500);
            let details;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.hm2.MainAbility",
                    "moduleName": "hnm2",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                }
            }
            await featureAbility.startAbilityForResult(str)
                .then((data) => {
                    details = data;
                    console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
                })
            await Utils.sleep(3000);
            console.log(TAG + " resultCode: " + details.resultCode);
            expect(details.resultCode).assertEqual(1);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_1400
         * @tc.name: startAbilityForResult: start feature hap successfully (add abilityStartSetting).
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_1400", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_1400-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_1400";
            let details;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.hm2.MainAbility",
                    "moduleName": "hnm2",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                },
                'abilityStartSetting': {
                    "key": "test:let your heart guide you!"
                }
            }
            await featureAbility.startAbilityForResult(str)
                .then((data) => {
                    details = data;
                    console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
                })
            await Utils.sleep(2000);
            console.log(TAG + " resultCode: " + details.resultCode);
            expect(details.resultCode).assertEqual(1);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_1500
         * @tc.name: startAbilityForResult: Call by AsyncCallback.
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_1500", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_1500-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_1500";
            var cmd1500 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationResultFaHm2.hap";
            delegator.executeShellCommand(cmd1500, (err: any, d: any) => {
                console.info("executeShellCommand1500: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(1000);
            var cmd1501 = "cp data/test/AtomizationResultFaEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/" +
            "haps/entry/files";
            delegator.executeShellCommand(cmd1501, (err: any, d: any) => {
                console.info("executeShellCommand1501: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(1000);
            let details;
            var str = {
                'want': {
                    "bundleName": 'com.example.qianyiyingyong.hmservice',
                    "abilityName": 'com.example.qianyiyingyong.MainAbility',
                    "moduleName": 'entry',
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                }
            }
            await featureAbility.startAbilityForResult(str, (err, data) => {
                console.info(TAG + ": StartAbilityForResultCallBack success, err: " + JSON.stringify(err) +
                ",data: " + JSON.stringify(data));
                details = data.resultCode;
            })
            setTimeout(function () {
                console.info(TAG + "  resultCode: " + details);
                expect(details).assertEqual(1);
                done();
            }, 4000);
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_1600
         * @tc.name: startAbilityForResult: Call by AsyncCallback (add abilityStartSetting).
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_1600", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_1600-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_1600";
            let details;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                },
                'abilityStartSetting': {
                    "key": "test:let your heart guide you!"
                }
            }
            await featureAbility.startAbilityForResult(str, (err, data) => {
                console.info(TAG + ": StartAbilityForResultCallBack success, err: " + JSON.stringify(err) +
                ",data: " + JSON.stringify(data));
                details = data.resultCode;
            })
            setTimeout(function () {
                console.info(TAG + "  resultCode: " + details);
                expect(details).assertEqual(1);
                done();
            }, 4000);
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_1700
         * @tc.name: startAbilityForResult: Input wrong flags(22),free install failed.
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_1700", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_1700-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_1700";
            let wrong;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    'flags': 22
                }
            }
            await featureAbility.startAbilityForResult(str)
                .then((data) => {
                    console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    wrong = error;
                    console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
                })
            await Utils.sleep(1000);
            expect(wrong.code).assertEqual(1);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_1800
         * @tc.name: startAbilityForResult: Input wrong flags('11'),free install failed.
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_1800", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_1800-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_1800";
            let wrong;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    'flags': '11'
                }
            }
            await featureAbility.startAbilityForResult(str)
                .then((data) => {
                    console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    wrong = error;
                    console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
                })
            await Utils.sleep(1000);
            expect(wrong.code).assertEqual(1);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_1900
         * @tc.name: startAbilityForResult: yuanzihua already installed,input wrong flags('11'),start successfully.
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_1900", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_1900-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_1900";
            var cmd19 = "bm install -p data/test/AtomizationResultFaEntry.hap";
            delegator.executeShellCommand(cmd19, (err: any, d: any) => {
                console.info("executeShellCommand19: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(500);
            var cmd1901 = "bm install -p data/test/AtomizationResultFaEntry.hap";
            delegator.executeShellCommand(cmd1901, (err: any, d: any) => {
                console.info("executeShellCommand1901: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(500);
            let details;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    'flags': '11'
                }
            }
            await featureAbility.startAbilityForResult(str)
                .then((data) => {
                    details = data;
                    console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
                })
            await Utils.sleep(2000);
            console.log(TAG + " resultCode: " + details.resultCode);
            expect(details.resultCode).assertEqual(1);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_2000
         * @tc.name: startAbilityForResult: Input empty flags,free install failed.
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_2000", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_2000-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_2000";
            let wrong;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    'flags': ''
                }
            }
            await featureAbility.startAbilityForResult(str)
                .then((data) => {
                    console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    wrong = error;
                    console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
                })
            await Utils.sleep(1000);
            expect(wrong.code).assertEqual(1);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_2100
         * @tc.name: startAbilityForResult: yuanzihua already installed,input empty flags,start successfully.
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_2100", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_2100-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_2100";
            var cmd19 = "bm install -p data/test/AtomizationResultFaEntry.hap";
            delegator.executeShellCommand(cmd19, (err: any, d: any) => {
                console.info("executeShellCommand19: err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(1000);
            let details;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    'flags': ''
                }
            }
            await featureAbility.startAbilityForResult(str)
                .then((data) => {
                    details = data;
                    console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
                })
            await Utils.sleep(2000);
            console.log(TAG + " resultCode: " + details.resultCode);
            expect(details.resultCode).assertEqual(1);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_3000
         * @tc.name: startAbilityForResult: Input different moduleName(feature hap),start feature hap.
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_3000", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_3000-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_3000";
            var cmd9 = "bm install -p data/test/AtomizationResultFaHm1.hap";
            delegator.executeShellCommand(cmd9, (err: any, d: any) => {
                console.info("executeShellCommand9 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await Utils.sleep(500);
            let details;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "hm1",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                }
            }
            await featureAbility.startAbilityForResult(str)
                .then((data) => {
                    details = data;
                    console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
                })
            await Utils.sleep(2000);
            console.log(TAG + " resultCode: " + details.resultCode);
            expect(details.resultCode).assertEqual(1);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_3100
         * @tc.name: startAbilityForResult: Input parameters extended information,free install and start successfully.
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_3100", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_3100-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_3100";
            let details;
            var str = {
                'want': {
                    'deviceId': '',
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                    'parameters': {
                        "name": "1111", "Ext2": "ExtValue2", "site": "很开心看到你！"
                    }
                }
            }
            await featureAbility.startAbilityForResult(str)
                .then((data) => {
                    details = data;
                    console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
                })
            await Utils.sleep(2000);
            console.log(TAG + " resultCode: " + details.resultCode);
            expect(details.resultCode).assertEqual(1);
            done();
        });

        /*
         * @tc.number: FreeInstall_FA_StartAbilityForResult_3200
         * @tc.name: startAbilityForResult: Input wrong moduleName（“xxxxx”）, free install failed.
         * @tc.desc: Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_StartAbilityForResult_3200", 0, async function (done) {
            console.log("------------start FreeInstall_FA_StartAbilityForResult_3200-------------");
            TAG = "FreeInstall_FA_StartAbilityForResult_3200";
            let wrong;
            var str = {
                'want': {
                    'deviceId': '',
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "xxxxx",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                }
            }
            await featureAbility.startAbilityForResult(str)
                .then((data) => {
                    console.info(TAG + ' StartAbilityForResultPromise successful. Data: ' + JSON.stringify(data))
                }).catch((error) => {
                    wrong = error;
                    console.info(TAG + ' StartAbilityForResultPromise failed. Cause: ' + JSON.stringify(error));
                })
            await Utils.sleep(1000);
            expect(wrong.code).assertEqual(1);
            done();
        });
    })
}