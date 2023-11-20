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
import stdio from 'libstdiondk.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs'


export default function stdioNdkTest() {
  describe('MuslStdioTest', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_GETLINE_0100
     * @tc.name       : testMuslStdioGetLine001
     * @tc.desc       : test getline
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    //comment block

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_POPEN_0100
     * @tc.name       : testMuslStdioPOpen001
     * @tc.desc       : test popen
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    //blocked comment
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_PCLOSE_0100
     * @tc.name       : testMuslStdioPClose001
     * @tc.desc       : test pclose
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    //block
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_PERROR_0100
     * @tc.name       : testMuslStdioPerror001
     * @tc.desc       : test perror
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioPerror001', 0, async (done: Function) => {
      let data: number = stdio.perror();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_PRINTF_0100
     * @tc.name       : testMuslStdioPrintf001
     * @tc.desc       : test printf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioPrintf001', 0, async (done: Function) => {
      let a = "123";
      let data: number = stdio.printf(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(3);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_PRINTF_0200
     * @tc.name       : testMuslStdioPrintf002
     * @tc.desc       : test printf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioPrintf002', 0, async (done: Function) => {
      let a = "aaa";
      let data: number = stdio.printf(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(3);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_PRINTF_0300
     * @tc.name       : testMuslStdioPrintf003
     * @tc.desc       : test printf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioPrintf003', 0, async (done: Function) => {
      let a = "1%d\n";
      let data: number = stdio.printf(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(4);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_NRAND48_0100
     * @tc.name       : testMuslStdlibNrand48001
     * @tc.desc       : test nrand48
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdlibNrand48001', 0, async (done: Function) => {
      let data: number = stdio.nrand48();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(949179875);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_PUTCHAR_0100
     * @tc.name       : testMuslStdioPutchar001
     * @tc.desc       : test putchar
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioPutchar001', 0, async (done: Function) => {
      let data: number = stdio.putchar(0);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(48);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_PUTCHAR_0200
     * @tc.name       : testMuslStdioPutchar002
     * @tc.desc       : test putchar
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioPutchar002', 0, async (done: Function) => {
      let data: number = stdio.putchar(1);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(97);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_PUTCHAR_0300
     * @tc.name       : testMuslStdioPutchar003
     * @tc.desc       : test putchar
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioPutchar003', 0, async (done: Function) => {
      let data: number = stdio.putchar(2);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(10);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_PUTCHAR_UNLOCKED_0100
     * @tc.name       : testMuslStdioPutcharUnlocked001
     * @tc.desc       : test putchar_unlocked
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioPutcharUnlocked001', 0, async (done: Function) => {
      let data: number = stdio.putcharUnlocked(0);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(48);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_PUTCHAR_UNLOCKED_0200
     * @tc.name       : testMuslStdioPutcharUnlocked002
     * @tc.desc       : test putchar_unlocked
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioPutcharUnlocked002', 0, async (done: Function) => {
      let data: number = stdio.putcharUnlocked(1);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(97);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_PUTCHAR_UNLOCKED_0300
     * @tc.name       : testMuslStdioPutcharUnlocked003
     * @tc.desc       : test putchar_unlocked
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioPutcharUnlocked003', 0, async (done: Function) => {
      let data: number = stdio.putcharUnlocked(2);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(10);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_PUTENV_0100
     * @tc.name       : testMuslStdioPutenv001
     * @tc.desc       : test putenv
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioPutenv001', 0, async (done: Function) => {
      let data: number = stdio.putenv();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_PUTS_0100
     * @tc.name       : testMuslStdioPuts001
     * @tc.desc       : test puts
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioPuts001', 0, async (done: Function) => {
      let a = "123";
      let data: number = stdio.puts(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_PUTS_0200
     * @tc.name       : testMuslStdioPuts002
     * @tc.desc       : test puts
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioPuts002', 0, async (done: Function) => {
      let a = "aaa";
      let data: number = stdio.puts(a);
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_OPEN_MEMSTREAM_0100
     * @tc.name       : testMuslStdioOpenMemstream001
     * @tc.desc       : test open_memstream
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioOpenMemstream001', 0, async (done: Function) => {
      let data: number = stdio.openMemstream();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_STDERR_0100
     * @tc.name       : testMuslStdioStdErr001
     * @tc.desc       : test stderr
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioStdErr001', 0, async (done: Function) => {
      let data: number = stdio.stdErr();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(2);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_STDIN_0100
     * @tc.name       : testMuslStdioStdIn001
     * @tc.desc       : test stdin
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioStdIn001', 0, async (done: Function) => {
      let data: number = stdio.stdIn();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_STDOUT_0100
     * @tc.name       : testMuslStdioStdOut001
     * @tc.desc       : test stdout
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioStdOut001', 0, async (done: Function) => {
      let data: number = stdio.stdOut();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_GETS_0100
     * @tc.name       : testMuslStdioGets001
     * @tc.desc       : test gets
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioGets001', 0, async (done: Function) => {
      let data: number = stdio.gets();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(-1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_PUTC_0100
     * @tc.name       : testMuslStdioPutc001
     * @tc.desc       : test putc
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_PUTCUNLOCKED_0100
     * @tc.name       : testMuslStdioPutcUnlocked001
     * @tc.desc       : test putc_unlocked
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioPutcUnlocked001', 0, async (done: Function) => {
      let data: number = stdio.putCUnlocked();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_SPRINTF_0100
     * @tc.name       : testMuslStdioSprintf001
     * @tc.desc       : test sprintf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioSprintf001', 0, async (done: Function) => {
      let b = 1;
      let data:number = stdio.sprintf(b);
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_SNPRINTF_0100
     * @tc.name       : testMuslStdioSnprintf001
     * @tc.desc       : test snprintf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioSnprintf001', 0, async (done: Function) => {
      let data: number = stdio.snprintf();
      expect(data).assertEqual(2);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_SSCANF_0100
     * @tc.name       : testMuslStdioSscanf001
     * @tc.desc       : test sscanf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioSscanf001', 0, async (done: Function) => {
      let data: number = stdio.sscanf();
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_TEMPNAM_0100
     * @tc.name       : testMuslStdioTempnam001
     * @tc.desc       : test tempnam
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioTempnam001', 0, async (done: Function) => {
      let data: number = stdio.tempnam();
      expect(data).assertContain("/data/storage/el2/base/files");
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_TMPFILE_0100
     * @tc.name       : testMuslStdioTmpfile001
     * @tc.desc       : test tmpfile
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioTmpfile001', 0, async (done: Function) => {
      let data: number = stdio.tmpfile();
      expect(data).assertEqual(-1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_TMPFILE64_0100
     * @tc.name       : testMuslStdioTmpfile64001
     * @tc.desc       : test tmpfile64
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioTmpfile64001', 0, async (done: Function) => {
      let data: number = stdio.tmpfile64();
      expect(data).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_TMPNAM_0100
     * @tc.name       : testMuslStdioTmpnam001
     * @tc.desc       : test tmpnam
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioTmpnam001', 0, async (done: Function) => {
      let data: number = stdio.tmpnam();
      expect(data).assertContain("/tmp");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_SETVBUF_0100
     * @tc.name       : testMuslStdioSetvbuf001
     * @tc.desc       : test setvbuf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioSetvbuf001', 0, async (done: Function) => {
      let a: number = stdio.setvbuf();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_SCANF_0100
     * @tc.name       : testMuslStdioScanf001
     * @tc.desc       : test scanf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioScanf001', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/test.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, "%d%d%d");
      console.info("The length of str is: " + writeLen);
      let buf = new ArrayBuffer(1024);
      let readLen = fs.readSync(file.fd, buf, {
        offset: 0
      });
      fs.closeSync(file);

      let a: number = stdio.scanf(filesDir + '/test.txt');
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_VFPRINTF_0100
     * @tc.name       : testMuslStdioVfprintf001
     * @tc.desc       : test vfprintf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioVfprintf001', 0, async (done: Function) => {
      let a: number = stdio.vfprintf();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_VPRINTF_0100
     * @tc.name       : testMuslStdioVprintf001
     * @tc.desc       : test vprintf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioVprintf001', 0, async (done: Function) => {
      let a: number = stdio.vprintf();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_VSNPRINTF_0100
     * @tc.name       : testMuslStdioVsnprintf001
     * @tc.desc       : test vsnprintf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioVsnprintf001', 0, async (done: Function) => {
      let a: number = stdio.vsnprintf();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_VSSCANF_0100
     * @tc.name       : testMuslStdioVsscanf001
     * @tc.desc       : test vsscanf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioVsscanf001', 0, async (done: Function) => {
      let a: number = stdio.vsscanf();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_REMOVE_0100
     * @tc.name       : testMuslStdioRemove001
     * @tc.desc       : test remove
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioRemove001', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/testRemove.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, "Try to write str.");
      console.info("The length of str is: " + writeLen);
      fs.closeSync(file);

      let result: number = stdio.remove();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_REMOVE_0200
     * @tc.name       : testMuslStdioRemove002
     * @tc.desc       : test remove
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioRemove002', 0, async (done: Function) => {
      let result: number = stdio.remove();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_RENAME_0100
     * @tc.name       : testMuslStdioRename001
     * @tc.desc       : test rename
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioRename001', 0, async (done: Function) => {

      let result: number = stdio.rename();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_RENAME_0200
     * @tc.name       : testMuslStdioRename002
     * @tc.desc       : test rename
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioRename002', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/testRenameOld.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, "Try to write str.");
      console.info("The length of str is: " + writeLen);
      fs.closeSync(file);

      let result: number = stdio.rename();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_RENAMEAT_0100
     * @tc.name       : testMuslStdioRenameat001
     * @tc.desc       : test renameat
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioRenameat001', 0, async (done: Function) => {

      let result: number = stdio.renameat(0);
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_RENAMEAT_0200
     * @tc.name       : testMuslStdioRenameat002
     * @tc.desc       : test renameat
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioRenameat002', 0, async (done: Function) => {
      let result: number = stdio.renameat(1);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_REWIND_0100
     * @tc.name       : testMuslStdioRewind001
     * @tc.desc       : test rewind
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioRewind001', 0, async (done: Function) => {

      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/testRewind.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, "Try to write str.");
      console.info("The length of str is: " + writeLen);
      fs.closeSync(file);

      let result: number = stdio.rewind();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_PUTW_0100
     * @tc.name       : testMuslStdioPutw001
     * @tc.desc       : test putw
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioPutw001', 0, async (done: Function) => {

      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/testPutw.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, "Try to write str.");
      console.info("The length of str is: " + writeLen);
      fs.closeSync(file);

      let param = 0;
      let result: number = stdio.putw(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_PUTW_0200
     * @tc.name       : testMuslStdioPutw002
     * @tc.desc       : test putw
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioPutw002', 0, async (done: Function) => {

      let param = -1;
      let result: number = stdio.putw(param);
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_UNGETC_0100
     * @tc.name       : testMuslStdioUngetc001
     * @tc.desc       : test ungetc
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioUngetc001', 0, async (done: Function) => {
      let b = 48;
      let a: number = stdio.ungetc(b);
      expect(a).assertEqual(48);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_VDPRINTF_0100
     * @tc.name       : testMuslStdioVdprintf001
     * @tc.desc       : test vdprintf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioVdprintf001', 0, async (done: Function) => {
      let b = 0;
      let a: number = stdio.vdprintf(b, "");
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_VDPRINTF_0200
     * @tc.name       : testMuslStdioVdprintf002
     * @tc.desc       : test vdprintf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioVdprintf002', 0, async (done: Function) => {
      let b = 1;

      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;

      // 新建并打开文件
      let file = fs.openSync(filesDir + '/vdprintf.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);

      let a: number = stdio.vdprintf(b, filesDir + '/vdprintf.txt');
      expect(a).assertEqual(1);

      // 关闭文件
      fs.closeSync(file);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_VASPRINTF_0100
     * @tc.name       : testMuslStdioVasprintf001
     * @tc.desc       : test vasprintf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioVasprintf001', 0, async (done: Function) => {
      let b = 1;
      let a: number = stdio.vasprintf(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FREAD_CHK_0100
     * @tc.name       : testMuslStdioFreadChk001
     * @tc.desc       : test fread_chk
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioFreadChk001', 0, async (done: Function) => {
      let a: number = stdio.fread_chk();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_ASPRINTF_0100
     * @tc.name       : testMuslStdioAsprintf001
     * @tc.desc       : test Asprintf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioAsprintf001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.asprintf();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_GETDELIM_0100
     * @tc.name       : testMuslStdioGetdelim001
     * @tc.desc       : test getdelim
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioGetdelim001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.getdelim();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_GETCHAR_0100
     * @tc.name       : testMuslStdioGetchar001
     * @tc.desc       : test getchar
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioGetchar001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.getchar();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_GETCHARUNLOCKED_0100
     * @tc.name       : testMuslStdioGetcharUnlocked001
     * @tc.desc       : test getcharUnlocked
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioGetcharUnlocked001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.getcharUnlocked();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_GETC_0100
     * @tc.name       : testMuslStdioGetc001
     * @tc.desc       : test getc
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioGetc001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.getc();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_GETCUNLOCKED_0100
     * @tc.name       : testMuslStdioGetcUnlocked001
     * @tc.desc       : test getcUnlocked
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioGetcUnlocked001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.getcUnlocked();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FWRITE_0100
     * @tc.name       : testMuslStdioFwrite001
     * @tc.desc       : test fwrite
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFwrite001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.fwrite();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FWRITE_UNLOCKED_0100
     * @tc.name       : testMuslStdioFwriteUnlocked001
     * @tc.desc       : test fwrite_unlocked
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFwriteUnlocked001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.fwriteUnlocked();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FOPEN_0100
     * @tc.name       : testMuslStdioFopen001
     * @tc.desc       : test fopen
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFopen001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.fopen();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FOPEN64_0100
     * @tc.name       : testMuslStdioFopen64001
     * @tc.desc       : test fopen64
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFopen64001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.fopen64();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FPRINTF_0100
     * @tc.name       : testMuslStdioFprintf001
     * @tc.desc       : test fprintf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFprintf001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.fprintf();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FPUTC_0100
     * @tc.name       : testMuslStdioFputc001
     * @tc.desc       : test fputc
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFputc001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.fputc();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FPUTC_UNLOCKED_0100
     * @tc.name       : testMuslStdioFputcUnlocked001
     * @tc.desc       : test fputc_Unlocked
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFputcUnlocked001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.fputcUnlocked();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FPUTS_0100
     * @tc.name       : testMuslStdioFputs001
     * @tc.desc       : test fputs
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFputs001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.fputs();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FPUTS_UNLOCKED_0100
     * @tc.name       : testMuslStdioFputsUnlocked001
     * @tc.desc       : test fputs_unlocked
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFputsUnlocked001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.fputsUnlocked();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FREAD_0100
     * @tc.name       : testMuslStdioFread001
     * @tc.desc       : test fread
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFread001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.fread();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FREAD_UNLOCKED_0100
     * @tc.name       : testMuslStdioFreadUnlocked001
     * @tc.desc       : test fread_unlocked
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFreadUnlocked001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.freadUnlocked();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_CLEARERR_0100
     * @tc.name       : testMuslStdioClearerr001
     * @tc.desc       : test clearErr
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioClearerr001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.clearErr();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_CLEARERR_UNLOCKED_0100
     * @tc.name       : testMuslStdioClearerrUnlocked001
     * @tc.desc       : test clearerr_unlocked
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioClearerrUnlocked001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.clearerrUnlocked();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FREOPEN_0100
     * @tc.name       : testMuslStdioFreopen001
     * @tc.desc       : test freopen
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFreopen001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.freopen();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FREOPEN64_0100
     * @tc.name       : testMuslStdioFreopen64001
     * @tc.desc       : test freopen64
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFreopen64001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.freopen64();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FSCANF_0100
     * @tc.name       : testMuslStdioFscanf001
     * @tc.desc       : test fscanf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFscanf001', 0, async (done: Function) => {
      let resultTrue = 1;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;

      let file = fs.openSync(filesDir + '/Fzl.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let writeLen = fs.writeSync(file.fd, "1.11");
      console.info(" The length of str is: " + writeLen);
      let data = stdio.fscanf();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FSEEK_0100
     * @tc.name       : testMuslStdioFseek001
     * @tc.desc       : test fseek
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFseek001', 0, async (done: Function) => {
      let resultTrue = 0;
      let data: number = stdio.fseek();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FSEEKO_0100
     * @tc.name       : testMuslStdioFseeko001
     * @tc.desc       : test fseeko
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFseeko001', 0, async (done: Function) => {
      let resultTrue = 0;
      let data: number = stdio.fseeko();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FSEEKO64_0100
     * @tc.name       : testMuslStdioFseeko64001
     * @tc.desc       : test fseeko64
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFseeko64001', 0, async (done: Function) => {
      let resultTrue = 0;
      let data: number = stdio.fseeko64();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FSETPOS_0100
     * @tc.name       : testMuslStdioFsetpos001
     * @tc.desc       : test fsetpos
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFsetpos001', 0, async (done: Function) => {
      let resultTrue = 0;
      let data: number = stdio.fsetpos();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FSETPOS64_0100
     * @tc.name       : testMuslStdioFsetpos64001
     * @tc.desc       : test fsetpos64
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFsetpos64001', 0, async (done: Function) => {
      let resultTrue = 0;
      let data: number = stdio.fsetpos64();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FTELL_0100
     * @tc.name       : testMuslStdioFtell001
     * @tc.desc       : test ftell
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFtell001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.ftell();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FTELLO_0100
     * @tc.name       : testMuslStdioFtello001
     * @tc.desc       : test ftello
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFtello001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.ftello();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FTELLO64_0100
     * @tc.name       : testMuslStdioFtello64001
     * @tc.desc       : test ftello64
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFtello64001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.ftello64();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FTRYLOCKFILE_0100
     * @tc.name       : testMuslStdioFtrylockfile001
     * @tc.desc       : test ftrylockfile
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFtrylockfile001', 0, async (done: Function) => {
      let resultTrue = 0;
      let data: number = stdio.ftrylockfile();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FUNLOCKFILE_0100
     * @tc.name       : testMuslStdioFunlockfile001
     * @tc.desc       : test funlockfile
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFunlockfile001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.funlockfile();
      expect(data).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FPURGE_0100
     * @tc.name       : testMuslStdioFpurge001
     * @tc.desc       : test fpurge
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioFpurge001', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/fpurge.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let resultTrue = 0;
      let data = stdio.fpurge(filesDir + '/fpurge.txt');
      expect(data).assertEqual(resultTrue);
      fs.closeSync(file);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_VFSCANF_0100
     * @tc.name       : testMuslStdioVfscanf001
     * @tc.desc       : test vfscanf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioVfscanf001', 0, async (done: Function) => {
      let resultTrue = 1;
      let data: number = stdio.vfscanf();
      expect(data).assertEqual(resultTrue);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_VSNPRINTF_CHK_0100
     * @tc.name       : testMuslStdioVsnprintfChk001
     * @tc.desc       : test vsnprintf_chk
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioVsnprintfChk001', 0, async (done: Function) => {
      let a: number = stdio.vsnprintf_chk();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FGETSCHK_0100
     * @tc.name       : testMuslStdioFgetsChk001
     * @tc.desc       : test fgetsChk
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioFgetsChk001', 0, async (done: Function) => {
      let c: string = stdio.fgetsChk();
      let d = "hello world!"
      expect(c).assertEqual(d);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_PWRITE_CHK_0100
     * @tc.name       : testMuslStdioPwriteChk001
     * @tc.desc       : test __pwrite_chk
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioPwriteChk001', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;

      let file = fs.openSync(filesDir + '/PwriteChk.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let a = "this is __pwrite_chk test.";
      let c: number = stdio.pwriteChk(filesDir + '/PwriteChk.txt', a);
      expect(c).assertEqual(1);
      fs.closeSync(file);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_WRITE_CHK_0100
     * @tc.name       : testMuslStdioWriteChk001
     * @tc.desc       : test __write_chk
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStdioWriteChk001', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;

      let file = fs.openSync(filesDir + '/WriteChk.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let a = "this is __write_chk test.";
      let c: number = stdio.writeChk(filesDir + '/WriteChk.txt', a);
      expect(c).assertEqual(1);
      fs.closeSync(file);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_READLINKAT_CHK_0100
     * @tc.name       : testMuslStdioReadlinkatChk001
     * @tc.desc       : test __readlinkat_chk
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioReadlinkatChk001', 0, async (done: Function) => {
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      let filesDir = context.filesDir;
      let file = fs.openSync(filesDir + '/readlinkatChk.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);

      let c: number = stdio.readlinkatChk(filesDir);
      expect(c).assertEqual(1);
      fs.closeSync(file);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_SPRINTF_CHK_0100
     * @tc.name       : testMuslStdioSprintfChk001
     * @tc.desc       : test __sprintf_chk
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioSprintfChk001', 0, async (done: Function) => {
      let a = 1;
      let data: number = stdio.sprintfChk(a);
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_SNPRINTF_CHK_0100
     * @tc.name       : testMuslStdioSnprintfChk001
     * @tc.desc       : test __snprintf_chk
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioSnprintfChk001', 0, async (done: Function) => {
      let a = 1;
      let data: number = stdio.snprintfChk(a);
      expect(data).assertEqual(1);
      done()
    });
  })
}