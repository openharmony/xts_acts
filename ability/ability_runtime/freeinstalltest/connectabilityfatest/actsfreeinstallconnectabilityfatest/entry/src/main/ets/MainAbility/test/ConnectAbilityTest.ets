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
import featureAbility from '@ohos.ability.featureAbility';
import wantConstant from '@ohos.ability.wantConstant'
import Prompt from '@system.prompt';
import abilityManager from '@ohos.application.abilityManager';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'


export default function ConnectAbilityTest() {
  let TAG = "";
  let Tempassert = "";
  let abilityDelegator = undefined

  function sleep(time) {
    return new Promise((resolve) => setTimeout(resolve, time))
  }

  describe('FreeInstall_FA_ConnectAbility', function () {
    beforeAll(async function (done) {
      console.info("FreeInstall_FA_ConnectAbility before all called");
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
      let cmd = "bm install -p data/test/MockService.hap";
      console.info("cmd : " + cmd)
      console.info(TAG + " abilityDelegator : " + JSON.stringify(abilityDelegator));
      abilityDelegator.executeShellCommand(cmd, (err: any, d: any) => {
        console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      let cmd1 = "mkdir /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry";
      abilityDelegator.executeShellCommand(cmd1, (err: any, d: any) => {
        console.info("executeShellCommand1 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      let cmd2 = "mkdir /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      abilityDelegator.executeShellCommand(cmd2, (err: any, d: any) => {
        console.info("executeShellCommand2 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        done();
      })
    });

    afterEach(async (done) => {
      console.info("FreeInstall_FA_ConnectAbility after each called");
      Tempassert = ""
      if ("FreeInstall_FA_ConnectAbility_1300" === TAG) {
        let cmd14 = "bm uninstall -n com.ohos.hag.famanager";
        abilityDelegator.executeShellCommand(cmd14, (err: any, d: any) => {
          console.info("executeShellCommand14 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        })
        await sleep(2000)
      }
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
          console.info("FreeInstall_FA_ConnectAbility onConnect success!!!")
          console.info(msg + " onConnect success!!! ");
          console.info(msg + " onConnect: " + JSON.stringify(element));
          console.info(msg + " onConnect: " + JSON.stringify(proxy));
          if (proxy == null) {
            console.error("FreeInstall_FA_ConnectAbility proxy null");
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
          console.info("FreeInstall_FA_ConnectAbility onDisconnect success!!!")
          console.info(msg + " onDisconnect success!!!");
          console.info(msg + " onDisconnect: " + JSON.stringify(element));
          Tempassert = "onDisconnect";
          tips("连接断开");
        },
        onFailed: function (code) {
          console.info("FreeInstall_FA_ConnectAbility onFailed!!!")
          console.info(msg + " onFailed!!! ");
          console.info(msg + " onFailed: " + JSON.stringify(code));
          Tempassert = "onFailed";
          tips("连接失败");
        }
      }
      let connection = await featureAbility.connectAbility(request, options);
      console.info(msg + "request：" + JSON.stringify(request));
      console.info(msg + "options：" + JSON.stringify(options));
      console.info(msg + "connection=" + JSON.stringify(connection));
      console.info(msg + "END");
    }

    /*
    * @tc.number  FreeInstall_FA_ConnectAbility_0100
    * @tc.name    Pass in the local deviceid,atomic service does not exist locally
    * @tc.desc    Function test
    * @tc.level   0
    */
    it("FreeInstall_FA_ConnectAbility_0100", 0, async function (done) {
      console.log("------------start FreeInstall_FA_ConnectAbility_0100-------------");
      TAG = "FreeInstall_FA_ConnectAbility_0100";
      let cmd4 = "cp data/test/ConnectFaMyApplication6.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps" +
        "/entry/files";
      abilityDelegator.executeShellCommand(cmd4, (err: any, d: any) => {
        console.info(TAG + " executeShellCommand4 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })

      let deviceid = "0";
      abilityManager.getTopAbility((err, data) => {
        console.log(TAG + 'getTopAbility result: ' + JSON.stringify(data) + " , err: " + JSON.stringify(err));
        console.log(TAG + 'getTopAbility result deviceid:' + JSON.stringify(data.deviceId));
        deviceid = data.deviceId;
      })
      await sleep(500)
      let request1 = {
        "deviceId": deviceid,
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "com.example.myapplication6.ServiceAbility",
        "moduleName": "myapplication6",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request1);
      setTimeout(() => {
        expect(Tempassert).assertEqual("onConnect");
        done();
      }, 2000)
      console.log("------------end FreeInstall_FA_ConnectAbility_0100-------------");
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_0200
     * @tc.name    Pass in the local deviceid,atomic service exists locally
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_FA_ConnectAbility_0200", 0, async function (done) {
      console.log("------------start FreeInstall_FA_ConnectAbility_0200-------------");
      TAG = "FreeInstall_FA_ConnectAbility_0200";
      let cmdapp10 = "bm install -p data/test/ConnectFaMyApplication10.hap";
      abilityDelegator.executeShellCommand(cmdapp10, (err: any, d: any) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      let deviceid = "0";
      await abilityManager.getTopAbility((err, data) => {
        console.log(TAG + 'getTopAbility result: ' + JSON.stringify(data) + " , err: " + JSON.stringify(err));
        console.log(TAG + 'getTopAbility result deviceid:' + JSON.stringify(data.deviceId));
        deviceid = data.deviceId;
      })
      await sleep(500)
      let request2 = {
        "deviceId": deviceid,
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "com.example.myapplication10.ServiceAbility",
        "moduleName": "myapplication10",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request2);

      setTimeout(() => {
        expect(Tempassert).assertEqual("onConnect");
        console.log("------------end FreeInstall_FA_ConnectAbility_0200-------------");
        done();
      }, 2000)

    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_0300
     * @tc.name    Deviceid is empty,atomic service does not exist locally
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_FA_ConnectAbility_0300", 0, async function (done) {
      console.log("------------start FreeInstall_FA_ConnectAbility_0300-------------");
      TAG = "FreeInstall_FA_ConnectAbility_0300";
      let cmd3 = "cp data/test/ConnectFaMyApplication1.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      abilityDelegator.executeShellCommand(cmd3, (err: any, d: any) => {
        console.info("executeShellCommand3 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })

      let request3 = {
        "deviceId": "",
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "com.example.myapplication1.ServiceAbility_feature",
        "moduleName": "myapplication1",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request3);
      setTimeout(() => {
        expect(Tempassert).assertEqual("onConnect");
        console.log("------------end FreeInstall_FA_ConnectAbility_0300-------------");
        done();
      }, 2000)
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_0400
     * @tc.name    Deviceid is empty,atomic service exists locally
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_FA_ConnectAbility_0400", 0, async function (done) {
      console.log("------------start FreeInstall_FA_ConnectAbility_0400-------------");
      TAG = "FreeInstall_FA_ConnectAbility_0400";
      let cmdapp11 = "bm install -p data/test/ConnectFaMyApplication11.hap";
      abilityDelegator.executeShellCommand(cmdapp11, (err: any, d: any) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(2000)
      let request4 = {
        "deviceId": "",
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "com.example.myapplication11.ServiceAbility",
        "moduleName": "myapplication11",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request4);
      setTimeout(() => {
        expect(Tempassert).assertEqual("onConnect");
        console.log("------------end FreeInstall_FA_ConnectAbility_0400-------------");
        done();
      }, 2000)
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_0500
     * @tc.name    The bundleName passed in is different from the local
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_0500", 0, async function (done) {
      console.log("------------start FreeInstall_FA_ConnectAbility_0500-------------");
      TAG = "FreeInstall_FA_ConnectAbility_0500";

      let request5 = {
        "bundleName": "com.example.different.hmservice",
        "abilityName": "com.example.different.ServiceAbility",
        "moduleName": "entry",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request5);
      setTimeout(() => {
        expect(Tempassert).assertEqual("onFailed");
        console.log("------------end FreeInstall_FA_ConnectAbility_0500-------------");
        done();
      }, 2000);
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_0600
     * @tc.name    Pass in an empty bundleName
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_0600", 0, async function (done) {
      console.log("------------start FreeInstall_FA_ConnectAbility_0600-------------");
      TAG = "FreeInstall_FA_ConnectAbility_0600";

      let request6 = {
        "bundleName": "",
        "abilityName": "com.example.myapplication1.ServiceAbility_feature",
        "moduleName": "myapplication1",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request6);
      setTimeout(() => {
        expect(Tempassert).assertEqual("onFailed");
        console.log("------------end FreeInstall_FA_ConnectAbility_0600-------------");
        done();
      }, 2000);
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_0700
     * @tc.name    Pass in an empty abilityName
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_0700", 0, async function (done) {
      console.log("------------start FreeInstall_FA_ConnectAbility_0700-------------");
      TAG = "FreeInstall_FA_ConnectAbility_0700";

      let request7 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "",
        "moduleName": "myapplication1",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request7);
      setTimeout(() => {
        expect(Tempassert).assertEqual("onFailed");
        console.log("------------end FreeInstall_FA_ConnectAbility_0700-------------");
        done();
      }, 2000);
    });

    /*
    * @tc.number  FreeInstall_FA_ConnectAbility_0800
    * @tc.name    Incorrect deviceid passed in
    * @tc.desc    Function test
    * @tc.level   1
    */
    it("FreeInstall_FA_ConnectAbility_0800", 0, async function (done) {
      console.log("------------start FreeInstall_FA_ConnectAbility_0800-------------");
      TAG = "FreeInstall_FA_ConnectAbility_0800";

      let request8 = {
        "deviceId": "xxxxxx",
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "com.example.myapplication2.ServiceAbility",
        "moduleName": "myapplication2",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request8);
      setTimeout(() => {
        expect(Tempassert).assertEqual("onFailed");
        console.log("------------end FreeInstall_FA_ConnectAbility_0800-------------");
        done();
      }, 2000);
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_0900
     * @tc.name    Incorrect bundleName passed in
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_0900", 0, async function (done) {
      console.log("------------start FreeInstall_FA_ConnectAbility_0900-------------");
      TAG = "FreeInstall_FA_ConnectAbility_0900";

      let request9 = {
        "bundleName": "com.example.xxx.hmservice",
        "abilityName": "com.example.myapplication2.ServiceAbility",
        "moduleName": "myapplication2",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request9);
      setTimeout(() => {
        expect(Tempassert).assertEqual("onFailed");
        console.log("------------end FreeInstall_FA_ConnectAbility_0900-------------");
        done();
      }, 2000);
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_1000
     * @tc.name    Incorrect flags passed in,atomic service does not exist locally
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_1000", 0, async function (done) {
      console.log("------------start FreeInstall_FA_ConnectAbility_1000-------------");
      TAG = "FreeInstall_FA_ConnectAbility_1000";

      let request10 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "com.example.myapplication2.ServiceAbility",
        "moduleName": "myapplication2",
        "flags": 1111111,
      }
      connectabillity(TAG, request10);
      setTimeout(() => {
        expect(Tempassert).assertEqual("onFailed");
        console.log("------------end FreeInstall_FA_ConnectAbility_1000-------------");
        done();
      }, 2000);
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_1100
     * @tc.name    Incorrect flags passed in,atomic service exists locally
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_FA_ConnectAbility_1100", 0, async function (done) {
      console.log("------------start FreeInstall_FA_ConnectAbility_1100-------------");
      TAG = "FreeInstall_FA_ConnectAbility_1100";
      let cmdapp2 = "bm install -p data/test/ConnectFaMyApplication2.hap";
      abilityDelegator.executeShellCommand(cmdapp2, (err: any, d: any) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(2000)
      let request11 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "com.example.myapplication2.ServiceAbility",
        "moduleName": "myapplication2",
        "flags": "11",
      }
      connectabillity(TAG, request11);
      setTimeout(() => {
        expect(Tempassert).assertEqual("onConnect");
        console.log("------------end FreeInstall_FA_ConnectAbility_1000-------------");
        done();
      }, 2000);
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_1200
     * @tc.name    No atomic service under path
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_1200", 0, async function (done) {
      console.log("------------start FreeInstall_FA_ConnectAbility_1200-------------");
      TAG = "FreeInstall_FA_ConnectAbility_1200";
      let cmdrm = "rm -r /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files/*";
      abilityDelegator.executeShellCommand(cmdrm, (err: any, d: any) => {
        console.info(TAG + " executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      let request12 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "com.example.myapplication1.ServiceAbility_feature",
        "moduleName": "myapplication3",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request12);
      setTimeout(() => {
        expect(Tempassert).assertEqual("onFailed");
        console.log("------------end FreeInstall_FA_ConnectAbility_1200-------------");
        done();
      }, 2000);
    });

    /*
     * @tc.number  FreeInstall_FA_ConnectAbility_1300
     * @tc.name    The application is not in the foreground [start MainAbility2 first, then connect]
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("FreeInstall_FA_ConnectAbility_1300", 0, async function (done) {
      console.log("------------start FreeInstall_FA_ConnectAbility_1300-------------");
      TAG = "FreeInstall_FA_ConnectAbility_1300";
      let str = {
        "want": {
          "bundleName": "com.example.myapplication.hmservice",
          "abilityName": "com.example.myapplication.MainAbility2",
        }
      }
      console.info(TAG + " startmainability2 str: " + JSON.stringify(str));
      featureAbility.startAbility(str)
        .then((data) => {
          console.info(TAG + " startmainability2 successful. Data: " + JSON.stringify(data))
        }).catch((error) => {
          console.error(TAG + " startmainability2 failed. Cause: " + JSON.stringify(error));
        })

      let request13 = {
        "bundleName": "com.example.myapplication.hmservice",
        "abilityName": "com.example.myapplication1.ServiceAbility_feature",
        "moduleName": "myapplication3",
        "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
      }
      connectabillity(TAG, request13);
      setTimeout(() => {
        expect(Tempassert).assertEqual("onFailed");
        console.log("------------end FreeInstall_FA_ConnectAbility_1300-------------");
        done();
      }, 2000);
    });
  })
}