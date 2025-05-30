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
import commonEvent from '@ohos.commonEvent'
import commonEventManager from '@ohos.commonEventManager'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium'

export default function ActsSubscriberTestOrder() {
    describe('SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST', function () {
        let TAG = 'SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST ===>'
        console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST START`)
    let num2 = 0;
    let order = false;
    let commonEventSubscriber0100;
    let commonEventSubscriber0101;
    let commonEventSubscriber0200;
    let commonEventSubscriber0201;
    let commonEventSubscriber0300;
    let commonEventSubscriber0301;
    let commonEventSubscriber0400;
    let commonEventSubscriber0401;
    let commonEventSubscriber0500;
    let commonEventSubscriber0501;

    function publishCallback(err) {
        console.info('===============>publishCallback');
    }

    function unsubscribeCallback(err) {
        console.info('===============>unsubscribeCallback');
    }

    /*
     * @tc.number    : Sub_Notification_Ces_Publish_CommonEvent_0950
     * @tc.name      : verify subscribe and publish : Check subscribe same event and publish common ordered event
     * @tc.desc      : Check the subscriber can receive event "publish_event0100" type of the interface (by Promise)
     */
    it('Sub_Notification_Ces_Publish_CommonEvent_0950', Level.LEVEL1, async function (done) {
        console.info(`${TAG} Sub_Notification_Ces_Publish_CommonEvent_0950 START`)

        let commonEventSubscribeInfo1 = {
            events: ['publish_event0100'],
            priority: 10
        };

        let commonEventSubscribeInfo2 = {
            events: ['publish_event0100'],
            priority: 9
        };

        let commonEventPublishData = {
            code: 1,
            data: 'publish_event1001_init',
            isOrdered: true,
        }

        async function subscriberCallBack0100(err, data) {
            console.info('===============>subscriberCallBack0100========event: ' + data.event);
            console.info('===============>subscriberCallBack0100=========code: ' + data.code);
            console.info('===============>subscriberCallBack0100=========data: ' + data.data);
            expect(data.event).assertEqual('publish_event0100');
            expect(data.code).assertEqual(1);
            expect(data.data).assertEqual('publish_event1001_init');

            commonEventSubscriber0100.setCode(2).then(()=>{
                console.info('===============>subscriberCallBack0100 setCode promise');
            })

            commonEventSubscriber0100.setData('publish_event1001_change').then(()=>{
                console.info('===============>subscriberCallBack0100 setData promise');
            })

            commonEventSubscriber0100.setCodeAndData(2, 'publish_event1001_change').then(()=>{
                console.info('===============>subscriberCallBack0100 setCodeAndData promise');
            })

            commonEventSubscriber0100.getAbortCommonEvent().then((data)=>{
                console.info(
                    '===============>subscriberCallBack0100 getAbortCommonEvent promise abort: ' + data);
            })

            commonEventSubscriber0100.clearAbortCommonEvent().then(()=>{
                console.info('===============>subscriberCallBack0100 clearAbortCommonEvent promise');
            })

            commonEventSubscriber0100.getAbortCommonEvent().then((data)=>{
                console.info(
                    '===============>subscriberCallBack0100 getAbortCommonEvent promise abort: ' + data);
            })

            commonEventSubscriber0100.finishCommonEvent().then(()=>{
                console.info('===============>subscriberCallBack0100 finishCommonEvent promise');
            })
        }

        async function subscriberCallBack0101(err, data) {
            console.info('===============>subscriberCallBack0101========code: ' + err.code);
            console.info('===============>subscriberCallBack0101========event: ' + data.event);
            console.info('===============>subscriberCallBack0101=========code: ' + data.code);
            console.info('===============>subscriberCallBack0101=========data: ' + data.data);
            expect(data.event).assertEqual('publish_event0100');
            console.info('===============>subscriberCallBack0101=========1 code '+ data.code);
            expect(data.code).assertEqual(2);
            commonEventSubscriber0101.getCode().then((data)=>{
                console.info('===============>subscriberCallBack0101 getCode promise code: '+ data);
            })
            expect(data.data).assertEqual('publish_event1001_change');
            commonEventSubscriber0100.getData().then((data)=>{
                console.info('===============>subscriberCallBack0101 getData promise data: '+ data);
            })
            commonEventSubscriber0101.finishCommonEvent().then(()=>{
                console.info('===============>subscriberCallBack0101 finishCommonEvent promise');
                done();
            })
        }

        commonEvent.createSubscriber(
            commonEventSubscribeInfo1
        ).then((data)=>{
            console.info('===============ActsSubscriberTestOrder_0100==========createSubscriber promise1');
            commonEventSubscriber0100 = data;
            data.getSubscribeInfo().then(()=>{
                console.info('===============ActsSubscriberTestOrder_0100=========getSubscribeInfo promise1');
                commonEvent.subscribe(commonEventSubscriber0100, subscriberCallBack0100);
            });
        })

        commonEvent.createSubscriber(
            commonEventSubscribeInfo2
        ).then((data)=>{
            console.info('===============ActsSubscriberTestOrder_0100==========createSubscriber promise2');
            commonEventSubscriber0101 = data;
            data.getSubscribeInfo().then(()=>{
                console.info('===============ActsSubscriberTestOrder_0100=========getSubscribeInfo promise2');
                commonEvent.subscribe(commonEventSubscriber0101, subscriberCallBack0101);
                setTimeout(function(){
                    console.debug('===================ActsSubscriberTestOrder_0100 delay 100ms==================');
                    commonEvent.publish('publish_event0100', commonEventPublishData, publishCallback);
                }, 100);
            });
        })
        console.info(`${TAG} Sub_Notification_Ces_Publish_CommonEvent_0950 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ces_Subscriber_Unsubscribe_2100
     * @tc.name      : verify subscribe and publish : Check subscribe different event
     *                 and twice publish common ordered event and check unsubscribe event
     * @tc.desc      : Check the subscriber can receive event "publish_event0200" type of the interface (by Promise)
     */
    it ('Sub_Notification_Ces_Subscriber_Unsubscribe_2100', Level.LEVEL1, async function (done) {
        console.info(`${TAG} Sub_Notification_Ces_Subscriber_Unsubscribe_2100 START`)

        let commonEventSubscribeInfo1 = {
            events: ['publish_event0200',
                'publish_event0201'],
            priority: 10
        };

        let commonEventSubscribeInfo2 = {
            events: ['publish_event0201'],
            priority: 9
        };

        let commonEventPublishData1 = {
            code: 1,
            data: 'publish_event0200_init',
            isOrdered: false,
        }

        let commonEventPublishData2 = {
            code: 1,
            data: 'publish_event0201_init',
            isOrdered: true,
        }

        async function subscriberCallBack0200(err, data) {
            console.info('===============>subscriberCallBack0200========event: ' + data.event);
            console.info('===============>subscriberCallBack0200=========code: ' + data.code);
            console.info('===============>subscriberCallBack0200=========data: ' + data.data);
            console.info('===============>subscriberCallBack0200=========num2: ' + num2);
            if (num2 == 0) {
                num2++;
                expect(data.event).assertEqual('publish_event0200');
                console.info('===============>subscriberCallBack0200=====num2:0====code: ' + data.code);
                expect(data.code).assertEqual(1);
                expect(data.data).assertEqual('publish_event0200_init');
            }else {
                num2 = 0;
                expect(data.event).assertEqual('publish_event0201');
                console.info('===============>subscriberCallBack0200=====num2:1====code: ' + data.code);
                expect(data.code).assertEqual(1);
                expect(data.data).assertEqual('publish_event0201_init');
                commonEventSubscriber0200.finishCommonEvent().then(()=>{
                    console.info('===============>subscriberCallBack0200:num2:1:finishCommonEvent promise');
                })
            }
        }

        async function subscriberCallBack0201(err, data) {
            console.info('===============>subscriberCallBack0201========event: ' + data.event);
            console.info('===============>subscriberCallBack0201=========code=: ' + data.code);
            console.info('===============>subscriberCallBack0201=========data: ' + data.data);

            expect(data.event).assertEqual('publish_event0201');
            console.info('===============>subscriberCallBack0201=========code: ' + data.code);
            expect(data.code).assertEqual(1);
            expect(data.data).assertEqual('publish_event0201_init');
            commonEventSubscriber0201.finishCommonEvent().then(()=>{
                console.info('===============>subscriberCallBack0201:finishCommonEvent promise');
                done();
            })
        }

        commonEvent.createSubscriber(
            commonEventSubscribeInfo1,
        ).then((data)=>{
            console.info('===============ActsSubscriberTestOrder_0200==========createSubscriber promise1');
            commonEventSubscriber0200 = data;
            data.getSubscribeInfo().then(()=>{
                console.info('===============ActsSubscriberTestOrder_0200=========getSubscribeInfo promise1');
                commonEvent.subscribe(commonEventSubscriber0200, subscriberCallBack0200);
            });
        })

        commonEvent.createSubscriber(
            commonEventSubscribeInfo2,
        ).then((data)=>{
            console.info('===============ActsSubscriberTestOrder_0200==========createSubscriber promise2');
            commonEventSubscriber0201 = data;
            data.getSubscribeInfo().then(()=>{
                console.info('===============ActsSubscriberTestOrder_0200=========getSubscribeInfo promise2');
                commonEvent.subscribe(commonEventSubscriber0201, subscriberCallBack0201);
                setTimeout(function(){
                    console.debug('===================ActsSubscriberTestOrder_0200 delay 100ms==================');
                    commonEvent.unsubscribe(commonEventSubscriber0200, unsubscribeCallback);
                }, 100);
                setTimeout(function(){
                    console.debug('===================ActsSubscriberTestOrder_0200 delay 100ms==================');
                    commonEvent.publish('publish_event0200', commonEventPublishData1, publishCallback);
                }, 100);
                setTimeout(function(){
                    console.debug('===================ActsSubscriberTestOrder_0200 delay 100ms==================');
                    commonEvent.publish('publish_event0201', commonEventPublishData2, publishCallback);
                }, 100);
            });
        })
        console.info(`${TAG} Sub_Notification_Ces_Subscriber_Unsubscribe_2100 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ces_Subscriber_Subscribe_1000
     * @tc.name      : verify subscribe and publish : Check subscribe different events
     *                 and some publish common ordered events
     * @tc.desc      : Check the subscriber can receive event "publish_event0301" type of the interface (by Promise)
     */
    it ('Sub_Notification_Ces_Subscriber_Subscribe_1000', Level.LEVEL1, async function (done) {
        console.info(`${TAG} Sub_Notification_Ces_Subscriber_Subscribe_1000 START`)

        let commonEventSubscribeInfo1 = {
            events: ['publish_event0301'],
            priority: 9
        };

        let commonEventSubscribeInfo2 = {
            events: ['publish_event0301'],
            priority: 10
        };

        let commonEventPublishData2 = {
            code: 1,
            data: 'publish_event0301_init',
            isOrdered: true,
        }

        let callBackNum = 0;
        async function subscriberCallBack0300(err, data) {
            console.info('===============>subscriberCallBack0300========event: ' + data.event);
            console.info('===============>subscriberCallBack0300=========code: ' + data.code);
            console.info('===============>subscriberCallBack0300=========dat: ' + data.data);
            console.info('===============>subscriberCallBack0300=========order: ' + order);

            expect(data.event).assertEqual('publish_event0301');
            expect(data.code).assertEqual(1);
            expect(data.data).assertEqual('publish_event0301_init');
            expect(order).assertEqual(true);

            if (order == true) {
                order = false;
            }

            commonEventSubscriber0300.isOrderedCommonEvent().then((data)=>{
                console.info('========>subscriberCallBack0300 isOrderedCommonEvent promise ' + data);
                expect(data).assertEqual(true);
            })
            commonEventSubscriber0300.finishCommonEvent().then(()=>{
                console.info('===============>subscriberCallBack0300 finishCommonEvent promise');
            })

            callBackNum++;
            if (callBackNum == 3) {
                done();
            }
        }

        async function subscriberCallBack0301(err, data) {
            console.info('===============>subscriberCallBack0301========event: ' + data.event);
            console.info('===============>subscriberCallBack0301=========code: ' + data.code);
            console.info('===============>subscriberCallBack0301=========data: ' + data.data);
            console.info('===============>subscriberCallBack0301=========order: ' + order);

            expect(data.event).assertEqual('publish_event0301');
            expect(data.code).assertEqual(1);
            expect(data.data).assertEqual('publish_event0301_init');

            if (order == false) {
                order = true;
            }

            commonEventSubscriber0301.isOrderedCommonEvent().then((data)=>{
                console.info('===============>subscriberCallBack0301 isOrderedCommonEvent promise' + data);
                expect(data).assertEqual(true);
            })
            commonEventSubscriber0301.finishCommonEvent().then(()=>{
                console.info('===============>subscriberCallBack0301 finishCommonEvent promise');
            })
        }

        commonEvent.createSubscriber(
            commonEventSubscribeInfo1,
        ).then((data)=>{
            console.info('===============ActsSubscriberTestOrder_0300==========createSubscriber promise1');
            commonEventSubscriber0300 = data;
            data.getSubscribeInfo().then(()=>{
                console.info('===============ActsSubscriberTestOrder_0300=========getSubscribeInfo promise1');
                commonEvent.subscribe(commonEventSubscriber0300, subscriberCallBack0300);
            });
        })

        commonEvent.createSubscriber(
            commonEventSubscribeInfo2,
        ).then((data)=>{
            console.info('===============ActsSubscriberTestOrder_0300==========createSubscriber promise2');
            commonEventSubscriber0301 = data;
            data.getSubscribeInfo().then(()=>{
                console.info('===============ActsSubscriberTestOrder_0300=========getSubscribeInfo promise2');
                commonEvent.subscribe(commonEventSubscriber0301, subscriberCallBack0301);
                let numindex = 0;
                for (; numindex < 3; ++numindex) {
                    setTimeout(function(){
                        console.debug('===================ActsSubscriberTestOrder_0300 delay 100ms==================');
                        commonEvent.publish('publish_event0301', commonEventPublishData2, publishCallback);
                    }, 100);
                }
            });
        })
        console.info(`${TAG} Sub_Notification_Ces_Subscriber_Subscribe_1000 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ces_Subscriber_Subscribe_1100
     * @tc.name      : verify subscribe and publish : Check subscribe same events
     *                 and publish common ordered events and check abort event
     * @tc.desc      : Check the subscriber can receive event "publish_eventOrder0400" type of the interface by promise
     */
    it ('Sub_Notification_Ces_Subscriber_Subscribe_1100', Level.LEVEL1, async function (done) {
        console.info(`${TAG} Sub_Notification_Ces_Subscriber_Subscribe_1100 START`)

        let commonEventSubscribeInfo1 = {
            events: ['publish_eventOrder0400'],
            priority: 10
        };

        let commonEventSubscribeInfo2 = {
            events: ['publish_eventOrder0400'],
            priority: 9
        };

        let commonEventPublishData = {
            code: 1,
            data: 'publish_event0400_init',
            isOrdered: true,
        }

        async function subscriberCallBack0400(err, data) {
            console.info('===============>subscriberCallBack0400========event: ' + data.event);
            console.info('===============>subscriberCallBack0400========bundleName: ' + data.bundleName);
            console.info('===============>subscriberCallBack0400=========code: ' + data.code);
            console.info('===============>subscriberCallBack0400=========data: ' + data.data);
            expect(data.event).assertEqual('publish_eventOrder0400');
            expect(data.code).assertEqual(1);
            expect(data.data).assertEqual('publish_event0400_init');
            commonEventSubscriber0400.getAbortCommonEvent().then((data)=>{
                console.info('===============>subscriberCallBack0400 getAbortCommonEvent promise abort2: ' + data);
            });
            commonEventSubscriber0400.abortCommonEvent().then(() => {
                console.info('===============>subscriberCallBack0400 abortCommonEvent promise');
            });
            commonEventSubscriber0400.getAbortCommonEvent().then((data)=>{
                console.info(
                    '===============>subscriberCallBack0400 getAbortCommonEvent promise abort2: ' + data);
            });
            commonEventSubscriber0400.finishCommonEvent().then(()=> {
                console.info('===============>subscriberCallBack0400 finishCommonEvent promise');
                done();
            });
        }

        async function subscriberCallBack0401(err, data) {
            console.info('===============>subscriberCallBack0401========event: ' + data.event);
            expect().assertFail();
        }

        commonEvent.createSubscriber(
            commonEventSubscribeInfo1
        ).then((data)=>{
            console.info('===============ActsSubscriberTestOrder_0400==========createSubscriber promise1');
            commonEventSubscriber0400 = data;
            data.getSubscribeInfo().then((data)=>{
                console.info('===============ActsSubscriberTestOrder_0400=========getSubscribeInfo promise1');
                expect(data.events[0]).assertEqual('publish_eventOrder0400');
                commonEvent.subscribe(commonEventSubscriber0400, subscriberCallBack0400);
            })
        })

        commonEvent.createSubscriber(
            commonEventSubscribeInfo2
        ).then((data)=>{
            console.info('===============ActsSubscriberTestOrder_0400==========createSubscriber promise2');
            commonEventSubscriber0401 = data;
            data.getSubscribeInfo().then((data)=>{
                console.info('===============ActsSubscriberTestOrder_0400=========getSubscribeInfo promise2');
                expect(data.events[0]).assertEqual('publish_eventOrder0400');
                commonEvent.subscribe(commonEventSubscriber0401, subscriberCallBack0401);
                setTimeout(function(){
                    console.debug('===================ActsSubscriberTestOrder_0400 delay 100mss==================');
                    commonEvent.publish('publish_eventOrder0400', commonEventPublishData, publishCallback);
                }, 100);
            })
        })
        console.info(`${TAG} Sub_Notification_Ces_Subscriber_Subscribe_1100 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ces_Subscriber_Subscribe_1200
     * @tc.name      : verify subscribe and publish : Check subscriber same events
     * @tc.desc      : Check the subscriber can receive event "publish_event0500" type of the interface (by promise)
     */
    it ('Sub_Notification_Ces_Subscriber_Subscribe_1200', Level.LEVEL1, async function (done) {
        console.info(`${TAG} Sub_Notification_Ces_Subscriber_Subscribe_1200 START`)

        let commonEventSubscribeInfo1 = {
            events: ['publish_event0500'],
            priority: 1001
        };

        let commonEventSubscribeInfo2 = {
            events: ['publish_event0500'],
            priority: -101
        };

        let commonEventPublishData = {
            code: 10,
            data: 'publish_event0500_init',
            isOrdered: true,
        }

        async function subscriberCallBack0500(err, data) {
            console.info('===============>subscriberCallBack0500========event: ' + data.event);
            console.info('===============>subscriberCallBack0500=========code: ' + data.code);
            console.info('===============>subscriberCallBack0500=========data: ' + data.data);
            expect(data.event).assertEqual('publish_event0500');
            expect(data.code).assertEqual(10);
            expect(data.data).assertEqual('publish_event0500_init');
            commonEventSubscriber0500.finishCommonEvent((err) => {
                if (err.code) {
                  console.info("===============>finishCommonEvent AsyncCallback failed " + JSON.stringify(err));
              } else {
                  console.info("===============>FinishCommonEvent AsyncCallback success");
              }
              done()
              })
        }

        async function subscriberCallBack0501(err, data) {
            console.info('===============>subscriberCallBack0501========event: ' + data.event);
            console.info('===============>subscriberCallBack0501=========code: ' + data.code);
            console.info('===============>subscriberCallBack0501========data: ' + data.data);
            expect(data.event).assertEqual('publish_event0500');
            expect(data.code).assertEqual(10);
            expect(data.data).assertEqual('publish_event0500_init');
            commonEventSubscriber0501.finishCommonEvent((err) => {
                if (err.code) {
                  console.info("===============>finishCommonEvent AsyncCallback failed " + JSON.stringify(err));
              } else {
                  console.info("===============>FinishCommonEvent AsyncCallback success");
              }
              done()
              })
        }

        commonEvent.createSubscriber(
            commonEventSubscribeInfo1
        ).then((data)=>{
            console.info('===============ActsSubscriberTestOrder_0500==========createSubscriber promise1');
            commonEventSubscriber0500 = data;
            data.getSubscribeInfo().then((data)=>{
                console.info('===============ActsSubscriberTestOrder_0500==========getSubscribeInfo promise1');
                expect(data.events[0]).assertEqual('publish_event0500');
                commonEvent.subscribe(commonEventSubscriber0500, subscriberCallBack0500);
            })
        })

        commonEvent.createSubscriber(
            commonEventSubscribeInfo2
        ).then((data)=>{
            console.info('===============ActsSubscriberTestOrder_0500==========createSubscriber promise2');
            commonEventSubscriber0501 = data;
            data.getSubscribeInfo().then((data)=>{
                console.info('===============ActsSubscriberTestOrder_0500==========getSubscribeInfo promise2');
                expect(data.events[0]).assertEqual('publish_event0500');
                commonEvent.subscribe(commonEventSubscriber0501, subscriberCallBack0501);
                setTimeout(function(){
                    console.debug('===================ActsSubscriberTestOrder_0500 delay 100ms==================');
                    commonEvent.publish('publish_event0500', commonEventPublishData, publishCallback);
                }, 100);
            })
        })
        console.info(`${TAG} Sub_Notification_Ces_Subscriber_Subscribe_1100 END`)
    })

    /*
     * @tc.number: SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_0600
     * @tc.name: createSubscriber(subscribeInfo: CommonEventSubscribeInfo, undefined): Promise<CommonEventSubscriber>
     * @tc.desc: createSubscriber
     */
    it('SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_0600', Level.LEVEL2, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_0600 START`)
  
        let subscriber
  
        let subscribeInfo = {
          events: ["event06"]
        }
  
        await commonEvent.createSubscriber(subscribeInfo, undefined).then((commonEventSubscriber) => {
          console.info(`SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_0600 success ${commonEventSubscriber}`)
          subscriber = commonEventSubscriber
          expect(true).assertTrue()
          done()
        }).catch((err) => {
          console.info(
            `SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_0600 err, error code: ${err.code}, message: ${err.message}`)
          expect(false).assertTrue()
          done()
        })
  
        console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_0600 END`)
  
    })

    /*
     * @tc.number: SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_0700
     * @tc.name: createSubscriber(subscribeInfo: CommonEventSubscribeInfo, undefined): Promise<CommonEventSubscriber>
     * @tc.desc: createSubscriber
     */
    it('SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_0700', Level.LEVEL2, async function (done) {
        console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_0700 START`)
  
        let subscriber
  
        let subscribeInfo = {
          events: ["event07"]
        }
  
        await commonEventManager.createSubscriber(subscribeInfo, undefined).then((commonEventSubscriber) => {
          console.info(`SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_0700 success ${commonEventSubscriber}`)
          subscriber = commonEventSubscriber
          expect(true).assertTrue()
          done()
        }).catch((err) => {
          console.info(
            `SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_0700 err, error code: ${err.code}, message: ${err.message}`)
          expect(false).assertTrue()
          done()
        })
  
        console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_0700 END`)
  
    })
    console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST END`)
})
}
