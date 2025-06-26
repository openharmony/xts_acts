/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import notificationManager from '@ohos.notificationManager'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '../../../hypium/index'
import {BusinessError} from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { Component, Driver, ON, loadAndSetUpUiTest } from '@ohos.UiTest'
let domain:number = 0x000
let bundle_name:string = "com.example.actsnotificationmanagerslot.static"
let testAbilityContext:common.UIAbilityContext;

export default function ActsNotificationManagerSlotTest() {
  describe('SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST', () => {
    let TAG:string = 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST START')
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
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          hilog.info(domain, TAG, '%{public}s', '-----'+ err.code);
        }
        hilog.info(domain, TAG, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b" + bundle_name)
      await Utils.msSleep(2000)
      hilog.info(domain, TAG, '%{public}s', 'beforeAll end');
    })

    beforeEach(() => {
      console.info(`${TAG} afterEach START`)
      await notificationManager.removeAllSlots()
      await Utils.msSleep(1000)
      console.info(`${TAG} afterEach END`)
    })


    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_8200
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_8200
     * @tc.desc      : NotificationSlot of an unknown SlotType
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_8200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_8200 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8200 START')
      try {
        notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot_1 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_1 AsyncCallback success`)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err: BusinessError) {
        console.info(`${TAG} addSlot_1 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8200 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_8250
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_8250
     * @tc.desc      : NotificationSlot for social communication
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_8250', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_8250 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8250 START')
      try {
        notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot_2 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_2 AsyncCallback success`)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err: BusinessError) {
        console.info(`${TAG} addSlot_2 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8250 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_8300
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_8300
     * @tc.desc      : NotificationSlot for service information
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_8300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_8300 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8300 START')
      try {
        notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot_3 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_3 AsyncCallback success`)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err: BusinessError) {
        console.info(`${TAG} addSlot_3 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8300 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_8350
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_8350
     * @tc.desc      : NotificationSlot for content information
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_8350', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_8350 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8350 START')
      try {
        notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot_4 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_4 AsyncCallback success`)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err: BusinessError) {
        console.info(`${TAG} addSlot_4 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8350 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_8400
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_8400
     * @tc.desc      : NotificationSlot for other purposes
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_8400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_8400 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8400 START')
      try {
        notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot_5 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_5 AsyncCallback success`)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err: BusinessError) {
        console.info(`${TAG} addSlot_5 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8400 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_8450
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_8450
     * @tc.desc      : NotificationSlot of an unknown type
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_8450', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_8450 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8450 START')
      await notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} addSlot_6 Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot_6 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8450 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_8500
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_8500
     * @tc.desc      : NotificationSlot for social communication
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_8500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_8500 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8500 START')
      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_7 Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot_7 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8500 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_8550
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_8550
     * @tc.desc      : NotificationSlot for service information
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_8550', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_8550 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8550 START')
      await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_8 Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot_8 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8550 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_8600
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_8600
     * @tc.desc      : NotificationSlot for content information
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_8600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_8600 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8600 START')
      await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_9 Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot_9 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8600 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_8650
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_8650
     * @tc.desc      : NotificationSlot for other purposes
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_8650', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_8650 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8650 START')
      await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} addSlot_10 Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot_10 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_8650 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_Static_1200
     * @tc.name      : Sub_Notification_Ans_Slot_GetSlot_Static_1200
     * @tc.desc      : Get the UNKNOWN_TYPE type slot without add
     */
     //问题单号:DTS2025060627133
    it('Sub_Notification_Ans_Slot_GetSlot_Static_1200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_1200 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1200 START')
      try {
        notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err: BusinessError | null, data: notificationManager.NotificationSlot|undefined) => {
          if (err) {
            console.info(`${TAG} getSlot_1 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_1 AsyncCallback `)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err: BusinessError) {
        console.info(`${TAG} getSlot_1 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1200 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_Static_1300
     * @tc.name      : Sub_Notification_Ans_Slot_GetSlot_Static_1300
     * @tc.desc      : Get the SOCIAL_COMMUNICATION type slot without add
     */
     //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Slot_GetSlot_Static_1300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_1300 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1300 START')
      try {
        notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err: BusinessError | null, data: notificationManager.NotificationSlot|undefined) => {
          if (err) {
            console.info(`${TAG} getSlot_2 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_2 AsyncCallback `)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err: BusinessError) {
        console.info(`${TAG} getSlot_2 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1300 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_Static_1400
     * @tc.name      : Sub_Notification_Ans_Slot_GetSlot_Static_1400
     * @tc.desc      : Get the SERVICE_INFORMATION type slot without add
     */
     //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Slot_GetSlot_Static_1400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_1400 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1400 START')
      try {
        notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null, data: notificationManager.NotificationSlot|undefined) => {
          if (err) {
            console.info(`${TAG} getSlot_3 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_3 AsyncCallback `)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err: BusinessError) {
        console.info(`${TAG} getSlot_3 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1400 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_Static_1500
     * @tc.name      : Sub_Notification_Ans_Slot_GetSlot_Static_1500
     * @tc.desc      : Get the CONTENT_INFORMATION type slot without add
     */
     //问题单号：DTS2025060627133
    it('Sub_Notification_Ans_Slot_GetSlot_Static_1500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_1500 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_1500 START')
      try {
        notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null, data: notificationManager.NotificationSlot|undefined) => {
          if (err) {
            console.info(`${TAG} getSlot_4 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_4 AsyncCallback `)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err: BusinessError) {
        console.info(`${TAG} getSlot_4 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1500 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_Static_1600
     * @tc.name      : Sub_Notification_Ans_Slot_GetSlot_Static_1600
     * @tc.desc      : Get the OTHER_TYPES type slot without add
     */
     //问题单号:DTS2025060627133
    it('Sub_Notification_Ans_Slot_GetSlot_Static_1600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_1600 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1600 START')
      try {
        notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES, (err: BusinessError | null, data: notificationManager.NotificationSlot|undefined) => {
          if (err) {
            console.info(`${TAG} getSlot_5 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_5 AsyncCallback `)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err: BusinessError) {
        console.info(`${TAG} getSlot_5 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1600 END')
    })


    //问题单号:DTS2025060627133
    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_Static_1700
     * @tc.name      : Sub_Notification_Ans_Slot_GetSlot_Static_1700
     * @tc.desc      : Get the UNKNOWN_TYPE type slot without add
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_1700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_1700 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1700 START')
      await notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE).then((data: notificationManager.NotificationSlot) => {
        console.info(`${TAG} getSlot_6 Promise `)
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} getSlot_6 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
        
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1700 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_Static_1800
     * @tc.name      : Sub_Notification_Ans_Slot_GetSlot_Static_1800
     * @tc.desc      : Get the SOCIAL_COMMUNICATION type slot without add
     */
     //问题单号:DTS2025060627133
    it('Sub_Notification_Ans_Slot_GetSlot_Static_1800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_1800 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1800 START')
      await notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then((data: notificationManager.NotificationSlot) => {
        console.info(`${TAG} getSlot_7 Promise `)
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} getSlot_7 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1800 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_Static_1900
     * @tc.name      : Sub_Notification_Ans_Slot_GetSlot_Static_1900
     * @tc.desc      : Get the SERVICE_INFORMATION type slot without add
     */
     //问题单号:DTS2025060627133
    it('Sub_Notification_Ans_Slot_GetSlot_Static_1900',TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_1900 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1900 START')
      await notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION).then((data: notificationManager.NotificationSlot) => {
        console.info(`${TAG} getSlot_8 Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} getSlot_8 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
        
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_1900 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_Static_2000
     * @tc.name      : Sub_Notification_Ans_Slot_GetSlot_Static_2000
     * @tc.desc      : Get the CONTENT_INFORMATION type slot without add
     */
     //问题单号:DTS2025060627133
    it('Sub_Notification_Ans_Slot_GetSlot_Static_2000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_2000 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_2000 START')
      await notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION).then((data: notificationManager.NotificationSlot) => {
        console.info(`${TAG} getSlot_9 Promise `)
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} getSlot_9 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_2000 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_Static_2100
     * @tc.name      : Sub_Notification_Ans_Slot_GetSlot_Static_2100
     * @tc.desc      : Get the OTHER_TYPES type slot without add
     */
     //问题单号:DTS2025060627133
    it('Sub_Notification_Ans_Slot_GetSlot_Static_2100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_2100 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_2100 START')
      await notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES).then((data: notificationManager.NotificationSlot) => {
        console.info(`${TAG} getSlot_10 Promise ` )
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} getSlot_10 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
        
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_2100 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_Static_0700
     * @tc.name      : Sub_Notification_Ans_Slot_DeleteSlot_Static_0700
     * @tc.desc      : Remove the UNKNOWN_TYPE type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_0700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_0700 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_0700 START')
      try {
        notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeSlot_1 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_1 success`)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err: BusinessError) {
        console.info(`${TAG} removeSlot_1 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_0700 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_Static_0800
     * @tc.name      : Sub_Notification_Ans_Slot_DeleteSlot_Static_0800
     * @tc.desc      : Remove the SOCIAL_COMMUNICATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_0800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_0800 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_0800 START')
      try {
        notificationManager.removeSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeSlot_2 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_2 success`)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err: BusinessError) {
        console.info(`${TAG} removeSlot_2 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_0800 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_Static_0900
     * @tc.name      : Sub_Notification_Ans_Slot_DeleteSlot_Static_0900
     * @tc.desc      : Remove the SERVICE_INFORMATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_0900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_0900 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_0900 START')
      try {
        notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeSlot_3 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_3 success`)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err: BusinessError) {
        console.info(`${TAG} removeSlot_3 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_0900 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_Static_1000
     * @tc.name      : Sub_Notification_Ans_Slot_DeleteSlot_Static_1000
     * @tc.desc      : Remove the CONTENT_INFORMATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_1000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1000 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1000 START')
      try {
        notificationManager.removeSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeSlot_4 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_4 success`)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err: BusinessError) {
        console.info(`${TAG} removeSlot_4 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1000 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_Static_1100
     * @tc.name      : Sub_Notification_Ans_Slot_DeleteSlot_Static_1100
     * @tc.desc      : Remove the OTHER_TYPES type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_1100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1100 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1100 START')
      try {
        notificationManager.removeSlot(notificationManager.SlotType.OTHER_TYPES, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeSlot_5 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_5 success`)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err: BusinessError) {
        console.info(`${TAG} removeSlot_5 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1100 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_Static_1200
     * @tc.name      : Sub_Notification_Ans_Slot_DeleteSlot_Static_1200
     * @tc.desc      : Remove the UNKNOWN_TYPE type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_1200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1200 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1200 START')
      await notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} removeSlot_6 success`)
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} removeSlot_6 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1200 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_Static_1300
     * @tc.name      : Sub_Notification_Ans_Slot_DeleteSlot_Static_1300
     * @tc.desc      : Remove the SOCIAL_COMMUNICATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_1300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1300 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1300 START')
      await notificationManager.removeSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} removeSlot_7 success`)
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} removeSlot_7 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1300 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_Static_1400
     * @tc.name      : Sub_Notification_Ans_Slot_DeleteSlot_Static_1400
     * @tc.desc      : Remove the SERVICE_INFORMATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_1400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1400 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1400 START')
      await notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} removeSlot_8 success`)
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} removeSlot_8 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1400 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_Static_1500
     * @tc.name      : Sub_Notification_Ans_Slot_DeleteSlot_Static_1500
     * @tc.desc      : Remove the CONTENT_INFORMATION type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_1500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1500 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1500 START')
      await notificationManager.removeSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} removeSlot_9 success`)
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} removeSlot_9 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1500 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_Static_1600
     * @tc.name      : Sub_Notification_Ans_Slot_DeleteSlot_Static_1600
     * @tc.desc      : Remove the OTHER_TYPES type slot without add
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_1600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1600 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1600 START')
      await notificationManager.removeSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} removeSlot_10 success`)
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} removeSlot_10 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1600 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_0200
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_0200
     * @tc.desc      : Get Remove the UNKNOWN_TYPE type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_0200 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0200 START')
      await notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} addSlot_11 success`)
        expect(true).assertTrue()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot_11 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      try {
        notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err: BusinessError | null, data: notificationManager.NotificationSlot|undefined) => {
          if (err) {
            console.info(`${TAG} getSlot UNKNOWN_TYPE errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot UNKNOWN_TYPE `)
            expect(true).assertTrue()
            notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err: BusinessError | null) => {
              if (err) {
                console.info(`${TAG} removeSlot UNKNOWN_TYPE errCode: ${err.code}, errMes: ${err.message}`)
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
      } catch (err: BusinessError) {
        console.info(`${TAG} getSlot UNKNOWN_TYPE errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0200 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_0350
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_0350
     * @tc.desc      : Get Remove the SOCIAL_COMMUNICATION type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_0350', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_0350 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0350 START')
      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_12 success`)
        expect(true).assertTrue()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot_12 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      try {
        notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err: BusinessError | null, data: notificationManager.NotificationSlot|undefined) => {
          if (err) {
            console.info(`${TAG} getSlot SOCIAL_COMMUNICATION errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot SOCIAL_COMMUNICATION ` )
            expect(true).assertTrue()
            notificationManager.removeSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err: BusinessError | null) => {
              if (err) {
                console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION errCode: ${err.code}, errMes: ${err.message}`)
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
      } catch (err: BusinessError) {
        console.info(`${TAG} getSlot SOCIAL_COMMUNICATION errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0350 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_0500
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_0500
     * @tc.desc      : Get Remove the SERVICE_INFORMATION type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_0500 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0500 START')
      await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_13 success`)
        expect(true).assertTrue()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot_13 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      try {
        notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null, data: notificationManager.NotificationSlot|undefined) => {
          if (err) {
            console.info(`${TAG} getSlot SERVICE_INFORMATION errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot SERVICE_INFORMATION ` )
            expect(true).assertTrue()
            notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null) => {
              if (err) {
                console.info(`${TAG} removeSlot SERVICE_INFORMATION errCode: ${err.code}, errMes: ${err.message}`)
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
      } catch (err: BusinessError) {
        console.info(`${TAG} getSlot SERVICE_INFORMATION errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0500 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_0650
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_0650
     * @tc.desc      : Get Remove the CONTENT_INFORMATION type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_0650', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_0650 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0650 START')
      notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_14 success`)
        expect(true).assertTrue()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot_14 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      try {
        notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null, data: notificationManager.NotificationSlot|undefined) => {
          if (err) {
            console.info(`${TAG} getSlot CONTENT_INFORMATION errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot CONTENT_INFORMATION ` )
            expect(true).assertTrue()
            notificationManager.removeSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null) => {
              if (err) {
                console.info(`${TAG} removeSlot CONTENT_INFORMATION errCode: ${err.code}, errMes: ${err.message}`)
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
      } catch (err: BusinessError) {
        console.info(`${TAG} getSlot CONTENT_INFORMATION errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0650 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_0800
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_0800
     * @tc.desc      : Get Remove the OTHER_TYPES type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_0800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_0800 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0800 START')
      await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} addSlot_15 success`)
        expect(true).assertTrue()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot_15 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      try {
        notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES, (err: BusinessError | null, data: notificationManager.NotificationSlot|undefined) => {
          if (err) {
            console.info(`${TAG} getSlot OTHER_TYPES errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot OTHER_TYPES ` )
            expect(true).assertTrue()
            notificationManager.removeSlot(notificationManager.SlotType.OTHER_TYPES, (err: BusinessError | null) => {
              if (err) {
                console.info(`${TAG} removeSlot OTHER_TYPES errCode: ${err.code}, errMes: ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`${TAG} removeSlot OTHER_TYPES success`)
                expect(true).assertTrue()
                done()
              }
            })
            done()
          }
        })
      } catch (err: BusinessError) {
        console.info(`${TAG} getSlot OTHER_TYPES errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0800 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_0950
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_0950
     * @tc.desc      : Get Remove the UNKNOWN_TYPE type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_0950', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_0950 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0950 START')
      await notificationManager.addSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} addSlot_16 success`)
        expect(true).assertTrue()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot_16 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE).then((data: notificationManager.NotificationSlot) => {
        console.info(`${TAG} getSlot UNKNOWN_TYPE ` )
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} getSlot UNKNOWN_TYPE err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
        console.info(`${TAG} removeSlot UNKNOWN_TYPE success`)
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} removeSlot UNKNOWN_TYPE err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0950 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_1100
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_1100
     * @tc.desc      : Get Remove the SOCIAL_COMMUNICATION type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_1100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_1100 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_1100 START')
      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_17 success`)
        expect(true).assertTrue()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot_17 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then((data: notificationManager.NotificationSlot) => {
        console.info(`${TAG} getSlot SOCIAL_COMMUNICATION ` )
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} getSlot SOCIAL_COMMUNICATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.removeSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION success`)
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} removeSlot SOCIAL_COMMUNICATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_1100 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_1250
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_1250
     * @tc.desc      : Get Remove the SERVICE_INFORMATION type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_1250', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_1250 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_1250 START')
      await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_18 success`)
        expect(true).assertTrue()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot_18 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION).then((data: notificationManager.NotificationSlot) => {
        console.info(`${TAG} getSlot SERVICE_INFORMATION ` )
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} getSlot SERVICE_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} removeSlot SERVICE_INFORMATION success`)
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} removeSlot SERVICE_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_1250 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_1400
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_1400
     * @tc.desc      : Get Remove the CONTENT_INFORMATION type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_1400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_1400 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_1400 START')
      await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} addSlot_19 success`)
        expect(true).assertTrue()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot_19 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION).then((data: notificationManager.NotificationSlot) => {
        console.info(`${TAG} getSlot CONTENT_INFORMATION ` )
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} getSlot CONTENT_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.removeSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} removeSlot CONTENT_INFORMATION success`)
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} removeSlot CONTENT_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_1400 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_1550
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_1550
     * @tc.desc      : Get Remove the OTHER_TYPES type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_1550', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_1550 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_1550 START')
      await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} addSlot_20 success`)
        expect(true).assertTrue()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot_20 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES).then((data: notificationManager.NotificationSlot) => {
        console.info(`${TAG} getSlot OTHER_TYPES ` )
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} getSlot OTHER_TYPES err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await notificationManager.removeSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} removeSlot OTHER_TYPES success`)
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} removeSlot OTHER_TYPES err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_1550 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_1700
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_1700
     * @tc.desc      : Get the Different type slot after add
     */
    //问题单号:DTS2025060627133
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_1700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_1700 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_1700 START')
      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_21 success`)
        expect(true).assertTrue()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot_21 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      try {
        notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError | null, data: notificationManager.NotificationSlot|undefined) => {
          if (err) {
            console.info(`${TAG} getSlot_21 err: ${err}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_21 ` )
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err: BusinessError) {
        console.info(`${TAG} getSlot_21 errCode: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_1700 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_1850
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_1850
     * @tc.desc      : Remove the Different type slot after add
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_1850', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_1850 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_1850 START')
      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot_22 success`)
        expect(true).assertTrue()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot_22 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      try {
        notificationManager.removeSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeSlot err: ${err}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot success`)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err: BusinessError) {
        console.info(`${TAG} removeSlot errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_1850 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_Static_1700
     * @tc.name      : Sub_Notification_Ans_Slot_DeleteSlot_Static_1700
     * @tc.desc      : Removes all NotificationSlot
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_1700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1700 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1700 START')
      try {
        notificationManager.removeAllSlots((err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeAllSlots AsyncCallback err: ${err}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeAllSlots AsyncCallback success`)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err: BusinessError) {
        console.info(`${TAG} removeAllSlots errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1700 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_DeleteSlot_Static_1800
     * @tc.name      : Sub_Notification_Ans_Slot_DeleteSlot_Static_1800
     * @tc.desc      : Removes all NotificationSlot
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_1800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1800 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1800 START')
      await notificationManager.removeAllSlots().then(() => {
        console.info(`${TAG} removeAllSlots Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} removeAllSlots Promise err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_1800 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_Static_2200
     * @tc.name      : Sub_Notification_Ans_Slot_GetSlot_Static_2200
     * @tc.desc      : Get all NotificationSlot without add
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_2200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_2200 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_2200 START')
      try {
        notificationManager.getSlots((err: BusinessError | null, data: Array<notificationManager.NotificationSlot>|undefined) => {
          if (err) {
            console.info(`${TAG} getSlots AsyncCallback err: ${err}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlots AsyncCallback ` )
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err: BusinessError) {
        console.info(`${TAG} getSlots errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_2200 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_GetSlot_Static_2300
     * @tc.name      : Sub_Notification_Ans_Slot_GetSlot_Static_2300
     * @tc.desc      : Get all NotificationSlot without add
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_2300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_2300 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_2300 START')
      notificationManager.getSlots().then((data: Array<notificationManager.NotificationSlot>) => {
        console.info(`${TAG} getSlots Promise ` )
        expect(true).assertTrue()
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} getSlots Promise err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_2300 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_0100
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_0100
     * @tc.desc      : Get all slots after add
                       UNKNOWN_TYPE and OTHER_TYPES is same in ANS
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_0100 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0100 START')

      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot SOCIAL_COMMUNICATION success`)
        expect(true).assertTrue()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot SOCIAL_COMMUNICATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await Utils.msSleep(1000);

      await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} addSlot SERVICE_INFORMATION success`)
        expect(true).assertTrue()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot SERVICE_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await Utils.msSleep(1000);

      await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} addSlot CONTENT_INFORMATION success`)
        expect(true).assertTrue()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot CONTENT_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await Utils.msSleep(1000);

      await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} addSlot OTHER_TYPES success`)
        expect(true).assertTrue()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot OTHER_TYPES err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await Utils.msSleep(1000);

      try {
        notificationManager.getSlots((err: BusinessError | null, data: Array<notificationManager.NotificationSlot>|undefined) => {
          if (err) {
            console.info(`${TAG} getSlots AsyncCallback err: ${err}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlots AsyncCallback success:` )
            for (let i = 0; i < data.length; i++) {
              console.info(`${TAG} NotificationSlot[${i}].type` + data[i].notificationType)
              let num = data[i].notificationType as notificationManager.SlotType
              if (num == 1) {
                expect(num == 1 ).assertTrue()
              } else if (num  == 2) {
                expect(num == 2 ).assertTrue()
              } else if (num == 3) {
                expect(num == 3 ).assertTrue()
              } else {
                expect(num == 65535 ).assertTrue()
              }
            }
            done()
          }
        })
      } catch (err: BusinessError) {
        console.info(`${TAG} getSlots AsyncCallback errCode: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0100 END')
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_0250
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_0250
     * @tc.desc      : Get all slots after add
                       UNKNOWN_TYPE and OTHER_TYPES is same in ANS
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_0250', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_0250 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0250 START')

      await notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
        console.info(`${TAG} addSlot SOCIAL_COMMUNICATION success`)
        expect(true).assertTrue()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot SOCIAL_COMMUNICATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await Utils.msSleep(1000);

      await notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
        console.info(`${TAG} addSlot SERVICE_INFORMATION success`)
        expect(true).assertTrue()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot SERVICE_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await Utils.msSleep(1000);

      await notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
        console.info(`${TAG} addSlot CONTENT_INFORMATION success`)
        expect(true).assertTrue()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot CONTENT_INFORMATION err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await Utils.msSleep(1000);

      await notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
        console.info(`${TAG} addSlot OTHER_TYPES success`)
        expect(true).assertTrue()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} addSlot OTHER_TYPES err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      await Utils.msSleep(1000);

      await notificationManager.getSlots().then((data: Array<notificationManager.NotificationSlot>) => {
        console.info(`${TAG} getSlots Promise success:` )
        for (let i = 0; i < data.length; i++) {
          console.info(`${TAG} NotificationSlot[${i}].type:` + data[i].notificationType)
          let num = data[i].notificationType as notificationManager.SlotType
          if (num == 1) {
            expect(num == 1 ).assertTrue()
          } else if (num == 2) {
            expect(num == 2 ).assertTrue()
          } else if (num == 3) {
            expect(num == 3 ).assertTrue()
          } else {
            expect(num == 65535 ).assertTrue()
          }
        }
        done()
      }).catch((err: BusinessError):void => {
        console.info(`${TAG} getSlots Promise err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_0250 END')
    })


    //DTS2025060627133
    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_4900
     * @tc.name      : SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_4900
     * @tc.desc      : NotificationSlot for other purposes
     */
    // it('SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_4900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   let TAG:string = 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_4900 '
    //   console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_4900 START')
    //   notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES, undefined).then(() => {
    //     console.info(`${TAG} addSlot_49 Promise success`)
    //     expect(true).assertTrue()
    //     done()
    //   }).catch((err: BusinessError):void => {
    //     console.info(`${TAG} addSlot_49 Promise errCode: ${err.code}, errMes: ${err.message}`)
    //     expect(false).assertTrue()
    //     done()
    //   })
    //   console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_4900 END')
    // })

    //DTS2025060627133
    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_5000
     * @tc.name      : SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_5000
     * @tc.desc      : Get the UNKNOWN_TYPE type slot without add
     */
    // it('SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_5000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   let TAG:string = 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_5000 '
    //   console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_5000 START')
    //   notificationManager.getSlot(notificationManager.SlotType.UNKNOWN_TYPE, undefined).then((data: notificationManager.NotificationSlot) => {
    //     console.info(`${TAG} getSlot_50 Promise success:`)
    //     expect(true).assertTrue()
    //     done()
    //   }).catch((err: BusinessError):void => {
    //     console.info(`${TAG} getSlot_50 Promise errCode: ${err.code}, errMes: ${err.message}`)
    //     expect(false).assertTrue()
    //     done()
    //   })
    //   console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_5000 END')
    // })

    //DTS2025060627133
    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_5100
     * @tc.name      : SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_5100
     * @tc.desc      : Get all NotificationSlot without add
     */
    // it('SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_5100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   let TAG:string = 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_5100 '
    //   console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_5100 START')
    //   notificationManager.getSlots(undefined).then((data: Array<notificationManager.NotificationSlot>) => {
    //     console.info(`${TAG} getSlots_51 Promise success:`)
    //     expect(true).assertTrue()
    //     done()
    //   }).catch((err: BusinessError):void => {
    //     console.info(`${TAG} getSlots_51 Promise err: ${err}, errMes: ${err.message}`)
    //     expect(false).assertTrue()
    //     done()
    //   })
    //   console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_5100 END')
    // })

    //DTS2025060627133
    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_5200
     * @tc.name      : SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_5200
     * @tc.desc      : Remove the UNKNOWN_TYPE type slot without add
     */
    // it('SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_5200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   let TAG:string = 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_5200 '
    //   console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_5200 START')
    //   notificationManager.removeSlot(notificationManager.SlotType.UNKNOWN_TYPE, undefined).then(() => {
    //     console.info(`${TAG} removeSlot_52 success`)
    //     expect(true).assertTrue()
    //     done()
    //   }).catch((err: BusinessError):void => {
    //     console.info(`${TAG} removeSlot_52 errCode: ${err.code}, errMes: ${err.message}`)
    //     expect(false).assertTrue()
    //     done()
    //   })
    //   console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_5200 END')
    // })

    //DTS2025060627133
    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_5300
     * @tc.name      : SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_5300
     * @tc.desc      : Removes all NotificationSlot
     */
    // it('SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_5300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   let TAG:string = 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_5300 '
    //   console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_5300 START')
    //   notificationManager.removeAllSlots(undefined).then(() => {
    //     console.info(`${TAG} removeAllSlots_53 Promise success`)
    //     expect(true).assertTrue()
    //     done()
    //   }).catch((err: BusinessError):void => {
    //     console.info(`${TAG} removeAllSlots_53 Promise err: ${err}, errMes: ${err.message}`)
    //     expect(false).assertTrue()
    //     done()
    //   })
    //   console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST_Static_5300 END')
    // })

    /*
     * @tc.number    : Sub_Notification_Ans_Slot_CreateSlot_Static_8150
     * @tc.name      : Sub_Notification_Ans_Slot_CreateSlot_Static_8150
     * @tc.desc      : SlotType
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_8150', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_8150 '
      console.info(`${TAG} Sub_Notification_Ans_Slot_CreateSlot_Static_8150 START`)
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
    console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_SLOT_TEST END')
  })
}
