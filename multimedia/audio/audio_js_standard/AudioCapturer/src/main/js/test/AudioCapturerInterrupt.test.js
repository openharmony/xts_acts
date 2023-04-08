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
    describe("AudioCapturerInterruptUnitTest", function () {
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

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_001', 0, async function (done) {
            try {
                let flag1 = false;
                let flag2 = false;
                console.info('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_001 come in  ')
                console.info('capturerInfo[MIC] is ' + capturerInfo['MIC'] + 'streamInfo[16000]' + streamInfo['16000'])
                let capture1 = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])

                console.info('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_001 capture1 is ' + capture1)
                await capturerStart(capture1, done)
                capture1.on("audioInterrupt", async (eventAction) => {
                    flag1 = true;
                    console.log("01 capture1.eventAction:" + JSON.stringify(eventAction))
                })

                let capture2 = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
                console.info('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_001 capture2 is ' + capture2)

                await capturerStartFail(capture2, done, capture1)
                capture2.on("audioInterrupt", async (eventAction) => {
                    flag2 = true;
                    console.log("01 capture2.eventAction:" + JSON.stringify(eventAction))
                })
                await sleep(500)
                expect(flag1 == false && flag2 == false).assertTrue()
                await capturerRelease(capture1, done)
                await capturerRelease(capture2, done)
                done()
            }
            catch (err) {
                console.info('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_001 err is ' + err.message)
            }
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_002', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture1 = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
            await capturerStart(capture1, done)
            capture1.on("audioInterrupt", async (eventAction) => {
                flag1 = true;
                console.log("02 capture1.eventAction:" + JSON.stringify(eventAction))
            })

            let capture2 = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStartFail(capture2, done, capture1)
            capture2.on("audioInterrupt", async (eventAction) => {
                flag2 = true;
                console.log("02 capture2.eventAction:" + JSON.stringify(eventAction))
            })
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture1, done)
            await capturerRelease(capture2, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_003', 0, async function (done) {

            let capture1 = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
            await capturerStart(capture1, done)
            capture1.on("audioInterrupt", async (eventAction) => {
                console.log("03 capture1.eventAction:" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })

            let capture2 = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture2, done)
            await sleep(500)
            await capturerRelease(capture2, done)
            await capturerRelease(capture1, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_004', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("04 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("04 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_005', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("05 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("05 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_006', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("06 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['RING'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("06 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_007', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("07 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("07 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })




        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_009', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("10 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("10 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })


        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_010', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("09 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("09 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_0011', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("31 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("31 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_0012', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("32 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("32 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_0013', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("33 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("33 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_0014', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture1 = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStart(capture1, done)
            capture1.on("audioInterrupt", async (eventAction) => {
                flag1 = true;
                console.log("11 capture1.eventAction:" + JSON.stringify(eventAction))
            })

            let capture2 = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
            await capturerStartFail(capture2, done, capture1)
            capture2.on("audioInterrupt", async (eventAction) => {
                flag2 = true;
                console.log("11 capture2.eventAction:" + JSON.stringify(eventAction))
            })
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture1, done)
            await capturerRelease(capture2, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_015', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture1 = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStart(capture1, done)
            capture1.on("audioInterrupt", async (eventAction) => {
                flag1 = true;
                console.log("12 capture1.eventAction:" + JSON.stringify(eventAction))
            })

            let capture2 = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStartFail(capture2, done, capture1)
            capture2.on("audioInterrupt", async (eventAction) => {
                flag2 = true;
                console.log("12 capture2.eventAction:" + JSON.stringify(eventAction))
            })
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture1, done)
            await capturerRelease(capture2, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_016', 0, async function (done) {
            let capture1 = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStart(capture1, done)
            capture1.on("audioInterrupt", async (eventAction) => {
                console.log("20 capture1.eventAction:" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })

            let capture2 = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture2, done)
            await sleep(500)
            await capturerRelease(capture2, done)
            await capturerRelease(capture1, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_017', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("13 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("13 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_018', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("14 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("14 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_019', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("15 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['RING'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("15 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_020', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("16 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("16 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })



        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_022', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("19 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("19 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_023', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("18 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("18 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_024', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("34 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("34 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_025', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("35 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("35 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_026', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("36 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("36 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })


        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_027', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture1 = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture1, done)
            capture1.on("audioInterrupt", async (eventAction) => {
                flag1 = true;
                console.log("021 capture1.eventAction:" + JSON.stringify(eventAction))
            })

            let capture2 = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
            await capturerStartFail(capture2, done, capture1)
            capture2.on("audioInterrupt", async (eventAction) => {
                flag2 = true;
                console.log("021 capture2.eventAction:" + JSON.stringify(eventAction))
            })
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture1, done)
            await capturerRelease(capture2, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_028', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture1 = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture1, done)
            capture1.on("audioInterrupt", async (eventAction) => {
                flag1 = true;
                console.log("22 capture1.eventAction:" + JSON.stringify(eventAction))
            })

            let capture2 = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
            await capturerStartFail(capture2, done, capture1)
            capture2.on("audioInterrupt", async (eventAction) => {
                flag2 = true;
                console.log("22 capture2.eventAction:" + JSON.stringify(eventAction))
            })
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture1, done)
            await capturerRelease(capture2, done)
            done()
        })


        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_029', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture1 = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture1, done)
            capture1.on("audioInterrupt", async (eventAction) => {
                flag1 = true;
                console.log("23 capture1.eventAction:" + JSON.stringify(eventAction))
            })

            let capture2 = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStartFail(capture2, done, capture1)
            capture2.on("audioInterrupt", async (eventAction) => {
                flag2 = true;
                console.log("23 capture2.eventAction:" + JSON.stringify(eventAction))
            })
            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture1, done)
            await capturerRelease(capture2, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_030', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("24 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("24 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_031', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("25 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("25 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_032', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("26 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['RING'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("26 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_033', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("27 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("27 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })



        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_035', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("30 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("30 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_036', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("29 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("29 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_0037', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("37 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("37 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_038', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("38 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("38 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })

        it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_039', 0, async function (done) {
            let flag1 = false;
            let flag2 = false;
            let capture = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
            await capturerStart(capture, done)
            capture.on("audioInterrupt", async (eventAction) => {
                console.log("39 capture.eventAction:" + JSON.stringify(eventAction))
                flag1 = true;
            })

            let render = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['44100'])
            await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await renderStart(render, done)
            render.on("audioInterrupt", async (eventAction) => {
                console.log("39 render.eventAction:" + JSON.stringify(eventAction))
                flag2 = true;
            })

            await sleep(500)
            expect(flag1 == false && flag2 == false).assertTrue()
            await capturerRelease(capture, done)
            await renderRelease(render, done)
            done()
        })

        // it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_008', 0, async function (done) {
        //     let flag1 = false;
        //     let flag2 = false;
        //     let capture = await createAudioCapturer(capturerInfo['MIC'], streamInfo['16000'])
        //     await capturerStart(capture, done)
        //     capture.on("audioInterrupt", async (eventAction) => {
        //         console.log("08 capture.eventAction:" + JSON.stringify(eventAction))
        //         flag1 = true;
        //     })

        //     let render = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['44100'])
        //     await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        //     await renderStart(render, done)
        //     render.on("audioInterrupt", async (eventAction) => {
        //         console.log("08 render.eventAction:" + JSON.stringify(eventAction))
        //         flag2 = true;
        //     })

        //     await sleep(500)
        //     console.info('flag1 is '+ flag1);
        //     console.info('flag2 is '+ flag2);
        //     expect(flag1 == false && flag2 == false).assertTrue()
        //     await capturerRelease(capture, done)
        //     await renderRelease(render, done)
        //     done()
        // })

        // it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_021', 0, async function (done) {
        //     let flag1 = false;
        //     let flag2 = false;
        //     let capture = await createAudioCapturer(capturerInfo['VOICE_RECOGNITION'], streamInfo['16000'])
        //     await capturerStart(capture, done)
        //     capture.on("audioInterrupt", async (eventAction) => {
        //         console.log("17 capture.eventAction:" + JSON.stringify(eventAction))
        //         flag1 = true;
        //     })

        //     let render = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['44100'])
        //     await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        //     await renderStart(render, done)
        //     render.on("audioInterrupt", async (eventAction) => {
        //         console.log("17 render.eventAction:" + JSON.stringify(eventAction))
        //         flag2 = true;
        //     })

        //     await sleep(500)
        //     expect(flag1 == false && flag2 == false).assertTrue()
        //     await capturerRelease(capture, done)
        //     await renderRelease(render, done)
        //     done()
        // })

        // it('SUB_AUDIO_CAPTURER_INTERRUPT_TEST_034', 0, async function (done) {
        //     let flag1 = false;
        //     let flag2 = false;
        //     let capture = await createAudioCapturer(capturerInfo['VOICE_COMMUNICATION'], streamInfo['16000'])
        //     await capturerStart(capture, done)
        //     capture.on("audioInterrupt", async (eventAction) => {
        //         console.log("28 capture.eventAction:" + JSON.stringify(eventAction))
        //         flag1 = true;
        //     })

        //     let render = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['44100'])
        //     await render.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        //     await renderStart(render, done)
        //     render.on("audioInterrupt", async (eventAction) => {
        //         console.log("08 render.eventAction:" + JSON.stringify(eventAction))
        //         flag2 = true;
        //     })

        //     await sleep(500)
        //     expect(flag1 == false && flag2 == false).assertTrue()
        //     await capturerRelease(capture, done)
        //     await renderRelease(render, done)
        //     done()
        // })
    })
}
