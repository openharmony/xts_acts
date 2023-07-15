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
import AbilityDelegatorRegistry from "@ohos.app.ability.abilityDelegatorRegistry";
import { describe, expect, it } from "@ohos/hypium";

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

export default function AbilityMonitorTest() {
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

  describe("AbilityMonitorTest", function () {
    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_CALLBACK_0100
     * @tc.name actsAddAbilityMonitorCallback0100
     * @tc.desc pass in a null monitor.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 3
     */
    it("ACTS_ADD_ABILITY_MONITOR_CALLBACK_0100", 0, async function (done) {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let monitor = null;
      try {
        abilityDelegator.addAbilityMonitor(monitor, (err: any, data: any) => {
          abilityDelegator.printSync(
            "ACTS_ADD_ABILITY_MONITOR_CALLBACK_0100" + err.code
          );
          expect().assertFail();
          done();
        });
      } catch (e) {
        abilityDelegator.printSync(
          "ACTS_ADD_ABILITY_MONITOR_CALLBACK_0100 code:" + e.code
        );
        abilityDelegator.printSync(
          "ACTS_ADD_ABILITY_MONITOR_CALLBACK_0100 message:" + e.message
        );
        expect(e.code).assertEqual(401);
        expect(e.message).assertEqual("Incorrect parameters.");
        expect(true).assertTrue();
        abilityDelegator.printSync(
          "ACTS_ADD_ABILITY_MONITOR_CALLBACK_0100 pass"
        );
        done();
      }
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_CALLBACK_0200
     * @tc.name actsAddAbilityMonitorCallback0200
     * @tc.desc Pass in a monitor
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_CALLBACK_0200", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );

      function onAbilityCreateCallback(data) {
        console.log("ACTS_ADD_ABILITY_MONITOR_CALLBACK_0200 ");
        expect(true).assertTrue();
        abilityDelegator.printSync(
          "ACTS_ADD_ABILITY_MONITOR_CALLBACK_0200 pass"
        );
        data.context.terminateSelf();
        done();
      }

      let monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: onAbilityCreateCallback,
      };
      abilityDelegator.addAbilityMonitor(monitor, (err: any) => {
        console.log("ACTS_ADD_ABILITY_MONITOR_CALLBACK_0200");
      });
      await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_CALLBACK_0300
     * @tc.name actsAddAbilityMonitorCallback0300
     * @tc.desc Pass in a monitor that has already been added.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_CALLBACK_0300", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );

      function onAbilityCreateCallback(data) {
        expect(true).assertTrue();
        abilityDelegator.printSync(
          "ACTS_ADD_ABILITY_MONITOR_CALLBACK_0300 pass "
        );
        data.context.terminateSelf();
        done();
      }

      let monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: onAbilityCreateCallback,
      };
      await abilityDelegator.addAbilityMonitor(monitor);
      abilityDelegator.addAbilityMonitor(monitor, (err: any) => {
        console.log("ACTS_ADD_ABILITY_MONITOR_CALLBACK_0300");
      });
      await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_PROMISE_0100
     * @tc.name actsAddAbilityMonitorPromise0100
     * @tc.desc pass in a null monitor.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 3
     */
    it("ACTS_ADD_ABILITY_MONITOR_PROMISE_0100", 0, async function (done) {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let monitor = null;
      try {
        let result = await abilityDelegator.addAbilityMonitor(monitor);
        abilityDelegator.printSync(
          "ACTS_ADD_ABILITY_MONITOR_PROMISE_0100 error"
        );
        expect().assertFail();
        done();
      } catch (e) {
        abilityDelegator.printSync(
          "ACTS_ADD_ABILITY_MONITOR_PROMISE_0100 code:" + e.code
        );
        abilityDelegator.printSync(
          "ACTS_ADD_ABILITY_MONITOR_PROMISE_0100 message:" + e.message
        );
        expect(e.code).assertEqual(401);
        expect(e.message).assertEqual("Incorrect parameters.");
        expect(true).assertTrue();
        abilityDelegator.printSync(
          "ACTS_ADD_ABILITY_MONITOR_PROMISE_0100 pass"
        );
        done();
      }
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_PROMISE_0200
     * @tc.name actsAddAbilityMonitorPromise0200
     * @tc.desc Pass in a monitor
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_PROMISE_0200", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );

      function onAbilityCreateCallback(data) {
        expect(true).assertTrue();
        abilityDelegator.printSync('ACTS_ADD_ABILITY_MONITOR_PROMISE_0200 pass');
        data.context.terminateSelf();
        done();
      }

      let monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: onAbilityCreateCallback,
      };
      await abilityDelegator.addAbilityMonitor(monitor);
      setTimeout(() => {
        abilityDelegator.startAbility(want);
      }, 2000);
    });

    /**
     * @tc.number ACTS_ADD_ABILITY_MONITOR_PROMISE_0300
     * @tc.name actsAddAbilityMonitorPromise0300
     * @tc.desc Pass in a monitor that has already been added.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 2
     */
    it("ACTS_ADD_ABILITY_MONITOR_PROMISE_0300", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );

      function onAbilityCreateCallback(data) {
        expect(true).assertTrue();
        data.context.terminateSelf();
        abilityDelegator.printSync(
          "ACTS_ADD_ABILITY_MONITOR_PROMISE_0300 pass"
        );
        done();
      }

      let monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: onAbilityCreateCallback,
      };
      await abilityDelegator.addAbilityMonitor(monitor);
      await abilityDelegator.addAbilityMonitor(monitor);
      await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0100
     * @tc.name actsRemoveAbilityMonitorCallback0100
     * @tc.desc pass in a null monitor.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 3
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0100", 0, async function (done) {
      let monitor = null;
      try {
        abilityDelegator.removeAbilityMonitor(monitor, (err: any) => {
          expect().assertFail();
          abilityDelegator.printSync(
            "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0100 error"
          );
          done();
        });
      } catch (e) {
        abilityDelegator.printSync(
          "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0100 error code:" + e.code
        );
        abilityDelegator.printSync(
          "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0100 message:" + e.message
        );
        expect(e.code).assertEqual(401);
        expect(e.message).assertEqual("Incorrect parameters.");
        expect(true).assertTrue();
        abilityDelegator.printSync(
          "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0100 pass"
        );
        done();
      }
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0200
     * @tc.name actsRemoveAbilityMonitorCallback0200
     * @tc.desc Pass in an Add monitor that has already been added.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0200", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
      let result = 0;

      function onAbilityCreateCallback() {
        result = 1;
      }

      let monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: onAbilityCreateCallback,
      };
      abilityDelegator.addAbilityMonitor(monitor);
      abilityDelegator.removeAbilityMonitor(monitor, (err: any) => { });
      setTimeout(() => {
        abilityDelegator.startAbility(want);
      }, 2000);
      setTimeout(() => {
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0200 pass"
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0300
     * @tc.name actsRemoveAbilityMonitorCallback0300
     * @tc.desc Pass in an unadded monitor to monitor
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0300", 0, async function (done) {
      let result = 0;

      function onAbilityCreateCallback() {
        abilityDelegator.printSync(
          "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0300 onAbilityCreateCallback"
        );
        result = 1;
      }

      let monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: onAbilityCreateCallback,
      };
      abilityDelegator.removeAbilityMonitor(monitor, (err: any) => {
        abilityDelegator.printSync(
          "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0300 removeAbilityMonitor"
        );
      });

      setTimeout(() => {
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0300 pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0400
     * @tc.name actsRemoveAbilityMonitorCallback0400
     * @tc.desc remove a monitor that has already been wait.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0400", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
      let result = 0;

      function onAbilityCreateCallback() {
        result = 1;
      }

      let monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: onAbilityCreateCallback,
      };
      abilityDelegator.waitAbilityMonitor(monitor);
      abilityDelegator.removeAbilityMonitor(monitor, (err: any) => { });
      await abilityDelegator.startAbility(want);
      setTimeout(() => {
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0400 pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0500
     * @tc.name actsRemoveAbilityMonitorCallback0500
     * @tc.desc Pass in an Add monitor that has already been added.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0500", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
      let result = 0;

      function onAbilityCreateCallback() {
        result = 1;
      }

      let monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: onAbilityCreateCallback,
      };
      abilityDelegator.addAbilityMonitor(monitor);
      abilityDelegator.addAbilityMonitor(monitor);
      abilityDelegator.removeAbilityMonitor(monitor, (err: any) => { });
      await abilityDelegator.startAbility(want);
      setTimeout(() => {
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          "ACTS_REMOVE_ABILITY_MONITOR_CALLBACK_0500 pass"
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0100
     * @tc.name actsRemoveAbilityMonitorPromise0100
     * @tc.desc pass in a null monitor.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 3
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0100", 0, async function (done) {
      let monitor = null;
      try {
        let result = await abilityDelegator.removeAbilityMonitor(monitor);
        abilityDelegator.printSync(
          "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0100 pass+result：" + result
        );
        expect().assertFail();
        abilityDelegator.printSync(
          "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0100 error"
        );
        done();
      } catch (e) {
        abilityDelegator.printSync(
          "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0100 code：" + e.code
        );
        abilityDelegator.printSync(
          "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0100 message:" + e.message
        );
        expect(e.code).assertEqual(401);
        expect(e.message).assertEqual("Incorrect parameters.");
        expect(true).assertTrue();
        abilityDelegator.printSync(
          "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0100 pass"
        );
        done();
      }
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0200
     * @tc.name actsRemoveAbilityMonitorPromise0200
     * @tc.desc Pass in an Add monitor that has already been added.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0200", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
      let result = 0;

      function onAbilityCreateCallback(err) {
        abilityDelegator.printSync(
          "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0200 onAbilityCreateCallback "
        );
        result = 1;
      }

      let monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: onAbilityCreateCallback,
      };
      await abilityDelegator.addAbilityMonitor(monitor);
      abilityDelegator
        .removeAbilityMonitor(monitor)
        .then(() => {
          abilityDelegator.printSync(
            "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0200 callback"
          );
        })
        .catch((error) => {
          abilityDelegator.printSync(
            "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0200 error:" + error
          );
        });
      await abilityDelegator.startAbility(want);
      setTimeout(() => {
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0200 pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0300
     * @tc.name actsRemoveAbilityMonitorPromise0300
     * @tc.desc Pass in an unadded monitor to monitor
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0300", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
      let result = 0;

      function onAbilityCreateCallback() {
        result = 1;
        abilityDelegator.printSync(
          "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0300 onAbilityCreateCallback"
        );
      }

      let monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: onAbilityCreateCallback,
      };
      abilityDelegator
        .removeAbilityMonitor(monitor)
        .then(() => {
          abilityDelegator.printSync(
            "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0300"
          );
          expect(true).assertTrue();
          abilityDelegator.printSync(
            "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0300"
          );
          done();
        })
        .catch((error) => {
          abilityDelegator.printSync(
            "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0300 error:" + error
          );
          expect().assertFail();
          done();
        });

      setTimeout(() => {
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0300 pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0400
     * @tc.name actsRemoveAbilityMonitorPromise0400
     * @tc.desc remove a monitor that has already been wait.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0400", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
      let result = 0;

      function onAbilityCreateCallback() {
        result = 1;
      }

      let monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: onAbilityCreateCallback,
      };
      abilityDelegator.waitAbilityMonitor(monitor);
      abilityDelegator
        .removeAbilityMonitor(monitor)
        .then(() => {
          abilityDelegator.printSync(
            "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0400"
          );
        })
        .catch((error) => {
          abilityDelegator.printSync(
            "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0400 error:" + error
          );
          expect().assertFail();
          done();
        });
      await abilityDelegator.startAbility(want);
      setTimeout(() => {
        expect(result).assertEqual(0);
        abilityDelegator.printSync(
          "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0400 pass "
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0500
     * @tc.name actsRemoveAbilityMonitorPromise0500
     * @tc.desc Pass in an unadded monitor to monitor whether the monitor container size increases.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 2
     */
    it("ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0500", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
      let result = 1;

      function onAbilityCreateCallback() {
        abilityDelegator.printSync(
          "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0500 onAbilityCreateCallback"
        );
        result = 0;
      }

      let monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: onAbilityCreateCallback,
      };
      await abilityDelegator.addAbilityMonitor(monitor);
      await abilityDelegator.addAbilityMonitor(monitor);
      abilityDelegator
        .removeAbilityMonitor(monitor)
        .then(() => {
          abilityDelegator.printSync(
            "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0500 callback"
          );
        })
        .catch((error) => {
          abilityDelegator.printSync(
            "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0500 error:" + error
          );
          expect().assertFail();
          done();
        });
      await abilityDelegator.startAbility(want);
      setTimeout(() => {
        expect(result).assertEqual(1);
        abilityDelegator.printSync(
          "ACTS_REMOVE_ABILITY_MONITOR_PROMISE_0500 pass"
        );
        done();
      }, 3000);
    });

    /**
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0100
     * @tc.name actsWaitAbilityMonitorCallback0100
     * @tc.desc pass in a null monitor.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 3
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0100", 0, async function (done) {
      let monitor = null;
      try {
        abilityDelegator.waitAbilityMonitor(monitor, (err: any) => {
          expect().assertFail();
          abilityDelegator.printSync(
            "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0100 callback "
          );
          done();
        });
      } catch (e) {
        abilityDelegator.printSync(
          "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0100 code：" + e.code
        );
        abilityDelegator.printSync(
          "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0100 message:" + e.message
        );
        expect(e.code).assertEqual(401);
        expect(e.message).assertEqual("Incorrect parameters.");
        abilityDelegator.printSync(
          "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0100 monitor pass"
        );
        done();
      }
    });

    /**
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0300
     * @tc.name actsWaitAbilityMonitorCallback0300
     * @tc.desc Pass in an added monitor and start the monitor.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 2
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0300", 0, async function (done) {
      function onAbilityCreateCallback(data) {
        expect(data.context.abilityInfo.name).assertEqual("Main2Ability");
        abilityDelegator.printSync(
          "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0300 pass"
        );
        data.context.terminateSelf();
        done();
      }

      let want = {
        bundleName: "com.example.delegatortest",
        abilityName: "Main2Ability",
        moduleName: "entry",
      };
      let monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: onAbilityCreateCallback,
      };
      abilityDelegator.waitAbilityMonitor(monitor, (err: any, data: any) => { });
      await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0400
     * @tc.name actsWaitAbilityMonitorCallback0400
     * @tc.desc Pass in an empty monitor, timeout=6000.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 3
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0400", 0, async function (done) {
      let monitor = null;
      try {
        abilityDelegator.waitAbilityMonitor(monitor, 6000, (err: any) => {
          expect().assertFail();
          abilityDelegator.printSync(
            "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0400 error"
          );
          done();
        });
      } catch (e) {
        abilityDelegator.printSync(
          "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0400 code:" + e.code
        );
        abilityDelegator.printSync(
          "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0400 message:" + e.message
        );
        expect(e.message).assertEqual("Incorrect parameters.");
        expect(e.code).assertEqual(401);
        expect(true).assertTrue();
        abilityDelegator.printSync(
          "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0400 pass "
        );
        done();
      }
    });

    /**
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0500
     * @tc.name actsWaitAbilityMonitorCallback0500
     * @tc.desc Pass in a monitor that has been added, timeout=10000.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 2
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0500", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );

      function onAbilityCreateCallback(data) {
        abilityDelegator.printSync(
          "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0500 error"
        );
        expect(true).assertTrue();
        done();
      }

      let monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: onAbilityCreateCallback,
      };
      abilityDelegator.waitAbilityMonitor(
        monitor,
        6000,
        (err: any, data: any) => {
          abilityDelegator.printSync(
            "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0500 : " + err.code
          );
          abilityDelegator.printSync(
            "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0500 : " + err.message
          );
          expect(err.code).assertEqual(16000100);
          expect(true).assertTrue();
          abilityDelegator.printSync(
            "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0500 pass"
          );
          done();
        }
      );
    });

    /**
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0600
     * @tc.name actsWaitAbilityMonitorCallback0600
     * @tc.desc Pass in an already added monitor and start this monitor, timeout<5.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 2
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0600", 0, async function (done) {
      function onAbilityCreateCallback(data) {
        expect(true).assertTrue();
        abilityDelegator.printSync(
          "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0600 pass"
        );
        data.context.terminateSelf();
        done();
      }

      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
      let monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: onAbilityCreateCallback,
      };
      abilityDelegator.waitAbilityMonitor(
        monitor,
        6000,
        (err: any, data: any) => { }
      );
      await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0700
     * @tc.name actsWaitAbilityMonitorCallback0700
     * @tc.desc Pass in an already added monitor and start this monitor, timeout=0.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 2
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0700", 0, async function (done) {
      function onAbilityCreateCallback(data) {
        expect(true).assertTrue();
        abilityDelegator.printSync(
          "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0700 pass"
        );
        data.context.terminateSelf();
        done();
      }

      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
      let monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: onAbilityCreateCallback,
      };
      abilityDelegator.waitAbilityMonitor(
        monitor,
        0,
        (err: any, data: any) => { }
      );
      await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0800
     * @tc.name actsWaitAbilityMonitorCallback0800
     * @tc.desc Pass in an already added monitor and start this monitor, timeout<5.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 2
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0800", 0, async function (done) {
      function onAbilityCreateCallback(data) {
        expect(true).assertTrue();
        abilityDelegator.printSync(
          "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0800 pass"
        );
        data.context.terminateSelf();
        done();
      }

      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
      let monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: onAbilityCreateCallback,
      };
      abilityDelegator.waitAbilityMonitor(
        monitor,
        4000,
        (err: any, data: any) => { }
      );
      await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0900
     * @tc.name actsWaitAbilityMonitorCallback0900
     * @tc.desc Pass in an already added monitor and start this monitor, timeout<0.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 2
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0900", 0, async function (done) {
      function onAbilityCreateCallback(data) {
        expect(true).assertTrue();
        abilityDelegator.printSync(
          "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_0900 pass"
        );
        data.context.terminateSelf();
        done();
      }

      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
      let monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: onAbilityCreateCallback,
      };
      abilityDelegator.waitAbilityMonitor(
        monitor,
        -1,
        (err: any, data: any) => { }
      );
      await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_CALLBACK_1000
     * @tc.name actsWaitAbilityMonitorCallback1000
     * @tc.desc Pass in an added monitor and start this monitor to get the current bundleName.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 2
     */
    it("ACTS_WAIT_ABILITY_MONITOR_CALLBACK_1000", 0, async function (done) {
      function onAbilityCreateCallback(data) {
        abilityDelegator.printSync(
          "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_1000 onAbilityCreateCallback"
        );
      }
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );
      let monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: onAbilityCreateCallback,
      };
      abilityDelegator.waitAbilityMonitor(monitor);
      abilityDelegator.startAbility(want);
      setTimeout(() => {
        abilityDelegator.getCurrentTopAbility((err: any, data: any) => {
          try {
            abilityDelegator.printSync(
              "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_1000 getCurrentTopAbility ability: " +
              data.context.abilityInfo.name
            );
            expect(true).assertTrue();
            abilityDelegator.printSync(
              "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_1000 pass"
            );
            done();
          } catch (e) {
            abilityDelegator.printSync(
              "ACTS_WAIT_ABILITY_MONITOR_CALLBACK_1000 error"
            );
            expect(true).assertTrue();
            done();
          }
        });
      }, 2000);
    });

    /**
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_PROMISE_0100
     * @tc.name actsWaitAbilityMonitorPromise0100
     * @tc.desc pass in a null monitor.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 3
     */
    it("ACTS_WAIT_ABILITY_MONITOR_PROMISE_0100", 0, async function (done) {
      let monitor = null;
      try {
        let result = await abilityDelegator.waitAbilityMonitor(monitor);
        expect(result).assertEqual(undefined);
        abilityDelegator.printSync(
          "ACTS_WAIT_ABILITY_MONITOR_PROMISE_0100  error"
        );
        done();
      } catch (e) {
        abilityDelegator.printSync(
          "ACTS_WAIT_ABILITY_MONITOR_PROMISE_0100  code:" + e.code
        );
        abilityDelegator.printSync(
          "ACTS_WAIT_ABILITY_MONITOR_PROMISE_0100  message:" + e.message
        );
        expect(e.code).assertEqual(401);
        expect(e.message).assertEqual("Incorrect parameters.");
        expect(true).assertTrue();
        abilityDelegator.printSync(
          "ACTS_WAIT_ABILITY_MONITOR_PROMISE_0100  pass"
        );
        done();
      }
    });

    /**
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_PROMISE_0200
     * @tc.name actsWaitAbilityMonitorPromise0200
     * @tc.desc Pass in a Monitor that has already been added.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 2
     */
    it("ACTS_WAIT_ABILITY_MONITOR_PROMISE_0200", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );

      function onAbilityCreateCallback(data) {
        expect(true).assertTrue();
        abilityDelegator.printSync(
          "ACTS_WAIT_ABILITY_MONITOR_PROMISE_0200 onAbilityCreateCallback"
        );
        data.context.terminateSelf();
        done();
      }

      let monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: onAbilityCreateCallback,
      };
      abilityDelegator
        .waitAbilityMonitor(monitor)
        .then(() => {
          expect(true).assertTrue();
          abilityDelegator.printSync(
            "ACTS_WAIT_ABILITY_MONITOR_PROMISE_0200 pass"
          );
        })
        .catch((error) => {
          abilityDelegator.printSync(
            "ACTS_WAIT_ABILITY_MONITOR_PROMISE_0200 error:" + error
          );
          expect.assertFail();
          done();
        });
        await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_PROMISE_0300
     * @tc.name actsWaitAbilityMonitorPromise0300
     * @tc.desc Pass in an already added Monitor and start the Monitor.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 2
     */
    it("ACTS_WAIT_ABILITY_MONITOR_PROMISE_0300", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );

      function onAbilityCreateCallback(data) {
        expect(true).assertTrue();
        data.context.terminateSelf();
        abilityDelegator.printSync("ACTS_WAITABILITYMONTOR_PROMISE_0300 pass");
        done();
      }

      let monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: onAbilityCreateCallback,
      };
      await abilityDelegator.addAbilityMonitor(monitor);
      abilityDelegator
        .waitAbilityMonitor(monitor)
        .then(() => {
          abilityDelegator.printSync(
            "actsWaitAbilityMonitorPromise0300 waitAbilityMonitor"
          );
        })
        .catch((error) => {
          abilityDelegator.printSync(
            "actsWaitAbilityMonitorPromise0300 error:" + error
          );
          expect.assertFail();
          done();
        });
      await abilityDelegator.startAbility(want);
    });

    /**
     * @tc.number ACTS_WAIT_ABILITY_MONITOR_PROMISE_0400
     * @tc.name actsWaitAbilityMonitorPromise0400
     * @tc.desc Pass in an already added StageMonitor and start this Monitor, passing in a timeout=0.
     * @tc.size      : MediumTest
     * @tc.type      : Method
     * @tc.level     : Level 2
     */
    it("ACTS_WAIT_ABILITY_MONITOR_PROMISE_0400", 0, async function (done) {
      const want = factoryWant(
        "com.example.delegatortest",
        "Main2Ability",
        "entry"
      );

      function onAbilityCreateCallback(data) {
        expect(true).assertTrue();
        abilityDelegator.printSync("ACTS_WAITABILITYMONTOR_PROMISE_0400 pass");
        data.context.terminateSelf();
        done();
      }

      let monitor = {
        abilityName: "Main2Ability",
        onAbilityCreate: onAbilityCreateCallback,
      };
      await abilityDelegator.addAbilityMonitor(monitor);
      abilityDelegator
        .waitAbilityMonitor(monitor, 0)
        .then(() => {
          abilityDelegator.printSync(
            "ACTS_WAIT_ABILITY_MONITOR_PROMISE_0400 waitAbilityMonitor"
          );
        })
        .catch((error) => {
          abilityDelegator.printSync(
            "ACTS_WAIT_ABILITY_MONITOR_PROMISE_0400 error:" + error
          );
          expect.assertFail();
          done();
        });
      await abilityDelegator.startAbility(want);
    });
  });
}
