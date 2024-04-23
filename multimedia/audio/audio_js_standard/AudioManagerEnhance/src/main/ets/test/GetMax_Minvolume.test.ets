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

let TagFrmwk: string = "audioManagerEnhanceTest";
let audioVolumeGroupManager: audio.AudioVolumeGroupManager = null;

function getAudioManager() {
  let audioManager = audio.getAudioManager();
  if (audioManager != null) {
    console.info(`${TagFrmwk}: getAudioManger : PASS`);
    let audioVolumeManager = audioManager.getVolumeManager();
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

function sleep(ms: number) {
  return new Promise<number>(resolve => setTimeout(resolve, ms));
}

async function getPermission() {
  console.info("getPermission IN\n")
  let permissions = ['ohos.permission.MICROPHONE', 'ohos.permission.MODIFY_AUDIO_SETTINGS', 'ohos.permission.ACCESS_NOTIFICATION_POLICY'];
  featureAbility.getContext().requestPermissionsFromUser(permissions, 0, (data) => {
    console.info("request success" + JSON.stringify(data));
  })
}

export default function audioManagerTest() {
  describe('getMax_Minvolume', () => {


    beforeAll(async () => {
      console.info('TestLog: Start Testing audioManagerTest Interfaces\n');
      // await getPermission();
      // await sleep(3000);
    })
    beforeEach(async () => {
      console.info(`${TagFrmwk}: beforeEach: Prerequisites at the test case level`);
      getAudioManager();
      await sleep(100);
    })
    afterEach(async () => {
      console.info(`${TagFrmwk}: afterEach: Test case-level clearance conditions`);
      await sleep(100);
    })
    afterAll(() => {
      console.info(`${TagFrmwk}: afterAll: Test suite-level cleanup condition`);
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUME_0100
     * @tc.name      : getDefaultVolume - Media
     * @tc.desc      : Judge volume is Unadjustable or adjustable
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUME_0100', 0, async (done: Function) => {
      try {
        let maxvol1 = new ArrayList<Number>();
        var maxvol2 = [15,20];
        for (let index = 0; index < env.AudioVolumeType.length; index++) {
          let maxvol = await audioVolumeGroupManager.getMaxVolume(env.AudioVolumeType[index]);
          console.info(`${env.AudioVolumeType[index]} max volume : ${maxvol}`);
          maxvol1.add(maxvol);
        }
        for (let i = 0; i < maxvol1.length; i++) {
          console.info(`check maxvolume: maxvol1 : ${maxvol1[i]}, maxvol2 : 20 or 15 `);
          expect(true).assertEqual(maxvol2.includes(maxvol1[i]));
        }
        done();
      } catch (error) {
        console.log(`getVolume error: ${error.code}, message ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUME_0100
     * @tc.name      : getDefaultVolume - Media
     * @tc.desc      : Judge volume is Unadjustable or adjustable
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUME_0100', 0, async (done: Function) => {
      try {
        let minvol1 = new ArrayList<Number>();
        let minvol2 = [1, 0, 0, 1, 1, 1];
        for (let index = 0; index < env.AudioVolumeType.length; index++) {
          let minvol = await audioVolumeGroupManager.getMinVolume(env.AudioVolumeType[index]);
          console.info(`${env.AudioVolumeType[index]} min volume : ${minvol}`);
          minvol1.add(minvol);
        }
        for (let i = 0; i < minvol1.length; i++) {
          console.info(`check minvolume minvol1 : ${minvol1[i]}, minvol2 : ${minvol2[i]}`);
          expect(minvol1[i]).assertEqual(minvol2[i]);
        }
        done();
      } catch (error) {
        console.log(`getVolume error ${error.code}, message ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

  })
}
