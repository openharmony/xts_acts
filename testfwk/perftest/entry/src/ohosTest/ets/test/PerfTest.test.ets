/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import Want from '@ohos.app.ability.Want';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';
import { PerfMetric, PerfTest, PerfTestStrategy, PerfMeasureResult } from '@ohos.test.PerfTest';
import { BusinessError, Callback } from '@kit.BasicServicesKit';
import { PerfUtils } from '../../../main/ets/utils/PerfUtils';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();

async function startAbility(bundleName: string, abilityName: string) {
  await delegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`).then(result => {
    console.info(`PerfTestCase, start abilityFinished: ${result}`)
  }).catch((err : BusinessError) => {
    console.error(`PerfTestCase, start abilityFailed: ${err}`)
  })
}
async function stopApplication(bundleName: string) {
  await delegator.executeShellCommand(`aa force-stop ${bundleName} `).then(result => {
    console.info(`PerfTestCase, stop application finished: ${result}`)
  }).catch((err : BusinessError) => {
    console.error(`PerfTestCase,stop application failed: ${err}`)
  })
}

export default function PerfTestTest() {
  describe('PerfTestTest', () => {


    beforeAll(async (done: Function) => {
      done()
    })

    /*
     * @tc.number: perfTest_20001
     * @tc.name: testPerfTestCalculate
     * @tc.desc: Test the performance of computing scenarios
     */
    it('testPerfTestCalculate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
      let actionCode = async (finish: Callback<boolean>) => {
        PerfUtils.CalculateTest()
        finish(true)
      }
      let perfTestStrategy: PerfTestStrategy = {
        metrics: metrics,
        actionCode: actionCode,
        iterations: 5,
        timeout: 30000,
      }
      let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
      await perfTest.run()
      let res1 = perfTest.getMeasureResult(PerfMetric.DURATION)
      let res2 = perfTest.getMeasureResult(PerfMetric.CPU_LOAD)
      let res3 = perfTest.getMeasureResult(PerfMetric.CPU_USAGE)
      let res4 = perfTest.getMeasureResult(PerfMetric.MEMORY_RSS)
      let res5 = perfTest.getMeasureResult(PerfMetric.MEMORY_PSS)
      perfTest.destroy()
      expect(res1.maximum).assertLargerOrEqual(0)
      expect(res1.minimum).assertLargerOrEqual(0)
      expect(res1.average).assertLargerOrEqual(0)
      expect(res2.metric).assertLargerOrEqual(0)
      expect(res2.average).assertLargerOrEqual(0)
      expect(res3.average).assertLargerOrEqual(0)
      expect(res4.average).assertLargerOrEqual(0)
      expect(res5.average).assertLargerOrEqual(0)
      done()
    })

    /*
     * @tc.number: perfTest_20002
     * @tc.name: testPerfTestPageJump
     * @tc.desc: Test the performance of page jump
     */
    it('testPerfTestPageJump', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await startAbility('com.perftestScene.acts', 'EntryAbility');
      let driver = Driver.create()
      await driver.delayMs(3000)
      let metrics: Array<PerfMetric> = [PerfMetric.PAGE_SWITCH_COMPLETE_TIME]
      let actionCode = async (finish: Callback<boolean>) => {
        let button = await driver.findComponent(ON.text('ListPage'))
        await driver.delayMs(1000)
        await button.click()
        await driver.delayMs(1000)
        finish(true)
      }
      let resetCode = async (finish: Callback<boolean>) => {
        await driver.pressBack()
        await driver.delayMs(1000)
        finish(true)
      }
      let perfTestStrategy: PerfTestStrategy = {
        metrics: metrics,
        actionCode: actionCode,
        resetCode: resetCode,
        timeout: 50000,
        bundleName: "com.perftestScene.acts"
      }
      let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
      await perfTest.run()
      let res1 = perfTest.getMeasureResult(PerfMetric.PAGE_SWITCH_COMPLETE_TIME)
      perfTest.destroy()
      expect(res1.average).assertLargerOrEqual(0)
      await stopApplication('com.perftestScene.acts')
      done()
    })

    /*
     * @tc.number: perfTest_20003
     * @tc.name: testPerfTestListSwipe
     * @tc.desc: Test the performance of list swipe scenarios
     */
    it('testPerfTestListSwipe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await startAbility('com.perftest.acts', 'EntryAbility');
      let driver = Driver.create()
      await driver.delayMs(3000)
      let button = await driver.findComponent(ON.text('ListPage'))
      await driver.delayMs(1000)
      await button.click()
      console.info("click over!!!!")
      await driver.delayMs(1000)
      let metrics: Array<PerfMetric> = [PerfMetric.LIST_SWIPE_FPS]
      console.info("create metrics over!!!!")
      let actionCode = async (finish: Callback<boolean>) => {
        let scroll = await driver.findComponent(ON.type('Scroll'))
        await driver.delayMs(1000)
        console.info("scroll over!!!!")
        let center = await scroll.getBoundsCenter()
        await driver.delayMs(1000)
        console.info("center over!!!!")
        await driver.fling({x: center.x, y: Math.floor(center.y * 3 / 2)}, {x: center.x, y: Math.floor(center.y / 2)}, 50, 20000)
        await driver.delayMs(3000)
        finish(true)
      }
      let resetCode = async (finish: Callback<boolean>) => {
        let scroll = await driver.findComponent(ON.type('Scroll'))
        console.info("scroll1 over!!!!")
        await driver.delayMs(1000)
        await scroll.scrollToTop(40000)
        await driver.delayMs(1000)
        finish(true)
      }
      let perfTestStrategy: PerfTestStrategy = {
        metrics: metrics,
        actionCode: actionCode,
        resetCode: resetCode,
        iterations: 5,
        timeout: 50000,
        // bundleName: "com.perftest.acts"
      }
      let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
      await perfTest.run()
      let res1 = perfTest.getMeasureResult(PerfMetric.LIST_SWIPE_FPS)
      perfTest.destroy()
      expect(res1.average).assertLargerOrEqual(0)
      done()
    })

    /*
     * @tc.number: perfTest_20004
     * @tc.name: testPerfTest_Keep
     * @tc.desc: Test the performance of Page keep
     */
    it('testPerfTest_Keep', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await startAbility('com.perftestScene.acts', 'EntryAbility');
      console.info(`caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      let driver = Driver.create()
      await driver.delayMs(3000)
      let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
      let actionCode = async (finish: Callback<boolean>) => {
        let driver = Driver.create()
        await driver.delayMs(1000)
        finish(true)
      }
      let perfTestStrategy: PerfTestStrategy = {
        metrics: metrics,
        actionCode: actionCode,
        iterations: 5,
        timeout: 50000,
        bundleName: "com.perftestScene.acts"
      }
      let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
      await perfTest.run()
      console.info(`testPerfTest_Kepp run over!!!!!!!!`)
      let res1 = perfTest.getMeasureResult(PerfMetric.DURATION)
      console.info(`testPerfTest_Kepp measureResult DURATION metric = ${res1.metric}, roundValues = ${res1.roundValues}, maximum = ${res1.maximum}, minimum = ${res1.minimum}, average = ${res1.average}, `)
      let res2 = perfTest.getMeasureResult(PerfMetric.CPU_LOAD)
      console.info(`testPerfTest_Kepp measureResult CPU_LOAD metric = ${res2.metric}, roundValues = ${res2.roundValues}, maximum = ${res2.maximum}, minimum = ${res2.minimum}, average = ${res2.average}, `)
      let res3 = perfTest.getMeasureResult(PerfMetric.CPU_USAGE)
      console.info(`testPerfTest_Kepp measureResult CPU_USAGE metric = ${res3.metric}, roundValues = ${res3.roundValues}, maximum = ${res3.maximum}, minimum = ${res3.minimum}, average = ${res3.average}, `)
      let res4 = perfTest.getMeasureResult(PerfMetric.MEMORY_RSS)
      console.info(`testPerfTest_Kepp measureResult MEMORY_RSS metric = ${res4.metric}, roundValues = ${res4.roundValues}, maximum = ${res4.maximum}, minimum = ${res4.minimum}, average = ${res4.average}, `)
      let res5 = perfTest.getMeasureResult(PerfMetric.MEMORY_PSS)
      console.info(`testPerfTest_Kepp measureResult MEMORY_PSS metric = ${res5.metric}, roundValues = ${res5.roundValues}, maximum = ${res5.maximum}, minimum = ${res5.minimum}, average = ${res5.average}, `)
      perfTest.destroy()
      await stopApplication('com.perftestScene.acts')
      expect(res1.average).assertLargerOrEqual(0)
      expect(res2.average).assertLargerOrEqual(0)
      expect(res3.average).assertLargerOrEqual(0)
      expect(res4.average).assertLargerOrEqual(0)
      expect(res5.average).assertLargerOrEqual(0)
      done()
    })

    /*
     * @tc.number: perfTest_20005
     * @tc.name: testPerfTest_Navigationchange
     * @tc.desc: Test the performance of Page switching(Navigation)
     */
    it('testPerfTest_Navigationchange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await startAbility('com.perftestScene.acts', 'EntryAbility');
      console.info(`caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      let driver = Driver.create()
      await driver.delayMs(3000)
      let textCom = await driver.findComponent(ON.text('navigation'))
      await driver.delayMs(1000)
      let center = await textCom.getBoundsCenter()
      await driver.delayMs(1000)
      await driver.click(center.x, center.y)
      await driver.delayMs(1000)
      let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS, PerfMetric.PAGE_SWITCH_COMPLETE_TIME]
      let actionCode = async (finish: Callback<boolean>) => {
        let driver = Driver.create()
        await driver.delayMs(1000)
        let textCom1 = await driver.findComponent(ON.text('push Page01'))
        await driver.delayMs(1000)
        let center1 = await textCom1.getBoundsCenter()
        await driver.delayMs(1000)
        await driver.click(center1.x, center1.y)
        await driver.delayMs(1000)
        finish(true)
      }
      let resetCode = async (finish: Callback<boolean>) => {
        let driver = Driver.create()
        await driver.delayMs(1000)
        await driver.pressBack()
        await driver.delayMs(1000)
        finish(true)
      }
      let perfTestStrategy: PerfTestStrategy = {
        metrics: metrics,
        actionCode: actionCode,
        iterations: 5,
        resetCode: resetCode,
        timeout: 50000,
        bundleName: "com.perftestScene.acts"
      }
      let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
      await perfTest.run()
      console.info(`testPerfTest_Navigationchange run over!!!!!!!!`)
      let res1 = perfTest.getMeasureResult(PerfMetric.DURATION)
      let res2 = perfTest.getMeasureResult(PerfMetric.CPU_LOAD)
      let res3 = perfTest.getMeasureResult(PerfMetric.CPU_USAGE)
      let res4 = perfTest.getMeasureResult(PerfMetric.MEMORY_RSS)
      let res5 = perfTest.getMeasureResult(PerfMetric.MEMORY_PSS)
      let res6 = perfTest.getMeasureResult(PerfMetric.PAGE_SWITCH_COMPLETE_TIME)
      perfTest.destroy()
      await stopApplication('com.perftestScene.acts')
      expect(res1.average).assertLargerOrEqual(0)
      expect(res2.average).assertLargerOrEqual(0)
      expect(res3.average).assertLargerOrEqual(0)
      expect(res4.average).assertLargerOrEqual(0)
      expect(res5.average).assertLargerOrEqual(0)
      expect(res6.average).assertLargerOrEqual(0)
      done()
    })

    /*
     * @tc.number: perfTest_20007
     * @tc.name: testPerfTest_Start
     * @tc.desc: Test the performance of App launch
     */
    it('testPerfTest_Start', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      let driver = Driver.create()
      await driver.delayMs(3000)
      console.log('create over!!!!!!!!!!!!')
      await driver.delayMs(1000)
      await driver.pressHome()
      await driver.delayMs(1000)
      console.log('pressHome over!!!!!!!!!!!!')
      let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.APP_START_RESPONSE_TIME, PerfMetric.APP_START_COMPLETE_TIME]
      let actionCode = async (finish: Callback<boolean>) => {
        let driver = Driver.create()
        await driver.delayMs(1000)
        console.log('create1 over!!!!!!!!!!!!')
        let btn1 = await driver.findComponent(ON.text('PerftestScene'))
        console.log('btn1  over!!!!!!!!!!!!')
        await btn1.click()
        await driver.delayMs(1000)
        finish(true)
      }
      let resetCode = async (finish: Callback<boolean>) => {
        let driver = Driver.create()
        await driver.delayMs(1000)
        await stopApplication('com.perftestScene.acts')
        await driver.delayMs(1000)
        finish(true)
      }
      let perfTestStrategy: PerfTestStrategy = {
        metrics: metrics,
        actionCode: actionCode,
        resetCode: resetCode,
        timeout: 50000,
        iterations: 5,
        bundleName: "com.perftestScene.acts"
      }
      let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
      await perfTest.run()
      console.info(`testPerfTest_start run over!!!!!!!!`)
      let res1 = perfTest.getMeasureResult(PerfMetric.DURATION)
      let res6 = perfTest.getMeasureResult(PerfMetric.APP_START_RESPONSE_TIME)
      let res7 = perfTest.getMeasureResult(PerfMetric.APP_START_COMPLETE_TIME)
      perfTest.destroy()
      await stopApplication('com.perftestScene.acts')
      expect(res1.average).assertLargerOrEqual(0)
      expect(res6.average).assertLargerOrEqual(0)
      expect(res7.average).assertLargerOrEqual(0)
      done()
    })

    /*
     * @tc.number: perfTest_20008
     * @tc.name: testPerfTest_Startself
     * @tc.desc: Test the performance of the app launches on its own
     */
    it('testPerfTest_Startself', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      let driver = Driver.create()
      await driver.delayMs(3000)
      await driver.pressBack()
      await driver.delayMs(1000)
      await driver.pressBack()
      await driver.delayMs(1000)
      let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.APP_START_RESPONSE_TIME, PerfMetric.APP_START_COMPLETE_TIME]
      let actionCode = async (finish: Callback<boolean>) => {
        let driver = Driver.create()
        console.log('create over!!!!!!!!!!!!')
        await driver.delayMs(1000)
        let btn1 = await driver.findComponent(ON.text('label'))
        await btn1.click()
        await driver.delayMs(1000)
        finish(true)
      }
      let resetCode = async (finish: Callback<boolean>) => {
        let driver = Driver.create()
        await driver.delayMs(1000)
        await driver.pressBack()
        await driver.delayMs(1000)
        finish(true)
      }
      let perfTestStrategy: PerfTestStrategy = {
        metrics: metrics,
        actionCode: actionCode,
        resetCode: resetCode,
        timeout: 50000,
        iterations: 5,
      }
      let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
      await perfTest.run()
      console.info(`testPerfTest_startself run over!!!!!!!!`)
      let res1 = perfTest.getMeasureResult(PerfMetric.DURATION)
      console.info(`testPerfTest_startself measureResult DURATION metric = ${res1.metric}, roundValues = ${res1.roundValues}, maximum = ${res1.maximum}, minimum = ${res1.minimum}, average = ${res1.average}, `)
      let res6 = perfTest.getMeasureResult(PerfMetric.APP_START_RESPONSE_TIME)
      console.info(`testPerfTest_startself measureResult APP_START_RESPONSE_TIME metric = ${res6.metric}, roundValues = ${res6.roundValues}, maximum = ${res6.maximum}, minimum = ${res6.minimum}, average = ${res6.average}, `)
      let res7 = perfTest.getMeasureResult(PerfMetric.APP_START_COMPLETE_TIME)
      console.info(`testPerfTest_startself  measureResult APP_START_COMPLETE_TIME metric = ${res7.metric}, roundValues = ${res7.roundValues}, maximum = ${res7.maximum}, minimum = ${res7.minimum}, average = ${res7.average}, `)
      perfTest.destroy()
      expect(res1.average).assertLargerOrEqual(0)
      expect(res7.average).assertLargerOrEqual(0)
      expect(res6.average).assertLargerOrEqual(0)
      done()
    })

    /*
     * @tc.number: perfTest_20009
     * @tc.name: testPerfTest_ActionCodenull
     * @tc.desc: Test the performance of the ActionCodenull
     */
    it('testPerfTest_ActionCodenull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`caniuse perftest = ${canIUse("SystemCapability.Test.PerfTest")}`)
      let driver = Driver.create()
      await driver.delayMs(3000)
      let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
      // let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE]
      let actionCode = async (finish: Callback<boolean>) => {
        finish(true)
      }
      let resetCode = async (finish: Callback<boolean>) => {
        finish(true)
      }
      let perfTestStrategy: PerfTestStrategy = {
        metrics: metrics,
        actionCode: actionCode,
        resetCode: resetCode,
        timeout: 50000,
        iterations: 5,
      }
      let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
      await perfTest.run()
      console.info(`testPerfTest_ActionCodenull run over!!!!!!!!`)
      let res1 = perfTest.getMeasureResult(PerfMetric.DURATION)
      console.info(`testPerfTest_ActionCodenull measureResult DURATION metric = ${res1.metric}, roundValues = ${res1.roundValues}, maximum = ${res1.maximum}, minimum = ${res1.minimum}, average = ${res1.average}, `)
      let res2 = perfTest.getMeasureResult(PerfMetric.CPU_LOAD)
      console.info(`testPerfTest_ActionCodenull measureResult CPU_LOAD metric = ${res2.metric}, roundValues = ${res2.roundValues}, maximum = ${res2.maximum}, minimum = ${res2.minimum}, average = ${res2.average}, `)
      let res3 = perfTest.getMeasureResult(PerfMetric.CPU_USAGE)
      console.info(`testPerfTest_ActionCodenull measureResult CPU_USAGE metric = ${res3.metric}, roundValues = ${res3.roundValues}, maximum = ${res3.maximum}, minimum = ${res3.minimum}, average = ${res3.average}, `)
      let res4 = perfTest.getMeasureResult(PerfMetric.MEMORY_RSS)
      console.info(`testPerfTest_ActionCodenull measureResult MEMORY_RSS metric = ${res4.metric}, roundValues = ${res4.roundValues}, maximum = ${res4.maximum}, minimum = ${res4.minimum}, average = ${res4.average}, `)
      let res5 = perfTest.getMeasureResult(PerfMetric.MEMORY_PSS)
      console.info(`testPerfTest_ActionCodenull measureResult MEMORY_PSS metric = ${res5.metric}, roundValues = ${res5.roundValues}, maximum = ${res5.maximum}, minimum = ${res5.minimum}, average = ${res5.average}, `)
      perfTest.destroy()
      expect(res1.average).assertLargerOrEqual(0)
      expect(res2.average).assertLargerOrEqual(0)
      expect(res3.average).assertLargerOrEqual(0)
      expect(res4.average).assertLargerOrEqual(0)
      expect(res5.average).assertLargerOrEqual(0)
      done()
    })

    /*
     * @tc.number: perfTest_20010
     * @tc.name: testPerfTest_List
     * @tc.desc: Test the performance of the list sliding
     */
    it('testPerfTest_List', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await startAbility('com.perftestScene.acts', 'EntryAbility');
      let driver = Driver.create()
      await driver.delayMs(3000)
      let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS, PerfMetric.LIST_SWIPE_FPS]
      // let metrics: Array<PerfMetric> = [PerfMetric.DURATION, PerfMetric.CPU_LOAD, PerfMetric.CPU_USAGE, PerfMetric.MEMORY_RSS, PerfMetric.MEMORY_PSS]
      let actionCode = async (finish: Callback<boolean>) => {
        let button = await driver.findComponent(ON.text('ListPage'))
        await driver.delayMs(1000)
        await button.click()
        console.info("click over!!!!")
        let scroll = await driver.findComponent(ON.type('Scroll'))
        await driver.delayMs(1000)
        console.info("scroll over!!!!")
        let center = await scroll.getBoundsCenter()
        await driver.delayMs(1000)
        console.info("center over!!!!")
        await driver.fling({x: center.x, y: Math.floor(center.y * 3 / 2)}, {x: center.x, y: Math.floor(center.y / 2)}, 50, 20000)
        await driver.delayMs(3000)
        finish(true)
      }
      let resetCode = async (finish: Callback<boolean>) => {
        let driver = Driver.create()
        await driver.delayMs(1000)
        await driver.pressBack()
        await driver.delayMs(1000)
        finish(true)
      }
      let perfTestStrategy: PerfTestStrategy = {
        metrics: metrics,
        actionCode: actionCode,
        resetCode: resetCode,
        iterations: 5,
        timeout: 50000,
        bundleName: 'com.perftestScene.acts'
      }
      let perfTest: PerfTest = PerfTest.create(perfTestStrategy)
      await perfTest.run()
      console.info(`testPerfTest_List run over!!!!!!!!`)
      let res1 = perfTest.getMeasureResult(PerfMetric.DURATION)
      let res2 = perfTest.getMeasureResult(PerfMetric.CPU_LOAD)
      let res3 = perfTest.getMeasureResult(PerfMetric.CPU_USAGE)
      let res4 = perfTest.getMeasureResult(PerfMetric.MEMORY_RSS)
      let res5 = perfTest.getMeasureResult(PerfMetric.MEMORY_PSS)
      let res6 = perfTest.getMeasureResult(PerfMetric.LIST_SWIPE_FPS)
      perfTest.destroy()
      await stopApplication('com.perftestScene.acts')
      expect(res1.average).assertLargerOrEqual(0)
      expect(res2.average).assertLargerOrEqual(0)
      expect(res3.average).assertLargerOrEqual(0)
      expect(res4.average).assertLargerOrEqual(0)
      expect(res5.average).assertLargerOrEqual(0)
      expect(res6.average).assertLargerOrEqual(0)
      done()
    })

  })
}