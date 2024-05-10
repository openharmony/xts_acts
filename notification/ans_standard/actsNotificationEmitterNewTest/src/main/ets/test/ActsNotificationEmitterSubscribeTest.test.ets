/**
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import emitter from '@ohos.events.emitter';

const TAG = 'Notification';
const TEST_SUITE_NAME = 'ActsEmitterSubscribeTest'

export default function ActsNotificationEmitterSubscribeTest() {

  describe('ActsNotificationEmitterSubscribeTest', () => {

    /*
      * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_0100
      * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_0100
      * @tc.desc   : emitter.on with parameter null
      * @tc.size   : MediumTest
      * @tc.type   : Function
      * @tc.level  : Level 3
      */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_0100', 2, (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Subscribe_Capabilities_0100'
      let innerEvent: emitter.InnerEvent = {
        eventId: 1
      };
      let callback001 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try{
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.on(null, callback001);
        let eventData: emitter.EventData = {
          data: {
            "content": "Sub_Notification_Emitter_Subscribe_Capabilities_0100",
            "id": 1,
          }
        };
        emitter.emit(innerEvent, eventData);
        done();
      }catch(err){
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(err.message).assertContain("type mismatch for parameter 1");
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
    })

    /*
      * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_0200
      * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_0200
      * @tc.desc   : emitter.on with parameter undefined
      * @tc.size   : MediumTest
      * @tc.type   : Function
      * @tc.level  : Level 3
      */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_0200', 2, (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Subscribe_Capabilities_0200'
      let innerEvent: emitter.InnerEvent = {
        eventId: 2
      };
      let callback002 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try{
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.on(undefined, callback002);
        let eventData: emitter.EventData = {
          data: {
            "content": "Sub_Notification_Emitter_Subscribe_Capabilities_0200",
            "id": 2,
          }
        };
        emitter.emit(innerEvent, eventData);
        done();
      }catch(err){
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(err.message).assertContain("type mismatch for parameter 1");
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
    })

    /*
      * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_0300
      * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_0300
      * @tc.desc   : emitter.on with parameter ""
      * @tc.size   : MediumTest
      * @tc.type   : Function
      * @tc.level  : Level 3
      */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_0300', 2, (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Subscribe_Capabilities_0300'
      let innerEvent: emitter.InnerEvent = {
        eventId: 3
      };
      let callback003 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try{
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.on('', callback003);
        let eventData: emitter.EventData = {
          data: {
            "content": "Sub_Notification_Emitter_Subscribe_Capabilities_0300",
            "id": 3,
          }
        };
        emitter.emit(innerEvent, eventData);
        done();
      }catch(err){
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(err.message).assertContain("type mismatch for parameter 1");
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
    })

    /*
      * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_1300
      * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_1300
      * @tc.desc   : emitter.once with parameter null
      * @tc.size   : MediumTest
      * @tc.type   : Function
      * @tc.level  : Level 3
      */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_1300', 2, (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Subscribe_Capabilities_1300'
      let innerEvent: emitter.InnerEvent = {
        eventId: 4
      };
      let callback004 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try{
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.once(null, callback004);
        let eventData: emitter.EventData = {
          data: {
            "content": "Sub_Notification_Emitter_Subscribe_Capabilities_1300",
            "id": 4,
          }
        };
        emitter.emit(innerEvent, eventData);
        done();
      }catch(err){
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(err.message).assertContain("type mismatch for parameter 1");
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
    })

    /*
      * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_1400
      * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_1400
      * @tc.desc   : emitter.once with parameter undefined
      * @tc.size   : MediumTest
      * @tc.type   : Function
      * @tc.level  : Level 3
      */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_1400', 2, (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Subscribe_Capabilities_1400'
      let innerEvent: emitter.InnerEvent = {
        eventId: 5
      };
      let callback005 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try{
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.once(undefined, callback005);
        let eventData: emitter.EventData = {
          data: {
            "content": "Sub_Notification_Emitter_Subscribe_Capabilities_1400",
            "id": 5,
          }
        };
        emitter.emit(innerEvent, eventData);
        done();
      }catch(err){
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(err.message).assertContain("type mismatch for parameter 1");
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
    })

    /*
      * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_1500
      * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_1500
      * @tc.desc   : emitter.once with parameter ""
      * @tc.size   : MediumTest
      * @tc.type   : Function
      * @tc.level  : Level 3
      */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_1500', 2, (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Subscribe_Capabilities_1500'
      let innerEvent: emitter.InnerEvent = {
        eventId: 6
      };
      let callback006 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try{
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.once('', callback006);
        let eventData: emitter.EventData = {
          data: {
            "content": "Sub_Notification_Emitter_Subscribe_Capabilities_1500",
            "id": 6,
          }
        };
        emitter.emit(innerEvent, eventData);
        done();
      }catch(err){
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(err.message).assertContain("type mismatch for parameter 1");
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
    })

    /*
      * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_2500
      * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_2500
      * @tc.desc   : emitter.off with parameter null
      * @tc.size   : MediumTest
      * @tc.type   : Function
      * @tc.level  : Level 3
      */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_2500', 2, (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Subscribe_Capabilities_2500'
      let callback007 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try{
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.off(null, callback007);
        done();
      }catch(err){
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(err.message).assertContain("type mismatch for parameter 1");
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
    })

    /*
      * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_2600
      * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_2600
      * @tc.desc   : emitter.off with parameter undefined
      * @tc.size   : MediumTest
      * @tc.type   : Function
      * @tc.level  : Level 3
      */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_2600', 2, (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Subscribe_Capabilities_2600'
      let callback008 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try{
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.off(undefined, callback008);
        done();
      }catch(err){
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(err.message).assertContain("type mismatch for parameter 1");
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
    })

    /*
      * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_2700
      * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_2700
      * @tc.desc   : emitter.off with parameter ''
      * @tc.size   : MediumTest
      * @tc.type   : Function
      * @tc.level  : Level 3
      */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_2700', 3, (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Subscribe_Capabilities_2700'
      let callback009 = (): void => {
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on success');
        expect(false).assertTrue();
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
      try{
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.off('', callback009);
        done();
      }catch(err){
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(err.message).assertContain("type mismatch for parameter 1");
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
    })

    /*
      * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_3500
      * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_3500
      * @tc.desc   : emitter.emit with parameter null
      * @tc.size   : MediumTest
      * @tc.type   : Function
      * @tc.level  : Level 3
      */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_3500', 3, (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Subscribe_Capabilities_3500'
      let innerEvent: emitter.InnerEvent = {
        eventId: null
      };
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      try{
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.emit(innerEvent,options);
        done();
      }catch(err){
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(err.message).assertContain("type mismatch for parameter 1");
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
    })

    /*
      * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_3600
      * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_3600
      * @tc.desc   : emitter.emit with parameter undefined
      * @tc.size   : MediumTest
      * @tc.type   : Function
      * @tc.level  : Level 3
      */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_3600', 3, (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Subscribe_Capabilities_3600'
      let innerEvent: emitter.InnerEvent = {
        eventId: undefined
      };
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      try{
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.emit(innerEvent,options);
        done();
      }catch(err){
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(err.message).assertContain("type mismatch for parameter 1");
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
    })

    /*
      * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_3700
      * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_3700
      * @tc.desc   : emitter.emit with parameter ''
      * @tc.size   : MediumTest
      * @tc.type   : Function
      * @tc.level  : Level 3
      */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_3700', 3, (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Subscribe_Capabilities_3700'
      let innerEvent: emitter.InnerEvent = {
        eventId: ''
      };
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      try{
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.emit(innerEvent,options);
        done();
      }catch(err){
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(err.message).assertContain("type mismatch for parameter 1");
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
    })

    /*
      * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_3900
      * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_3900
      * @tc.desc   : emitter.emit with parameter '',eventData (id=null) and options
      * @tc.size   : MediumTest
      * @tc.type   : Function
      * @tc.level  : Level 3
      */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_3900', 3, (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Subscribe_Capabilities_3900'
      let innerEvent: emitter.InnerEvent = {
        eventId: 39
      };
      let eventData: emitter.EventData = {
        data: {
          "content": "c",
          "id": null,
        }
      };
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      try{
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.on(innerEvent);
        emitter.emit(innerEvent,options,eventData);
        done();
      }catch(err){
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(err.message).assertContain("type mismatch for parameter 1");
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
    })

    /*
      * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_4000
      * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_4000
      * @tc.desc   : emitter.emit with parameter '',eventData (id=undefined) and options
      * @tc.size   : MediumTest
      * @tc.type   : Function
      * @tc.level  : Level 3
      */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_4000', 3, (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Subscribe_Capabilities_4000'
      let innerEvent: emitter.InnerEvent = {
        eventId: 40
      };
      let eventData: emitter.EventData = {
        data: {
          "content": "c",
          "id": undefined,
        }
      };
      let options: emitter.Options = {
        priority: emitter.EventPriority.HIGH
      };
      try{
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.on(innerEvent);
        emitter.emit(innerEvent,options,eventData);
        done();
      }catch(err){
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(err.message).assertContain("type mismatch for parameter 1");
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
    })

    /*
      * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_4100
      * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_4100
      * @tc.desc   : emitter.emit with parameter '',eventData and options(null)
      * @tc.size   : MediumTest
      * @tc.type   : Function
      * @tc.level  : Level 3
      */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_4100', 3, (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Subscribe_Capabilities_4100'
      let innerEvent: emitter.InnerEvent = {
        eventId: 41
      };
      let eventData: emitter.EventData = {
        data: {
          "content": "c",
          "id": '',
        }
      };
      let options: emitter.Options = {
        priority: null
      };
      try{
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.on(innerEvent);
        emitter.emit(innerEvent,options,eventData);
        done();
      }catch(err){
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(err.message).assertContain("type mismatch for parameter 2");
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
    })

    /*
      * @tc.number : Sub_Notification_Emitter_Subscribe_Capabilities_4200
      * @tc.name   : Sub_Notification_Emitter_Subscribe_Capabilities_4200
      * @tc.desc   : emitter.emit with parameter '',eventData and options(undefined)
      * @tc.size   : MediumTest
      * @tc.type   : Function
      * @tc.level  : Level 3
      */
    it('Sub_Notification_Emitter_Subscribe_Capabilities_4200', 3, (done: Function) => {
      const TEST_CASE_NAME = 'Sub_Notification_Emitter_Subscribe_Capabilities_4200'
      let innerEvent: emitter.InnerEvent = {
        eventId: 42
      };
      let eventData: emitter.EventData = {
        data: {
          "content": "c",
          "id": '',
        }
      };
      let options: emitter.Options = {
        priority: undefined
      };
      try{
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case begin');
        emitter.on(innerEvent);
        emitter.emit(innerEvent,options,eventData);
        done();
      }catch(err){
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' on failed,data is: ', JSON.stringify(err));
        expect(err.message).assertContain("type mismatch for parameter 2");
        hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + ' test case end');
        done();
      }
    })
  })
}