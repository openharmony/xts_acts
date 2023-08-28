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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import commonEventManager from '@ohos.commonEventManager'
import router from '@ohos.router'
import Utils from './Utils'

export default function abilityTest() {
  describe('ACTS_UIExtension', function () {
    let TAG = "";
    let sleepTimeOne = 1000;
    let abilityContext = globalThis.abilityContext;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(function () {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async function (done) {
      console.info("ACTS_UIExtension beforeEach start");
      let options = {
        url: 'TestAbility/pages/p1',
      }
      let result;
      try {
        result = await router.pushUrl(options);
        await Utils.sleep(500);
        console.info("ACTS_UIExtension push page result: " + JSON.stringify(result));
      } catch (err) {
        console.error("ACTS_UIExtension push page error: " + err);
      }
      done()
    });
    afterEach(async function (done) {
      router.back()
      await Utils.sleep(500);
      done()
    })
    afterAll(function () {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    it('ACTS_UIExtension_TerminateSelfWithResult_001',0, async function (done) {
      TAG = 'ACTS_UIExtension_TerminateSelfWithResult_001 == ';
      console.log(TAG + "begin");

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let onResultEvent = 'ACTS_UIExtension_OnResult';
      let terminateSelfWithResultEvent = 'ACTS_UIExtension_TerminateSelfWithResult';

      var subscriber;
      var subscribeInfo = {
        events: [appearEvent, onResultEvent]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEventManager.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(terminateSelfWithResultEvent, (err) => {
              if (err) {
                console.log(TAG + `publish ACTS_UIExtension_TerminateSelfWithResult failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish ACTS_UIExtension_TerminateSelfWithResult success');
              }
            });
          } else if (data.event == onResultEvent) {
            let result = data.parameters.result;
            setTimeout(async () => {
              commonEventManager.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(result.want.bundleName).assertEqual('test');
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
    it('ACTS_UIExtension_UIExtensionSendData_001',0, async function (done) {
      TAG = 'ACTS_UIExtension_UIExtensionSendData_001 == ';
      console.log(TAG + "begin");

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let onReceiveEvent = 'ACTS_UIExtension_OnReceive';
      let sendDataEvent = 'ACTS_UIExtension_SendData';

      var subscriber;
      var subscribeInfo = {
        events: [appearEvent, onReceiveEvent]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEventManager.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(sendDataEvent, (err) => {
              if (err) {
                console.log(TAG + `publish ACTS_UIExtension_SendData failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish ACTS_UIExtension_SendData success');
              }
            });
          } else if (data.event == onReceiveEvent) {
            let result = data.parameters.result;
            let resultCheck = {
              name: {
                last: 'King'
              }
            };
            setTimeout(async () => {
              commonEventManager.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(result)).assertEqual(JSON.stringify(resultCheck));
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

    /*
     * @tc.number  : ACTS_UIExtension_StartAbility_001
     * @tc.name    : start new ability by UIContentSession
     * @tc.desc    : Starting mainability2 by UIContentSession with startability succeeded.(callback)
     */
    it('ACTS_UIExtension_StartAbility_001',0, async function (done) {
      TAG = 'ACTS_UIExtension_StartAbility_001 == ';
      console.log(TAG + "begin");

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let onResultEvent = 'ACTS_UIExtension_StartAbility_OnResult';
      let startAbilityEvent = 'ACTS_UIExtension_StartAbility_001';
      var flag = true

      function UnSubscribeCallback() {
        console.log(TAG + "UnSubscribeInfoCallback");
        flag = false;
        done();
      }

      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug(TAG + 'StartAbility_001 - timeout');
          commonEventManager.unsubscribe(subscriber, UnSubscribeCallback)
        }
      }

      var subscriber;
      var subscribeInfo = {
        events: [appearEvent, onResultEvent]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEventManager.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(startAbilityEvent, (err) => {
              if (err) {
                console.log(TAG + `publish ACTS_UIExtension_StartAbility_001 failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish ACTS_UIExtension_StartAbility_001 success');
              }
            });
          } else if (data.event == onResultEvent) {
            setTimeout(async () => {
              commonEventManager.unsubscribe(subscriber, UnSubscribeCallback);
            }, sleepTimeOne);
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      setTimeout(timeout, 5000);
    })

    /*
     * @tc.number  : ACTS_UIExtension_StartAbility_002
     * @tc.name    : start new ability by UIContentSession
     * @tc.desc    : Starting mainability2 by UIContentSession with the parameter startability with options succeeded.(callback)
     */
    it('ACTS_UIExtension_StartAbility_002',0, async function (done) {
      TAG = 'ACTS_UIExtension_StartAbility_002 == ';
      console.log(TAG + "begin");

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let onResultEvent = 'ACTS_UIExtension_StartAbility_OnResult';
      let startAbilityOpsEvent = 'ACTS_UIExtension_StartAbility_002';

      var flag = true

      function UnSubscribeCallback() {
        console.log(TAG + "UnSubscribeInfoCallback");
        flag = false;
        done();
      }

      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug(TAG + 'StartAbility_002 - timeout');
          commonEventManager.unsubscribe(subscriber, UnSubscribeCallback)
        }
      }

      var subscriber;
      var subscribeInfo = {
        events: [appearEvent, onResultEvent]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEventManager.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(startAbilityOpsEvent, (err) => {
              if (err) {
                console.log(TAG + `publish ACTS_UIExtension_StartAbility_002 failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish ACTS_UIExtension_StartAbility_002 success');
              }
            });
          } else if (data.event == onResultEvent) {
            setTimeout(async () => {
              commonEventManager.unsubscribe(subscriber, UnSubscribeCallback);
            }, sleepTimeOne);
          } 
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
      setTimeout(timeout, 5000);
    })

    /*
     * @tc.number  : ACTS_UIExtension_StartAbility_003
     * @tc.name    : start new ability by UIContentSession
     * @tc.desc    : Starting mainability2 by UIContentSession with startability succeeded.(promise)
     */
    it('ACTS_UIExtension_StartAbility_003',0, async function (done) {
      TAG = 'ACTS_UIExtension_StartAbility_003 == ';
      console.log(TAG + "begin");

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let onResultEvent = 'ACTS_UIExtension_StartAbility_OnResult';
      let startAbilityEventPromise = 'ACTS_UIExtension_StartAbility_003';

      var flag = true

      function UnSubscribeCallback() {
        console.log(TAG + "UnSubscribeInfoCallback");
        flag = false;
        done();
      }

      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug(TAG + 'StartAbility_003 - timeout');
          commonEventManager.unsubscribe(subscriber, UnSubscribeCallback)
        }
      }

      var subscriber;
      var subscribeInfo = {
        events: [appearEvent, onResultEvent]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEventManager.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(startAbilityEventPromise, (err) => {
              if (err) {
                console.log(TAG + `publish ACTS_UIExtension_StartAbility_003 failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish ACTS_UIExtension_StartAbility_003 success');
              }
            });
          } else if (data.event == onResultEvent) {
            setTimeout(async () => {
              commonEventManager.unsubscribe(subscriber, UnSubscribeCallback);
            }, sleepTimeOne);
          } 
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      setTimeout(timeout, 5000);
    })

    /*
     * @tc.number  : ACTS_UIExtension_StartAbility_004
     * @tc.name    : start new ability by UIContentSession
     * @tc.desc    : Starting mainability2 by UIContentSession with the parameter startability with options succeeded.(promise)
     */
    it('ACTS_UIExtension_StartAbility_004',0, async function (done) {
      TAG = 'ACTS_UIExtension_StartAbility_004 == ';
      console.log(TAG + "begin");

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let onResultEvent = 'ACTS_UIExtension_StartAbility_OnResult';
      let startAbilityOpsEventPromise = 'ACTS_UIExtension_StartAbility_004';

      var flag = true

      function UnSubscribeCallback() {
        console.log(TAG + "UnSubscribeInfoCallback");
        flag = false;
        done();
      }

      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug(TAG + 'StartAbility_004 - timeout');
          commonEventManager.unsubscribe(subscriber, UnSubscribeCallback)
        }
      }

      var subscriber;
      var subscribeInfo = {
        events: [appearEvent, onResultEvent]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEventManager.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(startAbilityOpsEventPromise, (err) => {
              if (err) {
                console.log(TAG + `publish ACTS_UIExtension_StartAbility_004 failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish ACTS_UIExtension_StartAbility_004 success');
              }
            });
          } else if (data.event == onResultEvent) {
            setTimeout(async () => {
              commonEventManager.unsubscribe(subscriber, UnSubscribeCallback);
            }, sleepTimeOne);
          } 
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
        })
        setTimeout(timeout, 5000);
    })

    /*
     * @tc.number  : ACTS_UIExtension_StartAbilityForResult_001
     * @tc.name    : start new ability for result by UIContentSession
     * @tc.desc    : Starting mainability3 by UIContentSession with startAbilityforresult succeeded.(callback)
     */
    it('ACTS_UIExtension_StartAbilityForResult_001',0, async function (done) {
      TAG = 'ACTS_UIExtension_StartAbilityForResult_001 == ';
      console.log(TAG + "begin");

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let onResultEvent = 'ACTS_UIExtension_StartAbilityForResult_001_OnResult';
      let startAbilityForResultEvent = 'ACTS_UIExtension_StartAbilityForResult_001';

      var flag = true

      function UnSubscribeCallback() {
        console.log(TAG + "UnSubscribeInfoCallback");
        flag = false;
        done();
      }

      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug(TAG + 'StartAbilityForResult_001 - timeout');
          commonEventManager.unsubscribe(subscriber, UnSubscribeCallback)
        }
      }

      var subscriber;
      var subscribeInfo = {
        events: [appearEvent, onResultEvent]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEventManager.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(startAbilityForResultEvent, (err) => {
              if (err) {
                console.log(TAG + `publish ACTS_UIExtension_StartAbilityForResult_001 failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish ACTS_UIExtension_StartAbilityForResult_001 success');
              }
            });
          }
          else if (data.event == onResultEvent) {
            setTimeout(async () => {
              commonEventManager.unsubscribe(subscriber, UnSubscribeCallback);
            }, sleepTimeOne);
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
      setTimeout(timeout, 5000);

    })

    /*
     * @tc.number  : ACTS_UIExtension_StartAbilityForResult_002
     * @tc.name    : start new ability for result by UIContentSession
     * @tc.desc    : Starting mainability3 by UIContentSession with the parameter startabilityforresult with options succeeded.(callback)
     */
    it('ACTS_UIExtension_StartAbilityForResult_002',0, async function (done) {
      TAG = 'ACTS_UIExtension_StartAbilityForResult_002 == ';
      console.log(TAG + "begin");

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let onResultEvent = 'ACTS_UIExtension_StartAbilityForResult_002_OnResult';
      let startAbilityForResultOpsEvent = 'ACTS_UIExtension_StartAbilityForResult_002';

      var flag = true

      function UnSubscribeCallback() {
        console.log(TAG + "UnSubscribeInfoCallback");
        flag = false;
        done();
      }

      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug(TAG + 'StartAbilityForResult_002 - timeout');
          commonEventManager.unsubscribe(subscriber, UnSubscribeCallback)
        }
      }

      var subscriber;
      var subscribeInfo = {
        events: [appearEvent, onResultEvent]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEventManager.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(startAbilityForResultOpsEvent, (err) => {
              if (err) {
                console.log(TAG + `publish ACTS_UIExtension_StartAbilityForResult_002 failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish ACTS_UIExtension_StartAbilityForResult_002 success');
              }
            });
          }
          else if (data.event == onResultEvent) {
            setTimeout(async () => {
              commonEventManager.unsubscribe(subscriber, UnSubscribeCallback);
            }, sleepTimeOne);
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
      setTimeout(timeout, 5000);
    })

    /*
     * @tc.number  : ACTS_UIExtension_StartAbilityForResult_003
     * @tc.name    : start new ability for result by UIContentSession
     * @tc.desc    : Starting mainability3 by UIContentSession with startabilityforresult succeeded.(promise)
     */
    it('ACTS_UIExtension_StartAbilityForResult_003',0, async function (done) {
      TAG = 'ACTS_UIExtension_StartAbilityForResult_003 == ';
      console.log(TAG + "begin");

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let onResultEvent = 'ACTS_UIExtension_StartAbilityForResult_003_OnResult';
      let startAbilityForResultEventPromise = 'ACTS_UIExtension_StartAbilityForResult_003';

      var flag = true

      function UnSubscribeCallback() {
        console.log(TAG + "UnSubscribeInfoCallback");
        flag = false;
        done();
      }

      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug(TAG + 'StartAbilityForResult_003 - timeout');
          commonEventManager.unsubscribe(subscriber, UnSubscribeCallback)
        }
      }

      var subscriber;
      var subscribeInfo = {
        events: [appearEvent, onResultEvent]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEventManager.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(startAbilityForResultEventPromise, (err) => {
              if (err) {
                console.log(TAG + `publish ACTS_UIExtension_StartAbilityForResult_003 failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish ACTS_UIExtension_StartAbilityForResult_003 success');
              }
            });
          }
          else if (data.event == onResultEvent) {
            setTimeout(async () => {
              commonEventManager.unsubscribe(subscriber, UnSubscribeCallback);
            }, sleepTimeOne);
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
      setTimeout(timeout, 5000);
    })

    /*
     * @tc.number  : ACTS_UIExtension_StartAbilityForResult_004
     * @tc.name    : start new ability for result by UIContentSession
     * @tc.desc    : Starting mainability2 by UIContentSession with the parameter startabilityforresult with options succeeded.(promise)
     */
    it('ACTS_UIExtension_StartAbilityForResult_004',0, async function (done) {
      TAG = 'ACTS_UIExtension_StartAbilityForResult_004 == ';
      console.log(TAG + "begin");

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let onResultEvent = 'ACTS_UIExtension_StartAbilityForResult_004_OnResult';
      let startAbilityForResultOpsEventPromise = 'ACTS_UIExtension_StartAbilityForResult_004';

      var flag = true

      function UnSubscribeCallback() {
        console.log(TAG + "UnSubscribeInfoCallback");
        flag = false;
        done();
      }

      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug(TAG + 'StartAbilityForResult_004 - timeout');
          commonEventManager.unsubscribe(subscriber, UnSubscribeCallback)
        }
      }

      var subscriber;
      var subscribeInfo = {
        events: [appearEvent, onResultEvent]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEventManager.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(startAbilityForResultOpsEventPromise, (err) => {
              if (err) {
                console.log(TAG + `publish ACTS_UIExtension_StartAbilityForResult_004 failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish ACTS_UIExtension_StartAbilityForResult_004 success');
              }
            });
          }
          else if (data.event == onResultEvent) {
            setTimeout(async () => {
              commonEventManager.unsubscribe(subscriber, UnSubscribeCallback);
            }, sleepTimeOne);
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
      setTimeout(timeout, 5000);
    })
  })
}