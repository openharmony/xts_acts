import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base'
import commonEventManager from '@ohos.commonEventManager'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let TAG = 'SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST'

export default function ActsCommonEventManagerSubscribeTest() {
  let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe("SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST", (): void => {
    hilog.info(domain, TAG, '%{public}s', 'describe start');

    /*
     * @tc.number: Sub_Notification_Ans_Subscriber_Subscribe_Static_1900
     * @tc.name: Sub_Notification_Ans_Subscriber_Subscribe_Static_1900
     * @tc.desc: verify the callback function
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_1900 START`)
        let subscriber: commonEventManager.CommonEventSubscriber
        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: new Array<string>('event09')
        }
        try {
          hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_1900 come in `)
          commonEventManager.createSubscriber(subscribeInfo, (err, commonEventSubscriber) => {
            hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_1900 createSubscriber come in `)
            if (err && err.code !== 0) {
              hilog.info(domain, TAG,
                `Sub_Notification_Ans_Subscriber_Subscribe_1900 createSubscriber err, %{public}s]`,
                JSON.stringify(err));
              expect(false).assertTrue()
              done();
            } else {
              hilog.info(domain, TAG,
                `Sub_Notification_Ans_Subscriber_Subscribe_1900 createSubscriber success %{public}s]`,
                JSON.stringify(err));
              subscriber = commonEventSubscriber
              expect(true).assertTrue()
              done();
            }
          })
          await Utils.msSleep(3000);
        } catch (err) {
          hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_1900 failed, %{public}s]`,
            JSON.stringify(err));
          expect(false).assertTrue()
          done();
        }
        hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_1900 END`);
      })

    /*
     * @tc.number: Sub_Notification_Ans_Subscriber_Subscribe_Static_2000
     * @tc.name: Sub_Notification_Ans_Subscriber_Subscribe_Static_2000
     * @tc.desc: verify the promise function
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_2000 START`)
        let subscriber: commonEventManager.CommonEventSubscriber
        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: new Array<string>('event10')
        }
        try {
          hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_2000 come in `);
          commonEventManager.createSubscriber(subscribeInfo).then((subscriber): void => {
            hilog.info(domain, TAG, `createSubscriber success %{public}s]`)
            expect(true).assertTrue()
            done();
          }).catch((err) => {
            hilog.info(domain, TAG, `createSubscriber err %{public}s]`);
            expect(false).assertTrue()
            done();
          })
        } catch (err) {
          hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_2000 failed, %{public}s]`);
          expect(false).assertTrue()
          done();
        }
        hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_2000 END`);
      })


    /*
     * @tc.number: SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1100
     * @tc.name: SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1100
     * @tc.desc: verify the promise function
     */
    it('SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1100 START`)

        let options: commonEventManager.CommonEventPublishData = {
          code: 0,
          data: "initial data",
          isOrdered: true,
          isSticky: false,
        }

        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: new Array<string>('event11'),
          priority: 100
        }

        let CommonEventData: commonEventManager.CommonEventData = {
          event: 'event11'
        }
        let SubscribeCB = (err: BusinessError | null, CommonEventData: commonEventManager.CommonEventData) => {
          hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1100 SubscribeCB err11, %{public}s]`,
            JSON.stringify(err));
          if (err) {
            hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1100 SubscribeCB err, %{public}s]`,
              JSON.stringify(err));
            expect(false).assertTrue()
            done()
          } else {
            hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1100 SubscribeCB sucess`)
            expect(true).assertTrue()
            done()
          }
        }

        let subscriber = commonEventManager.createSubscriberSync(subscribeInfo)
        commonEventManager.subscribe(subscriber, SubscribeCB)
        await Utils.msSleep(1000)
        try {
          commonEventManager.publish("event11", options, (err) => {
            if (err && err.code !== 0) {
              hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1100 publish err, %{public}s]`,
                JSON.stringify(err));
              expect(false).assertTrue()
              done()
            } else {
              hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1100 publish sucess`)
            }
          });
        } catch (err) {
          hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1100 publish err1, %{public}s]`,
            JSON.stringify(err));
          expect(false).assertTrue()
          done()
        }
      })

    /*
     * @tc.number: SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1200
     * @tc.name: SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1200
     * @tc.desc: verify the promise function
     */
    it('SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1200 START`)

        let options: commonEventManager.CommonEventPublishData = {
          code: 0,
          data: "initial data",
        }

        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: new Array<string>('eventname2'),
          priority: 100
        }
        let CommonEventData: commonEventManager.CommonEventData = {
          event: 'eventname2'
        }
        let SubscribeCB = (err: BusinessError | null, CommonEventData: commonEventManager.CommonEventData) => {
          hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1200 SubscribeCB err11, %{public}s]`,
            JSON.stringify(err))
          if (err) {
            hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1200 SubscribeCB err, %{public}s]`,
              JSON.stringify(err));
            expect(false).assertTrue()
            done()
          } else {
            hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1200 SubscribeCB sucess`)
            expect(true).assertTrue()
            done()
          }
        }

        let subscriber = commonEventManager.createSubscriberSync(subscribeInfo)
        commonEventManager.subscribe(subscriber, SubscribeCB)
        await Utils.msSleep(1000)
        try {
          commonEventManager.publish("eventname2", options, (err) => {
            if (err && err.code !== 0) {
              hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1200 publish err, %{public}s]`,
                JSON.stringify(err));
              expect(false).assertTrue()
              done()
            } else {
              hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1200 publish sucess`)
            }
          });
          // await Utils.msSleep(2000)
          // done()
        } catch (err) {
          hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1200 publish err1, %{public}s]`,
            JSON.stringify(err));
          expect(false).assertTrue()
          done()
        }
        hilog.info(domain, TAG, `SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1200 publish END`)
      })

  })
  hilog.info(domain, TAG, '%{public}s', 'SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST end');
}