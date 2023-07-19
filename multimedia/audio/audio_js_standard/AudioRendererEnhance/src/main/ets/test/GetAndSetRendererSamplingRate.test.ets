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
import featureAbility from '@ohos.ability.featureAbility';
import fs from '@ohos.file.fs';
import * as env from './Const.ets';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import audio from '@ohos.multimedia.audio';

export default function audioRendererTest() {
  describe('get_setRendererSamplingRate', function () {
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
    let filePath;
    async function renderPlay() {
      let bufferSize
      try {
        bufferSize = await audioRen.getBufferSize()
        console.info( `audioRenderer getBufferSize success,bufferSize:${bufferSize} \n`);
        await audioRen.start();
        console.info(`audioRenderer start success\n`);
      } catch (err) {
        console.info(`audioRenderer start : Error: ${JSON.stringify(err)}\n`);
        return;
      }

      var context = featureAbility.getContext();
      await context.getFilesDir().then((data) => {
        console.error('#####app file: '+ data);
        filePath = data;
        console.error('#####app filePath: '+ filePath);
      }).catch((Error) => {
        console.error('####app file err: ' + Error.message);
      })

      let path = filePath + '/StarWars10s-1C-8000-2SW.wav';
      console.info(`path:${path}\n`);
      try {
        let len;
        try {
          let stat = await fs.stat(path);
          console.info(`stat:${JSON.stringify(stat)}\n`);
          console.info(`size:${stat.size}\n`);
          len = stat.size % bufferSize == 0 ? Math.floor(stat.size / bufferSize) : Math.floor(stat.size / bufferSize + 1);
        }catch (error) {
          console.info(`#######audioRenderer stat : Error: ${JSON.stringify(error)}\n`);
        }

        let file = await fs.open(path, 0o0);
        console.info(`fd:${file.fd}\n`);
        let buf = new ArrayBuffer(bufferSize);
        console.info(`audioRenderer write start.......... \n`);
        for (let i = 0; i < len; i++) {
          let options = {
            offset: i * bufferSize,
            length: bufferSize
          }
          let readsize = await fs.read(file.fd, buf, options);
          let writeSize = await audioRen.write(buf);
        }
        console.info(`audioRenderer write end............ \n`);
      } catch (err) {
        console.info(`audioRenderer write : Error: ${JSON.stringify(err)}\n`);
      }
    }
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_PROMISE_0100
     * @tc.name      : AudioRenderer - getRendererSamplingRate "uint32" - promise
     * @tc.desc      : AudioRenderer - getRendererSamplingRate in prepare to get the SamplingRate
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_PROMISE_0100', 0, async function (done) {
      try{
        await audioRen.getRendererSamplingRate().then((data) => {
          console.info(`${TagFrmwkRender}: #####getRendererSamplingRate :SUCCESS ${data}`);
          expect(data).assertEqual(env.SAMPLING_RATE_44100);
          done();
        }).catch ((error)=>{
          console.log("${TagFrmwkRender}: #####getRendererSamplingRate : error = " + error);
          expect(false).assertTrue();
          done();
        });
      }catch(error){
        console.log("#####SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_PROMISE_0100: catch error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_PROMISE_0200
     * @tc.name      : AudioRenderer - getRendererSamplingRate "uint32" - promise
     * @tc.desc      : AudioRenderer - setRendererSamplingRate INVALID_INPUT_PARAMETER, then get the  default SamplingRate
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_PROMISE_0200', 0, async function (done) {
      let rate = '123';
      try{
        await audioRen.setRendererSamplingRate(rate).then((data) => {
          console.info(`${TagFrmwkRender}: setRendererSamplingRate :set ${rate}, SUCCESS`);
        }).catch ((error)=>{
          console.log("${TagFrmwkRender}: ####setRendererSamplingRate : error = " + error);
        });
      }catch(error){
        console.log("####setRendererSamplingRate: catch error = " + error);
      }

      try{
        await audioRen.getRendererSamplingRate().then((data) => {
          console.info(`${TagFrmwkRender}: #####getRendererSamplingRate :SUCCESS ${data}`);
          expect(data).assertEqual(env.SAMPLING_RATE_44100);
          done();
        }).catch ((error)=>{
          console.log("${TagFrmwkRender}: #####getRendererSamplingRate : error = " + error);
          expect(false).assertTrue();
          done();
        });
      }catch(error){
        console.log("#####getRendererSamplingRate: catch error = " + error);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_PROMISE_0300
     * @tc.name      : AudioRenderer - getRendererSamplingRate "uint32" - promise
     * @tc.desc      : AudioRenderer - set a effective SamplingRate, then set a invalid SamplingRate, can get the  effective SamplingRate
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_PROMISE_0300', 0, async function (done) {
      let samplingrate = 48000;
      try{
        await audioRen.setRendererSamplingRate(samplingrate).then((data) => {
          console.info(`${TagFrmwkRender}: ####setRendererSamplingRate :set ${samplingrate}, SUCCESS`);
        }).catch ((error)=>{
          console.log("${TagFrmwkRender}: ####setRendererSamplingRate : error = " + error);
        });
      }catch(error){
        console.log("####setRendererSamplingRate: catch error = " + error);
      }

      let rate = '123';
      try{
        await audioRen.setRendererSamplingRate(rate).then((data) => {
          console.info(`${TagFrmwkRender}: setRendererSamplingRate :set ${rate}, SUCCESS`);
        }).catch ((error)=>{
          console.log("${TagFrmwkRender}: ####setRendererSamplingRate : error = " + error);
        });
      }catch(error){
        console.log("####setRendererSamplingRate: catch error = " + error);
      }

      try{
        await audioRen.getRendererSamplingRate().then((data) => {
          console.info(`${TagFrmwkRender}: #####getRendererSamplingRate :SUCCESS ${data}`);
          expect(data).assertEqual(env.SAMPLING_RATE_48000);
          done();
        }).catch ((error)=>{
          console.log("${TagFrmwkRender}: #####getRendererSamplingRate : error = " + error);
          expect(false).assertTrue();
          done();
        });
      }catch(error){
        console.log("#####getRendererSamplingRate: catch error = " + error);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_PROMISE_0400
     * @tc.name      : AudioRenderer - getRendererSamplingRate "uint32" - promise
     * @tc.desc      : AudioRenderer - getRendererSamplingRate in running
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_PROMISE_0400', 0, async function (done) {
      try{
        renderPlay();
        await audioRen.getRendererSamplingRate().then((data) => {
          console.info(`${TagFrmwkRender}: #####getRendererSamplingRate :SUCCESS ${data}`);
          expect(data).assertEqual(env.SAMPLING_RATE_44100);
          done();
        }).catch ((error)=>{
          console.log("${TagFrmwkRender}: #####getRendererSamplingRate : error = " + error);
          expect(false).assertTrue();
          done();
        });
      }catch(error){
        console.log("#####SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_PROMISE_0400: catch error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_PROMISE_0100
     * @tc.name      : AudioRenderer -setRendererSamplingRate "uint32" - promise
     * @tc.desc      : AudioRenderer - setRendererSamplingRate in prepare, then getRendererSamplingRate
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_PROMISE_0100', 0, async function (done) {
      let samplingrate = 48000;
      try{
        await audioRen.setRendererSamplingRate(samplingrate).then((data) => {
          console.info(`${TagFrmwkRender}: #####setRendererSamplingRate :SUCCESS`);
        }).catch ((error)=>{
          console.log("${TagFrmwkRender}: #####setRendererSamplingRate : error = " + error);
          expect(false).assertTrue();
          done();
        });
      }catch(error){
        console.log("####SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_PROMISE_0100: catch error = " + error);
        expect(false).assertTrue();
        done();
      }

      try{
        await audioRen.getRendererSamplingRate().then((data) => {
          console.info(`${TagFrmwkRender}: ####getRendererSamplingRate :SUCCESS ${data}`);
          expect(data).assertEqual(env.SAMPLING_RATE_48000);
          done();
        }).catch ((error)=>{
          console.log("${TagFrmwkRender}: #####getRendererSamplingRate : error = " + error);
          expect(false).assertTrue();
          done();
        });
      }catch(error){
        console.log("#####getRendererSamplingRate: catch error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_PROMISE_0200
     * @tc.name      : AudioRenderer - setRendererSamplingRate "uint32" - promise
     * @tc.desc      : AudioRenderer - setRendererSamplingRate input unsuported option 0 to return error.code
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_PROMISE_0200', 0, async function (done)  {
      let samplingrate = 0;
      try{
        await audioRen.setRendererSamplingRate(samplingrate);
        console.info(`${TagFrmwkRender}: ####setRendererSamplingRate: success`);
      }catch(error) {
        if (error.code == env.UNSUPORTED_OPTION_6800104){
          console.log(`${TagFrmwkRender}: ####setRendererSamplingRate: catch error: [${error.code}, ${error.message}]`);
          try{
            await audioRen.getRendererSamplingRate().then((data) => {
              console.info(`${TagFrmwkRender}: getRendererSamplingRate :SUCCESS ${data}`);
              expect(data).assertEqual(env.SAMPLING_RATE_44100);
            }).catch ((error)=>{
              console.log("${TagFrmwkRender}: #####getRendererSamplingRate : error = " + error);
              expect(false).assertTrue();
            });
          }catch(error){
            console.log("####setRendererSamplingRate: catch error = " + error);
          }
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      };
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_PROMISE_0300
     * @tc.name      : AudioRenderer - setRendererSamplingRate "uint32" - promise
     * @tc.desc      : AudioRenderer - setRendererSamplingRate input invalid parameter '123' to return error.code
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_PROMISE_0300', 0, async function (done) {
      let samplingrate = '123';
      try{
        await audioRen.setRendererSamplingRate(samplingrate);
        console.info(`####setRendererSamplingRate: execution success`);
      }catch(error){
        if (error.code == env.INVALID_INPUT_PARAMETER_6800101){
          console.log(`SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_PROMISE_0300: catch error, error: [${error.code}, ${error.message}]`);
          try{
            await audioRen.getRendererSamplingRate().then((data) => {
              console.info(`${TagFrmwkRender}: ####getRendererSamplingRate :SUCCESS ${data}`);
              expect(data).assertEqual(env.SAMPLING_RATE_44100);
            }).catch ((error)=>{
              console.log("${TagFrmwkRender}: ####getRendererSamplingRate : error = " + error);
              expect(false).assertTrue();
            });
          }catch(error){
            console.log("####getRendererSamplingRate: catch error = " + error);
          }
        } else {
          expect(false).assertTrue();
          done();
        }
      };
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_PROMISE_0400
     * @tc.name      : AudioRenderer - setRendererSamplingRate "uint32" - promise
     * @tc.desc      : AudioRenderer - setRendererSamplingRate  in running, then getRendererSamplingRate
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_PROMISE_0400', 0, async function (done) {
      let samplingrate = 48000;
      try {
        renderPlay();
        await audioRen.setRendererSamplingRate(samplingrate);
        console.info(`SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_PROMISE_0400: execution success`);
      }catch (error){
        console.log("#####setRendererSamplingRate : error = " + error);
        expect(false).assertTrue();
        done();
      };

      try{
        await audioRen.getRendererSamplingRate().then((data) => {
          console.info(`${TagFrmwkRender}: ####getRendererSamplingRate :SUCCESS ${data}`);
          expect(data).assertEqual(env.SAMPLING_RATE_48000);
          done();
        }).catch ((error)=>{
          console.log("${TagFrmwkRender}: #####getRendererSamplingRate : error = " + error);
          expect(false).assertTrue();
          done();
        });
      }catch(error){
        console.log("#####getRendererSamplingRate: catch error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_CALLBACK_0100
     * @tc.name      : AudioRenderer - getRendererSamplingRate "uint32" - callback
     * @tc.desc      : AudioRenderer - getRendererSamplingRate in prepare
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_CALLBACK_0100', 0, async function (done) {
      audioRen.getRendererSamplingRate((err, data) => {
        if (err) {
          console.info(`${TagFrmwkRender}: getRendererSamplingRate ERROR! code: ${err.code}, mesage: ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwkRender}: getRendererSamplingRate Success now SamplingRate: ${data}`);
          expect(data).assertEqual(env.SAMPLING_RATE_44100);
          done();
        }
      });
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_CALLBACK_0200
     * @tc.name      : AudioRenderer - getRendererSamplingRate "uint32" - callback
     * @tc.desc      : AudioRenderer - set a valid SamplingRate, get the default SamplingRate
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_CALLBACK_0200', 0, async function (done) {
      let rate = '123';
      audioRen.setRendererSamplingRate(rate, (err) => {
        if (err) {
          console.info(`${TagFrmwkRender}: setRendererSamplingRate ERROR! code: ${err.code}, mesage: ${err.message}`);
          audioRen.getRendererSamplingRate((err, data) => {
            if (err) {
              console.info(`${TagFrmwkRender}: getRendererSamplingRate ERROR! code: ${err.code}, mesage: ${err.message}`);
              expect(false).assertTrue();
              done();
            } else {
              console.info(`${TagFrmwkRender}: getRendererSamplingRate Success! SamplingRate: ${data}`);
              expect(data).assertEqual(env.SAMPLING_RATE_44100);
              done();
            }
          });
        } else {
          console.info(`${TagFrmwkRender}:  setRendererSamplingRate : set ${rate} SUCCESS`);
          expect(false).assertTrue();
          done();
        }
      });
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_CALLBACK_0300
     * @tc.name      : AudioRenderer - getRendererSamplingRate "uint32" - callback
     * @tc.desc      : AudioRenderer - getRendererSamplingRate
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_CALLBACK_0300', 0, async function (done) {
      let rate1 = 48000;
      audioRen.setRendererSamplingRate(rate1, (err) => {
        if (err) {
          console.info(`${TagFrmwkRender}: set rate1 ERROR! code: ${err.code}, mesage: ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwkRender}: set rate1: ${rate1} SUCCESS! begin set rate2`);
          let rate2 = '123';
          audioRen.setRendererSamplingRate(rate2, (err) => {
            if (err) {
              console.info(`${TagFrmwkRender}: set rate2 ERROR! code: ${err.code}, mesage: ${err.message}`);
              audioRen.getRendererSamplingRate((err, data) => {
                if (err) {
                  console.info(`${TagFrmwkRender}: getRendererSamplingRate ERROR! code: ${err.code}, mesage: ${err.message}`);
                  expect(false).assertTrue();
                  done();
                } else {
                  console.info(`${TagFrmwkRender}: getRendererSamplingRate Success now sampling rate: ${data}`);
                  expect(data).assertEqual(env.SAMPLING_RATE_48000);
                  done();
                }
              });
            } else {
              console.info(`${TagFrmwkRender}: set Rate2: ${rate2} SUCCESS! testcase FAIL!`);
              expect(false).assertTrue();
              done();
            }
          });
        }
      });
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_CALLBACK_0400
     * @tc.name      : AudioRenderer - getRendererSamplingRate "uint32" - callback
     * @tc.desc      : AudioRenderer - getRendererSamplingRate "uint32" - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_CALLBACK_0400', 0, async function (done) {
      renderPlay();
      audioRen.getRendererSamplingRate((err, data) => {
        if (err) {
          console.info(`${TagFrmwkRender}:getRendererSamplingRate ERROR! code: ${err.code}, mesage: ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwkRender}:getRendererSamplingRate Success! now samplingRate: ${data}`);
          expect(data).assertEqual(env.SAMPLING_RATE_44100);
          done();
        }
      });
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_CALLBACK_0100
     * @tc.name      : AudioRenderer - setRendererSamplingRate "uint32" - callback
     * @tc.desc      : AudioRenderer - setRendererSamplingRate "uint32" - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_CALLBACK_0100', 0, async function (done) {
      let rate = 48000;
      audioRen.setRendererSamplingRate(rate, (err) => {
        if (err) {
          console.info(`${TagFrmwkRender}: setRendererSamplingRate ERROR! code: ${err.code}, mesage: ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwkRender}: setRendererSamplingRate : set ${rate} SUCCESS start getting samplingRate`);
          audioRen.getRendererSamplingRate((err, data) => {
            if (err) {
              console.info(`${TagFrmwkRender}: getRendererSamplingRate ERROR! code: ${err.code}, mesage: ${err.message}`);
              expect(false).assertTrue();
              done();
            } else {
              console.info(`${TagFrmwkRender}: getRendererSamplingRate Success! samplingRate: ${data}`);
              expect(data).assertEqual(env.SAMPLING_RATE_48000);
              done();
            }
          });
        }
      });
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_CALLBACK_0200
     * @tc.name      : AudioRenderer - setRendererSamplingRate "uint32" - callback
     * @tc.desc      : AudioRenderer - setRendererSamplingRate "uint32" - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_CALLBACK_0200', 0, async function (done) {
      let rate = 0;
      audioRen.setRendererSamplingRate(rate, (err) => {
        if (err.code == env.UNSUPORTED_OPTION_6800104) {
          console.info(`${TagFrmwkRender}: setRendererSamplingRate ERROR! code: ${err.code}, mesage: ${err.message} start getting samplingRate`);
          audioRen.getRendererSamplingRate((err, data) => {
            if (err) {
              console.info(`${TagFrmwkRender}: getRendererSamplingRate ERROR! code: ${err.code}, mesage: ${err.message}`);
              expect(false).assertTrue();
              done();
            } else {
              console.info(`${TagFrmwkRender}: getRendererSamplingRate Success! now samplingRate: ${data}`);
              expect(data).assertEqual(env.SAMPLING_RATE_44100);
              done();
            }
          });
        } else {
          console.info(`${TagFrmwkRender}: setRendererSamplingRate Success! testcase FAIL!`);
          expect(false).assertTrue();
          done();
        }
      });
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_CALLBACK_0300
     * @tc.name      : AudioRenderer - setRendererSamplingRate "uint32" - callback
     * @tc.desc      : AudioRenderer - setRendererSamplingRate "uint32" - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_CALLBACK_0300', 0, async function (done) {
      let rate = '123';
      audioRen.setRendererSamplingRate(rate, (err) => {
        if (err.code == env.INVALID_INPUT_PARAMETER_6800101) {
          console.info(`${TagFrmwkRender}: setRendererSamplingRate ERROR! code: ${err.code}, mesage: ${err.message} start getting samplingRate`);
          audioRen.getRendererSamplingRate((err, data) => {
            if (err) {
              console.info(`${TagFrmwkRender}:getRendererSamplingRate ERROR! code: ${err.code}, mesage: ${err.message}`);
              expect(false).assertTrue();
              done();
            } else {
              console.info(`${TagFrmwkRender}:getRendererSamplingRate Success! now samplingRate: ${data}`);
              expect(data).assertEqual(env.SAMPLING_RATE_44100);
              done();
            }
          });
        } else {
          console.info(`${TagFrmwkRender}: setRendererSamplingRate Success! testcase FAIL!`);
          expect(false).assertTrue();
          done();
        }
      });
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_CALLBACK_0400
     * @tc.name      : AudioRenderer - setRendererSamplingRate "uint32" - callback
     * @tc.desc      : AudioRenderer - setRendererSamplingRate "uint32" - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETRENDERERSAMPLINGRATE_CALLBACK_0400', 0, async function (done) {
      let rate = 48000;
      renderPlay();
      audioRen.setRendererSamplingRate(rate, (err) => {
        if (err) {
          console.info(`${TagFrmwkRender}:setRendererSamplingRate ERROR! code: ${err.code}, mesage: ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwkRender}:setRendererSamplingRate : set samplingRate:${rate} SUCCESS! start getting samplingRate`);
          audioRen.getRendererSamplingRate((err, data) => {
            if (err) {
              console.info(`${TagFrmwkRender}:getRendererSamplingRate : ERROR : code: ${err.code}, mesage: ${err.message}`);
              expect(false).assertTrue();
              done();
            } else {
              console.info(`${TagFrmwkRender}:getRendererSamplingRate : Success ${data}`);
              expect(data).assertEqual(env.SAMPLING_RATE_48000);
              done();
            }
          });
        }
      });
    });

  })
}