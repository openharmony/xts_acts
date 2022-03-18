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

import inputConsumer from '@ohos.multimodalInput.inputConsumer'
import {
    describe,
    beforeAll,
    beforeEach,
    afterEach,
    afterAll,
    it,
    expect
} from 'deccjsunit/index'

describe('MultimodalInputConsumer_test', function () {
    it('inputDevice::inputConsumer_test01', 0, async function () {
        function callback(error, data) {
            if (error) {
                console.log(`inputDevice::inputConsumer_test01 Error` + error);
                expect(false).assertTrue();
                done();
            } else {
                console.log(`inputDevice::inputConsumer_test01 Success` + data);
                expect(data).assertInstanceOf(inputConsumer.KeyOptions);
                done();
            }
        }
        console.log(`inputDevice::inputConsumer_test01 enter`);
        inputConsumer.on('key', { preKeys: [2072], finalKey: 2019, isFinalKeyDown: false, finalKeyDownDuration: 0 },
            callback);
        done();
        inputConsumer.off('key', { preKeys: [2072], finalKey: 2019, isFinalKeyDown: false, finalKeyDownDuration: 0, },
            callback);
        done();
    })
})
