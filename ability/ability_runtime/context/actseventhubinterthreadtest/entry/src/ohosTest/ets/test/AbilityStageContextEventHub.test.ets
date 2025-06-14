/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium'
import common from '@ohos.app.ability.common';
import { worker } from '@kit.ArkTS';
import { sendableContextManager } from '@kit.AbilityKit';
import { SendableObject } from '../model/sendableObject';

export default function AbilityStageContextEventHubTest() {

  describe('AbilityStageContextEventHubTest', () => {
    let context: common.AbilityStageContext | undefined =
      AppStorage.get<common.AbilityStageContext>('abilityStageContext');
    let event1: string = 'com.example.eventhubinterthreadtest.event1';
    let event2: string = 'com.example.eventhubinterthreadtest.event2';
    let event3: string = 'com.example.eventhubinterthreadtest.event3';
    let event4: string = 'com.example.eventhubinterthreadtest.event4';
  
    /*
     * @tc.number: SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1300
     * @tc.name: SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1300
     * @tc.desc: Test AbilityStageContext.eventHub communicate when main thread subscribe event1(callback1) and worker trigger event1.
     */
    it('SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1300';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      if ( context == undefined ) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} context is undefined`);
        expect.assertFail();
        done();
      } else {
        let worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/AbilityStageWorker.ets');
        let contextName: string = 'AbilityStageContext';
        sendableContextManager.setEventHubMultithreadingEnabled(context, true);
        context.eventHub.on(event1, (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event1 callback1 called`);
          expect(data).assertEqual(`${contextName}_worker_emit_${event1}`);
          context?.eventHub.off(event1);
          done();
        });
        let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
        let sendData: SendableObject = new SendableObject(sendableContext, contextName, "", "sendContext");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, "", "setTrue");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event1, "emit");
        worker1.postMessageWithSharedSendable(sendData);
      }
    })
    
    /*
     * @tc.number: SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1400
     * @tc.name: SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1400
     * @tc.desc: Test AbilityStageContext.eventHub communicate when main thread subscribe event1(callback1) 
     *   and event1(callback2) and worker trigger event1.
     */
    it('SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1400';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      if ( context == undefined ) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} context is undefined`);
        expect.assertFail();
        done();
      } else {
        let worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/AbilityStageWorker.ets');
        let contextName: string = 'AbilityStageContext';
        sendableContextManager.setEventHubMultithreadingEnabled(context, true);
        context.eventHub.on(event1, (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event1 callback1 called`);
          expect(data).assertEqual(`${contextName}_worker_emit_${event1}`);
        });
        context.eventHub.on(event1, (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event1 callback2 called`);
          expect(data).assertEqual(`${contextName}_worker_emit_${event1}`);
          context?.eventHub.off(event1);
          done();
        });
        let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
        let sendData: SendableObject = new SendableObject(sendableContext, contextName, "", "sendContext");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, "", "setTrue");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event1, "emit");
        worker1.postMessageWithSharedSendable(sendData);
      }
    })
    
    /*
     * @tc.number: SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1500
     * @tc.name: SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1500
     * @tc.desc: Test AbilityStageContext.eventHub communicate when main thread subscribe event1(callback1) 
     *   and event1(callback2) and event2(callback1) and event2(callback2) and worker trigger event1 and event2.
     */
    it('SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1500';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      if ( context == undefined ) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} context is undefined`);
        expect.assertFail();
        done();
      } else {
        let worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/AbilityStageWorker.ets');
        let contextName: string = 'AbilityStageContext';
        sendableContextManager.setEventHubMultithreadingEnabled(context, true);
        context.eventHub.on(event1, (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event1 callback1 called`);
          expect(data).assertEqual(`${contextName}_worker_emit_${event1}`);
        });
        context.eventHub.on(event1, (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event1 callback2 called`);
          expect(data).assertEqual(`${contextName}_worker_emit_${event1}`);
          context?.eventHub.off(event1);
        });
        context.eventHub.on(event2, (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event2 callback1 called`);
          expect(data).assertEqual(`${contextName}_worker_emit_${event2}`);
        });
        context.eventHub.on(event2, (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event2 callback2 called`);
          expect(data).assertEqual(`${contextName}_worker_emit_${event2}`);
          context?.eventHub.off(event2);
          done();
        });
        let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
        let sendData: SendableObject = new SendableObject(sendableContext, contextName, "", "sendContext");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, "", "setTrue");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event1, "emit");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event2, "emit");
        worker1.postMessageWithSharedSendable(sendData);
      }
    })
    
    /*
     * @tc.number: SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1600
     * @tc.name: SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1600
     * @tc.desc: Test AbilityStageContext.eventHub communicate when worker subscribe event1(callback1) and main thread trigger event1.
     */
    it('SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1600';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      if ( context == undefined ) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} context is undefined`);
        expect.assertFail();
        done();
      } else {
        let worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/AbilityStageWorker.ets');
        let contextName: string = 'AbilityStageContext';
        let emitData1: string = 'Context_main_emit_event1';
        sendableContextManager.setEventHubMultithreadingEnabled(context, true);
        context.eventHub.on('event1_callback1', (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} ${emitData1} event1_callback1 triggered`);
          expect(data).assertEqual(emitData1);
          context?.eventHub.off('event1_callback1');
          done();
        });

        let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
        let sendData: SendableObject = new SendableObject(sendableContext, contextName, "", "sendContext");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, "", "setTrue");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event1, "on", "event1_callback1");
        worker1.postMessageWithSharedSendable(sendData);
        setTimeout(() => {
          context?.eventHub.emit(event1, emitData1);
        }, 200);
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} end`);
      }
    })
    
    /*
     * @tc.number: SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1700
     * @tc.name: SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1700
     * @tc.desc: Test AbilityStageContext.eventHub communicate when worker subscribe event1(callback1) and event1(callback2)
     *   and main thread trigger event1.
     */
    it('SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1700';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      if ( context == undefined ) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} context is undefined`);
        expect.assertFail();
        done();
      } else {
        let worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/AbilityStageWorker.ets');
        let contextName: string = 'AbilityStageContext';
        let emitData2: string = 'Context_main_emit_event2';
        let result_event2_cb1: boolean = false;
        let result_event2_cb2: boolean = false;
        sendableContextManager.setEventHubMultithreadingEnabled(context, true);
        context.eventHub.on('event2_callback1', (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} ${emitData2} event1_callback1 triggered`);
          expect(data).assertEqual(emitData2);
          context?.eventHub.off('event2_callback1');
          result_event2_cb1 = true;
          if ( result_event2_cb2 ) {
            done();
          }
        });
        context.eventHub.on('event2_callback2', (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} ${emitData2} event1_callback2 triggered`);
          expect(data).assertEqual(emitData2);
          context?.eventHub.off('event2_callback2');
          result_event2_cb2 = true;
          if ( result_event2_cb1 ) {
            done();
          }
        });

        let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
        let sendData: SendableObject = new SendableObject(sendableContext, contextName, "", "sendContext");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, "", "setTrue");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event2, "on", "event2_callback1");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event2, "on", "event2_callback2");
        worker1.postMessageWithSharedSendable(sendData);
        setTimeout(() => {
          context?.eventHub.emit(event2, emitData2);
        }, 200);
      }
    })
    
    /*
     * @tc.number: SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1800
     * @tc.name: SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1800
     * @tc.desc: Test AbilityStageContext.eventHub communicate when worker subscribe event1(callback1) and event1(callback2)
     *   and main thread trigger event1.
     */
    it('SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_1800';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      if ( context == undefined ) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} context is undefined`);
        expect.assertFail();
        done();
      } else {
        let worker1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/AbilityStageWorker.ets');
        let contextName: string = 'AbilityStageContext';
        let emitData3: string = 'Context_main_emit_event3';
        let emitData4: string = 'Context_main_emit_event4';
        let result_event3_cb1: boolean = false;
        let result_event3_cb2: boolean = false;
        let result_event4_cb1: boolean = false;
        let result_event4_cb2: boolean = false;
        sendableContextManager.setEventHubMultithreadingEnabled(context, true);
        context.eventHub.on('event3_callback1', (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} ${emitData3} event3_callback1 triggered`);
          expect(data).assertEqual(emitData3);
          context?.eventHub.off('event3_callback1');
          result_event3_cb1 = true;
          if ( result_event4_cb1 && result_event4_cb2 && result_event3_cb2) {
            done();
          }
        });
        context.eventHub.on('event3_callback2', (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} ${emitData3} event3_callback2 triggered`);
          expect(data).assertEqual(emitData3);
          context?.eventHub.off('event3_callback2');
          result_event3_cb2 = true;
          if ( result_event4_cb1 && result_event4_cb2 && result_event3_cb1) {
            done();
          }
        });

        context.eventHub.on('event4_callback1', (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} ${emitData4} event4_callback1 triggered`);
          expect(data).assertEqual(emitData4);
          context?.eventHub.off('event4_callback1');
          result_event4_cb1 = true;
          if ( result_event4_cb2 && result_event3_cb1 && result_event3_cb2) {
            done();
          }
        });
        context.eventHub.on('event4_callback2', (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} ${emitData4} event4_callback2 triggered`);
          expect(data).assertEqual(emitData4);
          context?.eventHub.off('event4_callback1');
          result_event4_cb2 = true;
          if ( result_event4_cb1 && result_event3_cb1 && result_event3_cb2) {
            done();
          }
        });

        let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
        let sendData: SendableObject = new SendableObject(sendableContext, contextName, "", "sendContext");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, "", "setTrue");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event3, "on", "event3_callback1");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event3, "on", "event3_callback2");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event4, "on", "event4_callback1");
        worker1.postMessageWithSharedSendable(sendData);
        sendData = new SendableObject(sendableContext, contextName, event4, "on", "event4_callback2");
        worker1.postMessageWithSharedSendable(sendData);
        setTimeout(() => {
          context?.eventHub.emit(event3, emitData3);
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event3 triggered`);
          context?.eventHub.emit(event4, emitData4);
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event4 triggered`);
        }, 200);
      }
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_4900
     * @tc.name: SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_4900
     * @tc.desc: Test Context.eventHub communicate after convert between Context and SendableContext twice.
     */
    it('SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_4900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_setEventHubMultithreadingEnabled_4900';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      if ( context == undefined ) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} context is undefined`);
        expect.assertFail();
        done();
      } else {
        sendableContextManager.setEventHubMultithreadingEnabled(context, true);
        context?.eventHub.on('event4900', (data: string): void => {
          hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} event4900 callback1 called`);
          expect(data).assertEqual(`ctx2_emit_event4900`);
          context?.eventHub.off('event4900');
          done();
        });
        let sendableContext: sendableContextManager.SendableContext = sendableContextManager.convertFromContext(context);
        let ctx: Context = sendableContextManager.convertToContext(sendableContext);
        sendableContext = sendableContextManager.convertFromContext(ctx);
        let ctx2: Context = sendableContextManager.convertToContext(sendableContext);

        sendableContextManager.setEventHubMultithreadingEnabled(ctx2, true);
        ctx2.eventHub.emit('event4900', `ctx2_emit_event4900`);
        hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} ctx2 emit event1`);
      }
    })
  })
}