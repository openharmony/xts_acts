/*
* Copyright (c) 2023 Huawei Device Co., Ltd.
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

describe("AudioRendererInterruptUnitTest", function () {
    beforeAll(async function () {
        // input testsuit setup step, setup invoked before all testcases
        console.info('beforeAll called')
    })

    afterAll(function () {

        // input testsuit teardown step, teardown invoked after all testcases
        console.info('afterAll called')
    })

    beforeEach(function () {

        // input testcase setup step, setup invoked before each testcases
        console.info('beforeEach called')
    })

    afterEach(function () {

        // input testcase teardown step, teardown invoked after each testcases
        console.info('afterEach called')
    })

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
        // 'ULTRASONIC': {
        //     content: audio.ContentType.CONTENT_TYPE_ULTRASONIC,
        //     usage: audio.StreamUsage.STREAM_USAGE_SYSTEM,
        //     rendererFlags: 0
        // },
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
        },
    }

    let streamInfo = {
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
            console.log(" createAudioRenderer success.")
        } catch (err) {
            console.log(" createAudioRenderer err:" + JSON.stringify(err))
            expect(false).assertEqual(true)
            done()
        }
        return render
    }

    async function start(render, done) {
        console.info('come in start')
        try {
            await render.start()
            console.log(" start success.")
        } catch (err) {
            await release(render, done)
            console.log(" start err:" + JSON.stringify(err))
            expect(false).assertEqual(true)
            done()
        }
    }


    async function startFail(render, done, render1) {
        try {
            await render.start()
            console.log(" start success.")
        } catch (err) {
            console.log(" start err:" + JSON.stringify(err))
            await release(render, done)
            await release(render1, done)
            expect(true).assertEqual(true)
            done()
        }
    }


    async function stop(render, done) {
        try {
            await render.stop()
            console.log(" stop success.")
        } catch (err) {
            console.log(" stop err:" + JSON.stringify(err))
            expect(false).assertEqual(true)
            await release(render, done)
            done()
        }
    }

    async function release(render, done) {
        if (render.state == audio.AudioState.STATE_RELEASED) {
            console.log(" release render state: " + render.state)
            return
        }
        try {
            await render.release()
            console.log(" release success.")
        } catch (err) {
            console.log(" release err:" + JSON.stringify(err))
            expect(false).assertEqual(true)
            done()
        }
    }

    function sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_001
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_001', 0, async function (done) {
        try {
            console.info('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_001 come in ')
            let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'])
            console.info('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_001 render1 is ' + render1)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            console.info('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_001  111111111111')
            render1.on("audioInterrupt", async (eventAction) => {
                console.log("1.eventAction=" + JSON.stringify(eventAction))
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
            })
            await start(render1, done)

            let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'])
            await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            await start(render2, done)
            await sleep(500)
            await release(render1, done)
            await release(render2, done)
            done()
        }
        catch (err) {
            console.info('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_001 err is ' + err.message)
        }

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_002
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_002', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
            } else { }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render2, done)
        await sleep(500)
        await release(render1, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_003
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_003', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("3.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
            } else { }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render2, done)
        await sleep(500)
        await release(render1, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_004
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_004', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("4.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else { }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    // it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_005', 0, async function (done) {
    //     let render1_callback = false
    //     let render2_callback = false
    //     let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async(eventAction) => {
    //         console.log("5.eventAction=" + JSON.stringify(eventAction))
    //         render1_callback = true
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render2.on("audioInterrupt", async(eventAction) => {
    //         console.log("5_2.eventAction=" + JSON.stringify(eventAction))
    //         render2_callback = true
    //     })
    //     await start(render2, done)
    //     await sleep(500)
    //     console.log("render1_callback = " + render1_callback + ", render2_callback = " + render2_callback)
    //     expect(render1_callback == false && render2_callback == false).assertTrue()
    //     await sleep(100)
    //     await release(render1, done)
    //     await release(render2, done)
    //     done()
    // })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_006
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_006', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("6.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_007
     * @tc.name      : AudioRender  ACCESSIBILITY INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ACCESSIBILITY INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_007', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("7.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
            } else { }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render2, done)
        await sleep(500)
        await release(render1, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_008
     * @tc.name      : AudioRender  SPEECH INTERRUPT MUSIC
     * @tc.desc      : AudioRender  SPEECH INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_008', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_009
     * @tc.name      : AudioRender  MOVIE INTERRUPT MUSIC
     * @tc.desc      : AudioRender  MOVIE INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_009', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_010
     * @tc.name      : AudioRender  UNKNOW INTERRUPT MUSIC
     * @tc.desc      : AudioRender  UNKNOW INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_010', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_011
     * @tc.name      : AudioRender  MUSIC INTERRUPT VOICE_CALL
     * @tc.desc      : AudioRender  MUSIC INTERRUPT VOICE_CALL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_011', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render2.on("audioInterrupt", async (eventAction) => {
            console.log("8-2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            }
        })
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_012
     * @tc.name      : AudioRender  VOICE_CALL INTERRUPT VOICE_CALL
     * @tc.desc      : AudioRender  VOICE_CALL INTERRUPT VOICE_CALL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_012', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await startFail(render2, done, render1)
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_013
     * @tc.name      : AudioRender  RINGTONE INTERRUPT VOICE_CALL
     * @tc.desc      : AudioRender  RINGTONE INTERRUPT VOICE_CALL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_013', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await startFail(render2, done, render1)
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_014
     * @tc.name      : AudioRender  VOICE_ASSISTANT INTERRUPT VOICE_CALL
     * @tc.desc      : AudioRender  VOICE_ASSISTANT INTERRUPT VOICE_CALL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_014', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await startFail(render2, done, render1)
    })

  

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_016
     * @tc.name      : AudioRender  ALARM INTERRUPT VOICE_CALL
     * @tc.desc      : AudioRender  ALARM INTERRUPT VOICE_CALL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_016', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render2.on("audioInterrupt", async (eventAction) => {
            console.log("13-2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_017
     * @tc.name      : AudioRender  ACCESSIBILITY INTERRUPT VOICE_CALL
     * @tc.desc      : AudioRender  ACCESSIBILITY INTERRUPT VOICE_CALL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_017', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("14.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_018
     * @tc.name      : AudioRender  SPEECH INTERRUPT VOICE_CALL
     * @tc.desc      : AudioRender  SPEECH INTERRUPT VOICE_CALL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_018', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render2.on("audioInterrupt", async (eventAction) => {
            console.log("8-2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            }
        })
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_019
     * @tc.name      : AudioRender  MOVIE INTERRUPT VOICE_CALL
     * @tc.desc      : AudioRender  MOVIE INTERRUPT VOICE_CALL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_019', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render2.on("audioInterrupt", async (eventAction) => {
            console.log("8-2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            }
        })
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_020
     * @tc.name      : AudioRender  UNKNOW INTERRUPT VOICE_CALL
     * @tc.desc      : AudioRender  UNKNOW INTERRUPT VOICE_CALL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_020', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render2.on("audioInterrupt", async (eventAction) => {
            console.log("8-2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            }
        })
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_021
     * @tc.name      : AudioRender  MUSIC INTERRUPT RINGTONE
     * @tc.desc      : AudioRender  MUSIC INTERRUPT RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_021', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render2.on("audioInterrupt", async (eventAction) => {
            console.log("15-2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_022
     * @tc.name      : AudioRender  VOICE_CALL INTERRUPT RINGTONE
     * @tc.desc      : AudioRender  VOICE_CALL INTERRUPT RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_022', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("16.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_023
     * @tc.name      : AudioRender  RINGTONE INTERRUPT RINGTONE
     * @tc.desc      : AudioRender  RINGTONE INTERRUPT RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_023', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await startFail(render2, done, render1)
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_023
     * @tc.name      : AudioRender  VOICE_ASSISTANT INTERRUPT RINGTONE
     * @tc.desc      : AudioRender  VOICE_ASSISTANT INTERRUPT RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_024', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await startFail(render2, done, render1)
    })

    

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_026
     * @tc.name      : AudioRender  ALARM INTERRUPT RINGTONE
     * @tc.desc      : AudioRender  ALARM INTERRUPT RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_026', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render2.on("audioInterrupt", async (eventAction) => {
            console.log("26_2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
            } else { }
        })
        await startFail(render2, done, render1)
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_027
     * @tc.name      : AudioRender  ACCESSIBILITY INTERRUPT RINGTONE
     * @tc.desc      : AudioRender  ACCESSIBILITY INTERRUPT RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_027', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("21.eventAction=" + JSON.stringify(eventAction))//1
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_028
     * @tc.name      : AudioRender  SPEECH INTERRUPT RINGTONE
     * @tc.desc      : AudioRender  SPEECH INTERRUPT RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_028', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render2.on("audioInterrupt", async (eventAction) => {
            console.log("15-2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_029
     * @tc.name      : AudioRender  MOVIE INTERRUPT RINGTONE
     * @tc.desc      : AudioRender  MOVIE INTERRUPT RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_029', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render2.on("audioInterrupt", async (eventAction) => {
            console.log("15-2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_030
     * @tc.name      : AudioRender  UNKNOW INTERRUPT RINGTONE
     * @tc.desc      : AudioRender  UNKNOW INTERRUPT RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_030', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render2.on("audioInterrupt", async (eventAction) => {
            console.log("15-2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_031
     * @tc.name      : AudioRender  MUSIC INTERRUPT VOICE_ASSISTANT
     * @tc.desc      : AudioRender  MUSIC INTERRUPT VOICE_ASSISTANT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_031', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("22.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_032
     * @tc.name      : AudioRender  VOICE_CALL INTERRUPT VOICE_ASSISTANT
     * @tc.desc      : AudioRender  VOICE_CALL INTERRUPT VOICE_ASSISTANT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_032', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("23.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_033
     * @tc.name      : AudioRender  RINGTONE INTERRUPT VOICE_ASSISTANT
     * @tc.desc      : AudioRender  RINGTONE INTERRUPT VOICE_ASSISTANT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_033', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("24.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_034
     * @tc.name      : AudioRender  VOICE_ASSISTANT INTERRUPT VOICE_ASSISTANT
     * @tc.desc      : AudioRender  VOICE_ASSISTANT INTERRUPT VOICE_ASSISTANT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_034', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("25.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_036
     * @tc.name      : AudioRender  ALARM INTERRUPT VOICE_ASSISTANT
     * @tc.desc      : AudioRender  ALARM INTERRUPT VOICE_ASSISTANT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_036', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("27.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_037
     * @tc.name      : AudioRender  ACCESSIBILITY INTERRUPT ACCESSIBILITY
     * @tc.desc      : AudioRender  ACCESSIBILITY INTERRUPT ACCESSIBILITY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_037', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("28.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_038
     * @tc.name      : AudioRender  SPEECH INTERRUPT VOICE_ASSISTANT
     * @tc.desc      : AudioRender  SPEECH INTERRUPT VOICE_ASSISTANT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_038', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("22.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_039
     * @tc.name      : AudioRender  MOVIE INTERRUPT VOICE_ASSISTANT
     * @tc.desc      : AudioRender  MOVIE INTERRUPT VOICE_ASSISTANT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_039', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("22.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_040
     * @tc.name      : AudioRender  UNKNOW INTERRUPT VOICE_ASSISTANT
     * @tc.desc      : AudioRender  UNKNOW INTERRUPT VOICE_ASSISTANT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_040', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("22.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_051
     * @tc.name      : AudioRender  MUSIC INTERRUPT ALARM
     * @tc.desc      : AudioRender  MUSIC INTERRUPT ALARM
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_051', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("36.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)
        let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_052
     * @tc.name      : AudioRender  VOICE_CALL INTERRUPT ALARM
     * @tc.desc      : AudioRender  VOICE_CALL INTERRUPT ALARM
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_052', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("37.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_053
     * @tc.name      : AudioRender  RINGTONE INTERRUPT ALARM
     * @tc.desc      : AudioRender  RINGTONE INTERRUPT ALARM
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_053', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("38.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_054
     * @tc.name      : AudioRender  ALARM INTERRUPT ALARM
     * @tc.desc      : AudioRender  ALARM INTERRUPT ALARM
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_054', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("39.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    // it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_055', 0, async function (done) {
    //     let render1_callback = false
    //     let render2_callback = false
    //     let render1 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async(eventAction) => {
    //         console.log("40.eventAction=" + JSON.stringify(eventAction))
    //         render1_callback = true
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async(eventAction) => {
    //         console.log("40_2.eventAction=" + JSON.stringify(eventAction))
    //         render2_callback = true
    //     })
    //     await start(render2, done)
    //     await sleep(500)
    //     console.log("render1_callback = " + render1_callback + ", render2_callback = " + render2_callback)
    //     expect(render1_callback == false && render2_callback == false).assertTrue()
    //     await sleep(100)
    //     await release(render1, done)
    //     await release(render2, done)
    //     done()
    // })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_056
     * @tc.name      : AudioRender  ALARM INTERRUPT ALARM
     * @tc.desc      : AudioRender  ALARM INTERRUPT ALARM
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_056', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("41.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_057
     * @tc.name      : AudioRender  ACCESSIBILITY INTERRUPT ALARM
     * @tc.desc      : AudioRender  ACCESSIBILITY INTERRUPT ALARM
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_057', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("42.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
            } else { }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render2, done)
        await sleep(500)
        await release(render1, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_058
     * @tc.name      : AudioRender  SPEECH INTERRUPT ALARM
     * @tc.desc      : AudioRender  SPEECH INTERRUPT ALARM
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_058', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("36.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)
        let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_059
     * @tc.name      : AudioRender  MOVIE INTERRUPT ALARM
     * @tc.desc      : AudioRender  MOVIE INTERRUPT ALARM
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_059', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("36.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)
        let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_060
     * @tc.name      : AudioRender  UNKNOW INTERRUPT ALARM
     * @tc.desc      : AudioRender  UNKNOW INTERRUPT ALARM
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_060', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("36.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)
        let render2 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_061
     * @tc.name      : AudioRender  MUSIC INTERRUPT ACCESSIBILITY
     * @tc.desc      : AudioRender  MUSIC INTERRUPT ACCESSIBILITY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_061', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await startFail(render2, done, render1)
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_062
     * @tc.name      : AudioRender  VOICE_CALL INTERRUPT ACCESSIBILITY
     * @tc.desc      : AudioRender  VOICE_CALL INTERRUPT ACCESSIBILITY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_062', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render2.on("audioInterrupt", async (eventAction) => {
            console.log("44_2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_063
     * @tc.name      : AudioRender  RINGTONE INTERRUPT ACCESSIBILITY
     * @tc.desc      : AudioRender  RINGTONE INTERRUPT ACCESSIBILITY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_063', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("45.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_064
     * @tc.name      : AudioRender  VOICE_ASSISTANT INTERRUPT ACCESSIBILITY
     * @tc.desc      : AudioRender  VOICE_ASSISTANT INTERRUPT ACCESSIBILITY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_064', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await startFail(render2, done, render1)
    })

    // it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_065', 0, async function (done) {
    //     let render1_callback = false
    //     let render2_callback = false
    //     let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async(eventAction) => {
    //         console.log("47.eventAction=" + JSON.stringify(eventAction))
    //         render1_callback = true
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render2.on("audioInterrupt", async(eventAction) => {
    //         console.log("47_2.eventAction=" + JSON.stringify(eventAction))
    //         render2_callback = true
    //     })
    //     await start(render2, done)
    //     await sleep(500)
    //     console.log("render1_callback = " + render1_callback + ", render2_callback = " + render2_callback)
    //     expect(render1_callback == false && render2_callback == false).assertTrue()
    //     await sleep(100)
    //     await release(render1, done)
    //     await release(render2, done)
    //     done()
    // })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_066
     * @tc.name      : AudioRender  ALARM INTERRUPT ACCESSIBILITY
     * @tc.desc      : AudioRender  ALARM INTERRUPT ACCESSIBILITY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_066', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render2.on("audioInterrupt", async (eventAction) => {
            console.log("48_2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_067
     * @tc.name      : AudioRender  ACCESSIBILITY INTERRUPT ACCESSIBILITY
     * @tc.desc      : AudioRender  ACCESSIBILITY INTERRUPT ACCESSIBILITY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_067', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("49.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_068
     * @tc.name      : AudioRender  SPEECH INTERRUPT ACCESSIBILITY
     * @tc.desc      : AudioRender  SPEECH INTERRUPT ACCESSIBILITY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_068', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await startFail(render2, done, render1)
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_069
     * @tc.name      : AudioRender  MOVIE INTERRUPT ACCESSIBILITY
     * @tc.desc      : AudioRender  MOVIE INTERRUPT ACCESSIBILITY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_069', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await startFail(render2, done, render1)
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_070
     * @tc.name      : AudioRender  UNKNOW INTERRUPT ACCESSIBILITY
     * @tc.desc      : AudioRender  UNKNOW INTERRUPT ACCESSIBILITY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_070', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await startFail(render2, done, render1)
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_071
     * @tc.name      : AudioRender  MUSIC INTERRUPT SPEECH
     * @tc.desc      : AudioRender  MUSIC INTERRUPT SPEECH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_071', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_072
     * @tc.name      : AudioRender  VOICE_CALL INTERRUPT SPEECH
     * @tc.desc      : AudioRender  VOICE_CALL INTERRUPT SPEECH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_072', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
            } else { }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render2, done)
        await sleep(500)
        await release(render1, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_073
     * @tc.name      : AudioRender  RINGTONE INTERRUPT SPEECH
     * @tc.desc      : AudioRender  RINGTONE INTERRUPT SPEECH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_073', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("3.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
            } else { }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render2, done)
        await sleep(500)
        await release(render1, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_074
     * @tc.name      : AudioRender  VOICE_ASSISTANT INTERRUPT SPEECH
     * @tc.desc      : AudioRender  VOICE_ASSISTANT INTERRUPT SPEECH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_074', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("4.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else { }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    // it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_075', 0, async function (done) {
    //     let render1_callback = false
    //     let render2_callback = false
    //     let render1 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async(eventAction) => {
    //         console.log("5.eventAction=" + JSON.stringify(eventAction))
    //         render1_callback = true
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render2.on("audioInterrupt", async(eventAction) => {
    //         console.log("5_2.eventAction=" + JSON.stringify(eventAction))
    //         render2_callback = true
    //     })
    //     await start(render2, done)
    //     await sleep(500)
    //     console.log("render1_callback = " + render1_callback + ", render2_callback = " + render2_callback)
    //     expect(render1_callback == false && render2_callback == false).assertTrue()
    //     await sleep(100)
    //     await release(render1, done)
    //     await release(render2, done)
    //     done()
    // })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_076
     * @tc.name      : AudioRender  ALARM INTERRUPT SPEECH
     * @tc.desc      : AudioRender  ALARM INTERRUPT SPEECH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_076', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("6.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_077
     * @tc.name      : AudioRender  ACCESSIBILITY INTERRUPT SPEECH
     * @tc.desc      : AudioRender  ACCESSIBILITY INTERRUPT SPEECH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_077', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("7.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
            } else { }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render2, done)
        await sleep(500)
        await release(render1, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_078
     * @tc.name      : AudioRender  SPEECH INTERRUPT SPEECH
     * @tc.desc      : AudioRender  SPEECH INTERRUPT SPEECH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_078', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_079
     * @tc.name      : AudioRender  MOVIE INTERRUPT SPEECH
     * @tc.desc      : AudioRender  MOVIE INTERRUPT SPEECH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_079', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_080
     * @tc.name      : AudioRender  UNKNOW INTERRUPT SPEECH
     * @tc.desc      : AudioRender  UNKNOW INTERRUPT SPEECH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_080', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_081
     * @tc.name      : AudioRender  MUSIC INTERRUPT MOVIE
     * @tc.desc      : AudioRender  MUSIC INTERRUPT MOVIE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_081', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_082
     * @tc.name      : AudioRender  VOICE_CALL INTERRUPT MOVIE
     * @tc.desc      : AudioRender  VOICE_CALL INTERRUPT MOVIE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_082', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
            } else { }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render2, done)
        await sleep(500)
        await release(render1, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_083
     * @tc.name      : AudioRender  RINGTONE INTERRUPT MOVIE
     * @tc.desc      : AudioRender  RINGTONE INTERRUPT MOVIE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_083', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("3.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
            } else { }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render2, done)
        await sleep(500)
        await release(render1, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_084
     * @tc.name      : AudioRender  VOICE_ASSISTANT INTERRUPT MOVIE
     * @tc.desc      : AudioRender  VOICE_ASSISTANT INTERRUPT MOVIE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_084', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("4.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else { }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    // it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_085', 0, async function (done) {
    //     let render1_callback = false
    //     let render2_callback = false
    //     let render1 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async(eventAction) => {
    //         console.log("5.eventAction=" + JSON.stringify(eventAction))
    //         render1_callback = true
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render2.on("audioInterrupt", async(eventAction) => {
    //         console.log("5_2.eventAction=" + JSON.stringify(eventAction))
    //         render2_callback = true
    //     })
    //     await start(render2, done)
    //     await sleep(500)
    //     console.log("render1_callback = " + render1_callback + ", render2_callback = " + render2_callback)
    //     expect(render1_callback == false && render2_callback == false).assertTrue()
    //     await sleep(100)
    //     await release(render1, done)
    //     await release(render2, done)
    //     done()
    // })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_086
     * @tc.name      : AudioRender  ALARM INTERRUPT MOVIE
     * @tc.desc      : AudioRender  ALARM INTERRUPT MOVIE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_086', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("6.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_087
     * @tc.name      : AudioRender  ACCESSIBILITY INTERRUPT MOVIE
     * @tc.desc      : AudioRender  ACCESSIBILITY INTERRUPT MOVIE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_087', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("7.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
            } else { }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render2, done)
        await sleep(500)
        await release(render1, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_088
     * @tc.name      : AudioRender  SPEECH INTERRUPT MOVIE
     * @tc.desc      : AudioRender  SPEECH INTERRUPT MOVIE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_088', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_089
     * @tc.name      : AudioRender  MOVIE INTERRUPT MOVIE
     * @tc.desc      : AudioRender  MOVIE INTERRUPT MOVIE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_089', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_090
     * @tc.name      : AudioRender  UNKNOW INTERRUPT MOVIE
     * @tc.desc      : AudioRender  UNKNOW INTERRUPT MOVIE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_090', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_091
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_091', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_092
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_092', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
            } else { }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render2, done)
        await sleep(500)
        await release(render1, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_093
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_093', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("3.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
            } else { }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render2, done)
        await sleep(500)
        await release(render1, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_094
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_094', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("4.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else { }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_001
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    // it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_095', 0, async function (done) {
    //     let render1_callback = false
    //     let render2_callback = false
    //     let render1 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async(eventAction) => {
    //         console.log("5.eventAction=" + JSON.stringify(eventAction))
    //         render1_callback = true
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render2.on("audioInterrupt", async(eventAction) => {
    //         console.log("5_2.eventAction=" + JSON.stringify(eventAction))
    //         render2_callback = true
    //     })
    //     await start(render2, done)
    //     await sleep(500)
    //     console.log("render1_callback = " + render1_callback + ", render2_callback = " + render2_callback)
    //     expect(render1_callback == false && render2_callback == false).assertTrue()
    //     await sleep(100)
    //     await release(render1, done)
    //     await release(render2, done)
    //     done()
    // })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_096
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_096', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("6.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_097
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_097', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("7.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
            } else { }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render2, done)
        await sleep(500)
        await release(render1, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_098
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_098', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_099
     * @tc.name      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.desc      : AudioRender  ALARM INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_099', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_100
     * @tc.name      : AudioRender  UNKNOW INTERRUPT UNKNOW
     * @tc.desc      : AudioRender  UNKNOW INTERRUPT UNKNOW
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_100', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_101
     * @tc.name      : AudioRender  MUSIC INTERRUPT MUSIC
     * @tc.desc      : AudioRender  MUSIC INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_101', 0, async function (done) {
        let render1_callback = false
        let render2_callback = false
        let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.SHARE_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("50.eventAction=" + JSON.stringify(eventAction))
            render1_callback = true
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.SHARE_MODE)
        render2.on("audioInterrupt", async (eventAction) => {
            console.log("50_2.eventAction=" + JSON.stringify(eventAction))
            render1_callback = true
        })
        await start(render2, done)
        await sleep(500)
        console.log("render1_callback = " + render1_callback + ", render2_callback = " + render2_callback)
        expect(render1_callback == false && render2_callback == false).assertTrue()
        await sleep(100)
        await release(render1, done)
        await release(render2, done)
        done()
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_102
     * @tc.name      : AudioRender  MUSIC INTERRUPT MUSIC
     * @tc.desc      : AudioRender  MUSIC INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_102', 0, async function (done) {
        let render1_callback = false
        let render2_callback = false
        let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.SHARE_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("51.eventAction=" + JSON.stringify(eventAction))
            render1_callback = true
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render2.on("audioInterrupt", async (eventAction) => {
            console.log("51_2.eventAction=" + JSON.stringify(eventAction))
            render2_callback == true
        })
        await start(render2, done)
        await sleep(500)
        console.log("render1_callback = " + render1_callback + ", render2_callback = " + render2_callback)
        expect(render1_callback == true && render2_callback == false).assertTrue()
        await sleep(100)
        await release(render1, done)
        await release(render2, done)
        done()
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_103
     * @tc.name      : AudioRender  MUSIC INTERRUPT MUSIC
     * @tc.desc      : AudioRender  MUSIC INTERRUPT MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_103', 0, async function (done) {
        let render1_callback = false
        let render2_callback = false
        let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("52.eventAction=" + JSON.stringify(eventAction))
            render1_callback = true
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render2.on("audioInterrupt", async (eventAction) => {
            console.log("52_2.eventAction=" + JSON.stringify(eventAction))
            render2_callback = true
        })
        await start(render2, done)
        await sleep(500)
        console.log("render1_callback = " + render1_callback + ", render2_callback = " + render2_callback)
        expect(render1_callback == true && render2_callback == false).assertTrue()
        await sleep(100)
        await release(render1, done)
        await release(render2, done)
        done()
    })
    /**
    * @tc.number    : SUB_AUDIO_RENDERER_INTERRUPT_TEST_7100
    * @tc.name      : AudioRender  VOICE_CALL INTERRUPT VOICE_MESSAGE
    * @tc.desc      : AudioRender  VOICE_CALL INTERRUPT VOICE_MESSAGE
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_7100', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })
    /**
         * @tc.number    : SUB_AUDIO_RENDERER_INTERRUPT_TEST_7101
         * @tc.name      : AudioRender  VOICE_MESSAGE INTERRUPT VOICE_MESSAGE
         * @tc.desc      : AudioRender  VOICE_MESSAGE INTERRUPT VOICE_MESSAGE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_7101', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
      * @tc.number    : SUB_AUDIO_RENDERER_INTERRUPT_TEST_7102
      * @tc.name      : AudioRender  SYSTEM INTERRUPT VOICE_MESSAGE
      * @tc.desc      : AudioRender  SYSTEM INTERRUPT VOICE_MESSAGE
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    // it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_7102', 0, async function (done) {
    //     let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async (eventAction) => {
    //         console.log("14.eventAction=" + JSON.stringify(eventAction))
    //         if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
    //         } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
    //         } else {
    //         }
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['SYSTEM'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     await start(render2, done)
    //     await sleep(500)
    //     await release(render1, done)
    //     await release(render2, done)
    //     done()
    // })
    /**
    * @tc.number    : SUB_AUDIO_RENDERER_INTERRUPT_TEST_7103
    * @tc.name      : AudioRender  RING INTERRUPT VOICE_MESSAGE
    * @tc.desc      : AudioRender  RING INTERRUPT VOICE_MESSAGE
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_7103', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['RING'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })
    /**
    * @tc.number    : SUB_AUDIO_RENDERER_INTERRUPT_TEST_7104
    * @tc.name      : AudioRender  MUSIC INTERRUPT VOICE_MESSAGE
    * @tc.desc      : AudioRender  MUSIC INTERRUPT VOICE_MESSAGE
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_7104', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })
    /**
    * @tc.number    : SUB_AUDIO_RENDERER_INTERRUPT_TEST_7105
    * @tc.name      : AudioRender  MOVIE INTERRUPT VOICE_MESSAGE
    * @tc.desc      : AudioRender  MOVIE INTERRUPT VOICE_MESSAGE
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_7105', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
  * @tc.number    : SUB_AUDIO_RENDERER_INTERRUPT_TEST_7106
  * @tc.name      : AudioRender  GAME INTERRUPT VOICE_MESSAGE
  * @tc.desc      : AudioRender  GAME INTERRUPT VOICE_MESSAGE
  * @tc.size      : MEDIUM
  * @tc.type      : Function
  * @tc.level     : Level 0
  */
    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_7106', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("14.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['GAME'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })
    /**
 * @tc.number    : SUB_AUDIO_RENDERER_INTERRUPT_TEST_7107
 * @tc.name      : AudioRender  SPEECH INTERRUPT VOICE_MESSAGE
 * @tc.desc      : AudioRender  SPEECH INTERRUPT VOICE_MESSAGE
 * @tc.size      : MEDIUM
 * @tc.type      : Function
 * @tc.level     : Level 0
 */
    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_7107', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_AUDIO_RENDERER_INTERRUPT_TEST_7108
     * @tc.name      : AudioRender  NAVIGATION INTERRUPT VOICE_MESSAGE
     * @tc.desc      : AudioRender  NAVIGATION INTERRUPT VOICE_MESSAGE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_7108', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render2.on("audioInterrupt", async (eventAction) => {
            console.log("8-2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            }
        })
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
    * @tc.number    : SUB_AUDIO_RENDERER_INTERRUPT_TEST_7109
    * @tc.name      : AudioRender  ALARM INTERRUPT VOICE_MESSAGE
    * @tc.desc      : AudioRender  ALARM INTERRUPT VOICE_MESSAGE
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_7109', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("21.eventAction=" + JSON.stringify(eventAction))//1
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
    * @tc.number    : SUB_AUDIO_RENDERER_INTERRUPT_TEST_7110
    * @tc.name      : AudioRender  NOTIFICATION INTERRUPT VOICE_MESSAGE
    * @tc.desc      : AudioRender  NOTIFICATION INTERRUPT VOICE_MESSAGE
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_7110', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await startFail(render2, done, render1)
    })

    /**
         * @tc.number    : SUB_AUDIO_RENDERER_INTERRUPT_TEST_7111
         * @tc.name      : AudioRender  SYSTEM_ENFORCED INTERRUPT VOICE_MESSAGE
         * @tc.desc      : AudioRender  SYSTEM_ENFORCED INTERRUPT VOICE_MESSAGE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
    // it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_7111', 0, async function (done) {
    //     let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async (eventAction) => {
    //         console.log("14.eventAction=" + JSON.stringify(eventAction))
    //         if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
    //         } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
    //         } else {
    //         }
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['SYSTEM_ENFORCED'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     await start(render2, done)
    //     await sleep(500)
    //     await release(render1, done)
    //     await release(render2, done)
    //     done()
    // })

    /**
        * @tc.number    : SUB_AUDIO_RENDERER_INTERRUPT_TEST_7112
        * @tc.name      : AudioRender  DTMF INTERRUPT VOICE_MESSAGE
        * @tc.desc      : AudioRender  DTMF INTERRUPT VOICE_MESSAGE
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
    // it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_7112', 0, async function (done) {
    //     let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async (eventAction) => {
    //         console.log("14.eventAction=" + JSON.stringify(eventAction))
    //         if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
    //         } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
    //         } else {
    //         }
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['DTMF'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     await start(render2, done)
    //     await sleep(500)
    //     await release(render1, done)
    //     await release(render2, done)
    //     done()
    // })

    /**
         * @tc.number    : SUB_AUDIO_RENDERER_INTERRUPT_TEST_7113
         * @tc.name      : AudioRender  TTS INTERRUPT RINGTONE
         * @tc.desc      : AudioRender  TTS INTERRUPT RINGTONE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_7113', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("21.eventAction=" + JSON.stringify(eventAction))//1
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['TTS'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
   * @tc.number    : SUB_AUDIO_RENDERER_INTERRUPT_TEST_7114
   * @tc.name      : AudioRender  ACCESSIBLITY INTERRUPT VOICE_MESSAGE
   * @tc.desc      : AudioRender  ACCESSIBLITY INTERRUPT VOICE_MESSAGE
   * @tc.size      : MEDIUM
   * @tc.type      : Function
   * @tc.level     : Level 0
   */
    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_7114', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ACCESSIBLITY'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
         * @tc.number    : SUB_AUDIO_RENDERER_INTERRUPT_TEST_7115
         * @tc.name      : AudioRender  ULTRASONIC INTERRUPT VOICE_MESSAGE
         * @tc.desc      : AudioRender  ULTRASONIC INTERRUPT VOICE_MESSAGE
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
    // it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_7115', 0, async function (done) {
    //     let render1 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async (eventAction) => {
    //         console.log("14.eventAction=" + JSON.stringify(eventAction))
    //         if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
    //         } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
    //         } else {
    //         }
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     await start(render2, done)
    //     await sleep(500)
    //     await release(render1, done)
    //     await release(render2, done)
    //     done()
    // })

 
    /**
   * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7132
   * @tc.name      : AudioRender  VOICE_CALL INTERRUPT GAME
   * @tc.desc      : AudioRender  VOICE_CALL INTERRUPT GAME
   * @tc.size      : MEDIUM
   * @tc.type      : Function
   * @tc.level     : Level 0
   */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7132', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
            } else { }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render2, done)
        await sleep(500)
        await release(render1, done)
        done()
    })

    /**
   * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7133
   * @tc.name      : AudioRender  VOICE_MESSAGE INTERRUPT GAME
   * @tc.desc      : AudioRender  VOICE_MESSAGE INTERRUPT GAME
   * @tc.size      : MEDIUM
   * @tc.type      : Function
   * @tc.level     : Level 0
   */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7133', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("14.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })
    /**
 * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7134
 * @tc.name      : AudioRender  SYSTEM INTERRUPT GAME
 * @tc.desc      : AudioRender  SYSTEM INTERRUPT GAME
 * @tc.size      : MEDIUM
 * @tc.type      : Function
 * @tc.level     : Level 0
 */
    // it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7134', 0, async function (done) {
    //     let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async (eventAction) => {
    //         console.log("14.eventAction=" + JSON.stringify(eventAction))
    //         if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
    //         } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
    //         } else {
    //         }
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['SYSTEM'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     await start(render2, done)
    //     await sleep(500)
    //     await release(render1, done)
    //     await release(render2, done)
    //     done()
    // })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7135
        * @tc.name      : AudioRender  RING INTERRUPT GAME
        * @tc.desc      : AudioRender  RING INTERRUPT GAME
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7135', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
            } else { }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['RING'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render2, done)
        await sleep(500)
        await release(render1, done)
        done()
    })


    /**
  * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7136
  * @tc.name      : AudioRender  SYSTEM_ENFORCED INTERRUPT GAME
  * @tc.desc      : AudioRender  SYSTEM_ENFORCED INTERRUPT GAME
  * @tc.size      : MEDIUM
  * @tc.type      : Function
  * @tc.level     : Level 0
  */
    // it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7136', 0, async function (done) {
    //     let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async (eventAction) => {
    //         console.log("14.eventAction=" + JSON.stringify(eventAction))
    //         if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
    //         } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
    //         } else {
    //         }
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['SYSTEM_ENFORCED'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     await start(render2, done)
    //     await sleep(500)
    //     await release(render1, done)
    //     await release(render2, done)
    //     done()
    // })

    /**
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7137
       * @tc.name      : AudioRender  MOVIE INTERRUPT GAME
       * @tc.desc      : AudioRender  MOVIE INTERRUPT GAME
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7137', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
            } else { }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render2, done)
        await sleep(500)
        await release(render1, done)
        done()
    })

    /**
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7138
       * @tc.name      : AudioRender  GAME INTERRUPT GAME
       * @tc.desc      : AudioRender  GAME INTERRUPT GAME
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7138', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['GAME'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })
    /**
       * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7139
       * @tc.name      : AudioRender  SPEECH INTERRUPT GAME
       * @tc.desc      : AudioRender  SPEECH INTERRUPT GAME
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7139', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
            } else { }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render2, done)
        await sleep(500)
        await release(render1, done)
        done()
    })

    /**
        * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7140
        * @tc.name      : AudioRender  NAVIGATION INTERRUPT GAME
        * @tc.desc      : AudioRender  NAVIGATION INTERRUPT GAME
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7140', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("21.eventAction=" + JSON.stringify(eventAction))//1
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })
    /**
           * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7141
           * @tc.name      : AudioRender  ALARM INTERRUPT GAME
           * @tc.desc      : AudioRender  ALARM INTERRUPT GAME
           * @tc.size      : MEDIUM
           * @tc.type      : Function
           * @tc.level     : Level 0
           */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7141', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("21.eventAction=" + JSON.stringify(eventAction))//1
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
         * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7142
         * @tc.name      : AudioRender  NOTIFICATION INTERRUPT GAME
         * @tc.desc      : AudioRender  NOTIFICATION INTERRUPT GAME
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7142', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await startFail(render2, done, render1)
    })
    /**
  * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7143
  * @tc.name      : AudioRender  SYSTEM_ENFORCED INTERRUPT GAME
  * @tc.desc      : AudioRender  SYSTEM_ENFORCED INTERRUPT GAME
  * @tc.size      : MEDIUM
  * @tc.type      : Function
  * @tc.level     : Level 0
  */
    // it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7143', 0, async function (done) {
    //     let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async (eventAction) => {
    //         console.log("14.eventAction=" + JSON.stringify(eventAction))
    //         if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
    //         } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
    //         } else {
    //         }
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['SYSTEM_ENFORCED'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     await start(render2, done)
    //     await sleep(500)
    //     await release(render1, done)
    //     await release(render2, done)
    //     done()
    // })

    /**
   * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7144
   * @tc.name      : AudioRender  DTMF INTERRUPT GAME
   * @tc.desc      : AudioRender  DTMF INTERRUPT GAME
   * @tc.size      : MEDIUM
   * @tc.type      : Function
   * @tc.level     : Level 0
   */
    // it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7144', 0, async function (done) {
    //     let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async (eventAction) => {
    //         console.log("14.eventAction=" + JSON.stringify(eventAction))
    //         if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
    //         } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
    //         } else {
    //         }
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['DTMF'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     await start(render2, done)
    //     await sleep(500)
    //     await release(render1, done)
    //     await release(render2, done)
    //     done()
    // })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7145
     * @tc.name      : AudioRender  TTS INTERRUPT GAME
     * @tc.desc      : AudioRender  TTS INTERRUPT GAME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7145', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("21.eventAction=" + JSON.stringify(eventAction))//1
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['TTS'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7146
    * @tc.name      : AudioRender  ACCESSIBILITY INTERRUPT GAME
    * @tc.desc      : AudioRender  ACCESSIBILITY INTERRUPT GAME
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7146', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_PAUSE)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_RESUME)
            } else { }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render2, done)
        await sleep(500)
        await release(render1, done)
        done()
    })

    /**
   * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7147
   * @tc.name      : AudioRender  ULTRASONIC INTERRUPT GAME
   * @tc.desc      : AudioRender  ULTRASONIC INTERRUPT GAME
   * @tc.size      : MEDIUM
   * @tc.type      : Function
   * @tc.level     : Level 0
   */
    // it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7147', 0, async function (done) {
    //     let render1 = await createAudioRenderer(renderInfo['GAME'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async (eventAction) => {
    //         console.log("14.eventAction=" + JSON.stringify(eventAction))
    //         if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
    //         } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
    //         } else {
    //         }
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     await start(render2, done)
    //     await sleep(500)
    //     await release(render1, done)
    //     await release(render2, done)
    //     done()
    // })

    /**
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7148
    * @tc.name      : AudioRender  VOICE_CALL INTERRUPT NAVIGATION
    * @tc.desc      : AudioRender  VOICE_CALL INTERRUPT NAVIGATION
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7148', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("21.eventAction=" + JSON.stringify(eventAction))//1
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })
    //7149    duck inproc            VOICE_MESSAGE
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7149
     * @tc.name      : AudioRender  VOICE_MESSAGE INTERRUPT NAVIGATION
     * @tc.desc      : AudioRender  VOICE_MESSAGE INTERRUPT NAVIGATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7149', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("21.eventAction=" + JSON.stringify(eventAction))//1
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7150
     * @tc.name      : AudioRender  SYSTEM INTERRUPT NAVIGATION
     * @tc.desc      : AudioRender  SYSTEM INTERRUPT NAVIGATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    // it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7150', 0, async function (done) {
    //     let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async (eventAction) => {
    //         console.log("14.eventAction=" + JSON.stringify(eventAction))
    //         if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
    //         } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
    //         } else {
    //         }
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['SYSTEM'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     await start(render2, done)
    //     await sleep(500)
    //     await release(render1, done)
    //     await release(render2, done)
    //     done()
    // })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7151
     * @tc.name      : AudioRender  RING INTERRUPT NAVIGATION
     * @tc.desc      : AudioRender  RING INTERRUPT NAVIGATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7151', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("14.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['RING'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })
    /**
   * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7152
   * @tc.name      : AudioRender  MUSIC INTERRUPT NAVIGATION
   * @tc.desc      : AudioRender  MUSIC INTERRUPT NAVIGATION
   * @tc.size      : MEDIUM
   * @tc.type      : Function
   * @tc.level     : Level 0
   */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7152', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render2.on("audioInterrupt", async (eventAction) => {
            console.log("8-2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            }
        })
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7153
     * @tc.name      : AudioRender  MOVIE INTERRUPT NAVIGATION
     * @tc.desc      : AudioRender  MOVIE INTERRUPT NAVIGATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7153', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render2.on("audioInterrupt", async (eventAction) => {
            console.log("8-2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            }
        })
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7154
    * @tc.name      : AudioRender  GAME INTERRUPT NAVIGATION
    * @tc.desc      : AudioRender  GAME INTERRUPT NAVIGATION
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7154', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['GAME'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render2.on("audioInterrupt", async (eventAction) => {
            console.log("8-2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            }
        })
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEST_7155
    * @tc.name      : AudioRender  SPEECH INTERRUPT NAVIGATION
    * @tc.desc      : AudioRender  SPEECH INTERRUPT NAVIGATION
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7155', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render2.on("audioInterrupt", async (eventAction) => {
            console.log("8-2.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
                } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                    expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
                } else {
                }
            }
        })
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7156
    * @tc.name      : AudioRender  NAVIGATION INTERRUPT NAVIGATION
    * @tc.desc      : AudioRender  NAVIGATION INTERRUPT NAVIGATION
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7156', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7157
    * @tc.name      : AudioRender  ALARM INTERRUPT NAVIGATION
    * @tc.desc      : AudioRender  ALARM INTERRUPT NAVIGATION
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7157', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("14.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7158
    * @tc.name      : AudioRender  NOTIFICATION INTERRUPT NAVIGATION
    * @tc.desc      : AudioRender  NOTIFICATION INTERRUPT NAVIGATION
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7158', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("14.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })
    //7159    play both     SYSTEM_ENFORCED
    /**
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7159
    * @tc.name      : AudioRender  SYSTEM_ENFORCED INTERRUPT NAVIGATION
    * @tc.desc      : AudioRender  SYSTEM_ENFORCED INTERRUPT NAVIGATION
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    // it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7159', 0, async function (done) {
    //     let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async (eventAction) => {
    //         console.log("14.eventAction=" + JSON.stringify(eventAction))
    //         if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
    //         } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
    //         } else {
    //         }
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['SYSTEM_ENFORCED'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     await start(render2, done)
    //     await sleep(500)
    //     await release(render1, done)
    //     await release(render2, done)
    //     done()
    // })

    /**
      * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7160
      * @tc.name      : AudioRender  DTMF INTERRUPT NAVIGATION
      * @tc.desc      : AudioRender  DTMF INTERRUPT NAVIGATION
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    // it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7160', 0, async function (done) {
    //     let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async (eventAction) => {
    //         console.log("14.eventAction=" + JSON.stringify(eventAction))
    //         if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
    //         } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
    //         } else {
    //         }
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['DTMF'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     await start(render2, done)
    //     await sleep(500)
    //     await release(render1, done)
    //     await release(render2, done)
    //     done()
    // })
    /**
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7161
    * @tc.name      : AudioRender  TTS INTERRUPT NAVIGATION
    * @tc.desc      : AudioRender  TTS INTERRUPT NAVIGATION
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7161', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['TTS'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })
    /**
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7162
    * @tc.name      : AudioRender  ACCESSIBILITY INTERRUPT NAVIGATION
    * @tc.desc      : AudioRender  ACCESSIBILITY INTERRUPT NAVIGATION
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7162', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
         * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7163
         * @tc.name      : AudioRender  ULTRASONIC INTERRUPT NAVIGATION
         * @tc.desc      : AudioRender  ULTRASONIC INTERRUPT NAVIGATION
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
    // it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7163', 0, async function (done) {
    //     let render1 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async (eventAction) => {
    //         console.log("14.eventAction=" + JSON.stringify(eventAction))
    //         if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
    //         } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
    //         } else {
    //         }
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     await start(render2, done)
    //     await sleep(500)
    //     await release(render1, done)
    //     await release(render2, done)
    //     done()
    // })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7164
     * @tc.name      : AudioRender  VOICE_CALL INTERRUPT NOTIFICATION
     * @tc.desc      : AudioRender  VOICE_CALL INTERRUPT NOTIFICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7164', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7165
    * @tc.name      : AudioRender  VOICE_MESSAGE INTERRUPT NOTIFICATION
    * @tc.desc      : AudioRender  VOICE_MESSAGE INTERRUPT NOTIFICATION
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7165', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_MESSAGE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7166
    * @tc.name      : AudioRender  SYSTEM INTERRUPT NOTIFICATION
    * @tc.desc      : AudioRender  SYSTEM INTERRUPT NOTIFICATION
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    // it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7166', 0, async function (done) {
    //     let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async (eventAction) => {
    //         console.log("1.eventAction=" + JSON.stringify(eventAction))
    //         expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['SYSTEM'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     await start(render2, done)
    //     await sleep(500)
    //     await release(render1, done)
    //     await release(render2, done)
    //     done()
    // })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7167
     * @tc.name      : AudioRender  RING INTERRUPT NOTIFICATION
     * @tc.desc      : AudioRender  RING INTERRUPT NOTIFICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7167', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['RING'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7168
     * @tc.name      : AudioRender  MUSIC INTERRUPT NOTIFICATION
     * @tc.desc      : AudioRender  MUSIC INTERRUPT NOTIFICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7168', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7169
     * @tc.name      : AudioRender  MOVIE INTERRUPT NOTIFICATION
     * @tc.desc      : AudioRender  MOVIE INTERRUPT NOTIFICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7169', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7170
    * @tc.name      : AudioRender  GAME INTERRUPT NOTIFICATION
    * @tc.desc      : AudioRender  GAME INTERRUPT NOTIFICATION
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7170', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['GAME'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7171
    * @tc.name      : AudioRender  SPEECH INTERRUPT NOTIFICATION
    * @tc.desc      : AudioRender  SPEECH INTERRUPT NOTIFICATION
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7171', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
            * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7172
            * @tc.name      : AudioRender  NAVIGATION INTERRUPT NOTIFICATION
            * @tc.desc      : AudioRender  NAVIGATION INTERRUPT NOTIFICATION
            * @tc.size      : MEDIUM
            * @tc.type      : Function
            * @tc.level     : Level 0
            */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7172', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("14.eventAction=" + JSON.stringify(eventAction))
            if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
            } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
                expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
            } else {
            }
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['NAVIGATION'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7173
    * @tc.name      : AudioRender  ALARM INTERRUPT NOTIFICATION
    * @tc.desc      : AudioRender  ALARM INTERRUPT NOTIFICATION
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7173', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7174
    * @tc.name      : AudioRender  NOTIFICATION INTERRUPT NOTIFICATION
    * @tc.desc      : AudioRender  NOTIFICATION INTERRUPT NOTIFICATION
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7174', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7175
    * @tc.name      : AudioRender  SYSTEM_ENFORCED INTERRUPT NOTIFICATION
    * @tc.desc      : AudioRender  SYSTEM_ENFORCED INTERRUPT NOTIFICATION
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    // it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7175', 0, async function (done) {
    //     let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async (eventAction) => {
    //         console.log("1.eventAction=" + JSON.stringify(eventAction))
    //         expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['SYSTEM_ENFORCED'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     await start(render2, done)
    //     await sleep(500)
    //     await release(render1, done)
    //     await release(render2, done)
    //     done()
    // })

    /**
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7176
    * @tc.name      : AudioRender  DTMF INTERRUPT NOTIFICATION
    * @tc.desc      : AudioRender  DTMF INTERRUPT NOTIFICATION
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    // it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7176', 0, async function (done) {
    //     let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async (eventAction) => {
    //         console.log("1.eventAction=" + JSON.stringify(eventAction))
    //         expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['DTMF'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     await start(render2, done)
    //     await sleep(500)
    //     await release(render1, done)
    //     await release(render2, done)
    //     done()
    // })

    /**
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7177
    * @tc.name      : AudioRender  TTS INTERRUPT NOTIFICATION
    * @tc.desc      : AudioRender  TTS INTERRUPT NOTIFICATION
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7177', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['TTS'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7178
    * @tc.name      : AudioRender  ACCESSIBILITY INTERRUPT NOTIFICATION
    * @tc.desc      : AudioRender  ACCESSIBILITY INTERRUPT NOTIFICATION
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7178', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        render1.on("audioInterrupt", async (eventAction) => {
            console.log("1.eventAction=" + JSON.stringify(eventAction))
            expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_STOP)
        })
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render2, done)
        await sleep(500)
        await release(render1, done)
        await release(render2, done)
        done()
    })

    /**
         * @tc.number    : SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7179
         * @tc.name      : AudioRender  ULTRASONIC INTERRUPT NOTIFICATION
         * @tc.desc      : AudioRender  ULTRASONIC INTERRUPT NOTIFICATION
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
    // it('SUB_MULTIMEDIA_AUDIO_RENDERER_INTERRUPT_TEScT_7179', 0, async function (done) {
    //     let render1 = await createAudioRenderer(renderInfo['NOTIFICATION'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async (eventAction) => {
    //         console.log("14.eventAction=" + JSON.stringify(eventAction))
    //         if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_BEGIN) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_DUCK)
    //         } else if (eventAction.eventType == audio.InterruptType.INTERRUPT_TYPE_END) {
    //             expect(eventAction.hintType).assertEqual(audio.InterruptHint.INTERRUPT_HINT_UNDUCK)
    //         } else {
    //         }
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     await start(render2, done)
    //     await sleep(500)
    //     await release(render1, done)
    //     await release(render2, done)
    //     done()
    // })

   
  
})
