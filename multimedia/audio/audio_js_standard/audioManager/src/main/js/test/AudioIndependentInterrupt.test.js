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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index';

describe('audioIndependentInterrupt', function () {
    console.info('AudioIndependentInterrupt: Create AudioManger Object JS IndependentInterrupt');
    const audioManager = audio.getAudioManager();
    var deviceRoleValue = null;
    var deviceTypeValue = null;
    var volErrorMesg = 'Error, Operation not supported or Failed';
    var audioMedia = 3;
    var audioRingtone = 2;
    var minVol = 0;
    var maxVol = 15;
    var lowVol = 5;
    var highVol = 14;
    var outOfRangeVol = 28;
    var longValue = '28374837458743875804735081439085918459801437584738967509184509813904850914375904790589104801843';

    function sleep (ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    function displayDeviceProp(value, index, array) {
        var devRoleName;
        var devTypeName;
        if (value.deviceRole==1) {
            devRoleName = 'INPUT_DEVICE';
        }
        else if (value.deviceRole==2) {
            devRoleName = 'OUTPUT_DEVICE ';
        }
        else {
            devRoleName = 'ERROR : UNKNOWN : '+value.deviceRole;
        }

        if (value.deviceType == 1) {
            devTypeName = 'EARPIECE';
        }
        else if (value.deviceType == 2){
            devTypeName = 'SPEAKER';
        }
        else if (value.deviceType == 3){
            devTypeName = 'WIRED_HEADSET';
        }
        else if (value.deviceType == 8){
            devTypeName = 'BLUETOOTH_A2DP';
        }
        else if (value.deviceType == 15){
            devTypeName = 'MIC';
        }
        else {
            devTypeName = 'ERROR : UNKNOWN :'+value.deviceType;
        }

        console.info(`AudioIndependentInterrupt: device role: ${devRoleName}`);
        deviceRoleValue = value.deviceRole;
        console.info(`AudioIndependentInterrupt: device type: ${devTypeName}`);
        deviceTypeValue = value.deviceType;

    }

    beforeAll(function () {
        console.info('AudioIndependentInterrupt: beforeAll: Prerequisites at the test suite level');
    })

    beforeEach(async function () {
        console.info('AudioIndependentInterrupt: beforeEach: Prerequisites at the test case level');
        await sleep(100);
    })

    afterEach(async function () {
        console.info('AudioIndependentInterrupt: afterEach: Test case-level clearance conditions');
        await sleep(100);
    })

    afterAll(function () {
        console.info('AudioIndependentInterrupt: afterAll: Test suite-level cleanup condition');
    })

    /*
                * @tc.name:RequestIndependentInterrupt_001
                * @tc.desc: requestIndependentInterrupt callback
                * @tc.type: FUNC
                * @tc.require: Issue Number
    */
    it("RequestIndependentInterrupt_001", 0, function (done) {
        audioManager.requestIndependentInterrupt(audio.FocusType.FOCUS_TYPE_RECORDING ,(err,data)=>{
            if(err){
                expect(true).assertEqual(false);
                return done();
            }
            expect(data).assertEqual(true);
            done();
        })
    })

    /*
                * @tc.name:RequestIndependentInterrupt_002
                * @tc.desc: requestIndependentInterrupt promise
                * @tc.type: FUNC
                * @tc.require: Issue Number
    */
    it("RequestIndependentInterrupt_002", 0, function (done) {
        audioManager.requestIndependentInterrupt(audio.FocusType.FOCUS_TYPE_RECORDING).then(data=>{
            expect(data).assertEqual(true);
            done();
        }).catch(err=>{
            expect(true).assertEqual(false);
            done();
        })
    })

    /*
                * @tc.name:RequestIndependentInterrupt_003
                * @tc.desc: requestIndependentInterrupt ,set param as '0',will catch error with type error
                * @tc.type: FUNC
                * @tc.require: Issue Number
    */
    it("RequestIndependentInterrupt_003", 0,async function (done) {
        let focusType = '0';
        try{
            await audioManager.requestIndependentInterrupt(focusType)
        }catch(err){
            expect('assertion (false) failed: type mismatch').assertEqual(err.message);
        }
        done();
    })

    /*
                * @tc.name:RequestIndependentInterrupt_004
                * @tc.desc: requestIndependentInterrupt ,set param as 99,will catch error  out of border
                * @tc.type: FUNC
                * @tc.require: Issue Number
    */
    it("RequestIndependentInterrupt_004", 0, function (done) {
        let focusType = 99;
        audioManager.requestIndependentInterrupt(focusType).then(data=>{
            expect(data).assertEqual(true);
            done();
        }).catch(err=>{
            expect(err).assertEqual(undefined);
            done();
        });
    })

    /*
                * @tc.name:AbandonIndependentInterrupt_001
                * @tc.desc: abandonIndependentInterrupt callback
                * @tc.type: FUNC
                * @tc.require: Issue Number
    */
    it("AbandonIndependentInterrupt_001", 0, function (done) {
        audioManager.abandonIndependentInterrupt(audio.FocusType.FOCUS_TYPE_RECORDING,(err,data)=>{
            if(err){
                expect(true).assertEqual(false);
                return done();
            }
            expect(data).assertEqual(true);
            done();
        })
    })

    /*
    * @tc.name:AbandonIndependentInterrupt_002
    * @tc.desc: abandonIndependentInterrupt promise
    * @tc.type: FUNC
    * @tc.require: Issue Number
    */
    it("AbandonIndependentInterrupt_002", 0, function (done) {
        audioManager.abandonIndependentInterrupt(audio.FocusType.FOCUS_TYPE_RECORDING).then(data=>{
            expect(data).assertEqual(true);
            done();
        }).catch(err=>{
            expect(true).assertEqual(false);
            done();
        })
    })

    /*
   * @tc.name:AbandonIndependentInterrupt_003
   * @tc.desc: abandonIndependentInterrupt ,set param as '0',will catch error with type error
   * @tc.type: FUNC
   * @tc.require: Issue Number
   */
    it("AbandonIndependentInterrupt_003", 0, function (done) {
        let focusType='0';
        try{
            audioManager.abandonIndependentInterrupt(focusType).then(data=>{
                expect(false).assertTrue();
            });
        }catch(err){
            expect('assertion (false) failed: type mismatch').assertEqual(err.message);
        }
        done();
    })

    /*
    * @tc.name:AbandonIndependentInterrupt_004
    * @tc.desc: abandonIndependentInterrupt ,set param as 99,will catch error  out of border
    * @tc.type: FUNC
    * @tc.require: Issue Number
    */
    it("AbandonIndependentInterrupt_004", 0, function (done) {
        let focusType = 99;
        audioManager.abandonIndependentInterrupt(focusType).then(data=>{
            expect(data).assertEqual(true);
            done();
        }).catch(err=>{
            expect(err).assertEqual(undefined);
            done();
        })
    })
})