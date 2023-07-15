/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
// @ts-nocheck
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
} from "@ohos/hypium";
import AbilityDelegatorRegistry from "@ohos.app.ability.abilityDelegatorRegistry";

export default function AbilityMonitor2Test() {
  const factoryWant = (
    bundleName: string,
    abilityName: string,
    moduleName: string
  ) => {
    return {
      bundleName: bundleName,
      abilityName: abilityName,
      moduleName: moduleName,
    };
  };

  describe("AbilityMonitor2Test", function () {
    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_CALLBACK_0100
     * @tc.name ACTS_AddAbilityMonitor_Callback_0100
     * @tc.desc Verify that addAbilityMonitor enters the parameter monitor to pass in the normal value, and executes the callback function (onAbilityForeground) CallBack when the ability status becomes foreground
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_CALLBACK_0100", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      function onAbilityForegroundCallback() {
        expect(true).assertTrue();
        abilityDelegator.printSync("ACTS_AddAbilityMonitor_Callback_0100 pass");
        abilityDelegator.getCurrentTopAbility((err: any, ability1: any) => {
          abilityDelegator.printSync(
            "ACTS_AddAbilityMonitor_Callback_0100 getCurrentTopAbility err:" +
              ability1.context.abilityInfo.name
          );
          abilityDelegator.removeAbilityMonitor(monitor);
          ability1.context.terminateSelf();
        });
        done();
      }

      let monitor = {
        abilityName: "Main2Ability",
        onAbilityForeground: onAbilityForegroundCallback,
      };
      abilityDelegator.addAbilityMonitor(monitor, (err: any) => {
        abilityDelegator.printSync(
          "ACTS_AddAbilityMonitor_Callback_0100 addAbilityMonitor:" +
            JSON.stringify(err)
        );
      });
      abilityDelegator.startAbility(want, (err: any) => {
        abilityDelegator.printSync(
          "ACTS_AddAbilityMonitor_Callback_0100 startAbility:" +
            JSON.stringify(err)
        );
      });
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_CALLBACK_0200
     * @tc.name ACTS_AddAbilityMonitor_Callback_0200
     * @tc.desc Verify that addAbilityMonitor enters the normal value of the monitor parameter and executes the callback function (onWindowStageCreate) CallBack when the window stage is created
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_CALLBACK_0200", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main3Ability",
        "entry"
      );
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      function onWindowStageCreateCallBack() {
        expect(true).assertTrue();
        abilityDelegator.printSync("ACTS_AddAbilityMonitor_Callback_0200 pass");
        abilityDelegator.getCurrentTopAbility((err: any, ability1: any) => {
          abilityDelegator.printSync(
            "ACTS_AddAbilityMonitor_Callback_0200 getCurrentTopAbility :" +
              ability1.context.abilityInfo.name
          );
          abilityDelegator.removeAbilityMonitor(monitor);
          ability1.context.terminateSelf();
        });
        done();
      }

      let monitor = {
        abilityName: "Main3Ability",
        onWindowStageCreate: onWindowStageCreateCallBack,
      };
      abilityDelegator.addAbilityMonitor(monitor, (err: any) => {
        abilityDelegator.printSync(
          "ACTS_AddAbilityMonitor_Callback_0200 addAbilityMonitor:" +
            JSON.stringify(err)
        );
      });
      abilityDelegator.startAbility(want, (err) => {
        abilityDelegator.printSync(
          "ACTS_AddAbilityMonitor_Callback_0200 startAbility:" +
            JSON.stringify(err)
        );
      });
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_CALLBACK_0300
     * @tc.name ACTS_AddAbilityMonitor_Callback_0300
     * @tc.desc Verify that addAbilityMonitor enters the parameter monitor to pass in the normal value, and executes the callback function (onWindowStageCreate) Promise when the window stage is created
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_CALLBACK_0300", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      function onAbilityBackgroundCallback() {
        expect(true).assertTrue();
        console.info("ACTS_AddAbilityMonitor_Callback_0300 pass");
        abilityDelegator.removeAbilityMonitor(monitor);
        done();
      }

      let monitor = {
        abilityName: "Main4Ability",
        onAbilityBackground: onAbilityBackgroundCallback,
      };
      abilityDelegator.addAbilityMonitor(monitor, (err: any) => {
        console.log(
          "ACTS_AddAbilityMonitor_Callback_0300 err:" + JSON.stringify(err)
        );
      });
      abilityDelegator.startAbility(want, (err) => {
        console.log(
          "ACTS_AddAbilityMonitor_Callback_0300 err:" + JSON.stringify(err)
        );
        setTimeout(() => {
          abilityDelegator.getCurrentTopAbility((err: any, ability1: any) => {
            console.log(
              "ACTS_AddAbilityMonitor_Callback_0300 getCurrentTopAbility err:" +
                JSON.stringify(err)
            );
            abilityDelegator.printSync(
              "ACTS_AddAbilityMonitor_Callback_0300 getCurrentTopAbility err:" +
                ability1.context.abilityInfo.name
            );
            abilityDelegator.doAbilityBackground(ability1, (err: any) => {
              console.log(
                "ACTS_AddAbilityMonitor_Callback_0300 doAbilityBackground err:" +
                  JSON.stringify(err)
              );
            });
          });
        }, 2000);
      });
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_CALLBACK_0400
     * @tc.name ACTS_AddAbilityMonitor_Callback_0400
     * @tc.desc Verify that addAbilityMonitor enters the parameter monitor to pass in the normal value, and executes the onAbilityBackground Promise when the ability status becomes background
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_CALLBACK_0400", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "MainAbility",
        "entry"
      );
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      function onWindowStageDestroyCallBack(data) {
        expect(true).assertTrue();
        console.info("ACTS_AddAbilityMonitor_Callback_0400 pass");
        abilityDelegator.removeAbilityMonitor(monitor);
        done();
      }

      let monitor = {
        abilityName: "MainAbility",
        onWindowStageDestroy: onWindowStageDestroyCallBack,
      };
      abilityDelegator.addAbilityMonitor(monitor, (err: any) => {
        console.log(
          "ACTS_AddAbilityMonitor_Callback_0400 err:" + JSON.stringify(err)
        );
      });
      setTimeout(() => {
        abilityDelegator.startAbility(want, (err) => {
          console.log(
            "ACTS_AddAbilityMonitor_Callback_0400 err:" + JSON.stringify(err)
          );
          setTimeout(() => {
            abilityDelegator.getCurrentTopAbility((err: any, ability1: any) => {
              abilityDelegator.printSync(
                "ACTS_AddAbilityMonitor_Callback_0400 getCurrentTopAbility err:" +
                  JSON.stringify(err)
              );
              abilityDelegator.printSync(
                "ACTS_AddAbilityMonitor_Callback_0400 getCurrentTopAbility err:" +
                  ability1.context.abilityInfo.name
              );
              ability1.context.terminateSelf();
            });
          }, 2000);
        });
      }, 2000);
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_CALLBACK_0500
     * @tc.name ACTS_AddAbilityMonitor_Callback_0500
     * @tc.desc Verify that addAbilityMonitor enters the parameter monitor to pass in the normal value, and executes the onAbilityDestroy callBack function before the ability is destroyed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_CALLBACK_0500", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main3Ability",
        "entry"
      );
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      function onAbilityDestroyCallback(data) {
        console.log(
          "ACTS_AddAbilityMonitor_Callback_0500 data1: " +
            JSON.stringify(data.context.abilityInfo)
        );
        expect(true).assertTrue();
        abilityDelegator.printSync("ACTS_AddAbilityMonitor_Callback_0500 pass");
        abilityDelegator.removeAbilityMonitor(monitor);
        done();
      }

      let monitor = {
        abilityName: "Main3Ability",
        onAbilityDestroy: onAbilityDestroyCallback,
      };
      abilityDelegator.addAbilityMonitor(monitor, (err: any) => {
        abilityDelegator.printSync(
          "ACTS_AddAbilityMonitor_Callback_0500 addAbilityMonitor:" +
            JSON.stringify(err)
        );
      });
      setTimeout(() => {
        abilityDelegator.startAbility(want, (err) => {
          console.log(
            "ACTS_AddAbilityMonitor_Callback_0500 startAbility:" +
              JSON.stringify(err)
          );
          setTimeout(() => {
            abilityDelegator.getCurrentTopAbility((err: any, ability1: any) => {
              abilityDelegator.printSync(
                "ACTS_AddAbilityMonitor_Callback_0500 getCurrentTopAbility:" +
                  JSON.stringify(err)
              );
              abilityDelegator.printSync(
                "ACTS_AddAbilityMonitor_Callback_0500 getCurrentTopAbility:" +
                  ability1.context.abilityInfo.name
              );
              ability1.context.terminateSelf();
            });
          }, 2000);
        });
      }, 2000);
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_PROMISE_0100
     * @tc.name ACTS_AddAbilityMonitor_Promise_0100
     * @tc.desc Verify that addAbilityMonitor enters the parameter monitor to pass in the normal value, and executes the onAbilityForeground Promise when the ability status becomes foreground
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_PROMISE_0100", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );

      function onAbilityForegroundPromise() {
        expect(true).assertTrue();
        abilityDelegator.printSync("ACTS_AddAbilityMonitor_Promise_0100 pass");
        abilityDelegator.getCurrentTopAbility((err: any, ability1: any) => {
          abilityDelegator.printSync(
            "ACTS_AddAbilityMonitor_Promise_0100 getCurrentTopAbility :" +
              ability1.context.abilityInfo.name
          );
          abilityDelegator.removeAbilityMonitor(monitor);
          ability1.context.terminateSelf();
        });
        done();
      }

      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let monitor = {
        abilityName: "Main4Ability",
        onAbilityForeground: onAbilityForegroundPromise,
      };
      abilityDelegator
        .addAbilityMonitor(monitor)
        .then(() => {
          abilityDelegator.printSync("ACTS_AddAbilityMonitor_Promise_0100 add");
          abilityDelegator.startAbility(want);
        })
        .catch((err) => {
          abilityDelegator.printSync(
            "ACTS_AddAbilityMonitor_Promise_0100 error"
          );
          done();
        });
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_PROMISE_0200
     * @tc.name ACTS_AddAbilityMonitor_Promise_0200
     * @tc.desc Verify that addAbilityMonitor enters the parameter monitor to pass in the normal value, and executes the callback function (onWindowStageCreate) Promise when the window stage is created
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_PROMISE_0200", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );

      function onWindowStageCreatePromise() {
        expect(true).assertTrue();
        abilityDelegator.printSync("ACTS_AddAbilityMonitor_Promise_0200 pass");
        abilityDelegator.getCurrentTopAbility((err: any, ability1: any) => {
          abilityDelegator.printSync(
            "ACTS_AddAbilityMonitor_Promise_0200 getCurrentTopAbility :" +
              ability1.context.abilityInfo.name
          );
          abilityDelegator.removeAbilityMonitor(monitor);
          ability1.context.terminateSelf();
        });
        done();
      }

      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let monitor = {
        abilityName: "Main2Ability",
        onWindowStageCreate: onWindowStageCreatePromise,
      };
      abilityDelegator
        .addAbilityMonitor(monitor)
        .then(async () => {
          abilityDelegator.printSync("ACTS_AddAbilityMonitor_Promise_0200 add");
          setTimeout(() => {
            abilityDelegator.startAbility(want).then(async () => {
              abilityDelegator.printSync(
                "ACTS_AddAbilityMonitor_Promise_0200 start"
              );
            });
          }, 2000);
        })
        .catch((err) => {
          abilityDelegator.printSync(
            "ACTS_AddAbilityMonitor_Promise_0200 error"
          );
          done();
        });
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_PROMISE_0300
     * @tc.name ACTS_AddAbilityMonitor_Promise_0300
     * @tc.desc Verify that addAbilityMonitor enters the parameter monitor to pass in the normal value, and executes the onAbilityBackground Promise when the ability status becomes background     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_PROMISE_0300", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main3Ability",
        "entry"
      );

      function onAbilityBackgroundPromise(data) {
        expect(true).assertTrue();
        console.log("ACTS_AddAbilityMonitor_Promise_0300 pass");
        // abilityDelegator.getCurrentTopAbility((err: any, ability1: any) => {
        //   abilityDelegator.printSync("ACTS_AddAbilityMonitor_Promise_0300 getCurrentTopAbility :" + ability1.context.abilityInfo.name);
        abilityDelegator.removeAbilityMonitor(monitor);
        data.context.terminateSelf();
        // })
        done();
      }

      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let monitor = {
        abilityName: "Main3Ability",
        onAbilityBackground: onAbilityBackgroundPromise,
      };
      abilityDelegator
        .addAbilityMonitor(monitor)
        .then(async () => {
          console.info("ACTS_AddAbilityMonitor_Promise_0300 add");
        })
        .catch((err) => {
          console.info("ACTS_AddAbilityMonitor_Promise_0300 error");
          done();
        });
      setTimeout(() => {
        abilityDelegator
          .startAbility(want)
          .then(async () => {
            console.info("ACTS_AddAbilityMonitor_Promise_0300 start");
            setTimeout(() => {
              abilityDelegator.getCurrentTopAbility().then((ability) => {
                console.info(
                  "ACTS_AddAbilityMonitor_Promise_0300 ability" +
                    JSON.stringify(ability)
                );
                abilityDelegator.doAbilityBackground(ability).then(async () => {
                  console.info(
                    "ACTS_AddAbilityMonitor_Promise_0300 doAbilityBackground."
                  );
                });
              });
            }, 2000);
          })
          .catch((err) => {
            console.info(
              "ACTS_AddAbilityMonitor_Promise_0300 startability error"
            );
            done();
          });
      }, 2000);
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_PROMISE_0400
     * @tc.name ACTS_AddAbilityMonitor_Promise_0400
     * @tc.desc Verify that addAbilityMonitor enters the parameter monitor to pass in the normal value, and executes the callback function (onWindowStageDestroy) Promise before the window stage is destroyed
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_PROMISE_0400", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );

      function onWindowStageDestroyPromise() {
        expect(true).assertTrue();
        console.log("ACTS_AddAbilityMonitor_Promise_0400 pass");
        abilityDelegator.removeAbilityMonitor(monitor);
        done();
      }

      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let monitor = {
        abilityName: "Main4Ability",
        onWindowStageDestroy: onWindowStageDestroyPromise,
      };
      abilityDelegator
        .addAbilityMonitor(monitor)
        .then(async () => {
          console.info("ACTS_AddAbilityMonitor_Promise_0400 add");
        })
        .catch((err) => {
          console.info("ACTS_AddAbilityMonitor_Promise_0400 error");
          done();
        });
      setTimeout(() => {
        abilityDelegator.startAbility(want, (err) => {
          console.log(
            "ACTS_AddAbilityMonitor_Promise_0400 err:" + JSON.stringify(err)
          );
          setTimeout(() => {
            abilityDelegator.getCurrentTopAbility((err: any, ability1: any) => {
              abilityDelegator.printSync(
                "ACTS_AddAbilityMonitor_Promise_0400 top err:" +
                  JSON.stringify(err)
              );
              abilityDelegator.printSync(
                "ACTS_AddAbilityMonitor_Promise_0400 getCurrentTopAbility :" +
                  ability1.context.abilityInfo.name
              );
              ability1.context.terminateSelf();
            });
          }, 2000);
        });
      }, 2000);
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_PROMISE_0500
     * @tc.name ACTS_AddAbilityMonitor_Promise_0500
     * @tc.desc Verify that the addAbilityMonitor parameter monitor passes in the normal value, and execute the onAbilityDestroy Promise before the ability is destroyed
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_PROMISE_0500", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main3Ability",
        "entry"
      );

      function onAbilityDestroyPromise() {
        expect(true).assertTrue();
        abilityDelegator.printSync("ACTS_AddAbilityMonitor_Promise_0500 pass");
        abilityDelegator.removeAbilityMonitor(monitor);
        done();
      }

      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let monitor = {
        abilityName: "Main3Ability",
        onAbilityDestroy: onAbilityDestroyPromise,
      };
      abilityDelegator
        .addAbilityMonitor(monitor)
        .then(async () => {
          abilityDelegator.printSync("ACTS_AddAbilityMonitor_Promise_0500 add");
        })
        .catch((err) => {
          abilityDelegator.printSync(
            "ACTS_AddAbilityMonitor_Promise_0500 error"
          );
          done();
        });
      abilityDelegator.startAbility(want, (err) => {
        console.log(
          "ACTS_AddAbilityMonitor_Promise_0500 err:" + JSON.stringify(err)
        );
        setTimeout(() => {
          abilityDelegator.getCurrentTopAbility((err: any, ability1: any) => {
            abilityDelegator.printSync(
              "ACTS_AddAbilityMonitor_Promise_0500 top err:" +
                JSON.stringify(err)
            );
            abilityDelegator.printSync(
              "ACTS_AddAbilityMonitor_Promise_0500 top ability:" +
                ability1.context.abilityInfo.name
            );
            ability1.context.terminateSelf();
          });
        }, 2000);
      });
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0100
     * @tc.name ACTS_RemoveABILITY_MONITOR_CALLBACK_0100
     * @tc.desc After verifying removeAbilityMonitor, you cannot listen to the onAbilityForeground callback CallBack
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0100", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 0;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      function onAbilityForegroundCallback() {
        result = 1;
        abilityDelegator.printSync(
          "ACTS_RemoveABILITY_MONITOR_CALLBACK_0100 error"
        );
        done();
      }

      let monitor = {
        abilityName: "Main4Ability",
        onAbilityForeground: onAbilityForegroundCallback,
      };
      abilityDelegator.addAbilityMonitor(monitor);
      abilityDelegator.removeAbilityMonitor(monitor, (err: any) => {
        abilityDelegator.printSync("ACTS_RemoveABILITY_MONITOR_CALLBACK_0100.");
      });
      await abilityDelegator.startAbility(want);
      setTimeout(() => {
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          "ACTS_RemoveABILITY_MONITOR_CALLBACK_0100 pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0200
     * @tc.name ACTS_RemoveABILITY_MONITOR_CALLBACK_0200
     * @tc.desc After validating removeAbilityMonitor, you cannot listen to the onWindowStageCreate callback CallBack
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0200", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 0;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      function onWindowStageCreateCallBack() {
        result = 1;
        abilityDelegator.printSync(
          "ACTS_REMOVEABILITY_MONITOR_CALLBACK_0200 error"
        );
        done();
      }

      let monitor = {
        abilityName: "Main4Ability",
        onWindowStageCreate: onWindowStageCreateCallBack,
      };
      abilityDelegator.addAbilityMonitor(monitor);
      abilityDelegator.removeAbilityMonitor(monitor, (err: any) => {
        abilityDelegator.printSync(
          "ACTS_REMOVEABILITY_MONITOR_CALLBACK_0200 ."
        );
      });
      await abilityDelegator.startAbility(want);
      setTimeout(() => {
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          "ACTS_REMOVEABILITY_MONITOR_CALLBACK_0200 pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0300
     * @tc.name ACTS_RemoveABILITY_MONITOR_CALLBACK_0300
     * @tc.desc After verifying removeAbilityMonitor, you cannot listen to the onAbilityBackground callback callback
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0300", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 0;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      function onAbilityBackgroundCallBack() {
        result = 1;
        abilityDelegator.printSync(
          "ACTS_REMOVEABILITY_MONITOR_CALLBACK_0300 error"
        );
        done();
      }

      let monitor = {
        abilityName: "Main4Ability",
        onAbilityBackground: onAbilityBackgroundCallBack,
      };
      abilityDelegator.addAbilityMonitor(monitor);
      abilityDelegator.removeAbilityMonitor(monitor, (err: any) => {
        abilityDelegator.printSync(
          "ACTS_REMOVEABILITY_MONITOR_CALLBACK_0300 ."
        );
      });
      abilityDelegator.startAbility(want, (err) => {
        console.log(
          "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0300 err:" + JSON.stringify(err)
        );
        setTimeout(() => {
          abilityDelegator.getCurrentTopAbility((err: any, ability1: any) => {
            abilityDelegator.printSync(
              "ACTS_REMOVEABILITY_MONITOR_CALLBACK_0300 getCurrentTopAbility err:" +
                JSON.stringify(err)
            );
            abilityDelegator.printSync(
              "ACTS_REMOVEABILITY_MONITOR_CALLBACK_0300 top ability:" +
                ability1.context.abilityInfo.name
            );
            abilityDelegator.doAbilityBackground(ability1, (err: any) => {
              abilityDelegator.printSync(
                "ACTS_REMOVEABILITY_MONITOR_CALLBACK_0300 doAbilityBackground err:" +
                  JSON.stringify(err)
              );
            });
          });
        }, 2000);
      });
      setTimeout(() => {
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          "ACTS_REMOVEABILITY_MONITOR_CALLBACK_0300 pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0400
     * @tc.name ACTS_RemoveABILITY_MONITOR_CALLBACK_0400
     * @tc.desc After verifying removeAbilityMonitor, you cannot listen to the onAbilityDestroy callback CallBack
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0400", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 0;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      function onAbilityDestroyCallBack() {
        result = 1;
        abilityDelegator.printSync(
          "ACTS_REMOVEABILITY_MONITOR_CALLBACK_0400 error"
        );
        done();
      }

      let monitor = {
        abilityName: "Main4Ability",
        onAbilityDestroy: onAbilityDestroyCallBack,
      };
      abilityDelegator.addAbilityMonitor(monitor);
      abilityDelegator.removeAbilityMonitor(monitor, (err: any) => {
        abilityDelegator.printSync(
          "ACTS_REMOVEABILITY_MONITOR_CALLBACK_0400. "
        );
      });
      abilityDelegator.startAbility(want, (err) => {
        console.log(
          "ACTS_AddAbilityMonitor_Callback_0600 err:" + JSON.stringify(err)
        );
        setTimeout(() => {
          abilityDelegator.getCurrentTopAbility((err: any, ability1: any) => {
            abilityDelegator.printSync(
              "ACTS_REMOVEABILITY_MONITOR_CALLBACK_0400 getCurrentTopAbility err:" +
                JSON.stringify(err)
            );
            ability1.context.terminateSelf();
          });
        }, 2000);
      });
      setTimeout(() => {
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          "ACTS_REMOVEABILITY_MONITOR_CALLBACK_0400 pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0500
     * @tc.name ACTS_RemoveABILITY_MONITOR_CALLBACK_0500
     * @tc.desc After verifying removeAbilityMonitor, you cannot listen to the onWindowStageDestroy callback CallBack
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0500", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 0;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      function onWindowStageDestroyCallBack() {
        result = 1;
        abilityDelegator.printSync(
          "ACTS_REMOVEABILITY_MONITOR_CALLBACK_0500 error"
        );
        done();
      }

      let monitor = {
        abilityName: "Main4Ability",
        onWindowStageDestroy: onWindowStageDestroyCallBack,
      };
      abilityDelegator.addAbilityMonitor(monitor);
      abilityDelegator.removeAbilityMonitor(monitor, (err: any) => {
        abilityDelegator.printSync(
          "ACTS_REMOVEABILITY_MONITOR_CALLBACK_0500 ."
        );
      });
      abilityDelegator.startAbility(want, (err) => {
        console.log(
          "ACTS_REMOVEABILITY_MONITOR_CALLBACK_0500 err:" + JSON.stringify(err)
        );
        setTimeout(() => {
          abilityDelegator.getCurrentTopAbility((err: any, ability1: any) => {
            abilityDelegator.printSync(
              "ACTS_REMOVEABILITY_MONITOR_CALLBACK_0500 getCurrentTopAbility err:" +
                JSON.stringify(err)
            );
            ability1.context.terminateSelf();
          });
        }, 2000);
      });
      setTimeout(() => {
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          "ACTS_REMOVEABILITY_MONITOR_CALLBACK_0500 pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0100
     * @tc.name Acts_RemoveAbility_Monitor_Promise_0100
     * @tc.desc After verifying removeAbilityMonitor, you cannot listen to onAbilityForeground callback promises
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0100", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 1;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      function onAbilityForegroundPromise() {
        abilityDelegator.printSync(
          "ACTS_REMOVEABILITY_MONITOR_PROMISE_0100 error "
        );
        result = 0;
        done();
      }

      let monitor = {
        abilityName: "Main4Ability",
        onAbilityForeground: onAbilityForegroundPromise,
      };
      await abilityDelegator.addAbilityMonitor(monitor);
      abilityDelegator
        .removeAbilityMonitor(monitor)
        .then(() => {
          abilityDelegator.printSync(
            "ACTS_REMOVEABILITY_MONITOR_PROMISE_0100 callback"
          );
        })
        .catch((err) => {
          abilityDelegator.printSync(
            "ACTS_REMOVEABILITY_MONITOR_PROMISE_0100 error"
          );
          done();
        });
      await abilityDelegator.startAbility(want);
      setTimeout(() => {
        expect(result).assertEqual(1);
        abilityDelegator.printSync(
          "ACTS_REMOVEABILITY_MONITOR_PROMISE_0100 pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0200
     * @tc.name Acts_RemoveAbility_Monitor_Promise_0200
     * @tc.desc After verifying removeAbilityMonitor, you cannot listen to the onWindowStageCreate callback Promise
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0200", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 1;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      function onWindowStageCreatePromise() {
        abilityDelegator.printSync(
          "ACTS_REMOVEABILITY_MONITOR_PROMISE_0200 error "
        );
        result = 0;
        done();
      }

      let monitor = {
        abilityName: "Main4Ability",
        onWindowStageCreate: onWindowStageCreatePromise,
      };
      await abilityDelegator.addAbilityMonitor(monitor);
      abilityDelegator
        .removeAbilityMonitor(monitor)
        .then(() => {
          abilityDelegator.printSync(
            "ACTS_REMOVEABILITY_MONITOR_PROMISE_0200 promise"
          );
        })
        .catch((err) => {
          abilityDelegator.printSync(
            "ACTS_REMOVEABILITY_MONITOR_PROMISE_0200 error"
          );
          done();
        });
      await abilityDelegator.startAbility(want);
      setTimeout(() => {
        expect(result).assertEqual(1);
        abilityDelegator.printSync(
          "ACTS_REMOVEABILITY_MONITOR_PROMISE_0200 pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0300
     * @tc.name Acts_RemoveAbility_Monitor_Promise_0300
     * @tc.desc After validating removeAbilityMonitor, you cannot listen to the onAbilityBackground callback Promise
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0300", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 1;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      function onAbilityBackgroundPromise() {
        abilityDelegator.printSync(
          "ACTS_REMOVEABILITY_MONITOR_PROMISE_0300 error "
        );
        result = 0;
        done();
      }

      let monitor = {
        abilityName: "Main4Ability",
        onAbilityBackground: onAbilityBackgroundPromise,
      };
      await abilityDelegator.addAbilityMonitor(monitor);
      abilityDelegator
        .removeAbilityMonitor(monitor)
        .then(() => {
          abilityDelegator.printSync(
            "ACTS_REMOVEABILITY_MONITOR_PROMISE_0300 promise"
          );
        })
        .catch((err) => {
          abilityDelegator.printSync(
            "ACTS_REMOVEABILITY_MONITOR_PROMISE_0300 error"
          );
          done();
        });
      abilityDelegator
        .startAbility(want)
        .then(async () => {
          console.info("ACTS_REMOVEABILITY_MONITOR_PROMISE_0300 start");
          abilityDelegator.getCurrentTopAbility().then((ability) => {
            console.info(
              "ACTS_REMOVEABILITY_MONITOR_PROMISE_0300 ability" +
                JSON.stringify(ability)
            );
            abilityDelegator.doAbilityBackground(ability).then(async () => {
              console.info(
                "ACTS_REMOVEABILITY_MONITOR_PROMISE_0300 doAbilityBackground succeed."
              );
            });
          });
        })
        .catch((err) => {
          abilityDelegator.printSync(
            "ACTS_REMOVEABILITY_MONITOR_PROMISE_0300 start error"
          );
          done();
        });
      setTimeout(() => {
        expect(result).assertEqual(1);
        abilityDelegator.printSync(
          "ACTS_REMOVEABILITY_MONITOR_PROMISE_0300 pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0400
     * @tc.name Acts_RemoveAbility_Monitor_Promise_0400
     * @tc.desc After verifying removeAbilityMonitor, you cannot listen to onAbilityDestroy callback promises
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0400", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 1;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      function onAbilityDestroyPromise() {
        abilityDelegator.printSync(
          "ACTS_REMOVEABILITY_MONITOR_PROMISE_0400 error "
        );
        result = 0;
        done();
      }

      let monitor = {
        abilityName: "Main4Ability",
        onAbilityDestroy: onAbilityDestroyPromise,
      };
      await abilityDelegator.addAbilityMonitor(monitor);
      abilityDelegator
        .removeAbilityMonitor(monitor)
        .then(() => {
          abilityDelegator.printSync(
            "ACTS_REMOVEABILITY_MONITOR_PROMISE_0400 promise"
          );
        })
        .catch((err) => {
          abilityDelegator.printSync(
            "ACTS_REMOVEABILITY_MONITOR_PROMISE_0400 error"
          );
          done();
        });
      abilityDelegator
        .startAbility(want)
        .then(async () => {
          console.info("ACTS_REMOVEABILITY_MONITOR_PROMISE_0400 start");
          abilityDelegator.getCurrentTopAbility().then((ability) => {
            console.info(
              "ACTS_REMOVEABILITY_MONITOR_PROMISE_0400 ability" +
                JSON.stringify(ability)
            );
            ability1.context.terminateSelf();
          });
        })
        .catch((err) => {
          abilityDelegator.printSync(
            "ACTS_REMOVEABILITY_MONITOR_PROMISE_0400 start error"
          );
          done();
        });
      setTimeout(() => {
        expect(result).assertEqual(1);
        abilityDelegator.printSync(
          "ACTS_REMOVEABILITY_MONITOR_PROMISE_0400 pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0500
     * @tc.name Acts_RemoveAbility_Monitor_Promise_0500
     * @tc.desc After verifying removeAbilityMonitor, you cannot listen to the onWindowStageDestroy callback Promise
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0500", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main4Ability",
        "entry"
      );
      let result = 1;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      function onWindowStageDestroyPromise() {
        abilityDelegator.printSync(
          "ACTS_REMOVEABILITY_MONITOR_PROMISE_0500 error "
        );
        result = 0;
        done();
      }

      let monitor = {
        abilityName: "Main4Ability",
        onWindowStageDestroy: onWindowStageDestroyPromise,
      };
      await abilityDelegator.addAbilityMonitor(monitor);
      abilityDelegator
        .removeAbilityMonitor(monitor)
        .then(() => {
          abilityDelegator.printSync(
            "ACTS_REMOVEABILITY_MONITOR_PROMISE_0500 promise"
          );
        })
        .catch((err) => {
          abilityDelegator.printSync(
            "ACTS_REMOVEABILITY_MONITOR_PROMISE_0500 error"
          );
          done();
        });
      abilityDelegator
        .startAbility(want)
        .then(async () => {
          console.info("ACTS_REMOVEABILITY_MONITOR_PROMISE_0500 start");
          abilityDelegator.getCurrentTopAbility().then((ability) => {
            console.info(
              "ACTS_REMOVEABILITY_MONITOR_PROMISE_0500 ability" +
                JSON.stringify(ability)
            );
            ability1.context.terminateSelf();
          });
        })
        .catch((err) => {
          abilityDelegator.printSync(
            "ACTS_REMOVEABILITY_MONITOR_PROMISE_0500 start error"
          );
          done();
        });
      setTimeout(() => {
        expect(result).assertEqual(1);
        abilityDelegator.printSync(
          "ACTS_REMOVEABILITY_MONITOR_PROMISE_0500 pass "
        );
        done();
      }, 3000);
    });
  });
}
