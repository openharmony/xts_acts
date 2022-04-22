/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import {toNewPage, clearRouter} from './VideoPlayerTestBase.js';
import {getFileDescriptor, closeFileDescriptor, isFileOpen} from '../../../../../MediaTestBase.js';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('VideoPlayerFuncPromiseTest', function () {
    const VIDEO_SOURCE = 'H264_AAC.mp4';
    const PLAY_TIME = 3000;
    const SEEK_TIME = 5000;
    const WIDTH_VALUE = 720;
    const HEIGHT_VALUE = 480;
    const DURATION_TIME = 10034;
    const DELTA_TIME = 1000;
    const NEXT_FRAME_TIME = 8333;
    const PREV_FRAME_TIME = 4166;
    const DELTA_SEEK_TIME = 100;
    let surfaceID = '';
    let fdHead = 'fd://';
    let fileDescriptor = undefined;
    let page = 0;

    beforeAll(async function() {
        console.info('beforeAll case');
        await getFileDescriptor(VIDEO_SOURCE).then((res) => {
            fileDescriptor = res;
        });
    })

    beforeEach(async function() {
        await toNewPage(page);
        page = (page + 1) % 2;
        await msleep(1000).then(() => {}, failureCallback).catch(catchCallback);
        surfaceID = globalThis.value;
        console.info('case new surfaceID is ' + surfaceID);
        console.info('beforeEach case');
    })

    afterEach(async function() {
        await clearRouter();
        console.info('afterEach case');
    })

    afterAll(async function() {
        await closeFileDescriptor(VIDEO_SOURCE);
        console.info('afterAll case');
    })

    function sleep(time) {
        for(let t = Date.now(); Date.now() - t <= time;);
    }

    function msleep(ms) {
        return new Promise((resolve) => setTimeout(resolve, ms));
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

    function checkSpeedTime(videoPlayer, speedValue, startTime) {
        let newTime = videoPlayer.currentTime;
        if (videoPlayer.state == 'playing') {
            switch (speedValue) {
                case media.PlaybackSpeed.SPEED_FORWARD_0_75_X:
                    expect(newTime - startTime).assertClose(0.75 * 1000, DELTA_TIME);
                    break;
                case media.PlaybackSpeed.SPEED_FORWARD_1_00_X:
                    expect(newTime - startTime).assertClose(1000, DELTA_TIME);
                    break;
                case media.PlaybackSpeed.SPEED_FORWARD_1_25_X:
                    expect(newTime - startTime).assertClose(1.25 * 1000, DELTA_TIME);
                    break;
                case media.PlaybackSpeed.SPEED_FORWARD_1_75_X:
                    expect(newTime - startTime).assertClose(1.75 * 1000, DELTA_TIME);
                    break;
                case media.PlaybackSpeed.SPEED_FORWARD_2_00_X:
                    expect(newTime - startTime).assertClose(2 * 1000, DELTA_TIME);
                    break;
            }
        } else {
            console.info('case speed not in play');
        }
    }

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_SetSource
        * @tc.name      : 001.setSorce "" (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_SetSource', 0, async function (done) {
        isFileOpen(fileDescriptor, done);
        let videoPlayer = null;
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

        videoPlayer.on('error', async (error) => {
            console.info(`case error called,errMessage is ${error.message}`);
            await videoPlayer.release().then(() => {
                console.info('case release called!!');
            }, failureCallback).catch(catchCallback);
            done();
        });
        videoPlayer.url = "";
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_SetVolume
        * @tc.name      : 001.SetVolume 0/0.5/1 (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_SetVolume', 0, async function (done) {
        isFileOpen(fileDescriptor, done);
        let videoPlayer = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        videoPlayer.url = fdHead + fileDescriptor.fd;
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

        let startTime = videoPlayer.currentTime;
        await videoPlayer.play().then(() => {
            console.info('case play called!!');
            sleep(PLAY_TIME);
            expect(videoPlayer.state).assertEqual('playing');
        }, failureCallback).catch(catchCallback);
        let endTime = videoPlayer.currentTime;
        expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);
        
        for (let i = 0; i < 3; i++) {
            await videoPlayer.setVolume(i * 0.5).then(() => {
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
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_SetSpeed
        * @tc.name      : 001.SetSpeed 0.75/1/1.25/1.75/2 (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_SetSpeed', 0, async function (done) {
        isFileOpen(fileDescriptor, done);
        let videoPlayer = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        videoPlayer.url = fdHead + fileDescriptor.fd;
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

        let startTime = videoPlayer.currentTime;
        await videoPlayer.play().then(() => {
            console.info('case play called!!');
            sleep(1000);
            expect(videoPlayer.state).assertEqual('playing');
        }, failureCallback).catch(catchCallback);
        let endTime = videoPlayer.currentTime;
        expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);

        startTime = videoPlayer.currentTime;
        await videoPlayer.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_0_75_X).then((speedMode) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_0_75_X);
            sleep(1000);
            checkSpeedTime(videoPlayer, media.PlaybackSpeed.SPEED_FORWARD_0_75_X, startTime);
            console.info('case setSpeed called and speedMode is ' + speedMode);
        }, failureCallback).catch(catchCallback);

        startTime = videoPlayer.currentTime;
        await videoPlayer.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_00_X).then((speedMode) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_1_00_X);
            sleep(1000);
            checkSpeedTime(videoPlayer, media.PlaybackSpeed.SPEED_FORWARD_1_00_X, startTime);
            console.info('case setSpeed called and speedMode is ' + speedMode);
        }, failureCallback).catch(catchCallback);

        startTime = videoPlayer.currentTime;
        await videoPlayer.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_25_X).then((speedMode) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_1_25_X);
            sleep(1000);
            checkSpeedTime(videoPlayer, media.PlaybackSpeed.SPEED_FORWARD_1_25_X, startTime);
            console.info('case setSpeed called and speedMode is ' + speedMode);
        }, failureCallback).catch(catchCallback);

        startTime = videoPlayer.currentTime;
        await videoPlayer.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_75_X).then((speedMode) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_1_75_X);
            sleep(1000);
            checkSpeedTime(videoPlayer, media.PlaybackSpeed.SPEED_FORWARD_1_75_X, startTime);
            console.info('case setSpeed called and speedMode is ' + speedMode);
        }, failureCallback).catch(catchCallback);

        startTime = videoPlayer.currentTime;
        await videoPlayer.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_2_00_X).then((speedMode) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_2_00_X);
            sleep(1000);
            checkSpeedTime(videoPlayer, media.PlaybackSpeed.SPEED_FORWARD_2_00_X, startTime);
            console.info('case setSpeed called and speedMode is ' + speedMode);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done();            
    }) 

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_SeekMode
        * @tc.name      : 001.seek mode SEEK_PREV_SYNC/SEEK_NEXT_SYNC (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_SeekMode', 0, async function (done) {
        isFileOpen(fileDescriptor, done);
        let videoPlayer = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        videoPlayer.url = fdHead + fileDescriptor.fd;
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

        let startTime = videoPlayer.currentTime;
        await videoPlayer.play().then(() => {
            console.info('case play called!!');
            sleep(PLAY_TIME);
            expect(videoPlayer.state).assertEqual('playing');
        }, failureCallback).catch(catchCallback);
        let endTime = videoPlayer.currentTime;
        expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);

        await videoPlayer.seek(SEEK_TIME, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(seekDoneTime).assertClose(NEXT_FRAME_TIME, DELTA_SEEK_TIME);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.seek(SEEK_TIME, media.SeekMode.SEEK_PREV_SYNC).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(seekDoneTime).assertClose(PREV_FRAME_TIME, DELTA_SEEK_TIME);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.seek(PREV_FRAME_TIME - 100, media.SeekMode.SEEK_PREV_SYNC).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(seekDoneTime + DELTA_SEEK_TIME).assertClose(DELTA_SEEK_TIME, DELTA_SEEK_TIME);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.seek(PREV_FRAME_TIME + 100, media.SeekMode.SEEK_PREV_SYNC).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(seekDoneTime).assertClose(PREV_FRAME_TIME, DELTA_SEEK_TIME);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.seek(NEXT_FRAME_TIME - 100, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(seekDoneTime).assertClose(NEXT_FRAME_TIME, DELTA_SEEK_TIME);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.seek(NEXT_FRAME_TIME + 100, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(seekDoneTime).assertClose(NEXT_FRAME_TIME + 100, DELTA_SEEK_TIME);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done(); 
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_Callback
        * @tc.name      : 001.test callback bufferingUpdate/videoSizeChanged/startRenderFrame/playbackCompleted
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_Callback', 0, async function (done) {
        isFileOpen(fileDescriptor, done);
        let videoPlayer = null;
        let frameCount = -1;
        let completedCount = 0;
        let widthValue = -1;
        let heightValue = -1;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        videoPlayer.on('playbackCompleted', async () => {
            console.info('case playbackCompleted success');
            completedCount++;
            await videoPlayer.release().then(() => {
                console.info('case release called!!');
            }, failureCallback).catch(catchCallback);
            expect(widthValue).assertEqual(WIDTH_VALUE);
            expect(heightValue).assertEqual(HEIGHT_VALUE);
            //expect(frameCount).assertEqual(1);
            expect(completedCount).assertEqual(1);
            done();
        });

        videoPlayer.on('bufferingUpdate', (infoType, value) => {
            console.info('case bufferingUpdate success infoType is ' + infoType);
            console.info('case bufferingUpdate success value is ' + value);
        });

        videoPlayer.on('startRenderFrame', () => {
            console.info('case startRenderFrame success');
            //frameCount++;
        });

        videoPlayer.on('videoSizeChanged', (width, height) => {
            console.info('case videoSizeChanged success');
            widthValue = width;
            heightValue = height;
        });

        videoPlayer.url = fdHead + fileDescriptor.fd;
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
            console.info('case play called!!');
            sleep(PLAY_TIME);
            expect(videoPlayer.state).assertEqual('playing');
        }, failureCallback).catch(catchCallback);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_GetTreckDescription
        * @tc.name      : 001.getTrackDescription (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_GetTreckDescription', 0, async function (done) {
        isFileOpen(fileDescriptor, done);
        let videoPlayer = null;
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

        videoPlayer.url = fdHead + fileDescriptor.fd;
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

        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done();            
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_Loop
        * @tc.name      : 001.Loop true (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_Loop', 0, async function (done) {
        isFileOpen(fileDescriptor, done);
        let videoPlayer = null;
        let bufferCount = 0;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        videoPlayer.on('playbackCompleted', async () => {
            console.info('case playbackCompleted success');
            await videoPlayer.release().then(() => {
                console.info('case release called!!');
            }, failureCallback).catch(catchCallback);
            expect(bufferCount).assertEqual(19);
            done();   
        });

        videoPlayer.on('bufferingUpdate', (infoType, value) => {
            console.info('case bufferingUpdate success infoType is ' + infoType);
            console.info('case bufferingUpdate success value is ' + value);
            bufferCount++;
            console.info('case bufferingUpdate bufferCount value is ' + bufferCount);
        });

        videoPlayer.url = fdHead + fileDescriptor.fd;
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

        let startTime = videoPlayer.currentTime;
        await videoPlayer.play().then(() => {
            expect(videoPlayer.loop).assertEqual(true);
            console.info('case play called!!');
            sleep(PLAY_TIME);
            expect(videoPlayer.state).assertEqual('playing');
        }, failureCallback).catch(catchCallback);
        let endTime = videoPlayer.currentTime;
        expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);

        for (let i = 0; i < 4; i++) {
            await videoPlayer.seek(DURATION_TIME, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
                expect(videoPlayer.state).assertEqual('playing');
                expect(seekDoneTime).assertClose(DURATION_TIME, DELTA_SEEK_TIME);
                console.info('case seek called and seekDoneTime is' + seekDoneTime);
            }, failureCallback).catch(catchCallback);
            sleep(3000);
            expect(videoPlayer.state).assertEqual('playing');
        }
        videoPlayer.loop = false; 
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_BASE
        * @tc.name      : 001.test video playe (promise)
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_BASE', 0, async function (done) {
        isFileOpen(fileDescriptor, done);
        let videoPlayer = null;
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

        videoPlayer.on('playbackCompleted', async () => {
            console.info('case playbackCompleted success');
            await videoPlayer.release().then(() => {
                console.info('case release called!!');
            }, failureCallback).catch(catchCallback);
            done();   
        });

        videoPlayer.url = fdHead + fileDescriptor.fd;
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

        let startTime = videoPlayer.currentTime;
        await videoPlayer.play().then(() => {
            console.info('case play called!!');
            sleep(PLAY_TIME);
            expect(videoPlayer.state).assertEqual('playing');
        }, failureCallback).catch(catchCallback);
        let endTime = videoPlayer.currentTime;
        expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);

        await videoPlayer.pause().then(() => {
            expect(videoPlayer.state).assertEqual('paused');
            console.info('case pause called!!');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            console.info('case play called!!');
            sleep(PLAY_TIME);
            expect(videoPlayer.state).assertEqual('playing');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.stop().then(() => {
            console.info('case stop called!!');
            expect(videoPlayer.state).assertEqual('stopped');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.reset().then(() => {
            console.info('case reset called!!');
            expect(videoPlayer.state).assertEqual('idle');
        }, failureCallback).catch(catchCallback);

        videoPlayer.url = fdHead + fileDescriptor.fd;
        await videoPlayer.prepare().then(() => {
            console.info('case prepare called!!');
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        }, failureCallback).catch(catchCallback);
        videoPlayer.loop = true;
        startTime = videoPlayer.currentTime;
        await videoPlayer.play().then(() => {
            console.info('case play called!!');
            sleep(PLAY_TIME);
            expect(videoPlayer.state).assertEqual('playing');
        }, failureCallback).catch(catchCallback);
        endTime = videoPlayer.currentTime;
        expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);

        await videoPlayer.seek(videoPlayer.duration / 2).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            sleep(PLAY_TIME);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.seek(0).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            sleep(PLAY_TIME);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.seek(videoPlayer.duration).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            sleep(PLAY_TIME);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, failureCallback).catch(catchCallback);
        videoPlayer.loop = false;
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_MULTIPLE
        * @tc.name      : 001.Multi-instance (2 videoPlayer promise) 
        * @tc.desc      : Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FUNCTION_PROMISE_MULTIPLE', 0, async function (done) {
        isFileOpen(fileDescriptor, done);
        let testVideoPlayer1 = null;
        let testVideoPlayer2 = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                console.info('case createVideoPlayer success');
                testVideoPlayer1 = video;
                expect(testVideoPlayer1.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);
        testVideoPlayer1.url = fdHead + fileDescriptor.fd;
        await testVideoPlayer1.setDisplaySurface(surfaceID).then(() => {
            console.info('case setDisplaySurface success');
            expect(testVideoPlayer1.state).assertEqual('idle');
        }, failureCallback).catch(catchCallback);

        await toNewPage(page);
        page = (page + 1) % 2;
        await msleep(1000).then(() => {}, failureCallback).catch(catchCallback);
        surfaceID = globalThis.value;

        for (let i = 0; i < 3; i++) {
            await media.createVideoPlayer().then((video) => {
                if (typeof (video) != 'undefined') {
                    console.info('case createVideoPlayer success');
                    testVideoPlayer2 = video;
                    expect(testVideoPlayer2.state).assertEqual('idle');
                } else {
                    console.info('case createVideoPlayer is failed');
                    expect().assertFail();
                }
            }, failureCallback).catch(catchCallback);
            testVideoPlayer2.url = fdHead + fileDescriptor.fd;
            await testVideoPlayer2.setDisplaySurface(surfaceID).then(() => {
                console.info('case setDisplaySurface success');
                expect(testVideoPlayer2.state).assertEqual('idle');
            }, failureCallback).catch(catchCallback);

            await testVideoPlayer1.prepare().then(() => {
                console.info('case prepare called!!');
                expect(testVideoPlayer1.state).assertEqual('prepared');
            }, failureCallback).catch(catchCallback);

            await testVideoPlayer1.play().then(() => {
                console.info('case play called!!');
                expect(testVideoPlayer1.state).assertEqual('playing');
            }, failureCallback).catch(catchCallback);

            await testVideoPlayer2.prepare().then(() => {
                console.info('case prepare called!!');
                expect(testVideoPlayer2.state).assertEqual('prepared');
            }, failureCallback).catch(catchCallback);

            await testVideoPlayer2.play().then(() => {
                console.info('case play called!!');
                expect(testVideoPlayer2.state).assertEqual('playing');
            }, failureCallback).catch(catchCallback);

            sleep(PLAY_TIME);
            await testVideoPlayer1.reset().then(() => {
                console.info('case reset called!!');
                expect(testVideoPlayer1.state).assertEqual('idle');
            }, failureCallback).catch(catchCallback);
            testVideoPlayer1.url = fdHead + fileDescriptor.fd;

            await testVideoPlayer2.release().then(() => {
                console.info('case release called!!');
            }, failureCallback).catch(catchCallback);
        }
        await testVideoPlayer1.release().then(() => {
            console.info('case release called!!');
        }, failureCallback).catch(catchCallback);
        done();
    })
})
