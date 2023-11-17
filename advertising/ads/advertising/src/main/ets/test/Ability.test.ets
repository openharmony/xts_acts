import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import commonEventManager from '@ohos.commonEventManager'
import router from '@ohos.router'
import Utils from './Utils'

export default function abilityTest() {
  describe('ACTS_Component', function () {
    let TAG = "";
    let sleepTimeOne = 1000;
    let subscriber = void 0;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(function () {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(function () {

    })
    afterEach(async function (done) {
      router.back();
      await Utils.sleep(500);
      done();
    })
    afterAll(function () {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    it('ACTS_AdComponent_AdComponentReceiveData_001',0, async function (done) {
      TAG = 'ACTS_AdComponent_AdComponentReceiveData_001 == ';
      try {
        await router.pushUrl({
          url: 'MainAbility/pages/index/p1',
        });
        await Utils.sleep(500);
        console.info(TAG + "push page success");
      } catch (err) {
        console.error(TAG + `push page error code: ${err.code}, msg: ${err.message}`);
      }
      const onListenerEvent = 'ACTS_AdComponent_OnListener';
      const subscribeInfo = {
        events: [onListenerEvent]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        // 订阅公共事件回调
        if (!subscriber) {
          console.log(TAG + `need create subscriber`);
          return;
        }

        console.log(TAG + `start subscriber`);
        commonEventManager.subscribe(subscriber, async (err, data) => {
          if (err) {
            console.error(`subscribe failed, code is ${err.code}, message is ${err.message}`);
          }
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == onListenerEvent) {
            const result = data.parameters.result;
            const resultCheck = 'AdsTest';
            setTimeout(async () => {
              commonEventManager.unsubscribe(subscriber, async (err) => {
                console.log(TAG + "UnSubscribeInfoCallback : ");
                console.log(TAG + "result : " + JSON.stringify(result));
                console.log(TAG + "resultCheck : " + JSON.stringify(resultCheck));
                expect(result).assertEqual(resultCheck);
                done();
              });
            }, sleepTimeOne);
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })
    it('ACTS_AutoAdComponent_AutoAdComponentReceiveData_001',TestType.FUNCTION | Size.LARGETEST | Level.LEVEL0, async function (done) {
      TAG = 'ACTS_AutoAdComponent_AutoAdComponentReceiveData_001 == ';
      console.log(TAG + "begin");
      try {
        await router.pushUrl({
          url: 'MainAbility/pages/index/p2',
        });
        await Utils.sleep(500);
        console.info(TAG + "push page success");
      } catch (err) {
        console.error(TAG + `push page error code: ${err.code}, msg: ${err.message}`);
      }

      const onListenerEvent = 'ACTS_AutoAdComponent_OnListener';
      const subscribeInfo = {
        events: [onListenerEvent]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        // 订阅公共事件回调
        if (!subscriber) {
          console.log(TAG + `need create subscriber`);
          return;
        }

        console.log(TAG + `start subscriber`);
        commonEventManager.subscribe(subscriber, async (err, data) => {
          if (err) {
            console.error(`subscribe failed, code is ${err.code}, message is ${err.message}`);
          }
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == onListenerEvent) {
            const result = data.parameters.result;
            const resultCheck = 'AdsTest';
            setTimeout(async () => {
              commonEventManager.unsubscribe(subscriber, async (err) => {
                console.log(TAG + "UnSubscribeInfoCallback : ");
                console.log(TAG + "result : " + JSON.stringify(result));
                console.log(TAG + "resultCheck : " + JSON.stringify(resultCheck));
                expect(result).assertEqual(resultCheck);
                done();
              });
            }, sleepTimeOne);
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })
  })
}