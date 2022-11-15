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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import commonEvent from '@ohos.commonEvent';

export default function ConnectAbilityTest_Ext(abilityContext) {
  var TAG = "";
  var dataAssert = "";
  var subscriber;
  var subscribeInfo = {
    events: ["service_event", "service2_event", "service3_event",
    "service4_event", "service5_event", "service6_event",
    "service7_event", "service8_event", "service9_event"]
  };

  function sleep(time) {
    return new Promise((resolve) => setTimeout(resolve, time))
  }

  async function startService(msg, str) {
    console.info(msg + ' startService successful. str: ' + JSON.stringify(str));
    globalThis.abilityContext.startAbility(str)
      .then((data) => {
        console.info(msg + ' startService successful. Data: ' + JSON.stringify(data));
      }).catch((error) => {
      console.error(msg + ' startService  failed. Cause: ' + JSON.stringify(error));
    })
  }

  function checkParameters(msg1, data) {
    for (var key in data.parameters) {
      console.info(msg1 + " data.parameters is : " + data.parameters[key])
      if (data.parameters[key] === "onFailed") {
        dataAssert = "onFailed";
      } else if (data.parameters[key] === "onDisconnect") {
        dataAssert = "onDisconnect";
      } else if (data.parameters[key] === "onConnect") {
        dataAssert = "onConnect";
      }
    }
  }

  function SubscribeCallBack(err, data) {
    if (err.code) {
      console.error("commonEvent subscribe failed " + JSON.stringify(err));
    } else {
      if (data.event === "service_event") {
        console.info("commonEvent subscribe service " + JSON.stringify(data));
        checkParameters("commonEvent service", data)
      } else if (data.event === "service2_event") {
        console.info("commonEvent subscribe service2 " + JSON.stringify(data));
        checkParameters("commonEvent service2", data)
      } else if (data.event === "service3_event") {
        console.info("commonEvent subscribe service3 " + JSON.stringify(data));
        checkParameters("commonEvent service3", data)
      } else if (data.event === "service4_event") {
        console.info("commonEvent subscribe service4 " + JSON.stringify(data));
        checkParameters("commonEvent service4", data)
      } else if (data.event === "service5_event") {
        console.info("commonEvent subscribe service5 " + JSON.stringify(data));
        checkParameters("commonEvent service5", data)
      } else if (data.event === "service6_event") {
        console.info("commonEvent subscribe service6 " + JSON.stringify(data));
        checkParameters("commonEvent service6", data)
      } else if (data.event === "service7_event") {
        console.info("commonEvent subscribe service7 " + JSON.stringify(data));
        checkParameters("commonEvent service7", data)
      } else if (data.event === "service8_event") {
        console.info("commonEvent subscribe service8 " + JSON.stringify(data));
        checkParameters("commonEvent service8", data)
      } else if (data.event === "service9_event") {
        console.info("commonEvent subscribe service9 " + JSON.stringify(data));
        checkParameters("commonEvent service9", data)
      }
    }
  }

  function CreateSubscriberCallBack(err, commonEventSubscriber) {
    if (err.code) {
      console.error("commonEvent createSubscriber failed " + JSON.stringify(err));
    } else {
      console.info("----commonEvent createSubscriber------");
      subscriber = commonEventSubscriber;
      commonEvent.subscribe(subscriber, SubscribeCallBack);
    }
  }

  describe('FreeInstall_Stage_ConnectAbility_Ext', function () {
    beforeAll(async function (done) {
      console.info("FreeInstall_Stage_ConnectAbility_Ext before all called");
      console.info("FreeInstall_Stage_ConnectAbility_Ext commonEvent.createSubscriber start!!!");
      commonEvent.createSubscriber(subscribeInfo, CreateSubscriberCallBack);
      await sleep(2000);
      var cmd = "bm install -p data/test/Mockservice.hap";
      console.info("cmd : " + cmd)
      globalThis.delegator.executeShellCommand(cmd, (err: any, d: any) => {
        console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var cmd1 = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry";
      globalThis.delegator.executeShellCommand(cmd1, (err: any, d: any) => {
        console.info("executeShellCommand1 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var cmd2 = "mkdir -p /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      globalThis.delegator.executeShellCommand(cmd2, (err: any, d: any) => {
        console.info("executeShellCommand2 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        done();
      })
    });

    afterEach(async function (done) {
      console.info("FreeInstall_Stage_ConnectAbility_Ext after each called");
      dataAssert = ""
      await sleep(1000);
      if ("FreeInstall_Stage_ConnectAbility_Ext_1200" === TAG) {
        var cmdUninstall = "bm uninstall -n com.ohos.hag.famanager";
        globalThis.delegator.executeShellCommand(cmdUninstall, (err: any, d: any) => {
          console.info("executeShellCommandUninstall : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        })
      }
      await sleep(500);
      done();
    });

    /*
    * @tc.number  FreeInstall_Stage_ConnectAbility_Ext_0100
    * @tc.name    Deviceid is empty,atomic service does not exist locally
    * @tc.desc    Function test
    * @tc.level   0
    */
    it("FreeInstall_Stage_ConnectAbility_Ext_0100", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_Ext_0100-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_Ext_0100";
      var cmdmyapp6 = "cp data/test/ConnectStageMyApplication6.hap /data/app/el2/100/base/com.ohos.hag.famanager/" +
      "haps/entry/files";
      globalThis.delegator.executeShellCommand(cmdmyapp6, (err: any, d: any) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var str1 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "com.example.myapplication.ServiceAbility",
      };
      startService(TAG, str1);
      setTimeout(function () {
        console.info(TAG + " SubscribeCallBack data: " + JSON.stringify(dataAssert));
        expect(dataAssert).assertEqual("onConnect");
        console.log("------------end FreeInstall_Stage_ConnectAbility_Ext_0100-------------");
        done();
      }, 4000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_Ext_0200
     * @tc.name    Deviceid is empty,atomic service exists locally
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_ConnectAbility_Ext_0200", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_Ext_0200-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_Ext_0200";
      var str1 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "com.example.myapplication.ServiceAbility",
      };
      startService(TAG, str1);
      setTimeout(function () {
        console.info(TAG + " SubscribeCallBack data: " + JSON.stringify(dataAssert));
        expect(dataAssert).assertEqual("onConnect");
        console.log("------------end FreeInstall_Stage_ConnectAbility_Ext_0200-------------");
        done();
      }, 4000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_Ext_0300
     * @tc.name    The bundleName passed in is different from the local
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_Stage_ConnectAbility_Ext_0300", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_Ext_0300-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_Ext_0300";
      var cmdum = "bm uninstall -n com.example.different.hmservice";
      globalThis.delegator.executeShellCommand(cmdum, (err: any, d: any) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var str2 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "com.example.myapplication.ServiceAbility2",
      };
      startService(TAG, str2);
      setTimeout(function () {
        console.info(TAG + " SubscribeCallBack data: " + JSON.stringify(dataAssert));
        expect(dataAssert).assertEqual("onFailed");
        console.log("------------end FreeInstall_Stage_ConnectAbility_Ext_0300-------------");
        done();
      }, 4000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_Ext_0400
     * @tc.name    Do not pass flags, atomic service does not exist locally
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_Stage_ConnectAbility_Ext_0400", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_Ext_0400-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_Ext_0400";
      var str3 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "com.example.myapplication.ServiceAbility3",
      };
      startService(TAG, str3);
      setTimeout(function () {
        console.info(TAG + " SubscribeCallBack data: " + JSON.stringify(dataAssert));
        expect(dataAssert).assertEqual("onFailed");
        console.log("------------end FreeInstall_Stage_ConnectAbility_Ext_0400-------------");
        done();
      }, 4000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_Ext_0500
     * @tc.name    Do not pass flags, atomic service exists locally
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_ConnectAbility_Ext_0500", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_Ext_0500-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_Ext_0500";
      var cmdin = "bm install -p data/test/ConnectDifferentApplication.hap";
      globalThis.delegator.executeShellCommand(cmdin, (err: any, d: any) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var str3 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "com.example.myapplication.ServiceAbility3",
      };
      startService(TAG, str3);
      setTimeout(function () {
        console.info(TAG + " SubscribeCallBack data: " + JSON.stringify(dataAssert));
        expect(dataAssert).assertEqual("onConnect");
        console.log("------------end FreeInstall_Stage_ConnectAbility_Ext_0500-------------");
        done();
      }, 4000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_Ext_0600
     * @tc.name    Incorrect deviceid passed in
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_Stage_ConnectAbility_Ext_0600", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_Ext_0600-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_Ext_0600";
      var str4 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "com.example.myapplication.ServiceAbility4",
      };
      startService(TAG, str4);
      setTimeout(function () {
        console.info(TAG + " SubscribeCallBack data: " + JSON.stringify(dataAssert));
        expect(dataAssert).assertEqual("onFailed");
        console.log("------------end FreeInstall_Stage_ConnectAbility_Ext_0600-------------");
        done();
      }, 4000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_Ext_0700
     * @tc.name    Incorrect bundleName passed in
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_Stage_ConnectAbility_Ext_0700", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_Ext_0700-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_Ext_0700";
      var str5 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "com.example.myapplication.ServiceAbility5",
      };
      startService(TAG, str5);
      setTimeout(function () {
        console.info(TAG + " SubscribeCallBack data: " + JSON.stringify(dataAssert));
        expect(dataAssert).assertEqual("onFailed");
        console.log("------------end FreeInstall_Stage_ConnectAbility_Ext_0700-------------");
        done();
      }, 4000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_Ext_0800
     * @tc.name    Pass in an empty abilityName
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_Stage_ConnectAbility_Ext_0800", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_Ext_0800-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_Ext_0800";
      var str6 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "com.example.myapplication.ServiceAbility6",
      };
      startService(TAG, str6);
      setTimeout(function () {
        console.info(TAG + " SubscribeCallBack data: " + JSON.stringify(dataAssert));
        expect(dataAssert).assertEqual("onFailed");
        console.log("------------end FreeInstall_Stage_ConnectAbility_Ext_0800-------------");
        done();
      }, 4000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_Ext_0900
     * @tc.name    No atomic service under path
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_Stage_ConnectAbility_Ext_0900", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_Ext_0900-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_Ext_0900";
      var cmdrm = "rm -r /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/*";
      globalThis.delegator.executeShellCommand(cmdrm, (err: any, d: any) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var str7 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "com.example.myapplication.ServiceAbility7",
      };
      startService(TAG, str7);
      setTimeout(function () {
        console.info(TAG + " SubscribeCallBack data: " + JSON.stringify(dataAssert));
        expect(dataAssert).assertEqual("onFailed");
        console.log("------------end FreeInstall_Stage_ConnectAbility_Ext_0900-------------");
        done();
      }, 4000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_Ext_1000
     * @tc.name    Incorrect moduleName passed in
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_Stage_ConnectAbility_Ext_1000", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_Ext_1000-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_Ext_1000";
      var str8 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "com.example.myapplication.ServiceAbility8",
      };
      startService(TAG, str8);
      setTimeout(function () {
        console.info(TAG + " SubscribeCallBack data: " + JSON.stringify(dataAssert));
        expect(dataAssert).assertEqual("onFailed");
        console.log("------------end FreeInstall_Stage_ConnectAbility_Ext_1000-------------");
        done();
      }, 4000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_Ext_1100
     * @tc.name    Pass in parameters
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_ConnectAbility_Ext_1100", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_Ext_1100-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_Ext_1100";
      var cmdmyapp7 = "cp data/test/ConnectStageMyApplication7.hap /data/app/el2/100/base/com.ohos.hag.famanager/" +
      "haps/entry/files";
      globalThis.delegator.executeShellCommand(cmdmyapp7, (err: any, d: any) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(1000);
      var str7 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "com.example.myapplication.ServiceAbility7",
      };
      startService(TAG, str7);
      setTimeout(function () {

        console.info(TAG + " SubscribeCallBack data: " + JSON.stringify(dataAssert));
        expect(dataAssert).assertEqual("onConnect");
        console.log("------------end FreeInstall_Stage_ConnectAbility_Ext_1100-------------");
        done();
      }, 4000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_Ext_1200
     * @tc.name    The atomic service of the target differs only by moduleName
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_ConnectAbility_Ext_1200", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_Ext_1200-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_Ext_1200";
      var cmdmyapp8 = "cp data/test/ConnectStageMyApplication8.hap /data/app/el2/100/base/com.ohos.hag.famanager/" +
      "haps/entry/files";
      globalThis.delegator.executeShellCommand(cmdmyapp8, (err: any, d: any) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(1000);
      var str9 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "com.example.myapplication.ServiceAbility9",
      };
      startService(TAG, str9);
      setTimeout(function () {
        console.info(TAG + " SubscribeCallBack data: " + JSON.stringify(dataAssert));
        expect(dataAssert).assertEqual("onConnect");
        console.log("------------end FreeInstall_Stage_ConnectAbility_Ext_1200-------------");
        done();
      }, 4000);
    });
  }
  )
}

