/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import media from '@ohos.multimedia.media'
import * as mediaTestBase from '../../../../../MediaTestBase.js';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('PlayerLocalTestAudioFormat', function () {
    let audioSource = '01.mp3';
    const MAX_VOLUME = 1;
    const PLAY_TIME = 3000;
    const SEEK_TIME = 10000; // 10s
    let isToSeek = false;
    let isToDuration = false;
    let fileDescriptor = undefined;

    beforeAll(function() {
        console.info('beforeAll case');
    })

    beforeEach(function() {
        isToSeek = false;
        isToDuration = false;
        console.info('beforeEach case');
    })

    afterEach(function() {
        console.info('afterEach case');
    })

    afterAll(async function() {
        await mediaTestBase.closeFileDescriptor(audioSource);
        console.info('afterAll case');
    })

    async function playSource(audioFile, done) {
        let audioPlayer = media.createAudioPlayer();
        audioSource = audioFile;
        await mediaTestBase.getFileDescriptor(audioSource).then((res) => {
            fileDescriptor = res;
        });
        mediaTestBase.isFileOpen(fileDescriptor, done);
        audioPlayer.src = 'fd://' + fileDescriptor.fd;
        audioPlayer.on('dataLoad', () => {
            console.info('case set source success');
            expect(audioPlayer.state).assertEqual('paused');
            expect(audioPlayer.currentTime).assertEqual(0);
            audioPlayer.play();
        });
        audioPlayer.on('play', () => {
            console.info('case start to play');
            expect(audioPlayer.state).assertEqual('playing');
            mediaTestBase.msleep(PLAY_TIME);
            if (!isToSeek) {
                audioPlayer.pause();
            } else {
                audioPlayer.seek(SEEK_TIME);
            }
        });
        audioPlayer.on('pause', () => {
            console.info('case now is paused');
            expect(audioPlayer.state).assertEqual('paused');
            audioPlayer.setVolume(MAX_VOLUME);
        });
        audioPlayer.on('stop', () => {
            console.info('case stop success');
            expect(audioPlayer.state).assertEqual('stopped');
            audioPlayer.reset();
        });
        audioPlayer.on('reset', () => {
            console.info('case reset success');
            expect(audioPlayer.state).assertEqual('idle');
            audioPlayer.release();
            audioPlayer = undefined;
            done();
        });
        audioPlayer.on('timeUpdate', (seekDoneTime) => {
            if (typeof (seekDoneTime) == "undefined") {
                console.info(`case seek filed,errcode is ${seekDoneTime}`);
                audioPlayer.release();
                expect().assertFail();
                done();
                return;
            }
            console.info('case seek success, and seek time is ' + seekDoneTime);
            if (!isToDuration) {
                expect(SEEK_TIME).assertEqual(seekDoneTime);
                isToDuration = true;
                mediaTestBase.msleep(PLAY_TIME);
                audioPlayer.seek(audioPlayer.duration);
            } else {
                expect(audioPlayer.duration).assertEqual(seekDoneTime);
            }
        });
        audioPlayer.on('volumeChange', () => {
            console.info('case set volume value to ' + MAX_VOLUME);
            audioPlayer.play();
            isToSeek = true;
        });
        audioPlayer.on('finish', () => {
            console.info('case play end');
            expect(audioPlayer.state).assertEqual('stopped');
            audioPlayer.stop();
        });
        audioPlayer.on('error', (err) => {
            console.info(`case error called,errName is ${err.name}`);
            console.info(`case error called,errCode is ${err.code}`);
            console.info(`case error called,errMessage is ${err.message}`);
            audioPlayer.release();
            expect().assertFail();
            done();
        });
    }

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP3_0100
        * @tc.name      : 001.Playing mp3 streams
        * @tc.desc      : Format : MP3
                          Codec : MP3
                          Samplerate : 48000
                          Bitrate : 32
                          Channel : 1
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP3_0100', 0, async function (done) {
        playSource('01.mp3', done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP3_0200
        * @tc.name      : 002.Playing mp3 streams
        * @tc.desc      : Format : MP3
                          Codec : MP3
                          Samplerate : 48000
                          Bitrate : 16/32
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP3_0200', 0, async function (done) {
        playSource('02.mp3', done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP3_0300
        * @tc.name      : 003.Playing mp3 streams
        * @tc.desc      : Format : MP3
                          Codec : MP3
                          Samplerate : 48000
                          Bitrate : 32
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP3_0300', 0, async function (done) {
        playSource('03.mp3', done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP3_0400
        * @tc.name      : 004.Playing mp3 streams
        * @tc.desc      : Format : MP3
                          Codec : MP3
                          Samplerate : 48000
                          Bitrate : 64
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP3_0400', 0, async function (done) {
        playSource('04.mp3', done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_0100
        * @tc.name      : 001.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : AAC LC
                          Samplerate : 48000
                          Bitrate : 32
                          Channel : 1
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_0100', 0, async function (done) {
        playSource('47.mp4', done);
    })


    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_0300
        * @tc.name      : 003.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : AAC LC
                          Samplerate : 48000
                          Bitrate : 64
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_0300', 0, async function (done) {
        playSource('49.mp4', done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_0400
        * @tc.name      : 004.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : AAC LC
                          Samplerate : 48000
                          Bitrate : 32
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_0400', 0, async function (done) {
        playSource('50.mp4', done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_0500
        * @tc.name      : 005.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : AAC LC
                          Samplerate : 96000
                          Bitrate : 32
                          Channel : 1
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_0500', 0, async function (done) {
        playSource('51.mp4', done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_0600
        * @tc.name      : 006.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : AAC LC
                          Samplerate : 96000
                          Bitrate : 64
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_0600', 0, async function (done) {
        playSource('54.mp4', done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_0700
        * @tc.name      : 007.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : MP3
                          Samplerate : 48000
                          Bitrate : 32
                          Channel : 1
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_0700', 0, async function (done) {
        playSource('64.mp4', done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_0800
        * @tc.name      : 008.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : MP3
                          Samplerate : 48000
                          Bitrate : 16
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_0800', 0, async function (done) {
        playSource('65.mp4', done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_0900
        * @tc.name      : 009.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : MP3
                          Samplerate : 48000
                          Bitrate : 64
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_0900', 0, async function (done) {
        playSource('66.mp4', done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_1000
        * @tc.name      : 010.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : MP3
                          Samplerate : 48000
                          Bitrate : 32
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_1000', 0, async function (done) {
        playSource('67.mp4', done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_1100
        * @tc.name      : 011.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : Vorbis
                          Samplerate : 48000
                          Bitrate : 16
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_1100', 0, async function (done) {
        playSource('92.mp4', done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_1200
        * @tc.name      : 012.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : Vorbis
                          Samplerate : 48000
                          Bitrate : 64
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_1200', 0, async function (done) {
        playSource('93.mp4', done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_1300
        * @tc.name      : 013.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : Vorbis
                          Samplerate : 48000
                          Bitrate : 32
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_1300', 0, async function (done) {
        playSource('94.mp4', done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_1400
        * @tc.name      : 014.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : Vorbis
                          Samplerate : 96000
                          Bitrate : 16
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_1400', 0, async function (done) {
        playSource('96.mp4', done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_1500
        * @tc.name      : 015.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : Vorbis
                          Samplerate : 96000
                          Bitrate : 32
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_1500', 0, async function (done) {
        playSource('97.mp4', done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_1600
        * @tc.name      : 016.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : Vorbis
                          Samplerate : 96000
                          Bitrate : 64
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_FORMAT_MP4_1600', 0, async function (done) {
        playSource('98.mp4', done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_FORMAT_M4A_0100
        * @tc.name      : 001.Playing m4a streams
        * @tc.desc      : Format : M4A
                          Codec : AAC LC
                          Samplerate : 48000
                          Bitrate : 32
                          Channel : 1
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_FORMAT_M4A_0100', 0, async function (done) {
        playSource('55.m4a', done);
    })


    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_FORMAT_M4A_0300
        * @tc.name      : 003.Playing m4a streams
        * @tc.desc      : Format : M4A
                          Codec : AAC LC
                          Samplerate : 48000
                          Bitrate : 64
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_FORMAT_M4A_0300', 0, async function (done) {
        playSource('57.m4a', done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_FORMAT_M4A_0400
        * @tc.name      : 004.Playing m4a streams
        * @tc.desc      : Format : M4A
                          Codec : AAC LC
                          Samplerate : 48000
                          Bitrate : 32
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_FORMAT_M4A_0400', 0, async function (done) {
        playSource('58.m4a', done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_FORMAT_M4A_0500
        * @tc.name      : 005.Playing m4a streams
        * @tc.desc      : Format : M4A
                          Codec : AAC LC
                          Samplerate : 96000
                          Bitrate : 32
                          Channel : 1
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_FORMAT_M4A_0500', 0, async function (done) {
        playSource('59.m4a', done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_FORMAT_M4A_0700
        * @tc.name      : 007.Playing m4a streams
        * @tc.desc      : Format : M4A
                          Codec : AAC LC
                          Samplerate : 96000
                          Bitrate : 64
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_FORMAT_M4A_0700', 0, async function (done) {
        playSource('62.m4a', done);
    })
})
