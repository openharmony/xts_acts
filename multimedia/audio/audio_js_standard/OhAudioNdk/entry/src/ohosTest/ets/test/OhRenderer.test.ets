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

let sleep500: number = 500;
let sleep1000: number = 1000;
let sleep2000: number = 2000;
let sleep5000: number = 5000;
let numberTwo: number = 2;

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

let numberThree: number = 3;
let numberFour: number = 4;
let numberFive: number = 5;
let numberSix: number = 6;
let numberSeven: number = 7;
let numberEight: number = 8;
let numberTen: number = 10;
let numberEleven: number = 11;
let numberTwelve: number = 12;
let numberThirteen: number = 13;

let number200: number = 200;
let number500: number = 500;
let number48000: number = 48000;

let numberFloute: number = 2.0;

let CODE_SUCCESS: number = 200;
let AUDIOSTREAM_SUCCESS: number = 0;
let AUDIOSTREAM_ERROR_ILLEGAL_STATE: number = 2;


let AUDIOSTREAM_USAGE_UNKNOWN: number = 0;

let AUDIOSTREAM_USAGE_MUSIC: number = 1;

let AUDIOSTREAM_USAGE_VOICE_COMMUNICATION: number = 2;

let AUDIOSTREAM_USAGE_VOICE_ASSISTANT: number = 3;

let AUDIOSTREAM_USAGE_ALARM: number = 4;

let AUDIOSTREAM_USAGE_VOICE_MESSAGE: number = 5;

let AUDIOSTREAM_USAGE_RINGTONE: number = 6;

let AUDIOSTREAM_USAGE_NOTIFICATION: number = 7;

let AUDIOSTREAM_USAGE_ACE: number = 8;

let AUDIOSTREAM_USAGE_MOVIE: number = 10;

let AUDIOSTREAM_USAGE_GAME: number = 11;

let AUDIOSTREAM_USAGE_AUDIOBOOK: number = 12;

let AUDIOSTREAM_USAGE_NAVIGATION: number = 13;

let fileList: string[] = [
  'Believer.wav',
  'Believer60s.wav',
  'file_example_WAV_1MG.wav',
  'safe_and_sound_32.wav',
  'StarWars10s-1C-8000-2SW.wav',
  'StarWars10s-1C-16000-2SW.wav',
  'StarWars10s-1C-32000-1SW.wav',
  'StarWars10s-1C-44100-2SW.wav',
  'StarWars10s-1C-64000-3SW.wav',
  'StarWars10s-1C-96000-4SW.wav',
  'StarWars10s-2C-11025-1SW.wav',
  'StarWars10s-2C-12000-2SW.wav',
  'StarWars10s-2C-16000-3SW.wav',
  'StarWars10s-2C-22050-2SW.wav',
  'StarWars10s-2C-24000-3SW.wav',
  'StarWars10s-2C-48000-4SW.wav',
  'test_44100_2.wav',
  'vorbis_48000_32_1.wav'
];

let paramList: Map<string, number>[] = Array<Map<string, number>>();

function getContext(): Context {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  return context;
}

function getAudioRendererParam(): boolean {
  let rerult = true;
  let rendererParamMap: Map<string, number> = new Map<string, number>();
  let re: number = testStreamBuilder.OHAudioRendererGetRendererInfo();
  if (re < AUDIOSTREAM_USAGE_UNKNOWN ) {
    rerult = false;
  } else {
    rendererParamMap.set('RendererInfo', re);
  }
  re = testStreamBuilder.OHAudioRendererGetChannelCount();
  if (re < 0) {
    rerult = false;
  } else {
    rendererParamMap.set('ChannelCount', re);
  }
  re = testStreamBuilder.OHAudioRendererGetEncodingType();
  if (re < 0) {
    rerult = false;
  } else {
    rendererParamMap.set('EncodingType', re);
  }
  re = testStreamBuilder.OHAudioRendererGetFrameSizeInCallback();
  if (re < 0) {
    rerult = false;
  } else {
    rendererParamMap.set('FrameSize', re);
  }
  re = testStreamBuilder.OHAudioRendererGetFramesWritten();
  if (re < 0) {
    rerult = false;
  } else {
    rendererParamMap.set('FramesWritten', re);
  }
  re = testStreamBuilder.OHAudioRendererGetLatencyMode();
  if (re < AUDIOSTREAM_LATENCY_MODE_NORMAL) {
    rerult = false;
  } else {
    rendererParamMap.set('LatencyMode', re);
  }
  re = testStreamBuilder.OHAudioRendererGetSampleFormat();
  if (re < 0) {
    rerult = false;
  } else {
    rendererParamMap.set('SampleFormat', re);
  }
  re = testStreamBuilder.OHAudioRendererGetSamplingRate();
  if (re < 0) {
    rerult = false;
  } else {
    rendererParamMap.set('SamplingRate', re);
  }
  paramList.push(rendererParamMap);
  re = testStreamBuilder.OHAudioRendererGetStreamId();
  if (re < 0) {
    rerult = false;
  }
  re = testStreamBuilder.OHAudioRendererGetTimestamp();
  if (re < 0) {
    rerult = false;
  }
  re = testStreamBuilder.OHAudioRendererGetSpeed();
  if (re < 0) {
    rerult = false;
  }
  return rerult;
}

