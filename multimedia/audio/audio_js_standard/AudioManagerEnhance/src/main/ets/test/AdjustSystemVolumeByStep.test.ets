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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import audio from '@ohos.multimedia.audio';
import featureAbility from '@ohos.ability.featureAbility';
import * as env from './Const.ets';

export default function audioManagerTest() {
  describe('adjustSystemVolumeByStep', function () {
    let audioManager = null;
    let audioVolumeManager = null;
    let audioVolumeGroupManager = null;
    let TagFrmwk = "audioManagerEnhanceTest";
    let VOLUME_ADJUST_UP = 0;
    let VOLUME_ADJUST_DOWN = 1;
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
    beforeAll(async function () {
      await getPermission();
      await sleep(3000);
      console.info('TestLog: Start Testing audioManagerTest Interfaces');
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

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0100
     *@tc.name      : adjustSystemVolumeByStep - Media - Promise
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0100', 0, async function (done) {
        try {
          let vol_MEDIA = 3;
          await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, vol_MEDIA);
          console.info(`####setVolume :SUCCESS ${vol_MEDIA}`);
          await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType.MEDIA, VOLUME_ADJUST_DOWN).then((data) => {
            console.info(`####adjustSystemVolumeByStep :SUCCESS ${data}`);
          }).catch((error) => {
            console.log(`${TagFrmwk}: ####adjustSystemVolumeByStep : error ${error}`);
            expect(false).assertTrue();
            done();
          });
          await sleep(100);
          let curVol_MEDIA = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
          if(curVol_MEDIA < vol_MEDIA){
            console.info(`####adjustSystemVolumeByStep :volome cut ${curVol_MEDIA - vol_MEDIA}`);
            expect(true).assertTrue();
            done();
          }else{
            expect(false).assertTrue();
            done();
          }
        }catch (error){
          console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0100: error ${error.message}, code ${error.code}`);
          expect(false).assertTrue();
          done();
        }
    })

      /**
       *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0200
       *@tc.name      : adjustSystemVolumeByStep - Media - Promise
       *@tc.desc      : Adjust one auodio volume we want.
       *@tc.size      : MEDIUM
       *@tc.type      : Function
       *@tc.level     : Level 0
       */
      it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0200', 0, async function (done) {
        try {
          for(let index in audio.AudioVolumeType){
            console.info(`####AudioVolumeType : ${index}`);
            let vol_MEDIA = 3;
            await audioVolumeGroupManager.setVolume(audio.AudioVolumeType[index], vol_MEDIA);
            console.info(`####${index} setVolume :SUCCESS ${vol_MEDIA}`);
            await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType[index], VOLUME_ADJUST_DOWN).then((data) => {
              console.info(`####${index} adjustSystemVolumeByStep :SUCCESS ${data}`);
            }).catch((error) => {
              if(index == 'ALL' && error.code == env.UNSUPORTED_OPTION_6800104){
                console.log(`${TagFrmwk}: ####${index} adjustSystemVolumeByStep : error ${error.message} ${error.code}`);
              }else{
                expect(false).assertTrue();
                done();
                return;
              }
            });
            await sleep(100);
            let curVol_MEDIA = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType[index]);
            console.info(`####${index} getVolume :SUCCESS ${curVol_MEDIA}`);
          }
          done();
        }catch (error){
          console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0200: error ${error.message}, code ${error.code}`);
          expect(false).assertTrue();
          done();
        }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0300
     *@tc.name      : adjustSystemVolumeByStep - Media - Promise
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0300', 0, async function (done) {
      try {
        for(let index in audio.AudioVolumeType){
          console.info(`####AudioVolumeType : ${index}`);
          let vol_MEDIA = 3;
          await audioVolumeGroupManager.setVolume(audio.AudioVolumeType[index], vol_MEDIA);
          console.info(`####${index} setVolume :SUCCESS ${vol_MEDIA}`);
          await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType[index], VOLUME_ADJUST_UP).then((data) => {
            console.info(`####${index} adjustSystemVolumeByStep :SUCCESS ${data}`);
          }).catch((error) => {
            if(index == 'ALL' && error.code == env.UNSUPORTED_OPTION_6800104){
              console.log(`${TagFrmwk}: ####${index} adjustSystemVolumeByStep : data ${error.message} ${error.code}`);
            }else{
              expect(false).assertTrue();
              done();
              return;
            }
          });
          await sleep(100);
          let curVol_MEDIA = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType[index]);
          console.info(`####${index} getVolume :SUCCESS ${curVol_MEDIA}`);
        }
        done();
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0300: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0400
     *@tc.name      : adjustSystemVolumeByStep - Media - Promise
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0400', 0, async function (done) {
      try {
        let AUDIO_VLOUME_TYPE_ERROR =-1;
        let volMEDIA = 3
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, volMEDIA);
        console.info(`####setVolume :volume ${volMEDIA}`);
        await audioVolumeGroupManager.adjustSystemVolumeByStep(AUDIO_VLOUME_TYPE_ERROR, VOLUME_ADJUST_DOWN).then((data) => {
          console.info(`####Unknown volume type, Set it to default MEDIA! adjustSystemVolumeByStep :SUCCESS ${data}`);
        }).catch((error) => {
          if(error.code == env.UNSUPORTED_OPTION_6800104){
            console.log(`${TagFrmwk}: ####adjustSystemVolumeByStep : error ${error.message}, code ${error.code}`);
          }else{
            console.log(`${TagFrmwk}: ####adjustSystemVolumeByStep : error ${error.message}, code ${error.code}`);
            expect(false).assertTrue();
            done();
          }
        });
        await sleep(100);
        let curVol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        if(curVol == volMEDIA){
          console.info(`####getVolume :volume ${curVol}`);
          expect(true).assertTrue();
          done();
        }
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0400: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0500
     *@tc.name      : adjustSystemVolumeByStep - Media - Promise
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0500', 0, async function (done) {
      try {
        let VOLUME_ADJUST_ERROR = 3;
        let volMEDIA = 3;
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, volMEDIA);
        console.info(`####setVolume :volume ${volMEDIA}`);
        await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType.MEDIA, VOLUME_ADJUST_ERROR).then((data) => {
          console.info(`####adjustSystemVolumeByStep :SUCCESS ${data}`);
        }).catch((error) => {
          if(error.code == env.UNSUPORTED_OPTION_6800104){
            console.info(`####adjustSystemVolumeByStep : ${error.message}, code ${error.code}`);
            expect(true).assertTrue();
            done();
          }else {
            console.log(`${TagFrmwk}: ####adjustSystemVolumeByStep : error ${error.message}, code ${error.code}`);
            expect(false).assertTrue();
            done();
          }
        });
        await sleep(100);
        let curMEDIA = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        console.info(`####getVolume :volume ${curMEDIA}`);
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0500: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0600
     *@tc.name      : adjustSystemVolumeByStep - Media - Promise
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0600', 0, async function (done) {
      try {
        let AUDIO_VOLUME_TYPE_ERROR = '123';
        await audioVolumeGroupManager.adjustSystemVolumeByStep(AUDIO_VOLUME_TYPE_ERROR, VOLUME_ADJUST_DOWN).then((data) => {
          console.info(`####adjustSystemVolumeByStep :SUCCESS ${data}`);
          expect(false).assertTrue();
          done();
        }).catch((error) => {
          if(error.code == env.INVALID_INPUT_PARAMETER_6800101){
            console.log(`${TagFrmwk}: ####adjustSystemVolumeByStep : error ${error.message}, code ${error.code}`);
            expect(true).assertTrue();
            done();
          }else{
            expect(false).assertTrue();
            done();
          }
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0600: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0700
     *@tc.name      : adjustSystemVolumeByStep - Media - Promise
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0700', 0, async function (done) {
      try {
        let VOLUME_ADJUST_ERROR = '123';
        await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType.MEDIA, VOLUME_ADJUST_ERROR).then((data) => {
          console.info(`####adjustSystemVolumeByStep :SUCCESS ${data}`);
          expect(false).assertTrue();
          done();
        }).catch((error) => {
          if(error.code == env.INVALID_INPUT_PARAMETER_6800101){
            console.log(`${TagFrmwk}: ####adjustSystemVolumeByStep : error ${error.message}, code ${error.code}`);
            expect(true).assertTrue();
            done();
          }else{
            expect(false).assertTrue();
            done();
          }
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0700: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0800
     *@tc.name      : adjustSystemVolumeByStep - Media - Promise
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0800', 0, async function (done) {
      try {
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA,3);
        console.info(`####setVolume :volume 3`);
        await audioVolumeGroupManager.adjustSystemVolumeByStep(VOLUME_ADJUST_DOWN).then((data) => {
          console.info(`####Unknown volume type, Set it to default MEDIA! adjustSystemVolumeByStep :SUCCESS ${data}`);
          expect(false).assertTrue();
          done();
        }).catch((error) => {
          if(error.code == env.UNSUPORTED_OPTION_6800104){
            console.log(`${TagFrmwk}: ####adjustSystemVolumeByStep : error ${error.message}, code ${error.code}`);
            expect(true).assertTrue();
            done();
          }else{
            console.log(`${TagFrmwk}: ####adjustSystemVolumeByStep : error ${error.message}, code ${error.code}`);
            expect(false).assertTrue();
            done();
          }
        });
        await sleep(100);
        let Vol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        console.info(`####getVolume :volume ${Vol}`);
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0800: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0900
     *@tc.name      : adjustSystemVolumeByStep - Media - Promise
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0900', 0, async function (done) {
      try {
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.ALARM,3);
        console.info(`####getVolume :volume 3`);
        await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType.ALARM).then((data) => {
          console.info(`####adjustSystemVolumeByStep :SUCCESS ${data}`);
          expect(true).assertTrue();
          done();
        }).catch((error) => {
          console.log(`${TagFrmwk}: ####adjustSystemVolumeByStep : error ${error.message}, code ${error.code}`);
          expect(false).assertTrue();
          done();
        });
        await sleep(100);
        let Vol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.ALARM);
        console.info(`####getVolume :volume ${Vol}`);
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_0900: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_1000
     *@tc.name      : adjustSystemVolumeByStep - Media - Promise
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_1000', 0, async function (done) {
      try {
        for(let index in audio.AudioVolumeType){
          console.info(`####AudioVolumeType : ${index}`);
          let maxVol = await audioVolumeGroupManager.getMaxVolume(audio.AudioVolumeType[index]);
          await audioVolumeGroupManager.setVolume(audio.AudioVolumeType[index], maxVol);
          console.info(`####${index} set max Volume :SUCCESS ${maxVol}`);
          await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType[index], VOLUME_ADJUST_UP).then((data) => {
            console.info(`####${index} adjustSystemVolumeByStep :SUCCESS ${data}`);
          }).catch((error) => {
            if(index == 'ALL' && error.code == env.UNSUPORTED_OPTION_6800104){
              console.info(`####${index} adjustSystemVolumeByStep: error ${error.message}, code ${error.code}`);
              expect(true).assertTrue();
              done();
            }else{
              console.log(`${TagFrmwk}: ####${index} adjustSystemVolumeByStep : error ${error.message} ${error.code}`);
              expect(false).assertTrue();
              done();
              return;
            }
          });
          await sleep(20);
          let curVol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType[index]);
          console.info(`####${index} getVolume : ${curVol}`);
          if(curVol == maxVol){
            expect(true).assertTrue();
          }else{
            expect(false).assertTrue();
            done();
            return;
          }
        }
        done();
      }catch (error){
          console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_1000: error ${error.message}, code ${error.code}`);
          expect(false).assertTrue();
          done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_1100
     *@tc.name      : adjustSystemVolumeByStep - Media - Promise
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_1100', 0, async function (done) {
      let type;
      try {
        for(let index in audio.AudioVolumeType){
          type = index;
          console.info(`####AudioVolumeType : ${index}`);
          let minVol = await audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType[index]);
          await audioVolumeGroupManager.setVolume(audio.AudioVolumeType[index], minVol);
          console.info(`####${index} set min Volume : ${minVol}`);
          let Vol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType[index]);
          console.info(`####${index} get Volume :vol ${Vol}`);
          await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType[index], VOLUME_ADJUST_DOWN).then((data) => {
            console.info(`####${index} adjustSystemVolumeByStep :SUCCESS ${data}`);
          }).catch((error) => {
            console.log(`${TagFrmwk}: ####${index} adjustSystemVolumeByStep : error ${error.message} ${error.code}`);
            expect(false).assertTrue();
            done();
            return;
          });
          await sleep(20);
          let curVol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType[index]);
          console.info(`####${index} getVolume : ${curVol}`);
          if(curVol == minVol){
            expect(true).assertTrue();
          }else{
            expect(false).assertTrue();
            done();
          }
        }
        done();
      }catch (error){
        if(type == 'ALL' && error.code == env.UNSUPORTED_OPTION_6800104){
          console.info(`####${type} adjustSystemVolumeByStep: error ${error.message}, code ${error.code}`);
          expect(true).assertTrue();
          done();
        }else{
          console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_1100: error ${error.message}, code ${error.code}`);
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_1200
     *@tc.name      : adjustSystemVolumeByStep - Media - Promise
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_1200', 0, async function (done) {
      try {
        let minVol = await audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType.MEDIA);
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, minVol);
        console.info(`####setVolume :SUCCESS ${minVol}`);
        await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType.MEDIA, VOLUME_ADJUST_UP).then((data) => {
          console.info(`####$adjustSystemVolumeByStep :SUCCESS ${data}`);
        }).catch((error) => {
            console.log(`${TagFrmwk}: ####adjustSystemVolumeByStep : error ${error.message} ${error.code}`);
            expect(false).assertTrue();
        });
        await sleep(20);
        let Vol1 = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        console.info(`####getVolume up1: ${Vol1}`);
        await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType.MEDIA, VOLUME_ADJUST_UP).then((data) => {
          console.info(`####$adjustSystemVolumeByStep up:SUCCESS ${data}`);
        }).catch((error) => {
            console.log(`${TagFrmwk}: ####adjustSystemVolumeByStep : error ${error.message} ${error.code}`);
            expect(false).assertTrue();
        });
        await sleep(20);
        let Vol2 = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        console.info(`####getVolume up2: ${Vol2}`);
        await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType.MEDIA, VOLUME_ADJUST_DOWN).then((data) => {
          console.info(`####$adjustSystemVolumeByStep up:SUCCESS ${data}`);
        }).catch((error) => {
            console.log(`${TagFrmwk}: ####adjustSystemVolumeByStep : error ${error.message} ${error.code}`);
            expect(false).assertTrue();
        });
        await sleep(20);
        let curVol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        console.info(`####getVolume down: ${curVol}`);
        if(Vol1 > minVol && Vol2 > Vol1 && curVol < Vol2){
          expect(true).assertTrue();
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_1200: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0100
     *@tc.name      : adjustSystemVolumeByStep - Media - Callback
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0100', 0, async function (done) {
      try {
        let vol_MEDIA = 7;
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, vol_MEDIA);
        console.info(`####setVolume :volume ${vol_MEDIA}`);
        await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType.MEDIA, VOLUME_ADJUST_DOWN, (err,data) => {
          if(err){
            console.log(`${TagFrmwk}: ####adjustSystemVolumeByStep : error ${err.message}, code ${err.code}`);
            expect(false).assertTrue();
            done();
          }else{
            console.info(`####adjustSystemVolumeByStep :SUCCESS ${data}`);
          }
        });
        await sleep(100);
        let curVol_MEDIA = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        if(curVol_MEDIA < vol_MEDIA){
          console.info(`####adjustSystemVolumeByStep :volome cut ${curVol_MEDIA - vol_MEDIA}`);
          expect(true).assertTrue();
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0100: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }

    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0200
     *@tc.name      : adjustSystemVolumeByStep - Media - Callback
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0200', 0, async function (done) {
      try {
        for(let index in audio.AudioVolumeType) {
          console.info(`####AudioVolumeType: ${index}`);
          let Vol = 3;
          await audioVolumeGroupManager.setVolume(audio.AudioVolumeType[index], Vol);
          console.info(`####${index} setVolume :volome ${Vol}`);
          await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType[index], VOLUME_ADJUST_DOWN, (err,data) => {
            if(err){
              if(index == 'ALL' && err.code == env.UNSUPORTED_OPTION_6800104){
                console.log(`${TagFrmwk}: ####${index} adjustSystemVolumeByStep : error ${err.message}, code ${err.code}`);
              }else{
                console.log(`${TagFrmwk}: ####${index} adjustSystemVolumeByStep : error ${err.message}, code ${err.code}`);
                expect(false).assertTrue();
                done();
              }
            }else{
              console.info(`####${index} adjustSystemVolumeByStep :SUCCESS ${data}`);
            }
          });
          await sleep(100);
          let curVol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType[index]);
          console.info(`####${index} getVolume :volome ${curVol}`);
        }
        done();
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0200: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0300
     *@tc.name      : adjustSystemVolumeByStep - Media - Callback
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0300', 0, async function (done) {
      try {
        for(let index in audio.AudioVolumeType) {
          console.info(`####AudioVolumeType: ${index}`);
          let Vol = 3;
          await audioVolumeGroupManager.setVolume(audio.AudioVolumeType[index], Vol);
          console.info(`####${index} setVolume :volome ${Vol}`);
          await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType[index], VOLUME_ADJUST_UP, (err,data) => {
            if(err){
              if(index == 'ALL' && err.code == env.UNSUPORTED_OPTION_6800104){
                console.log(`####${index} adjustSystemVolumeByStep : error ${err.message}, code ${err.code}`);
              }else{
                console.log(`####${index} adjustSystemVolumeByStep : error ${err.message}, code ${err.code}`);
                expect(false).assertTrue();
                done();
              }
            }else{
              console.info(`####${index} adjustSystemVolumeByStep :SUCCESS ${data}`);
            }
          });
          await sleep(100);
          let curVol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType[index]);
          console.info(`####${index} getVolume :volome ${curVol}`);
        }
        done();
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0300: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0400
     *@tc.name      : adjustSystemVolumeByStep - Media - Callback
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0400', 0, async function (done) {
      try {
        let AUDIO_VOLUME_TYPE_ERROR = -1;
        let vol_MEDIA = 3;
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, vol_MEDIA);
        console.info(`####setVolume :volume ${vol_MEDIA}`);
        await audioVolumeGroupManager.adjustSystemVolumeByStep(AUDIO_VOLUME_TYPE_ERROR, VOLUME_ADJUST_UP, (err,data) => {
          if(err.code == env.UNSUPORTED_OPTION_6800104){
            console.log(`${TagFrmwk}: ####adjustSystemVolumeByStep : error ${err.message}, code ${err.code}`);
          }else{
            console.info(`####adjustSystemVolumeByStep :SUCCESS ${data}`);
            expect(false).assertTrue();
            done();
          }
        });
        await sleep(100);
        let curVol_MEDIA = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        console.info(`####getVolume :volome ${curVol_MEDIA}`);
        if(curVol_MEDIA == vol_MEDIA){
          console.info(`####getVolume :volome add ${curVol_MEDIA - vol_MEDIA}`);
          expect(true).assertTrue();
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0400: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0500
     *@tc.name      : adjustSystemVolumeByStep - Media - Callback
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0500', 0, async function (done) {
      try {
        let VOLUME_ADJUST_TYPE_ERROR = 3;
        await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType.MEDIA, VOLUME_ADJUST_TYPE_ERROR, (err,data) => {
          if(err.code == env.UNSUPORTED_OPTION_6800104){
            console.log(`${TagFrmwk}: ####adjustSystemVolumeByStep : error ${err.message}, code ${err.code}`);
            expect(true).assertTrue();
            done();
          }else{
            expect(false).assertTrue();
            done();
          }
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0500: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0600
     *@tc.name      : adjustSystemVolumeByStep - Media - Callback
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0600', 0, async function (done) {
      try {
        let AUDIO_VOLUME_TYPE_ERROR = '123';
        await audioVolumeGroupManager.adjustSystemVolumeByStep(AUDIO_VOLUME_TYPE_ERROR, VOLUME_ADJUST_DOWN, (err,data) => {
          if(err.code == env.INVALID_INPUT_PARAMETER_6800101){
            console.log(`${TagFrmwk}: ####adjustSystemVolumeByStep : error ${err.message}, code ${err.code}`);
            expect(true).assertTrue();
            done();
          }else{
            console.info(`####adjustSystemVolumeByStep :SUCCESS ${data}`);
            expect(false).assertTrue();
            done();
          }
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0600: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0700
     *@tc.name      : adjustSystemVolumeByStep - Media - Callback
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0700', 0, async function (done) {
      try {
        let VOLUME_ADJUST_ERROR = '123';
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.ALARM,3);
        await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType.ALARM, VOLUME_ADJUST_ERROR, (err,data) => {
          if(err){
            console.info(`####adjustSystemVolumeByStep :SUCCESS ${data}`);
            expect(true).assertTrue();
            done();
          }else{
            console.log(`${TagFrmwk}: ####adjustSystemVolumeByStep : error ${err.message}, code ${err.code}`);
            expect(false).assertTrue();
            done();
          }
        });
        await sleep(100);
        let Vol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.ALARM);
        console.info(`####getVolume :volume ${Vol}`);
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0700: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0800
     *@tc.name      : adjustSystemVolumeByStep - Media - Callback
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0800', 0, async function (done) {
      try {
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA,3);
        await audioVolumeGroupManager.adjustSystemVolumeByStep(VOLUME_ADJUST_DOWN, (data) => {
          console.info(`####adjustSystemVolumeByStep :SUCCESS ${data}`);
          expect(false).assertTrue();
          done();
        }).catch((error) => {
          if(error.code == env.INVALID_INPUT_PARAMETER_6800101){
            console.log(`${TagFrmwk}: ####adjustSystemVolumeByStep : error ${error.message}, code ${error.code}`);
            expect(true).assertTrue();
            done();
          }else{
            expect(false).assertTrue();
            done();
          }
        });
        let Vol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        console.info(`####getVolume :volume ${Vol}`);
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0800: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0900
     *@tc.name      : adjustSystemVolumeByStep - Media - Callback
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0900', 0, async function (done) {
      try {
        await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType.MEDIA, (data) => {
          console.info(`####adjustSystemVolumeByStep :SUCCESS ${data}`);
          expect(true).assertTrue();
          done();
        }).catch((error) => {
          if(error.code == env.INVALID_INPUT_PARAMETER_6800101){
            console.log(`${TagFrmwk}: ####adjustSystemVolumeByStep : error ${error.message}, code ${error.code}`);
            expect(true).assertTrue();
            done();
          }else{
            expect(false).assertTrue();
            done();
          }
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_0900: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_1000
     *@tc.name      : adjustSystemVolumeByStep - Media - Callback
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_1000', 0, async function (done) {
      let type;
      try {
        for(let index in audio.AudioVolumeType) {
          type = index;
          console.info(`####AudioVolumeType: ${index}`);
          let maxVol = await audioVolumeGroupManager.getMaxVolume(audio.AudioVolumeType[index]);
          await audioVolumeGroupManager.setVolume(audio.AudioVolumeType[index], maxVol);
          console.info(`####${index} set max Volume :volome ${maxVol}`);
          await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType[index], VOLUME_ADJUST_UP, (err,data) => {
            if(err){
              if(index == 'ALL' && err.code == env.UNSUPORTED_OPTION_6800104){
                console.info(`####${index} adjustSystemVolumeByStep: error ${err.message}, code ${err.code}`);
                expect(true).assertTrue();
                done();
              }else{
                console.log(`${TagFrmwk}: ####${index} adjustSystemVolumeByStep : error ${err.message}, code ${err.code}`);
                expect(false).assertTrue();
                done();
                return;
              }
            }else{
              console.info(`####${index} adjustSystemVolumeByStep :SUCCESS ${data}`);
            }
          });
          await sleep(20);
          let curVol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType[index]);
          console.info(`####${index} set max Volume :volome ${maxVol}`);
          if(curVol == maxVol){
            expect(true).assertTrue();
          }else{
            expect(false).assertTrue();
            done();
          }
        }
        done();
      }catch (error){
        if(type == 'ALL' && error.code == env.UNSUPORTED_OPTION_6800104){
          console.info(`####${type} adjustSystemVolumeByStep: error ${error.message}, code ${error.code}`);
          expect(true).assertTrue();
          done();
        }else{
          console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_1000: error ${error.message}, code ${error.code}`);
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_1100
     *@tc.name      : adjustSystemVolumeByStep - Media - Callback
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_1100', 0, async function (done) {
      let type;
      try {
        for(let index in audio.AudioVolumeType) {
          type = index;
          console.info(`####AudioVolumeType: ${index}`);
          let minVol = await audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType[index]);
          await audioVolumeGroupManager.setVolume(audio.AudioVolumeType[index], minVol);
          console.info(`####${index} setVolume :volome ${minVol}`);
          await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType[index], VOLUME_ADJUST_DOWN, (err,data) => {
            if(err){
              console.log(`${TagFrmwk}: ####${index} adjustSystemVolumeByStep : error ${err.message}, code ${err.code}`);
              expect(false).assertTrue();
              done();
            }else{
              console.info(`####${index} adjustSystemVolumeByStep :SUCCESS ${data}`);
            }
          });
          await sleep(20);
          let curVol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType[index]);
          if(curVol == minVol){
            expect(true).assertTrue();
          }else{
            expect(false).assertTrue();
            done();
            return;
          }
        }
        done();
      }catch (error){
        if(type ==  'ALL' && error.code == env.UNSUPORTED_OPTION_6800104){
          console.info(`####${type} adjustSystemVolumeByStep: error ${error.message}, code ${error.code}`);
          expect(true).assertTrue();
          done();
        }else{
          console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_1100: error ${error.message}, code ${error.code}`);
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_1200
     *@tc.name      : adjustSystemVolumeByStep - Media - Callback
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_1200', 0, async function (done) {
      try {
        let minVol = await audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType.MEDIA);
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, minVol);
        console.info(`####setVolume :volome ${minVol}`);
        await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType.MEDIA, VOLUME_ADJUST_UP, (err,data) => {
          if(err){
            console.log(`${TagFrmwk}: ####adjustSystemVolumeByStep : error ${err.message}, code ${err.code}`);
            expect(false).assertTrue();
            done();
          }else {
            console.info(`####adjustSystemVolumeByStep up:SUCCESS ${data}`);
          }
        });
        await sleep(20);
        let Vol1 = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        console.info(`####getVolume up1: ${Vol1}`);
        await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType.MEDIA, VOLUME_ADJUST_UP, (err,data) => {
          if(err){
            console.log(`${TagFrmwk}: ####adjustSystemVolumeByStep : error ${err.message}, code ${err.code}`);
            expect(false).assertTrue();
            done();
          }else {
            console.info(`####adjustSystemVolumeByStep up:SUCCESS ${data}`);
          }
        });
        await sleep(20);
        let Vol2 = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        console.info(`####getVolume up2: ${Vol2}`);
        await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType.MEDIA, VOLUME_ADJUST_DOWN, (err,data) => {
          if(err){
            console.log(`${TagFrmwk}: ####adjustSystemVolumeByStep : error ${err.message}, code ${err.code}`);
            expect(false).assertTrue();
            done();
          }else {
            console.info(`####adjustSystemVolumeByStep down:SUCCESS ${data}`);
          }
        });
        await sleep(20);
        let curVol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        console.info(`####getVolume down: ${curVol}`);
        if(Vol1 > minVol && Vol2 > Vol1 && curVol < Vol2){
          expect(true).assertTrue();
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_1200: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

  })
}
