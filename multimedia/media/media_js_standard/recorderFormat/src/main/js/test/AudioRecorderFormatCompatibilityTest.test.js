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
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'
import mediaLibrary from '@ohos.multimedia.mediaLibrary'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('AudioRecorderFormatCompatibilityTest', function () {
    const END_STATE = 0;
    const PRE_STATE = 1;
    const START_STATE = 2;
    const PAUSE_STATE = 3;
    const RESUME_STATE = 4;
    const STOP_STATE = 5;
    const RESET_STATE = 6;
    const RELEASE_STATE = 7;
    const ERROR_STATE = 8;
    const RECORDER_TIME = 1000;
    let fdPath;
    let fileAsset;
    let fdNumber;
    let audioRecorder;
    let audioConfig = {
        audioSourceType : media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
        audioEncoder : media.AudioSourceType.AAC_LC,
        audioEncodeBitRate : 22050,
        audioSampleRate : 22050,
        numberOfChannels : 2,
        format : media.AudioOutputFormat.AAC_ADTS,
        uri : 'file:///data/accounts/account_0/appdata/appdata/recorder/test.m4a',
        location : { latitude : 1, longitude : 1 },
    }

    function sleep(time) {
        for(let t = Date.now();Date.now() - t <= time;);
    }

    function initAudioRecorder() {
        if (typeof (audioRecorder) != 'undefined') {
            audioRecorder.release();
            audioRecorder = undefined;
        }
        audioRecorder = media.createAudioRecorder();
    }

    beforeAll(async function () {
        await applyPermission();
        console.info('beforeAll case');
    })

    beforeEach(function () {
        console.info('beforeEach case');
    })

    afterEach(async function () {
        await closeFd();
        console.info('afterEach case');
    })

    afterAll(function () {
        console.info('afterAll case');
    })

    async function applyPermission() {
        let appInfo = await bundle.getApplicationInfo('ohos.acts.multimedia.audio.recorderformat', 0, 100);
        let atManager = abilityAccessCtrl.createAtManager();
        if (atManager != null) {
            let tokenID = appInfo.accessTokenId;
            console.info('[permission] case accessTokenID is ' + tokenID);
            let permissionName1 = 'ohos.permission.MICROPHONE';
            let permissionName2 = 'ohos.permission.MEDIA_LOCATION';
            let permissionName3 = 'ohos.permission.READ_MEDIA';
            let permissionName4 = 'ohos.permission.WRITE_MEDIA';
            await atManager.grantUserGrantedPermissi
            
            
            
            
            
            
            on(tokenID, permissionName1, 1).then((result) => {
                console.info('[permission] case grantUserGrantedPermission success :' + result);
            }).catch((err) => {
                console.error('[permission] case grantUserGrantedPermission failed :' + err);
            });
            await atManager.grantUserGrantedPermission(tokenID, permissionName2, 1).then((result) => {
                console.info('[permission] case grantUserGrantedPermission success :' + result);
            }).catch((err) => {
                console.error('[permission] case grantUserGrantedPermission failed :' + err);
            });
            await atManager.grantUserGrantedPermission(tokenID, permissionName3, 1).then((result) => {
                console.info('[permission] case grantUserGrantedPermission success :' + result);
            }).catch((err) => {
                console.error('[permission] case grantUserGrantedPermission failed :' + err);
            });
            await atManager.grantUserGrantedPermission(tokenID, permissionName4, 1).then((result) => {
                console.info('[permission] case grantUserGrantedPermission success :' + result);
            }).catch((err) => {
                console.error('[permission] case grantUserGrantedPermission failed :' + err);
            });
        } else {
            console.error('[permission] case apply permission failed, createAtManager failed');
        }
    }

    async function getFd(pathName) {
        let displayName = pathName;
        const mediaTest = mediaLibrary.getMediaLibrary();
        let fileKeyObj = mediaLibrary.FileKey;
        let mediaType = mediaLibrary.MediaType.VIDEO;
        let publicPath = await mediaTest.getPublicDirectory(mediaLibrary.DirectoryType.DIR_VIDEO);
        let dataUri = await mediaTest.createAsset(mediaType, displayName, publicPath);
        if (dataUri != undefined) {
            let args = dataUri.id.toString();
            let fetchOp = {
                selections : fileKeyObj.ID + "=?",
                selectionArgs : [args],
            }
            let fetchFileResult = await mediaTest.getFileAssets(fetchOp);
            fileAsset = await fetchFileResult.getAllObject();
            fdNumber = await fileAsset[0].open('Rw');
            fdPath = "fd://" + fdNumber.toString();
            console.info(`[mediaLibrary] case fdPath: ${fdPath}`);
        } else {
                console.error('[mediaLibrary] case dataUri is null')
            }
    }

    async function closeFd() {
        if (fileAsset != null) {
            await fileAsset[0].close(fdNumber).then(() => {
                console.info('[mediaLibrary] case close fd success');
            }).catch((err) => {
                console.error('[mediaLibrary] case close fd failed');
            });
        } else {
            console.error('[mediaLibrary] case fileAsset is null');
        }
    }

    function nextStep(mySteps, done) {
        if (mySteps[0] == END_STATE) {
            done();
            console.info('case to done');
            return;
        }
        switch (mySteps[0]) {
            case PRE_STATE:
                console.info('case to prepare');
                audioRecorder.prepare(audioConfig);
                break;
            case START_STATE:
                console.info('case to start');
                audioRecorder.start();
                break;
            case PAUSE_STATE:
                console.info('case to pause');
                audioRecorder.pause();
                break;
            case RESUME_STATE:
                console.info('case to resume');
                audioRecorder.resume();
                break;
            case STOP_STATE:
                console.info('case to stop');
                audioRecorder.stop();
                break;
            case RESET_STATE:
                console.info('case to reset');
                audioRecorder.reset();
                break;
            case RELEASE_STATE:
                console.info('case to release');
                audioRecorder.release();
                audioRecorder = undefined;
                break;
            case ERROR_STATE:
                console.info('case to wait error callback');
                break;
            default:
                break;
        }
    }

    function setCallback(mySteps, done) {
        audioRecorder.on('prepare', () => {
            console.info('setCallback prepare() case callback is called');
            mySteps.shift();
            nextStep(mySteps, done);
        });

        audioRecorder.on('start', () => {
            console.info('setCallback start() case callback is called');
            sleep(RECORDER_TIME);
            mySteps.shift();
            nextStep(mySteps, done);
        });

        audioRecorder.on('pause', () => {
            console.info('setCallback pause() case callback is called');
            sleep(RECORDER_TIME);
            mySteps.shift();
            nextStep(mySteps, done);
        });

        audioRecorder.on('resume', () => {
            console.info('setCallback resume() case callback is called');
            sleep(RECORDER_TIME);
            mySteps.shift();
            nextStep(mySteps, done);
        });

        audioRecorder.on('stop', () => {
            console.info('setCallback stop() case callback is called');
            mySteps.shift();
            nextStep(mySteps, done);
        });

        audioRecorder.on('reset', () => {
            console.info('setCallback reset() case callback is called');
            mySteps.shift();
            nextStep(mySteps, done);
        });

        audioRecorder.on('release', () => {
            console.info('setCallback release() case callback is called');
            mySteps.shift();
            nextStep(mySteps, done);
        });
        audioRecorder.on('error', (err) => {
            console.info(`case error called,errName is ${err.name}`);
            console.info(`case error called,errCode is ${err.code}`);
            console.info(`case error called,errMessage is ${err.message}`);
            mySteps.shift();
            expect(mySteps[0]).assertEqual(ERROR_STATE);
            mySteps.shift();
            nextStep(mySteps, done);
        });  
    }

    /* *
        * @tc.number    : SUB_MEDIA_AUDIO_RECORDER_FORMAT_COMPATIBILITY_0100
        * @tc.name      : location: {latitude: -90, longitude: -180}
        * @tc.desc      : location test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_AUDIO_RECORDER_FORMAT_COMPATIBILITY_0100', 0, async function (done) {
        await getFd('COMPATIBILITY_0100.m4a');
        audioConfig.uri = fdPath;
        audioConfig.location.latitude = -90;
        audioConfig.location.longitude = -180;
        initAudioRecorder();
        let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE, END_STATE);
        setCallback(mySteps, done);
        audioRecorder.prepare(audioConfig);
    })

    /* *
        * @tc.number    : SUB_MEDIA_AUDIO_RECORDER_FORMAT_COMPATIBILITY_0200
        * @tc.name      : location: {latitude: 90, longitude: 180}
        * @tc.desc      : location test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_AUDIO_RECORDER_FORMAT_COMPATIBILITY_0200', 0, async function (done) {
        await getFd('COMPATIBILITY_0200.m4a');
        audioConfig.uri = fdPath;
        audioConfig.location.latitude = 90;
        audioConfig.location.longitude = 180;
        initAudioRecorder();
        let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE, END_STATE);
        setCallback(mySteps, done);
        audioRecorder.prepare(audioConfig);
    })

    /* *
        * @tc.number    : SUB_MEDIA_AUDIO_RECORDER_FORMAT_COMPATIBILITY_0300
        * @tc.name      : location: {latitude: 0, longitude: 0}
        * @tc.desc      : location test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_AUDIO_RECORDER_FORMAT_COMPATIBILITY_0300', 0, async function (done) {
        await getFd('COMPATIBILITY_0300.m4a');
        audioConfig.uri = fdPath;
        audioConfig.location.latitude = 0;
        audioConfig.location.longitude = 0;
        initAudioRecorder();
        let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE, END_STATE);
        setCallback(mySteps, done);
        audioRecorder.prepare(audioConfig);
    })

    /* *
        * @tc.number    : SUB_MEDIA_AUDIO_RECORDER_FORMAT_COMPATIBILITY_0400
        * @tc.name      : location: {latitude: 0, longitude: 180}
        * @tc.desc      : location test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_AUDIO_RECORDER_FORMAT_COMPATIBILITY_0400', 0, async function (done) {
        await getFd('COMPATIBILITY_0400.m4a');
        audioConfig.uri = fdPath;
        audioConfig.location.latitude = 0;
        audioConfig.location.longitude = 180;
        initAudioRecorder();
        let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE, END_STATE);
        setCallback(mySteps, done);
        audioRecorder.prepare(audioConfig);
    })

    /* *
        * @tc.number    : SUB_MEDIA_AUDIO_RECORDER_FORMAT_COMPATIBILITY_0500
        * @tc.name      : location: {latitude: -30, longitude: 60}
        * @tc.desc      : location test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_AUDIO_RECORDER_FORMAT_COMPATIBILITY_0500', 0, async function (done) {
        await getFd('COMPATIBILITY_0500.m4a');
        audioConfig.uri = fdPath;
        audioConfig.location.latitude = -30;
        audioConfig.location.longitude = 60;
        initAudioRecorder();
        let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE, END_STATE);
        setCallback(mySteps, done);
        audioRecorder.prepare(audioConfig);
    })

    /* *
        * @tc.number    : SUB_MEDIA_AUDIO_RECORDER_FORMAT_COMPATIBILITY_0600
        * @tc.name      : location: {latitude: 60, longitude: -90}
        * @tc.desc      : location test
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
    */
    it('SUB_MEDIA_AUDIO_RECORDER_FORMAT_COMPATIBILITY_0600', 0, async function (done) {
        await getFd('COMPATIBILITY_0600.m4a');
        audioConfig.uri = fdPath;
        audioConfig.location.latitude = 60;
        audioConfig.location.longitude = -90;
        initAudioRecorder();
        let mySteps = new Array(PRE_STATE, START_STATE, STOP_STATE, RELEASE_STATE, END_STATE);
        setCallback(mySteps, done);
        audioRecorder.prepare(audioConfig);
    })
})
