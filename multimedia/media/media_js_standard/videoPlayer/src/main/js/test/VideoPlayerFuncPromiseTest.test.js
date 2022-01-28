/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import media from '@ohos.multimedia.media'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('VideoPlayerFuncPromiseTest', function () {
    const AUDIO_SOURCE = 'file://data/media/01.mp4';
    const PLAY_TIME = 3000;
    const SEEK_TIME = 5000;
    const SEEK_CLOSEST = 3;
    const WIDTH_VALUE = 720;
    const HEIGHT_VALUE = 480;
    const DURATION_TIME = 10034;
    const DELTA_TIME = 1000;

    beforeAll(function() {
        console.info('beforeAll case');
    })

    beforeEach(function() {
        console.info('beforeEach case');
    })

    afterEach(function() {
        console.info('afterEach case');
    })

    afterAll(function() {
        console.info('afterAll case');
    })

    function sleep(time) {
        for(let t = Date.now(); Date.now() - t <= time;);
    }

    function failureCallback(error) {
        expect().assertFail();
        console.info(`case error called,errMessage is ${error.message}`);
    }

    function catchCallback(error) {
        expect().assertFail();
        console.info(`case error called,errMessage is ${error.message}`);
    }

    function printfDescription(obj) { 
        let description = ""; 
        for(let i in obj) { 
            let property = obj[i];
            console.info('case key is  '+ i);
            console.info('case value is  '+ property);
            description += i + " = " + property + "\n"; 
        } 
    }

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_2800
        * @tc.name      : 028.Multi-instance (16 promise) 
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_2800', 0, async function (done) {
        let arr = new Array();
        for (let i = 0; i < 14;i++) {
            await media.createVideoPlayer().then((video) => {
                if (typeof (video) != 'undefined') {
                    arr[i] = video
                    console.info('case createVideoPlayer success ' + i);
                } else {
                    console.info('case createVideoPlayer is failed');
                    expect().assertFail();
                }
            }, failureCallback).catch(catchCallback);            
        }
        for (let j = 0; j < 14;j++) {
            await arr[j].release().then(() => {
                console.info('case release success ' + j);
            }, failureCallback).catch(catchCallback);
        }
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_0100
        * @tc.name      : 001.play (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_0100', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                console.info('case createVideoPlayer success');
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            console.info('case getDisplaySurface success and surfaceID is ' + outSurface);
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            console.info('case setDisplaySurface success');
            expect(videoPlayer.state).assertEqual('idle');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            console.info('case prepare called!!');
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            console.info('case play called!!');
            sleep(PLAY_TIME);
            expect(videoPlayer.state).assertEqual('playing');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_0200
        * @tc.name      : 002.pause (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_0200', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            console.info('case getDisplaySurface success and surfaceID is ' + outSurface);
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            console.info('case setDisplaySurface success');
            expect(videoPlayer.state).assertEqual('idle');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            console.info('case prepare called!!');
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            console.info('case play called!!');
            expect(videoPlayer.state).assertEqual('playing');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.pause().then(() => {
            expect(videoPlayer.state).assertEqual('paused');
            console.info('case pause called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_0300
        * @tc.name      : 003.pause->play (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_0300', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            console.info('case getDisplaySurface success and surfaceID is ' + outSurface);
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.pause().then(() => {
            expect(videoPlayer.state).assertEqual('paused');
            console.info('case pause called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_0400
        * @tc.name      : 004.stop (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_0400', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            console.info('case getDisplaySurface success and surfaceID is ' + outSurface);
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.stop().then(() => {
            expect(videoPlayer.state).assertEqual('stopped');
            console.info('case stop called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_0500
        * @tc.name      : 005.reset (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_0500', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            console.info('case getDisplaySurface success and surfaceID is ' + outSurface);
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.reset().then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case reset called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_0600
        * @tc.name      : 006.seek (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_0600', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            console.info('case getDisplaySurface success and surfaceID is ' + outSurface);
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.seek(SEEK_TIME).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_0700
        * @tc.name      : 007.seek CLOSEST(promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_0700', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            console.info('case getDisplaySurface success and surfaceID is ' + outSurface);
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.seek(SEEK_TIME, SEEK_CLOSEST).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(videoPlayer.currentTime + DELTA_TIME).assertClose(seekDoneTime + DELTA_TIME, DELTA_TIME);
            expect(seekDoneTime).assertEqual(SEEK_TIME);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_0800
        * @tc.name      : 008.setVolume (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_0800', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setVolume(1).then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case setVolume called');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_0900
        * @tc.name      : 009.setSpeed (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_0900', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setSpeed(2).then((speedMode) => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case setSpeed called and speedMode is ' + speedMode);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_1000
        * @tc.name      : 010.getTrackDescription (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_1000', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        let arrayDescription = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getTrackDescription().then((arrayList) => {
            console.info('case getTrackDescription called!!');
            if (typeof (arrayList) != 'undefined') {
                arrayDescription = arrayList;
            } else {
                console.info('case getTrackDescription is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        for (let i = 0; i < arrayDescription.length; i++) {
            printfDescription(arrayDescription[i]);
        }
        done();  
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_1100
        * @tc.name      : 011.Loop true (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_1100', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            videoPlayer.loop = true;
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.loop).assertEqual(true);
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.seek(DURATION_TIME, SEEK_CLOSEST).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(seekDoneTime).assertEqual(DURATION_TIME);
            expect(videoPlayer.currentTime + DELTA_TIME).assertEqual(seekDoneTime + DELTA_TIME);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_1200
        * @tc.name      : 012.play->pause->stop (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_1200', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.pause().then(() => {
            expect(videoPlayer.state).assertEqual('paused');
            console.info('case pause called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.stop().then(() => {
            expect(videoPlayer.state).assertEqual('stopped');
            console.info('case stop called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_1300
        * @tc.name      : 013.play->pause->reset (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_1300', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.pause().then(() => {
            expect(videoPlayer.state).assertEqual('paused');
            console.info('case pause called!!');
        }, failureCallback).catch(catchCallback);
        
		await videoPlayer.reset().then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case reset called!!');
        }, failureCallback).catch(catchCallback);
		
        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_1400
        * @tc.name      : 014.play->pause->seek->play (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_1400', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.pause().then(() => {
            expect(videoPlayer.state).assertEqual('paused');
            console.info('case pause called!!');
        }, failureCallback).catch(catchCallback);
        
        await videoPlayer.seek(SEEK_TIME).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('paused');
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, failureCallback).catch(catchCallback);
		
        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);
		
        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_1500
        * @tc.name      : 015.play->pause->seek(mode)->play (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_1500', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.pause().then(() => {
            expect(videoPlayer.state).assertEqual('paused');
            console.info('case pause called!!');
        }, failureCallback).catch(catchCallback);
        
        await videoPlayer.seek(SEEK_TIME, SEEK_CLOSEST).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('paused');
            expect(seekDoneTime).assertEqual(SEEK_TIME);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, failureCallback).catch(catchCallback);
		
        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);
		
        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_1600
        * @tc.name      : 016.play->pause->setvolume->play (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_1600', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.pause().then(() => {
            expect(videoPlayer.state).assertEqual('paused');
            console.info('case pause called!!');
        }, failureCallback).catch(catchCallback);
        
		await videoPlayer.setVolume(1).then(() => {
            expect(videoPlayer.state).assertEqual('paused');
            console.info('case setVolume called');
        }, failureCallback).catch(catchCallback);
		
        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);
		
        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_1700
        * @tc.name      : 017.play->pause->setspeed->play (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_1700', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.pause().then(() => {
            expect(videoPlayer.state).assertEqual('paused');
            console.info('case pause called!!');
        }, failureCallback).catch(catchCallback);
        
		await videoPlayer.setSpeed(2).then((speedMode) => {
            expect(videoPlayer.state).assertEqual('paused');
            console.info('case setSpeed called and speedMode is ' + speedMode);
        }, failureCallback).catch(catchCallback);
		
        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);
		
        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_1800
        * @tc.name      : 018.play->stop->reset (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_1800', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.stop().then(() => {
            expect(videoPlayer.state).assertEqual('stopped');
            console.info('case stop called!!');
        }, failureCallback).catch(catchCallback);
		
		await videoPlayer.reset().then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case reset called!!');
        }, failureCallback).catch(catchCallback);
		
        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_1900
        * @tc.name      : 019.play->stop->reset->prepare->play (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_1900', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.stop().then(() => {
            expect(videoPlayer.state).assertEqual('stopped');
            console.info('case stop called!!');
        }, failureCallback).catch(catchCallback);
		
		await videoPlayer.reset().then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case reset called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_2000
        * @tc.name      : 020.play->seek(0)->pause->stop (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_2000', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.seek(0).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, failureCallback).catch(catchCallback);
		
        await videoPlayer.pause().then(() => {
            expect(videoPlayer.state).assertEqual('paused');
            console.info('case pause called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.stop().then(() => {
            expect(videoPlayer.state).assertEqual('stopped');
            console.info('case stop called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done(); 
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_2100
        * @tc.name      : 021.play->seek(0, mode)->pause->stop (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_2100', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.seek(0, SEEK_CLOSEST).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(seekDoneTime).assertEqual(0);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, failureCallback).catch(catchCallback);
		
        await videoPlayer.pause().then(() => {
            expect(videoPlayer.state).assertEqual('paused');
            console.info('case pause called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.stop().then(() => {
            expect(videoPlayer.state).assertEqual('stopped');
            console.info('case stop called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_2200
        * @tc.name      : 022.play->seek(duration)->finish (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_2200', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        videoPlayer.on('playbackCompleted', () => {
            console.info('case playbackCompleted called!!');
            expect(videoPlayer.state).assertEqual('stopped');
            videoPlayer.release().then(() => {
                console.info('case release called!!');
                done();
            }, failureCallback).catch(catchCallback);
        });

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.seek(DURATION_TIME).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(videoPlayer.currentTime + DELTA_TIME).assertClose(seekDoneTime + DELTA_TIME, DELTA_TIME);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, failureCallback).catch(catchCallback);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_2300
        * @tc.name      : 023.play->seek(duration, mode)->finish (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_2300', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        videoPlayer.on('playbackCompleted', () => {
            console.info('case playbackCompleted called!!');
            expect(videoPlayer.state).assertEqual('stopped');
            videoPlayer.release().then(() => {
                console.info('case release called!!');
                done();
            }, failureCallback).catch(catchCallback);
        });
        
        await videoPlayer.getDisplaySurface().then((outSurface) => {
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.seek(DURATION_TIME, SEEK_CLOSEST).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(seekDoneTime).assertEqual(DURATION_TIME);
            expect(videoPlayer.currentTime).assertEqual(DURATION_TIME);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, failureCallback).catch(catchCallback);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_2400
        * @tc.name      : 024.play->seek(out of duration) (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_2400', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        videoPlayer.on('playbackCompleted', () => {
            console.info('case playbackCompleted called!!');
            expect(videoPlayer.state).assertEqual('stopped');
            videoPlayer.release().then(() => {
                console.info('case release called!!');
                done();
            }, failureCallback).catch(catchCallback);
        });

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.seek(DURATION_TIME + 1).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, (err) => {
            console.info('case seek out of duration called');
            done();
        }).catch(catchCallback);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_2500
        * @tc.name      : 025.play->seek(out of duration, mode) (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_2500', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        videoPlayer.on('playbackCompleted', () => {
            console.info('case playbackCompleted called!!');
            expect(videoPlayer.state).assertEqual('stopped');
            videoPlayer.release().then(() => {
                console.info('case release called!!');
                done();
            }, failureCallback).catch(catchCallback);
        });

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.seek(DURATION_TIME + 1, SEEK_CLOSEST).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(videoPlayer.currentTime).assertEqual(DURATION_TIME);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, (err) => {
            console.info('case seek out of duration called');
            done();
        }).catch(catchCallback);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_2600
        * @tc.name      : 026. play->setvolume(0~1) (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_2600', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);
        
        for (let i = 0; i < 6; i++) {
            await videoPlayer.setVolume(i * 0.2).then(() => {
                expect(videoPlayer.state).assertEqual('playing');
                console.info('case setVolume called');
            }, failureCallback).catch(catchCallback);   
        }

        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_2700
        * @tc.name      : 028.play->setspeed(0~4) (promise)
        * @tc.desc      : Audio playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_2700', 0, async function (done) {
        let videoPlayer = null;
        let surfaceID = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getDisplaySurface().then((outSurface) => {
            videoPlayer.url = AUDIO_SOURCE;
            surfaceID = outSurface;
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            expect(videoPlayer.state).assertEqual('playing');
            console.info('case play called!!');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        for (let i = 0; i < 5; i++) {
            await videoPlayer.setSpeed(i).then((speedMode) => {
                expect(videoPlayer.state).assertEqual('playing');
                console.info('case setSpeed called and speedMode is ' + speedMode);
            }, failureCallback).catch(catchCallback);
        }
        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done();
    })
})
