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
    var DURATION_TIME = 89239;
    var SEEK_TIME = 5000;
    var DELTA_TIME  = 1000;
    var PAUSEERROR = 'pauseError';
    var PLAYERROR = 'playError';
    var loopValue = false;
    beforeAll(function () {
        console.log("beforeAll case");
    })

    beforeEach(function () {
        console.log("beforeEach case");
    })

    afterEach(function () {
        console.log("afterEach case");
        audioPlayer.release();
    })

    afterAll(function () {
        console.log("afterAll case");
    })

    var sleep = function(time) {
        for(var t = Date.now();Date.now() - t <= time;);
    };

    var initAudioPlayer = function() {
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
                console.log(`case to prepare`);
                audioPlayer.src = audioSource;
                break;
            case PLAYSTATE:
                console.log(`case to play`);
                audioPlayer.play();
                break;
            case PAUSESTATE:
                console.log(`case to pause`);
                audioPlayer.pause();
                break;
            case STOPSTATE:
                console.log(`case to stop`);
                audioPlayer.stop();
                break;
            case RESETSTATE:
                console.log(`case to reset`);
                audioPlayer.reset();
                break;
            case SEEKSTATE:
                console.log(`case seek to time is ${mySteps[1]}`);
                audioPlayer.seek(mySteps[1]);
                break;
            case VOLUMESTATE:
                console.log(`case to setVolume`);
                audioPlayer.setVolume(mySteps[1]);
                break;
            case RELEASESTATE:
                console.log(`case to release`);
                mySteps.shift();
                audioPlayer.release();
                nextStep(mySteps, done);
                break;
            case LOOPSTATE:
                loopValue = mySteps[1];
                mySteps.shift();
                mySteps.shift();
                audioPlayer.loop = loopValue;
                nextStep(mySteps, done);
                break;
            default:
                break;
        }
    }
    var setCallback = function(mySteps, done) {
        console.log(`case setCallback`);
        audioPlayer.on('dataLoad', () => {
            mySteps.shift();
            console.log(`case dataLoad called`);
            expect(audioPlayer.currentTime).assertEqual(0);
            expect(audioPlayer.duration).assertEqual(DURATION_TIME);
            expect(audioPlayer.state).assertEqual('paused');
            nextStep(mySteps, done);
        });

        audioPlayer.on('play', () => {
            mySteps.shift();
            console.log(`case play called`);
            console.log(`case play currentTime is ${audioPlayer.currentTime}`);
            expect(audioPlayer.duration).assertEqual(DURATION_TIME);
            if (mySteps[0] == FINISHSTATE) {
                console.log(`case wait for finish`);
                return;
            }
            expect(audioPlayer.state).assertEqual('playing');
            nextStep(mySteps, done);
        });

        audioPlayer.on('pause', () => {
            mySteps.shift();
            console.log(`case pause called`);
            console.log(`case pause currentTime is ${audioPlayer.currentTime}`);
            expect(audioPlayer.duration).assertEqual(DURATION_TIME);
            expect(audioPlayer.state).assertEqual('paused');
            nextStep(mySteps, done);
        });

        audioPlayer.on('reset', () => {
            mySteps.shift();
            console.log(`case reset called`);
            expect(audioPlayer.state).assertEqual('idle');
            nextStep(mySteps, done);
        });

        audioPlayer.on('stop', () => {
            mySteps.shift();
            console.log(`case stop called`);
            expect(audioPlayer.currentTime).assertEqual(0);
            expect(audioPlayer.duration).assertEqual(DURATION_TIME);
            expect(audioPlayer.state).assertEqual('stopped');
            nextStep(mySteps, done);
        });

        audioPlayer.on('timeUpdate', (seekDoneTime) => {
            if (typeof (seekDoneTime) == "undefined") {
                console.log(`case seek filed,errcode is ${seekDoneTime}`);
                return;
            }
            mySteps.shift();
            mySteps.shift();
            console.log(`case seekDoneTime is ${seekDoneTime}`);
            console.log(`case seek called`);
            expect(audioPlayer.currentTime + DELTA_TIME).assertClose(seekDoneTime + DELTA_TIME, DELTA_TIME);
            console.log(`case loop is ${audioPlayer.loop}`);
            if ((audioPlayer.loop == true) && (seekDoneTime == DURATION_TIME)) {
                console.log('case loop is true');
                sleep(PLAYSTATE);
            }
            if (seekDoneTime < audioPlayer.duration || audioPlayer.state == "paused") {
                nextStep(mySteps, done);
            }
        });

        audioPlayer.on('volumeChange', () => {
            console.log(`case setvolume called`);
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
            console.log(`case finish called`);
            nextStep(mySteps, done);
        });

        audioPlayer.on('error', (err) => {
            console.log(`case error called,errName is ${err.name}`);
            console.log(`case error called,errCode is ${err.code}`);
            console.log(`case error called,errMessage is ${err.message}`);
            if ((mySteps[0] == SEEKSTATE) || (mySteps[0] == VOLUMESTATE)) {
                expect(mySteps[2]).assertEqual(ERRORSTATE);
                mySteps.shift();
                mySteps.shift();
                mySteps.shift();
                mySteps.shift();
                nextStep(mySteps, done);
            } else if (mySteps[0] == ERRORSTATE) {
                mySteps.shift();
                mySteps.shift();
            } else if (mySteps[0] == ENDSTATE) {
                console.log('case release player error');
            } else {
                expect(mySteps[1]).assertEqual(ERRORSTATE);
                mySteps.shift();
                mySteps.shift();
                mySteps.shift();
                nextStep(mySteps, done);
            }
        });
    };

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_AudioPlayer_Play_API_0200
        * @tc.name      : 02.play操作在pause之后
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : API Test
        * @tc.level     : Level 2
    */
    it('SUB_MEDIA_PLAYER_AudioPlayer_Play_API_0200', 0, async function (done) {
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
