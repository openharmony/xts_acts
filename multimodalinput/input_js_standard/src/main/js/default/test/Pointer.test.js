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

import pointer from '@ohos.multimodalInput.pointer'
import {
    describe,
    beforeAll,
    beforeEach,
    afterEach,
    afterAll,
    it,
    expect
} from 'deccjsunit/index'

describe('MultimodalInput_Pointer_test', function () {

    it('MultimodalInput_Pointer_test::PointerVisibleTest_001', 0, function () {
        console.info(`MultimodalInput_Pointer_test::SetPointerVisibleTest_001 enter`);
        var callback = function (err, data) {
            if (err) {
                this.log(`MultimodalInput_Pointer_test::SetPointerVisibleTest_001 failed, err=${JSON.stringify(err)}`);
                expect(false).assertTrue();
            } else {
                this.log(`MultimodalInput_Pointer_test::SetPointerVisibleTest_001 success, data=${JSON.stringify(data)}`);
                expect(true).assertTure();
            }
        };
        pointer.setPointerVisible(false, callback);

        pointer.isPointerVisible().then(data => {
            this.log(`MultimodalInput_Pointer_test::PointerVisibleTest_001 success, data=${JSON.stringify(data)}`);
            expect(data == false).assertTrue();
        }, data => {
            this.log(`MultimodalInput_Pointer_test::PointerVisibleTest_001 failed, err=${JSON.stringify(data)}`);
            expect(false).assertTrue();
        });
        console.info(`MultimodalInput_Pointer_test::PointerVisibleTest_001 exit`);
    })

    it('MultimodalInput_Pointer_test::PointerVisibleTest_002', 0, function () {
        console.info(`MultimodalInput_Pointer_test::PointerVisibleTest_002 enter`);
        pointer.setPointerVisible(true).then(data => {
            this.log(`MultimodalInput_Pointer_test::PointerVisibleTest_002 success, data=${JSON.stringify(data)}`);
            expect(true).assertTrue();
        }, data => {
            this.log(`MultimodalInput_Pointer_test::PointerVisibleTest_002 failed, err=${JSON.stringify(data)}`);
            expect(false).assertTure();
        });

        var callback = function (err, data) {
            if (err) {
                this.log(`MultimodalInput_Pointer_test::PointerVisibleTest_002 failed, err=${JSON.stringify(err)}`);
                expect(false).assertTrue();
            } else {
                this.log(`MultimodalInput_Pointer_test::PointerVisibleTest_002 success, data=${JSON.stringify(data)}`);
                expect(data == true).assertTrue();
            }
        };
        pointer.isPointerVisible(callback);
        console.info(`MultimodalInput_Pointer_test::PointerVisibleTest_002 exit`);
    })

})
