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
import * as mediaTestBase from '../../../../../MediaTestBase.js';
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
        await mediaTestBase.getFileDescriptor(VIDEO_SOURCE).then((res) => {
            fileDescriptor = res;
        });
    })

    beforeEach(async function() {
        await toNewPage(page);
        page = (page + 1) % 2;
        await mediaTestBase.msleepAsync(1000).then(
            () => {}, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        surfaceID = globalThis.value;
        console.info('case new surfaceID is ' + surfaceID);
        console.info('beforeEach case');
    })

    afterEach(async function() {
        await clearRouter();
        console.info('afterEach case');
    })

    afterAll(async function() {
        await mediaTestBase.closeFileDescriptor(VIDEO_SOURCE);
        console.info('afterAll case');
    })

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
        mediaTestBase.isFileOpen(fileDescriptor, done);
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
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        videoPlayer.on('error', async (error) => {
            console.info(`case error called,errMessage is ${error.message}`);
            await videoPlayer.release().then(() => {
                console.info('case release called!!');
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
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
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let videoPlayer = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        videoPlayer.url = fdHead + fileDescriptor.fd;
        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        let startTime = videoPlayer.currentTime;
        await videoPlayer.play().then(() => {
            console.info('case play called!!');
            mediaTestBase.msleep(PLAY_TIME);
            expect(videoPlayer.state).assertEqual('playing');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        let endTime = videoPlayer.currentTime;
        expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);
        
        for (let i = 0; i < 3; i++) {
            await videoPlayer.setVolume(i * 0.5).then(() => {
                expect(videoPlayer.state).assertEqual('playing');
                console.info('case setVolume called');
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);   
        }

        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
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
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let videoPlayer = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        videoPlayer.url = fdHead + fileDescriptor.fd;
        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        let startTime = videoPlayer.currentTime;
        await videoPlayer.play().then(() => {
            console.info('case play called!!');
            mediaTestBase.msleep(1000);
            expect(videoPlayer.state).assertEqual('playing');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        let endTime = videoPlayer.currentTime;
        expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);

        startTime = videoPlayer.currentTime;
        await videoPlayer.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_0_75_X).then((speedMode) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_0_75_X);
            mediaTestBase.msleep(1000);
            checkSpeedTime(videoPlayer, media.PlaybackSpeed.SPEED_FORWARD_0_75_X, startTime);
            console.info('case setSpeed called and speedMode is ' + speedMode);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        startTime = videoPlayer.currentTime;
        await videoPlayer.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_00_X).then((speedMode) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_1_00_X);
            mediaTestBase.msleep(1000);
            checkSpeedTime(videoPlayer, media.PlaybackSpeed.SPEED_FORWARD_1_00_X, startTime);
            console.info('case setSpeed called and speedMode is ' + speedMode);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        startTime = videoPlayer.currentTime;
        await videoPlayer.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_25_X).then((speedMode) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_1_25_X);
            mediaTestBase.msleep(1000);
            checkSpeedTime(videoPlayer, media.PlaybackSpeed.SPEED_FORWARD_1_25_X, startTime);
            console.info('case setSpeed called and speedMode is ' + speedMode);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        startTime = videoPlayer.currentTime;
        await videoPlayer.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_75_X).then((speedMode) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_1_75_X);
            mediaTestBase.msleep(1000);
            checkSpeedTime(videoPlayer, media.PlaybackSpeed.SPEED_FORWARD_1_75_X, startTime);
            console.info('case setSpeed called and speedMode is ' + speedMode);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        startTime = videoPlayer.currentTime;
        await videoPlayer.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_2_00_X).then((speedMode) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(speedMode).assertEqual(media.PlaybackSpeed.SPEED_FORWARD_2_00_X);
            mediaTestBase.msleep(1000);
            checkSpeedTime(videoPlayer, media.PlaybackSpeed.SPEED_FORWARD_2_00_X, startTime);
            console.info('case setSpeed called and speedMode is ' + speedMode);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
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
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let videoPlayer = null;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        videoPlayer.url = fdHead + fileDescriptor.fd;
        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        let startTime = videoPlayer.currentTime;
        await videoPlayer.play().then(() => {
            console.info('case play called!!');
            mediaTestBase.msleep(PLAY_TIME);
            expect(videoPlayer.state).assertEqual('playing');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        let endTime = videoPlayer.currentTime;
        expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);

        await videoPlayer.seek(SEEK_TIME, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(seekDoneTime).assertClose(NEXT_FRAME_TIME, DELTA_SEEK_TIME);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoPlayer.seek(SEEK_TIME, media.SeekMode.SEEK_PREV_SYNC).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(seekDoneTime).assertClose(PREV_FRAME_TIME, DELTA_SEEK_TIME);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoPlayer.seek(PREV_FRAME_TIME - 100, media.SeekMode.SEEK_PREV_SYNC).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(seekDoneTime + DELTA_SEEK_TIME).assertClose(DELTA_SEEK_TIME, DELTA_SEEK_TIME);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoPlayer.seek(PREV_FRAME_TIME + 100, media.SeekMode.SEEK_PREV_SYNC).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(seekDoneTime).assertClose(PREV_FRAME_TIME, DELTA_SEEK_TIME);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoPlayer.seek(NEXT_FRAME_TIME - 100, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(seekDoneTime).assertClose(NEXT_FRAME_TIME, DELTA_SEEK_TIME);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoPlayer.seek(NEXT_FRAME_TIME + 100, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            expect(seekDoneTime).assertClose(NEXT_FRAME_TIME + 100, DELTA_SEEK_TIME);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
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
        mediaTestBase.isFileOpen(fileDescriptor, done);
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
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        videoPlayer.on('playbackCompleted', async () => {
            console.info('case playbackCompleted success');
            completedCount++;
            await videoPlayer.release().then(() => {
                console.info('case release called!!');
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
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
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoPlayer.play().then(() => {
            console.info('case play called!!');
            mediaTestBase.msleep(PLAY_TIME);
            expect(videoPlayer.state).assertEqual('playing');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
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
        mediaTestBase.isFileOpen(fileDescriptor, done);
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
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        videoPlayer.url = fdHead + fileDescriptor.fd;
        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoPlayer.prepare().then(() => {
            expect(videoPlayer.state).assertEqual('prepared');
            console.info('case prepare called!!');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoPlayer.getTrackDescription().then((arrayList) => {
            console.info('case getTrackDescription called!!');
            if (typeof (arrayList) != 'undefined') {
                arrayDescription = arrayList;
            } else {
                console.info('case getTrackDescription is failed');
                expect().assertFail();
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        for (let i = 0; i < arrayDescription.length; i++) {
            mediaTestBase.printDescription(arrayDescription[i]);
        }

        await videoPlayer.release().then(() => {
            console.info('case release called!!');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
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
        mediaTestBase.isFileOpen(fileDescriptor, done);
        let videoPlayer = null;
        let bufferCount = false;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                videoPlayer = video;
                expect(videoPlayer.state).assertEqual('idle');
            } else {
                console.info('case createVideoPlayer is failed');
                expect().assertFail();
            }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        videoPlayer.on('playbackCompleted', async () => {
            console.info('case playbackCompleted success');
            await videoPlayer.play().then(() => {
                expect(videoPlayer.loop).assertEqual(false);
                console.info('case play called!!');
                mediaTestBase.msleep(PLAY_TIME);
                expect(videoPlayer.state).assertEqual('playing');
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            await videoPlayer.release().then(() => {
                console.info('case release called!!');
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            expect(bufferCount).assertEqual(true);
            done();   
        });

        videoPlayer.on('bufferingUpdate', (infoType, value) => {
            console.info('case bufferingUpdate success infoType is ' + infoType);
            console.info('case bufferingUpdate success value is ' + value);
            bufferCount = true;
            console.info('case bufferingUpdate bufferCount value is ' + bufferCount);
        });

        videoPlayer.url = fdHead + fileDescriptor.fd;
        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            expect(videoPlayer.state).assertEqual('idle');
            console.info('case setDisplaySurface success');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoPlayer.prepare().then(() => {
            videoPlayer.loop = true;
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
            console.info('case prepare called!!');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        let startTime = videoPlayer.currentTime;
        await videoPlayer.play().then(() => {
            expect(videoPlayer.loop).assertEqual(true);
            console.info('case play called!!');
            mediaTestBase.msleep(PLAY_TIME);
            expect(videoPlayer.state).assertEqual('playing');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        let endTime = videoPlayer.currentTime;
        expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);

        for (let i = 0; i < 4; i++) {
            await videoPlayer.seek(DURATION_TIME, media.SeekMode.SEEK_NEXT_SYNC).then((seekDoneTime) => {
                expect(videoPlayer.state).assertEqual('playing');
                expect(seekDoneTime).assertClose(DURATION_TIME, DELTA_SEEK_TIME);
                console.info('case seek called and seekDoneTime is' + seekDoneTime);
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            mediaTestBase.msleep(3000);
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
        mediaTestBase.isFileOpen(fileDescriptor, done);
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
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        videoPlayer.on('playbackCompleted', async () => {
            console.info('case playbackCompleted success');
            await videoPlayer.release().then(() => {
                console.info('case release called!!');
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            done();   
        });

        videoPlayer.url = fdHead + fileDescriptor.fd;
        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            console.info('case setDisplaySurface success');
            expect(videoPlayer.state).assertEqual('idle');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoPlayer.prepare().then(() => {
            console.info('case prepare called!!');
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        let startTime = videoPlayer.currentTime;
        await videoPlayer.play().then(() => {
            console.info('case play called!!');
            mediaTestBase.msleep(PLAY_TIME);
            expect(videoPlayer.state).assertEqual('playing');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        let endTime = videoPlayer.currentTime;
        expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);

        await videoPlayer.pause().then(() => {
            expect(videoPlayer.state).assertEqual('paused');
            console.info('case pause called!!');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoPlayer.play().then(() => {
            console.info('case play called!!');
            mediaTestBase.msleep(PLAY_TIME);
            expect(videoPlayer.state).assertEqual('playing');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoPlayer.stop().then(() => {
            console.info('case stop called!!');
            expect(videoPlayer.state).assertEqual('stopped');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoPlayer.reset().then(() => {
            console.info('case reset called!!');
            expect(videoPlayer.state).assertEqual('idle');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        videoPlayer.url = fdHead + fileDescriptor.fd;
        await videoPlayer.prepare().then(() => {
            console.info('case prepare called!!');
            expect(videoPlayer.state).assertEqual('prepared');
            expect(videoPlayer.duration).assertEqual(DURATION_TIME);
            expect(videoPlayer.width).assertEqual(WIDTH_VALUE);
            expect(videoPlayer.height).assertEqual(HEIGHT_VALUE);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoPlayer.loop = true;
        startTime = videoPlayer.currentTime;
        await videoPlayer.play().then(() => {
            console.info('case play called!!');
            mediaTestBase.msleep(PLAY_TIME);
            expect(videoPlayer.state).assertEqual('playing');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        endTime = videoPlayer.currentTime;
        expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);

        await videoPlayer.seek(videoPlayer.duration / 2).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            mediaTestBase.msleep(PLAY_TIME);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoPlayer.seek(0).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            mediaTestBase.msleep(PLAY_TIME);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

        await videoPlayer.seek(videoPlayer.duration).then((seekDoneTime) => {
            expect(videoPlayer.state).assertEqual('playing');
            mediaTestBase.msleep(PLAY_TIME);
            console.info('case seek called and seekDoneTime is' + seekDoneTime);
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        videoPlayer.loop = false;
    })
})
