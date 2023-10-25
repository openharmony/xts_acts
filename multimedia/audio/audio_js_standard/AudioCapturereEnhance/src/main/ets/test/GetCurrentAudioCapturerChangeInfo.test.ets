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
  describe('getCurrentAudioCapturerChangeInfo', function () {
    let Tag = 'AudioCpaturerEnhanceTest: ';
    let dirPath;
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
      console.info(`findComponent success ${button}`);
      await button.click();
      console.info("click success");
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
        console.log(`${Tag} release success`);
      } catch (err) {
        console.log(`${Tag} release fail,err : ${JSON.stringify(err)}`);
      }
    }

    async function recordingFun(audioCap) {
      try {
        let audioParamsGet = await audioCap.getStreamInfo();
        if (audioParamsGet != undefined && audioParamsGet != null) {
          console.info(`${Tag} Capturer getStreamInfo:${JSON.stringify(audioParamsGet)}`);
        } else {
          console.info(`${Tag} audioParamsGet are incorrect,is :  ${JSON.stringify(audioParamsGet)}`);
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
        console.log(`${Tag} start ok`);
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
        console.log(`${Tag} fd-re: ${JSON.stringify(fd)}`);
        if (fd !== null) {
          console.info(`${Tag} file fd opened : Append Mode :PASS`);
        }
        else {
          console.info(`${Tag} file fd Open: Append Mode : FAILED`);
          expect(false).assertTrue();
        }
        let numBuffersToCapture = 45;
        while (numBuffersToCapture) {
          if (numBuffersToCapture % 5 == 0) {
            console.info(`${Tag} ---------READ BUFFER---------`);
          }
          let buffer = await audioCap.read(bufferSize, true);
          if (numBuffersToCapture % 5 == 0) {
            console.info(`${Tag} ---------WRITE BUFFER---------`);
          }
          let number = fileio.writeSync(fd, buffer);
          if (numBuffersToCapture % 5 == 0) {
            console.info(`${Tag} BufferRecLog: data written:  ${JSON.stringify(number)}`);
            console.info(`${Tag} numBuffersToCapture: ${numBuffersToCapture}`)
          }
          if (numBuffersToCapture == 22) {
            try {
              let CapturerChangeInfo = await audioCap.getCurrentAudioCapturerChangeInfo();
              console.info(`recordingFun getCurrentAudioCapturerChangeInfo:SUCCESS,
                   ${getCapturerChangeInfo(CapturerChangeInfo)}`)
            } catch (error) {
              console.log(`recordingFun getCurrentAudioCapturerChangeInfo: ERROR ${error.message},${error.code}`);
              expect(false).assertTrue();
            }
          }
          numBuffersToCapture--;
        }
        console.log(`${Tag} read ok`);
      } catch (err) {
        console.log(`${Tag} start-read err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
    }

    function getCapturerChangeInfo(CapturerChangeInfo) {
      let str = ``;
      for (let i = 0; i < CapturerChangeInfo.length; i++) {
        let Info = CapturerChangeInfo[i];
        str += `__deviceDescriptors_${i}:\nStreamId:${Info.streamId}, ClientUid:${Info.clientUid}, State:${Info.capturerState}\n Source:${Info.capturerInfo.source}, Flag:${Info.capturerInfo.capturerFlags}\n`;
        let descriptor = Info.deviceDescriptors[0];
        str += ` Id:${descriptor.id}, Type:${descriptor.deviceType}, Role:${descriptor.deviceRole}\n Name:${descriptor.name}, Address:${descriptor.address}, SampleRates:${descriptor.sampleRates[0]}\n ChannelCounts:${descriptor.channelCounts[0]}, ChannelMask:${descriptor.channelMasks}\n`;
      }
      return str;
    }

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_GETAUDIOCURRENTAUDIOCAPTURERCHANGEINFO_0100
     * @tc.name      : AudioCapturer -getCurrentAudioCapturerChangeInfo-MIC-STATE_PREPARED
     * @tc.desc      : AudioCapturer - getCurrentAudioCapturerChangeInfo-MIC-STATE_PREPARED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GETAUDIOCURRENTAUDIOCAPTURERCHANGEINFO_0100', 0, async function (done) {
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
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCap = data;
        }).catch((err) => {
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message},${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        let CapturerChangeInfo = await audioCap.getCurrentAudioCapturerChangeInfo();
        console.info(`getCurrentAudioCapturerChangeInfo :SUCCESS\n ${getCapturerChangeInfo(CapturerChangeInfo)}`)
        expect(CapturerChangeInfo.capturerInfo.source)
          .assertEqual(Number(AudioCapturerOptions.capturerInfo.source));
        expect(CapturerChangeInfo.capturerState).assertEqual(audio.AudioState.STATE_PREPARED);
        expect(CapturerChangeInfo.deviceDescriptors[0].id).assertLargerOrEqual(env.OUTPUT_NUMBER_0);
        expect(CapturerChangeInfo.deviceDescriptors[0].deviceType).assertEqual(audio.DeviceType.MIC);
        expect(CapturerChangeInfo.deviceDescriptors[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        done();
      } catch (error) {
        console.log(`${Tag}getCurrentAudioCapturerChangeInfo : ERROR ${error.message},${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_GETAUDIOCURRENTAUDIOCAPTURERCHANGEINFO_0200
     * @tc.name      : AudioCapturer -getCurrentAudioCapturerChangeInfo-MIC-SOURCE-RECOGNITION
     * @tc.desc      : AudioCapturer - getCurrentAudioCapturerChangeInfo-MIC-SOURCE-RECOGNITION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GETAUDIOCURRENTAUDIOCAPTURERCHANGEINFO_0200', 0, async function (done) {
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
        capturerFlags: 0
      }
      let AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data)=>{
          audioCap = data;
        }).catch((err)=>{
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
        await getFd("capture_js-44100-2C-16B.pcm");
        await recordingFun(audioCap);
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created and start ERROR :  ${error.message},${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        let CapturerChangeInfo = await audioCap.getCurrentAudioCapturerChangeInfo();
        console.info(`getCurrentAudioCapturerChangeInfo :SUCCESS, ${getCapturerChangeInfo(CapturerChangeInfo)}`)
        expect(CapturerChangeInfo.capturerState).assertEqual(audio.AudioState.STATE_PREPARED);
        expect(CapturerChangeInfo.deviceDescriptors[0].id).assertLargerOrEqual(env.OUTPUT_NUMBER_0);
        expect(CapturerChangeInfo.deviceDescriptors[0].deviceType).assertEqual(audio.DeviceType.MIC);
        expect(CapturerChangeInfo.deviceDescriptors[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        done();
      } catch (error) {
        console.log(`${Tag} getCurrentAudioCapturerChangeInfo : ERROR ${error.message},${error.code}`);
        expect(false).assertTrue();
        done();
      }
      await audioCap.stop();
      console.log(`${Tag} stop ok`);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_GETAUDIOCURRENTAUDIOCAPTURERCHANGEINFO_0300
     * @tc.name      : AudioCapturer -getCurrentAudioCapturerChangeInfo-SOURCE_TYPE_PLAYBACK_CAPTURE-STATE_STOPPED
     * @tc.desc      : AudioCapturer - getCurrentAudioCapturerChangeInfo-SOURCE_TYPE_PLAYBACK_CAPTURE-STATE_STOPPED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GETAUDIOCURRENTAUDIOCAPTURERCHANGEINFO_0300', 0, async function (done) {
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE,
        capturerFlags: 0
      }
      let AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data)=>{
          audioCap = data;
        }).catch((err)=>{
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
        await getFd("capture_js-44100-2C-16B.pcm");
        await recordingFun(audioCap);
        await audioCap.stop();
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message},${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        let CapturerChangeInfo = await audioCap.getCurrentAudioCapturerChangeInfo();
        console.info(`getCurrentAudioCapturerChangeInfo :SUCCESS, ${getCapturerChangeInfo(CapturerChangeInfo)}`)
        expect(CapturerChangeInfo.capturerState).assertEqual(audio.AudioState.STATE_STOPPED);
        expect(CapturerChangeInfo.deviceDescriptors[0].id).assertLargerOrEqual(env.OUTPUT_NUMBER_0);
        expect(CapturerChangeInfo.deviceDescriptors[0].deviceType).assertEqual(audio.DeviceType.MIC);
        expect(CapturerChangeInfo.deviceDescriptors[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        done();
      } catch (error) {
        console.log(`${Tag}getCurrentAudioCapturerChangeInfo : ERROR ${error.message},${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_GETAUDIOCURRENTAUDIOCAPTURERCHANGEINFO_0400
     * @tc.name      : AudioCapturer -getCurrentAudioCapturerChangeInfo-USE ALL SOURCE TYPE
     * @tc.desc      : AudioCapturer - getCurrentAudioCapturerChangeInfo-USE ALL SOURCE TYPE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GETAUDIOCURRENTAUDIOCAPTURERCHANGEINFO_0400', 0, async function (done) {
      for (let index in audio.SourceType) {
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
          if (Number(audio.SourceType[index]) == -1 || Number(audio.SourceType[index]) == 3) {
            console.info(`SourceType ${index}:${audio.SourceType[index]}, change to MIC`)
            AudioCapturerOptions.capturerInfo.source = Number(audio.SourceType.SOURCE_TYPE_MIC);
          }
          await audio.createAudioCapturer(AudioCapturerOptions).then((data)=>{
            audioCap = data;
          }).catch((err)=>{
            console.info(' AudioCapturer Created catch ERROR' + err.message);
          });
        } catch (error) {
          console.info(`${index}:${audio.SourceType[index]} AudioCapturer Created : ERROR :  ${error.message},${error.code}`);
          expect(false).assertTrue();
          done();
        }
        try {
          let CapturerChangeInfo = await audioCap.getCurrentAudioCapturerChangeInfo();
          console.info(`getCurrentAudioCapturerChangeInfo success! ${getCapturerChangeInfo(CapturerChangeInfo)}`)
          expect(CapturerChangeInfo.capturerInfo.source)
            .assertEqual(Number(AudioCapturerOptions.capturerInfo.source));
          expect(CapturerChangeInfo.deviceDescriptors[0].id).assertLargerOrEqual(env.OUTPUT_NUMBER_0);
          expect(CapturerChangeInfo.deviceDescriptors[0].deviceType).assertEqual(audio.DeviceType.MIC);
          expect(CapturerChangeInfo.deviceDescriptors[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        } catch (error) {
          console.log(`${Tag}getCurrentAudioCapturerChangeInfo ERROR! ${error.message},${error.code}`);
          expect(false).assertTrue();
          done();
        }
        sleep(20);
        await releaseFun(audioCap);
        audioCap = null;
      }
      done();
    })
  })
}