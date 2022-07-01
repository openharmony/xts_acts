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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"
import defaultAppMgr from '@ohos.bundle.defaultAppManager'

export default function isDefaultApplicationTest() {
    describe('isDefaultApplicationTest', function() {
  
       /**
         * @tc.number: isDefaultApplication_0100
         * @tc.name: isDefaultApplication Promise
         * @tc.desc: No default image application is set. Query and return false
         */
          it('isDefaultApplication_0100', 0, async function (done) {
              const data = await defaultAppMgr.isDefaultApplication(defaultAppMgr.ApplicationType.IMAGE)
              console.info("isDefaultApplication_0100 --- " + data)
              expect(data).assertFalse()
              done()
          });

       /**
         * @tc.number: isDefaultApplication_0200
         * @tc.name: isDefaultApplication Promise
         * @tc.desc: The parameter type is correct, the string format is incorrect, return false
         */
        it('isDefaultApplication_0200', 0, async function (done) {
            const data = await defaultAppMgr.isDefaultApplication("image/")
            console.info("isDefaultApplication_0200 --- " + data)
            expect(data).assertFalse()
            done();
        });

       /**
         * @tc.number: isDefaultApplication_0300
         * @tc.name: isDefaultApplication Promise
         * @tc.desc: The parameter type is correct, the string format is incorrect, return false
         */
        it('isDefaultApplication_0300', 0, async function (done) {
            const data = await defaultAppMgr.isDefaultApplication("abc")
            console.info("isDefaultApplication_0300 --- " + data)
            expect(data).assertFalse()
            done()
        });
    })
  }