function verifyRendererProperties(tempMap: Map<string, number>): boolean {
  let result: boolean = true;
  let re: number = testStreamBuilder.OHAudioRendererGetRendererInfo();
  if (re < AUDIOSTREAM_USAGE_UNKNOWN ) {
    result = false;
  } else {
    expect(re).assertEqual(tempMap.get('RendererInfo'));
  }

  re = testStreamBuilder.OHAudioRendererGetChannelCount();
  if (re < 0) {
    result = false;
  } else {
    expect(re).assertEqual(tempMap.get('ChannelCount'));
  }
  re = testStreamBuilder.OHAudioRendererGetEncodingType();
  if (re < 0) {
    result = false;
  } else {
    expect(re).assertEqual(tempMap.get('EncodingType'));
  }

  re = testStreamBuilder.OHAudioRendererGetFrameSizeInCallback();
  if (re < 0) {
    result = false;
  } else {
    expect(re).assertEqual(tempMap.get('FrameSize'));
  }

  re = testStreamBuilder.OHAudioRendererGetFramesWritten();
  if (re < 0) {
    result = false;
  } else {
    expect(re).assertEqual(tempMap.get('FramesWritten'));
  }
  re = testStreamBuilder.OHAudioRendererGetLatencyMode();
  if (re < 0) {
    result = false;
  } else {
    expect(re).assertEqual(tempMap.get('LatencyMode'));
  }
  re = testStreamBuilder.OHAudioRendererGetSampleFormat();
  if (re < 0) {
    result = false;
  } else {
    expect(re).assertEqual(tempMap.get('SampleFormat'));
  }
  re = testStreamBuilder.OHAudioRendererGetSamplingRate();
  if (re < 0) {
    result = false;
  } else {
    expect(re).assertEqual(tempMap.get('SamplingRate'));
  }
  re = testStreamBuilder.OHAudioRendererGetStreamId();
  if (re < 0) {
    result = false;
  }
  re = testStreamBuilder.OHAudioRendererGetTimestamp();
  if (re < 0) {
    result = false;
  }
  re = testStreamBuilder.OHAudioRendererGetSpeed();
  if (re < 0) {
    result = false;
  }
  return result;
}

