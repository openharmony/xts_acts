/*
* Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import commonEvent from '@ohos.commonEventManager';
import { BusinessError, Callback } from '@ohos.base';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { getContext } from '../common/getContext';

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
let ACTS_CallFunction: commonEvent.CommonEventSubscribeInfo = {
  events: ['0100', '0200', '0300', '0400', '0500', '0600', '0700', '0800', '0900', '1000', '1100', '1200', '1300']
};

function sleep(time: number): Promise<number> {
  return new Promise((resolve) => setTimeout(resolve, time));
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    it('ACTS_UIExtensionAbility_StartAbilityForResultAsCaller_0100', 0, async (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>StartAbilityForResultAsCaller_0100 createSubscriber  ${data}`)
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascaller',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0100'
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 0100 startAbility err:' + JSON.stringify(err));
        });
      });
      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0100 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0100 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0100') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 0100 subscribeCallBack ${data}`)
          expect(data.code).assertEqual(0);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_0100 unSubscribeCallback`);
        clearTimeout(clear);
        done();
      };
    })

    it('ACTS_UIExtensionAbility_StartAbilityForResultAsCaller_0200', 0, async (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascaller',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0200'
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 0200 startAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0200 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0200 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0200') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 0200 subscribeCallBack  ${data}`)
          expect(data.code).assertEqual(0);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0200 unSubscribeCallback`);
        clearTimeout(clear);
        await globalThis.terminate('0200');
        done();
      };
    })

    it('ACTS_UIExtensionAbility_StartAbilityForResultAsCaller_0300', 0, async (done: Function) => {
      await sleep(2000);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascaller',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0300'
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 0300 startAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0300 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0300 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0300') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 0300 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`)
          expect(data.parameters?.result).assertEqual(0);
          expect(data.parameters?.str).assertEqual('ACTION');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0300 unSubscribeCallback`);
        clearTimeout(clear);
        done();
      };
    })

    it('ACTS_UIExtensionAbility_StartAbilityForResultAsCaller_0400', 0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascaller',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0400'
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 0400 startAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0400 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0400 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0400') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 0400 subscribeCallBack  ${data}`)
          expect(data.parameters?.result).assertEqual(401);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0400 unSubscribeCallback`);
        clearTimeout(clear);
        await globalThis.terminate('0400');
        done();
      };
    })

    it('ACTS_UIExtensionAbility_StartAbilityForResultAsCaller_0500', 0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascallerother',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0500'
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 0500 startAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0500 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0500 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0500') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 0500 subscribeCallBack` + JSON.stringify(data))
          expect(data.parameters?.result).assertEqual(202);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0500 unSubscribeCallback 'ACTS_CALL_EVENT'`);
        clearTimeout(clear);
        await sleep(1000);
        done();
      };
    })

    it('ACTS_UIExtensionAbility_StartAbilityForResultAsCaller_0600', 0, async (done: Function) => {
      await sleep(1000);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascaller',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0600'
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 0600 startAbility err:' + JSON.stringify(err));
        });
      })

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0600 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0600 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0600') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 0600 subscribeCallBack` + JSON.stringify(data))
          expect(data.parameters?.result).assertEqual(0);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0600 unSubscribeCallback`);
        clearTimeout(clear);
        await globalThis.terminate('0600');
        done();
      };
    })

    it('ACTS_UIExtensionAbility_StartAbilityForResultAsCaller_0700', 0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);

        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascallerbackground',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0700'
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 0700 startAbility err:' + JSON.stringify(err));
        });

        await sleep(2000);
        console.info('====>[UIExtensionForResultAsCallerTest] 0700 after sleep ');
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascallerother',
          abilityName: 'CalledAbility',
          action: 'StartAbilityForResultAsCaller_0700'
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 0700 start otherAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0700 setTimeout`);
        expect().assertFail();
        done();
      }, 100000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0700 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0700') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 0700 subscribeCallBack` + JSON.stringify(data))
          expect(data.parameters?.result).assertEqual(201);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
        ;
      };

      let unSubscribeCallback = () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0700 unSubscribeCallback`);
        clearTimeout(clear);
        done();
      };
    })

    it('ACTS_UIExtensionAbility_StartAbilityForResultAsCaller_0800', 0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);

        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascaller',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0800'
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 0800 startAbility err:' + JSON.stringify(err));
        });

        await sleep(2000);
        console.info('====>[UIExtensionForResultAsCallerTest] 0800 after sleep ');
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascallerother',
          abilityName: 'CalledAbility',
          action: 'StartAbilityForResultAsCaller_0800'
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 0800 start otherAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0800 setTimeout`);
        expect().assertFail();
        done();
      }, 100000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0800 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0800') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 0800 subscribeCallBack` + JSON.stringify(data))
          expect(data.code).assertEqual(0);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0800 unSubscribeCallback 'ACTS_CALL_EVENT'`);
        clearTimeout(clear);
        await globalThis.terminate('0800');
        done();
      };
    })

    it('ACTS_UIExtensionAbility_StartAbilityForResultAsCaller_0900', 0, async (done: Function) => {
      await sleep(1000);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);

        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascaller',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0900'
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 0900 startAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0900 setTimeout`);
        expect().assertFail();
        done();
      }, 100000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0900 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0900') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 0900 subscribeCallBack` + JSON.stringify(data))
          expect(data.parameters?.str).assertEqual('com.example.uiextensionforresultascaller');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0900 unSubscribeCallback 'ACTS_CALL_EVENT'`);
        clearTimeout(clear);
        await globalThis.terminate('0900');
        await sleep(1000);
        done();
      };
    })

    // it('ACTS_UIExtensionAbility_StartAbilityForResultAsCaller_1000',0, async (done: Function) => {
    //   await sleep(500);
    //   let subscriber: commonEvent.CommonEventSubscriber;
    //   commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
    //     subscriber = data;
    //     commonEvent.subscribe(data, subscribeCallBack);
    //
    //
    //     getContext().startAbilityByType("share", {}, {
    //       onError: (code: number, name: string, message: string) => {
    //         console.info(`====>  code:${code} name:${name} message:${message}`);
    //       }
    //     }, (err: BusinessError) => {
    //       console.info(`====>  startAbilityByType fail, err:${JSON.stringify(err)}`);
    //     })
    //
    //   })
    //
    //   let clear = setTimeout(() => {
    //     console.info(`====>[UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_1000 setTimeout`);
    //     expect().assertFail();
    //     done();
    //   }, 100000)
    //
    //   let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
    //     console.info(`====>[UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_1000 subscribeCallBack ACTS_CallFunction  ${data}`);
    //     if(data.event == '1000') {
    //       console.info(`====>[UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_1000 subscribeCallBack 'ACTS_CALL_EVENT'` + JSON.stringify(data))
    //       expect(data.parameters?.str).assertEqual('com.example.uiextensionforresultascaller');
    //       commonEvent.unsubscribe(subscriber, unSubscribeCallback);
    //     }
    //   }
    //
    //   let unSubscribeCallback = () => {
    //     console.info(`====>[UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_1000 unSubscribeCallback 'ACTS_CALL_EVENT'`);
    //     clearTimeout(clear);
    //     done();
    //   }
    // })

    it('ACTS_UIExtensionAbility_StartAbilityForResultAsCaller_1100', 0, async (done: Function) => {
      await sleep(2000);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascaller',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_1100'
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 1100 startAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1100 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1100 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '1100') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 1100 subscribeCallBack  ${data}`)
          expect(data.parameters?.result).assertEqual(16000001);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1100 unSubscribeCallback`);
        clearTimeout(clear);
        done();
      };
    })

    it('ACTS_UIExtensionAbility_StartAbilityForResultAsCaller_1200', 0, async (done: Function) => {
      await sleep(1000);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascallerbackground',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_1200'
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 1200 startAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1200 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1200 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '1200') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 1200 subscribeCallBack  ${data}`);
          expect(data.parameters?.result).assertEqual(16000004);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1200 unSubscribeCallback 'ACTS_CALL_EVENT'`);
        clearTimeout(clear);
        done();
      };
    })

    it('ACTS_UIExtensionAbility_StartAbilityForResultAsCaller_1300', 0, async (done: Function) => {
      await sleep(2000);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascaller',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_1300'
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 1300 startAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1300 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1300 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '1300') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 1300 subscribeCallBack  ${data}`)
          expect(data.parameters?.result).assertEqual(16000050);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1300 unSubscribeCallback`);
        clearTimeout(clear);
        done();
      };
    })
  })
}