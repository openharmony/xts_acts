/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

describe('audioManager', function () {
    console.info('AudioFrameworkTest: Create AudioManger Object JS Framework');
    const audioManager = audio.getAudioManager();
    var dRValue = null;
    var dTValue = null;
    var devId = null;
    var devName = null;
    var devAddr = null;
    var sRate = null;
    var cCount = null;
    var cMask = null;
    var audioMedia = 3;
    var audioRingtone = 2;
    var minVol = 0;
    var maxVol = 15;
    var lowVol = 5;
    var highVol = 14;
    var outOfRangeVol = 28;
    var longValue = '28374837458743875804735081439085918459801437584738967509184509813904850914375904790589104801843';

    function sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    function displayDeviceProp(value, index, array) {
        var devRoleName;
        var devTypeName;
        if (value.deviceRole == 1) {
            devRoleName = 'INPUT_DEVICE';
        }
        else if (value.deviceRole == 2) {
            devRoleName = 'OUTPUT_DEVICE ';
        }
        else {
            devRoleName = 'ERROR : UNKNOWN : ' + value.deviceRole;
        }

        if (value.deviceType == 1) {
            devTypeName = 'EARPIECE';
        }
        else if (value.deviceType == 2) {
            devTypeName = 'SPEAKER';
        }
        else if (value.deviceType == 3) {
            devTypeName = 'WIRED_HEADSET';
        }
        else if (value.deviceType == 8) {
            devTypeName = 'BLUETOOTH_A2DP';
        }
        else if (value.deviceType == 15) {
            devTypeName = 'MIC';
        }
        else {
            devTypeName = 'ERROR : UNKNOWN :' + value.deviceType;
        }

        console.info(`AudioFrameworkTest: device role: ${devRoleName}`);
        dRValue = value.deviceRole;
        console.info(`AudioFrameworkTest: device type: ${devTypeName}`);
        dTValue = value.deviceType;
        console.info('AudioFrameworkTest: device Id:' + value.id);
        devId = value.id;
        console.info('AudioFrameworkTest: device Name:' + value.name);
        devName = value.name;
        console.info('AudioFrameworkTest: device Address:' + value.address);
        devAddr = value.address;
        console.info('AudioFrameworkTest: device sample Rates:' + value.sampleRates[0]);
        sRate = value.sampleRates[0];
        console.info('AudioFrameworkTest: device channel Counts:' + value.channelCounts[0]);
        cCount = value.channelCounts[0];
        console.info('AudioFrameworkTest: device channel Masks:' + value.channelMasks);
        cMask = value.channelMasks;
    }

    beforeAll(function () {
        console.info('AudioFrameworkTest: beforeAll: Prerequisites at the test suite level');
    })

    beforeEach(async function () {
        console.info('AudioFrameworkTest: beforeEach: Prerequisites at the test case level');
        await sleep(100);
    })

    afterEach(async function () {
        console.info('AudioFrameworkTest: afterEach: Test case-level clearance conditions');
        await sleep(100);
    })

    afterAll(function () {
        console.info('AudioFrameworkTest: afterAll: Test suite-level cleanup condition');
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getAudioManger_001
                * @tc.name      : getAudioManger is Not returned Empty
                * @tc.desc      : Check getAudioManger is not empty
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getAudioManger_001', 0, function (done) {
        if (audioManager != null) {
            console.info('AudioFrameworkTest: getAudioManger : PASS');
            expect(true).assertTrue();
        }
        else {
            console.info('AudioFrameworkTest: getAudioManger : FAIL');
            expect(false).assertTrue();
        }
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getAudioManger_002
                * @tc.name      : getAudioManger - Multiple instance
                * @tc.desc      : multiple times with different instance
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getAudioManger_002', 0, async function (done) {
        const audioManager1 = audio.getAudioManager();
        const audioManager2 = audio.getAudioManager();
        const audioManager3 = audio.getAudioManager();
        const audioManager4 = audio.getAudioManager();
        const audioManager5 = audio.getAudioManager();
        const audioManager6 = audio.getAudioManager();
        const audioManager7 = audio.getAudioManager();
        const audioManager8 = audio.getAudioManager();
        const audioManager9 = audio.getAudioManager();
        const audioManager10 = audio.getAudioManager();
        const promise = audioManager.setVolume(audioMedia, lowVol);
        promise.then(function () {
            console.info('AudioFrameworkTest: Media setVolume promise: successful');
            audioManager1.setVolume(audioMedia, highVol);
            console.info('AudioFrameworkTest:audioManager1 : Media setVolume promise: successful');
            audioManager2.setVolume(audioMedia, highVol);
            console.info('AudioFrameworkTest:audioManager2 : Media setVolume promise: successful');
            audioManager3.setVolume(audioMedia, highVol);
            console.info('AudioFrameworkTest:audioManager3 : Media setVolume promise: successful');
            audioManager4.setVolume(audioMedia, lowVol);
            console.info('AudioFrameworkTest:audioManager4 : Media setVolume promise: successful');
            audioManager5.setVolume(audioMedia, highVol);
            console.info('AudioFrameworkTest:audioManager5 : Media setVolume promise: successful');
            audioManager6.setVolume(audioMedia, lowVol);
            console.info('AudioFrameworkTest:audioManager6 : Media setVolume promise: successful');
            audioManager7.setVolume(audioMedia, highVol);
            console.info('AudioFrameworkTest:audioManager7 : Media setVolume promise: successful');
            audioManager8.setVolume(audioMedia, lowVol);
            console.info('AudioFrameworkTest:audioManager8 : Media setVolume promise: successful');
            audioManager9.setVolume(audioMedia, highVol);
            console.info('AudioFrameworkTest:audioManager9 : Media setVolume promise: successful');
            audioManager10.setVolume(audioMedia, lowVol);
            console.info('AudioFrameworkTest:audioManager10 : Media setVolume promise: successful');
            audioManager.getVolume(audioMedia).then(function (data) {
                if (data == lowVol) {
                    console.info('AudioFrameworkTest: Media getVolume Promise: PASS :' + data);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Media getVolume Promise: FAIL :' + data);
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info('AudioFrameworkTest: Media getVolume Promise: Error :' + err.message);
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_001
                * @tc.name      : setVolume - Media - Promise
                * @tc.desc      : Setvol to 1
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_001', 0, async function (done) {
        const promise = audioManager.setVolume(audioMedia, lowVol);
        promise.then(function () {
            console.info('AudioFrameworkTest: Media setVolume promise: successful');
            audioManager.getVolume(audioMedia).then(function (data) {
                if (data == lowVol) {
                    console.info('AudioFrameworkTest: Media getVolume Promise: PASS :' + data);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Media getVolume Promise: FAIL :' + data);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_002
                * @tc.name      : setVolume - Media - Promise - MAX Volume
                * @tc.desc      : Setvol to 15
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_002', 0, async function (done) {
        const promise = audioManager.setVolume(audioMedia, maxVol);
        promise.then(function () {
            console.info('AudioFrameworkTest: Media setVolume promise: successful');
            audioManager.getVolume(audioMedia).then(function (data) {
                if (data == maxVol) {
                    console.info('AudioFrameworkTest: Media getVolume Promise: PASS :' + data);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Media getVolume Promise: FAIL :' + data);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_003
                * @tc.name      : setVolume - Media - Promise - Mute Volume
                * @tc.desc      : Setvol to 0
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_003', 0, async function (done) {
        const promise = audioManager.setVolume(audioMedia, minVol);
        promise.then(function () {
            console.info('AudioFrameworkTest: Media setVolume promise: successful');

            audioManager.getVolume(audioMedia).then(function (data) {
                if (data == minVol) {
                    console.info('AudioFrameworkTest: Media getVolume Promise: PASS :' + data);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Media getVolume Promise: FAIL :' + data);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_004
                * @tc.name      : setVolume - Media - Promise - Out of range Volume
                * @tc.desc      : Setvol to 28 (More than 15)
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_004', 0, async function (done) {
        console.info('AudioFrameworkTest: Media setVolume Promise:Out of range: Setvol 100');
        await audioManager.setVolume(audioMedia, outOfRangeVol).then(() => {
            console.info('AudioFrameworkTest: Media setVolume Promise:Out of range: FAIL');
            expect(false).assertTrue();
        }).catch((err) => {
            console.info('AudioFrameworkTest: Media setVolume Promise:Out of range: PASS :' + err.message);
            expect(true).assertTrue();
        });
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_005
                * @tc.name      : setVolume - Media - Callback
                * @tc.desc      : Setvol to 14
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_005', 0, async function (done) {
        audioManager.setVolume(audioMedia, highVol, (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: failed to set volume: Callback:  ${err.message}`);
                expect(false).assertTrue();
            }
            else {
                console.info(`AudioFrameworkTest: callback :  Media setVolume successful `);
                audioManager.getVolume(audioMedia, (err, value) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: callback : Media: failed to get volume ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (value == highVol) {
                        console.info('AudioFrameworkTest: callback : Media getVolume: PASS :' + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info('AudioFrameworkTest: callback : Media getVolume: FAIL :' + value);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_006
                * @tc.name      : setVolume - Media - Callback - MAX Volume
                * @tc.desc      : Setvol to 15
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_006', 0, async function (done) {
        audioManager.setVolume(audioMedia, maxVol, (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: failed to set volume: Callback:  ${err.message}`);
                expect(false).assertTrue();
            }
            else {
                console.info(`AudioFrameworkTest: callback :  Media setVolume successful `);
                audioManager.getVolume(audioMedia, (err, value) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: callback : Media: failed to get volume ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (value == maxVol) {
                        console.info('AudioFrameworkTest: callback : Media getVolume: PASS :' + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info('AudioFrameworkTest: callback : Media getVolume: FAIL :' + value);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_007
                * @tc.name      : setVolume - Media - Callback - Mute Volume
                * @tc.desc      : Setvol to 0
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_007', 0, async function (done) {
        audioManager.setVolume(audioMedia, minVol, (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: failed to set volume: Callback:  ${err.message}`);
                expect(false).assertTrue();
            }
            else {
                console.info(`AudioFrameworkTest: callback :  Media setVolume successful `);
                audioManager.getVolume(audioMedia, (err, value) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: callback : Media: failed to get volume ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (value == minVol) {
                        console.info('AudioFrameworkTest: callback : Media getVolume: PASS :' + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info('AudioFrameworkTest: callback : Media getVolume: FAIL :' + value);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_008
                * @tc.name      : setVolume - Media - Callback - Out of range Volume
                * @tc.desc      : Setvol to 20
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_008', 0, async function (done) {
        audioManager.setVolume(audioMedia, outOfRangeVol, (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: setVolume: Out of range: Callback: PASS:  ${err.message}`);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: setVolume: callback : Media Out of range: FAIL');
                expect(false).assertTrue();
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_009
                * @tc.name      : setVolume - Ringtone - Promise
                * @tc.desc      : Setvol to 5
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_009', 0, async function (done) {
        const promise = audioManager.setVolume(audioRingtone, lowVol);
        promise.then(function () {
            console.info('AudioFrameworkTest: Ringtone setVolume promise: successful');
            audioManager.getVolume(audioRingtone).then(function (data) {
                if (data == lowVol) {
                    console.info('AudioFrameworkTest: Ringtone getVolume Promise: PASS :' + data);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Ringtone getVolume Promise: FAIL :' + data);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_010
                * @tc.name      : setVolume - Ringtone - Promise - MAX Volume
                * @tc.desc      : Setvol to 15
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_010', 0, async function (done) {
        const promise = audioManager.setVolume(audioRingtone, maxVol);
        promise.then(function () {
            console.info('AudioFrameworkTest: Ringtone setVolume promise: successful');
            audioManager.getVolume(audioRingtone).then(function (data) {
                if (data == maxVol) {
                    console.info('AudioFrameworkTest: Ringtone getVolume Promise: PASS :' + data);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Ringtone getVolume Promise: FAIL :' + data);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_011
                * @tc.name      : setVolume - Ringtone - Promise - Mute Volume
                * @tc.desc      : Setvol to 0
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_011', 0, async function (done) {
        const promise = audioManager.setVolume(audioRingtone, minVol);
        promise.then(function () {
            console.info('AudioFrameworkTest: Ringtone setVolume promise: successful');
            audioManager.getVolume(audioRingtone).then(function (data) {
                if (data == minVol) {
                    console.info('AudioFrameworkTest: Ringtone getVolume Promise: PASS :' + data);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Ringtone getVolume Promise: FAIL :' + data);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_012
                * @tc.name      : setVolume - Ringtone - Promise - Out of range Volume
                * @tc.desc      : Setvol to 30
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_012', 0, async function (done) {
        console.info('AudioFrameworkTest: Ringtone setVolume Promise: Out of range: Setvol 30');
        await audioManager.setVolume(audioRingtone, outOfRangeVol).then(() => {
            console.info('AudioFrameworkTest: Ringtone setVolume Promise:Out of range: FAIL');
            expect(false).assertTrue();
        }).catch((err) => {
            console.info('AudioFrameworkTest: Ringtone setVolume Promise:Out of range: PASS :' + (err.message));
            expect(true).assertTrue();
        });
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_013
                * @tc.name      : setVolume - Ringtone - Callback
                * @tc.desc      : Setvol to 7
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_013', 0, async function (done) {
        audioManager.setVolume(audioRingtone, highVol, (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: failed to set volume: Callback:  ${err.message}`);
                expect(false).assertTrue();
            }
            else {
                console.info(`AudioFrameworkTest: callback :  Ringtone setVolume successful `);
                audioManager.getVolume(audioRingtone, (err, value) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: callback : Ringtone: failed to get volume ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (value == highVol) {
                        console.info('AudioFrameworkTest: callback : Ringtone getVolume: PASS :' + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info('AudioFrameworkTest: callback : Ringtone getVolume: FAIL :' + value);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_014
                * @tc.name      : setVolume - Ringtone - Callback - MAX Volume
                * @tc.desc      : Setvol to 15
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_014', 0, async function (done) {
        audioManager.setVolume(audioRingtone, maxVol, (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: failed to set volume: Callback:  ${err.message}`);
                expect(false).assertTrue();
            }

            else {
                console.info(`AudioFrameworkTest: callback :  Ringtone setVolume successful `);
                audioManager.getVolume(audioRingtone, (err, value) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: callback : Ringtone: failed to get volume ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (value == maxVol) {
                        console.info('AudioFrameworkTest: callback : Ringtone getVolume: PASS :' + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info('AudioFrameworkTest: callback : Ringtone getVolume: FAIL :' + value);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_015
                * @tc.name      : setVolume - Ringtone - Callback - Mute Volume
                * @tc.desc      : Setvol to 0
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_015', 0, async function (done) {
        audioManager.setVolume(audioRingtone, minVol, (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: failed to set volume: Callback:  ${err.message}`);
                expect(false).assertTrue();
            }
            else {
                console.info(`AudioFrameworkTest: callback :  Ringtone setVolume successful `);
                audioManager.getVolume(audioRingtone, (err, value) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: callback : Ringtone: failed to get volume ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (value == minVol) {
                        console.info('AudioFrameworkTest: callback : Ringtone getVolume: PASS :' + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info('AudioFrameworkTest: callback : Ringtone getVolume: FAIL :' + value);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_016
                * @tc.name      : setVolume - Ringtone - Callback - Out of range Volume
                * @tc.desc      : Setvol to 28 (more than max volume 15)
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_016', 0, async function (done) {
        audioManager.setVolume(audioRingtone, outOfRangeVol, (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: Out of range Volume: Callback:  ${err.message}`);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: Out of range Volume: callback : Ringtone set volume: FAIL');
                expect(false).assertTrue();
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_017
                * @tc.name      : setVolume - Media - Promise - Negative Value
                * @tc.desc      : Setvol to -1
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_017', 0, async function (done) {
        console.info('AudioFrameworkTest: Media setVolume promise: Negative Value -1');
        await audioManager.setVolume(audioMedia, -1).then(() => {
            // Setting negative audio volume for error Scenario
            console.info('AudioFrameworkTest: Media setVolume Promise:Negative: FAIL');
            expect(false).assertTrue();
        }).catch((err) => {
            console.info('AudioFrameworkTest: Media setVolume Promise:Negative: PASS : ' + (err.message));
            expect(true).assertTrue();
        });
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_018
                * @tc.name      : setVolume - Media - Callback - Negative Value
                * @tc.desc      : Setvol to -1
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_018', 0, async function (done) {
        audioManager.setVolume(audioMedia, -1, (err) => {
            // Setting negative audio volume for error Scenario
            if (err) {
                console.error(`AudioFrameworkTest: setVolume Callback: Negative: PASS: ${err.message}`);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: setVolume callback : Media Negative: FAIL');
                expect(false).assertTrue();
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_019
                * @tc.name      : setVolume - Ringtone - Promise - Negative Value
                * @tc.desc      : Setvol to -1
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_019', 0, async function (done) {
        console.info('AudioFrameworkTest: Ringtone setVolume promise: Negative');
        await audioManager.setVolume(audioRingtone, -1).then(() => {
            // Setting negative audio volume for error Scenario
            console.info('AudioFrameworkTest: Ringtone setVolume Promise:Negative: FAIL');
            expect(false).assertTrue();
        }).catch((err) => {
            console.info('AudioFrameworkTest: Ringtone setVolume Promise:Negative: PASS :' + (err.message));
            expect(true).assertTrue();
        });
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_020
                * @tc.name      : setVolume - Ringtone - Callback - Negative Value
                * @tc.desc      : Setvol to -1
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_020', 0, async function (done) {
        audioManager.setVolume(audioRingtone, -1, (err) => {
            // Setting negative audio volume for error Scenario
            if (err) {
                console.error(`AudioFrameworkTest:Ringtone setVolume Callback:Negative: PASS : ${err.message}`);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: setVolume: Negative: callback : Ringtone set volume: FAIL');
                expect(false).assertTrue();
            }
            done();
        });
    })

    /* *
            * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_021
            * @tc.name      : setVolume - Media - Promise - ENAME
            * @tc.desc      : Setvol to 5
            * @tc.size      : MEDIUM
            * @tc.type      : Function
            * @tc.level     : Level 0
        */
    it('SUB_AUDIO_MANAGER_SetVolume_021', 0, async function (done) {
        const promise = audioManager.setVolume(audio.AudioVolumeType.MEDIA, lowVol);
        promise.then(function () {
            audioManager.getVolume(audio.AudioVolumeType.MEDIA).then(function (data) {
                if (data == lowVol) {
                    console.info('AudioFrameworkTest: Media getVolume Promise: ENAME : PASS :' + data);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Media getVolume Promise: ENAME : FAIL :' + data);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_022
                * @tc.name      : setVolume - Media - Callback - ENAME
                * @tc.desc      : Setvol to 14
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_022', 0, async function (done) {
        audioManager.setVolume(audio.AudioVolumeType.MEDIA, highVol, (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: failed to set volume: Callback: ENAME :  ${err.message}`);
                expect(false).assertTrue();
            }
            else {
                console.info(`AudioFrameworkTest: callback : ENAME :  Media setVolume successful `);
                audioManager.getVolume(audio.AudioVolumeType.MEDIA, (err, value) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: callback : Media: ENAME : Error ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (value == highVol) {
                        console.info('AudioFrameworkTest: callback : Media getVolume: ENAME : PASS :' + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info('AudioFrameworkTest: callback : Media getVolume: ENAME : FAIL :' + value);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_023
                * @tc.name      : setVolume - Ringtone - Promise - ENAME
                * @tc.desc      : Setvol to 14
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_023', 0, async function (done) {
        const promise = audioManager.setVolume(audio.AudioVolumeType.RINGTONE, highVol);
        promise.then(function () {
            console.info('AudioFrameworkTest: Ringtone setVolume promise: ENAME: successful');
            audioManager.getVolume(audio.AudioVolumeType.RINGTONE).then(function (data) {
                if (data == highVol) {
                    console.info('AudioFrameworkTest: Ringtone getVolume Promise: ENAME: PASS :' + data);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Ringtone getVolume Promise: ENAME: FAIL :' + data);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_024
                * @tc.name      : setVolume - Ringtone - Callback - ENAME
                * @tc.desc      : Setvol to 5
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_024', 0, async function (done) {
        audioManager.setVolume(audio.AudioVolumeType.RINGTONE, lowVol, (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: failed to set volume: Callback: ENAME:  ${err.message}`);
                expect(false).assertTrue();
            }
            else {
                console.info(`AudioFrameworkTest: callback : ENAME:  Ringtone setVolume successful `);
                audioManager.getVolume(audio.AudioVolumeType.RINGTONE, (err, value) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: callback : Ringtone: ENAME: failed to get volume ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (value == lowVol) {
                        console.info('AudioFrameworkTest: callback : Ringtone getVolume: ENAME: PASS :' + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info('AudioFrameworkTest: callback : Ringtone getVolume: ENAME: FAIL :' + value);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
            * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_025
            * @tc.name      : setVolume - Media - Promise - Change Ringtone vol
            * @tc.desc      : Setvol to 5
            * @tc.size      : MEDIUM
            * @tc.type      : Function
            * @tc.level     : Level 0
        */
    it('SUB_AUDIO_MANAGER_SetVolume_025', 0, async function (done) {
        const promise = audioManager.setVolume(audio.AudioVolumeType.MEDIA, lowVol);
        promise.then(function () {
            audioManager.setVolume(audio.AudioVolumeType.RINGTONE, maxVol);
            audioManager.getVolume(audio.AudioVolumeType.MEDIA).then(function (data) {
                if (data == lowVol) {
                    console.info('AudioFrameworkTest: Media getVolume Promise: ENAME : PASS :' + data);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Media getVolume Promise: ENAME : FAIL :' + data);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_026
                * @tc.name      : setVolume - Media - Callback - Change Ringtone vol
                * @tc.desc      : Setvol to 14
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_026', 0, async function (done) {
        audioManager.setVolume(audio.AudioVolumeType.MEDIA, highVol, (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: failed to set volume: Callback: ENAME :  ${err.message}`);
                expect(false).assertTrue();
            }
            else {
                console.info(`AudioFrameworkTest: callback : ENAME :  Media setVolume successful `);
                audioManager.setVolume(audio.AudioVolumeType.RINGTONE, lowVol);
                audioManager.getVolume(audio.AudioVolumeType.MEDIA, (err, value) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: callback : Media: ENAME : Error: ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (value == highVol) {
                        console.info('AudioFrameworkTest: callback : Media getVolume: ENAME : PASS :' + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info('AudioFrameworkTest: callback : Media getVolume: ENAME : FAIL :' + value);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_027
                * @tc.name      : setVolume - Ringtone - Promise - Change Media vol
                * @tc.desc      : Setvol to 14
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_027', 0, async function (done) {
        const promise = audioManager.setVolume(audio.AudioVolumeType.RINGTONE, highVol);
        promise.then(function () {
            console.info('AudioFrameworkTest: Ringtone setVolume promise: ENAME: successful');
            audioManager.setVolume(audio.AudioVolumeType.MEDIA, lowVol);
            audioManager.getVolume(audio.AudioVolumeType.RINGTONE).then(function (data) {
                if (data == highVol) {
                    console.info('AudioFrameworkTest: Ringtone getVolume Promise: ENAME: PASS :' + data);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Ringtone getVolume Promise: ENAME: FAIL :' + data);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_SetVolume_028
                * @tc.name      : setVolume - Ringtone - Callback - Change Media vol
                * @tc.desc      : Setvol to 5
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_SetVolume_028', 0, async function (done) {
        audioManager.setVolume(audio.AudioVolumeType.RINGTONE, lowVol, (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: failed to set volume: Callback: ENAME:  ${err.message}`);
                expect(false).assertTrue();
            }
            else {
                console.info(`AudioFrameworkTest: callback : ENAME:  Ringtone setVolume successful `);
                audioManager.setVolume(audio.AudioVolumeType.MEDIA, highVol);
                audioManager.getVolume(audio.AudioVolumeType.RINGTONE, (err, value) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: callback : Ringtone: ENAME: failed to get volume ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (value == lowVol) {
                        console.info('AudioFrameworkTest: callback : Ringtone getVolume: ENAME: PASS :' + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info('AudioFrameworkTest: callback : Ringtone getVolume: ENAME: FAIL :' + value);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getMaxVolume_001
                * @tc.name      : getMaxVolume - Media - Promise
                * @tc.desc      : getMaxVolume for Media
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getMaxVolume_001', 0, async function (done) {
        const promise = audioManager.getMaxVolume(audioMedia);
        promise.then(function (data) {
            if (data == maxVol) {
                console.info('AudioFrameworkTest: Media getMaxVolume promise : PASS:' + data);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: Media getMaxVolume promise : FAIL: ' + data);
                expect(false).assertTrue();
            }
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getMaxVolume_002
                * @tc.name      : getMaxVolume - Media - Callback
                * @tc.desc      : getMaxVolume for Media
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getMaxVolume_002', 0, async function (done) {
        audioManager.getMaxVolume(audioMedia, (err, value) => {
            if (err) {
                console.error(`AudioFrameworkTest: callback : Media : failed to getMaxVolume ${err.message}`);
                expect(false).assertTrue();
            }
            else if (value == maxVol) {
                console.info('AudioFrameworkTest: callback : Media:  getMaxVolume : PASS:' + value);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: callback : Media:  getMaxVolume : FAIL: ' + value);
                expect(false).assertTrue();
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getMaxVolume_003
                * @tc.name      : getMaxVolume - Ringtone - Promise
                * @tc.desc      : getMaxVolume for Ringtone
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getMaxVolume_003', 0, async function (done) {
        const promise = audioManager.getMaxVolume(audioRingtone);
        promise.then(function (data) {
            if (data == maxVol) {
                console.info('AudioFrameworkTest: Ringtone getMaxVolume promise : PASS:' + data);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: Ringtone getMaxVolume promise : FAIL: ' + data);
                expect(false).assertTrue();
            }
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getMaxVolume_004
                * @tc.name      : getMaxVolume - Ringtone - Callback
                * @tc.desc      : getMaxVolume for Ringtone
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getMaxVolume_004', 0, async function (done) {
        audioManager.getMaxVolume(audioRingtone, (err, value) => {
            if (err) {
                console.error(`AudioFrameworkTest: callback : Ringtone : failed to getMaxVolume ${err.message}`);
                expect(false).assertTrue();
            }
            else if (value == maxVol) {
                console.info('AudioFrameworkTest: callback : Ringtone:  getMaxVolume : PASS:' + value);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: callback : Ringtone:  getMaxVolume : FAIL: ' + value);
                expect(false).assertTrue();
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getMaxVolume_005
                * @tc.name      : getMaxVolume - Media - Promise - Change Ringtone Volume and check
                * @tc.desc      : getMaxVolume for Media
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getMaxVolume_005', 0, async function (done) {
        audioManager.setVolume(audioRingtone, lowVol);
        const promise = audioManager.getMaxVolume(audioMedia);
        promise.then(function (data) {
            if (data == maxVol) {
                console.info('AudioFrameworkTest: Media getMaxVolume promise : PASS:' + data);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: Media getMaxVolume promise : FAIL: ' + data);
                expect(false).assertTrue();
            }
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getMaxVolume_006
                * @tc.name      : getMaxVolume - Ringtone - Promise - Change Media Volume and check
                * @tc.desc      : getMaxVolume for Media
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getMaxVolume_006', 0, async function (done) {
        audioManager.setVolume(audioMedia, lowVol);
        const promise = audioManager.getMaxVolume(audioRingtone);
        promise.then(function (data) {
            if (data == maxVol) {
                console.info('AudioFrameworkTest: Ringtone getMaxVolume promise : PASS:' + data);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: Ringtone getMaxVolume promise : FAIL: ' + data);
                expect(false).assertTrue();
            }

        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getMaxVolume_007
                * @tc.name      : getMaxVolume - Media - Callback- Change Ringtone Volume and check
                * @tc.desc      : getMaxVolume for Media
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getMaxVolume_007', 0, async function (done) {
        audioManager.setVolume(audioRingtone, lowVol);
        audioManager.getMaxVolume(audioMedia, (err, value) => {
            if (err) {
                console.error(`AudioFrameworkTest: callback : Media : failed to getMaxVolume ${err.message}`);
                expect(false).assertTrue();

            }
            else if (value == maxVol) {
                console.info('AudioFrameworkTest: callback : Media:  getMaxVolume : PASS:' + value);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: callback : Media:  getMaxVolume : FAIL: ' + value);
                expect(false).assertTrue();
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getMaxVolume_008
                * @tc.name      : getMaxVolume - Ringtone - Callback - Callback- Change media Volume and check
                * @tc.desc      : getMaxVolume for Ringtone
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getMaxVolume_008', 0, async function (done) {
        audioManager.setVolume(audioMedia, lowVol);
        audioManager.getMaxVolume(audioRingtone, (err, value) => {
            if (err) {
                console.error(`AudioFrameworkTest: callback : Ringtone : failed to getMaxVolume ${err.message}`);
                expect(false).assertTrue();
            }
            else if (value == maxVol) {
                console.info('AudioFrameworkTest: callback : Ringtone:  getMaxVolume : PASS:' + value);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: callback : Ringtone:  getMaxVolume : FAIL: ' + value);
                expect(false).assertTrue();
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getMaxVolume_009
                * @tc.name      : getMaxVolume - Media - Promise - Change media Volume and check
                * @tc.desc      : getMaxVolume for Media
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getMaxVolume_009', 0, async function (done) {
        audioManager.setVolume(audioMedia, lowVol);
        const promise = audioManager.getMaxVolume(audioMedia);
        promise.then(function (data) {
            if (data == maxVol) {
                console.info('AudioFrameworkTest: Media getMaxVolume promise : PASS:' + data);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: Media getMaxVolume promise : FAIL: ' + data);
                expect(false).assertTrue();
            }
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getMaxVolume_010
                * @tc.name      : getMaxVolume - Ringtone - Promise - Change Ringtone Volume and check
                * @tc.desc      : getMaxVolume for Media
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getMaxVolume_010', 0, async function (done) {
        audioManager.setVolume(audioRingtone, lowVol);
        const promise = audioManager.getMaxVolume(audioRingtone);
        promise.then(function (data) {
            if (data == maxVol) {
                console.info('AudioFrameworkTest: Ringtone getMaxVolume promise : PASS:' + data);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: Ringtone getMaxVolume promise : FAIL: ' + data);
                expect(false).assertTrue();
            }
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getMaxVolume_011
                * @tc.name      : getMaxVolume - Media - Callback- Change media Volume and check
                * @tc.desc      : getMaxVolume for Media
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getMaxVolume_011', 0, async function (done) {
        audioManager.setVolume(audioMedia, highVol);
        audioManager.getMaxVolume(audioMedia, (err, value) => {
            if (err) {
                console.error(`AudioFrameworkTest: callback : Media : failed to getMaxVolume ${err.message}`);
                expect(false).assertTrue();
            }
            else if (value == maxVol) {
                console.info('AudioFrameworkTest: callback : Media:  getMaxVolume : PASS:' + value);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: callback : Media:  getMaxVolume : FAIL: ' + value);
                expect(false).assertTrue();
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getMaxVolume_012
                * @tc.name      : getMaxVolume - Ringtone - Callback - Callback- Change ringtone Volume and check
                * @tc.desc      : getMaxVolume for Ringtone
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getMaxVolume_012', 0, async function (done) {
        audioManager.setVolume(audioRingtone, highVol);
        audioManager.getMaxVolume(audioRingtone, (err, value) => {
            if (err) {
                console.error(`AudioFrameworkTest: callback : Ringtone : failed to getMaxVolume ${err.message}`);
                expect(false).assertTrue();
            }
            else if (value == maxVol) {
                console.info('AudioFrameworkTest: callback : Ringtone:  getMaxVolume : PASS:' + value);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: callback : Ringtone:  getMaxVolume : FAIL: ' + value);
                expect(false).assertTrue();
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getMinVolume_001
                * @tc.name      : getMinVolume - Media - Promise
                * @tc.desc      : getMinVolume for Media
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getMinVolume_001', 0, async function (done) {
        const promise = audioManager.getMinVolume(audioMedia);
        promise.then(function (data) {
            if (data == minVol) {
                console.info('AudioFrameworkTest: Media getMinVolume promise : PASS:' + data);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: Media getMinVolume promise : FAIL: ' + data);
                expect(false).assertTrue();
            }
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getMinVolume_002
                * @tc.name      : getMinVolume - Media - Callback
                * @tc.desc      : getMinVolume for Media
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getMinVolume_002', 0, async function (done) {
        audioManager.getMinVolume(audioMedia, (err, value) => {
            if (err) {
                console.error(`AudioFrameworkTest: callback : Media : failed to getMinVolume ${err.message}`);
                expect().assertFail();
            }
            else if (value == minVol) {
                console.info('AudioFrameworkTest: callback : Media:  getMinVolume : PASS:' + value);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: callback : Media:  getMinVolume : FAIL: ' + value);
                expect(false).assertTrue();
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getMinVolume_003
                * @tc.name      : getMinVolume - Ringtone - Promise
                * @tc.desc      : getMinVolume for Ringtone
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getMinVolume_003', 0, async function (done) {
        const promise = audioManager.getMinVolume(audioRingtone);
        promise.then(function (data) {
            if (data == minVol) {
                console.info('AudioFrameworkTest: Ringtone getMinVolume promise : PASS:' + data);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: Ringtone getMinVolume promise : FAIL: ' + data);
                expect(false).assertTrue();
            }

        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getMinVolume_004
                * @tc.name      : getMinVolume - Ringtone - Callback
                * @tc.desc      : getMinVolume for Ringtone
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getMinVolume_004', 0, async function (done) {
        audioManager.getMinVolume(audioRingtone, (err, value) => {
            if (err) {
                console.error(`AudioFrameworkTest: callback : Ringtone : failed to getMinVolume ${err.message}`);
                expect().assertFail();
            }
            else if (value == minVol) {
                console.info('AudioFrameworkTest: callback : Ringtone:  getMinVolume : PASS:' + value);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: callback : Ringtone:  getMinVolume : FAIL: ' + value);
                expect(false).assertTrue();
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getMinVolume_005
                * @tc.name      : getMinVolume - Media - Promise - Change Ringtone Volume and check
                * @tc.desc      : getMinVolume for Media
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getMinVolume_005', 0, async function (done) {
        audioManager.setVolume(audioRingtone, lowVol);
        const promise = audioManager.getMinVolume(audioMedia);
        promise.then(function (data) {
            if (data == minVol) {
                console.info('AudioFrameworkTest: Media getMinVolume promise : PASS:' + data);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: Media getMinVolume promise : FAIL: ' + data);
                expect(false).assertTrue();
            }
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getMinVolume_006
                * @tc.name      : getMinVolume - Media - Callback - Change Ringtone Volume and check
                * @tc.desc      : getMinVolume for Media
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getMinVolume_006', 0, async function (done) {
        audioManager.setVolume(audioRingtone, lowVol);
        audioManager.getMinVolume(audioMedia, (err, value) => {
            if (err) {
                console.error(`AudioFrameworkTest: callback : Media : failed to getMinVolume ${err.message}`);
                expect().assertFail();
            }
            else if (value == minVol) {
                console.info('AudioFrameworkTest: callback : Media:  getMinVolume : PASS:' + value);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: callback : Media:  getMinVolume : FAIL: ' + value);
                expect(false).assertTrue();
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getMinVolume_007
                * @tc.name      : getMinVolume - Ringtone - Promise - Change Media Volume and check
                * @tc.desc      : getMinVolume for Ringtone
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getMinVolume_007', 0, async function (done) {
        audioManager.setVolume(audioMedia, highVol);
        const promise = audioManager.getMinVolume(audioRingtone);
        promise.then(function (data) {
            if (data == minVol) {
                console.info('AudioFrameworkTest: Ringtone getMinVolume promise : PASS:' + data);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: Ringtone getMinVolume promise : FAIL: ' + data);
                expect(false).assertTrue();
            }
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getMinVolume_008
                * @tc.name      : getMinVolume - Ringtone - Callback - Change Media Volume and check
                * @tc.desc      : getMinVolume for Ringtone
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getMinVolume_008', 0, async function (done) {
        audioManager.setVolume(audioMedia, lowVol);
        audioManager.getMinVolume(audioRingtone, (err, value) => {
            if (err) {
                console.error(`AudioFrameworkTest: callback : Ringtone : failed to getMinVolume ${err.message}`);
                expect().assertFail();
            }
            else if (value == minVol) {
                console.info('AudioFrameworkTest: callback : Ringtone:  getMinVolume : PASS:' + value);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: callback : Ringtone:  getMinVolume : FAIL: ' + value);
                expect(false).assertTrue();
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getMinVolume_009
                * @tc.name      : getMinVolume - Media - Promise - Change Media Volume and check
                * @tc.desc      : getMinVolume for Media
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getMinVolume_009', 0, async function (done) {
        audioManager.setVolume(audioMedia, lowVol);
        const promise = audioManager.getMinVolume(audioMedia);
        promise.then(function (data) {
            if (data == minVol) {
                console.info('AudioFrameworkTest: Media getMinVolume promise : PASS:' + data);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: Media getMinVolume promise : FAIL: ' + data);
                expect(false).assertTrue();
            }
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getMinVolume_010
                * @tc.name      : getMinVolume - Media - Callback - Change Media Volume and check
                * @tc.desc      : getMinVolume for Media
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getMinVolume_010', 0, async function (done) {
        audioManager.setVolume(audioMedia, highVol);
        audioManager.getMinVolume(audioMedia, (err, value) => {
            if (err) {
                console.error(`AudioFrameworkTest: callback : Media : failed to getMinVolume ${err.message}`);
                expect().assertFail();
            }
            else if (value == minVol) {
                console.info('AudioFrameworkTest: callback : Media:  getMinVolume : PASS:' + value);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: callback : Media:  getMinVolume : FAIL: ' + value);
                expect(false).assertTrue();
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getMinVolume_011
                * @tc.name      : getMinVolume - Ringtone - Promise - Change Ringtone Volume and check
                * @tc.desc      : getMinVolume for Ringtone
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getMinVolume_011', 0, async function (done) {
        audioManager.setVolume(audioRingtone, lowVol);
        const promise = audioManager.getMinVolume(audioRingtone)
        promise.then(function (data) {
            if (data == minVol) {
                console.info('AudioFrameworkTest: Ringtone getMinVolume promise : PASS:' + data);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: Ringtone getMinVolume promise : FAIL: ' + data);
                expect(false).assertTrue();
            }
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getMinVolume_012
                * @tc.name      : getMinVolume - Ringtone - Callback - Change Ringtone Volume and check
                * @tc.desc      : getMinVolume for Ringtone
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getMinVolume_012', 0, async function (done) {
        audioManager.setVolume(audioRingtone, lowVol);
        audioManager.getMinVolume(audioRingtone, (err, value) => {
            if (err) {
                console.error(`AudioFrameworkTest: callback : Ringtone : failed to getMinVolume ${err.message}`);
                expect().assertFail();
            }
            else if (value == minVol) {
                console.info('AudioFrameworkTest: callback : Ringtone:  getMinVolume : PASS:' + value);
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: callback : Ringtone:  getMinVolume : FAIL: ' + value);
                expect(false).assertTrue();
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getDevices_001
                * @tc.name      : getDevices - Output device - Promise
                * @tc.desc      : getDevices - Output device
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getDevices_001', 0, async function (done) {
        dRValue = null;
        dTValue = null;
        devId = null;
        devName = null;
        devAddr = null;
        sRate = null;
        cCount = null;
        cMask = null;
        const promise = audioManager.getDevices(1);
        // Getting all Output devices Enumb 1 = OUTPUT_DEVICES_FLAG
        promise.then(function (value) {
            console.info('AudioFrameworkTest: Promise: getDevices OUTPUT_DEVICES_FLAG');
            value.forEach(displayDeviceProp);
            if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
                console.info('AudioFrameworkTest: Promise: getDevices : OUTPUT_DEVICES_FLAG :  PASS');
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: Promise: getDevices : OUTPUT_DEVICES_FLAG :  FAIL');
                expect(false).assertTrue();
            }
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getDevices_002
                * @tc.name      : getDevices - Input device - Promise
                * @tc.desc      : getDevices - Input device
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getDevices_002', 0, async function (done) {
        dRValue = null;
        dTValue = null;
        devId = null;
        devName = null;
        devAddr = null;
        sRate = null;
        cCount = null;
        cMask = null;
        const promise = audioManager.getDevices(2);
        // Getting all Input Devices ENUM 2 = INPUT_DEVICES_FLAG
        promise.then(function (value) {
            console.info('AudioFrameworkTest: Promise: getDevices INPUT_DEVICES_FLAG');
            value.forEach(displayDeviceProp);

            if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
                console.info('AudioFrameworkTest: Promise: getDevices : INPUT_DEVICES_FLAG :  PASS');
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: Promise: getDevices : INPUT_DEVICES_FLAG :  FAIL');
                expect(false).assertTrue();
            }
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getDevices_003
                * @tc.name      : getDevices - ALL device - Promise
                * @tc.desc      : getDevices - ALL device
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getDevices_003', 0, async function (done) {
        dRValue = null;
        dTValue = null;
        devId = null;
        devName = null;
        devAddr = null;
        sRate = null;
        cCount = null;
        cMask = null;
        const promise = audioManager.getDevices(3);
        // Getting all devies connected 3 = ALL_DEVICES_FLAG
        promise.then(function (value) {

            console.info('AudioFrameworkTest: Promise: getDevices ALL_DEVICES_FLAG');
            value.forEach(displayDeviceProp);

            if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
                console.info('AudioFrameworkTest: Promise: getDevices : ALL_DEVICES_FLAG :  PASS');
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: Promise: getDevices : ALL_DEVICES_FLAG :  FAIL');
                expect(false).assertTrue();
            }
        });
        await promise;
        done();
    })
    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getDevices_004
                * @tc.name      : getDevices - Output device - Callback
                * @tc.desc      : getDevices - Output device
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getDevices_004', 0, async function (done) {
        dRValue = null;
        dTValue = null;
        devId = null;
        devName = null;
        devAddr = null;
        sRate = null;
        cCount = null;
        cMask = null;
        audioManager.getDevices(1, (err, value) => {
            // Getting all Output devices Enumb 1 = OUTPUT_DEVICES_FLAG
            console.info('AudioFrameworkTest: Callback: getDevices OUTPUT_DEVICES_FLAG');

            if (err) {
                console.error(`AudioFrameworkTest: Callback: OUTPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
                expect().assertFail();
            }
            else {
                console.info('AudioFrameworkTest: Callback: getDevices OUTPUT_DEVICES_FLAG');
                value.forEach(displayDeviceProp);

                if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
                    console.info('AudioFrameworkTest: Callback: getDevices : OUTPUT_DEVICES_FLAG :  PASS');
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Callback: getDevices : OUTPUT_DEVICES_FLAG :  FAIL');
                    expect(false).assertTrue();
                }
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getDevices_005
                * @tc.name      : getDevices - Input device - Callback
                * @tc.desc      : getDevices - Input device
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getDevices_005', 0, async function (done) {
        dRValue = null;
        dTValue = null;
        devId = null;
        devName = null;
        devAddr = null;
        sRate = null;
        cCount = null;
        cMask = null;
        audioManager.getDevices(2, (err, value) => {
            // Getting all Input Devices ENUM 2 = INPUT_DEVICES_FLAG

            console.info('AudioFrameworkTest: Callback: getDevices INPUT_DEVICES_FLAG');

            if (err) {
                console.error(`AudioFrameworkTest: Callback: INPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
                expect().assertFail();
            }
            else {
                console.info('AudioFrameworkTest: Callback: getDevices INPUT_DEVICES_FLAG');
                value.forEach(displayDeviceProp);

                if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
                    console.info('AudioFrameworkTest: Callback: getDevices : INPUT_DEVICES_FLAG:  PASS');
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Callback: getDevices : INPUT_DEVICES_FLAG:  FAIL');
                    expect(false).assertTrue();
                }
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getDevices_006
                * @tc.name      : getDevices - ALL device - Callback
                * @tc.desc      : getDevices - ALL device
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getDevices_006', 0, async function (done) {
        dRValue = null;
        dTValue = null;
        devId = null;
        devName = null;
        devAddr = null;
        sRate = null;
        cCount = null;
        cMask = null;
        audioManager.getDevices(3, (err, value) => {
            // Getting all devies connected 3 = ALL_DEVICES_FLAG

            console.info('AudioFrameworkTest: Callback: getDevices ALL_DEVICES_FLAG');

            if (err) {
                console.error(`AudioFrameworkTest: Callback: ALL_DEVICES_FLAG: failed to get devices ${err.message}`);
                expect().assertFail();
            }
            else {
                console.info('AudioFrameworkTest: Callback: getDevices ALL_DEVICES_FLAG');
                value.forEach(displayDeviceProp);

                if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
                    console.info('AudioFrameworkTest: Callback: getDevices : ALL_DEVICES_FLAG:  PASS');
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Callback: getDevices : ALL_DEVICES_FLAG:  FAIL');
                    expect(false).assertTrue();
                }
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getDevices_007
                * @tc.name      : getDevices - Output device - Promise - ENAME
                * @tc.desc      : getDevices - Output device
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getDevices_007', 0, async function (done) {
        dRValue = null;
        dTValue = null;
        devId = null;
        devName = null;
        devAddr = null;
        sRate = null;
        cCount = null;
        cMask = null;
        const promise = audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG)
        promise.then(function (value) {

            console.info('AudioFrameworkTest: Promise: getDevices OUTPUT_DEVICES_FLAG');
            value.forEach(displayDeviceProp);
            if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
                console.info('AudioFrameworkTest: Promise: getDevices : OUTPUT_DEVICES_FLAG :  PASS');
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: Promise: getDevices : OUTPUT_DEVICES_FLAG :  FAIL');
                expect(false).assertTrue();
            }
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getDevices_008
                * @tc.name      : getDevices - Input device - Promise - ENAME
                * @tc.desc      : getDevices - Input device
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getDevices_008', 0, async function (done) {
        dRValue = null;
        dTValue = null;
        devId = null;
        devName = null;
        devAddr = null;
        sRate = null;
        cCount = null;
        cMask = null;
        const promise = audioManager.getDevices(audio.DeviceFlag.INPUT_DEVICES_FLAG);
        promise.then(function (value) {
            console.info('AudioFrameworkTest: Promise: getDevices INPUT_DEVICES_FLAG');
            value.forEach(displayDeviceProp);

            if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
                console.info('AudioFrameworkTest: Promise: getDevices : INPUT_DEVICES_FLAG :  PASS');
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: Promise: getDevices : INPUT_DEVICES_FLAG :  FAIL');
                expect(false).assertTrue();
            }
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getDevices_009
                * @tc.name      : getDevices - ALL device - Promise - ENAME
                * @tc.desc      : getDevices - ALL device
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getDevices_009', 0, async function (done) {
        dRValue = null;
        dTValue = null;
        devId = null;
        devName = null;
        devAddr = null;
        sRate = null;
        cCount = null;
        cMask = null;
        const promise = audioManager.getDevices(audio.DeviceFlag.ALL_DEVICES_FLAG);
        promise.then(function (value) {
            console.info('AudioFrameworkTest: Promise: getDevices ALL_DEVICES_FLAG');
            value.forEach(displayDeviceProp);

            if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
                console.info('AudioFrameworkTest: Promise: getDevices : ALL_DEVICES_FLAG :  PASS');
                expect(true).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: Promise: getDevices : ALL_DEVICES_FLAG :  FAIL');
                expect(false).assertTrue();
            }
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getDevices_010
                * @tc.name      : getDevices - Output device - Callback - ENAME
                * @tc.desc      : getDevices - Output device
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getDevices_010', 0, async function (done) {
        dRValue = null;
        dTValue = null;
        devId = null;
        devName = null;
        devAddr = null;
        sRate = null;
        cCount = null;
        cMask = null;
        audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG, (err, value) => {
            console.info('AudioFrameworkTest: Callback: getDevices OUTPUT_DEVICES_FLAG');
            if (err) {
                console.error(`AudioFrameworkTest: Callback: OUTPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
                expect().assertFail();
            }
            else {
                console.info('AudioFrameworkTest: Callback: getDevices OUTPUT_DEVICES_FLAG');
                value.forEach(displayDeviceProp);
                if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
                    console.info('AudioFrameworkTest: Callback: getDevices : OUTPUT_DEVICES_FLAG :  PASS');
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Callback: getDevices : OUTPUT_DEVICES_FLAG :  FAIL');
                    expect(false).assertTrue();
                }
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getDevices_011
                * @tc.name      : getDevices - Input device - Callback - ENAME
                * @tc.desc      : getDevices - Input device
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getDevices_011', 0, async function (done) {
        dRValue = null;
        dTValue = null;
        devId = null;
        devName = null;
        devAddr = null;
        sRate = null;
        cCount = null;
        cMask = null;
        audioManager.getDevices(audio.DeviceFlag.INPUT_DEVICES_FLAG, (err, value) => {
            console.info('AudioFrameworkTest: Callback: getDevices INPUT_DEVICES_FLAG');
            if (err) {
                console.error(`AudioFrameworkTest: Callback: INPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
                expect().assertFail();
            }
            else {
                console.info('AudioFrameworkTest: Callback: getDevices INPUT_DEVICES_FLAG');
                value.forEach(displayDeviceProp);

                if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
                    console.info('AudioFrameworkTest: Callback: getDevices : INPUT_DEVICES_FLAG:  PASS');
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Callback: getDevices : INPUT_DEVICES_FLAG:  FAIL');
                    expect(false).assertTrue();
                }
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getDevices_012
                * @tc.name      : getDevices - ALL device - Callback - ENAME
                * @tc.desc      : getDevices - ALL device
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getDevices_012', 0, async function (done) {
        dRValue = null;
        dTValue = null;
        devId = null;
        devName = null;
        devAddr = null;
        sRate = null;
        cCount = null;
        cMask = null;
        audioManager.getDevices(audio.DeviceFlag.ALL_DEVICES_FLAG, (err, value) => {
            console.info('AudioFrameworkTest: Callback: getDevices ALL_DEVICES_FLAG');
            if (err) {
                console.error(`AudioFrameworkTest: Callback: ALL_DEVICES_FLAG: failed to get devices ${err.message}`);
                expect().assertFail();
            }
            else {
                console.info('AudioFrameworkTest: Callback: getDevices ALL_DEVICES_FLAG');
                value.forEach(displayDeviceProp);
                if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
                    console.info('AudioFrameworkTest: Callback: getDevices : ALL_DEVICES_FLAG:  PASS');
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Callback: getDevices : ALL_DEVICES_FLAG:  FAIL');
                    expect(false).assertTrue();
                }
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setRingerMode_001
                * @tc.name      : setRingerMode - Normal Mode - Promise
                * @tc.desc      : setRingerMode - Set Ring more to Normal Mode
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setRingerMode_001', 0, async function (done) {
        const promise = audioManager.setRingerMode(2);
        // Setting Ringtone Mode to Normal ENUM 2 = RINGER_MODE_NORMAL
        promise.then(function () {
            console.info('AudioFrameworkTest: Promise: setRingerMode RINGER_MODE_NORMAL');
            audioManager.getRingerMode().then(function (value) {
                if (value == 2) {
                    console.info('AudioFrameworkTest: Promise: setRingerMode RINGER_MODE_NORMAL: PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Promise: setRingerMode RINGER_MODE_NORMAL: FAIL :' + value);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setRingerMode_002
                * @tc.name      : setRingerMode - Silent Mode - Promise
                * @tc.desc      : setRingerMode - Set Ring more to Silent Mode
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setRingerMode_002', 0, async function (done) {
        const promise = audioManager.setRingerMode(0);
        // Setting Ringtone Mode to Silent ENUM 0 = RINGER_MODE_SILENT
        promise.then(function () {
            console.info('AudioFrameworkTest: Promise: setRingerMode RINGER_MODE_SILENT');
            audioManager.getRingerMode().then(function (value) {
                if (value == 0) {
                    console.info('AudioFrameworkTest: Promise: setRingerMode RINGER_MODE_SILENT: PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Promise: setRingerMode RINGER_MODE_SILENT: FAIL :' + value);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setRingerMode_003
                * @tc.name      : setRingerMode - Vibration Mode - Promise
                * @tc.desc      : setRingerMode - Set Ring more to Vibration Mode
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setRingerMode_003', 0, async function (done) {
        const promise = audioManager.setRingerMode(1);
        // Setting Ringtone Mode to Vibration ENUM 1 = RINGER_MODE_VIBRATE
        promise.then(function () {
            console.info('AudioFrameworkTest: Promise: setRingerMode RINGER_MODE_VIBRATE');
            audioManager.getRingerMode().then(function (value) {
                if (value == 1) {
                    console.info('AudioFrameworkTest: Promise: setRingerMode RINGER_MODE_VIBRATE: PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Promise: setRingerMode RINGER_MODE_VIBRATE: FAIL :' + value);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setRingerMode_004
                * @tc.name      : setRingerMode - Normal Mode - Callback
                * @tc.desc      : setRingerMode - Set Ring more to Normal Mode
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setRingerMode_004', 0, async function (done) {
        audioManager.setRingerMode(2, (err) => {
            // Setting Ringtone Mode to Normal ENUM 2 = RINGER_MODE_NORMAL
            console.info('AudioFrameworkTest: Callback : setRingerMode RINGER_MODE_NORMAL');
            if (err) {
                console.error(`AudioFrameworkTest: Callback : setRingerMode RINGER_MODE_NORMAL: Error: ${err.message}`);
                expect().assertFail();
            }
            else {
                audioManager.getRingerMode((err, value) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: Callback : RINGER_MODE_NORMAL: Error: ${err.message}`);
                        expect().assertFail();
                    }
                    else if (value == 2) {
                        console.info('AudioFrameworkTest: Callback: setRingerMode RINGER_MODE_NORMAL: PASS :' + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info('AudioFrameworkTest: Callback: setRingerMode RINGER_MODE_NORMAL: FAIL :' + value);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setRingerMode_005
                * @tc.name      : setRingerMode - Silent Mode - Callback
                * @tc.desc      : setRingerMode - Set Ring more to Silent Mode
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setRingerMode_005', 0, async function (done) {
        audioManager.setRingerMode(0, (err) => {
            // Setting Ringtone Mode to Silent ENUM 0 = RINGER_MODE_SILENT
            console.info('AudioFrameworkTest: Callback : setRingerMode RINGER_MODE_SILENT');
            if (err) {
                console.error(`AudioFrameworkTest: Callback : setRingerMode RINGER_MODE_SILENT: Error: ${err.message}`);
                expect().assertFail();
            }
            else {
                audioManager.getRingerMode((err, value) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: Callback : RINGER_MODE_SILENT: Error: ${err.message}`);
                        expect().assertFail();
                    }

                    if (value == 0) {
                        console.info('AudioFrameworkTest: Callback: setRingerMode RINGER_MODE_SILENT: PASS :' + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info('AudioFrameworkTest: Callback: setRingerMode RINGER_MODE_SILENT: FAIL :' + value);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setRingerMode_006
                * @tc.name      : setRingerMode - Vibration Mode - Callback
                * @tc.desc      : setRingerMode - Set Ring more to Vibration Mode
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setRingerMode_006', 0, async function (done) {
        audioManager.setRingerMode(1, (err) => {
            // Setting Ringtone Mode to Vibration ENUM 1 = RINGER_MODE_VIBRATE
            console.info('AudioFrameworkTest: Callback : setRingerMode RINGER_MODE_VIBRATE');
            if (err) {
                console.error(`AudioFrameworkTest: Callback : setRingerMode RINGER_MODE_VIBRATE: Error: ${err.message}`);
                expect().assertFail();
            }
            else {
                audioManager.getRingerMode((err, value) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: Callback :  RINGER_MODE_VIBRATE: Error: ${err.message}`);
                        expect().assertFail();
                    }

                    if (value == 1) {
                        console.info('AudioFrameworkTest: Callback: setRingerMode RINGER_MODE_VIBRATE: PASS :' + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info('AudioFrameworkTest: Callback: setRingerMode RINGER_MODE_VIBRATE: FAIL :' + value);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setRingerMode_007
                * @tc.name      : setRingerMode - Normal Mode - Promise - ENAME
                * @tc.desc      : setRingerMode - Set Ring more to Normal Mode
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setRingerMode_007', 0, async function (done) {
        const promise = audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_NORMAL);
        promise.then(function () {
            console.info('AudioFrameworkTest: Promise: setRingerMode RINGER_MODE_NORMAL');
            audioManager.getRingerMode().then(function (value) {
                if (value == audio.AudioRingMode.RINGER_MODE_NORMAL) {
                    console.info('AudioFrameworkTest: Promise: setRingerMode RINGER_MODE_NORMAL: PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Promise: setRingerMode RINGER_MODE_NORMAL: FAIL :' + value);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setRingerMode_008
                * @tc.name      : setRingerMode - Silent Mode - Promise - ENAME
                * @tc.desc      : setRingerMode - Set Ring more to Silent Mode
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setRingerMode_008', 0, async function (done) {
        const promise = audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_SILENT);
        promise.then(function () {
            console.info('AudioFrameworkTest: Promise: setRingerMode RINGER_MODE_SILENT');
            audioManager.getRingerMode().then(function (value) {
                if (value == audio.AudioRingMode.RINGER_MODE_SILENT) {
                    console.info('AudioFrameworkTest: Promise: setRingerMode RINGER_MODE_SILENT: PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Promise: setRingerMode RINGER_MODE_SILENT: FAIL :' + value);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setRingerMode_009
                * @tc.name      : setRingerMode - Vibration Mode - Promise - NAME
                * @tc.desc      : setRingerMode - Set Ring more to Vibration Mode
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setRingerMode_009', 0, async function (done) {
        const promise = audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_VIBRATE);
        promise.then(function () {
            console.info('AudioFrameworkTest: Promise: setRingerMode RINGER_MODE_VIBRATE');
            audioManager.getRingerMode().then(function (value) {
                if (value == audio.AudioRingMode.RINGER_MODE_VIBRATE) {
                    console.info('AudioFrameworkTest: Promise: setRingerMode RINGER_MODE_VIBRATE: PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Promise: setRingerMode RINGER_MODE_VIBRATE: FAIL :' + value);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setRingerMode_010
                * @tc.name      : setRingerMode - Normal Mode - Callback - ENAME
                * @tc.desc      : setRingerMode - Set Ring more to Normal Mode
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setRingerMode_010', 0, async function (done) {
        audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_NORMAL, (err) => {
            console.info('AudioFrameworkTest: Callback : setRingerMode RINGER_MODE_NORMAL');
            if (err) {
                console.error(`AudioFrameworkTest: Callback : setRingerMode RINGER_MODE_NORMAL: Error: ${err.message}`);
                expect().assertFail();
            }
            else {
                audioManager.getRingerMode((err, value) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: Callback : RINGER_MODE_NORMAL: Error: ${err.message}`);
                        expect().assertFail();
                    }
                    else if (value == audio.AudioRingMode.RINGER_MODE_NORMAL) {
                        console.info('AudioFrameworkTest: Callback: setRingerMode RINGER_MODE_NORMAL: PASS :' + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info('AudioFrameworkTest: Callback: setRingerMode RINGER_MODE_NORMAL: FAIL :' + value);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setRingerMode_0011
                * @tc.name      : setRingerMode - Silent Mode - Callback - ENAME
                * @tc.desc      : setRingerMode - Set Ring more to Silent Mode
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setRingerMode_011', 0, async function (done) {
        audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_SILENT, (err) => {
            console.info('AudioFrameworkTest: Callback : setRingerMode RINGER_MODE_SILENT');
            if (err) {
                console.error(`AudioFrameworkTest: Callback : setRingerMode RINGER_MODE_SILENT: Error: ${err.message}`);
                expect().assertFail();
            }
            else {
                audioManager.getRingerMode((err, value) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: Callback : RINGER_MODE_SILENT: Error: ${err.message}`);
                        expect().assertFail();
                    }

                    if (value == audio.AudioRingMode.RINGER_MODE_SILENT) {
                        console.info('AudioFrameworkTest: Callback: setRingerMode RINGER_MODE_SILENT: PASS :' + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info('AudioFrameworkTest: Callback: setRingerMode RINGER_MODE_SILENT: FAIL :' + value);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setRingerMode_012
                * @tc.name      : setRingerMode - Vibration Mode - Callback
                * @tc.desc      : setRingerMode - Set Ring more to Vibration Mode
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setRingerMode_012', 0, async function (done) {
        audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_VIBRATE, (err, value) => {
            console.info('AudioFrameworkTest: Callback : setRingerMode RINGER_MODE_VIBRATE');
            if (err) {
                console.error(`AudioFrameworkTest: Callback : setRingerMode RINGER_MODE_VIBRATE: Error: ${err.message}`);
                expect().assertFail();
            }
            else {
                audioManager.getRingerMode((err, value) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: Callback : RINGER_MODE_VIBRATE: Error: ${err.message}`);
                        expect().assertFail();
                    }

                    if (value == audio.AudioRingMode.RINGER_MODE_VIBRATE) {
                        console.info('AudioFrameworkTest: Callback: setRingerMode RINGER_MODE_VIBRATE: PASS :' + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info('AudioFrameworkTest: Callback: setRingerMode RINGER_MODE_VIBRATE: FAIL :' + value);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                 * @tc.number    : SUB_AUDIO_MANAGER_mute_006
                 * @tc.name      : mute - Media - callback
                 * @tc.desc      : mute - Media - callback - Disable mute
                 * @tc.size      : MEDIUM
                 * @tc.type      : Function
                 * @tc.level     : Level 0
             */
    it('SUB_AUDIO_MANAGER_mute_006', 0, async function (done) {
        await audioManager.setVolume(audioMedia, highVol);
        audioManager.mute(audioMedia, true, (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: Failed to mute the stream. ${err.message}`);
                expect(false).assertTrue();
                done();
            }
            console.log('AudioFrameworkTest: Callback invoked to indicate that the stream is muted.');
            audioManager.mute(audioMedia, false, (err) => {
                if (err) {
                    console.error(`AudioFrameworkTest: Set Stream Mute: Media: Callback: Error :  ${err.message}`);
                    expect(false).assertTrue();
                }
                else {
                    audioManager.getVolume(audioMedia, (err, value) => {
                        if (err) {
                            console.error(`Failed to obtain the volume. ${err.message}`);
                            expect(false).assertTrue();
                        }
                        else if (value == highVol) {
                            console.info("AudioFrameworkTest: value is " + value);
                            expect(true).assertTrue();
                        }
                        else {
                            console.info("AudioFrameworkTest: mute fail");
                            expect(false).assertTrue();
                        }
                    });
                    audioManager.isMute(audioMedia, (err, data) => {
                        if (err) {
                            console.error(`AudioFrameworkTest: Callback : FALSE: Media : failed to get Mute Status ${err.message}`);
                            expect().assertFail();
                        }
                        else if (data == false) {
                            console.log('AudioFrameworkTest: Callback : Is Stream Mute Media: FALSE: PASS: ' + data);
                            expect(true).assertTrue();
                        }
                        else {
                            console.log('AudioFrameworkTest: Callback : Is Stream Mute Media: FALSE: FAIL: ' + data);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
                done();
            });
        });

    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_mute_005
                * @tc.name      : mute - Media - Promise
                * @tc.desc      : mute - Media - Promise - Disable mute
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_mute_005', 0, async function (done) {
        await audioManager.setVolume(audioMedia, lowVol);
        await audioManager.mute(audioMedia, true).then(() => {
            console.log('AudioFrameworkTest: Promise returned to indicate that the stream is muted.');
        })
            .catch((err) => {
                console.info('AudioFrameworkTest: Promise: Is Stream isMute Media: FALSE: ERROR:' + err.message);
                expect(false).assertTrue();
            });
        await audioManager.mute(audioMedia, false).then(async function () {
            console.log('AudioFrameworkTest: Set Stream Mute: Media: Promise: FALSE');
            await audioManager.getVolume(audioMedia).then((value) => {
                console.info("AudioFrameworkTest: value is " + value);
                if (value == lowVol) {
                    expect(true).assertTrue();
                }
                else {
                    expect(false).assertTrue();
                }
            });
            await audioManager.isMute(audioMedia).then(function (data) {
                if (data == false) {
                    console.log('AudioFrameworkTest: Promise: Is Stream Mute Media: FALSE: PASS:' + data);
                    expect(true).assertTrue();
                }
                else {
                    console.log('AudioFrameworkTest: Promise: Is Stream Mute Media: FALSE: FAIL: ' + data);
                    expect(false).assertTrue();
                }
            })
                .catch((err) => {
                    console.info('AudioFrameworkTest: Promise: Is Stream isMute Media: FALSE: ERROR:' + err.message);
                    expect(false).assertTrue();
                });
        }).catch((err) => {
            console.info('AudioFrameworkTest: Promise: Is Stream Mute Media: FALSE: ERROR:' + err.message);
            expect(false).assertTrue();
        });
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_mute_008
                * @tc.name      : mute - Ringtone - callback
                * @tc.desc      : mute - Ringtone - callback - Disable mute
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_mute_008', 0, async function (done) {
        await audioManager.setVolume(audioRingtone, highVol);
        audioManager.mute(audioRingtone, true, (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: Failed to mute the stream. ${err.message}`);
                expect(false).assertTrue();
            }
            console.log('AudioFrameworkTest: Callback invoked to indicate that the stream is muted.');
            audioManager.mute(audioRingtone, false, (err) => {
                if (err) {
                    console.error(`AudioFrameworkTest: Set Stream Mute: Media: Callback: Error :  ${err.message}`);
                    expect(false).assertTrue();
                }
                else {
                    audioManager.getVolume(audioRingtone, (err, value) => {
                        if (err) {
                            console.error(`Failed to obtain the volume. ${err.message}`);
                            expect(false).assertTrue();
                        }
                        else if (value == highVol) {
                            console.info("AudioFrameworkTest: value is " + value);
                            expect(true).assertTrue();
                        }
                        else {
                            console.info("AudioFrameworkTest: mute fail");
                            expect(false).assertTrue();
                        }
                    });
                    audioManager.isMute(audioRingtone, (err, data) => {
                        if (err) {
                            console.error(`AudioFrameworkTest: Callback : FALSE: Media : failed to get Mute Status ${err.message}`);
                            expect().assertFail();
                        }
                        else if (data == false) {
                            console.log('AudioFrameworkTest: Callback : Is Stream Mute Media: FALSE: PASS: ' + data);
                            expect(true).assertTrue();
                        }
                        else {
                            console.log('AudioFrameworkTest: Callback : Is Stream Mute Media: FALSE: FAIL: ' + data);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
                done();
            });
        });

    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_mute_007
                * @tc.name      : mute - Ringtone - Promise
                * @tc.desc      : mute - Ringtone - Promise - disable mute
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_mute_007', 0, async function (done) {
        await audioManager.setVolume(audioRingtone, lowVol);
        await audioManager.mute(audioRingtone, true).then(() => {
            console.log('AudioFrameworkTest: Promise returned to indicate that the stream is muted.');
        })
            .catch((err) => {
                console.info('AudioFrameworkTest: Promise: Is Stream Mute Ringtone: FALSE: ERROR:' + err.message);
                expect(false).assertTrue();
            });
        await audioManager.mute(audioRingtone, false).then(async function () {
            console.log('AudioFrameworkTest: Set Stream Mute: Ringtone: Promise: FALSE');
            await audioManager.getVolume(audioRingtone).then((value) => {
                console.info("AudioFrameworkTest: value is " + value);
                if (value == lowVol) {
                    expect(true).assertTrue();
                }
                else {
                    expect(false).assertTrue();
                }
            });
            await audioManager.isMute(audioRingtone).then(function (data) {
                if (data == false) {
                    console.log('AudioFrameworkTest: Promise: Is Stream Mute Ringtone: FALSE: PASS:' + data);
                    expect(true).assertTrue();
                }
                else {
                    console.log('AudioFrameworkTest: Promise: Is Stream Mute Ringtone: FALSE: FAIL: ' + data);
                    expect(false).assertTrue();
                }
            })
                .catch((err) => {
                    console.info('AudioFrameworkTest: Promise: Is Stream isMute Ringtone: FALSE: ERROR:' + err.message);
                    expect(false).assertTrue();
                });
        }).catch((err) => {
            console.info('AudioFrameworkTest: Promise: Is Stream Mute Ringtone: FALSE: ERROR:' + err.message);
            expect(false).assertTrue();
        });
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_mute_015
                * @tc.name      : mute - Media - callback - ENAME
                * @tc.desc      : mute - Media - callback - Disable mute
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_mute_015', 0, async function (done) {
        await audioManager.setVolume(audio.AudioVolumeType.MEDIA, highVol);
        audioManager.mute(audio.AudioVolumeType.MEDIA, true, (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: Failed to mute the stream. ${err.message}`);
                expect(false).assertTrue();
            }
            console.log('AudioFrameworkTest: Callback invoked to indicate that the stream is muted.');
            audioManager.mute(audio.AudioVolumeType.MEDIA, false, (err) => {
                if (err) {
                    console.error(`AudioFrameworkTest: Set Stream Mute: Media: Callback: Error :  ${err.message}`);
                    expect(false).assertTrue();
                }
                else {
                    audioManager.getVolume(audio.AudioVolumeType.MEDIA, (err, value) => {
                        if (err) {
                            console.error(`Failed to obtain the volume. ${err.message}`);
                            expect(false).assertTrue();
                        }
                        else if (value == highVol) {
                            console.info("AudioFrameworkTest: value is " + value);
                            expect(true).assertTrue();
                        }
                        else {
                            console.info("AudioFrameworkTest: mute fail");
                            expect(false).assertTrue();
                        }
                    });
                    audioManager.isMute(audio.AudioVolumeType.MEDIA, (err, data) => {
                        if (err) {
                            console.error(`AudioFrameworkTest: Callback : FALSE: Media : failed to get Mute Status ${err.message}`);
                            expect().assertFail();
                        }
                        else if (data == false) {
                            console.log('AudioFrameworkTest: Callback : Is Stream Mute Media: FALSE: PASS: ' + data);
                            expect(true).assertTrue();
                        }
                        else {
                            console.log('AudioFrameworkTest: Callback : Is Stream Mute Media: FALSE: FAIL: ' + data);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
                done();
            });
        });

    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_mute_011
                * @tc.name      : mute - Media - Promise -  ENAME
                * @tc.desc      : mute - Media - Promise - Disable mute
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_mute_011', 0, async function (done) {
        await audioManager.setVolume(audio.AudioVolumeType.MEDIA, lowVol);
        await audioManager.mute(audio.AudioVolumeType.MEDIA, true).then(() => {
            console.log('AudioFrameworkTest: Promise returned to indicate that the stream is muted.');
        })
            .catch((err) => {
                console.info('AudioFrameworkTest: Promise: Is Stream isMute Media: FALSE: ERROR:' + err.message);
                expect(false).assertTrue();
            });
        await audioManager.mute(audio.AudioVolumeType.MEDIA, false).then(async function () {
            console.log('AudioFrameworkTest: Set Stream Mute: Media: Promise: FALSE');
            await audioManager.getVolume(audio.AudioVolumeType.MEDIA).then((value) => {
                console.info("AudioFrameworkTest: value is " + value);
                if (value == lowVol) {
                    expect(true).assertTrue();
                }
                else {
                    expect(false).assertTrue();
                }
            });
            await audioManager.isMute(audio.AudioVolumeType.MEDIA).then(function (data) {
                if (data == false) {
                    console.log('AudioFrameworkTest: Promise: Is Stream Mute Media: FALSE: PASS:' + data);
                    expect(true).assertTrue();
                }
                else {
                    console.log('AudioFrameworkTest: Promise: Is Stream Mute Media: FALSE: FAIL: ' + data);
                    expect(false).assertTrue();
                }
            })
                .catch((err) => {
                    console.info('AudioFrameworkTest: Promise: Is Stream isMute Media: FALSE: ERROR:' + err.message);
                    expect(false).assertTrue();
                });
        }).catch((err) => {
            console.info('AudioFrameworkTest: Promise: Is Stream Mute Media: FALSE: ERROR:' + err.message);
            expect(false).assertTrue();
        });
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_mute_016
                * @tc.name      : mute - Ringtone - callback -  ENAME
                * @tc.desc      : mute - Ringtone - callback - Disable mute
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_mute_016', 0, async function (done) {
        await audioManager.setVolume(audio.AudioVolumeType.RINGTONE, highVol);
        audioManager.mute(audio.AudioVolumeType.RINGTONE, true, (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: Failed to mute the stream. ${err.message}`);
                expect(false).assertTrue();
            }
            console.log('AudioFrameworkTest: Callback invoked to indicate that the stream is muted.');
            audioManager.mute(audio.AudioVolumeType.RINGTONE, false, (err) => {
                if (err) {
                    console.error(`AudioFrameworkTest: Set Stream Mute: Media: Callback: Error :  ${err.message}`);
                    expect(false).assertTrue();
                }
                else {
                    audioManager.getVolume(audio.AudioVolumeType.RINGTONE, (err, value) => {
                        if (err) {
                            console.error(`Failed to obtain the volume. ${err.message}`);
                            expect(false).assertTrue();
                        }
                        else if (value == highVol) {
                            console.info("AudioFrameworkTest: value is " + value);
                            expect(true).assertTrue();
                        }
                        else {
                            console.info("AudioFrameworkTest: mute fail");
                            expect(false).assertTrue();
                        }
                    });
                    audioManager.isMute(audio.AudioVolumeType.RINGTONE, (err, data) => {
                        if (err) {
                            console.error(`AudioFrameworkTest: Callback : FALSE: Media : failed to get Mute Status ${err.message}`);
                            expect().assertFail();
                        }
                        else if (data == false) {
                            console.log('AudioFrameworkTest: Callback : Is Stream Mute Media: FALSE: PASS: ' + data);
                            expect(true).assertTrue();
                        }
                        else {
                            console.log('AudioFrameworkTest: Callback : Is Stream Mute Media: FALSE: FAIL: ' + data);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
                done();
            });
        });
    })

    /* *
               * @tc.number    : SUB_AUDIO_MANAGER_mute_014
               * @tc.name      : mute - RINGTONE - Promise - ENAME:
               * @tc.desc      : mute - RINGTONE - Promise - Disable mute
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0
           */
    it('SUB_AUDIO_MANAGER_mute_014', 0, async function (done) {
        await audioManager.setVolume(audio.AudioVolumeType.RINGTONE, lowVol);
        await audioManager.mute(audio.AudioVolumeType.RINGTONE, true).then(() => {
            console.log('AudioFrameworkTest: Promise returned to indicate that the stream is muted.');
        })
            .catch((err) => {
                console.info('AudioFrameworkTest: Promise: Is Stream isMute Ringtone: FALSE: ERROR:' + err.message);
                expect(false).assertTrue();
            });
        await audioManager.mute(audio.AudioVolumeType.RINGTONE, false).then(async function () {
            console.log('AudioFrameworkTest: Set Stream Mute: Ringtone: Promise: FALSE');
            await audioManager.getVolume(audio.AudioVolumeType.RINGTONE).then((value) => {
                console.info("AudioFrameworkTest: value is " + value);
                if (value == lowVol) {
                    expect(true).assertTrue();
                }
                else {
                    expect(false).assertTrue();
                }
            });
            await audioManager.isMute(audio.AudioVolumeType.RINGTONE).then(function (data) {
                if (data == false) {
                    console.log('AudioFrameworkTest: Promise: Is Stream Mute Ringtone: FALSE: PASS:' + data);
                    expect(true).assertTrue();
                }
                else {
                    console.log('AudioFrameworkTest: Promise: Is Stream Mute Ringtone: FALSE: FAIL: ' + data);
                    expect(false).assertTrue();
                }
            })
                .catch((err) => {
                    console.info('AudioFrameworkTest: Promise: Is Stream isMute Ringtone: FALSE: ERROR:' + err.message);
                    expect(false).assertTrue();
                });
        }).catch((err) => {
            console.info('AudioFrameworkTest: Promise: Is Stream Mute Ringtone: FALSE: ERROR:' + err.message);
            expect(false).assertTrue();
        });
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_mute_021
                * @tc.name      : mute - VOICE_CALL - callback - ENAME
                * @tc.desc      : mute - VOICE_CALL - callback - Disable mute
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_mute_021', 0, async function (done) {
        await audioManager.setVolume(audio.AudioVolumeType.VOICE_CALL, highVol);
        audioManager.mute(audio.AudioVolumeType.VOICE_CALL, true, (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: Failed to mute the stream. ${err.message}`);
                expect(false).assertTrue();
            }
            console.log('AudioFrameworkTest: Callback invoked to indicate that the stream is muted.');
            audioManager.mute(audio.AudioVolumeType.VOICE_CALL, false, (err) => {
                if (err) {
                    console.error(`AudioFrameworkTest: Set Stream Mute: VOICE_CALL: Callback: Error :  ${err.message}`);
                    expect(false).assertTrue();
                }
                else {
                    audioManager.getVolume(audio.AudioVolumeType.VOICE_CALL, (err, value) => {
                        if (err) {
                            console.error(`Failed to obtain the volume. ${err.message}`);
                            expect(false).assertTrue();
                        }
                        else if (value == highVol) {
                            console.info("AudioFrameworkTest: value is " + value);
                            expect(true).assertTrue();
                        }
                        else {
                            console.info("AudioFrameworkTest: mute fail");
                            expect(false).assertTrue();
                        }
                    });
                    audioManager.isMute(audio.AudioVolumeType.VOICE_CALL, (err, data) => {
                        if (err) {
                            console.error(`AudioFrameworkTest: Callback : FALSE: VOICE_CALL : failed to get Mute Status ${err.message}`);
                            expect().assertFail();
                        }
                        else if (data == false) {
                            console.log('AudioFrameworkTest: Callback : Is Stream Mute VOICE_CALL: FALSE: PASS: ' + data);
                            expect(true).assertTrue();
                        }
                        else {
                            console.log('AudioFrameworkTest: Callback : Is Stream Mute VOICE_CALL: FALSE: FAIL: ' + data);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
                done();
            });
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_mute_022
                * @tc.name      : mute - VOICE_CALL - Promise -  ENAME
                * @tc.desc      : mute - VOICE_CALL - Promise - Disable mute
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_mute_022', 0, async function (done) {
        await audioManager.setVolume(audio.AudioVolumeType.VOICE_CALL, lowVol);
        await audioManager.mute(audio.AudioVolumeType.VOICE_CALL, true).then(() => {
            console.log('AudioFrameworkTest: Promise returned to indicate that the stream is muted.');
        })
            .catch((err) => {
                console.info('AudioFrameworkTest: Promise: Is Stream isMute VOICE_CALL: FALSE: ERROR:' + err.message);
                expect(false).assertTrue();
            });
        await audioManager.mute(audio.AudioVolumeType.VOICE_CALL, false).then(async function () {
            console.log('AudioFrameworkTest: Set Stream Mute: VOICE_CALL: Promise: FALSE');
            await audioManager.getVolume(audio.AudioVolumeType.VOICE_CALL).then((value) => {
                console.info("AudioFrameworkTest: value is " + value);
                if (value == lowVol) {
                    expect(true).assertTrue();
                }
                else {
                    expect(false).assertTrue();
                }
            });
            await audioManager.isMute(audio.AudioVolumeType.VOICE_CALL).then(function (data) {
                if (data == false) {
                    console.log('AudioFrameworkTest: Promise: Is Stream Mute VOICE_CALL: FALSE: PASS:' + data);
                    expect(true).assertTrue();
                }
                else {
                    console.log('AudioFrameworkTest: Promise: Is Stream Mute VOICE_CALL: FALSE: FAIL: ' + data);
                    expect(false).assertTrue();
                }
            })
                .catch((err) => {
                    console.info('AudioFrameworkTest: Promise: Is Stream isMute VOICE_CALL: FALSE: ERROR:' + err.message);
                    expect(false).assertTrue();
                });
        }).catch((err) => {
            console.info('AudioFrameworkTest: Promise: Is Stream Mute VOICE_CALL: FALSE: ERROR:' + err.message);
            expect(false).assertTrue();
        });
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_mute_023
                * @tc.name      : mute - VOICE_ASSISTANT - callback - ENAME
                * @tc.desc      : mute - VOICE_ASSISTANT - callback - Disable mute
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_mute_023', 0, async function (done) {
        await audioManager.setVolume(audio.AudioVolumeType.VOICE_ASSISTANT, highVol);
        audioManager.mute(audio.AudioVolumeType.VOICE_ASSISTANT, true, (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: Failed to mute the stream. ${err.message}`);
                expect(false).assertTrue();
            }
            console.log('AudioFrameworkTest: Callback invoked to indicate that the stream is muted.');
            audioManager.mute(audio.AudioVolumeType.VOICE_ASSISTANT, false, (err) => {
                if (err) {
                    console.error(`AudioFrameworkTest: Set Stream Mute: VOICE_ASSISTANT: Callback: Error :  ${err.message}`);
                    expect(false).assertTrue();
                }
                else {
                    audioManager.getVolume(audio.AudioVolumeType.VOICE_ASSISTANT, (err, value) => {
                        if (err) {
                            console.error(`Failed to obtain the volume. ${err.message}`);
                            expect(false).assertTrue();
                        }
                        else if (value == highVol) {
                            console.info("AudioFrameworkTest: value is " + value);
                            expect(true).assertTrue();
                        }
                        else {
                            console.info("AudioFrameworkTest: mute fail");
                            expect(false).assertTrue();
                        }
                    });
                    audioManager.isMute(audio.AudioVolumeType.VOICE_ASSISTANT, (err, data) => {
                        if (err) {
                            console.error(`AudioFrameworkTest: Callback : FALSE: VOICE_ASSISTANT : failed to get Mute Status ${err.message}`);
                            expect().assertFail();
                        }
                        else if (data == false) {
                            console.log('AudioFrameworkTest: Callback : Is Stream Mute VOICE_ASSISTANT: FALSE: PASS: ' + data);
                            expect(true).assertTrue();
                        }
                        else {
                            console.log('AudioFrameworkTest: Callback : Is Stream Mute VOICE_ASSISTANT: FALSE: FAIL: ' + data);
                            expect(false).assertTrue();
                        }
                        done();
                    });
                }
                done();
            });
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_mute_024
                * @tc.name      : mute - VOICE_ASSISTANT - Promise -  ENAME
                * @tc.desc      : mute - VOICE_ASSISTANT - Promise - Disable mute
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_mute_024', 0, async function (done) {
        await audioManager.setVolume(audio.AudioVolumeType.VOICE_ASSISTANT, lowVol);
        await audioManager.mute(audio.AudioVolumeType.VOICE_ASSISTANT, true).then(() => {
            console.log('AudioFrameworkTest: Promise returned to indicate that the stream is muted.');
        })
            .catch((err) => {
                console.info('AudioFrameworkTest: Promise: Is Stream isMute VOICE_ASSISTANT: FALSE: ERROR:' + err.message);
                expect(false).assertTrue();
            });
        await audioManager.mute(audio.AudioVolumeType.VOICE_ASSISTANT, false).then(async function () {
            console.log('AudioFrameworkTest: Set Stream Mute: VOICE_ASSISTANT: Promise: FALSE');
            await audioManager.getVolume(audio.AudioVolumeType.VOICE_ASSISTANT).then((value) => {
                console.info("AudioFrameworkTest: value is " + value);
                if (value == lowVol) {
                    expect(true).assertTrue();
                }
                else {
                    expect(false).assertTrue();
                }
            });
            await audioManager.isMute(audio.AudioVolumeType.VOICE_ASSISTANT).then(function (data) {
                if (data == false) {
                    console.log('AudioFrameworkTest: Promise: Is Stream Mute VOICE_ASSISTANT: FALSE: PASS:' + data);
                    expect(true).assertTrue();
                }
                else {
                    console.log('AudioFrameworkTest: Promise: Is Stream Mute VOICE_ASSISTANT: FALSE: FAIL: ' + data);
                    expect(false).assertTrue();
                }
            })
                .catch((err) => {
                    console.info('AudioFrameworkTest: Promise: Is Stream isMute VOICE_ASSISTANT: FALSE: ERROR:' + err.message);
                    expect(false).assertTrue();
                });
        }).catch((err) => {
            console.info('AudioFrameworkTest: Promise: Is Stream Mute VOICE_ASSISTANT: FALSE: ERROR:' + err.message);
            expect(false).assertTrue();
        });
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_mute_017
                * @tc.name      : mute - Media - Promise - SetVolume
                * @tc.desc      : mute - Media - Promise - Enable mute -SetVolume
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_mute_017', 0, async function (done) {
        await audioManager.setVolume(audioMedia, highVol);
        await audioManager.mute(audioMedia, true).then(async function () {
            console.log('AudioFrameworkTest: Set Stream Mute: Media: Promise: TRUE');
            await audioManager.getVolume(audioMedia).then((value) => {
                console.info("AudioFrameworkTest: value is " + value);
                if (value == 0) {
                    expect(true).assertTrue();
                }
                else {
                    expect(false).assertTrue();
                }
            });
            await audioManager.setVolume(audioMedia, lowVol);
            await audioManager.isMute(audioMedia).then(function (data) {
                if (data == false) {
                    console.log('AudioFrameworkTest: Promise: Is Stream Mute Media: SetVolume: PASS:' + data);
                    expect(true).assertTrue();
                }
                else {
                    console.log('AudioFrameworkTest: Promise: Is Stream Mute Media: SetVolume: FAIL: ' + data);
                    expect(false).assertTrue();
                }
            })
                .catch((err) => {
                    console.info('AudioFrameworkTest: Promise: Is Stream isMute Media: SetVolume: ERROR:' + err.message);
                    expect(false).assertTrue();
                });
        }).catch((err) => {
            console.info('AudioFrameworkTest: Promise: Is Stream Mute Media: SetVolume: ERROR:' + err.message);
            expect(false).assertTrue();
        });
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_mute_018
                * @tc.name      : mute - Media - callback - SetVolume
                * @tc.desc      : mute - Media - callback - Enable mute - SetVolume
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_mute_018', 0, async function (done) {
        await audioManager.setVolume(audioMedia, lowVol);
        audioManager.mute(audioMedia, true, async (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: Callback : SetVolume: Media : failed to set Mute Status ${err.message}`);
                expect().assertFail();
            }
            else {
                console.log('AudioFrameworkTest: Set Stream Mute: Media: Callback : TRUE');
                audioManager.getVolume(audioMedia, (err, value) => {
                    if (err) {
                        console.error(`Failed to obtain the volume. ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (value == 0) {
                        console.info("AudioFrameworkTest: value is " + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info("AudioFrameworkTest: mute fail");
                        expect(false).assertTrue();
                    }
                });
                await audioManager.setVolume(audioMedia, highVol);
                audioManager.isMute(audioMedia, (err, data) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: Callback : SetVolume: Media : failed to get Mute Status ${err.message}`);
                        expect().assertFail();
                    }
                    else if (data == false) {
                        console.log('AudioFrameworkTest: Callback : Is Stream Mute Media: SetVolume: PASS: ' + data);
                        expect(true).assertTrue();
                    }
                    else {
                        console.log('AudioFrameworkTest: Callback : Is Stream Mute Media: SetVolume: FAIL: ' + data);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_mute_019
                * @tc.name      : mute - Ringtone - Promise - SetVolume
                * @tc.desc      : mute - Ringtone - Promise - Enable mute - SetVolume
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_mute_019', 0, async function (done) {
        await audioManager.setVolume(audioRingtone, lowVol);
        await audioManager.mute(audioRingtone, true).then(async function () {
            console.log('AudioFrameworkTest: Set Stream Mute: Ringtone: Promise: SetVolume');
            await audioManager.getVolume(audioRingtone).then((value) => {
                console.info("AudioFrameworkTest: value is " + value);
                if (value == 0) {
                    expect(true).assertTrue();
                }
                else {
                    expect(false).assertTrue();
                }
            });
            await audioManager.setVolume(audioRingtone, highVol);
            await audioManager.isMute(audioRingtone).then(function (data) {
                if (data == false) {
                    console.log('AudioFrameworkTest: Promise: Is Stream Mute Ringtone: SetVolume: PASS:' + data);
                    expect(true).assertTrue();
                }
                else {
                    console.log('AudioFrameworkTest: Promise: Is Stream Mute Ringtone: SetVolume: FAIL: ' + data);
                    expect(false).assertTrue();
                }
            })
                .catch((err) => {
                    console.info('AudioFrameworkTest: Promise: Is Stream isMute Ringtone: SetVolume: ERROR:' + err.message);
                    expect(false).assertTrue();
                });
        }).catch((err) => {
            console.info('AudioFrameworkTest: Promise: Is Stream Mute Ringtone: SetVolume: ERROR:' + err.message);
            expect(false).assertTrue();
        });
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_mute_020
                * @tc.name      : mute - Ringtone - callback - SetVolume
                * @tc.desc      : mute - Ringtone - callback - Enable mute - SetVolume
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_mute_020', 0, async function (done) {
        await audioManager.setVolume(audioRingtone, highVol);
        audioManager.mute(audioRingtone, true, async (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: Callback : SetVolume: Ringtone : failed to set Mute Status ${err.message}`);
                expect().assertFail();
            }
            else {
                console.log('AudioFrameworkTest: Set Stream Mute: Ringtone: Callback : SetVolume');
                audioManager.getVolume(audioRingtone, (err, value) => {
                    if (err) {
                        console.error(`Failed to obtain the volume. ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (value == 0) {
                        console.info("AudioFrameworkTest: value is " + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info("AudioFrameworkTest: mute fail");
                        expect(false).assertTrue();
                    }
                });
                await audioManager.setVolume(audioRingtone, lowVol);
                audioManager.isMute(audioRingtone, (err, data) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: Callback : SetVolume: Ringtone : failed to get Mute Status ${err.message}`);
                        expect().assertFail();
                    }
                    else if (data == false) {
                        console.log('AudioFrameworkTest: Callback : Is Stream Mute Ringtone: SetVolume: PASS: ' + data);
                        expect(true).assertTrue();
                    }
                    else {
                        console.log('AudioFrameworkTest: Callback : Is Stream Mute Ringtone: SetVolume: FAIL: ' + data);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_mute_025
                * @tc.name      : mute - VOICE_CALL - Promise - SetVolume
                * @tc.desc      : mute - VOICE_CALL - Promise - Enable mute -SetVolume
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_mute_025', 0, async function (done) {
        await audioManager.setVolume(audio.AudioVolumeType.VOICE_CALL, highVol);
        await audioManager.mute(audio.AudioVolumeType.VOICE_CALL, true).then(async function () {
            console.log('AudioFrameworkTest: Set Stream Mute: VOICE_CALL: Promise: TRUE');
            await audioManager.getVolume(audio.AudioVolumeType.VOICE_CALL).then((value) => {
                console.info("AudioFrameworkTest: value is " + value);
                if (value == 0) {
                    expect(true).assertTrue();
                }
                else {
                    expect(false).assertTrue();
                }
            });
            await audioManager.setVolume(audio.AudioVolumeType.VOICE_CALL, lowVol);
            await audioManager.isMute(audio.AudioVolumeType.VOICE_CALL).then(function (data) {
                if (data == false) {
                    console.log('AudioFrameworkTest: Promise: Is Stream Mute VOICE_CALL: SetVolume: PASS:' + data);
                    expect(true).assertTrue();
                }
                else {
                    console.log('AudioFrameworkTest: Promise: Is Stream Mute VOICE_CALL: SetVolume: FAIL: ' + data);
                    expect(false).assertTrue();
                }
            })
                .catch((err) => {
                    console.info('AudioFrameworkTest: Promise: Is Stream isMute VOICE_CALL: SetVolume: ERROR:' + err.message);
                    expect(false).assertTrue();
                });
        }).catch((err) => {
            console.info('AudioFrameworkTest: Promise: Is Stream Mute VOICE_CALL: SetVolume: ERROR:' + err.message);
            expect(false).assertTrue();
        });
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_mute_026
                * @tc.name      : mute - VOICE_CALL - callback - SetVolume
                * @tc.desc      : mute - VOICE_CALL - callback - Enable mute - SetVolume
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_mute_026', 0, async function (done) {
        await audioManager.setVolume(audio.AudioVolumeType.VOICE_CALL, highVol);
        audioManager.mute(audio.AudioVolumeType.VOICE_CALL, true, async (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: Callback : SetVolume: VOICE_CALL : failed to set Mute Status ${err.message}`);
                expect().assertFail();
            }
            else {
                console.log('AudioFrameworkTest: Set Stream Mute: VOICE_CALL: Callback : SetVolume');
                audioManager.getVolume(audio.AudioVolumeType.VOICE_CALL, (err, value) => {
                    if (err) {
                        console.error(`Failed to obtain the volume. ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (value == 0) {
                        console.info("AudioFrameworkTest: value is " + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info("AudioFrameworkTest: mute fail");
                        expect(false).assertTrue();
                    }
                });
                await audioManager.setVolume(audio.AudioVolumeType.VOICE_CALL, lowVol);
                audioManager.isMute(audio.AudioVolumeType.VOICE_CALL, (err, data) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: Callback : SetVolume: VOICE_CALL : failed to get Mute Status ${err.message}`);
                        expect().assertFail();
                    }
                    else if (data == false) {
                        console.log('AudioFrameworkTest: Callback : Is Stream Mute VOICE_CALL: SetVolume: PASS: ' + data);
                        expect(true).assertTrue();
                    }
                    else {
                        console.log('AudioFrameworkTest: Callback : Is Stream Mute VOICE_CALL: SetVolume: FAIL: ' + data);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_mute_027
                * @tc.name      : mute - VOICE_ASSISTANT - Promise - SetVolume
                * @tc.desc      : mute - VOICE_ASSISTANT - Promise - Enable mute -SetVolume
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_mute_027', 0, async function (done) {
        await audioManager.setVolume(audio.AudioVolumeType.VOICE_ASSISTANT, highVol);
        await audioManager.mute(audio.AudioVolumeType.VOICE_ASSISTANT, true).then(async function () {
            console.log('AudioFrameworkTest: Set Stream Mute: VOICE_ASSISTANT: Promise: TRUE');
            await audioManager.getVolume(audio.AudioVolumeType.VOICE_ASSISTANT).then((value) => {
                console.info("AudioFrameworkTest: value is " + value);
                if (value == 0) {
                    expect(true).assertTrue();
                }
                else {
                    expect(false).assertTrue();
                }
            });
            await audioManager.setVolume(audio.AudioVolumeType.VOICE_ASSISTANT, lowVol);
            await audioManager.isMute(audio.AudioVolumeType.VOICE_ASSISTANT).then(function (data) {
                if (data == false) {
                    console.log('AudioFrameworkTest: Promise: Is Stream Mute VOICE_ASSISTANT: SetVolume: PASS:' + data);
                    expect(true).assertTrue();
                }
                else {
                    console.log('AudioFrameworkTest: Promise: Is Stream Mute VOICE_ASSISTANT: SetVolume: FAIL: ' + data);
                    expect(false).assertTrue();
                }
            })
                .catch((err) => {
                    console.info('AudioFrameworkTest: Promise: Is Stream isMute VOICE_ASSISTANT: SetVolume: ERROR:' + err.message);
                    expect(false).assertTrue();
                });
        }).catch((err) => {
            console.info('AudioFrameworkTest: Promise: Is Stream Mute VOICE_ASSISTANT: SetVolume: ERROR:' + err.message);
            expect(false).assertTrue();
        });
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_mute_028
                * @tc.name      : mute - VOICE_ASSISTANT - callback - SetVolume
                * @tc.desc      : mute - VOICE_ASSISTANT - callback - Enable mute - SetVolume
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_mute_028', 0, async function (done) {
        await audioManager.setVolume(audio.AudioVolumeType.VOICE_ASSISTANT, highVol);
        audioManager.mute(audio.AudioVolumeType.VOICE_ASSISTANT, true, async (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: Callback : SetVolume: VOICE_ASSISTANT : failed to set Mute Status ${err.message}`);
                expect().assertFail();
            }
            else {
                console.log('AudioFrameworkTest: Set Stream Mute: VOICE_ASSISTANT: Callback : SetVolume');
                await audioManager.getVolume(audio.AudioVolumeType.VOICE_ASSISTANT).then((value) => {
                    if (value == 0) {
                        console.info("AudioFrameworkTest: value is " + value);
                        expect(true).assertTrue();
                    }
                    else {
                        expect(false).assertTrue();
                    }
                });
                await audioManager.setVolume(audio.AudioVolumeType.VOICE_ASSISTANT, lowVol);
                audioManager.isMute(audio.AudioVolumeType.VOICE_ASSISTANT, (err, data) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: Callback : SetVolume: VOICE_ASSISTANT : failed to get Mute Status ${err.message}`);
                        expect().assertFail();
                    }
                    else if (data == false) {
                        console.log('AudioFrameworkTest: Callback : Is Stream Mute VOICE_ASSISTANT: SetVolume: PASS: ' + data);
                        expect(true).assertTrue();
                    }
                    else {
                        console.log('AudioFrameworkTest: Callback : Is Stream Mute VOICE_ASSISTANT: SetVolume: FAIL: ' + data);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_isActive_005
                * @tc.name      : isActive - Media - Promise
                * @tc.desc      : isActive - Media - Promise - When stream is NOT playing
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_isActive_005', 0, async function (done) {
        console.log('AudioFrameworkTest: Promise : isActive Media: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS');
        const promise = audioManager.isActive(audioMedia);
        promise.then(function (data) {
            if (data == false) {
                console.log('AudioFrameworkTest: Promise: isActive: Media: TRUE: PASS:' + data);
                expect(true).assertTrue();
            }
            else {
                console.log('AudioFrameworkTest: Promise: isActive: Media: TRUE: FAIL: ' + data);
                expect(false).assertTrue();
            }
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_isActive_006
                * @tc.name      : isActive - Media - Callback
                * @tc.desc      : isActive - Media - Callback - When stream is NOT playing
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_isActive_006', 0, async function (done) {
        console.log('AudioFrameworkTest: Callback : isActive Media: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS');
        audioManager.isActive(audioMedia, (err, data) => {
            if (err) {
                console.error(`AudioFrameworkTest: Callback : Media : isActive: failed  ${err.message}`);
                expect().assertFail();
            }
            else if (data == false) {
                console.log('AudioFrameworkTest: Callback: isActive: Media: TRUE: PASS:' + data);
                expect(true).assertTrue();
            }
            else {
                console.log('AudioFrameworkTest: Callback: isActive: Media: TRUE: FAIL: ' + data);
                expect(false).assertTrue();
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_isActive_007
                * @tc.name      : isActive - Ringtone - Promise
                * @tc.desc      : isActive - Ringtone - Promise - When stream is NOT playing
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_isActive_007', 0, async function (done) {
        console.log('AudioFrameworkTest: Promise : isActive Ringtone: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS');
        const promise = audioManager.isActive(audioRingtone);
        promise.then(function (data) {
            if (data == false) {
                console.log('AudioFrameworkTest: Promise: isActive: Ringtone: TRUE: PASS:' + data);
                expect(true).assertTrue();
            }
            else {
                console.log('AudioFrameworkTest: Promise: isActive: Ringtone: TRUE: FAIL: ' + data);
                expect(false).assertTrue();
            }
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_isActive_008
                * @tc.name      : isActive - Ringtone - Callback
                * @tc.desc      : isActive - Ringtone - Callback - When stream is NOT playing
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_isActive_008', 0, async function (done) {
        console.log('AudioFrameworkTest: Callback : isActive Ringtone: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS');
        audioManager.isActive(audioRingtone, (err, data) => {
            if (err) {
                console.error(`AudioFrameworkTest: Callback : Ringtone : isActive: failed  ${err.message}`);
                expect().assertFail();
            }
            else if (data == false) {
                console.log('AudioFrameworkTest: Callback: isActive: Ringtone: TRUE: PASS:' + data);
                expect(true).assertTrue();
            }
            else {
                console.log('AudioFrameworkTest: Callback: isActive: Ringtone: TRUE: FAIL: ' + data);
                expect(false).assertTrue();
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_isActive_013
                * @tc.name      : isActive - Media - Promise - ENAME:
                * @tc.desc      : isActive - Media - Promise - When stream is NOT playing
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_isActive_013', 0, async function (done) {
        console.log('AudioFrameworkTest: Promise : isActive Media: ENAME: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS');
        const promise = audioManager.isActive(audio.AudioVolumeType.MEDIA);
        promise.then(function (data) {
            if (data == false) {
                console.log('AudioFrameworkTest: Promise: isActive: Media: ENAME: TRUE: PASS:' + data);
                expect(true).assertTrue();
            }
            else {
                console.log('AudioFrameworkTest: Promise: isActive: Media: ENAME: TRUE: FAIL: ' + data);
                expect(false).assertTrue();
            }
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_isActive_014
                * @tc.name      : isActive - Media - Callback -  ENAME
                * @tc.desc      : isActive - Media - Callback - When stream is NOT playing
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_isActive_014', 0, async function (done) {
        console.log('AudioFrameworkTest: Callback : isActive Media: ENAME: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS');
        audioManager.isActive(audio.AudioVolumeType.MEDIA, (err, data) => {
            if (err) {
                console.error(`AudioFrameworkTest: Callback : Media : ENAME: isActive: failed  ${err.message}`);
                expect().assertFail();
            }
            else if (data == false) {
                console.log('AudioFrameworkTest: Callback: isActive: Media: ENAME: TRUE: PASS:' + data);
                expect(true).assertTrue();
            }
            else {
                console.log('AudioFrameworkTest: Callback: isActive: Media: ENAME: TRUE: FAIL: ' + data);
                expect(false).assertTrue();
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_isActive_015
                * @tc.name      : isActive - Ringtone - Promise - ENAME
                * @tc.desc      : isActive - Ringtone - Promise - When stream is NOT playing
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_isActive_015', 0, async function (done) {
        console.log('AudioFrameworkTest: Promise : isActive Ringtone: ENAME: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS');
        const promise = audioManager.isActive(audio.AudioVolumeType.RINGTONE);
        promise.then(function (data) {
            if (data == false) {
                console.log('AudioFrameworkTest: Promise: isActive: Ringtone: ENAME: TRUE: PASS:' + data);
                expect(true).assertTrue();
            }
            else {
                console.log('AudioFrameworkTest: Promise: isActive: Ringtone: ENAME: TRUE: FAIL: ' + data);
                expect(false).assertTrue();
            }
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_isActive_016
                * @tc.name      : isActive - Ringtone - Callback - ENAME
                * @tc.desc      : isActive - Ringtone - Callback - When stream is NOT playing
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_isActive_016', 0, async function (done) {
        console.log('AudioFrameworkTest: Callback : isActive Ringtone: ENAME: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS');
        audioManager.isActive(audio.AudioVolumeType.RINGTONE, (err, data) => {
            if (err) {
                console.error(`AudioFrameworkTest: Callback : Ringtone : ENAME: isActive: failed  ${err.message}`);
                expect().assertFail();
            }
            else if (data == false) {
                console.log('AudioFrameworkTest: Callback: isActive: Ringtone: ENAME: TRUE: PASS:' + data);
                expect(true).assertTrue();
            }
            else {
                console.log('AudioFrameworkTest: Callback: isActive: Ringtone: ENAME: TRUE: FAIL: ' + data);
                expect(false).assertTrue();
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setMicrophoneMute_001
                * @tc.name      : setMicrophoneMute - true - Promise
                * @tc.desc      : Enable mic mute
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setMicrophoneMute_001', 0, async function (done) {
        await audioManager.setMicrophoneMute(true).then(function () {
            console.log('AudioFrameworkTest: setMicrophoneMute: Promise: TRUE');
            audioManager.isMicrophoneMute().then(function (data) {
                if (data == true) {
                    console.log('AudioFrameworkTest: Promise: isMicrophoneMute: TRUE: PASS:' + data);
                    expect(true).assertTrue();
                }
                else {
                    console.log('AudioFrameworkTest: Promise: isMicrophoneMute: TRUE: FAIL: ' + data);
                    expect(false).assertTrue();
                }
            });
        }).catch((err) => {
            console.info('AudioFrameworkTest: Promise: setMicrophoneMute: TRUE: FAIL: Error :' + err.message);
            expect(false).assertTrue();
        });
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setMicrophoneMute_002
                * @tc.name      : setMicrophoneMute - false - Promise
                * @tc.desc      : Disable mic mute
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setMicrophoneMute_002', 0, async function (done) {
        await audioManager.setMicrophoneMute(false).then(function () {
            console.log('AudioFrameworkTest: setMicrophoneMute: Promise: FALSE');
            audioManager.isMicrophoneMute().then(function (data) {
                if (data == false) {
                    console.log('AudioFrameworkTest: Promise: isMicrophoneMute: FALSE: PASS:' + data);
                    expect(true).assertTrue();
                }
                else {
                    console.log('AudioFrameworkTest: Promise: isMicrophoneMute: FALSE: FAIL: ' + data);
                    expect(false).assertTrue();
                }
            });
        }).catch((err) => {
            console.info('AudioFrameworkTest: Promise: setMicrophoneMute: FALSE: FAIL: Error :' + err.message);
            expect(false).assertTrue();
        });
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setMicrophoneMute_003
                * @tc.name      : setMicrophoneMute - true - Callback
                * @tc.desc      : Enable mic mute
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setMicrophoneMute_003', 0, async function (done) {
        audioManager.setMicrophoneMute(true, (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: setMicrophoneMute: Callback : TRUE: Error : ${err.message}`);
                expect(false).assertTrue();
            }
            else {
                console.log('AudioFrameworkTest: setMicrophoneMute: Callback : TRUE');
                audioManager.isMicrophoneMute((err, data) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: Callback : TRUE: isMicrophoneMute : Error ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (data == true) {
                        console.log('AudioFrameworkTest: Callback : isMicrophoneMute: TRUE: PASS: ' + data);
                        expect(true).assertTrue();
                    }
                    else {
                        console.log('AudioFrameworkTest: Callback : isMicrophoneMute: TRUE: FAIL: ' + data);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setMicrophoneMute_004
                * @tc.name      : setMicrophoneMute - false - Callback
                * @tc.desc      : Disable mic mute
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setMicrophoneMute_004', 0, async function (done) {
        audioManager.setMicrophoneMute(false, (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: setMicrophoneMute: Callback : FALSE: Error : ${err.message}`);
                expect(false).assertTrue();
            }
            else {
                console.log('AudioFrameworkTest: setMicrophoneMute: Callback : FALSE');
                audioManager.isMicrophoneMute((err, data) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: Callback : FALSE: isMicrophoneMute : Error ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (data == false) {
                        console.log('AudioFrameworkTest: Callback : isMicrophoneMute: FALSE: PASS: ' + data);
                        expect(true).assertTrue();
                    }
                    else {
                        console.log('AudioFrameworkTest: Callback : isMicrophoneMute: FALSE: FAIL: ' + data);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setDeviceActive_002
                * @tc.name      : setDeviceActive - SPEAKER - deactivate - Promise
                * @tc.desc      : Deactivate speaker - Promise
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setDeviceActive_002', 0, async function (done) {
        await audioManager.setDeviceActive(2, false).then(function () {
            // Setting device active ENUM 2 = SPEAKER
            console.info('AudioFrameworkTest: Device Test: Promise : setDeviceActive : SPEAKER: Deactivate');
            audioManager.isDeviceActive(audio.ActiveDeviceType.SPEAKER).then(function (value) {
                if (value == false) {
                    console.info('AudioFrameworkTest: Device Test: Promise : isDeviceActive : SPEAKER: Deactivate : PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Device Test: Promise : isDeviceActive : SPEAKER: Deactivate : FAIL :' + value);
                    expect(false).assertTrue();
                }
            });
        }).catch((err) => {
            console.info('AudioFrameworkTest: Device Test: Promise : isDeviceActive : SPEAKER: Deactivate : FAIL : Error :' + err.message);
            expect(false).assertTrue();
        });
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setDeviceActive_003
                * @tc.name      : setDeviceActive - SPEAKER - Activate - Promise
                * @tc.desc      : Activate speaker - Promise
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setDeviceActive_003', 0, async function (done) {
        await audioManager.setDeviceActive(audio.ActiveDeviceType.SPEAKER, true).then(function () {
            console.info('AudioFrameworkTest: Device Test: Promise : setDeviceActive : SPEAKER: Activate');
            audioManager.isDeviceActive(2).then(function (value) {
                if (value == true) {
                    console.info('AudioFrameworkTest: Device Test: Promise : isDeviceActive : SPEAKER: Activate : PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Device Test: Promise : isDeviceActive : SPEAKER: Activate : FAIL :' + value);
                    expect(false).assertTrue();
                }
            });
        }).catch((err) => {
            console.info('AudioFrameworkTest: Device Test: Promise : isDeviceActive : SPEAKER: Activate : FAIL :Error :' + err.message);
            expect(false).assertTrue();
        });
        done();
    })


    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setDeviceActive_006
                * @tc.name      : setDeviceActive - SPEAKER - deactivate - Callback
                * @tc.desc      : Deactivate speaker - Callback
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setDeviceActive_006', 0, async function (done) {
        audioManager.setDeviceActive(audio.ActiveDeviceType.SPEAKER, false, (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: Device Test: Callback : setDeviceActive : SPEAKER: Deactivate: Error: ${err.message}`);
                expect(false).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: Device Test: Callback : setDeviceActive : SPEAKER: Active');
                audioManager.isDeviceActive(2, (err, value) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate: Error: ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (value == false) {
                        console.info('AudioFrameworkTest: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate : PASS :' + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info('AudioFrameworkTest: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate : FAIL :' + value);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setDeviceActive_007
                * @tc.name      : setDeviceActive - SPEAKER - deactivate - Callback
                * @tc.desc      : Activate speaker - Callback
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setDeviceActive_007', 0, async function (done) {
        audioManager.setDeviceActive(audio.ActiveDeviceType.SPEAKER, true, (err) => {
            if (err) {
                console.error(`AudioFrameworkTest: Device Test: Callback : setDeviceActive : SPEAKER: Active: Error: ${err.message}`);
                expect(false).assertTrue();
            }
            else {
                console.info('AudioFrameworkTest: Device Test: Callback : setDeviceActive : SPEAKER: Active');
                audioManager.isDeviceActive(2, (err, value) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: Device Test: Callback : isDeviceActive : SPEAKER: Active: Error: ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (value == true) {
                        console.info('AudioFrameworkTest: Device Test: Callback : isDeviceActive : SPEAKER: Active : PASS :' + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info('AudioFrameworkTest: Device Test: Callback : isDeviceActive : SPEAKER: Active : FAIL :' + value);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })


    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setAudioParameter_001
                * @tc.name      : setAudioParameter - Promise - Character & Number
                * @tc.desc      : setAudioParameter - Promise - Character & Number
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setAudioParameter_001', 0, async function (done) {
        const promise = audioManager.setAudioParameter('VOICE_PHONE_STATUS', '8 bit');
        promise.then(function () {
            console.info('AudioFrameworkTest: Audio Parameter Test: Promise : setAudioParameter');
            audioManager.getAudioParameter('VOICE_PHONE_STATUS').then(function (value) {
                if (value == '8 bit') {
                    console.info('AudioFrameworkTest: Promise: getAudioParameter: Bits per sample : PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Promise: getAudioParameter : Bits per sample : FAIL :' + value);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setAudioParameter_002
                * @tc.name      : setAudioParameter - Promise - Number
                * @tc.desc      : setAudioParameter - Promise - Number
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setAudioParameter_002', 0, async function (done) {
        const promise = audioManager.setAudioParameter('VOICE_PHONE_STATUS', '4800');
        promise.then(function () {
            console.info('AudioFrameworkTest: Audio Parameter Test: Promise : setAudioParameter');
            audioManager.getAudioParameter('VOICE_PHONE_STATUS').then(function (value) {
                if (value == '4800') {
                    console.info('AudioFrameworkTest: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :' + value);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setAudioParameter_003
                * @tc.name      : setAudioParameter - Promise - Long Number
                * @tc.desc      : setAudioParameter - Promise - Long Number
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setAudioParameter_003', 0, async function (done) {
        const promise = audioManager.setAudioParameter('VOICE_PHONE_STATUS', longValue);
        promise.then(function () {
            console.info('AudioFrameworkTest: Audio Parameter Test: Promise : setAudioParameter');
            audioManager.getAudioParameter('VOICE_PHONE_STATUS').then(function (value) {
                if (value == longValue) {
                    console.info('AudioFrameworkTest: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :' + value);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setAudioParameter_004
                * @tc.name      : setAudioParameter - Promise - Decimal
                * @tc.desc      : setAudioParameter - Promise - Decimal
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setAudioParameter_004', 0, async function (done) {
        const promise = audioManager.setAudioParameter('VOICE_PHONE_STATUS', '10.000000234324324324');
        promise.then(function () {
            console.info('AudioFrameworkTest: Audio Parameter Test: Promise : setAudioParameter');
            audioManager.getAudioParameter('VOICE_PHONE_STATUS').then(function (value) {
                if (value == '10.000000234324324324') {
                    console.info('AudioFrameworkTest: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :' + value);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
               * @tc.number    : SUB_AUDIO_MANAGER_setAudioParameter_005
               * @tc.name      : setAudioParameter - Promise - Parameter name Number
               * @tc.desc      : setAudioParameter - Promise - Parameter name Number
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0
           */
    it('SUB_AUDIO_MANAGER_setAudioParameter_005', 0, async function (done) {
        const promise = audioManager.setAudioParameter('VOICE_PHONE_STATUS', 'PPNumber');
        promise.then(function () {
            console.info('AudioFrameworkTest: Audio Parameter Test: Promise : setAudioParameter');
            audioManager.getAudioParameter('VOICE_PHONE_STATUS').then(function (value) {
                if (value == 'PPNumber') {
                    console.info('AudioFrameworkTest: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :' + value);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setAudioParameter_006
                * @tc.name      : setAudioParameter - Promise - Special Characters
                * @tc.desc      : setAudioParameter - Promise - Special Characters
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setAudioParameter_006', 0, async function (done) {
        const promise = audioManager.setAudioParameter('VOICE_PHONE_STATUS', '[]\:";<>?,./~!@#$%^*()_+-={}|');
        promise.then(function () {
            console.info('AudioFrameworkTest: Audio Parameter Test: Promise : setAudioParameter');
            audioManager.getAudioParameter('VOICE_PHONE_STATUS').then(function (value) {
                if (value == '[]\:";<>?,./~!@#$%^*()_+-={}|') {
                    console.info('AudioFrameworkTest: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :' + value);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setAudioParameter_007
                * @tc.name      : setAudioParameter - Callback - Character & Number
                * @tc.desc      : setAudioParameter - Callback - Character & Number
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setAudioParameter_007', 0, async function (done) {
        audioManager.setAudioParameter('VOICE_PHONE_STATUS', '16 bit', (err) => {
            console.info('AudioFrameworkTest: Audio Parameter Test: Callback : setAudioParameter');
            if (err) {
                console.error(`AudioFrameworkTest: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
                expect(false).assertTrue();
            }
            else {
                audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (value == '16 bit') {
                        console.info('AudioFrameworkTest: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :' + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info('AudioFrameworkTest: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :' + value);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setAudioParameter_008
                * @tc.name      : setAudioParameter - Callback - Special Character
                * @tc.desc      : setAudioParameter - Callback - Special Character
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setAudioParameter_008', 0, async function (done) {
        audioManager.setAudioParameter('VOICE_PHONE_STATUS', '~!@#$%^*()_+-={}|[]\:";<>?,./', (err) => {
            console.info('AudioFrameworkTest: Audio Parameter Test: Callback : setAudioParameter');
            if (err) {
                console.error(`AudioFrameworkTest: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
                expect(false).assertTrue();
            }
            else {
                audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: Callback : getAudioParam: VOICE_PHONE_STATUS: Error: ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (value == '~!@#$%^*()_+-={}|[]\:";<>?,./') {
                        console.info('AudioFrameworkTest: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :' + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info('AudioFrameworkTest: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :' + value);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setAudioParameter_009
                * @tc.name      : setAudioParameter - Callback - Decimal
                * @tc.desc      : setAudioParameter - Callback - Decimal
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setAudioParameter_009', 0, async function (done) {
        audioManager.setAudioParameter('VOICE_PHONE_STATUS', '10000.21321432432432', (err) => {
            console.info('AudioFrameworkTest: Audio Parameter Test: Callback : setAudioParameter');
            if (err) {
                console.error(`AudioFrameworkTest: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
                expect(false).assertTrue();
            }
            else {
                audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: Callback :getAudioParm: VOICE_PHONE_STATUS:Error: ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (value == '10000.21321432432432') {
                        console.info('AudioFrameworkTest: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :' + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info('AudioFrameworkTest: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :' + value);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setAudioParameter_010
                * @tc.name      : setAudioParameter - Callback - Number
                * @tc.desc      : setAudioParameter - Callback - Number
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setAudioParameter_010', 0, async function (done) {
        audioManager.setAudioParameter('VOICE_PHONE_STATUS', '5454', (err) => {
            console.info('AudioFrameworkTest: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter');
            if (err) {
                console.error(`AudioFrameworkTest: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
                expect(false).assertTrue();
            }
            else {
                audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
                    if (err) {
                        console.error(`AudioFrameworkTest: Callback : getAudioParam: VOICE_PHONE_STATUS: Error: ${err.message}`);
                        expect(false).assertTrue();
                    }
                    else if (value == '5454') {
                        console.info('AudioFrameworkTest: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :' + value);
                        expect(true).assertTrue();
                    }
                    else {
                        console.info('AudioFrameworkTest: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :' + value);
                        expect(false).assertTrue();
                    }
                    done();
                });
            }
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setAudioParameter_011
                * @tc.name      : setAudioParameter - Callback - Long Number
                * @tc.desc      : setAudioParameter - Callback - Long Number
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setAudioParameter_011', 0, async function (done) {
        audioManager.setAudioParameter('VOICE_PHONE_STATUS', longValue, (err) => {
            console.info('AudioFrameworkTest: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter');
            if (err) {
                console.error(`AudioFrameworkTest: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
                expect(false).assertTrue();
            }
            audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
                if (err) {
                    console.error(`AudioFrameworkTest: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
                    expect(false).assertTrue();
                }
                else if (value == longValue) {
                    console.info('AudioFrameworkTest: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :' + value);
                    expect(false).assertTrue();
                }
                done();
            });
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_setAudioParameter_012
                * @tc.name      : setAudioParameter - Callback - Parameter name Number
                * @tc.desc      : setAudioParameter - Callback - Parameter name Number
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_setAudioParameter_012', 0, async function (done) {
        audioManager.setAudioParameter('VOICE_PHONE_STATUS', 'xyza', (err) => {
            console.info('AudioFrameworkTest: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter');
            if (err) {
                console.error(`AudioFrameworkTest: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
                expect(false).assertTrue();
            }
            audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
                if (err) {
                    console.error(`AudioFrameworkTest: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
                    expect(false).assertTrue();
                }
                else if (value == 'xyza') {
                    console.info('AudioFrameworkTest: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :' + value);
                    expect(false).assertTrue();
                }
                done();
            });
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getAudioParameter_001
                * @tc.name      : getAudioParameter - Promise - Character & Number
                * @tc.desc      : getAudioParameter - Promise - Character & Number
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getAudioParameter_001', 0, async function (done) {
        const promise = audioManager.setAudioParameter('VOICE_PHONE_STATUS', '8 bit');
        promise.then(function () {
            console.info('AudioFrameworkTest: Audio Parameter Test: Promise : setAudioParameter');
            audioManager.getAudioParameter('VOICE_PHONE_STATUS').then(function (value) {
                if (value == '8 bit') {
                    console.info('AudioFrameworkTest: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :' + value);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getAudioParameter_002
                * @tc.name      : getAudioParameter - Promise - Number
                * @tc.desc      : getAudioParameter - Promise - Number
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getAudioParameter_002', 0, async function (done) {
        const promise = audioManager.setAudioParameter('VOICE_PHONE_STATUS', '4800');
        promise.then(function () {
            console.info('AudioFrameworkTest: Audio Parameter Test: Promise : setAudioParameter');
            audioManager.getAudioParameter('VOICE_PHONE_STATUS').then(function (value) {
                if (value == '4800') {
                    console.info('AudioFrameworkTest: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :' + value);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getAudioParameter_003
                * @tc.name      : getAudioParameter - Promise - Long Number
                * @tc.desc      : getAudioParameter - Promise - Long Number
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getAudioParameter_003', 0, async function (done) {
        const promise = audioManager.setAudioParameter('VOICE_PHONE_STATUS', longValue);
        promise.then(function () {
            console.info('AudioFrameworkTest: Audio Parameter Test: Promise : setAudioParameter');
            audioManager.getAudioParameter('VOICE_PHONE_STATUS').then(function (value) {
                if (value == longValue) {
                    console.info('AudioFrameworkTest: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :' + value);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getAudioParameter_004
                * @tc.name      : getAudioParameter - Promise - Decimal
                * @tc.desc      : getAudioParameter - Promise - Decimal
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getAudioParameter_004', 0, async function (done) {
        const promise = audioManager.setAudioParameter('VOICE_PHONE_STATUS', '10.0000000000234');
        promise.then(function () {
            console.info('AudioFrameworkTest: Audio Parameter Test: Promise : setAudioParameter');
            audioManager.getAudioParameter('VOICE_PHONE_STATUS').then(function (value) {
                if (value == '10.0000000000234') {
                    console.info('AudioFrameworkTest: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :' + value);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
               * @tc.number    : SUB_AUDIO_MANAGER_getAudioParameter_005
               * @tc.name      : getAudioParameter - Promise - Parameter name Number
               * @tc.desc      : getAudioParameter - Promise - Parameter name Number
               * @tc.size      : MEDIUM
               * @tc.type      : Function
               * @tc.level     : Level 0
           */
    it('SUB_AUDIO_MANAGER_getAudioParameter_005', 0, async function (done) {
        const promise = audioManager.setAudioParameter('VOICE_PHONE_STATUS', 'PPNumber');
        promise.then(function () {
            console.info('AudioFrameworkTest: Audio Parameter Test: Promise : setAudioParameter');
            audioManager.getAudioParameter('VOICE_PHONE_STATUS').then(function (value) {
                if (value == 'PPNumber') {
                    console.info('AudioFrameworkTest: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :' + value);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getAudioParameter_006
                * @tc.name      : getAudioParameter - Promise - Special Characters
                * @tc.desc      : getAudioParameter - Promise - Special Characters 
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getAudioParameter_006', 0, async function (done) {
        const promise = audioManager.setAudioParameter('VOICE_PHONE_STATUS', '[]\:";<>?,./~!@#$%^*()_+-={}|');
        promise.then(function () {
            console.info('AudioFrameworkTest: Audio Parameter Test: Promise : setAudioParameter');
            audioManager.getAudioParameter('VOICE_PHONE_STATUS').then(function (value) {
                if (value == '[]\:";<>?,./~!@#$%^*()_+-={}|') {
                    console.info('AudioFrameworkTest: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :' + value);
                    expect(false).assertTrue();
                }
            });
        });
        await promise;
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getAudioParameter_007
                * @tc.name      : getAudioParameter - Callback - Character & Number 
                * @tc.desc      : getAudioParameter - Callback - Character & Number
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getAudioParameter_007', 0, async function (done) {
        audioManager.setAudioParameter('VOICE_PHONE_STATUS', '16 bit', (err) => {
            console.info('AudioFrameworkTest: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter');
            if (err) {
                console.error(`AudioFrameworkTest: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
                expect(false).assertTrue();
            }
            audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
                if (err) {
                    console.error(`AudioFrameworkTest: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
                    expect(false).assertTrue();
                }
                else if (value == '16 bit') {
                    console.info('AudioFrameworkTest: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :' + value);
                    expect(false).assertTrue();
                }
                done();
            });
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getAudioParameter_008
                * @tc.name      : getAudioParameter - Callback - Special Character ~!@#$%^*()_+-={}|[]\:";<>?,./
                * @tc.desc      : getAudioParameter - Callback - Special Character
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getAudioParameter_008', 0, async function (done) {
        audioManager.setAudioParameter('VOICE_PHONE_STATUS', '~!@#$%^*()_+-={}|[]\:";<>?,./', (err) => {
            console.info('AudioFrameworkTest: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter');
            if (err) {
                console.error(`AudioFrameworkTest: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
                expect(false).assertTrue();
            }
            audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
                if (err) {
                    console.error(`AudioFrameworkTest: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
                    expect(false).assertTrue();
                }
                else if (value == '~!@#$%^*()_+-={}|[]\:";<>?,./') {
                    console.info('AudioFrameworkTest: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :' + value);
                    expect(false).assertTrue();
                }
                done();
            });
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getAudioParameter_009
                * @tc.name      : getAudioParameter - Callback - Decimal
                * @tc.desc      : getAudioParameter - Callback - Decimal 10000.21321432432432
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getAudioParameter_009', 0, async function (done) {
        audioManager.setAudioParameter('VOICE_PHONE_STATUS', '10000.21321432432432', (err) => {
            console.info('AudioFrameworkTest: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter');
            if (err) {
                console.error(`AudioFrameworkTest: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
                expect(false).assertTrue();
            }
            audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
                if (err) {
                    console.error(`AudioFrameworkTest: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
                    expect(false).assertTrue();
                }
                else if (value == '10000.21321432432432') {
                    console.info('AudioFrameworkTest: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :' + value);
                    expect(false).assertTrue();
                }
                done();
            });
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getAudioParameter_010
                * @tc.name      : getAudioParameter - Callback - Number 5454
                * @tc.desc      : getAudioParameter - Callback - Number
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getAudioParameter_010', 0, async function (done) {
        audioManager.setAudioParameter('VOICE_PHONE_STATUS', '5454', (err) => {
            console.info('AudioFrameworkTest: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter');
            if (err) {
                console.error(`AudioFrameworkTest: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
                expect(false).assertTrue();
            }
            audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
                if (err) {
                    console.error(`AudioFrameworkTest: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
                    expect(false).assertTrue();
                }
                else if (value == '5454') {
                    console.info('AudioFrameworkTest: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :' + value);
                    expect(false).assertTrue();
                }
                done();
            });
            done();
        });
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getAudioParameter_011
                * @tc.name      : getAudioParameter - Callback - Long Number longValue
                * @tc.desc      : getAudioParameter - Callback - Long Number
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_getAudioParameter_011', 0, async function (done) {
        audioManager.setAudioParameter('VOICE_PHONE_STATUS', longValue, (err) => {
            console.info('AudioFrameworkTest: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter');
            if (err) {
                console.error(`AudioFrameworkTest: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
                expect(false).assertTrue();
            }
            audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
                if (err) {
                    console.error(`AudioFrameworkTest: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
                    expect(false).assertTrue();
                }
                else if (value == longValue) {
                    console.info('AudioFrameworkTest: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :' + value);
                    expect(false).assertTrue();
                }
                done();
            });
            done();
        });
    })


    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_getAudioParameter_012
                * @tc.name      : getAudioParameter - Callback - Parameter name Number
                * @tc.desc      : getAudioParameter - Callback - Parameter name Number
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */

    it('SUB_AUDIO_MANAGER_getAudioParameter_012', 0, async function (done) {
        audioManager.setAudioParameter('VOICE_PHONE_STATUS', 'xyza', (err) => {
            console.info('AudioFrameworkTest: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter');
            if (err) {
                console.error(`AudioFrameworkTest: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
                expect(false).assertTrue();
            }
            audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
                if (err) {
                    console.error(`AudioFrameworkTest: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
                    expect(false).assertTrue();
                }
                else if (value == 'xyza') {
                    console.info('AudioFrameworkTest: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :' + value);
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :' + value);
                    expect(false).assertTrue();
                }
                done();
            });
            done();
        });
    })


    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_onVolumeChange_001
                * @tc.name      : OnVolumeChange - setVolume - MEDIA
                * @tc.desc      : OnVolumeChange - setVolume - MEDIA
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_onVolumeChange_001', 0, async function (done) {

        audioManager.on('volumeChange', (VolumeEvent) => {

            console.log('AudioFrameworkTest: Volume Change Event is called');

            switch (VolumeEvent.volumeType) {
                case audio.AudioVolumeType.MEDIA:
                    console.info('AudioFrameworkTest: Audio Volume Type : MEDIA');
                    console.info('AudioFrameworkTest: Audio Volume Number : ' + VolumeEvent.volume);
                    console.info('AudioFrameworkTest: Audio Volume Update UI : ' + VolumeEvent.updateUi);
                    if (VolumeEvent.volume == lowVol) {
                        console.info('AudioFrameworkTest: MEDIA CallBack : PASS :' + VolumeEvent.volume);
                        expect(true).assertTrue();
                    }
                    break;
                default:
                    console.info('AudioFrameworkTest: Audio Volume Type : ' + VolumeEvent.volumeType);
                    console.info('AudioFrameworkTest: Audio Volume Number : ' + VolumeEvent.volume);
                    console.info('AudioFrameworkTest: Audio Volume Update UI : ' + VolumeEvent.updateUi);
                    expect(false).assertTrue();
                    break;
            }
        });
        await audioManager.setVolume(audioMedia, lowVol);
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_onVolumeChange_002
                * @tc.name      : OnVolumeChange - setVolume - RINGTONE
                * @tc.desc      : OnVolumeChange - setVolume - RINGTONE
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_onVolumeChange_002', 0, async function (done) {

        audioManager.on('volumeChange', (VolumeEvent) => {

            console.log('AudioFrameworkTest: Volume Change Event is called');

            switch (VolumeEvent.volumeType) {
                case audio.AudioVolumeType.RINGTONE:
                    console.info('AudioFrameworkTest: Audio Volume Type : RINGTONE');
                    console.info('AudioFrameworkTest: Audio Volume Number : ' + VolumeEvent.volume);
                    console.info('AudioFrameworkTest: Audio Volume Update UI : ' + VolumeEvent.updateUi);
                    if (VolumeEvent.volume == lowVol) {
                        console.info('AudioFrameworkTest: RINGTONE CallBack : PASS :' + VolumeEvent.volume);
                        expect(true).assertTrue();
                    }
                    break;
                default:
                    console.info('AudioFrameworkTest: Audio Volume Type : ' + VolumeEvent.volumeType);
                    console.info('AudioFrameworkTest: Audio Volume Number : ' + VolumeEvent.volume);
                    console.info('AudioFrameworkTest: Audio Volume Update UI : ' + VolumeEvent.updateUi);
                    expect(false).assertTrue();
                    break;
            }
        });
        await audioManager.setVolume(audioRingtone, lowVol);
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_onVolumeChange_003
                * @tc.name      : OnVolumeChange - setVolume - VOICE_CALL
                * @tc.desc      : OnVolumeChange - setVolume - VOICE_CALL
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_onVolumeChange_003', 0, async function (done) {

        audioManager.on('volumeChange', (VolumeEvent) => {

            console.log('AudioFrameworkTest: Volume Change Event is called');

            switch (VolumeEvent.volumeType) {
                case audio.AudioVolumeType.VOICE_CALL:
                    console.info('AudioFrameworkTest: Audio Volume Type : VOICE_CALL');
                    console.info('AudioFrameworkTest: Audio Volume Number : ' + VolumeEvent.volume);
                    console.info('AudioFrameworkTest: Audio Volume Update UI : ' + VolumeEvent.updateUi);
                    if (VolumeEvent.volume == lowVol) {
                        console.info('AudioFrameworkTest: VOICE_CALL CallBack : PASS :' + VolumeEvent.volume);
                        expect(true).assertTrue();
                    }
                    break;
                default:
                    console.info('AudioFrameworkTest: Audio Volume Type : ' + VolumeEvent.volumeType);
                    console.info('AudioFrameworkTest: Audio Volume Number : ' + VolumeEvent.volume);
                    console.info('AudioFrameworkTest: Audio Volume Update UI : ' + VolumeEvent.updateUi);
                    expect(false).assertTrue();
                    break;
            }
        });
        await audioManager.setVolume(audio.AudioVolumeType.VOICE_CALL, lowVol);
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_onVolumeChange_004
                * @tc.name      : OnVolumeChange - setVolume - VOICE_ASSISTANT
                * @tc.desc      : OnVolumeChange - setVolume - VOICE_ASSISTANT
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_onVolumeChange_004', 0, async function (done) {

        audioManager.on('volumeChange', (VolumeEvent) => {

            console.log('AudioFrameworkTest: Volume Change Event is called');

            switch (VolumeEvent.volumeType) {
                case audio.AudioVolumeType.VOICE_ASSISTANT:
                    console.info('AudioFrameworkTest: Audio Volume Type : VOICE_ASSISTANT');
                    console.info('AudioFrameworkTest: Audio Volume Number : ' + VolumeEvent.volume);
                    console.info('AudioFrameworkTest: Audio Volume Update UI : ' + VolumeEvent.updateUi);
                    if (VolumeEvent.volume == lowVol) {
                        console.info('AudioFrameworkTest: VOICE_ASSISTANT CallBack : PASS :' + VolumeEvent.volume);
                        expect(true).assertTrue();
                    }
                    break;
                default:
                    console.info('AudioFrameworkTest: Audio Volume Type : ' + VolumeEvent.volumeType);
                    console.info('AudioFrameworkTest: Audio Volume Number : ' + VolumeEvent.volume);
                    console.info('AudioFrameworkTest: Audio Volume Update UI : ' + VolumeEvent.updateUi);
                    expect(false).assertTrue();
                    break;
            }
        });
        await audioManager.setVolume(audio.AudioVolumeType.VOICE_ASSISTANT, lowVol);
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_RingerModeChange_001
                * @tc.name      : RingerModeChange - RINGER_MODE_SILENT
                * @tc.desc      : RingerModeChange - RINGER_MODE_SILENT
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_RingerModeChange_001', 0, async function (done) {

        audioManager.on('ringerModeChange', (ringerMode) => {

            console.log('AudioFrameworkTest: RingerModeChange is called');

            switch (ringerMode) {
                case audio.AudioRingMode.RINGER_MODE_SILENT:
                    console.info('AudioFrameworkTest: Ringer Mode Changed to : RINGER_MODE_SILENT : ' + ringerMode);
                    expect(true).assertTrue();
                    break;
                default:
                    console.info('AudioFrameworkTest: Ringer Mode Changed  : UNKNOWN ' + ringerMode);
                    expect(false).assertTrue();
                    break;
            }
        });
        await audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_SILENT);
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_RingerModeChange_002
                * @tc.name      : RingerModeChange - RINGER_MODE_VIBRATE
                * @tc.desc      : RingerModeChange - RINGER_MODE_VIBRATE
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_RingerModeChange_002', 0, async function (done) {

        audioManager.on('ringerModeChange', (ringerMode) => {

            console.log('AudioFrameworkTest: RingerModeChange is called');

            switch (ringerMode) {
                case audio.AudioRingMode.RINGER_MODE_VIBRATE:
                    console.info('AudioFrameworkTest: Ringer Mode Changed to : RINGER_MODE_VIBRATE : ' + ringerMode);
                    expect(true).assertTrue();
                    break;
                default:
                    console.info('AudioFrameworkTest: Ringer Mode Changed  : UNKNOWN ' + ringerMode);
                    expect(false).assertTrue();
                    break;
            }
        });
        await audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_VIBRATE);
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_RingerModeChange_001
                * @tc.name      : RingerModeChange - RINGER_MODE_SILENT
                * @tc.desc      : RingerModeChange - RINGER_MODE_SILENT
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_RingerModeChange_001', 0, async function (done) {

        audioManager.on('ringerModeChange', (ringerMode) => {
            console.log('AudioFrameworkTest: RingerModeChange is called');
            switch (ringerMode) {
                case audio.AudioRingMode.RINGER_MODE_NORMAL:
                    console.info('AudioFrameworkTest: Ringer Mode Changed to : RINGER_MODE_NORMAL : ' + ringerMode);
                    expect(true).assertTrue();
                    break;
                default:
                    console.info('AudioFrameworkTest: Ringer Mode Changed  : UNKNOWN ' + ringerMode);
                    expect(false).assertTrue();
                    break;
            }
        });
        await audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_NORMAL);
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_INTERRUPT_001
                * @tc.name      : InterruptType - INTERRUPT_TYPE_BEGIN
                * @tc.desc      : InterruptType - INTERRUPT_TYPE_BEGIN
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_INTERRUPT_001', 0, async function (done) {
        expect(audio.InterruptType.INTERRUPT_TYPE_BEGIN).assertEqual(1);
        await sleep(50);
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_INTERRUPT_002
                * @tc.name      : InterruptType - INTERRUPT_TYPE_END
                * @tc.desc      : InterruptType - INTERRUPT_TYPE_END
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_INTERRUPT_002', 0, async function (done) {
        expect(audio.InterruptType.INTERRUPT_TYPE_END).assertEqual(2);
        await sleep(50);
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_INTERRUPT_003
                * @tc.name      : InterruptHint - INTERRUPT_HINT_NONE
                * @tc.desc      : InterruptHint - INTERRUPT_HINT_NONE
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_INTERRUPT_003', 0, async function (done) {
        expect(audio.InterruptHint.INTERRUPT_HINT_NONE).assertEqual(0);
        await sleep(50);
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_INTERRUPT_004
                * @tc.name      : InterruptHint - INTERRUPT_HINT_RESUME
                * @tc.desc      : InterruptHint - INTERRUPT_HINT_RESUME
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_INTERRUPT_004', 0, async function (done) {
        expect(audio.InterruptHint.INTERRUPT_HINT_RESUME).assertEqual(1);
        await sleep(50);
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_INTERRUPT_005
                * @tc.name      : InterruptHint - INTERRUPT_HINT_PAUSE
                * @tc.desc      : InterruptHint - INTERRUPT_HINT_PAUSE
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_INTERRUPT_005', 0, async function (done) {
        expect(audio.InterruptHint.INTERRUPT_HINT_PAUSE).assertEqual(2);
        await sleep(50);
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_INTERRUPT_006
                * @tc.name      : InterruptHint - INTERRUPT_HINT_STOP
                * @tc.desc      : InterruptHint - INTERRUPT_HINT_STOP
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_INTERRUPT_006', 0, async function (done) {
        expect(audio.InterruptHint.INTERRUPT_HINT_STOP).assertEqual(3);
        await sleep(50);
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_INTERRUPT_007
                * @tc.name      : InterruptHint - INTERRUPT_HINT_DUCK
                * @tc.desc      : InterruptHint - INTERRUPT_HINT_DUCK
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_INTERRUPT_007', 0, async function (done) {
        expect(audio.InterruptHint.INTERRUPT_HINT_DUCK).assertEqual(4);
        await sleep(50);
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_INTERRUPT_008
                * @tc.name      : InterruptHint - INTERRUPT_HINT_UNDUCK
                * @tc.desc      : InterruptHint - INTERRUPT_HINT_UNDUCK
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_INTERRUPT_008', 0, async function (done) {
        expect(audio.InterruptHint.INTERRUPT_HINT_UNDUCK).assertEqual(5);
        await sleep(50);
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_INTERRUPT_009
                * @tc.name      : InterruptForceType - INTERRUPT_FORCE
                * @tc.desc      : InterruptForceType - INTERRUPT_FORCE
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_INTERRUPT_009', 0, async function (done) {
        expect(audio.InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
        await sleep(50);
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_INTERRUPT_010
                * @tc.name      : InterruptForceType - INTERRUPT_SHARE
                * @tc.desc      : InterruptForceType - INTERRUPT_SHARE
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
            */
    it('SUB_AUDIO_MANAGER_INTERRUPT_010', 0, async function (done) {
        expect(audio.InterruptForceType.INTERRUPT_SHARE).assertEqual(1);
        await sleep(50);
        done();
    })

    /* *
             * @tc.number    : SUB_AUDIO_MANAGER_INTERRUPT_011
             * @tc.name      : ActiveDeviceType - BLUETOOTH_SCO
             * @tc.desc      : ActiveDeviceType - BLUETOOTH_SCO
             * @tc.size      : MEDIUM
             * @tc.type      : Function
             * @tc.level     : Level 0
         */
    it('SUB_AUDIO_MANAGER_INTERRUPT_011', 0, async function (done) {
        expect(audio.ActiveDeviceType.BLUETOOTH_SCO).assertEqual(7);
        await sleep(50);
        done();
    })

    /* *
              * @tc.number    : SUB_AUDIO_MANAGER_INTERRUPT_012
              * @tc.name      : ActiveDeviceType - SPEAKER
              * @tc.desc      : ActiveDeviceType - SPEAKER
              * @tc.size      : MEDIUM
              * @tc.type      : Function
              * @tc.level     : Level 0
          */
    it('SUB_AUDIO_MANAGER_INTERRUPT_012', 0, async function (done) {
        expect(audio.ActiveDeviceType.SPEAKER).assertEqual(2);
        await sleep(50);
        done();
    })

    /* *
            * @tc.number    : SUB_AUDIO_MANAGER_InterruptActionType_001
            * @tc.name      : InterruptActionType - TYPE_ACTIVATED 
            * @tc.desc      : InterruptActionType - TYPE_ACTIVATED 
            * @tc.size      : MEDIUM
            * @tc.type      : Function
            * @tc.level     : Level 0
        */
    it('SUB_AUDIO_MANAGER_InterruptActionType_001', 0, async function (done) {
        expect(audio.InterruptActionType.TYPE_ACTIVATED).assertEqual(0);
        await sleep(50);
        done();
    })

    /* *
                * @tc.number    : SUB_AUDIO_MANAGER_InterruptActionType_002
                * @tc.name      : InterruptActionType - TYPE_INTERRUPT
                * @tc.desc      : InterruptActionType - TYPE_INTERRUPT
                * @tc.size      : MEDIUM
                * @tc.type      : Function
                * @tc.level     : Level 0
    */
    it('SUB_AUDIO_MANAGER_InterruptActionType_002', 0, async function (done) {
        expect(audio.InterruptActionType.TYPE_INTERRUPT).assertEqual(1);
        await sleep(50);
        done();
    })

    /* *
            * @tc.number    : SUB_AUDIO_MANAGER_DeviceType_001
            * @tc.name      : DeviceType - ALL Device Type
            * @tc.desc      : DeviceType - ALL Device Type
            * @tc.size      : MEDIUM
            * @tc.type      : Function
            * @tc.level     : Level 0
        */
    it('SUB_AUDIO_MANAGER_DeviceType_001', 0, async function (done) {
        expect(audio.DeviceType.INVALID).assertEqual(0);
        console.info("audio.DeviceType.INVALID:"+audio.DeviceType.INVALID);
        expect(audio.DeviceType.EARPIECE).assertEqual(1);
        console.info("audio.DeviceType.EARPIECE:"+audio.DeviceType.EARPIECE);
        expect(audio.DeviceType.SPEAKER).assertEqual(2);
        console.info("audio.DeviceType.SPEAKER:"+audio.DeviceType.SPEAKER);
        expect(audio.DeviceType.WIRED_HEADSET).assertEqual(3);
        console.info("audio.DeviceType.WIRED_HEADSET:"+audio.DeviceType.WIRED_HEADSET);
        expect(audio.DeviceType.WIRED_HEADPHONES).assertEqual(4);
        console.info("audio.DeviceType.WIRED_HEADPHONES:"+audio.DeviceType.WIRED_HEADPHONES);
        expect(audio.DeviceType.BLUETOOTH_SCO).assertEqual(7);
        console.info("audio.DeviceType.BLUETOOTH_SCO:"+audio.DeviceType.BLUETOOTH_SCO);
        expect(audio.DeviceType.BLUETOOTH_A2DP).assertEqual(8);
        console.info("audio.DeviceType.BLUETOOTH_A2DP:"+audio.DeviceType.BLUETOOTH_A2DP);
        expect(audio.DeviceType.MIC).assertEqual(15);
        console.info("audio.DeviceType.MIC:"+audio.DeviceType.MIC);
        expect(audio.DeviceType.USB_HEADSET).assertEqual(22);
        console.info("audio.DeviceType.USB_HEADSET:"+audio.DeviceType.USB_HEADSET);
        await sleep(50);
        done();
    })
	
	/* *
            * @tc.number    : SUB_AUDIO_MANAGER_DeviceRole_001
            * @tc.name      : DeviceRole - ALL Device Role
            * @tc.desc      : DeviceRole - ALL Device Role
            * @tc.size      : MEDIUM
            * @tc.type      : Function
            * @tc.level     : Level 0
        */
    it('SUB_AUDIO_MANAGER_DeviceRole_001', 0, async function (done) {
        expect(audio.DeviceRole.INPUT_DEVICE).assertEqual(1);
        console.info("audio.DeviceRole.INPUT_DEVICE :"+audio.DeviceRole.INPUT_DEVICE);
        expect(audio.DeviceRole.OUTPUT_DEVICE).assertEqual(2);
        console.info("audio.DeviceRole.OUTPUT_DEVICE :"+audio.DeviceRole.OUTPUT_DEVICE);
        await sleep(50);
        done();
    })
	
	/* *
            * @tc.number    : SUB_AUDIO_ROUTING_MANAGER_getDevices_001
            * @tc.name      : getDevices - Output device - Callback
            * @tc.desc      : getDevices - Output device
            * @tc.size      : MEDIUM
            * @tc.type      : Function
            * @tc.level     : Level 0
        */
    it('SUB_AUDIO_ROUTING_MANAGER_getDevices_001', 0, async function (done) {
        dRValue = null;
        dTValue = null;
        devId = null;
        devName = null;
        devAddr = null;
        sRate = null;
        cCount = null;
        cMask = null;
        let AudioRoutingManager = await audioManager.getRoutingManager();
        AudioRoutingManager.getDevices(1, (err, value) => {
            // Getting all Output devices Enumb 1 = OUTPUT_DEVICES_FLAG
            console.info('AudioFrameworkTest: Callback: getDevices OUTPUT_DEVICES_FLAG');

            if (err) {
                console.error(`AudioFrameworkTest:Callback: OUTPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
                expect().assertFail();
            }
            else {
                console.info('AudioFrameworkTest: Callback: getDevices OUTPUT_DEVICES_FLAG');
                value.forEach(displayDeviceProp);

                if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null &&
                     cMask != null) {
                    console.info('AudioFrameworkTest: Callback: getDevices : OUTPUT_DEVICES_FLAG :  PASS');
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Callback: getDevices : OUTPUT_DEVICES_FLAG :  FAIL');
                    expect(false).assertTrue();
                }
            }
            done();
        });
    })

    /* *
            * @tc.number    : SUB_AUDIO_ROUTING_MANAGER_getDevices_002
            * @tc.name      : getDevices - Input device - Callback
            * @tc.desc      : getDevices - Input device
            * @tc.size      : MEDIUM
            * @tc.type      : Function
            * @tc.level     : Level 0
        */
    it('SUB_AUDIO_ROUTING_MANAGER_getDevices_002', 0, async function (done) {
        dRValue = null;
        dTValue = null;
        devId = null;
        devName = null;
        devAddr = null;
        sRate = null;
        cCount = null;
        cMask = null;
        let AudioRoutingManager = await audioManager.getRoutingManager();
        AudioRoutingManager.getDevices(2, (err, value) => {
            // Getting all Input Devices ENUM 2 = INPUT_DEVICES_FLAG

            console.info('AudioFrameworkTest: Callback: getDevices INPUT_DEVICES_FLAG');

            if (err) {
                console.error(`AudioFrameworkTest:Callback:INPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
                expect().assertFail();
            }
            else {
                console.info('AudioFrameworkTest: Callback: getDevices INPUT_DEVICES_FLAG');
                value.forEach(displayDeviceProp);

                if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null 
                    && cMask != null) {
                    console.info('AudioFrameworkTest: Callback: getDevices : INPUT_DEVICES_FLAG:  PASS');
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Callback: getDevices : INPUT_DEVICES_FLAG:  FAIL');
                    expect(false).assertTrue();
                }
            }
            done();
        });
    })

    /* *
            * @tc.number    : SUB_AUDIO_ROUTING_MANAGER_getDevices_003
            * @tc.name      : getDevices - ALL device - Callback
            * @tc.desc      : getDevices - ALL device
            * @tc.size      : MEDIUM
            * @tc.type      : Function
            * @tc.level     : Level 0
        */
    it('SUB_AUDIO_ROUTING_MANAGER_getDevices_003', 0, async function (done) {
        dRValue = null;
        dTValue = null;
        devId = null;
        devName = null;
        devAddr = null;
        sRate = null;
        cCount = null;
        cMask = null;
        let AudioRoutingManager = await audioManager.getRoutingManager();
        AudioRoutingManager.getDevices(3, (err, value) => {
            // Getting all devies connected 3 = ALL_DEVICES_FLAG

            console.info('AudioFrameworkTest: Callback: getDevices ALL_DEVICES_FLAG');

            if (err) {
                console.error(`AudioFrameworkTest:Callback:ALL_DEVICES_FLAG: failed to get devices ${err.message}`);
                expect().assertFail();
            }
            else {
                console.info('AudioFrameworkTest: Callback: getDevices ALL_DEVICES_FLAG');
                value.forEach(displayDeviceProp);

                if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && 
                    cMask != null) {
                    console.info('AudioFrameworkTest: Callback: getDevices : ALL_DEVICES_FLAG:  PASS');
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Callback: getDevices : ALL_DEVICES_FLAG:  FAIL');
                    expect(false).assertTrue();
                }
            }
            done();
        });
    })

    /* *
            * @tc.number    : SUB_AUDIO_ROUTING_MANAGER_getDevices_004
            * @tc.name      : getDevices - Output device - Callback - ENAME
            * @tc.desc      : getDevices - Output device
            * @tc.size      : MEDIUM
            * @tc.type      : Function
            * @tc.level     : Level 0
        */
    it('SUB_AUDIO_ROUTING_MANAGER_getDevices_004', 0, async function (done) {
        dRValue = null;
        dTValue = null;
        devId = null;
        devName = null;
        devAddr = null;
        sRate = null;
        cCount = null;
        cMask = null;
        let AudioRoutingManager = await audioManager.getRoutingManager();
        AudioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG, (err, value) => {
            console.info('AudioFrameworkTest: Callback: getDevices OUTPUT_DEVICES_FLAG');
            if (err) {
                console.error(`AudioFrameworkTest:Callback:OUTPUT_DEVICES_FLAG:failed to get devices ${err.message}`);
                expect().assertFail();
            }
            else {
                console.info('AudioFrameworkTest: Callback: getDevices OUTPUT_DEVICES_FLAG');
                value.forEach(displayDeviceProp);
                if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && 
                    cMask != null) {
                    console.info('AudioFrameworkTest: Callback: getDevices : OUTPUT_DEVICES_FLAG :  PASS');
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Callback: getDevices : OUTPUT_DEVICES_FLAG :  FAIL');
                    expect(false).assertTrue();
                }
            }
            done();
        });
    })

    /* *
            * @tc.number    : SUB_AUDIO_ROUTING_MANAGER_getDevices_005
            * @tc.name      : getDevices - Input device - Callback - ENAME
            * @tc.desc      : getDevices - Input device
            * @tc.size      : MEDIUM
            * @tc.type      : Function
            * @tc.level     : Level 0
        */
    it('SUB_AUDIO_ROUTING_MANAGER_getDevices_005', 0, async function (done) {
        dRValue = null;
        dTValue = null;
        devId = null;
        devName = null;
        devAddr = null;
        sRate = null;
        cCount = null;
        cMask = null;
        let AudioRoutingManager = await audioManager.getRoutingManager();
        AudioRoutingManager.getDevices(audio.DeviceFlag.INPUT_DEVICES_FLAG, (err, value) => {
            console.info('AudioFrameworkTest: Callback: getDevices INPUT_DEVICES_FLAG');
            if (err) {
                console.error(`AudioFrameworkTest:Callback:INPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
                expect().assertFail();
            }
            else {
                console.info('AudioFrameworkTest: Callback: getDevices INPUT_DEVICES_FLAG');
                value.forEach(displayDeviceProp);

                if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && 
                    cMask != null) {
                    console.info('AudioFrameworkTest: Callback: getDevices : INPUT_DEVICES_FLAG:  PASS');
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Callback: getDevices : INPUT_DEVICES_FLAG:  FAIL');
                    expect(false).assertTrue();
                }
            }
            done();
        });
    })

    /* *
            * @tc.number    : SUB_AUDIO_ROUTING_MANAGER_getDevices_006
            * @tc.name      : getDevices - ALL device - Callback - ENAME
            * @tc.desc      : getDevices - ALL device
            * @tc.size      : MEDIUM
            * @tc.type      : Function
            * @tc.level     : Level 0
        */
    it('SUB_AUDIO_ROUTING_MANAGER_getDevices_006', 0, async function (done) {
        dRValue = null;
        dTValue = null;
        devId = null;
        devName = null;
        devAddr = null;
        sRate = null;
        cCount = null;
        cMask = null;
        let AudioRoutingManager = await audioManager.getRoutingManager();
        AudioRoutingManager.getDevices(audio.DeviceFlag.ALL_DEVICES_FLAG, (err, value) => {
            console.info('AudioFrameworkTest: Callback: getDevices ALL_DEVICES_FLAG');
            if (err) {
                console.error(`AudioFrameworkTest: Callback: ALL_DEVICES_FLAG: failed to get devices ${err.message}`);
                expect().assertFail();
            }
            else {
                console.info('AudioFrameworkTest: Callback: getDevices ALL_DEVICES_FLAG');
                value.forEach(displayDeviceProp);
                if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && 
                    cMask != null) {
                    console.info('AudioFrameworkTest: Callback: getDevices : ALL_DEVICES_FLAG:  PASS');
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Callback: getDevices : ALL_DEVICES_FLAG:  FAIL');
                    expect(false).assertTrue();
                }
            }
            done();
        });
    })
    
    /* *
            * @tc.number    : SUB_AUDIO_ROUTING_MANAGER_getDevices_008
            * @tc.name      : getDevices - OUTPUT device - Promise - ENAME
            * @tc.desc      : getDevices - OUTPUT device
            * @tc.size      : MEDIUM
            * @tc.type      : Function
            * @tc.level     : Level 0
        */
    it('SUB_AUDIO_ROUTING_MANAGER_getDevices_008', 0, async function (done) {
        dRValue = null;
        dTValue = null;
        devId = null;
        devName = null;
        devAddr = null;
        sRate = null;
        cCount = null;
        cMask = null;
        let AudioRoutingManager = await audioManager.getRoutingManager();
        let value = await AudioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
        console.info('AudioFrameworkTest: Promise: getDevices OUTPUT_DEVICES_FLAG');
        value.forEach(displayDeviceProp);
        if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null &&
                cMask != null) {
            console.info('AudioFrameworkTest: Promise: getDevices:OUTPUT_DEVICES_FLAG : PASS');
            expect(true).assertTrue();
        }
        else {
            console.info('AudioFrameworkTest: Promise: getDevices:OUTPUT_DEVICES_FLAG : FAIL');
            expect(false).assertTrue();
        }
        done();
    })

    /* *
            * @tc.number    : SUB_AUDIO_ROUTING_MANAGER_getDevices_009
            * @tc.name      : getDevices - INPUT device - Promise - ENAME
            * @tc.desc      : getDevices - INPUT device
            * @tc.size      : MEDIUM
            * @tc.type      : Function
            * @tc.level     : Level 0
        */
    it('SUB_AUDIO_ROUTING_MANAGER_getDevices_009', 0, async function (done) {
        dRValue = null;
        dTValue = null;
        devId = null;
        devName = null;
        devAddr = null;
        sRate = null;
        cCount = null;
        cMask = null;
        audioManager.getRoutingManager(async (err,AudioRoutingManager)=>{
            if (err) {
                console.error(`AudioFrameworkTest: Callback: failed to get RoutingManager ${err.message}`);
                expect().assertFail();
            } else {
                let value = await AudioRoutingManager.getDevices(audio.DeviceFlag.INPUT_DEVICES_FLAG)
                console.info('AudioFrameworkTest: Promise: getDevices INPUT_DEVICES_FLAG');
                value.forEach(displayDeviceProp);

                if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null &&
                        cMask != null) {
                    console.info('AudioFrameworkTest: Promise: getDevices : INPUT_DEVICES_FLAG :  PASS');
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Promise: getDevices : INPUT_DEVICES_FLAG :  FAIL');
                    expect(false).assertTrue();
                }
            }
            done();
        });
    })

    /* *
            * @tc.number    : SUB_AUDIO_ROUTING_MANAGER_getDevices_010
            * @tc.name      : getDevices - ALL device - Promise - ENAME
            * @tc.desc      : getDevices - ALL device
            * @tc.size      : MEDIUM
            * @tc.type      : Function
            * @tc.level     : Level 0
        */
    it('SUB_AUDIO_ROUTING_MANAGER_getDevices_010', 0, async function (done) {
        dRValue = null;
        dTValue = null;
        devId = null;
        devName = null;
        devAddr = null;
        sRate = null;
        cCount = null;
        cMask = null;
        audioManager.getRoutingManager(async (err,AudioRoutingManager)=>{
            if (err) {
                console.error(`AudioFrameworkTest:Callback:failed to get RoutingManager ${err.message}`);
                    expect().assertFail();
            } else {
                let value = await AudioRoutingManager.getDevices(audio.DeviceFlag.ALL_DEVICES_FLAG)
                console.info('AudioFrameworkTest: Promise: getDevices ALL_DEVICES_FLAG');
                value.forEach(displayDeviceProp);

                if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null &&
                        cMask != null) {
                    console.info('AudioFrameworkTest: Promise: getDevices : ALL_DEVICES_FLAG :  PASS');
                    expect(true).assertTrue();
                }
                else {
                    console.info('AudioFrameworkTest: Promise: getDevices : ALL_DEVICES_FLAG :  FAIL');
                    expect(false).assertTrue();
                }
            }
            done();
        });
    })

    /* *
            * @tc.number    : SUB_AUDIO_DeviceFlag_001
            * @tc.name      : NONE_DEVICES_FLAG
            * @tc.desc      : NONE_DEVICES_FLAG
            * @tc.size      : MEDIUM
            * @tc.type      : Function
            * @tc.level     : Level 0
            */
    it('SUB_AUDIO_DeviceFlag_001', 0, async function (done) {
        expect(audio.DeviceFlag.OUTPUT_DEVICES_FLAG).assertEqual(1);
        expect(audio.DeviceFlag.INPUT_DEVICES_FLAG).assertEqual(2);
        expect(audio.DeviceFlag.ALL_DEVICES_FLAG).assertEqual(3);
        await sleep(50);
        done();
    })
})