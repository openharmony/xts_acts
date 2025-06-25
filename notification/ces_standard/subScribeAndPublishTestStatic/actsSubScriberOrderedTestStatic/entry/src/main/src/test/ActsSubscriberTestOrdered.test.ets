/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import commonEventManager from '@ohos.commonEventManager'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '../../../hypium/index'
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { Component, Driver, ON, loadAndSetUpUiTest } from '@ohos.UiTest'
let bundle_name:string = "com.example.actssubscribertestorder.static"
let domain: number = 0x0000;
let testAbilityContext:common.UIAbilityContext;
let TAG:string = 'SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST ===>'

let publishCallback=(err:BusinessError) =>{
  console.info('===============>publishCallback');
}

let unsubscribeCallback=(err:BusinessError) =>{
  console.info('===============>unsubscribeCallback');
}

export default function ActsSubscriberTestOrder() {
  describe('SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST',  () => {
    console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST START`)
    beforeAll(() => {
      hilog.info(domain, TAG, '%{public}s', 'beforeAll start');
      loadAndSetUpUiTest();
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          hilog.info(domain, TAG, '%{public}s', 'onAbilityCreate end');

        },
      }, (err : BusinessError) : void => {
        if (err != null ) {
          hilog.info(domain, TAG, '%{public}s', '-----'+ err.code);
        }
        hilog.info(domain, TAG, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b " + bundle_name )
      await Utils.msSleep(2000)
      hilog.info(domain, TAG, '%{public}s', 'beforeAll end');
    })

    /*
     * @tc.number    : Sub_Notification_Ces_Subscriber_Unsubscribe_Static_2100
     * @tc.name      : Sub_Notification_Ces_Subscriber_Unsubscribe_Static_2100
     * @tc.desc      : Check the subscriber can receive event "publish_event0200" type of the interface (by Promise)
     */
    //问题单号：DTS2025061412066
    it ('Sub_Notification_Ces_Subscriber_Unsubscribe_Static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ces_Subscriber_Unsubscribe_Static_2100'
      console.info(`${TAG} Sub_Notification_Ces_Subscriber_Unsubscribe_Static_2100 START`)

      let commonEventSubscribeInfo1:commonEventManager.CommonEventSubscribeInfo = {
        events:new Array<string>('publish_event0200', 'publish_event0201'),
        priority: 10
      };

      let commonEventSubscribeInfo2:commonEventManager.CommonEventSubscribeInfo = {
        events:new Array<string>('publish_event0201'),
        priority: 9
      };

      let commonEventPublishData1:commonEventManager.CommonEventPublishData = {
        code: 1,
        data: 'publish_event0200_init',
        isOrdered: false,
      }

      let commonEventPublishData2:commonEventManager.CommonEventPublishData = {
        code: 1,
        data: 'publish_event0201_init',
        isOrdered: true,
      }

      let subscriberCallBack0200=(err:BusinessError, data: commonEventManager.CommonEventData)=> {
        console.info(TAG+'===============>subscriberCallBack0200========event: ' + data.event);
        console.info(TAG+'===============>subscriberCallBack0200=========code: ' + data.code);
        console.info(TAG+'===============>subscriberCallBack0200=========data: ' + data.data);
        console.info(TAG+'===============>subscriberCallBack0200=========num2: ' + num2);
        if (num2 == 0) {
          num2++;
          expect(data.event).assertEqual('publish_event0200');
          console.info(TAG+'===============>subscriberCallBack0200=====num2:0====code: ' + data.code);
          expect(data.code).assertEqual(1);
          expect(data.data).assertEqual('publish_event0200_init');
        }else {
          num2 = 0;
          expect(data.event).assertEqual('publish_event0201');
          console.info(TAG+'===============>subscriberCallBack0200=====num2:1====code: ' + data.code);
          expect(data.code).assertEqual(1);
          expect(data.data).assertEqual('publish_event0201_init');
        }
      }

      let subscriberCallBack0201=(err:BusinessError, data: commonEventManager.CommonEventData)=> {
        console.info(TAG+'===============>subscriberCallBack0201========event: ' + data.event);
        console.info(TAG+'===============>subscriberCallBack0201=========code=: ' + data.code);
        console.info(TAG+'===============>subscriberCallBack0201=========data: ' + data.data);

        expect(data.event).assertEqual('publish_event0201');
        console.info(TAG+'===============>subscriberCallBack0201=========code: ' + data.code);
        expect(data.code).assertEqual(1);
        expect(data.data).assertEqual('publish_event0201_init');
      }

      commonEventManager.createSubscriber(
        commonEventSubscribeInfo1,
      ).then((data: commonEventManager.CommonEventSubscriber)=>{
        console.info(TAG+'===============ActsSubscriberTestOrder_0200==========createSubscriber promise1');
      })

      commonEventManager.createSubscriber(
        commonEventSubscribeInfo2,
      ).then((data: commonEventManager.CommonEventSubscriber)=>{
        console.info(TAG+'===============ActsSubscriberTestOrder_0200==========createSubscriber promise2');
      })
      console.info(`${TAG} Sub_Notification_Ces_Subscriber_Unsubscribe_Static_2100 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ces_Subscriber_Subscribe_Static_1000
     * @tc.name      : Sub_Notification_Ces_Subscriber_Subscribe_Static_1000
     * @tc.desc      : Check the subscriber can receive event "publish_event0301" type of the interface (by Promise)
     */
    //问题单号：DTS2025061412066
    it ('Sub_Notification_Ces_Subscriber_Subscribe_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ces_Subscriber_Subscribe_Static_1000'
      console.info(`${TAG} Sub_Notification_Ces_Subscriber_Subscribe_Static_1000 START`)

      let commonEventSubscribeInfo1:commonEventManager.CommonEventSubscribeInfo = {
        events:new Array<string>('publish_event0301'),
        priority: 9
      };

      let commonEventSubscribeInfo2:commonEventManager.CommonEventSubscribeInfo = {
        events:new Array<string>('publish_event0301'),
        priority: 10
      };

      let commonEventPublishData2:commonEventManager.CommonEventPublishData = {
        code: 1,
        data: 'publish_event0301_init',
        isOrdered: true,
      }

      let callBackNum:number = 0;
      let subscriberCallBack0300=(err:BusinessError, data: commonEventManager.CommonEventData)=> {
        console.info(TAG+'===============>subscriberCallBack0300========event: ' + data.event);
        console.info(TAG+'===============>subscriberCallBack0300=========code: ' + data.code);
        console.info(TAG+'===============>subscriberCallBack0300=========dat: ' + data.data);
        console.info(TAG+'===============>subscriberCallBack0300=========order: ' + order);

        expect(data.event).assertEqual('publish_event0301');
        expect(data.code).assertEqual(1);
        expect(data.data).assertEqual('publish_event0301_init');
        expect(order).assertEqual(true);
        callBackNum++;
        if (callBackNum == 3) {
          done();
        }
      }

      let subscriberCallBack0301=(err:BusinessError, data: commonEventManager.CommonEventData)=> {
        console.info(TAG+'===============>subscriberCallBack0301========event: ' + data.event);
        console.info(TAG+'===============>subscriberCallBack0301=========code: ' + data.code);
        console.info(TAG+'===============>subscriberCallBack0301=========data: ' + data.data);
        console.info(TAG+'===============>subscriberCallBack0301=========order: ' + order);

        expect(data.event).assertEqual('publish_event0301');
        expect(data.code).assertEqual(1);
        expect(data.data).assertEqual('publish_event0301_init');

      }

      commonEventManager.createSubscriber(
        commonEventSubscribeInfo1,
      ).then((data:commonEventManager.CommonEventSubscriber)=>{
        console.info(TAG+'===============ActsSubscriberTestOrder_0300==========createSubscriber promise1');
      })

      commonEventManager.createSubscriber(
        commonEventSubscribeInfo2,
      ).then((data:commonEventManager.CommonEventSubscriber)=>{
        console.info(TAG+'===============ActsSubscriberTestOrder_0300==========createSubscriber promise2');
        commonEventSubscriber0301 = data;
      })
      console.info(`${TAG} Sub_Notification_Ces_Subscriber_Subscribe_Static_1000 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ces_Subscriber_Subscribe_Static_1100
     * @tc.name      : Sub_Notification_Ces_Subscriber_Subscribe_Static_1100
     * @tc.desc      : Check the subscriber can receive event "publish_eventOrder0400" type of the interface by promise
     */
    //问题单号：DTS2025061412066
    it ('Sub_Notification_Ces_Subscriber_Subscribe_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ces_Subscriber_Subscribe_Static_1100'
      console.info(`${TAG} Sub_Notification_Ces_Subscriber_Subscribe_Static_1100 START`)

      let commonEventSubscribeInfo1:commonEventManager.CommonEventSubscribeInfo = {
        events:new Array<string>('publish_eventOrder0400'),
        priority: 10
      };

      let commonEventSubscribeInfo2:commonEventManager.CommonEventSubscribeInfo = {
        events:new Array<string>('publish_eventOrder0400'),
        priority: 9
      };

      let commonEventPublishData:commonEventManager.CommonEventPublishData = {
        code: 1,
        data: 'publish_event0400_init',
        isOrdered: true,
      }

      let subscriberCallBack0400=(err:BusinessError, data: commonEventManager.CommonEventData)=> {
        console.info(TAG+'===============>subscriberCallBack0400========event: ' + data.event);
        console.info(TAG+'===============>subscriberCallBack0400========bundleName: ' + data.bundleName);
        console.info(TAG+'===============>subscriberCallBack0400=========code: ' + data.code);
        console.info(TAG+'===============>subscriberCallBack0400=========data: ' + data.data);
        expect(data.event).assertEqual('publish_eventOrder0400');
        expect(data.code).assertEqual(1);
        expect(data.data).assertEqual('publish_event0400_init');
      }

      let subscriberCallBack0401=(err:BusinessError, data: commonEventManager.CommonEventData)=> {
        console.info(TAG+'===============>subscriberCallBack0401========event: ' + data.event);
        expect().assertFail();
      }

      commonEventManager.createSubscriber(
        commonEventSubscribeInfo1
      ).then((data:commonEventManager.CommonEventSubscriber)=>{
        console.info(TAG+'===============ActsSubscriberTestOrder_0400==========createSubscriber promise1');
      })

      commonEventManager.createSubscriber(
        commonEventSubscribeInfo2
      ).then((data:commonEventManager.CommonEventSubscriber)=>{
        console.info(TAG+'===============ActsSubscriberTestOrder_0400==========createSubscriber promise2');
        commonEventSubscriber0401 = data;
      })
      console.info(`${TAG} Sub_Notification_Ces_Subscriber_Subscribe_Static_1100 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ces_Subscriber_Subscribe_Static_1200
     * @tc.name      : Sub_Notification_Ces_Subscriber_Subscribe_Static_1200
     * @tc.desc      : Check the subscriber can receive event "publish_event0500" type of the interface (by promise)
     */
    //问题单号：DTS2025061412066
    it ('Sub_Notification_Ces_Subscriber_Subscribe_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ces_Subscriber_Subscribe_Static_1200'
      console.info(`${TAG} Sub_Notification_Ces_Subscriber_Subscribe_Static_1200 START`)

      let commonEventSubscribeInfo1:commonEventManager.CommonEventSubscribeInfo = {
        events:new Array<string>('publish_event0500'),
        priority: 1001
      };

      let commonEventSubscribeInfo2:commonEventManager.CommonEventSubscribeInfo = {
        events:new Array<string>('publish_event0500'),
        priority: -101
      };

      let commonEventPublishData:commonEventManager.CommonEventPublishData = {
        code: 10,
        data: 'publish_event0500_init',
        isOrdered: true,
      }

      let subscriberCallBack0500=(err:BusinessError, data: commonEventManager.CommonEventData)=> {
        console.info(TAG+'===============>subscriberCallBack0500========event: ' + data.event);
        console.info(TAG+'===============>subscriberCallBack0500=========code: ' + data.code);
        console.info(TAG+'===============>subscriberCallBack0500=========data: ' + data.data);
        expect(data.event).assertEqual('publish_event0500');
        expect(data.code).assertEqual(10);
        expect(data.data).assertEqual('publish_event0500_init');
      }

      let subscriberCallBack0501=(err:BusinessError, data: commonEventManager.CommonEventData)=> {
        console.info(TAG+'===============>subscriberCallBack0501========event: ' + data.event);
        console.info(TAG+'===============>subscriberCallBack0501=========code: ' + data.code);
        console.info(TAG+'===============>subscriberCallBack0501========data: ' + data.data);
        expect(data.event).assertEqual('publish_event0500');
        expect(data.code).assertEqual(10);
        expect(data.data).assertEqual('publish_event0500_init');
      }

      commonEventManager.createSubscriber(
        commonEventSubscribeInfo1
      ).then((data:commonEventManager.CommonEventSubscriber)=>{
        console.info(TAG+'===============ActsSubscriberTestOrder_0500==========createSubscriber promise1');
      })

      commonEventManager.createSubscriber(
        commonEventSubscribeInfo2
      ).then((data:commonEventManager.CommonEventSubscriber)=>{
        console.info(TAG+'===============ActsSubscriberTestOrder_0500==========createSubscriber promise2');
      })
      console.info(`${TAG} Sub_Notification_Ces_Subscriber_Subscribe_Static_1200 END`)
    })

    /*
     * @tc.number: SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0600
     * @tc.name: SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0600
     * @tc.desc: createSubscriber
     */
    it('SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0600'
      hilog.info(domain,TAG,`SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0600 START`)

      let subscriber: commonEventManager.CommonEventSubscriber

      let subscribeInfo : commonEventManager.CommonEventSubscribeInfo= {
        events: new Array<string>('event06')
      }

      commonEventManager.createSubscriber(subscribeInfo).then((commonEventSubscriber:commonEventManager.CommonEventSubscriber) => {
        hilog.info(domain,TAG,`SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0600 success`)
        subscriber = commonEventSubscriber
        expect(true).assertTrue()
        done()
      }).catch((err:BusinessError):void => {
        hilog.info(domain,TAG,`SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0600 err `)
        expect(false).assertTrue()
        done()
      })
      hilog.info(domain,TAG,`SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0600 END`)
    })

    // /*
    //  * @tc.number: SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0700
    //  * @tc.name: SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0700
    //  * @tc.desc: createSubscriber
    //  */
    // //问题单号：DTS2025060627133
    // it('SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   let TAG:string = 'SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0700'
    //   console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0700 START`)
    //
    //   let subscriber:commonEventManager.CommonEventSubscriber
    //
    //   let subscribeInfo:commonEventManager.CommonEventSubscribeInfo = {
    //     events:new Array<string> ("event07")
    //   }
    //
    //   commonEventManager.createSubscriber(subscribeInfo, undefined).then((commonEventSubscriber:commonEventManager.CommonEventSubscriber) => {
    //     console.info(TAG+`SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_0700 success ${commonEventSubscriber}`)
    //     subscriber = commonEventSubscriber
    //     expect(true).assertTrue()
    //     done()
    //   }).catch((err:BusinessError):void => {
    //     console.info(TAG+
    //       `SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_0700 err, error code: ${err.code}, message: ${err.message}`)
    //     expect(false).assertTrue()
    //     done()
    //   })
    //
    //   console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0700 END`)
    //
    // })
    console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST END`)
  })
}
