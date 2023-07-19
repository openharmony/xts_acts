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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import audio from '@ohos.multimedia.audio';
import * as env from './Const.ets';

export default function audioRendererTest() {
  describe('getMax_MinStreamVolumePerf', function () {
    let TagFrmwkRender = "audioRendererEnhanceTest";
    let audioRen;
    console.info(`${TagFrmwkRender}: Create AudioManger Object JS Framework`);
    beforeAll(function () {
      console.info(`${TagFrmwkRender}: beforeAll: Prerequisites at the test suite level`);
    })
    beforeEach(async function () {
      console.info(`${TagFrmwkRender}: beforeEach: Prerequisites at the test case level`);
      await sleep(1000);
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }
      let AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      try{
        await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
          audioRen = data;
          console.info('audioRendererEnhanceTest: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
          console.info('audioRendererEnhanceTest: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
        }).catch((err) => {
          console.info('audioRendererEnhanceTest: AudioRender Created : ERROR : ' + err.message);
        });
      }catch (error){
        console.info('audioRendererEnhanceTest: AudioRender Created : catch ERROR : ' + error.code + error.message);
      }
    })
    afterEach(async function () {
      console.info(`${TagFrmwkRender}: afterEach: Test case-level clearance conditions`);
      sleep(2000);
      await audioRen.release().then(() => {
        console.info(`${TagFrmwkRender}: Renderer release : SUCCESS`);
      }).catch((err) => {
        console.info(`${TagFrmwkRender}: Renderer release :ERROR : ${err.message}`);
      });
    })
    afterAll(async function () {
      console.info(`${TagFrmwkRender}: afterAll: Test suite-level cleanup condition`);
    })
    function sleep(ms) {
      return new Promise(resolve => setTimeout(resolve, ms));
    }

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_PROMISE_0500
     * @tc.name    Test getMaxStreamVolume Reliability - promise
     * @tc.desc    Reliability test
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_PROMISE_0500', 0, async function (done) {
      for (let index = 0; index < env.GENERAL_RUN_TIMES; index++) {
        try {
          let data = await audioRen.getMaxStreamVolume();
          expect(data).assertEqual(env.OUTPUT_NUMBER_1);
        } catch (error) {
          console.log(`${TagFrmwkRender}: ####getMaxStreamVolume: execution ${index + 1} times error: ${JSON.stringify(error)}`);
          expect(false).assertTrue();
          done();
          return;
        }
      }
      console.log(`${TagFrmwkRender}: ####getMaxStreamVolume: test finish`);
      done();
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_PROMISE_PERF
     * @tc.name    Test getMaxStreamVolume Performance - promise
     * @tc.desc    Performance test
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_PROMISE_PERF',0, async function (done) {
      let number = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_PROMISE_PERF`
      let startTime = new Date().getTime()
      for (let index = 0; index < env.GENERAL_RUN_TIMES; index++){
        await audioRen.getMaxStreamVolume();
      }
      let endTime = new Date().getTime()
      let averageTime = (endTime - startTime) * 1000 / env.GENERAL_RUN_TIMES
      console.info(`${TagFrmwkRender}: ${number} averageTime: ${averageTime} us`)
      done()
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_PROMISE_0500
     * @tc.name    Test getMinStreamVolume Reliability - promise
     * @tc.desc    Reliability test
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_PROMISE_0500', 0, async function (done) {
      for (let index = 0; index < env.GENERAL_RUN_TIMES; index++) {
        try {
          let data = await audioRen.getMinStreamVolume();
          expect(data).assertEqual(env.OUTPUT_NUMBER_0);
        } catch (error) {
          console.log(`${TagFrmwkRender}: ####getMinStreamVolume: execution ${index + 1} times error: ${JSON.stringify(error)}`);
          expect(false).assertTrue();
        }
      }
      console.log(`${TagFrmwkRender}: ####getMinStreamVolume: test finish`);
      done();
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_PROMISE_PERF
     * @tc.name    Test getMinStreamVolume Performance - promise
     * @tc.desc    Performance test
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_PROMISE_PERF',0, async function (done) {
      let number = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_PROMISE_PERF`
      let startTime = new Date().getTime()
      for (let index = 0; index < env.GENERAL_RUN_TIMES; index++){
        await audioRen.getMinStreamVolume();
      }
      let endTime = new Date().getTime()
      let averageTime = (endTime - startTime) * 1000 / env.GENERAL_RUN_TIMES
      console.info(`${TagFrmwkRender}: ${number} averageTime: ${averageTime}`)
      done()
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_CALLBACK_0500
     * @tc.name    Test getMaxStreamVolume Reliability - callback
     * @tc.desc    Reliability test
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_CALLBACK_0500', 0, async function (done) {
      let recursive = function (n) {
        if (n <= 0) {
          console.log(`${TagFrmwkRender}: ####getMaxStreamVolume: test finish`);
          done();
          return;
        }else{
          try{
            audioRen.getMaxStreamVolume((err,data)=>{
              if (err) {
                console.info(`${TagFrmwkRender}: ####getMaxStreamVolume: execution ${env.GENERAL_RUN_TIMES - n + 1} times fail,error: [${err.code}, ${err.message}]`);
                expect(false).assertTrue();
                done();
                return;
              }else{
                expect(data).assertEqual(env.OUTPUT_NUMBER_1);
                recursive(n-1);
              }
            });
          }catch(error){
            console.info(`${TagFrmwkRender}: ####getMaxStreamVolume: execution ${env.GENERAL_RUN_TIMES - n + 1} times catch error, error: [${error.code}, ${error.message}]`);
            expect(false).assertTrue();
            done();
            return;
          };
        }
      }
      recursive(env.GENERAL_RUN_TIMES);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_CALLBACK_PERF
     * @tc.name    Test getMaxStreamVolume Performance - callback
     * @tc.desc    Performance test
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_CALLBACK_PERF',0, async function (done) {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let number = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETMAXSTREAMVOLUME_CALLBACK_PERF`
      let startTime = new Date().getTime()
      getMaxStreamVolumeCallbackPerfTest(0)
      function getMaxStreamVolumeCallbackPerfTest(index){
        audioRen.getMaxStreamVolume((err, data) => {
          if (index < env.GENERAL_RUN_TIMES){
            getMaxStreamVolumeCallbackPerfTest(index + 1)
          }else{
            let endTime = new Date().getTime()
            let averageTime = (endTime - startTime) * 1000 /env.GENERAL_RUN_TIMES
            console.info(`${TagFrmwkRender}: ${number} averageTime: ${averageTime} us,check success`)
            done()
          }
        })
      }
    })

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_CALLBACK_0500
     * @tc.name    Test getMinStreamVolume Reliability - callback
     * @tc.desc    Reliability test
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_CALLBACK_0500', 0, async function (done) {
      let recursive = function (n) {
        if (n <= 0) {
          console.log(`${TagFrmwkRender}: SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_CALLBACK_0500: test finish`);
          done();
          return;
        }else{
          try{
            audioRen.getMinStreamVolume((err,data)=>{
              if (err) {
                console.info(`${TagFrmwkRender}: ####getMinStreamVolume: execution ${env.GENERAL_RUN_TIMES - n + 1} times fail,error: [${err.code}, ${err.message}]`);
                expect(false).assertTrue();
                done();
                return;
              }else{
                expect(data).assertEqual(env.OUTPUT_NUMBER_0);
                recursive(n-1);
              }
            });
          }catch(error){
            console.info(`${TagFrmwkRender}: ####getMinStreamVolume: execution ${env.GENERAL_RUN_TIMES - n + 1} times catch error, error: [${error.code}, ${error.message}]`);
            expect(false).assertTrue();
            done();
            return;
          };
        }
      }
      recursive(env.GENERAL_RUN_TIMES);
    });

    /**
     * @tc.number  SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_CALLBACK_PERF
     * @tc.name    Test getMinStreamVolume Performance - callback
     * @tc.desc    Performance test
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_CALLBACK_PERF',0, async function (done) {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let number = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETMINSTREAMVOLUME_CALLBACK_PERF`
      let startTime = new Date().getTime()
      getMinStreamVolumeCallbackPerfTest(0)
      function getMinStreamVolumeCallbackPerfTest(index){
        audioRen.getMinStreamVolume((err, data) => {
          if (index < env.GENERAL_RUN_TIMES){
            getMinStreamVolumeCallbackPerfTest(index + 1)
          }else{
            let endTime = new Date().getTime()
            let averageTime = (endTime - startTime) * 1000 /env.GENERAL_RUN_TIMES
            console.info(`getMinStreamVolume: ${number} averageTime: ${averageTime} us,check success`)
            done()
          }
        })
      }
    })

  })
}