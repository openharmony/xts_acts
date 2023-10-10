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
import * as env from './Const';

export default function audioRendererEnhanceTest() {
  describe('setChannelBlendMode', function () {
    let Tag = "audioRendererEnhanceTest";
    let audioRen;
    console.info(`${Tag}: Create AudioManger Object JS Framework`);
    beforeAll(function () {
      console.info(`${Tag}: beforeAll: Prerequisites at the test suite level`);
    })
    beforeEach(async function () {
      console.info(`${Tag}: beforeEach: Prerequisites at the test case level`);
      await sleep(1000);
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
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
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data state: ' + Object.keys(data));
          console.info('AudioFrameworkRenderLog: AudioRender Created : Success : Stream Type: SUCCESS data value: ' + JSON.stringify(data));
        }).catch((err) => {
          console.info('AudioFrameworkRenderLog: AudioRender Created : ERROR : ' + err.message);
        });
      }catch (error){
        console.info('AudioFrameworkRenderLog: AudioRender Created : catch ERROR : ' + error.code + error.message);
      }
    })
    afterEach(async function () {
      console.info(`${Tag}: afterEach: Test case-level clearance conditions`);
      sleep(2000);
      await audioRen.release().then(() => {
        console.info(`${Tag}: Renderer release : SUCCESS`);
      }).catch((err) => {
        console.info(`${Tag}: Renderer release :ERROR : ${err.message}`);
      });
    })
    afterAll(async function () {
      console.info(`${Tag}: afterAll: Test suite-level cleanup condition`);
    })
    function sleep(ms) {
      return new Promise(resolve => setTimeout(resolve, ms));
    }

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_PROMISE_0100
     * @tc.name      : AudioRenderer - setChannelBlendMode - promise
     * @tc.desc      : AudioRenderer - setChannelBlendMode - promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_PROMISE_0100', 0, async function (done) {
      try{
        await audioRen.setChannelBlendMode(audio.ChannelBlendMode.MODE_DEFAULT).then(() => {
          console.info(`${Tag}: setChannelBlendMode :SUCCESS`);
          expect(true).assertTrue();
          done();
        }).catch ((error)=>{
          console.log(`setChannelBlendMode : error ${error.message}, ${error.code}`);
          expect(false).assertTrue();
          done();
        });
      }catch(error){
        console.log(`${Tag} setChannelBlendMode : error ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_PROMISE_0200
     * @tc.name      : AudioRenderer - setChannelBlendMode - promise
     * @tc.desc      : AudioRenderer - setChannelBlendMode - promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_PROMISE_0200', 0, async function (done) {
      try{
        await audioRen.setChannelBlendMode(audio.ChannelBlendMode.MODE_BLEND_LR).then(() => {
          console.info(`${Tag}:  setChannelBlendMode :SUCCESS`);
          expect(true).assertTrue();
          done();
        }).catch ((error)=>{
          console.log(` setChannelBlendMode : error ${error.message}, ${error.code}`);
          expect(false).assertTrue();
          done();
        });
      }catch(error){
        console.log(`${Tag}  setChannelBlendMode : error ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_PROMISE_0300
     * @tc.name      : AudioRenderer - setChannelBlendMode - promise
     * @tc.desc      : AudioRenderer - setChannelBlendMode - promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_PROMISE_0300', 0, async function (done) {
      try{
        await audioRen.setChannelBlendMode(audio.ChannelBlendMode.MODE_ALL_LEFT).then(() => {
          console.info(`${Tag}:  setChannelBlendMode :SUCCESS`);
          expect(true).assertTrue();
          done();
        }).catch ((error)=>{
          console.log(` setChannelBlendMode : error ${error.message}, ${error.code}`);
          expect(false).assertTrue();
          done();
        });
      }catch(error){
        console.log(`${Tag}  setChannelBlendMode : error ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_PROMISE_0400
     * @tc.name      : AudioRenderer - setChannelBlendMode - promise
     * @tc.desc      : AudioRenderer - setChannelBlendMode - promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_PROMISE_0400', 0, async function (done) {
      try{
        await audioRen.setChannelBlendMode(audio.ChannelBlendMode.MODE_ALL_RIGHT).then(() => {
          console.info(`${Tag}:  setChannelBlendMode :SUCCESS`);
          expect(true).assertTrue();
          done();
        }).catch ((error)=>{
          console.log(` setChannelBlendMode : error ${error.message}, ${error.code}`);
          expect(false).assertTrue();
          done();
        });
      }catch(error){
        console.log(`${Tag}  setChannelBlendMode : error ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_CALLBACK_0500
     * @tc.name      : AudioRenderer - setChannelBlendMode - callback
     * @tc.desc      : AudioRenderer - setChannelBlendMode - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_CALLBACK_0500', 0, async function (done) {
      try{
        //unsupported option, 6800104
        await audioRen.setChannelBlendMode(env.INPUT_PARAMETER_TYPE_NUMBER, (err) => {
          if (err) {
            if (err.code == env.UNSUPORTED_OPTION_6800104) {
              console.info(` setChannelBlendMode input parameter type -1: ${err.message}, ${err.code}`)
              expect(true).assertTrue();
              done();
            } else {
              console.log(` setChannelBlendMode : error ${err.message}, ${err.code}`);
              expect(false).assertTrue();
              done();
            }
          } else {
            console.info(` setChannelBlendMode :SUCCESS`);
            expect(false).assertTrue();
            done();
          }
        });
      }catch(error){
        console.log(`${Tag}  setChannelBlendMode : error ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_CALLBACK_0600
     * @tc.name      : AudioRenderer - setChannelBlendMode - callback
     * @tc.desc      : AudioRenderer - setChannelBlendMode - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_CALLBACK_0600', 0, async function (done) {
      try{
        //unsupported option, 6800104
        await audioRen.setChannelBlendMode(env.INPUT_PARAMETER_TYPE_NUMBER_4, (err) => {
          if (err) {
            if (err.code == env.UNSUPORTED_OPTION_6800104) {
              console.info(` setChannelBlendMode input parameter type 4: ${err.message}, ${err.code}`)
              expect(true).assertTrue();
              done();
            } else {
              console.log(` setChannelBlendMode : error ${err.message}, ${err.code}`);
              expect(false).assertTrue();
              done();
            }
          } else {
            console.info(` setChannelBlendMode :SUCCESS`);
            expect(false).assertTrue();
            done();
          }
        });
      }catch(error){
        console.log(`${Tag}  setChannelBlendMode : error ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_CALLBACK_0700
     * @tc.name      : AudioRenderer - setChannelBlendMode - callback
     * @tc.desc      : AudioRenderer - setChannelBlendMode - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_CALLBACK_0700', 0, async function (done) {
      try{
        //invalid parameter, 6800101
        await audioRen.setChannelBlendMode(env.INVALID_PARAMETER_STRING, (err) => {
          if (err) {
            if (err.code == env.INVALID_INPUT_PARAMETER_6800101) {
              console.info(` setChannelBlendMode invalid parameter type '123': ${err.message}, ${err.code}`)
              expect(true).assertTrue();
              done();
            } else {
              console.log(` setChannelBlendMode : error ${err.message}, ${err.code}`);
              expect(false).assertTrue();
              done();
            }
          } else {
            console.info(` setChannelBlendMode :SUCCESS`);
            expect(false).assertTrue();
            done();
          }
        });
      }catch(error){
        console.log(`${Tag}  setChannelBlendMode : error ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_CALLBACK_0800
     * @tc.name      : AudioRenderer - setChannelBlendMode - callback
     * @tc.desc      : AudioRenderer - setChannelBlendMode - callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_SETCHANNELBLENMODE_CALLBACK_0800', 0, async function (done) {
      try{
        for (let index in audio.StreamUsage) {
          let AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          }
          let AudioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_SPEECH,
            usage: Number(audio.StreamUsage[index]),
            rendererFlags: 0
          }
          let AudioRendererOptions = {
            streamInfo: AudioStreamInfo,
            rendererInfo: AudioRendererInfo
          }
          let audioRender;
          if (Number(audio.StreamUsage[index]) != env.AUDIO_STREAM_USAGE_SYSTEM) {
            try {
              await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
                audioRender = data;
                console.info(`${Tag}: AudioRender Created : Stream Type: ${index} SUCCESS`);
              }).catch((err) => {
                console.info(`${Tag}: AudioRender Created : ${index} ERROR : ${err.message}, ${err.code}`);
              });
            } catch (error) {
              console.info(`${Tag}: AudioRender Created : catch ERROR : ${error.message}, ${error.code}`);
            }
            for (let key in audio.ChannelBlendMode) {
              await audioRender.setChannelBlendMode(Number(audio.ChannelBlendMode[key]), (err) => {
                if (err) {
                  console.log(` setChannelBlendMode : ${index} set ${key} error ${err.message}, ${err.code}`);
                  expect(false).assertTrue();
                  done();
                } else {
                  console.info(`${Tag}:  setChannelBlendMode : ${index} set ${key} SUCCESS`);
                }
              });
              await sleep(20);
            }
          }
        }
        done();
      }catch(error){
        console.log(`${Tag}  setChannelBlendMode : error ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

  })
}