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
  describe('get_setRendererSamplingRatePerf', function () {
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

    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_PROMISE_0500', 0, async function (done) {
      let number = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_PROMISE_REL`
      for (let index = 0; index < env.GENERAL_RUN_TIMES; index++){
        try {
          let rate = await audioRen.getRendererSamplingRate();
          expect(rate).assertEqual(env.SAMPLING_RATE_44100);
        } catch (error) {
          console.log(`${TagFrmwkRender}: ${number} execution ${index + 1} times error: ${JSON.stringify(error)}`);
          expect(false).assertTrue();
          done();
          return;
        }
      }
      console.log(`${number}: test finish`);
      done();
    });

    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_PROMISE_PERF',0, async function (done) {
      // Defines a test case. This API supports zaro parameters: test case name, filter parameter, and test case function.
      let number = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_PROMISE_PERF`
      let startTime = new Date().getTime()
      for (let index = 0; index < env.GENERAL_RUN_TIMES; index++){
        await audioRen.getRendererSamplingRate();
      }
      let endTime = new Date().getTime()
      let averageTime = (endTime - startTime) * 1000 / env.GENERAL_RUN_TIMES
      console.info(`${number} averageTime: ${averageTime} us`)
      done();
    })

    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_PROMISE_0500', 0, async function (done) {
      let number = `SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_PROMISE_0500`
      let rate = 48000
      for (let index = 0; index < env.GENERAL_RUN_TIMES; index++){
        try {
          await audioRen.setRendererSamplingRate(rate);
          expect(true).assertTrue();
        } catch (error) {
          console.log(`${TagFrmwkRender}: ${number} execution ${index + 1} times error: ${JSON.stringify(error)}`);
          expect(false).assertTrue();
          done();
          return;
        }
      }
      console.log(`${number}: test finish`);
      done();
    });

    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_PROMISE_PERF',0, async function (done) {
      // Defines a test case. This API supports one parameters: test case name, filter parameter, and test case function.
      let number = `SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_PROMISE_PERF`
      let rate = 48000
      let startTime = new Date().getTime()
      for (let index = 0; index < env.GENERAL_RUN_TIMES; index++){
        await audioRen.setRendererSamplingRate(rate);
      }
      let endTime = new Date().getTime()
      let averageTime = (endTime - startTime) * 1000 / env.GENERAL_RUN_TIMES
      console.info(`${number} averageTime: ${averageTime} us`)
      done();
    })

    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_CALLBACK_0500',0, async function (done) {
      // Defines a test case. This API supports zaro parameters: test case name, filter parameter, and test case function.
      let number = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_CALLBACK_0500`
      getRendererSamplingRateTest(0)
      function getRendererSamplingRateTest(index) {
        try {
          audioRen.getRendererSamplingRate((err, data) => {
            if (index < env.GENERAL_RUN_TIMES) {
              getRendererSamplingRateTest(index + 1)
              expect(data).assertEqual(44100)
            } else {
              console.info(`${number} : test finish`)
              done();
            }
          })
        } catch (error) {
          console.log(`${TagFrmwkRender}: ${number} execution ${index + 1} times error: ${JSON.stringify(error)}`);
          done();
        }
      }
    })

    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_CALLBACK_PERF',0, async function (done) {
      // Defines a test case. This API supports one parameters: test case name, filter parameter, and test case function.
      let number = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_CALLBACK_PERF`
      let startTime = new Date().getTime()
      getRendererSamplingRateTest(0)
      function getRendererSamplingRateTest(index){
        audioRen.getRendererSamplingRate((err, data) => {
          if (index < env.GENERAL_RUN_TIMES){
            getRendererSamplingRateTest(index + 1)
          }else{
            let endTime = new Date().getTime()
            let averageTime = (endTime - startTime) * 1000 / env.GENERAL_RUN_TIMES
            console.info(`${number} averageTime: ${averageTime} us`)
            done()
          }
        })
      }
    })

    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_CALLBACK_0500',0, async function (done) {
      // Defines a test case. This API supports zaro parameters: test case name, filter parameter, and test case function.
      let number = `SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_CALLBACK_0500`
      let rate = 48000
      setRendererSamplingRateTest(0)
      function setRendererSamplingRateTest(index) {
        try {
          audioRen.setRendererSamplingRate(rate,(err, data) => {
            if (index < env.GENERAL_RUN_TIMES) {
              setRendererSamplingRateTest(index + 1)
              expect(true).assertTrue();
            } else {
              console.info(`${number} : test finish`)
              done();
            }
          })
        } catch (error) {
          console.log(`${TagFrmwkRender}: ${number} execution ${index + 1} times error: ${JSON.stringify(error)}`);
          done();
        }
      }
    })

    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_CALLBACK_PERF',0, async function (done) {
      // Defines a test case. This API supports one parameters: test case name, filter parameter, and test case function.
      let number = `SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_CALLBACK_PERF`
      let rate = 48000
      let startTime = new Date().getTime()
      setRendererSamplingRateTest(0)
      function setRendererSamplingRateTest(index){
        audioRen.setRendererSamplingRate(rate,(err, data) => {
          if (index < env.GENERAL_RUN_TIMES){
            setRendererSamplingRateTest(index + 1)
          }else{
            let endTime = new Date().getTime()
            let averageTime = (endTime - startTime) * 1000 / env.GENERAL_RUN_TIMES
            console.info(`${number} averageTime: ${averageTime} us`)
            done()
          }
        })
      }
    })
  })
}