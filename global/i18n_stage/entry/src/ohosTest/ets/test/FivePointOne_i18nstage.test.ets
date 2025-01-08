/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import Ability from '@ohos.app.ability.UIAbility';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import intl from '@kit.LocalizationKit';

export default function FivePointOne_i18nStageTest() {
  describe("FivePointOne_i18nStageTest", () => {
    console.log('*************start FivePointOne_i18nStageTest*************');

    beforeAll(async () => {
      console.info("beforeAll case");
    });
    beforeEach(() => {
      console.info("beforeEach case");
    });
    afterEach(async () => {
      console.info("afterEach case");
    });
    afterAll(() => {
      console.info("afterAll case");
    });

    /**
     * @tc.number   : SUB_GLOBAL_refinedFormat_0160
     * @tc.name     : SUB_GLOBAL_refinedFormat_0160
     * @tc.desc     : begin code same as stop code
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_refinedFormat_0160', 0, () => {
      let numFormat: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN");
      let formattedRange: string = numFormat.formatRange(0, 0);
      expect(formattedRange == "~0").assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_refinedFormat_0170
     * @tc.name     : SUB_GLOBAL_refinedFormat_0170
     * @tc.desc     : normally (begin code & stop code)
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_refinedFormat_0170', 0, () => {
      let numFormat: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN");
      let formattedRange: string = numFormat.formatRange(0, 9);
      expect(formattedRange == "0-9").assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_refinedFormat_0180
     * @tc.name     : SUB_GLOBAL_refinedFormat_0180
     * @tc.desc     : begin code with negative ,stop code with decimal
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_refinedFormat_0180', 0, () => {
      let numFormat: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN");
      let formattedRange: string = numFormat.formatRange(-9, 9.9);
      expect(formattedRange == "-9 - 9.9").assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_refinedFormat_0190
     * @tc.name     : SUB_GLOBAL_refinedFormat_0190
     * @tc.desc     : begin code large than stop code
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_refinedFormat_0190', 0, () => {
      let numFormat: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN");
      let formattedRange: string = numFormat.formatRange(9, 0);
      expect(formattedRange == "").assertTrue();
    })
    console.log('*************end FivePointOne_i18nStageTest*************');
  })
}