
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "deccjsunit/index";
import featureAbility from "@ohos.ability.featureAbility";
import wantConstant from '@ohos.ability.wantConstant';
import abilityManager from '@ohos.application.abilityManager';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import commonEvent from '@ohos.commonEvent';

export default function startAbilityTest() {

    describe('startAbilityTest', function () {

        console.info("-------------FA model--> startAbilityXTS Test start----------------")

        var TAG = "";

        var delegator = AbilityDelegatorRegistry.getAbilityDelegator();

        function sleep(time) {
            return new Promise((resolve) => setTimeout(resolve, time))
        }

        var subscriber;
        var result;
        var subscribeInfo = {
            events: ["service_event"]
        };

        function SubscribeCallBack(err, data) {
            if (err.code) {
                console.error("Testevent subscribe failed " + JSON.stringify(err));
            } else {
                console.info("Testevent subscribe " + JSON.stringify(data));
                for (var key1 in data.parameters) {
                    console.info("Testevent data.parameters[key] is :" + data.parameters[key1])
                    if (data.parameters[key1] === "onSuccess") {
                        result = "onSuccess"
                    }
                }
            }
        }

        function CreateSubscriberCallBack(err, commonEventSubscriber) {
            if (err.code) {
                console.error("Testevent createSubscriber failed " + JSON.stringify(err));
            } else {
                console.info("Testevent createSubscriber");
                subscriber = commonEventSubscriber;
                commonEvent.subscribe(subscriber, SubscribeCallBack);
            }
        }

        beforeAll(async function (done) {
            console.info("StartAbilityForResult before all called");
            var cmd = "bm install -p data/test/MockService.hap";
            console.info("cmd : " + cmd)
            delegator.executeShellCommand(cmd, (err: any, d: any) => {
                console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            var cmd1 = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry";
            delegator.executeShellCommand(cmd1, (err: any, d: any) => {
                console.info("executeShellCommand1 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            var cmd2 = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
            delegator.executeShellCommand(cmd2, (err: any, d: any) => {
                console.info("executeShellCommand2 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            var cmd3 = "cp data/test/AtomizationFaEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
            "entry/files";
            delegator.executeShellCommand(cmd3, (err: any, d: any) => {
                console.info("executeShellCommand3 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
                done();
            })
        });

        afterEach(async function (done) {
            console.info("StartAbilityTest after each called");
            if ("FreeInstall_FA_Local_StartAbility_0200" === TAG ||
            "FreeInstall_FA_Local_StartAbility_0500" === TAG ||
            "FreeInstall_FA_Local_StartAbility_0700" === TAG ||
            "FreeInstall_FA_Local_StartAbility_0800" === TAG ||
            "FreeInstall_FA_Local_StartAbility_1000" === TAG ||
            "FreeInstall_FA_Local_StartAbility_1200" === TAG ||
            "FreeInstall_FA_Local_StartAbility_1400" === TAG ||
            "FreeInstall_FA_Local_StartAbility_1600" === TAG ||
            "FreeInstall_FA_Local_StartAbility_1800" === TAG ||
            "FreeInstall_FA_Local_StartAbility_2200" === TAG ||
            "FreeInstall_FA_Local_StartAbility_3000" === TAG ||
            "FreeInstall_FA_Local_StartAbility_3400" === TAG ||
            "FreeInstall_FA_Local_StartAbility_3600" === TAG ||
            "FreeInstall_FA_Local_StartAbility_3700" === TAG ||
            "FreeInstall_FA_Local_StartAbility_3800" === TAG) {
                var cmd4 = "bm uninstall -n com.example.qianyiyingyong.hmservice";
                delegator.executeShellCommand(cmd4, (err: any, d: any) => {
                    console.info("executeShellCommand4 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
                })
                await sleep(500);
            }

            if ("FreeInstall_FA_Local_StartAbility_3800" === TAG) {
                var cmd5 = "bm uninstall -n com.ohos.hag.famanager";
                delegator.executeShellCommand(cmd5, (err: any, d: any) => {
                    console.info("executeShellCommand5 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
                })
            }
            await sleep(500);
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_0100
         * @tc.name    The deviceid passed in is null, so the installation free process is implemented
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_0100", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_0100-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_0100";
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
            await featureAbility.startAbility(str).then((data) => {
                details = data;
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(details).assertEqual(0);
            console.info("------------end FreeInstall_FA_Local_StartAbility_0100-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_0200
         * @tc.name    The passed in deviceid is empty, and the installed apps are automatically pulled up
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_0200", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_0200-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_0200";
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
            await featureAbility.startAbility(str).then((data) => {
                details = data;
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(details).assertEqual(0);
            console.info("------------end FreeInstall_FA_Local_StartAbility_0200-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_0300
         * @tc.name    The deviceid passed in is empty. There is no need to install or installed HAP package
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_0300", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_0300-------------");
            TAG = "FreeInstall_Stage_Local_StartAbility_0300";
            var cmd300 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationFaEntry.hap";
            delegator.executeShellCommand(cmd300, (err: any, d: any) => {
                console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
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
            await featureAbility.startAbility(str).then((data) => {
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                wrong = error;
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(1000);
            expect(wrong.code).assertEqual(4);
            console.info("------------end FreeInstall_FA_Local_StartAbility_0300-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_0400
         * @tc.name    Do not transfer deviceid to realize installation free process
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_0400", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_0400-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_0400";
            var cmd400 = "cp data/test/AtomizationFaEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
            "entry/files";
            delegator.executeShellCommand(cmd400, (err: any, d: any) => {
                console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            let details;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                }
            }
            await featureAbility.startAbility(str).then((data) => {
                details = data;
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(details).assertEqual(0);
            console.info("------------end FreeInstall_FA_Local_StartAbility_0400-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_0500
         * @tc.name    The installed application will be automatically pulled up without transmitting the deviceid
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_0500", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_0500-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_0500";
            let details;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                }
            }
            await featureAbility.startAbility(str).then((data) => {
                details = data;
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(details).assertEqual(0);
            console.info("------------end FreeInstall_FA_Local_StartAbility_0500-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_0600
         * @tc.name    Manually obtain and pass in the deviceid of the device to realize the installation free process
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_0600", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_0600-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_0600";
            var deviceId = "";
            await abilityManager.getTopAbility((err, data) => {
                console.log(TAG + 'getTopAbility result: ' + JSON.stringify(data) + " , err: " + JSON.stringify(err));
                console.log(TAG + 'getTopAbility result deviceId:' + JSON.stringify(data.deviceId));
                deviceId = data.deviceId;
            })
            await sleep(1000);
            let details;
            var str = {
                'want': {
                    "deviceId": deviceId,
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                }
            }
            await featureAbility.startAbility(str).then((data) => {
                details = data;
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(details).assertEqual(0);
            console.info("------------end FreeInstall_FA_Local_StartAbility_0600-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_0700
         * @tc.name    Manually obtain and pass in the deviceid of the device,
                        and the installed application will be automatically pulled up
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_0700", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_0700-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_0700";
            var deviceId = "";
            await abilityManager.getTopAbility((err, data) => {
                console.log(TAG + 'getTopAbility result: ' + JSON.stringify(data) + " , err: " + JSON.stringify(err));
                console.log(TAG + 'getTopAbility result deviceId:' + JSON.stringify(data.deviceId));
                deviceId = data.deviceId;
            })
            await sleep(1000);
            let details;
            var str = {
                'want': {
                    "deviceId": deviceId,
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                }
            }
            await featureAbility.startAbility(str).then((data) => {
                details = data;
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(details).assertEqual(0);
            console.info("------------end FreeInstall_FA_Local_StartAbility_0700-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_0800
         * @tc.name    Without passing deviceid, pull up the HAP with the same bundlename and different
                        abilityname as the entry to realize the installation free process
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_0800", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_0800-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_0800";
            var cmd800 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationFaEntry.hap";
            delegator.executeShellCommand(cmd800, (err: any, d: any) => {
                console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            var cmd801 = "cp data/test/AtomizationFaHm2.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
            "entry/files";
            delegator.executeShellCommand(cmd801, (err: any, d: any) => {
                console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            let details;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.hm2.MainAbility",
                    "moduleName": "hnm2",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                }
            }
            await featureAbility.startAbility(str).then((data) => {
                details = data;
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(details).assertEqual(0);
            console.info("------------end FreeInstall_FA_Local_StartAbility_0800-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_0900
         * @tc.name    Do not transfer deviceid, use callback to realize installation free process
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_0900", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_0900-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_0900";
            var cmd900 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationFaHm2.hap";
            delegator.executeShellCommand(cmd900, (err: any, d: any) => {
                console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            var cmd901 = "cp data/test/AtomizationFaEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
            "entry/files";
            delegator.executeShellCommand(cmd901, (err: any, d: any) => {
                console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            let details;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                }
            }
            await featureAbility.startAbility(str, (error, data) => {
                console.log(TAG + ": startAbility err: " + JSON.stringify(error) + ",data: " + JSON.stringify(data));
                details = data;
            })
            setTimeout(function () {
                expect(details).assertEqual(0);
                console.info("------------end FreeInstall_FA_Local_StartAbility_0900-------------");
                done();
            }, 4000);
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_1000
         * @tc.name    Do not transmit deviceid, and use callback to automatically pull up installed applications
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_1000", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_1000-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_1000";
            let details;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                }
            }
            await featureAbility.startAbility(str, (error, data) => {
                console.log(TAG + ": startAbility err: " + JSON.stringify(error) + ",data: " + JSON.stringify(data));
                details = data;
            })
            setTimeout(function () {
                expect(details).assertEqual(0);
                console.info("------------end FreeInstall_FA_Local_StartAbility_1000-------------");
                done();
            }, 4000);
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_1100
         * @tc.name    Flags=1717 of the incoming error. There is a hap package that needs to
                        be installed free under the specified path
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_1100", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_1100-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_1100";
            let wrong;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": 1717,
                }
            }
            await featureAbility.startAbility(str).then((data) => {
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                wrong = error;
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(wrong.code).assertEqual(1);
            console.info("------------end FreeInstall_FA_Local_StartAbility_1100-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_1200
         * @tc.name    Bad flags=1717 passed in, atomized HAP package installed
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_1200", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_1200-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_1200";
            var cmd1200 = "bm install -p data/test/AtomizationFaEntry.hap";
            delegator.executeShellCommand(cmd1200, (err: any, d: any) => {
                console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            let details;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": 1717,
                }
            }
            await featureAbility.startAbility(str).then((data) => {
                details = data;
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(details).assertEqual(0);
            console.info("------------end FreeInstall_FA_Local_StartAbility_1200-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_1300
         * @tc.name    Flags= '94.31' of the incoming error. There is a hap package that
                        needs to be installed free under the specified path
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_1300", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_1300-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_1300";
            let wrong;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": 94.31
                }
            }
            await featureAbility.startAbility(str).then((data) => {
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                wrong = error;
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(wrong.code).assertEqual(1);
            console.info("------------end FreeInstall_FA_Local_StartAbility_1300-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_1400
         * @tc.name    Flags= '94.31' of incoming error, atomized HAP package installed
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_1400", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_1400-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_1400";
            var cmd1400 = "bm install -p data/test/AtomizationFaEntry.hap";
            delegator.executeShellCommand(cmd1400, (err: any, d: any) => {
                console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            let details;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": 94.31
                }
            }
            await featureAbility.startAbility(str).then((data) => {
                details = data;
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(details).assertEqual(0);
            console.info("------------end FreeInstall_FA_Local_StartAbility_1400-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_1500
         * @tc.name    Flags= '' of the incoming error. There is a hap package that needs to be
                        installed under the specified path
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_1500", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_1500-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_1500";
            let wrong;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                }
            }
            await featureAbility.startAbility(str).then((data) => {
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                wrong = error;
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(wrong.code).assertEqual(1);
            console.info("------------end FreeInstall_FA_Local_StartAbility_1500-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_1600
         * @tc.name    Bad flags= ', atomized HAP package installed
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_1600", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_1600-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_1600";
            var cmd1600 = "bm install -p data/test/AtomizationFaEntry.hap";
            delegator.executeShellCommand(cmd1600, (err: any, d: any) => {
                console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            let details;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                }
            }
            await featureAbility.startAbility(str).then((data) => {
                details = data;
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(details).assertEqual(0);
            console.info("------------end FreeInstall_FA_Local_StartAbility_1600-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_1700
         * @tc.name    No flag is transmitted, and there are HAP packages that need to be installed under
                       the specified path
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_1700", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_1700-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_1700"
            let wrong;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry"
                }
            }
            await featureAbility.startAbility(str).then((data) => {
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                wrong = error;
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(wrong.code).assertEqual(1);
            console.info("------------end FreeInstall_FA_Local_StartAbility_1700-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_1800
         * @tc.name    No flag is transmitted, and the atomized HAP package is installed
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_1800", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_1800-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_1800";
            var cmd1800 = "bm install -p data/test/AtomizationFaEntry.hap";
            delegator.executeShellCommand(cmd1800, (err: any, d: any) => {
                console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            let details;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                }
            }
            await featureAbility.startAbility(str).then((data) => {
                details = data;
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(details).assertEqual(0);
            console.info("------------end FreeInstall_FA_Local_StartAbility_1800-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_2100
         * @tc.name    The parameters field is passed in the want to realize the installation free process
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_2100", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_2100-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_2100";
            let details;
            var str = {
                'want': {
                    'bundleName': "com.example.qianyiyingyong.hmservice",
                    'abilityName': "com.example.qianyiyingyong.MainAbility",
                    'moduleName': "entry",
                    'flags': wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                    'parameters': {
                        "name": "1111",
                        "Ext2": "ExtValue2",
                        "site": "很开心看到你！"
                    }
                }
            };
            await featureAbility.startAbility(str).then((data) => {
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
                details = data;
            }).catch((error) => {
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(details).assertEqual(0);
            console.info("------------end FreeInstall_FA_Local_StartAbility_2100-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_2200
         * @tc.name    The parameters field is passed in the want, and the installed applications
                        are automatically pulled up
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_2200", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_2200-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_2200";
            let details;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                    "parameters": {
                        "name": "1111",
                        "Ext2": "ExtValue2",
                        "site": "很开心看到你！"
                    }
                }
            }
            await featureAbility.startAbility(str).then((data) => {
                details = data;
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(details).assertEqual(0);
            console.info("------------end FreeInstall_FA_Local_StartAbility_2200-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_3000
         * @tc.name    There are hapa and hapb with the same bundlename and abilityname and different modulenames.
                   Under the specified path, there are hapa with correct input parameters that need not be installed
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_3000", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_3000-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_3000";
            var cmd3000 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationFaEntry.hap";
            delegator.executeShellCommand(cmd3000, (err: any, d: any) => {
                console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            var cmd3001 = "cp data/test/AtomizationFaHm4.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
            "entry/files";
            delegator.executeShellCommand(cmd3001, (err: any, d: any) => {
                console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            let details;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.hm2.MainAbility",
                    "moduleName": "hm4",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                }
            }
            await featureAbility.startAbility(str).then((data) => {
                details = data;
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(details).assertEqual(0);
            console.info("------------end FreeInstall_FA_Local_StartAbility_3000-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_3100
         * @tc.name    There are hapa and hapb with the same bundlename and abilityname and different modulenames.
                        Hapb with input parameter error exists in the specified path
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_3100", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_3100-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_3100";
            var cmd3100 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationFaHm4.hap";
            delegator.executeShellCommand(cmd3100, (err: any, d: any) => {
                console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            var cmd3101 = "cp data/test/AtomizationFaHm2.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
            "entry/files";
            delegator.executeShellCommand(cmd3101, (err: any, d: any) => {
                console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            let wrong;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.hm2.MainAbility",
                    "moduleName": "hm4",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                }
            }
            await featureAbility.startAbility(str).then((data) => {
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                wrong = error;
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(wrong.code).assertEqual(4);
            console.info("------------end FreeInstall_FA_Local_StartAbility_3100-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_3200
         * @tc.name    Transfer wrong moduleName
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_3200", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_3200-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_3200";
            var cmd3200 = "rm /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/AtomizationFaHm2.hap";
            delegator.executeShellCommand(cmd3200, (err: any, d: any) => {
                console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            var cmd3201 = "cp data/test/AtomizationFaEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/" +
            "entry/files";
            delegator.executeShellCommand(cmd3201, (err: any, d: any) => {
                console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            let wrong;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "hnm",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                }
            }
            await featureAbility.startAbility(str).then((data) => {
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                wrong = error;
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(wrong.code).assertEqual(1);
            console.info("------------end FreeInstall_FA_Local_StartAbility_3200-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_3300
         * @tc.name    Do not transfer moduleName. There are HAP packages that need not be
                        installed under the specified path
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_3300", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_3300-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_3300";
            let wrong;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                }
            }
            await featureAbility.startAbility(str).then((data) => {
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                wrong = error;
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(wrong.code).assertEqual(1);
            console.info("------------end FreeInstall_FA_Local_StartAbility_3300-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_3400
         * @tc.name    Do not transfer moduleName. Atomized HAP package is installed. Start hap successfully.
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_3400", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_3400-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_3400";
            var cmd3400 = "bm install -p data/test/AtomizationFaEntry.hap";
            delegator.executeShellCommand(cmd3400, (err: any, d: any) => {
                console.info("executeShellCommand3400 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
            })
            await sleep(500);
            let details;
            var str = {
                'want': {
                    "deviceId": "",
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                }
            }
            await featureAbility.startAbility(str).then((data) => {
                details = data;
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(details).assertEqual(0);
            console.info("------------end FreeInstall_FA_Local_StartAbility_3400-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_3500
         * @tc.name    Transfer abilityStartSetting, so the installation free process is implemented
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_3500", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_3500-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_3500";
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
            await featureAbility.startAbility(str).then((data) => {
                details = data;
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(details).assertEqual(0);
            console.info("------------end FreeInstall_FA_Local_StartAbility_3500-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_3600
         * @tc.name    Transfer abilityStartSetting, so the installation free process is implemented
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_3600", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_3600-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_3600";
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
            await featureAbility.startAbility(str).then((data) => {
                details = data;
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(details).assertEqual(0);
            console.info("------------end FreeInstall_FA_Local_StartAbility_3600-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_3700
         * @tc.name    Service to pull up the service of the atomized service to realize the installation free process
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_3700", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_3700-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_3700";
            commonEvent.createSubscriber(subscribeInfo, CreateSubscriberCallBack);
            var str = {
                'want': {
                    "bundleName": "com.open.harmony.startAbility",
                    "abilityName": "com.open.harmony.startAbility.ServiceAbility",
                }
            }
            await featureAbility.startAbility(str).then((data) => {
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(result).assertEqual("onSuccess");
            console.info("------------end FreeInstall_FA_Local_StartAbility_3700-------------");
            done();
        });

        /*
         * @tc.number  FreeInstall_FA_Local_StartAbility_3800
         * @tc.name    Add BACKGROUND flags, free install successfully.
         * @tc.desc    Function test
         * @tc.level   0
         */
        it("FreeInstall_FA_Local_StartAbility_3800", 0, async function (done) {
            console.info("------------start FreeInstall_FA_Local_StartAbility_3800-------------");
            TAG = "FreeInstall_FA_Local_StartAbility_3800";
            let details;
            var str = {
                'want': {
                    "bundleName": "com.example.qianyiyingyong.hmservice",
                    "abilityName": "com.example.qianyiyingyong.MainAbility",
                    "moduleName": "entry",
                    "flags": wantConstant.Flags.FLAG_INSTALL_WITH_BACKGROUND_MODE|wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
                }
            }
            await featureAbility.startAbility(str).then((data) => {
                details = data;
                console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
            }).catch((error) => {
                console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
            });
            await sleep(2000);
            expect(details).assertEqual(0);
            console.info("------------end FreeInstall_FA_Local_StartAbility_3800-------------");
            done();
        });
    })
}