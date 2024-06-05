/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, describe, expect, it } from '@ohos/hypium';
import backgroundTaskManager from '@ohos.resourceschedule.backgroundTaskManager';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import PermissionUtils from './PermissionUtils';
import { Driver, ON } from '@ohos.UiTest';
import { Permissions } from '@ohos.abilityAccessCtrl';
import audio from '@ohos.multimedia.audio';
import wantAgent from '@ohos.app.ability.wantAgent';
import fs from '@ohos.file.fs';
import AVSessionManager from '@ohos.multimedia.avsession';
import AbilityUtils from './AbilityUtils';

export default function performanceTest() {
  describe('PerformanceTest', () => {
    let abilityContext: common.UIAbilityContext

    beforeAll(async (done: Function) => {
      abilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext
      expect(await AbilityUtils.startAbility('com.acts.pcs.arktstest', 'TestAbility', abilityContext)).assertTrue()
      done()
    })
    /*
     * @tc.number: STD-PERFORMANCE-0100
     * @tc.name: testShorttermTask0100
     * @tc.desc: 【STD-PERFORMANCE-0100】为保障系统性能和能效，必须支持长时任务、短时任务管理机制
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testShorttermTask0100', 0, async (done: Function) => {
      let id: number
      let reason = 'pcs test'
      let defaultDelayTime = 180000
      try {
        let delayInfo = backgroundTaskManager.requestSuspendDelay(reason, () => {
          backgroundTaskManager.cancelSuspendDelay(id)
        })
        id = delayInfo.requestId
        let delayTime = delayInfo.actualDelayTime
        backgroundTaskManager.cancelSuspendDelay(id)
        expect(delayTime).assertEqual(defaultDelayTime)
      } catch (error) {
        let err = error as BusinessError
        console.error(`Request SuspendDelay Fail. Code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue()
      }
      done()
    })

    /*
     * @tc.number: STD-PERFORMANCE-0100
     * @tc.name: testLongtermTask0100
     * @tc.desc: 【STD-PERFORMANCE-0100】为保障系统性能和能效，必须支持长时任务、短时任务管理机制
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testLongtermTask0100', 0, async (done: Function) => {
      expect(await AbilityUtils.startAbility('com.acts.pcs.arktstest', 'TestAbility', abilityContext)).assertTrue()
      let driver = Driver.create()
      await driver.delayMs(1000)
      let audioRenderer = await getAudioRenderer()
      expect(audioRenderer != undefined).assertTrue()
      expect(await startAudio(audioRenderer, abilityContext)).assertTrue()
      await driver.delayMs(1000)
      expect(audioRenderer.state).assertEqual(audio.AudioState.STATE_RUNNING)
      await driver.delayMs(2000)
      let testAssistWantInfo: Want = {
        uri: 'http://assist.arkts.pcs.acts.com',
        type: "pcs/test"
      }
      expect(await AbilityUtils.startAbilityImplicitly(testAssistWantInfo, abilityContext)).assertTrue()
      await driver.delayMs(1000)
      let button = await driver.findComponent(ON.text('打开'))
      if(button != undefined) {
        await button.click()
        await driver.delayMs(2000)
      }
      expect(await AbilityUtils.startAbility('com.acts.pcs.arktstest', 'TestAbility', abilityContext)).assertTrue()
      expect(audioRenderer.state).assertEqual(audio.AudioState.STATE_RUNNING)
      expect(await stopAudio(audioRenderer, abilityContext)).assertTrue()
      await driver.delayMs(1000)
      expect(audioRenderer.state).assertEqual(audio.AudioState.STATE_RELEASED)
      await driver.delayMs(1000)
      done()
    })
  })
}

async function startAudio(audioRenderer: audio.AudioRenderer, abilityContext:common.UIAbilityContext) {
  let type: AVSessionManager.AVSessionType = 'audio';
  let session = await AVSessionManager.createAVSession(abilityContext,'AVSession', type);
  let wantAgentInfo: wantAgent.WantAgentInfo = {
    wants: [
      {
        bundleName: "com.acts.pcs.arktstest",
        abilityName: "TestAbility"
      } as Want
    ],
    requestCode: 0,
    operationType: wantAgent.OperationType.START_ABILITIES,
    wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
  }
  try {
    let wantAgentObj = await wantAgent.getWantAgent(wantAgentInfo)
    await backgroundTaskManager.startBackgroundRunning(abilityContext,
      backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK, wantAgentObj)
  } catch (error) {
    let err: BusinessError = error as BusinessError
    console.error(`Start BackgroundRunning Fail. Code: ${err.code}, message: ${err.message}`)
    return false
  }
  await audioRenderer.start()
  await session.activate()
  return true
}

async function stopAudio(audioRenderer: audio.AudioRenderer, abilityContext:common.UIAbilityContext) {
  audioRenderer.stop()
  audioRenderer.release()
  try {
    await backgroundTaskManager.stopBackgroundRunning(abilityContext)
  } catch (error) {
    let err: BusinessError = error as BusinessError
    console.error(`Stop BackgroundRunning Fail. Code: ${err.code}, message: ${err.message}`)
    return false
  }
  return true
}

async function getAudioRenderer() {
  let audioStreamInfo: audio.AudioStreamInfo = {
    samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
    channels: audio.AudioChannel.CHANNEL_2,
    sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
    encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
  }
  let audioRendererInfo: audio.AudioRendererInfo = {
    usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
    rendererFlags: 0
  }
  let audioRendererOptions: audio.AudioRendererOptions = {
    streamInfo: audioStreamInfo,
    rendererInfo: audioRendererInfo
  }
  let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions)

  let bufferSize: number = 0;
  class Options {
    offset?: number;
    length?: number;
  }
  let writeDataCallback = (buffer: ArrayBuffer) => {
    let path = '/data/storage/el2/base/haps/entry/files/'
    let filePath = path + '/Believer.wav';
    let file: fs.File = fs.openSync(filePath, fs.OpenMode.READ_ONLY);
    let options: Options = {
      offset: bufferSize,
      length: buffer.byteLength
    }
    fs.readSync(file.fd, buffer, options);
    bufferSize += buffer.byteLength;
  }
  audioRenderer.on('writeData', writeDataCallback);
  return audioRenderer
}