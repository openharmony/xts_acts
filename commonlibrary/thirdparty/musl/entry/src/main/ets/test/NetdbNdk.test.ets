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
import netDb from 'libnetdbndk.so'


export default function muslNetdbNdkTest() {
  describe('MuslNetdbTest', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETPROTOENT_0100
     * @tc.name       : testMuslNetDbGetProtoEnt001
     * @tc.desc       : test getprotoent
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNetDbGetProtoEnt001', 0, async (done: Function) => {
      let data = netDb.getProtoEnt();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETPROTOBYNAME_0100
     * @tc.name       : testMuslNetDbGetProtoByName001
     * @tc.desc       : test getprotobyname
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNetDbGetProtoByName001', 0, async (done: Function) => {
      let data = netDb.getProtoByName("tcp");
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual("tcp");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETPROTOBYNAME_0200
     * @tc.name       : testMuslNetDbGetProtoByName002
     * @tc.desc       : test getprotobynumber
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNetDbGetProtoByName002', 0, async (done: Function) => {
      let data = netDb.getProtoByName("ipv6");
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual("ipv6");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETPROTOBYNAME_0300
     * @tc.name       : testMuslNetDbGetProtoByName003
     * @tc.desc       : test getprotobyname
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNetDbGetProtoByName003', 0, async (done: Function) => {
      let data = netDb.getProtoByName("esp");
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual("esp");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETPROTOBYNUMBER_0100
     * @tc.name       : testMuslNetDbGetProtoByNumber001
     * @tc.desc       : test getprotobynumber
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNetDbGetProtoByNumber001', 0, async (done: Function) => {
      let data = netDb.getProtoByNumber(6);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual("tcp");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETPROTOBYNUMBER_0200
     * @tc.name       : testMuslNetDbGetProtoByNumber002
     * @tc.desc       : test getprotobynumber
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNetDbGetProtoByNumber002', 0, async (done: Function) => {
      let data = netDb.getProtoByNumber(17);
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual("udp");
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETSERVBYNAME_0100
     * @tc.name       : testMuslNetDbGetServByName001
     * @tc.desc       : test getservbyname
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNetDbGetServByName001', 0, async (done: Function) => {
      let data = netDb.getServByName();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETSERVBYPORT_0100
     * @tc.name       : testMuslNetDbGetServByPort001
     * @tc.desc       : test getservbyport
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNetDbGetServByPort001', 0, async (done: Function) => {
      let data = netDb.getServByPort();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_NETDB_GETHOSTBYADDR_0100
     * @tc.name       : testMuslNetDbGetHostByAddrR001
     * @tc.desc       : test gethostbyaddr_r
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslNetDbGetHostByAddrR001', 0, async (done: Function) => {
      let data = netDb.getHostByAddrR();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
  })
}
