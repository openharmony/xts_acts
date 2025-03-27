/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  describe, it, expect,
} from '../Common';
import cloudSync from '@ohos.file.cloudSync';
import fileUri from '@ohos.file.fileuri';
import featureAbility from '@ohos.ability.featureAbility';
import fs from '@ohos.file.fs';
import { Level } from '@ohos/hypium';

export default function cloudSynctest() {
describe('cloudSync_test', function () {

  /**
   * @tc.number SUB_STORAGE_DOWNLOAD_CHANGEDATA_TEST_0100
   * @tc.name test_ChangeData_IsDirectory_001
   * @tc.desc function of API, Test ChangeData isDirectory interfaces.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_ChangeData_IsDirectory_001', Level.LEVEL3, async function () {
    let fpath = await featureAbility.getContext().getFilesDir() + '/test_ChangeData_IsDirectory_001';
    let uri = fileUri.getUriFromPath(fpath);
    try {
      let onCallback1 = (changeData) => {
        console.log('test_ChangeData_IsDirectory_001 changedata:' + changeData.isDirectory);
      }
      cloudSync.registerChange(uri, false, onCallback1);
      cloudSync.unRegisterChange(uri);
    } catch (e) {
      console.log('test_ChangeData_IsDirectory_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900006 && e.message == 'No such device or address').assertTrue();
    }
  });

   /**
   * @tc.number SUB_STORAGE_DOWNLOAD_CHANGEDATA_TEST_0200
   * @tc.name test_ChangeData_IsDirectory_002
   * @tc.desc function of API, Test ChangeData isDirectory interfaces.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_ChangeData_IsDirectory_002', Level.LEVEL3, async function () {
    let dpath = await featureAbility.getContext().getFilesDir() + '/test_ChangeData_IsDirectory_002';
    fs.mkdirSync(dpath);
    let uri = fileUri.getUriFromPath(dpath);
    try {
      let onCallback1 = (changeData) => {
        console.log('test_ChangeData_IsDirectory_002 changedata:' + changeData.isDirectory);
      }
      cloudSync.registerChange(uri, false, onCallback1);
      cloudSync.unRegisterChange(uri);
    } catch (e) {
      console.log('test_ChangeData_IsDirectory_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900006 && e.message == 'No such device or address').assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_DOWNLOAD_CHANGEDATA_TEST_0300
   * @tc.name test_ChangeData_Uris_003
   * @tc.desc function of API, Test ChangeData Uris interfaces.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('test_ChangeData_Uris_003', Level.LEVEL3, async function () {
    let dpath = await featureAbility.getContext().getFilesDir() + '/test_ChangeData_Uris_003';
    fs.mkdirSync(dpath);
    let uri = fileUri.getUriFromPath(dpath);
    fs.rmdirSync(dpath);
    try {
      let onCallback1 = (changeData) => {
        if (changeData.type == cloudSync.NotifyType.NOTIFY_ADDED) {
          console.log('test_ChangeData_Uris_003 added changeData:' + changeData.uris);
        } else if (changeData.type== cloudSync.NotifyType.NOTIFY_DELETED) {
          console.log('test_ChangeData_Uris_003 removed changeData:' + changeData.uris);
        }
      }
      cloudSync.registerChange(uri, false, onCallback1);
      cloudSync.unRegisterChange(uri);
    } catch (e) {
      console.log('test_ChangeData_IsDirectory_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900006 && e.message == 'No such device or address').assertTrue();
    }
  });
});
}