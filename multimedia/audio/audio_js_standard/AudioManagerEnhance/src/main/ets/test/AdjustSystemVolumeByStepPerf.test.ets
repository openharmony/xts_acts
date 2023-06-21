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
  describe('adjustSystemVolumeByStepPerf', function () {
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
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_PERF
     *@tc.name      : adjustSystemVolumeByStep - Media - Promise
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_PERF', 0, async function (done) {
      try{
        let number = `SUB_MULTIMEDIA_AUDIO_RENDERER_GETRENDERERSAMPLINGRATE_PROMISE_PERF`
        let minVol = await audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType.MEDIA);
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, minVol);
        let startTime = new Date().getTime()
        for (let index = 0; index < env.GENERAL_RUN_TIMES; index++){
          await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType.MEDIA, VOLUME_ADJUST_UP);
          await audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType.MEDIA, VOLUME_ADJUST_DOWN);
        }
        let endTime = new Date().getTime()
        let averageTime = ((endTime - startTime) * 1000 / env.GENERAL_RUN_TIMES) / 2
        console.info(`${number} averageTime: ${averageTime} us`)
        done();
      }catch(error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_PROMISE_PERF: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_PERF
     *@tc.name      : adjustSystemVolumeByStep - Media - Callback
     *@tc.desc      : Adjust one auodio volume we want.
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_PERF', 0, async function (done) {
      try {
        let number = `SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_PERF`
        let minVol = await audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType.MEDIA);
        await audioVolumeGroupManager.setVolume(audio.AudioVolumeType.MEDIA, minVol);
        let maxVol = await audioVolumeGroupManager.getMaxVolume(audio.AudioVolumeType.MEDIA);
        let Vol;
        let startTime = 0;
        let endTime = 0;
        let totalTime = 0;
        adjustSystemVolumeByStepTest(0)
        async function adjustSystemVolumeByStepTest(index){
          Vol = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
          if(Vol < maxVol){
            startTime = new Date().getTime();
            audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType.MEDIA, VOLUME_ADJUST_UP,(err, data) => {
              if (index < env.GENERAL_RUN_TIMES){
                endTime = new Date().getTime();
                totalTime += endTime - startTime;
                adjustSystemVolumeByStepTest(index + 1)
              }else{
                 let averageTime = totalTime * 1000 / env.GENERAL_RUN_TIMES
                 console.info(`${number} averageTime: ${averageTime} us`)
                 done()
              }
            })
          }else if(Vol == maxVol){
            startTime = new Date().getTime();
            audioVolumeGroupManager.adjustSystemVolumeByStep(audio.AudioVolumeType.MEDIA, VOLUME_ADJUST_DOWN,(err, data) => {
              if (index < env.GENERAL_RUN_TIMES){
                endTime = new Date().getTime();
                totalTime += endTime - startTime;
                adjustSystemVolumeByStepTest(index + 1)
              }else{
                let averageTime = totalTime * 1000 / env.GENERAL_RUN_TIMES
                console.info(`${number} averageTime: ${averageTime} us`)
                done()
              }
            })
          }
        }
      }catch (error){
        console.info(`SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ADJUSTSYSTEMVOLUMEBYSTEP_CALLBACK_PERF: error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

  })
}
