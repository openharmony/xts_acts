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

export default function ActsNotificationManagerRequestTest() {
  describe('SUB_NOTIFICATION_ANS_MANAGER_REQUEST_TEST', function () {
    let TAG = 'SUB_NOTIFICATION_ANS_MANAGER_REQUEST_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_REQUEST_TEST START')

    /*
     * @tc.number    : Sub_Notification_Ans_Publish_Publish_3750
     * @tc.name      : function publish(request: NotificationRequest, callback: AsyncCallback<void>): void
     * @tc.desc      : publish a notification after requestEnableNotification
     */
    it('Sub_Notification_Ans_Publish_Publish_3750', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_3750 START`)
      let notificationRequest = {
        id: 1,
        content: {
          contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "test_title",
            text: "test_text",
            additionalText: "test_additionalText"
          }
        }
      }
      try {
        notificationManager.publish(notificationRequest, (err, data) => {
          if (err) {
            console.info(`${TAG} notification publish AsyncCallback err: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.log(`${TAG} notification publish AsyncCallback success: ${data}`)
            expect(true).assertTrue()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} notification publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_3750 END`)
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Publish_Publish_3900
     * @tc.name      : function publish(request: NotificationRequest): Promise<void>
     * @tc.desc      : publish a notification after requestEnableNotification
     */
    it('Sub_Notification_Ans_Publish_Publish_3900', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_3900 START`)
      let notificationRequest = {
        id: 1,
        content: {
          contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "test_title",
            text: "test_text",
            additionalText: "test_additionalText"
          }
        }
      }
      notificationManager.publish(notificationRequest).then((data) => {
        console.log(`${TAG} notification publish AsyncCallback success: ${data}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} notification publish AsyncCallback err: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_3900 END`)
    })
    console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_REQUEST_TEST END')
  })

}
