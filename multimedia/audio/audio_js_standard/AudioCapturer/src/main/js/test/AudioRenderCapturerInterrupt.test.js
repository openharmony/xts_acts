/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:// www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import audio from '@ohos.multimedia.audio';
import featureAbility from '@ohos.ability.featureAbility';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { UiDriver, BY } from '@ohos.UiTest'
export default function audioCapturerInterrupt() {
    describe("AudioRenderCapturerInterruptUnitTest", function () {
        async function getPermission() {
            let permissions = ['ohos.permission.MICROPHONE'];
            featureAbility.getContext().requestPermissionsFromUser(permissions, 0, (data) => {
                console.info("request success" + JSON.stringify(data));
            })
        }
        async function driveFn() {
            console.info(`come in driveFn`);
            let driver = await UiDriver.create();
            console.info(`driver is ${JSON.stringify(driver)}`);
            await sleep(100);
            console.info(`UiDriver start`);
            let button = await driver.findComponent(BY.text('允许'));
            console.info(`button is ${JSON.stringify(button)}`);
            await sleep(100);
            await button.click();
        }

        beforeAll(async function () {
            // await getPermission();
            // await driveFn();
            console.info('beforeAll called')
        })

        afterAll(function () {
            console.info('afterAll called')
        })

        beforeEach(function () {
            console.info('beforeEach called')
        })

        afterEach(function () {
            console.info('afterEach called')
        })

        let capturerInfo = {
            "MIC": {
                source: audio.SourceType.SOURCE_TYPE_MIC,
                capturerFlags: 0,
            },
            'VOICE_RECOGNITION': {
                source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
                capturerFlags: 0,
            },
            'VOICE_COMMUNICATION': {
                source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
                capturerFlags: 0,
            },
            'PLAYBACK_CAPTURE': {
                source: audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE,
                capturerFlags: 0,
            }
        }

        let renderInfo = {
            'MUSIC': {
                content: audio.ContentType.CONTENT_TYPE_MUSIC,
                usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
                rendererFlags: 0,
            },
            'VOICE_CALL': {
                content: audio.ContentType.CONTENT_TYPE_SPEECH,
                usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
                rendererFlags: 0
            },
            'RINGTONE': {
                content: audio.ContentType.CONTENT_TYPE_MUSIC,
                usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
                rendererFlags: 0,
            },
            'VOICE_ASSISTANT': {
                content: audio.ContentType.CONTENT_TYPE_SPEECH,
                usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
                rendererFlags: 0
            },
            'ULTRASONIC': {
                content: audio.ContentType.CONTENT_TYPE_ULTRASONIC,
                usage: audio.StreamUsage.STREAM_USAGE_SYSTEM,
                rendererFlags: 0
            },
            'ALARM': {
                content: audio.ContentType.CONTENT_TYPE_MUSIC,
                usage: audio.StreamUsage.STREAM_USAGE_ALARM,
                rendererFlags: 0
            },
            'ACCESSIBILITY': {
                content: audio.ContentType.CONTENT_TYPE_SPEECH,
                usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
                rendererFlags: 0
            },
            'SPEECH': {
                content: audio.ContentType.CONTENT_TYPE_SPEECH,
                usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
                rendererFlags: 0
            },
            'MOVIE': {
                content: audio.ContentType.CONTENT_TYPE_MOVIE,
                usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
                rendererFlags: 0
            },
            'UNKNOW': {
                content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
                usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
                rendererFlags: 0
            },
            'VOICE_MESSAGE': {
                content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
                usage: audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE,
                rendererFlags: 0
            },
            
            'GAME': {
                content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
                usage: audio.StreamUsage.STREAM_USAGE_GAME,
                rendererFlags: 0
            },
            'NAVIGATION': {
                content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
                usage: audio.StreamUsage.STREAM_USAGE_NAVIGATION,
                rendererFlags: 0
            },
            'NOTIFICATION': {
                content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
                usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
                rendererFlags: 0
            }



        }

        let streamInfo = {
            '16000': {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            },
            '44100': {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            },
            '48000': {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            },
        }

        async function createAudioRenderer(AudioRendererInfo, AudioStreamInfo, done) {
            let render = null;

            var AudioRendererOptions = {
                streamInfo: AudioStreamInfo,
                rendererInfo: AudioRendererInfo
            }
            try {
                render = await audio.createAudioRenderer(AudioRendererOptions)
                console.log("createAudioRenderer success.")
            } catch (err) {
                console.log("createAudioRenderer err:" + JSON.stringify(err))
                expect(false).assertEqual(true)
                done()
            }
            return render
        }

        async function renderStart(render, done) {
            try {
                await render.start()
                console.log("renderStart success.")
            } catch (err) {
                await renderRelease(render, done)
                console.log("renderStart err:" + JSON.stringify(err))
                expect(false).assertEqual(true)
                done()
            }
        }

        async function renderRelease(render, done) {
            if (render.state == audio.AudioState.STATE_RELEASED) {
                console.log("renderRelease render state: " + render.state)
                return
            }
            try {
                await render.release()
                console.log("renderRelease success.")
            } catch (err) {
                console.log("renderRelease err:" + JSON.stringify(err))
                expect(false).assertEqual(true)
                done()
            }
        }

        async function createAudioCapturer(AudioCapturerInfo, AudioStreamInfo, done) {
            console.info('createAudioCapturer come in  ')


            let capturer = null;

            var AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }
            try {
                capturer = await audio.createAudioCapturer(AudioCapturerOptions)
                console.log("createAudioCapturer success.")
            } catch (err) {
                console.log("createAudioCapturer err:" + JSON.stringify(err))
                expect(false).assertEqual(true)
                done()
            }
            return capturer
        }

        async function capturerStart(capturer, done) {
            console.info('capturerStart come in')
            try {
                await capturer.start()
                console.log("capturerStart success.")
            } catch (err) {
                await capturerRelease(capturer, done)
                console.log("capturerStart err:" + JSON.stringify(err))
                expect(false).assertEqual(true)
                done()
            }
        }

        async function capturerStartFail(capturer, done, capturer1) {
            try {
                await capturer.start()
                console.log("capturerStartFail success.")
            } catch (err) {
                console.log("capturerStartFail err:" + JSON.stringify(err))
                await capturerRelease(capturer, done)
                await capturerRelease(capturer1, done)
                expect(true).assertEqual(true)
                done()
            }
        }

        async function capturerRelease(capturer, done) {
            if (capturer.state == audio.AudioState.STATE_RELEASED) {
                console.log("capturerRelease current state: " + capturer.state)
                return
            }
            try {
                await capturer.release()
                console.log("capturerRelease success.")
            } catch (err) {
                console.log("capturerRelease err:" + JSON.stringify(err))
                expect(false).assertEqual(true)
                done()
            }
        }

        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }


        /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_001
        *@tc.name      : AudioCapturer  MIC INTERRUPT VOICE_ASSISTANT
        *@tc.desc      : AudioCapturer  MIC INTERRUPT VOICE_ASSISTANT
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_001', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("001 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("001 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

           /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_002
        *@tc.name      : AudioCapturer  PLAYBACK_CAPTURE INTERRUPT VOICE_ASSISTANT
        *@tc.desc      : AudioCapturer  PLAYBACK_CAPTURE INTERRUPT VOICE_ASSISTANT
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_002', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("002 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['PLAYBACK_CAPTURE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("002 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })
        
    

          /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_004
        *@tc.name      : AudioCapturer  VOICE_COMMUNICATION INTERRUPT VOICE_ASSISTANT
        *@tc.desc      : AudioCapturer  VOICE_COMMUNICATION INTERRUPT VOICE_ASSISTANT
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_004', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("004 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("004 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

         /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_005
        *@tc.name      : AudioCapturer  VOICE_RECOGNITION INTERRUPT VOICE_ASSISTANT
        *@tc.desc      : AudioCapturer  VOICE_RECOGNITION INTERRUPT VOICE_ASSISTANT
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_005', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("005 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("005 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

      


         /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_007
        *@tc.name      : AudioCapturer  MIC INTERRUPT ALARM
        *@tc.desc      : AudioCapturer  MIC INTERRUPT ALARM
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_007', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("007 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("007 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

           /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_008
        *@tc.name      : AudioCapturer  PLAYBACK_CAPTURE INTERRUPT ALARM
        *@tc.desc      : AudioCapturer  PLAYBACK_CAPTURE INTERRUPT ALARM
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_008', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("008 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['PLAYBACK_CAPTURE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("008 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })
        
        

          /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_010
        *@tc.name      : AudioCapturer  VOICE_COMMUNICATION INTERRUPT ALARM
        *@tc.desc      : AudioCapturer  VOICE_COMMUNICATION INTERRUPT ALARM
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_010', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("010 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("010 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

         /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_011
        *@tc.name      : AudioCapturer  VOICE_RECOGNITION INTERRUPT ALARM
        *@tc.desc      : AudioCapturer  VOICE_RECOGNITION INTERRUPT ALARM
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_011', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("011 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("011 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

       


        
         /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_019
        *@tc.name      : AudioCapturer  MIC INTERRUPT GAME
        *@tc.desc      : AudioCapturer  MIC INTERRUPT GAME
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_019', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("019 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("019 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

           /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_020
        *@tc.name      : AudioCapturer  PLAYBACK_CAPTURE INTERRUPT GAME
        *@tc.desc      : AudioCapturer  PLAYBACK_CAPTURE INTERRUPT GAME
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_020', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("020 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['PLAYBACK_CAPTURE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("020 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })
        
      

          /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_022
        *@tc.name      : AudioCapturer  VOICE_COMMUNICATION INTERRUPT GAME
        *@tc.desc      : AudioCapturer  VOICE_COMMUNICATION INTERRUPT GAME
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_022', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("022 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("022 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

         /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_023
        *@tc.name      : AudioCapturer  VOICE_RECOGNITION INTERRUPT GAME
        *@tc.desc      : AudioCapturer  VOICE_RECOGNITION INTERRUPT GAME
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_023', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("023 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("023 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

      


        
        
         /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_025
        *@tc.name      : AudioCapturer  MIC INTERRUPT MOVIE
        *@tc.desc      : AudioCapturer  MIC INTERRUPT MOVIE
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_025', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("025 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("025 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

           /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_026
        *@tc.name      : AudioCapturer  PLAYBACK_CAPTURE INTERRUPT MOVIE
        *@tc.desc      : AudioCapturer  PLAYBACK_CAPTURE INTERRUPT MOVIE
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_026', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("026 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['PLAYBACK_CAPTURE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("026 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })
        
       

          /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_028
        *@tc.name      : AudioCapturer  VOICE_COMMUNICATION INTERRUPT MOVIE
        *@tc.desc      : AudioCapturer  VOICE_COMMUNICATION INTERRUPT MOVIE
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_028', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("028 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("028 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

         /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_029
        *@tc.name      : AudioCapturer  VOICE_RECOGNITION INTERRUPT MOVIE
        *@tc.desc      : AudioCapturer  VOICE_RECOGNITION INTERRUPT MOVIE
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_029', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("029 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("029 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

      

        
        
        
         /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_031
        *@tc.name      : AudioCapturer  MIC INTERRUPT MUSIC
        *@tc.desc      : AudioCapturer  MIC INTERRUPT MUSIC
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_031', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("031 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("031 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

           /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_032
        *@tc.name      : AudioCapturer  PLAYBACK_CAPTURE INTERRUPT MUSIC
        *@tc.desc      : AudioCapturer  PLAYBACK_CAPTURE INTERRUPT MUSIC
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_032', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("032 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['PLAYBACK_CAPTURE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("032 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })
        
      

          /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_034
        *@tc.name      : AudioCapturer  VOICE_COMMUNICATION INTERRUPT MUSIC
        *@tc.desc      : AudioCapturer  VOICE_COMMUNICATION INTERRUPT MUSIC
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_034', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("034 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("034 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

         /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_035
        *@tc.name      : AudioCapturer  VOICE_RECOGNITION INTERRUPT MUSIC
        *@tc.desc      : AudioCapturer  VOICE_RECOGNITION INTERRUPT MUSIC
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_035', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("035 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("035 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

       

        
        
        
         /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_037
        *@tc.name      : AudioCapturer  MIC INTERRUPT NAVIGATION
        *@tc.desc      : AudioCapturer  MIC INTERRUPT NAVIGATION
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_037', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("037 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("037 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

           /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_038
        *@tc.name      : AudioCapturer  PLAYBACK_CAPTURE INTERRUPT NAVIGATION
        *@tc.desc      : AudioCapturer  PLAYBACK_CAPTURE INTERRUPT NAVIGATION
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_038', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("038 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['PLAYBACK_CAPTURE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("038 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })
     

          /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_040
        *@tc.name      : AudioCapturer  VOICE_COMMUNICATION INTERRUPT NAVIGATION
        *@tc.desc      : AudioCapturer  VOICE_COMMUNICATION INTERRUPT NAVIGATION
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_040', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("040 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("040 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

         /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_041
        *@tc.name      : AudioCapturer  VOICE_RECOGNITION INTERRUPT NAVIGATION
        *@tc.desc      : AudioCapturer  VOICE_RECOGNITION INTERRUPT NAVIGATION
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_041', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("041 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("041 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

        

        
        
         /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_043
        *@tc.name      : AudioCapturer  MIC INTERRUPT NOTIFICATION
        *@tc.desc      : AudioCapturer  MIC INTERRUPT NOTIFICATION
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_043', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("043 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("043 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

           /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_044
        *@tc.name      : AudioCapturer  PLAYBACK_CAPTURE INTERRUPT NOTIFICATION
        *@tc.desc      : AudioCapturer  PLAYBACK_CAPTURE INTERRUPT NOTIFICATION
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_044', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("044 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['PLAYBACK_CAPTURE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("044 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })
        
        

          /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_046
        *@tc.name      : AudioCapturer  VOICE_COMMUNICATION INTERRUPT NOTIFICATION
        *@tc.desc      : AudioCapturer  VOICE_COMMUNICATION INTERRUPT NOTIFICATION
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_046', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("046 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("046 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

         /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_047
        *@tc.name      : AudioCapturer  VOICE_RECOGNITION INTERRUPT NOTIFICATION
        *@tc.desc      : AudioCapturer  VOICE_RECOGNITION INTERRUPT NOTIFICATION
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_047', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("047 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("047 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

       

        
        
         /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_049
        *@tc.name      : AudioCapturer  MIC INTERRUPT RINGTONE
        *@tc.desc      : AudioCapturer  MIC INTERRUPT RINGTONE
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_049', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("049 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("049 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

           /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_050
        *@tc.name      : AudioCapturer  PLAYBACK_CAPTURE INTERRUPT RINGTONE
        *@tc.desc      : AudioCapturer  PLAYBACK_CAPTURE INTERRUPT RINGTONE
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_050', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("050 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['PLAYBACK_CAPTURE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("050 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })
        


          /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_052
        *@tc.name      : AudioCapturer  VOICE_COMMUNICATION INTERRUPT RINGTONE
        *@tc.desc      : AudioCapturer  VOICE_COMMUNICATION INTERRUPT RINGTONE
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_052', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("052 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("052 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

         /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_053
        *@tc.name      : AudioCapturer  VOICE_RECOGNITION INTERRUPT RINGTONE
        *@tc.desc      : AudioCapturer  VOICE_RECOGNITION INTERRUPT RINGTONE
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_053', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("053 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("053 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })




        
         /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_055
        *@tc.name      : AudioCapturer  MIC INTERRUPT SPEECH
        *@tc.desc      : AudioCapturer  MIC INTERRUPT SPEECH
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_055', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("055 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("055 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

           /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_056
        *@tc.name      : AudioCapturer  PLAYBACK_CAPTURE INTERRUPT SPEECH
        *@tc.desc      : AudioCapturer  PLAYBACK_CAPTURE INTERRUPT SPEECH
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_056', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("056 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['PLAYBACK_CAPTURE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("056 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })
        


          /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_058
        *@tc.name      : AudioCapturer  VOICE_COMMUNICATION INTERRUPT SPEECH
        *@tc.desc      : AudioCapturer  VOICE_COMMUNICATION INTERRUPT SPEECH
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_058', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("058 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("058 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

         /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_059
        *@tc.name      : AudioCapturer  VOICE_RECOGNITION INTERRUPT SPEECH
        *@tc.desc      : AudioCapturer  VOICE_RECOGNITION INTERRUPT SPEECH
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_059', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("059 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("059 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

         /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_085
        *@tc.name      : AudioCapturer  MIC INTERRUPT VOICE_CALL
        *@tc.desc      : AudioCapturer  MIC INTERRUPT VOICE_CALL
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_085', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("085 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("085 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

           /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_086
        *@tc.name      : AudioCapturer  PLAYBACK_CAPTURE INTERRUPT VOICE_CALL
        *@tc.desc      : AudioCapturer  PLAYBACK_CAPTURE INTERRUPT VOICE_CALL
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_086', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("086 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['PLAYBACK_CAPTURE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("086 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })
    

          /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_088
        *@tc.name      : AudioCapturer  VOICE_COMMUNICATION INTERRUPT VOICE_CALL
        *@tc.desc      : AudioCapturer  VOICE_COMMUNICATION INTERRUPT VOICE_CALL
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_088', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("088 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("088 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

         /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_089
        *@tc.name      : AudioCapturer  VOICE_RECOGNITION INTERRUPT VOICE_CALL
        *@tc.desc      : AudioCapturer  VOICE_RECOGNITION INTERRUPT VOICE_CALL
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_089', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("089 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("089 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })


         /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_091
        *@tc.name      : AudioCapturer  MIC INTERRUPT VOICE_MESSAGE
        *@tc.desc      : AudioCapturer  MIC INTERRUPT VOICE_MESSAGE
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_091', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("091 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("091 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

           /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_092
        *@tc.name      : AudioCapturer  PLAYBACK_CAPTURE INTERRUPT VOICE_MESSAGE
        *@tc.desc      : AudioCapturer  PLAYBACK_CAPTURE INTERRUPT VOICE_MESSAGE
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_092', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("092 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['PLAYBACK_CAPTURE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("092 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })
        
    

          /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_094
        *@tc.name      : AudioCapturer  VOICE_COMMUNICATION INTERRUPT VOICE_MESSAGE
        *@tc.desc      : AudioCapturer  VOICE_COMMUNICATION INTERRUPT VOICE_MESSAGE
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_094', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("094 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("094 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

         /**
        *@tc.number    : SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_095
        *@tc.name      : AudioCapturer  VOICE_RECOGNITION INTERRUPT VOICE_MESSAGE
        *@tc.desc      : AudioCapturer  VOICE_RECOGNITION INTERRUPT VOICE_MESSAGE
        *@tc.size      : MEDIUM
        *@tc.type      : Function
        *@tc.level     : Level 0
        */
        it('SUB_MULTIMEDIA_AUDIO_RenderCapture__INTERRUPT_TEST_095', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("095 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("095 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

          
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)
   
            done()
        })

      







        


        
    })
}
