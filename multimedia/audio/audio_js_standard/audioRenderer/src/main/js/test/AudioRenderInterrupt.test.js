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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_001', 0, async function (done) {
        try {
            console.info('SUB_AUDIO_RENDERER_INTERRUPT_TEST_001 come in ')
            let render1 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['44100'])
            console.info('SUB_AUDIO_RENDERER_INTERRUPT_TEST_001 render1 is ' + render1)
            await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
            console.info('SUB_AUDIO_RENDERER_INTERRUPT_TEST_001  111111111111')
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
            console.info('SUB_AUDIO_RENDERER_INTERRUPT_TEST_001 err is '+err.message)
        }

    })

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_002', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_003', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_004', 0, async function (done) {
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

    // it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_005', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_006', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_007', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_008', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_009', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_010', 0, async function (done) {
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

    // VOICE_CALL
    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_011', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_012', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await startFail(render2, done, render1)
    })

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_013', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await startFail(render2, done, render1)
    })

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_014', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await startFail(render2, done, render1)
    })

    // it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_015', 0, async function (done) {
    //     let render1_callback = false
    //     let render2_callback = false
    //     let render1 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async(eventAction) => {
    //         console.log("12.eventAction=" + JSON.stringify(eventAction))
    //         render1_callback = true
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render2.on("audioInterrupt", async(eventAction) => {
    //         console.log("12-2.eventAction=" + JSON.stringify(eventAction))
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_016', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_017', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_018', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_019', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_020', 0, async function (done) {
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

    // RINGTONE
    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_021', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_022', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_023', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await startFail(render2, done, render1)
    })

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_024', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await startFail(render2, done, render1)
    })

    // it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_025', 0, async function (done) {
    //     let render1_callback = false
    //     let render2_callback = false
    //     let render1 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async(eventAction) => {
    //         console.log("19.eventAction=" + JSON.stringify(eventAction))
    //         render1_callback = true
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render2.on("audioInterrupt", async(eventAction) => {
    //         console.log("19-2.eventAction=" + JSON.stringify(eventAction))
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_026', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_027', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_028', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_029', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_030', 0, async function (done) {
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


    // VOICE_ASSISTANT
    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_031', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_032', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_033', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_034', 0, async function (done) {
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

    // it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_035', 0, async function (done) {
    //     let render1_callback = false
    //     let render2_callback = false
    //     let render1 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async(eventAction) => {
    //         console.log("26.eventAction=" + JSON.stringify(eventAction))
    //         render1_callback = true
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render2.on("audioInterrupt", async(eventAction) => {
    //         console.log("26-2.eventAction=" + JSON.stringify(eventAction))
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_036', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_037', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_038', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_039', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_040', 0, async function (done) {
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

    // // ULTRASONIC
    // it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_041', 0, async function (done) {
    //     let render1_callback = false
    //     let render2_callback = false
    //     let render1 = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async(eventAction) => {
    //         console.log("29.eventAction=" + JSON.stringify(eventAction))
    //         render1_callback = true
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render2.on("audioInterrupt", async(eventAction) => {
    //         console.log("29_2.eventAction=" + JSON.stringify(eventAction))
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

    // it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_042', 0, async function (done) {
    //     let render1_callback = false
    //     let render2_callback = false
    //     let render1 = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async(eventAction) => {
    //         console.log("30.eventAction=" + JSON.stringify(eventAction))
    //         render1_callback = true
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['VOICE_CALL'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render2.on("audioInterrupt", async(eventAction) => {
    //         console.log("30_2.eventAction=" + JSON.stringify(eventAction))
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

    // it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_043', 0, async function (done) {
    //     let render1_callback = false
    //     let render2_callback = false
    //     let render1 = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async(eventAction) => {
    //         console.log("31.eventAction=" + JSON.stringify(eventAction))
    //         render1_callback = true
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['RINGTONE'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render2.on("audioInterrupt", async(eventAction) => {
    //         console.log("31_2.eventAction=" + JSON.stringify(eventAction))
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

    // it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_044', 0, async function (done) {
    //     let render1_callback = false
    //     let render2_callback = false
    //     let render1 = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async(eventAction) => {
    //         console.log("32.eventAction=" + JSON.stringify(eventAction))
    //         render1_callback = true
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async(eventAction) => {
    //         console.log("32_2.eventAction=" + JSON.stringify(eventAction))
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

    // it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_045', 0, async function (done) {
    //     let render1_callback = false
    //     let render2_callback = false
    //     let render1 = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async(eventAction) => {
    //         console.log("33.eventAction=" + JSON.stringify(eventAction))
    //         render1_callback = true
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render2.on("audioInterrupt", async(eventAction) => {
    //         console.log("33_2.eventAction=" + JSON.stringify(eventAction))
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

    // it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_046', 0, async function (done) {
    //     let render1_callback = false
    //     let render2_callback = false
    //     let render1 = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async(eventAction) => {
    //         console.log("34.eventAction=" + JSON.stringify(eventAction))
    //         render1_callback = true
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['ALARM'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render2.on("audioInterrupt", async(eventAction) => {
    //         console.log("34_2.eventAction=" + JSON.stringify(eventAction))
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

    // it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_047', 0, async function (done) {
    //     let render1_callback = false
    //     let render2_callback = false
    //     let render1 = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async(eventAction) => {
    //         console.log("35.eventAction=" + JSON.stringify(eventAction))
    //         render1_callback = true
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render2.on("audioInterrupt", async(eventAction) => {
    //         console.log("35_2.eventAction=" + JSON.stringify(eventAction))
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

    // it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_048', 0, async function (done) {
    //     let render1_callback = false
    //     let render2_callback = false
    //     let render1 = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async(eventAction) => {
    //         console.log("29.eventAction=" + JSON.stringify(eventAction))
    //         render1_callback = true
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render2.on("audioInterrupt", async(eventAction) => {
    //         console.log("29_2.eventAction=" + JSON.stringify(eventAction))
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

    // it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_049', 0, async function (done) {
    //     let render1_callback = false
    //     let render2_callback = false
    //     let render1 = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async(eventAction) => {
    //         console.log("29.eventAction=" + JSON.stringify(eventAction))
    //         render1_callback = true
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render2.on("audioInterrupt", async(eventAction) => {
    //         console.log("29_2.eventAction=" + JSON.stringify(eventAction))
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

    // it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_050', 0, async function (done) {
    //     let render1_callback = false
    //     let render2_callback = false
    //     let render1 = await createAudioRenderer(renderInfo['ULTRASONIC'], streamInfo['44100'])
    //     await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render1.on("audioInterrupt", async(eventAction) => {
    //         console.log("29.eventAction=" + JSON.stringify(eventAction))
    //         render1_callback = true
    //     })
    //     await start(render1, done)

    //     let render2 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['48000'])
    //     await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
    //     render2.on("audioInterrupt", async(eventAction) => {
    //         console.log("29_2.eventAction=" + JSON.stringify(eventAction))
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

    // ALARM
    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_051', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_052', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_053', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_054', 0, async function (done) {
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

    // it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_055', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_056', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_057', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_058', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_059', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_060', 0, async function (done) {
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

    // ACCESSIBILITY
    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_061', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MUSIC'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await startFail(render2, done, render1)
    })

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_062', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_063', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_064', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['VOICE_ASSISTANT'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await startFail(render2, done, render1)
    })

    // it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_065', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_066', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_067', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_068', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['SPEECH'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await startFail(render2, done, render1)
    })

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_069', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['MOVIE'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await startFail(render2, done, render1)
    })

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_070', 0, async function (done) {
        let render1 = await createAudioRenderer(renderInfo['ACCESSIBILITY'], streamInfo['44100'])
        await render1.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await start(render1, done)

        let render2 = await createAudioRenderer(renderInfo['UNKNOW'], streamInfo['48000'])
        await render2.setInterruptMode(audio.InterruptMode.INDEPENDENT_MODE)
        await startFail(render2, done, render1)
    })

    // SPEECH
    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_071', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_072', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_073', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_074', 0, async function (done) {
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

    // it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_075', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_076', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_077', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_078', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_079', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_080', 0, async function (done) {
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

    // MOVIE
    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_081', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_082', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_083', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_084', 0, async function (done) {
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

    // it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_085', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_086', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_087', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_088', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_089', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_090', 0, async function (done) {
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

    // UNKNOW
    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_091', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_092', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_093', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_094', 0, async function (done) {
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

    // it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_095', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_096', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_097', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_098', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_099', 0, async function (done) {
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

    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_100', 0, async function (done) {
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

    // 两个stream同时为share mode
    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_101', 0, async function (done) {
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

    // 第一个为share mode, 第二个为Independe mode
    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_102', 0, async function (done) {
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

    // 第一个为independ mode, 第二个为share mode
    it('SUB_AUDIO_RENDERER_INTERRUPT_TEST_103', 0, async function (done) {
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
})
