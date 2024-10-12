/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import { Driver, ON, MatchPattern } from '@ohos.UiTest'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import { abilityAccessCtrl, PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import myaudioNdk from "libentry.so"

const Tag = 'audio_ndk_test:'
const TEST_PASS = 0; // success result

function sleep(ms: number) {
  return new Promise<number>(resolve => setTimeout(resolve, ms));
}

let getPermission = () => {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let permissions: Array<Permissions> = ['ohos.permission.MICROPHONE'];
  atManager.requestPermissionsFromUser(getContext(), permissions).then((data: PermissionRequestResult) => {
    console.info('datassss:' + JSON.stringify(data))
    console.info('data permissions:' + data.permissions)
  }).catch((err: BusinessError) => {
    console.info('data:' + JSON.stringify(err))
  })
}

let driveFn = async () => {
  let dr = Driver.create();
  await sleep(1000);
  let power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
  await sleep(1000);
  await power?.click();
  await sleep(2000);
}

export default function audioNDK() {
  describe('audioNDKTest', () => {
    beforeAll(async () => {
      await getPermission();
      await sleep(100);
      await driveFn();
      await sleep(1000);
      console.info('beforeAll case');
    })

    beforeEach(() => {
      console.info('beforeEach case');
    })

    afterEach(() => {
      console.info('afterEach case');
    })

    afterAll(() => {
      console.info('afterAll case');
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CREATE_STREAM_BUILDER_0100
        * @tc.name      : create OH_AudioStreamBuilder with AUDIOSTREAM_TYPE_CAPTURER
        * @tc.desc      : test OH_AudioStreamBuilder with AUDIOSTREAM_TYPE_CAPTURER
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CREATE_STREAM_BUILDER_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.createAudioStreamBuilder();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CREATE_STREAM_BUILDER_0100 createAudioStreamBuilder: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GENERATE_CAPTURER_0100
        * @tc.name      : generate audioCapturer with OH_AudioStreamBuilder_GenerateCapturer
        * @tc.desc      : test OH_AudioStreamBuilder_GenerateCapturer
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GENERATE_CAPTURER_0100', 0, async (done: Function) => {
      let audioCaptureBuilder = myaudioNdk.audioCaptureGenerate();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GENERATE_CAPTURER_0100 audioCapture builder result: ${audioCaptureBuilder}`);
      expect(audioCaptureBuilder).assertEqual(0)
      done()
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GERNERTATE_CAPTURER_ERR_0100
        * @tc.name      : generate audioCapturer err
        * @tc.desc      : test OH_AudioStreamBuilder is not instantiated in OH_AudioStreamBuilder_GenerateCapturer
        * @tc.size      : MediumTest MediumTest
        * @tc.type      : Function
        * @tc.level     : Level3
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GERNERTATE_CAPTURER_ERR_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioCaptureGenerateErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GERNERTATE_CAPTURER_ERR_0100 audioCaptureGenerateErr: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(1)
      done()
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_START_0100
        * @tc.name      : start audioCapturer
        * @tc.desc      : test OH_AudioCapturer_Start
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_START_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioCaptureStart();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_START_0100 audioCaptureStart: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_START_ERR_0100
        * @tc.name      : start audioCapture twice
        * @tc.desc      : test OH_AudioCapturer_Start twice
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_START_ERR_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioCaptureStartErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_START_ERR_0100 audioCaptureStartErr: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(2)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_PAUSE_0100
       * @tc.name      : pause audioCapturer after start
       * @tc.desc      : test OH_AudioCapturer_Pause
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_PAUSE_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioCapturePause();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_PAUSE_0100 audioCapturePause: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_PAUSE_ERR_0100
       * @tc.name      : pause audioCapturer without start
       * @tc.desc      : test OH_AudioCapturer_Pause without OH_AudioCapturer_Start
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level3
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_PAUSE_ERR_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioCapturePauseErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_PAUSE_ERR_0100 audioCapturePauseErr: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(2)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_STOP_0100
       * @tc.name      : stop audioCapturer after start
       * @tc.desc      : test OH_AudioCapturer_Stop
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_STOP_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioCaptureStop();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_STOP_0100 audioCaptureStop: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_STOP_ERR_0100
       * @tc.name      : stop audioCapturer without start
       * @tc.desc      : test OH_AudioCapturer_Stop without start
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level3
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_STOP_ERR_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioCaptureStopErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_STOP_ERR_0100 audioCaptureStopErr: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(2)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_FLUSH_0100
       * @tc.name      : flush audioCapturer after start
       * @tc.desc      : test OH_AudioCapturer_Flush
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level1
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_FLUSH_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioCaptureFlush();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_FLUSH_0100 audioCaptureFlush: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_FLUSH_ERR_0100
       * @tc.name      : flush audioCapturer without start
       * @tc.desc      : test OH_AudioCapturer_Flush without start
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : FWK Layer
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_FLUSH_ERR_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioCaptureFlushErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_FLUSH_ERR_0100 audioCaptureFlushErr: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(2)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_RELEASE_0100
       * @tc.name      : release audioCapturer after start
       * @tc.desc      : test OH_AudioCapturer_Release
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_RELEASE_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioCaptureRelease();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_RELEASE_0100 audioCaptureRelease: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_RELEASE_ERR_0100
       * @tc.name      : release audioCapturer twice
       * @tc.desc      : test OH_AudioCapturer_Release twice
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level3
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_RELEASE_ERR_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioCaptureReleaseErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_RELEASE_ERR_0100 audioCaptureReleaseErr: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(1)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_PARAMETER_0100
       * @tc.name      : get latency mode after generate audioCaptuer
       * @tc.desc      : test OH_AudioCapturer_GetLatencyMode
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_PARAMETER_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioCaptureGetParameter();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_PARAMETER_0100 audioCaptureGetParameter: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CURRENT_STATE_0100
       * @tc.name      : get current state after generate audioCaptuer
       * @tc.desc      : test OH_AudioCapturer_GetCurrentState
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CURRENT_STATE_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioCaptureGetCurrentState();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CURRENT_STATE_0100 audioCaptureGetCurrentState: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_STREAM_ID_0100
       * @tc.name      : get streamId after generate audioCaptuer
       * @tc.desc      : test OH_AudioCapturer_GetStreamId
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_STREAM_ID_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioCaptureGetStreamId();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_STREAM_ID_0100 audioCaptureGetStreamId: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_SAMPLE_RATE_0100
       * @tc.name      : get sampleRate after generate audioCaptuer
       * @tc.desc      : test OH_AudioCapturer_GetSamplingRate
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_SAMPLE_RATE_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioCaptureGetSamplingRate();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_SAMPLE_RATE_0100 audioCaptureGetSamplingRate: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_SAMPLE_FORMAT_0100
       * @tc.name      : get sampleFormat after generate audioCaptuer
       * @tc.desc      : test OH_AudioCapturer_GetSampleFormat
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_SAMPLE_FORMAT_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioCaptureGetSampleFormat();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_SAMPLE_FORMAT_0100 audioCaptureGetSampleFormat: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_ENCODING_TYPE_0100
       * @tc.name      : get encodingType after generate audioCaptuer
       * @tc.desc      : test OH_AudioCapturer_GetEncodingType
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_ENCODING_TYPE_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioCaptureGetEncodingType();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_ENCODING_TYPE_0100 audioCaptureGetEncodingType: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CAPTURER_INFO_0100
       * @tc.name      : get capturerInfo after generate audioCaptuer
       * @tc.desc      : test OH_AudioCapturer_GetCapturerInfo
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CAPTURER_INFO_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioCaptureGetCapturerInfo();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CAPTURER_INFO_0100 audioCaptureGetCapturerInfo: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CHANNEL_COUNT_0100
           * @tc.name      : get channelCount after generate audioCaptuer
           * @tc.desc      : test OH_AudioCapturer_GetChannelCount
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CHANNEL_COUNT_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioCaptureGetChannelCount();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_CHANNEL_COUNT_0100 audioCaptureGetChannelCount: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_TINESTAMP_0100
       * @tc.name      : GetTimestamp after generate audioCaptuer
       * @tc.desc      : test OH_AudioCapturer_GetTimestamp
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_TINESTAMP_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioCaptureGetTimestamp();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_TINESTAMP_0100 audioCaptureGetTimestamp: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_FRAMEAREAD_0100
       * @tc.name      : get FramesRead after generate audioCaptuer
       * @tc.desc      : test OH_AudioCapturer_GetFramesRead
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_FRAMEAREAD_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioCaptureGetFramesRead();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_FRAMEAREAD_0100 audioCaptureGetFramesRead: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_FRAMESIZEINCALLBACK_0100
       * @tc.name      : get FrameSizeInCallback after generate audioCaptuer
       * @tc.desc      : test OH_AudioCapturer_GetFrameSizeInCallback
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_FRAMESIZEINCALLBACK_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioCaptureGetFrameSizeInCallback();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_CAPTURER_GET_FRAMESIZEINCALLBACK_0100 audioCaptureGetFrameSizeInCallback: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })

    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_SET_SPEED_0100
       * @tc.name      : SetSpeed with OH_AudioStreamBuilder_GenerateRenderer
       * @tc.desc      : test OH_AudioRenderer_SetSpeed
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_SET_SPEED_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetSpeed();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_SET_SPEED_0100 audioRendererSetSpeed: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })

    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GET_SPEED_0100
       * @tc.name      : GetSpeed with OH_AudioStreamBuilder_GenerateRenderer
       * @tc.desc      : test OH_AudioRenderer_GetSpeed
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GET_SPEED_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererGetSpeed();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GET_SPEED_0100 audioRendererGetSpeed: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })

    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_SET_GET_SPEED_0100
       * @tc.name      : SetSpeed&GetSpeed with OH_AudioStreamBuilder_GenerateRenderer
       * @tc.desc      : test OH_AudioRenderer_GetSpeed
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_SET_GET_SPEED_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetGetSpeed();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_SET_GET_SPEED_0100 audioRendererSetGetSpeed: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(1.5)
      done()
    })

    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_SET_RENDERER_OUTPUTDEVICECHANGE_0100
       * @tc.name      : SetRendererOutputDeviceChangeCallback with OH_AudioStreamBuilder_GenerateRenderer
       * @tc.desc      : test OH_AudioStreamBuilder_SetRendererOutputDeviceChangeCallback
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_SET_RENDERER_OUTPUTDEVICECHANGE_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioSetRendererOutputDeviceChangeCallback();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_SET_RENDERER_OUTPUTDEVICECHANGE_0100 audioCaptureGetCapturerInfo: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })

    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GETFRAMESWRITTEN_0100
       * @tc.name      : GetFramesWritten with OH_AudioRenderer_GetFramesWritten
       * @tc.desc      : test OH_AudioRenderer_GetFramesWritten
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GETFRAMESWRITTEN_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRenderGetFramesWritten();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GETFRAMESWRITTEN_0100 audioRenderGetFramesWritten: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GETTIMESTAMP_0100
       * @tc.name      : GetTimestamp with OH_AudioRenderer_GetTimestamp
       * @tc.desc      : test OH_AudioRenderer_GetFramesWritten
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GETTIMESTAMP_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRenderGetTimestamp();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GETTIMESTAMP_0100 audioRenderGetTimestamp: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GETFRAMESIZEINCALLBACK_0100
       * @tc.name      : GetFrameSizeInCallback with OH_AudioRenderer_GetFrameSizeInCallback
       * @tc.desc      : test OH_AudioRenderer_GetFramesWritten
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GETFRAMESIZEINCALLBACK_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRenderGetFrameSizeInCallback();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GETFRAMESIZEINCALLBACK_0100 audioRenderGetFrameSizeInCallback: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GENERATE_RENDERER_0100
       * @tc.name      : generate audioRenderer with OH_AudioStreamBuilder_GenerateRenderer
       * @tc.desc      : test OH_AudioStreamBuilder_GenerateRenderer
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GENERATE_RENDERER_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRenderGenerate();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GENERATE_RENDERER_0100 audioCaptureGetCapturerInfo: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_GENERATE_RENDERER_ERR_0100
       * @tc.name      : generate audioRenderer err
       * @tc.desc      : test OH_AudioStreamBuilder is not instantiated in OH_AudioStreamBuilder_GenerateRenderer
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level3
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_GENERATE_RENDERER_ERR_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRenderGenerateErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_GENERATE_RENDERER_ERR_0100 audioRenderGenerateErr: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(1)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_START_0100
       * @tc.name      : start audioRenderer
       * @tc.desc      : test OH_AudioRenderer_Start
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_START_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRenderStart();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_START_0100 audioRenderStart: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_START_ERR_0100
       * @tc.name      : start audioRenderer after start
       * @tc.desc      : test OH_AudioRenderer_Start twice
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level3
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_START_ERR_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRenderStartErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_START_ERR_0100 audioRenderStartErr: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(2)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_PAUSE_0100
       * @tc.name      : pause audioRenderer after start
       * @tc.desc      : test OH_AudioRenderer_Pause
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_PAUSE_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRenderPause();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_PAUSE_0100 audioRenderPause: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_PAUSE_ERR_0100
       * @tc.name      : pause audioRenderer without start
       * @tc.desc      : test OH_AudioRenderer_Pause without start
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level3
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_PAUSE_ERR_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRenderPauseErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_PAUSE_ERR_0100 audioRenderPauseErr: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(2)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_STOP_0100
       * @tc.name      : stop audioRenderer after start
       * @tc.desc      : test OH_AudioRenderer_Stop
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_STOP_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRenderStop();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_STOP_0100 audioRenderStop: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_STOP_ERR_0100
       * @tc.name      : stop audioRenderer without start
       * @tc.desc      : test OH_AudioRenderer_Stop without start
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level3
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_STOP_ERR_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRenderStopErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_STOP_ERR_0100 audioRenderStopErr: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(2)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_FLUSH_0100
       * @tc.name      : flush audioRenderer after start
       * @tc.desc      : test OH_AudioRenderer_Flush
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_FLUSH_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRenderFlush();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_FLUSH_0100 audioRenderFlush: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_FLUSH_ERR_0100
       * @tc.name      : flush audioRenderer without start
       * @tc.desc      : test OH_AudioRenderer_Flush without start
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level3
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_FLUSH_ERR_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRenderFlushErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_FLUSH_ERR_0100 audioRenderFlushErr: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(2)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_RELEASE_0100
       * @tc.name      : release audioRenderer after start
       * @tc.desc      : test OH_AudioRenderer_Release
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level0
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_RELEASE_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRenderRelease();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_RELEASE_0100 audioRenderRelease: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_RELEASE_ERR_0100
       * @tc.name      : release audioRenderer twice
       * @tc.desc      : test OH_AudioRenderer_Release twice
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level3
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_RELEASE_ERR_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRenderReleaseErr();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_RELEASE_ERR_0100 audioRenderReleaseErr: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(1)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_CURRENT_STATE_0100
       * @tc.name      : get current state after generate audioRenderer
       * @tc.desc      : test OH_AudioRenderer_GetCurrentState
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_CURRENT_STATE_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRenderGetCurrentState();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_CURRENT_STATE_0100 audioRenderGetCurrentState: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_PARAMETER_0100
       * @tc.name      : get latencyMode after generate audioRenderer
       * @tc.desc      : test OH_AudioRenderer_GetLatencyMode
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_PARAMETER_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRenderGetParameter();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_PARAMETER_0100 audioRenderGetParameter: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_STREAM_ID_0100
       * @tc.name      : get streamId after generate audioRenderer
       * @tc.desc      : test OH_AudioRenderer_GetStreamId
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_STREAM_ID_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRenderGetStreamId();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_STREAM_ID_0100 audioRenderGetStreamId: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_SAMPLING_RATE_0100
       * @tc.name      : get samplingRate after generate audioRenderer
       * @tc.desc      : test OH_AudioRenderer_GetSamplingRate
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_SAMPLING_RATE_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRenderGetSamplingRate();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_SAMPLING_RATE_0100 audioRenderGetSamplingRate: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_SAMPLE_FORMAT_0100
       * @tc.name      : get sampleFormat after generate audioRenderer
       * @tc.desc      : test OH_AudioRenderer_GetSampleFormat
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_SAMPLE_FORMAT_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRenderGetSampleFormat();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_SAMPLE_FORMAT_0100 audioRenderGetSampleFormat: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_ENCODING_TYPE_0100
       * @tc.name      : get encodingType after generate audioRenderer
       * @tc.desc      : test OH_AudioRenderer_GetEncodingType
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_ENCODING_TYPE_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRenderGetEncodingType();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_ENCODING_TYPE_0100 audioRenderGetEncodingType: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_RENDERER_INFO_0100
       * @tc.name      : get RendererInfo after generate audioRenderer
       * @tc.desc      : test OH_AudioRenderer_GetRendererInfo
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_RENDERER_INFO_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRenderGetRendererInfo();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_RENDERER_INFO_0100 audioRenderGetRendererInfo: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_CHANNEL_COUNT_0100
           * @tc.name      : get ChannelCount after generate audioRenderer
           * @tc.desc      : test OH_AudioRenderer_GetChannelCount
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level2
       */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_CHANNEL_COUNT_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRenderGetChannelCount();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GET_CHANNEL_COUNT_0100 audioRenderGetChannelCount: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_SAPMLING_RATE_0100
       * @tc.name      : set sampleRate 48000 after create audioStreamBuilder
       * @tc.desc      : test OH_AudioStreamBuilder_SetSamplingRate
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_SAPMLING_RATE_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioStreamBuilderSetSamplingRate();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_SAPMLING_RATE_0100 audioStreamBuilderSetSamplingRate: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CHANNEL_COUNT_0100
       * @tc.name      : set channelCount 1 after create audioStreamBuilder
       * @tc.desc      : test OH_AudioStreamBuilder_SetChannelCount
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CHANNEL_COUNT_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioStreamBuilderSetChannelCount();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CHANNEL_COUNT_0100 audioStreamBuilderSetChannelCount: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_SAMPLE_FORMAT_0100
       * @tc.name      : set sampleFormat AUDIOSTREAM_SAMPLE_U8 after create audioStreamBuilder
       * @tc.desc      : test OH_AudioStreamBuilder_SetSampleFormat
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_SAMPLE_FORMAT_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioStreamBuilderSetSampleFormat();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_SAMPLE_FORMAT_0100 audioStreamBuilderSetSampleFormat: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_ENCODING_TYPE_0100
       * @tc.name      : set encodingType AUDIOSTREAM_ENCODING_TYPE_RAW after create audioStreamBuilder
       * @tc.desc      : test OH_AudioStreamBuilder_SetEncodingType
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_ENCODING_TYPE_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioStreamBuilderSetEncodingType();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_ENCODING_TYPE_0100 audioStreamBuilderSetEncodingType: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_LATENCY_MODE_0100
       * @tc.name      : set latencyMode AUDIOSTREAM_LATENCY_MODE_NORMAL streamUsage after create audioStreamBuilder
       * @tc.desc      : test OH_AudioStreamBuilder_SetLatencyMode
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_LATENCY_MODE_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioStreamBuilderSetLatencyMode();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_LATENCY_MODE_0100 audioStreamBuilderSetLatencyMode: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_INFO_0100
       * @tc.name      : set captureInfo AUDIOSTREAM_USAGE_MUSIC after create audioStreamBuilder
       * @tc.desc      : test OH_AudioStreamBuilder_SetRendererInfo
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_INFO_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioStreamBuilderSetRendererInfo();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_INFO_0100 audioStreamBuilderSetRendererInfo: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CAPTURER_INFO_0100
       * @tc.name      : set captureInfo AUDIOSTREAM_SOURCE_TYPE_MIC after create audioStreamBuilder
       * @tc.desc      : test OH_AudioStreamBuilder_SetCapturerInfo
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CAPTURER_INFO_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioStreamBuilderSetCapturerInfo();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CAPTURER_INFO_0100 audioStreamBuilderSetCapturerInfo: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_CALLBACK_0100
       * @tc.name      : set rendererCallback after create audioStreamBuilder
       * @tc.desc      : test OH_AudioStreamBuilder_SetRendererCallback
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_CALLBACK_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioStreamBuilderSetRendererCallback();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_CALLBACK_0100 audioStreamBuilderSetRendererCallback: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CAPTURER_CALLBACK_0100
       * @tc.name      : set captureCallback after create audioStreamBuilder
       * @tc.desc      : test OH_AudioStreamBuilder_SetCapturerCallback
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CAPTURER_CALLBACK_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioStreamBuilderSetCapturerCallback();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_CAPTURER_CALLBACK_0100 audioStreamBuilderSetCapturerCallback: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })


    /* *
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_FRAME_SIZE_IN_CALLBACK_0100
       * @tc.name      : set framesize in callback after create audioStreamBuilder
       * @tc.desc      : test OH_AudioStreamBuilder_SetFrameSizeInCallback
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level2
   */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_FRAME_SIZE_IN_CALLBACK_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioStreamBuilderSetFrameSizeInCallback();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_FRAME_SIZE_IN_CALLBACK_0100 audioStreamBuilderSetFrameSizeInCallback: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GETVOLUME_0100
     * @tc.name      : getVolume with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : test OH_AudioRenderer_GetVolume
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GETVOLUME_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererGetVolume_01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_GETVOLUME_0100 audioRendererGetVolume: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0100
     * @tc.name      : Test SetVolume With AudioStreamTypeRenderer
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetVolume_01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0100 audioRendererSetVolume: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0200
     * @tc.name      : Test SetVolume With AudioStreamTypeRenderer
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0200', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetVolume_02();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0200 audioRendererSetVolume: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0300
     * @tc.name      : Test SetVolume With AudioStreamTypeRenderer
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0300', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetVolume_03();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0300 audioRendererSetVolume: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0400
     * @tc.name      : Test SetVolume With AudioStreamTypeRenderer
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0400', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetVolume_04();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0400 audioRendererSetVolume fail: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0500
     * @tc.name      : Test SetVolume With AudioStreamTypeRenderer
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0500', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetVolume_05();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0500 audioRendererSetVolume fail: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0600
     * @tc.name      : Test SetVolume With AudioStreamTypeRenderer
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0600', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetVolume_06();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUME_0600 audioRendererSetVolume fail: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0100
     * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.WithRamp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetVolumeWithRamp_01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0100 audioRendererSetVolumeWithRamp: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0200
     * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.WithRamp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0200', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetVolumeWithRamp_02();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0200 audioRendererSetVolumeWithRamp: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0300
     * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.WithRamp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0300', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetVolumeWithRamp_03();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0300 audioRendererSetVolumeWithRamp: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0400
     * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.WithRamp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0400', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetVolumeWithRamp_04();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0400 audioRendererSetVolumeWithRamp: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0500
     * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.WithRamp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0500', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetVolumeWithRamp_05();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0500 audioRendererSetVolumeWithRamp: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0600
     * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.WithRamp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0600', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetVolumeWithRamp_06();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0600 audioRendererSetVolumeWithRamp: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0700
     * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.WithRamp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0700', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetVolumeWithRamp_07();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0700 audioRendererSetVolumeWithRamp fail: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0800
     * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.WithRamp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0800', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetVolumeWithRamp_08();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0800 audioRendererSetVolumeWithRamp fail: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0900
     * @tc.name      : setVolumeWithRamp with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : Validates the functionality of OH_AudioRenderer_SetVolume with AUDIOSTREAM_TYPE_RENDERER.WithRamp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0900', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetVolumeWithRamp_09();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETVOLUMEWITHRAMP_0900 audioRendererSetVolumeWithRamp fail: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /*
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0100
        * @tc.name      : set markPosition with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetMarkPosition
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetOnMarkReached_01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0100 audioRendererSetOnMarkReached: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /*
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0200
        * @tc.name      : set markPosition with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetMarkPosition
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0200', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetOnMarkReached_02();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0200 audioRendererSetOnMarkReached: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /*
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0300
        * @tc.name      : set markPosition with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetMarkPosition
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0300', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetOnMarkReached_03();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0300 audioRendererSetOnMarkReached: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /*
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0400
        * @tc.name      : set markPosition with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetMarkPosition
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0400', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetOnMarkReached_04();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0400 audioRendererSetOnMarkReached: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /*
            * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0500
            * @tc.name      : set markPosition with AUDIOSTREAM_TYPE_RENDERER
            * @tc.desc      : test OH_AudioRenderer_SetMarkPosition
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level0
        */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0500', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetOnMarkReached_05();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0500 audioRendererSetOnMarkReached: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /*
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0700
        * @tc.name      : set markPosition with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetMarkPosition
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0700', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetOnMarkReached_07();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0700 audioRendererSetOnMarkReached: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /*
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0800
        * @tc.name      : set markPosition with AUDIOSTREAM_TYPE_RENDERER
        * @tc.desc      : test OH_AudioRenderer_SetMarkPosition
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0800', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetOnMarkReached_08();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETONMARKREACHED_0800 audioRendererSetOnMarkReached: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0100
     * @tc.name      : cancel mark with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : test OH_AudioRenderer_CancelMark
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererCancelMark_01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0100 audioRendererCancelMark: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0200
     * @tc.name      : cancel mark with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : test OH_AudioRenderer_CancelMark
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0200', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererCancelMark_02();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0200 audioRendererCancelMark: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0300
     * @tc.name      : cancel mark with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : test OH_AudioRenderer_CancelMark
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0300', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererCancelMark_03();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_MARKCANCAL_0300 audioRendererCancelMark: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0100
     * @tc.name      : set interruptMode with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : test OH_AudioRenderer_SetInterruptMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0100', 0, async (done: Function) => {
      let audioSetInterruptMode = myaudioNdk.audioRendererSetInterruptMode_01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0100 audioRendererSetInterruptMode: ${audioSetInterruptMode}`);
      expect(audioSetInterruptMode).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0200
     * @tc.name      : set interruptMode with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : test OH_AudioRenderer_SetInterruptMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0200', 0, async (done: Function) => {
      let audioSetInterruptMode = myaudioNdk.audioRendererSetInterruptMode_02();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0200 audioRendererSetInterruptMode: ${audioSetInterruptMode}`);
      expect(audioSetInterruptMode).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0300
     * @tc.name      : set interruptMode with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : test OH_AudioRenderer_SetInterruptMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0300', 0, async (done: Function) => {
      let audioSetInterruptMode = myaudioNdk.audioRendererSetInterruptMode_03();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0300 audioRendererSetInterruptMode: ${audioSetInterruptMode}`);
      expect(audioSetInterruptMode).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0400
     * @tc.name      : set interruptMode with AUDIOSTREAM_TYPE_RENDERER
     * @tc.desc      : test OH_AudioRenderer_SetInterruptMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0400', 0, async (done: Function) => {
      let audioSetInterruptMode = myaudioNdk.audioRendererSetInterruptMode_04();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_RENDERER_SETINTERRUPTMODE_0400 audioRendererSetInterruptMode: ${audioSetInterruptMode}`);
      expect(audioSetInterruptMode).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOROUTINGMANAGER_0100
     * @tc.name      : get audioRoutingManager
     * @tc.desc      : test OH_AudioManager_GetAudioRoutingManager
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOROUTINGMANAGER_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioManagerGetAudioRoutingManager_01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOROUTINGMANAGER_0100 audioManagerGetAudioRoutingManager: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0100
     * @tc.name      : get none devices after get audioRoutingManager
     * @tc.desc      : test OH_AudioRoutingManager_GetDevices
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0100', 0, async (done: Function) => {
      let audioRoutingManagerDevice = myaudioNdk.audioRoutingManagerGetDevices_01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0100 audioRoutingManagerDevices result: ${audioRoutingManagerDevice}`);
      expect(audioRoutingManagerDevice).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0200
     * @tc.name      : get output devices after get audioRoutingManager
     * @tc.desc      : test OH_AudioRoutingManager_GetDevices
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0200', 0, async (done: Function) => {
      let audioRoutingManagerDevice = myaudioNdk.audioRoutingManagerGetDevices_02();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0200 audioRoutingManagerDevice result: ${audioRoutingManagerDevice}`);
      expect(audioRoutingManagerDevice).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0300
     * @tc.name      : get input devices after get audioRoutingManager
     * @tc.desc      : test OH_AudioRoutingManager_GetDevices
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0300', 0, async (done: Function) => {
      let audioRoutingManagerDevice = myaudioNdk.audioRoutingManagerGetDevices_03();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0300 audioRoutingManagerDevice result: ${audioRoutingManagerDevice}`);
      expect(audioRoutingManagerDevice).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0400
     * @tc.name      : get all devices after get audioRoutingManager
     * @tc.desc      : test OH_AudioRoutingManager_GetDevices
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0400', 0, async (done: Function) => {
      let audioRoutingManagerDevice = myaudioNdk.audioRoutingManagerGetDevices_04();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0400 audioRoutingManagerDevice result: ${audioRoutingManagerDevice}`);
      expect(audioRoutingManagerDevice).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0500
     * @tc.name      : get devices with invaild flag
     * @tc.desc      : test OH_AudioRoutingManager_GetDevices
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0500', 0, async (done: Function) => {
      let audioRoutingManagerDevice = myaudioNdk.audioRoutingManagerGetDevices_05();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0500 audioRoutingManagerDevice result: ${audioRoutingManagerDevice}`);
      expect(audioRoutingManagerDevice).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0600
     * @tc.name      : get devices without get audioRoutingManager
     * @tc.desc      : test OH_AudioRoutingManager_GetDevices
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0600', 0, async (done: Function) => {
      let audioRoutingManagerDevice = myaudioNdk.audioRoutingManagerGetDevices_06();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0600 audioRoutingManagerDevice result: ${audioRoutingManagerDevice}`);
      expect(audioRoutingManagerDevice).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0700
     * @tc.name      : get devices without get audioRoutingManager
     * @tc.desc      : test OH_AudioRoutingManager_GetDevices
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0700', 0, async (done: Function) => {
      let audioRoutingManagerDevice = myaudioNdk.audioRoutingManagerGetDevices_07();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETDEVICES_0700 audioRoutingManagerDevice result: ${audioRoutingManagerDevice}`);
      expect(audioRoutingManagerDevice).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETMANAGER_0001
     * @tc.name      : Obtain AudioManager with null pointer
     * @tc.desc      : Test OH_GetAudioManager function
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETMANAGER_0001', 0, async (done: Function) => {
      let audioManager = myaudioNdk.audioManagerGetManager_01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETMANAGER_0001 audioManager result: ${audioManager}`);
      expect(audioManager).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETMANAGER_0002
     * @tc.name      : get AudioManager
     * @tc.desc      : Test OH_GetAudioManager function
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETMANAGER_0002', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioManagerGetManager_02();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETMANAGER_0002 audioManagerGetManager_02: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOSCENE_0001
     * @tc.name      : get AudioScene
     * @tc.desc      : test OH_GetAudioScene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOSCENE_0001', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioManagerGetAudioScene_01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOSCENE_0001 audioManagerGetAudioScene_01: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOSCENE_0002
     * @tc.name      : get AudioScene with invalid param
     * @tc.desc      : test OH_GetAudioScene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOSCENE_0002', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioManagerGetAudioScene_02();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_MANAGER_GETAUDIOSCENE_0002 audioManagerGetAudioScene_02: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETAVAILABLEDEVICE_0001
     * @tc.name      : get available device
     * @tc.desc      : test OH_AudioRoutingManager_GetAvailableDevices
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETAVAILABLEDEVICE_0001', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRoutingManagerGetAvailableDevices001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETAVAILABLEDEVICE_0001 audioRoutingManagerGetAvailableDevices001: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETPREFERREDOUTPUTDEVICE_0001
     * @tc.name      : GetPreferredOutputDevice
     * @tc.desc      : test OH_AudioRoutingManager_GetPreferredOutputDevice
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETPREFERREDOUTPUTDEVICE_0001', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRoutingManagerGetPreferredOutputDevice001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETPREFERREDOUTPUTDEVICE_0001 audioRoutingManagerGetPreferredOutputDevice001: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETPREFERREDINPUTDEVICE_0001
     * @tc.name      : GetPreferredInputDevice
     * @tc.desc      : test OH_AudioRoutingManager_GetPreferredInputDevice
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETPREFERREDINPUTDEVICE_0001', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRoutingManagerGetPreferredInputDevice001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETPREFERREDINPUTDEVICE_0001 audioRoutingManagerGetPreferredInputDevice001: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SET_MIC_BLOCK_STATUS_CALLBACK_0100
     * @tc.name      : setMicBlockStatusCallback with callback
     * @tc.desc      : test OH_AudioRoutingManager_SetMicBlockStatusCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SET_MIC_BLOCK_STATUS_CALLBACK_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRoutingManagerSetMicBlockStatusCallback_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SET_MIC_BLOCK_STATUS_CALLBACK_0100 audioRoutingManagerSetMicBlockStatusCallback: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SET_MIC_BLOCK_STATUS_CALLBACK_0200
     * @tc.name      : setMicBlockStatusCallback with none callback
     * @tc.desc      : test OH_AudioRoutingManager_SetMicBlockStatusCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SET_MIC_BLOCK_STATUS_CALLBACK_0200', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRoutingManagerSetMicBlockStatusCallback_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SET_MIC_BLOCK_STATUS_CALLBACK_0200 audioRoutingManagerSetMicBlockStatusCallback: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SET_MIC_BLOCK_STATUS_CALLBACK_0300
     * @tc.name      : setMicBlockStatusCallback with callback and none callback
     * @tc.desc      : test OH_AudioRoutingManager_SetMicBlockStatusCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SET_MIC_BLOCK_STATUS_CALLBACK_0300', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRoutingManagerSetMicBlockStatusCallback_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_SET_MIC_BLOCK_STATUS_CALLBACK_0300 audioRoutingManagerSetMicBlockStatusCallback: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0100
     * @tc.name      : registerDeviceChangeCallback with none device flag
     * @tc.desc      : test OH_AudioRoutingManager_RegisterDeviceChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRoutingManagerRegisterDeviceChangeCallback_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0100 audioRoutingManagerRegisterDeviceChangeCallback: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0200
     * @tc.name      : registerDeviceChangeCallback with output device flag
     * @tc.desc      : test OH_AudioRoutingManager_RegisterDeviceChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0200', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRoutingManagerRegisterDeviceChangeCallback_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0200 audioRoutingManagerRegisterDeviceChangeCallback: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0300
     * @tc.name      : registerDeviceChangeCallback with input device flag
     * @tc.desc      : test OH_AudioRoutingManager_RegisterDeviceChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0300', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRoutingManagerRegisterDeviceChangeCallback_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0300 audioRoutingManagerRegisterDeviceChangeCallback: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0400
     * @tc.name      : registerDeviceChangeCallback with all device flag
     * @tc.desc      : test OH_AudioRoutingManager_RegisterDeviceChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0400', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRoutingManagerRegisterDeviceChangeCallback_004();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0400 audioRoutingManagerRegisterDeviceChangeCallback: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0500
     * @tc.name      : registerDeviceChangeCallback without get audioRoutingManager
     * @tc.desc      : test OH_AudioRoutingManager_RegisterDeviceChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0500', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRoutingManagerRegisterDeviceChangeCallback_005();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0500 audioRoutingManagerRegisterDeviceChangeCallback: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0600
     * @tc.name      : registerDeviceChangeCallback with nullptr callback
     * @tc.desc      : test OH_AudioRoutingManager_RegisterDeviceChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0600', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRoutingManagerRegisterDeviceChangeCallback_006();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0600 audioRoutingManagerRegisterDeviceChangeCallback: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0700
     * @tc.name      : registerDeviceChangeCallback with nullptr callback
     * @tc.desc      : test OH_AudioRoutingManager_RegisterDeviceChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0700', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRoutingManagerRegisterDeviceChangeCallback_007();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0700 audioRoutingManagerRegisterDeviceChangeCallback: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0800
     * @tc.name      : registerDeviceChangeCallback with nullptr callback
     * @tc.desc      : test OH_AudioRoutingManager_RegisterDeviceChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0800', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRoutingManagerRegisterDeviceChangeCallback_008();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_REGISTERDEVICECHANGECALLBACK_0800 audioRoutingManagerRegisterDeviceChangeCallback: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0100
     * @tc.name      : unRegisterDeviceChangeCallback without register callback
     * @tc.desc      : test OH_AudioRoutingManager_UnRegisterDeviceChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRoutingManagerUnregisterDeviceChangeCallback_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0100 audioRoutingManagerUnRegisterDeviceChangeCallback: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0200
     * @tc.name      : unRegisterDeviceChangeCallback without get audioRoutingManager
     * @tc.desc      : test OH_AudioRoutingManager_UnRegisterDeviceChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0200', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRoutingManagerUnregisterDeviceChangeCallback_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0200 audioRoutingManagerUnRegisterDeviceChangeCallback: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0300
     * @tc.name      : unRegisterDeviceChangeCallback with nullptr callback
     * @tc.desc      : test OH_AudioRoutingManager_UnRegisterDeviceChangeCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0300', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRoutingManagerUnregisterDeviceChangeCallback_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_UNREGISTERDEVICECHANGECALLBACK_0300 audioRoutingManagerUnRegisterDeviceChangeCallback: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_RELEASEDEVICES_0100
     * @tc.name      : release devices without get audioRoutingManager
     * @tc.desc      : test OH_AudioRoutingManager_ReleaseDevices
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_RELEASEDEVICES_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRoutingManagerReleaseDevices_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_RELEASEDEVICES_0100 audioRoutingManagerReleaseDevices: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_RELEASEDEVICES_0200
     * @tc.name      : release devices with nullptr devices
     * @tc.desc      : test OH_AudioRoutingManager_ReleaseDevices
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_RELEASEDEVICES_0200', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRoutingManagerReleaseDevices_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_RELEASEDEVICES_0200 audioRoutingManagerReleaseDevices: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0100
     * @tc.name      : get deviceType with all devices
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0100', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceType_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0100 audioAudioDeviceDescriptorGetDeviceType: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0200
     * @tc.name      : get deviceType with nullptr devicetype
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0200', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceType_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0200 audioAudioDeviceDescriptorGetDeviceType: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0300
     * @tc.name      : get deviceType with nullptr descriptor
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0300', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceType_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICETYPE_0300 audioAudioDeviceDescriptorGetDeviceType: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0100
     * @tc.name      : get deviceRole with all devices
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceRole
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0100', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceRole_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0100 audioAudioDeviceDescriptorGetDeviceRole: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0200
     * @tc.name      : get deviceRole with nullptr deviceRole
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceRole
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0200', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceRole_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0200 audioAudioDeviceDescriptorGetDeviceRole: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0300
     * @tc.name      : get deviceRole with nullptr descriptor
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceRole
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0300', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceRole_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEROLE_0300 audioAudioDeviceDescriptorGetDeviceRole: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0100
     * @tc.name      : get deviceId with all devices
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceId
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0100', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceId_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0100 audioAudioDeviceDescriptorGetDeviceId: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0200
     * @tc.name      : get deviceId with nullptr deviceId
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceId
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0200', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceId_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0200 audioAudioDeviceDescriptorGetDeviceId: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0300
     * @tc.name      : get deviceId with nullptr descriptor
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceId
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0300', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceId_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEID_0300 audioAudioDeviceDescriptorGetDeviceId: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0100
     * @tc.name      : get deviceName with all devices
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceName
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0100', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceName_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0100 audioAudioDeviceDescriptorGetDeviceName: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0200
     * @tc.name      : get deviceName with nullptr deviceName
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceName
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0200', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceName_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0200 audioAudioDeviceDescriptorGetDeviceName: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0300
     * @tc.name      : get deviceName with nullptr descriptor
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceName
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0300', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceName_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICENAME_0300 audioAudioDeviceDescriptorGetDeviceName: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0100
     * @tc.name      : get deviceAddress with all devices
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceAddress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0100', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceAddress_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0100 audioAudioDeviceDescriptorGetDeviceAddress: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0200
     * @tc.name      : get deviceAddress with nullptr deviceAddress
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceAddress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0200', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceAddress_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0200 audioAudioDeviceDescriptorGetDeviceAddress: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0300
     * @tc.name      : get deviceAddress with nullptr descriptor
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceAddress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0300', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceAddress_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEADDRESS_0300 audioAudioDeviceDescriptorGetDeviceAddress: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0100
     * @tc.name      : get deviceSampleRates with all devices
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceSampleRates
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0100', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceSampleRates_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0100 audioAudioDeviceDescriptorGetDeviceSampleRates: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0200
     * @tc.name      : get deviceSampleRates with nullptr deviceSampleRates
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceSampleRates
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0200', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceSampleRates_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0200 audioAudioDeviceDescriptorGetDeviceSampleRates: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0300
     * @tc.name      : get deviceSampleRates with nullptr size
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceSampleRates
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0300', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceSampleRates_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0300 audioAudioDeviceDescriptorGetDeviceSampleRates: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0400
     * @tc.name      : get deviceSampleRates with nullptr descriptor
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceSampleRates
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0400', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceSampleRates_004();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICESAMPLERATES_0400 audioAudioDeviceDescriptorGetDeviceSampleRates: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0100
     * @tc.name      : get deviceChannelCounts with all devices
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceChannelCounts
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0100', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceChannelCounts_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0100 audioAudioDeviceDescriptorGetDeviceChannelCounts: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0200
     * @tc.name      : get deviceChannelCounts with nullptr channelCounts
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceChannelCounts
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0200', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceChannelCounts_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0200 audioAudioDeviceDescriptorGetDeviceChannelCounts: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0300
     * @tc.name      : get deviceChannelCounts with nullptr channelSize
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceChannelCounts
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0300', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceChannelCounts_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0300 audioAudioDeviceDescriptorGetDeviceChannelCounts: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0400
     * @tc.name      : get deviceChannelCounts with nullptr descriptor
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceChannelCounts
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0400', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceChannelCounts_004();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICECHANNELCOUNTS_0400 audioAudioDeviceDescriptorGetDeviceChannelCounts: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0100
     * @tc.name      : get deviceDisplayName with all devices
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceDisplayName
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0100', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceDisplayName_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0100 audioAudioDeviceDescriptorGetDeviceDisplayName: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0200
     * @tc.name      : get deviceDisplayName with nullptr displayName
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceDisplayName
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0200', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceDisplayName_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0200 audioAudioDeviceDescriptorGetDeviceDisplayName: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0300
     * @tc.name      : get deviceDisplayName with nullptr descriptor
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceDisplayName
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0300', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceDisplayName_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEDISPLAYNAME_0300 audioAudioDeviceDescriptorGetDeviceDisplayName: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0100
     * @tc.name      : get deviceEncodingTypes with all devices
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceEncodingTypes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0100', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceEncodingTypes_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0100 audioAudioDeviceDescriptorGetDeviceEncodingTypes: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0200
     * @tc.name      : get deviceEncodingTypes with nullptr encodingTypes
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceEncodingTypes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0200', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceEncodingTypes_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0200 audioAudioDeviceDescriptorGetDeviceEncodingTypes: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0300
     * @tc.name      : get deviceEncodingTypes with nullptr encodingTypeSize
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceEncodingTypes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0300', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceEncodingTypes_003();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0300 audioAudioDeviceDescriptorGetDeviceEncodingTypes: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0400
     * @tc.name      : get deviceEncodingTypes with nullptr descriptor
     * @tc.desc      : test OH_AudioDeviceDescriptor_GetDeviceEncodingTypes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0400', 0, async (done: Function) => {
      let audioDeviceBuilder = myaudioNdk.audioAudioDeviceDescriptorGetDeviceEncodingTypes_004();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_ROUTING_MANAGER_GETDEVICEENCODINGTYPES_0400 audioAudioDeviceDescriptorGetDeviceEncodingTypes: ${audioDeviceBuilder}`);
      expect(audioDeviceBuilder).assertEqual(TEST_PASS)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0003
     * @tc.name      : Set Renderer Privacy with Internal Recording
     * @tc.desc      : test Renderer Privacy with Internal Recording
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0003', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioAudioInternalRecordingSuccess01();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0003 audioAudioInternalRecordingSuccess: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0004
     * @tc.name      : Set Renderer Privacy with Internal Recording
     * @tc.desc      : test Renderer Privacy with Internal Recording
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0004', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioAudioInternalRecordingSuccess02();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0004 audioAudioInternalRecordingSuccess: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0005
     * @tc.name      : Set Renderer Privacy with Internal Recording
     * @tc.desc      : test Renderer Privacy with Internal Recording
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0005', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioAudioInternalRecordingFalse();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_APPLICATION_INTERNAL_RECORDING_0005 audioAudioInternalRecordingFalse: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(1)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_0100
     * @tc.name      : set rendererWriteDataCallback with VALID result after create audioStreamBuilder
     * @tc.desc      : test OH_AudioStreamBuilder_SetRendererWriteDataCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioStreamBuilderSetRendererWriteDataCallback_001();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_0100`,
        `audioStreamBuilderSetRendererWriteDataCallback_001: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_0200
     * @tc.name      : set rendererWriteDataCallback with INVALID result after create audioStreamBuilder
     * @tc.desc      : test OH_AudioStreamBuilder_SetRendererWriteDataCallback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_0200', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioStreamBuilderSetRendererWriteDataCallback_002();
      console.info(`Tag: SUB_MULTIMEDIA_AUDIO_NDK_STREAM_BUILDER_SET_RENDERER_WRITE_DATA_CALLBACK_0200`,
        `audioStreamBuilderSetRendererWriteDataCallback_002: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioCapturer_GetOverflowCount_0100
     * @tc.name      : set  create audioStreamBuilder
     * @tc.desc      : test OH_AudioCapturer_GetOverflowCount
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioCapturer_GetOverflowCount_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioCapturerGetOverflowCount_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioCapturer_GetOverflowCount_0100`,
        `audioCapturerGetOverflowCount_001: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0100
     * @tc.name      : set OH_AudioSession_Strategy value to CONCURRENCY_MIX_WITH_OTHERS
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.AudioSessionManagerStrategy_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0100`,
        `AudioSessionManagerStrategy_001: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0200
     * @tc.name      : set OH_AudioSession_Strategy value to CONCURRENCY_DEFAULT
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0200', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.AudioSessionManagerStrategy_002();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0200`,
        `AudioSessionManagerStrategy_002: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0300
     * @tc.name      : set OH_AudioSession_Strategy value to CONCURRENCY_DUCK_OTHERS
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0300', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.AudioSessionManagerStrategy_003();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0300`,
        `AudioSessionManagerStrategy_003: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0400
     * @tc.name      : set OH_AudioSession_Strategy value to CONCURRENCY_PAUSE_OTHERS
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0400', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.AudioSessionManagerStrategy_004();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategy_0400`,
        `AudioSessionManagerStrategy_004: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategyError_0100
     * @tc.name      : set audioSessionManager value to nullptr
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategyError_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.AudioSessionManagerStrategyError_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStrategyError_0100`,
        `AudioSessionManagerStrategyError_001: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })


    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerActivatedError_0100
     * @tc.name      : set audioSessionManager value to nullptr
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerActivatedError_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.AudioSessionManagerActivatedError_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerActivatedError_0100`,
        `AudioSessionManagerActivatedError_001: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStopError_0100
     * @tc.name      : set audioSessionManager value to nullptr
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStopError_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.AudioSessionManagerStopError_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStopError_0100`,
        `AudioSessionManagerStopError_001: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStopError_0200
     * @tc.name      : stpo AudioSessionManager twice
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStopError_0200', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.AudioSessionManagerStopError_002();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerStopError_0200`,
        `AudioSessionManagerStopError_002: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterError_0100
     * @tc.name      : set audioSessionManager value to nullptr
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterError_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.AudioSessionManagerRegisterError_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterError_0100`,
        `AudioSessionManagerRegisterError_001: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterError_0200
     * @tc.name      : set callback value to nullptr
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterError_0200', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.AudioSessionManagerRegisterError_002();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerRegisterError_0200`,
        `AudioSessionManagerRegisterError_002: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerUnregisterError_0100
     * @tc.name      : set audioSessionManager value to nullptr
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerUnregisterError_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.AudioSessionManagerUnregisterError_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerUnregisterError_0100`,
        `AudioSessionManagerUnregisterError_001: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })


    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerUnregisterError_0200
     * @tc.name      : set callback value to nullptr
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerUnregisterError_0200', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.AudioSessionManagerUnregisterError_002();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerUnregisterError_0200`,
        `AudioSessionManagerUnregisterError_002: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReason_0100
     * @tc.name      : set OH_AudioSession_DeactivatedReason value to DEACTIVATED_LOWER_PRIORITY
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReason_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.AudioSessionManagerReason_001();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReason_0100`,
        `AudioSessionManagerReason_001: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReason_0200
     * @tc.name      : set OH_AudioSession_DeactivatedReason value to DEACTIVATED_TIMEOUT
     * @tc.desc      : test AudioSessionManagerStrategy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReason_0200', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.AudioSessionManagerReason_002();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioSessionManagerReason_0200`,
        `AudioSessionManagerReason_002: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0100
     * @tc.name      : set  set default output device with invalid devicetype
     * @tc.desc      : test OH_AudioRenderer_SetDefaultOutputDevice
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0100', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetDefaultOutputDevice_01();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0100`,
        `audioRendererSetDefaultOutputDevice_01: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0200
     * @tc.name      : set  set default output device with invalid streamusage
     * @tc.desc      : test OH_AudioRenderer_SetDefaultOutputDevice
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0200', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetDefaultOutputDevice_02();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0200`,
        `audioRendererSetDefaultOutputDevice_02: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })

    /**
     * @tc.number    : SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0300
     * @tc.name      : set  set default output device with nullptr
     * @tc.desc      : test OH_AudioRenderer_SetDefaultOutputDevice
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0300', 0, async (done: Function) => {
      let audioStreamBuilder = myaudioNdk.audioRendererSetDefaultOutputDevice_03();
      console.info(`Tag: SUM_MULTIMEDIA_AUDIO_OH_AudioRenderer_SetDefaultOutputDevice_0300`,
        `audioRendererSetDefaultOutputDevice_03: ${audioStreamBuilder}`);
      expect(audioStreamBuilder).assertEqual(0)
      done()
    })
  })
}
