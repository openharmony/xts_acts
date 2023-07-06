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
import ArrayList from '@ohos.util.ArrayList';
import * as env from './Const.ets';

export default function audioManagerTest() {
  describe('getSystemVolumeInDb', function () {
    let audioManager = null;
    let audioVolumeManager = null;
    let audioVolumeGroupManager = null;
    let TagFrmwk = "audioManagerEnhanceTest";
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
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0100
     *@tc.name      : getSystemVolumeInDb - Media - Promise
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0100', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 3, audio.DeviceType.SPEAKER).then((data) => {
            console.info(`####getSystemVolumeInDb :SUCCESS ${data}`);
            expect(true).assertTrue();
            done();
        }).catch((error) => {
          console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${error}`);
          expect(false).assertTrue();
          done();
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0100: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0200
     *@tc.name      : getSystemVolumeInDb - Media - Promise
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0200', 0, async function (done) {
      try {
        for(let index in audio.AudioVolumeType){
          console.info(`####AudioVolumeType: ${index}`);
          await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType[index], 3, audio.DeviceType.SPEAKER).then((data) => {
              console.info(`####${index} adjustSystemVolumeByStep :SUCCESS ${data}`);
          }).catch((error) => {
            console.log(`${TagFrmwk}: ####${index} adjustSystemVolumeByStep : error ${error}`);
            expect(false).assertTrue();
            done();
          });
        }
        done();
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0200: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0300
     *@tc.name      : getSystemVolumeInDb - Media - Promise
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0300', 0, async function (done) {
      try {
        let maxVol = await audioVolumeGroupManager.getMaxVolume(audio.AudioVolumeType.MEDIA);
        let minVol = await audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType.MEDIA);
        let volLevel = 0;
        for(volLevel = minVol; volLevel <= maxVol; volLevel++){
          await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, volLevel, audio.DeviceType.SPEAKER).then((data) => {
            console.info(`#### ${volLevel} getSystemVolumeInDb :SUCCESS ${data}`);
          }).catch((error) => {
            console.log(`${TagFrmwk}: #### ${volLevel} getSystemVolumeInDb : error ${error}`);
            expect(false).assertTrue();
            done();
          });
        }
        done();
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0300: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0400
     *@tc.name      : getSystemVolumeInDb - Media - Promise
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0400', 0, async function (done) {
      try {
        for(let index in audio.DeviceType){
            await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 1, audio.DeviceType[index]).then((data) => {
              console.info(`####${index} getSystemVolumeInDb :SUCCESS ${data}`);
            }).catch((error) => {
              if(index == 'DEFAULT' || index == 'MAX' || index == 'INVALID' || index == 'NONE'){
                console.log(`####${index} getSystemVolumeInDb :${error.code} ${error.message}`);
              }else{
                console.log(`${TagFrmwk}: ####${index} getSystemVolumeInDb : error ${error.message} ${error.code}`);
                expect(false).assertTrue();
                done();
              }
            });
        }
        done();
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0400: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0500
     *@tc.name      : getSystemVolumeInDb - Media - Promise
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0500', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(-1, 3, audio.DeviceType.SPEAKER).then((data) => {
          console.info(`####getSystemVolumeInDb :SUCCESS ${data}`);
          expect(false).assertTrue();
          done();
        }).catch((error) => {
          if(error.code == UNSUPORTED_OPTION_6800104){
            console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${error.message} ${error.code}`);
            expect(true).assertTrue();
            done();
          }else{
            expect(false).assertTrue();
            done();
          }
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0500: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0600
     *@tc.name      : getSystemVolumeInDb - Media - Promise
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0600', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, -1, audio.DeviceType.SPEAKER).then((data) => {
          console.info(`####getSystemVolumeInDb :SUCCESS ${data}`);
          expect(false).assertTrue();
          done();
        }).catch((error) => {
          if(error.code == UNSUPORTED_OPTION_6800104){
            console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${error.message} ${error.code}`);
            expect(true).assertTrue();
            done();
          }else{
            expect(false).assertTrue();
            done();
          }
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0600: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0700
     *@tc.name      : getSystemVolumeInDb - Media - Promise
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0700', 0, async function (done) {
      try {
        let maxVol = audioVolumeGroupManager.getMaxVolume(audio.AudioVolumeType.MEDIA);
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, maxVol+1, audio.DeviceType.SPEAKER).then((data) => {
          console.info(`####getSystemVolumeInDb :SUCCESS ${data}`);
          expect(false).assertTrue();
          done();
        }).catch((error) => {
          if(error.code == INVALID_INPUT_PARAMETER_6800101){
            console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${error.message} ${error.code}`);
            expect(true).assertTrue();
            done();
          }else{
            expect(false).assertTrue();
            done();
          }
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0700: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0800
     *@tc.name      : getSystemVolumeInDb - Media - Promise
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0800', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 3, -1).then((data) => {
          console.info(`####getSystemVolumeInDb :SUCCESS ${data}`);
          expect(true).assertTrue();
          done();
        }).catch((error) => {
            console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${error.message} ${error.code}`);
            expect(false).assertTrue();
            done();
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0800: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0900
     *@tc.name      : getSystemVolumeInDb - Media - Promise
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0900', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb('123', 3, audio.DeviceType.SPEAKER).then((data) => {
          console.info(`####getSystemVolumeInDb :SUCCESS ${data}`);
          expect(false).assertTrue();
          done();
        }).catch((error) => {
           if(error.code == INVALID_INPUT_PARAMETER_6800101){
            console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${error.message} ${error.code}`);
            expect(true).assertTrue();
            done();
          }else{
            expect(false).assertTrue();
            done();
          }
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_0900: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1000
     *@tc.name      : getSystemVolumeInDb - Media - Promise
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1000', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, '123', audio.DeviceType.SPEAKER).then((data) => {
          console.info(`####getSystemVolumeInDb :SUCCESS ${data}`);
          expect(false).assertTrue();
          done();
        }).catch((error) => {
          if(error.code == INVALID_INPUT_PARAMETER_6800101){
            console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${error.message} ${error.code}`);
            expect(true).assertTrue();
            done();
          }else{
            expect(false).assertTrue();
            done();
          }
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1000: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1100
     *@tc.name      : getSystemVolumeInDb - Media - Promise
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1100', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 3, audio.DeviceType.MIC).then((data) => {
          console.info(`####getSystemVolumeInDb :SUCCESS ${data}`);
          expect(true).assertTrue();
          done();
        }).catch((error) => {
          console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${error.message} ${error.code}`);
          expect(false).assertTrue();
          done();
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1100: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1200
     *@tc.name      : getSystemVolumeInDb - Media - Promise
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1200', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(3, audio.DeviceType.SPEAKER).then((data) => {
          console.info(`####getSystemVolumeInDb :SUCCESS ${data}`);
          expect(true).assertTrue();
          done();
        }).catch((error) => {
          console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${error.message} ${error.code}`);
          expect(false).assertTrue();
          done();
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1200: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1300
     *@tc.name      : getSystemVolumeInDb - Media - Promise
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1300', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, audio.DeviceType.SPEAKER).then((data) => {
          console.info(`####getSystemVolumeInDb :SUCCESS ${data}`);
          expect(true).assertTrue();
          done();
        }).catch((error) => {
          console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${error.message} ${error.code}`);
          expect(false).assertTrue();
          done();
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1300: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1400
     *@tc.name      : getSystemVolumeInDb - Media - Promise
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1400', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 3).then((data) => {
          console.info(`####getSystemVolumeInDb :SUCCESS ${data}`);
          expect(true).assertTrue();
          done();
        }).catch((error) => {
          console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${error.message} ${error.code}`);
          expect(false).assertTrue();
          done();
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1400: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1500
     *@tc.name      : getSystemVolumeInDb - Media - Promise
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1500', 0, async function (done) {
      try {
        var db1 = new ArrayList<Number>();
        var db2 = new ArrayList<Number>();
        var device = [audio.DeviceType.SPEAKER, audio.DeviceType.EARPIECE, audio.DeviceType.WIRED_HEADSET];
        for(var deviceIndex = 0; deviceIndex < device.length; deviceIndex++){
          for(let typeIndex in audio.AudioVolumeType){
            let maxVol = await audioVolumeGroupManager.getMaxVolume(audio.AudioVolumeType[typeIndex]);
            let minVol = await audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType[typeIndex]);
            for(let volIndex = minVol; volIndex <= maxVol; volIndex++){
              await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType[typeIndex], volIndex, device[deviceIndex]).then((data) => {
                db1.add(data);
              }).catch((error) => {
                console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${error}`);
                expect(false).assertTrue();
                done();
              });
              await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType[typeIndex], volIndex, device[deviceIndex]).then((data) => {
                db2.add(data);
              }).catch((error) => {
                console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${error}`);
                expect(false).assertTrue();
                done();
              });
            }
          }
        }
        console.log(`${TagFrmwk}: ####getSystemVolumeInDb : SUCCESS`);
        for(let i = 0; i < db1.length; i++){
          expect(db1[i]).assertEqual(db2[i]);
        }
        done();
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_PROMISE_1500': error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0100
     *@tc.name      : getSystemVolumeInDb - Media - Callback
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0100', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 3, audio.DeviceType.SPEAKER, (err,data) => {
          if(err){
            console.info(`####getSystemVolumeInDb : error ${err.message} ${err.code}`);
            expect(false).assertTrue();
            done();
          }else{
            console.info(`####getSystemVolumeInDb :SUCCESS ${data}`);
            expect(true).assertTrue();
            done();
          }
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0100: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0200
     *@tc.name      : getSystemVolumeInDb - Media - Callback
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0200', 0, async function (done) {
      try {
        for(let index in audio.AudioVolumeType){
          await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType[index], 3, audio.DeviceType.SPEAKER, (err,data) => {
            if(err){
              console.log(`${TagFrmwk}: ####${index} getSystemVolumeInDb : error ${err.message} ${err.code}`);
              expect(false).assertTrue();
              done();
            }else{
              console.info(`####${index} getSystemVolumeInDb :SUCCESS ${data}`);
            }
          });
          await sleep(20);
        }
        done();
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0200: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0300
     *@tc.name      : getSystemVolumeInDb - Media - Callback
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0300', 0, async function (done) {
      try {
        let maxVol = await audioVolumeGroupManager.getMaxVolume(audio.AudioVolumeType.MEDIA);
        let minVol = await audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType.MEDIA);
        for(let volLevel = minVol; volLevel <= maxVol; volLevel++){
          await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, volLevel, audio.DeviceType.SPEAKER, (err,data) => {
            if(err){
              console.log(`${TagFrmwk}: ####${volLevel} getSystemVolumeInDb : error ${err.message} ${err.code}`);
              expect(false).assertTrue();
              done();
            }else{
              console.info(`####${volLevel} getSystemVolumeInDb :SUCCESS ${data}`);
            }
          });
          await sleep(20);
        }
        done();
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0300: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0400
     *@tc.name      : getSystemVolumeInDb - Media - Callback
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0400', 0, async function (done) {
      try {
        for(let index in audio.DeviceType){
          await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 3, audio.DeviceType[index], (err,data) => {
            if(err){
              if(index == 'DEFAULT' || index == 'MAX' || index == 'INVALID' || index == 'NONE'){
                console.log(`####${index} getSystemVolumeInDb :${err.code} ${err.message}`);
              }else{
                console.log(`${TagFrmwk}: ####${index} getSystemVolumeInDb : error ${err.message} ${err.code}`);
                expect(false).assertTrue();
                done();
              }
            }else {
              console.info(`####${index} getSystemVolumeInDb :SUCCESS ${data}`);
            }
          });
          await sleep(20);
        }
        done();
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0400: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0500
     *@tc.name      : getSystemVolumeInDb - Media - Callback
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0500', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(-1, 3, audio.DeviceType.SPEAKER, (err,data) => {
          if(err.code == UNSUPORTED_OPTION_6800104){
            console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${err.message} ${err.code}`);
            expect(true).assertTrue();
            done();
          }else {
            console.info(`####getSystemVolumeInDb :SUCCESS ${data}`);
            expect(false).assertTrue();
            done();
          }
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0500: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0600
     *@tc.name      : getSystemVolumeInDb - Media - Promise
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0600', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, -1, audio.DeviceType.SPEAKER, (err,data) => {
          if(err.code == UNSUPORTED_OPTION_6800104){
            console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${err.message} ${err.code}`);
            expect(true).assertTrue();
            done();
          }else {
            console.info(`####getSystemVolumeInDb :SUCCESS ${data}`);
            expect(false).assertTrue();
            done();
          }
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0600: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0700
     *@tc.name      : getSystemVolumeInDb - Media - Promise
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0700', 0, async function (done) {
      try {
        let maxVol = audioVolumeGroupManager.getMaxVolume(audio.AudioVolumeType.MEDIA);
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, maxVol+1, audio.DeviceType.SPEAKER, (err,data) => {
          if(err.code == INVALID_INPUT_PARAMETER_6800101){
            console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${err.message} ${err.code}`);
            expect(true).assertTrue();
            done();
          }else {
            console.info(`####getSystemVolumeInDb :SUCCESS ${data}`);
            expect(false).assertTrue();
            done();
          }
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0700: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0800
     *@tc.name      : getSystemVolumeInDb - Media - Promise
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0800', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 3, -1, (err,data) => {
          if(err){
            console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${err.message} ${err.code}`);
            expect(false).assertTrue();
            done();
          }else {
            console.info(`####getSystemVolumeInDb :SUCCESS ${data}`);
            expect(true).assertTrue();
            done();
          }
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0800: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0900
     *@tc.name      : getSystemVolumeInDb - Media - Promise
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0900', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb('123', 3, audio.DeviceType.SPEAKER, (err,data) => {
          if(err.code == INVALID_INPUT_PARAMETER_6800101){
            console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${err.message} ${err.code}`);
            expect(true).assertTrue();
            done();
          }else {
            console.info(`####getSystemVolumeInDb :SUCCESS ${data}`);
            expect(false).assertTrue();
            done();
          }
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_0900: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1000
     *@tc.name      : getSystemVolumeInDb - Media - Promise
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1000', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, '123', audio.DeviceType.SPEAKER, (err,data) => {
          if(err.code == INVALID_INPUT_PARAMETER_6800101){
            console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${err.message} ${err.code}`);
            expect(true).assertTrue();
            done();
          }else {
            console.info(`####getSystemVolumeInDb :SUCCESS ${data}`);
            expect(false).assertTrue();
            done();
          }
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1000: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1100
     *@tc.name      : getSystemVolumeInDb - Media - Promise
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1100', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 3, audio.DeviceType.MIC, (err,data) => {
          if(err){
            console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${err.message} ${err.code}`);
            expect(false).assertTrue();
            done();
          }else {
            console.info(`####getSystemVolumeInDb :SUCCESS ${data}`);
            expect(true).assertTrue();
            done();
          }
        });
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1100: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1200
     *@tc.name      : getSystemVolumeInDb - Media - Promise
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1200', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(3, audio.DeviceType.SPEAKER, (err,data) => {
          if(err) {
            if (err.code == INVALID_INPUT_PARAMETER_6800101) {
              console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${err.message} ${err.code}`);
              expect(true).assertTrue();
              done();
            } else {
              console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${err.message} ${err.code}`);
              expect(false).assertTrue();
              done();
            }
          }
        });
      }catch (error){
        if(error.code == INVALID_INPUT_PARAMETER_6800101){
          console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${error.message} ${error.code}`);
          expect(true).assertTrue();
          done();
        }else{
          console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1200: error ${error.message}, code ${error.code}`);
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1300
     *@tc.name      : getSystemVolumeInDb - Media - Promise
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1300', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, audio.DeviceType.SPEAKER, (err,data) => {
          if(err){
            if(err.code == INVALID_INPUT_PARAMETER_6800101){
              console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${err.message} ${err.code}`);
              expect(true).assertTrue();
              done();
            }else{
              console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${err.message} ${err.code}`);
              expect(false).assertTrue();
              done();
            }
          }
        });
      }catch (error){
        if(error.code == INVALID_INPUT_PARAMETER_6800101){
          console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${error.message} ${error.code}`);
          expect(true).assertTrue();
          done();
        }else{
          console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1300: error ${error.message}, code ${error.code}`);
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1400
     *@tc.name      : getSystemVolumeInDb - Media - Promise
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1400', 0, async function (done) {
      try {
        await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, 3, (err,data) => {
          if(err){
            if(err.code == INVALID_INPUT_PARAMETER_6800101){
              console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${err.message} ${err.code}`);
              expect(true).assertTrue();
              done();
            }else{
              console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${err.message} ${err.code}`);
              expect(false).assertTrue();
              done();
            }
          }
        });
      }catch (error){
        if(error.code == INVALID_INPUT_PARAMETER_6800101){
          console.log(`${TagFrmwk}: ####getSystemVolumeInDb : error ${error.message} ${error.code}`);
          expect(true).assertTrue();
          done();
        }else{
          console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1400: error ${error.message}, code ${error.code}`);
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1500
     *@tc.name      : getSystemVolumeInDb - Media - Callback
     *@tc.desc      : Gets the volume db value that system calculate by volume type, volume level and device type
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1500', 0, async function (done) {
      try {
        var db1 = new ArrayList<Number>();
        var db2 = new ArrayList<Number>();
        var device = [audio.DeviceType.SPEAKER, audio.DeviceType.EARPIECE, audio.DeviceType.WIRED_HEADSET];
        for(var deviceIndex = 0; deviceIndex < device.length; deviceIndex++){
          for(let typeIndex in audio.AudioVolumeType){
            let maxVol = await audioVolumeGroupManager.getMaxVolume(audio.AudioVolumeType[typeIndex]);
            let minVol = await audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType[typeIndex]);
            for(let volIndex = minVol; volIndex <= maxVol; volIndex++){
              await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType[typeIndex], volIndex, device[deviceIndex], (err,data) => {
                if(err){
                  console.info(`####getSystemVolumeInDb : error ${err.message} ${err.code}`);
                  expect(false).assertTrue();
                  done();
                }else{
                  db1.add(data);
                }
              });
              await audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType[typeIndex], volIndex, device[deviceIndex], (err,data) => {
                if (err) {
                  console.info(`####getSystemVolumeInDb : error ${err.message} ${err.code}`);
                  expect(false).assertTrue();
                  done();
                } else {
                  db2.add(data);
                }
              });
              await sleep(20);
            }
          }
        }
        console.log(`${TagFrmwk}: ####getSystemVolumeInDb : SUCCESS`);
        for(let i = 0; i < db1.length; i++){
            expect(db1[i]).assertEqual(db2[i]);
        }
        done();
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETSYSTEMVOLUMEINDB_CALLBACK_1500: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

  })
}
