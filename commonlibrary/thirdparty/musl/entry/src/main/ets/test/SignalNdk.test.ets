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
import signal from 'libsignalndk.so'

export default function signalNdkTest() {

  describe('MuslSignalTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGHOLD_0100
     * @tc.name       : testMuslSignalSighold001
     * @tc.desc       : test sighold
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSighold001', 0, async (done: Function) => {
      let a = signal.sighold(0,0);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGHOLD_0200
     * @tc.name       : testMuslSignalSighold002
     * @tc.desc       : test sighold
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSighold002', 0, async (done: Function) => {
      let a = signal.sighold(-1, 99999);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGHOLD_0300
     * @tc.name       : testMuslSignalSighold003
     * @tc.desc       : test sighold
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSighold003', 0, async (done: Function) => {
      let a = signal.sighold(-1, 0);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGRELSE_0100
     * @tc.name       : testMuslSignalSigrelse001
     * @tc.desc       : test sigrelse
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigrelse001', 0, async (done: Function) => {
      let a = signal.sigrelse(0,0);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGRELSE_0200
     * @tc.name       : testMuslSignalSigrelse002
     * @tc.desc       : test sigrelse
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigrelse002', 0, async (done: Function) => {
      let a = signal.sigrelse(-1, 99999);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGRELSE_0300
     * @tc.name       : testMuslSignalSigrelse003
     * @tc.desc       : test sigrelse
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigrelse003', 0, async (done: Function) => {
      let a = signal.sigrelse(-1, 0);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGDELSET_0100
     * @tc.name       : testMuslSignalSigdelset001
     * @tc.desc       : test sigdelset
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigdelset001', 0, async (done: Function) => {
      let a = signal.sigdelset(0,0);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGDELSET_0200
     * @tc.name       : testMuslSignalSigdelset002
     * @tc.desc       : test sigdelset
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigdelset002', 0, async (done: Function) => {
      let a = signal.sigdelset(-1, 99999);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGDELSET_0300
     * @tc.name       : testMuslSignalSigdelset003
     * @tc.desc       : test sigdelset
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigdelset003', 0, async (done: Function) => {
      let a = signal.sigdelset(-1, 0);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGEMPTYSET_0100
     * @tc.name       : testMuslSignalSigemptyset001
     * @tc.desc       : test sigemptyset
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigemptyset001', 0, async (done: Function) => {
      let a = signal.sigemptyset();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGFILLSET_0100
     * @tc.name       : testMuslSignalSigfillset001
     * @tc.desc       : test sigfillset
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigfillset001', 0, async (done: Function) => {
      let a = signal.sigfillset();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGADDSET_0100
     * @tc.name       : testMuslSignalSigaddset001
     * @tc.desc       : test sigaddset
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigaddset001', 0, async (done: Function) => {
      let a = signal.sigaddset(0,0);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SIGNAL_SIGADDSET_0200
     * @tc.name       : testMuslSignalSigaddset002
     * @tc.desc       : test sigaddset
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSignalSigaddset002', 0, async (done: Function) => {
      let a = signal.sigaddset(-1, 99999);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number SUB_THIRDPARTY_MUSL_SIGNAL_SIGADDSET_0300
     * @tc.name testMuslSignalSigaddset003
     * @tc.desc MuslSignalTest
     */
    it('testMuslSignalSigaddset003', 0, async (done: Function) => {
      let a = signal.sigaddset(-1, 0);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number SUB_THIRDPARTY_MUSL_SIGNAL_SIGACTION_0100
     * @tc.name testMuslSignalSigaction001
     * @tc.desc MuslSignalTest
     */
    it('testMuslSignalSigaction001', 0, async (done: Function) => {
      let a = signal.sigaction(0,0);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number SUB_THIRDPARTY_MUSL_SIGNAL_SIGACTION_0200
     * @tc.name testMuslSignalSigaction002
     * @tc.desc MuslSignalTest
     */
    it('testMuslSignalSigaction002', 0, async (done: Function) => {
      let a = signal.sigaction(-1, 99999);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number SUB_THIRDPARTY_MUSL_SIGNAL_SIGACTION_0300
     * @tc.name testMuslSignalSigaction003
     * @tc.desc MuslSignalTest
     */
    it('testMuslSignalSigaction003', 0, async (done: Function) => {
      let a = signal.sigaction(-1, 0);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number SUB_THIRDPARTY_MUSL_SIGNAL_SIGALTSTACK_0100
     * @tc.name testMuslSignalSigaltstack001
     * @tc.desc MuslSignalTest
     */
    it('testMuslSignalSigaltstack001', 0, async (done: Function) => {
      let a = signal.sigaltstack(0);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number SUB_THIRDPARTY_MUSL_SIGNAL_SIGALTSTACK_0200
     * @tc.name testMuslSignalSigaltstack002
     * @tc.desc MuslSignalTest
     */
    it('testMuslSignalSigaltstack002', 0, async (done: Function) => {
      let a = signal.sigaltstack(-1);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number SUB_THIRDPARTY_MUSL_SIGNAL_SIGIGNORE_0100
     * @tc.name testMuslSignalSigignore001
     * @tc.desc MuslSignalTest
     */
    it("testMuslSignalSigignore001", 0, async (done: Function) => {
      let a = signal.sigignore(0,0);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number SUB_THIRDPARTY_MUSL_SIGNAL_SIGIGNORE_0200
     * @tc.name testMuslSignalSigignore002
     * @tc.desc MuslSignalTest
     */
    it('testMuslSignalSigignore002', 0, async (done: Function) => {
      let a = signal.sigignore(-1, 99999);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number SUB_THIRDPARTY_MUSL_SIGNAL_SIGIGNORE_0300
     * @tc.name testMuslSignalSigignore003
     * @tc.desc MuslSignalTest
     */
    it('testMuslSignalSigignore003', 0, async (done: Function) => {
      let a = signal.sigignore(-1, 0);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number SUB_THIRDPARTY_MUSL_SIGNAL_SIGPAUSE_0100
     * @tc.name testMuslSignalSigpause001
     * @tc.desc MuslSignalTest
     */
    it('testMuslSignalSigpause001', 0, async (done: Function) => {
      let a = signal.sigpause();
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number SUB_THIRDPARTY_MUSL_SIGNAL_SIGPENDING_0100
     * @tc.name testMuslSignalSigpending001
     * @tc.desc MuslSignalTest
     */
    it('testMuslSignalSigpending001', 0, async (done: Function) => {
      let a = signal.sigpending();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number SUB_THIRDPARTY_MUSL_SIGNAL_SIGPROCMASK_0100
     * @tc.name testMuslSignalSigprocmask001
     * @tc.desc MuslSignalTest
     */
    it('testMuslSignalSigprocmask001', 0, async (done: Function) => {
      let a = signal.sigprocmask(0,0);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number SUB_THIRDPARTY_MUSL_SIGNAL_SIGPROCMASK_0200
     * @tc.name testMuslSignalSigprocmask002
     * @tc.desc MuslSignalTest
     */
    it('testMuslSignalSigprocmask002', 0, async (done: Function) => {
      let a = signal.sigprocmask(-1, 99999);
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number SUB_THIRDPARTY_MUSL_SIGNAL_SIGPROCMASK_0300
     * @tc.name testMuslSignalSigprocmask003
     * @tc.desc MuslSignalTest
     */
    it('testMuslSignalSigprocmask003', 0, async (done: Function) => {
      let a = signal.sigprocmask(-1, -1);
      expect(a).assertEqual(-1);
      done()
    });
  })
}