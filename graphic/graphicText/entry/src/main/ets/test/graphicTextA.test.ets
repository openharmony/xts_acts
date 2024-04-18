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
import { describe, beforeAll, it, expect } from "@ohos/hypium";
import { BusinessError } from '@ohos.base';
import drawing from '@ohos.graphics.text'

export default function graphicTextATest() {

  describe('graphicTextA_test', () => {
    beforeAll(() => {
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_0100
     * @tc.name      : testTextAlign
     * @tc.desc      : Test the enum value of testTextAlign
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */ 
    it("testTextAlign", 0, async function(done){
      let msgStr = "testTextAlign ";
      console.log(msgStr + " begin");
      expect(drawing.TextAlign.LEFT).assertEqual(0)
      expect(drawing.TextAlign.RIGHT).assertEqual(1)
      expect(drawing.TextAlign.CENTER).assertEqual(2)
      expect(drawing.TextAlign.JUSTIFY).assertEqual(3)
      expect(drawing.TextAlign.START).assertEqual(4)
      expect(drawing.TextAlign.END).assertEqual(5)
      done()
    })   
  })
}
