/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';

describe('audioTonePlayer',function() {
    let tonePlayerCallback = null;
    let name;
    let TagTone = 'AudioTonePlayerTest';
    let stringParameter = "invalid_parameter";
    function sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }
    beforeAll(function(){
        console.log('beforeAll test suit is executed');
    })
    beforeEach(function(){
        console.log('beforeEach test suit is executed');
    })
    beforeEach(function(){
        console.log('beforeEach test suit is executed');
    })

    afterEach(function(){
        console.log('afterEach test suit is executed');
    })
    afterAll(function(){
        console.log('afterAll test suit is executed');
    })

    async function recCallBack(info, type, name, done) {
        console.info('AudioFrameworkRecLog: recCallBack : TonePlayer Function '+ JSON.stringify(name) + ', type: ' + type);
        audio.createTonePlayer(info, async (err, data) => {
            console.info('AudioFrameworkRecLog: TonePlayer : CREATE SUCCESS');
            if (err) {
                console.error(`callback call createTonePlayer return error: ${err.message}`);
                expect(true).assertFalse();
                console.info('createTonePlayer fail');
                done();
                return;
            } else {
                tonePlayerCallback = data;
                console.error("callback call createTonePlayer return tonePlayer:" + JSON.stringify(tonePlayerCallback));
            }
            tonePlayerCallback.load(type, async (err) => {
                console.info('AudioFrameworkRecLog: TonePlayer : LOAD SUCCESS type: ' + type);
                if (err) {
                    console.error(`callback call load failed error: ${err.message}`);
                    expect(true).assertFalse();
                    console.error('callback load fail');
                    done();
                    return;
                } else {
                    console.info(`callback call load success `);
                }
                tonePlayerCallback.start((err) => {
                    console.info('AudioFrameworkRecLog: TonePlayer : START SUCCESS');
                    if (err) {
                        console.error(`callback call start failed error. ${err.message}`);
                        expect(true).assertFalse();
                        console.error('start fail');
                        done();
                        return;
                    } else {
                        console.info(`callback call start success `);
                    }
                    console.error("callback stop -------------start");
                    tonePlayerCallback.stop((err) => {
                        console.info('AudioFrameworkRecLog: TonePlayer : STOP SUCCESS');
                        if (err) {
                            console.error(`callback call stop error. ${err.message}`);
                            expect(true).assertFalse();
                            console.error('callback stop fail');
                            done();
                            return;
                        } else {
                            console.info(`callback call stop success `);
                        }
                        console.info("callback release -------------start");
                        tonePlayerCallback.release((err) => {
                            console.info('AudioFrameworkRecLog: TonePlayer : RELEASE SUCCESS');
                            if (err) {
                                console.error(`callback call release failed error. ${err.message}`);
                                expect(true).assertFalse();
                                console.error('callback release fail');
                                done();
                                return;
                            } else {
                                console.info(`callback call release success `);
                                expect(true).assertTrue();
                                console.info('RELEASE SUCCESS');
                                done();
                            }
                        }); //release
                    }); //stop
                }); //start
            }); //load
        });
    }

    async function recPromise(audioRendererInfo, type, name) {
        console.info('AudioFrameworkRecLog recPromise: promise : TonePlayer Function '+ JSON.stringify(name) + ', type: ' + type);
        let resultFlag = true;
        let tPlayer = null;
        await audio.createTonePlayer(audioRendererInfo).then((result) => {
            console.info('AudioFrameworkRecLog promise call createTonePlayer-----result: ' + JSON.stringify(result));
            tPlayer = result;
        }).catch((err) => {
            console.error('promise call createTonePlayer fail tPlayer: '+ tPlayer);
            console.error(`promise call createTonePlayer ---fail error. ${err.message}`);
            resultFlag = false;
        });
        if (resultFlag == false) {
            console.error('AudioFrameworkRecLog: createTonePlayer resultFlag : ' + resultFlag);
            return resultFlag;
        }
        await tPlayer.load(type).then(() => {
            console.info('AudioFrameworkRecLog: TonePlayer : LOAD SUCCESS');
            console.info('AudioFrameworkRecLog: ---------LOAD---------');
        }).catch((err) => {
            resultFlag = false;
            console.error(`promise call load ---fail error. ${err.message}`);
        });
        if (resultFlag == false) {
            console.error('AudioFrameworkRecLog: load resultFlag : ' + resultFlag);
            return resultFlag;
        }
        await tPlayer.start().then(() => {
            console.info('AudioFrameworkRecLog: TonePlayer : START SUCCESS');
            console.info('AudioFrameworkRecLog: ---------START---------');
        }).catch((err) => {
            resultFlag = false;
            console.error(`promise call start ---fail error. ${err.message}`);
        });
        if (resultFlag == false) {
            console.error('AudioFrameworkRecLog: start resultFlag : ' + resultFlag);
            return resultFlag;
        }
        await tPlayer.stop().then(() => {
            console.info('AudioFrameworkRecLog: TonePlayer : STOP SUCCESS');
            console.info('AudioFrameworkRecLog: ---------STOP---------');
        }).catch((err) => {
            resultFlag = false;
            console.error(`promise call stop ---fail error. ${err.message}`);
        });
        if (resultFlag == false) {
            console.error('AudioFrameworkRecLog: stop resultFlag : ' + resultFlag);
            return resultFlag;
        }
        await tPlayer.release().then(() => {
            console.info('AudioFrameworkRecLog: TonePlayer : RELEASE SUCCESS');
            console.info('AudioFrameworkRecLog: ---------RELEASE---------');
        }).catch((err) => {
            resultFlag = false;
            console.error(`promise call release ---fail error. ${err.message}`);
        });
        if (resultFlag == false) {
            console.error('AudioFrameworkRecLog: release resultFlag : ' + resultFlag);
            return resultFlag;
        }
        console.info('promise resultFlag : ' + resultFlag);
        return resultFlag;
    }

    async function recPromiseStartFail(audioRendererInfo, type, name) {
        console.info('recPromiseFail: promise : TonePlayer Function '+ JSON.stringify(name) + ', type: ' + type);
        let resultFlag = true;
        let tPlayer = null;
        console.info('AudioFrameworkRecLog: recPromiseFail : TonePlayer Function ' + JSON.stringify(name));
        await audio.createTonePlayer(audioRendererInfo).then((result) => {
            console.info("recPromiseFail call createTonePlayer-----result:" + JSON.stringify(result));
            tPlayer = result;
        }).catch((err) => {
            console.error("recPromiseFail call createTonePlayer fail err: "+ JSON.stringify(err)+ ' tPlayer: '+ tPlayer);
            console.error("recPromiseFail call createTonePlayer ---fail");
            resultFlag = false;
        });
        if (resultFlag == false) {
            console.error('recPromiseFail: createTonePlayer resultFlag : ' + resultFlag);
            return resultFlag;
        }
        await tPlayer.start().then(() => {
            console.info('recPromiseFail start TonePlayer : START SUCCESS');
            console.info('recPromiseFail ---------START---------');
        }).catch(() => {
            resultFlag = false;
            console.error("recPromiseFail call start fail");
        });
        if (resultFlag == false) {
            console.error('recPromiseFail resultFlag : ' + resultFlag);
            return resultFlag;
        }
        await tPlayer.release().then(() => {
            console.info('recPromiseFail TonePlayer : RELEASE SUCCESS');
            console.info('recPromiseFail  ---------RELEASE---------');
        }).catch((err) => {
            resultFlag = false;
            console.error("recPromiseFail call release fail " + JSON.stringify(err));
        });
        if (resultFlag == false) {
            console.error('recPromiseFail resultFlag : ' + resultFlag);
            return resultFlag;
        }
        console.info('recPromiseFail resultFlag : ' + resultFlag);
        return resultFlag;
    }

	async function recPromiseLoadStopSuccess(audioRendererInfo, type, name) {
        console.info('recPromiseFail: promise : TonePlayer Function '+ JSON.stringify(name) + ', type: ' + type);
        let resultFlag = true;
        let tPlayer = null;
        console.info('AudioFrameworkRecLog: recPromiseFail : TonePlayer Function ' + JSON.stringify(name));
        await audio.createTonePlayer(audioRendererInfo).then((result) => {
            console.info("recPromiseFail call createTonePlayer-----result:" + JSON.stringify(result));
            tPlayer = result;
        }).catch((err) => {
            console.error("recPromiseFail call createTonePlayer fail err: "+ JSON.stringify(err)+ ' tPlayer: '+ tPlayer);
            console.error("recPromiseFail call createTonePlayer ---fail");
            resultFlag = false;
        });
        if (resultFlag == false) {
            console.error('recPromiseFail: createTonePlayer resultFlag : ' + resultFlag);
            return resultFlag;
        }
		await tPlayer.load(type).then(() => {
            console.info('AudioFrameworkRecLog: TonePlayer : LOAD SUCCESS');
            console.info('AudioFrameworkRecLog: ---------LOAD---------');
        }).catch((err) => {
            resultFlag = false;
            console.error(`promise call load ---fail error. ${err.message}`);
        });
        if (resultFlag == false) {
            console.error('AudioFrameworkRecLog: load resultFlag : ' + resultFlag);
            return resultFlag;
        }
        await tPlayer.stop().then(() => {
            console.info('AudioFrameworkRecLog: TonePlayer : STOP SUCCESS');
            console.info('AudioFrameworkRecLog: ---------STOP---------');
        }).catch((err) => {
            resultFlag = false;
            console.error(`promise call stop ---fail error. ${err.message}`);
        });
        if (resultFlag == false) {
            console.error('AudioFrameworkRecLog: stop resultFlag : ' + resultFlag);
            return resultFlag;
        }
        await tPlayer.release().then(() => {
            console.info('recPromiseFail TonePlayer : RELEASE SUCCESS');
            console.info('recPromiseFail  ---------RELEASE---------');
        }).catch((err) => {
            resultFlag = false;
            console.error("recPromiseFail call release fail " + JSON.stringify(err));
        });
        if (resultFlag == false) {
            console.error('recPromiseFail resultFlag : ' + resultFlag);
            return resultFlag;
        }
        console.info('recPromiseFail resultFlag : ' + resultFlag);
        return resultFlag;
    }

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_CALLBACK_ALL_0100
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : Callback test case of AudioTonePlayer
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_CALLBACK_ALL_0100', 0, async function(done) {
        let time1 = (new Date()).getTime();
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }
        recCallBack(audioRendererInfo, audio.ToneType.TONE_TYPE_DIAL_0, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_CALLBACK_ALL_0100', done);
        let time2 = (new Date).getTime();
        console.info('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_CALLBACK_ALL_0100 finish time: ' + (time2 - time1));
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_CALLBACK_ALL_0200
     *@tc.name      : AudioTonePlayer-create
     *@tc.desc      : Creation of AudioTonePlayer
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_AUDIO_TTONEPLAYER_CALLBACK_ALL_0200', 1, async function(done) {
        let time1 = (new Date()).getTime();
        audio.createTonePlayer(null, async (err, data) => {
            console.info('SUB_MULTIMEDIA_AUDIO_TTONEPLAYER_CALLBACK_ALL_0200 param is null');
            if (err) {
                console.error('callback call createTonePlayer return error:'+ JSON.stringify(err));
                let time2 = (new Date).getTime();
                console.info('time: ' + (time2 - time1));
                expect(false).assertFalse();
                done();
            } else {
                tonePlayerCallback = data;
                expect(true).assertFalse();
                done();
                console.error("callback call createTonePlayer return tonePlayer:" + JSON.stringify(tonePlayerCallback));
            }
            console.error("callback create end----------- tonePlayerCallback:" + JSON.stringify(tonePlayerCallback));
        });
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0100
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : The successful test case of the promise of the dial tone of AudioTonePlayer key 1
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0100', 1, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_DIAL_1, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0100');
        console.info('ArecPromise 01 resultFlag : ' + resultFlag);
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 01 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0200
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : The successful test case of the promise of the dial tone of AudioTonePlayer key 2
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0200', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_DIAL_2, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0200');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 02 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0300
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : The successful test case of the promise of the dial tone of AudioTonePlayer key 3
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0300', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_DIAL_3, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0300');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 03 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0400
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : The successful test case of the promise of the dial tone of AudioTonePlayer key 4
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0400', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_DIAL_4, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0400');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 04 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0500
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : The successful test case of the promise of the dial tone of AudioTonePlayer key 5
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0500', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_DIAL_5, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0500');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 05 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0600
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : The successful test case of the promise of the dial tone of AudioTonePlayer key 6
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0600', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_DIAL_6, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0600');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 06 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0700
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : The successful test case of the promise of the dial tone of AudioTonePlayer key 7
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0700', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_DIAL_7, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0700');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 07 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0800
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : The successful test case of the promise of the dial tone of AudioTonePlayer key 8
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0800', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_DIAL_8, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0800');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 08 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0900
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : The successful test case of the promise of the dial tone of AudioTonePlayer key 9
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0900', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_DIAL_9, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_0900');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 09 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1000
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : The successful test case of the promise of the dial tone of AudioTonePlayer key *
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1000', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_DIAL_S, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1000');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 10 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1100
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : The successful test case of the promise of the dial tone of AudioTonePlayer key #
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1100', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_DIAL_P, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1100');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 11 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1200
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : The successful test case of the promise of the dial tone of AudioTonePlayer key A
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1200', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_DIAL_A, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1200');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 12 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1300
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : The successful test case of the promise of the dial tone of AudioTonePlayer key B
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1300', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_DIAL_B, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1300');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 13 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1400
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : The successful test case of the promise of the dial tone of AudioTonePlayer key C
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1400', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_DIAL_C, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1400');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 14 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1500
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : The successful test case of the promise of the dial tone of AudioTonePlayer key D
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1500', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_DIAL_D, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1500');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 15 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1600
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : AudioTonePlayer Dial Monitoring Tone Promise Success Test Case
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1600', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_COMMON_SUPERVISORY_DIAL, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1600');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 16 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1700
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : AudioTonePlayer Busy Tone Promise Successful Test Case
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1700', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_COMMON_SUPERVISORY_BUSY, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1700');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 17 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1800
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : AudioTonePlayer Congestion Promise Success Test Case
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1800', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_COMMON_SUPERVISORY_CONGESTION, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1800');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 18 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1900
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : AudioTonePlayer Wireless Circuit Path Confirmation Monitoring Tone Promise Success Test Case
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1900', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_COMMON_SUPERVISORY_RADIO_ACK, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_1900');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 19 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2000
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : AudioTonePlayer radio unavailable promise success test case
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2000', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_COMMON_SUPERVISORY_RADIO_NOT_AVAILABLE, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2000');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 20 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2100
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : AudioTonePlayer Call Waiting Promise Success Test Case
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2100', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_COMMON_SUPERVISORY_CALL_WAITING, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2100');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 21 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2200
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : AudioTonePlayer ring tone promise success test case
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2200', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_COMMON_SUPERVISORY_RINGTONE, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2200');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 22 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2300
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : Promise success test case of AudioTonePlayer special beep
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
    */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2300', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_COMMON_PROPRIETARY_BEEP, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2300');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 23 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2400
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : AudioTonePlayer positively approves the successful test case of a promise in a proprietary tone
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2400', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_COMMON_PROPRIETARY_ACK, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2400');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 24 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2500
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : AudioTonePlayer prompts the successful promise test case of the special tone
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2500', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_COMMON_PROPRIETARY_PROMPT, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2500');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 25 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2600
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : Success Test Case of Promise of AudioTonePlayer Dedicated Double Beep
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2600', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, audio.ToneType.TONE_TYPE_COMMON_PROPRIETARY_DOUBLE_BEEP, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2600');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 26 resultFlag : ' + resultFlag);
            expect(resultFlag).assertTrue();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2700
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : Promise test case of AudioTonePlayer error parameter - 1
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2700', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, -1, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2700');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 27 resultFlag : ' + resultFlag);
            expect(resultFlag).assertFalse();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2800
     *@tc.name      : AudioTonePlayer-create-load-start-stop-release
     *@tc.desc      : Promise test case with null AudioTonePlayer error parameter
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2800', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromise(audioRendererInfo, null, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2800');
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 28 resultFlag : ' + resultFlag);
            expect(resultFlag).assertFalse();
            done();
        }, 1000)
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2900
     *@tc.name      : AudioTonePlayer-create-stop-release fail
     *@tc.desc      : Test Case for Promise Failure of Dial Tone of AudioTonePlayer Key 1
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
     it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2900', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromiseStartFail(audioRendererInfo, audio.ToneType.TONE_TYPE_DIAL_1, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_2900');
        console.info('ArecPromise 01 resultFlag : ' + resultFlag);
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 29 resultFlag : ' + resultFlag);
            expect(resultFlag).assertFalse();
            done();
        }, 2000)
    })

	/**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_3000
     *@tc.name      : AudioTonePlayer-create-load-stop-release fail
     *@tc.desc      : The successful test case of the promise of the dial tone of AudioTonePlayer key 1
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
     it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_3000', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let resultFlag = false;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        resultFlag = await recPromiseLoadStopSuccess(audioRendererInfo, audio.ToneType.TONE_TYPE_DIAL_1, 'SUB_MULTIMEDIA_AUDIO_TONEPLAYER_PROMISE_ALL_3000');
        console.info('ArecPromise 01 resultFlag : ' + resultFlag);
        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        setTimeout(function() {
            console.info('AudioFrameworkRenderLog: callback all 30 resultFlag : ' + resultFlag);
            expect(resultFlag).assertFalse();
            done();
        }, 2000)
    })

	/**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_CREATETONEPLAYER_0100
     *@tc.name      : AudioTonePlayer-create
     *@tc.desc      : The successful test case of the promise of the dial tone of AudioTonePlayer
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
     it('SUB_MULTIMEDIA_AUDIO_CREATETONEPLAYER_0100', 2, function(done) {
        audio.createTonePlayer(stringParameter).then(async (result) => {
            console.info("recPromiseFail call createTonePlayer-----result:" + JSON.stringify(result));
            await result.release().then(() => {
                console.info('recPromiseFail TonePlayer : RELEASE SUCCESS');
                console.info('recPromiseFail  ---------RELEASE---------');
            }).catch((err) => {
                console.error("recPromiseFail call release fail " + JSON.stringify(err));
            });
            expect(false).assertTrue();
        }).catch((err) => {
            console.log('err :' + err.code)
            if (err.code == 6800101) {
                console.log(`${TagTone}: load : PASS : message:${err.message}`);
                expect(true).assertTrue();
            }else {
                console.log(`${TagTone}: load : FAIL : message:${err.message}`);
                expect(false).assertTrue();
            }
        });
        done();
    })

	/**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_CREATETONEPLAYER_0100
     *@tc.name      : AudioTonePlayer-create
     *@tc.desc      : The successful test case of the promise of the dial tone of AudioTonePlayer
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
     it('SUB_MULTIMEDIA_AUDIO_CREATETONEPLAYER_0200', 2, function(done) {
        audio.createTonePlayer(stringParameter, async (err, data)=>{
            if (err) {
                console.log('err :' + err.code)
                if (err.code == 6800101) {
                    console.log(`${TagTone}: load : PASS : message:${err.message}`);
                    expect(true).assertTrue();
                }else {
                    console.log(`${TagTone}: load : FAIL : message:${err.message}`);
                    expect(false).assertTrue();
                }
            } else {
                await data.release().then(() => {
                    console.info('recPromiseFail TonePlayer : RELEASE SUCCESS');
                    console.info('recPromiseFail  ---------RELEASE---------');
                }).catch((err) => {
                    console.error("recPromiseFail call release fail " + JSON.stringify(err));
                });
                expect(false).assertTrue();
            }
            done();
        })
    })

	/**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_LOAD_0100
     *@tc.name      : AudioTonePlayer-create-load-stop-release success
     *@tc.desc      : The successful test case of the promise of the dial tone of AudioTonePlayer key 1
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
     it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_LOAD_0100', 2, async function(done) {
        let tPlayer = null;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        await audio.createTonePlayer(audioRendererInfo).then((result) => {
            console.info("recPromiseFail call createTonePlayer-----result:" + JSON.stringify(result));
            tPlayer = result;
        }).catch((err) => {
            console.error("recPromiseFail call createTonePlayer fail err: "+ JSON.stringify(err)+ ' tPlayer: '+ tPlayer);
            console.error("recPromiseFail call createTonePlayer ---fail");
        });

		await tPlayer.load(stringParameter).then(() => {
            console.info('AudioFrameworkRecLog: ---------LOAD---------');
            expect(false).assertTrue();
        }).catch((err) => {
            console.log('err :' + err.code)
            if (err.code == 6800101) {
                console.log(`${TagTone}: load : PASS : message:${err.message}`);
                expect(true).assertTrue();
            }else {
                console.log(`${TagTone}: load : FAIL : message:${err.message}`);
                expect(false).assertTrue();
            }
        });

        await tPlayer.stop().then(() => {
            console.info('AudioFrameworkRecLog: TonePlayer : STOP SUCCESS');
            console.info('AudioFrameworkRecLog: ---------STOP---------');
        }).catch((err) => {
            console.error(`promise call stop ---fail error. ${err.message}`);
        });

        await tPlayer.release().then(() => {
            console.info('recPromiseFail TonePlayer : RELEASE SUCCESS');
            console.info('recPromiseFail  ---------RELEASE---------');
        }).catch((err) => {
            console.error("recPromiseFail call release fail " + JSON.stringify(err));
        });
        done();
    })

	/**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_TONEPLAYER_LOAD_0200
     *@tc.name      : AudioTonePlayer-create-load-stop-release success
     *@tc.desc      : The successful test case of the promise of the dial tone of AudioTonePlayer key 1
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_TONEPLAYER_LOAD_0200', 2, async function(done) {
        let time1 = (new Date()).getTime();
        let tPlayer = null;
        let audioRendererInfo = {
            "contentType": audio.ContentType.CONTENT_TYPE_SONIFICATION,
            "streamUsage": audio.StreamUsage.STREAM_USAGE_MEDIA,
            "rendererFlags": 0
        }

        await audio.createTonePlayer(audioRendererInfo).then((result) => {
            console.info("recPromiseFail call createTonePlayer-----result:" + JSON.stringify(result));
            tPlayer = result;
        }).catch((err) => {
            console.error("recPromiseFail call createTonePlayer fail err: "+ JSON.stringify(err)+ ' tPlayer: '+ tPlayer);
            console.error("recPromiseFail call createTonePlayer ---fail");
        });

		await tPlayer.load(stringParameter, (err, data)=>{
            if (err) {
                console.log('err :' + err.code)
                if (err.code == 6800101) {
                    console.log(`${TagTone}: load : PASS : message:${err.message}`);
                    expect(true).assertTrue();
                }else {
                    console.log(`${TagTone}: load : FAIL : message:${err.message}`);
                    expect(false).assertTrue();
                }
            } else {
                console.info('AudioFrameworkRecLog: ---------LOAD---------');
                expect(false).assertTrue();
            }
        });
        await sleep(1000);
        await tPlayer.stop().then(() => {
            console.info('AudioFrameworkRecLog: TonePlayer : STOP SUCCESS');
            console.info('AudioFrameworkRecLog: ---------STOP---------');
        }).catch((err) => {
            console.error(`promise call stop ---fail error. ${err.message}`);
        });

        await tPlayer.release().then(() => {
            console.info('recPromiseFail TonePlayer : RELEASE SUCCESS');
            console.info('recPromiseFail  ---------RELEASE---------');
        }).catch((err) => {
            console.error("recPromiseFail call release fail " + JSON.stringify(err));
        });

        let time2 = (new Date).getTime();
        console.info('time: ' + (time2 - time1));
        done();
    })
})