/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import fileio from '@system.fileio';
import fileShareAbility from '@ohos.fileshare';
import {
  describe,
  beforeAll,
  it,
  expect
}
from 'deccjsunit/index'
import {
  prepareFile,
  fmsFileName,
  fmsCacheName
}
from './Common'

describe('fmsPerformanceTest', function () {
  beforeAll(() => {
    prepareFile(fmsFileName('music.mp3'), 'content');
    prepareFile(fmsFileName('f0.txt'), 'content');
    prepareFile(fmsFileName('picture.jpg'), 'content');
    prepareFile(fmsFileName('picture2.jpg'), 'content');
    prepareFile(fmsFileName('文件.doc'), 'content');
    prepareFile(fmsFileName('cross Fire.txt'), 'content');
    prepareFile(fmsCacheName('video.mp4'), 'content');
    prepareFile(fmsFileName('file.xlsx'), 'content');
    prepareFile(fmsFileName('f2.ppt'), 'content');
    prepareFile(fmsFileName('f3.doc'), 'content');
    fileio.mkdirSync(fmsFileName('folder'));
    let text = '[{"type": "files-path", "name": "primary_leaf", "path": "/music.mp3"},' +
    '{"type": "files-path", "name": "primary_leaf2", "path": "/f0.txt"},' +
    '{"type": "files-path", "name": "primary_leaf3", "path": "/picture.jpg"},' +
    '{"type": "files-path", "name": "primary_leaf4", "path": "/picture2.jpg"},' +
    '{"type": "files-path", "name": "primary_leaf5", "path": "/文件.doc"},' +
    '{"type": "files-path", "name": "primary_leaf6", "path": "/cross Fire.txt"},' +
    '{"type": "cache-path", "name": "cacheprimary_leaf", "path": "/video.mp4"},' +
    '{"type": "files-path", "name": "primary_leaf7", "path": "/file.xlsx"},' +
    '{"type": "files-path", "name": "primary_leaf8", "path": "/f3.doc"},' +
    '{"type": "files-path", "name": "primary_leaf9", "path": "/folder"' +
    '}]';
    prepareFile(fmsFileName('test.json'), text);
  })

  /**
   * @tc.number SUB_STORAGE_FMS_Performance_0000
   * @tc.name FMS_Performance_0000
   * @tc.desc Performance test
   */
  it('FMS_Performance_0000', 0, function () {
    let start = new Date().getTime();
    for(let i = 0; i < 1000;i++){
      fileShareAbility.fuzzyFileToUri({
        deviceId: '440E-0906',
        authority: 'ohos.acts.test.ability',
        uri: 'internal://app/f0.txt',
        displayName: 'f1.txt',
        success: function () {
          let end = new Date().getTime();
          let time = end - start ;
          start = new Date().getTime()
          console.log('FMS_Performance_0000 call fuzzyFileToUri success. time:' +time+','+i);
        },
        fail: function (data, code) {
          console.log('FMS_Performance_0000 call fuzzyFileToUri fail, code: ' + code + ', data: ' + data);
          expect(null).assertFail();
        },
        complete: function () {
          console.log('FMS_Performance_0000 call fuzzyFileToUri in complete');
        }
      });
    }
  })


})
