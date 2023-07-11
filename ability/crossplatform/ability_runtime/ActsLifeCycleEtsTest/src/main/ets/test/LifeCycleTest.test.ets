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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";

const moduleName = "entry_test";
const otherBundle = "com.example.commontestabilityapp";
const otherModuleName = "feature";

export default function lifecycleTest() {
  describe("LifeCycleTest", function () {
    beforeEach(async function (done) {
      console.info("LifeCycleTest before each called");
      await sleep(1000);
      done();
    });

    afterEach(async function (done) {
      console.info("LifeCycleTest after each called");
      if ("Singlehap_LifeCycleTest_0200" === TAG || "Singlehap_LifeCycleTest_0300" === TAG
      || "Singlehap_LifeCycleTest_0500" === TAG || "Singlehap_LifeCycleTest_0600" === TAG
      || "Singlehap_LifeCycleTest_0800" === TAG || "Singlehap_LifeCycleTest_0900" === TAG) {
        var para = {
          resultCode: 2,
          want: {
            abilityName: "MainAbility1",
            bundleName: "com.test.lifecycle_crossplatform_xts",
            moduleName: moduleName,
          },
        };
        console.log("LifeCycleTest terminateSelfwithresult para: " + JSON.stringify(para));
        // await globalThis.ability1context.terminateSelfWithResult(para)
        //   .then((data) => {
        //     console.log("LifeCycleTest terminateSelfwithresult successful data: " + JSON.stringify(data));
        //   }).catch((error) => {
        //     console.log("LifeCycleTest terminateSelfwithresult error: " + JSON.stringify(error));
        //   });
        await globalThis.ability1context
          .terminateSelf()
          .then((data) => {
            console.log("LifeCycleTest terminateSelfwithresult successful data: " + JSON.stringify(data));
          })
          .catch((error) => {
            console.log("LifeCycleTest terminateSelfwithresult error: " + JSON.stringify(error));
          });
      } else if ("Singlehap_LifeCycleTest_2000" === TAG) {
        var para1 = {
          resultCode: 2,
          want: {
            abilityName: "MainAbility12",
            bundleName: "com.test.lifecycle_crossplatform_xts",
            moduleName: moduleName,
          },
        };
        console.log("LifeCycleTest terminateSelfwithresult para: " + JSON.stringify(para1));
        await globalThis.ability12
          .terminateSelf()
          .then((data) => {
            console.log("LifeCycleTest terminateSelfwithresult successful data: " + JSON.stringify(data));
          })
          .catch((error) => {
            console.log("LifeCycleTest terminateSelfwithresult error: " + JSON.stringify(error));
          });
      }
      done();
    });

    var TAG = "";
    var listKeyTemp;
    var tempCallbackId;

    function sleep(time) {
      return new Promise((resolve) => setTimeout(resolve, time));
    }

    /*
     * @tc.number  Singlehap_LifeCycleTest_0100
     * @tc.name    Register in abilitystage,listen to the lifecycle of abilityA,deregister after listening
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0100", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_0100 START-------------");
      TAG = "Singlehap_LifeCycleTest_0100";
      var code;
      var str = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility2",
        moduleName: moduleName,
      };
      globalThis.abilityContext
        .startAbility(str)
        .then((data) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
      setTimeout(function () {
        console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list));
        console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid));
        tempCallbackId = globalThis.callbackid;
        console.log(TAG + " registerAbilityLifecycleCallback tempCallbackId : " + JSON.stringify(tempCallbackId));
        var strtemp = "";
        var listtemp = [];
        for (var i = 0; i < globalThis.list.length; i++) {
          strtemp = globalThis.list[i].substring(0, 12);
          if (strtemp === "MainAbility2") {
            listtemp.push(globalThis.list[i]);
          }
        }
        console.log(TAG + " listtemp is :" + JSON.stringify(listtemp));
        let exlist = listtemp;
        // globalThis.applicationContext
        //   .unregisterAbilityLifecycleCallback(tempCallbackId, (error, data) => {
        //     console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
        //     ",data: " + JSON.stringify(data));
        //     code = error.code;
        //   });
        globalThis.applicationContext.off("abilityLifecycle", tempCallbackId, (error) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + error);
          code = error ? error.code : 0;
        });
        setTimeout(function () {
          console.log("start expect");
          console.log(JSON.stringify(exlist));
          expect(exlist[0]).assertEqual("MainAbility2 onAbilityCreate");
          expect(exlist[1]).assertEqual("MainAbility2 onWindowStageCreate");
          expect(exlist[2]).assertEqual("MainAbility2 onAbilityForeground");
          expect(exlist[3]).assertEqual("MainAbility2 onAbilityBackground");
          expect(exlist[4]).assertEqual("MainAbility2 onWindowStageDestroy");
          expect(exlist[5]).assertEqual("MainAbility2 onAbilityDestroy");
          expect(code).assertEqual(0);
          console.log("------------Singlehap_LifeCycleTest_0100 END-------------");
          done();
        }, 1000);
      }, 3000);
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_0200
     * @tc.name    Register in abilityA,listen to the lifecycle of abilityB,deregister after listening
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0200", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_0200 START-------------");
      TAG = "Singlehap_LifeCycleTest_0200";
      var code;
      var str = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility1",
        moduleName: moduleName,
      };
      globalThis.abilityContext
        .startAbility(str)
        .then((data) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
      setTimeout(function () {
        var str1 = {
          bundleName: "com.test.lifecycle_crossplatform_xts",
          abilityName: "MainAbility2",
          moduleName: moduleName,
        };
        globalThis.abilityContext
          .startAbility(str1)
          .then((data) => {
            console.info(TAG + " start successful. Data: " + data);
          })
          .catch((error) => {
            console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
          });
      }, 500);
      setTimeout(function () {
        console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list1));
        console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid1));
        var strtemp = "";
        var listtemp = [];
        var listtemp1 = [];
        for (var i = 0; i < globalThis.list1.length; i++) {
          strtemp = globalThis.list1[i].substring(0, 12);
          if (strtemp === "MainAbility1") {
            listtemp.push(globalThis.list1[i]);
          } else if (strtemp === "MainAbility2") {
            listtemp1.push(globalThis.list1[i]);
          }
        }
        console.log(TAG + " listtemp is :" + JSON.stringify(listtemp));
        console.log(TAG + " listtemp1 is :" + JSON.stringify(listtemp1));
        let exlist = listtemp;
        let exlist1 = listtemp1;
        // globalThis.applicationContext1
        //   .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error, data) => {
        //     console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
        //     ",data: " + JSON.stringify(data));
        //     code = error.code;
        //   })
        globalThis.applicationContext1.off("abilityLifecycle", globalThis.callbackid1, (error) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + error);
          code = error ? error.code : 0;
        });
        setTimeout(function () {
          expect(exlist[0]).assertEqual("MainAbility1 onWindowStageCreate");
          expect(exlist[1]).assertEqual("MainAbility1 onAbilityForeground");
          expect(exlist[2]).assertEqual("MainAbility1 onAbilityBackground");
          expect(exlist[3]).assertEqual("MainAbility1 onAbilityForeground");
          expect(exlist1[0]).assertEqual("MainAbility2 onAbilityCreate");
          expect(exlist1[1]).assertEqual("MainAbility2 onWindowStageCreate");
          expect(exlist1[2]).assertEqual("MainAbility2 onAbilityForeground");
          expect(exlist1[3]).assertEqual("MainAbility2 onAbilityBackground");
          expect(exlist1[4]).assertEqual("MainAbility2 onWindowStageDestroy");
          expect(exlist1[5]).assertEqual("MainAbility2 onAbilityDestroy");
          expect(code).assertEqual(0);
          console.log("------------Singlehap_LifeCycleTest_0200 END-------------");
          done();
        }, 1000);
      }, 4000);
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_0300
     * @tc.name    Register in abilityA,listening the lifecycle of abilityB,deregister,repeat the unregister
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0300", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_0300 START-------------");
      TAG = "Singlehap_LifeCycleTest_0300";
      var code;
      var str = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility1",
        moduleName: moduleName,
      };
      globalThis.abilityContext
        .startAbility(str)
        .then((data) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
      setTimeout(function () {
        var str1 = {
          bundleName: "com.test.lifecycle_crossplatform_xts",
          abilityName: "MainAbility2",
          moduleName: moduleName,
        };
        globalThis.abilityContext
          .startAbility(str1)
          .then((data) => {
            console.info(TAG + " start successful. Data: " + data);
          })
          .catch((error) => {
            console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
          });
      }, 500);
      setTimeout(function () {
        console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list1));
        console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid1));
        var strtemp = "";
        var listtemp = [];
        var listtemp1 = [];
        for (var i = 0; i < globalThis.list1.length; i++) {
          strtemp = globalThis.list1[i].substring(0, 12);
          if (strtemp === "MainAbility1") {
            listtemp.push(globalThis.list1[i]);
          } else if (strtemp === "MainAbility2") {
            listtemp1.push(globalThis.list1[i]);
          }
        }
        console.log(TAG + " listtemp is :" + JSON.stringify(listtemp));
        console.log(TAG + " listtemp1 is :" + JSON.stringify(listtemp1));
        let exlist = listtemp;
        let exlist1 = listtemp1;
        // globalThis.applicationContext1
        //   .unregisterAbilityLifecycleCallback(globalThis.callbackid1)
        //   .then((data) => {
        //     console.info(TAG + ' unregisterAbilityLifecycleCallback successful. Data: ' + data);
        //   })
        //   .catch((error) => {
        //     console.error(TAG + ' unregisterAbilityLifecycleCallback failed. Cause: ' + JSON.stringify(error));
        //   })

        globalThis.applicationContext1.off("abilityLifecycle", globalThis.callbackid1, (error) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: ");
        });
        setTimeout(function () {
          console.log(TAG + " secondunregister callbackid : " + JSON.stringify(globalThis.callbackid1));
          // globalThis.applicationContext1
          //   .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error, data) => {
          //     console.log(TAG + ": unregisterAbilityLifecycleCallback_1 success, err: " + JSON.stringify(error) +
          //     ",data: " + JSON.stringify(data));
          //     code = error.code;
          //   })

          globalThis.applicationContext1.off("abilityLifecycle", globalThis.callbackid1, (error) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
            code = error ? error.code : 0;
          });
        }, 500);
        setTimeout(function () {
          expect(exlist[0]).assertEqual("MainAbility1 onWindowStageCreate");
          expect(exlist[1]).assertEqual("MainAbility1 onAbilityForeground");
          expect(exlist[2]).assertEqual("MainAbility1 onAbilityBackground");
          expect(exlist[3]).assertEqual("MainAbility1 onAbilityForeground");
          expect(exlist1[0]).assertEqual("MainAbility2 onAbilityCreate");
          expect(exlist1[1]).assertEqual("MainAbility2 onWindowStageCreate");
          expect(exlist1[2]).assertEqual("MainAbility2 onAbilityForeground");
          expect(exlist1[3]).assertEqual("MainAbility2 onAbilityBackground");
          expect(exlist1[4]).assertEqual("MainAbility2 onWindowStageDestroy");
          expect(exlist1[5]).assertEqual("MainAbility2 onAbilityDestroy");
          expect(code).assertEqual(401);
          console.log("------------Singlehap_LifeCycleTest_0300 END-------------");
          done();
        }, 2000);
      }, 4000);
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_0400
     * @tc.name    Register in abilityA,listening the lifecycle of abilityB,terminate abilityA,unregister
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0400", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_0400 START-------------");
      TAG = "Singlehap_LifeCycleTest_0400";
      var code;
      var str = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility3",
        moduleName: moduleName,
      };
      globalThis.abilityContext
        .startAbility(str)
        .then((data) => {
          console.info(TAG + " start3 successful. Data: " + data);
        })
        .catch((error) => {
          console.error(TAG + " start3 failed. Cause: " + JSON.stringify(error));
        });
      setTimeout(function () {
        var str1 = {
          bundleName: "com.test.lifecycle_crossplatform_xts",
          abilityName: "MainAbility2",
          moduleName: moduleName,
        };
        globalThis.abilityContext
          .startAbility(str1)
          .then((data) => {
            console.info(TAG + " start2 successful. Data: " + data);
          })
          .catch((error) => {
            console.error(TAG + " start2 failed. Cause: " + JSON.stringify(error));
          });
      }, 500);
      setTimeout(function () {
        console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list3));
        console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid3));
        var strtemp = "";
        var listtemp = [];
        var listtemp1 = [];
        for (var i = 0; i < globalThis.list3.length; i++) {
          strtemp = globalThis.list3[i].substring(0, 12);
          if (strtemp === "MainAbility3") {
            listtemp.push(globalThis.list3[i]);
          } else if (strtemp === "MainAbility2") {
            listtemp1.push(globalThis.list3[i]);
          }
        }
        console.log(TAG + " listtemp is :" + JSON.stringify(listtemp));
        console.log(TAG + " listtemp1 is :" + JSON.stringify(listtemp1));
        let exlist = listtemp;
        let exlist1 = listtemp1;
        var para = {
          resultCode: 1,
          want: {
            abilityName: "MainAbility3",
            bundleName: "com.test.lifecycle_crossplatform_xts",
            moduleName: moduleName,
          },
        };
        console.log(TAG + " terminateSelfwithresult para: " + JSON.stringify(para));
        // globalThis.ability3.terminateSelfWithResult(para)
        //   .then((data) => {
        //     console.log(TAG + " terminateSelfwithresult successful data: " + JSON.stringify(data));
        //   }).catch((error) => {
        //   console.log(TAG + " terminateSelfwithresult error: " + JSON.stringify(error));
        // });
        globalThis.ability3
          .terminateSelf()
          .then((data) => {
            console.log(TAG + " terminateSelfwithresult successful data: " + JSON.stringify(data));
          })
          .catch((error) => {
            console.log(TAG + " terminateSelfwithresult error: " + JSON.stringify(error));
          });
        setTimeout(function () {
          // globalThis.applicationContext3
          //   .unregisterAbilityLifecycleCallback(globalThis.callbackid3, (error, data) => {
          //     console.log(TAG + ": unregisterAbilityLifecycleCallback3 success, err: " + JSON.stringify(error) +
          //     ",data: " + JSON.stringify(data));
          //     code = error.code;
          //   })
          globalThis.applicationContext3.off("abilityLifecycle", globalThis.callbackid3, (error) => {
            console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
            code = error ? error.code : 0;
          });
        }, 500);
        setTimeout(function () {
          expect(exlist[0]).assertEqual("MainAbility3 onWindowStageCreate");
          expect(exlist[1]).assertEqual("MainAbility3 onAbilityForeground");
          expect(exlist[2]).assertEqual("MainAbility3 onAbilityBackground");
          expect(exlist[3]).assertEqual("MainAbility3 onAbilityForeground");
          expect(exlist1[0]).assertEqual("MainAbility2 onAbilityCreate");
          expect(exlist1[1]).assertEqual("MainAbility2 onWindowStageCreate");
          expect(exlist1[2]).assertEqual("MainAbility2 onAbilityForeground");
          expect(exlist1[3]).assertEqual("MainAbility2 onAbilityBackground");
          expect(exlist1[4]).assertEqual("MainAbility2 onWindowStageDestroy");
          expect(exlist1[5]).assertEqual("MainAbility2 onAbilityDestroy");
          expect(code).assertEqual(0);
          console.log("------------Singlehap_LifeCycleTest_0400 END-------------");
          done();
        }, 1000);
      }, 4000);
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_0500
     * @tc.name    Register in abilityA and abilityB,unregister MainabilityB,then Register in ManinabilityC
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0500", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_0500 START-------------");
      TAG = "Singlehap_LifeCycleTest_0500";
      var str = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility1",
        moduleName: moduleName,
      };
      globalThis.abilityContext
        .startAbility(str)
        .then((data) => {
          console.info(TAG + " start1 successful. Data: " + data);
        })
        .catch((error) => {
          console.error(TAG + " start1 failed. Cause: " + JSON.stringify(error));
        });
      setTimeout(function () {
        var str1 = {
          bundleName: "com.test.lifecycle_crossplatform_xts",
          abilityName: "MainAbility3",
          moduleName: moduleName,
        };
        globalThis.abilityContext
          .startAbility(str1)
          .then((data) => {
            console.info(TAG + " start3 successful. Data: " + data);
          })
          .catch((error) => {
            console.error(TAG + " start3 failed. Cause: " + JSON.stringify(error));
          });
      }, 500);
      setTimeout(function () {
        console.log(TAG + " start after callbackid3 : " + JSON.stringify(globalThis.callbackid3));
        // globalThis.applicationContext3
        //   .unregisterAbilityLifecycleCallback(globalThis.callbackid3)
        //   .then((data) => {
        //     console.info(TAG + ' unregisterAbilityLifecycleCallback3 successful. Data: ' + data);
        //   })
        //   .catch((error) => {
        //     console.error(TAG + ' unregisterAbilityLifecycleCallback3 failed. Cause: ' + JSON.stringify(error));
        //   });
        globalThis.applicationContext3.off("abilityLifecycle", globalThis.callbackid3, (error) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
        });
        var str2 = {
          bundleName: "com.test.lifecycle_crossplatform_xts",
          abilityName: "MainAbility4",
          moduleName: moduleName,
        };
        globalThis.abilityContext
          .startAbility(str2)
          .then((data) => {
            console.info(TAG + " start4 successful. Data: " + data);
          })
          .catch((error) => {
            console.error(TAG + " start4 failed. Cause: " + JSON.stringify(error));
          });
      }, 2800);
      setTimeout(function () {
        console.log(TAG + " listKey1 : " + JSON.stringify(globalThis.list1));
        console.log(TAG + " callbackid1 : " + JSON.stringify(globalThis.callbackid1));
        console.log(TAG + " listKey3 : " + JSON.stringify(globalThis.list3));
        console.log(TAG + " callbackid3 : " + JSON.stringify(globalThis.callbackid3));
        let id3 = globalThis.callbackid3;
        console.log(TAG + " listKey4 : " + JSON.stringify(globalThis.list4));
        console.log(TAG + " callbackid4 : " + JSON.stringify(globalThis.callbackid4));
        let id4 = globalThis.callbackid4;
        expect(id3 + 1).assertEqual(id4);
        // globalThis.applicationContext4
        //   .unregisterAbilityLifecycleCallback(globalThis.callbackid4, (error, data) => {
        //     console.log(TAG + ": unregisterAbilityLifecycleCallback4 success, err: " + JSON.stringify(error) +
        //     ",data: " + JSON.stringify(data));
        //   })
        globalThis.applicationContext4.off("abilityLifecycle", globalThis.callbackid4, (error) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
        });
        // globalThis.applicationContext1
        //   .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error, data) => {
        //     console.log(TAG + ": unregisterAbilityLifecycleCallback1 success, err: " + JSON.stringify(error) +
        //     ",data: " + JSON.stringify(data));
        //     console.log("------------Singlehap_LifeCycleTest_0500 END-------------");
        //     done();
        //   })
        globalThis.applicationContext1.off("abilityLifecycle", globalThis.callbackid1, (error) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
          done();
        });
      }, 5000);
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_0600
     * @tc.name    Register in abilityA,start abilityB、abilityC,terminate abilityB 、abilityC
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0600", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_0600 START-------------");
      TAG = "Singlehap_LifeCycleTest_0600";
      var str = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility1",
        moduleName: moduleName,
      };
      globalThis.abilityContext
        .startAbility(str)
        .then((data) => {
          console.info(TAG + " start1 successful. Data: " + data);
        })
        .catch((error) => {
          console.error(TAG + " start1 failed. Cause: " + JSON.stringify(error));
        });
      setTimeout(function () {
        var str1 = {
          bundleName: "com.test.lifecycle_crossplatform_xts",
          abilityName: "MainAbility5",
          moduleName: moduleName,
        };
        globalThis.abilityContext
          .startAbility(str1)
          .then((data) => {
            console.info(TAG + " start5 successful. Data: " + data);
          })
          .catch((error) => {
            console.error(TAG + " start5 failed. Cause: " + JSON.stringify(error));
          });
      }, 500);
      setTimeout(function () {
        var str2 = {
          bundleName: "com.test.lifecycle_crossplatform_xts",
          abilityName: "MainAbility2",
          moduleName: moduleName,
        };
        globalThis.abilityContext
          .startAbility(str2)
          .then((data) => {
            console.info(TAG + " start2 successful. Data: " + data);
          })
          .catch((error) => {
            console.error(TAG + " start2 failed. Cause: " + JSON.stringify(error));
          });
      }, 1100);
      setTimeout(function () {
        console.log(TAG + " listKey1 : " + JSON.stringify(globalThis.list1));
        console.log(TAG + " callbackid1 : " + JSON.stringify(globalThis.callbackid1));
        var strtemp = "";
        var listtemp = [];
        var listtemp2 = [];
        for (var i = 0; i < globalThis.list1.length; i++) {
          strtemp = globalThis.list1[i].substring(0, 12);
          if (strtemp == "MainAbility2") {
            listtemp.push(globalThis.list1[i]);
          } else if (strtemp == "MainAbility5") {
            listtemp2.push(globalThis.list1[i]);
          }
        }
        console.log(TAG + " listtemp is :" + JSON.stringify(listtemp));
        console.log(TAG + " listtemp2 is :" + JSON.stringify(listtemp2));
        let exlist = listtemp;
        let exlist2 = listtemp2;
        expect(exlist[0]).assertEqual("MainAbility2 onAbilityCreate");
        expect(exlist[1]).assertEqual("MainAbility2 onWindowStageCreate");
        expect(exlist[2]).assertEqual("MainAbility2 onAbilityForeground");
        expect(exlist[3]).assertEqual("MainAbility2 onAbilityBackground");
        expect(exlist[4]).assertEqual("MainAbility2 onWindowStageDestroy");
        expect(exlist[5]).assertEqual("MainAbility2 onAbilityDestroy");
        expect(exlist2[0]).assertEqual("MainAbility5 onAbilityCreate");
        expect(exlist2[1]).assertEqual("MainAbility5 onWindowStageCreate");
        expect(exlist2[2]).assertEqual("MainAbility5 onAbilityForeground");
        expect(exlist2[3]).assertEqual("MainAbility5 onAbilityBackground");
        expect(exlist2[4]).assertEqual("MainAbility5 onWindowStageDestroy");
        expect(exlist2[5]).assertEqual("MainAbility5 onAbilityDestroy");

        // globalThis.applicationContext1
        //   .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error, data) => {
        //     console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
        //     ",data: " + JSON.stringify(data));
        //     console.log("------------Singlehap_LifeCycleTest_0600 END-------------");
        //     done();
        //   })
        globalThis.applicationContext1.off("abilityLifecycle", globalThis.callbackid1, (error) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
          done();
        });
      }, 5200);
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_0700
     * @tc.name    Multiple registration/unregistration
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0700", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_0700 START-------------");
      TAG = "Singlehap_LifeCycleTest_0700";
      var code1;
      var code2;
      var code3;
      var id1;
      var id2;
      var id3;
      var listKey8 = [];
      let AbilityLifecycleCallback = {
        onAbilityCreate(ability) {
          console.log(TAG + " onAbilityCreate ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " onAbilityCreate abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onAbilityCreate");
          listKey8.push(abilityname + " onAbilityCreate");
        },
        onWindowStageCreate(ability, windowStage) {
          console.log(TAG + " onWindowStageCreate ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " onWindowStageCreate abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onWindowStageCreate");
          listKey8.push(abilityname + " onWindowStageCreate");
        },
        onWindowStageActive(ability, windowStage) {
          let abilityname = ability.context.abilityInfo.name;
          console.log(abilityname + " onWindowStageActive");
        },
        onWindowStageInactive(ability, windowStage) {
          let abilityname = ability.context.abilityInfo.name;
          console.log(abilityname + " onWindowStageInactive");
        },
        onWindowStageDestroy(ability, windowStage) {
          console.log(TAG + " AbilityLifecycleCallback1 onWindowStageDestroy ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onWindowStageDestroy abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onWindowStageDestroy");
          listKey8.push(abilityname + " onWindowStageDestroy");
        },
        onAbilityDestroy(ability) {
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityDestroy ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityDestroy abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onAbilityDestroy");
          listKey8.push(abilityname + " onAbilityDestroy");
        },
        onAbilityForeground(ability) {
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityForeground ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityForeground abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onAbilityForeground");
          listKey8.push(abilityname + " onAbilityForeground");
        },
        onAbilityBackground(ability) {
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityBackground ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityBackground abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onAbilityBackground");
          listKey8.push(abilityname + " onAbilityBackground");
        },
        onAbilityContinue(ability) {
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityContinue ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityContinue abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onAbilityContinue");
          listKey8.push(abilityname + " onAbilityContinue");
        },
      };
      let applicationContext = globalThis.abilityContext.getApplicationContext();
      // id1 = applicationContext.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
      id1 = applicationContext.on("abilityLifecycle", AbilityLifecycleCallback);
      console.log(TAG + " registerAbilityLifecycleCallback1 number: " + JSON.stringify(id1));
      // applicationContext.unregisterAbilityLifecycleCallback(id1, (error, data) => {
      //   console.log(TAG + ": unregisterAbilityLifecycleCallback1 success, err: " + JSON.stringify(error) +
      //   ",data: " + JSON.stringify(data));
      //   code1 = error.code;
      // })

      applicationContext.off("abilityLifecycle", id1, (error) => {
        console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
        code1 = error ? error.code : 0;
      });
      setTimeout(function () {
        // id2 = applicationContext.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
        id2 = applicationContext.on("abilityLifecycle", AbilityLifecycleCallback);
        console.log(TAG + " registerAbilityLifecycleCallback2 number: " + JSON.stringify(id2));
        // applicationContext.unregisterAbilityLifecycleCallback(id2, (error, data) => {
        //   console.log(TAG + ": unregisterAbilityLifecycleCallback2 success, err: " + JSON.stringify(error) +
        //   ",data: " + JSON.stringify(data));
        //   code2 = error.code;
        // })
        applicationContext.off("abilityLifecycle", id2, (error) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
          code2 = error ? error.code : 0;
        });
      }, 1000);
      setTimeout(function () {
        // id3 = applicationContext.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
        id3 = applicationContext.on("abilityLifecycle", AbilityLifecycleCallback);
        console.log(TAG + " registerAbilityLifecycleCallback3 number: " + JSON.stringify(id3));
        // applicationContext.unregisterAbilityLifecycleCallback(id3, (error, data) => {
        //   console.log(TAG + ": unregisterAbilityLifecycleCallback3 success, err: " + JSON.stringify(error) +
        //   ",data: " + JSON.stringify(data));
        //   code3 = error.code;
        //   expect(id1 > 0).assertTrue();
        //   expect(id2).assertEqual(id1 + 1);
        //   expect(id3).assertEqual(id2 + 1);
        //   expect(code1).assertEqual(0);
        //   expect(code2).assertEqual(0);
        //   expect(code3).assertEqual(0);
        //   console.log("------------Singlehap_LifeCycleTest_0700 END-------------");
        //   done();
        // })

        applicationContext.off("abilityLifecycle", id3, (error) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback3 success, err: " + JSON.stringify(error));
          code3 = error ? error.code : 0;
          expect(id1 > 0).assertTrue();
          expect(id2).assertEqual(id1 + 1);
          expect(id3).assertEqual(id2 + 1);
          expect(code1).assertEqual(0);
          expect(code2).assertEqual(0);
          expect(code3).assertEqual(0);
          console.log("------------Singlehap_LifeCycleTest_0700 END-------------");
          done();
        });
      }, 3000);
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_0800
     * @tc.name    Maninability1 Register listening, Repeat starting and termination Ability2
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0800", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_0800 START-------------");
      TAG = "Singlehap_LifeCycleTest_0800";
      var str = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility1",
        moduleName: moduleName,
      };
      globalThis.abilityContext
        .startAbility(str)
        .then((data) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
      setTimeout(function () {
        var str1 = {
          bundleName: "com.test.lifecycle_crossplatform_xts",
          abilityName: "MainAbility2",
          moduleName: moduleName,
        };
        globalThis.abilityContext
          .startAbility(str1)
          .then((data) => {
            console.info(TAG + " start successful. Data: " + data);
          })
          .catch((error) => {
            console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
          });
      }, 1500);
      setTimeout(function () {
        var str1 = {
          bundleName: "com.test.lifecycle_crossplatform_xts",
          abilityName: "MainAbility2",
          moduleName: moduleName,
        };
        globalThis.abilityContext
          .startAbility(str1)
          .then((data) => {
            console.info(TAG + " start successful. Data: " + data);
          })
          .catch((error) => {
            console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
          });
      }, 4500);

      setTimeout(function () {
        var str1 = {
          bundleName: "com.test.lifecycle_crossplatform_xts",
          abilityName: "MainAbility2",
          moduleName: moduleName,
        };
        globalThis.abilityContext
          .startAbility(str1)
          .then((data) => {
            console.info(TAG + " start successful. Data: " + data);
          })
          .catch((error) => {
            console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
          });
      }, 7500);

      setTimeout(function () {
        console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list1));
        console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid1));
        var strtemp = "";
        var listtemp = [];
        var listtemp1 = [];
        for (var i = 0; i < globalThis.list1.length; i++) {
          strtemp = globalThis.list1[i].substring(0, 12);
          if (strtemp === "MainAbility1") {
            listtemp.push(globalThis.list1[i]);
          } else if (strtemp === "MainAbility2") {
            listtemp1.push(globalThis.list1[i]);
          }
        }
        console.log(TAG + " listtemp is :" + listtemp);
        console.log(TAG + " listtemp1 is :" + listtemp1);
        let exlist = listtemp;
        let exlist1 = listtemp1;
        try {
          expect(exlist[0]).assertEqual("MainAbility1 onWindowStageCreate");
          expect(exlist[1]).assertEqual("MainAbility1 onAbilityForeground");
          expect(exlist[2]).assertEqual("MainAbility1 onAbilityBackground");
          expect(exlist[3]).assertEqual("MainAbility1 onAbilityForeground");
          expect(exlist[4]).assertEqual("MainAbility1 onAbilityBackground");
          expect(exlist[5]).assertEqual("MainAbility1 onAbilityForeground");
          expect(exlist[6]).assertEqual("MainAbility1 onAbilityBackground");
          expect(exlist1[0]).assertEqual("MainAbility2 onAbilityCreate");
          expect(exlist1[1]).assertEqual("MainAbility2 onWindowStageCreate");
          expect(exlist1[2]).assertEqual("MainAbility2 onAbilityForeground");
          expect(exlist1[3]).assertEqual("MainAbility2 onAbilityBackground");
          expect(exlist1[4]).assertEqual("MainAbility2 onWindowStageDestroy");
          expect(exlist1[5]).assertEqual("MainAbility2 onAbilityDestroy");
          expect(exlist1[6]).assertEqual("MainAbility2 onAbilityCreate");
          expect(exlist1[7]).assertEqual("MainAbility2 onWindowStageCreate");
          expect(exlist1[8]).assertEqual("MainAbility2 onAbilityForeground");
          expect(exlist1[9]).assertEqual("MainAbility2 onAbilityBackground");
          expect(exlist1[10]).assertEqual("MainAbility2 onWindowStageDestroy");
          expect(exlist1[11]).assertEqual("MainAbility2 onAbilityDestroy");
          expect(exlist1[12]).assertEqual("MainAbility2 onAbilityCreate");
          expect(exlist1[13]).assertEqual("MainAbility2 onWindowStageCreate");
          expect(exlist1[14]).assertEqual("MainAbility2 onAbilityForeground");
        } catch (error) {
          console.error(`${TAG} startRunning failed: ${JSON.stringify(error)}`);
          done();
        }
        // globalThis.applicationContext1
        //   .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error, data) => {
        //     console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
        //     ",data: " + JSON.stringify(data));
        //     console.log("------------Singlehap_LifeCycleTest_0800 END-------------");
        //     done();
        //   });

        globalThis.applicationContext1.off("abilityLifecycle", globalThis.callbackid1, (error) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
          done();
        });
      }, 9000);
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_0900
     * @tc.name    Repeat switching Ability1 between front and back
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_0900", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_0900 START-------------");
      TAG = "Singlehap_LifeCycleTest_0900";
      var str = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility1",
        moduleName: moduleName,
      };
      globalThis.abilityContext
        .startAbility(str)
        .then((data) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
      setTimeout(function () {
        var str1 = {
          bundleName: "com.test.lifecycle_crossplatform_xts",
          abilityName: "MainAbility2",
          moduleName: moduleName,
        };
        globalThis.abilityContext
          .startAbility(str1)
          .then((data) => {
            console.info(TAG + " start successful. Data: " + data);
          })
          .catch((error) => {
            console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
          });
      }, 500);
      setTimeout(function () {
        var str1 = {
          bundleName: "com.test.lifecycle_crossplatform_xts",
          abilityName: "MainAbility2",
          moduleName: moduleName,
        };
        globalThis.abilityContext
          .startAbility(str1)
          .then((data) => {
            console.info(TAG + " start successful. Data: " + data);
          })
          .catch((error) => {
            console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
          });
      }, 3000);
      setTimeout(function () {
        console.log(TAG + " registerAbilityLifecycleCallback listKey : " + JSON.stringify(globalThis.list1));
        console.log(TAG + " registerAbilityLifecycleCallback callbackid : " + JSON.stringify(globalThis.callbackid1));
        var strtemp = "";
        var listtemp = [];
        var listtemp1 = [];
        for (var i = 0; i < globalThis.list1.length; i++) {
          strtemp = globalThis.list1[i].substring(0, 12);
          if (strtemp === "MainAbility1") {
            listtemp.push(globalThis.list1[i]);
          } else if (strtemp === "MainAbility2") {
            listtemp1.push(globalThis.list1[i]);
          }
        }
        console.log(TAG + " listtemp is :" + listtemp);
        console.log(TAG + " listtemp1 is :" + listtemp1);
        let exlist = listtemp;
        let exlist1 = listtemp1;
        expect(exlist[0]).assertEqual("MainAbility1 onWindowStageCreate");
        expect(exlist[1]).assertEqual("MainAbility1 onAbilityForeground");
        expect(exlist[2]).assertEqual("MainAbility1 onAbilityBackground");
        expect(exlist[3]).assertEqual("MainAbility1 onAbilityForeground");
        expect(exlist[4]).assertEqual("MainAbility1 onAbilityBackground");
        expect(exlist[5]).assertEqual("MainAbility1 onAbilityForeground");
        expect(exlist1[0]).assertEqual("MainAbility2 onAbilityCreate");
        expect(exlist1[1]).assertEqual("MainAbility2 onWindowStageCreate");
        expect(exlist1[2]).assertEqual("MainAbility2 onAbilityForeground");
        expect(exlist1[3]).assertEqual("MainAbility2 onAbilityBackground");
        expect(exlist1[4]).assertEqual("MainAbility2 onWindowStageDestroy");
        expect(exlist1[5]).assertEqual("MainAbility2 onAbilityDestroy");
        expect(exlist1[6]).assertEqual("MainAbility2 onAbilityCreate");
        expect(exlist1[7]).assertEqual("MainAbility2 onWindowStageCreate");
        expect(exlist1[8]).assertEqual("MainAbility2 onAbilityForeground");
        expect(exlist1[9]).assertEqual("MainAbility2 onAbilityBackground");
        expect(exlist1[10]).assertEqual("MainAbility2 onWindowStageDestroy");
        expect(exlist1[11]).assertEqual("MainAbility2 onAbilityDestroy");
        // globalThis.applicationContext1
        //   .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error, data) => {
        //     console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
        //     ",data: " + JSON.stringify(data));
        //     console.log("------------Singlehap_LifeCycleTest_0900 END-------------");
        //     done();
        //   });

        globalThis.applicationContext1.off("abilityLifecycle", globalThis.callbackid1, (error) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
          done();
        });
      }, 5500);
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_1200
     * @tc.name    Register listening in abilityA foreground,repeat the registration (standard)
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_1000", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_1200 START-------------");
      TAG = "Singlehap_LifeCycleTest_1200";
      var id1;
      var id2;
      var str = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility8",
        moduleName: moduleName,
      };
      globalThis.abilityContext
        .startAbility(str)
        .then((data) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
      setTimeout(function () {
        console.log(TAG + " firstCallback listKey : " + JSON.stringify(globalThis.list8));
        console.log(TAG + " firstCallback callbackid : " + JSON.stringify(globalThis.callbackid8));
        id1 = globalThis.callbackid8;
        console.log(TAG + " firstCallback id : " + JSON.stringify(id1));
        var str = {
          bundleName: "com.test.lifecycle_crossplatform_xts",
          abilityName: "MainAbility8",
          moduleName: moduleName,
        };
        globalThis.abilityContext
          .startAbility(str)
          .then((data) => {
            console.info(TAG + " start successful. Data: " + data);
          })
          .catch((error) => {
            console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
          });
      }, 2000);
      setTimeout(function () {
        console.log(TAG + " secondCallback listKey : " + JSON.stringify(globalThis.list8));
        console.log(TAG + " secondCallback callbackid : " + JSON.stringify(globalThis.callbackid8));
        id2 = globalThis.callbackid8;
        console.log(TAG + " secondCallback id : " + JSON.stringify(id2));
        expect(id1 + 1).assertEqual(id2);
        // globalThis.applicationContext8
        //   .unregisterAbilityLifecycleCallback(globalThis.callbackid8, (error, data) => {
        //     console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
        //     ",data: " + JSON.stringify(data));
        //   });

        globalThis.applicationContext8.off("abilityLifecycle", globalThis.callbackid8, (error) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
        });
        var para = {
          resultCode: 1,
          want: {
            abilityName: "MainAbility8",
            bundleName: "com.test.lifecycle_crossplatform_xts",
            moduleName: moduleName,
          },
        };
        console.log(TAG + " terminateSelfwithresult para: " + JSON.stringify(para));
        // globalThis.ability8.terminateSelfWithResult(para, (error, data) => {
        //   console.log(TAG + " terminateSelfwithresult success, err: " + JSON.stringify(error) +
        //   ",data: " + JSON.stringify(data));
        //   console.log("------------Singlehap_LifeCycleTest_1200 END-------------");
        //   done();
        // });

        globalThis.ability8.terminateSelf((error, data) => {
          console.log(TAG + " terminateSelfwithresult success, err: " + JSON.stringify(error) + ",data: " + JSON.stringify(data));
          console.log("------------Singlehap_LifeCycleTest_1200 END-------------");
          done();
        });
      }, 4000);
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_1400
     * @tc.name    The ability of HAP A listens to the ability lifecycle callback of HAP B (standard)
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Singlehap_LifeCycleTest_1100", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_1400 start-------------");
      TAG = "Singlehap_LifeCycleTest_1400";
      listKeyTemp = [];
      globalThis.abilityContext.startAbility(
        {
          bundleName: "com.test.lifecycle_crossplatform_xts",
          abilityName: "MainAbility9",
          moduleName: moduleName,
        },
        (error, data) => {
          console.log(TAG + ": MainAbility9 startAbility success, err: " + JSON.stringify(error) + ",data: " + JSON.stringify(data));
        }
      );
      await sleep(500);
      globalThis.abilityContext.startAbility(
        {
          bundleName: "com.test.lifecycle_crossplatform_xts",
          abilityName: "Hap1MainAbility2",
          moduleName: moduleName,
        },
        (error, data) => {
          console.log(TAG + ":first Hap1MainAbility2 startAbility success, err: " + JSON.stringify(error) + ",data: " + JSON.stringify(data));
        }
      );
      await sleep(500);
      globalThis.abilityContext.startAbility(
        {
          bundleName: "com.test.lifecycle_crossplatform_xts",
          abilityName: "Hap1MainAbility2",
          moduleName: moduleName,
        },
        (error, data) => {
          setTimeout(() => {
            console.log(TAG + ": second Hap1MainAbility2 startAbility success, err: " + JSON.stringify(error) + ",data: " + JSON.stringify(data));
            for (var i = 0; i < globalThis.mainAbility9ListKey.length; i++) {
              if (globalThis.mainAbility9ListKey[i].substring(0, 16) == "Hap1MainAbility2") {
                listKeyTemp.push(globalThis.mainAbility9ListKey[i]);
              }
            }
            console.log(TAG + "listKeyTemp is :" + listKeyTemp);
            console.log(TAG + "globalThis.mainAbility9CallBackId is :" + globalThis.mainAbility9CallBackId);
            expect(listKeyTemp[0]).assertEqual("Hap1MainAbility2 onAbilityCreate");
            expect(listKeyTemp[1]).assertEqual("Hap1MainAbility2 onWindowStageCreate");
            expect(listKeyTemp[2]).assertEqual("Hap1MainAbility2 onAbilityForeground");
            expect(listKeyTemp[3]).assertEqual("Hap1MainAbility2 onAbilityCreate");
            expect(listKeyTemp[4]).assertEqual("Hap1MainAbility2 onWindowStageCreate");
            expect(listKeyTemp[5]).assertEqual("Hap1MainAbility2 onAbilityForeground");
            expect(listKeyTemp[6]).assertEqual("Hap1MainAbility2 onAbilityBackground");
            expect(listKeyTemp[7]).assertEqual("Hap1MainAbility2 onWindowStageDestroy");
            expect(listKeyTemp[8]).assertEqual("Hap1MainAbility2 onAbilityDestroy");
            expect(listKeyTemp[9]).assertEqual("Hap1MainAbility2 onAbilityBackground");
            expect(listKeyTemp[10]).assertEqual("Hap1MainAbility2 onWindowStageDestroy");
            expect(listKeyTemp[11]).assertEqual("Hap1MainAbility2 onAbilityDestroy");
            // globalThis.applicationContext9
            //   .unregisterAbilityLifecycleCallback(globalThis.mainAbility9CallBackId, (error, data) => {
            //     console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
            //     ",data: " + JSON.stringify(data));
            //     done();
            //   });

            globalThis.applicationContext9.off("abilityLifecycle", globalThis.mainAbility9CallBackId, (error) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
              done();
            });
          }, 3000);
        }
      );
      console.log("------------Singlehap_LifeCycleTest_1400 end-------------");
    });

    var callbackid_NA = 100;
    var callbackid_errorNum = -1;

    /*
     * @tc.number  Singlehap_LifeCycleTest_1600
     * @tc.name    input Nonexistent callbackid for unregisterAbilityLifecycleCallback parameter
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("Singlehap_LifeCycleTest_1200", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_1600 START-------------");
      TAG = "Singlehap_LifeCycleTest_1600";
      let code;
      // globalThis.abilityContext.getApplicationContext()
      //   .unregisterAbilityLifecycleCallback(callbackid_NA, (error, data) => {
      //     console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
      //     ",data: " + JSON.stringify(data));
      //     code = error.code;
      //     sleep(1000);
      //     expect(code).assertEqual(1);
      //     done();
      //   });

      globalThis.abilityContext.getApplicationContext().off("abilityLifecycle", callbackid_NA, (error) => {
        console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
        code = error.code;
        sleep(1000);
        expect(code).assertEqual(401);
        done();
      });
    });

    /*
     * @tc.number  Singlehap_LifeCycleTest_1700
     * @tc.name    input error callbackid for unregisterAbilityLifecycleCallback parameter
     * @tc.desc    Function test
     * @tc.level   1
     */
    it("Singlehap_LifeCycleTest_1300", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_1700 START-------------");
      TAG = "Singlehap_LifeCycleTest_1700";
      let code;
      // globalThis.abilityContext.getApplicationContext()
      //   .unregisterAbilityLifecycleCallback(callbackid_errorNum, (error, data) => {
      //     console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
      //     ",data: " + JSON.stringify(data));
      //     code = error.code;
      //     sleep(1000);
      //     expect(code).assertEqual(1);
      //     done();
      //   });

      globalThis.abilityContext.getApplicationContext().off("abilityLifecycle", callbackid_errorNum, (error) => {
        console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
        code = error.code;
        sleep(1000);
        expect(code).assertEqual(401);
        done();
      });
    });

    /*
    * @tc.number  Singlehap_LifeCycleTest_2100
    * @tc.name    Register in abilityA,register in abilityB, starting and termination abilityC,
                  termination abilityB、abilityA, Re-register in abilityA、abilityB
    * @tc.desc    Function test
    * @tc.level   0
    */
    it("Singlehap_LifeCycleTest_1400", 0, async function (done) {
      console.log("------------Singlehap_LifeCycleTest_2100 START-------------");
      TAG = "Singlehap_LifeCycleTest_2100";
      let id1;
      let str = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility1",
        moduleName: moduleName,
      };
      globalThis.abilityContext
        .startAbility(str)
        .then((data) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
      setTimeout(function () {
        var str2 = {
          bundleName: "com.test.lifecycle_crossplatform_xts",
          abilityName: "MainAbility2",
          moduleName: moduleName,
        };
        globalThis.abilityContext
          .startAbility(str2)
          .then((data) => {
            console.info(TAG + " start successful. Data: " + data);
          })
          .catch((error) => {
            console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
          });
      }, 1000);
      setTimeout(function () {
        console.log(TAG + " firstCallback listKey1 : " + JSON.stringify(globalThis.list1));
        console.log(TAG + " firstCallback callbackid1 : " + JSON.stringify(globalThis.callbackid1));
        id1 = globalThis.callbackid1;
        console.log(TAG + " firstCallback id1 : " + JSON.stringify(id1));
        var para = {
          resultCode: 2100,
          want: {
            abilityName: "MainAbility1",
            bundleName: "com.test.lifecycle_crossplatform_xts",
            moduleName: moduleName,
          },
        };
        console.log(TAG + " terminateSelfwithresult para: " + JSON.stringify(para));
        // globalThis.ability1context.terminateSelfWithResult(para)
        //   .then((data) => {
        //     console.log(TAG + " terminateSelfwithresult successful data: " + JSON.stringify(data));
        //   }).catch((error) => {
        //     console.log(TAG + " terminateSelfwithresult error: " + JSON.stringify(error));
        //   });

        globalThis.ability1context
          .terminateSelf()
          .then((data) => {
            console.log(TAG + " terminateSelfwithresult successful data: " + JSON.stringify(data));
          })
          .catch((error) => {
            console.log(TAG + " terminateSelfwithresult error: " + JSON.stringify(error));
          });
      }, 4500);
      setTimeout(function () {
        console.log(TAG + " secondCallback listKey1 : " + JSON.stringify(globalThis.list1));
        let templist1 = globalThis.list1;
        console.log(TAG + " secondCallback callbackid1 : " + JSON.stringify(globalThis.callbackid1));
        var strtemp = "";
        var listtemp = [];
        for (var i = 0; i < templist1.length; i++) {
          strtemp = templist1[i].substring(0, 13);
          if (strtemp === "MainAbility2 ") {
            listtemp.push(templist1[i]);
          }
        }
        console.log(TAG + " listtemp is :" + JSON.stringify(listtemp));
        let exlist = listtemp;
        expect(exlist[0]).assertEqual("MainAbility2 onAbilityCreate");
        expect(exlist[1]).assertEqual("MainAbility2 onWindowStageCreate");
        expect(exlist[2]).assertEqual("MainAbility2 onAbilityForeground");
        expect(exlist[3]).assertEqual("MainAbility2 onAbilityBackground");
        expect(exlist[4]).assertEqual("MainAbility2 onWindowStageDestroy");
        expect(exlist[5]).assertEqual("MainAbility2 onAbilityDestroy");
        // globalThis.applicationContext1
        //   .unregisterAbilityLifecycleCallback(globalThis.callbackid1, (error, data) => {
        //     console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
        //     ",data: " + JSON.stringify(data));
        //     console.log("------------Singlehap_LifeCycleTest_2100 END-------------");
        //     done();
        //   });

        globalThis.applicationContext1.off("abilityLifecycle", globalThis.callbackid1, (error) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
          done();
        });
      }, 7000);
    });

    /*
     * @tc.number  Multi_LifeCycleTest_0100
     * @tc.name    Register in abilitystage,listen to the lifecycle of abilityA, then start other bundle's ablilty
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("Multi_LifeCycleTest_0100", 0, async function (done) {
      console.log("------------Multi_LifeCycleTest_0100 START-------------");
      TAG = "Multi_LifeCycleTest_0100";
      var str = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility1",
        moduleName: moduleName,
      };
      globalThis.abilityContext
        .startAbility(str)
        .then((data) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });

      await sleep(1000);

      var str = {
        bundleName: otherBundle,
        abilityName: "MainAbility",
        moduleName: "entry_test",
      };

      let otherAppResult = 0;
      globalThis.abilityContext
        .startAbility(str)
        .then((data) => {
          console.info(TAG + " start successful. Data: " + data);
          otherAppResult = 1;
        })
        .catch((error) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
      await sleep(1000);
      expect(otherAppResult == 1).assertTrue();
      let list1 = globalThis.list1;
      console.info(TAG + "list: " + list1);
      done();
      // MainAbility1 onWindowStageCreate,MainAbility1 onAbilityForeground,MainAbility9 onAbilityBackground,MainAbility2 onAbilityCreate
      // ,MainAbility2 onWindowStageCreate,MainAbility2 onAbilityForeground,MainAbility1 onAbilityBackground,MainAbility1 onAbilityForeground,
      // MainAbility2 onAbilityBackground,MainAbility2 onWindowStageDestroy,MainAbility2 onAbilityDestroy,MainAbility9 onAbilityForeground,
      // MainAbility1 onAbilityBackground,MainAbility1 onWindowStageDestroy,MainAbility1 onAbilityDestroy
      // expect(list1[3]).assertEqual("MainAbility1 onAbilityBackground");
    });

    /*
     * @tc.number  AbilityStage_onCreate_Test_0100
     * @tc.name    AbilityStage_onCreate_Test_0100
     * @tc.desc    Start mainability2, test stage ability onCreate
     * @tc.level   0
     */
    it("AbilityStage_onCreate_Test_0100", 0, async function (done) {
      console.log("------------AbilityStage_onCreate_Test_0100 START-------------");
      TAG = "AbilityStage_onCreate_Test_0100";
      var str = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility2",
        moduleName: moduleName,
      };
      globalThis.abilityContext
        .startAbility(str)
        .then((data) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
      setTimeout(function () {
        // abilitystage的onCreatre里注册了globalThis.applicationContext，globalThis.applicationContext不为null
        // 则oncreate触发成功。
        expect(globalThis.applicationContext != null).assertTrue();
        done();
      }, 3000);
    });

    /*
     * @tc.number  AbilityStage_Context_Test_0100
     * @tc.name    AbilityStage_Context_Test_0100
     * @tc.desc    Start mainability2, test stage ability context
     * @tc.level   0
     */
    it("AbilityStage_Context_Test_0100", 0, async function (done) {
      console.log("------------AbilityStage_Context_Test_0100 START-------------");
      TAG = "AbilityStage_Context_Test_0100";
      var str = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility2",
        moduleName: moduleName,
      };
      globalThis.abilityContext
        .startAbility(str)
        .then((data) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
      setTimeout(function () {
        // abilitystage的onCreatre里注册了globalThis.applicationContext，globalThis.applicationContext不为null
        // 则oncreate触发成功,且context能够获取。
        console.log("AbilityStage_Context_Test_0100 1000");
        expect(globalThis.ability2 != null).assertTrue();
        console.log("AbilityStage_Context_Test_0100 1001");
        expect(globalThis.ability2.currentHapModuleInfo != null).assertTrue();
        console.log("AbilityStage_Context_Test_0100 1002");
        expect(globalThis.ability2.config != null).assertTrue();
        done();
      }, 1000);
    });

    /*
     * @tc.number  Multi_LifeCycleTest_0200
     * @tc.name    Multi_LifeCycleTest_0200
     * @tc.desc    start multi ability1, then start multi ability1, check life cycle
     * @tc.level   0
     */
    it("Multi_LifeCycleTest_0200", 0, async function (done) {
      console.log("------------Multi_LifeCycleTest_0200 START-------------");
      TAG = "Multi_LifeCycleTest_0200";
      var str = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MultiMainability1",
        moduleName: moduleName,
      };

      // 第一次起MultiMainability1
      globalThis.abilityContext
        .startAbility(str)
        .then((data) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
      await sleep(1500);

      var listtemp = [];
      for (var i = 0; i < globalThis.mlist1.length; i++) {
        const item = globalThis.mlist1[i];
        if (item.indexOf("MultiMainability1") != -1) {
          listtemp.push(item);
        }
      }
      console.info(TAG + "list:" + listtemp);
      // MultiMainability1 onWindowStageCreate,MultiMainability1 onAbilityForeground
      expect(listtemp[0]).assertEqual("MultiMainability1 onWindowStageCreate");
      expect(listtemp[1]).assertEqual("MultiMainability1 onAbilityForeground");

      // 第二次起MultiMainability1
      globalThis.abilityContext
        .startAbility(str)
        .then((data) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });
      await sleep(1500);

      var listtemp = [];
      for (var i = 0; i < globalThis.mlist1.length; i++) {
        const item = globalThis.mlist1[i];
        if (item.indexOf("MultiMainability1") != -1) {
          listtemp.push(item);
        }
      }
      console.info(TAG + "list:" + listtemp);

      expect(listtemp[2]).assertEqual("MultiMainability1 onAbilityCreate");
      expect(listtemp[3]).assertEqual("MultiMainability1 onWindowStageCreate");
      done();
    });

    /*
     * @tc.number  LifeCycleTest_on_0100
     * @tc.name    LifeCycleTest_on_0100
     * @tc.desc    on abilityLifecycle twice in mainability13
     * @tc.level   0
     */
    it("LifeCycleTest_on_0100", 0, async function (done) {
      console.log("------------LifeCycleTest_on_0100 START-------------");
      TAG = "LifeCycleTest_on_0100";
      var str = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility13",
        moduleName: moduleName,
      };

      // 第一次起MultiMainability1
      globalThis.abilityContext
        .startAbility(str)
        .then((data) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });

      await sleep(2500);
      console.log(TAG + "list1:" + globalThis.list13);
      const list1 = globalThis.list13;
      // MainAbility13 onWindowStageCreate,MainAbility13 onAbilityForeground,TestAbility onAbilityBackground
      console.log(TAG + "list2:" + globalThis.otherList13);
      const list2 = globalThis.otherList13;
      // MainAbility13 onWindowStageCreate,MainAbility13 onAbilityForeground,TestAbility onAbilityBackground

      expect(list1[0]).assertEqual(list2[0]);
      expect(list1[1]).assertEqual(list2[1]);
      expect(list1[2]).assertEqual(list2[2]);
      globalThis.ability13.terminateSelf();
      done();
    });

    /*
     * @tc.number  LifeCycleTest_on_0200
     * @tc.name    LifeCycleTest_on_0200
     * @tc.desc    Function test
     * @tc.level   0
     */
    it("LifeCycleTest_on_0200", 0, async function (done) {
      console.log("------------LifeCycleTest_on_0200 START-------------");
      TAG = "LifeCycleTest_on_0200";
      var listKey14 = [];
      let AbilityLifecycleCallback = {
        onAbilityCreate(ability) {
          console.log(TAG + " onAbilityCreate ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " onAbilityCreate abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onAbilityCreate");
          listKey14.push(abilityname + " onAbilityCreate");
        },
        onWindowStageCreate(ability, windowStage) {
          console.log(TAG + " onWindowStageCreate ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " onWindowStageCreate abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onWindowStageCreate");
          listKey14.push(abilityname + " onWindowStageCreate");
        },
        onWindowStageActive(ability, windowStage) {
          let abilityname = ability.context.abilityInfo.name;
          console.log(abilityname + " onWindowStageActive");
        },
        onWindowStageInactive(ability, windowStage) {
          let abilityname = ability.context.abilityInfo.name;
          console.log(abilityname + " onWindowStageInactive");
        },
        onWindowStageDestroy(ability, windowStage) {
          console.log(TAG + " AbilityLifecycleCallback1 onWindowStageDestroy ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onWindowStageDestroy abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onWindowStageDestroy");
          listKey14.push(abilityname + " onWindowStageDestroy");
        },
        onAbilityDestroy(ability) {
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityDestroy ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityDestroy abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onAbilityDestroy");
          listKey14.push(abilityname + " onAbilityDestroy");
        },
        onAbilityForeground(ability) {
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityForeground ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityForeground abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onAbilityForeground");
          listKey14.push(abilityname + " onAbilityForeground");
        },
        onAbilityBackground(ability) {
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityBackground ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityBackground abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onAbilityBackground");
          listKey14.push(abilityname + " onAbilityBackground");
        },
        onAbilityContinue(ability) {
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityContinue ability:" + JSON.stringify(ability));
          let abilityname = ability.context.abilityInfo.name;
          console.log(TAG + " AbilityLifecycleCallback1 onAbilityContinue abilityname:" + JSON.stringify(abilityname));
          console.log(TAG + " " + abilityname + " onAbilityContinue");
          listKey14.push(abilityname + " onAbilityContinue");
        },
      };

      var str = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility14",
        moduleName: moduleName,
      };

      // 第一次起MultiMainability1
      globalThis.abilityContext
        .startAbility(str)
        .then((data) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });

      await sleep(1000);
      let applicationContext = globalThis.ability14.getApplicationContext();

      for (let i = 0; i < 10; i++) {
        const tempId = applicationContext.on("abilityLifecycle", AbilityLifecycleCallback);
        console.log(TAG + " registerAbilityLifecycleCallback1 number: " + JSON.stringify(tempId));

        applicationContext.off("abilityLifecycle", tempId, (error) => {
          console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
        });
      }

      applicationContext.on("abilityLifecycle", AbilityLifecycleCallback);
      await sleep(1000);
      globalThis.ability14.terminateSelf();
      await sleep(1000);
      console.info(TAG + "list:" + listKey14);

      var listtemp = [];
      for (var i = 0; i < listKey14.length; i++) {
        const item = listKey14[i];
        if (item.indexOf("MainAbility14") != -1) {
          listtemp.push(item);
        }
      }
      // MainAbility14 onAbilityBackground,MainAbility14 onWindowStageDestroy,MainAbility14 onAbilityDestroy
      expect(listtemp[0]).assertEqual("MainAbility14 onAbilityBackground");
      expect(listtemp[1]).assertEqual("MainAbility14 onWindowStageDestroy");
      expect(listtemp[2]).assertEqual("MainAbility14 onAbilityDestroy");
      done();
    });

    /*
     * @tc.number  LifeCycleTest_on_0300
     * @tc.name    LifeCycleTest_on_0300
     * @tc.desc    unregister callback id which is not exists.
     * @tc.level   0
     */
    it("LifeCycleTest_on_0300", 0, async function (done) {
      console.log("------------LifeCycleTest_on_0300 START-------------");
      TAG = "LifeCycleTest_on_0300";

      let applicationContext = globalThis.abilityContext.getApplicationContext();
      applicationContext.off("abilityLifecycle", 100, (error) => {
        expect(error.code).assertEqual(401);
        console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
        done();
      });
    });

    /*
     * @tc.number  LifeCycleTest_on_0400
     * @tc.name    LifeCycleTest_on_0400
     * @tc.desc    unregister callback twice.
     * @tc.level   0
     */
    it("LifeCycleTest_on_0400", 0, async function (done) {
      console.log("------------LifeCycleTest_on_0400 START-------------");
      TAG = "LifeCycleTest_on_0400";

      var str = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility1",
        moduleName: moduleName,
      };

      // 第一次起MultiMainability1
      globalThis.abilityContext
        .startAbility(str)
        .then((data) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });

      await sleep(3000);
      console.info(TAG + "list:" + globalThis.list1);

      globalThis.applicationContext1.off("abilityLifecycle", globalThis.callbackid1, (error) => {
        console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
      });

      await sleep(500);

      globalThis.applicationContext1.off("abilityLifecycle", globalThis.callbackid1, (error) => {
        console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error));
        expect(error.code).assertEqual(401);
        done();
      });
    });

    /*
     * @tc.number  LifeCycleTest_on_0500
     * @tc.name    LifeCycleTest_on_0500
     * @tc.desc    start other hap's ability in the same app, and register this lifecycle.
     * @tc.level   0
     */
    it("LifeCycleTest_on_0500", 0, async function (done) {
      console.log("------------LifeCycleTest_on_0500 START-------------");
      TAG = "LifeCycleTest_on_0500";

      var str = {
        bundleName: "com.test.lifecycle_crossplatform_xts",
        abilityName: "MainAbility",
        moduleName: otherModuleName,
      };

      // 第一次起MultiMainability1
      globalThis.abilityContext
        .startAbility(str)
        .then((data) => {
          console.info(TAG + " start successful. Data: " + data);
        })
        .catch((error) => {
          console.error(TAG + " start failed. Cause: " + JSON.stringify(error));
        });

      await sleep(2000);
      console.info(TAG + "list:" + globalThis.featureList1);
      expect(globalThis.featureList1[0]).assertEqual("FeatureMainAbility onWindowStageCreate");
      expect(globalThis.featureList1[1]).assertEqual("FeatureMainAbility onAbilityForeground");

      globalThis.featureAbilityContext.terminateSelf();
      await sleep(1000);
      done();
    });
  });
}
