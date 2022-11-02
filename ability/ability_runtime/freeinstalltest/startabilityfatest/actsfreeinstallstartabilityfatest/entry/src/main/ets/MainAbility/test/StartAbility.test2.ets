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
import featureAbility from "@ohos.ability.featureAbility";
import wantConstant from '@ohos.ability.wantConstant';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import commonEvent from '@ohos.commonEvent';

export default function startAbilityTest2() {

  describe('startAbilityTest2', function () {

    var TAG = "";

    var delegator = AbilityDelegatorRegistry.getAbilityDelegator();

    function sleep(time) {
      return new Promise((resolve) => setTimeout(resolve, time))
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
      if ("FreeInstall_FA_Local_StartAbility_2000" === TAG) {
        var cmd4 = "bm uninstall -n com.example.qianyiyingyong.hmservice";
        delegator.executeShellCommand(cmd4, (err: any, d: any) => {
          console.info("executeShellCommand4 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        })
        await sleep(500);
      }

      if ("FreeInstall_FA_Local_StartAbility_2500" === TAG) {
        var cmd5 = "bm uninstall -n com.ohos.hag.famanager";
        delegator.executeShellCommand(cmd5, (err: any, d: any) => {
          console.info("executeShellCommand5 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
        })
      }
      await sleep(500);
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_Local_StartAbility_1900
     * @tc.name    The current service is not in the foreground. Page a jumps to page B first.
                    There are HAP packages that need not be installed under the specified path
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_FA_Local_StartAbility_1900", 0, async function (done) {
      console.info("------------start FreeInstall_FA_Local_StartAbility_1900-------------");
      TAG = "FreeInstall_FA_Local_StartAbility_1900";
      let wrong;
      var str1 = {
        'want': {
          "bundleName": "com.open.harmony.startAbility",
          "abilityName": "com.open.harmony.startAbility.PageAbility",
          "moduleName": "entry",
        }
      }
      featureAbility.startAbility(str1)
        .then((data) => {
          console.info(TAG + ' StartAbility successful. Promise Data: ' + JSON.stringify(data))
        }).catch((error) => {
          console.info(TAG + ' StartAbility failed. error: ' + JSON.stringify(error));
        })
      setTimeout(async () => {
        var str = {
          'want': {
            "bundleName": "com.example.qianyiyingyong.hmservice",
            "abilityName": "com.example.qianyiyingyong.MainAbility",
            "moduleName": "entry",
            "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND
          }
        }
        await featureAbility.startAbility(str).then((data) => {
          console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        }).catch((error) => {
          wrong = error;
          console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
        });
        expect(wrong.code).assertEqual(13);
      }, 2000)
      console.info("------------end FreeInstall_FA_Local_StartAbility_1900-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_Local_StartAbility_2000
     * @tc.name    The current service is not in the foreground. Page a jumps to page B first.
                    The atomized HAP package has been installed
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_FA_Local_StartAbility_2000", 0, async function (done) {
      console.info("------------start FreeInstall_FA_Local_StartAbility_2000-------------");
      TAG = "FreeInstall_FA_Local_StartAbility_2000";
      var cmd2000 = "bm install -p data/test/AtomizationFaEntry.hap";
      delegator.executeShellCommand(cmd2000, (err: any, d: any) => {
        console.info("executeShellCommand : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      await sleep(500);
      let wrong;
      var str1 = {
        'want': {
          "bundleName": "com.open.harmony.startAbility",
          "abilityName": "com.open.harmony.startAbility.PageAbility",
          "moduleName": "entry",
        }
      }
      featureAbility.startAbility(str1)
        .then((data) => {
          console.info(TAG + ' StartAbility successful. Promise Data: ' + JSON.stringify(data))
        }).catch((error) => {
          console.info(TAG + ' StartAbility failed. error: ' + JSON.stringify(error));
        })
      setTimeout(async () => {
        var str = {
          'want': {
            "bundleName": "com.example.qianyiyingyong.hmservice",
            "abilityName": "com.example.qianyiyingyong.MainAbility",
            "moduleName": "entry",
            "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND
          }
        }
        await featureAbility.startAbility(str).then((data) => {
          console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        }).catch((error) => {
          wrong = error;
          console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
        });
        await sleep(2000);
        expect(wrong.code).assertEqual(13);
      }, 2000)
      console.info("------------end FreeInstall_FA_Local_StartAbility_2000-------------");
      done();
    });

    /*
     * @tc.number  FreeInstall_FA_Local_StartAbility_2500
     * @tc.name    FA Service Center installation free timeout
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("FreeInstall_FA_Local_StartAbility_2500", 0, async function (done) {
      console.info("------------start FreeInstall_FA_Local_StartAbility_2500-------------");
      TAG = "FreeInstall_FA_Local_StartAbility_2500";
      var cmd2500 = "bm uninstall -n com.ohos.hag.famanager";
      delegator.executeShellCommand(cmd2500, (err: any, d: any) => {
        console.info("executeShellCommand2500 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      var cmd2501 = "bm install -p data/test/MockServiceTimeout.hap";
      delegator.executeShellCommand(cmd2501, (err: any, d: any) => {
        console.info("executeShellCommand2501 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      var cmd2502 = "mkdir /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry";
      delegator.executeShellCommand(cmd2502, (err: any, d: any) => {
        console.info("executeShellCommand1 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      var cmd2503 = "mkdir /data/app/el2/100/base/com.ohos.hag.famanager/haps/entry/files";
      delegator.executeShellCommand(cmd2503, (err: any, d: any) => {
        console.info("executeShellCommand2 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      var cmd2504 = "cp data/test/AtomizationFaEntry.hap /data/app/el2/100/base/com.ohos.hag.famanager/haps" +
        "/entry/files";
      delegator.executeShellCommand(cmd2504, (err: any, d: any) => {
        console.info("executeShellCommand3 : err : " + JSON.stringify(err), " data : " + JSON.stringify(d));
      })
      setTimeout(async () => {
        let wrong;
        var str = {
          'want': {
            "bundleName": "com.example.qianyiyingyong.hmservice",
            "abilityName": "com.example.qianyiyingyong.MainAbility",
            "moduleName": "entry",
            "flags": wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
          }
        }
        featureAbility.startAbility(str).then((data) => {
          console.log(TAG + ": startAbility success. data: " + JSON.stringify(data));
        }).catch((error) => {
          wrong = error;
          console.log(TAG + ": startAbility fail. err: " + JSON.stringify(error));
        });
        await sleep(35000);
        expect(wrong.code).assertEqual(3);
      }, 2000)
      console.info("------------end FreeInstall_FA_Local_StartAbility_2500-------------");
      done();
    });

    console.info("-------------FA model--> startAbilityXTS Test end----------------")
  })
}