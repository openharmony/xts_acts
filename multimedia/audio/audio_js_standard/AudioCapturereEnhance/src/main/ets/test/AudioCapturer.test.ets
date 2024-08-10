import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { AudioState, rand_sleep,sleep, Constant } from './Common';
import audio from '@ohos.multimedia.audio';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import featureAbility from '@ohos.ability.featureAbility';
import uitest from "@ohos.UiTest";

let audioStreamInfo: audio.AudioStreamInfo = {
  samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000, // 采样率
  channels: audio.AudioChannel.CHANNEL_2, // 通道
  sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE, // 采样格式
  encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW // 编码格式
};

let audioCapturerInfo: audio.AudioCapturerInfo = {
  source: audio.SourceType.SOURCE_TYPE_MIC,
  capturerFlags: 0
};

let audioCapturerOptions: audio.AudioCapturerOptions = {
  streamInfo: audioStreamInfo,
  capturerInfo: audioCapturerInfo
};

let audioCapturer: audio.AudioCapturer;

export async function createAudioCapturer(audioCapturerOptions: audio.AudioCapturerOptions,
  byAudioState?: audio.AudioState) {
  audioCapturer = await audio.createAudioCapturer(audioCapturerOptions);
  await rand_sleep(Constant.SLEEP_TIME_100);
  let state: audio.AudioState = audioCapturer.state;
  console.info('finish createAudioCapturer event, audioCapturer state is ' + audioCapturer.state);
  expect(state).assertEqual(AudioState.STATE_PREPARED);
  if (byAudioState === AudioState.STATE_RUNNING) {
    await start(audioCapturer);
  } else if (byAudioState === AudioState.STATE_STOPPED) {
    await start(audioCapturer);
    await stop(audioCapturer);
  } else if (byAudioState === AudioState.STATE_RELEASED) {
    await start(audioCapturer);
    await stop(audioCapturer);
    await release(audioCapturer);
  }
}

export async function start(AudioCapturer: audio.AudioCapturer) {
  await AudioCapturer.start();
  await rand_sleep(Constant.SLEEP_TIME_100);
  console.info('finish start event, AudioCapturer state is ' + AudioCapturer.state);
  expect(AudioCapturer.state).assertEqual(AudioState.STATE_RUNNING);
}

export async function stop(AudioCapturer: audio.AudioCapturer) {
  await AudioCapturer.stop();
  await rand_sleep(Constant.SLEEP_TIME_100);
  console.info('finish stop event, AudioCapturer state is ' + AudioCapturer.state);
  expect(AudioCapturer.state).assertEqual(AudioState.STATE_STOPPED);
}

export async function release(AudioCapturer: audio.AudioCapturer) {
  await AudioCapturer.release();
  await rand_sleep(Constant.SLEEP_TIME_100);
  console.info('finish release event, AudioCapturer state is ' + AudioCapturer.state);
  expect(AudioCapturer.state).assertEqual(AudioState.STATE_RELEASED);
}

