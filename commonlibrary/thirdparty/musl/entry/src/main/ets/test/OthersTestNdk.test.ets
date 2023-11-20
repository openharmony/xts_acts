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

import { describe, it, expect } from "@ohos/hypium"
import otherstestndk from 'libotherstestndk.so'

export default function otherstestNdkTest() {
  describe('OthersTestNdkTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DLFCN_DLOPEN_0100
     * @tc.name       : testMuslDlFcnDlOpen001
     * @tc.desc       : test dlopen
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslDlFcnDlOpen001', 0, async (done: Function) => {
      expect(otherstestndk.dlopen()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DLFCN_DLCLOSE_0100
     * @tc.name       : testMuslDlFcnDlClose001
     * @tc.desc       : test dlclose
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslDlFcnDlClose001', 0, async (done: Function) => {
      expect(otherstestndk.dlclose()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DLFCN_DLERROR_0100
     * @tc.name       : testMuslDlFcnDlError001
     * @tc.desc       : test dlerror
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslDlFcnDlError001', 0, async (done: Function) => {
      expect(otherstestndk.dlerror()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_DLFCN_DLADDR_0100
     * @tc.name       : testMuslDlFcnDlAddr001
     * @tc.desc       : test dladdr
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslDlFcnDlAddr001', 0, async (done: Function) => {
      expect(otherstestndk.dladdr()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOLV_DN_COMP_0100
     * @tc.name       : testMuslReSoLvDnComp001
     * @tc.desc       : test dn_comp
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslReSoLvDnComp001', 0, async (done: Function) => {
      expect(otherstestndk.dn_comp()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_RESOLV_DN_SKIPNAME_0100
     * @tc.name       : testMuslReSoLvDnSkipName001
     * @tc.desc       : test dn_skipname
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslReSoLvDnSkipName001', 0, async (done: Function) => {
      expect(otherstestndk.dn_skipname()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_DREM_0100
     * @tc.name       : testMuslMathDRem001
     * @tc.desc       : test drem
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathDRem001', 0, async (done: Function) => {
      let firstParam = 1;
      let secondParam = 3.651;
      expect(otherstestndk.drem(firstParam, secondParam)).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_DREMF_0100
     * @tc.name       : testMuslMathDRemF001
     * @tc.desc       : test dremf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathDRemF001', 0, async (done: Function) => {
      let firstParam = 1;
      let secondParam = 3.651;
      expect(otherstestndk.dremf(firstParam, secondParam)).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FINITE_0100
     * @tc.name       : testMuslMathFinite001
     * @tc.desc       : test finite
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFinite001', 0, async (done: Function) => {
      let firstParam = 1.78941;
      expect(otherstestndk.finite(firstParam)).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MATH_FINITEF_0100
     * @tc.name       : testMuslMathFiniteF001
     * @tc.desc       : test finitef
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMathFiniteF001', 0, async (done: Function) => {
      let firstParam = 1.78941;
      expect(otherstestndk.finitef(firstParam)).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MNTENT_ENDMNTENT_0100
     * @tc.name       : testMuslMnTentEndMntEnt001
     * @tc.desc       : test endmntent
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMnTentEndMntEnt001', 0, async (done: Function) => {
      expect(otherstestndk.endmntent()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SCHED_CLONE_0100
     * @tc.name       : testMuslSchEdClone001
     * @tc.desc       : test clone
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSchEdClone001', 0, async (done: Function) => {
      expect(otherstestndk.clone()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_LIBGEN_DIRNAME_0100
     * @tc.name       : testMuslLibGenDirName001
     * @tc.desc       : test dirname
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslLibGenDirName001', 0, async (done: Function) => {
      expect(otherstestndk.dirname()).assertEqual("/data/storage/el2/base/files");
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SYSLOG_CLOSELOG_0100
     * @tc.name       : testMuslSyslogCloseLog001
     * @tc.desc       : test closelog
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSyslogCloseLog001', 0, async (done: Function) => {
      expect(otherstestndk.closelog()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UTMP_ENDUTENT_0100
     * @tc.name       : testMuslUTmpEndUTent001
     * @tc.desc       : test endutent
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUTmpEndUTent001', 0, async (done: Function) => {
      expect(otherstestndk.endutent()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_EPOLL_EPOLL_CREATE_0100
     * @tc.name       : testMuslEpollEpollCreate001
     * @tc.desc       : test epoll_create
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslEpollEpollCreate001', 0, async (done: Function) => {
      let result = false;
      if (otherstestndk.epoll_create() >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_EPOLL_EPOLL_CREATE1_0100
     * @tc.name       : testMuslEpollEpollCreate1001
     * @tc.desc       : test epoll_create1
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslEpollEpollCreate1001', 0, async (done: Function) => {
      let result = false;
      if (otherstestndk.epoll_create1() >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_EPOLL_EPOLL_CTL_0100
     * @tc.name       : testMuslEpollEpollCtl001
     * @tc.desc       : test epoll_ctl
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslEpollEpollCtl001', 0, async (done: Function) => {
      expect(otherstestndk.epoll_ctl()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_EPOLL_EPOLL_PWAIT_0100
     * @tc.name       : testMuslEpollEpollPWait001
     * @tc.desc       : test epoll_pwait
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslEpollEpollPWait001', 0, async (done: Function) => {
      expect(otherstestndk.epoll_pwait()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_EPOLL_EPOLL_WAIT_0100
     * @tc.name       : testMuslEpollEpollWait001
     * @tc.desc       : test epoll_wait
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslEpollEpollWait001', 0, async (done: Function) => {
      expect(otherstestndk.epoll_wait()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_ETHER_ETHER_ATON_0100
     * @tc.name       : testMuslEtherEtherATon001
     * @tc.desc       : test ether_aton
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslEtherEtherATon001', 0, async (done: Function) => {
      expect(otherstestndk.ether_aton()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_ETHER_ETHER_ATON_R_0100
     * @tc.name       : testMuslEtherEtherATonR001
     * @tc.desc       : test ether_aton_r
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslEtherEtherATonR001', 0, async (done: Function) => {
      expect(otherstestndk.ether_aton_r()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_ETHER_ETHER_NTOA_0100
     * @tc.name       : testMuslEtherEtherNToa001
     * @tc.desc       : test ether_ntoa
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslEtherEtherNToa001', 0, async (done: Function) => {
      expect(otherstestndk.ether_ntoa()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_ETHER_ETHER_NTOA_R_0100
     * @tc.name       : testMuslEtherEtherNToaR001
     * @tc.desc       : test ether_ntoa_r
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslEtherEtherNToaR001', 0, async (done: Function) => {
      expect(otherstestndk.ether_ntoa_r()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_EVENT_EVENTFD_0100
     * @tc.name       : testMuslEventFdEventFd001
     * @tc.desc       : test eventfd
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslEventFdEventFd001', 0, async (done: Function) => {
      let result = false;
      if (otherstestndk.eventfd() >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_EVENT_EVENTFD_READ_0100
     * @tc.name       : testMuslEventFdEventFdRead001
     * @tc.desc       : test eventfd_read
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslEventFdEventFdRead001', 0, async (done: Function) => {
      expect(otherstestndk.eventfd_read()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_EVENT_EVENTFD_WRITE_0100
     * @tc.name       : testMuslEventFdEventFdWrite001
     * @tc.desc       : test eventfd_write
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslEventFdEventFdWrite001', 0, async (done: Function) => {
      expect(otherstestndk.eventfd_write()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_XATTR_FGETXATTR_0100
     * @tc.name       : testMuslXAttrFGetXAttr001
     * @tc.desc       : test fgetxattr
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslXAttrFGetXAttr001', 0, async (done: Function) => {
      expect(otherstestndk.fgetxattr()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FILE_FLOCK_0100
     * @tc.name       : testMuslFileFlock001
     * @tc.desc       : test flock
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFileFlock001', 0, async (done: Function) => {
      expect(otherstestndk.flock()).assertEqual(0);
      done()
    });

  })
}
