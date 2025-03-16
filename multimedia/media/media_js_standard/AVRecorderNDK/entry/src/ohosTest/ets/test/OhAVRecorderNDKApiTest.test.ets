/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import avplayer from 'libavrecorderndk.so'
import fs from '@ohos.file.fs'
import Utils from './Utils';
import { BusinessError } from '@ohos.base';
import media from '@ohos.multimedia.media'


export default function OhAVRecorderNDKApiTest() { // L2
  describe('OhAVRecorderNDKApiTest', () => {

    beforeAll(async () => {

    });
    beforeEach(async () => {

    });
    afterEach(async () => {

    });
    afterAll(() => {

    });

    /**
     * @tc.number     : testOhRecorder0001
     * @tc.name       : testOhRecorder0001
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhRecorder0001', 0, async (done: Function) => {
      console.info(`testOhRecorder0001 test start `);
      let result: number = await avplayer.createAVRecorder();
      expect(result).assertEqual(0);
      result = await avplayer.releaseAVRecorder();
      expect(result).assertEqual(3);
      console.info(`testOhRecorder0001 test end `);
      done();
    });
    /**
     * @tc.number     : testOhRecorder0002
     * @tc.name       : testOhRecorder0002
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhRecorder0002', 0, async (done: Function) => {
      console.info(`testOhRecorder0002 test start `);
      let result: number = await avplayer.createAVRecorder();
      expect(result).assertEqual(0);
      result = await avplayer.prepareAVRecorder(null, "");
      expect(result).assertEqual(3);
      result = await avplayer.updateRotationAVRecorder(null);
      expect(result).assertEqual(3);
      result = await avplayer.releaseAVRecorder();
      expect(result).assertEqual(0);
      console.info(`testOhRecorder0002 test end `);
      done();
    });
    /**
     * @tc.number     : testOhRecorder0003
     * @tc.name       : testOhRecorder0003
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhRecorder0003', 0, async (done: Function) => {
      console.info(`testOhRecorder0003 test start `);
      let result: number = await avplayer.createAVRecorder();
      expect(result).assertEqual(0);
      result = await avplayer.prepareAVRecorder(null, "");
      expect(result).assertEqual(3);
      result = await avplayer.updateRotationAVRecorder(null);
      expect(result).assertEqual(3);
      result = await avplayer.startAVRecorder();
      expect(result).assertEqual(2);
      result = await avplayer.pauseAVRecorder();
      expect(result).assertEqual(3);
      result = await avplayer.stopAVRecorder();
      expect(result).assertEqual(3);
      result = await avplayer.resumeAVRecorder();
      expect(result).assertEqual(3);
      result = await avplayer.resetAVRecorder();
      expect(result).assertEqual(3);
      result = await avplayer.releaseAVRecorder();
      expect(result).assertEqual(0);
      console.info(`testOhRecorder0003 test end `);
      done();
    });


  });
}