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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import image from '@ohos.multimedia.image'
import wantAgent from '@ohos.app.ability.wantAgent'

export default function ActsNotificationManagerPublishTest() {
  describe('SUB_NOTIFICATION_ANS_MANAGER_Publish_TEST', function () {
    let TAG = 'SUB_NOTIFICATION_ANS_MANAGER_Publish_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_Publish_TEST START')

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_0100
     * @tc.name      : function cancel(id: number, label: string, callback: AsyncCallback<void>): void
     * @tc.desc      : Cancels a notification with the specified label and ID
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_0100', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_0100 START`)
      let id = 1
      let label = "label"
      try {
        await notificationManager.cancel(id, label, (err) => {
          if (err) {
            console.info(`${TAG} cancel AsyncCallback err: ${err.code}, errMes: ${err.message}`)
            expect(true).assertTrue()
            done()
          } else {
            console.info(`${TAG} cancel AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} cancel AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_0100 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_0200
     * @tc.name      : function cancel(id: number, label: string, callback: AsyncCallback<void>): void
     * @tc.desc      : Cancels a notification with the specified label and ID
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_0200', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_0100 START`)
      let id = 1
      let label = "label"
      await notificationManager.cancel(id, label).then(() => {
        console.info(`${TAG} cancel Promise success`)
        expect(false).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} cancel Promise err: ${err.code}, errMes: ${err.message}`)
        expect(true).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_0100 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_0300
     * @tc.name      : function cancel(id: number, callback: AsyncCallback<void>): void
     * @tc.desc      : Cancels a notification with the specified ID
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_0300', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_0300 START`)
      let id = 1
      try {
        await notificationManager.cancel(id, (err) => {
          if (err) {
            console.info(`${TAG} cancel id err: ${err.code}, errMes: ${err.message}`)
            expect(true).assertTrue()
            done()
          } else {
            console.info(`${TAG} cancel id success`)
            expect(false).assertTrue()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} cancel id errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCEL_TEST_0300 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_CANCELAll_TEST_0100
     * @tc.name      : function cancelAll(callback: AsyncCallback<void>): void
     * @tc.desc      : Cancels all notifications of the current application
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_CANCELAll_TEST_0100', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCELAll_TEST_0100 START`)
      try {
        await notificationManager.cancelAll((err) => {
          if (err) {
            console.info(`${TAG} cancelAll AsyncCallback err: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} cancelAll AsyncCallback success`)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} cancelAll AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCELAll_TEST_0100 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_CANCELAll_TEST_0200
     * @tc.name      : function cancelAll(): Promise<void>
     * @tc.desc      : Cancels all notifications of the current application
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_CANCELAll_TEST_0200', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCELAll_TEST_0200 START`)
      await notificationManager.cancelAll().then(() => {
        console.info(`${TAG} cancelAll Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} cancelAll Promise err: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCELAll_TEST_0200 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_CANCEL_GROUP_TEST_0100
     * @tc.name      : function cancelGroup(groupName: string, callback: AsyncCallback<void>): void
     * @tc.desc      : Cancel the notification of a specified group for this application
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_CANCEL_GROUP_TEST_0100', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCEL_GROUP_TEST_0100 START`)
      let groupName = "groupName"
      try {
        await notificationManager.cancelGroup(groupName, (err) => {
          if (err) {
            console.info(`${TAG} cancelGroup AsyncCallback err: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} cancelGroup AsyncCallback success`)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} cancelGroup AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCEL_GROUP_TEST_0100 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_CANCEL_GROUP_TEST_0200
     * @tc.name      : function cancelGroup(groupName: string): Promise<void>
     * @tc.desc      : Cancel the notification of a specified group for this application
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_CANCEL_GROUP_TEST_0200', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCEL_GROUP_TEST_0200 START`)
      let groupName = "groupName"
      await notificationManager.cancelGroup(groupName).then(() => {
        console.info(`${TAG} cancelGroup Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} cancelGroup Promise err: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_CANCEL_GROUP_TEST_0200 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_REQUEST_ENABLE_TEST_0100
     * @tc.name      : function requestEnableNotification(callback: AsyncCallback<void>): void
     * @tc.desc      : OperationType.UNKNOWN_TYPE & WantAgentFlags.ONE_TIME_FLAG
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_REQUEST_ENABLE_TEST_0100', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_REQUEST_ENABLE_TEST_0100 START`)
      try {
        await notificationManager.requestEnableNotification((err) => {
          if (err) {
            console.info(`${TAG} requestEnableNotification AsyncCallback err: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} requestEnableNotification AsyncCallback success`)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} requestEnableNotification AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_REQUEST_ENABLE_TEST_0100 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_REQUEST_ENABLE_TEST_0200
     * @tc.name      : function requestEnableNotification(): Promise<void>
     * @tc.desc      : OperationType.UNKNOWN_TYPE & WantAgentFlags.ONE_TIME_FLAG
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_REQUEST_ENABLE_TEST_0200', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_REQUEST_ENABLE_TEST_0200 START`)
      await notificationManager.requestEnableNotification().then(() => {
        console.info(`${TAG} requestEnableNotification Promise success`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} requestEnableNotification Promise err: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_REQUEST_ENABLE_TEST_0200 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_0100
     * @tc.name      : function getActiveNotificationCount(callback: AsyncCallback<number>): void
     * @tc.desc      : Obtains the number of all active notifications
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_0100', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_ACTIVE_COUNT_TEST_0100 START`)
      try {
        await notificationManager.getActiveNotificationCount((err, data) => {
          if (err) {
            console.info(`${TAG} getActiveNotificationCount AsyncCallback err:${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getActiveNotificationCount AsyncCallback success ${JSON.stringify(data)}`)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} getActiveNotificationCount AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_0100 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_0200
     * @tc.name      : function getActiveNotificationCount(): Promise<number>
     * @tc.desc      : Obtains the number of all active notifications
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_0200', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_ACTIVE_COUNT_TEST_0200 START`)
      await notificationManager.getActiveNotificationCount().then((data) => {
        console.info(`${TAG} getActiveNotificationCount Promise success :${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getActiveNotificationCount Promise err: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_0200 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_0300
     * @tc.name      : function getActiveNotifications(callback: AsyncCallback<Array<NotificationRequest>>): void
     * @tc.desc      : Obtains an array of active notifications
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_0300', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_ACTIVE_COUNT_TEST_0300 START`)
      try {
        await notificationManager.getActiveNotifications((err, data) => {
          if (err) {
            console.info(`${TAG} getActiveNotifications AsyncCallback err: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getActiveNotifications AsyncCallback success ${JSON.stringify(data)}`)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} getActiveNotifications AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_0300 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_0400
     * @tc.name      : function getActiveNotifications(): Promise<Array<NotificationRequest>>
     * @tc.desc      : Obtains an array of active notifications
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_0400', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_0400 START`)
      await notificationManager.getActiveNotifications().then((data) => {
        console.info(`${TAG} getActiveNotifications Promise success :${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} getActiveNotifications Promise err: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_COUNT_TEST_0400 END`)
    })


    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_SUPPORT_TEST_0100
     * @tc.name      : function isSupportTemplate(templateName: string, callback: AsyncCallback<boolean>): void
     * @tc.desc      : Obtains whether the template is supported by the system
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_SUPPORT_TEST_0100', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_SUPPORT_TEST_0100 START`)
      let templateName = 'test_templateName'
      try {
        await notificationManager.isSupportTemplate(templateName, (err, data) => {
          if (err) {
            console.info(`${TAG} isSupportTemplate AsyncCallback err: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} isSupportTemplate AsyncCallback success:${JSON.stringify(data)} `)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} isSupportTemplate AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_SUPPORT_TEST_0100 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_SUPPORT_TEST_0200
     * @tc.name      : function isSupportTemplate(templateName: string): Promise<boolean>
     * @tc.desc      : Obtains whether the template is supported by the system
     */
    it('SUB_NOTIFICATION_ANS_MANAGER_SUPPORT_TEST_0200', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_SUPPORT_TEST_0200 START`)
      let templateName = 'test_templateName'
      await notificationManager.isSupportTemplate(templateName).then((data) => {
        console.info(`${TAG} isSupportTemplate Promise success :${JSON.stringify(data)}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} isSupportTemplate Promise err: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_SUPPORT_TEST_0200 END`)
    })

    console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_Publish_TEST END')
  })

}
