/**
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
 
import { describe, it, expect } from '@ohos/hypium';
import { varibleWithinHsp } from 'Sharelibraryhsp/src/main/ets/pages/Index';
import { varibleWithinHarPath} from 'Staticlibraryhar/src/main/ets/components/mainpage/MainPage';
import { variableImportOhpm, variableImportRemoteHar, varibleWithinHap } from '../../../main/ets/pages/Index';

export default function variableImport() {
  describe('ActVariableImport', () => {

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_variableImport_0001
     * @tc.name      : variableHspName
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('variableHspName', 0, async () => {
      let packageName = 'Sharelibraryhsp'
      let lib: ESObject= await import(packageName)
      expect(lib.add(2,3)).assertEqual(5)
      console.info("-------------variableHspName-------------")
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_variableImport_0002
     * @tc.name      : variableHarName
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('variableHarName', 0, async () => {
      let packageName = 'Staticlibraryhar'
      let lib: ESObject= await import(packageName)
      expect(lib.add(2,3)).assertEqual(5)
      console.info("-------------variableHarName-------------")
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_variableImport_0003
     * @tc.name      : variableImportRemoteHar
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('variableImportRemoteHar', 0, async () => {
      let res = await variableImportRemoteHar()
      expect(res).assertTrue()
      console.info("-------------variableImportRemoteHar-------------")
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_variableImport_0004
     * @tc.name      : variableImportOhpm
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('variableImportOhpm', 0, async () => {
      let res = await variableImportOhpm()
      expect(res).assertTrue()
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_variableImport_0005
     * @tc.name      : varibleWithinHspPath
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('varibleWithinHspPath', 0, async () => {
      let res = await varibleWithinHsp()
      expect(res).assertTrue()
      console.info("-------------varibleWithinHspPath-------------")
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_variableImport_0006
     * @tc.name      : varibleWithinHapPath
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('varibleWithinHapPath', 0, async () => {
      let res = await varibleWithinHap()
      expect(res).assertTrue()
      console.info("-------------varibleWithinHapPath-------------")
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_variableImport_0007
     * @tc.name      : varibleWithinHarPath
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('varibleWithinHarPath', 0, async () => {
      let res = await varibleWithinHarPath()
      expect(res).assertTrue()
      console.info("-------------varibleWithinHarPath-------------")
    })
  })
}