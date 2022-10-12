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
    describe('AccessibilityConfigReqReadPermissionTest', function () {

        beforeEach(async function (done) {
            console.info(`AccessibilityConfigReqReadPermissionTest: beforeEach starts`);
            done();
        })
    
        afterEach(async function (done) {
            console.info(`AccessibilityConfigReqReadPermissionTest: afterEach starts`);
            setTimeout(done, 1000);
        })
    
        /*
         * @tc.number  AccessibilityConfigReqReadPermissionTest_set_asyncCallback_0100
         * @tc.name    AccessibilityConfigReqReadPermissionTest_set_asyncCallback_0100
         * @tc.desc    Test highContrastText.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqReadPermissionTest_set_asyncCallback_0100', 0, async function(done) {
            console.info('AccessibilityConfigReqReadPermissionTest_set_asyncCallback_0100');
            config.highContrastText.set(true, (err, result) => {
                if (err.code != 0) {
                    expect(true).assertTrue();
                } else {
                    console.error(`AccessibilityConfigReqReadPermissionTest_set_asyncCallback_0100 has no write permission`);
                    expect(null).assertFail();
                }
            });
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigReqReadPermissionTest_set_asyncPromise_0200
         * @tc.name    AccessibilityConfigReqReadPermissionTest_set_asyncPromise_0200
         * @tc.desc    Test highContrastText.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqReadPermissionTest_set_asyncPromise_0200', 0, async function(done) {
            console.info('AccessibilityConfigReqReadPermissionTest_set_asyncPromise_0200');
            config.highContrastText.set(false).then((result) => {
                console.error(`AccessibilityConfigReqReadPermissionTest_set_asyncPromise_0200 has no write permission`);
                expect(null).assertFail();
                done();
            }).catch((err) => {
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigReqReadPermissionTest_set_asyncCallback_0700
         * @tc.name    AccessibilityConfigReqReadPermissionTest_set_asyncCallback_0700
         * @tc.desc    Test invertColor.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqReadPermissionTest_set_asyncCallback_0700', 0, async function(done) {
            console.info('AccessibilityConfigReqReadPermissionTest_set_asyncCallback_0700');
            config.invertColor.set(true, (err, result) => {
                if (err.code != 0) {
                    expect(true).assertTrue();
                } else {
                    console.error(`AccessibilityConfigReqReadPermissionTest_set_asyncCallback_0700 has no write permission`);
                    expect(null).assertFail();
                }
            });
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigReqReadPermissionTest_set_asyncPromise_0800
         * @tc.name    AccessibilityConfigReqReadPermissionTest_set_asyncPromise_0800
         * @tc.desc    Test invertColor.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqReadPermissionTest_set_asyncPromise_0800', 0, async function(done) {
            console.info('AccessibilityConfigReqReadPermissionTest_set_asyncPromise_0800');
            config.invertColor.set(false).then((result) => {
                console.error(`AccessibilityConfigReqReadPermissionTest_set_asyncPromise_0800 has no write permission`);
                expect(null).assertFail();
                done();
            }).catch((err) => {
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigReqReadPermissionTest_set_asyncCallback_1300
         * @tc.name    AccessibilityConfigReqReadPermissionTest_set_asyncCallback_1300
         * @tc.desc    Test contentTimeout.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqReadPermissionTest_set_asyncCallback_1300', 0, async function(done) {
            console.info('AccessibilityConfigReqReadPermissionTest_set_asyncCallback_1300');
            config.contentTimeout.set(0, (err, result) => {
                if (err.code != 0) {
                    expect(true).assertTrue();
                } else {
                    console.error(`AccessibilityConfigReqReadPermissionTest_set_asyncCallback_1300 has no write permission`);
                    expect(null).assertFail();
                }
            });
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigReqReadPermissionTest_set_asyncPromise_1400
         * @tc.name    AccessibilityConfigReqReadPermissionTest_set_asyncPromise_1400
         * @tc.desc    Test contentTimeout.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqReadPermissionTest_set_asyncPromise_1400', 0, async function(done) {
            console.info('AccessibilityConfigReqReadPermissionTest_set_asyncPromise_1400');
            config.contentTimeout.set(5000).then((result) => {
                console.error(`AccessibilityConfigReqReadPermissionTest_set_asyncPromise_1400 has no write permission`);
                expect(null).assertFail();
                done();
            }).catch((err) => {
                done();
            });
        })
        
        /*
         * @tc.number  AccessibilityConfigReqReadPermissionTest_set_asyncCallback_1900
         * @tc.name    AccessibilityConfigReqReadPermissionTest_set_asyncCallback_1900
         * @tc.desc    Test animationOff.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqReadPermissionTest_set_asyncCallback_1900', 0, async function(done) {
            console.info('AccessibilityConfigReqReadPermissionTest_set_asyncCallback_1900');
            config.animationOff.set(true, (err, result) => {
                if (err.code != 0) {
                    expect(true).assertTrue();
                } else {
                    console.error(`AccessibilityConfigReqReadPermissionTest_set_asyncCallback_1900 has no write permission`);
                    expect(null).assertFail();     
                }
            });
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigReqReadPermissionTest_set_asyncPromise_2000
         * @tc.name    AccessibilityConfigReqReadPermissionTest_set_asyncPromise_2000
         * @tc.desc    Test animationOff.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqReadPermissionTest_set_asyncPromise_2000', 0, async function(done) {
            console.info('AccessibilityConfigReqReadPermissionTest_set_asyncPromise_2000');
            config.animationOff.set(false).then((result) => {
                console.error(`AccessibilityConfigReqReadPermissionTest_set_asyncPromise_2000 has no write permission`);
                expect(null).assertFail();
                done();
            }).catch((err) => {
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigReqReadPermissionTest_set_asyncCallback_2500
         * @tc.name    AccessibilityConfigReqReadPermissionTest_set_asyncCallback_2500
         * @tc.desc    Test brightnessDiscount.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqReadPermissionTest_set_asyncCallback_2500', 0, async function(done) {
            console.info('AccessibilityConfigReqReadPermissionTest_set_asyncCallback_2500');
            config.brightnessDiscount.set(0.1, (err, result) => {
                if (err.code != 0) {
                    expect(true).assertTrue();
                } else {
                    console.error(`AccessibilityConfigReqReadPermissionTest_set_asyncCallback_2500 has no write permission`);
                    expect(null).assertFail();
                }
            });
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigReqReadPermissionTest_set_asyncPromise_2600
         * @tc.name    AccessibilityConfigReqReadPermissionTest_set_asyncPromise_2600
         * @tc.desc    Test brightnessDiscount.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqReadPermissionTest_set_asyncPromise_2600', 0, async function(done) {
            console.info('AccessibilityConfigReqReadPermissionTest_set_asyncPromise_2600');
            config.brightnessDiscount.set(0.9).then((result) => {
                console.error(`AccessibilityConfigReqReadPermissionTest_set_asyncPromise_2600 has no write permission`);
                expect(null).assertFail();
                done();
            }).catch((err) => {
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigReqReadPermissionTest_set_asyncCallback_4900
         * @tc.name    AccessibilityConfigReqReadPermissionTest_set_asyncCallback_4900
         * @tc.desc    Test mouseKey.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqReadPermissionTest_set_asyncCallback_4900', 0, async function(done) {
            console.info('AccessibilityConfigReqReadPermissionTest_set_asyncCallback_4900');
            config.mouseKey.set(true, (err, result) => {
                if (err.code != 0) {
                    expect(true).assertTrue();
                } else {
                    console.error(`AccessibilityConfigReqReadPermissionTest_set_asyncCallback_4900 has no write permission`);
                    expect(null).assertFail();
                }
            });
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigReqReadPermissionTest_set_asyncPromise_5000
         * @tc.name    AccessibilityConfigReqReadPermissionTest_set_asyncPromise_5000
         * @tc.desc    Test mouseKey.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqReadPermissionTest_set_asyncPromise_5000', 0, async function(done) {
            console.info('AccessibilityConfigReqReadPermissionTest_set_asyncPromise_5000');
            config.mouseKey.set(false).then((result) => {
                console.error(`AccessibilityConfigReqReadPermissionTest_set_asyncPromise_5000 has no write permission`);
                expect(null).assertFail();
                done();
            }).catch((err) => {
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigReqReadPermissionTest_set_asyncCallback_5500
         * @tc.name    AccessibilityConfigReqReadPermissionTest_set_asyncCallback_5500
         * @tc.desc    Test mouseAutoClick.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqReadPermissionTest_set_asyncCallback_5500', 0, async function(done) {
            console.info('AccessibilityConfigReqReadPermissionTest_set_asyncCallback_5500');
            config.mouseAutoClick.set(-1, (err, result) => {
                if (err.code != 0) {
                    expect(true).assertTrue();
                } else {
                    console.error(`AccessibilityConfigReqReadPermissionTest_set_asyncCallback_5500 has no write permission`);
                    expect(null).assertFail();
                }
            });
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigReqReadPermissionTest_set_asyncPromise_5600
         * @tc.name    AccessibilityConfigReqReadPermissionTest_set_asyncPromise_5600
         * @tc.desc    Test mouseAutoClick.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqReadPermissionTest_set_asyncPromise_5600', 0, async function(done) {
            console.info('AccessibilityConfigReqReadPermissionTest_set_asyncPromise_5600');
            config.mouseAutoClick.set(5000).then((result) => {
                console.error(`AccessibilityConfigReqReadPermissionTest_set_asyncPromise_5600 has no write permission`);
                expect(null).assertFail();
                done();
            }).catch((err) => {
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigReqReadPermissionTest_set_asyncCallback_6100
         * @tc.name    AccessibilityConfigReqReadPermissionTest_set_asyncCallback_6100
         * @tc.desc    Test shortkey.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqReadPermissionTest_set_asyncCallback_6100', 0, async function(done) {
            console.info('AccessibilityConfigReqReadPermissionTest_set_asyncCallback_6100');
            config.shortkey.set(true, (err, result) => {
                if (err.code != 0) {
                    expect(true).assertTrue();
                } else {
                    console.error(`AccessibilityConfigReqReadPermissionTest_set_asyncCallback_6100 has no write permission`);
                    expect(null).assertFail();
                }
            });
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigReqReadPermissionTest_set_asyncPromise_6200
         * @tc.name    AccessibilityConfigReqReadPermissionTest_set_asyncPromise_6200
         * @tc.desc    Test shortkey.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqReadPermissionTest_set_asyncPromise_6200', 0, async function(done) {
            console.info('AccessibilityConfigReqReadPermissionTest_set_asyncPromise_6200');
            config.shortkey.set(false).then((result) => {
                console.error(`AccessibilityConfigReqReadPermissionTest_set_asyncPromise_6200 has no write permission`);
                expect(null).assertFail();
                done();
            }).catch((err) => {
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigReqReadPermissionTest_set_asyncCallback_6700
         * @tc.name    AccessibilityConfigReqReadPermissionTest_set_asyncCallback_6700
         * @tc.desc    Test shortkeyTarget.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqReadPermissionTest_set_asyncCallback_6700', 0, async function(done) {
            console.info('AccessibilityConfigReqReadPermissionTest_set_asyncCallback_6700');
            let value = 'teststr'
            config.shortkeyTarget.set(value, (err, result) => {
                if (err.code != 0) {
                    expect(true).assertTrue();
                } else {
                    console.error(`AccessibilityConfigReqReadPermissionTest_set_asyncCallback_6700 has no write permission`);
                    expect(null).assertFail();
                }
            });
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigReqReadPermissionTest_set_asyncPromise_6800
         * @tc.name    AccessibilityConfigReqReadPermissionTest_set_asyncPromise_6800
         * @tc.desc    Test shortkeyTarget.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqReadPermissionTest_set_asyncPromise_6800', 0, async function(done) {
            console.info('AccessibilityConfigReqReadPermissionTest_set_asyncPromise_6800');
            let value = 'test'
            config.shortkeyTarget.set(value).then((result) => {
                console.error(`AccessibilityConfigReqReadPermissionTest_set_asyncPromise_6800 has no write permission`);
                expect(null).assertFail();
                done();
            }).catch((err) => {
                done();
            });
        })

        /*
         * @tc.number  AccessibilityConfigReqReadPermissionTest_set_asyncCallback_7900
         * @tc.name    AccessibilityConfigReqReadPermissionTest_set_asyncCallback_7900
         * @tc.desc    Test daltonizationColorFilter.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqReadPermissionTest_set_asyncCallback_7900', 0, async function(done) {
            console.info('AccessibilityConfigReqReadPermissionTest_set_asyncCallback_7900');
            config.daltonizationColorFilter.set('Normal', (err, result) => {
                if (err.code != 0) {
                    expect(true).assertTrue();
                } else {
                    console.error(`AccessibilityConfigReqReadPermissionTest_set_asyncCallback_7900 has no write permission`);
                    expect(null).assertFail();
                }
            });
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigReqReadPermissionTest_set_asyncCallback_8000
         * @tc.name    AccessibilityConfigReqReadPermissionTest_set_asyncCallback_8000
         * @tc.desc    Test daltonizationColorFilter.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqReadPermissionTest_set_asyncCallback_8000', 0, async function(done) {
            console.info('AccessibilityConfigReqReadPermissionTest_set_asyncCallback_8000');
            config.daltonizationColorFilter.set('Deuteranomaly', (err, result) => {
                if (err.code != 0) {
                    expect(true).assertTrue();
                } else {
                    console.error(`AccessibilityConfigReqReadPermissionTest_set_asyncCallback_8000 has no write permission`);
                    expect(null).assertFail();
                }
            });
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigReqReadPermissionTest_set_asyncPromise_8100
         * @tc.name    AccessibilityConfigReqReadPermissionTest_set_asyncPromise_8100
         * @tc.desc    Test daltonizationColorFilter.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqReadPermissionTest_set_asyncPromise_8100', 0, async function(done) {
            console.info('AccessibilityConfigReqReadPermissionTest_set_asyncPromise_8100');
            config.daltonizationColorFilter.set('Protanomaly').then((result) => {
                console.error(`AccessibilityConfigReqReadPermissionTest_set_asyncPromise_8100 has no write permission`);
                expect(null).assertFail();
                done();
            }).catch((err) => {
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigReqReadPermissionTest_set_asyncPromise_8200
         * @tc.name    AccessibilityConfigReqReadPermissionTest_set_asyncPromise_8200
         * @tc.desc    Test daltonizationColorFilter.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigReqReadPermissionTest_set_asyncPromise_8200', 0, async function(done) {
            console.info('AccessibilityConfigReqReadPermissionTest_set_asyncPromise_8200');
            config.daltonizationColorFilter.set('Tritanomaly').then((result) => {
                console.error(`AccessibilityConfigReqReadPermissionTest_set_asyncPromise_8200 has no write permission`);
                expect(null).assertFail();
                done();
            }).catch((err) => {
                done();
            });
        })
    })
}