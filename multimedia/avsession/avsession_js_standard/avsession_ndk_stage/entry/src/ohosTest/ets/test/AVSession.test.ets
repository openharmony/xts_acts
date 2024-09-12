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
//import avmetadata_builder from 'libentry.so';
import AVSessionManager from '@ohos.multimedia.avsession';
import avSes from 'libentry.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';


export default function builderAbilityTest() {
  describe('builderAbilityTest', () => {


    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    it('CreateAVSessionTest', 0, async () => {
      console.info("test SetPlaybackState ---------------");
      let ret = avSes.runTest('CreateAVSessionTest', [1, '123', '456', '789']);
      expect(ret).assertEqual(0);
      ret = avSes.runTest('CreateAVSessionTest', [3, '1xxx', 'xxxx', 'xxx']);
      expect(ret).assertEqual(0);
      done();
    })

    it('SetPlaybackState', 0, async () => {
      console.info("test SetPlaybackState ---------------");
      let ret = avSes.runTest('SetPlaybackState', [1]);
      expect(ret).assertEqual(0);
      done();
    })

    it('SetLoopMode', 0, async () => {
      console.info("test SetLoopMode ---------------");
      let ret = avSes.runTest('SetLoopMode', [0]);
      expect(ret).assertEqual(0);
      done();
    })

    it('SetPlaybackPosition', 0, async () => {
      console.info("test SetPlaybackPosition ---------------");
      let ret = avSes.runTest('SetPlaybackPosition', [123, 456]);
      expect(ret).assertEqual(0);
      done();
    })

    it('SetAVMetaData', 0, async () => {
      console.info("test SetAVMetaData ---------------");
      let ret = avSes.runTest('SetAVMetaData', ['title', 'artist', 'author', 'album', 'writer',
        'composer', 'mediaImageUri', 'subtitle', 'description', 'lyric', 'assetId', 30, 1, 4000]);
      expect(ret).assertEqual(0);
      done();
    })

    it('TestAllPara', 0, async () => {
      console.info("test setBuilderTitle ---------------");
      let ret = avSes.runTest('TestAll', [1, 'sessionTag', 'sessionTag', 'abilityName',
        'title', 'artist', 'author', 'album', 'writer', 'composer', 'mediaImageUri',
        'subtitle', 'description', 'lyric', 'assetId',
        30, 1, 1, 1, true, 1, 1, 2]);
      expect(ret).assertEqual(0);
      done();
    })
  })
}