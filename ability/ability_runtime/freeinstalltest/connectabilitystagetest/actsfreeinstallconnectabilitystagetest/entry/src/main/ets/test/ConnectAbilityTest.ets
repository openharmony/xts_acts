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
import rpc from '@ohos.rpc';
import wantConstant from '@ohos.ability.wantConstant'
import Prompt from '@system.prompt';
import abilityManager from '@ohos.application.abilityManager';


export default function ConnectAbilityTest(abilityContext) {
  var TAG = "";
  var Tempassert = "";

  function sleep(time) {
    return new Promise((resolve) => setTimeout(resolve, time))
  }

  describe('ConnectAbilityTest', function () {
    beforeAll(async function (done) {
      console.info("ConnectAbilityTest before all called");
      var cmd = "bm install -p data/test/MockService.hap";
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
      console.info("ConnectAbilityTest after each called");
      Tempassert = ""
      await sleep(1000);
      done();
    });

    function tips(msg) {
      Prompt.showToast({
        message: msg,
        duration: 2000,
        bottom: '150px'
      });
    }

    async function connectabillity(msg, request) {
      console.info(msg + "START");
      let options = {
        onConnect: function (element, proxy) {
          console.info("FreeInstall_Stage_ConnectAbility onConnect success!!!")
          console.info(msg + " onConnect success!!! ");
          console.info(msg + " onConnect: " + JSON.stringify(element));
          console.info(msg + " onConnect: " + JSON.stringify(proxy));
          if (proxy == null) {
            console.error("FreeInstall_Stage_ConnectAbility proxy null");
            return;
          }
          let option = new rpc.MessageOption();
          let data = new rpc.MessageParcel();
          let reply = new rpc.MessageParcel();
          data.writeInterfaceToken("ohos.appexecfwk.IApplicationStateObserver");
          proxy.sendRequest(0, data, reply, option);
          Tempassert = "onConnect";
          tips("连接成功");
        },
        onDisconnect: function (element) {
          console.info("FreeInstall_Stage_ConnectAbility onDisconnect success!!!")
          console.info(msg + " onDisconnect success!!!");
          console.info(msg + " onDisconnect: " + JSON.stringify(element));
          Tempassert = "onDisconnect";
          tips("连接断开");
        },
        onFailed: function (code) {
          console.info("FreeInstall_Stage_ConnectAbility onFailed!!!")
          console.info(msg + " onFailed!!! ");
          console.info(msg + " onFailed: " + JSON.stringify(code));
          Tempassert = "onFailed";
          tips("连接失败");
        }
      }
      let connection = await globalThis.abilityContext.connectAbility(request, options);
      console.info(msg + "request：" + JSON.stringify(request));
      console.info(msg + "options：" + JSON.stringify(options));
      console.info(msg + "connection=" + JSON.stringify(connection));
      console.info(msg + "END");
    }

    /*
    * @tc.number  FreeInstall_Stage_ConnectAbility_0100
    * @tc.name    Pass in the local deviceid,atomic service does not exist locally
    * @tc.desc    Function test
    * @tc.level   0
    */
    it("FreeInstall_Stage_ConnectAbility_0100", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_0100-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_0100";
      var cmd4 = "cp data/test/ConnectStageMyApplication0.hap /data/app/el2/100/base/com.ohos.hag.famanager/" +
      "haps/entry/files";
      globalThis.delegator.executeShellCommand(cmd4, (err: any, d: any) => {
        console.info("executeShellCommand4 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var deviceid = "0";
      abilityManager.getTopAbility((err, data) => {
        console.log(TAG + 'getTopAbility result: ' + JSON.stringify(data) + " , err: " + JSON.stringify(err));
        console.log(TAG + 'getTopAbility result deviceid:' + JSON.stringify(data.deviceId));
        deviceid = data.deviceId;
      })
      await sleep(500);
      var request1 = {
        "deviceId": deviceid,
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "ServiceAbility",
        "moduleName": "myapplication",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request1);
      setTimeout(function () {
        expect(Tempassert).assertEqual("onConnect");
        console.log("------------end FreeInstall_Stage_ConnectAbility_0100-------------");
        done();
      }, 3000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_0200
     * @tc.name    Pass in the local deviceid,atomic service exists locally
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_ConnectAbility_0200", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_0200-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_0200";
      var deviceid = "0";
      abilityManager.getTopAbility((err, data) => {
        console.log(TAG + 'getTopAbility result: ' + JSON.stringify(data) + " , err: " + JSON.stringify(err));
        console.log(TAG + 'getTopAbility result deviceid:' + JSON.stringify(data.deviceId));
        deviceid = data.deviceId;
      })
      await sleep(500);
      var request2 = {
        "deviceId": deviceid,
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "ServiceAbility",
        "moduleName": "myapplication",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request2);
      setTimeout(function () {
        expect(Tempassert).assertEqual("onConnect");
        console.log("------------end FreeInstall_Stage_ConnectAbility_0200-------------");
        done();
      }, 3000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_0300
     * @tc.name    Deviceid is empty,atomic service does not exist locally
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_ConnectAbility_0300", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_0300-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_0300";
      var cmd3 = "cp data/test/ConnectStageMyApplication1.hap /data/app/el2/100/base/com.ohos.hag.famanager/" +
      "haps/entry/files";
      globalThis.delegator.executeShellCommand(cmd3, (err: any, d: any) => {
        console.info("executeShellCommand3 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var request3 = {
        "deviceId": "",
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "ServiceAbility_feature",
        "moduleName": "myapplication1",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request3);
      setTimeout(function () {
        expect(Tempassert).assertEqual("onConnect");
        console.log("------------end FreeInstall_Stage_ConnectAbility_0300-------------");
        done();
      }, 3000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_0400
     * @tc.name    Deviceid is empty,atomic service exists locally
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_ConnectAbility_0400", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_0400-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_0400";
      var request4 = {
        "deviceId": "",
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "ServiceAbility_feature",
        "moduleName": "myapplication1",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request4);
      setTimeout(function () {
        expect(Tempassert).assertEqual("onConnect");
        console.log("------------end FreeInstall_Stage_ConnectAbility_0400-------------");
        done();
      }, 3000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_0500
     * @tc.name    The bundleName passed in is different from the local
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_Stage_ConnectAbility_0500", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_0500-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_0500";
      var request5 = {
        "bundleName": "com.example.different.hmservice",
        "abilityName": "com.example.different.ServiceAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request5);
      setTimeout(function () {
        expect(Tempassert).assertEqual("onFailed");
        console.log("------------end FreeInstall_Stage_ConnectAbility_0500-------------");
        done();
      }, 2000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_0600
     * @tc.name    Pass in an empty bundleName
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_Stage_ConnectAbility_0600", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_0600-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_0600";
      var request6 = {
        "bundleName": "",
        "abilityName": "ServiceAbility_feature",
        "moduleName": "myapplication1",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request6);
      setTimeout(function () {
        expect(Tempassert).assertEqual("onFailed");
        console.log("------------end FreeInstall_Stage_ConnectAbility_0600-------------");
        done();
      }, 2000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_0700
     * @tc.name    Pass in an empty abilityName
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_Stage_ConnectAbility_0700", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_0700-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_0700";
      var request7 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "",
        "moduleName": "myapplication1",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request7);
      setTimeout(function () {
        expect(Tempassert).assertEqual("onFailed");
        console.log("------------end FreeInstall_Stage_ConnectAbility_0700-------------");
        done();
      }, 2000);
    });

    /*
    * @tc.number  FreeInstall_Stage_ConnectAbility_0800
    * @tc.name    Incorrect deviceid passed in
    * @tc.desc    Function test
    * @tc.level   1
    */
    it("FreeInstall_Stage_ConnectAbility_0800", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_0800-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_0800";
      var request8 = {
        "deviceId": "xxxxxx",
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "ServiceAbility2",
        "moduleName": "myapplication2",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request8);
      setTimeout(function () {
        expect(Tempassert).assertEqual("onFailed");
        console.log("------------end FreeInstall_Stage_ConnectAbility_0800-------------");
        done();
      }, 2000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_0900
     * @tc.name    Incorrect bundleName passed in
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_Stage_ConnectAbility_0900", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_0900-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_0900";
      var request9 = {
        "bundleName": "com.example.xxx.hmservice",
        "abilityName": "ServiceAbility2",
        "moduleName": "myapplication2",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request9);
      setTimeout(function () {
        expect(Tempassert).assertEqual("onFailed");
        console.log("------------end FreeInstall_Stage_ConnectAbility_0900-------------");
        done();
      }, 2000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_1000
     * @tc.name    Incorrect flags passed in,atomic service does not exist locally
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_Stage_ConnectAbility_1000", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_1000-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_1000";
      var request10 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "ServiceAbility2",
        "moduleName": "myapplication2",
        "flags": 1111111,
      }
      connectabillity(TAG, request10);
      setTimeout(function () {
        expect(Tempassert).assertEqual("onFailed");
        console.log("------------end FreeInstall_Stage_ConnectAbility_1000-------------");
        done();
      }, 2000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_1100
     * @tc.name    Incorrect flags passed in,atomic service exists locally
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_ConnectAbility_1100", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_1100-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_1100";
      var cmdapp2 = "bm install -p data/test/ConnectStageMyApplication2.hap";
      globalThis.delegator.executeShellCommand(cmdapp2, (err: any, d: any) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(1000);
      var request11 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "ServiceAbility2",
        "moduleName": "myapplication2",
        "flags": "11",
      }
      connectabillity(TAG, request11);
      setTimeout(function () {
        expect(Tempassert).assertEqual("onConnect");
        console.log("------------end FreeInstall_Stage_ConnectAbility_1000-------------");
        done();
      }, 3000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_1200
     * @tc.name    No atomic service under path
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_Stage_ConnectAbility_1200", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_1200-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_1200";
      var cmdrm = "rm -r /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/*";
      globalThis.delegator.executeShellCommand(cmdrm, (err: any, d: any) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      var request12 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "ServiceAbility3",
        "moduleName": "myapplication3",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request12);
      setTimeout(function () {
        expect(Tempassert).assertEqual("onFailed");
        console.log("------------end FreeInstall_Stage_ConnectAbility_1200-------------");
        done();
      }, 2000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_1300
     * @tc.name    The application is not in the foreground [start MainAbility2 first, then connect]
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_Stage_ConnectAbility_1300", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_1300-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_1300";
      var str = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "com.example.myapplication.MainAbility2",
      }
      console.info(TAG + " startmainability2 str: " + JSON.stringify(str));
      globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + " startmainability2 successful. Data: " + JSON.stringify(data))
        }).catch((error) => {
        console.error(TAG + " startmainability2 failed. Cause: " + JSON.stringify(error));
      })
      await sleep(1500);
      var request13 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "ServiceAbility3",
        "moduleName": "myapplication3",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request13);
      setTimeout(function () {
        expect(Tempassert).assertEqual("onFailed");
        console.log("------------end FreeInstall_Stage_ConnectAbility_1300-------------");
        done();
      }, 1500);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_1400
     * @tc.name    The application is not in the foreground [start myapp2 first, then connect]
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_Stage_ConnectAbility_1400", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_1400-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_1400";
      var str = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "MainAbility_myapp2",
      }
      console.info(TAG + " startmyapp2 str: " + JSON.stringify(str));
      globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + " startmyapp2 successful. Data: " + JSON.stringify(data))
        }).catch((error) => {
        console.error(TAG + " startmyapp2 failed. Cause: " + JSON.stringify(error));
      })
      await sleep(1500);
      var request14 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "ServiceAbility3",
        "moduleName": "myapplication3",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request14);
      setTimeout(function () {
        expect(Tempassert).assertEqual("onFailed");
        console.log("------------end FreeInstall_Stage_ConnectAbility_1400-------------");
        done();
      }, 1500);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_1500
     * @tc.name    The application is not in the foreground,
                   [start another project first, then connect,atomic service does not exist locally]
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_Stage_ConnectAbility_1500", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_1500-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_1500";
      var cmddif = "bm install -p data/test/ConnectDifferentApplication.hap";
      globalThis.delegator.executeShellCommand(cmddif, (err: any, d: any) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(1000);
      var str = {
        "bundleName": "com.example.different.hmservice",
        "abilityName": "MainAbility",
      };
      globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + " startother successful. Data: " + JSON.stringify(data))
        }).catch((error) => {
        console.error(TAG + " startother  failed. Cause: " + JSON.stringify(error));
      })
      await sleep(1500);
      var request15 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "ServiceAbility4",
        "moduleName": "myapplication4",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request15);
      setTimeout(function () {
        expect(Tempassert).assertEqual("onFailed");
        console.log("------------end FreeInstall_Stage_ConnectAbility_1500-------------");
        done();
      }, 1500);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_1600
     * @tc.name    The application is not in the foreground,
                   [start another project first, then connect,atomic service exists locally]
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_Stage_ConnectAbility_1600", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_1600-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_1600";
      var cmdmyapp4 = "bm install -p data/test/ConnectStageMyApplication4.hap";
      globalThis.delegator.executeShellCommand(cmdmyapp4, (err: any, d: any) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(1000);
      var str = {
        "bundleName": "com.example.different.hmservice",
        "abilityName": "MainAbility",
      };
      globalThis.abilityContext.startAbility(str)
        .then((data) => {
          console.info(TAG + " startother successful. Data: " + JSON.stringify(data))
        }).catch((error) => {
        console.error(TAG + " startother  failed. Cause: " + JSON.stringify(error));
      })
      await sleep(1500);
      var request16 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "ServiceAbility4",
        "moduleName": "myapplication4",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request16);
      setTimeout(function () {
        expect(Tempassert).assertEqual("onConnect");
        console.log("------------end FreeInstall_Stage_ConnectAbility_1600-------------");
        done();
      }, 1500);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_1700
     * @tc.name    Do not pass flags, connect to the service of another project
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_ConnectAbility_1700", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_1700-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_1700";
      var request17 = {
        "bundleName": "com.example.different.hmservice",
        "abilityName": "com.example.different.ServiceAbility",
        "moduleName": "entry",
      }
      connectabillity(TAG, request17);
      setTimeout(function () {
        expect(Tempassert).assertEqual("onConnect");
        console.log("------------end FreeInstall_Stage_ConnectAbility_1700-------------");
        done();
      }, 2000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_1800
     * @tc.name    Incorrect moduleName passed in
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_Stage_ConnectAbility_1800", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_1800-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_1800";
      var request18 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "ServiceAbility3",
        "moduleName": "xxxxx",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request18);
      setTimeout(function () {
        expect(Tempassert).assertEqual("onFailed");
        console.log("------------end FreeInstall_Stage_ConnectAbility_1800-------------");
        done();
      }, 2000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_1900
     * @tc.name    The target is atomized as hapA, and hapB is placed under the path
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_Stage_ConnectAbility_1900", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_1900-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_1900";
      var cmdmyapp5 = "cp data/test/ConnectStageMyApplication5.hap /data/app/el2/100/base/com.ohos.hag.famanager/" +
      "haps/entry/files";
      globalThis.delegator.executeShellCommand(cmdmyapp5, (err: any, d: any) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(1000);
      var request19 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "ServiceAbility3",
        "moduleName": "myapplication3",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request19);
      setTimeout(function () {
        expect(Tempassert).assertEqual("onFailed");
        console.log("------------end FreeInstall_Stage_ConnectAbility_1900-------------");
        done();
      }, 2000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_2000
     * @tc.name    Pass in parameters
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_ConnectAbility_2000", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_2000-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_2000";
      var cmdmyapp5 = "cp data/test/ConnectStageMyApplication5.hap /data/app/el2/100/base/com.ohos.hag.famanager/" +
      "haps/entry/files";
      globalThis.delegator.executeShellCommand(cmdmyapp5, (err: any, d: any) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(1000);
      var request20 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "ServiceAbility5",
        "moduleName": "myapplication5",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
        "parameters": { "name": 1111, "key1": "value1", "site": "nice to meet you!" },
      }
      connectabillity(TAG, request20);
      setTimeout(function () {
        expect(Tempassert).assertEqual("onConnect");
        console.log("------------end FreeInstall_Stage_ConnectAbility_2000-------------");
        done();
      }, 2000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_2100
     * @tc.name    The atomic service of the target differs only by moduleName
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_ConnectAbility_2100", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_2100-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_2100";
      var cmdmyapp5 = "cp data/test/ConnectStageMyApplication3.hap /data/app/el2/100/base/com.ohos.hag.famanager/" +
      "haps/entry/files";
      globalThis.delegator.executeShellCommand(cmdmyapp5, (err: any, d: any) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(1000);
      var request21 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "ServiceAbility_feature",
        "moduleName": "myapplication3",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request21);
      setTimeout(function () {
        expect(Tempassert).assertEqual("onConnect");
        console.log("------------end FreeInstall_Stage_ConnectAbility_2100-------------");
        done();
      }, 2000);
    });

    /*
     * @tc.number  FreeInstall_Stage_ConnectAbility_2200
     * @tc.name   The application is not in the foreground,
                  [the current application is in the background first,then connect]
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_Stage_ConnectAbility_2200", 0, async function (done) {
      console.log("------------start FreeInstall_Stage_ConnectAbility_2200-------------");
      TAG = "FreeInstall_Stage_ConnectAbility_2200";
       var ability;
       globalThis.delegator.getCurrentTopAbility((err : any, data : any) => {
       console.info(TAG + " getCurrentTopAbility data: " + JSON.stringify(data) + " ,err: " + JSON.stringify(err));
       ability = data;
       globalThis.delegator.doAbilityBackground(ability, (err : any, data : any) => {
         console.info(TAG + " doAbilityBackground data: " + JSON.stringify(data) + " ,err: " + JSON.stringify(err));
       })
       });
      await sleep(1000);
      var request22 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "ServiceAbility6",
        "moduleName": "myapplication6",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request22);
      setTimeout(function () {
        expect(Tempassert).assertEqual("onFailed");
        globalThis.delegator.doAbilityForeground(ability, (err : any, data : any) => {
          console.info(TAG + " doAbilityForeground data: " + JSON.stringify(data) + " ,err: " + JSON.stringify(err));
        })
        console.log("------------end FreeInstall_Stage_ConnectAbility_2200-------------");
        done();
      }, 4000);
    });
  }
  )
}