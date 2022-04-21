/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import pkg from '@system.package'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

const NUM_TWO = 2;
const ERR_CODE = 202;
const ERR_MERSSAGE = 'value is not an available number';

describe('ActsBmsHasInstalldTest', function () {

    /**
     * @tc.number hasInstalled_0100
     * @tc.name Package::hasInstalled
     * @tc.desc Test hasInstalled interface.
     */
    it('hasInstalled_0100', 0, async function (done) {
        pkg.hasInstalled({
            bundleName: 'com.ohos.launcher',
            success: function success(data) {
                console.info('hasInstalled success function in');
                expect(data.result).assertTrue();
                done();
            },
            fail: function fail(data, code) {
                console.info('hasInstalled fail function in');
                expect().assertFail();
                done();
            },
            complete: function complete() {
                console.info('hasInstalled complete function in');
                expect().assertFail();
                done();
            }
        });
    });

    /**
     * @tc.number hasInstalled_0200
     * @tc.name Package::hasInstalled
     * @tc.desc Test hasInstalled interface.
     */
    it('hasInstalled_0200', 0, async function (done) {
        pkg.hasInstalled({
            bundleName: 'wrongName',
            success: function success(data) {
                console.info('hasInstalled success function in');
                expect(data.result).assertFalse();
                done();
            },
            fail: function fail(data, code) {
                console.info('hasInstalled fail function in');
                expect().assertFail();
                done();
            },
            complete: function complete() {
                console.info('hasInstalled complete function in');
                expect().assertFail();
                done();
            }
        });
    });

    /**
     * @tc.number hasInstalled_0300
     * @tc.name Package::hasInstalled
     * @tc.desc Test hasInstalled interface.
     */
    it('hasInstalled_0300', 0, async function (done) {
        pkg.hasInstalled({
            bundleName: 'wrongName',
            success: function success(data) {
                console.info('hasInstalled success function in');
                expect(data.result).assertFalse();
                done();
            }
        });
    });

    /**
     * @tc.number hasInstalled_0400
     * @tc.name Package::hasInstalled
     * @tc.desc Test hasInstalled interface.
     */
    it('hasInstalled_0400', 0, async function (done) {
        let flag = 0;
        pkg.hasInstalled({
            bundleName: NUM_TWO,
            success: function success(data) {
                console.info('hasInstalled success function in');
                expect().assertFail();
                done();
            },
            fail: function fail(data, code) {
                flag += 2;
                console.info('hasInstalled fail function in');
                expect(data).assertEqual(ERR_MERSSAGE);
                expect(code).assertEqual(ERR_CODE);
            },
            complete: function complete() {
                flag += 3;
                console.info('hasInstalled complete function in');
                expect(flag).assertEqual(5)
                done();
            }
        });
    });
})