/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import { describe, it, expect } from 'deccjsunit/index.ets';
import Utils from './Utils';
import Bundle from '@ohos.bundle';

const BUNDLE_NAME = 'com.open.harmony.packagemag';
const BUNDLE_NAME_OTHER = 'com.example.l3jsdemo';
const BUNDLE_NAME_ERROR = 'com.ohos.acepackage.error';
const ABILITY_NAME = 'com.open.harmony.packagemag.MainAbility';
const ABILITY_NAME_OTHER = 'com.example.l3jsdemo.MainAbility';
const ABILITY_NAME_ERROR = 'com.ohos.acepackage.error.MainAbility';
const ABILITY = {
    bundleName: BUNDLE_NAME,
    name: ABILITY_NAME
};
const OTHER_ABILITY = {
    bundleName: BUNDLE_NAME_OTHER,
    name: ABILITY_NAME_OTHER
};
const ABILITY_ERROR1 = {
    bundleName: BUNDLE_NAME_ERROR,
    name: ABILITY_NAME_ERROR
};
const ABILITY_ERROR2 = {
    bundleName: "",
    name: ABILITY_NAME
};
const ABILITY_ERROR3 = {
    bundleName: BUNDLE_NAME,
    name: ""
};
const ABILITY_ERROR4 = {
    bundleName: undefined,
    name: ABILITY_NAME
};
const ABILITY_ERROR5 = {
    bundleName: BUNDLE_NAME,
    name: undefined
};
const ABILITY_ERROR6 = {
    bundleName: undefined,
    name: undefined
};
const ABILITY_ERROR7 = {
    bundleName: "",
    name: ""
};

export default function isAbilityEnabledETSUnit() {

    describe('isAbilityEnabled_test', function () {

        /*
         * @tc.number: isAbilityEnabled_test_0100
         * @tc.name: isAbilityEnabled : Get whether to enable a specified ability
         * @tc.desc: Check the return value of the interface
         */
        it('isAbilityEnabled_test_0100', 0, async function (done) {
            let timeOldStamp = await Utils.getNowTime();
            await Bundle.isAbilityEnabled(ABILITY).then((data) => {
                let timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime('[isAbilityEnabled_test_0100]', timeOldStamp, timeNewStamp);
                expect(data).assertTrue();
            }).catch((error) => {
                expect(error).assertFail();
            });
            timeOldStamp = await Utils.getNowTime();
            Bundle.isAbilityEnabled(ABILITY, (error, data) => {
                if (error) {
                    expect(error).assertFail();
                }
                let timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime('[isAbilityEnabled_test_0100]', timeOldStamp, timeNewStamp);
                expect(data).assertTrue();
                done();
            });
        });

        /*
         * @tc.number: isAbilityEnabled_test_0200
         * @tc.name: isAbilityEnabled : Get whether to enable a specified ability
         * @tc.desc: Check the return value of the interface when bundleName and ability error
         */
        it('isAbilityEnabled_test_0200', 0, async function (done) {
            await Bundle.isAbilityEnabled(ABILITY_ERROR1).then((data) => {
                expect(data).assertFalse();
            }).catch((error) => {
                expect(error).assertFail();
            });
            await Bundle.isAbilityEnabled(ABILITY_ERROR2).then((data) => {
                expect(data).assertFalse();
            }).catch((error) => {
                expect(error).assertFail();
            });
            await Bundle.isAbilityEnabled(ABILITY_ERROR3).then((data) => {
                expect(data).assertFalse();
            }).catch((error) => {
                expect(error).assertFail();
            });
            await Bundle.isAbilityEnabled(ABILITY_ERROR7).then((data) => {
                expect(data).assertFalse();
            }).catch((error) => {
                expect(error).assertFail();
            });
            Bundle.isAbilityEnabled(ABILITY_ERROR1, (error, data) => {
                expect(error).assertEqual(0);
                expect(data).assertFalse();
                Bundle.isAbilityEnabled(ABILITY_ERROR2, (error, data) => {
                    expect(error).assertEqual(0);
                    expect(data).assertFalse();
                    Bundle.isAbilityEnabled(ABILITY_ERROR3, (error, data) => {
                        expect(error).assertEqual(0);
                        expect(data).assertFalse();
                        Bundle.isAbilityEnabled(ABILITY_ERROR7, (error, data) => {
                            expect(error).assertEqual(0);
                            expect(data).assertFalse();
                            done();
                        });
                    });
                });
            });
        });

        /*
         * @tc.number: isAbilityEnabled_test_0300
         * @tc.name: isAbilityEnabled : Get whether to enable a specified ability
         * @tc.desc: Check the return value of the interface when bundleName and ability error
         */
        it('isAbilityEnabled_test_0300', 0, async function (done) {
            await Bundle.isAbilityEnabled(ABILITY_ERROR4).then((data) => {
                expect(data).assertFail();
            }).catch((error) => {
                expect(error).assertEqual(2);
            });
            await Bundle.isAbilityEnabled(ABILITY_ERROR5).then((data) => {
                expect(data).assertFail();
            }).catch((error) => {
                expect(error).assertEqual(2);
            });
            await Bundle.isAbilityEnabled(ABILITY_ERROR6).then((data) => {
                expect(data).assertFail();
            }).catch((error) => {
                expect(error).assertEqual(2);
            });
            Bundle.isAbilityEnabled(ABILITY_ERROR4, (error, data) => {
                expect(error).assertEqual(2);
                expect(data).assertEqual(undefined);
                Bundle.isAbilityEnabled(ABILITY_ERROR5, (error, data) => {
                    expect(error).assertEqual(2);
                    expect(data).assertEqual(undefined);
                    Bundle.isAbilityEnabled(ABILITY_ERROR6, (error, data) => {
                        expect(error).assertEqual(2);
                        expect(data).assertEqual(undefined);
                        done();
                    });
                });
            });
        });

        /*
         * @tc.number: isAbilityEnabled_test_0400
         * @tc.name: isAbilityEnabled : Get whether to enable a specified ability
         * @tc.desc: Check the return value of the interface
         */
        it('isAbilityEnabled_test_0400', 0, async function (done) {
            await Bundle.isAbilityEnabled(OTHER_ABILITY).then((data) => {
                expect(data).assertTrue();
            }).catch((error) => {
                expect(error).assertFail();
            });
            Bundle.isAbilityEnabled(OTHER_ABILITY, (error, data) => {
                expect(error).assertEqual(0);
                expect(data).assertTrue();
                done();
            });
        });
    })
}