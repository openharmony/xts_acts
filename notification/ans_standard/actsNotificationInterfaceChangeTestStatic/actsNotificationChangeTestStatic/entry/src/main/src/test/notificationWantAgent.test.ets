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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import wantAgent, {WantAgent} from '@ohos.app.ability.wantAgent';

let TAG: string;
let bundle_name: string = 'com.example.notificationchangetest.static';

export default function ActsNotificationwantAgentInfoTest() {
  describe('ActsNotificationwantAgentInfoTest',  ()=> {

    /**
     * @tc.number Acts_WantAgentInfo_Static_0100
     * @tc.name Verify operationType properties and getOperationType properties.
     * @tc.desc Set wantAgent.OperationType.START_ABILITY and [wantAgent.WantAgentFlags.ONE_TIME_FLAG].
     */
    it('Acts_WantAgentInfo_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> =>{
        let TAG:string = 'Acts_WantAgentInfo_Static_0100 ==>';
        console.info('Acts_WantAgentInfo_0100 START')

        let WantAgent: Object;
        let parameters1 : Record<String,Object> = {
          "mykey0": 2222,
        }
        let WantAgentInfo: wantAgent.WantAgentInfo = {
          wants: [
            {
              deviceId: "deviceId",
              bundleName: bundle_name,
              abilityName: "EntryAbility",
              action: "action1",
              entities: ["entity1"],
              type: "MIMETYPE",
              uri: "key={true.true,false}",
              parameters: parameters1
            }
          ],
          actionType: wantAgent.OperationType.START_ABILITY,
          requestCode: 0,
          actionFlags: [wantAgent.WantAgentFlags.ONE_TIME_FLAG]
        }

        wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
          if (err&&err.code!==0) {
            console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            WantAgent = data
            console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
            wantAgent.getOperationType(WantAgent, (err, data) => {
              if (err&&err.code!==0) {
                console.info(`${TAG} getOperationType AsyncCallback err: ${err.code}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`${TAG} getOperationType AsyncCallback success: ${JSON.stringify(data)}`)
                expect(true).assertTrue()
                done()
              }
            })
          }
        })
        console.info('Acts_WantAgentInfo_0100 END')
      });

    /**
     * @tc.number Acts_WantAgentInfo_Static_0200
     * @tc.name Acts_WantAgentInfo_Static_0200
     * @tc.desc Set wantAgent.OperationType.START_ABILITY and [wantAgent.WantAgentFlags.NO_BUILD_FLAG].
     */
    it('Acts_WantAgentInfo_Static_0200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Acts_WantAgentInfo_Static_0200 ==>';
        console.info('Acts_WantAgentInfo_0200 START')

        let WantAgent: Object;
        let parameters1 : Record<String,Object> = {
          "mykey0": 2222,
        }
        let WantAgentInfo: wantAgent.WantAgentInfo = {
          wants: [
            {
              deviceId: "deviceId",
              bundleName: bundle_name,
              abilityName: "EntryAbility",
              action: "action1",
              entities: ["entity1"],
              type: "MIMETYPE",
              uri: "key={true.true,false}",
              parameters: parameters1
            }
          ],
          actionType: wantAgent.OperationType.START_ABILITY,
          requestCode: 0,
          actionFlags: [wantAgent.WantAgentFlags.NO_BUILD_FLAG]
        }

        wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
          if (err&&err.code!==0) {
            console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            WantAgent = data
            console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
            wantAgent.getOperationType(WantAgent, (err, data) => {
              if (err&&err.code!==0) {
                console.info(`${TAG} getOperationType AsyncCallback err: ${err.code}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`${TAG} getOperationType AsyncCallback success: ${JSON.stringify(data)}`)
                expect(true).assertTrue()
                done()
              }
            })
          }
        })
        console.info('Acts_WantAgentInfo_0200 END')
      });

    /**
     * @tc.number Acts_WantAgentInfo_Static_0300
     * @tc.name Acts_WantAgentInfo_Static_0300
     * @tc.desc Set wantAgent.OperationType.START_ABILITIES and [wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG].
     */
    it('Acts_WantAgentInfo_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Acts_WantAgentInfo_Static_0300 ==>';
        console.info('Acts_WantAgentInfo_0300 START')

        let WantAgent: Object;
        let parameters1 : Record<String,Object> = {
          "mykey0": 2222,
        }
        let WantAgentInfo: wantAgent.WantAgentInfo = {
          wants: [
            {
              deviceId: "deviceId",
              bundleName: bundle_name,
              abilityName: "EntryAbility",
              action: "action1",
              entities: ["entity1"],
              type: "MIMETYPE",
              uri: "key={true.true,false}",
              parameters: parameters1
            }
          ],
          actionType: wantAgent.OperationType.START_ABILITIES,
          requestCode: 0,
          actionFlags: [wantAgent.WantAgentFlags.CANCEL_PRESENT_FLAG]
        }

        wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
          if (err&&err.code!==0) {
            console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            WantAgent = data
            console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
            wantAgent.getOperationType(WantAgent, (err, data) => {
              if (err&&err.code!==0) {
                console.info(`${TAG} getOperationType AsyncCallback err: ${err.code}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`${TAG} getOperationType AsyncCallback success: ${JSON.stringify(data)}`)
                expect(true).assertTrue()
                done()
              }
            })
          }
        })
        console.info('Acts_WantAgentInfo_0300 END')
      });

    /**
     * @tc.number Acts_WantAgentInfo_Static_0400
     * @tc.name Verify operationType properties and getOperationType properties.
     * @tc.desc Set wantAgent.OperationType.START_SERVICE and [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG].
     */
    it('Acts_WantAgentInfo_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Acts_WantAgentInfo_0400 ==>';
        console.info('Acts_WantAgentInfo_0400 START')

        let WantAgent: Object;
        let parameters1 : Record<String,Object> = {
          "mykey0": 2222,
        }
        let WantAgentInfo: wantAgent.WantAgentInfo = {
          wants: [
            {
              deviceId: "deviceId",
              bundleName: bundle_name,
              abilityName: "EntryAbility",
              action: "action1",
              entities: ["entity1"],
              type: "MIMETYPE",
              uri: "key={true.true,false}",
              parameters: parameters1
            }
          ],
          actionType: wantAgent.OperationType.START_SERVICE,
          requestCode: 0,
          actionFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
        }

        wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
          if (err&&err.code!==0) {
            console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            WantAgent = data
            console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
            wantAgent.getOperationType(WantAgent, (err, data) => {
              if (err&&err.code!==0) {
                console.info(`${TAG} getOperationType AsyncCallback err: ${err.code}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`${TAG} getOperationType AsyncCallback success: ${JSON.stringify(data)}`)
                expect(true).assertTrue()
                done()
              }
            })
          }
        })
        console.info('Acts_WantAgentInfo_0400 END')
      });

    /**
     * @tc.number Acts_WantAgentInfo_Static_0500
     * @tc.name Verify operationType properties and getOperationType properties.
     * @tc.desc Set wantAgent.OperationType.SEND_COMMON_EVENT and [wantAgent.WantAgentFlags.CONSTANT_FLAG].
     */
    it('Acts_WantAgentInfo_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Acts_WantAgentInfo_0500 ==>';
        console.info('Acts_WantAgentInfo_0500 START')

        let WantAgent: Object;
        let parameters1 : Record<String,Object> = {
          "mykey0": 2222,
        }
        let WantAgentInfo: wantAgent.WantAgentInfo = {
          wants: [
            {
              deviceId: "deviceId",
              bundleName: bundle_name,
              abilityName: "EntryAbility",
              action: "action1",
              entities: ["entity1"],
              type: "MIMETYPE",
              uri: "key={true.true,false}",
              parameters: parameters1
            }
          ],
          actionType: wantAgent.OperationType.SEND_COMMON_EVENT,
          requestCode: 0,
          actionFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
        }

        wantAgent.getWantAgent(WantAgentInfo, (err, data) => {
          if (err&&err.code!==0) {
            console.info(`${TAG} getWantAgent AsyncCallback err: ${err.code}`)
            expect(false).assertTrue()
            done()
          } else {
            WantAgent = data
            console.info(`${TAG} getWantAgent AsyncCallback success: ${JSON.stringify(data)}`)
            wantAgent.getOperationType(WantAgent, (err, data) => {
              if (err&&err.code!==0) {
                console.info(`${TAG} getOperationType AsyncCallback err: ${err.code}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`${TAG} getOperationType AsyncCallback success: ${JSON.stringify(data)}`)
                expect(true).assertTrue()
                done()
              }
            })
          }
        })
        console.info('Acts_WantAgentInfo_0500 END')
      });
  })
}