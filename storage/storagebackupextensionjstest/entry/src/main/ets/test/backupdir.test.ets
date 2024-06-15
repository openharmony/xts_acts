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

import { describe, it, expect } from '@ohos/hypium';
import BackupExtensionContext from '@ohos.file.BackupExtensionContext';
import BackupExtensionAbility, { BundleVersion } from '@ohos.application.BackupExtensionAbility';
import contextConstant from '@ohos.app.ability.contextConstant';

export default class MyBackupExtAbility extends BackupExtensionAbility {
   async onBackup() {
      console.log("onBackup begin");
      this.context.area = contextConstant.AreaMode.EL1;
      let dir = this.context.backupDir;
      console.log(`onBackup el1 dir: ${dir}`);
      this.context.area = contextConstant.AreaMode.EL2;
      dir = this.context.backupDir;
      console.log(`onBackup el2 dir: ${dir}`);
      console.log("onBackup end");
   }

   async onRestore() {
      console.log("onRestore begin");
      this.context.area = contextConstant.AreaMode.EL1;
      let dir = this.context.backupDir;
      console.log(`onRestore el1 dir: ${dir}`);
      this.context.area = contextConstant.AreaMode.EL2;
      dir = this.context.backupDir;
      console.log(`onRestore el2 dir: ${dir}`);
      console.log("onRestore end");
   }

   async onBackupEx() {
    console.log(`onBackupEx ok`);
    let info = "app diy info";
    return info;
  }

  async onRestoreEx(BundleVersion) {
    console.log(`onRestoreEx ok ${JSON.stringify(BundleVersion)}`);
    let info = "app diy info";
    return info;
  }
}

export default function backupdirTest(){
describe('backupdir_js_test',async function(){

   /**
   * @tc.number SUB_BASIC_FM_FileAPI_BackupDir_0100
   * @tc.name backup_backupdir_001
   * @tc.desc Test backupdir() interfaces
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
   it("backup_backupdir_001", 0, () => {
      try {
         let backupdir = new MyBackupExtAbility();
         backupdir.onBackup();
         console.log('backup-onBackup run ok');
         backupdir.onRestore();
         console.log('backup-onRestore run ok');
         expect(true).assertTrue();
      } catch (error) {
         console.info(`backupextension_backup_backupdir_001 error: ${JSON.stringify(error)}`);
         expect(false).assertTrue();
      }
   });

   /**
   * @tc.number SUB_BASIC_FM_FileAPI_BackupDir_0200
   * @tc.name backup_onBackupEx_001
   * @tc.desc Test onBackupEx() interfaces
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it("backup_onBackupEx_001", 3, () => {
      try {
         let BackupExtensionAbility = new MyBackupExtAbility();
         BackupExtensionAbility.onBackupEx();
         console.log('backup-onBackupEx run ok');
         expect(true).assertTrue();
      } catch (error) {
         console.info(`backup_onBackupEx_001 error: ${JSON.stringify(error)}`);
         expect(false).assertTrue();
      }
   });
});
}