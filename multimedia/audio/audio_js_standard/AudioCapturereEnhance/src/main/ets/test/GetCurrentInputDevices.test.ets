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
import fileio from '@ohos.fileio';
import * as env from './Const';
import uitest from "@ohos.UiTest";

export default function audioCapturerEnhanceTest() {
  describe('getCurrentInputDevices', function () {
    let Tag = 'AudioCpaturerEnhanceTest: ';
    let dirPath;
    let audioCap = null;
    let promiseFlag = 0;
    let callbackFlag = 0;
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
    async function getFd(fileName) {
      let context = featureAbility.getContext();
      await context.getFilesDir().then((data) => {
        dirPath = data + '/' + fileName;
        console.info(`${Tag} case2 dirPath is  ${JSON.stringify(dirPath)}`);
      })
    }
    async function releaseFun(audioCap) {
      try {
        await audioCap.release();
        console.log(`${Tag} audiocapturer release success`);
      } catch (err) {
        console.log(`${Tag} audiocapturer release fail,err : ${JSON.stringify(err)}`);
      }
    }
    async function recordingFun(audioCap) {
      try {
        let audioParamsGet = await audioCap.getStreamInfo();
        if (audioParamsGet != undefined && audioParamsGet != null) {
          console.info(`${Tag} Capturer getStreamInfo:${JSON.stringify(audioParamsGet)}`);
        } else {
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log(`${Tag} getStreamInfo  :ERROR:  ${JSON.stringify(err.message)} ${JSON.stringify(err.code)}`);
        expect(false).assertTrue();
      }
      try {
        let audioParamsGet = await audioCap.getCapturerInfo();
        if (audioParamsGet != undefined) {
          console.info(`${Tag} Capturer CapturerInfo: ${JSON.stringify(audioParamsGet)}`);
        } else {
          console.info(`${Tag} audioParamsGet are incorrect , is :  ${JSON.stringify(audioParamsGet)}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log(`${Tag} CapturerInfo :ERROR:  ${JSON.stringify(err.message)} ${JSON.stringify(err.code)}`);
        expect(false).assertTrue();
      }
      try {
        await audioCap.start();
        let bufferSize = await audioCap.getBufferSize();
        console.log(`${Tag} bufferSize: ${JSON.stringify(bufferSize)} , dirPath: ${JSON.stringify(dirPath)}`);
        let fd = fileio.openSync(dirPath, 0o102, 0o777);
        console.log(`${Tag} fd: ${JSON.stringify(fd)}`);
        if (fd !== null) {
          console.info(`${Tag} file fd created`);
        } else {
          console.info(`${Tag} Capturer start : ERROR `);
          expect(false).assertTrue();
        }
        fd = fileio.openSync(dirPath, 0o2002, 0o666);
        if (fd !== null) {
          console.info(`${Tag} file fd opened : Append Mode :PASS`);
        }
        else {
          console.info(`${Tag} file fd Open: Append Mode : FAILED`);
          expect(false).assertTrue();
        }
        let numBuffersToCapture = 45;
        while (numBuffersToCapture) {
          console.info(`${Tag} ---------READ BUFFER---------`);
          let buffer = await audioCap.read(bufferSize, true);
          console.info(`${Tag} ---------WRITE BUFFER---------`);
          let number = fileio.writeSync(fd, buffer);
          console.info(`${Tag} BufferRecLog: data written:  ${JSON.stringify(number)}`);
          console.info(`${Tag} numBuffersToCapture: ${numBuffersToCapture}`)
          if (numBuffersToCapture == 22) {
            try {
              let data = await audioCap.getCurrentInputDevices();
              console.info(` recordingFun getCurrentInputDevices: SUCCESS ${getInputDeviceInfo(data)}`)
            } catch (error) {
              console.log(` recordingFun getCurrentInputDevices: ERROR ${error.message},${error.code}`);
              expect(false).assertTrue();
            }
          }
          numBuffersToCapture--;
        }
      } catch (err) {
        console.log(`${Tag} start-read err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
    }

    function getInputDeviceInfo(inputDeviceInfo) {
      let str = ``;
      let descriptor = inputDeviceInfo;
      str += `Id:${descriptor.id}, DeviceType:${descriptor.deviceType}, DeviceRole:${descriptor.deviceRole},
              Name:${descriptor.name}, Address:${descriptor.address}, SampleRates:${descriptor.sampleRates[0]},
              ChannelCounts:${descriptor.channelCounts[0]}, ChannelMask:${descriptor.channelMasks}\n`;
      return str;
    }

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTINPUTDEVICES_0100
     * @tc.name      : AudioCapturer -getCurrentInputDevices "struct"
     * @tc.desc      : AudioCapturer - getCurrentInputDevices "struct"
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTINPUTDEVICES_0100', 0, async function (done) {
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
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
        console.info(`${Tag} AudioCapturer Created : ERROR : ${error.message} ${error.code}`);
      }
      try {
        let InputDeviceInfo = await audioCap.getCurrentInputDevices();
        console.info(` getCurrentInputDevices :SUCCESS ${getInputDeviceInfo(InputDeviceInfo)}`)
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log(`${Tag}:  getCurrentInputDevices : ERROR ${error.message},${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTINPUTDEVICES_0200
     * @tc.name      : AudioCapturer -getCurrentInputDevices "struct"
     * @tc.desc      : AudioCapturer - getCurrentInputDevices "struct"
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTINPUTDEVICES_0200', 0, async function (done) {
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
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
        console.info(`${Tag} Create audio capturer success\n`);
      }catch (error){
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
      }
      try {
        let InputDeviceInfo = await audioCap.getCurrentInputDevices();
        console.info(` getCurrentInputDevices :SUCCESS ${getInputDeviceInfo(InputDeviceInfo)}`)
        expect(InputDeviceInfo.deviceType).assertEqual(audio.DeviceType.MIC);
        expect(InputDeviceInfo.deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        expect(InputDeviceInfo.id).assertEqual(env.INPUT_DEVICE_MIC_ID);
        done();
      } catch (error) {
        console.log(`${Tag}:  getCurrentInputDevices : ERROR ${error.message},${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTINPUTDEVICES_0300
     * @tc.name      : AudioCapturer -getCurrentInputDevices "struct"
     * @tc.desc      : AudioCapturer - getCurrentInputDevices "struct"
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTINPUTDEVICES_0300', 0, async function (done) {
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
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
      await getFd("capture_js-44100-2C-16B.pcm");
      await recordingFun(audioCap);
      try {
        let InputDeviceInfo = await audioCap.getCurrentInputDevices();
        console.info(` getCurrentInputDevices :SUCCESS ${getInputDeviceInfo(InputDeviceInfo)}`)
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log(`${Tag}:  getCurrentInputDevices : ERROR ${error.message},${error.code}`);
        expect(false).assertTrue();
        done();
      }
      await audioCap.stop();
      console.log(`${Tag} stop ok`);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTINPUTDEVICES_0400
     * @tc.name      : AudioCapturer -getCurrentInputDevices "struct"
     * @tc.desc      : AudioCapturer - getCurrentInputDevices "struct"
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTINPUTDEVICES_0400', 0, async function (done) {
      for(let index in audio.SourceType){
        let AudioStreamInfo = {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
          channels: audio.AudioChannel.CHANNEL_2,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let AudioCapturerInfo = {
          source: Number(audio.SourceType[index]),
          capturerFlags: 0
        }
        let AudioCapturerOptions = {
          streamInfo: AudioStreamInfo,
          capturerInfo: AudioCapturerInfo
        }
        try {
          if (Number(audio.SourceType[index]) == -1 || Number(audio.SourceType[index]) == 2 || Number(audio.SourceType[index]) == 3) {
            console.info(`SourceType ${index}:${audio.SourceType[index]} is a invalid source type`)
          } else {
            audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
            console.info(`${index}:${audio.SourceType[index]} Create audio capturer success\n`);
          }
        }catch (error){
            console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}\n`);
            expect(false).assertTrue()
            return
        }
        if (audioCap != null){
          try {
            let InputDeviceInfo = await audioCap.getCurrentInputDevices();
            console.info(` getCurrentInputDevices :SUCCESS ${getInputDeviceInfo(InputDeviceInfo)}`)
            done();
          } catch (error) {
            console.log(`${Tag}:  getCurrentInputDevices : ERROR ${error.message},${error.code}`);
            expect(false).assertTrue();
            done();
          }
          await releaseFun(audioCap);
          audioCap = null;
        }
      }
      done();
    })

  })
}