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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import config from '@ohos.accessibility.config'

export default function abilityTest() {
    describe('AccessibilityConfigReqWritePermissionTest', function () {

        beforeEach(async function (done) {
            console.info(`AccessibilityConfigReqWritePermissionTest: beforeEach starts`);
            done();
        })
    
        afterEach(async function (done) {
            console.info(`AccessibilityConfigReqWritePermissionTest: afterEach starts`);
            setTimeout(done, 1000);
        })
    
        /*
         * @tc.number  AccessibilityConfigReqWritePermissionTest_get_asyncCallback_0300
         * @tc.name    AccessibilityConfigReqWritePermissionTest_get_asyncCallback_0300
         * @tc.desc    Test highContrastText.get() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqWritePermissionTest_get_asyncCallback_0300', 0, async function(done) {
            console.info('AccessibilityConfigReqWritePermissionTest_get_asyncCallback_0300');
            config.highContrastText.get((err, result) => {
                if (err.code != 0) {
                    expect(true).assertTrue();
                } else {
                    console.error(`AccessibilityConfigReqWritePermissionTest_get_asyncCallback_0300 has no read permission`);
                    expect(null).assertFail();
                }
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigReqWritePermissionTest_get_asyncPromise_0400
         * @tc.name    AccessibilityConfigReqWritePermissionTest_get_asyncPromise_0400
         * @tc.desc    Test highContrastText.get() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqWritePermissionTest_get_asyncPromise_0400', 0, async function(done) {
            console.info('AccessibilityConfigReqWritePermissionTest_get_asyncPromise_0400');
            config.highContrastText.get().then((result) => {
                console.error(`AccessibilityConfigReqWritePermissionTest_get_asyncPromise_0400 has no read permission`);
                expect(null).assertFail();
                done();
            }).catch((err) => {
                done();
            });
        })

        /*
         * @tc.number  AccessibilityConfigReqWritePermissionTest_get_asyncCallback_0900
         * @tc.name    AccessibilityConfigReqWritePermissionTest_get_asyncCallback_0900
         * @tc.desc    Test invertColor.get() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqWritePermissionTest_get_asyncCallback_0900', 0, async function(done) {
            console.info('AccessibilityConfigReqWritePermissionTest_get_asyncCallback_0900');
            config.invertColor.get((err, result) => {
                if (err.code != 0) {
                    expect(true).assertTrue();
                } else {
                    console.error(`AccessibilityConfigReqWritePermissionTest_get_asyncCallback_0900 has no read permission`);
                    expect(null).assertFail();
                }
            });
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigReqWritePermissionTest_get_asyncPromise_1000
         * @tc.name    AccessibilityConfigReqWritePermissionTest_get_asyncPromise_1000
         * @tc.desc    Test invertColor.get() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqWritePermissionTest_get_asyncPromise_1000', 0, async function(done) {
            console.info('AccessibilityConfigReqWritePermissionTest_get_asyncPromise_1000');
            config.invertColor.get().then((result) => {
                console.error(`AccessibilityConfigReqWritePermissionTest_get_asyncPromise_1000 has no read permission`);
                expect(null).assertFail();
                done();
            }).catch((err) => {
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigReqWritePermissionTest_get_asyncCallback_1500
         * @tc.name    AccessibilityConfigReqWritePermissionTest_get_asyncCallback_1500
         * @tc.desc    Test contentTimeout.get() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqWritePermissionTest_get_asyncCallback_1500', 0, async function(done) {
            console.info('AccessibilityConfigReqWritePermissionTest_get_asyncCallback_1500');
            config.contentTimeout.get((err, result) => {
                if (err.code != 0) {
                    expect(true).assertTrue();
                } else {
                    console.error(`AccessibilityConfigReqWritePermissionTest_get_asyncCallback_1500 has no read permission`);
                    expect(null).assertFail();
                }
            });
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigReqWritePermissionTest_get_asyncPromise_1600
         * @tc.name    AccessibilityConfigReqWritePermissionTest_get_asyncPromise_1600
         * @tc.desc    Test contentTimeout.get() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqWritePermissionTest_get_asyncPromise_1600', 0, async function(done) {
            console.info('AccessibilityConfigReqWritePermissionTest_get_asyncPromise_1600');
            config.contentTimeout.get().then((result) => {
                console.error(`AccessibilityConfigReqWritePermissionTest_get_asyncPromise_1600 has no read permission`);
                expect(null).assertFail();
                done();
            }).catch((err) => {
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigReqWritePermissionTest_get_asyncCallback_2100
         * @tc.name    AccessibilityConfigReqWritePermissionTest_get_asyncCallback_2100
         * @tc.desc    Test animationOff.get() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqWritePermissionTest_get_asyncCallback_2100', 0, async function(done) {
            console.info('AccessibilityConfigReqWritePermissionTest_get_asyncCallback_2100');
            config.animationOff.get((err, result) => {
                if (err.code != 0) {
                    expect(true).assertTrue();
                } else {
                    console.error(`AccessibilityConfigReqWritePermissionTest_get_asyncCallback_2100 has no read permission`);
                    expect(null).assertFail();
                }
            });
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigReqWritePermissionTest_get_asyncPromise_2200
         * @tc.name    AccessibilityConfigReqWritePermissionTest_get_asyncPromise_2200
         * @tc.desc    Test animationOff.get() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqWritePermissionTest_get_asyncPromise_2200', 0, async function(done) {
            console.info('AccessibilityConfigReqWritePermissionTest_get_asyncPromise_2200');
            config.animationOff.get().then((result) => {
                console.error(`AccessibilityConfigReqWritePermissionTest_get_asyncPromise_2200 has no read permission`);
                expect(null).assertFail();
                done();
            }).catch((err) => {
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigReqWritePermissionTest_get_asyncCallback_2700
         * @tc.name    AccessibilityConfigReqWritePermissionTest_get_asyncCallback_2700
         * @tc.desc    Test brightnessDiscount.get() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqWritePermissionTest_get_asyncCallback_2700', 0, async function(done) {
            console.info('AccessibilityConfigReqWritePermissionTest_get_asyncCallback_2700');
            config.brightnessDiscount.get((err, result) => {
                if (err.code != 0) {
                    expect(true).assertTrue();
                } else {
                    console.error(`AccessibilityConfigReqWritePermissionTest_get_asyncCallback_2700 has no read permission`);
                    expect(null).assertFail();
                }
            });
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigReqWritePermissionTest_get_asyncPromise_2800
         * @tc.name    AccessibilityConfigReqWritePermissionTest_get_asyncPromise_2800
         * @tc.desc    Test brightnessDiscount.get() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqWritePermissionTest_get_asyncPromise_2800', 0, async function(done) {
            console.info('AccessibilityConfigReqWritePermissionTest_get_asyncPromise_2800');
            config.brightnessDiscount.get().then((result) => {
                console.error(`AccessibilityConfigReqWritePermissionTest_get_asyncPromise_2800 has no read permission`);
                expect(null).assertFail();
                done();
            }).catch((err) => {
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigReqWritePermissionTest_get_asyncCallback_5100
         * @tc.name    AccessibilityConfigReqWritePermissionTest_get_asyncCallback_5100
         * @tc.desc    Test mouseKey.get() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqWritePermissionTest_get_asyncCallback_5100', 0, async function(done) {
            console.info('AccessibilityConfigReqWritePermissionTest_get_asyncCallback_5100');
            config.mouseKey.get((err, result) => {
                if (err.code != 0) {
                    expect(true).assertTrue();
                } else {
                    console.error(`AccessibilityConfigReqWritePermissionTest_get_asyncCallback_5100 has no read permission`);
                    expect(null).assertFail();}
            });
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigReqWritePermissionTest_get_asyncPromise_5200
         * @tc.name    AccessibilityConfigReqWritePermissionTest_get_asyncPromise_5200
         * @tc.desc    Test mouseKey.get() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqWritePermissionTest_get_asyncPromise_5200', 0, async function(done) {
            console.info('AccessibilityConfigReqWritePermissionTest_get_asyncPromise_5200');
            config.mouseKey.get().then((result) => {
                console.error(`AccessibilityConfigReqWritePermissionTest_get_asyncPromise_5200 has no read permission`);
                expect(null).assertFail();
                done();
            }).catch((err) => {
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigReqWritePermissionTest_get_asyncCallback_5700
         * @tc.name    AccessibilityConfigReqWritePermissionTest_get_asyncCallback_5700
         * @tc.desc    Test mouseAutoClick.get() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqWritePermissionTest_get_asyncCallback_5700', 0, async function(done) {
            console.info('AccessibilityConfigReqWritePermissionTest_get_asyncCallback_5700');
            config.mouseAutoClick.get((err, result) => {
                if (err.code != 0) {
                    expect(true).assertTrue();
                } else {
                    console.error(`AccessibilityConfigReqWritePermissionTest_get_asyncCallback_5700 has no read permission`);
                    expect(null).assertFail();
                }
            });
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigReqWritePermissionTest_get_asyncPromise_5800
         * @tc.name    AccessibilityConfigReqWritePermissionTest_get_asyncPromise_5800
         * @tc.desc    Test mouseAutoClick.get() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqWritePermissionTest_get_asyncPromise_5800', 0, async function(done) {
            console.info('AccessibilityConfigReqWritePermissionTest_get_asyncPromise_5800');
            config.mouseAutoClick.get().then((result) => {
                console.error(`AccessibilityConfigReqWritePermissionTest_get_asyncPromise_5800 has no read permission`);
                expect(null).assertFail();
                done();
            }).catch((err) => {
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigReqWritePermissionTest_get_asyncCallback_6300
         * @tc.name    AccessibilityConfigReqWritePermissionTest_get_asyncCallback_6300
         * @tc.desc    Test shortkey.get() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqWritePermissionTest_get_asyncCallback_6300', 0, async function(done) {
            console.info('AccessibilityConfigReqWritePermissionTest_get_asyncCallback_6300');
            config.shortkey.get((err, result) => {
                if (err.code != 0) {
                    expect(true).assertTrue();
                } else {
                    console.error(`AccessibilityConfigReqWritePermissionTest_get_asyncCallback_6300 has no read permission`);
                    expect(null).assertFail();
                }
            });
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigReqWritePermissionTest_get_asyncPromise_6400
         * @tc.name    AccessibilityConfigReqWritePermissionTest_get_asyncPromise_6400
         * @tc.desc    Test shortkey.get() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqWritePermissionTest_get_asyncPromise_6400', 0, async function(done) {
            console.info('AccessibilityConfigReqWritePermissionTest_get_asyncPromise_6400');
            config.shortkey.get().then((result) => {
                console.error(`AccessibilityConfigReqWritePermissionTest_get_asyncPromise_6400 has no read permission`);
                expect(null).assertFail();
                done();
            }).catch((err) => {
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigReqWritePermissionTest_get_asyncCallback_6900
         * @tc.name    AccessibilityConfigReqWritePermissionTest_get_asyncCallback_6900
         * @tc.desc    Test shortkeyTarget.get() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqWritePermissionTest_get_asyncCallback_6900', 0, async function(done) {
            console.info('AccessibilityConfigReqWritePermissionTest_get_asyncCallback_6900');
            config.shortkeyTarget.get((err, result) => {
                if (err.code != 0) {
                    expect(true).assertTrue();
                } else {
                    console.error(`AccessibilityConfigReqWritePermissionTest_get_asyncCallback_6900 has no read permission`);
                    expect(null).assertFail();
                }
            });
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigReqWritePermissionTest_get_asyncPromise_7000
         * @tc.name    AccessibilityConfigReqWritePermissionTest_get_asyncPromise_7000
         * @tc.desc    Test shortkeyTarget.get() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqWritePermissionTest_get_asyncPromise_7000', 0, async function(done) {
            console.info('AccessibilityConfigReqWritePermissionTest_get_asyncPromise_7000');
            config.shortkeyTarget.get().then((result) => {
                console.error(`AccessibilityConfigReqWritePermissionTest_get_asyncPromise_7000 has no read permission`);
                expect(null).assertFail();
                done();
            }).catch((err) => {
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigReqWritePermissionTest_get_asyncCallback_8300
         * @tc.name    AccessibilityConfigReqWritePermissionTest_get_asyncCallback_8300
         * @tc.desc    Test daltonizationColorFilter.get() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqWritePermissionTest_get_asyncCallback_8300', 0, async function(done) {
            console.info('AccessibilityConfigReqWritePermissionTest_get_asyncCallback_8300');
            config.daltonizationColorFilter.get((err, result) => {
                if (err.code != 0) {
                    expect(true).assertTrue();
                } else {
                    console.error(`AccessibilityConfigReqWritePermissionTest_get_asyncCallback_8300 has no read permission`);
                    expect(null).assertFail();
                }
            });
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigReqWritePermissionTest_get_asyncPromise_8400
         * @tc.name    AccessibilityConfigReqWritePermissionTest_get_asyncPromise_8400
         * @tc.desc    Test daltonizationColorFilter.get() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqWritePermissionTest_get_asyncPromise_8400', 0, async function(done) {
            console.info('AccessibilityConfigReqWritePermissionTest_get_asyncPromise_8400');
            config.daltonizationColorFilter.get().then((result) => {
                console.error(`AccessibilityConfigReqWritePermissionTest_get_asyncPromise_8400 has no read permission`);
                expect(null).assertFail();
                done();
            }).catch((err) => {
                done();
            });
        })
    })
}