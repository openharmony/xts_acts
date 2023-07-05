import hilog from '@ohos.hilog'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
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
      let cmd4 = 'aa force-stop com.example.getrunningprocessinformationonereply'
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
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 unSubscribeCallback");
      }
      function subscribeCallBack(err, data) {
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 data: " + JSON.stringify(data));
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 err: " + JSON.stringify(err));
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
          console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0100 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          globalThis.abilityContext.startAbility(want, (error) => {
            console.log("ability error.code = " + error.code)
          })

          setTimeout(() => {
            globalThis.abilityContext.startAbility(wantAuxiliary, (error) => {
              console.log("auxiliary ability error.code = " + error.code)
            })
          },2500) 

        })
      },500)

        setTimeout(()=>{
          done();
        }, 14000);
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
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 unSubscribeCallback");
      }
      function subscribeCallBack(err, data) {
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 data: " + JSON.stringify(data));
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 err: " + JSON.stringify(err));
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
          console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          globalThis.abilityContext.startAbility(want, (error) => {
            console.log("ability error.code = " + error.code)
          })

          setTimeout(() => {
            globalThis.abilityContext.startAbility(wantAuxiliary, (error) => {
              console.log("auxiliary ability error.code = " + error.code)
            })
          },2500)
        })
      },500)

      setTimeout(()=>{
        done();
      }, 14000);
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
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 unSubscribeCallback");
      }
      function subscribeCallBack(err, data) {
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 data: " + JSON.stringify(data));
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 err: " + JSON.stringify(err));
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
          console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0300 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          globalThis.abilityContext.startAbility(want, (error) => {
            console.log("ability error.code = " + error.code)
          })
          setTimeout(() => {
            globalThis.abilityContext.startAbility(wantAuxiliary, (error) => {
              console.log("auxiliary ability error.code = " + error.code)
            })
          },2500)
        })
      },500)

      setTimeout(()=>{
        done();
      }, 14000);

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
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 unSubscribeCallback");
      }
      function subscribeCallBack(err, data) {
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 data: " + JSON.stringify(data));
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 err: " + JSON.stringify(err));
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
          console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          globalThis.abilityContext.startAbility(want, (error) => {
            console.log("ability error.code = " + error.code)
          })
          setTimeout(() => {
            globalThis.abilityContext.startAbility(wantAuxiliary, (error) => {
              console.log("auxiliary ability error.code = " + error.code)
            })
          },2500)
        })
      },500)

      setTimeout(()=>{
        done();
      }, 14000);
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
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 unSubscribeCallback");
      }
      function subscribeCallBack(err, data) {
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 data: " + JSON.stringify(data));
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 err: " + JSON.stringify(err));
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
          console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          globalThis.abilityContext.startAbility(want, (error) => {
            console.log("ability error.code = " + error.code)
          })
          setTimeout(() => {
            globalThis.abilityContext.startAbility(wantAuxiliary, (error) => {
              console.log("auxiliary ability error.code = " + error.code)
            })
          },2500)
        })
      },500)

      setTimeout(()=>{
        done();
      }, 14000);
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
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 unSubscribeCallback");
      }
      function subscribeCallBack(err, data) {
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 data: " + JSON.stringify(data));
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 err: " + JSON.stringify(err));
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
          console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          globalThis.abilityContext.startAbility(want, (error) => {
            console.log("ability error.code = " + error.code)
          })
          setTimeout(() => {
            globalThis.abilityContext.startAbility(wantAuxiliary, (error) => {
              console.log("auxiliary ability error.code = " + error.code)
            })
          },2500)
        })
      },500)

      setTimeout(()=>{
        done();
      }, 14000);

    })
    it('Acts_GetRunningProcessInformation_AsyncCallback_0200',0, function (done) {

      console.info("=====>Acts_GetRunningProcessInformation_AsyncCallback_0200 start<=====")
      let want = {
        "deviceId": "",
        "bundleName": "com.example.getrunningprocessinformationonereply",
        "abilityName": "EntryAbility",
        "action": "Callback"
      }
      let subscriber
      function unSubscribeCallback() {
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 unSubscribeCallback");
      }
      function subscribeCallBack(err, data) {
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 data: " + JSON.stringify(data));
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 err: " + JSON.stringify(err));
        if(data.event == "processState") {
          try{
            expect(data.parameters.commonStateArr[0]).assertEqual(2||1)
            expect(data.parameters.commonStateArr[1]).assertEqual(2||1)
            expect(data.parameters.commonStateArr[2]).assertEqual(2||1)
            expect(data.parameters.commonStateArr[3]).assertEqual(3)
            expect(data.parameters.commonStateArr[4]).assertEqual(3)
            expect(data.parameters.commonStateArr[5]).assertEqual(3)
          }
          catch(error) {
            console.log("An error is generated")
          }
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }
      setTimeout(() => {
        commonEvent.createSubscriber(ACTS_ProcessState).then(async (data) => {
          console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          await globalThis.abilityContext.startAbility(want, (error) => {
            console.log("ability error.code = " + error.code)
          })
        })
      },500)

      setTimeout(()=>{
        done();
      }, 14000);

    })

    it('Acts_GetRunningProcessInformation_Promise_0200',0, function (done) {
      console.info("=====>Acts_GetRunningProcessInformation_AsyncCallback_0200 start<=====")
      let want = {
        "deviceId": "",
        "bundleName": "com.example.getrunningprocessinformationonereply",
        "abilityName": "EntryAbility",
        "action": "Promise"
      }
      let subscriber
      function unSubscribeCallback() {
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 unSubscribeCallback");
      }
      function subscribeCallBack(err, data) {
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 data: " + JSON.stringify(data));
        console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 err: " + JSON.stringify(err));
        if(data.event == "processState") {
          try{
            expect(data.parameters.commonStateArr[0]).assertEqual(2||1)
            expect(data.parameters.commonStateArr[1]).assertEqual(2||1)
            expect(data.parameters.commonStateArr[2]).assertEqual(2||1)
            expect(data.parameters.commonStateArr[3]).assertEqual(3)
            expect(data.parameters.commonStateArr[4]).assertEqual(3)
            expect(data.parameters.commonStateArr[5]).assertEqual(3)
          }
          catch(error) {
            console.log("An error is generated")
          }
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }
      setTimeout(() => {
        commonEvent.createSubscriber(ACTS_ProcessState).then(async (data) => {
          console.debug("====>Acts_GetRunningProcessInformation_AsyncCallback_0200 Create Subscribe");
          subscriber = data;
          commonEvent.subscribe(subscriber, subscribeCallBack);

          await globalThis.abilityContext.startAbility(want, (error) => {
            console.log("ability error.code = " + error.code)
          })
        })
      },500)

      setTimeout(()=>{
        done();
      }, 14000);

    }) 


  })
}