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
import window from '@ohos.window'
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
                this.log(`MultimodalInput_Pointer_test::SetPointerVisibleTest_001 success`);
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

    it('MultimodalInput_Pointer_test::SetPointerStyle_001', 0, function () {
        console.info(`SetPointerStyle_001 enter`);
        window.getTopWindow((err, data) => {
            if (err) {
                this.log(`SetPointerStyle_001 failed, err=${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            var windowClass = data;
            windowClass.getProperties((err, data) => {
                if (err) {
                    this.log(`SetPointerStyle_001 failed, err=${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                }
                var windowId = data.id;
                pointer.setPointerStyle(windowId, 4).then(() => {
                    expect(true).assertTrue();
                    this.log(`SetPointerStyle_001 success`);
                }).catch((err) => {
                    expect(false).assertTure();
                    console.info("promise::catch", err);
                });
            })
        })
    })

    it('MultimodalInput_Pointer_test::SetPointerStyle_002', 0, function () {
        console.info(`SetPointerStyle_002 enter`);
        window.getTopWindow((err, data) => {
            var windowClass = data;
            if (err) {
                this.log(`SetPointerStyle_002 failed, err=${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            windowClass.getProperties((err, data) => {
                if (err) {
                    this.log(`SetPointerStyle_002 failed, err=${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                }
                var windowId = data.id;
                pointer.setPointerStyle(windowId, 4, (err) => {
                    if (err) {
                        this.log(`SetPointerStyle_002 failed, err=${JSON.stringify(err)}`);
                        expect(false).assertTrue();
                    } else {
                        this.log(`SetPointerStyle_002 success`);
                        expect(true).assertTrue();
                    }
                });
            })
        })
    })

    it('MultimodalInput_Pointer_test::GetPointerStyle_001', 0, function () {
        console.info(`GetPointerStyle_001 enter`);
        window.getTopWindow((err, data) => {
            if (err) {
                this.log(`GetPointerStyle_001 failed, err=${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            var windowClass = data;
            windowClass.getProperties((err, data) => {
                if (err) {
                    this.log(`GetPointerStyle_001 failed, err=${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                }
                var windowId = data.id;
                pointer.getPointerStyle(windowId).then((data) => {
                    this.log(`GetPointerStyle_001 success, data=${JSON.stringify(data)}`);
                    expect(data).assertTrue('Number');
                }).catch((err) => {
                    console.info("promise::catch", err);
                    expect(false).assertTure();
                });
            })
        })
    })

    it('MultimodalInput_Pointer_test::GetPointerStyle_002', 0, function () {
        console.info(`GetPointerStyle_002 enter`);
        window.getTopWindow((err, data) => {
            if (err) {
                this.log(`GetPointerStyle_002 failed, err=${JSON.stringify(err)}`);
                expect(false).assertTrue();
            }
            var windowClass = data;
            windowClass.getProperties((err, data) => {
                if (err) {
                    this.log(`GetPointerStyle_002 failed, err=${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                }
                var windowId = data.id;
                pointer.getPointerStyle(windowId, (err, data) => {
                    if (err) {
                        this.log(`GetPointerStyle_002 failed, err=${JSON.stringify(err)}`);
                        expect(false).assertTrue();
                    } else {
                        this.log(`GetPointerStyle_002 success, data=${JSON.stringify(data)}`);
                        expect(data).assertTrue('Number');
                    }
                });
            })
        })
    })
})
