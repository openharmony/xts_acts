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
import {describe, it, expect, Level, Size, TestType} from "@ohos/hypium"

export default function dynamicImport() {
  describe("DynamicImportTest", async () => {
    it('importHar', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let lib = await import('har')
      expect(lib.add(2, 3)).assertEqual(5)
    })
    it('importRelative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let lib = await import('./test')
      expect(lib.add(2, 3)).assertEqual(5)
      expect(lib.default).assertEqual('test')
    })
    it('importSystemInternal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let lib = await import('@ohos.hilog')
      lib.default.info(0x0000, "testTag", 'dexter log: call ohos.hilog')
    })
    it('importSystemBuiltin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let lib = await import('@system.app')
      lib.default.getInfo()
    })
    it('importAppNapi', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let lib = await import('libentry.so')
      expect(lib.default.add(2,3)).assertEqual(5)
    })
  })
}