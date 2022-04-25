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


describe('VideoPlayerFormatCompatibilityTest', function () {
    const PLAY_TIME = 2000;
    const SEEK_TIME = 3000;
    const DELTA_TIME = 1000;
    let surfaceID = '';

    let fileDescriptor = undefined;
    let page = 0;
    let fdHead = 'fd://';

    beforeAll(function() {
        console.info('beforeAll case');
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
        sleep(5000);
        console.info('afterEach case');
    })

    afterAll(function() {
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
        console.error(`case error called, errMessage is ${error.message}`);
    }

    function catchCallback(error) {
        expect().assertFail();
        console.error(`case error called, errMessage is ${error.message}`);
    }

    function printfDescription(obj) {
        for(let i in obj) { 
            let property = obj[i];
            console.info(`case key is ${i}, value is ${property}`);
        } 
    }

    async function playVideoSource(VIDEO_SOURCE, done) {
        console.info(`case media source VIDEO_SOURCE: ${VIDEO_SOURCE}`)

        await getFileDescriptor(VIDEO_SOURCE).then((res) => {
            fileDescriptor = res;
        });
        isFileOpen(fileDescriptor, done);

        let videoPlayer = null;
        surfaceID = globalThis.value;
        await media.createVideoPlayer().then((video) => {
            if (typeof (video) != 'undefined') {
                console.info('case createVideoPlayer success');
                videoPlayer = video;
            } else {
                console.error('case createVideoPlayer failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        videoPlayer.on('error', (err) => {
            console.error(`case error called, errMessage is ${err.message}`);
            expect().assertFail();
        });
        videoPlayer.url = fdHead + fileDescriptor.fd;
        await videoPlayer.setDisplaySurface(surfaceID).then(() => {
            console.info('case setDisplaySurface success');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.prepare().then(() => {
            console.info('case prepare called');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.getTrackDescription().then((arrayList) => {
            console.info('case getTrackDescription called');
            if (typeof (arrayList) != 'undefined') {
                for (let i = 0; i < arrayList.length; i++) {
                    printfDescription(arrayList[i]);
                }
            } else {
                console.error('case getTrackDescription failed');
                expect().assertFail();
            }
        }, failureCallback).catch(catchCallback);

        let startTime = videoPlayer.currentTime;
        await videoPlayer.play().then(() => {
            console.info('case play called');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);
        let endTime = videoPlayer.currentTime;
        expect(endTime - startTime).assertClose(PLAY_TIME, DELTA_TIME);

        await videoPlayer.seek(SEEK_TIME).then((seekDoneTime) => {
            console.info('case seek called and seekDoneTime is ' + seekDoneTime);
            sleep(DELTA_TIME);
        }, failureCallback).catch(catchCallback);
        
        await videoPlayer.pause().then(() => {
            console.info('case pause called');
            sleep(DELTA_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.play().then(() => {
            console.info('case play called');
            sleep(PLAY_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_2_00_X).then((speedMode) => {
            console.info('case setSpeed called and speedMode is ' + speedMode);
            sleep(DELTA_TIME);
        }, failureCallback).catch(catchCallback);

        await videoPlayer.setVolume(1).then(() => {
            console.info('case setVolume called');
        }, failureCallback).catch(catchCallback);  

        await videoPlayer.stop().then(() => {
            console.info('case stop called');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.reset().then(() => {
            console.info('case reset called');
        }, failureCallback).catch(catchCallback);

        await videoPlayer.release().then(() => {
            console.info('case release called');
        }, failureCallback).catch(catchCallback);

        await closeFileDescriptor(VIDEO_SOURCE);
    }

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_0900
        * @tc.name      : play h264_none_audio.mp4
        * @tc.desc      : h264_none_audio.mp4 test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_0900', 0, async function (done) {
        let VIDEO_SOURCE = 'h264_none_audio.mp4';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_1100
        * @tc.name      : play mpeg2_none_audio.mp4
        * @tc.desc      : mpeg2_none_audio.mp4 test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_1100', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg2_none_audio.mp4';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_1200
        * @tc.name      : play mpeg4_none_audio.mp4
        * @tc.desc      : mpeg4_none_audio.mp4 test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_1200', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg4_none_audio.mp4';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_1300
        * @tc.name      : play none_video_aac.mp4
        * @tc.desc      : none_video_aac.mp4 test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_1300', 0, async function (done) {
        let VIDEO_SOURCE = 'none_video_aac.mp4';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_1400
        * @tc.name      : play none_video_mp3.mp4
        * @tc.desc      : none_video_mp3.mp4 test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_1400', 0, async function (done) {
        let VIDEO_SOURCE = 'none_video_mp3.mp4';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_1600
        * @tc.name      : play h264_aac_720p_30r.mp4
        * @tc.desc      : h264_aac_720p_30r.mp4 test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_1600', 0, async function (done) {
        let VIDEO_SOURCE = 'h264_aac_720p_30r.mp4';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_1700
        * @tc.name      : play h264_mp3_480p_25r.mp4
        * @tc.desc      : h264_mp3_480p_25r.mp4 test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_1700', 0, async function (done) {
        let VIDEO_SOURCE = 'h264_mp3_480p_25r.mp4';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_1800
        * @tc.name      : play h264_mp3_270p_10r.mp4
        * @tc.desc      : h264_mp3_270p_10r.mp4 test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_1800', 0, async function (done) {
        let VIDEO_SOURCE = 'h264_mp3_270p_10r.mp4';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_2500
        * @tc.name      : play h264_aac_320x240_30r.mp4
        * @tc.desc      : h264_aac_320x240_30r.mp4 test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_2500', 0, async function (done) {
        let VIDEO_SOURCE = 'h264_aac_320x240_30r.mp4';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_3000
        * @tc.name      : play h264_mp3_480x320_30r.mp4
        * @tc.desc      : h264_mp3_480x320_30r.mp4 test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_3000', 0, async function (done) {
        let VIDEO_SOURCE = 'h264_mp3_480x320_30r.mp4';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_3700
        * @tc.name      : play h264_aac_640x480_30r.mp4
        * @tc.desc      : h264_aac_640x480_30r.mp4 test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_3700', 0, async function (done) {
        let VIDEO_SOURCE = 'h264_aac_640x480_30r.mp4';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_3800
        * @tc.name      : play h264_mp3_640x480_25r.mp4
        * @tc.desc      : h264_mp3_640x480_25r.mp4 test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_3800', 0, async function (done) {
        let VIDEO_SOURCE = 'h264_mp3_640x480_25r.mp4';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_7800
        * @tc.name      : h264_none_audio_640x480_30r.mp4
        * @tc.desc      : h264_none_audio_640x480_30r.mp4 test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_7800', 0, async function (done) {
        let VIDEO_SOURCE = 'h264_none_audio_640x480_30r.mp4';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_7900
        * @tc.name      : mpeg2_none_audio_640x480_30r.mp4
        * @tc.desc      : mpeg2_none_audio_640x480_30r.mp4 test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_7900', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg2_none_audio_640x480_30r.mp4';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_8000
        * @tc.name      : mpeg4_none_audio_640x480_30r.mp4
        * @tc.desc      : mpeg4_none_audio_640x480_30r.mp4 test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MP4_8000', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg4_none_audio_640x480_30r.mp4';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_0900
        * @tc.name      : play h264_none_audio.ts
        * @tc.desc      : h264_none_audio.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_0900', 0, async function (done) {
        let VIDEO_SOURCE = 'h264_none_audio.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_1100
        * @tc.name      : play mpeg2_none_audio.ts
        * @tc.desc      : mpeg2_none_audio.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_1100', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg2_none_audio.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_1200
        * @tc.name      : play mpeg4_none_audio.ts
        * @tc.desc      : mpeg4_none_audio.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_1200', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg4_none_audio.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_1300
        * @tc.name      : play none_video_aac.ts
        * @tc.desc      : none_video_aac.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_1300', 0, async function (done) {
        let VIDEO_SOURCE = 'none_video_aac.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_1400
        * @tc.name      : play none_video_mp3.ts
        * @tc.desc      : none_video_mp3.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_1400', 0, async function (done) {
        let VIDEO_SOURCE = 'none_video_mp3.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_1600
        * @tc.name      : play h264_aac_720p_30r.ts
        * @tc.desc      : h264_aac_720p_30r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_1600', 0, async function (done) {
        let VIDEO_SOURCE = 'h264_aac_720p_30r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_1700
        * @tc.name      : play h264_aac_480p_25r.ts
        * @tc.desc      : h264_aac_480p_25r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_1700', 0, async function (done) {
        let VIDEO_SOURCE = 'h264_aac_480p_25r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_1800
        * @tc.name      : play h264_aac_270p_10r.ts
        * @tc.desc      : h264_aac_270p_10r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_1800', 0, async function (done) {
        let VIDEO_SOURCE = 'h264_aac_270p_10r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_2000
        * @tc.name      : play h264_mp3_720p_30r.ts
        * @tc.desc      : h264_mp3_720p_30r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_2000', 0, async function (done) {
        let VIDEO_SOURCE = 'h264_mp3_720p_30r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_2100
        * @tc.name      : play h264_mp3_480p_25r.ts
        * @tc.desc      : h264_mp3_480p_25r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_2100', 0, async function (done) {
        let VIDEO_SOURCE = 'h264_mp3_480p_25r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_2200
        * @tc.name      : play h264_mp3_270p_10r.ts
        * @tc.desc      : h264_mp3_270p_10r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_2200', 0, async function (done) {
        let VIDEO_SOURCE = 'h264_mp3_270p_10r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_2400
        * @tc.name      : play mpeg2_aac_720p_30r.ts
        * @tc.desc      : mpeg2_aac_720p_30r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_2400', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg2_aac_720p_30r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_2500
        * @tc.name      : play mpeg2_aac_480p_25r.ts
        * @tc.desc      : mpeg2_aac_480p_25r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_2500', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg2_aac_480p_25r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_2600
        * @tc.name      : play mpeg2_aac_270p_10r.ts
        * @tc.desc      : mpeg2_aac_270p_10r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_2600', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg2_aac_270p_10r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_2800
        * @tc.name      : play mpeg2_mp3_720p_30r.ts
        * @tc.desc      : mpeg2_mp3_720p_30r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_2800', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg2_mp3_720p_30r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_2900
        * @tc.name      : play mpeg2_mp3_480p_25r.ts
        * @tc.desc      : mpeg2_mp3_480p_25r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_2900', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg2_mp3_480p_25r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_3000
        * @tc.name      : play mpeg2_mp3_270p_10r.ts
        * @tc.desc      : mpeg2_mp3_270p_10r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_3000', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg2_mp3_270p_10r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_3200
        * @tc.name      : play mpeg4_aac_720p_30r.ts
        * @tc.desc      : mpeg4_aac_720p_30r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_3200', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg4_aac_720p_30r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_3300
        * @tc.name      : play mpeg4_aac_480p_25r.ts
        * @tc.desc      : mpeg4_aac_480p_25r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_3300', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg4_aac_480p_25r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_3400
        * @tc.name      : play mpeg4_aac_270p_10r.ts
        * @tc.desc      : mpeg4_aac_270p_10r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_3400', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg4_aac_270p_10r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_3600
        * @tc.name      : play mpeg4_mp3_720p_30r.ts
        * @tc.desc      : mpeg4_mp3_720p_30r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_3600', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg4_mp3_720p_30r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_3700
        * @tc.name      : play mpeg4_mp3_480p_25r.ts
        * @tc.desc      : mpeg4_mp3_480p_25r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_3700', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg4_mp3_480p_25r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_3800
        * @tc.name      : play mpeg4_mp3_270p_10r.ts
        * @tc.desc      : mpeg4_mp3_270p_10r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_3800', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg4_mp3_270p_10r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_3900
        * @tc.name      : play h264_none_audio_640x480_30r.ts
        * @tc.desc      : h264_none_audio_640x480_30r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_3900', 0, async function (done) {
        let VIDEO_SOURCE = 'h264_none_audio_640x480_30r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

     /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_4000
        * @tc.name      : play mpeg2_none_audio_640x480_30r.ts
        * @tc.desc      : mpeg2_none_audio_640x480_30r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_4000', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg2_none_audio_640x480_30r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

     /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_4100
        * @tc.name      : play mpeg4_none_audio_640x480_30r.ts
        * @tc.desc      : mpeg4_none_audio_640x480_30r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_4100', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg4_none_audio_640x480_30r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

     /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_4200
        * @tc.name      : play h264_aac_640x480_30r.ts
        * @tc.desc      : h264_aac_640x480_30r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_4200', 0, async function (done) {
        let VIDEO_SOURCE = 'h264_aac_640x480_30r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

     /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_4300
        * @tc.name      : play h264_mp3_640x480_25r.ts
        * @tc.desc      : h264_mp3_640x480_25r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
   it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_4300', 0, async function (done) {
       let VIDEO_SOURCE = 'h264_mp3_640x480_25r.ts';
       await playVideoSource(VIDEO_SOURCE, done);
       done();
   })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_4400
        * @tc.name      : play mpeg2_aac_640x480_30r.ts
        * @tc.desc      : mpeg2_aac_640x480_30r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_4400', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg2_aac_640x480_30r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_4500
        * @tc.name      : play mpeg2_mp3_640x480_25r.ts
        * @tc.desc      : mpeg2_mp3_640x480_25r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_4500', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg2_mp3_640x480_25r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_4600
        * @tc.name      : play mpeg4_aac_640x480_30r.ts
        * @tc.desc      : mpeg4_aac_640x480_30r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_4600', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg4_aac_640x480_30r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_4700
        * @tc.name      : play mpeg4_mp3_640x480_25r.ts
        * @tc.desc      : mpeg4_mp3_640x480_25r.ts test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_TS_4700', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg4_mp3_640x480_25r.ts';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_WEBM_0200
        * @tc.name      : play vp8_none_audio.webm
        * @tc.desc      : vp8_none_audio.webm test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_WEBM_0200', 0, async function (done) {
        let VIDEO_SOURCE = 'vp8_none_audio.webm';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_WEBM_0300
        * @tc.name      : play none_video_vorbis.webm
        * @tc.desc      : none_video_vorbis.webm test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_WEBM_0300', 0, async function (done) {
        let VIDEO_SOURCE = 'none_video_vorbis.webm';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_WEBM_0500
        * @tc.name      : play vp8_vorbis_720p_30r.webm
        * @tc.desc      : vp8_vorbis_720p_30r.webm test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_WEBM_0500', 0, async function (done) {
        let VIDEO_SOURCE = 'vp8_vorbis_720p_30r.webm';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_WEBM_0600
        * @tc.name      : play vp8_vorbis_480p_25r.webm
        * @tc.desc      : vp8_vorbis_480p_25r.webm test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_WEBM_0600', 0, async function (done) {
        let VIDEO_SOURCE = 'vp8_vorbis_480p_25r.webm';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_WEBM_0700
        * @tc.name      : play vp8_vorbis_270p_10r.webm
        * @tc.desc      : vp8_vorbis_270p_10r.webm test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_WEBM_0700', 0, async function (done) {
        let VIDEO_SOURCE = 'vp8_vorbis_270p_10r.webm';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

        /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_WEBM_0800
        * @tc.name      : play vp8_none_audio_640x480_30r.webm
        * @tc.desc      : vp8_none_audio_640x480_30r.webm test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_WEBM_0800', 0, async function (done) {
        let VIDEO_SOURCE = 'vp8_none_audio_640x480_30r.webm';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_WEBM_0900
        * @tc.name      : play vp8_vorbis_640x480_25r.webm
        * @tc.desc      : vp8_vorbis_640x480_25r.webm test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_WEBM_0900', 0, async function (done) {
        let VIDEO_SOURCE = 'vp8_vorbis_640x480_25r.webm';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_0900
        * @tc.name      : play h264_none_audio.mkv
        * @tc.desc      : h264_none_audio.mkv test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_0900', 0, async function (done) {
        let VIDEO_SOURCE = 'h264_none_audio.mkv';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_1100
        * @tc.name      : play mpeg2_none_audio.mkv
        * @tc.desc      : mpeg2_none_audio.mkv test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_1100', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg2_none_audio.mkv';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_1200
        * @tc.name      : play mpeg4_none_audio.mkv
        * @tc.desc      : mpeg4_none_audio.mkv test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_1200', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg4_none_audio.mkv';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_1300
        * @tc.name      : play none_video_aac.mkv
        * @tc.desc      : none_video_aac.mkv test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_1300', 0, async function (done) {
        let VIDEO_SOURCE = 'none_video_aac.mkv';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_1400
        * @tc.name      : play none_video_mp3.mkv
        * @tc.desc      : none_video_mp3.mkv test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_1400', 0, async function (done) {
        let VIDEO_SOURCE = 'none_video_mp3.mkv';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_2000
        * @tc.name      : play mpeg4_aac_720p_30r.mkv
        * @tc.desc      : mpeg4_aac_720p_30r.mkv test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_2000', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg4_aac_720p_30r.mkv';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_2100
        * @tc.name      : play mpeg4_aac_480p_25r.mkv
        * @tc.desc      : mpeg4_aac_480p_25r.mkv test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_2100', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg4_aac_480p_25r.mkv';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_2200
        * @tc.name      : play mpeg4_aac_270p_10r.mkv
        * @tc.desc      : mpeg4_aac_270p_10r.mkv test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_2200', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg4_aac_270p_10r.mkv';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

        /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_2300
        * @tc.name      : play h264_none_audio_640x480_30r.mkv
        * @tc.desc      : h264_none_audio_640x480_30r.mkv test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_2300', 0, async function (done) {
        let VIDEO_SOURCE = 'h264_none_audio_640x480_30r.mkv';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

        /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_2400
        * @tc.name      : play h263_none_audio_640x480_30r.mkv
        * @tc.desc      : h263_none_audio_640x480_30r.mkv test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_2400', 0, async function (done) {
        let VIDEO_SOURCE = 'h263_none_audio_640x480_30r.mkv';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

        /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_2500
        * @tc.name      : play mpeg2_none_audio_640x480_30r.mkv
        * @tc.desc      : mpeg2_none_audio_640x480_30r.mkv test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_2500', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg2_none_audio_640x480_30r.mkv';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_2600
        * @tc.name      : play mpeg4_none_audio_640x480_30r.mkv
        * @tc.desc      : mpeg4_none_audio_640x480_30r.mkv test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_2600', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg4_none_audio_640x480_30r.mkv';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

        /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_2700
        * @tc.name      : play h263_aac_640x480_30r.mkv
        * @tc.desc      : h263_aac_640x480_30r.mkv test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_2700', 0, async function (done) {
        let VIDEO_SOURCE = 'h263_aac_640x480_30r.mkv';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_3100
        * @tc.name      : play mpeg4_aac_640x480_30r.mkv
        * @tc.desc      : mpeg4_aac_640x480_30r.mkv test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_3100', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg4_aac_640x480_30r.mkv';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_3200
        * @tc.name      : play mpeg4_aac_270p_25r.mkv
        * @tc.desc      : mpeg4_aac_270p_25r.mkv test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_VIDEO_PLAYER_FORMAT_MKV_3200', 0, async function (done) {
        let VIDEO_SOURCE = 'mpeg4_aac_270p_25r.mkv';
        await playVideoSource(VIDEO_SOURCE, done);
        done();
    })

})