function copyAllWavFile(): boolean {
  for (let i: number = 0; i < fileList.length; i++) {
    let fileName: string = fileList[i];
    try {
      let context = getContext();
      let dir = context.filesDir + '/';
      let ml_face_model_file = dir + fileName;
      context.resourceManager.getRawFileContent(fileName, (error, model_buffer) => {
        if (error) {
          console.log(`[rawfile_copy_to_sandbox] ${fileName} is copy failed:${error.code}, message: ${error.message}.`);
        } else {
          let file = fs.openSync(ml_face_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          fs.writeSync(file.fd, model_buffer.buffer);
          fs.closeSync(file);
          console.log(`[rawfile_copy_to_sandbox] ${fileName} is copy success`);
        }
      });
      console.info('[rawfile_copy_to_sandbox] sandbox path:' + dir);
    } catch (error) {
      console.info('[rawfile_copy_to_sandbox] getRawFileDescriptor api run failed' + error);
    }
  }
  return true;
}

export default function OhRendererTest() {

  describe('OhRendererTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      let context = getContext();
      let dir = context.filesDir + '/';
      try {
        let ml_face_model_file = dir + 'Believer60s.wav';
        context.resourceManager.getRawFileContent('Believer60s.wav', (error, model_buffer) => {
          if (error) {
            console.log(
              `[wavfile_copy_to_sandbox] Believer60s.wav is
              copy failed:${error.code}, message: ${error.message}.`
            );
          } else {
            let file = fs.openSync(ml_face_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
            fs.writeSync(file.fd, model_buffer.buffer);
            fs.closeSync(file);
            console.log('[wavfile_copy_to_sandbox] Believer60s.wav is copy success');
          }
        });
      } catch (error) {
        console.info('[wavfile_copy_to_sandbox] getRawFileDescriptor api run failed' + error);
      }
      testStreamBuilder.CreatRendererAudioPlayer();
      console.info('[wavfile_copy_to_sandbox] sandbox path:' + dir);
      await Utils.sleep(sleep2000);
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(() => {
      console.info('afterEach case');
    });
    afterAll(() => {
      testStreamBuilder.CloseAudioRender();
      console.info('afterAll case ');
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETCURRENTSTATE_0100
     * @tc.name   ：TestOHAudioRendererGetCurrentState0100
     * @tc.desc   ：Query the current output audio stream status.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioRendererGetCurrentState0100', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetCurrentState0100 test start `);
      let state: number | null = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(state).assertEqual(AUDIOSTREAM_STATE_PREPARED);
      console.log(`testOHAudioRendererGetCurrentState0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETSAMPLEFORMAT_0100
     * @tc.name   ：TestOHAudioRendererGetSampleFormat0100
     * @tc.desc   ：Query the current output audio stream sampling format.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioRendererGetSampleFormat0100', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetSampleFormat0100 test start `);
      let sampleFormat: number | null = testStreamBuilder.OHAudioRendererGetSampleFormat();
      expect(sampleFormat).assertEqual(0);
      console.log(`testOHAudioRendererGetSampleFormat0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETSAMPLINGRATE_0100
     * @tc.name   ：TestOHAudioRendererGetSamplingRate0100
     * @tc.desc   ：Query the current output audio stream sampling rate.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioRendererGetSamplingRate0100', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetSamplingRate0100 test start `);
      let samplingRate: number | null = testStreamBuilder.OHAudioRendererGetSamplingRate();
      expect(samplingRate).assertEqual(number48000);
      console.log(`testOHAudioRendererGetSamplingRate0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETSTREAMID_0100
     * @tc.name   ：TestOHAudioRendererGetStreamId0100
     * @tc.desc   ：Query the current output audio stream ID.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioRendererGetStreamId0100', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetStreamId0100 test start `);
      let re: number = testStreamBuilder.OHAudioRendererGetStreamId();
      expect(re).assertLarger(0);
      console.log(`testOHAudioRendererGetStreamId0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETSPEED_0100
     * @tc.name   ：TestOHAudioRendererGetSpeed0100
     * @tc.desc   ：Get playback speed.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioRendererGetSpeed0100', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetSpeed0100 test start `);
      let speed: number | null = testStreamBuilder.OHAudioRendererGetSpeed();
      expect(speed).assertEqual(1);
      console.log(`testOHAudioRendererGetSpeed0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETCHANNELCOUNT_0100
     * @tc.name   ：TestOHAudioRendererGetChannelCount0100
     * @tc.desc   ：Query the current number of output audio channels.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioRendererGetChannelCount0100', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetChannelCount0100 test start `);
      let channelCount: number | null = testStreamBuilder.OHAudioRendererGetChannelCount();
      expect(channelCount).assertEqual(numberTwo);
      console.log(`testOHAudioRendererGetChannelCount0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETENCODINGTYPE_0100
     * @tc.name   ：TestOHAudioRendererGetEncodingType0100
     * @tc.desc   ：Query the current output audio stream encoding type.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioRendererGetEncodingType0100', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetEncodingType0100 test start `);
      let encodingType: number | null = testStreamBuilder.OHAudioRendererGetEncodingType();
      expect(encodingType).assertEqual(AUDIOSTREAM_ENCODING_TYPE_RAW);
      console.log(`testOHAudioRendererGetEncodingType0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETFRAMESIZEINCALLBACK_0100
     * @tc.name   ：TestOHAudioRendererGetFrameSizeInCallback0100
     * @tc.desc   ：Query the frame size in the callback, which is a fixed length that fills the flow every time the callback is performed.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioRendererGetFrameSizeInCallback0100', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetFrameSizeInCallback0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioRendererGetFrameSizeInCallback();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioRendererGetFrameSizeInCallback0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETFRAMESWRITTEN_0100
     * @tc.name   ：TestOHAudioRendererGetFramesWritten0100
     * @tc.desc   ：Query the number of frames written since self created streaming
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioRendererGetFramesWritten0100', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetFramesWritten0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioRendererGetFramesWritten();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioRendererGetFramesWritten0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETLATENCYMODE_0100
     * @tc.name   ：TestOHAudioRendererGetLatencyMode0100
     * @tc.desc   ：Query the current output audio stream delay mode.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioRendererGetLatencyMode0100', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetLatencyMode0100 test start `);
      let mode: number | null = testStreamBuilder.OHAudioRendererGetLatencyMode();
      expect(mode).assertEqual(AUDIOSTREAM_LATENCY_MODE_NORMAL);
      console.log(`testOHAudioRendererGetLatencyMode0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETRENDERERINFO_0100
     * @tc.name   ：TestOHAudioRendererGetRendererInfo0100
     * @tc.desc   ：Query the current output audio stream workspace type.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioRendererGetRendererInfo0100', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetRendererInfo0100 test start `);
      let usage: number | null = testStreamBuilder.OHAudioRendererGetRendererInfo();
      expect(usage).assertEqual(AUDIOSTREAM_USAGE_MUSIC );
      console.log(`testOHAudioRendererGetRendererInfo0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERSTART_0100
     * @tc.name   ：TestOHAudioRendererStart0100
     * @tc.desc   ：Start outputting audio data.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioRendererStart0100', 0, async (done: Function) => {
      console.log(`testOHAudioRendererStart0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioRendererStart();
      let state: number | null = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      expect(state).assertEqual(AUDIOSTREAM_STATE_RUNNING);
      console.log(`testOHAudioRendererStart0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETTIMESTAMP_0100
     * @tc.name   ：TestOHAudioRendererGetTimestamp0100
     * @tc.desc   ：Stop outputting audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioRendererGetTimestamp0100', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetTimestamp0100 test start `);
      let state: number = testStreamBuilder.OHAudioRendererGetCurrentState();
      if (state > AUDIOSTREAM_STATE_PREPARED) {
        let re: number | null = testStreamBuilder.OHAudioRendererGetTimestamp();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      }
      console.log(`testOHAudioRendererGetTimestamp0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERPAUSE_0100
     * @tc.name   ：TesttestOHAudioRendererPause0100
     * @tc.desc   ：Release the output audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioRendererPause0100', 0, async (done: Function) => {
      console.log(`testOHAudioRendererPause0100 test start `);
      let state: number | null = testStreamBuilder.OHAudioRendererGetCurrentState();
      if (state === AUDIOSTREAM_STATE_RUNNING) {
        let re: number | null = testStreamBuilder.OHAudioRendererPause();
        state = testStreamBuilder.OHAudioRendererGetCurrentState();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        expect(state).assertEqual(AUDIOSTREAM_STATE_PAUSED);
      }
      console.log(`testOHAudioRendererPause0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERSTOP_0100
     * @tc.name   ：TestOHAudioRendererStop0100
     * @tc.desc   ：Stop outputting audio stream.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioRendererStop0100', 0, async (done: Function) => {
      console.log(`testOHAudioRendererStop0100 test start `);
      let state: number | null = testStreamBuilder.OHAudioRendererGetCurrentState();
      if (state === AUDIOSTREAM_STATE_STOPPED || state === AUDIOSTREAM_STATE_RUNNING) {
        let re: number | null = testStreamBuilder.OHAudioRendererStop();
        state = testStreamBuilder.OHAudioRendererGetCurrentState();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        expect(state).assertEqual(AUDIOSTREAM_STATE_STOPPED);
      }
      console.log(`testOHAudioRendererStop0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERFLUSH_0100
     * @tc.name   ：TestOHAudioRendererFlush0100
     * @tc.desc   ：Discard audio data that has already been written.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioRendererFlush0100', 0, async (done: Function) => {
      console.log(`testOHAudioRendererFlush0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioRendererFlush();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioRendererFlush0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERSETSPEED_0100
     * @tc.name   ：TestOHAudioRendererSetSpeed0100
     * @tc.desc   ：Set playback speed.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioRendererSetSpeed0100', 0, async (done: Function) => {
      console.log(`testOHAudioRendererSetSpeed0100 test start `);
      let re: number | null = testStreamBuilder.OHAudioRendererSetSpeed(numberFloute);
      let speed: number | null = testStreamBuilder.OHAudioRendererGetSpeed();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      expect(speed).assertEqual(numberTwo);
      console.log(`testOHAudioRendererSetSpeed0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETCURRENTSTATE_0200
     * @tc.name   ：TestOHAudioRendererGetCurrentState0200
     * @tc.desc   ：Query the current output audio stream status.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioRendererGetCurrentState0200', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetCurrentState0200 test start `);
      testStreamBuilder.OHAudioRendererStart();
      let state: number | null = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(state).assertEqual(AUDIOSTREAM_STATE_RUNNING);
      console.log(`testOHAudioRendererGetCurrentState0200 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETCURRENTSTATE_0300
     * @tc.name   ：TestOHAudioRendererGetCurrentState0300
     * @tc.desc   ：Query the current output audio stream status.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioRendererGetCurrentState0300', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetCurrentState0300 test start `);
      testStreamBuilder.OHAudioRendererPause();
      let state: number | null = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(state).assertEqual(AUDIOSTREAM_STATE_PAUSED);
      console.log(`testOHAudioRendererGetCurrentState0300 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERGETCURRENTSTATE_0400
     * @tc.name   ：TestOHAudioRendererGetCurrentState0400
     * @tc.desc   ：Query the current output audio stream status.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioRendererGetCurrentState0400', 0, async (done: Function) => {
      console.log(`testOHAudioRendererGetCurrentState0400 test start `);
      let state: number = testStreamBuilder.OHAudioRendererGetCurrentState();
      if (state > AUDIOSTREAM_STATE_PREPARED) {
        testStreamBuilder.OHAudioRendererStop();
        state = testStreamBuilder.OHAudioRendererGetCurrentState();
        expect(state).assertEqual(AUDIOSTREAM_STATE_STOPPED);
      }
      console.log(`testOHAudioRendererGetCurrentState0400 test end `);
      done();
    });
  });

  describe('OhAudioRendererTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      let context = getContext();
      let dir = context.filesDir + '/';
      try {
        let ml_face_model_file = dir + 'Believer60s.wav';
        context.resourceManager.getRawFileContent('Believer60s.wav', (error, model_buffer) => {
          if (error) {
            console.log(
              `[wavfile_copy_to_sandbox] Believer60s.wav is
              copy failed:${error.code}, message: ${error.message}.`
            );
          } else {
            let file = fs.openSync(ml_face_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
            fs.writeSync(file.fd, model_buffer.buffer);
            fs.closeSync(file);
            console.log('[wavfile_copy_to_sandbox] Believer60s.wav is copy success');
          }
        });
      } catch (error) {
        console.info('[wavfile_copy_to_sandbox] getRawFileDescriptor api run failed' + error);
      }
      console.info('[wavfile_copy_to_sandbox] sandbox path:' + dir);
      await Utils.sleep(sleep2000);
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
      await Utils.sleep(sleep500);
    });
    afterAll(async () => {
      console.info('afterAll case ');
      await testStreamBuilder.CloseAudioRender();
    });

    /**
     * start -> pause -> release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_0100
     * @tc.name   ：TestCreatRendererAudioPlayer0100
     * @tc.desc   ：The state change of the state machine.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreatRendererAudioPlayer0100', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer0100 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === numberFive).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer0100 test end `);
      done();
    });

    /**
     * start -> pause -> stop -> release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_0200
     * @tc.name   ：TestCreatRendererAudioPlayer0200
     * @tc.desc   ：The state change of the state machine.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreatRendererAudioPlayer0200', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer0200 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === numberFive).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === numberThree).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer0200 test end `);
      done();
    });

    /**
     * start -> pause -> stop -> start -> release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_0300
     * @tc.name   ：TestCreatRendererAudioPlayer0300
     * @tc.desc   ：The state change of the state machine.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreatRendererAudioPlayer0300', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer0300 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === numberFive).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === numberThree).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer0300 test end `);
      done();
    });

    /**
     * start -> pause -> stop -> start -> pause -> release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_0400
     * @tc.name   ：TestCreatRendererAudioPlayer0400
     * @tc.desc   ：The state change of the state machine.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreatRendererAudioPlayer0400', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer0400 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === numberFive).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === numberThree).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === numberFive).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer0400 test end `);
      done();
    });

    /**
     * start -> pause -> stop -> start -> stop -> release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_0500
     * @tc.name   ：TestCreatRendererAudioPlayer0500
     * @tc.desc   ：The state change of the state machine.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreatRendererAudioPlayer0500', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer0500 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === numberFive).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === numberThree).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === numberThree).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer0500 test end `);
      done();
    });

    /**
     * start -> pause -> start -> release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_0600
     * @tc.name   ：TestCreatRendererAudioPlayer0600
     * @tc.desc   ：The state change of the state machine.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreatRendererAudioPlayer0600', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer0600 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_PAUSED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer0600 test end `);
      done();
    });

    /**
     * start -> pause -> start -> pause -> release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_0700
     * @tc.name   ：TestCreatRendererAudioPlayer0700
     * @tc.desc   ：The state change of the state machine.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreatRendererAudioPlayer0700', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer0700 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_PAUSED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_PAUSED).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer0700 test end `);
      done();
    });

    /**
     * start -> pause -> start -> stop -> release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_0800
     * @tc.name   ：TestCreatRendererAudioPlayer0800
     * @tc.desc   ：The state change of the state machine.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreatRendererAudioPlayer0800', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer0800 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_PAUSED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer0800 test end `);
      done();
    });

    /**
     * start -> stop -> release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_0900
     * @tc.name   ：TestCreatRendererAudioPlayer0900
     * @tc.desc   ：The state change of the state machine.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreatRendererAudioPlayer0900', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer0900 test start `);
      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);

      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer0900 test end `);
      done();
    });

    /**
     * start -> stop -> start -> release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_1000
     * @tc.name   ：TestCreatRendererAudioPlayer1000
     * @tc.desc   ：The state change of the state machine.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreatRendererAudioPlayer1000', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer1000 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer1000 test end `);
      done();
    });

    /**
     * start -> stop -> start  -> pause -> release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_1100
     * @tc.name   ：TestCreatRendererAudioPlayer1100
     * @tc.desc   ：The state change of the state machine.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreatRendererAudioPlayer1100', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer1100 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re).assertEqual(AUDIOSTREAM_STATE_STOPPED);

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re).assertEqual(AUDIOSTREAM_STATE_RUNNING);

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_PAUSED).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer1100 test end `);
      done();
    });

    /**
     * start -> stop -> start  -> stop -> release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_1200
     * @tc.name   ：TestCreatRendererAudioPlayer1200
     * @tc.desc   ：The state change of the state machine.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreatRendererAudioPlayer1200', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer1200 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer1200 test end `);
      done();
    });

    /**
     * start -> release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_1300
     * @tc.name   ：TestCreatRendererAudioPlayer1300
     * @tc.desc   ：The state change of the state machine.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreatRendererAudioPlayer1300', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer1300 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer1300 test end `);
      done();
    });

    /**
     * release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_1400
     * @tc.name   ：TestCreatRendererAudioPlayer1400
     * @tc.desc   ：The state change of the state machine.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreatRendererAudioPlayer1400', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer1400 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer1400 test end `);
      done();
    });

    /**
     * start -> stop -> pause -> release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_1500
     * @tc.name   ：TestCreatRendererAudioPlayer1500
     * @tc.desc   ：The state change of the state machine.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreatRendererAudioPlayer1500', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer1500 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_ERROR_ILLEGAL_STATE);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_PAUSED).assertFalse();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer1500 test end `);
      done();
    });

    /**
     * pause -> release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_1600
     * @tc.name   ：TestCreatRendererAudioPlayer1600
     * @tc.desc   ：The state change of the state machine.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreatRendererAudioPlayer1600', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer1600 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_ERROR_ILLEGAL_STATE);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_PAUSED).assertFalse();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer1600 test end `);
      done();
    });

    /**
     * stop -> release
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_1700
     * @tc.name   ：TestCreatRendererAudioPlayer1700
     * @tc.desc   ：The state change of the state machine.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreatRendererAudioPlayer1700', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer1700 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_ERROR_ILLEGAL_STATE);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertFalse();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer1700 test end `);
      done();
    });

    /**
     * start -> start
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_1800
     * @tc.name   ：TestCreatRendererAudioPlayer1700
     * @tc.desc   ：The state change of the state machine.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreatRendererAudioPlayer1800', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer1800 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_ERROR_ILLEGAL_STATE);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer1800 test end `);
      done();
    });
    /**
     * pause -> pause
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_1900
     * @tc.name   ：TestCreatRendererAudioPlayer1700
     * @tc.desc   ：The state change of the state machine.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreatRendererAudioPlayer1900', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer1900 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererPause();
      expect(re).assertEqual(AUDIOSTREAM_ERROR_ILLEGAL_STATE);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_PAUSED).assertTrue();

      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer1900 test end `);
      done();
    });

    /**
     * stop -> stop
     * @tc.number : SUB_MULTIMEDIA_AUDIO_CREATRENDERERAUDIOPLAYER_2000
     * @tc.name   ：TestCreatRendererAudioPlayer1700
     * @tc.desc   ：The state change of the state machine.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testCreatRendererAudioPlayer2000', 0, async (done: Function) => {
      console.log(`testCreatRendererAudioPlayer2000 test start `);

      let re: number = await testStreamBuilder.CreatRendererAudioPlayer();
      Utils.sleep(sleep1000);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStop();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_STOPPED).assertTrue();
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      console.log(`testCreatRendererAudioPlayer2000 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_0100
     * @tc.name   ：TestOHAudioStreamBuilderSetRendererInfo0100
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetRendererInfo0100', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo0100 test start `);
      let re: number = await testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_UNKNOWN);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo0100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_0200
     * @tc.name   ：TestOHAudioStreamBuilderSetRendererInfo0200
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetRendererInfo0200', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo0200 test start `);
      let re: number | null = testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_VOICE_COMMUNICATION);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo0200 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_0300
     * @tc.name   ：TestOHAudioStreamBuilderSetRendererInfo0300
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetRendererInfo0300', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo0300 test start `);
      let re: number | null = testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_VOICE_ASSISTANT);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo0300 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_0400
     * @tc.name   ：TestOHAudioStreamBuilderSetRendererInfo0400
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetRendererInfo0400', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo0400 test start `);
      let re: number | null = testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_ALARM);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo0400 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_0500
     * @tc.name   ：TestOHAudioStreamBuilderSetRendererInfo0500
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetRendererInfo0500', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo0500 test start `);
      let re: number | null = testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_MOVIE);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo0500 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_0600
     * @tc.name   ：TestOHAudioStreamBuilderSetRendererInfo0600
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetRendererInfo0600', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo0600 test start `);
      let re: number | null = testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_GAME);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo0600 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_0700
     * @tc.name   ：TestOHAudioStreamBuilderSetRendererInfo0700
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetRendererInfo0700', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo0700 test start `);
      let re: number | null = testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_AUDIOBOOK);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo0700 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_0800
     * @tc.name   ：TestOHAudioStreamBuilderSetRendererInfo0800
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetRendererInfo0800', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo0800 test start `);
      let re: number | null = testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_NAVIGATION);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo0800 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_0900
     * @tc.name   ：TestOHAudioStreamBuilderSetRendererInfo0900
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetRendererInfo0900', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo0900 test start `);
      let re: number | null = testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_VOICE_MESSAGE);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo0900 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_1000
     * @tc.name   ：TestOHAudioStreamBuilderSetRendererInfo1000
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetRendererInfo1000', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo1000 test start `);
      let re: number | null = testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_RINGTONE);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo1000 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_1100
     * @tc.name   ：TestOHAudioStreamBuilderSetRendererInfo1100
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetRendererInfo1100', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo1100 test start `);
      let re: number | null = testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_NOTIFICATION);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo1100 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_1200
     * @tc.name   ：TestOHAudioStreamBuilderSetRendererInfo1200
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetRendererInfo1200', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo1200 test start `);
      let re: number | null = testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_ACE);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo1200 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIOSTREAMBUILDERSETRENDERERINFO_1300
     * @tc.name   ：TestOHAudioStreamBuilderSetRendererInfo1300
     * @tc.desc   ：Set the working scenario for outputting audio streams.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioStreamBuilderSetRendererInfo1300', 0, async (done: Function) => {
      console.log(`testOHAudioStreamBuilderSetRendererInfo1300 test start `);
      let re: number | null = testStreamBuilder.TestRendererAudioStreamUsage(AUDIOSTREAM_USAGE_MUSIC);
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
      console.log(`testOHAudioStreamBuilderSetRendererInfo1300 test end `);
      done();
    });
  });

  describe('OhAudioRendererPlayerListTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await copyAllWavFile();
      await Utils.sleep(sleep5000);
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(async () => {
      await Utils.sleep(sleep500);
      console.info('afterAll case ');
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERPLAYLIST_0100
     * @tc.name   ：TestOHAudioRendererPlayList0100
     * @tc.desc   ：Creating an audio player using Wav files.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioRendererPlayList001', 0, async (done: Function) => {
      console.log(`testOHAudioRendererPlayList001 test start `);
      for (let index: number = 0; index < fileList.length; index++) {
        let re: number = await testStreamBuilder.CreatAudioPlayerWithWavFile(index);
        if (re === CODE_SUCCESS) {
          Utils.sleep(sleep1000);
        } else {
          continue;
        }

        re = testStreamBuilder.OHAudioRendererGetCurrentState();
        expect(re).assertEqual(AUDIOSTREAM_STATE_PREPARED);

        re = await testStreamBuilder.OHAudioRendererStart();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

        re = await testStreamBuilder.OHAudioRendererGetCurrentState();
        expect(re).assertEqual(AUDIOSTREAM_STATE_RUNNING);

        getAudioRendererParam();

        if (re === AUDIOSTREAM_STATE_RUNNING) {
          re = await testStreamBuilder.OHAudioRendererPause();
          expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

          re = await testStreamBuilder.OHAudioRendererGetCurrentState();
          expect(re).assertEqual(AUDIOSTREAM_STATE_PAUSED);
        }

        re = await testStreamBuilder.OHAudioRendererStop();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

        re = await testStreamBuilder.OHAudioRendererGetCurrentState();
        expect(re).assertEqual(AUDIOSTREAM_STATE_STOPPED);
        re = await testStreamBuilder.OHAudioRendererRelease();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);
        await testStreamBuilder.CloseAudioRender();
        await Utils.sleep(sleep500);
      }
      console.log(`testOHAudioRendererPlayList001 test end `);
      done();
    });

    /**
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERPLAYLIST_0200
     * @tc.name   ：TestOHAudioRendererPlayList0200
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioRendererPlayList002', 0, async (done: Function) => {
      console.log(`testOHAudioRendererPlayList002 test start `);

      for (let index: number = 0; index < fileList.length; index++) {
        let tempMap: Map<string, number> = paramList[index];
        if (tempMap === undefined) {
          continue;
        }
        const element: string = fileList[index];
        let re: number = await testStreamBuilder.CreatAudioPlayerWithFileAndParam(
          index,
          tempMap.get('RendererInfo'),
          tempMap.get('ChannelCount'),
          tempMap.get('EncodingType'),
          tempMap.get('FrameSize'),
          tempMap.get('FramesWritten'),
          tempMap.get('LatencyMode'),
          tempMap.get('SampleFormat'),
          tempMap.get('SamplingRate')
        );
        console.info(
          `${element}paramDetail:${tempMap.get('RendererInfo')},${tempMap.get('ChannelCount')},${tempMap.get('EncodingType')},${tempMap.get(
            'FrameSize'
          )},${tempMap.get('FramesWritten')},${tempMap.get('LatencyMode')},${tempMap.get('SampleFormat')},${tempMap.get('SamplingRate')}`
        );
        if (re === CODE_SUCCESS) {
          Utils.sleep(sleep1000);
        } else {
          const element: string = fileList[index];
          console.log("fail file",element);
          continue;
        }

        re = testStreamBuilder.OHAudioRendererGetCurrentState();
        expect(re === AUDIOSTREAM_STATE_NEW || re === AUDIOSTREAM_STATE_PREPARED).assertTrue();

        re = testStreamBuilder.OHAudioRendererStart();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

        await Utils.sleep(sleep1000);

        re = testStreamBuilder.OHAudioRendererGetCurrentState();
         expect(re === AUDIOSTREAM_STATE_RUNNING || re === AUDIOSTREAM_STATE_STOPPED).assertTrue();

        if (re === AUDIOSTREAM_STATE_RUNNING) {
          re = testStreamBuilder.OHAudioRendererPause();
          expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

          re = testStreamBuilder.OHAudioRendererGetCurrentState();
          expect(re).assertEqual(AUDIOSTREAM_STATE_PAUSED);
        }

        re = testStreamBuilder.OHAudioRendererStop();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

        re = testStreamBuilder.OHAudioRendererGetCurrentState();
        expect(re).assertEqual(AUDIOSTREAM_STATE_STOPPED);

        re = testStreamBuilder.OHAudioRendererRelease();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

        await testStreamBuilder.CloseAudioRender();
        await Utils.sleep(sleep500);
      }
      console.log(`testOHAudioRendererPlayList002 test end `);
      done();
    });

    /**
     * Renderer properties verification  test
     * @tc.number : SUB_MULTIMEDIA_AUDIO_OHAUDIORENDERERPLAYLIST_0300
     * @tc.name   ：TestOHAudioRendererPlayList0300
     * @tc.desc   ：Input streaming initialization method.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHAudioRendererPlayList003', 0, async (done: Function) => {
      console.log(`testOHAudioRendererPlayList003 test start `);

      let tempMap: Map<string, number> = new Map<string, number>([
        ['RendererInfo', 1],
        ['ChannelCount', 2],
        ['EncodingType', 0],
        ['FrameSize', 0],
        ['FramesWritten', 0],
        ['LatencyMode', 0],
        ['SampleFormat', 0],
        ['SamplingRate', 48000]
      ]);

      let re: number = await testStreamBuilder.CreatAudioPlayerWithFileAndParam(
        0,
        tempMap.get('RendererInfo'),
        tempMap.get('ChannelCount'),
        tempMap.get('EncodingType'),
        tempMap.get('FrameSize'),
        tempMap.get('FramesWritten'),
        tempMap.get('LatencyMode'),
        tempMap.get('SampleFormat'),
        tempMap.get('SamplingRate')
      );
      expect(re).assertEqual(CODE_SUCCESS);
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re).assertEqual(AUDIOSTREAM_STATE_PREPARED);

      re = await testStreamBuilder.OHAudioRendererStart();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      await Utils.sleep(sleep1000);
      let verify = verifyRendererProperties(tempMap);
      expect(verify).assertTrue();
      re = testStreamBuilder.OHAudioRendererGetCurrentState();
      expect(re === AUDIOSTREAM_STATE_RUNNING).assertTrue();

      if (re === AUDIOSTREAM_STATE_RUNNING) {
        re = testStreamBuilder.OHAudioRendererPause();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

        re = testStreamBuilder.OHAudioRendererGetCurrentState();
        expect(re).assertEqual(AUDIOSTREAM_STATE_PAUSED);
      }

      if (re !== AUDIOSTREAM_STATE_STOPPED) {
        re = testStreamBuilder.OHAudioRendererStop();
        expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

        re = testStreamBuilder.OHAudioRendererGetCurrentState();
        expect(re).assertEqual(AUDIOSTREAM_STATE_STOPPED);
      }


      re = testStreamBuilder.OHAudioRendererRelease();
      expect(re).assertEqual(AUDIOSTREAM_SUCCESS);

      await testStreamBuilder.CloseAudioRender();
      await Utils.sleep(sleep500);
      console.log(`testOHAudioRendererPlayList003 test end `);
      done();
    });
  });
}
