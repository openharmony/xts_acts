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
import events_emitter from '@ohos.events.emitter'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function EmitterTest() {
    describe('EmitterTest', function () {
        const TAG = 'EmitterTest ===> '
        console.info(TAG + 'EmitterTest START')
    
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
          }
        }
    
        /*
         * @tc.number    : EmitterTest_0100
         * @tc.name      : verify on : on(event: InnerEvent, callback: Callback<EventData>): void
         * @tc.desc      : events_emitter.EventPriority.IDLE
         */
        it('EmitterTest_0100', 0, async function (done) {
          console.info(TAG + 'EmitterTest_0100 START')
          innerEvent.eventId = 1
          innerEvent.priority = events_emitter.EventPriority.IDLE
    
          eventData.data.id = 0
          eventData.data.content = 'message_0'
    
          events_emitter.on(innerEvent, EmitterCallback)
          events_emitter.emit(innerEvent, eventData)
          eventData.data.id = 1
          eventData.data.content = 'message_1'
          events_emitter.emit(innerEvent, eventData)
          console.info(TAG + 'EmitterTest_0100 END')
          done()
        })
    
        /*
         * @tc.number    : EmitterTest_0200
         * @tc.name      : verify on : once(event: InnerEvent, callback: Callback<EventData>): void
         * @tc.desc      : events_emitter.EventPriority.LOW
         */
        it('EmitterTest_0200', 0, async function (done) {
          console.info(TAG + 'EmitterTest_0200 START')
          innerEvent.eventId = 2
          innerEvent.priority = events_emitter.EventPriority.LOW
    
          eventData.data.id = 2
          eventData.data.content = 'message_2'
    
          events_emitter.once(innerEvent, EmitterCallback)
          events_emitter.emit(innerEvent, eventData)
          console.info(TAG + 'EmitterTest_0200 END')
          done()
        })
    
        /*
         * @tc.number    : EmitterTest_0300
         * @tc.name      : verify on : emit(event: InnerEvent, data?: EventData): void
         * @tc.desc      : events_emitter.EventPriority.HIGH
         */
        it('EmitterTest_0300', 0, async function (done) {
          console.info(TAG + 'EmitterTest_0300 START')
          innerEvent.eventId = 3
          innerEvent.priority = events_emitter.EventPriority.HIGH
    
          eventData.data.id = 3
          eventData.data.content = 'message_3'
    
          events_emitter.once(innerEvent, EmitterCallback)
          events_emitter.emit(innerEvent, eventData)
          console.info(TAG + 'EmitterTest_0300 END')
          done()
        })
    
        /*
         * @tc.number    : EmitterTest_0400
         * @tc.name      : verify on : emit(event: InnerEvent, data?: EventData): void
         * @tc.desc      : events_emitter.EventPriority.IMMEDIATE
         */
        it('EmitterTest_0400', 0, async function (done) {
          console.info(TAG + 'EmitterTest_0400 START')
          innerEvent.eventId = 4
          innerEvent.priority = events_emitter.EventPriority.IMMEDIATE
    
          eventData.data.id = 4
          eventData.data.content = 'message_4'
    
          events_emitter.once(innerEvent, EmitterCallback)
          events_emitter.emit(innerEvent, eventData)
          console.info(TAG + 'EmitterTest_0400 END')
          done()
        })
    
        /*
         * @tc.number    : EmitterTest_0500
         * @tc.name      : verify on : off(eventId: number): void
         * @tc.desc      : events_emitter.EventPriority.IMMEDIATE
         */
        it('EmitterTest_0500', 0, async function (done) {
          console.info(TAG + 'EmitterTest_0500 START')
          innerEvent.eventId = 5
          innerEvent.priority = events_emitter.EventPriority.IMMEDIATE
    
          eventData.data.id = 5
          eventData.data.content = 'message_5'
    
          events_emitter.once(innerEvent, EmitterCallback)
          events_emitter.emit(innerEvent, eventData)
          events_emitter.off(5)
          console.info(TAG + 'EmitterTest_0500 END')
          done()
        })
    
        console.info(TAG + 'EmitterTest END')
      })    
}
