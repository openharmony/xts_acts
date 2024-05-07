/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import testStreamBuilder from 'libohaudiondk.so';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs';
import Utils from './Utils';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import { Component, Driver, ON } from '@ohos.UiTest';

let rateValue: number = 48000;
let channelCount: number = 2;
let encodingType: number = 0;
let latencyMode: number = 1;
let frameSizeValue: number = 240;
let sampleFormat: number = 0;

let sleep500: number = 500;
let sleep1000: number = 1000;
let sleep3000: number = 3000;

let channelTwo: number = 2;

let AUDIOSTREAM_TYPE_CAPTURER: number = 1;
let AUDIOSTREAM_TYPE_RENDERER: number = 0;

let AUDIOSTREAM_LATENCY_MODE_NORMAL: number = 0;
let AUDIOSTREAM_LATENCY_MODE_FAST: number = 1;

let AUDIOSTREAM_SAMPLE_U8: number = 0;
let AUDIOSTREAM_SAMPLE_S16LE: number = 1;
let AUDIOSTREAM_SAMPLE_S24LE: number = 2;
let AUDIOSTREAM_SAMPLE_S32LE: number = 3;

let AUDIOSTREAM_ENCODING_INVALID: number = (-1);
let AUDIOSTREAM_ENCODING_TYPE_RAW: number = 0;
let AUDIOSTREAM_ENCODING_TYPE_OTHER: number = 1;

let AUDIOSTREAM_STATE_INVALID: number = (-1);
let AUDIOSTREAM_STATE_NEW: number = 0;
let AUDIOSTREAM_STATE_PREPARED: number = 1;
let AUDIOSTREAM_STATE_RUNNING: number = 2;
let AUDIOSTREAM_STATE_STOPPED: number = 3;
let AUDIOSTREAM_STATE_PAUSED: number = 5;

let indexZero: number = 0;
let indexOne: number = 1;
let indexTwo: number = 2;
let indexThree: number = 3;
let indexFour: number = 4;
let indexFive: number = 5;

let numberTwo: number = 2;
let numberThree: number = 3;
let numberFour: number = 4;
let numberFive: number = 5;
let numberSeven: number = 7;
let numberEight: number = 8;
let numberNine: number = 9;
let numberTen: number = 10;
let numberNinety: number = 90;

let number1500: number = 1500;
let number44100: number = 44100;
let number48000: number = 48000;

let CODE_SUCCESS: number = 200;
let AUDIOSTREAM_SUCCESS: number = 0;
let AUDIOSTREAM_ERROR_ILLEGAL_STATE: number = 2;
let AUDIOSTREAM_ERROR_INVALID_PARAM: number = 1;

let AUDIOSTREAM_SOURCE_TYPE_INVALID: number = (-1);
let AUDIOSTREAM_SOURCE_TYPE_MIC: number = 0;
let AUDIOSTREAM_SOURCE_TYPE_VOICE_RECOGNITION: number = 1;
let AUDIOSTREAM_SOURCE_TYPE_PLAYBACK_CAPTURE: number = 2;
let AUDIOSTREAM_SOURCE_TYPE_VOICE_COMMUNICATION: number = 7;
function getContext(): Context {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  return context;
}

function getAudioCapturerParam(hasTimestamp: boolean = true): boolean {
  let rerult = true;
  let re: number = testStreamBuilder.OHAudioCapturerGetCapturerInfo();
  if (re < 0) {
    rerult = false;
  }
  re = testStreamBuilder.OHAudioCapturerGetChannelCount();
  if (re < 0) {
    rerult = false;
  }
  re = testStreamBuilder.OHAudioCapturerGetEncodingType();
  if (re < 0) {
    rerult = false;
  }
  re = testStreamBuilder.OHAudioCapturerGetFrameSizeInCallback();
  if (re < 0) {
    rerult = false;
  }
  re = testStreamBuilder.OHAudioCapturerGetFramesRead();
  if (re < 0) {
    rerult = false;
  }
  re = testStreamBuilder.OHAudioCapturerGetLatencyMode();
  if (re < 0) {
    rerult = false;
  }
  re = testStreamBuilder.OHAudioCapturerGetSampleFormat();
  if (re < 0) {
    rerult = false;
  }
  re = testStreamBuilder.OHAudioCapturerGetSamplingRate();
  if (re < 0) {
    rerult = false;
  }
  re = testStreamBuilder.OHAudioCapturerGetStreamId();
  if (re < 0) {
    rerult = false;
  }
  if (hasTimestamp) {
    re = testStreamBuilder.OHAudioCapturerGetFramePosition();
    if (re < 0) {
      rerult = false;
    }
    re = testStreamBuilder.OHAudioCapturerGetTimestamp();
    if (re < 0) {
      rerult = false;
    }
  }
  return rerult;
}

function verifyCapturerProperties(): boolean {
  let rerult = true;
  let re: number = testStreamBuilder.OHAudioCapturerGetCapturerInfo();
  if (re < 0) {
    rerult = false;
  }

  re = testStreamBuilder.OHAudioCapturerGetChannelCount();
  if (re < 0) {
    rerult = false;
  } else {
    expect(re).assertEqual(channelCount);
  }
  re = testStreamBuilder.OHAudioCapturerGetEncodingType();
  if (re < 0) {
    rerult = false;
  } else {
    expect(re).assertEqual(AUDIOSTREAM_ENCODING_TYPE_RAW);
  }
  re = testStreamBuilder.OHAudioCapturerGetFrameSizeInCallback();
  if (re < 0) {
    rerult = false;
  } else {
    expect(re).assertEqual(frameSizeValue);
  }

  re = testStreamBuilder.OHAudioCapturerGetFramesRead();
  if (re < 0) {
    rerult = false;
  }

  re = testStreamBuilder.OHAudioCapturerGetLatencyMode();
  if (re < 0) {
    rerult = false;
  } else {
    expect(re).assertEqual(latencyMode);
  }
  re = testStreamBuilder.OHAudioCapturerGetSampleFormat();
  if (re < 0) {
    rerult = false;
  } else {
    expect(re).assertEqual(sampleFormat);
  }
  re = testStreamBuilder.OHAudioCapturerGetSamplingRate();
  if (re < 0) {
    rerult = false;
  } else {
    expect(re).assertEqual(rateValue);
  }

  re = testStreamBuilder.OHAudioCapturerGetStreamId();
  if (re < 0) {
    rerult = false;
  }
  re = testStreamBuilder.OHAudioCapturerGetFramePosition();
  if (re < 0) {
    rerult = false;
  }
  re = testStreamBuilder.OHAudioCapturerGetTimestamp();
  if (re < 0) {
    rerult = false;
  }
  return rerult;
}

