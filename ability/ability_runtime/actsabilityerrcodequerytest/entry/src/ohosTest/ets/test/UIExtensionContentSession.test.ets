/**
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { commonEventManager } from '@kit.BasicServicesKit';
import base from '@ohos.base';
import { common, Want } from '@kit.AbilityKit';
import { router } from '@kit.ArkUI';
import { Driver, ON, Component } from '@kit.TestKit';

let ACTS_EVENT: commonEventManager.CommonEventSubscribeInfo = {
  events: ['ACTS_TEST_LOADCONTENT',
    'ACTS_TEST_IN_USER',
    'ACTS_TEST_IN_PROVIDER',
    'ACTS_TEST_TERMINATE',
    'ACTS_TEST_DESTROY']
};
let subscriber: commonEventManager.CommonEventSubscriber;
let context = getContext(this) as common.UIAbilityContext;

function publishCB(err: BusinessError) {
  if (err) {
    console.error(`Failed to publish common event. Code is ${err.code}, message is ${err.message}`);
  } else {
    console.info('====>publish ACTS_TEST_OPENSESSION');
    console.info(`Succeeded in publishing common event.`);
  }
}

class MyRouterParam {
  constructor(from: string) {
    this.fromPage = from;
  }
  fromPage: string = "";
}

let link = ''
let abilityName:string = 'UIExtensionContentSession01'
let want: Want = {
  uri: link,
  parameters: {
    appLinkingOnly: false,
    demo_num: 111
  }
}

export default function UIExtensionContentSessionTest() {
  describe('UIExtensionContentSessionTest', () => {

    let params: string = 'UIExtensionContentSessionTest';

    beforeAll(() => {
      context = globalThis.context
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /*
     * @tc.number : Sub_UIExtensionContentSession_errorCode_0100
     * @tc.name   : session.loadContent
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 3
     */
    it('Sub_UIExtensionContentSession_errorCode_0100', 0, (done:Function) => {
      let tag:string = `Sub_UIExtensionContentSession_errorCode_0100`;
      abilityName = 'UIExtensionContentSession01'
      params = 'Sub_UIExtensionContentSession_errorCode_0100'
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = async (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("subscribeCallBack success")
            if (data.event == 'ACTS_TEST_DESTROY') {
              console.log("subscribeCallBack ACTS_TEST_DESTROY")
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(async () => {
            try {
              router.pushUrl({
                url: 'testability/pages/UIExtensionContentSession/UIExtensionPage01',
                params: new MyRouterParam(params)
              });
              console.info(tag, 'push page UIExtensionPage01 success');
            } catch (err) {
              console.info(tag, 'push page err,err is :',err);
            }
          }, 2000);
        })
    })

    /*
     * @tc.number : Sub_UIExtensionContentSession_errorCode_0200
     * @tc.name   : session.loadContentByName
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 3
     */
    it('Sub_UIExtensionContentSession_errorCode_0200', 0, (done:Function) => {
      let tag:string = `Sub_UIExtensionContentSession_errorCode_0200`;
      abilityName = 'UIExtensionContentSession02'
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = async (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("subscribeCallBack success")
            if (data.event == 'ACTS_TEST_DESTROY') {
              console.log("subscribeCallBack ACTS_TEST_DESTROY")
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(async () => {
            try {
              router.pushUrl({
                url: 'testability/pages/UIExtensionContentSession/UIExtensionPage02',
              });
              console.info(tag, 'push page UIExtensionPage02 success');
            } catch (err) {
              console.info(tag, 'push page err,err is :',err);
            }
          }, 2000);
        })
    })

    /*
     * @tc.number : Sub_UIExtensionContentSession_errorCode_0300
     * @tc.name   : session.terminateSelfWithResult callback
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 3
     */
    it('Sub_UIExtensionContentSession_errorCode_0300', 0, (done:Function) => {
      let tag:string = `Sub_UIExtensionContentSession_errorCode_0300`;
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = async (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("subscribeCallBack success")
            if (data.event == 'ACTS_TEST_DESTROY') {
              console.log("subscribeCallBack ACTS_TEST_DESTROY")
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(async () => {
            try {
              router.pushUrl({
                url: 'testability/pages/UIExtensionContentSession/UIExtensionPage03',
              });
              console.info(tag, 'push page UIExtensionPage02 success');
            } catch (err) {
              console.info(tag, 'push page err,err is :',err);
            }
          }, 2000);
        })
    })

    /*
     * @tc.number : Sub_UIExtensionContentSession_errorCode_0400
     * @tc.name   : session.terminateSelfWithResult promise
     * @tc.desc   : Function test
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 3
     */
    it('Sub_UIExtensionContentSession_errorCode_0400', 0, (done:Function) => {
      let tag:string = `Sub_UIExtensionContentSession_errorCode_0400`;
      params = 'Sub_UIExtensionContentSession_errorCode_0400'
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              console.info(`====>${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = async (err: base.BusinessError, data: commonEventManager.CommonEventData) => {
            console.log("subscribeCallBack success")
            if (data.event == 'ACTS_TEST_DESTROY') {
              console.log("subscribeCallBack ACTS_TEST_DESTROY")
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(async () => {
            try {
              router.pushUrl({
                url: 'testability/pages/UIExtensionContentSession/UIExtensionPage03',
                params: new MyRouterParam(params)
              });
              console.info(tag, 'push page UIExtensionPage02 success');
            } catch (err) {
              console.info(tag, 'push page err,err is :',err);
            }
          }, 2000);
        })
    })
  })
}