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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import commonEvent from '@ohos.commonEvent'
import prompt from '@system.prompt'
import config from '@ohos.accessibility.config'

const ASSIST_BUNDLE_NAME = 'com.example.gesturesimulationtest/ServiceExtAbility'
const LOG_PREFIX = '[CQH-GESTURE-ABILITY-TEST]'
const EVENT_NAME = 'on_assist_change'
const A_EVENT_NAME_BACK = 'on_assist_change_extra'
const T_EVENT_NAME_BACK = 'on_target_change_extra'
const TIME_OUT = 3000
const TIME_OUT_L = 5000
let CommonEventSubscribeInfo = {
  events: [T_EVENT_NAME_BACK, A_EVENT_NAME_BACK]
}

export default function abilityTest() {

  let subscriber = undefined
  let tarResult: Map<string, boolean> = new Map()
  let assResult: Map<string, boolean> = new Map()

  describe('ActsGestureSimulationTest', function (abilityContext) {
    beforeAll(async function (done) {
      console.info(LOG_PREFIX + '[StartTargetApp] start')
      try {
        subscriber = await commonEvent.createSubscriber(CommonEventSubscribeInfo)
        try {
          commonEvent.subscribe(subscriber, (error, commonEventData) => {
            if (error.code != 0) {
              console.info(LOG_PREFIX + 'subscribe callback error. Cause:' + JSON.stringify(error))
              return
            }
            console.info(LOG_PREFIX + 'subscribeTest callback : ' + JSON.stringify(commonEventData))
            if (commonEventData.event === T_EVENT_NAME_BACK) {
              tarResult.set(commonEventData.data, commonEventData.parameters.res)
            } else {
              assResult.set(commonEventData.data, commonEventData.parameters.res)
            }
          })
        } catch (e) {
          console.info(LOG_PREFIX + 'subscribe failed. Cause:' + JSON.stringify(e))
        }
        enableAbility(LOG_PREFIX, ASSIST_BUNDLE_NAME, ['gesture'])
        setTimeout(() => {
          done()
        }, 1000)
      } catch (e) {
        console.info(LOG_PREFIX + '[StartTargetApp]  error' + e.message)
      }
    })
    afterAll(async function (done) {
      prompt.showToast({
        message: 'CASE All End'
      })
      disableAbility(LOG_PREFIX, ASSIST_BUNDLE_NAME)
      done()
    })
    beforeEach(function (done) {
      setTimeout(() => {
        done()
      }, 2000)
    })
    /**
     * @tc.number: GestureSimulation_0010
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute click gesture operation(callback).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute click gesture operation(callback).
     */
    it('GestureSimulation_0010', 1, async function (done) {
      var caseCode = 'GestureSimulation_0010'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + 'GestureSimulation_0010 tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0020
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute click gesture operation(promise).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute click gesture operation(promise).
     */
    it('GestureSimulation_0020', 1, async function (done) {
      var caseCode = 'GestureSimulation_0020'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + 'GestureSimulation_0020 tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0030
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute longClick gesture operation(callback).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute longClick gesture operation(callback).
     */
    it('GestureSimulation_0030', 1, async function (done) {
      var caseCode = 'GestureSimulation_0030'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + 'GestureSimulation_0030 tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT_L)
    })
    /**
     * @tc.number: GestureSimulation_0040
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute longClick gesture operation(promise).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute longClick gesture operation(promise).
     */
    it('GestureSimulation_0040', 1, async function (done) {
      var caseCode = 'GestureSimulation_0040'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + 'GestureSimulation_0040 tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT_L)
    })
    /**
     * @tc.number: GestureSimulation_0070
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute scrollBackward gesture operation(callback).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute scrollBackward gesture operation(callback).
     */
    it('GestureSimulation_0070', 1, async function (done) {
      var caseCode = 'GestureSimulation_0070'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + 'GestureSimulation_0070 tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0080
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute scrollBackward gesture operation(promise).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute scrollBackward gesture operation(promise).
     */
    it('GestureSimulation_0080', 1, async function (done) {
      var caseCode = 'GestureSimulation_0080'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + 'GestureSimulation_0080 tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0090
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute left gesture operation(callback).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute left gesture operation(callback).
     */
    it('GestureSimulation_0090', 1, async function (done) {
      var caseCode = 'GestureSimulation_0090'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0100
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute left gesture operation(promise).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute left gesture operation(promise).
     */
    it('GestureSimulation_0100', 1, async function (done) {
      var caseCode = 'GestureSimulation_0100'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0110
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute leftThenRight gesture operation(callback).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute leftThenRight gesture operation(callback).
     */
    it('GestureSimulation_0110', 1, async function (done) {
      var caseCode = 'GestureSimulation_0110'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0120
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute leftThenRight gesture operation(promise).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute leftThenRight gesture operation(promise).
     */
    it('GestureSimulation_0120', 1, async function (done) {
      var caseCode = 'GestureSimulation_0120'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0130
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute leftThenUp gesture operation(callback).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute leftThenUp gesture operation(callback).
     */
    it('GestureSimulation_0130', 1, async function (done) {
      var caseCode = 'GestureSimulation_0130'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0140
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute leftThenUp gesture operation(promise).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute leftThenUp gesture operation(promise).
     */
    it('GestureSimulation_0140', 1, async function (done) {
      var caseCode = 'GestureSimulation_0140'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0150
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute leftThenDown gesture operation(callback).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute leftThenDown gesture operation(callback).
     */
    it('GestureSimulation_0150', 1, async function (done) {
      var caseCode = 'GestureSimulation_0150'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0160
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute leftThenDown gesture operation(promise).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute leftThenDown gesture operation(promise).
     */
    it('GestureSimulation_0160', 1, async function (done) {
      var caseCode = 'GestureSimulation_0160'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0170
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute right gesture operation(callback).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute right gesture operation(callback).
     */
    it('GestureSimulation_0170', 1, async function (done) {
      var caseCode = 'GestureSimulation_0170'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0180
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute right gesture operation(promise).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute right gesture operation(promise).
     */
    it('GestureSimulation_0180', 1, async function (done) {
      var caseCode = 'GestureSimulation_0180'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0190
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute rightThenLeft gesture operation(callback).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute rightThenLeft gesture operation(callback).
     */
    it('GestureSimulation_0190', 1, async function (done) {
      var caseCode = 'GestureSimulation_0190'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0200
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute rightThenLeft gesture operation(promise).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute rightThenLeft gesture operation(promise).
     */
    it('GestureSimulation_0200', 1, async function (done) {
      var caseCode = 'GestureSimulation_0200'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0210
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute rightThenUp gesture operation(callback).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute rightThenUp gesture operation(callback).
     */
    it('GestureSimulation_0210', 1, async function (done) {
      var caseCode = 'GestureSimulation_0210'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0220
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute rightThenUp gesture operation(promise).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute rightThenUp gesture operation(promise).
     */
    it('GestureSimulation_0220', 1, async function (done) {
      var caseCode = 'GestureSimulation_0220'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0230
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute rightThenDown gesture operation(callback).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute rightThenDown gesture operation(callback).
     */
    it('GestureSimulation_0230', 1, async function (done) {
      var caseCode = 'GestureSimulation_0230'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0220
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute rightThenDown gesture operation(promise).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute rightThenDown gesture operation(promise).
     */
    it('GestureSimulation_0240', 1, async function (done) {
      var caseCode = 'GestureSimulation_0240'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0250
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute up gesture operation(callback).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute up gesture operation(callback).
     */
    it('GestureSimulation_0250', 1, async function (done) {
      var caseCode = 'GestureSimulation_0250'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0260
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute up gesture operation(promise).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute up gesture operation(promise).
     */
    it('GestureSimulation_0260', 1, async function (done) {
      var caseCode = 'GestureSimulation_0260'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0270
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute upThenLeft gesture operation(callback).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute upThenLeft gesture operation(callback).
     */
    it('GestureSimulation_0270', 1, async function (done) {
      var caseCode = 'GestureSimulation_0270'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0280
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute upThenLeft gesture operation(promise).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute upThenLeft gesture operation(promise).
     */
    it('GestureSimulation_0280', 1, async function (done) {
      var caseCode = 'GestureSimulation_0280'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0290
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute upThenRight gesture operation(callback).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute upThenRight gesture operation(callback).
     */
    it('GestureSimulation_0290', 1, async function (done) {
      var caseCode = 'GestureSimulation_0290'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0300
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute upThenRight gesture operation(promise).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute upThenRight gesture operation(promise).
     */
    it('GestureSimulation_0300', 1, async function (done) {
      var caseCode = 'GestureSimulation_0300'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0310
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute upThenDown gesture operation(callback).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute upThenDown gesture operation(callback).
     */
    it('GestureSimulation_0310', 1, async function (done) {
      var caseCode = 'GestureSimulation_0310'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0320
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute upThenDown gesture operation(promise).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute upThenDown gesture operation(promise).
     */
    it('GestureSimulation_0320', 1, async function (done) {
      var caseCode = 'GestureSimulation_0320'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0330
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute down gesture operation(callback).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute down gesture operation(callback).
     */
    it('GestureSimulation_0330', 1, async function (done) {
      var caseCode = 'GestureSimulation_0330'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0340
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute down gesture operation(promise).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute down gesture operation(promise).
     */
    it('GestureSimulation_0340', 1, async function (done) {
      var caseCode = 'GestureSimulation_0340'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0350
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute downThenLeft gesture operation(callback).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute downThenLeft gesture operation(callback).
     */
    it('GestureSimulation_0350', 1, async function (done) {
      var caseCode = 'GestureSimulation_0350'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0360
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute downThenLeft gesture operation(promise).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute downThenLeft gesture operation(promise).
     */
    it('GestureSimulation_0360', 1, async function (done) {
      var caseCode = 'GestureSimulation_0360'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0370
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute downThenRight gesture operation(callback).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute downThenRight gesture operation(callback).
     */
    it('GestureSimulation_0370', 1, async function (done) {
      var caseCode = 'GestureSimulation_0370'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0380
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute downThenRight gesture operation(promise).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute downThenRight gesture operation(promise).
     */
    it('GestureSimulation_0380', 1, async function (done) {
      var caseCode = 'GestureSimulation_0380'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0390
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute downThenUp gesture operation(callback).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute downThenUp gesture operation(callback).
     */
    it('GestureSimulation_0390', 1, async function (done) {
      var caseCode = 'GestureSimulation_0390'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0400
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute downThenUp gesture operation(promise).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute downThenUp gesture operation(promise).
     */
    it('GestureSimulation_0400', 1, async function (done) {
      var caseCode = 'GestureSimulation_0400'
      publish(caseCode)
      setTimeout(()=>{
        let tarData = tarResult.get(caseCode)
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + caseCode + ' tarData: ' + tarData + ' assData: ' + assData + ' expect assertTrue')
        disableAbility(LOG_PREFIX, ASSIST_BUNDLE_NAME)
        setTimeout(()=>enableAbility(LOG_PREFIX, ASSIST_BUNDLE_NAME, ['retrieve']), 600)
        expect(tarData).assertTrue()
        expect(assData).assertTrue()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0410
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute up gesture operation(callback).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute up gesture operation(callback).
     */
    it('GestureSimulation_0410', 1, async function (done) {
      var caseCode = 'GestureSimulation_0410'
      publish(caseCode)
      setTimeout(()=>{
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + 'GestureSimulation_0410 assData: ' + assData + ' expect assertFalse')
        expect(assData).assertFalse()
        done()
      }, TIME_OUT)
    })
    /**
     * @tc.number: GestureSimulation_0420
     * @tc.name: The auxiliary application simulates gesture operation to trigger the target application to execute up gesture operation(promise).
     * @tc.desc: The auxiliary application simulates gesture operation to trigger the target application to execute up gesture operation(promise).
     */
    it('GestureSimulation_0420', 1, async function (done) {
      var caseCode = 'GestureSimulation_0420'
      publish(caseCode)
      setTimeout(()=>{
        let assData = assResult.get(caseCode)
        console.info(LOG_PREFIX + 'GestureSimulation_0420 assData: ' + assData + ' expect assertFalse')
        expect(assData).assertFalse()
        done()
      }, TIME_OUT)
    })

  })

   function enableAbility(logTag, bundleName, capability) {
     config.enableAbility(bundleName, capability).then(() => {
      console.info(logTag + 'enableAbility success.')
    }).catch((error) => {
      console.info(logTag + 'enableAbility failed. Cause: ' + JSON.stringify(error))
      return
    })
  }

   function disableAbility(logTag, bundleName) {
     config.disableAbility(bundleName).then(() => {
      console.info(logTag + 'disableAbility success.')
    }).catch((error) => {
      console.info(logTag + 'disableAbility failed. Cause: ' + JSON.stringify(error))
      return
    })
  }

  function publish(caseCode) {
    let commonEventPublishData = {
      data: caseCode
    }
    try {
      commonEvent.publish(EVENT_NAME, commonEventPublishData, (err, data) => {
        if (err && err.code != 0) {
          console.info(LOG_PREFIX + caseCode + ' failed to publish because ' + JSON.stringify(err))
          return
        }
        console.info(LOG_PREFIX + caseCode + ' success publish')
        prompt.showToast({
          message: 'CASE ' + caseCode
        })
      })
    } catch (e) {
      console.info(LOG_PREFIX + caseCode + ' error to publish because ' + JSON.stringify(e))
    }
  }
}