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

describe('PlayerLocalTestAudioFUNC', function () {
    var audioPlayer = media.createAudioPlayer();
    var audioSource = "data/media/audio/Homey.mp3";
    var PLAY_TIME = 3000;
    var DURATION_TIME = 89239;
    var SEEK_TIME = 5000;
    var DELTA_TIME  = 1000;
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
    var STEPERRCODE = 38;
    var SEEKERROR = 'seekError';
    var PAUSEERROR = 'pauseError';
    var errCode = NOERROR;
    beforeAll(function () {
        console.log("beforeAll case");
    })

    beforeEach(function () {
        console.log("beforeEach case");
    })

    afterEach(function () {
        console.log("afterEach case");
    })

    afterAll(function () {
        console.log("afterAll case");
    })

    var sleep = function(time) {
        for(var t = Date.now(); Date.now() - t <= time;);
    };

    var initAudioPlayer = function() {
        audioPlayer = media.createAudioPlayer();
    }

    var nextStep = function(mySteps, done) {
        if (mySteps[0] == ENDSTATE) {
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
            sleep(PLAY_TIME);
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
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_0100
        * @tc.name      : 001.本地音频初始状态：进行播放
        * @tc.desc      : 1.播放成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_0100', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })
    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_0200
        * @tc.name      : 002.本地音频播放状态：进行暂停
        * @tc.desc      : 1.播放成功
                          2.Pause成功
                          3.Reset成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_0200', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, RESETSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_0300
        * @tc.name      : 003.本地音频暂停状态：进行恢复播放
        * @tc.desc      : 1.播放成功
                          2.Pause成功
                          3.Play成功
                          4.Reset成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_0300', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, PLAYSTATE, RESETSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_0500
        * @tc.name      : 005.本地音频播放状态：进行结束播放
        * @tc.desc      : 1.播放成功
                          2.Reset成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_0500', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, RESETSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_0600
        * @tc.name      : 006.本地音频播放状态：暂停后恢复播放，再次暂停
        * @tc.desc      : 1.播放成功
                          2.Pause成功
                          3.Play成功
                          4.Pause成功
                          5.Reset成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_0600', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, PLAYSTATE, PAUSESTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_0700
        * @tc.name      : 007.本地音频暂停状态：暂停后结束播放
        * @tc.desc      : 1.播放成功
                          2.Pause成功
                          3.Stop成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_0700', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, STOPSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_0800
        * @tc.name      : 008.本地音频播放状态：暂停后恢复播放，再结束播放
        * @tc.desc      : 1.播放成功
                          2.Pause成功
                          3.播放成功
                          4.Stop成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_0800', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, PLAYSTATE, STOPSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_0900
        * @tc.name      : 009.本地音频播放状态：停止播放后重新开始播放，暂停后恢复播放，再结束播放
        * @tc.desc      : 1.播放成功
                          2.Stop成功
　　　　　　　　　　　　　　　　3.播放成功
　　　　　　　　　　　　　　　　4.Pause成功
　　　　　　　　　　　　　　　　5.Play成功
　　　　　　　　　　　　　　　　6.Reset成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level ２
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_0900', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, STOPSTATE, RESETSTATE, SRCSTATE, PLAYSTATE,
            PAUSESTATE, PLAYSTATE, RESETSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_1000
        * @tc.name      : 010.本地音频暂停状态：停止播放后重新开始播放，暂停后结束播放
        * @tc.desc      : 1.播放成功
　　　　　　　　　　　　　　　　2.Pause成功
　　　　　　　　　　　　　　　　3.Stop成功
　　　　　　　　　　　　　　　　4.播放成功
　　　　　　　　　　　　　　　　5.Pause成功
　　　　　　　　　　　　　　　　6.Reset成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level ２
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_1000', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, STOPSTATE, RESETSTATE, SRCSTATE, PLAYSTATE,
            PAUSESTATE, RESETSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_1100
        * @tc.name      : 011.本地音频播放状态：停止播放后重新开始播放，再次结束播放
        * @tc.desc      : 1.播放成功
    　　　　　　　　　　　　　 2.Stop成功
    　　　　　　　　　　　　　 3.播放成功
    　　　　　　　　　　　　　 4.Reset成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level ２
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_1100', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, STOPSTATE, RESETSTATE, SRCSTATE, PLAYSTATE, RESETSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_1200
        * @tc.name      : 012.本地音频暂停状态：暂停后再次play
        * @tc.desc      : 1.播放成功
                          2.Pause成功
                          3.播放成功
                          4.Reset成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level ２
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_1200', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, PLAYSTATE, RESETSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_1300
        * @tc.name      : 013.本地音频停止状态：停止播放后暂停
        * @tc.desc      : 1.播放成功
                          2.Stop成功
                          3.Pause失败
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_1300', 0, async function (done) {
        errCode = STEPERRCODE;
        var mySteps = new Array(SRCSTATE, PLAYSTATE, STOPSTATE, PAUSESTATE, ERRORSTATE, PAUSEERROR, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_1400
        * @tc.name      : 014.本地音频初始状态：开始播放，进行Seek，再暂停
        * @tc.desc      : 1.播放成功
                          2.Seek成功
                          3.Pause成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_1400', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, SEEKSTATE, 0, PAUSESTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_1500
        * @tc.name      : 015.本地音频初始状态：开始播放，暂停后进行Seek，再恢复播放
        * @tc.desc      : 1.播放成功
                          2.Pause成功
                          3.Seek成功
                          4.Play成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_1500', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, SEEKSTATE, 0, SEEKSTATE, DURATION_TIME / 2,
            SEEKSTATE, audioPlayer.duration, PLAYSTATE, FINISHSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_1600
        * @tc.name      : 016.本地音频初始状态：开始播放，暂停后恢复播放，进行Seek，再暂停
        * @tc.desc      : 1.播放成功
                          2.Pause成功
                          3.Play成功
                          4.Seek成功
                          5.pause成功
                          6.Reset成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_1600', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, PLAYSTATE, SEEKSTATE, 0, PAUSESTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_1700
        * @tc.name      : 017.本地音频初始状态：开始播放，进行Seek
        * @tc.desc      : 1.播放成功
                          2.Seek成功
                          3.Reset成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_1700', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, SEEKSTATE, DURATION_TIME / 2, RESETSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_1800
        * @tc.name      : 018.本地音频初始状态：开始播放，进行Seek，停止播放
        * @tc.desc      : 1.播放成功
                          2.Seek成功
                          3.Stop成功
                          4.Reset成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_1800', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, SEEKSTATE, DURATION_TIME / 2,
            STOPSTATE, RESETSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_1900
        * @tc.name      : 019.本地音频初始状态：开始播放，停止播放，进行Seek
        * @tc.desc      : 1.播放成功
                          2.Stop成功
                          3.Seek失败
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_1900', 0, async function (done) {
        errCode = STEPERRCODE;
        var mySteps = new Array(SRCSTATE, PLAYSTATE, STOPSTATE, SEEKSTATE, 0, ERRORSTATE, SEEKERROR, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_2000
        * @tc.name      : 020.本地音频初始状态：开始播放，暂停后进行Seek
        * @tc.desc      : 1.播放成功
                          2.Pause成功
                          3.Seek成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_2000', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, SEEKSTATE, 0, RESETSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_2100
        * @tc.name      : 021.本地音频初始状态：开始播放，暂停后进行Seek，停止播放
        * @tc.desc      : 1.播放成功
                          2.Pause成功
                          3.Seek成功
                          4.Stop成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_2100', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, SEEKSTATE, DURATION_TIME / 2,
            STOPSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_2200
        * @tc.name      : 022.本地音频初始状态：开始播放，暂停后恢复播放，进行Seek
        * @tc.desc      : 1.播放成功
                          2.Pause成功
                          3.Play成功
                          4.Seek成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_2200', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, PLAYSTATE, SEEKSTATE, 0, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_2300
        * @tc.name      : 023.本地音频初始状态：开始播放，暂停后恢复播放，进行Seek，停止播放
        * @tc.desc      : 1.播放成功
                          2.Pause成功
                          3.Play成功
                          4.Stop成功
                          5.Seek成功
                          6.Stop成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_2300', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, PLAYSTATE, SEEKSTATE, 0, STOPSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_2400
        * @tc.name      : 024.本地音频初始状态：开始播放，停止播放，进行Seek，重新播放
        * @tc.desc      : 1.播放成功
                          2.Stop成功
                          3.Seek失败
                          4.重新播放成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_2400', 0, async function (done) {
        errCode = STEPERRCODE;
        var mySteps = new Array(SRCSTATE, PLAYSTATE, STOPSTATE, SEEKSTATE, 0, ERRORSTATE, SEEKERROR,
            RESETSTATE, SRCSTATE, PLAYSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_2500
        * @tc.name      : 025.本地音频播放状态：进行Seek，Seek到文件开始的位置
        * @tc.desc      : 1.播放成功
                          2.Seek成功
                          3.Reset成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_2500', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, SEEKSTATE, 0, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_2600
        * @tc.name      : 026.本地音频初始状态：开始播放，停止播放，进行Seek,再暂停
        * @tc.desc      : 1.播放成功
                          2.Stop成功
                          3.Seek失败
                          4.Pause失败
                          5.Reset成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 3
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_2600', 0, async function (done) {
        errCode = STEPERRCODE;
        var mySteps = new Array(SRCSTATE, PLAYSTATE, STOPSTATE, SEEKSTATE, SEEK_TIME, ERRORSTATE,
            SEEKERROR, PAUSESTATE, ERRORSTATE, PAUSEERROR, RESETSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_2700
        * @tc.name      : 027.本地音频初始状态：开始播放，停止播放，进行Seek，再进行恢复播放操作
        * @tc.desc      : 1.播放成功；
                          2.Stop成功；
                          3.Seek失败
                          4.恢复播放成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 3
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_2700', 0, async function (done) {
        errCode = STEPERRCODE;
        var mySteps = new Array(SRCSTATE, PLAYSTATE, STOPSTATE, SEEKSTATE, SEEK_TIME, ERRORSTATE,
            SEEKERROR, RESETSTATE, SRCSTATE, PLAYSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_2800
        * @tc.name      : 028.本地音频播放状态：进行Seek，Seek到文件结尾的位置
        * @tc.desc      : 1.播放成功
                          2.Seek成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_2800', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, SEEKSTATE, DURATION_TIME, FINISHSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_2900
        * @tc.name      : 029.本地音频播放状态：进行Seek，Seek到超过文件结尾的位置
        * @tc.desc      : 1.播放成功
                          2.Seek到结尾
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 3
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_2900', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, SEEKSTATE, DURATION_TIME + DELTA_TIME,
            FINISHSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_3000
        * @tc.name      : 030.本地音频播放状态：进行Seek，Seek到文件随机的位置
        * @tc.desc      : 1.Seek成功，查看currenTime与seek到的位置一致
                          2.当前位置为seek设置的随机位置
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_3000', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, SEEKSTATE, DURATION_TIME / 5, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_3200
        * @tc.name      : 032.本地音频播放状态：暂停时Seek到文件开始，恢复播放
        * @tc.desc      : 1.播放成功
                          2.暂停成功
                          3.Seek成功
                          4.Play成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_3200', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, SEEKSTATE, 0, PLAYSTATE, RESETSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_3300
        * @tc.name      : 033.本地音频播放状态：暂停时Seek到文件结尾，恢复播放
        * @tc.desc      : 1.播放成功
                          2.暂停成功
                          3.Seek成功
                          4.Play成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_3300', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, SEEKSTATE, DURATION_TIME, PLAYSTATE,
            FINISHSTATE, RESETSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_3400
        * @tc.name      : 034.本地音频播放状态：暂停时Seek到超过文件结尾的位置，恢复播放
        * @tc.desc      : 1.播放成功
                          2.暂停成功
                          3.Seek成功
                          4.Play成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 3
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_3400', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, PAUSESTATE, SEEKSTATE, DURATION_TIME + DELTA_TIME, PLAYSTATE,
            FINISHSTATE, RESETSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_3500
        * @tc.name      : 035.本地音频播放状态：播放时Seek到超过文件结尾的位置，再重新开始播放
        * @tc.desc      : 1.播放成功
                          2.Seek成功
                          3.finish回调函数触发，并重新开始播放
                          3.Play成功
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 3
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_3500', 0, async function (done) {
        var mySteps = new Array(SRCSTATE, PLAYSTATE, SEEKSTATE, DURATION_TIME + DELTA_TIME,
            FINISHSTATE, PLAYSTATE, RESETSTATE, ENDSTATE);
        initAudioPlayer();
        setCallback(mySteps, done);
        audioPlayer.src = audioSource;
    })

    /* *
        * @tc.number    : SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_3600
        * @tc.name      : 036.支持设置循环播放
        * @tc.desc      :
        * @tc.size      : MEDIUM
        * @tc.type      : Function test
        * @tc.level     : Level 0
    */
    it('SUB_MEDIA_PLAYER_LOCAL_AUDIO_Function_04_3600', 0, async function (done) {
        var playCount = 0;
        var seekCount = 0;
        var testAudioPlayer = media.createAudioPlayer();
        testAudioPlayer.on('dataLoad', () => {
            console.log(`case dataLoad called`);
            expect(testAudioPlayer.currentTime).assertEqual(0);
            expect(testAudioPlayer.duration).assertEqual(DURATION_TIME);
            expect(testAudioPlayer.state).assertEqual('paused');
            testAudioPlayer.loop = true;
            testAudioPlayer.play();
        });
        testAudioPlayer.on('play', () => {
            console.log(`case play called`);
            console.log(`case play currentTime is ${testAudioPlayer.currentTime}`);
            expect(testAudioPlayer.duration).assertEqual(DURATION_TIME);
            expect(testAudioPlayer.state).assertEqual('playing');
            sleep(PLAY_TIME);
            if (playCount == 1) {
                return;
            }
            playCount++
            testAudioPlayer.seek(DURATION_TIME);
        });
        testAudioPlayer.on('timeUpdate', (seekDoneTime) => {
            if (typeof (seekDoneTime) == "undefined") {
                console.log(`case seek filed,errcode is ${seekDoneTime}`);
                return;
            }
            if (seekCount == 1) {
                testAudioPlayer.reset();
                return;
            }
            seekCount++
            console.log(`case seekDoneTime is ${seekDoneTime}`);
            console.log(`case seek called`);
            expect(testAudioPlayer.currentTime + 1).assertClose(seekDoneTime + 1, DELTA_TIME);
        });
        testAudioPlayer.on('finish', () => {
            expect(testAudioPlayer.state).assertEqual('playing');
            console.log(`case finish called`);
        });
        testAudioPlayer.on('reset', () => {
            expect(testAudioPlayer.state).assertEqual('idle');
            console.log(`case reset called`);
            testAudioPlayer.release();
            done();
        });
        testAudioPlayer.src = audioSource;
    })

})