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
          console.info(`isVolumeUnadjustable SUCCESS, is ${bol}`);
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        console.log(`isVolumeUnadjustable error: ${error.code}, message ${error.message}`);
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
        if (bol == false) {
          let vol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
          await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, vol + 1);
          let vol1 = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
          expect(bol).assertEqual(false);
          expect(vol1).assertEqual(vol + 1);
          done();
        } else {
          let vol2 = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
          await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, vol2 + 1).then(() => {
            console.info(`setVolume SUCCESS !, testcase fail !`);
          }).catch((error) => {
            if (error.code == 6800301) {
              console.log(`${TagFrmwk}: setVolume error:${error.code}, system volume cannot be changed !`);
              let vol3 = audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
              expect(bol).assertEqual(true);
              expect(vol3).assertEqual(vol2);
              done();
            } else {
              console.log(`${TagFrmwk}: setVolume error, unkown error: ${error.message} ${error.code}`);
              expect(false).assertTrue();
              done();
            }
          });
        }
      } catch (error) {
        console.log(`isVolumeUnadjustable error ${error.message} ${error.code}, testcase FAIL !`);
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
        if (bol == false) {
          let Vol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
          await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, Vol - 1);
          let Vol1 = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
          expect(bol).assertEqual(false);
          expect(Vol1).assertEqual(Vol - 1);
          done();
        } else {
          let Vol2 = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
          await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, Vol2 - 1).then(() => {
          }).catch((error) => {
            if (error.code == 6800301) {
              console.log(`${TagFrmwk} setVolume error: ${error.code}, system volume cannot be changed!`);
              let Vol3 = audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
              expect(bol).assertEqual(true);
              expect(Vol3).assertEqual(Vol2);
              done();
            } else {
              console.log(`${TagFrmwk}: setVolume : error ${error.code}, unknown error! `);
              expect(false).assertTrue();
              done();
            }
          });
        }
      } catch (error) {
        console.log(`isVolumeUnadjustable unknown error: error ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

  })
}
