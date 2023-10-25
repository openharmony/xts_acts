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
  describe('onOffAudioCapturerChange', function () {
    let Tag = 'AudioCpaturerEnhanceTest: ';
    let dirPath;
    let audioCap = null;
    let audioVolumeGroupManager = null;
    let audioManager = audio.getAudioManager();
    let audioVolumeManager = audioManager.getVolumeManager();
    let groupid = audio.DEFAULT_VOLUME_GROUP_ID;

    function sleep(ms) {
      return new Promise(resolve => setTimeout(resolve, ms));
    }

    beforeAll(async function () {
      console.info("beforeAll case");
      let permissions = ["ohos.permission.MICROPHONE", "ohos.permission.MANAGE_AUDIO_CONFIG"];
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
      let isGranted1 = await featureAbility.getContext().verifyPermission("ohos.permission.MICROPHONE");
      if (!(isGranted1 == 0)) {
        console.error("getpermission failed");
      } else {
        console.info("getpermission success");
      }
      await sleep(3000);
      audioVolumeManager.getVolumeGroupManager(groupid, (err, value) => {
        if (err) {
          console.log(`getVolumeGroupManager failed.err: ${err.message} ${err.code}`)
          return;
        }
        console.log(`getVolumeGroupManager success`)
        audioVolumeGroupManager = value;
      });
      sleep(1000);
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
      audioVolumeGroupManager.setMicrophoneMute(false, (err) => {
        if (err) {
          console.log(`setMicrophoneMute-false err: ${err.message}, ${err.code}`)
          return;
        }
        console.log(`setMicrophoneMute-false success`)
      });
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
          numBuffersToCapture--;
        }
        console.log(`${Tag} read ok`);
      } catch (err) {
        console.log(`${Tag} start-read err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
    }

    async function releaseFun(audioCap) {
      try {
        await audioCap.release();
        console.log(`${Tag} release success`);
      } catch (err) {
        console.log(`${Tag} release fail,err : ${JSON.stringify(err)}`);
      }
    }

    function getCapturerInfo(CapturerChangeInfo) {
      let str = ``;
      let Info = CapturerChangeInfo[0];
      str += `nStreamId:${Info.streamId}, ClientUid:${Info.clientUid}, State:${Info.capturerState}
              Source:${Info.capturerInfo.source}, Flag:${Info.capturerInfo.capturerFlags},\n`;
      for (let j = 0; j < Info.deviceDescriptors.length; j++) {
        let descriptor = Info.deviceDescriptors[j];
        str += `__deviceDescriptors_${j}\n`;
        str += `Id:${descriptor.id}, Type:${descriptor.deviceType}, Role:${descriptor.deviceRole},
                Name:${descriptor.name}, Address:${descriptor.address}, SampleRates:${descriptor.sampleRates[0]},
                ChannelCounts:${descriptor.channelCounts[0]}, ChannelMask:${descriptor.channelMasks}\n`;
      }
      return str;
    }

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_0100
     * @tc.name      : AudioCapturer - on(type: 'inputDeviceChange', callback: Callback<AudioDeviceDescriptors>) - callback
     * @tc.desc      : AudioCapturer - on(type: 'inputDeviceChange', callback: Callback<AudioDeviceDescriptors>) - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_0100', 0, async function (done) {
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
        await audio.createAudioCapturer(AudioCapturerOptions).then((data)=>{
          audioCap = data;
        }).catch((err)=>{
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
        await getFd("capture_js-44100-2C-16B.pcm");
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created and start ERROR! ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        await audioCap.on('audioCapturerChange', (data) => {
          if (data.capturerState != audio.AudioState.STATE_RUNNING) {
            done();
          } else {
            expect(data.capturerState).assertEqual(audio.AudioState.STATE_RUNNING);
            expect(data.capturerInfo.source)
              .assertEqual(Number(AudioCapturerOptions.capturerInfo.source));
            expect(data.capturerInfo.capturerFlags).assertEqual(env.OUTPUT_NUMBER_0);
            expect(data.deviceDescriptors[0].id).assertLargerOrEqual(env.OUTPUT_NUMBER_0);
            expect(data.deviceDescriptors[0].deviceType).assertEqual(audio.DeviceType.MIC);
            expect(data.deviceDescriptors[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
            done();
          }
        });
        await audioCap.start();
      } catch (error) {
        console.error(`${Tag}: on-audioCapturerChange Fail: ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_0200
     * @tc.name      : AudioCapturer - on(type: 'inputDeviceChange', callback: Callback<AudioDeviceDescriptors>) - callback
     * @tc.desc      : AudioCapturer - on(type: 'inputDeviceChange', callback: Callback<AudioDeviceDescriptors>) - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_0200', 0, async function (done) {
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
        await audio.createAudioCapturer(AudioCapturerOptions).then((data)=>{
          audioCap = data;
        }).catch((err)=>{
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
        await getFd("capture_js-44100-2C-16B.pcm");
        await recordingFun(audioCap);
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        await audioCap.on('audioCapturerChange', (data) => {
          if (data == null) {
            console.info(`on audioCapturerChange error!`)
            expect(false).assertTrue();
            done();
          } else {
            expect(data.capturerState).assertEqual(audio.AudioState.STATE_STOPPED);
            done();
          }
        });
        await audioCap.stop();
      } catch (error) {
        console.error(`${Tag}: on-audioCapturerChange Fail: ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_0300
     * @tc.name      : AudioCapturer - on(type: 'inputDeviceChange', callback: Callback<AudioDeviceDescriptors>) - callback
     * @tc.desc      : AudioCapturer - on(type: 'inputDeviceChange', callback: Callback<AudioDeviceDescriptors>) - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_0300', 0, async function (done) {
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
        await audio.createAudioCapturer(AudioCapturerOptions).then((data)=>{
          audioCap = data;
        }).catch((err)=>{
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        console.info(`${Tag} on audioCapturerChange in, please change input device to set off it!`);
        await audioCap.on(env.INPUT_PARAMETER_TYPE_NUMBER, (data) => {
          console.error(`on audioCapturerChange error! test fail!`)
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.error(`${Tag}: on audioCapturerChange input parameter -1 ${error.message}, ${error.code}`);
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_401);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_0400
     * @tc.name      : AudioCapturer - on(type: 'inputDeviceChange', callback: Callback<AudioDeviceDescriptors>) - callback
     * @tc.desc      : AudioCapturer - on(type: 'inputDeviceChange', callback: Callback<AudioDeviceDescriptors>) - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_0400', 0, async function (done) {
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
        await audio.createAudioCapturer(AudioCapturerOptions).then((data)=>{
          audioCap = data;
        }).catch((err)=>{
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        console.info(`${Tag} on-audioCapturerChange in, please change input device to set off it!`);
        await audioCap.on(env.INVALID_PARAMETER_STRING, (data) => {
          console.info(`audioCapturerChange: Success, test fail !`)
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.error(`on-audioCapturerChange invalid parameter '123': ${error.message}, ${error.code}`);
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_6800101);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_0500
     * @tc.name      : AudioCapturer - on(type: 'inputDeviceChange', callback: Callback<AudioDeviceDescriptors>) - callback
     * @tc.desc      : AudioCapturer - on(type: 'inputDeviceChange', callback: Callback<AudioDeviceDescriptors>) - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_0500', 0, async function (done) {
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
        await audio.createAudioCapturer(AudioCapturerOptions).then((data)=>{
          audioCap = data;
        }).catch((err)=>{
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        await audioCap.on((data) => {
          console.info(`audioCapturerChange: Success! test fail!`)
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.error(`on-audioCapturerChange no input parameter: ${error.message}, ${error.code}`);
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_401);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_OFF_AUDIOCAPTURERCHANGE_0100
     * @tc.name      : AudioCapturer - off(type: 'inputDeviceChange', callback?: Callback<AudioDeviceDescriptors>) - callback
     * @tc.desc      : AudioCapturer - off(type: 'inputDeviceChange', callback?: Callback<AudioDeviceDescriptors>) - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_OFF_AUDIOCAPTURERCHANGE_0100', 0, async function (done) {
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
        await audio.createAudioCapturer(AudioCapturerOptions).then((data)=>{
          audioCap = data;
        }).catch((err)=>{
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created ERROR :  ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        console.info(`${Tag}off-audioCapturerChange in, please change input device to set off it!`);
        audioCap.off(env.INPUT_PARAMETER_TYPE_NUMBER, (data) => {
          console.info(`off-audioCapturerChange Success, test fail!`)
          expect(false).assertTrue();
          done()
        });
      } catch (error) {
        console.info(`off-audioCapturerChange input parameter type -1: ${error.message}, ${error.code}`)
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_6800101);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_OFF_AUDIOCAPTURERCHANGE_0200
     * @tc.name      : AudioCapturer - off(type: 'inputDeviceChange', callback?: Callback<AudioDeviceDescriptors>) - callback
     * @tc.desc      : AudioCapturer - off(type: 'inputDeviceChange', callback?: Callback<AudioDeviceDescriptors>) - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_OFF_AUDIOCAPTURERCHANGE_0200', 0, async function (done) {
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
        await audio.createAudioCapturer(AudioCapturerOptions).then((data)=>{
          audioCap = data;
        }).catch((err)=>{
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        console.info(`${Tag} off-audioCapturerChange in, please change input device to set off it!`);
        audioCap.off(env.INVALID_PARAMETER_STRING, (data) => {
          console.info(`off-audioCapturerChange: Success, test fail!`)
          expect(false).assertTrue();
          done()
        });
      } catch (error) {
        console.info(`off-audioCapturerChange invalid parameter type '123': ${error.message}, ${error.code}`)
        expect(Number(error.code)).assertEqual(env.UNSUPORTED_OPTION_6800104);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_OFF_AUDIOCAPTURERCHANGE_0300
     * @tc.name      : AudioCapturer - off(type: 'inputDeviceChange', callback?: Callback<AudioDeviceDescriptors>) - callback
     * @tc.desc      : AudioCapturer - off(type: 'inputDeviceChange', callback?: Callback<AudioDeviceDescriptors>) - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_OFF_AUDIOCAPTURERCHANGE_0300', 0, async function (done) {
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
        await audio.createAudioCapturer(AudioCapturerOptions).then((data)=>{
          audioCap = data;
        }).catch((err)=>{
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done()
      }
      try {
        console.info(`${Tag} off-audioCapturerChange in, please change input device to set off it!`);
        audioCap.off((data) => {
          console.info(`off-audioCapturerChange: Success, test fail!`)
          expect(false).assertTrue();
          done()
        });
      } catch (error) {
        console.info(`off-audioCapturerChange no input parameter: ${error.message}, ${error.code}`)
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_6800101);
        done();
      }
    })
  })
}