export default function audioCapturerTest() {
  describe('AudioCapturerTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    let Tag = 'AudioCpaturerEnhanceTest: ';
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      console.info("beforeAll case");
      let permissions = ["ohos.permission.MICROPHONE"];
      try {
        featureAbility.getContext().requestPermissionsFromUser(permissions, 0, (err, data) => {
          console.info(`getPermission requestPermissionsFromUser ${JSON.stringify(data)}`);
        });
      } catch (err) {
        console.log(`get permission catch err -> ${JSON.stringify(err)}`);
      }
      await sleep(1000);
      let driver = uitest.Driver.create();
      await sleep(2000);
      let button = await driver.findComponent(uitest.ON.text("允许"));
      if(button == null){
        let cmd = "hidumper -s WindowManagerService -a'-a'"
        await delegator.executeShellCommand(cmd);
      }
      await button.click();
      await sleep(2000);
      let isGranted1 = await featureAbility.getContext().verifyPermission("ohos.permission.MICROPHONE");
      if (!(isGranted1 == 0)) {
        console.error("getpermission failed");
      } else {
        console.info("getpermission success");
      }
      console.info('TestLog: Start Testing AudioCpaturerEnhanceTest Interfaces');
      await rand_sleep(Constant.SLEEP_TIME_100);
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_API_1
    * @tc.name      : test audioCapturer basic API by promise
    * @tc.desc      : test audioCapturer operation: createAudioCapturer(audioCapturerOptions)->start(audioCapturer)->stop(audioCapturer)->release(audioCapturer)
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOCAPTURER_API_1', 1, async () => {
      await createAudioCapturer(audioCapturerOptions);
      await start(audioCapturer);
      await stop(audioCapturer);
      await release(audioCapturer);
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_API_2
    * @tc.name      : test audioCapturer basic API by promise
    * @tc.desc      : test audioCapturer operation: createAudioCapturer(audioCapturerOptions)->start(audioCapturer)->stop(audioCapturer)->start(audioCapturer)->stop(audioCapturer)
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOCAPTURER_API_2', 2, async () => {
      await createAudioCapturer(audioCapturerOptions);
      await start(audioCapturer);
      await stop(audioCapturer);
      await start(audioCapturer);
      await stop(audioCapturer);
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_API_3
    * @tc.name      : test audioCapturer basic API by promise
    * @tc.desc      : test audioCapturer operation: createAudioCapturer(audioCapturerOptions)->release(audioCapturer)
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOCAPTURER_API_3', 3, async () => {
      await createAudioCapturer(audioCapturerOptions);
      await release(audioCapturer);
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_API_4
    * @tc.name      : test audioCapturer basic API by promise
    * @tc.desc      : test audioCapturer operation: createAudioCapturer(audioCapturerOptions,AudioState.STATE_RUNNING)->stop(audioCapturer)->release(audioCapturer)
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOCAPTURER_API_4', 4, async () => {
      await createAudioCapturer(audioCapturerOptions, AudioState.STATE_RUNNING);
      await stop(audioCapturer);
      await release(audioCapturer);
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_API_5
    * @tc.name      : test audioCapturer basic API by promise
    * @tc.desc      : test audioCapturer operation: createAudioCapturer(audioCapturerOptions,AudioState.STATE_RUNNING)->stop(audioCapturer)->start(audioCapturer)->stop(audioCapturer)->release(audioCapturer)
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOCAPTURER_API_5', 5, async () => {
      await createAudioCapturer(audioCapturerOptions, AudioState.STATE_RUNNING);
      await stop(audioCapturer);
      await start(audioCapturer);
      await stop(audioCapturer);
      await release(audioCapturer);
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_API_6
    * @tc.name      : test audioCapturer basic API by promise
    * @tc.desc      : test audioCapturer operation: createAudioCapturer(audioCapturerOptions,AudioState.STATE_RUNNING)->stop(audioCapturer)->start(audioCapturer)->stop(audioCapturer)->start(audioCapturer)
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOCAPTURER_API_6', 6, async () => {
      await createAudioCapturer(audioCapturerOptions, AudioState.STATE_RUNNING);
      await stop(audioCapturer);
      await start(audioCapturer);
      await stop(audioCapturer);
      await start(audioCapturer);
      await stop(audioCapturer);
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_API_7
    * @tc.name      : test audioCapturer basic API by promise
    * @tc.desc      : test audioCapturer operation: createAudioCapturer(audioCapturerOptions,AudioState.STATE_STOPPED)->release(audioCapturer)
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOCAPTURER_API_7', 7, async () => {
      await createAudioCapturer(audioCapturerOptions, AudioState.STATE_STOPPED);
      await release(audioCapturer);
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_API_8
    * @tc.name      : test audioCapturer basic API by promise
    * @tc.desc      : test audioCapturer operation: createAudioCapturer(audioCapturerOptions,AudioState.STATE_STOPPED)->start(audioCapturer)->stop(audioCapturer)->release(audioCapturer)
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOCAPTURER_API_8', 8, async () => {
      await createAudioCapturer(audioCapturerOptions, AudioState.STATE_STOPPED);
      await start(audioCapturer);
      await stop(audioCapturer);
      await release(audioCapturer);
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_API_9
    * @tc.name      : test audioCapturer basic API by promise
    * @tc.desc      : test audioCapturer operation: createAudioCapturer(audioCapturerOptions,AudioState.STATE_STOPPED)->start(audioCapturer)->stop(audioCapturer)->start(audioCapturer)->stop(audioCapturer)
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOCAPTURER_API_9', 9, async () => {
      await createAudioCapturer(audioCapturerOptions, AudioState.STATE_STOPPED);
      await start(audioCapturer);
      await stop(audioCapturer);
      await start(audioCapturer);
      await stop(audioCapturer);
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_API_10
    * @tc.name      : test audioCapturer basic API by promise
    * @tc.desc      : test audioCapturer operation: createAudioCapturer(audioCapturerOptions,AudioState.STATE_STOPPED)->stop(audioCapturer)->stop(audioCapturer)
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOCAPTURER_API_10', 10, async () => {
      try {
      await createAudioCapturer(audioCapturerOptions, AudioState.STATE_STOPPED);
      await stop(audioCapturer);
      await stop(audioCapturer);
      } catch (error) {
        console.error('Error errCode is:', error.code);
        expect(error.code).assertEqual(Constant.EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_API_11
    * @tc.name      : test audioCapturer basic API by promise
    * @tc.desc      : test audioCapturer operation: createAudioCapturer(audioCapturerOptions,AudioState.STATE_STOPPED)->start(audioCapturer)->start(audioCapturer)
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOCAPTURER_API_11', 11, async () => {
      try {
        await createAudioCapturer(audioCapturerOptions, AudioState.STATE_STOPPED);
        await start(audioCapturer);
        await start(audioCapturer);
      } catch (error) {
        console.error('Error errCode is:', error.code);
        expect(error.code).assertEqual(Constant.EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_API_12
    * @tc.name      : test audioCapturer basic API by promise
    * @tc.desc      : test audioCapturer operation: createAudioCapturer(audioCapturerOptions,AudioState.STATE_STOPPED)->release(audioCapturer)->release(audioCapturer)
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOCAPTURER_API_12', 12, async () => {
      try {
        await createAudioCapturer(audioCapturerOptions, AudioState.STATE_STOPPED);
        await release(audioCapturer);
        await release(audioCapturer);
      } catch (error) {
        console.error('Error errCode is:', error.code);
        expect(error.code).assertEqual(Constant.EORRCODE);
      }
    })

    /* *
   * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_API_13
   * @tc.name      : test audioCapturer basic API by promise
   * @tc.desc      : test audioCapturer operation: createAudioCapturer(audioCapturerOptions,AudioState.STATE_RUNNING)->stop(audioCapturer)->stop(audioCapturer)
   * @tc.size      : AudioTest
   * @tc.type      : Function
   * @tc.level     : Level3
   */
    it('SUB_AUDIO_AUDIOCAPTURER_API_13', 13, async () => {
      try {
        await createAudioCapturer(audioCapturerOptions, AudioState.STATE_RUNNING);
        await stop(audioCapturer);
        await stop(audioCapturer);
      } catch (error) {
        console.error('Error errCode is:', error.code);
        expect(error.code).assertEqual(Constant.EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_API_14
    * @tc.name      : test audioCapturer basic API by promise
    * @tc.desc      : test audioCapturer operation: createAudioCapturer(audioCapturerOptions,AudioState.STATE_RUNNING)->start(audioCapturer)->start(audioCapturer)
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOCAPTURER_API_14', 14, async () => {
      try {
        await createAudioCapturer(audioCapturerOptions, AudioState.STATE_RUNNING);
        await start(audioCapturer);
        await start(audioCapturer);
      } catch (error) {
        console.error('Error errCode is:', error.code);
        expect(error.code).assertEqual(Constant.EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_API_15
    * @tc.name      : test audioCapturer basic API by promise
    * @tc.desc      : test audioCapturer operation: createAudioCapturer(audioCapturerOptions,AudioState.STATE_RUNNING)->release(audioCapturer)->release(audioCapturer)
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOCAPTURER_API_15', 15, async () => {
      try {
        await createAudioCapturer(audioCapturerOptions, AudioState.STATE_RUNNING);
        await release(audioCapturer);
        await release(audioCapturer);
      } catch (error) {
        console.error('Error errCode is:', error.code);
        expect(error.code).assertEqual(Constant.EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_API_16
    * @tc.name      : test audioCapturer basic API by promise
    * @tc.desc      : test audioCapturer operation: createAudioCapturer(audioCapturerOptions,AudioState.STATE_RELEASED)->stop(audioCapturer)->stop(audioCapturer)
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOCAPTURER_API_16', 16, async () => {
      try {
        await createAudioCapturer(audioCapturerOptions, AudioState.STATE_RELEASED);
        await stop(audioCapturer);
        await stop(audioCapturer);
      } catch (error) {
        console.error('Error errCode is:', error.code);
        expect(error.code).assertEqual(Constant.EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_API_17
    * @tc.name      : test audioCapturer basic API by promise
    * @tc.desc      : test audioCapturer operation: createAudioCapturer(audioCapturerOptions,AudioState.STATE_RELEASED)->start(audioCapturer)->start(audioCapturer)
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOCAPTURER_API_17', 17, async () => {
      try {
        await createAudioCapturer(audioCapturerOptions, AudioState.STATE_RELEASED);
        await start(audioCapturer);
        await start(audioCapturer);
      } catch (error) {
        console.error('Error errCode is:', error.code);
        expect(error.code).assertEqual(Constant.EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_API_18
    * @tc.name      : test audioCapturer basic API by promise
    * @tc.desc      : test audioCapturer operation: createAudioCapturer(audioCapturerOptions,AudioState.STATE_RELEASED)->release(audioCapturer)->release(audioCapturer)
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOCAPTURER_API_18', 18, async () => {
      try {
        await createAudioCapturer(audioCapturerOptions, AudioState.STATE_RELEASED);
        await release(audioCapturer);
        await release(audioCapturer);
      } catch (error) {
        console.error('Error errCode is:', error.code);
        expect(error.code).assertEqual(Constant.EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_API_19
    * @tc.name      : test audioCapturer basic API by promise
    * @tc.desc      : test audioCapturer operation: createAudioCapturer(audioCapturerOptions)->stop(audioCapturer)->stop(audioCapturer)
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOCAPTURER_API_19', 19, async () => {
      try {
        await createAudioCapturer(audioCapturerOptions);
        await stop(audioCapturer);
        await stop(audioCapturer);
      } catch (error) {
        console.error('Error errCode is:', error.code);
        expect(error.code).assertEqual(Constant.EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_API_20
    * @tc.name      : test audioCapturer basic API by promise
    * @tc.desc      : test audioCapturer operation: createAudioCapturer(audioCapturerOptions)->start(audioCapturer)->start(audioCapturer)
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOCAPTURER_API_20', 20, async () => {
      try {
        await createAudioCapturer(audioCapturerOptions);
        await start(audioCapturer);
        await start(audioCapturer);
      } catch (error) {
        console.error('Error errCode is:', error.code);
        expect(error.code).assertEqual(Constant.EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOCAPTURER_API_21
    * @tc.name      : test audioCapturer basic API by promise
    * @tc.desc      : test audioCapturer operation: createAudioCapturer(audioCapturerOptions)->release(audioCapturer)->release(audioCapturer)
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOCAPTURER_API_21', 21, async () => {
      try {
        await createAudioCapturer(audioCapturerOptions);
        await release(audioCapturer);
        await release(audioCapturer);
      } catch (error) {
        console.error('Error errCode is:', error.code);
        expect(error.code).assertEqual(Constant.EORRCODE);
      }
    })
  })
}


