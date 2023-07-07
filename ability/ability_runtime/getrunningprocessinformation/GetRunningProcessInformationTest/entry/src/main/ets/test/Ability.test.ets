import hilog from '@ohos.hilog'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import { Component, Driver, UiWindow, ON, UiDriver } from '@ohos.UiTest'
import commonEvent from '@ohos.commonEvent'
import appManager from '@ohos.app.ability.appManager'
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
let ACTS_ProcessState = {
  events: ["processState"]
};

export default function abilityTest() {
  describe('GetRunningProcessInformationTest', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(function () {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async function () {
      var abilityDelegator;
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd1 = 'hilog -r'
      await abilityDelegator.executeShellCommand(cmd1, (err : any, data : any) => {
        console.info("executeShellCommand1 callback");
      });
      await abilityDelegator.executeShellCommand("hilog -G 20M", async (err, data) => {})
    })
    afterEach(async function () {
      var abilityDelegator;
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let cmd1 = 'aa force-stop com.example.applicationstatechangeonereply'
      let cmd2 = 'aa force-stop com.example.applicationstatechangetworeply'
      let cmd6 = 'aa force-stop com.example.applicationstatechangethreereply'
      let cmd4 = 'aa force-stop com.example.getrunningprocessinformationonereply'
      let cmd5 = 'aa force-stop com.example.getrunningprocessinformationtworeply'
      let cmd3 = 'hilog -r'
      await abilityDelegator.executeShellCommand(cmd1, (err : any, data : any) => {
        console.info("executeShellCommand1 callback");
      });
      await abilityDelegator.executeShellCommand(cmd2, (err : any, data : any) => {
        console.info("executeShellCommand2 callback");
      });
      await abilityDelegator.executeShellCommand(cmd3, (err : any, data : any) => {
        console.info("executeShellCommand3 callback");
      });
      await abilityDelegator.executeShellCommand(cmd4, (err : any, data : any) => {
        console.info("executeShellCommand3 callback");
      });
      await abilityDelegator.executeShellCommand(cmd5, (err : any, data : any) => {
        console.info("executeShellCommand3 callback");
      });
      await abilityDelegator.executeShellCommand(cmd6, (err : any, data : any) => {
        console.info("executeShellCommand3 callback");
      });

    })
    afterAll(function () {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })


    it('Acts_ApplicationStateChange_0100',0, function (done) {
      let want = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangeonereply",
        "abilityName": "EntryAbility",
        "action": "Normal"
      }
      let wantAuxiliary = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangetworeply",
        "abilityName": "EntryAbility",
        "action": "Normal"
      }
      let subscriber
      function unSubscribeCallback() {
        console.debug("====>Acts_ApplicationStateChange_0100 unSubscribeCallback");
      }
      function subscribeCallBack(err, data) {
        console.debug("====>Acts_ApplicationStateChange_0100 data: " + JSON.stringify(data));
        console.debug("====>Acts_ApplicationStateChange_0100 err: " + JSON.stringify(err));
        if(data.event == "processState") {
          try{
            expect(data.parameters.commonStateArr[0]).assertEqual(1)
            expect(data.parameters.commonStateArr[1]).assertEqual(1)
            expect(data.parameters.commonStateArr[2]).assertEqual(-1)
            expect(data.parameters.commonStateArr[3]).assertEqual(-1)
          }
          catch(error) {
            console.log("An error is generated")
          }
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }
      setTimeout(() => {
        commonEvent.createSubscriber(ACTS_ProcessState).then((data) => {
          console.debug("====>Acts_ApplicationStateChange_0100 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          globalThis.abilityContext.startAbility(want, (error) => {
            console.log("ability error.code = " + error.code)
          })

          setTimeout(() => {
            globalThis.abilityContext.startAbility(wantAuxiliary, (error) => {
              console.log("auxiliary ability error.code = " + error.code)
            })
          },3000) 

        })
      },700)

        setTimeout(()=>{
          done();
        }, 18000);
    })

    
    it('Acts_ApplicationStateChange_0200',0, async function (done) {
      let want = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangeonereply",
        "abilityName": "EntryAbility",
        "action": "NeedBackGroundOff"
      }
      let wantAuxiliary = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangetworeply",
        "abilityName": "EntryAbility",
        "action": "Normal"
      }
      let subscriber
      function unSubscribeCallback() {
        console.debug("====>Acts_ApplicationStateChange_0200 unSubscribeCallback");
      }
      function subscribeCallBack(err, data) {
        console.debug("====>Acts_ApplicationStateChange_0200 data: " + JSON.stringify(data));
        console.debug("====>Acts_ApplicationStateChange_0200 err: " + JSON.stringify(err));
        if(data.event == "processState") {
          console.info("entered assert zone!")
          try{
            expect(data.parameters.commonStateArr[0]).assertEqual(-1)
            expect(data.parameters.commonStateArr[1]).assertEqual(1)
            expect(data.parameters.commonStateArr[2]).assertEqual(-1)
            expect(data.parameters.commonStateArr[3]).assertEqual(-1)
          }
          catch{
            console.log("An error is generated")
          }

          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }
      setTimeout(() => {
        commonEvent.createSubscriber(ACTS_ProcessState).then(async (data) => {
          console.debug("====>Acts_ApplicationStateChange_0200 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          globalThis.abilityContext.startAbility(want, (error) => {
            console.log("ability error.code = " + error.code)
          })

          setTimeout(() => {
            globalThis.abilityContext.startAbility(wantAuxiliary, (error) => {
              console.log("auxiliary ability error.code = " + error.code)
            })
          },3000)
        })
      },700)

      setTimeout(()=>{
        done();
      }, 18000);
    })

    
    it('Acts_ApplicationStateChange_0300',0, async function (done) {
      let want = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangeonereply",
        "abilityName": "EntryAbility",
        "action": "doubleRegister"
      }
      let wantAuxiliary = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangetworeply",
        "abilityName": "EntryAbility",
        "action": "Normal"
      }

      let subscriber
      function unSubscribeCallback() {
        console.debug("====>Acts_ApplicationStateChange_0300 unSubscribeCallback");
      }
      function subscribeCallBack(err, data) {
        console.debug("====>Acts_ApplicationStateChange_0300 data: " + JSON.stringify(data));
        console.debug("====>Acts_ApplicationStateChange_0300 err: " + JSON.stringify(err));
        if(data.event == "processState") {
          console.info("entered assert zone!")
          try{
            expect(data.parameters.commonStateArr[0]).assertEqual(1)
            expect(data.parameters.commonStateArr[1]).assertEqual(1)
            expect(data.parameters.commonStateArr[2]).assertEqual(1)
            expect(data.parameters.commonStateArr[3]).assertEqual(1)
          }
          catch(error){
            console.log("An error is generated")
          }
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }
      setTimeout(() => {
        commonEvent.createSubscriber(ACTS_ProcessState).then(async (data) => {
          console.debug("====>Acts_ApplicationStateChange_0300 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          globalThis.abilityContext.startAbility(want, (error) => {
            console.log("ability error.code = " + error.code)
          })
          setTimeout(() => {
            globalThis.abilityContext.startAbility(wantAuxiliary, (error) => {
              console.log("auxiliary ability error.code = " + error.code)
            })
          },3000)
        })
      },700)

      setTimeout(()=>{
        done();
      }, 18000);

    })
    

    it('Acts_ApplicationStateChange_0400',0, async function (done) {
      let abilityDelegator;
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let want = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangeonereply",
        "abilityName": "EntryAbility",
        "action": "doubleNeedBackGroundOff"
      }
      let wantAuxiliary = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangetworeply",
        "abilityName": "EntryAbility",
        "action": "Normal"
      }

      let subscriber
      function unSubscribeCallback() {
        console.debug("====>Acts_ApplicationStateChange_0400 unSubscribeCallback");
      }
      function subscribeCallBack(err, data) {
        console.debug("====>Acts_ApplicationStateChange_0400 data: " + JSON.stringify(data));
        console.debug("====>Acts_ApplicationStateChange_0400 err: " + JSON.stringify(err));
        if(data.event == "processState") {
          console.info("entered assert zone!")
          try{
            expect(data.parameters.commonStateArr[0]).assertEqual(1)
            expect(data.parameters.commonStateArr[1]).assertEqual(1)
            expect(data.parameters.commonStateArr[2]).assertEqual(-1)
            expect(data.parameters.commonStateArr[3]).assertEqual(1)
          }
          catch(error){
            console.log("An error is generated")
          }
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }
      setTimeout(() => {
        commonEvent.createSubscriber(ACTS_ProcessState).then(async (data) => {
          console.debug("====>Acts_ApplicationStateChange_0400 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          globalThis.abilityContext.startAbility(want, (error) => {
            console.log("ability error.code = " + error.code)
          })
          setTimeout(() => {
            globalThis.abilityContext.startAbility(wantAuxiliary, (error) => {
              console.log("auxiliary ability error.code = " + error.code)
            })
          },3000)
        })
      },700)

      setTimeout(()=>{
        done();
      }, 18000);
    })


    it('Acts_ApplicationStateChange_0500',0, async function (done) {
      let abilityDelegator;
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let want = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangeonereply",
        "abilityName": "EntryAbility",
        "action": "MultiAppRegister"
      }
      let wantAuxiliary = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangetworeply",
        "abilityName": "EntryAbility",
        "action": "MultiAppRegister"
      }

      let subscriber
      function unSubscribeCallback() {
        console.debug("====>Acts_ApplicationStateChange_0500 unSubscribeCallback");
      }
      function subscribeCallBack(err, data) {
        console.debug("====>Acts_ApplicationStateChange_0500 data: " + JSON.stringify(data));
        console.debug("====>Acts_ApplicationStateChange_0500 err: " + JSON.stringify(err));
        if(data.event == "processState") {
          console.info("entered assert zone!")
          try{
            expect(data.parameters.commonStateArr[0]).assertEqual(-1)
            expect(data.parameters.commonStateArr[1]).assertEqual(1)
            expect(data.parameters.commonStateArr[2]).assertEqual(-1)
            expect(data.parameters.commonStateArr[3]).assertEqual(-1)
          }
          catch(error){
            console.log("An error is generated")
          }
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }
      setTimeout(() => {
        commonEvent.createSubscriber(ACTS_ProcessState).then(async (data) => {
          console.debug("====>Acts_ApplicationStateChange_0500 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          globalThis.abilityContext.startAbility(want, (error) => {
            console.log("ability error.code = " + error.code)
          })
          setTimeout(() => {
            globalThis.abilityContext.startAbility(wantAuxiliary, (error) => {
              console.log("auxiliary ability error.code = " + error.code)
            })
          },3000)
        })
      },700)

      setTimeout(()=>{
        done();
      }, 18000);
    })

    it('Acts_ApplicationStateChange_0600',0, async function (done) {
      let abilityDelegator;
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let want = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangeonereply",
        "abilityName": "EntryAbility",
        "action": "DoubleRegisterOff"
      }
      let wantAuxiliary = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangetworeply",
        "abilityName": "EntryAbility",
        "action": "DoubleRegisterOff"
      }

      let subscriber
      function unSubscribeCallback() {
        console.debug("====>Acts_ApplicationStateChange_0600 unSubscribeCallback");
      }
      function subscribeCallBack(err, data) {
        console.debug("====>Acts_ApplicationStateChange_0600 data: " + JSON.stringify(data));
        console.debug("====>Acts_ApplicationStateChange_0600 err: " + JSON.stringify(err));
        if(data.event == "processState") {
          console.info("entered assert zone!")
          try{
            expect(data.parameters.commonStateArr[0]).assertEqual(-1)
            expect(data.parameters.commonStateArr[1]).assertEqual(1)
            expect(data.parameters.commonStateArr[2]).assertEqual(-1)
            expect(data.parameters.commonStateArr[3]).assertEqual(1)
          }
          catch(error){
            console.log("An error is generated")
          }
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }
      setTimeout(() => {
        commonEvent.createSubscriber(ACTS_ProcessState).then(async (data) => {
          console.debug("====>Acts_ApplicationStateChange_0600 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          globalThis.abilityContext.startAbility(want, (error) => {
            console.log("ability error.code = " + error.code)
          })
          setTimeout(() => {
            globalThis.abilityContext.startAbility(wantAuxiliary, (error) => {
              console.log("auxiliary ability error.code = " + error.code)
            })
          },3000)
        })
      },700)

      setTimeout(()=>{
        done();
      }, 18000);

    })
    

    it('Acts_ApplicationStateChange_0700',0, function (done) {
      let want = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangeonereply",
        "abilityName": "EntryAbility",
        "action": "RegisterOnOffOn"
      }
      let wantAuxiliary = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangetworeply",
        "abilityName": "EntryAbility",
        "action": "Normal"
      }
      let subscriber
      function unSubscribeCallback() {
        console.debug("====>Acts_ApplicationStateChange_0700 unSubscribeCallback");
      }
      function subscribeCallBack(err, data) {
        console.debug("====>Acts_ApplicationStateChange_0700 data: " + JSON.stringify(data));
        console.debug("====>Acts_ApplicationStateChange_0700 err: " + JSON.stringify(err));
        if(data.event == "processState") {
          try{
            expect(data.parameters.commonStateArr[0]).assertEqual(1)
            expect(data.parameters.commonStateArr[1]).assertEqual(1)
            expect(data.parameters.commonStateArr[2]).assertEqual(-1)
            expect(data.parameters.commonStateArr[3]).assertEqual(-1)
          }
          catch(error) {
            console.log("An error is generated")
          }
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }
      setTimeout(() => {
        commonEvent.createSubscriber(ACTS_ProcessState).then((data) => {
          console.debug("====>Acts_ApplicationStateChange_0700 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          globalThis.abilityContext.startAbility(want, (error) => {
            console.log("ability error.code = " + error.code)
          })

          setTimeout(() => {
            globalThis.abilityContext.startAbility(wantAuxiliary, (error) => {
              console.log("auxiliary ability error.code = " + error.code)
            })
          },3000) 

        })
      },700)

        setTimeout(()=>{
          done();
        }, 18000);
    })
 

    it('Acts_ApplicationStateChange_0800', 0, async function (done) {
      let want = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangethreereply",
        "abilityName": "EntryAbility",
        "action": "DoubleAbilityTest"
      }
      let wantAuxiliary = {
        "deviceId": "",
        "bundleName": "com.example.applicationstatechangethreereply",
        "abilityName": "EntryAbility1",
        "action": "DoubleAbilityTest"
      }

      let subscriber

      function unSubscribeCallback() {
        console.debug("====>Acts_ApplicationStateChange_0800 unSubscribeCallback");
        done()
      }

      function subscribeCallBack(err, data) {
        console.debug("====>Acts_ApplicationStateChange_0800 data: " + JSON.stringify(data));
        console.debug("====>Acts_ApplicationStateChange_0800 err: " + JSON.stringify(err));
        if (data.event == "processState") {
          console.info("entered assert zone!")
          try {
            expect(data.parameters.commonStateArr).assertEqual(-1)
          }
          catch (error) {
            console.log("An error is generated")
          }
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      setTimeout(() => {
        commonEvent.createSubscriber(ACTS_ProcessState).then(async (data) => {
          console.debug("====>Acts_ApplicationStateChange_0800 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          globalThis.abilityContext.startAbility(want, (error) => {
            console.log("ability error.code = " + error.code)
          })
          setTimeout(() => {
            globalThis.abilityContext.startAbility(wantAuxiliary, (error) => {
              console.log("auxiliary ability error.code = " + error.code)
            })
          }, 3000)
        })
      }, 700)

    })

    it('Acts_GetRunningProcessInformation_AsyncCallback_0100', 0, async function (done) {
      let TAG = 'getRunningProcess'
      console.info("=====>Acts_GetRunningProcessInformation_AsyncCallback_0100 start<=====")
      let want = {
        "deviceId": "",
        "bundleName": "com.example.getrunningprocessinformationonereply",
        "abilityName": "EntryAbility",
        "action": "Callback"
      }
      let subscriber

      function unSubscribeCallback() {
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0100 unSubscribeCallback");
        done()
      }

      function subscribeCallBack(err, data) {
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0100 data: " + JSON.stringify(data));
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0100 err: " + JSON.stringify(err));
        if (data.event == "processState") {
          console.info("entered assert zone!")
          try {
            expect(data.parameters.commonStateArr[0]).assertEqual(2)
            console.info("this is array one")
            expect(data.parameters.commonStateArr[1]).assertEqual(1)
            console.info("this is array one")
            expect(data.parameters.commonStateArr[2]).assertEqual(3)
            console.info("this is array one")
            expect(data.parameters.commonStateArr[3]).assertEqual(-1)
            console.info("this is array one")
          }
          catch (error) {
            console.log("An error is generated")
          }
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      setTimeout(() => {
        commonEvent.createSubscriber(ACTS_ProcessState).then(async (data) => {
          console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0100 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          globalThis.abilityContext.startAbility(want, (error) => {
            console.log("start normal ability error.code = " + error.code)
          })

          setTimeout(async () => {
            let driver = Driver.create()
            await driver.delayMs(1500)
            let button1 = await driver.findComponent(ON.text('get focusedInfo'))
            await expect(button1 != null).assertTrue()
            let button2 = await driver.findComponent(ON.text('get unFocusedInfo'))
            await expect(button2 != null).assertTrue()
            let button3 = await driver.findComponent(ON.text('get BackInfo'))
            await expect(button3 != null).assertTrue()
            await button1.click()
            await driver.delayMs(2000)
            await button2.click()
            await driver.delayMs(4000)
            await driver.pressBack()
            await driver.delayMs(2000)
            await button3.click()
          }, 3000)
        })
      }, 1000)
    }) 

    it('Acts_GetRunningProcessInformation_Promise_0100', 0, async function (done) {
      let TAG = 'getRunningProcess'
      console.info("=====>Acts_GetRunningProcessInformation_AsyncCallback_0100 start<=====")
      let want = {
        "deviceId": "",
        "bundleName": "com.example.getrunningprocessinformationonereply",
        "abilityName": "EntryAbility",
        "action": "Promise"
      }
      let subscriber

      function unSubscribeCallback() {
        console.debug("====>Acts_GetRunningProcessInformation_Promise_0100 unSubscribeCallback");
        done()
      }

      function subscribeCallBack(err, data) {
        console.debug("====>Acts_GetRunningProcessInformation_Promise_0100 data: " + JSON.stringify(data));
        console.debug("====>Acts_GetRunningProcessInformation_Promise_0100 err: " + JSON.stringify(err));
        if (data.event == "processState") {
          console.info("entered assert zone!")
          try {
            expect(data.parameters.commonStateArr[0]).assertEqual(2)
            console.info("this is array one")
            expect(data.parameters.commonStateArr[1]).assertEqual(1)
            console.info("this is array one")
            expect(data.parameters.commonStateArr[2]).assertEqual(3)
            console.info("this is array one")
            expect(data.parameters.commonStateArr[3]).assertEqual(-1)
            console.info("this is array one")
          }
          catch (error) {
            console.log("An error is generated")
          }
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      setTimeout(() => {
        commonEvent.createSubscriber(ACTS_ProcessState).then(async (data) => {
          console.debug("====>Acts_GetRunningProcessInformation_Promise_0100 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          globalThis.abilityContext.startAbility(want, (error) => {
            console.log("start normal ability error.code = " + error.code)
          })

          setTimeout(async () => {
            let driver = Driver.create()
            await driver.delayMs(1500)
            let button1 = await driver.findComponent(ON.text('get focusedInfo'))
            await expect(button1 != null).assertTrue()
            let button2 = await driver.findComponent(ON.text('get unFocusedInfo'))
            await expect(button2 != null).assertTrue()
            let button3 = await driver.findComponent(ON.text('get BackInfo'))
            await expect(button3 != null).assertTrue()
            await button1.click()
            await driver.delayMs(2000)
            await button2.click()
            await driver.delayMs(4000)
            await driver.pressBack()
            await driver.delayMs(2000)
            await button3.click()
          }, 3000)
        })
      }, 1000)

    })

  })
}