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

import { BusinessError } from '@ohos.base';
import notificationManager from '@ohos.notificationManager'
import notificationSubscribe from '@ohos.notificationSubscribe';
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import {
  Component,
  Driver,
  ON,
  On,
  MatchPattern,
  MouseButton,
  WindowMode,
  UIElementInfo,
  UiDirection,
  PointerMatrix,
  DisplayRotation,
  loadAndSetUpUiTest
} from '@ohos.UiTest'

let testAbilityContext: common.UIAbilityContext
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let bundle: string = 'com.example.systemAPI.static'

export default function ActsNotificationSystemAPITest() {
  describe('SUB_NOTIFICATION_ANS_SYSTEM_API_TEST', () => {

    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      loadAndSetUpUiTest();
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void => {
          testAbilityContext = abilitys.context
          hilog.info(domain, tag, '%{public}s', 'onAbilityCreate end');

        },
      }, (err: BusinessError): void => {
        if (err != null) {
          hilog.info(domain, tag, '%{public}s', '-----' + err.code);
        }
        hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${JSON.stringify(bundle)}`)
      await Utils.msSleep(2000)
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })


    let TAG = 'SUB_NOTIFICATION_ANS_SYSTEM_API_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_SYSTEM_API_TEST START')

    let subscriber: notificationSubscribe.NotificationSubscriber = {
      onConsume: (data: notificationSubscribe.SubscribeCallbackData) => {
        let req = data.request;
        console.info(`${TAG} onConsume request id: ${req.id}`)
      }
    };

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_4100
     * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_4100
     * @tc.desc: test function publish takes userId
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Publish_Publish_Static_4100'
        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_Static_4100 START`);
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "test_title",
              text: "test_text",
              additionalText: "test_Publish"
            } as notificationManager.NotificationBasicContent,
          } as notificationManager.NotificationContent,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }
        console.info(`Sub_Notification_Ans_Publish_Publish_Static_4100 PUBLISH`);
        try {
          notificationManager.publish(notificationRequest, 0, (err: BusinessError) => {
            if (err.code !== 0) {
              console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
              expect(err.code).assertEqual(202);
              done()
            } else {
              console.info(`${TAG} publish AsyncCallback success`)
              expect(false).assertTrue()
              done()
            }
          });
        } catch (err: BusinessError) {
          console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        }

        console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_Static_4100 END`);
      })

    /*
     * @tc.number: Sub_Notification_Ans_Enable_Query_Static_0100
     * @tc.name: Sub_Notification_Ans_Enable_Query_Static_0100
     * @tc.desc: test function isNotificationEnabled
     */
    it('Sub_Notification_Ans_Enable_Query_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Enable_Query_Static_0100'
        console.info(`Sub_Notification_Ans_Enable_Query_Static_0100 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "com.example.helloworld",
          uid: 0
        }
        notificationManager.isNotificationEnabled(bundleOpt, (err, data) => {
          if (err.code !== 0) {
            console.info(`${TAG} isNotificationEnabled AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(202);
            done()
          } else {
            console.info(`${TAG} isNotificationEnabled AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`Sub_Notification_Ans_Enable_Query_Static_0100 END`);
      })

    /*
     * @tc.number: Sub_Notification_Ans_Enable_Query_Static_0200
     * @tc.name: Sub_Notification_Ans_Enable_Query_Static_0200
     * @tc.desc: test function isNotificationEnabled no parameter
     */
    it('Sub_Notification_Ans_Enable_Query_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Enable_Query_Static_0200'
        console.info(`${TAG} Sub_Notification_Ans_Enable_Query_Static_0200 START`);

        notificationManager.isNotificationEnabled((err: BusinessError, data: boolean): void => {
          if (err && err.code !== 0) {
            console.info(`${TAG} isNotificationEnabled AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} isNotificationEnabled AsyncCallback success`)
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_Enable_Query_Static_0200 END`);
      })

    /*
    * @tc.number: Sub_Notification_Ans_Enable_Query_Static_0300
    * @tc.name: Sub_Notification_Ans_Enable_Query_Static_0300
    * @tc.desc: test function isNotificationEnabled take userId
    */
    it('Sub_Notification_Ans_Enable_Query_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Enable_Query_Static_0300'
        console.info(`Sub_Notification_Ans_Enable_Query_Static_0300 START`);
        let userId: number = 0;
        notificationManager.isNotificationEnabled(userId, (err, data) => {
          if (err.code !== 0) {
            console.info(`${TAG} isNotificationEnabled AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(202);
            done()
          } else {
            console.info(`${TAG} isNotificationEnabled AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`Sub_Notification_Ans_Enable_Query_Static_0300 END`);
      })

   
    /*
     * @tc.number: Sub_Notification_Ans_Distributed_Search_Static_2000
     * @tc.name: Sub_Notification_Ans_Distributed_Search_Static_2000
     * @tc.desc: test function getAllActiveNotifications
     */
    it('Sub_Notification_Ans_Distributed_Search_Static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Distributed_Search_Static_2000'
        console.info(`Sub_Notification_Ans_Distributed_Search_Static_2000 START`);
        notificationManager.getAllActiveNotifications((err, data) => {
          if (err.code !== 0) {
            console.info(`${TAG} getAllActiveNotifications AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(202);
            done()
          } else {
            console.info(`${TAG} getAllActiveNotifications AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`Sub_Notification_Ans_Distributed_Search_Static_2000 END`);
      })


   

    /*
     * @tc.number: Sub_Notification_Ans_Enable_SetEnable_Static_9600
     * @tc.name: Sub_Notification_Ans_Enable_SetEnable_Static_9600
     * @tc.desc: test function setNotificationEnableSlot
     */
    it('Sub_Notification_Ans_Enable_SetEnable_Static_9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Enable_SetEnable_Static_9600'
        console.info(`Sub_Notification_Ans_Enable_SetEnable_Static_9600 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }
        let type = notificationManager.SlotType.SOCIAL_COMMUNICATION;
        notificationManager.setNotificationEnableSlot(bundleOpt, type, true, (err) => {
          if (err.code !== 0) {
            console.info(`${TAG} setNotificationEnableSlot AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            if (err.code == 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect(err.code).assertEqual(202);
              done()
            }
          } else {
            console.info(`${TAG} setNotificationEnableSlot AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`Sub_Notification_Ans_Enable_SetEnable_Static_9600 END`);
      })

    /*
        * @tc.number: Sub_Notification_Ans_Enable_SetEnable_Static_9700
        * @tc.name: Sub_Notification_Ans_Enable_SetEnable_Static_9700
        * @tc.desc: test function isNotificationSlotEnabled
        */
    it('Sub_Notification_Ans_Enable_SetEnable_Static_9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Enable_SetEnable_Static_9700'
        console.info(`Sub_Notification_Ans_Enable_SetEnable_Static_9700 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }
        let type = notificationManager.SlotType.SOCIAL_COMMUNICATION;
        notificationManager.isNotificationSlotEnabled(bundleOpt, type, (err, data) => {
          if (err.code !== 0) {
            console.info(`${TAG} isNotificationSlotEnabled AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            if (err.code == 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect(err.code).assertEqual(202);
              done()
            }
          } else {
            console.info(`${TAG} isNotificationSlotEnabled AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_Enable_SetEnable_Static_9700 END`);
      })

   

   

    /*
     * @tc.number: Sub_Notification_Ans_Subscriber_Subscribe_Static_0100
     * @tc.name: Sub_Notification_Ans_Subscriber_Subscribe_Static_0100
     * @tc.desc: test function subscribe
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_0100'
        console.info(`Sub_Notification_Ans_Subscriber_Subscribe_Static_0100 START`);

        notificationSubscribe.subscribe(subscriber, (err: BusinessError) => {
          if (err.code !== 0) {
            console.info(`${TAG} subscribe AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(202);
            done()
          } else {
            console.info(`${TAG} subscribe AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`Sub_Notification_Ans_Subscriber_Subscribe_Static_0100 END`);
      });

    /*
     * @tc.number: Sub_Notification_Ans_Subscriber_Subscribe_Static_0200
     * @tc.name: Sub_Notification_Ans_Subscriber_Subscribe_Static_0200
     * @tc.desc: test function subscribe take NotificationSubscribeInfo
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_0200'
        console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_0200 START`);

        let subscribeInfo: notificationSubscribe.NotificationSubscribeInfo = {
          bundleNames: ["com.example.helloworld"],
          userId: 0
        }
        notificationSubscribe.subscribe(subscriber, subscribeInfo, (err: BusinessError) => {
          if (err.code !== 0) {
            console.info(`${TAG} subscribe AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(202);
            done()
          } else {
            console.info(`${TAG} subscribe AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_0200 END`);
      });

    /*
     * @tc.number: Sub_Notification_Ans_Subscriber_Subscribe_Static_0300
     * @tc.name: Sub_Notification_Ans_Subscriber_Subscribe_Static_0300
     * @tc.desc: test function subscribe take NotificationSubscribeInfo
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_0300'
        console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_0300 START`);

        let subscribeInfo: notificationSubscribe.NotificationSubscribeInfo = {
          bundleNames: ["com.example.helloworld"],
          userId: 0
        }

        await notificationSubscribe.subscribe(subscriber, subscribeInfo).then(() => {
          console.info(`${TAG} subscribe AsyncCallback success`)
          expect(false).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} subscribe AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
          expect(err.code).assertEqual(202);
          done()
        });

        console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_0300 END`);
      });

    /*
     * @tc.number: Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0100
     * @tc.name: Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0100
     * @tc.desc: test function unsubscribe
     */
    it('Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0100'
        console.info(`${TAG} Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0100 START`);

        notificationSubscribe.unsubscribe(subscriber, (err: BusinessError) => {
          if (err.code !== 0) {
            console.info(`${TAG} unsubscribe AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(202);
            done()
          } else {
            console.info(`${TAG} unsubscribe AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        })
        console.info(`${TAG} Sub_Notification_Ans_Subscriber_Unsubscribe_0100 END`)
      })

    /*
         * @tc.number: Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0200
         * @tc.name: Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0200
         * @tc.desc: test function remove
         */
    it('Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0200'
        console.info(`Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0200 START`);

        let bundleOpt: notificationSubscribe.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }
        let key: notificationSubscribe.NotificationKey = {
          id: 0,
          label: 'test'
        }
        notificationSubscribe.remove(bundleOpt, key, notificationSubscribe.RemoveReason.CLICK_REASON_REMOVE, (err) => {
          if (err.code !== 0) {
            console.info(`${TAG} remove AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(202);
            done()
          } else {
            console.info(`${TAG} remove AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0200 END`);
      })
    /*
     * @tc.number: Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0300
     * @tc.name: Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0300
     * @tc.desc: test function remove
     */
    it('Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0300'
        console.info(`Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0300 START`);

        notificationSubscribe.remove("device_0_1", notificationSubscribe.RemoveReason.CLICK_REASON_REMOVE, (err) => {
          if (err.code !== 0) {
            console.info(`${TAG} remove AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(202);
            done()
          } else {
            console.info(`${TAG} remove AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(`Sub_Notification_Ans_Delete_SpecifiedGroup_Static_0300 END`);
      })


 
    /*
        * @tc.number: Sub_Notification_Ans_Slot_CreateSlot_Promise_Static_3700
        * @tc.name: Sub_Notification_Ans_Slot_CreateSlot_Promise_Static_3700
        * @tc.desc: test function isBadgeDisplayed
        * @tc.size: LargeTest
        * @tc.type: Function
        * @tc.level LEVEL3
        */
    it('Sub_Notification_Ans_Slot_CreateSlot_Promise_Static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Slot_CreateSlot_Promise_Static_3700'
        console.info(`Sub_Notification_Ans_Slot_CreateSlot_Promise_Static_3700 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }

        await notificationManager.isBadgeDisplayed(bundleOpt).then((data: boolean) => {
          console.info(`${TAG} isBadgeDisplayed success, data: ` + JSON.stringify(data));
          expect(false).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.error(`${TAG} isBadgeDisplayed failed, code is ${err.code}, message is ${err.message}`);
          if (err.code == 801) {
            expect(err.code).assertEqual(801)
            done()
          } else {
            expect(err.code).assertEqual(202);
            done()
          }
        });

        console.info(`Sub_Notification_Ans_Slot_CreateSlot_Promise_Static_3700 END`);
      })

    /*
       * @tc.number: Sub_Notification_Ans_Enable_SetEnable_Promise_Static_9700
       * @tc.name: Sub_Notification_Ans_Enable_SetEnable_Promise_Static_9700
       * @tc.desc: test function isNotificationSlotEnabled
       * @tc.size: LargeTest
       * @tc.type: Function
       * @tc.level LEVEL3
       */
    it('Sub_Notification_Ans_Enable_SetEnable_Promise_Static_9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Enable_SetEnable_Promise_Static_9700'
        console.info(`Sub_Notification_Ans_Enable_SetEnable_Promise_Static_9700 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }
        // isNotificationSlotEnabled
        notificationManager.isNotificationSlotEnabled(bundleOpt,
          notificationManager.SlotType.SOCIAL_COMMUNICATION).then((data: boolean) => {
          console.info("isNotificationSlotEnabled success, data: " + JSON.stringify(data));
          expect(false).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.error(`isNotificationSlotEnabled failed, code is ${err.code}, message is ${err.message}`);
          if (err.code == 801) {
            expect(err.code).assertEqual(801)
            console.info(`${TAG} isNotificationSlotEnabled AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            done();
          } else {
            expect(err.code).assertEqual(202);
            console.info(`${TAG} isNotificationSlotEnabled_1 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            done();
          }
        });

        console.info(`Sub_Notification_Ans_Enable_SetEnable_Promise_Static_9700 END`);
      })


    /*
     * @tc.number: Sub_Notification_Ans_Enable_SetEnable_Promise_Static_9600
     * @tc.name: Sub_Notification_Ans_Enable_SetEnable_Promise_Static_9600
     * @tc.desc: test function setNotificationEnableSlot
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level LEVEL3
     */
    it('Sub_Notification_Ans_Enable_SetEnable_Promise_Static_9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_Enable_SetEnable_Promise_Static_9600'
        console.info(`Sub_Notification_Ans_Enable_SetEnable_Promise_Static_9600 START`);

        let bundleOpt: notificationManager.BundleOption = {
          bundle: "example.bundleName",
          uid: 0
        }
        notificationManager.setNotificationEnableSlot(
          bundleOpt,
          notificationManager.SlotType.SOCIAL_COMMUNICATION,
          true, true).then(() => {
          console.info(`${TAG} setNotificationEnableSlot success`);
          expect(false).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.error(`${TAG} setNotificationEnableSlot failed, code is ${err.code}, message is ${err.message}`);
          if (err.code == 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect(err.code).assertEqual(202);
            done()
          }
        })
        console.info(`Sub_Notification_Ans_Enable_SetEnable_Promise_Static_9600 END`);
      })

  })
}

