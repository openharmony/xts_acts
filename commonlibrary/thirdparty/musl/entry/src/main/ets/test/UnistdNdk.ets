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
import unistd from 'libunistdndk.so'

export default function muslUnistdNdkTest() {
  describe('MuslUnistdTest', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETGROUPS_0100
     * @tc.name       : testMuslUnistdGetGroups001
     * @tc.desc       : test getgroups
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetGroups001', 0, async (done: Function) => {
      let data = unistd.getGroups(0);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETGROUPS_0200
     * @tc.name       : testMuslUnistdGetGroups002
     * @tc.desc       : test getgroups
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetGroups002', 0, async (done: Function) => {
      let data = unistd.getGroups(10);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETGROUPS_0300
     * @tc.name       : testMuslUnistdGetGroups003
     * @tc.desc       : test getgroups
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetGroups003', 0, async (done: Function) => {
      let data = unistd.getGroups(5);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETPID_0100
     * @tc.name       : testMuslUnistdGetPid001
     * @tc.desc       : test getpid
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetPid001', 0, async (done: Function) => {
      let data = unistd.getPid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertLarger(-1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETPPID_0100
     * @tc.name       : testMuslUnistdGetPPid001
     * @tc.desc       : test getppid
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetPPid001', 0, async (done: Function) => {
      let data = unistd.getPPid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertLarger(-1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETPGRP_0100
     * @tc.name       : testMuslUnistdGetPGrp001
     * @tc.desc       : test getpgrp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetPGrp001', 0, async (done: Function) => {
      let data = unistd.getPGrp();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETPGID_0100
     * @tc.name       : testMuslUnistdGetPGid001
     * @tc.desc       : test getpgrd
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetPGid001', 0, async (done: Function) => {
      let data = unistd.getPGid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETSID_0100
     * @tc.name       : testMuslUnistdGetSid001
     * @tc.desc       : test getsid
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetSid001', 0, async (done: Function) => {
      let data = unistd.getSid(0);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETUID_0100
     * @tc.name       : testMuslUnistdGetSid001
     * @tc.desc       : test getuid
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetUid001', 0, async (done: Function) => {
      let data = unistd.getUid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETOPT_0100
     * @tc.name       : testMuslUnistdGetOpt001
     * @tc.desc       : test getopt
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetOpt001', 0,
      async (done: Function) => {
        let data = unistd.getOpt("-a");
        console.info("Test NAPI data= " + JSON.stringify(data));
        expect(data).assertEqual(97);
        done()
      });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETOPT_0200
     * @tc.name       : testMuslUnistdGetOpt002
     * @tc.desc       : test getopt
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetOpt002', 0, async (done: Function) => {
      let data = unistd.getOpt("-b");
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(98);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETOPT_0300
     * @tc.name       : testMuslUnistdGetOpt003
     * @tc.desc       : test getopt
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetOpt003', 0, async (done: Function) => {
      let data = unistd.getOpt("-c");
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(99);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETTID_0100
     * @tc.name       : testMuslUnistdGetTid001
     * @tc.desc       : test gettid
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetTid001', 0, async (done: Function) => {
      let data = unistd.getTid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertLarger(-1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETEUID_0100
     * @tc.name       : testMuslUnistdGetEUid001
     * @tc.desc       : test geteuid
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetEUid001', 0, async (done: Function) => {
      let data = unistd.getEUid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertLarger(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETGID_0100
     * @tc.name       : testMuslUnistdGetGid001
     * @tc.desc       : test geteuid
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetGid001', 0, async (done: Function) => {
      let data = unistd.getGid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertLarger(-1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETEGID_0100
     * @tc.name       : testMuslUnistdGetEGid001
     * @tc.desc       : test getegid
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetEGid001', 0, async (done: Function) => {
      let data = unistd.getEGid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertLarger(-1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETHOSTNAME_0100
     * @tc.name       : testMuslUnistdGetHostName001
     * @tc.desc       : test gethostname
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetHostName001', 0, async (done: Function) => {
      let data = unistd.getHostName();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETPAGESIZE_0100
     * @tc.name       : testMuslUnistdGetPageSize001
     * @tc.desc       : test getpagesize
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetPageSize001', 0, async (done: Function) => {
      let data = unistd.getPageSize();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertLarger(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETDTABLESIZE_0100
     * @tc.name       : testMuslUnistdGetDTableSize001
     * @tc.desc       : test getdtablesize
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetDTableSize001', 0, async (done: Function) => {
      let data = unistd.getDTableSize();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertLarger(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETRESUID_0100
     * @tc.name       : testMuslUnistdGtReSuid001
     * @tc.desc       : test getresuid
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGtReSuid001', 0, async (done: Function) => {
      let data = unistd.getReSuid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETRESGID_0100
     * @tc.name       : testMuslUnistdGetResGid001
     * @tc.desc       : test getresgid
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetResGid001', 0, async (done: Function) => {
      let data = unistd.getResGid();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_SLEEP_0100
     * @tc.name       : testMuslUnistdSleep001
     * @tc.desc       : test sleep
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdSleep001', 0, async (done: Function) => {
      let b = 1;
      let c = 0
      let a = unistd.sleep(b);
      let d = (a >= c);
      expect(d).assertTrue();
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_SLEEP_0200
     * @tc.name       : testMuslUnistdSleep002
     * @tc.desc       : test sleep
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdSleep002', 0, async (done: Function) => {
      let b = 2;
      let c = 0
      let a = unistd.sleep(b);
      expect(c).assertEqual(a);
      done()
    });
  })
}
