/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect } from '@ohos/hypium';
import { withinHspTest } from 'Sharelibraryhsp/src/main/ets/pages/Index';
import { withinHarTest } from 'Staticlibraryhar/src/main/ets/components/mainpage/MainPage';

export default function constDynamicImport() {
  describe('ActsAbilityTest', () => {

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ConstDynamicImport_0001
     * @tc.name      : importHspName
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('importHspName', 0, async () => {
      let lib = await import('Sharelibraryhsp')
      expect(lib.add(2, 3)).assertEqual(5)
    })

     /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ConstDynamicImport_0002
     * @tc.name      : importHspPath
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('importHspPath', 0, async () => {
      let lib = await import('Sharelibraryhsp/src/main/ets/utils/Calc')
      expect(lib.add(3, 4)).assertEqual(7)
    })
    
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ConstDynamicImport_0003
     * @tc.name      : importHarName
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('importHarName', 0, async () => {
      let lib = await import('Staticlibraryhar')
      expect(lib.add(2, 3)).assertEqual(5)
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ConstDynamicImport_0004
     * @tc.name      : importHarPath
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('importHarPath', 0, async () => {
       let lib = await import('Staticlibraryhar/src/main/ets/Calc')
       expect(lib.add(3, 5)).assertEqual(8)
     })

     /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ConstDynamicImport_0005
     * @tc.name      : importRemoteHar
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('importRemoteHar', 0, async () => {
      let lib = await import('@ohos/crypto-js')
      let md5Name: string = lib.CryptoJS.MD5("123456").toString()
      expect(md5Name).assertEqual('e10adc3949ba59abbe56e057f20f883e')
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ConstDynamicImport_0006
     * @tc.name      : importOhpm
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('importOhpm', 0, async () => {
      let lib = await import("@yunkss/eftool")
      let eftoolName: ESObject = lib.IdCardUtil.convert15To18("420106640901234").getDataRow()
      expect(eftoolName).assertEqual('420106194201062348')
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ConstDynamicImport_0007
     * @tc.name      : withinhapImportPath
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('withinhapImportPath', 0, async () => {
      let lib = await import('../../../main/ets/Calc')
      expect(lib.add(3, 5)).assertEqual(8)
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ConstDynamicImport_0008
     * @tc.name      : withinimportHspPath
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('withinimportHspPath', 0, async () => {
      let res = await withinHspTest()
      expect(res).assertTrue()
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ConstDynamicImport_0009
     * @tc.name      : withinimportHarPath
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('withinimportHarPath', 0, async () => {
      let res = await withinHarTest()
      expect(res).assertTrue()
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ConstDynamicImport_0010
     * @tc.name      : importRemoteHapDepHar
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('importRemoteHapDepHar', 0, async () => {
      let lib = await import('Staticlibraryhar')
      let md5Name: string = await lib.cryptoHapDepHar()
      expect(md5Name).assertEqual('e10adc3949ba59abbe56e057f20f883e')
    })
  })
}