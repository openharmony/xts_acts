/*
 * Copyright (c) 2021-2023 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll, afterEach, beforeEach } from "../../../hypium/index";
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
let bundle: string = 'com.example.actsnotificationslot.static'


export default function ActsNotificationSlotTest() {
  describe('SUB_NOTIFICATION_ANS_SLOT_TEST', () => {
    let TAG = 'SUB_NOTIFICATION_ANS_SLOT_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST START')

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
      }, (err: BusinessError | null): void => {
        if (err != null) {
          hilog.info(domain, tag, '%{public}s', '-----' + err.code);
        }
        hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(1000)
      abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${JSON.stringify(bundle)}`)
      await Utils.msSleep(1000)
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    beforeEach(() => {
      console.info(`${TAG} afterEach START`)
      await notificationManager.removeAllSlots()
      await Utils.msSleep(500)
      console.info(`${TAG} afterEach END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_2000
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_2000
     * @tc.desc      : NotificationSlot of an unknown SlotType
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_2000'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2000 START')

        notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot_1 AsyncCallback err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_1 AsyncCallback success`)
            expect(true).assertTrue()
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2000 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_2150
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_2150
     * @tc.desc      : NotificationSlot for social communication
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_2150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_2150'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2150 START')
        notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot_2 AsyncCallback err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_2 AsyncCallback success`)
            expect(true).assertTrue()
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2150 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_2300
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_2300
     * @tc.desc      : NotificationSlot for service information
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_2300'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2300 START')
        notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot_3 AsyncCallback err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_3 AsyncCallback success`)
            expect(true).assertTrue()
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2300 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_2450
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_2450
     * @tc.desc      : NotificationSlot for content information
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_2450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_2450'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2450 START')
        notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot_4 AsyncCallback err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_4 AsyncCallback success`)
            expect(true).assertTrue()
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2450 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_2600
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_2600
     * @tc.desc      : NotificationSlot for other purposes
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_2600'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2600 START')
        notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot_5 AsyncCallback err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_5 AsyncCallback success`)
            expect(true).assertTrue()
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2600 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_2750
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_2750
     * @tc.desc      : NotificationSlot of an unknown type
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_2750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_2750'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2750 START')
        await notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
          console.info(`${TAG} addSlot_6 Promise success`)
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} addSlot_6 Promise err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2750 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_2900
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_2900
     * @tc.desc      : NotificationSlot for social communication
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_2900'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2900 START')
        notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
          console.info(`${TAG} addSlot_7 Promise success`)
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} addSlot_7 Promise err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_2900 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_3050
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_3050
     * @tc.desc      : NotificationSlot for service information
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_3050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_3050'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3050 START')
        await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
          console.info(`${TAG} addSlot_8 Promise success`)
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} addSlot_8 Promise err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3050 END')
      })

    /*
     * @tc.number: Sub_Notification_Ans_Slot_CreateSlot_Static_3150
     * @tc.name: Sub_Notification_Ans_Slot_CreateSlot_Static_3150
     * @tc.desc: NotificationSlot for content information
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_3150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_3150'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3150 START')
        await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
          console.info(`${TAG} addSlot_9 Promise success`)
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} addSlot_9 Promise err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3150 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_3300
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_3300
     * @tc.desc      : NotificationSlot for other purposes
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_3300'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3300 START')
        await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
          console.info(`${TAG} addSlot_10 Promise success`)
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} addSlot_10 Promise err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3300 END')
      })


    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_3450
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_3450
     * @tc.desc      : Get the UNKNOWN_TYPE type slot without add
     */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_3450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_3450'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3450 START')
        notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE,
          (err: BusinessError | null, NotificationSlot) => {
            if (err) {
              console.info(`${TAG} getSlot_1 AsyncCallback err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} getSlot_1 AsyncCallback success: ${NotificationSlot}`)
              expect(true).assertTrue()
              done()
            }
          })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3450 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_3600
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_3600
     * @tc.desc      : Get the SOCIAL_COMMUNICATION type slot without add
     */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_3600'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3600 START')
        notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION,
          (err: BusinessError | null, NotificationSlot): void => {
            if (err) {
              console.info(`${TAG} getSlot_2 AsyncCallback err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} getSlot_2 AsyncCallback success: ${NotificationSlot}`)
              expect(true).assertTrue()
              done()
            }
          })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3600 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_3750
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_3750
     * @tc.desc      : Get the SERVICE_INFORMATION type slot without add
     */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_3750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_3750'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3750 START')
        notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION,
          (err: BusinessError | null, NotificationSlot) => {
            if (err) {
              console.info(`${TAG} getSlot_3 AsyncCallback err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} getSlot_3 AsyncCallback success: ${NotificationSlot}`)
              expect(true).assertTrue()
              done()
            }
          })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3750 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_3800
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_3800
     * @tc.desc      : Get the CONTENT_INFORMATION type slot without add
     */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_3800'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3800 START')
        notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION,
          (err: BusinessError | null, NotificationSlot) => {
            if (err) {
              console.info(`${TAG} getSlot_4 AsyncCallback err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} getSlot_4 AsyncCallback success: ${NotificationSlot}`)
              expect(true).assertTrue()
              done()
            }
          })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3800 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_3900
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_3900
     * @tc.desc      : Get the OTHER_TYPES type slot without add
     */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_3900'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3900 START')
        notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES,
          (err: BusinessError | null, NotificationSlot) => {
            if (err) {
              console.info(`${TAG} getSlot_5 AsyncCallback err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} getSlot_5 AsyncCallback success: ${NotificationSlot}`)
              expect(true).assertTrue()
              done()
            }
          })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_3900 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_4000
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_4000
     * @tc.desc      : Get the UNKNOWN_TYPE type slot without add
     */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_4000'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4000 START')
        notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE)
          .then((NotificationSlot: notificationManager.NotificationSlot) => {
            console.info(`${TAG} getSlot_6 Promise success: ${NotificationSlot}`)
            expect(true).assertTrue()
            done()
          })
          .catch((err: BusinessError): void => {
            console.info(`${TAG} getSlot_6 Promise err: ${err.code}`)
            expect(false).assertTrue()
            done()
          })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4000 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_4100
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_4100
     * @tc.desc      : Get the SOCIAL_COMMUNICATION type slot without add
     */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_4100'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4100 START')
        await notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION)
          .then((NotificationSlot: notificationManager.NotificationSlot) => {
            console.info(`${TAG} getSlot_7 Promise success: ${NotificationSlot}`)
            expect(true).assertTrue()
            done()
          })
          .catch((err: BusinessError): void => {
            console.info(`${TAG} getSlot_7 Promise err: ${err.code}`)
            expect(false).assertTrue()
            done()
          })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4100 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_4200
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_4200
     * @tc.desc      : Get the SERVICE_INFORMATION type slot without add
     */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_4200'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4200 START')
        await notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION)
          .then((NotificationSlot: notificationManager.NotificationSlot) => {
            console.info(`${TAG} getSlot_8 Promise success: ${NotificationSlot}`)
            expect(true).assertTrue()
            done()
          })
          .catch((err: BusinessError): void => {
            console.info(`${TAG} getSlot_8 Promise err: ${err.code}`)
            expect(false).assertTrue()
            done()
          })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4200 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_4300
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_4300
     * @tc.desc      : Get the CONTENT_INFORMATION type slot without add
     */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_4300'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4300 START')
        await notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION)
          .then((NotificationSlot: notificationManager.NotificationSlot) => {
            console.info(`${TAG} getSlot_9 Promise success: ${NotificationSlot}`)
            expect(true).assertTrue()
            done()
          })
          .catch((err: BusinessError): void => {
            console.info(`${TAG} getSlot_9 Promise err: ${err.code}`)
            expect(false).assertTrue()
            done()
          })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4300 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_4400
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_4400
     * @tc.desc      : Get the OTHER_TYPES type slot without add
     */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_4400'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4400 START')
        await notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES)
          .then((NotificationSlot: notificationManager.NotificationSlot) => {
            console.info(`${TAG} getSlot_10 Promise success: ${NotificationSlot}`)
            expect(true).assertTrue()
            done()
          })
          .catch((err: BusinessError): void => {
            console.info(`${TAG} getSlot_10 Promise err: ${err.code}`)
            expect(false).assertTrue()
            done()
          })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4400 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_Static_1900
     * @tc.name      : Sub_Notification_Ans_Slot_DeleteSlot_Static_1900
     * @tc.desc      : Remove the UNKNOWN_TYPE type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1900'
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1900 START')
        notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeSlot_1 err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_1 success`)
            expect(true).assertTrue()
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_1900 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_Static_2000
     * @tc.name      : Sub_Notification_Ans_Slot_DeleteSlot_Static_2000
     * @tc.desc      : Remove the SOCIAL_COMMUNICATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_2000'
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2000 START')
        notificationManager.removeSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeSlot_2 err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_2 success`)
            expect(true).assertTrue()
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2000 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_Static_2100
     * @tc.name      : Sub_Notification_Ans_Slot_DeleteSlot_Static_2100
     * @tc.desc      : Remove the SERVICE_INFORMATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_2100'
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2100 START')
        notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeSlot_3 err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_3 success`)
            expect(true).assertTrue()
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2100 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_Static_2200
     * @tc.name      : Sub_Notification_Ans_Slot_DeleteSlot_Static_2200
     * @tc.desc      : Remove the CONTENT_INFORMATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_2200'
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2200 START')
        notificationManager.removeSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeSlot_4 err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_4 success`)
            expect(true).assertTrue()
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2200 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_Static_2300
     * @tc.name      : Sub_Notification_Ans_Slot_DeleteSlot_Static_2300
     * @tc.desc      : Remove the OTHER_TYPES type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_2300'
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2300 START')
        notificationManager.removeSlot(notificationManager.SlotType.OTHER_TYPES, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeSlot_5 err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_5 success`)
            expect(true).assertTrue()
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2300 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_Static_2400
     * @tc.name      : Sub_Notification_Ans_Slot_DeleteSlot_Static_2400
     * @tc.desc      : Remove the UNKNOWN_TYPE type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_2400'
        await notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
          console.info(`${TAG} removeSlot_6 success`)
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} removeSlot_6 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2400 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_Static_2500
     * @tc.name      : Sub_Notification_Ans_Slot_DeleteSlot_Static_2500
     * @tc.desc      : Remove the SOCIAL_COMMUNICATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_2500'
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_2500 START')
        await notificationManager.removeSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
          console.info(`${TAG} removeSlot_7 success`)
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} removeSlot_7 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2500 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_Static_2600
     * @tc.name      : Sub_Notification_Ans_Slot_DeleteSlot_Static_2600
     * @tc.desc      : Remove the SERVICE_INFORMATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_2600'
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2600 START')
        await notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
          console.info(`${TAG} removeSlot_8 success`)
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} removeSlot_8 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2600 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_Static_2700
     * @tc.name      : Sub_Notification_Ans_Slot_DeleteSlot_Static_2700
     * @tc.desc      : Remove the CONTENT_INFORMATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_2700'
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2700 START')
        await notificationManager.removeSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
          console.info(`${TAG} removeSlot_9 success`)
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} removeSlot_9 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2700 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_Static_2800
     * @tc.name      : Sub_Notification_Ans_Slot_DeleteSlot_Static_2800
     * @tc.desc      : Remove the OTHER_TYPES type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_2800'
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2800 START')
        await notificationManager.removeSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
          console.info(`${TAG} removeSlot_10 success`)
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} removeSlot_10 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2800 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_4500
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_4500
     * @tc.desc      : Get Remove the UNKNOWN_TYPE type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_4500'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4500 START')
        await notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
          console.info(`${TAG} addSlot_11 success`)
          expect(true).assertTrue()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} addSlot_11 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })

        notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE,
          (err: BusinessError | null, NotificationSlot) => {
            if (err) {
              console.info(`${TAG} getSlot UNKNOWN_TYPE err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} getSlot UNKNOWN_TYPE success: ${NotificationSlot}`)
              expect(true).assertTrue()
              notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err: BusinessError | null) => {
                if (err) {
                  console.info(`${TAG} removeSlot UNKNOWN_TYPE err: ${err.code}`)
                  expect(false).assertTrue()
                  done()
                } else {
                  console.info(`${TAG} removeSlot UNKNOWN_TYPE success`)
                  expect(true).assertTrue()
                  done()
                }
              })
              done()
            }
          })

        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4500 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_4600
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_4600
     * @tc.desc      : Get Remove the SOCIAL_COMMUNICATION type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_4600'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4600 START')
        await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
          console.info(`${TAG} addSlot_12 success`)
          expect(true).assertTrue()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} addSlot_12 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })

        notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION,
          (err: BusinessError | null, NotificationSlot) => {
            if (err) {
              console.info(`${TAG} getSlot SOCIAL_COMMUNICATION err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} getSlot SOCIAL_COMMUNICATION success: ${NotificationSlot}`)
              expect(true).assertTrue()
              notificationManager.removeSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err: BusinessError | null) => {
                if (err) {
                  console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION err: ${err.code}`)
                  expect(false).assertTrue()
                  done()
                } else {
                  console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION success`)
                  expect(true).assertTrue()
                  done()
                }
              })
              done()
            }
          })

        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4600 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_4700
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_4700
     * @tc.desc      : Get Remove the SERVICE_INFORMATION type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_4700'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4700 START')
        await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
          console.info(`${TAG} addSlot_13 success`)
          expect(true).assertTrue()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} addSlot_13 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })

        notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION,
          (err: BusinessError | null, NotificationSlot) => {
            if (err) {
              console.info(`${TAG} getSlot SERVICE_INFORMATION err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} getSlot SERVICE_INFORMATION success: ${NotificationSlot}`)
              expect(true).assertTrue()
              notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null) => {
                if (err) {
                  console.info(`${TAG} removeSlot SERVICE_INFORMATION err: ${err.code}`)
                  expect(false).assertTrue()
                  done()
                } else {
                  console.info(`${TAG} removeSlot SERVICE_INFORMATION success`)
                  expect(true).assertTrue()
                  done()
                }
              })
              done()
            }
          })

        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4700 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_4800
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_4800
     * @tc.desc      : Get Remove the CONTENT_INFORMATION type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_4800'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4800 START')
        await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
          console.info(`${TAG} addSlot_14 success`)
          expect(true).assertTrue()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} addSlot_14 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })

        notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION,
          (err: BusinessError | null, NotificationSlot) => {
            if (err) {
              console.info(`${TAG} getSlot CONTENT_INFORMATION err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} getSlot CONTENT_INFORMATION success: ${NotificationSlot}`)
              expect(true).assertTrue()
              notificationManager.removeSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null) => {
                if (err) {
                  console.info(`${TAG} removeSlot CONTENT_INFORMATION err: ${err.code}`)
                  expect(false).assertTrue()
                  done()
                } else {
                  console.info(`${TAG} removeSlot CONTENT_INFORMATION success`)
                  expect(true).assertTrue()
                  done()
                }
              })
              done()
            }
          })


        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4800 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_4900
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_4900
     * @tc.desc      : Get Remove the OTHER_TYPES type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_4900'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4900 START')
        await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
          console.info(`${TAG} addSlot_15 success`)
          expect(true).assertTrue()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} addSlot_15 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })

        notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES,
          (err: BusinessError | null, NotificationSlot) => {
            if (err) {
              console.info(`${TAG} getSlot OTHER_TYPES err: ${err.code}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} getSlot OTHER_TYPES success: ${NotificationSlot}`)
              expect(true).assertTrue()
              notificationManager.removeSlot(notificationManager.SlotType.OTHER_TYPES, (err: BusinessError | null) => {
                if (err) {
                  console.info(`${TAG} removeSlot CONTENT_INFORMATION err: ${err.code}`)
                  expect(false).assertTrue()
                  done()
                } else {
                  console.info(`${TAG} removeSlot CONTENT_INFORMATION success`)
                  expect(true).assertTrue()
                  done()
                }
              })
              done()
            }
          })


        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_4900 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_5000
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_5000
     * @tc.desc      : Get Remove the UNKNOWN_TYPE type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_5000'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5000 START')
        await notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
          console.info(`${TAG} addSlot_16 success`)
          expect(true).assertTrue()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} addSlot_16 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })

        await notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE)
          .then((NotificationSlot: notificationManager.NotificationSlot) => {
            console.info(`${TAG} getSlot UNKNOWN_TYPE success: ${NotificationSlot}`)
            expect(true).assertTrue()
            done()
          })
          .catch((err: BusinessError): void => {
            console.info(`${TAG} getSlot UNKNOWN_TYPE err: ${err.code}`)
            expect(false).assertTrue()
            done()
          })

        await notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
          console.info(`${TAG} removeSlot UNKNOWN_TYPE success`)
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} removeSlot UNKNOWN_TYPE err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5000 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_5100
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_5100
     * @tc.desc      : Get Remove the SOCIAL_COMMUNICATION type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_5100'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5100 START')
        await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
          console.info(`${TAG} addSlot_17 success`)
          expect(true).assertTrue()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} addSlot_17 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })

        await notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION)
          .then((NotificationSlot: notificationManager.NotificationSlot) => {
            console.info(`${TAG} getSlot SOCIAL_COMMUNICATION success: ${NotificationSlot}`)
            expect(true).assertTrue()
            done()
          })
          .catch((err: BusinessError): void => {
            console.info(`${TAG} getSlot SOCIAL_COMMUNICATION err: ${err.code}`)
            expect(false).assertTrue()
            done()
          })

        await notificationManager.removeSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
          console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION success`)
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5100 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_5200
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_5200
     * @tc.desc      : Get Remove the SERVICE_INFORMATION type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_5200'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5200 START')
        await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
          console.info(`${TAG} addSlot_18 success`)
          expect(true).assertTrue()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} addSlot_18 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })

        await notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION)
          .then((NotificationSlot: notificationManager.NotificationSlot) => {
            console.info(`${TAG} getSlot SERVICE_INFORMATION success: ${NotificationSlot}`)
            expect(true).assertTrue()
            done()
          })
          .catch((err: BusinessError): void => {
            console.info(`${TAG} getSlot SERVICE_INFORMATION err: ${err.code}`)
            expect(false).assertTrue()
            done()
          })

        await notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
          console.info(`${TAG} removeSlot SERVICE_INFORMATION success`)
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} removeSlot SERVICE_INFORMATION err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5200 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_5300
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_5300
     * @tc.desc      : Get Remove the CONTENT_INFORMATION type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_5300'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5300 START')
        await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
          console.info(`${TAG} addSlot_19 success`)
          expect(true).assertTrue()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} addSlot_19 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })

        await notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION)
          .then((NotificationSlot: notificationManager.NotificationSlot) => {
            console.info(`${TAG} getSlot CONTENT_INFORMATION success: ${NotificationSlot}`)
            expect(true).assertTrue()
            done()
          })
          .catch((err: BusinessError): void => {
            console.info(`${TAG} getSlot CONTENT_INFORMATION err: ${err.code}`)
            expect(false).assertTrue()
            done()
          })

        await notificationManager.removeSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
          console.info(`${TAG} removeSlot CONTENT_INFORMATION success`)
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} removeSlot CONTENT_INFORMATION err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5300 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_5400
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_5400
                       removeSlot(slotType: SlotType, callback: AsyncCallback<void>): void
     * @tc.desc      : Get Remove the OTHER_TYPES type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_5400'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5400 START')
        await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
          console.info(`${TAG} addSlot_20 success`)
          expect(true).assertTrue()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} addSlot_20 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })

        await notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES)
          .then((NotificationSlot: notificationManager.NotificationSlot) => {
            console.info(`${TAG} getSlot OTHER_TYPES success: ${NotificationSlot}`)
            expect(true).assertTrue()
            done()
          })
          .catch((err: BusinessError): void => {
            console.info(`${TAG} getSlot OTHER_TYPES err: ${err.code}`)
            expect(false).assertTrue()
            done()
          })

        await notificationManager.removeSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
          console.info(`${TAG} removeSlot OTHER_TYPES success`)
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} removeSlot OTHER_TYPES err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5400 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_5500
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_5500
     * @tc.desc      : Get the Different type slot after add
     */
    //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_5500'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5500 START')
        await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
          console.info(`${TAG} addSlot_21 success`)
          expect(true).assertTrue()
        }).catch((err:BusinessError):void => {
          console.info(`${TAG} addSlot_21 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })

        notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null, NotificationSlot) => {
          if (err) {
            console.info(`${TAG} getSlot_21 err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_21 success: ${NotificationSlot}`)
            expect(true).assertTrue()
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5500 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_5600
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_5600
     * @tc.desc      : Remove the Different type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_5600'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5600 START')
        await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
          console.info(`${TAG} addSlot_22 success`)
          expect(true).assertTrue()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} addSlot_22 err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })

        notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} getSlot_22 err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_22 success`)
            expect(true).assertTrue()
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5600 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_Static_2900
     * @tc.name      : Sub_Notification_Ans_Slot_DeleteSlot_Static_2900
     * @tc.desc      : Removes all NotificationSlot
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_2900'
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2900 START')
        notificationManager.removeAllSlots((err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeAllSlots AsyncCallback err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeAllSlots AsyncCallback success`)
            expect(true).assertTrue()
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_2900 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_Static_3000
     * @tc.name      : Sub_Notification_Ans_Slot_DeleteSlot_Static_3000
     * @tc.desc      : Removes all NotificationSlot
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_3000'
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_3000 START')
        await notificationManager.removeAllSlots().then(() => {
          console.info(`${TAG} removeAllSlots Promise success`)
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} removeAllSlots Promise err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_3000 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_Static_2400
     * @tc.name      : Sub_Notification_Ans_Slot_GetSlot_Static_2400
     * @tc.desc      : Get all NotificationSlot without add
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_GetSlot_Static_2400'
        console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2400 START')
        notificationManager.getSlots((err: BusinessError | null,
          NotificationSlot: Array<notificationManager.NotificationSlot>| undefined) => {
          if (err) {
            console.info(`${TAG} getSlots AsyncCallback err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlots AsyncCallback success: ${NotificationSlot}`)
            expect(true).assertTrue()
            done()
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2400 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_Static_2500
     * @tc.name      : Sub_Notification_Ans_Slot_GetSlot_Static_2500
     * @tc.desc      : Get all NotificationSlot without add
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_GetSlot_Static_2500'
        console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2500 START')
        await notificationManager.getSlots().then((NotificationSlot: Array<notificationManager.NotificationSlot>) => {
          console.info(`${TAG} getSlots Promise success: ${NotificationSlot}`)
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} getSlots Promise err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_2500 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_5700
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_5700
     * @tc.desc      : Get all slots after add
                       UNKNOWN_TYPE and OTHER_TYPES is same in ANS
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_5700'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5700 START')

        notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot SOCIAL_COMMUNICATION err: + ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot SOCIAL_COMMUNICATION success`)
            expect(true).assertTrue()
          }
        })

        await Utils.msSleep(1000)

        notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot SERVICE_INFORMATION err: + ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot SERVICE_INFORMATION success`)
            expect(true).assertTrue()
          }
        })

        await Utils.msSleep(1000)

        notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot CONTENT_INFORMATION err: + ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot CONTENT_INFORMATION success`)
            expect(true).assertTrue()
          }
        })

        await Utils.msSleep(1000)

        notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot OTHER_TYPES err: + ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot OTHER_TYPES success`)
            expect(true).assertTrue()
          }
        })

        await Utils.msSleep(1000)

        notificationManager.getSlots((err: BusinessError | null,
          NotificationSlot: Array<notificationManager.NotificationSlot>|undefined): void => {
          if (err) {
            console.info(`${TAG} getSlots AsyncCallback err: + ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlots AsyncCallback success:`)
            if(NotificationSlot !== undefined){
              for (let i = 0; i < NotificationSlot.length; i++) {
                console.info(`${TAG} NotificationSlot[${i}].type:` + NotificationSlot[i].notificationType)
                let num = NotificationSlot[i].notificationType as notificationManager.SlotType
                if (num == 1) {
                  expect(num == 1).assertTrue()
                } else if (num == 2) {
                  expect(num == 2).assertTrue()
                } else if (num == 3) {
                  expect(num == 3).assertTrue()
                } else {
                  expect(num == 65535).assertTrue()
                }
              }
              done()
            }else{
              expect(false).assertTrue()
              done()
            }
          }
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5700 END')
      })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_5800
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_5800
     * @tc.desc      : Get all slots after add
                       UNKNOWN_TYPE and OTHER_TYPES is same in ANS
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_5800'
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5800 START')

        notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot SOCIAL_COMMUNICATION err: + ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot SOCIAL_COMMUNICATION success`)
            expect(true).assertTrue()
          }
        })

        await Utils.msSleep(1000)

        notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot SERVICE_INFORMATION err: + ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot SERVICE_INFORMATION success`)
            expect(true).assertTrue()
          }
        })

        await Utils.msSleep(1000)

        notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot CONTENT_INFORMATION err: + ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot CONTENT_INFORMATION success`)
            expect(true).assertTrue()
          }
        })

        await Utils.msSleep(1000)

        notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot OTHER_TYPES err: + ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot OTHER_TYPES success`)
            expect(true).assertTrue()
          }
        })

        await Utils.msSleep(1000)

        await notificationManager.getSlots().then((NotificationSlot: Array<notificationManager.NotificationSlot>) => {
          console.info(`${TAG} getSlots Promise success:`)
          for (let i = 0; i < NotificationSlot.length; i++) {
            console.info(`${TAG} NotificationSlot[${i}].type:` + NotificationSlot[i].notificationType)
            let num = NotificationSlot[i].notificationType as notificationManager.SlotType
            if (num == 1) {
              expect(num == 1).assertTrue()
            } else if (num == 2) {
              expect(num == 2).assertTrue()
            } else if (num == 3) {
              expect(num == 3).assertTrue()
            } else {
              expect(num == 65535).assertTrue()
            }
          }
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${TAG} getSlots Promise err: + ${err.code}`)
          expect(false).assertTrue()
          done()
        })
        console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_5800 END')
      })

    //问题单号：DTS2025060627133
    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_SLOT_TEST_Static_4900
     * @tc.name      : SUB_NOTIFICATION_ANS_SLOT_TEST_Static_4900
     * @tc.desc      : Get the OTHER_TYPES type slot without add
     */
    // it('SUB_NOTIFICATION_ANS_SLOT_TEST_Static_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    //   async (done: () => void): Promise<void> => {
    //     let TAG: string = 'SUB_NOTIFICATION_ANS_SLOT_TEST_Static_4900'
    //   console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_4900 START')
    //   await notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES, undefined).then((NotificationSlot) => {
    //     console.info(`${TAG} getSlot_49 Promise success: ${NotificationSlot}`)
    //     expect(true).assertTrue()
    //     done()
    //   }).catch((err) => {
    //     console.info(`${TAG} getSlot_49 Promise err: ${err.code}`)
    //     expect(false).assertTrue()
    //     done()
    //   })
    //   console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_4900 END')
    // })
    //

    //问题单号：DTS2025060627133
    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_SLOT_TEST_Static_5000
     * @tc.name      : SUB_NOTIFICATION_ANS_SLOT_TEST_Static_5000
     * @tc.desc      : NotificationSlot of an unknown type
     */
    // it('SUB_NOTIFICATION_ANS_SLOT_TEST_Static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    //   async (done: () => void): Promise<void> => {
    //   console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_5000 START')
    //   await notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE, undefined).then(() => {
    //     console.info(`${TAG} addSlot_50 Promise success`)
    //     expect(true).assertTrue()
    //     done()
    //   }).catch((err) => {
    //     console.info(`${TAG} addSlot_50 Promise err: ${err.code}`)
    //     expect(false).assertTrue()
    //     done()
    //   })
    //   console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_5000 END')
    // })
    //

    //问题单号：DTS2025060627133
    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_SLOT_TEST_Static_5100
     * @tc.name      : SUB_NOTIFICATION_ANS_SLOT_TEST_Static_5100
     * @tc.desc      : Get all NotificationSlot without add
     */
    // it('SUB_NOTIFICATION_ANS_SLOT_TEST_Static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    //   async (done: () => void): Promise<void> => {
    //   console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_5100 START')
    //   await notificationManager.getSlots(undefined).then((NotificationSlot) => {
    //     console.info(`${TAG} getSlots_51 Promise success: ${NotificationSlot}`)
    //     expect(true).assertTrue()
    //     done()
    //   }).catch((err) => {
    //     console.info(`${TAG} getSlots_51 Promise err: ${err.code}`)
    //     expect(false).assertTrue()
    //     done()
    //   })
    //   console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_5100 END')
    // })
    //

    //问题单号：DTS2025060627133
    /*
     * @tc.number:SUB_NOTIFICATION_ANS_SLOT_TEST_Static_5200
     * @tc.name:SUB_NOTIFICATION_ANS_SLOT_TEST_Static_5200
     * @tc.desc:Remove the UNKNOWN_TYPE type slot without add
      */
    // it('SUB_NOTIFICATION_ANS_SLOT_TEST_Static_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    //   async (done: () => void): Promise<void> => {
    //   console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_5200 START')
    //   await notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE, undefined).then(() => {
    //     console.info(`${TAG} removeSlot_52 success`)
    //     expect(true).assertTrue()
    //     done()
    //   }).catch((err) => {
    //     console.info(`${TAG} removeSlot_52 err: ${err.code}`)
    //     expect(false).assertTrue()
    //     done()
    //   })
    //   console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_5200 END')
    // })
    //

    //问题单号：DTS2025060627133
    /*
     * @tc.number:SUB_NOTIFICATION_ANS_SLOT_TEST_Static_5300
     * @tc.name:SUB_NOTIFICATION_ANS_SLOT_TEST_Static_5300
     * @tc.desc:Removes all NotificationSlot
     */
    // it('SUB_NOTIFICATION_ANS_SLOT_TEST_Static_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    //   async (done: () => void): Promise<void> => {
    //   console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_5300 START')
    //   await notificationManager.removeAllSlots(undefined).then(() => {
    //     console.info(`${TAG} removeAllSlots_53 Promise success`)
    //     expect(true).assertTrue()
    //     done()
    //   }).catch((err) => {
    //     console.info(`${TAG} removeAllSlots_53 Promise err: ${err.code}`)
    //     expect(false).assertTrue()
    //     done()
    //   })
    //   console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST_5300 END')
    // })
    //
    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_SLOT_ENUM_TEST_Static_0100
     * @tc.name      : SUB_NOTIFICATION_ANS_SLOT_ENUM_TEST_Static_0100
     * @tc.desc      : SlotType
     */
    it('SUB_NOTIFICATION_ANS_SLOT_ENUM_TEST_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_ANS_SLOT_ENUM_TEST_Static_0100'
        console.info(`${TAG} SUB_NOTIFICATION_ANS_SLOT_ENUM_TEST_0100 START`)
        expect(notificationManager.SlotType.UNKNOWN_TYPE as number).assertEqual(0)
        expect(notificationManager.SlotType.SOCIAL_COMMUNICATION as number).assertEqual(1)
        expect(notificationManager.SlotType.SERVICE_INFORMATION as number).assertEqual(2)
        expect(notificationManager.SlotType.CONTENT_INFORMATION as number).assertEqual(3)
        expect(notificationManager.SlotType.OTHER_TYPES as number).assertEqual(0xFFFF)
        expect(notificationManager.SlotLevel.LEVEL_NONE as number).assertEqual(0)
        expect(notificationManager.SlotLevel.LEVEL_MIN as number).assertEqual(1)
        expect(notificationManager.SlotLevel.LEVEL_LOW as number).assertEqual(2)
        expect(notificationManager.SlotLevel.LEVEL_DEFAULT as number).assertEqual(3)
        expect(notificationManager.SlotLevel.LEVEL_HIGH as number).assertEqual(4)
        done()
      })
    console.info(TAG + 'SUB_NOTIFICATION_ANS_SLOT_TEST END')
  })
}
