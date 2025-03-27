/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permission and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import screenLockFileManager from '@ohos.ability.screenLockFileManager';

export default function ScreenLockFileManagerJsTest() {
    describe("ScreenLockFileManagerJsTest", function () {
        beforeAll(function () {

            /*
             * @tc.setup: setup invoked before all testcases
             */
            console.info('beforeAll called')
        })

        afterAll(function () {

            /*
             * @tc.teardown: teardown invoked after all testcases
             */
            console.info('afterAll called')
        })

        beforeEach(function () {

            /*
             * @tc.setup: setup invoked before each testcases
             */
            console.info('beforeEach called')
        })

        afterEach(function () {

            /*
             * @tc.teardown: teardown invoked after each testcases
             */
            console.info('afterEach caled')
        })

        /*
         * @tc.number:SUB_SECURITY_SCREEN_LOCK_XTS_001
         * @tc.name: AcquireAccessJsTest001
         * @tc.desc: screenLockFileManager acquireAccess AccessStatus.
         * @tc.level: Level3
         * @tc.size: MediumTest
         * @tc.type: Function
         */
        it("AcquireAccessJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            try {
                let AccessStatus = screenLockFileManager.acquireAccess();
                console.info('AcquireAccessJsTest001 AccessStatus is: ' + AccessStatus);
                expect(true).assertTrue();
                done();
            } catch (err) {
                if (err.code == 801) {
                    done();
                } else {
                    console.info('AcquireAccessJsTest001 err.code is: ' + err.code)
                    expect(err.code).assertEqual(29300003);
                    done();
                }
            }
        })

        /*
         * @tc.number:SUB_SECURITY_SCREEN_LOCK_XTS_002
         * @tc.name: AcquireAccessJsTest002
         * @tc.desc: acquireAccess AccessStatus ACCESS_DENIED
         * @tc.level: Level1
         * @tc.size: MediumTest
         * @tc.type: Function
         */
        it("AcquireAccessJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function (done) {
            console.info('----------------------AcquireAccessJsTest002---------------------------');
            let value = screenLockFileManager.AccessStatus.ACCESS_DENIED;
            expect(value).assertEqual(-1);
            done();
        })

        /*
         * @tc.number:SUB_SECURITY_SCREEN_LOCK_XTS_003
         * @tc.name: AcquireAccessJsTest003
         * @tc.desc: acquireAccess AccessStatus ACCESS_GRANTED
         * @tc.level: Level1
         * @tc.size: MediumTest
         * @tc.type: Function
         */
        it("AcquireAccessJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function (done) {
            console.info('----------------------AcquireAccessJsTest003---------------------------');
            let value = screenLockFileManager.AccessStatus.ACCESS_GRANTED;
            expect(value).assertEqual(0);
            done();
        })

        /*
         * @tc.number:SUB_SECURITY_SCREEN_LOCK_XTS_004
         * @tc.name: ReleaseAccessJsTest001
         * @tc.desc: screenLockFileManager releaseAccess ReleaseStatus.
         * @tc.level: Level3
         * @tc.size: MediumTest
         * @tc.type: Function
         */
        it("ReleaseAccessJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            try {
                let ReleaseStatus = screenLockFileManager.releaseAccess();
                console.info('ReleaseAccessJsTest001 ReleaseStatus is: ' + ReleaseStatus);
                expect(true).assertTrue();
                done();
            } catch (err) {
                if (err.code == 801) {
                    done();
                } else {
                    console.info('ReleaseAccessJsTest001 err.code is: ' + err.code)
                    expect(err.code).assertEqual(29300003);
                    done();
                }
            }
        })

        /*
         * @tc.number:SUB_SECURITY_SCREEN_LOCK_XTS_005
         * @tc.name: ReleaseAccessJsTest002
         * @tc.desc: acquireAccess ReleaseStatus RELEASE_DENIED
         * @tc.level: Level1
         * @tc.size: MediumTest
         * @tc.type: Function
         */
        it("ReleaseAccessJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function (done) {
            console.info('----------------------ReleaseAccessJsTest002---------------------------');
            let value = screenLockFileManager.ReleaseStatus.RELEASE_DENIED;
            expect(value).assertEqual(-1);
            done();
        })

        /*
         * @tc.number:SUB_SECURITY_SCREEN_LOCK_XTS_006
         * @tc.name: ReleaseAccessJsTest003
         * @tc.desc: acquireAccess ReleaseStatus RELEASE_GRANTED
         * @tc.level: Level1
         * @tc.size: MediumTest
         * @tc.type: Function
         */
        it("ReleaseAccessJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function (done) {
            console.info('----------------------ReleaseAccessJsTest003---------------------------');
            let value = screenLockFileManager.ReleaseStatus.RELEASE_GRANTED;
            expect(value).assertEqual(0);
            done();
        })

        /*
         * @tc.number:SUB_SECURITY_SCREEN_LOCK_XTS_007
         * @tc.name: AcquireAccessJsTest004
         * @tc.desc: acquireAccess DataType MEDIA_DATA
         * @tc.level: Level3
         * @tc.size: MediumTest
         * @tc.type: Function
         */
        it("AcquireAccessJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
            console.info('----------------------AcquireAccessJsTest004---------------------------');
            let value = screenLockFileManager.DataType.MEDIA_DATA;
            console.info('AcquireAccessJsTest004 value is: ' + value);
            expect(value).assertEqual(1);
            done();
        })

        /*
         * @tc.number:SUB_SECURITY_SCREEN_LOCK_XTS_008
         * @tc.name: AcquireAccessJsTest005
         * @tc.desc: acquireAccess DataType ALL_DATA
         * @tc.level: Level3
         * @tc.size: MediumTest
         * @tc.type: Function
         */
        it("AcquireAccessJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
            console.info('----------------------AcquireAccessJsTest005---------------------------');
            let value = screenLockFileManager.DataType.ALL_DATA;
            console.info('AcquireAccessJsTest005 value is: ' + value);
            expect(value).assertEqual(-1);
            done();
        })

        /*
         * @tc.number:SUB_Security_EL5_QueryAppKeyState_0100
         * @tc.name: Test EL5 queryAppKeyState scene
         * @tc.desc: Query access permissions for sensitive data of applications under lock screen
         * @tc.level: Level3
         * @tc.size: MediumTest
         * @tc.type: Function
         */
        it("SUB_Security_EL5_QueryAppKeyState_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            try {
                let keyStatus = screenLockFileManager.queryAppKeyState();
                console.info('SUB_Security_EL5_QueryAppKeyState_0100 keyStatus is: ' + keyStatus);
                expect(keyStatus).assertEqual(-2);
                done();
            } catch (err) {
                if (err.code == 801) {
                    done();
                }
                console.error('SUB_Security_EL5_QueryAppKeyState_0100 err.code is: ' + err.code);
            }
        })

        /*
         * @tc.number:SUB_Security_EL5_KeyStatusConst_0100
         * @tc.name: Test EL5 KeyStatus Const Attribute
         * @tc.desc: Test screenLockFileManager KeyStatus const KEY_NOT_EXIST
         * @tc.level: Level1
         * @tc.size: MediumTest
         * @tc.type: Function
         */
        it("SUB_Security_EL5_KeyStatusConst_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function (done) {
            console.info('----------------------SUB_Security_EL5_KeyStatusConst_0100---------------------------');
            let value = screenLockFileManager.KeyStatus.KEY_NOT_EXIST;
            console.info('SUB_Security_EL5_KeyStatusConst_0100 value is: ' + value);
            expect(value).assertEqual(-2);
            done();
        })

        /*
         * @tc.number:SUB_Security_EL5_KeyStatusConst_0200
         * @tc.name: Test EL5 KeyStatus Const Attribute
         * @tc.desc: Test screenLockFileManager KeyStatus const KEY_RELEASED
         * @tc.level: Level1
         * @tc.size: MediumTest
         * @tc.type: Function
         */
        it("SUB_Security_EL5_KeyStatusConst_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function (done) {
            console.info('----------------------SUB_Security_EL5_KeyStatusConst_0200---------------------------');
            let value = screenLockFileManager.KeyStatus.KEY_RELEASED;
            console.info('SUB_Security_EL5_KeyStatusConst_0200 value is: ' + value);
            expect(value).assertEqual(-1);
            done();
        })

        /*
         * @tc.number:SUB_Security_EL5_KeyStatusConst_0300
         * @tc.name: Test EL5 KeyStatus Const Attribute
         * @tc.desc: Test screenLockFileManager KeyStatus const KEY_EXIST
         * @tc.level: Level1
         * @tc.size: MediumTest
         * @tc.type: Function
         */
        it("SUB_Security_EL5_KeyStatusConst_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function (done) {
            console.info('----------------------SUB_Security_EL5_KeyStatusConst_0300---------------------------');
            let value = screenLockFileManager.KeyStatus.KEY_EXIST;
            console.info('SUB_Security_EL5_KeyStatusConst_0300 value is: ' + value);
            expect(value).assertEqual(0);
            done();
        })
    })
}