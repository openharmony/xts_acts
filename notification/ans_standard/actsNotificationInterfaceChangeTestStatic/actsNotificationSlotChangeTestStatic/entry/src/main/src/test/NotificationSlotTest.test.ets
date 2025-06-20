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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType} from "../../../hypium/index";
import notificationManager from '@ohos.notificationManager';

export default function ActsNotificationSlotTest() {
  describe('ActsNotificationSlotTest', () => {

    const TAG:string = 'ActsNotificationSlotTest ===>';

    /**
     * @tc.number: Acts_NotificationSlot_Static_0100
     * @tc.name: Acts_NotificationSlot_Static_0100
     * @tc.desc: Set NotificationSlot attribute parameters notificationManager.SlotType.SOCIAL_COMMUNICATION.
     */
    it('Acts_NotificationSlot_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'Acts_NotificationSlot_Static_0100'
      console.info(`${TAG} Acts_NotificationSlot_Static_0100 START`);
      notificationManager.addSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err) => {
        if (err&&err.code!==0) {
          console.info(`${TAG} addSlot SOCIAL_COMMUNICATION err: + ${err.code}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TAG} addSlot SOCIAL_COMMUNICATION success`);
          expect(true).assertTrue();
        }
      })

      notificationManager.getSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err, NotificationSlot) => {
        if (err&&err.code!==0) {
          console.info(`${TAG} getSlot AsyncCallback err: ${err.code}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TAG} getSlot AsyncCallback success: ${NotificationSlot}`);
          expect(true).assertTrue();
          console.info(TAG + 'Acts_NotificationSlot_0100 END');
          done();
        }
      })
    })

    /**
     * @tc.number: Acts_NotificationSlot_Static_0200
     * @tc.name: Acts_NotificationSlot_Static_0200
     * @tc.desc: Set NotificationSlot attribute parameters notificationManager.SlotType.SERVICE_INFORMATION.
     */
    it('Acts_NotificationSlot_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: () => void): Promise<void> => {
      let TAG:string = 'Acts_NotificationSlot_Static_0200'
      console.info('Acts_NotificationSlot_Static_0200 START');

      notificationManager.addSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err) => {
        if (err&&err.code!==0) {
          console.info(`${TAG} addSlot SERVICE_INFORMATION err: + ${err.code}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TAG} addSlot SERVICE_INFORMATION success`);
          expect(true).assertTrue();
        }
      })

      notificationManager.getSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err, NotificationSlot) => {
        if (err&&err.code!==0) {
          console.info(`${TAG} getSlot AsyncCallback err: ${err.code}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TAG} getSlot AsyncCallback success: ${NotificationSlot}`);
          expect(true).assertTrue();
          console.info(TAG + 'Acts_NotificationSlot_0200 END');
          done();
        }
      })
    })

    /**
     * @tc.number: Acts_NotificationSlot_Static_0300
     * @tc.name: Acts_NotificationSlot_Static_0300
     * @tc.desc: Set NotificationSlot attribute parameters notificationManager.SlotType.CONTENT_INFORMATION.
     */
    it('Acts_NotificationSlot_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'Acts_NotificationSlot_Static_0300'
      console.info('Acts_NotificationSlot_Static_0300 START');

      notificationManager.addSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err) => {
        if (err&&err.code!==0) {
          console.info(`${TAG} addSlot CONTENT_INFORMATION err: + ${err.code}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TAG} addSlot CONTENT_INFORMATION success`);
          expect(true).assertTrue();
        }
      })

      notificationManager.getSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err, NotificationSlot) => {
        if (err&&err.code!==0) {
          console.info(`${TAG} getSlot AsyncCallback err: ${err.code}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TAG} getSlot AsyncCallback success: ${NotificationSlot}`);
          expect(true).assertTrue();
          console.info(TAG + 'Acts_NotificationSlot_0300 END');
          done();
        }
      })
    })

    /**
     * @tc.number: Acts_NotificationSlot_Static_0400
     * @tc.name: Acts_NotificationSlot_Static_0400
     * @tc.desc: Set NotificationSlot attribute parameters notificationManager.SlotType.OTHER_TYPES.
     */
    it('Acts_NotificationSlot_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'Acts_NotificationSlot_Static_0400'
      console.info('Acts_NotificationSlot_Static_0400 START');

      notificationManager.addSlot(notificationManager.SlotType.OTHER_TYPES, (err) => {
        if (err&&err.code!==0) {
          console.info(`${TAG} addSlot OTHER_TYPES err: + ${err.code}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TAG} addSlot OTHER_TYPES success`);
          expect(true).assertTrue();
        }
      })

      notificationManager.getSlot(notificationManager.SlotType.OTHER_TYPES, (err, NotificationSlot) => {
        if (err&&err.code!==0) {
          console.info(`${TAG} getSlot AsyncCallback err: ${err.code}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TAG} getSlot AsyncCallback success: ${NotificationSlot}`);
          expect(true).assertTrue();
          console.info(TAG + 'Acts_NotificationSlot_0400 END');
          done();
        }
      })
    })
  })
}