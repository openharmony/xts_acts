/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('PlayerLocalTestAudioAPI', function () {
    var audioPlayer = media.createAudioPlayer();
    var audioSource = "data/media/audio/Homey.mp3";
    var PLAY_TIME = 3000;
    var ENDSTATE = 0;
    var SRCSTATE = 1;
    var PLAYSTATE = 2;
    var PAUSESTATE = 3;
    var STOPSTATE = 4;
    var RESETSTATE = 5;
    var SEEKSTATE = 6;
    var VOLUMESTATE = 7;
    var RELEASESTATE = 8;
    var ERRORSTATE = 9;
    var FINISHSTATE = 10;
    var LOOPSTATE = 11;
    var NOERROR = 0;
    var DURATION_TIME = 89239;
    var SEEK_TIME = 5000;
    var VOLUMEVALUE = 0.1;
    var DELTA_TIME  = 1000;
    var SRCERROR = 'sourceError';
    var SEEKERROR = 'seekError';
    var PAUSEERROR = 'pauseError';
    var PLAYERROR = 'playError';
    var STOPERROR = 'stopError';
    var errCode = NOERROR;
    var ERRSTEP = 38;
    var ERRSRC = 22;
    beforeAll(function () {
        console.info("beforeAll case");
    })

    beforeEach(function () {
        console.info("beforeEach case");
    })

    afterEach(function () {
        console.info("afterEach case");
        errCode = NOERROR;
    })

    afterAll(function () {
        console.info("afterAll case");
    })

    var sleep = function(time) {
        for(var t = Date.now();Date.now() - t <= time;);
    };

    var initAudioPlayer = function() {
        audioPlayer.release();
        audioPlayer = media.createAudioPlayer();
    }

    var nextStep = function(mySteps, done) {
        if (mySteps[0] == ENDSTATE) {
            if (mySteps[1] == false || mySteps[1] == true) {
                expect(audioPlayer.loop).assertEqual(mySteps[1]);
            }
            done();
            return;
        }
        switch (mySteps[0]) {
            case SRCSTATE:
                console.info(`case to prepare`);
                audioPlayer.src = audioSource;
                break;
            case PLAYSTATE:
                console.info(`case to play`);
                audioPlayer.play();
                break;
            case PAUSESTATE:
                console.info(`case to pause`);
                audioPlayer.pause();
                break;
            case STOPSTATE:
                console.info(`case to stop`);
                audioPlayer.stop();
                break;
            case RESETSTATE:
                console.info(`case to reset`);
                audioPlayer.reset();
                break;
            case SEEKSTATE:
                console.info(`case seek to time is ${mySteps[1]}`);
                audioPlayer.seek(mySteps[1]);
                break;
            case VOLUMESTATE:
                console.info(`case to setVolume`);
                audioPlayer.setVolume(mySteps[1]);
                break;
            case RELEASESTATE:
                console.info(`case to release`);
                mySteps.shift();
                audioPlayer.release();
                nextStep(mySteps, done);
                break;
            case LOOPSTATE:
                audioPlayer.loop = mySteps[1];
                mySteps.shift();
                mySteps.shift();
                nextStep(mySteps, done);
                break;
            default:
                break;
        }
    }
    var setCallback = function(mySteps, done) {
        console.info(`case setCallback`);
        audioPlayer.on('dataLoad', () => {
            mySteps.shift();
            console.info(`case dataLoad called`);
            expect(audioPlayer.currentTime).assertEqual(0);
            expect(audioPlayer.duration).assertEqual(DURATION_TIME);
            expect(audioPlayer.state).assertEqual('paused');
            nextStep(mySteps, done);
        });

        audioPlayer.on('play', () => {
            mySteps.shift();
            console.info(`case play called`);
            console.info(`case play currentTime is ${audioPlayer.currentTime}`);
            expect(audioPlayer.duration).assertEqual(DURATION_TIME);
            if (mySteps[0] == FINISHSTATE) {
                console.info(`case wait for finish`);
                return;
            }
            expect(audioPlayer.state).assertEqual('playing');
            nextStep(mySteps, done);
        });

        audioPlayer.on('pause', () => {
            mySteps.shift();
            console.info(`case pause called`);
            console.info(`case pause currentTime is ${audioPlayer.currentTime}`);
            expect(audioPlayer.duration).assertEqual(DURATION_TIME);
            expect(audioPlayer.state).assertEqual('paused');
            nextStep(mySteps, done);
        });

        audioPlayer.on('reset', () => {
            mySteps.shift();
            console.info(`case reset called`);
            expect(audioPlayer.state).assertEqual('idle');
            nextStep(mySteps, done);
        });

        audioPlayer.on('stop', () => {
            mySteps.shift();
            console.info(`case stop called`);
            expect(audioPlayer.currentTime).assertEqual(0);
            expect(audioPlayer.duration).assertEqual(DURATION_TIME);
            expect(audioPlayer.state).assertEqual('stopped');
            nextStep(mySteps, done);
        });

        audioPlayer.on('timeUpdate', (seekDoneTime) => {
            if (typeof (seekDoneTime) == "undefined") {
                console.info(`case seek filed,errcode is ${seekDoneTime}`);
                return;
            }
            mySteps.shift();
            mySteps.shift();
            console.info(`case seekDoneTime is ${seekDoneTime}`);
            console.info(`case seek called`);
            expect(audioPlayer.currentTime + DELTA_TIME).assertClose(seekDoneTime + DELTA_TIME, DELTA_TIME);
            console.info(`case loop is ${audioPlayer.loop}`);
            if ((audioPlayer.loop == true) && (seekDoneTime == DURATION_TIME)) {
                console.info('case loop is true');
                sleep(PLAYSTATE);
            }
            if (seekDoneTime < audioPlayer.duration || audioPlayer.state == "paused") {
                nextStep(mySteps, done);
            }
        });

        audioPlayer.on('volumeChange', () => {
            console.info(`case setvolume called`);
            mySteps.shift();
            mySteps.shift();
            if (audioPlayer.state == "playing") {
                sleep(PLAY_TIME);
            }
            nextStep(mySteps, done);
        });

        audioPlayer.on('finish', () => {
            mySteps.shift();
            expect(audioPlayer.state).assertEqual('stopped');
            expect(audioPlayer.currentTime).assertClose(audioPlayer.duration, DELTA_TIME);
            console.info(`case finish called`);
            nextStep(mySteps, done);
        });

        audioPlayer.on('error', (err) => {
            console.info(`case error called,errName is ${err.name}`);
            console.info(`case error called,errCode is ${err.code}`);
            console.info(`case error called,errMessage is ${err.message}`);
            expect(err.code).assertEqual(errCode);
            if ((mySteps[0] == SEEKSTATE) || (mySteps[0] == VOLUMESTATE)) {
                expect(mySteps[2]).assertEqual(ERRORSTATE);
                expect(err.message).assertEqual(mySteps[3]);
                mySteps.shift();
                mySteps.shift();
                mySteps.shift();
                mySteps.shift();
            } else {
                expect(mySteps[1]).assertEqual(ERRORSTATE);
                expect(err.message).assertEqual(mySteps[2]);
                mySteps.shift();
                mySteps.shift();
                mySteps.shift();
            }
            nextStep(mySteps, done);
        });
    };

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_createAudioPlayer_API_0100
        * @tc.name      : 01.创建一个音频播放器createAudioPlayer()
        * @tc.desc      : testcreateAudioPlayer
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_createAudioPlayer_API_0100', 0, async function (done) {
        var audioPlayerTest = media.createAudioPlayer();
        expect(audioPlayerTest != null).assertTrue();
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Play_API_0100
        * @tc.name      : 01.play操作在createAudioPlayer之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Play_API_0100', 0, async function (done) {
        errCode = ERRSTEP;
        var mySteps = new Array(PLAYSTATE, ERRORSTATE, PLAYERROR, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.play();
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Play_API_0200
        * @tc.name      : 02.play操作在pause之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Play_API_0200', 0, async function (done) {
        errCode = ERRSTEP;
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, PLAYSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Play_API_0300
        * @tc.name      : 03.play操作在stop之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Play_API_0300', 0, async function (done) {
        errCode = ERRSTEP;
        var mySteps = new Array(SRCSTATE, PLAYSTATE, STOPSTATE, PLAYSTATE, ERRORSTATE, PLAYERROR, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Play_API_0400
        * @tc.name      : 04.play操作在seek之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Play_API_0400', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, SEEKSTATE, SEEK_TIME, PLAYSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Play_API_0800
        * @tc.name      : 08.play操作在reset之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Play_API_0800', 0, async function (done) {
        errCode = ERRSTEP;
        var mySteps = new Array(SRCSTATE, RESETSTATE, PLAYSTATE, ERRORSTATE, PLAYERROR, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Play_API_0900
        * @tc.name      : 09.play操作在release之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Play_API_0900', 0, async function (done) {
        errCode = ERRSTEP;
        var mySteps = new Array(SRCSTATE, RELEASESTATE, PLAYSTATE, ERRORSTATE, PLAYERROR, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Pause_API_0100
        * @tc.name      : 01.pause操作在createAudioPlayer之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Pause_API_0100', 0, async function (done) {
        errCode = ERRSTEP;
        var mySteps = new Array(PAUSESTATE, ERRORSTATE, PAUSEERROR, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.pause();
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Pause_API_0200
        * @tc.name      : 02.pause操作在play之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Pause_API_0200', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Pause_API_0300
        * @tc.name      : 02.pause操作在stop之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Pause_API_0300', 0, async function (done) {
        errCode = ERRSTEP;
        var mySteps = new Array(PLAYSTATE, STOPSTATE, PAUSESTATE, ERRORSTATE, PAUSEERROR, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Pause_API_0400
        * @tc.name      : 04.pause操作在seek之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Pause_API_0400', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, SEEKSTATE, SEEK_TIME, PAUSESTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Pause_API_0800
        * @tc.name      : 08.pause操作在reset之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Pause_API_0800', 0, async function (done) {
        errCode = ERRSTEP;
        var mySteps = new Array(SRCSTATE, RESETSTATE, PAUSESTATE, ERRORSTATE, PAUSEERROR, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Pause_API_0900
        * @tc.name      : 09.pause操作在release之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Pause_API_0900', 0, async function (done) {
        errCode = ERRSTEP;
        var mySteps = new Array(SRCSTATE, RELEASESTATE, PAUSESTATE, ERRORSTATE, PAUSEERROR, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Stop_API_0100
        * @tc.name      : 01.stop操作在createAudioPlayer之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Stop_API_0100', 0, async function (done) {
        errCode = ERRSTEP;
        var mySteps = new Array(STOPSTATE, ERRORSTATE, STOPERROR, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.stop();
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Stop_API_0200
        * @tc.name      : 02.stop操作在play之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Stop_API_0200', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, STOPSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Stop_API_0300
        * @tc.name      : 03.stop操作在pause之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Stop_API_0300', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, STOPSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Stop_API_0400
        * @tc.name      : 04.stop操作在seek之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Stop_API_0400', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, SEEKSTATE, SEEK_TIME, STOPSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Stop_API_0800
        * @tc.name      : 08.stop操作在reset之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Stop_API_0800', 0, async function (done) {
        errCode = ERRSTEP;
        var mySteps = new Array(SRCSTATE, PLAYSTATE, RESETSTATE, STOPSTATE, ERRORSTATE, STOPERROR, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Pause_API_0900
        * @tc.name      : 09.stop操作在release之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Stop_API_0900', 0, async function (done) {
        errCode = ERRSTEP;
        var mySteps = new Array(SRCSTATE, PLAYSTATE, RELEASESTATE, STOPSTATE, ERRORSTATE, STOPERROR, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Seek_API_0100
        * @tc.name      : 01.seek操作在createAudioPlayer之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Seek_API_0100', 0, async function (done) {
        errCode = ERRSTEP;
        var mySteps = new Array(SEEKSTATE, SEEK_TIME, ERRORSTATE, SEEKERROR, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        var seekTime = SEEK_TIME;
        audioPlayer.seek(seekTime);
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Seek_API_0200
        * @tc.name      : 02.seek操作在play之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Seek_API_0200', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, SEEKSTATE, SEEK_TIME, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Seek_API_0300
        * @tc.name      : 03.seek操作在pause之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Seek_API_0300', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, SEEKSTATE, SEEK_TIME, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })


    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Seek_API_0500
        * @tc.name      : 05.seek操作在stop之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Seek_API_0500', 0, async function (done) {
        errCode = ERRSTEP;
        var mySteps = new Array(SRCSTATE, PLAYSTATE, STOPSTATE, SEEKSTATE, SEEK_TIME, ERRORSTATE, SEEKERROR, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Seek_API_0700
        * @tc.name      : 07.seek操作调用3次
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Seek_API_0700', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, SEEKSTATE, SEEK_TIME, SEEKSTATE, 6000, SEEKSTATE, 7000, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })
    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Seek_API_0800
        * @tc.name      : 08.seek到码流任意某一点(0~码流时长)
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Seek_API_0800', 0, async function (done) {
        var randomTime = parseInt(Math.random()*(audioPlayer.duration + 1),10);
        var mySteps = new Array(SRCSTATE, PLAYSTATE, SEEKSTATE, randomTime, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })
    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Seek_API_0900
        * @tc.name      : 9.seek到起始位置(0)
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Seek_API_0900', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, SEEKSTATE, 0, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })
    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Seek_API_1000
        * @tc.name      : 10.seek到结束位置(码流时长)
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Seek_API_1000', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, SEEKSTATE, DURATION_TIME, FINISHSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Seek_API_1100
        * @tc.name      : 11.seek操作在reset之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Seek_API_1100', 0, async function (done) {
        errCode = ERRSTEP;
        var mySteps = new Array(SRCSTATE, PLAYSTATE, RESETSTATE, SEEKSTATE, SEEK_TIME,
            ERRORSTATE, SEEKERROR, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Seek_API_1200
        * @tc.name      : 12.seek操作在release之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Seek_API_1200', 0, async function (done) {
        errCode = ERRSTEP;
        var mySteps = new Array(SRCSTATE, PLAYSTATE, RELEASESTATE, SEEKSTATE, SEEK_TIME,
            ERRORSTATE, SEEKERROR,  ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Seek_API_1400
        * @tc.name      : 14.seek到超出码流时长
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Seek_API_1400', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, SEEKSTATE, DURATION_TIME + DURATION_TIME, FINISHSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Reset_API_0200
        * @tc.name      : 02.reset操作在play之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Reset_API_0200', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, RESETSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Reset_API_0300
        * @tc.name      : 03.reset操作在pause之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Reset_API_0300', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, RESETSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Reset_API_0400
        * @tc.name      : 04.reset操作在stop之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Reset_API_0400', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, STOPSTATE, RESETSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Reset_API_0500
        * @tc.name      : 05.reset操作在seek之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Reset_API_0500', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, SEEKSTATE, SEEK_TIME, RESETSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Release_API_0100
        * @tc.name      : 01.release操作在createAudioPlayer之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Release_API_0100', 0, async function (done) {
        var mySteps = new Array(RELEASESTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.release();
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Release_API_0200
        * @tc.name      : 02.release操作在play之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Release_API_0200', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, RELEASESTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Release_API_0300
        * @tc.name      : 03.release操作在pause之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Release_API_0300', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, RELEASESTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Release_API_0400
        * @tc.name      : 04.release操作在stop之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Release_API_0400', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, STOPSTATE, RELEASESTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Release_API_0500
        * @tc.name      : 05.release操作在seek之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Release_API_0500', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, SEEKSTATE, SEEK_TIME, RELEASESTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Release_API_0700
        * @tc.name      : 07.release操作在reset之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Release_API_0700', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, RESETSTATE, RELEASESTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_URI_API_0300
        * @tc.name      : 003.播放文件名超长（255）的本地音频素材
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_URI_API_0300', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = "data/media/audio/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" +
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" +
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" +
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" +
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA.mp3";
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_URI_API_0500
        * @tc.name      : 005.播放文件名为“”
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_URI_API_0500', 0, async function (done) {
        errCode = ERRSRC;
        var mySteps = new Array(SRCSTATE, ERRORSTATE, SRCERROR, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = "";
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_URI_API_0800
        * @tc.name      : 008. 传入的地址不存在
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_URI_API_0800', 0, async function (done) {
        errCode = 331350552;
        var mySteps = new Array(SRCSTATE, ERRORSTATE, SRCERROR, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = "data/media/audio/no.mp3";
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Loop_API_0100
        * @tc.name      : 01.set loop true操作在createAudioPlayer之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Loop_API_0100', 0, async function (done) {
        initAudioPlayer();
        audioPlayer.loop = true;
        expect(audioPlayer.loop).assertEqual(false);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Loop_API_0200
        * @tc.name      : 02.set loop true操作在play之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Loop_API_0200', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, LOOPSTATE, true, ENDSTATE, true);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Loop_API_0300
        * @tc.name      : 03.set loop true操作在pause之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Loop_API_0300', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, LOOPSTATE, true, ENDSTATE, true);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Loop_API_0400
        * @tc.name      : 04.set loop true操作在stop之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Loop_API_0400', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, STOPSTATE, LOOPSTATE, true, ENDSTATE, true);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Loop_API_0500
        * @tc.name      : 05.set loop true操作在seek之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Loop_API_0500', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, SEEKSTATE, SEEK_TIME, LOOPSTATE, true, ENDSTATE, true);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Loop_API_0700
        * @tc.name      : 07.set loop true操作在reset之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Loop_API_0700', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, RESETSTATE, LOOPSTATE, true, ENDSTATE, false);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Loop_API_0800
        * @tc.name      : 08.set loop false操作在createAudioPlayer之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Loop_API_0800', 0, async function (done) {
        initAudioPlayer();
        audioPlayer.loop = false;
        expect(audioPlayer.loop).assertEqual(false);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Loop_API_0900
        * @tc.name      : 09.set loop false操作在play之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Loop_API_0900', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, LOOPSTATE, false, ENDSTATE, false);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Loop_API_1000
        * @tc.name      : 10.set loop false操作在pause之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Loop_API_1000', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, LOOPSTATE, false, ENDSTATE, false);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Loop_API_1100
        * @tc.name      : 11.set loop false操作在stop之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Loop_API_1100', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, STOPSTATE, LOOPSTATE, false, ENDSTATE, false);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Loop_API_1200
        * @tc.name      : 12.set loop false操作在seek之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Loop_API_1200', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, SEEKSTATE, SEEK_TIME, LOOPSTATE, false, ENDSTATE, false);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Loop_API_1400
        * @tc.name      : 14.set loop false操作在reset之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Loop_API_1400', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, RESETSTATE, LOOPSTATE, false, ENDSTATE, false);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Time_API_0100
        * @tc.name      : 01.获取参数操作在createAudioPlayer之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Time_API_0100', 0, async function (done) {
        initAudioPlayer();
        expect(audioPlayer.src).assertEqual(undefined);
        expect(audioPlayer.duration).assertEqual(undefined);
        expect(audioPlayer.currentTime).assertEqual(undefined);
        expect(audioPlayer.state).assertEqual('idle');
        expect(audioPlayer.loop).assertEqual(false);
        done();
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Time_API_0200
        * @tc.name      : 02.获取参数操作在setsrc之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Time_API_0200', 0, async function (done) {
        initAudioPlayer();
        audioPlayer.src = audioSource;
        sleep(PLAY_TIME);
        expect(audioPlayer.src).assertEqual(audioSource);
        expect(audioPlayer.currentTime).assertEqual(0);
        expect(audioPlayer.duration).assertEqual(DURATION_TIME);
        expect(audioPlayer.state).assertEqual('paused');
        expect(audioPlayer.loop).assertEqual(false);
        done();
    })

})
