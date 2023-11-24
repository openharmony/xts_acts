/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, expect, it } from '@ohos/hypium'
import dirent from 'libdirentndk.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs'


export default function direntNdkTest() {
  describe('MuslDirentTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_OPENDIR_0100
     * @tc.name       : testMuslDirentOpendir001
     * @tc.desc       : test opendir
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslDirentOpendir001', 0, async (done: Function) => {
      let dir = "./sdcard/log/hrs.log";
      let data: number = dirent.opendir(dir);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_TELLDIR_0100
     * @tc.name       : testMuslDirentTelldir001
     * @tc.desc       : telldir
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslDirentTelldir001', 0, async (done: Function) => {
      let a: number = dirent.telldir();
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_SCANDIR64_0100
     * @tc.name       : testMuslDirentScandir64001
     * @tc.desc       : test scandir64
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslDirentScandir64001', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;

      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, "Try to write str.");
      console.info("The length of str is: " + writeLen);
      console.info("pattr-", filesDir + '/test.txt');
      let buf = new ArrayBuffer(1024);
      let readLen = fs.readSync(file.fd, buf, {
        offset: 0
      });
      fs.closeSync(file);
      let b = 0
      let a: number = dirent.scandir64(filesDir, b);
      expect(a).assertEqual(3);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_SCANDIR64_0200
     * @tc.name       : testMuslDirentScandir64002
     * @tc.desc       : test scandir64
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslDirentScandir64002', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, "Try to write str.");
      console.info("The length of str is: " + writeLen);
      console.info("pattr-", filesDir + '/test.txt');
      let buf = new ArrayBuffer(1024);
      let readLen = fs.readSync(file.fd, buf, {
        offset: 0
      });
      fs.closeSync(file);

      let b = 1
      let a: number = dirent.scandir64(filesDir, b);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_SCANDIR_0100
     * @tc.name       : testMuslDirentScandir001
     * @tc.desc       : test scandir
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslDirentScandir001', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;

      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, "Try to write str.");
      console.info("The length of str is: " + writeLen);
      console.info("pattr-", filesDir + '/test.txt');
      let buf = new ArrayBuffer(1024);
      let readLen = fs.readSync(file.fd, buf, {
        offset: 0
      });
      fs.closeSync(file);
      let b = 0
      let a: number = dirent.scandir(filesDir, b);
      expect(a).assertEqual(3);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_SCANDIR_0200
     * @tc.name       : testMuslDirentScandir002
     * @tc.desc       : test scandir
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslDirentScandir002', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;

      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, "Try to write str.");
      console.info("The length of str is: " + writeLen);
      console.info("pattr-", filesDir + '/test.txt');
      let buf = new ArrayBuffer(1024);
      let readLen = fs.readSync(file.fd, buf, {
        offset: 0
      });
      fs.closeSync(file);

      let b = 1
      let a: number = dirent.scandir(filesDir, b);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_SEEKDIR_0100
     * @tc.name       : testMuslDirentSeekdir001
     * @tc.desc       : test seekdir
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslDirentSeekdir001', 0, async (done: Function) => {
      let a: number = dirent.seekdir(0);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_SEEKDIR_0200
     * @tc.name       : testMuslDirentSeekdir002
     * @tc.desc       : test seekdir
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslDirentSeekdir002', 0, async (done: Function) => {
      let a: number = dirent.seekdir(1);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_READDIR_0100
     * @tc.name       : testMuslDirentReaddir001
     * @tc.desc       : test readdir
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslDirentReaddir001', 0, async (done: Function) => {

      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/testReaddir.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, "Try to write str.");
      console.info("The length of str is: " + writeLen);
      fs.closeSync(file);

      let param = 0;
      let result: number = dirent.readdir(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_READDIRR_0100
     * @tc.name       : testMuslDirentReaddirR001
     * @tc.desc       : test readdir_r
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslDirentReaddirR001', 0, async (done: Function) => {

      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/testReaddirR.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, "Try to write str.");
      console.info("The length of str is: " + writeLen);
      fs.closeSync(file);
      let param = 0;
      let result: number = dirent.readdirR(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_READDIR64_0100
     * @tc.name       : testMuslDirentReaddir64001
     * @tc.desc       : test readdir64
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslDirentReaddir64001', 0, async (done: Function) => {

      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/testReaddir64.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, "Try to write str.");
      console.info("The length of str is: " + writeLen);
      fs.closeSync(file);

      let param = 0;
      let result: number = dirent.readdir64(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_READDIR64R_0100
     * @tc.name       : testMuslDirentReaddir64R001
     * @tc.desc       : test readdir64_r
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslDirentReaddir64R001', 0, async (done: Function) => {

      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/testReaddir64R.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, "Try to write str.");
      console.info("The length of str is: " + writeLen);
      fs.closeSync(file);
      let param = 0;
      let result: number = dirent.readdir64R(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_REWINDDIR_0100
     * @tc.name       : testMuslDirentRewinddir001
     * @tc.desc       : test rewinddir
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslDirentRewinddir001', 0, async (done: Function) => {

      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/testRewinddir.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, "Try to write str.");
      console.info("The length of str is: " + writeLen);
      fs.closeSync(file);

      let result: number = dirent.rewinddir();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_FDOPENDIR_0100
     * @tc.name       : testMuslDirentFdOpenDir001
     * @tc.desc       : test fdopendir
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslDirentFdOpenDir001', 0, async (done: Function) => {
      let result = false;
      if (dirent.fdopendir() >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_CLOSEDIR_0100
     * @tc.name       : testMuslDirentCloseDir001
     * @tc.desc       : test closedir
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslDirentCloseDir001', 0, async (done: Function) => {
      let result = false;
      if (dirent.closedir() >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_DIRFD_0100
     * @tc.name       : testMuslDirentDirFd001
     * @tc.desc       : test dirfd
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslDirentDirFd001', 0, async (done: Function) => {
      let result = false;
      if (dirent.dirfd() >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_ALPHASORT_0100
     * @tc.name       : testMuslDirentAlphasort001
     * @tc.desc       : test alphasort
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslDirentAlphasort001', 0, async (done: Function) => {
      let resultValue = 0;
      let result: number = dirent.alphasort();
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_ALPHASORT64_0100
     * @tc.name       : testMuslDirentAlphasort64001
     * @tc.desc       : test alphasort64
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslDirentAlphasort64001', 0, async (done: Function) => {
      let resultValue = 0;
      let result: number = dirent.alphasort64();
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_GETDENTS_0100
     * @tc.name       : testMuslDirentGetdents001
     * @tc.desc       : test getdents
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslDirentGetdents001', 0, async (done: Function) => {
      let resultValue = 0;
      let result: number = dirent.getdents();
      expect(result).assertEqual(resultValue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DIRENT_GETDENTS64_0100
     * @tc.name       : testMuslDirentGetdents64001
     * @tc.desc       : test getdents64
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     * @
     */
    it('testMuslDirentGetdents64001', 0, async (done: Function) => {
      let resultValue = 0;
      let result: number = dirent.getdents64();
      expect(result).assertEqual(resultValue);
      done()
    });
  })
}