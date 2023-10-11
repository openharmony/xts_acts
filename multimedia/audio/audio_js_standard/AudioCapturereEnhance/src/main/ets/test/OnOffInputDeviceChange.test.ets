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
import audio from '@ohos.multimedia.audio';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import featureAbility from '@ohos.ability.featureAbility';
import * as env from './Const';
import uitest from "@ohos.UiTest";

export default function audioCapturerEnhanceTest() {
  describe('onOffInputDeviceChange', function () {
    let Tag = 'AudioCpaturerEnhanceTest: ';
    let audioCap = null;
    function sleep(ms) {
      return new Promise(resolve => setTimeout(resolve, ms));
    }
    beforeAll(async function () {
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
      await button.click();
      await sleep(2000);
      let isGranted1 = await featureAbility.getContext().verifyPermission("ohos.permission.MICROPHONE");
      if (!(isGranted1 == 0)) {
        console.error("getpermission failed");
      } else {
        console.info("getpermission success");
      }
      console.info('TestLog: Start Testing AudioCpaturerEnhanceTest Interfaces');
    });
    beforeEach(async function () {
      console.info(`${Tag} beforeEach: Prerequisites at the test case level`);
      await sleep(1000);
    })
    afterEach(function () {
      if (audioCap != null) {
        releaseFun(audioCap);
        audioCap = null;
      }
      console.info(`${Tag} afterEach: Test case-level clearance conditions`);
    })
    afterAll(function () {
      console.info(`${Tag} afterAll: Test suite-level cleanup condition`);
    })
    async function releaseFun(audioCap) {
      try {
        await audioCap.release();
        console.log(`${Tag} release success`);
      } catch (err) {
        console.log(`${Tag} release fail,err : ${JSON.stringify(err)}`);
      }
    }
    function getInputDeviceInfo(inputDeviceInfo) {
      let str = ``;
      let descriptor = inputDeviceInfo;
      str += `Id:${descriptor.id}, DeviceType:${descriptor.deviceType}, DeviceRole:${descriptor.deviceRole},
              Name:${descriptor.name}, Address:${descriptor.address}, SampleRates:${descriptor.sampleRates[0]},
              ChannelCounts:${descriptor.channelCounts[0]}, ChannelMask:${descriptor.channelMasks[0]}\n`;
      return str;
    }

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_INPUTDEVICECHANGE_0100
     * @tc.name      : AudioCapturer - on(type: 'inputDeviceChange', callback: Callback<AudioDeviceDescriptors>) - callback
     * @tc.desc      : AudioCapturer - on(type: 'inputDeviceChange', callback: Callback<AudioDeviceDescriptors>) - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_INPUTDEVICECHANGE_0100', 0, async function (done) {
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`Create audio capturer success\n`);
      }catch (error){
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
      }
      try {
        console.info(`${Tag}  on-inputDeviceChange in, please change input device to set off it!`);
        audioCap.on(env.INPUT_PARAMETER_TYPE_NUMBER, (data) => {
          console.info(`${Tag}  on-inputDeviceChange Success!`);
          console.info(`inputDeviceChange: ${getInputDeviceInfo(data)}`)
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == env.INVALID_INPUT_PARAMETER_401) {
          console.error(` on-inputDeviceChange input parameter type -1: ${error.message}, ${error.code}`);
          expect(true).assertTrue();
          done();
        } else {
          console.error(`${Tag}:  on-inputDeviceChange Fail: ${error.message}, ${error.code}`);
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_INPUTDEVICECHANGE_0200
     * @tc.name      : AudioCapturer - on(type: 'inputDeviceChange', callback: Callback<AudioDeviceDescriptors>) - callback
     * @tc.desc      : AudioCapturer - on(type: 'inputDeviceChange', callback: Callback<AudioDeviceDescriptors>) - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_INPUTDEVICECHANGE_0200', 0, async function (done) {
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`Create audio capturer success\n`);
      }catch (error){
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
      }
      try {
        console.info(`${Tag}  on-inputDeviceChange in, please change input device to set off it!`);
        audioCap.on(env.INVALID_PARAMETER_STRING, (data) => {
          console.info(`${Tag}  on-inputDeviceChange Success!`);
          console.info(`inputDeviceChange: ${getInputDeviceInfo(data)}`)
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == env.INVALID_INPUT_PARAMETER_6800101) {
          console.error(` on-inputDeviceChange invalid parameter type '123': ${error.message}, ${error.code}`);
          expect(true).assertTrue();
          done();
        } else {
          console.error(`${Tag}:  on-inputDeviceChange Fail: ${error.message}, ${error.code}`);
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_INPUTDEVICECHANGE_0300
     * @tc.name      : AudioCapturer - on(type: 'inputDeviceChange', callback: Callback<AudioDeviceDescriptors>) - callback
     * @tc.desc      : AudioCapturer - on(type: 'inputDeviceChange', callback: Callback<AudioDeviceDescriptors>) - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_INPUTDEVICECHANGE_0300', 0, async function (done) {
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`Create audio capturer success\n`);
      }catch (error){
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
      }
      try {
        console.info(`${Tag}  on-inputDeviceChange in, please change input device to set off it!`);
        audioCap.on((data) => {
          console.info(`${Tag}  on-inputDeviceChange Success!`);
          console.info(`inputDeviceChange: ${getInputDeviceInfo(data)}`)
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == env.INVALID_INPUT_PARAMETER_401) {
          console.error(` on-inputDeviceChange no input parameter: ${error.message}, ${error.code}`);
          expect(true).assertTrue();
          done();
        } else {
          console.error(`${Tag}:  on-inputDeviceChange Fail: ${error.message}, ${error.code}`);
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_OFF_INPUTDEVICECHANGE_0100
     * @tc.name      : AudioCapturer - off(type: 'inputDeviceChange', callback?: Callback<AudioDeviceDescriptors>) - callback
     * @tc.desc      : AudioCapturer - off(type: 'inputDeviceChange', callback?: Callback<AudioDeviceDescriptors>) - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_OFF_INPUTDEVICECHANGE_0100', 0, async function (done) {
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`Create audio capturer success\n`);
      }catch (error){
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
      }
      try {
        console.info(`${Tag}  off-inputDeviceChange in, please change input device to set off it!`);
        audioCap.off(env.INPUT_PARAMETER_TYPE_NUMBER, (data) => {
          console.info(`${Tag}  off-inputDeviceChange Success!`);
          console.info(`inputDeviceChange: ${getInputDeviceInfo(data)}`)
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == env.INVALID_INPUT_PARAMETER_6800101) {
          console.error(` off-inputDeviceChange input parameter type -1: ${error.message}, ${error.code}`);
          expect(true).assertTrue();
          done();
        } else {
          console.error(`${Tag}:  off-inputDeviceChange Fail: ${error.message}, ${error.code}`);
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_OFF_INPUTDEVICECHANGE_0200
     * @tc.name      : AudioCapturer - off(type: 'inputDeviceChange', callback?: Callback<AudioDeviceDescriptors>) - callback
     * @tc.desc      : AudioCapturer - off(type: 'inputDeviceChange', callback?: Callback<AudioDeviceDescriptors>) - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_OFF_INPUTDEVICECHANGE_0200', 0, async function (done) {
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`Create audio capturer success\n`);
      }catch (error){
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
      }
      try {
        console.info(`${Tag}  off-inputDeviceChange in, please change input device to set off it!`);
        audioCap.off(env.INVALID_PARAMETER_STRING, (data) => {
          console.info(`${Tag}  off-inputDeviceChange Success!`);
          console.info(`inputDeviceChange: ${getInputDeviceInfo(data)}`)
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == env.UNSUPORTED_OPTION_6800104) {
          console.error(` off-inputDeviceChange invalid parameter type '123': ${error.message}, ${error.code}`);
          expect(true).assertTrue();
          done();
        } else {
          console.error(`${Tag}:  off-inputDeviceChange Fail: ${error.message}, ${error.code}`);
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_OFF_INPUTDEVICECHANGE_0300
     * @tc.name      : AudioCapturer - on(type: 'inputDeviceChange', callback?: Callback<AudioDeviceDescriptors>) - callback
     * @tc.desc      : AudioCapturer - on(type: 'inputDeviceChange', callback?: Callback<AudioDeviceDescriptors>) - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_OFF_INPUTDEVICECHANGE_0300', 0, async function (done) {
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`Create audio capturer success\n`);
      }catch (error){
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
      }
      try {
        console.info(`${Tag}  off-inputDeviceChange in, please change input device to set off it!`);
        audioCap.off((data) => {
          console.info(`${Tag}  off-inputDeviceChange Success!`);
          console.info(`inputDeviceChange: ${getInputDeviceInfo(data)}`)
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == env.INVALID_INPUT_PARAMETER_6800101) {
          console.error(` off-inputDeviceChange no input parameter: ${error.message}, ${error.code}`);
          expect(true).assertTrue();
          done();
        } else {
          console.error(`${Tag}:  off-inputDeviceChange Fail: ${error.message}, ${error.code}`);
          expect(false).assertTrue();
          done();
        }
      }
    })

  })
}