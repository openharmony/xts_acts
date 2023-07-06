/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
// @ts-nocheck
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import audio from '@ohos.multimedia.audio';
import featureAbility from '@ohos.ability.featureAbility';
import * as env from './Const.ets';

export default function audioManagerTest() {
  describe('adjustVolumeByStep', function () {
    let audioManager = null;
    let audioVolumeManager = null;
    let audioVolumeGroupManager = null;
    let TagFrmwk = "audioManagerEnhanceTest";
    const VOLUME_ADJUST_UP = 0;
    const VOLUME_ADJUST_DOWN = 1;
    beforeAll(async function () {
      console.info('TestLog: Start Testing audioManagerTest Interfaces\n');
      await getPermission();
      await sleep(3000);
    })
    beforeEach(async function () {
      console.info(`${TagFrmwk}: beforeEach: Prerequisites at the test case level`);
      getAudioManager();
      await sleep(100);
    })
    afterEach(async function () {
      console.info(`${TagFrmwk}: afterEach: Test case-level clearance conditions`);
      await sleep(100);
    })
    afterAll(function () {
      console.info(`${TagFrmwk}: afterAll: Test suite-level cleanup condition`);
    })
    function getAudioManager() {
      audioManager = audio.getAudioManager();
      if (audioManager != null) {
        console.info(`${TagFrmwk}: getAudioManger : PASS`);
        audioVolumeManager = audioManager.getVolumeManager();
        console.info(`${TagFrmwk}: getVolumeManager : PASS`);
        let groupid = audio.DEFAULT_VOLUME_GROUP_ID;
        audioVolumeManager.getVolumeGroupManager(groupid, (err, value) => {
          if (err) {
            console.info("getVolumeGroupManager failed. err:" + JSON.stringify(err));
            console.info("groupid:" + groupid);
            return;
          }
          console.info("getVolumeGroupManager success");
          audioVolumeGroupManager = value;
        });
      }
      else {
        console.info(`${TagFrmwk}: getAudioManger : FAIL`);
      }
    }
    function sleep(ms) {
      return new Promise(resolve => setTimeout(resolve, ms));
    }
    async function getPermission() {
      console.info("getPermission IN\n")
      let permissions = ['ohos.permission.MICROPHONE','ohos.permission.MODIFY_AUDIO_SETTINGS','ohos.permission.ACCESS_NOTIFICATION_POLICY'];
      featureAbility.getContext().requestPermissionsFromUser(permissions, 0, (data) => {
        console.info("request success" + JSON.stringify(data));
      })
    }
    async function setVolumeForVolumeType(volumeLevel){
      for(let index in audio.AudioVolumeType){
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType[index], volumeLevel);
        console.info(`set ${index} volume ${volumeLevel}`);
      }
    }

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0100
     *@tc.name      : adjustVolumeByStep - Media - Promise
     *@tc.desc      : Judge volume by step
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0100', 0, async function (done){
      try {
        let Vol = 3;
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, Vol);
        await audioVolumeGroupManager.adjustVolumeByStep(VOLUME_ADJUST_UP).then((data) => {
          console.log(`${TagFrmwk}: ####adjustVolumeByStep : success ${data}`);
        }).catch((error) => {
          console.log(`${TagFrmwk}: ####adjustVolumeByStep : error ${error.message} ${error.code}`);
          expect(false).assertTrue();
          done();
        });
        let curVol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        console.info(`get volume ${curVol}.`);
        expect(curVol).assertEqual(Vol+1);
        done();
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0100 : error ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0200
     *@tc.name      : adjustVolumeByStep - Media - Promise
     *@tc.desc      : Judge volume by step
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0200', 0, async function (done){
      try {
        let Vol = 3;
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, Vol);
        console.info(`set volume ${Vol}`);
        await audioVolumeGroupManager.adjustVolumeByStep(VOLUME_ADJUST_DOWN).then((data) => {
          console.log(`${TagFrmwk}: ####adjustVolumeByStep : success ${data}`);
        }).catch((error) => {
          console.log(`${TagFrmwk}: ####adjustVolumeByStep : error ${error}`);
          expect(false).assertTrue();
          done();
        });
        let curVol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        console.info(`get volume ${curVol}.`);
        expect(curVol).assertEqual(Vol-1);
        done();
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0200: ####adjustVolumeByStep : error ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0300
     *@tc.name      : adjustVolumeByStep - Media - Promise
     *@tc.desc      : Judge volume by step
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0300', 0, async function (done){
      try {
        let VOLUME_ADJUST_ERROR = 3;
        let Vol = 3;
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, Vol);
        console.info(`set volume ${Vol}`);
        await audioVolumeGroupManager.adjustVolumeByStep(VOLUME_ADJUST_ERROR).then((data) => {
          console.info(`####adjustVolumeByStep :SUCCESS ${data}`);
        }).catch((error) => {
          if(error.code == UNSUPORTED_OPTION_6800104){
            console.log(`####adjustVolumeByStep : error.code ${error.code}, ${error.message}`);
          }else{
            console.log(`${TagFrmwk}: ####adjustVolumeByStep : error.code ${error.code}, ${error.message}`);
            expect(false).assertTrue();
            done();
          }
        });
        let curVol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        console.info(`get volume ${curVol}.`);
        expect(curVol).assertEqual(Vol);
        done();
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0300: ####adjustVolumeByStep : error.code ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0400
     *@tc.name      : adjustVolumeByStep - Media - Promise
     *@tc.desc      : Judge volume by step
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0400', 0, async function (done){
      try {
        let VOLUME_ADJUST_ERROR = '123';
        await audioVolumeGroupManager.adjustVolumeByStep(VOLUME_ADJUST_ERROR).then((data) => {
          console.info(`####adjustVolumeByStep :SUCCESS ${data}`);
          expect(false).assertTrue();
          done();
        }).catch((error) => {
          if(error.code == INVALID_INPUT_PARAMETER_6800101){
            console.log(`${TagFrmwk}: ####adjustVolumeByStep : error ${error.code}, message ${error.message}`);
            expect(true).assertTrue();
            done();
          }else{
            expect(false).assertTrue();
            done();
          }
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0400: ####adjustVolumeByStep : error.code ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0500
     *@tc.name      : adjustVolumeByStep - Media - Promise
     *@tc.desc      : Judge volume by step
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0500', 0, async function (done){
      try {
        await audioVolumeGroupManager.adjustVolumeByStep().then((data) => {
          console.info(`####adjustVolumeByStep :SUCCESS ${data}`);
          expect(true).assertTrue();
          done();
        }).catch((error) => {
          if(error.code == INVALID_INPUT_PARAMETER_6800101){
            console.log(`${TagFrmwk}: ####adjustVolumeByStep : error ${error.code}, message ${error.message}`);
            expect(true).assertTrue();
            done();
          }else{
            expect(false).assertTrue();
            done();
          }
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0500: ####adjustVolumeByStep : error.code ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0600
     *@tc.name      : adjustVolumeByStep - Media - Promise
     *@tc.desc      : Judge volume by step
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0600', 0, async function (done){
      try {
        let maxVol = await audioVolumeGroupManager.getMaxVolume(audio.AudioVolumeType.MEDIA);
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, maxVol);
        console.info(`set max volume ${maxVol}`);
        await audioVolumeGroupManager.adjustVolumeByStep(VOLUME_ADJUST_UP).then((data) => {
          console.log(`${TagFrmwk}: ####adjustVolumeByStep : success ${data}`);
        }).catch((error) => {
          console.log(`${TagFrmwk}: ####adjustVolumeByStep : error ${error.message} ${error.code}`);
          expect(false).assertTrue();
          done();
        });
        let curVol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        console.info(`get volume ${curVol}.`);
        expect(curVol).assertEqual(maxVol);
        done();
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0600 : error ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0700
     *@tc.name      : adjustVolumeByStep - Media - Promise
     *@tc.desc      : Judge volume by step
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0700', 0, async function (done){
      try {
        let minVol = await audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType.MEDIA);
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, minVol);
        console.info(`set min volume ${minVol}`);
        await audioVolumeGroupManager.adjustVolumeByStep(VOLUME_ADJUST_DOWN).then((data) => {
          console.log(`${TagFrmwk}: ####adjustVolumeByStep : success ${data}`);
        }).catch((error) => {
          console.log(`${TagFrmwk}: ####adjustVolumeByStep : error ${error.message} ${error.code}`);
          expect(false).assertTrue();
          done();
        });
        let curVol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        console.info(`get volume ${curVol}.`);
        expect(curVol).assertEqual(minVol);
        done();
      }catch (error){
        if(error.code == 6800301){
          console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0700 : error ${error.message} ${error.code}`);
          expect(true).assertTrue();
          done();
        }else{
          console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0700 : error ${error.message} ${error.code}`);
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0800
     *@tc.name      : adjustVolumeByStep - Media - Promise
     *@tc.desc      : Judge volume by step
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0800', 0, async function (done){
      try {
        let Vol = 3;
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, Vol);
        await audioVolumeGroupManager.adjustVolumeByStep(VOLUME_ADJUST_UP).then((data) => {
          console.log(`${TagFrmwk}: ####adjustVolumeByStep up: success ${data}`);
        }).catch((error) => {
          console.log(`${TagFrmwk}: ####adjustVolumeByStep : error ${error.message} ${error.code}`);
          expect(false).assertTrue();
          done();
        });
        let Vol1 = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        await audioVolumeGroupManager.adjustVolumeByStep(VOLUME_ADJUST_UP).then((data) => {
          console.log(`${TagFrmwk}: ####adjustVolumeByStep up: success ${data}`);
        }).catch((error) => {
          console.log(`${TagFrmwk}: ####adjustVolumeByStep : error ${error.message} ${error.code}`);
          expect(false).assertTrue();
          done();
        });
        let Vol2 = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        await audioVolumeGroupManager.adjustVolumeByStep(VOLUME_ADJUST_DOWN).then((data) => {
          console.log(`${TagFrmwk}: ####adjustVolumeByStep down: success ${data}`);
        }).catch((error) => {
          console.log(`${TagFrmwk}: ####adjustVolumeByStep : error ${error.message} ${error.code}`);
          expect(false).assertTrue();
          done();
        });
        let curVol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        console.info(`get  volume vol1:${Vol1}, vol2:${Vol2}, curVol:${curVol}.`);
        if(Vol1 > Vol && Vol2 > Vol1 && curVol < Vol2){
          expect(true).assertTrue();
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0800 : error ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_CALLBACK_0100
     *@tc.name      : adjustVolumeByStep - Media - Callback
     *@tc.desc      : Judge volume by step
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_CALLBACK_0100', 0, async function (done){
      try {
        let Vol = 3;
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, Vol);
        console.info(`set volume ${Vol}.`);
        await audioVolumeGroupManager.adjustVolumeByStep(VOLUME_ADJUST_UP, (err,data) => {
          if(err) {
            console.log(`${TagFrmwk}: ####adjustVolumeByStep : error ${err.code}, ${err.message}`);
            expect(false).assertTrue();
            done();
          }else {
            console.info(`####adjustVolumeByStep :SUCCESS ${data}`);
          }
        })
        await sleep(20);
        let curVol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        console.info(`get volume ${curVol}.`);
        expect(curVol).assertEqual(Vol+1);
        done();
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_PROMISE_0100: ####adjustVolumeByStep : error ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_CALLBACK_0200
     *@tc.name      : adjustVolumeByStep - Media - Callback
     *@tc.desc      : Judge volume by step
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_CALLBACK_0200', 0, async function (done){
      try {
        let Vol = 3;
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, Vol);
        console.info(`set volume ${Vol}.`);
        await audioVolumeGroupManager.adjustVolumeByStep(VOLUME_ADJUST_DOWN, (err,data) => {
          if (err) {
            console.log(`${TagFrmwk}: ####adjustVolumeByStep : error ${errs.code}, ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`####adjustVolumeByStep :SUCCESS ${data}`);
          }
        })
        await sleep(20);
        let curVol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        console.info(`get volume ${curVol}.`);
        expect(curVol).assertEqual(Vol-1);
        done();
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_CALLBACK_0200: ####adjustVolumeByStep : error ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_CALLBACK_0300
     *@tc.name      : adjustVolumeByStep - Media - Promise
     *@tc.desc      : Judge volume by step
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_CALLBACK_0300', 0, async function (done){
      try {
        let VOLUME_ADJUST_ERROR = 3;
        let Vol = 3;
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, Vol);
        await audioVolumeGroupManager.adjustVolumeByStep(VOLUME_ADJUST_ERROR, (err,data) => {
          if (err) {
            if(err.code == UNSUPORTED_OPTION_6800104){
              console.log(`####adjustVolumeByStep : error ${err.code}, message ${err.message}`);
            }else{
              console.log(`####adjustVolumeByStep : error ${err.code}, message ${err.message}`);
              expect(false).assertTrue();
              done();
            }
          } else {
            console.info(`####adjustVolumeByStep :SUCCESS ${data}`);
          }
        });
        let curVol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        expect(curVol).assertEqual(Vol);
        done();
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_CALLBACK_0300: ####adjustVolumeByStep : error ${error.code}, message ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_CALLBACK_0400
     *@tc.name      : adjustVolumeByStep - Media - Promise
     *@tc.desc      : Judge volume by step
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_CALLBACK_0400', 0, async function (done){
      try {
        let VOLUME_ADJUST_ERROR = '123';
        await audioVolumeGroupManager.adjustVolumeByStep(VOLUME_ADJUST_ERROR, (err,data) => {
          if(err.code == INVALID_INPUT_PARAMETER_6800101){
            console.log(`${TagFrmwk}: ####adjustVolumeByStep : error ${err.code}, message ${err.message}`);
            expect(true).assertTrue();
            done();
          }else{
            expect(false).assertTrue();
            done();
          }
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_CALLBACK_0400: ####adjustVolumeByStep : error ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_CALLBACK_0500
     *@tc.name      : adjustVolumeByStep - Media - Promise
     *@tc.desc      : Judge volume by step
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_CALLBACK_0500', 0, async function (done){
      try {
        await audioVolumeGroupManager.adjustVolumeByStep((err,data) => {
          if(err){
            console.log(`${TagFrmwk}: ####adjustVolumeByStep : error ${error}`);
            expect(false).assertTrue();
            done();
          }else{
            console.info(`####adjustVolumeByStep :SUCCESS ${data}`);
            expect(false).assertTrue();
            done();
          }
        }).catch ((error)=>{
          if(error.code == INVALID_INPUT_PARAMETER_6800101){
            console.log(`${TagFrmwk}: ####adjustVolumeByStep : error ${error.code}, message ${error.message}`);
            expect(true).assertTrue();
            done();
          }else{
            expect(false).assertTrue();
            done();
          }
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_CALLBACK_0500: ####adjustVolumeByStep : error ${error.code}, message ${error.message}`);
        expect(true).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_CALLBACK_0600
     *@tc.name      : adjustVolumeByStep - Media - Callback
     *@tc.desc      : Judge volume by step
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_CALLBACK_0600', 0, async function (done){
      try {
        let maxVol = audioVolumeGroupManager.getMaxVolume(audio.AudioVolumeType.MEDIA);
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, maxVol);
        console.info(`set volume ${maxVol}.`);
        await audioVolumeGroupManager.adjustVolumeByStep(VOLUME_ADJUST_UP, (err,data) => {
          if(err) {
            console.log(`${TagFrmwk}: ####adjustVolumeByStep : error ${err.code}, ${err.message}`);
            expect(false).assertTrue();
            done();
          }else {
            console.info(`####adjustVolumeByStep :SUCCESS ${data}`);
          }
        });
        await sleep(20);
        let curVol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        console.info(`get volume ${curVol}.`);
        expect(curVol).assertEqual(maxVol);
        done();
      }catch (error){
        if(error.code == INVALID_INPUT_PARAMETER_6800101){
          console.info(`####adjustVolumeByStep  : error ${error.message} ${error.code}`);
          expect(true).assertTrue();
          done();
        }else{
          console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_CALLBACK_0600: error ${error.message} ${error.code}`);
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_CALLBACK_0700
     *@tc.name      : adjustVolumeByStep - Media - Callback
     *@tc.desc      : Judge volume by step
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_CALLBACK_0700', 0, async function (done){
      try {
        let minVol = audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType.MEDIA);
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, minVol);
        console.info(`set volume ${minVol}.`);
        await audioVolumeGroupManager.adjustVolumeByStep(VOLUME_ADJUST_DOWN, (err,data) => {
          if(err) {
            console.log(`${TagFrmwk}: ####adjustVolumeByStep : error ${err.code}, ${err.message}`);
            expect(false).assertTrue();
            done();
          }else {
            console.info(`####adjustVolumeByStep :SUCCESS ${data}`);
          }
        })
        await sleep(20);
        let curVol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        console.info(`get volume is obtained ${curVol}.`);
        expect(curVol).assertEqual(minVol);
        done();
      }catch (error){
        if(error.code == INVALID_INPUT_PARAMETER_6800101){
          console.info(`####adjustVolumeByStep : error ${error.message} ${error.code}`);
          expect(true).assertTrue();
          done();
        }else{
          console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_CALLBACK_0700 : error ${error.message} ${error.code}`);
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_CALLBACK_0800
     *@tc.name      : adjustVolumeByStep - Media - Callback
     *@tc.desc      : Judge volume by step
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_CALLBACK_0800', 0, async function (done){
      try {
        let Vol = 3;
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, Vol);
        await audioVolumeGroupManager.adjustVolumeByStep(VOLUME_ADJUST_UP, (err,data) => {
          if(err) {
            console.log(`${TagFrmwk}: ####adjustVolumeByStep : error ${err.code}, ${err.message}`);
            expect(false).assertTrue();
            done();
          }else {
            console.info(`####adjustVolumeByStep up:SUCCESS ${data}`);
          }
        })
        await sleep(20);
        let Vol1 = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        await audioVolumeGroupManager.adjustVolumeByStep(VOLUME_ADJUST_UP, (err,data) => {
          if(err) {
            console.log(`${TagFrmwk}: ####adjustVolumeByStep : error ${err.code}, ${err.message}`);
            expect(false).assertTrue();
            done();
          }else {
            console.info(`####adjustVolumeByStep up:SUCCESS ${data}`);
          }
        })
        await sleep(20);
        let Vol2 = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        await audioVolumeGroupManager.adjustVolumeByStep(VOLUME_ADJUST_DOWN, (err,data) => {
          if(err) {
            console.log(`${TagFrmwk}: ####adjustVolumeByStep : error ${err.code}, ${err.message}`);
            expect(false).assertTrue();
            done();
          }else {
            console.info(`####adjustVolumeByStep down:SUCCESS ${data}`);
          }
        })
        await sleep(20);
        let curVol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        console.info(`get volume vol1: ${Vol1} , vol2: ${Vol2}, curVol: ${curVol}.`);
        if(Vol1 > Vol && Vol2 > Vol1 && curVol < Vol2){
          expect(true).assertTrue();
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }catch(error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTVOLUMEBYSTEP_CALLBACK_0800: ####adjustVolumeByStep : error ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

  })
}
