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
import { describe , it, expect } from '@ohos/hypium'
import notificationManager from '@ohos.notificationManager'
import image from '@ohos.multimedia.image';
import {BusinessError} from '@ohos.base';
import hilog from '@ohos.hilog';
const TAG = 'NotificationActs'
const TEST_SUITE_NAME = 'testNotificationLiveNotification'
export default function ActsNotificationSystemLiveViewTest() {
  describe('testNotificationLiveNotification', async (done : Function) => {
    /*
     * @tc.number: Sub_Notification_Ans_Live_Publish_2300
     * @tc.name: testLiveNotificationCapsuleTitleForUndefined
     * @tc.desc: test publish interface fail
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('testLiveNotificationCapsuleTitleForUndefined', 0, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationCapsuleTitleForUndefined'
      const color : ArrayBuffer = new ArrayBuffer(96);  //96为需要创建的像素buffer大小，取值为：height * width *4
      let opts : image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      image.createPixelMap(color, opts).then((pixelMap : image.PixelMap) => {
        console.log('Succeeded in creating pixelmap.');
        let notificationRequest : notificationManager.NotificationRequest = {
          id : 1,
          notificationSlotType : notificationManager.SlotType.LIVE_VIEW,
          content : {
            notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
            systemLiveView : {
              title : 'title',
              text : 'text',
              typeCode : 1,
              capsule : {
                title : undefined,
                backgroundColor : 'back',
                icon : pixelMap
              },
              button : {
                names : ['name1','name2'],
                icons : [pixelMap,pixelMap]
              },
              time : {
                initialTime : 100,
                isCountDown : true,
                isPaused : true,
                isInTitle : true,
              },
              progress : {
                maxValue : 100,
                currentValue : 200,
                isPercentage : true
              }
            }
          }
        }
        try {
          hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`);
          notificationManager.publish(notificationRequest,(err,data) => {
            if (err) {
              hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
              expect(true).assertTrue();
              hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
              done();
            }else{
              hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(data));
              expect(false).assertTrue();
              hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
              done();
            }
          })
        } catch (error) {
          hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(error));
          expect(error.code).assertEqual(401);
          hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
          done();
        }
      }).catch((error : BusinessError) => {
        console.error('Failed to create pixelmap.');
      })
    })

    /*
     * @tc.number: Sub_Notification_Ans_Live_Publish_2700
     * @tc.name: testLiveNotificationCapsuleIconForUndefined
     * @tc.desc: test publish interface fail
     * @tc.size: LargeTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('testLiveNotificationCapsuleIconForUndefined', 0, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationCapsuleIconForUndefined'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'text',
              icon : undefined
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(true).assertTrue();
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }

    })

    /*
    * @tc.number: Sub_Notification_Ans_Live_Publish_4000
    * @tc.name: testLiveNotificationButtonNamesForUndefined
    * @tc.desc: test publish interface fail
    * @tc.size: LargeTest
    * @tc.type: Function
    * @tc.level Level 3
    */
    it('testLiveNotificationCapsuleIconForUndefined', 0, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationCapsuleIconForUndefined'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'text',
            },
            button : {
              names : undefined
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(error));
        expect(true).assertTrue();
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }

    })

    /*
    * @tc.number: Sub_Notification_Ans_Live_Publish_4400
    * @tc.name: testLiveNotificationButtonIconsForUndefined
    * @tc.desc: test publish interface fail
    * @tc.size: LargeTest
    * @tc.type: Function
    * @tc.level Level 3
    */
    it('testLiveNotificationButtonIconsForUndefined', 0, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationButtonIconsForUndefined'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'title'
            },
            button : {
              icons : undefined
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(true).assertTrue();
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /*
    * @tc.number: Sub_Notification_Ans_Live_Publish_5100
    * @tc.name: testLiveNotificationTimeinitialTimeForUndefined
    * @tc.desc: test publish interface fail
    * @tc.size: LargeTest
    * @tc.type: Function
    * @tc.level Level 3
    */
    it('testLiveNotificationTimeinitialTimeForUndefined', 0, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationTimeinitialTimeForUndefined'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'title'
            },
            button : {
              names : ["button1"]
            },
            time : {
              initialTime : undefined
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(true).assertTrue();
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /*
    * @tc.number: Sub_Notification_Ans_Live_Publish_5400
    * @tc.name: testLiveNotificationTimeisCountdownForUndefined
    * @tc.desc: test publish interface fail
    * @tc.size: LargeTest
    * @tc.type: Function
    * @tc.level Level 3
    */
    it('testLiveNotificationTimeisCountdownForUndefined', 0, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationTimeisCountdownForUndefined'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'title'
            },
            button : {
              names : ["button1"]
            },
            time : {
              isCountDown : undefined
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(true).assertTrue();
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /*
    * @tc.number: Sub_Notification_Ans_Live_Publish_5700
    * @tc.name: testLiveNotificationTimeisPausedForUndefined
    * @tc.desc: test publish interface fail
    * @tc.size: LargeTest
    * @tc.type: Function
    * @tc.level Level 3
    */
    it('testLiveNotificationTimeisPausedForUndefined', 0, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationTimeisPausedForUndefined'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'title'
            },
            button : {
              names : ["button1"]
            },
            time : {
              isCountDown : true,
              isPaused : undefined
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(true).assertTrue();
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /*
    * @tc.number: Sub_Notification_Ans_Live_Publish_6000
    * @tc.name: testLiveNotificationTimeisInTitleForUndefined
    * @tc.desc: test publish interface fail
    * @tc.size: LargeTest
    * @tc.type: Function
    * @tc.level Level 3
    */
    it('testLiveNotificationTimeisInTitleForUndefined', 0, async  (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationTimeisInTitleForUndefined'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'title'
            },
            button : {
              names : ["button1"]
            },
            time : {
              isCountDown : true,
              isInTitle : undefined
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(true).assertTrue();
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /*
    * @tc.number: Sub_Notification_Ans_Live_Publish_6600
    * @tc.name: testLiveNotificationProgressMaxvalueForUndefined
    * @tc.desc: test publish interface fail
    * @tc.size: LargeTest
    * @tc.type: Function
    * @tc.level Level 3
    */
    it('testLiveNotificationProgressMaxvalueForUndefined', 0, async (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationProgressMaxvalueForUndefined'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'title'
            },
            button : {
              names : ["button1"]
            },
            time : {
              isCountDown : true,
              isInTitle : true,
              isPaused : true
            },
            progress : {
              maxValue : undefined
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(true).assertTrue();
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /*
   * @tc.number: Sub_Notification_Ans_Live_Publish_7000
   * @tc.name: testLiveNotificationProgressCurrentValueForUndefined
   * @tc.desc: test publish interface fail
   * @tc.size: LargeTest
   * @tc.type: Function
   * @tc.level Level 3
   */
    it('testLiveNotificationProgressCurrentValueForUndefined', 0, async (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationProgressCurrentValueForUndefined'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'title'
            },
            button : {
              names : ["button1"]
            },
            time : {
              isCountDown : true,
              isInTitle : true,
              isPaused : true
            },
            progress : {
              maxValue : 50,
              currentValue : undefined
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`)
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(true).assertTrue();
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })

    /*
  * @tc.number: Sub_Notification_Ans_Live_Publish_7400
  * @tc.name: testLiveNotificationProgressisPercentageForUndefined
  * @tc.desc: test publish interface fail
  * @tc.size: LargeTest
  * @tc.type: Function
  * @tc.level Level 3
  */
    it('testLiveNotificationProgressisPercentageForUndefined', 0, async (done : Function) => {
      const TEST_CASE_NAME = 'testLiveNotificationProgressisPercentageForUndefined'
      let notificationRequest : notificationManager.NotificationRequest = {
        id : 1,
        content : {
          notificationContentType : notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
          systemLiveView : {
            title : 'title',
            text : 'text',
            typeCode : 0,
            capsule : {
              title : 'title'
            },
            button : {
              names : ["button1"]
            },
            time : {
              isCountDown : true,
              isInTitle : true,
              isPaused : true
            },
            progress : {
              maxValue : 50,
              isPercentage : undefined
            }
          }
        }
      }
      try {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case start`);
        notificationManager.publish(notificationRequest,(err,data) => {
          if (err) {
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(err));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
            done();
          }else{
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,JSON.stringify(data));
            expect(false).assertTrue();
            hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`)
            done();
          }
        })
      } catch (error) {
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        expect(true).assertTrue();
        hilog.info(0x000,`${TAG}`,`${TEST_SUITE_NAME}`,`${TEST_CASE_NAME}` + `test case end`);
        done();
      }
    })
  })
}
