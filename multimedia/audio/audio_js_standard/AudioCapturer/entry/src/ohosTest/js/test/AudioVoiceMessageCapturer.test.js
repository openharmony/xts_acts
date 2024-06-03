/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import fileio from '@ohos.fileio';
import featureAbility from '@ohos.ability.featureAbility';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { UiDriver, BY } from '@ohos.UiTest'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
export default function audioCapturerVoiceMessage() {
    describe('audioCapturerVoiceMessage', function () {
        let Tag = 'audioCapturerVoiceMessage';
        let dirPath;
        let bufferSize;
        const LE24 = -1;
        const LE32 = -1;
        const delegator = abilityDelegatorRegistry.getAbilityDelegator();
        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        async function getFd(fileName) {
            let context = await featureAbility.getContext();
            await context.getFilesDir().then((data) => {
                dirPath = data + '/' + fileName;
                console.info(`${Tag} case2 dirPath is  ${JSON.stringify(dirPath)}`);
            })
        }

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
            if(button == null){
                let cmd = "hidumper -s WindowManagerService -a'-a'"
                await delegator.executeShellCommand(cmd);
            }
            console.info(`button is ${JSON.stringify(button)}`);
            await sleep(100);
            await button.click();
        }

        beforeAll(async function () {
          //  await getPermission();
          //  await driveFn();
            console.info('TestLog: Start Testing AudioFrameworkTest Interfaces');
        })

        beforeEach(async function () {
            console.info(`${Tag} AudioFrameworkTest: beforeEach: Prerequisites at the test case level`);
            await sleep(1000);
        })

        afterEach(function () {
            console.info(`${Tag} AudioFrameworkTest: afterEach: Test case-level clearance conditions`);
        })

        afterAll(function () {
            console.info(`${Tag} AudioFrameworkTest: afterAll: Test suite-level cleanup condition`);
        })

        async function recPromise(AudioCapturerOptions, done) {
            let audioCap;
            try {
                audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
                console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : Success : Stream Type: success`);
            } catch (err) {
                console.info(`${Tag} AudioFrameworkRecLog: AudioCapturer Created : ERROR :  ${JSON.stringify(err.message)}`);
                LE24 = audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE;
                LE32 = audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE;
                let sampleFormat = AudioRendererOptions.streamInfo.sampleFormat;
                if ((sampleFormat == LE24 || sampleFormat == LE32) && err.code == 202) {
                    done();
                    return;
                }
                expect(false).assertTrue();
                done();
            }

            try {
                let audioParamsGet = await audioCap.getStreamInfo();
                if (audioParamsGet != undefined && audioParamsGet != null) {
                    console.info(`${Tag} AudioFrameworkRecLog: Capturer getStreamInfo:${JSON.stringify(audioParamsGet)}`);
                } else {
                    console.info(`${Tag} AudioFrameworkRecLog: audioParamsGet are incorrect,is :  ${JSON.stringify(audioParamsGet)}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log(`${Tag} AudioFrameworkRecLog: getStreamInfo  :ERROR:  ${JSON.stringify(err.message)}`);
                expect(false).assertTrue();
            }

            try {
                let audioParamsGet = await audioCap.getCapturerInfo();
                if (audioParamsGet != undefined) {
                    console.info(`${Tag} AudioFrameworkRecLog: Capturer CapturerInfo: ${JSON.stringify(audioParamsGet)}`);
                } else {
                    console.info(`${Tag} AudioFrameworkRecLog: audioParamsGet are incorrect , is :  ${JSON.stringify(audioParamsGet)}`);
                    expect(false).assertTrue();
                }
            } catch (err) {
                console.log(`${Tag} AudioFrameworkRecLog: CapturerInfo :ERROR:  ${JSON.stringify(err.message)}`);
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
                    console.info(`${Tag} AudioFrameworkRecLog: file fd created`);
                }
                else {
                    console.info(`${Tag} AudioFrameworkRecLog: Capturer start : ERROR `);
                    expect(false).assertTrue();
                }

                fd = fileio.openSync(dirPath, 0o2002, 0o666);
                console.log(`${Tag} fd-re: ${JSON.stringify(fd)}`);
                if (fd !== null) {
                    console.info(`${Tag} AudioFrameworkRecLog: file fd opened : Append Mode :PASS`);
                }
                else {
                    console.info(`${Tag} AudioFrameworkRecLog: file fd Open: Append Mode : FAILED`);
                    expect(false).assertTrue();
                }

                let numBuffersToCapture = 45;
                while (numBuffersToCapture) {
                    console.info(`${Tag} AudioFrameworkRecLog: ---------READ BUFFER---------`);
                    let buffer = await audioCap.read(bufferSize, true);
                    console.info(`${Tag} AudioFrameworkRecLog: ---------WRITE BUFFER---------`);
                    let number = fileio.writeSync(fd, buffer);
                    console.info(`${Tag} AudioFrameworkRecLog:BufferRecLog: data written:  ${JSON.stringify(number)}`);
                    numBuffersToCapture--;
                }
                console.log(`${Tag} read ok`);
                await audioCap.stop();
                console.log(`${Tag} stop ok`);
            } catch (err) {
                console.log(`${Tag} start-read-stop err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            try {
                await audioCap.release();
                console.log(`${Tag} release ok`);
            } catch (err) {
                console.log(`${Tag} release err: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            done();
        }
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
            },
            'VOICE_MESSAGE': {
                source: audio.SourceType.SOURCE_TYPE_VOICE_MESSAGE,
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
            console.info('createAudioCapturer come in')
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
 
        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_REC_VOICE_MESSAGE_0100
         *@tc.name      : test[AudioCapturer function with voice message sourcetype]
         *@tc.desc      : AudioCapturer with parameter set
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level2
         */
         it('SUB_MULTIMEDIA_AUDIO_CAPTURER_REC_VOICE_MESSAGE_0100', 2, async function (done) {
            let AudioStreamInfo = {
                samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
                channels: audio.AudioChannel.CHANNEL_2,
                sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
                encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
            }
            let AudioCapturerInfo = {
                source: audio.SourceType.SOURCE_TYPE_VOICE_MESSAGE,
                capturerFlags: 0
            }
            let AudioCapturerOptions = {
                streamInfo: AudioStreamInfo,
                capturerInfo: AudioCapturerInfo
            }

            await getFd("capture_js-44100-2C-16B_voice_message.pcm");
            await recPromise(AudioCapturerOptions, done);
            expect(true).assertTrue();
            done();
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_9700
         *@tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT VOICE_MESSAGE]
         *@tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT VOICE_MESSAGE
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_9700', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("097 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_MESSAGE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("097 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)

            done()
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_9800
         *@tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT RINGTONE]
         *@tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT RINGTONE
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_9800', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("098 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_MESSAGE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("098 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)

            done()
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_9900
         *@tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT MUSIC]
         *@tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT MUSIC
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_9900', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("099 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_MESSAGE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("099 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)

            done()
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10000
         *@tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT MOVIE]
         *@tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT MOVIE
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10000', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("100 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_MESSAGE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("100 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)

            done()
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10100
         *@tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT GAME]
         *@tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT GAME
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10100', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("101 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_MESSAGE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("101 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)

            done()
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10200
         *@tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT SPEECH]
         *@tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT SPEECH
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10200', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("102 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_MESSAGE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("102 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)

            done()
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10300
         *@tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT NAVIGATION]
         *@tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT NAVIGATION
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10300', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("103 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_MESSAGE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("103 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)

            done()
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10400
         *@tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT ALARM]
         *@tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT ALARM
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10400', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("104 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_MESSAGE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("104 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)

            done()
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10500
         *@tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT NOTIFICATION]
         *@tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT NOTIFICATION
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10500', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("105 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_MESSAGE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("105 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)

            done()
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10600
         *@tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT VOICE_ASSISTANT]
         *@tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT VOICE_ASSISTANT
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10600', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("106 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_MESSAGE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("106 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)

            done()
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10700
         *@tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT ACCESSIBILITY]
         *@tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT ACCESSIBILITY
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10700', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("107 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_MESSAGE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("107 capture.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)

            done()
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10800
         *@tc.name      : test[AudioCapturer VOICE_CALL INTERRUPT VOICE_MESSAGE]
         *@tc.desc      : AudioCapturer VOICE_CALL INTERRUPT VOICE_MESSAGE
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10800', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let capture = await createAudioCapturer(capturerInfo['VOICE_MESSAGE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("108 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("108 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)

            done()
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10900
         *@tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT VOICE_MESSAGE]
         *@tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT VOICE_MESSAGE
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_10900', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let capture = await createAudioCapturer(capturerInfo['VOICE_MESSAGE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("109 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("109 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)

            done()
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11000
         *@tc.name      : test[AudioCapturer RINGTONE INTERRUPT VOICE_MESSAGE]
         *@tc.desc      : AudioCapturer RINGTONE INTERRUPT VOICE_MESSAGE
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11000', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let capture = await createAudioCapturer(capturerInfo['VOICE_MESSAGE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("110 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("110 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)

            done()
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11100
         *@tc.name      : test[AudioCapturer MUSIC INTERRUPT VOICE_MESSAGE]
         *@tc.desc      : AudioCapturer MUSIC INTERRUPT VOICE_MESSAGE
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11100', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let capture = await createAudioCapturer(capturerInfo['VOICE_MESSAGE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("111 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("111 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)

            done()
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11200
         *@tc.name      : test[AudioCapturer MOVIE INTERRUPT VOICE_MESSAGE]
         *@tc.desc      : AudioCapturer MOVIE INTERRUPT VOICE_MESSAGE
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11200', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let capture = await createAudioCapturer(capturerInfo['VOICE_MESSAGE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("112 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("112 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)

            done()
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11300
         *@tc.name      : test[AudioCapturer GAME INTERRUPT VOICE_MESSAGE]
         *@tc.desc      : AudioCapturer GAME INTERRUPT VOICE_MESSAGE
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11300', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let capture = await createAudioCapturer(capturerInfo['VOICE_MESSAGE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("113 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("113 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)

            done()
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11400
         *@tc.name      : test[AudioCapturer SPEECH INTERRUPT VOICE_MESSAGE]
         *@tc.desc      : AudioCapturer SPEECH INTERRUPT VOICE_MESSAGE
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11400', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let capture = await createAudioCapturer(capturerInfo['VOICE_MESSAGE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("114 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("114 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)

            done()
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11500
         *@tc.name      : test[AudioCapturer NAVIGATION INTERRUPT VOICE_MESSAGE]
         *@tc.desc      : AudioCapturer NAVIGATION INTERRUPT VOICE_MESSAGE
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11500', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let capture = await createAudioCapturer(capturerInfo['VOICE_MESSAGE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("115 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("115 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)

            done()
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11600
         *@tc.name      : test[AudioCapturer ALARM INTERRUPT VOICE_MESSAGE]
         *@tc.desc      : AudioCapturer ALARM INTERRUPT VOICE_MESSAGE
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11600', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let capture = await createAudioCapturer(capturerInfo['VOICE_MESSAGE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("116 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("116 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)

            done()
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11700
         *@tc.name      : test[AudioCapturer NOTIFICATION INTERRUPT VOICE_MESSAGE]
         *@tc.desc      : AudioCapturer NOTIFICATION INTERRUPT VOICE_MESSAGE
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11700', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let capture = await createAudioCapturer(capturerInfo['VOICE_MESSAGE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("117 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("117 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)

            done()
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11800
         *@tc.name      : test[AudioCapturer VOICE_ASSISTANT INTERRUPT VOICE_MESSAGE]
         *@tc.desc      : AudioCapturer VOICE_ASSISTANT INTERRUPT VOICE_MESSAGE
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11800', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let capture = await createAudioCapturer(capturerInfo['VOICE_MESSAGE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("118 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("118 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)

            done()
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11900
         *@tc.name      : test[AudioCapturer ACCESSIBILITY INTERRUPT VOICE_MESSAGE]
         *@tc.desc      : AudioCapturer ACCESSIBILITY INTERRUPT VOICE_MESSAGE
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_11900', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let capture = await createAudioCapturer(capturerInfo['VOICE_MESSAGE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("119 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("119 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await renderRelease(render, done)
            await capturerRelease(capture, done)

            done()
        })

        /**
         *@tc.number    : SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_12000
         *@tc.name      : test[AudioCapturer VOICE_MESSAGE INTERRUPT VOICE_CALL]
         *@tc.desc      : AudioCapturer VOICE_MESSAGE INTERRUPT VOICE_CALL
         *@tc.size      : MediumTest
         *@tc.type      : Function
         *@tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AUDIO_RENDER_INTERRUPT_12000', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;

            let render = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("120 render.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let capture = await createAudioCapturer(capturerInfo['VOICE_MESSAGE'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("120 capture.eventAction:" + JSON.stringify(eventAction))
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