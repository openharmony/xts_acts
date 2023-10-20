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

import notification from '@ohos.notification';
import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY,MatchPattern,
  DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it } from '@ohos/hypium';
import { logGenerator, exitGenerator, sleep, exitSpecialGenerator } from '../common/utils';

export default function ActsNotificationRequestTest() {
  describe('SUB_NOTIFICATION_ANS_REQUEST_TEST', function () {
    const TAG = 'SUB_NOTIFICATION_ANS_REQUEST_TEST ===>';
    let log = logGenerator(TAG);
    log('SUB_NOTIFICATION_ANS_REQUEST_TEST START');

    beforeAll(async function (done) {
      let fn = (resolve, reject) => {
        let exit = exitSpecialGenerator(TAG, reject, done);
        log(`come in beforeAll`);
        notification.requestEnableNotification(async (err) => {
          log(`come in requestEnableNotification`);
          if (err.code) {
            exit(`requestEnableNotification err: ${err.code}`);
            return;
          }
          log(`requestEnableNotification success`);
          let driver = await UiDriver.create();
          log(`driver is ${JSON.stringify(driver)}`);
          let button = await driver.findComponent(BY.text('允许'));
          log(`button is ${JSON.stringify(button)}`);
          if (button !== null) {
            await button.click();
            await sleep(500);
            resolve();
            done();
          } else {
            exit('null button');
          }
        });
      };
      return new Promise<void>((resolve, reject) => { fn(resolve, reject) });
    });

    /*
     * @tc.number    : Sub_Notification_Ans_Publish_Publish_0900
     * @tc.name      : function publish(request: NotificationRequest, callback: AsyncCallback<void>): void
     * @tc.desc      : publish a notification after requestEnableNotification
     */
    it('Sub_Notification_Ans_Publish_Publish_0900', 0, async function (done) {
      let fn = (resolve, reject) => {
        let exit = exitGenerator(TAG, reject);
        log(`Sub_Notification_Ans_Publish_Publish_0900 START`);
        let notificationRequest = {
          id: 1,
          content: {
            contentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: 'test_title',
              text: 'test_text',
              additionalText: 'test_additionalText'
            }
          }
        };
        notification.publish(notificationRequest, (err, data) => {
          if (err.code) {
            exit(`notification publish AsyncCallback err: ${err.code}`);
            return;
          }
          log(`notification publish AsyncCallback success: ${JSON.stringify(data)}`);
          log(`Sub_Notification_Ans_Publish_Publish_0900 END`);
          resolve();
          done();
        });
      };
      return new Promise<void>((resolve, reject) => { fn(resolve, reject) });
    });

    /*
     * @tc.number    : Sub_Notification_Ans_Publish_Publish_4000
     * @tc.name      : function publish(request: NotificationRequest): Promise<void>
     * @tc.desc      : publish a notification after requestEnableNotification
     */
    it('Sub_Notification_Ans_Publish_Publish_4000', 0, async function (done) {
      let fn = (resolve, reject) => {
        let exit = exitGenerator(TAG, reject);
        log(`Sub_Notification_Ans_Publish_Publish_4000 START`);
        let notificationRequest = {
          id: 1,
          content: {
            contentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: 'test_title',
              text: 'test_text',
              additionalText: 'test_additionalText'
            }
          }
        };
        notification.publish(notificationRequest).then((data) => {
          log(`notification publish AsyncCallback success: ${JSON.stringify(data)}`);
          log(`Sub_Notification_Ans_Publish_Publish_4000 END`);
          resolve();
          done();
        }).catch((err) => {
          exit(`notification publish AsyncCallback err: ${err.code}`);
        });
      };
      return new Promise<void>((resolve, reject) => { fn(resolve, reject) });
    });
  });
};
