/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import emitter from '@ohos.events.emitter'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function EmitterTest() {
  describe('SUB_NOTIFICATION_CES_EMITTER_TEST', function () {
    const TAG = 'SUB_NOTIFICATION_CES_EMITTER_TEST ===> '
    console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST START`)

    let innerEvent = {
      eventId: undefined,
      priority: undefined
    }

    let eventData = {
      data: {
        'id': undefined,
        'content': undefined
      }
    }

    /* EmitterCallbackDummy should not be called */
    function EmitterCallbackDummy(eventData) {
      console.info(TAG + 'eventData.id: ' + JSON.stringify(eventData.data.id));
      console.info(TAG + 'eventData.content: ' + JSON.stringify(eventData.data.content));
      expect(eventData.data.content).asertFalse();
    }

    function EmitterCallback(eventData) {
      console.info(TAG + 'eventData.id: ' + JSON.stringify(eventData.data.id));
      console.info(TAG + 'eventData.content: ' + JSON.stringify(eventData.data.content));
      if (eventData.data.id == 0) {
        expect(eventData.data.content).assertEqual('message_0');
      } else if (eventData.data.id == 1) {
        expect(eventData.data.content).assertEqual('message_1');
      } else if (eventData.data.id == 2) {
        expect(eventData.data.content).assertEqual('message_2');
      } else if (eventData.data.id == 3) {
        expect(eventData.data.content).assertEqual('message_3');
      } else if (eventData.data.id == 4) {
        expect(eventData.data.content).assertEqual('message_4');
      } else if (eventData.data.id == 5) {
        expect(eventData.data.content).assertEqual('message_5');
      } else if (eventData.data.id == 6) {
        expect(eventData.data.content).assertEqual('message_6');
      } else if (eventData.data.id == 7) {
        expect(eventData.data.content).assertFalse();
      } else if (eventData.data.id == 8) {
        expect(eventData.data.content).assertEqual('message_8');
      } else if (eventData.data.id == 9) {
        expect(eventData.data.content).assertFalse();
      } else if (eventData.data.id == 10) {
        expect(eventData.data.content).assertFalse();
      } else if (eventData.data.id == 11) {
        expect(eventData.data.content).assertFalse();
      } else if (eventData.data.id == 12) {
        expect(eventData.data.content).assertEqual('message_12');
      } else if (eventData.data.id == 13) {
        expect(eventData.data.content).assertEqual('message_13');
      }
    }

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_0100
     * @tc.name      : verify on : on(event: InnerEvent, callback: Callback<EventData>): void
     * @tc.desc      : emitter.EventPriority.IDLE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_0100', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0100 START`)
      innerEvent.eventId = 1
      innerEvent.priority = emitter.EventPriority.IDLE

      eventData.data.id = 0
      eventData.data.content = 'message_0'

      emitter.on(innerEvent, EmitterCallback)
      emitter.emit(innerEvent, eventData)
      emitter.off(1)

      innerEvent.priority = emitter.EventPriority.HIGH
      innerEvent.eventId = 1
      eventData.data.id = 1
      eventData.data.content = 'message_1'

      emitter.on(innerEvent, EmitterCallback)
      emitter.emit(innerEvent, eventData)
      emitter.off(1)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0100 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_0200
     * @tc.name      : verify on : once(event: InnerEvent, callback: Callback<EventData>): void
     * @tc.desc      : emitter.EventPriority.LOW
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_0200', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0200 START`)
      innerEvent.eventId = 2
      innerEvent.priority = emitter.EventPriority.LOW

      eventData.data.id = 2
      eventData.data.content = 'message_2'

      emitter.once(innerEvent, EmitterCallback)
      emitter.emit(innerEvent, eventData)
      emitter.off(2)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0200 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_0300
     * @tc.name      : verify on : emit(event: InnerEvent, data?: EventData): void
     * @tc.desc      : emitter.EventPriority.HIGH
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_0300', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0300 START`)
      innerEvent.eventId = 3
      innerEvent.priority = emitter.EventPriority.HIGH

      eventData.data.id = 3
      eventData.data.content = 'message_3'

      emitter.once(innerEvent, EmitterCallback)
      emitter.emit(innerEvent, eventData)
      emitter.off(3)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0300 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_0400
     * @tc.name      : verify on : emit(event: InnerEvent, data?: EventData): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_0400', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0400 START`)
      innerEvent.eventId = 4
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      eventData.data.id = 4
      eventData.data.content = 'message_4'

      emitter.once(innerEvent, EmitterCallback)
      emitter.emit(innerEvent, eventData)
      emitter.off(4)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0400 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_0500
     * @tc.name      : verify on : off(eventId: number): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_0500', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0500 START`)
      innerEvent.eventId = 5
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      eventData.data.id = 5
      eventData.data.content = 'message_5'

      emitter.once(innerEvent, EmitterCallback)
      emitter.emit(innerEvent, eventData)
      emitter.off(5)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0500 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_0600
     * @tc.name      : verify on : off(eventId: number, callback: Callback<EventData>): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_0600', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0600 START`)
      innerEvent.eventId = 6
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      eventData.data.id = 6
      eventData.data.content = 'message_6'
      emitter.on(innerEvent, EmitterCallback)

      emitter.off(6, EmitterCallbackDummy)
      emitter.emit(innerEvent, eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0600 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_0700
     * @tc.name      : verify on : off(eventId: number, callback: Callback<EventData>): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_0700', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0700 START`)
      innerEvent.eventId = 7
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      eventData.data.id = 7
      eventData.data.content = 'message_7'
      emitter.on(innerEvent, EmitterCallback)

      emitter.off(7, EmitterCallback)
      emitter.emit(innerEvent, eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0700 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_0800
     * @tc.name      : verify on: off(eventId: number, callback: Callback<EventData>): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_0800', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0800 START`)
      innerEvent.eventId = 8
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      eventData.data.id = 8
      eventData.data.content = 'message_8'
      emitter.once(innerEvent, EmitterCallback)

      emitter.off(8, EmitterCallbackDummy)
      emitter.emit(innerEvent, eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0800 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_0900
     * @tc.name      : verify on : off(eventId: number, callback: Callback<EventData>): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_0900', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0900 START`)
      innerEvent.eventId = 9
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      eventData.data.id = 9
      eventData.data.content = 'message_9'
      emitter.once(innerEvent, EmitterCallback)

      emitter.off(9, EmitterCallback)
      emitter.emit(innerEvent, eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_0900 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_1000
     * @tc.name      : verify on : off(eventId: number): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_1000', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1000 START`)
      innerEvent.eventId = 10
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      eventData.data.id = 10
      eventData.data.content = 'message_10'
      emitter.on(innerEvent, EmitterCallback)

      emitter.off(10)
      emitter.emit(innerEvent, eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1000 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_1100
     * @tc.name      : verify on : off(eventId: number): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_1100', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1100 START`)
      innerEvent.eventId = 11
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      eventData.data.id = 11
      eventData.data.content = 'message_11'
      emitter.once(innerEvent, EmitterCallback)

      emitter.off(11)
      emitter.emit(innerEvent, eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1100 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_1200
     * @tc.name      : verify on : off(eventId: number): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_1200', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1200 START`)
      innerEvent.eventId = 12
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      eventData.data.id = 12
      eventData.data.content = 'message_12'
      emitter.on(innerEvent, EmitterCallback)

      emitter.off(1000)
      emitter.emit(innerEvent, eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1200 END`)
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_CES_EMITTER_TEST_1300
     * @tc.name      : verify on : off(eventId: number): void
     * @tc.desc      : emitter.EventPriority.IMMEDIATE
     */
    it('SUB_NOTIFICATION_CES_EMITTER_TEST_1300', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1300 START`)
      innerEvent.eventId = 13
      innerEvent.priority = emitter.EventPriority.IMMEDIATE

      eventData.data.id = 13
      eventData.data.content = 'message_13'
      emitter.on(innerEvent, EmitterCallback)

      emitter.off(1000)
      emitter.emit(innerEvent, eventData)
      console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST_1300 END`)
      done()
    })

    console.info(`${TAG} SUB_NOTIFICATION_CES_EMITTER_TEST END`)
  })  
}
