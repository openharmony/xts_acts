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
    describe('AccessibilityConfigTest', function () {

        beforeEach(async function (done) {
            console.info(`AccessibilityConfigTest: beforeEach starts`);
            done();
        })
    
        afterEach(async function (done) {
            console.info(`AccessibilityConfigTest: afterEach starts`);
            setTimeout(done, 1000);
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncCallback_0100
         * @tc.name    AccessibilityConfigTest_set_asyncCallback_0100
         * @tc.desc    Test highContrastText.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncCallback_0100', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncCallback_0100');
            config.highContrastText.set(true, (err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_set_asyncCallback_0100 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect(result).assertEqual(undefined);
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncPromise_0200
         * @tc.name    AccessibilityConfigTest_set_asyncPromise_0200
         * @tc.desc    Test highContrastText.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncPromise_0200', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncPromise_0200');
            config.highContrastText.set(false).then((result) => {
                console.info(`AccessibilityConfigTest_set_asyncPromise_0200 result: ${result}`);
                expect(result).assertEqual(undefined);
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_set_asyncPromise_0200 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_get_asyncCallback_0300
         * @tc.name    AccessibilityConfigTest_get_asyncCallback_0300
         * @tc.desc    Test highContrastText.get() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_get_asyncCallback_0300', 0, async function(done) {
            console.info('AccessibilityConfigTest_get_asyncCallback_0300');
            config.highContrastText.get((err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_get_asyncCallback_0300 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect('boolean').assertEqual(typeof (result));
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_get_asyncPromise_0400
         * @tc.name    AccessibilityConfigTest_get_asyncPromise_0400
         * @tc.desc    Test highContrastText.get() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_get_asyncPromise_0400', 0, async function(done) {
            console.info('AccessibilityConfigTest_get_asyncPromise_0400');
            config.highContrastText.get().then((result) => {
                console.info(`AccessibilityConfigTest_get_asyncPromise_0400 result: ${result}`);
                expect('boolean').assertEqual(typeof (result));
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_get_asyncPromise_0400 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_on_asyncCallback_0500
         * @tc.name    AccessibilityConfigTest_on_asyncCallback_0500
         * @tc.desc    Test highContrastText.on() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_on_asyncCallback_0500', 0, async function(done) {
            console.info('AccessibilityConfigTest_on_asyncCallback_0500');
            let ret = config.highContrastText.on((data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_off_asyncCallback_0600
         * @tc.name    AccessibilityConfigTest_off_asyncCallback_0600
         * @tc.desc    Test highContrastText.off() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_off_asyncCallback_0600', 0, async function(done) {
            console.info('AccessibilityConfigTest_off_asyncCallback_0600');
            let ret = config.highContrastText.off((data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncCallback_0700
         * @tc.name    AccessibilityConfigTest_set_asyncCallback_0700
         * @tc.desc    Test invertColor.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncCallback_0700', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncCallback_0700');
            config.invertColor.set(true, (err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_set_asyncCallback_0700 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect(result).assertEqual(undefined);
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncPromise_0800
         * @tc.name    AccessibilityConfigTest_set_asyncPromise_0800
         * @tc.desc    Test invertColor.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncPromise_0800', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncPromise_0800');
            config.invertColor.set(false).then((result) => {
                console.info(`AccessibilityConfigTest_set_asyncPromise_0800 result: ${result}`);
                expect(result).assertEqual(undefined);
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_set_asyncPromise_0800 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_get_asyncCallback_0900
         * @tc.name    AccessibilityConfigTest_get_asyncCallback_0900
         * @tc.desc    Test invertColor.get() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_get_asyncCallback_0900', 0, async function(done) {
            console.info('AccessibilityConfigTest_get_asyncCallback_0900');
            config.invertColor.get((err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_get_asyncCallback_0900 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect('boolean').assertEqual(typeof (result));
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_get_asyncPromise_1000
         * @tc.name    AccessibilityConfigTest_get_asyncPromise_1000
         * @tc.desc    Test invertColor.get() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_get_asyncPromise_1000', 0, async function(done) {
            console.info('AccessibilityConfigTest_get_asyncPromise_1000');
            config.invertColor.get().then((result) => {
                console.info(`AccessibilityConfigTest_get_asyncPromise_1000 result: ${result}`);
                expect('boolean').assertEqual(typeof (result));
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_get_asyncPromise_1000 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_on_asyncCallback_1100
         * @tc.name    AccessibilityConfigTest_on_asyncCallback_1100
         * @tc.desc    Test invertColor.on() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_on_asyncCallback_1100', 0, async function(done) {
            console.info('AccessibilityConfigTest_on_asyncCallback_1100');
            let ret = config.invertColor.on((data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_off_asyncCallback_1200
         * @tc.name    AccessibilityConfigTest_off_asyncCallback_1200
         * @tc.desc    Test invertColor.off() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_off_asyncCallback_1200', 0, async function(done) {
            console.info('AccessibilityConfigTest_off_asyncCallback_1200');
            let ret = config.invertColor.off((data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncCallback_1300
         * @tc.name    AccessibilityConfigTest_set_asyncCallback_1300
         * @tc.desc    Test contentTimeout.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncCallback_1300', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncCallback_1300');
            config.contentTimeout.set(0, (err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_set_asyncCallback_1300 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect(result).assertEqual(undefined);
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncPromise_1400
         * @tc.name    AccessibilityConfigTest_set_asyncPromise_1400
         * @tc.desc    Test contentTimeout.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncPromise_1400', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncPromise_1400');
            config.contentTimeout.set(5000).then((result) => {
                console.info(`AccessibilityConfigTest_set_asyncPromise_1400 result: ${result}`);
                expect(result).assertEqual(undefined);
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_set_asyncPromise_1400 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_get_asyncCallback_1500
         * @tc.name    AccessibilityConfigTest_get_asyncCallback_1500
         * @tc.desc    Test contentTimeout.get() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_get_asyncCallback_1500', 0, async function(done) {
            console.info('AccessibilityConfigTest_get_asyncCallback_1500');
            config.contentTimeout.get((err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_get_asyncCallback_1500 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect('number').assertEqual(typeof (result));
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_get_asyncPromise_1600
         * @tc.name    AccessibilityConfigTest_get_asyncPromise_1600
         * @tc.desc    Test contentTimeout.get() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_get_asyncPromise_1600', 0, async function(done) {
            console.info('AccessibilityConfigTest_get_asyncPromise_1600');
            config.contentTimeout.get().then((result) => {
                console.info(`AccessibilityConfigTest_get_asyncPromise_1600 result: ${result}`);
                expect('number').assertEqual(typeof (result));
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_get_asyncPromise_1600 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_on_asyncCallback_1700
         * @tc.name    AccessibilityConfigTest_on_asyncCallback_1700
         * @tc.desc    Test contentTimeout.on() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_on_asyncCallback_1700', 0, async function(done) {
            console.info('AccessibilityConfigTest_on_asyncCallback_1700');
            let ret = config.contentTimeout.on((data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_off_asyncCallback_1800
         * @tc.name    AccessibilityConfigTest_off_asyncCallback_1800
         * @tc.desc    Test contentTimeout.off() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_off_asyncCallback_1800', 0, async function(done) {
            console.info('AccessibilityConfigTest_off_asyncCallback_1800');
            let ret = config.contentTimeout.off((data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
        
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncCallback_1900
         * @tc.name    AccessibilityConfigTest_set_asyncCallback_1900
         * @tc.desc    Test animationOff.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncCallback_1900', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncCallback_1900');
            config.animationOff.set(true, (err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_set_asyncCallback_1900 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect(result).assertEqual(undefined);
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncPromise_2000
         * @tc.name    AccessibilityConfigTest_set_asyncPromise_2000
         * @tc.desc    Test animationOff.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncPromise_2000', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncPromise_2000');
            config.animationOff.set(false).then((result) => {
                console.info(`AccessibilityConfigTest_set_asyncPromise_2000 result: ${result}`);
                expect(result).assertEqual(undefined);
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_set_asyncPromise_2000 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_get_asyncCallback_2100
         * @tc.name    AccessibilityConfigTest_get_asyncCallback_2100
         * @tc.desc    Test animationOff.get() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_get_asyncCallback_2100', 0, async function(done) {
            console.info('AccessibilityConfigTest_get_asyncCallback_2100');
            config.animationOff.get((err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_get_asyncCallback_2100 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect('boolean').assertEqual(typeof (result));
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_get_asyncPromise_2200
         * @tc.name    AccessibilityConfigTest_get_asyncPromise_2200
         * @tc.desc    Test animationOff.get() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_get_asyncPromise_2200', 0, async function(done) {
            console.info('AccessibilityConfigTest_get_asyncPromise_2200');
            config.animationOff.get().then((result) => {
                console.info(`AccessibilityConfigTest_get_asyncPromise_2200 result: ${result}`);
                expect('boolean').assertEqual(typeof (result));
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_get_asyncPromise_2200 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_on_asyncCallback_2300
         * @tc.name    AccessibilityConfigTest_on_asyncCallback_2300
         * @tc.desc    Test animationOff.on() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_on_asyncCallback_2300', 0, async function(done) {
            console.info('AccessibilityConfigTest_on_asyncCallback_2300');
            let ret = config.animationOff.on((data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_off_asyncCallback_2400
         * @tc.name    AccessibilityConfigTest_off_asyncCallback_2400
         * @tc.desc    Test animationOff.off() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_off_asyncCallback_2400', 0, async function(done) {
            console.info('AccessibilityConfigTest_off_asyncCallback_2400');
            let ret = config.animationOff.off((data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncCallback_2500
         * @tc.name    AccessibilityConfigTest_set_asyncCallback_2500
         * @tc.desc    Test brightnessDiscount.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncCallback_2500', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncCallback_2500');
            config.brightnessDiscount.set(0.1, (err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_set_asyncCallback_2500 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect(result).assertEqual(undefined);
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncPromise_2600
         * @tc.name    AccessibilityConfigTest_set_asyncPromise_2600
         * @tc.desc    Test brightnessDiscount.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncPromise_2600', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncPromise_2600');
            config.brightnessDiscount.set(0.9).then((result) => {
                console.info(`AccessibilityConfigTest_set_asyncPromise_2600 result: ${result}`);
                expect(result).assertEqual(undefined);
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_set_asyncPromise_2600 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_get_asyncCallback_2700
         * @tc.name    AccessibilityConfigTest_get_asyncCallback_2700
         * @tc.desc    Test brightnessDiscount.get() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_get_asyncCallback_2700', 0, async function(done) {
            console.info('AccessibilityConfigTest_get_asyncCallback_2700');
            config.brightnessDiscount.get((err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_get_asyncCallback_2700 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect('number').assertEqual(typeof (result));
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_get_asyncPromise_2800
         * @tc.name    AccessibilityConfigTest_get_asyncPromise_2800
         * @tc.desc    Test brightnessDiscount.get() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_get_asyncPromise_2800', 0, async function(done) {
            console.info('AccessibilityConfigTest_get_asyncPromise_2800');
            config.brightnessDiscount.get().then((result) => {
                console.info(`AccessibilityConfigTest_get_asyncPromise_2800 result: ${result}`);
                expect('number').assertEqual(typeof (result));
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_get_asyncPromise_2800 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_on_asyncCallback_2900
         * @tc.name    AccessibilityConfigTest_on_asyncCallback_2900
         * @tc.desc    Test brightnessDiscount.on() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_on_asyncCallback_2900', 0, async function(done) {
            console.info('AccessibilityConfigTest_on_asyncCallback_2900');
            let ret = config.brightnessDiscount.on((data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_off_asyncCallback_3000
         * @tc.name    AccessibilityConfigTest_off_asyncCallback_3000
         * @tc.desc    Test brightnessDiscount.off() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_off_asyncCallback_3000', 0, async function(done) {
            console.info('AccessibilityConfigTest_off_asyncCallback_3000');
            let ret = config.brightnessDiscount.off((data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncCallback_4900
         * @tc.name    AccessibilityConfigTest_set_asyncCallback_4900
         * @tc.desc    Test mouseKey.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncCallback_4900', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncCallback_4900');
            config.mouseKey.set(true, (err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_set_asyncCallback_4900 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect(result).assertEqual(undefined);
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncPromise_5000
         * @tc.name    AccessibilityConfigTest_set_asyncPromise_5000
         * @tc.desc    Test mouseKey.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncPromise_5000', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncPromise_5000');
            config.mouseKey.set(false).then((result) => {
                console.info(`AccessibilityConfigTest_set_asyncPromise_5000 result: ${result}`);
                expect(result).assertEqual(undefined);
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_set_asyncPromise_5000 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_get_asyncCallback_5100
         * @tc.name    AccessibilityConfigTest_get_asyncCallback_5100
         * @tc.desc    Test mouseKey.get() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_get_asyncCallback_5100', 0, async function(done) {
            console.info('AccessibilityConfigTest_get_asyncCallback_5100');
            config.mouseKey.get((err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_get_asyncCallback_5100 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect('boolean').assertEqual(typeof (result));
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_get_asyncPromise_5200
         * @tc.name    AccessibilityConfigTest_get_asyncPromise_5200
         * @tc.desc    Test mouseKey.get() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_get_asyncPromise_5200', 0, async function(done) {
            console.info('AccessibilityConfigTest_get_asyncPromise_5200');
            config.mouseKey.get().then((result) => {
                console.info(`AccessibilityConfigTest_get_asyncPromise_5200 result: ${result}`);
                expect('boolean').assertEqual(typeof (result));
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_get_asyncPromise_5200 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_on_asyncCallback_5300
         * @tc.name    AccessibilityConfigTest_on_asyncCallback_5300
         * @tc.desc    Test mouseKey.on() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_on_asyncCallback_5300', 0, async function(done) {
            console.info('AccessibilityConfigTest_on_asyncCallback_5300');
            let ret = config.mouseKey.on((data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_off_asyncCallback_5400
         * @tc.name    AccessibilityConfigTest_off_asyncCallback_5400
         * @tc.desc    Test mouseKey.off() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_off_asyncCallback_5400', 0, async function(done) {
            console.info('AccessibilityConfigTest_off_asyncCallback_5400');
            let ret = config.mouseKey.off((data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncCallback_5500
         * @tc.name    AccessibilityConfigTest_set_asyncCallback_5500
         * @tc.desc    Test mouseAutoClick.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncCallback_5500', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncCallback_5500');
            config.mouseAutoClick.set(1, (err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_set_asyncCallback_5500 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect(result).assertEqual(undefined);
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncPromise_5600
         * @tc.name    AccessibilityConfigTest_set_asyncPromise_5600
         * @tc.desc    Test mouseAutoClick.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncPromise_5600', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncPromise_5600');
            config.mouseAutoClick.set(5000).then((result) => {
                console.info(`AccessibilityConfigTest_set_asyncPromise_5600 result: ${result}`);
                expect(result).assertEqual(undefined);
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_set_asyncPromise_5600 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_get_asyncCallback_5700
         * @tc.name    AccessibilityConfigTest_get_asyncCallback_5700
         * @tc.desc    Test mouseAutoClick.get() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_get_asyncCallback_5700', 0, async function(done) {
            console.info('AccessibilityConfigTest_get_asyncCallback_5700');
            config.mouseAutoClick.get((err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_get_asyncCallback_5700 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect('number').assertEqual(typeof (result));
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_get_asyncPromise_5800
         * @tc.name    AccessibilityConfigTest_get_asyncPromise_5800
         * @tc.desc    Test mouseAutoClick.get() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_get_asyncPromise_5800', 0, async function(done) {
            console.info('AccessibilityConfigTest_get_asyncPromise_5800');
            config.mouseAutoClick.get().then((result) => {
                console.info(`AccessibilityConfigTest_get_asyncPromise_5800 result: ${result}`);
                expect('number').assertEqual(typeof (result));
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_get_asyncPromise_5800 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_on_asyncCallback_5900
         * @tc.name    AccessibilityConfigTest_on_asyncCallback_5900
         * @tc.desc    Test mouseAutoClick.on() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_on_asyncCallback_5900', 0, async function(done) {
            console.info('AccessibilityConfigTest_on_asyncCallback_5900');
            let ret = config.mouseAutoClick.on((data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_off_asyncCallback_6000
         * @tc.name    AccessibilityConfigTest_off_asyncCallback_6000
         * @tc.desc    Test mouseAutoClick.off() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_off_asyncCallback_6000', 0, async function(done) {
            console.info('AccessibilityConfigTest_off_asyncCallback_6000');
            let ret = config.mouseAutoClick.off((data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncCallback_6100
         * @tc.name    AccessibilityConfigTest_set_asyncCallback_6100
         * @tc.desc    Test shortkey.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncCallback_6100', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncCallback_6100');
            config.shortkey.set(true, (err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_set_asyncCallback_6100 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect(result).assertEqual(undefined);
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncPromise_6200
         * @tc.name    AccessibilityConfigTest_set_asyncPromise_6200
         * @tc.desc    Test shortkey.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncPromise_6200', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncPromise_6200');
            config.shortkey.set(false).then((result) => {
                console.info(`AccessibilityConfigTest_set_asyncPromise_6200 result: ${result}`);
                expect(result).assertEqual(undefined);
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_set_asyncPromise_6200 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_get_asyncCallback_6300
         * @tc.name    AccessibilityConfigTest_get_asyncCallback_6300
         * @tc.desc    Test shortkey.get() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_get_asyncCallback_6300', 0, async function(done) {
            console.info('AccessibilityConfigTest_get_asyncCallback_6300');
            config.shortkey.get((err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_get_asyncCallback_6300 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect('boolean').assertEqual(typeof (result));
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_get_asyncPromise_6400
         * @tc.name    AccessibilityConfigTest_get_asyncPromise_6400
         * @tc.desc    Test shortkey.get() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_get_asyncPromise_6400', 0, async function(done) {
            console.info('AccessibilityConfigTest_get_asyncPromise_6400');
            config.shortkey.get().then((result) => {
                console.info(`AccessibilityConfigTest_get_asyncPromise_6400 result: ${result}`);
                expect('boolean').assertEqual(typeof (result));
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_get_asyncPromise_6400 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_on_asyncCallback_6500
         * @tc.name    AccessibilityConfigTest_on_asyncCallback_6500
         * @tc.desc    Test shortkey.on() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_on_asyncCallback_6500', 0, async function(done) {
            console.info('AccessibilityConfigTest_on_asyncCallback_6500');
            let ret = config.shortkey.on((data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_off_asyncCallback_6600
         * @tc.name    AccessibilityConfigTest_off_asyncCallback_6600
         * @tc.desc    Test shortkey.off() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_off_asyncCallback_6600', 0, async function(done) {
            console.info('AccessibilityConfigTest_off_asyncCallback_6600');
            let ret = config.shortkey.off((data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncCallback_6700
         * @tc.name    AccessibilityConfigTest_set_asyncCallback_6700
         * @tc.desc    Test shortkeyTarget.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncCallback_6700', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncCallback_6700');
            let value = 'teststr'
            config.shortkeyTarget.set(value, (err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_set_asyncCallback_6700 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect(result).assertEqual(undefined);
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncPromise_6800
         * @tc.name    AccessibilityConfigTest_set_asyncPromise_6800
         * @tc.desc    Test shortkeyTarget.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncPromise_6800', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncPromise_6800');
            let value = 'test'
            config.shortkeyTarget.set(value).then((result) => {
                console.info(`AccessibilityConfigTest_set_asyncPromise_6800 result: ${result}`);
                expect(result).assertEqual(undefined);
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_set_asyncPromise_6800 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_get_asyncCallback_6900
         * @tc.name    AccessibilityConfigTest_get_asyncCallback_6900
         * @tc.desc    Test shortkeyTarget.get() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_get_asyncCallback_6900', 0, async function(done) {
            console.info('AccessibilityConfigTest_get_asyncCallback_6900');
            config.shortkeyTarget.get((err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_get_asyncCallback_6900 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect('string').assertEqual(typeof (result));
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_get_asyncPromise_7000
         * @tc.name    AccessibilityConfigTest_get_asyncPromise_7000
         * @tc.desc    Test shortkeyTarget.get() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_get_asyncPromise_7000', 0, async function(done) {
            console.info('AccessibilityConfigTest_get_asyncPromise_7000');
            config.shortkeyTarget.get().then((result) => {
                console.info(`AccessibilityConfigTest_get_asyncPromise_7000 result: ${result}`);
                expect('string').assertEqual(typeof (result));
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_get_asyncPromise_7000 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_on_asyncCallback_7100
         * @tc.name    AccessibilityConfigTest_on_asyncCallback_7100
         * @tc.desc    Test shortkeyTarget.on() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_on_asyncCallback_7100', 0, async function(done) {
            console.info('AccessibilityConfigTest_on_asyncCallback_7100');
            let ret = config.shortkeyTarget.on((data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_off_asyncCallback_7200
         * @tc.name    AccessibilityConfigTest_off_asyncCallback_7200
         * @tc.desc    Test shortkeyTarget.off() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_off_asyncCallback_7200', 0, async function(done) {
            console.info('AccessibilityConfigTest_off_asyncCallback_7200');
            let ret = config.shortkeyTarget.off((data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncCallback_7300
         * @tc.name    AccessibilityConfigTest_set_asyncCallback_7300
         * @tc.desc    Test captions.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncCallback_7300', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncCallback_7300');
            config.captions.set(true, (err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_set_asyncCallback_7300 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect(result).assertEqual(undefined);
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncPromise_7400
         * @tc.name    AccessibilityConfigTest_set_asyncPromise_7400
         * @tc.desc    Test captions.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncPromise_7400', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncPromise_7400');
            config.captions.set(false).then((result) => {
                console.info(`AccessibilityConfigTest_set_asyncPromise_7400 result: ${result}`);
                expect(result).assertEqual(undefined);
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_set_asyncPromise_7400 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_get_asyncCallback_7500
         * @tc.name    AccessibilityConfigTest_get_asyncCallback_7500
         * @tc.desc    Test captions.get() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_get_asyncCallback_7500', 0, async function(done) {
            console.info('AccessibilityConfigTest_get_asyncCallback_7500');
            config.captions.get((err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_get_asyncCallback_7500 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect('boolean').assertEqual(typeof (result));
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_get_asyncPromise_7600
         * @tc.name    AccessibilityConfigTest_get_asyncPromise_7600
         * @tc.desc    Test captions.get() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_get_asyncPromise_7600', 0, async function(done) {
            console.info('AccessibilityConfigTest_get_asyncPromise_7600');
            config.captions.get().then((result) => {
                console.info(`AccessibilityConfigTest_get_asyncPromise_7600 result: ${result}`);
                expect('boolean').assertEqual(typeof (result));
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_get_asyncPromise_7600 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_on_asyncCallback_7700
         * @tc.name    AccessibilityConfigTest_on_asyncCallback_7700
         * @tc.desc    Test captions.on() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_on_asyncCallback_7700', 0, async function(done) {
            console.info('AccessibilityConfigTest_on_asyncCallback_7700');
            let ret = config.captions.on((data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_off_asyncCallback_7800
         * @tc.name    AccessibilityConfigTest_off_asyncCallback_7800
         * @tc.desc    Test captions.off() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_off_asyncCallback_7800', 0, async function(done) {
            console.info('AccessibilityConfigTest_off_asyncCallback_7800');
            let ret = config.captions.off((data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncCallback_7900
         * @tc.name    AccessibilityConfigTest_set_asyncCallback_7900
         * @tc.desc    Test daltonizationColorFilter.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncCallback_7900', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncCallback_7900');
            config.daltonizationColorFilter.set('Normal', (err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_set_asyncCallback_7900 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect(result).assertEqual(undefined);
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncCallback_8000
         * @tc.name    AccessibilityConfigTest_set_asyncCallback_8000
         * @tc.desc    Test daltonizationColorFilter.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncCallback_8000', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncCallback_8000');
            config.daltonizationColorFilter.set('Deuteranomaly', (err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_set_asyncCallback_8000 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect(result).assertEqual(undefined);
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncPromise_8100
         * @tc.name    AccessibilityConfigTest_set_asyncPromise_8100
         * @tc.desc    Test daltonizationColorFilter.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncPromise_8100', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncPromise_8100');
            config.daltonizationColorFilter.set('Protanomaly').then((result) => {
                console.info(`AccessibilityConfigTest_set_asyncPromise_8100 result: ${result}`);
                expect(result).assertEqual(undefined);
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_set_asyncPromise_8100 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncPromise_8200
         * @tc.name    AccessibilityConfigTest_set_asyncPromise_8200
         * @tc.desc    Test daltonizationColorFilter.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncPromise_8200', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncPromise_8200');
            config.daltonizationColorFilter.set('Tritanomaly').then((result) => {
                console.info(`AccessibilityConfigTest_set_asyncPromise_8200 result: ${result}`);
                expect(result).assertEqual(undefined);
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_set_asyncPromise_8200 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_get_asyncCallback_8300
         * @tc.name    AccessibilityConfigTest_get_asyncCallback_8300
         * @tc.desc    Test daltonizationColorFilter.get() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_get_asyncCallback_8300', 0, async function(done) {
            console.info('AccessibilityConfigTest_get_asyncCallback_8300');
            config.daltonizationColorFilter.get((err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_get_asyncCallback_8300 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect('string').assertEqual(typeof (result));
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_get_asyncPromise_8400
         * @tc.name    AccessibilityConfigTest_get_asyncPromise_8400
         * @tc.desc    Test daltonizationColorFilter.get() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_get_asyncPromise_8400', 0, async function(done) {
            console.info('AccessibilityConfigTest_get_asyncPromise_8400');
            config.daltonizationColorFilter.get().then((result) => {
                console.info(`AccessibilityConfigTest_get_asyncPromise_8400 result: ${result}`);
                expect('string').assertEqual(typeof (result));
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_get_asyncPromise_8400 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_on_asyncCallback_8500
         * @tc.name    AccessibilityConfigTest_on_asyncCallback_8500
         * @tc.desc    Test daltonizationColorFilter.on() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_on_asyncCallback_8500', 0, async function(done) {
            console.info('AccessibilityConfigTest_on_asyncCallback_8500');
            let ret = config.daltonizationColorFilter.on((data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_off_asyncCallback_8600
         * @tc.name    AccessibilityConfigTest_off_asyncCallback_8600
         * @tc.desc    Test daltonizationColorFilter.off() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_off_asyncCallback_8600', 0, async function(done) {
            console.info('AccessibilityConfigTest_off_asyncCallback_8600');
            let ret = config.daltonizationColorFilter.off((data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncCallback_8700
         * @tc.name    AccessibilityConfigTest_set_asyncCallback_8700
         * @tc.desc    Test captionsStyle.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncCallback_8700', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncCallback_8700');
            config.captionsStyle.set({
                fontFamily: 'default',
                fontScale: 10,
                fontColor: 'blue',
                fontEdgeType: 'none',
                backgroundColor: 'blue',
                windowColor: 'blue'
            }, (err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_set_asyncCallback_8700 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect(result).assertEqual(undefined);
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_set_asyncPromise_8800
         * @tc.name    AccessibilityConfigTest_set_asyncPromise_8800
         * @tc.desc    Test captionsStyle.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_set_asyncPromise_8800', 0, async function(done) {
            console.info('AccessibilityConfigTest_set_asyncPromise_8800');
            config.captionsStyle.set({
                fontFamily: 'default',
                fontScale: 10,
                fontColor: 'blue',
                fontEdgeType: 'none',
                backgroundColor: 'blue',
                windowColor: 'blue'
            }).then((result) => {
                console.info(`AccessibilityConfigTest_set_asyncPromise_8800 result: ${result}`);
                expect(result).assertEqual(undefined);
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_set_asyncPromise_8800 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_get_asyncCallback_8900
         * @tc.name    AccessibilityConfigTest_get_asyncCallback_8900
         * @tc.desc    Test captionsStyle.get() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_get_asyncCallback_8900', 0, async function(done) {
            console.info('AccessibilityConfigTest_get_asyncCallback_8900');
            config.captionsStyle.get((err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_get_asyncCallback_8900 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect('object').assertEqual(typeof (result));
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_get_asyncPromise_9000
         * @tc.name    AccessibilityConfigTest_get_asyncPromise_9000
         * @tc.desc    Test captionsStyle.get() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_get_asyncPromise_9000', 0, async function(done) {
            console.info('AccessibilityConfigTest_get_asyncPromise_9000');
            config.captionsStyle.get().then((result) => {
                console.info(`AccessibilityConfigTest_get_asyncPromise_9000 result: ${result}`);
                expect('object').assertEqual(typeof (result));
                done();
            }).catch((err) => {
                console.error(`AccessibilityConfigTest_get_asyncPromise_9000 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_on_asyncCallback_9100
         * @tc.name    AccessibilityConfigTest_on_asyncCallback_9100
         * @tc.desc    Test captionsStyle.on() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_on_asyncCallback_9100', 0, async function(done) {
            console.info('AccessibilityConfigTest_on_asyncCallback_9100');
            let ret = config.captionsStyle.on((data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_off_asyncCallback_9200
         * @tc.name    AccessibilityConfigTest_off_asyncCallback_9200
         * @tc.desc    Test captionsStyle.off() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_off_asyncCallback_9200', 0, async function(done) {
            console.info('AccessibilityConfigTest_off_asyncCallback_9200');
            let ret = config.captionsStyle.off((data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_enableAbility_asyncCallback_9300
         * @tc.name    AccessibilityConfigTest_enableAbility_asyncCallback_9300
         * @tc.desc    Test enableAbility() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_enableAbility_asyncCallback_9300', 0, async function(done) {
            console.info('AccessibilityConfigTest_enableAbility_asyncCallback_9300');
            let name = '';
            config.enableAbility(name, [], (err) => {
                console.info(`AccessibilityConfigTest_enableAbility_asyncCallback_9300 error: ${JSON.stringify(err)}`);
                if (err.code != 0) {
                    expect(true).assertTrue();
                } else {
                    expect(null).assertFail();
                }
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_enableAbility_asyncCallback_9400
         * @tc.name    AccessibilityConfigTest_enableAbility_asyncCallback_9400
         * @tc.desc    Test enableAbility() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_enableAbility_asyncCallback_9400', 0, async function(done) {
            console.info('AccessibilityConfigTest_enableAbility_asyncCallback_9400');
            let name = 'test';
            config.enableAbility(name, ['retrieve'], (err) => {
                console.info(`AccessibilityConfigTest_enableAbility_asyncCallback_9400 error: ${JSON.stringify(err)}`);
                if (err.code != 0) {
                    expect(true).assertTrue();
                } else {
                    expect(null).assertFail();
                }
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_enableAbility_asyncCallback_9500
         * @tc.name    AccessibilityConfigTest_enableAbility_asyncCallback_9500
         * @tc.desc    Test enableAbility() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_enableAbility_asyncCallback_9500', 0, async function(done) {
            console.info('AccessibilityConfigTest_enableAbility_asyncCallback_9500');
            let name = 'test.com';
            config.enableAbility(name, ['retrieve', 'touchGuide'], (err) => {
                console.info(`AccessibilityConfigTest_enableAbility_asyncCallback_9500 error: ${JSON.stringify(err)}`);
                if (err.code != 0) {
                    expect(true).assertTrue();
                } else {
                    expect(null).assertFail();
                }
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_enableAbility_asyncCallback_9600
         * @tc.name    AccessibilityConfigTest_enableAbility_asyncCallback_9600
         * @tc.desc    Test enableAbility() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_enableAbility_asyncCallback_9600', 0, async function(done) {
            console.info('AccessibilityConfigTest_enableAbility_asyncCallback_9600');
            let name = 'com.example.accessibilityconfig/AccessibilityExtAbility';
            config.enableAbility(name, ['retrieve', 'touchGuide', 'keyEventObserver'], (err) => {
                console.info(`AccessibilityConfigTest_enableAbility_asyncCallback_9600 error: ${JSON.stringify(err)}`);
                if (err && err.code != 0) {
                    expect(null).assertFail();
                } else {
                    expect(true).assertTrue();
                }
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_enableAbility_asyncCallback_9700
         * @tc.name    AccessibilityConfigTest_enableAbility_asyncCallback_9700
         * @tc.desc    Test enableAbility() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_enableAbility_asyncCallback_9700', 0, async function(done) {
            console.info('AccessibilityConfigTest_enableAbility_asyncCallback_9700');
            let name = 'xxx';
            config.enableAbility(name, ['retrieve'], (err) => {
                console.info(`AccessibilityConfigTest_enableAbility_asyncCallback_9700 error: ${JSON.stringify(err)}`);
                if (err && err.code != 0) {
                    expect(9300001).assertEqual(err.code);
                } else {
                    expect(null).assertFail();
                }
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_enableAbility_asyncPromise_10000
         * @tc.name    AccessibilityConfigTest_enableAbility_asyncPromise_10000
         * @tc.desc    Test enableAbility() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_enableAbility_asyncPromise_10000', 0, async function(done) {
            console.info('AccessibilityConfigTest_enableAbility_asyncPromise_10000');
            let name = 'com.example.accessibilityconfig/AccessibilityExtAbility';
            config.enableAbility(name, ['retrieve', 'touchGuide']).then(() => {
                console.info('AccessibilityConfigTest_enableAbility_asyncPromise_10000 result back');
                expect(null).assertFail();
                done();
            }).catch((err) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_enableAbility_asyncPromise_10000 has error: ${JSON.stringify(err)}`);
                    expect(9300002 ).assertEqual(err.code);
                    done();
                }
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_enableAbility_asyncPromise_10100
         * @tc.name    AccessibilityConfigTest_enableAbility_asyncPromise_10100
         * @tc.desc    Test enableAbility() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_enableAbility_asyncPromise_10100', 0, async function(done) {
            console.info('AccessibilityConfigTest_enableAbility_asyncPromise_10100');
            let name = 'com.test';
            config.enableAbility(name, ['retrieve', 'touchGuide', 'keyEventObserver']).then(() => {
                console.info('AccessibilityConfigTest_enableAbility_asyncPromise_10100 result back');
                expect(null).assertFail();
                done();
            }).catch((err) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_enableAbility_asyncPromise_10100 has error: ${JSON.stringify(err)}`);
                    expect(9300001 ).assertEqual(err.code);
                    done();
                }
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_disableAbility_asyncCallback_10400
         * @tc.name    AccessibilityConfigTest_disableAbility_asyncCallback_10400
         * @tc.desc    Test disableAbility() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_disableAbility_asyncCallback_10400', 0, async function(done) {
            console.info('AccessibilityConfigTest_disableAbility_asyncCallback_10400');
            let name = 'test';
            config.disableAbility(name, (err) => {
                console.info(`AccessibilityConfigTest_disableAbility_asyncCallback_10400 err: ${JSON.stringify(err)}`);
                if (err && err.code != 0) {
                    expect(9300001).assertEqual(err.code);
                } else {
                    expect(null).assertFail();
                }
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_disableAbility_asyncCallback_10500
         * @tc.name    AccessibilityConfigTest_disableAbility_asyncCallback_10500
         * @tc.desc    Test disableAbility() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_disableAbility_asyncCallback_10500', 0, async function(done) {
            console.info('AccessibilityConfigTest_disableAbility_asyncCallback_10500');
            let name = 'com.example.accessibilityconfig/AccessibilityExtAbility';
            config.disableAbility(name, (err) => {
                console.info(`AccessibilityConfigTest_disableAbility_asyncCallback_10500 err: ${JSON.stringify(err)}`);
                if (err && err.code != 0) {
                    expect(null).assertFail();
                } else {
                    expect(true).assertTrue();
                }
                done();
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_disableAbility_asyncPromise_10900
         * @tc.name    AccessibilityConfigTest_disableAbility_asyncPromise_10900
         * @tc.desc    Test disableAbility() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_disableAbility_asyncPromise_10900', 0, async function(done) {
            console.info('AccessibilityConfigTest_disableAbility_asyncPromise_10900');
            let name = 'test';
            config.disableAbility(name).then(() => {
                console.info('AccessibilityConfigTest_disableAbility_asyncPromise_10900 result back');
                expect(null).assertFail();
                done();
            }).catch((err) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_disableAbility_asyncPromise_10900 has error: ${JSON.stringify(err)}`);
                    expect(9300001).assertEqual(err.code);
                    done();
                }
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_disableAbility_asyncPromise_11000
         * @tc.name    AccessibilityConfigTest_disableAbility_asyncPromise_11000
         * @tc.desc    Test disableAbility() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_disableAbility_asyncPromise_11000', 0, async function(done) {
            console.info('AccessibilityConfigTest_disableAbility_asyncPromise_11000');
            let name = 'test.com';
            config.disableAbility(name).then(() => {
                console.info('AccessibilityConfigTest_disableAbility_asyncPromise_11000 result back');
                expect(null).assertFail();
                done();
            }).catch((err) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_disableAbility_asyncPromise_11000 has error: ${JSON.stringify(err)}`);
                    expect(true).assertTrue();
                    done();
                }
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_disableAbility_asyncPromise_11100
         * @tc.name    AccessibilityConfigTest_disableAbility_asyncPromise_11100
         * @tc.desc    Test disableAbility() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_disableAbility_asyncPromise_11100', 0, async function(done) {
            console.info('AccessibilityConfigTest_disableAbility_asyncPromise_11100');
            let name = 'com.test';
            config.disableAbility(name).then(() => {
                console.info('AccessibilityConfigTest_disableAbility_asyncPromise_11100 result back');
                expect(null).assertFail();
                done();
            }).catch((err) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_disableAbility_asyncPromise_11100 has error: ${JSON.stringify(err)}`);
                    expect(true).assertTrue();
                    done();
                }
            });
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_on_asyncCallback_11300
         * @tc.name    AccessibilityConfigTest_on_asyncCallback_11300
         * @tc.desc    Test on() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_on_asyncCallback_11300', 0, async function(done) {
            console.info('AccessibilityConfigTest_on_asyncCallback_11300');
            let ret = config.on('enabledAccessibilityExtensionListChange', (data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })
    
        /*
         * @tc.number  AccessibilityConfigTest_off_asyncCallback_11400
         * @tc.name    AccessibilityConfigTest_off_asyncCallback_11400
         * @tc.desc    Test off() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_off_asyncCallback_11400', 0, async function(done) {
            console.info('AccessibilityConfigTest_off_asyncCallback_11400');
            let ret = config.off('enabledAccessibilityExtensionListChange', (data) => {});
            expect(ret).assertEqual(undefined);
            done();
        })

        /*
         * @tc.number  AccessibilityConfigTest_captionsStyle_asyncCallback_0100
         * @tc.name    AccessibilityConfigTest_captionsStyle_asyncCallback_0100
         * @tc.desc    Test captionsStyle.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_captionsStyle_asyncCallback_0100', 0, async function(done) {
            console.info('AccessibilityConfigTest_captionsStyle_asyncCallback_0100');
            config.captionsStyle.set({
                fontFamily: 'monospacedSerif',
                fontScale: 10,
                fontColor: 'blue',
                fontEdgeType: 'none',
                backgroundColor: 'blue',
                windowColor: 'blue'
            }, (err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_captionsStyle_asyncCallback_0100 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect(result).assertEqual(undefined);
                done();
            });
        })

        /*
         * @tc.number  AccessibilityConfigTest_captionsStyle_asyncCallback_0200
         * @tc.name    AccessibilityConfigTest_captionsStyle_asyncCallback_0200
         * @tc.desc    Test captionsStyle.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_captionsStyle_asyncCallback_0200', 0, async function(done) {
            console.info('AccessibilityConfigTest_captionsStyle_asyncCallback_0200');
            config.captionsStyle.set({
                fontFamily: 'serif',
                fontScale: 10,
                fontColor: 'blue',
                fontEdgeType: 'none',
                backgroundColor: 'blue',
                windowColor: 'blue'
            }, (err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_captionsStyle_asyncCallback_0200 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect(result).assertEqual(undefined);
                done();
            });
        })

        /*
         * @tc.number  AccessibilityConfigTest_captionsStyle_asyncCallback_0300
         * @tc.name    AccessibilityConfigTest_captionsStyle_asyncCallback_0300
         * @tc.desc    Test captionsStyle.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_captionsStyle_asyncCallback_0300', 0, async function(done) {
            console.info('AccessibilityConfigTest_captionsStyle_asyncCallback_0300');
            config.captionsStyle.set({
                fontFamily: 'monospacedSansSerif',
                fontScale: 10,
                fontColor: 'blue',
                fontEdgeType: 'none',
                backgroundColor: 'blue',
                windowColor: 'blue'
            }, (err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_captionsStyle_asyncCallback_0300 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect(result).assertEqual(undefined);
                done();
            });
        })

        /*
         * @tc.number  AccessibilityConfigTest_captionsStyle_asyncCallback_0400
         * @tc.name    AccessibilityConfigTest_captionsStyle_asyncCallback_0400
         * @tc.desc    Test captionsStyle.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_captionsStyle_asyncCallback_0400', 0, async function(done) {
            console.info('AccessibilityConfigTest_captionsStyle_asyncCallback_0400');
            config.captionsStyle.set({
                fontFamily: 'sansSerif',
                fontScale: 10,
                fontColor: 'blue',
                fontEdgeType: 'none',
                backgroundColor: 'blue',
                windowColor: 'blue'
            }, (err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_captionsStyle_asyncCallback_0400 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect(result).assertEqual(undefined);
                done();
            });
        })

        /*
         * @tc.number  AccessibilityConfigTest_captionsStyle_asyncCallback_0500
         * @tc.name    AccessibilityConfigTest_captionsStyle_asyncCallback_0500
         * @tc.desc    Test captionsStyle.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_captionsStyle_asyncCallback_0500', 0, async function(done) {
            console.info('AccessibilityConfigTest_captionsStyle_asyncCallback_0500');
            config.captionsStyle.set({
                fontFamily: 'casual',
                fontScale: 10,
                fontColor: 'blue',
                fontEdgeType: 'none',
                backgroundColor: 'blue',
                windowColor: 'blue'
            }, (err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_captionsStyle_asyncCallback_0500 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect(result).assertEqual(undefined);
                done();
            });
        })

        /*
         * @tc.number  AccessibilityConfigTest_captionsStyle_asyncCallback_0600
         * @tc.name    AccessibilityConfigTest_captionsStyle_asyncCallback_0600
         * @tc.desc    Test captionsStyle.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_captionsStyle_asyncCallback_0600', 0, async function(done) {
            console.info('AccessibilityConfigTest_captionsStyle_asyncCallback_0600');
            config.captionsStyle.set({
                fontFamily: 'cursive',
                fontScale: 10,
                fontColor: 'blue',
                fontEdgeType: 'none',
                backgroundColor: 'blue',
                windowColor: 'blue'
            }, (err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_captionsStyle_asyncCallback_0600 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect(result).assertEqual(undefined);
                done();
            });
        })

        /*
         * @tc.number  AccessibilityConfigTest_captionsStyle_asyncCallback_0700
         * @tc.name    AccessibilityConfigTest_captionsStyle_asyncCallback_0700
         * @tc.desc    Test captionsStyle.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_captionsStyle_asyncCallback_0700', 0, async function(done) {
            console.info('AccessibilityConfigTest_captionsStyle_asyncCallback_0700');
            config.captionsStyle.set({
                fontFamily: 'smallCapitals',
                fontScale: 10,
                fontColor: 'blue',
                fontEdgeType: 'none',
                backgroundColor: 'blue',
                windowColor: 'blue'
            }, (err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_captionsStyle_asyncCallback_0700 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect(result).assertEqual(undefined);
                done();
            });
        })

        /*
         * @tc.number  AccessibilityConfigTest_captionsStyle_asyncCallback_0800
         * @tc.name    AccessibilityConfigTest_captionsStyle_asyncCallback_0800
         * @tc.desc    Test captionsStyle.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_captionsStyle_asyncCallback_0800', 0, async function(done) {
            console.info('AccessibilityConfigTest_captionsStyle_asyncCallback_0800');
            config.captionsStyle.set({
                fontFamily: 'default',
                fontScale: 10,
                fontColor: 'blue',
                fontEdgeType: 'raised',
                backgroundColor: 'blue',
                windowColor: 'blue'
            }, (err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_captionsStyle_asyncCallback_0800 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect(result).assertEqual(undefined);
                done();
            });
        })

        /*
         * @tc.number  AccessibilityConfigTest_captionsStyle_asyncCallback_0900
         * @tc.name    AccessibilityConfigTest_captionsStyle_asyncCallback_0900
         * @tc.desc    Test captionsStyle.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_captionsStyle_asyncCallback_0900', 0, async function(done) {
            console.info('AccessibilityConfigTest_captionsStyle_asyncCallback_0900');
            config.captionsStyle.set({
                fontFamily: 'default',
                fontScale: 10,
                fontColor: 'blue',
                fontEdgeType: 'depressed',
                backgroundColor: 'blue',
                windowColor: 'blue'
            }, (err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_captionsStyle_asyncCallback_0900 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect(result).assertEqual(undefined);
                done();
            });
        })
    
            /*
         * @tc.number  AccessibilityConfigTest_captionsStyle_asyncCallback_1000
         * @tc.name    AccessibilityConfigTest_captionsStyle_asyncCallback_1000
         * @tc.desc    Test captionsStyle.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_captionsStyle_asyncCallback_1000', 0, async function(done) {
            console.info('AccessibilityConfigTest_captionsStyle_asyncCallback_1000');
            config.captionsStyle.set({
                fontFamily: 'default',
                fontScale: 10,
                fontColor: 'blue',
                fontEdgeType: 'uniform',
                backgroundColor: 'blue',
                windowColor: 'blue'
            }, (err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_captionsStyle_asyncCallback_1000 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect(result).assertEqual(undefined);
                done();
            });
        })

        /*
         * @tc.number  AccessibilityConfigTest_captionsStyle_asyncCallback_1100
         * @tc.name    AccessibilityConfigTest_captionsStyle_asyncCallback_1100
         * @tc.desc    Test captionsStyle.set() function in callback mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_captionsStyle_asyncCallback_1100', 0, async function(done) {
            console.info('AccessibilityConfigTest_captionsStyle_asyncCallback_1100');
            config.captionsStyle.set({
                fontFamily: 'default',
                fontScale: 10,
                fontColor: 'blue',
                fontEdgeType: 'dropShadow',
                backgroundColor: 'blue',
                windowColor: 'blue'
            }, (err, result) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_captionsStyle_asyncCallback_1100 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                expect(result).assertEqual(undefined);
                done();
            });
        })

        /*
         * @tc.number  AccessibilityConfigTest_captionsStyle_asyncPromise_0100
         * @tc.name    AccessibilityConfigTest_captionsStyle_asyncPromise_0100
         * @tc.desc    Test captionsStyle.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_captionsStyle_asyncPromise_0100', 0, async function(done) {
            console.info('AccessibilityConfigTest_captionsStyle_asyncPromise_0100');
            config.captionsStyle.set({
                fontFamily: 'monospacedSerif',
                fontScale: 10,
                fontColor: 'blue',
                fontEdgeType: 'none',
                backgroundColor: 'blue',
                windowColor: 'blue'
            }).then((result) => {
                console.info(`AccessibilityConfigTest_captionsStyle_asyncPromise_0100 result: ${result}`);
                expect(result).assertEqual(undefined);
                done();
            }).catch((err) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_captionsStyle_asyncPromise_0100 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
            });
        })

        /*
         * @tc.number  AccessibilityConfigTest_captionsStyle_asyncPromise_0200
         * @tc.name    AccessibilityConfigTest_captionsStyle_asyncPromise_0200
         * @tc.desc    Test captionsStyle.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_captionsStyle_asyncPromise_0200', 0, async function(done) {
            console.info('AccessibilityConfigTest_captionsStyle_asyncPromise_0200');
            config.captionsStyle.set({
                fontFamily: 'serif',
                fontScale: 10,
                fontColor: 'blue',
                fontEdgeType: 'none',
                backgroundColor: 'blue',
                windowColor: 'blue'
            }).then((result) => {
                console.info(`AccessibilityConfigTest_captionsStyle_asyncPromise_0200 result: ${result}`);
                expect(result).assertEqual(undefined);
                done();
            }).catch((err) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_captionsStyle_asyncPromise_0200 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
            });
        })

        /*
         * @tc.number  AccessibilityConfigTest_captionsStyle_asyncPromise_0300
         * @tc.name    AccessibilityConfigTest_captionsStyle_asyncPromise_0300
         * @tc.desc    Test captionsStyle.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_captionsStyle_asyncPromise_0300', 0, async function(done) {
            console.info('AccessibilityConfigTest_captionsStyle_asyncPromise_0300');
            config.captionsStyle.set({
                fontFamily: 'monospacedSansSerif',
                fontScale: 10,
                fontColor: 'blue',
                fontEdgeType: 'none',
                backgroundColor: 'blue',
                windowColor: 'blue'
            }).then((result) => {
                console.info(`AccessibilityConfigTest_captionsStyle_asyncPromise_0300 result: ${result}`);
                expect(result).assertEqual(undefined);
                done();
            }).catch((err) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_captionsStyle_asyncPromise_0300 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
            });
        })

        /*
         * @tc.number  AccessibilityConfigTest_captionsStyle_asyncPromise_0400
         * @tc.name    AccessibilityConfigTest_captionsStyle_asyncPromise_0400
         * @tc.desc    Test captionsStyle.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_captionsStyle_asyncPromise_0400', 0, async function(done) {
            console.info('AccessibilityConfigTest_captionsStyle_asyncPromise_0400');
            config.captionsStyle.set({
                fontFamily: 'sansSerif',
                fontScale: 10,
                fontColor: 'blue',
                fontEdgeType: 'none',
                backgroundColor: 'blue',
                windowColor: 'blue'
            }).then((result) => {
                console.info(`AccessibilityConfigTest_captionsStyle_asyncPromise_0400 result: ${result}`);
                expect(result).assertEqual(undefined);
                done();
            }).catch((err) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_captionsStyle_asyncPromise_0400 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
            });
        })

        /*
         * @tc.number  AccessibilityConfigTest_captionsStyle_asyncPromise_0500
         * @tc.name    AccessibilityConfigTest_captionsStyle_asyncPromise_0500
         * @tc.desc    Test captionsStyle.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_captionsStyle_asyncPromise_0500', 0, async function(done) {
            console.info('AccessibilityConfigTest_captionsStyle_asyncPromise_0500');
            config.captionsStyle.set({
                fontFamily: 'casual',
                fontScale: 10,
                fontColor: 'blue',
                fontEdgeType: 'none',
                backgroundColor: 'blue',
                windowColor: 'blue'
            }).then((result) => {
                console.info(`AccessibilityConfigTest_captionsStyle_asyncPromise_0500 result: ${result}`);
                expect(result).assertEqual(undefined);
                done();
            }).catch((err) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_captionsStyle_asyncPromise_0500 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
            });
        })

        /*
         * @tc.number  AccessibilityConfigTest_captionsStyle_asyncPromise_0600
         * @tc.name    AccessibilityConfigTest_captionsStyle_asyncPromise_0600
         * @tc.desc    Test captionsStyle.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_captionsStyle_asyncPromise_0600', 0, async function(done) {
            console.info('AccessibilityConfigTest_captionsStyle_asyncPromise_0600');
            config.captionsStyle.set({
                fontFamily: 'cursive',
                fontScale: 10,
                fontColor: 'blue',
                fontEdgeType: 'none',
                backgroundColor: 'blue',
                windowColor: 'blue'
            }).then((result) => {
                console.info(`AccessibilityConfigTest_captionsStyle_asyncPromise_0600 result: ${result}`);
                expect(result).assertEqual(undefined);
                done();
            }).catch((err) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_captionsStyle_asyncPromise_0600 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
            });
        })

        /*
         * @tc.number  AccessibilityConfigTest_captionsStyle_asyncPromise_0700
         * @tc.name    AccessibilityConfigTest_captionsStyle_asyncPromise_0700
         * @tc.desc    Test captionsStyle.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_captionsStyle_asyncPromise_0700', 0, async function(done) {
            console.info('AccessibilityConfigTest_captionsStyle_asyncPromise_0700');
            config.captionsStyle.set({
                fontFamily: 'smallCapitals',
                fontScale: 10,
                fontColor: 'blue',
                fontEdgeType: 'none',
                backgroundColor: 'blue',
                windowColor: 'blue'
            }).then((result) => {
                console.info(`AccessibilityConfigTest_captionsStyle_asyncPromise_0700 result: ${result}`);
                expect(result).assertEqual(undefined);
                done();
            }).catch((err) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_captionsStyle_asyncPromise_0700 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
            });
        })

        /*
         * @tc.number  AccessibilityConfigTest_captionsStyle_asyncPromise_0800
         * @tc.name    AccessibilityConfigTest_captionsStyle_asyncPromise_0800
         * @tc.desc    Test captionsStyle.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_captionsStyle_asyncPromise_0800', 0, async function(done) {
            console.info('AccessibilityConfigTest_captionsStyle_asyncPromise_0800');
            config.captionsStyle.set({
                fontFamily: 'default',
                fontScale: 10,
                fontColor: 'blue',
                fontEdgeType: 'raised',
                backgroundColor: 'blue',
                windowColor: 'blue'
            }).then((result) => {
                console.info(`AccessibilityConfigTest_captionsStyle_asyncPromise_0800 result: ${result}`);
                expect(result).assertEqual(undefined);
                done();
            }).catch((err) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_captionsStyle_asyncPromise_0800 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
            });
        })

        /*
         * @tc.number  AccessibilityConfigTest_captionsStyle_asyncPromise_0900
         * @tc.name    AccessibilityConfigTest_captionsStyle_asyncPromise_0900
         * @tc.desc    Test captionsStyle.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_captionsStyle_asyncPromise_0900', 0, async function(done) {
            console.info('AccessibilityConfigTest_captionsStyle_asyncPromise_0900');
            config.captionsStyle.set({
                fontFamily: 'default',
                fontScale: 10,
                fontColor: 'blue',
                fontEdgeType: 'depressed',
                backgroundColor: 'blue',
                windowColor: 'blue'
            }).then((result) => {
                console.info(`AccessibilityConfigTest_captionsStyle_asyncPromise_0900 result: ${result}`);
                expect(result).assertEqual(undefined);
                done();
            }).catch((err) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_captionsStyle_asyncPromise_0900 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
            });
        })

        /*
         * @tc.number  AccessibilityConfigTest_captionsStyle_asyncPromise_1000
         * @tc.name    AccessibilityConfigTest_captionsStyle_asyncPromise_1000
         * @tc.desc    Test captionsStyle.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_captionsStyle_asyncPromise_1000', 0, async function(done) {
            console.info('AccessibilityConfigTest_captionsStyle_asyncPromise_1000');
            config.captionsStyle.set({
                fontFamily: 'default',
                fontScale: 10,
                fontColor: 'blue',
                fontEdgeType: 'uniform',
                backgroundColor: 'blue',
                windowColor: 'blue'
            }).then((result) => {
                console.info(`AccessibilityConfigTest_captionsStyle_asyncPromise_1000 result: ${result}`);
                expect(result).assertEqual(undefined);
                done();
            }).catch((err) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_captionsStyle_asyncPromise_1000 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
            });
        })

        /*
         * @tc.number  AccessibilityConfigTest_captionsStyle_asyncPromise_1100
         * @tc.name    AccessibilityConfigTest_captionsStyle_asyncPromise_1100
         * @tc.desc    Test captionsStyle.set() function in promise mode.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityConfigTest_captionsStyle_asyncPromise_1100', 0, async function(done) {
            console.info('AccessibilityConfigTest_captionsStyle_asyncPromise_1100');
            config.captionsStyle.set({
                fontFamily: 'default',
                fontScale: 10,
                fontColor: 'blue',
                fontEdgeType: 'dropShadow',
                backgroundColor: 'blue',
                windowColor: 'blue'
            }).then((result) => {
                console.info(`AccessibilityConfigTest_captionsStyle_asyncPromise_1100 result: ${result}`);
                expect(result).assertEqual(undefined);
                done();
            }).catch((err) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityConfigTest_captionsStyle_asyncPromise_1100 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
            });
        })
    })
}