function creatPcmFile(): boolean {
  let pcmList: string[] = ['S16LE.pcm', 'S16LE_1_8000.pcm', 'S16LE_1_16000.pcm', 'S16LE_1_22050.pcm', 'S16LE_1_24000.pcm', 'S32LE.pcm', 'S32LE_2.pcm'];

  for (let i: number = 0; i < pcmList.length; i++) {
    let fileName: string = pcmList[i];
    try {
      let context = getContext();
      let dir = context.filesDir + '/';
      let ml_face_model_file = dir + fileName;
      context.resourceManager.getRawFileContent(fileName, (error, model_buffer) => {
        if (error) {
          console.log(
            `[pcmfile_copy_to_sandbox] S16LE.pcm is
              copy failed:${error.code}, message: ${error.message}.`
          );
        } else {
          let file = fs.openSync(ml_face_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          fs.writeSync(file.fd, model_buffer.buffer);
          fs.closeSync(file);
          console.log(`[pcmfile_copy_to_sandbox] ${fileName} is copy success`);
        }
      });
      console.info('[pcmfile_copy_to_sandbox] sandbox path:' + dir);
    } catch (error) {
      console.info('[pcmfile_copy_to_sandbox] getRawFileDescriptor api run failed' + error);
    }
  }
  return true;
}

export default function OhCapturerTest() {
  let aff = async (done: Function) => {
    let context = AppStorage.get('context') as Context;
    console.log('getPermission beforeAll');
    let list: Array<Permissions> = ['ohos.permission.MICROPHONE'];
    let atManager = abilityAccessCtrl.createAtManager();
    atManager.requestPermissionsFromUser(context, list, (err, result) => {
      if (err) {
        console.log(`getPermission err ${JSON.stringify(err)}`);
      } else {
        console.log(`getPermission success`);
      }
      done();
    });
    const driver: Driver = Driver.create();
    await driver.delayMs(number1500);
    const AllowBtn: Component = await driver.findComponent(ON.text('允许'));
    if (AllowBtn) {
      await AllowBtn.click();
    }
  };

  describe('OHCaptureTest',() => {
    beforeAll(async (done: Function) => {
      aff(done);
      await Utils.sleep(sleep3000);
      done();
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(() => {
      console.info('afterEach case');
    });
    afterAll(async (done: Function) => {
      console.info('afterAll case');
      let re: number = testStreamBuilder.CloseAudioCapture();
      if (re === CODE_SUCCESS || re === AUDIOSTREAM_SUCCESS) {
        console.log('[capturer] Close：', re);
      }
      done();
    });
    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERCREATE_0100
     * @tc.name   ：TestOHAudioStreamBuilderCreate0100
     * @tc.desc   ：Create an audio stream constructor of input or output type.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderCreate0100', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderCreate0100 test start `);
      let re: number | null = await testStreamBuilder.OHAudioStreamBuilderCreate(AUDIOSTREAM_TYPE_CAPTURER);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderCreate0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERCREATE_0200
     * @tc.name   ：TestOHAudioStreamBuilderCreate0200
     * @tc.desc   ：Create an audio stream constructor of input or output type.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderCreate0200', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderCreate0200 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderCreate(AUDIOSTREAM_TYPE_RENDERER);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderCreate0200 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERGENERATERENDERER_0100
     * @tc.name   ：TestOHAudioStreamBuilderGenerateRenderer0100
     * @tc.desc   ：Create an output audio stream instance.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderGenerateRenderer0100', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderGenerateRenderer0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderGenerateRenderer();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderGenerateRenderer0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERGENERATECAPTURER_0100
     * @tc.name   ：TestOHAudioStreamBuilderGenerateCapturer0100
     * @tc.desc   ：Create an input audio stream instance.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderGenerateCapturer0100', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderGenerateCapturer0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderGenerateCapturer();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderGenerateCapturer0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCAPTURERCALLBACK_0100
     * @tc.name   ：TestOHAudioStreamBuilderSetCapturerCallback0100
     * @tc.desc   ：Set the callback for the input audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetCapturerCallback0100', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetCapturerCallback0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetCapturerCallback();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetCapturerCallback0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCHANNELCOUNT_0100
     * @tc.name   ：TestOHAudioStreamBuilderSetChannelCount0100
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetChannelCount0100', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetChannelCount0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetChannelCount(AUDIOSTREAM_TYPE_RENDERER, numberTwo);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetChannelCount0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCHANNELCOUNT_0200
     * @tc.name   ：TestOHAudioStreamBuilderSetChannelCount0200
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetChannelCount0200', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetChannelCount0200 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetChannelCount(AUDIOSTREAM_TYPE_CAPTURER, numberTwo);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetChannelCount0200 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCHANNELCOUNT_0300
     * @tc.name   ：TestOHAudioStreamBuilderSetChannelCount0300
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetChannelCount0300', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetChannelCount0300 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetChannelCount(AUDIOSTREAM_TYPE_RENDERER, numberFour);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetChannelCount0300 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCHANNELCOUNT_0400
     * @tc.name   ：TestOHAudioStreamBuilderSetChannelCount0400
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetChannelCount0400', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetChannelCount0400 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetChannelCount(AUDIOSTREAM_TYPE_RENDERER, numberEight);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetChannelCount0400 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCHANNELCOUNT_0500
     * @tc.name   ：TestOHAudioStreamBuilderSetChannelCount0500
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetChannelCount0500', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetChannelCount0500 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetChannelCount(AUDIOSTREAM_TYPE_RENDERER, numberNine);
      expect(re).assertEqual(1);
      console.log(`testOHAudioStreamBuilderSetChannelCount0500 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCHANNELCOUNT_0600
     * @tc.name   ：TestOHAudioStreamBuilderSetChannelCount0600
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetChannelCount0600', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetChannelCount0600 test start `);
      testStreamBuilder.CreateAudioCapturerRecorder(indexOne);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetChannelCount(AUDIOSTREAM_TYPE_CAPTURER, numberEight);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetChannelCount0600 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCHANNELCOUNT_0700
     * @tc.name   ：TestOHAudioStreamBuilderSetChannelCount0700
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetChannelCount0700', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetChannelCount0700 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetChannelCount(AUDIOSTREAM_TYPE_CAPTURER, numberNine);
      expect(re).assertEqual(1);
      console.log(`testOHAudioStreamBuilderSetChannelCount0700 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETENCODINGTYPE_0100
     * @tc.name   ：TestOHAudioStreamBuilderSetEncodingType0100
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetEncodingType0100', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetEncodingType0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetEncodingType(AUDIOSTREAM_TYPE_RENDERER, AUDIOSTREAM_ENCODING_TYPE_OTHER);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetEncodingType0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETENCODINGTYPE_0200
     * @tc.name   ：TestOHAudioStreamBuilderSetEncodingType0200
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetEncodingType0200', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetEncodingType0200 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetEncodingType(AUDIOSTREAM_TYPE_RENDERER, AUDIOSTREAM_ENCODING_INVALID);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetEncodingType0200 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETENCODINGTYPE_0300
     * @tc.name   ：TestOHAudioStreamBuilderSetEncodingType0300
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetEncodingType0300', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetEncodingType0300 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetEncodingType(AUDIOSTREAM_TYPE_RENDERER, AUDIOSTREAM_ENCODING_TYPE_RAW);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetEncodingType0300 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETENCODINGTYPE_0400
     * @tc.name   ：TestOHAudioStreamBuilderSetEncodingType0400
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetEncodingType0400', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetEncodingType0400 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetEncodingType(AUDIOSTREAM_TYPE_CAPTURER, AUDIOSTREAM_ENCODING_TYPE_RAW);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetEncodingType0400 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETENCODINGTYPE_0500
     * @tc.name   ：TestOHAudioStreamBuilderSetEncodingType0500
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetEncodingType0500', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetEncodingType0500 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetEncodingType(AUDIOSTREAM_TYPE_CAPTURER, AUDIOSTREAM_ENCODING_INVALID);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetEncodingType0500 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETFRAMESIZEINCALLBACK_0100
     * @tc.name   ：TestOHAudioStreamBuilderSetFrameSizeInCallback0100
     * @tc.desc   ：Set the frame length for each callback, which should be at least the size of the data processed by the audio hardware once and less than half of the internal buffer capacity.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetFrameSizeInCallback0100', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetFrameSizeInCallback(AUDIOSTREAM_TYPE_CAPTURER, 0);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETFRAMESIZEINCALLBACK_0200
     * @tc.name   ：TestOHAudioStreamBuilderSetFrameSizeInCallback0200
     * @tc.desc   ：Set the frame length for each callback, which should be at least the size of the data processed by the audio hardware once and less than half of the internal buffer capacity.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetFrameSizeInCallback0200', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback0200 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetFrameSizeInCallback(AUDIOSTREAM_TYPE_RENDERER, numberTwo);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback0200 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETFRAMESIZEINCALLBACK_0300
     * @tc.name   ：TestOHAudioStreamBuilderSetFrameSizeInCallback0300
     * @tc.desc   ：Set the frame length for each callback, which should be at least the size of the data processed by the audio hardware once and less than half of the internal buffer capacity.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetFrameSizeInCallback0300', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback0300 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetFrameSizeInCallback(AUDIOSTREAM_TYPE_RENDERER, numberThree);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback0300 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETFRAMESIZEINCALLBACK_0400
     * @tc.name   ：TestOHAudioStreamBuilderSetFrameSizeInCallback0400
     * @tc.desc   ：Set the frame length for each callback, which should be at least the size of the data processed by the audio hardware once and less than half of the internal buffer capacity.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetFrameSizeInCallback0400', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback0400 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetFrameSizeInCallback(AUDIOSTREAM_TYPE_RENDERER, numberFour);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback0400 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETFRAMESIZEINCALLBACK_0500
     * @tc.name   ：TestOHAudioStreamBuilderSetFrameSizeInCallback0500
     * @tc.desc   ：Set the frame length for each callback, which should be at least the size of the data processed by the audio hardware once and less than half of the internal buffer capacity.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetFrameSizeInCallback0500', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback0500 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetFrameSizeInCallback(AUDIOSTREAM_TYPE_CAPTURER, 0);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback0500 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETFRAMESIZEINCALLBACK_0600
     * @tc.name   ：TestOHAudioStreamBuilderSetFrameSizeInCallback0600
     * @tc.desc   ：Set the frame length for each callback, which should be at least the size of the data processed by the audio hardware once and less than half of the internal buffer capacity.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetFrameSizeInCallback0600', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback0600 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetFrameSizeInCallback(AUDIOSTREAM_TYPE_CAPTURER, 1);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback0600 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETFRAMESIZEINCALLBACK_0700
     * @tc.name   ：TestOHAudioStreamBuilderSetFrameSizeInCallback0700
     * @tc.desc   ：Set the frame length for each callback, which should be at least the size of the data processed by the audio hardware once and less than half of the internal buffer capacity.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetFrameSizeInCallback0700', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback0700 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetFrameSizeInCallback(AUDIOSTREAM_TYPE_CAPTURER, numberTwo);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback0700 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETFRAMESIZEINCALLBACK_0800
     * @tc.name   ：TestOHAudioStreamBuilderSetFrameSizeInCallback0800
     * @tc.desc   ：Set the frame length for each callback, which should be at least the size of the data processed by the audio hardware once and less than half of the internal buffer capacity.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetFrameSizeInCallback0800', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback0800 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetFrameSizeInCallback(AUDIOSTREAM_TYPE_CAPTURER, numberThree);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback0800 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETFRAMESIZEINCALLBACK_0900
     * @tc.name   ：TestOHAudioStreamBuilderSetFrameSizeInCallback0900
     * @tc.desc   ：Set the frame length for each callback, which should be at least the size of the data processed by the audio hardware once and less than half of the internal buffer capacity.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetFrameSizeInCallback0900', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback0900 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetFrameSizeInCallback(AUDIOSTREAM_TYPE_CAPTURER, numberFour);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetFrameSizeInCallback0900 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETLATENCYMODE_0100
     * @tc.name   ：TestOHAudioStreamBuilderSetLatencyMode0100
     * @tc.desc   ：Set the delay mode for the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetLatencyMode0100', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetLatencyMode0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetLatencyMode(AUDIOSTREAM_TYPE_RENDERER, AUDIOSTREAM_LATENCY_MODE_NORMAL);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetLatencyMode0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETLATENCYMODE_0200
     * @tc.name   ：TestOHAudioStreamBuilderSetLatencyMode0200
     * @tc.desc   ：Set the delay mode for the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetLatencyMode0200', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetLatencyMode0200 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetLatencyMode(AUDIOSTREAM_TYPE_RENDERER, AUDIOSTREAM_LATENCY_MODE_FAST);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetLatencyMode0200 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETLATENCYMODE_0300
     * @tc.name   ：TestOHAudioStreamBuilderSetLatencyMode0300
     * @tc.desc   ：Set the delay mode for the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetLatencyMode0300', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetLatencyMode0300 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetLatencyMode(AUDIOSTREAM_TYPE_RENDERER, numberTwo);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetLatencyMode0300 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETLATENCYMODE_0400
     * @tc.name   ：TestOHAudioStreamBuilderSetLatencyMode0400
     * @tc.desc   ：Set the delay mode for the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetLatencyMode0400', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetLatencyMode0400 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetLatencyMode(AUDIOSTREAM_TYPE_CAPTURER, AUDIOSTREAM_LATENCY_MODE_FAST);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetLatencyMode0400 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETLATENCYMODE_0500
     * @tc.name   ：TestOHAudioStreamBuilderSetLatencyMode0600
     * @tc.desc   ：Set the delay mode for the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetLatencyMode0500', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetLatencyMode0500 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetLatencyMode(AUDIOSTREAM_TYPE_CAPTURER, numberTwo);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetLatencyMode0500 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERCALLBACK_0100
     * @tc.name   ：TestOHAudioStreamBuilderSetRendererCallback0100
     * @tc.desc   ：Set the callback for outputting audio streams.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetRendererCallback0100', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererCallback0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetRendererCallback();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererCallback0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLEFORMAT_0100
     * @tc.name   ：TestOHAudioStreamBuilderSetSampleFormat0100
     * @tc.desc   ：Set the sampling format properties of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSampleFormat0100', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSampleFormat0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSampleFormat(AUDIOSTREAM_TYPE_RENDERER, AUDIOSTREAM_SAMPLE_U8);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSampleFormat0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLEFORMAT_0200
     * @tc.name   ：TestOHAudioStreamBuilderSetSampleFormat0200
     * @tc.desc   ：Set the sampling format properties of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSampleFormat0200', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSampleFormat0200 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSampleFormat(AUDIOSTREAM_TYPE_RENDERER, AUDIOSTREAM_SAMPLE_S16LE);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSampleFormat0200 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLEFORMAT_0300
     * @tc.name   ：TestOHAudioStreamBuilderSetSampleFormat0300
     * @tc.desc   ：Set the sampling format properties of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSampleFormat0300', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSampleFormat0300 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSampleFormat(AUDIOSTREAM_TYPE_RENDERER, AUDIOSTREAM_SAMPLE_S24LE);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSampleFormat0300 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLEFORMAT_0400
     * @tc.name   ：TestOHAudioStreamBuilderSetSampleFormat0400
     * @tc.desc   ：Set the sampling format properties of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSampleFormat0400', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSampleFormat0400 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSampleFormat(AUDIOSTREAM_TYPE_RENDERER, AUDIOSTREAM_SAMPLE_S32LE);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSampleFormat0400 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLEFORMAT_0500
     * @tc.name   ：TestOHAudioStreamBuilderSetSampleFormat0500
     * @tc.desc   ：Set the sampling format properties of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSampleFormat0500', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSampleFormat0500 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSampleFormat(AUDIOSTREAM_TYPE_RENDERER, numberFour);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSampleFormat0500 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLEFORMAT_0600
     * @tc.name   ：TestOHAudioStreamBuilderSetSampleFormat0600
     * @tc.desc   ：Set the sampling format properties of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSampleFormat0600', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSampleFormat0600 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSampleFormat(AUDIOSTREAM_TYPE_CAPTURER, AUDIOSTREAM_SAMPLE_U8);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSampleFormat0600 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLEFORMAT_0700
     * @tc.name   ：TestOHAudioStreamBuilderSetSampleFormat0700
     * @tc.desc   ：Set the sampling format properties of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSampleFormat0700', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSampleFormat0700 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSampleFormat(AUDIOSTREAM_TYPE_CAPTURER, AUDIOSTREAM_SAMPLE_S24LE);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSampleFormat0700 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLEFORMAT_0800
     * @tc.name   ：TestOHAudioStreamBuilderSetSampleFormat0800
     * @tc.desc   ：Set the sampling format properties of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSampleFormat0800', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSampleFormat0800 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSampleFormat(AUDIOSTREAM_TYPE_CAPTURER, AUDIOSTREAM_SAMPLE_S32LE);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSampleFormat0800 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLEFORMAT_0900
     * @tc.name   ：TestOHAudioStreamBuilderSetSampleFormat0900
     * @tc.desc   ：Set the sampling format properties of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSampleFormat0900', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSampleFormat0900 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSampleFormat(AUDIOSTREAM_TYPE_CAPTURER, numberNinety);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSampleFormat0900 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLINGRATE_0100
     * @tc.name   ：TestOHAudioStreamBuilderSetSamplingRate0100
     * @tc.desc   ：Set the sampling rate property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSamplingRate0100', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSamplingRate0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSamplingRate(AUDIOSTREAM_TYPE_CAPTURER , number44100);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSamplingRate0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLINGRATE_0200
     * @tc.name   ：TestOHAudioStreamBuilderSetSamplingRate0200
     * @tc.desc   ：Set the sampling rate property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSamplingRate0200', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSamplingRate0200 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSamplingRate(AUDIOSTREAM_TYPE_CAPTURER , -1);
      expect(re).assertEqual(1);
      console.log(`testOHAudioStreamBuilderSetSamplingRate0200 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLINGRATE_0300
     * @tc.name   ：TestOHAudioStreamBuilderSetSamplingRate0300
     * @tc.desc   ：Set the sampling rate property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSamplingRate0300', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSamplingRate0300 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSamplingRate(AUDIOSTREAM_TYPE_RENDERER, number44100);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSamplingRate0300 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLINGRATE_0400
     * @tc.name   ：TestOHAudioStreamBuilderSetSamplingRate0400
     * @tc.desc   ：Set the sampling rate property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSamplingRate0400', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSamplingRate0400 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSamplingRate(AUDIOSTREAM_TYPE_RENDERER, number48000);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSamplingRate0400 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLINGRATE_0500
     * @tc.name   ：TestOHAudioStreamBuilderSetSamplingRate0500
     * @tc.desc   ：Set the sampling rate property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSamplingRate0500', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSamplingRate0500 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSamplingRate(AUDIOSTREAM_TYPE_RENDERER, -1);
      expect(re).assertEqual(1);
      console.log(`testOHAudioStreamBuilderSetSamplingRate0500 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDEREROUTPUTDEVICECHANGECALLBACK_0100
     * @tc.name   ：TestOHAudioStreamBuilderSetRendererOutputDeviceChangeCallback0100
     * @tc.desc   ：Set input stream device callback function.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetRendererOutputDeviceChangeCallback0100', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererOutputDeviceChangeCallback0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetRendererOutputDeviceChangeCallback();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererOutputDeviceChangeCallback0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCAPTURERINFO_0200
     * @tc.name   ：TestOHAudioStreamBuilderSetCapturerInfo0200
     * @tc.desc   ：Set the working scenario for the input audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetCapturerInfo0200', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetCapturerInfo0200 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetCapturerInfo(AUDIOSTREAM_SOURCE_TYPE_INVALID);
      expect(re).assertEqual(AUDIOSTREAM_ERROR_INVALID_PARAM);
      console.log(`testOHAudioStreamBuilderSetCapturerInfo0200 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCAPTURERINFO_0300
     * @tc.name   ：TestOHAudioStreamBuilderSetCapturerInfo0300
     * @tc.desc   ：Set the working scenario for the input audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetCapturerInfo0300', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetCapturerInfo0300 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetCapturerInfo(AUDIOSTREAM_SOURCE_TYPE_MIC);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS); // 正确结果：0
      console.log(`testOHAudioStreamBuilderSetCapturerInfo0300 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCAPTURERINFO_0400
     * @tc.name   ：TestOHAudioStreamBuilderSetCapturerInfo0400
     * @tc.desc   ：Set the working scenario for the input audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetCapturerInfo0400', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetCapturerInfo0400 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetCapturerInfo(AUDIOSTREAM_SOURCE_TYPE_VOICE_RECOGNITION);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS); // 正确结果：0
      console.log(`testOHAudioStreamBuilderSetCapturerInfo0400 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCAPTURERINFO_0500
     * @tc.name   ：TestOHAudioStreamBuilderSetCapturerInfo0500
     * @tc.desc   ：Set the working scenario for the input audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetCapturerInfo0500', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetCapturerInfo0500 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetCapturerInfo(AUDIOSTREAM_SOURCE_TYPE_PLAYBACK_CAPTURE);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetCapturerInfo0500 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCAPTURERINFO_0600
     * @tc.name   ：TestOHAudioStreamBuilderSetCapturerInfo0600
     * @tc.desc   ：Set the working scenario for the input audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetCapturerInfo0600', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetCapturerInfo0600 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetCapturerInfo(AUDIOSTREAM_SOURCE_TYPE_VOICE_COMMUNICATION);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetCapturerInfo0600 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETCAPTURERINFO_0100
     * @tc.name   ：TestOHAudioStreamBuilderSetCapturerInfo0100
     * @tc.desc   ：Set the working scenario for the input audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetCapturerInfo0100', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetCapturerInfo0100 test start `);
      let re: number = testStreamBuilder.OHAudioStreamBuilderSetCapturerInfo(AUDIOSTREAM_SOURCE_TYPE_MIC);
      expect(re === AUDIOSTREAM_SUCCESS).assertTrue();
      console.log(`testOHAudioStreamBuilderSetCapturerInfo0100 test end `);
      done();
    });
    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETENCODINGTYPE_0600
     * @tc.name   ：TestOHAudioStreamBuilderSetEncodingType0600
     * @tc.desc   ：Set the channel count property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetEncodingType0600', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetEncodingType0600 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetEncodingType(AUDIOSTREAM_TYPE_CAPTURER, AUDIOSTREAM_ENCODING_TYPE_OTHER);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetEncodingType0600 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETLATENCYMODE_0600
     * @tc.name   ：TestOHAudioStreamBuilderSetLatencyMode0600
     * @tc.desc   ：Set the delay mode for the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetLatencyMode0600', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetLatencyMode0600 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetLatencyMode(AUDIOSTREAM_TYPE_CAPTURER, AUDIOSTREAM_LATENCY_MODE_NORMAL);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetLatencyMode0600 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLEFORMAT_1000
     * @tc.name   ：TestOHAudioStreamBuilderSetSampleFormat1000
     * @tc.desc   ：Set the sampling format properties of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSampleFormat1000', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSampleFormat1000 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSampleFormat(AUDIOSTREAM_TYPE_CAPTURER, 1);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSampleFormat1000 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETSAMPLINGRATE_0600
     * @tc.name   ：TestOHAudioStreamBuilderSetSamplingRate0600
     * @tc.desc   ：Set the sampling rate property of the audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetSamplingRate0600', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetSamplingRate0600 test start `);
      let re: number | null = testStreamBuilder.OHAudioStreamBuilderSetSamplingRate(AUDIOSTREAM_TYPE_CAPTURER , number48000);
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetSamplingRate0600 test end `);
      done();
    });
  });

  describe('OhAudioCapturerRunTest', () => {
    beforeAll(async (done: Function) => {
      await creatPcmFile();
      await aff(done);
      await Utils.sleep(sleep3000);
      done();
    });
    beforeEach(async (done: Function) => {
      console.info('beforeEach case');
      done();
    });
    afterEach(async (done: Function) => {
      console.info('afterEach case');
      done();
    });
    afterAll(async (done: Function) => {
      console.info('afterAll case');
      await testStreamBuilder.CloseAudioCapture();
      done();
    });
    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETCURRENTSTATE_0100
     * @tc.name   ：TestOHAudioCapturerGetCurrentState0100
     * @tc.desc   ：Query the current audio stream status.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetCurrentState0100', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetCurrentState0100 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      expect(re).assertEqual(CODE_SUCCESS);
      re = await testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re).assertEqual(AUDIOSTREAM_STATE_PREPARED);
      console.log(`testOHAudioCapturerGetCurrentState0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERSTART_0100
     * @tc.name   ：TestOHAudioCapturerStart0100
     * @tc.desc   ：Start obtaining audio data.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerStart0100', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerStart0100 test start `);
      let re: number = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioCapturerStart0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETCURRENTSTATE_0200
     * @tc.name   ：TestOHAudioCapturerGetCurrentState0200
     * @tc.desc   ：Query the current audio stream status.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetCurrentState0200', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetCurrentState0200 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      console.log(`testOHAudioCapturerGetCurrentState0200 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETSAMPLEFORMAT_0100
     * @tc.name   ：TestOHAudioCapturerGetSampleFormat0100
     * @tc.desc   ：Query the current input audio stream sampling format.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetSampleFormat0100', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetSampleFormat0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetSampleFormat();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED || re === numberTwo || re === numberThree).assertTrue();
      console.log(`testOHAudioCapturerGetSampleFormat0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERPAUSE_0100
     * @tc.name   ：TestOHAudioCapturerPause0100
     * @tc.desc   ：Pause input audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerPause0100', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerPause0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS); // 正确结果：0
      console.log(`testOHAudioCapturerPause0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETCURRENTSTATE_0300
     * @tc.name   ：TestOHAudioCapturerGetCurrentState0300
     * @tc.desc   ：Query the current audio stream status.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetCurrentState0300', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetCurrentState0300 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED || re === AUDIOSTREAM_STATE_PAUSED).assertTrue();
      console.log(`testOHAudioCapturerGetCurrentState0300 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETCHANNELCOUNT_0100
     * @tc.name   ：TestOHAudioCapturerGetChannelCount0100
     * @tc.desc   ：Query the current number of audio channels.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetChannelCount0100', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetChannelCount0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetChannelCount();
      expect(re).assertEqual(channelCount); // 正确结果：2
      console.log(`testOHAudioCapturerGetChannelCount0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETCAPTURERINFO_0100
     * @tc.name   ：TestOHAudioCapturerGetCapturerInfo0100
     * @tc.desc   ：Query the current audio streaming workspace type.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetCapturerInfo0100', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetCapturerInfo0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetCapturerInfo();
      expect(re === 0 || re === 1 || re === numberTwo || re === numberSeven).assertTrue(); // 正确结果：0、1、2、7
      console.log(`testOHAudioCapturerGetCapturerInfo0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETENCODINGTYPE_0100
     * @tc.name   ：TestOHAudioCapturerGetEncodingType0100
     * @tc.desc   ：Query the current audio stream encoding type.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetEncodingType0100', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetEncodingType0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetEncodingType();
      expect(re).assertEqual(encodingType);
      console.log(`testOHAudioCapturerGetEncodingType0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETFRAMESIZEINCALLBACK_0100
     * @tc.name   ：TestOHAudioCapturerGetFrameSizeInCallback0100
     * @tc.desc   ：Query the frame size in the callback, which is the fixed length of the buffer returned by each callback.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetFrameSizeInCallback0100', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetFrameSizeInCallback0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetFrameSizeInCallback();
      expect(re).assertLarger(0);
      console.log(`testOHAudioCapturerGetFrameSizeInCallback0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETFRAMESREAD_0100
     * @tc.name   ：TestOHAudioCapturerGetFramesRead0100
     * @tc.desc   ：Query the number of frames read since self created streaming.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetFramesRead0100', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetFramesRead0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetFramesRead();
      expect(re).assertLarger(-1);
      console.log(`testOHAudioCapturerGetFramesRead0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETLATENCYMODE_0200
     * @tc.name   ：TestOHAudioCapturerGetLatencyMode0200
     * @tc.desc   ：Query the current audio stream delay mode.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetLatencyMode0200', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetLatencyMode0200 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetLatencyMode();
      expect(re === AUDIOSTREAM_LATENCY_MODE_NORMAL || re === AUDIOSTREAM_LATENCY_MODE_FAST ).assertTrue();
      console.log(`testOHAudioCapturerGetLatencyMode0200 test end `);
      done();
    });
    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETSAMPLINGRATE_0100
     * @tc.name   ：TestOHAudioCapturerGetSamplingRate0100
     * @tc.desc   ：Query the current input audio stream sampling rate.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetSamplingRate0100', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetSamplingRate0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetSamplingRate();
      expect(re).assertEqual(rateValue);
      console.log(`testOHAudioCapturerGetSamplingRate0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETSTREAMID_0100
     * @tc.name   ：TestOHAudioCapturerGetStreamId0100
     * @tc.desc   ：Query the current input audio stream ID.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetStreamId0100', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetStreamId0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetStreamId();
      expect(re).assertLarger(0);
      console.log(`testOHAudioCapturerGetStreamId0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETTIMESTAMP_0100
     * @tc.name   ：TestOHAudioCapturerGetTimestamp0100
     * @tc.desc   ：Obtain input audio stream timestamp and location information.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetTimestamp0100', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetTimestamp0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetTimestamp();
      expect(re).assertLarger(0);
      console.log(`testOHAudioCapturerGetTimestamp0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETFRAMEPOSITION_0100
     * @tc.name   ：TestOHAudioCapturerGetFramePosition0100
     * @tc.desc   ：Obtain input audio stream timestamp and location information.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetFramePosition0100', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetFramePosition0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetFramePosition();
      expect(re).assertLarger(-1);
      console.log(`testOHAudioCapturerGetFramePosition0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERSTOP_0100
     * @tc.name   ：TestOHAudioCapturerStop0100
     * @tc.desc   ：Stop input audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerStop0100', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerStop0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS); // 正确结果：0
      console.log(`testOHAudioCapturerStop0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETLATENCYMODE_0100
     * @tc.name   ：TestOHAudioCapturerGetLatencyMode0100
     * @tc.desc   ：Query the current audio stream delay mode.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetLatencyMode0100', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetLatencyMode0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetLatencyMode();
      expect(re === AUDIOSTREAM_LATENCY_MODE_NORMAL  || re === AUDIOSTREAM_LATENCY_MODE_FAST ).assertTrue();
      console.log(`testOHAudioCapturerGetLatencyMode0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETCURRENTSTATE_0400
     * @tc.name   ：TestOHAudioCapturerGetCurrentState0400
     * @tc.desc   ：Query the current audio stream status.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetCurrentState0400', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetCurrentState0400 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue(); // 正确结果：0、1、2、3、4、5
      console.log(`testOHAudioCapturerGetCurrentState0400 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETCURRENTSTATE_0500
     * @tc.name   ：TestOHAudioCapturerGetCurrentState0500
     * @tc.desc   ：Query the current audio stream status.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetCurrentState0500', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetCurrentState0500 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED || re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED || re === numberFour || re === AUDIOSTREAM_STATE_PAUSED)
        .assertTrue(); // 正确结果：0、1、2、3、4、5
      console.log(`testOHAudioCapturerGetCurrentState0500 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERFLUSH_0100
     * @tc.name   ：TestOHAudioCapturerFlush0100
     * @tc.desc   ：Discard the obtained audio data.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerFlush0100', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerFlush0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerFlush();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS); // 正确结果：0
      console.log(`testOHAudioCapturerFlush0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOCAPTURERGETCURRENTSTATE_0600
     * @tc.name   ：TestOHAudioCapturerGetCurrentState0600
     * @tc.desc   ：Query the current audio stream status.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioCapturerGetCurrentState0600', 0, async (done: Function) => {
      console.log(`testOHAudioCapturerGetCurrentState0600 test start `);
      let re: number | null = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_INVALID).assertTrue(); // 正确结果：0、1、2、3、4、5
      console.log(`testOHAudioCapturerGetCurrentState0600 test end `);
      done();
    });
  });

  describe('OhAudioCapturerStateTest', () => {
    beforeAll(async (done: Function) => {
      await creatPcmFile();
      aff(done);
      await Utils.sleep(sleep3000);
      done();
    });
    beforeEach(async (done: Function) => {
      console.info('beforeEach case');
      done();
    });
    afterEach(async (done: Function) => {
      console.info('afterEach case');
      done();
    });
    afterAll(async (done: Function) => {
      console.info('afterAll case');
      done();
    });

    /**
     * start - stop - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOCAPTURERRECORDER_0100
     * @tc.name   ：TestCreateAudioCapturerRecorder0100
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreateAudioCapturerRecorder0100', 0, async (done: Function) => {
      console.log(`testCreateAudioCapturerRecorder0100 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      Utils.sleep(500);
      console.log(`testCreateAudioCapturerRecorder0100 test end `);
      done();
    });

    /**
     * start- pause - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOCAPTURERRECORDER_0200
     * @tc.name   ：TestCreateAudioCapturerRecorder0200
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreateAudioCapturerRecorder0200', 0, async (done: Function) => {
      console.log(`testCreateAudioCapturerRecorder0200 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexOne);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re).assertEqual(AUDIOSTREAM_STATE_PREPARED);
      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re).assertEqual(AUDIOSTREAM_STATE_RUNNING);

      if (re === AUDIOSTREAM_STATE_RUNNING) {
        re = testStreamBuilder.OHAudioCapturerPause();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        re = testStreamBuilder.OHAudioCapturerGetCurrentState();
        expect(re === AUDIOSTREAM_STATE_PAUSED).assertTrue();
      }

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      Utils.sleep(sleep500);
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCreateAudioCapturerRecorder0200 test end `);
      done();
    });

    /**
     * start- release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOCAPTURERRECORDER_0300
     * @tc.name   ：TestCreateAudioCapturerRecorder0300
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreateAudioCapturerRecorder0300', 0, async (done: Function) => {
      console.log(`testCreateAudioCapturerRecorder0300 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexTwo);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();
      getAudioCapturerParam(false);

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      getAudioCapturerParam();

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      getAudioCapturerParam(false);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      Utils.sleep(500);

      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCreateAudioCapturerRecorder0300 test end `);
      done();
    });

    /**
     * release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOCAPTURERRECORDER_0400
     * @tc.name   ：TestCreateAudioCapturerRecorder0400
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreateAudioCapturerRecorder0400', 0, async (done: Function) => {
      console.log(`testCreateAudioCapturerRecorder0400 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexThree);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      Utils.sleep(500);

      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCreateAudioCapturerRecorder0400 test end `);
      done();
    });

    /**
     * start - pause - stop - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOCAPTURERRECORDER_0500
     * @tc.name   ：TestCreateAudioCapturerRecorder0500
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreateAudioCapturerRecorder0500', 0, async (done: Function) => {
      console.log(`testCreateAudioCapturerRecorder0500 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexFour);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      if (re === AUDIOSTREAM_STATE_RUNNING) {
        re = testStreamBuilder.OHAudioCapturerPause();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        re = testStreamBuilder.OHAudioCapturerGetCurrentState();
        expect(re).assertEqual(AUDIOSTREAM_STATE_PAUSED);
      }

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCreateAudioCapturerRecorder0500 test end `);
      done();
    });

    /**
     * start - stop - start - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOCAPTURERRECORDER_0600
     * @tc.name   ：TestCreateAudioCapturerRecorder0600
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreateAudioCapturerRecorder0600', 0, async (done: Function) => {
      console.log(`testCreateAudioCapturerRecorder0600 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexFive);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCreateAudioCapturerRecorder0600 test end `);
      done();
    });

    /**
     * start - pause - start - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOCAPTURERRECORDER_0700
     * @tc.name   ：TestCreateAudioCapturerRecorder0700
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreateAudioCapturerRecorder0700', 0, async (done: Function) => {
      console.log(`testCreateAudioCapturerRecorder0700 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      if (re === AUDIOSTREAM_STATE_RUNNING) {
        re = testStreamBuilder.OHAudioCapturerPause();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        re = testStreamBuilder.OHAudioCapturerGetCurrentState();
        expect(re === AUDIOSTREAM_STATE_PAUSED).assertTrue();
      }

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCreateAudioCapturerRecorder0700 test end `);
      done();
    });
    /**
     * start - pause - stop - start - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOCAPTURERRECORDER_0800
     * @tc.name   ：TestCreateAudioCapturerRecorder0800
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreateAudioCapturerRecorder0800', 0, async (done: Function) => {
      console.log(`testCreateAudioCapturerRecorder0800 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      if (re === AUDIOSTREAM_STATE_RUNNING) {
        re = testStreamBuilder.OHAudioCapturerPause();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        re = testStreamBuilder.OHAudioCapturerGetCurrentState();
        expect(re === AUDIOSTREAM_STATE_PAUSED).assertTrue();
      }

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCreateAudioCapturerRecorder0800 test end `);
      done();
    });
    /**
     * start - pause - start - stop - start - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOCAPTURERRECORDER_0900
     * @tc.name   ：TestCreateAudioCapturerRecorder0900
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreateAudioCapturerRecorder0900', 0, async (done: Function) => {
      console.log(`testCreateAudioCapturerRecorder0900 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      if (re === AUDIOSTREAM_STATE_RUNNING) {
        re = testStreamBuilder.OHAudioCapturerPause();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        re = testStreamBuilder.OHAudioCapturerGetCurrentState();
        expect(re === AUDIOSTREAM_STATE_PAUSED).assertTrue();
      }

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCreateAudioCapturerRecorder0900 test end `);
      done();
    });

    /**
     * start - stop - start - pause - stop - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOCAPTURERRECORDER_1000
     * @tc.name   ：TestCreateAudioCapturerRecorder1000
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreateAudioCapturerRecorder1000', 0, async (done: Function) => {
      console.log(`testCreateAudioCapturerRecorder1000 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      if (re === AUDIOSTREAM_STATE_RUNNING) {
        re = testStreamBuilder.OHAudioCapturerPause();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        re = testStreamBuilder.OHAudioCapturerGetCurrentState();
        expect(re === AUDIOSTREAM_STATE_PAUSED).assertTrue();
      }

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCreateAudioCapturerRecorder1000 test end `);
      done();
    });
    /**
     * start - pause - stop - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATEAUDIOCAPTURERRECORDER_1100
     * @tc.name   ：TestCreateAudioCapturerRecorder1100
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreateAudioCapturerRecorder1100', 0, async (done: Function) => {
      console.log(`testCreateAudioCapturerRecorder1100 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      if (re === AUDIOSTREAM_STATE_RUNNING) {
        re = testStreamBuilder.OHAudioCapturerPause();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        re = testStreamBuilder.OHAudioCapturerGetCurrentState();
        expect(re === AUDIOSTREAM_STATE_PAUSED).assertTrue();
      }

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCreateAudioCapturerRecorder1100 test end `);
      done();
    });

    /**
     * start - stop - pause - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_ABNOMALOPRATIONCAPTURER_0100
     * @tc.name   ：TestCreateAudioCapturerRecorder0100
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testAbnormalOperationCapturer0100', 0, async (done: Function) => {
      console.log(`testAbnormalOperationCapturer0100 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      await Utils.sleep(sleep500);

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerPause();
      expect(re).assertEqual(AUDIOSTREAM_ERROR_ILLEGAL_STATE);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_PAUSED).assertFalse();

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testAbnormalOperationCapturer0100 test end `);
      done();
    });

    /**
     * stop - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_ABNOMALOPRATIONCAPTURER_0200
     * @tc.name   ：TestAbnormalOperationCapturer0200
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testAbnormalOperationCapturer0200', 0, async (done: Function) => {
      console.log(`testAbnormalOperationCapturer0200 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_ERROR_ILLEGAL_STATE);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertFalse();

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testAbnormalOperationCapturer0200 test end `);
      done();
    });
    /**
     * pause - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_ABNOMALOPRATIONCAPTURER_0300
     * @tc.name   ：TestAbnormalOperationCapturer0300
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testAbnormalOperationCapturer0300', 0, async (done: Function) => {
      console.log(`testAbnormalOperationCapturer0300 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerPause();
      expect(re).assertEqual(AUDIOSTREAM_ERROR_ILLEGAL_STATE);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_PAUSED).assertFalse();

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testAbnormalOperationCapturer0300 test end `);
      done();
    });

    /**
     * release - release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_ABNOMALOPRATIONCAPTURER_0400
     * @tc.name   ：TestAbnormalOperationCapturer0300
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testAbnormalOperationCapturer0400', 0, async (done: Function) => {
      console.log(`testAbnormalOperationCapturer0400 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testAbnormalOperationCapturer0400 test end `);
      done();
    });

    /**
     * pause - pause
     * @tc.number : SUB_MULTIMEDIA_AUDIO_ABNOMALOPRATIONCAPTURER_0500
     * @tc.name   ：TestAbnormalOperationCapturer0300
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testAbnormalOperationCapturer0500', 0, async (done: Function) => {
      console.log(`testAbnormalOperationCapturer0500 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();
      re = testStreamBuilder.OHAudioCapturerStart();

      re = testStreamBuilder.OHAudioCapturerPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerPause();
      expect(re).assertEqual(AUDIOSTREAM_ERROR_ILLEGAL_STATE);

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testAbnormalOperationCapturer0500 test end `);
      done();
    });

    /**
     * start - start
     * @tc.number : SUB_MULTIMEDIA_AUDIO_ABNOMALOPRATIONCAPTURER_0600
     * @tc.name   ：TestAbnormalOperationCapturer0300
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testAbnormalOperationCapturer0600', 0, async (done: Function) => {
      console.log(`testAbnormalOperationCapturer0400 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_ERROR_ILLEGAL_STATE);

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testAbnormalOperationCapturer0600 test end `);
      done();
    });

    /**
     * stop - stop
     * @tc.number : SUB_MULTIMEDIA_AUDIO_ABNOMALOPRATIONCAPTURER_0700
     * @tc.name   ：TestAbnormalOperationCapturer0300
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testAbnormalOperationCapturer0700', 0, async (done: Function) => {
      console.log(`testAbnormalOperationCapturer0700 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re).assertEqual(AUDIOSTREAM_STATE_STOPPED);

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testAbnormalOperationCapturer0700 test end `);
      done();
    });

    /**
     * Capturer attribute get test
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CAPTURERRECORDERATTRIBUYE_0100
     * @tc.name   ：TestCreateAudioCapturerRecorder0100
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCapturerRecorderAttribute0100', 0, async (done: Function) => {
      console.log(`testCapturerRecorderAttribute0100 test start `);
      let re: number = await testStreamBuilder.CreateAudioCapturerRecorder(indexZero);
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re).assertEqual(1);

      let result: boolean = getAudioCapturerParam(false);
      expect(result).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      result = getAudioCapturerParam(false);
      expect(result).assertTrue();

      if (re === AUDIOSTREAM_STATE_RUNNING) {
        re = testStreamBuilder.OHAudioCapturerPause();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        result = getAudioCapturerParam();
        expect(result).assertTrue();
      }

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      result = getAudioCapturerParam();
      expect(result).assertFalse();

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      result = getAudioCapturerParam(false);
      expect(result).assertFalse();
      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCapturerRecorderAttribute0100 test end `);
      done();
    });

    /**
     * Capturer properties verification  test
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CAPTURERRECORDERATTRIBUYE_0200
     * @tc.name   ：TestCreateAudioCapturerRecorder0200
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCapturerRecorderAttribute0200', 0, async (done: Function) => {
      console.log(`testCapturerRecorderAttribute0200 test start `);

      rateValue = 48000;
      channelCount = 2;
      encodingType = 0;
      latencyMode = 0;
      frameSizeValue = 960;
      sampleFormat = 0;

      let re: number = await testStreamBuilder.CreatCapturerRecorderWithParam(rateValue, channelCount, frameSizeValue, latencyMode, sampleFormat);
      expect(re).assertEqual(CODE_SUCCESS);
      Utils.sleep(sleep1000);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      let verify = verifyCapturerProperties();
      expect(verify).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      if (re === AUDIOSTREAM_STATE_RUNNING) {
        re = testStreamBuilder.OHAudioCapturerPause();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        re = testStreamBuilder.OHAudioCapturerGetCurrentState();
        expect(re).assertEqual(AUDIOSTREAM_STATE_PAUSED);
      }

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCapturerRecorderAttribute0200 test end `);
      done();
    });

    /**
     * Capturer properties verification  test latencyMode = 1
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CAPTURERRECORDERATTRIBUYE_0300
     * @tc.name   ：TestCreateAudioCapturerRecorder0300
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCapturerRecorderAttribute0300', 0, async (done: Function) => {
      console.log(`testCapturerRecorderAttribute0300 test start `);

      rateValue = 48000;
      channelCount = 2;
      encodingType = 0;
      latencyMode = 0;
      frameSizeValue = 960;
      sampleFormat = 0;

      let re: number = await testStreamBuilder.CreatCapturerRecorderWithParam(rateValue, channelCount, frameSizeValue, latencyMode, sampleFormat);
      expect(re).assertEqual(CODE_SUCCESS);
      Utils.sleep(sleep1000);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      let verify = verifyCapturerProperties();
      expect(verify).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      if (re === AUDIOSTREAM_STATE_RUNNING) {
        re = testStreamBuilder.OHAudioCapturerPause();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        re = testStreamBuilder.OHAudioCapturerGetCurrentState();
        expect(re).assertEqual(AUDIOSTREAM_STATE_PAUSED);
      }

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCapturerRecorderAttribute0300 test end `);
      done();
    });

    /**
     * Capturer properties verification  test frameSizeValue = 240
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CAPTURERRECORDERATTRIBUYE_0400
     * @tc.name   ：TestCreateAudioCapturerRecorder0400
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCapturerRecorderAttribute0400', 0, async (done: Function) => {
      console.log(`testCapturerRecorderAttribute0400 test start `);

      rateValue = 48000;
      channelCount = 2;
      encodingType = 0;
      latencyMode = 0;
      frameSizeValue = 960;
      sampleFormat = 0;

      let re: number = await testStreamBuilder.CreatCapturerRecorderWithParam(rateValue, channelCount, frameSizeValue, latencyMode, sampleFormat);
      expect(re).assertEqual(CODE_SUCCESS);
      Utils.sleep(sleep1000);

      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      let verify = verifyCapturerProperties();
      expect(verify).assertTrue();

      re = testStreamBuilder.OHAudioCapturerStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioCapturerGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      if (re === AUDIOSTREAM_STATE_RUNNING) {
        re = testStreamBuilder.OHAudioCapturerPause();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        re = testStreamBuilder.OHAudioCapturerGetCurrentState();
        expect(re).assertEqual(AUDIOSTREAM_STATE_PAUSED);
      }

      re = testStreamBuilder.OHAudioCapturerStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      re = testStreamBuilder.OHAudioCapturerRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      let ret: number = await testStreamBuilder.CloseAudioCapture();
      expect(ret === AUDIOSTREAM_SUCCESS || ret === CODE_SUCCESS).assertTrue();
      console.log(`testCapturerRecorderAttribute0400 test end `);
      done();
    });
  });
}
