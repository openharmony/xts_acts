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
  describe('isVolumeUnadjustable', function () {
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

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISVOLUMEUNADJUSTABLE_0100
     *@tc.name      : isVolumeUnadjustable - Media
     *@tc.desc      : Judge volume is Unadjustable or adjustable
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISVOLUMEUNADJUSTABLE_0100', 0, async function (done) {
      try {
        let bol = await audioVolumeGroupManager.isVolumeUnadjustable();
        if (bol == false || bol == true) {
          console.info(`####isVolumeUnadjustable :SUCCESS, is ${bol}`);
          expect(true).assertTrue();
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }catch (error){
        console.log(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISVOLUMEUNADJUSTABLE_0100: ####isVolumeUnadjustable : error ${error.code}, message ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISVOLUMEUNADJUSTABLE_0200
     *@tc.name      : isVolumeUnadjustable - Media
     *@tc.desc      : Judge volume is Unadjustable or adjustable
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISVOLUMEUNADJUSTABLE_0200', 0, async function (done) {
      try {
        let bol = await audioVolumeGroupManager.isVolumeUnadjustable();
        console.info(`####isVolumeUnadjustable :SUCCESS, is ${bol}`);
        let Vol = 3;
        if(bol == false){
          await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, Vol);
          await audioVolumeGroupManager.adjustVolumeByStep(VOLUME_ADJUST_UP);
          let vol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
          expect(vol).assertEqual(Vol+1);
          done();
        }else if(bol == true){
          await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, Vol).then((data) => {
            console.info(`####setVolume :SUCCESS ${data}`);
          }).catch((error) => {
            if(error.code == 6800301){
              console.log(`${TagFrmwk}: ####setVolume : error ${error.message} ${error.code}`);
            }else{
              console.log(`${TagFrmwk}: ####setVolume : error ${error.message} ${error.code}`);
              expect(false).assertTrue();
              done();
            }
          });
          await audioVolumeGroupManager.adjustVolumeByStep(VOLUME_ADJUST_UP).then((data) => {
            console.info(`####adjustVolumeByStep :SUCCESS ${data}`);
          }).catch((error) => {
            console.log(`${TagFrmwk}: ####adjustVolumeByStep : error ${error.message} ${error.code}`);
            expect(false).assertTrue();
            done();
          });
        let vol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        expect(vol).assertEqual(Vol);
        done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }catch (error){
        console.log(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISVOLUMEUNADJUSTABLE_0200: ####isVolumeUnadjustable : error ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISVOLUMEUNADJUSTABLE_0300
     *@tc.name      : isVolumeUnadjustable - Media
     *@tc.desc      : Judge volume is Unadjustable or adjustable
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISVOLUMEUNADJUSTABLE_0300', 0, async function (done) {
      try {
        let bol = await audioVolumeGroupManager.isVolumeUnadjustable();
        console.info(`####isVolumeUnadjustable :SUCCESS, is ${bol}`);
        let Vol = 3;
        if(bol == false){
          await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, Vol);
          await audioVolumeGroupManager.adjustVolumeByStep(VOLUME_ADJUST_DOWN);
          let vol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
          expect(vol).assertEqual(Vol-1);
          done();
        }else if(bol == true){
          await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, Vol).then((data) => {
            console.info(`####setVolume :SUCCESS ${data}`);
          }).catch((error) => {
            if(error.code == 6800301){
              console.log(`${TagFrmwk}: ####setVolume : error ${error.message} ${error.code}`);
            }else{
              console.log(`${TagFrmwk}: ####setVolume : error ${error.message} ${error.code}`);
              expect(false).assertTrue();
              done();
            }
          });
          await audioVolumeGroupManager.adjustVolumeByStep(VOLUME_ADJUST_DOWN).then((data) => {
            console.info(`####adjustVolumeByStep :SUCCESS ${data}`);
          }).catch((error) => {
            console.log(`${TagFrmwk}: ####adjustVolumeByStep : error ${error.message} ${error.code}`);
            expect(false).assertTrue();
            done();
          });
          let vol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
          expect(vol).assertEqual(Vol);
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }catch (error){
        console.log(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISVOLUMEUNADJUSTABLE_0300: ####isVolumeUnadjustable : error ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISVOLUMEUNADJUSTABLE_0400
     *@tc.name      : isVolumeUnadjustable - Media
     *@tc.desc      : Judge volume is Unadjustable or adjustable
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISVOLUMEUNADJUSTABLE_0400', 0, async function (done) {
      try {
        let bol = await audioVolumeGroupManager.isVolumeUnadjustable();
        console.info(`####isVolumeUnadjustable :SUCCESS, is ${bol}`);
        let Vol = 3;
        if(bol == false){
          await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, Vol);
          await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType.MEDIA, VOLUME_ADJUST_UP);
          let vol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
          expect(vol).assertEqual(Vol+1);
          done();
        }else if(bol == true){
          await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, Vol).then((data) => {
            console.info(`####setVolume :SUCCESS ${data}`);
          }).catch((error) => {
            if(error.code == 6800301){
              console.log(`${TagFrmwk}: ####setVolume : error ${error.message} ${error.code}`);
            }else{
              console.log(`${TagFrmwk}: ####setVolume : error ${error.message} ${error.code}`);
              expect(false).assertTrue();
              done();
            }
          });
          await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType.MEDIA, VOLUME_ADJUST_UP).then((data) => {
            console.info(`####adjustSystemVolumeByStep :SUCCESS ${data}`);
          }).catch((error) => {
            console.log(`${TagFrmwk}: ####adjustSystemVolumeByStep : error ${error.message} ${error.code}`);
            expect(false).assertTrue();
            done();
          });
          let vol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
          expect(vol).assertEqual(Vol);
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }catch (error){
        console.log(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISVOLUMEUNADJUSTABLE_0400: ####isVolumeUnadjustable : error ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISVOLUMEUNADJUSTABLE_0500
     *@tc.name      : isVolumeUnadjustable - Media
     *@tc.desc      : Judge volume is Unadjustable or adjustable
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISVOLUMEUNADJUSTABLE_0500', 0, async function (done) {
      try {
        let bol = await audioVolumeGroupManager.isVolumeUnadjustable();
        console.info(`####isVolumeUnadjustable :SUCCESS, is ${bol}`);
        let Vol = 3;
        if(bol == false){
          await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, Vol);
          await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType.MEDIA, VOLUME_ADJUST_DOWN);
          let vol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
          expect(vol).assertEqual(Vol-1);
          done();
        }else if(bol == true){
          await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, Vol).then((data) => {
            console.info(`####setVolume :SUCCESS ${data}`);
          }).catch((error) => {
            if(error.code == 6800301){
              console.log(`${TagFrmwk}: ####setVolume : error ${error.message} ${error.code}`);
            }else{
              console.log(`${TagFrmwk}: ####setVolume : error ${error.message} ${error.code}`);
              expect(false).assertTrue();
              done();
            }
          });
          await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType.MEDIA, VOLUME_ADJUST_DOWN).then((data) => {
            console.info(`####adjustSystemVolumeByStep :SUCCESS ${data}`);
          }).catch((error) => {
            console.log(`${TagFrmwk}: ####adjustSystemVolumeByStep : error ${error.message} ${error.code}`);
            expect(false).assertTrue();
            done();
          });
          let vol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
          expect(vol).assertEqual(Vol);
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }catch (error){
        console.log(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISVOLUMEUNADJUSTABLE_0500: ####isVolumeUnadjustable : error ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISVOLUMEUNADJUSTABLE_0600
     *@tc.name      : isVolumeUnadjustable - Media
     *@tc.desc      : Judge volume is Unadjustable or adjustable
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISVOLUMEUNADJUSTABLE_0600', 0, async function (done) {
      try {
        let bol = await audioVolumeGroupManager.isVolumeUnadjustable();
        console.info(`####isVolumeUnadjustable :SUCCESS, is ${bol}`);
        let vol_def = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        let Vol =1;
        if(bol == false){
          await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, Vol);
          let vol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
          expect(vol).assertEqual(Vol);
          done();
        }else if(bol == true){
          await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, Vol).then((data) => {
            console.info(`####setVolume :SUCCESS ${data}`);
          }).catch((error) => {
            if(error.code == 6800301){
              console.log(`${TagFrmwk}: ####setVolume : error ${error.message} ${error.code}`);
            }else{
              console.log(`${TagFrmwk}: ####setVolume : error ${error.message} ${error.code}`);
              expect(false).assertTrue();
              done();
            }
          });
          let vol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
          expect(vol).assertEqual(vol_def);
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }catch (error){
        console.log(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISVOLUMEUNADJUSTABLE_0600: ####isVolumeUnadjustable : error ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

  })
}
