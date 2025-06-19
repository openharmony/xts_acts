import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import commonEventManager from '@ohos.commonEventManager';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let TAG = 'SUB_NOTIFICATION_CES_MANAGER_TEST ===>'

export default function ActsCommonEventManagerTest() {
  let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe("SUB_NOTIFICATION_CES_MANAGER_TEST", (): void => {
    hilog.info(domain, TAG, '%{public}s', 'describe start');

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_4700
     * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_4700
     * @tc.desc: verify the callback function of publish
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          hilog.info(domain, TAG, `Sub_Notification_Ans_Publish_Publish_4700 START`)
          hilog.info(domain, TAG, `Sub_Notification_Ans_Publish_Publish_4700 setTimeout come in `);
          commonEventManager.publish('EVENT01', (err: BusinessError | null) => {
            if (err) {
              hilog.info(domain, TAG, `Sub_Notification_Ans_Publish_Publish_4700 err, %{public}s`,
                JSON.stringify(err as BusinessError));
              expect(false).assertTrue()
              done();
            } else {
              hilog.info(domain, TAG, 'Sub_Notification_Ans_Publish_Publish_4700 success');
              expect(true).assertTrue()
              done();
            }
          })
          await Utils.msSleep(3000);
        } catch (err) {
          hilog.info(domain, TAG, `Sub_Notification_Ans_Publish_Publish_4700 failed, %{public}s`, JSON.stringify(err));
          expect(false).assertTrue()
          done();
        }
        hilog.info(domain, TAG, `Sub_Notification_Ans_Publish_Publish_4700 END`);
      })

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_4800
     * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_4800
     * @tc.desc: publish options
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `Sub_Notification_Ans_Publish_Publish_4800 START`)
        let options: commonEventManager.CommonEventPublishData = {
          data: "initial data",
          isOrdered: true
        }
        try {
          commonEventManager.publish("EVENT02", options, (err: BusinessError | null) => {
            if (err) {
              hilog.info(domain, TAG, `Sub_Notification_Ans_Publish_Publish_4800 err, %{public}s`,
                JSON.stringify(err as BusinessError));
              expect(false).assertTrue()
              done();
            } else {
              hilog.info(domain, TAG, "Sub_Notification_Ans_Publish_Publish_4800 success");
              expect(true).assertTrue()
              done();
            }
          })
          await Utils.msSleep(3000)
        } catch (err) {
          hilog.info(domain, TAG, `Sub_Notification_Ans_Publish_Publish_4800 failed,  %{public}s`,
            JSON.stringify(err));
          expect(false).assertTrue()
          done();
        }
        hilog.info(domain, TAG, `Sub_Notification_Ans_Publish_Publish_4800 END`);
      })

    /*
     * @tc.number: Sub_Notification_Ans_Subscriber_Subscribe_Static_1500
     * @tc.name: Sub_Notification_Ans_Subscriber_Subscribe_Static_1500
     * @tc.desc: createSubscriber
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_1500 START`)
        let subscriber: commonEventManager.CommonEventSubscriber
        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: new Array<string>('event03')
        }
        try {
          commonEventManager.createSubscriber(subscribeInfo, (err: BusinessError | null, commonEventSubscriber: commonEventManager.CommonEventSubscriber| undefined) => {
            if (err) {
              hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_1500 err,`)
              expect(false).assertTrue()
              done()
            } else {
              hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_1500 success `)
              subscriber = commonEventSubscriber
              expect(true).assertTrue()
              done()
            }
          })
        } catch (err) {
          hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_1500 failed, `, JSON.stringify(err))
          expect(false).assertTrue()
          done()
        }
        hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_1500 END`)
      })

    /*
     * @tc.number: Sub_Notification_Ans_Subscriber_Subscribe_Static_1600
     * @tc.name: Sub_Notification_Ans_Subscriber_Subscribe_Static_1600
     * @tc.desc: createSubscriber
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_1600 START`)
        let subscriber: commonEventManager.CommonEventSubscriber
        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: new Array<string>('event04')
        }
        commonEventManager.createSubscriber(subscribeInfo).then((subscriber): void => {
          hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_1600 success`)
          expect(true).assertTrue()
          done();
        }).catch((err) => {
          hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_1600 err, `)
          expect(false).assertTrue()
          done();
        })
        hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_1600 END`)
      })

    /*
     * @tc.number: Sub_Notification_Ans_Subscriber_Subscribe_Static_0400
     * @tc.name: Sub_Notification_Ans_Subscriber_Subscribe_Static_0400
     * @tc.desc: subscribe
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_0400 START`)
        let subscriber: commonEventManager.CommonEventSubscriber
        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: new Array<string>('event05')
        }

        try {
          commonEventManager.createSubscriber(subscribeInfo, (err: BusinessError | null, commonEventSubscriber: commonEventManager.CommonEventSubscriber| undefined) => {
            if (err) {
              hilog.info(domain, TAG,
                `Sub_Notification_Ans_Subscriber_Subscribe_0400 createSubscriber err, %{public}s`,
                JSON.stringify(err as BusinessError));
              expect(false).assertTrue()
              done()
            } else {
              hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_0400 createSubscriber success `)
              subscriber = commonEventSubscriber
              try {
                commonEventManager.subscribe(subscriber, (err: BusinessError | null, data: commonEventManager.CommonEventData| undefined) => {
                  if (err) {
                    hilog.info(domain, TAG,
                      `Sub_Notification_Ans_Subscriber_Subscribe_0400 subscribe_1 err, %{public}s`,
                      JSON.stringify(err as BusinessError));
                    expect(false).assertTrue()
                    done()
                  } else {
                    hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_0400 subscribe_1 success `)
                    expect(true).assertTrue()
                    done()
                  }
                })
              } catch (err) {
                hilog.info(domain, TAG,
                  `Sub_Notification_Ans_Subscriber_Subscribe_0400 subscribe_1 failed, %{public}s`,
                  JSON.stringify(err));
              }
              expect(true).assertTrue()
              done()
            }
          })
        } catch (err) {
          hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_0400  failed, %{public}s`,
            JSON.stringify(err));
          expect(false).assertTrue()
          done()
        }
        hilog.info(domain, TAG, '%{public}s', 'Sub_Notification_Ans_Subscriber_Subscribe_0400 end');
      })

    /*
    * @tc.number: Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200
    * @tc.name: Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200
    * @tc.desc: unsubscribe
    */
    it('Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Unsubscribe_0200 START`)
        let subscriber: commonEventManager.CommonEventSubscriber
        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: new Array<string>('event06')
        }

        try {
          commonEventManager.createSubscriber(subscribeInfo, (err: BusinessError | null, commonEventSubscriber: commonEventManager.CommonEventSubscriber| undefined) => {
            if (err) {
              hilog.info(domain, TAG,
                `Sub_Notification_Ans_Subscriber_Unsubscribe_0200 createSubscriber err, %{public}s`,
                JSON.stringify(err as BusinessError));
              expect(false).assertTrue()
              done()
            } else {
              hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Unsubscribe_0200 createSubscriber success `)
              subscriber = commonEventSubscriber
              try {
                commonEventManager.subscribe(subscriber, (err: BusinessError | null, data: commonEventManager.CommonEventData| undefined) => {
                  if (err) {
                    hilog.info(domain, TAG,
                      `Sub_Notification_Ans_Subscriber_Unsubscribe_0200 subscribe_1 err, %{public}s`,
                      JSON.stringify(err as BusinessError));
                    expect(false).assertTrue()
                    done()
                  } else {
                    hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Unsubscribe_0200 subscribe_1 success `)
                    expect(true).assertTrue()
                    done()
                  }
                })
              } catch (err) {
                hilog.info(domain, TAG,
                  `Sub_Notification_Ans_Subscriber_Unsubscribe_0200 subscribe_1 failed, %{public}s`,
                  JSON.stringify(err));
              }
              await Utils.msSleep(2000)
              try {
                commonEventManager.unsubscribe(subscriber, (err: BusinessError | null) => {
                  if (err) {
                    hilog.info(domain, TAG,
                      `Sub_Notification_Ans_Subscriber_Unsubscribe_0200 unsubscribe err, %{public}s`,
                      JSON.stringify(err as BusinessError));
                    expect(false).assertTrue()
                    done()
                  } else {
                    hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Unsubscribe_0200 unsubscribe success `)
                    expect(true).assertTrue()
                    done()
                  }
                })
                await Utils.msSleep(1000)
              } catch (err) {
                hilog.info(domain, TAG,
                  `Sub_Notification_Ans_Subscriber_Unsubscribe_0200 unsubscribe failed, %{public}s`,
                  JSON.stringify(err));
                expect(false).assertTrue()
                done()
              }
              done()
            }
          })
        } catch (err) {
          hilog.info(domain, TAG,
            `Sub_Notification_Ans_Subscriber_Unsubscribe_0200 createSubscriber failed, %{public}s`,
            JSON.stringify(err));
          expect(false).assertTrue()
          done()
        }
        try {
          commonEventManager.createSubscriber(subscribeInfo, (err: BusinessError | null, commonEventSubscriber: commonEventManager.CommonEventSubscriber| undefined) => {
            if (err) {
              hilog.info(domain, TAG,
                `Sub_Notification_Ans_Subscriber_Unsubscribe_0200 createSubscriber2 err, %{public}s`,
                JSON.stringify(err as BusinessError));
              expect(false).assertTrue()
              done()
            } else {
              hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Unsubscribe_0200 createSubscriber2 success `)
              subscriber = commonEventSubscriber
              try {
                commonEventManager.subscribe(subscriber, (err: BusinessError | null, data: commonEventManager.CommonEventData| undefined) => {
                  if (err) {
                    hilog.info(domain, TAG,
                      `Sub_Notification_Ans_Subscriber_Unsubscribe_0200 subscribe_2 err, %{public}s`,
                      JSON.stringify(err as BusinessError));
                    expect(false).assertTrue()
                    done()
                  } else {
                    hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Unsubscribe_0200 subscribe_2 success `)
                    expect(true).assertTrue()
                    done()
                  }
                })
              } catch (err) {
                hilog.info(domain, TAG,
                  `Sub_Notification_Ans_Subscriber_Unsubscribe_0200 subscribe_2 failed, %{public}s`,
                  JSON.stringify(err));
              }
              await Utils.msSleep(1000)
              try {
                commonEventManager.unsubscribe(subscriber)
                await Utils.msSleep(1000)
              } catch (err) {
                hilog.info(domain, TAG,
                  `Sub_Notification_Ans_Subscriber_Unsubscribe_0200 unsubscribe failed, %{public}s`,
                  JSON.stringify(err));
                expect(false).assertTrue()
                done()
              }
              done()
            }
          })
        } catch (err) {
          hilog.info(domain, TAG,
            `Sub_Notification_Ans_Subscriber_Unsubscribe_0200 createSubscriber2 failed, %{public}s`,
            JSON.stringify(err));
          expect(false).assertTrue()
          done()
        }
        hilog.info(domain, TAG, '%{public}s', 'Sub_Notification_Ans_Subscriber_Unsubscribe_0200 end');
      })


  })
  hilog.info(domain, TAG, '%{public}s', 'SUB_NOTIFICATION_CES_MANAGER_TEST end');
}