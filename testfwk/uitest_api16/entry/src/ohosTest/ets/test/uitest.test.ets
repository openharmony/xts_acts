/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'
import ability_featureAbility from '@ohos.ability.featureAbility';
import { BusinessError } from '@ohos.base';
import display from '@ohos.display';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator : AbilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName : string = abilityDelegatorRegistry.getArguments().bundleName;
const waitUiReadyMs : number = 1000;
const TestTag = 'UiTest_API16';
const DeviceErrorCode = 17000005;
const ErrorCode = 401;

async function startAbility(bundleName: string, abilityName: string) {
    await delegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`).then(result => {
        console.info(`UiTestCase, start abilityFinished: ${result}`)
    }).catch((err : BusinessError) => {
        console.error(`UiTestCase, start abilityFailed: ${err}`)
    })
}

async function stopApplication(bundleName: string) {
    await delegator.executeShellCommand(`aa force-stop ${bundleName} `).then(result => {
        console.info(`UiTestCase, stop application finished: ${result}`)
    }).catch((err : BusinessError) => {
        console.error(`UiTestCase,stop application failed: ${err}`)
    })
}

export default function UiTest() {
    describe('UiTest_API16', () => {
        beforeAll(async (done: Function) => {
            let driver = Driver.create()
            await driver.delayMs(1000)
            await driver.triggerKey(18)
            await driver.delayMs(1000)
            let defaultDisplay = display.getDefaultDisplaySync()
            if (defaultDisplay.state != display.DisplayState.STATE_ON) {
                await driver.wakeUpDisplay()
                await driver.delayMs(1000)
                await driver.swipe(300, 600, 300, 100)
                await driver.delayMs(1000)
            }
            done()
        })

        beforeEach(async () => {
            await stopApplication('com.uitestScene.acts');
        })

        /*
        * @tc.number: UiTest_API16_001
        * @tc.name: test_touchPadMultiFingerSwipe_Up_Down_3
        * @tc.desc: Swipe UP or Down with three point.
        */
        it('test_touchPadMultiFingerSwipe_Up_Down_3', 0, async () => {
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_Up_Down_3 start');
            let driver : Driver = Driver.create();
            try {
                await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
                await driver.delayMs(waitUiReadyMs);
                // 三指上划返回桌面。
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP);
                await driver.delayMs(waitUiReadyMs);
                let mainPageCom = await driver.findComponent(ON.text('MainPage'));
                await driver.delayMs(waitUiReadyMs);
                expect(mainPageCom).assertNull();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_Up_Down_3_Up, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                // 三指下划,应用返回前台
                await driver.touchPadMultiFingerSwipe(3, UiDirection.DOWN);
                await driver.delayMs(waitUiReadyMs);
                let mainPageCom = await driver.findComponent(ON.text('MainPage'));
                await driver.delayMs(waitUiReadyMs);
                expect(mainPageCom).not().assertNull();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_Up_Down_3_Down, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            }
            await driver.delayMs(waitUiReadyMs);
            await stopApplication('com.uitestScene.acts');
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_Up_Down_3 end');
        })

        /*
        * @tc.number: UiTest_API16_002
        * @tc.name: test_touchPadMultiFingerSwipe_Up_Down_Stay_3
        * @tc.desc: Swipe Up or Down with three point then  in more task statue
        */
        it('test_touchPadMultiFingerSwipe_Up_Down_Stay_3', 0, async () => {
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_Up_Down_Stay_3 start');
            let driver : Driver = Driver.create();
            try {
                await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
                await driver.delayMs(waitUiReadyMs);
                // 三指上划停留, 进入多任务中心。
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, {stay: true});
                let mainPageCom = await driver.findComponent(ON.text('MainPage'));
                await driver.delayMs(waitUiReadyMs);
                expect(mainPageCom).assertNull();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_Up_Down_Stay_3_Up, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                // 三指下划,应用返回前台。
                await driver.touchPadMultiFingerSwipe(3, UiDirection.DOWN);
                await driver.delayMs(waitUiReadyMs);
                let mainPageCom = await driver.findComponent(ON.text('MainPage'));
                await driver.delayMs(waitUiReadyMs);
                expect(mainPageCom).not().assertNull();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_Up_Down_Stay_3_Down, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            }
            await driver.delayMs(waitUiReadyMs);
            await stopApplication('com.uitestScene.acts');
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_Up_Down_Stay_3 end');
        })

        /*
        * @tc.number: UiTest_API16_003
        * @tc.name: test_touchPadMultiFingerSwipe_other
        * @tc.desc: Swipe Left, Swipe with four point
        */
        it('test_touchPadMultiFingerSwipe_other', 0, async () => {
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_other start');
            let driver : Driver = Driver.create();
            try {
                // 3指左划
                await driver.touchPadMultiFingerSwipe(3, UiDirection.LEFT);
                console.log(TestTag, `test_touchPadMultiFingerSwipe_other_left`);
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_other_left, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            }
            try {
                // 4指上划
                await driver.touchPadMultiFingerSwipe(4, UiDirection.UP);
                console.log(TestTag, `test_touchPadMultiFingerSwipe_other_4`);
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_other_4, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            }
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_other end');
        })

        /*
        * @tc.number: UiTest_API16_004
        * @tc.name: test_touchPadMultiFingerSwipe_fingers_verification_401
        * @tc.desc: finger params 401 test
        */
        it('test_touchPadMultiFingerSwipe_fingers_verification_401', 0, async () => {
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_fingers_verification_401 start');
            let driver : Driver = Driver.create();
            try {
                await driver.touchPadMultiFingerSwipe(null, UiDirection.UP);
                console.log(TestTag, `test_touchPadMultiFingerSwipe_fingers_verification_401_null`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_fingers_verification_401_null, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await driver.touchPadMultiFingerSwipe(undefined, UiDirection.UP);
                console.log(TestTag, `test_touchPadMultiFingerSwipe_fingers_verification_401_undefined`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_fingers_verification_401_undefined, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await driver.touchPadMultiFingerSwipe(2, UiDirection.UP);
                console.log(TestTag, `test_touchPadMultiFingerSwipe_fingers_verification_401_2`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_fingers_verification_401_2, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await driver.touchPadMultiFingerSwipe(5, UiDirection.UP);
                console.log(TestTag, `test_touchPadMultiFingerSwipe_fingers_verification_401_5`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_fingers_verification_401_5, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_fingers_verification_401 end');
        })

        /*
        * @tc.number: UiTest_API16_005
        * @tc.name: test_touchPadMultiFingerSwipe_direction_verification_401
        * @tc.desc: direction param 401 test
        */
        it('test_touchPadMultiFingerSwipe_direction_verification_401', 0, async () => {
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_direction_verification_401 start');
            let driver : Driver = Driver.create();
            try {
                await driver.touchPadMultiFingerSwipe(3, null);
                console.log(TestTag, `test_touchPadMultiFingerSwipe_direction_verification_401_null`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_direction_verification_401_null, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await driver.touchPadMultiFingerSwipe(3, undefined);
                console.log(TestTag, `test_touchPadMultiFingerSwipe_direction_verification_401_undefined`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_direction_verification_401_undefined, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await driver.touchPadMultiFingerSwipe(3, -1);
                console.log(TestTag, `test_touchPadMultiFingerSwipe_direction_verification_401_1`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_direction_verification_401_1, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await driver.touchPadMultiFingerSwipe(3, 4);
                console.log(TestTag, `test_touchPadMultiFingerSwipe_direction_verification_401_4`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_direction_verification_401_4, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_direction_verification_401 start');
        })

        /*
        * @tc.number: UiTest_API16_006
        * @tc.name: test_touchPadMultiFingerSwipe_option_verification_Up
        * @tc.desc: option param test
        */
        it('test_touchPadMultiFingerSwipe_option_verification_Up', 0, async () => {
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_option_verification_Up start');
            let driver : Driver = Driver.create();
            try {
                await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
                await driver.delayMs(waitUiReadyMs);
                // 三指上划返回桌面
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, null);
                await driver.delayMs(waitUiReadyMs);
                let mainPageCom = await driver.findComponent(ON.text('MainPage'));
                await driver.delayMs(waitUiReadyMs);
                expect(mainPageCom).assertNull();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_option_verification_Up_null, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {
                await stopApplication('com.uitestScene.acts');
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
                await driver.delayMs(waitUiReadyMs);
                // 三指上划返回桌面
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, undefined);
                await driver.delayMs(waitUiReadyMs);
                let mainPageCom = await driver.findComponent(ON.text('MainPage'));
                await driver.delayMs(waitUiReadyMs);
                expect(mainPageCom).assertNull();
                await stopApplication('com.uitestScene.acts');
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_option_verification_Up_undefined, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {
                await stopApplication('com.uitestScene.acts');
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
                await driver.delayMs(waitUiReadyMs);
                // 三指上划返回桌面
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, {});
                await driver.delayMs(waitUiReadyMs);
                let mainPageCom = await driver.findComponent(ON.text('MainPage'));
                await driver.delayMs(waitUiReadyMs);
                expect(mainPageCom).assertNull();
                await stopApplication('com.uitestScene.acts');
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_option_verification_Up_obj, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {
                await stopApplication('com.uitestScene.acts');
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
                await driver.delayMs(waitUiReadyMs);
                // 三指上划返回桌面
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, {stay: false});
                await driver.delayMs(waitUiReadyMs);
                let mainPageCom = await driver.findComponent(ON.text('MainPage'));
                await driver.delayMs(waitUiReadyMs);
                expect(mainPageCom).assertNull();
                await stopApplication('com.uitestScene.acts');
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_option_verification_Up_false, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {
                await stopApplication('com.uitestScene.acts');
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
                await driver.delayMs(waitUiReadyMs);
                // 三指上划返回桌面
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, {stay: undefined});
                await driver.delayMs(waitUiReadyMs);
                let mainPageCom = await driver.findComponent(ON.text('MainPage'));
                await driver.delayMs(waitUiReadyMs);
                expect(mainPageCom).assertNull();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_option_verification_Up_stay_undefined, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {
                await stopApplication('com.uitestScene.acts');
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, {stay: null});
                let mainPageCom = await driver.findComponent(ON.text('MainPage'));
                await driver.delayMs(waitUiReadyMs);
                expect(mainPageCom).assertNull();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_option_verification_Up_stay_null, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {
                await stopApplication('com.uitestScene.acts');
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, {speed: null});
                let mainPageCom = await driver.findComponent(ON.text('MainPage'));
                await driver.delayMs(waitUiReadyMs);
                expect(mainPageCom).assertNull();
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_option_verification_Up_speed_null, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            }
            await driver.delayMs(waitUiReadyMs);
            try {
                await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
                await driver.delayMs(waitUiReadyMs);
                // 三指上划返回桌面
                await driver.touchPadMultiFingerSwipe(3, UiDirection.UP, {speed: 200});
                await driver.delayMs(waitUiReadyMs);
                let mainPageCom = await driver.findComponent(ON.text('MainPage'));
                await driver.delayMs(waitUiReadyMs);
                expect(mainPageCom).assertNull();
                await stopApplication('com.uitestScene.acts');
            } catch (error) {
                console.log(TestTag, `test_touchPadMultiFingerSwipe_option_verification_Up_speed_200, error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {
                await stopApplication('com.uitestScene.acts');
            }
            await driver.delayMs(waitUiReadyMs);
            console.log(TestTag, 'test_touchPadMultiFingerSwipe_option_verification_Up end');
        })


        /*
        * @tc.number: UiTest_API16_07
        * @tc.name: test_penClick_function
        * @tc.desc: penClick function test
        */
        it('test_penClick_function', 0, async () => {
            console.log(TestTag, 'test_penClick_function start');
            let driver : Driver = Driver.create();
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs);
            let btnCom = await driver.findComponent(ON.text('next page'));
            expect(btnCom).not().assertNull();
            await driver.delayMs(waitUiReadyMs);
            let btnPoint = await btnCom.getBoundsCenter();
            try {
                await driver.penClick(btnPoint);
                await driver.delayMs(waitUiReadyMs);
                let strCom = await driver.findComponent(ON.text('back to index'));
                await driver.delayMs(waitUiReadyMs);
                let strText = await strCom.getText();
                expect(strText).assertEqual('back to index');
                await driver.delayMs(waitUiReadyMs);
                await strCom.click();
                await driver.delayMs(waitUiReadyMs);
            } catch (error) {
                console.log(TestTag, `test_penClick_function error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {

                await stopApplication('com.uitestScene.acts');
            }
            console.log(TestTag, 'test_penClick_function end');
        })

        /*
        * @tc.number: UiTest_API16_08
        * @tc.name: test_penClick_function_401
        * @tc.desc: penClick param 401 test
        */
        it('test_penClick_function_401', 0, async () =>{
            console.log(TestTag, 'test_penClick_function_401 start');
            let driver : Driver = Driver.create();
            try {
                await driver.penClick(null);
                console.log(TestTag, `test_penClick_function_401_null`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penClick_function_401_null error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            try {
                await driver.penClick(undefined);
                console.log(TestTag, `test_penClick_function_401_undefined`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penClick_function_401_undefined error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            try {
                await driver.penClick({x: -1, y: 100});
                console.log(TestTag, `test_penClick_function_401_x`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penClick_function_401_x error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            try {
                await driver.penClick({x: 100, y: -1});
                console.log(TestTag, `test_penClick_function_401_y`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penClick_function_401_y error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            console.log(TestTag, 'test_penClick_function_401 end');
        })

        /*
        * @tc.number: UiTest_API16_09
        * @tc.name: test_penLongClick_function
        * @tc.desc: penLongClick function test
        */
        it('test_penLongClick_function', 0, async () =>{
            console.log(TestTag, 'test_penLongClick_function start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('next page'))
            let btnPoint = await button.getBoundsCenter();
            try {
                await driver.penLongClick(btnPoint);
                await driver.delayMs(waitUiReadyMs)
                let newButton = await driver.findComponent(ON.text('longClick'))
                let text = await newButton.getText()
                expect(text == 'longClick').assertTrue()
                await newButton.click()
                await driver.delayMs(waitUiReadyMs);
            } catch (error) {
                console.log(TestTag, `test_penLongClick_function error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {
                await stopApplication('com.uitestScene.acts');
            }
            console.log(TestTag, 'test_penLongClick_function end');
        })

        /*
        * @tc.number: UiTest_API16_010
        * @tc.name: test_penLongClick_function_401
        * @tc.desc: penLongClick param 401 test
        */
        it('test_penLongClick_function_401', 0, async () =>{
            console.log(TestTag, 'test_penLongClick_function_401 start');
            let driver : Driver = Driver.create();
            try {
                await driver.penLongClick(null);
                console.log(TestTag, `test_penLongClick_function_401_null`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penLongClick_function_401_null error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            try {
                await driver.penLongClick(undefined);
                console.log(TestTag, `test_penLongClick_function_401_undefined`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penLongClick_function_401_undefined is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            try {
                await driver.penLongClick({x: -1, y: 100});
                console.log(TestTag, `test_penLongClick_function_401_x`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penLongClick_function_401_x is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            try {
                await driver.penLongClick({x: 100, y: -1});
                console.log(TestTag, `test_penLongClick_function_401_y`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penLongClick_function_401_y is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            console.log(TestTag, 'test_penLongClick_function_401 end');
        })

        /*
        * @tc.number: UiTest_API16_011
        * @tc.name: test_penDoubleClick_function
        * @tc.desc: penDoubleClick function test
        */
        it('test_penDoubleClick_function', 0, async () => {
            console.log(TestTag, 'test_penDoubleClick_function start');
            let driver : Driver = Driver.create();
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            await driver.delayMs(waitUiReadyMs);
            let btnCom = await driver.findComponent(ON.text('Click twice'))
            if (btnCom == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                btnCom = await scorll.scrollSearch(ON.text('Click twice'))
            }
            expect(btnCom).not().assertNull();
            await driver.delayMs(waitUiReadyMs);
            let btnPoint = await btnCom.getBoundsCenter();
            try {
                await driver.penDoubleClick(btnPoint);
                let newButton = await driver.findComponent(ON.text('doubleClick'))
                let text = await newButton.getText()
                expect(text == 'doubleClick').assertTrue()
                await newButton.click()
                await driver.delayMs(waitUiReadyMs);
            } catch (error) {
                console.log(TestTag, `test_penDoubleClick_function error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {
                await stopApplication('com.uitestScene.acts');
            }
            console.log(TestTag, 'test_penDoubleClick_function end');
        })

        /*
        * @tc.number: UiTest_API16_012
        * @tc.name: test_penDoubleClick_function_401
        * @tc.desc: penLongClick param 401 test
        */
        it('test_penDoubleClick_function_401', 0, async () =>{
            console.log(TestTag, 'test_penDoubleClick_function_401 start');
            let driver : Driver = Driver.create();
            try {
                await driver.penDoubleClick(null);
                console.log(TestTag, `test_penDoubleClick_function_401`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penDoubleClick_function_401_null error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            try {
                await driver.penDoubleClick(undefined);
                console.log(TestTag, `test_penDoubleClick_function_401_undefined`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penDoubleClick_function_401_undefined is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            try {
                await driver.penDoubleClick({x: -1, y: 100});
                console.log(TestTag, `test_penDoubleClick_function_401_x`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penDoubleClick_function_401_x is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            try {
                await driver.penDoubleClick({x: 100, y: -1});
                console.log(TestTag, `test_penDoubleClick_function_401_y`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penDoubleClick_function_401_y is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            console.log(TestTag, 'test_penDoubleClick_function_401 end ');
        })

        /*
        * @tc.number: UiTest_API16_013
        * @tc.name: test_penSwipe_function
        * @tc.desc: penSwipe function test
        */
        it('test_penSwipe_function', 0, async () =>{
            console.log(TestTag, 'test_penSwipe_function start');
            let driver : Driver = Driver.create();
            await driver.delayMs(waitUiReadyMs);
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            await driver.delayMs(waitUiReadyMs);
            try {
                // 垂直滑动
                await driver.delayMs(waitUiReadyMs);
                let scroll = await driver.findComponent(ON.type('Scroll'))
                let scrollRect = await scroll.getBounds()
                let screenWidth = scrollRect.right - scrollRect.left;
                let screenHeight = scrollRect.bottom - scrollRect.top;
                console.log(TestTag, 'screenWidth:' + screenWidth + ', screenHeight:' +screenHeight);
                await driver.penSwipe({x: Math.floor(screenWidth / 2), y: Math.floor(screenHeight / 2 + screenHeight / 4)},
                    {x: Math.floor(screenWidth / 2), y: Math.floor(screenHeight / 2 - screenHeight / 4) },600, 0.5);
                await driver.delayMs(waitUiReadyMs);
                let text = await driver.findComponent(ON.text('toast'));
                await driver.delayMs(waitUiReadyMs);
                expect(text == null).assertTrue();
                await driver.delayMs(waitUiReadyMs);
                let pressureCom = await driver.findComponent(ON.id('pressure'));
                await driver.delayMs(waitUiReadyMs);
                let pressure = await pressureCom.getText();
                await driver.delayMs(waitUiReadyMs);
                expect(pressure).assertEqual('0.5');
                let scrollBar = await driver.findComponent(ON.type('Scroll'));
                await driver.delayMs(waitUiReadyMs);
                await scrollBar.scrollToTop();
                await driver.delayMs(waitUiReadyMs);
            } catch (error) {
                console.log(TestTag, `test_penSwipe_function error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {
                await stopApplication('com.uitestScene.acts');
            }
            console.log(TestTag, 'test_penSwipe_function end');
        })

        /*
        * @tc.number: UiTest_API16_014
        * @tc.name: test_penSwipe_function_401
        * @tc.desc: penSwipe param 401  test
        */
        it('test_penSwipe_function_401', 0, async () =>{
            console.log(TestTag, 'test_penSwipe_function_401 start');
            let driver : Driver = Driver.create();
            try {
                await driver.penSwipe(null, {x: 100, y: 100});
                console.log(TestTag, `test_penSwipe_function_401_startPoint_null`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penSwipe_function_401_startPoint_null is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            try {
                await driver.penSwipe({x: 100, y: 100}, null);
                console.log(TestTag, `test_penSwipe_function_401_endPoint_null`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penSwipe_function_401_endPoint_null is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                await driver.penSwipe({x: -1, y: 100}, {x: 100, y: 500});
                console.log(TestTag, `test_penSwipe_function_401_startPoint_x`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penSwipe_function_401_endPointPoint_x is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                await driver.penSwipe({x: 100, y: -1}, {x: 100, y: 500});
                console.log(TestTag, `test_penSwipe_function_401_startPoint_y`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penSwipe_function_401_startPoint_y is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                await driver.penSwipe({x: 100, y: 100}, {x: 100, y: 500}, 600, -0.1);
                console.log(TestTag, `test_penSwipe_function_401_pressure_l`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penSwipe_function_401_pressure_l is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                await driver.penSwipe({x: 100, y: 100}, {x: 100, y: 500}, 600, 1.1);
                console.log(TestTag, `test_penSwipe_function_401_pressure_r`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_penSwipe_function_401_pressure_r is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }
            console.log(TestTag, 'test_penSwipe_function_401 end');
        })

        /*
        * @tc.number: UiTest_API16_015
        * @tc.name: test_injectPenPointAction_function
        * @tc.desc: injectPenPointAction function test
        */
        it('test_injectPenPointAction_function', 0, async () => {
            console.log(TestTag, `test_injectPenPointAction_function start`);
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let scroll = await driver.findComponent(ON.type('Scroll'))
            let scrollRect = await scroll.getBounds()
            let screenWidth = scrollRect.right - scrollRect.left;
            let screenHeight = scrollRect.bottom - scrollRect.top;
            console.log(TestTag, 'screenWidth:' + screenWidth + ', screenHeight:' +screenHeight);
            let pointer = PointerMatrix.create(1,8);
            let stepLength = Math.floor((screenHeight / 4) * 2 / 8);
            console.log(TestTag, `stepLength is, ${stepLength}`);
            let startX = Math.floor(screenWidth / 2);
            for (let step = 0; step < 8; step++) {
                let startY = Math.floor((screenHeight / 2 + screenHeight / 4) - stepLength * step);
                console.log(TestTag, `startX is, ${startX}, startY is, ${ startY }`);
                pointer.setPoint(0, step, {x: startX, y: startY });
            }
            try {
                await driver.injectPenPointerAction(pointer, 600, 0.5);
                await driver.delayMs(waitUiReadyMs * 2);
                let text = await driver.findComponent(ON.text('toast'));
                expect(text == null).assertTrue();
                await driver.delayMs(waitUiReadyMs);
                let pressureCom = await driver.findComponent(ON.id('pressure'));
                await driver.delayMs(waitUiReadyMs);
                let pressure = await pressureCom.getText();
                await driver.delayMs(waitUiReadyMs);
                expect(pressure).assertEqual('0.5');
                await driver.delayMs(waitUiReadyMs);
                let scrollBar = await driver.findComponent(ON.type('Scroll'));
                await driver.delayMs(waitUiReadyMs);
                await scrollBar.scrollToTop();
                await driver.delayMs(waitUiReadyMs);
            } catch (error) {
                console.log(TestTag, `test_injectPenPointAction_function error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(DeviceErrorCode);
            } finally {
                await stopApplication('com.uitestScene.acts')
            }
            console.log(TestTag, `test_injectPenPointAction_function end`);
        })

        /*
        * @tc.number: UiTest_API16_016
        * @tc.name: test_injectPenPointAction_function_401
        * @tc.desc: injectPenPointAction param 401 test
        */
        it('test_injectPenPointAction_function_401', 0, async () =>{
            console.log(TestTag, 'test_injectPenPointAction_function_401 start');
            let driver = Driver.create()
            try {
                await driver.injectPenPointerAction(null);
                console.log(TestTag, `test_injectPenPointAction_function_401_null`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_injectPenPointAction_function_401_null error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                await driver.injectPenPointerAction(undefined);
                console.log(TestTag, `test_injectPenPointAction_function_401_undefined`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_injectPenPointAction_function_401_undefined error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                let points = PointerMatrix.create(0, 2);
                await driver.injectPenPointerAction(points);
                console.log(TestTag, `test_injectPenPointAction_function_401_fingers_0`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_injectPenPointAction_function_401_fingers_0 error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                let points = PointerMatrix.create(2, 2);
                await driver.injectPenPointerAction(points);
                console.log(TestTag, `test_injectPenPointAction_function_401_fingers_2`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_injectPenPointAction_function_401_fingers_2 error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                let points = PointerMatrix.create(1, 0);
                await driver.injectPenPointerAction(points);
                console.log(TestTag, `test_injectPenPointAction_function_401_step_0`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_injectPenPointAction_function_401_step_0 error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                let points = PointerMatrix.create(1, 1001);
                await driver.injectPenPointerAction(points);
                console.log(TestTag, `test_injectPenPointAction_function_401_step_1001`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_injectPenPointAction_function_401_step_1001 error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                let points = PointerMatrix.create(1, 2);
                points.setPoint(0, 1, {x:100, y:100});
                points.setPoint(0, 2, {x:100, y:150})
                await driver.injectPenPointerAction(points, 600, -0.1);
                console.log(TestTag, `test_injectPenPointAction_function_401_pressure_l`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_injectPenPointAction_function_401_pressure_l error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

            try {
                let points = PointerMatrix.create(1, 2);
                points.setPoint(0, 1, {x:100, y:100});
                points.setPoint(0, 2, {x:100, y:150})
                await driver.injectPenPointerAction(points, 600, 1.1);
                console.log(TestTag, `test_injectPenPointAction_function_401_pressure_r`);
                expect().assertFail();
            } catch (error) {
                console.log(TestTag, `test_injectPenPointAction_function_401_pressure_r error is, ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(ErrorCode);
            }

        })

        /*
        * @tc.number: UiTest_API16_017
        * @tc.name: testScrollSearchVertical
        * @tc.desc: scroll vertically on this UiComponent to find matched UiComponent.
        */
        it('testScrollSearchVertical', 0, async () => {
            console.log(TestTag, 'testScrollSearchVertical start');
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
            let driver = Driver.create()
            await driver.delayMs(waitUiReadyMs)
            let button = await driver.findComponent(ON.text('scroll'))
            if (button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                button = await scorll.scrollSearch(ON.text('scroll'))
            }
            await driver.delayMs(waitUiReadyMs)
            await button.click()
            await driver.delayMs(waitUiReadyMs)
            let scrollBar = await driver.findComponent(ON.id('verticalScroll'))
            await driver.delayMs(waitUiReadyMs)
            let text1 = await scrollBar.scrollSearch(ON.text('11'), true, 80);
            await driver.delayMs(waitUiReadyMs)
            expect(text1 == null).assertTrue()
            await driver.delayMs(waitUiReadyMs)
            let text2 = await scrollBar.scrollSearch(ON.text('2'), null, null);
            let text2Msg = await text2.getText();
            console.log(TestTag, `testScrollSearchVertical 2 is , ${ text2Msg }`);
            await driver.delayMs(waitUiReadyMs)
            expect(await text2.getText()).assertEqual('2')
            await driver.delayMs(waitUiReadyMs)
            let text3 = await scrollBar.scrollSearch(ON.text('8'), undefined, undefined);
            await driver.delayMs(waitUiReadyMs);
            let text3Msg = await text3.getText();
            console.log(TestTag, `testScrollSearchVertical 2 is , ${ text3Msg }`);
            expect(await text3.getText()).assertEqual('8')
            await driver.delayMs(waitUiReadyMs)
            await stopApplication('com.uitestScene.acts');
            console.log(TestTag, 'testScrollSearchVertical end');
        })

        /*
        * @tc.number: UiTest_API16_018
        * @tc.name: testScrollSearchHorizontal
        * @tc.desc: scroll horizontally on this UiComponent to find matched UiComponent.
        */
        it('testScrollSearchHorizontal', 0, async () => {
            console.log(TestTag, 'testScrollSearchHorizontal start');
            let driver = Driver.create();
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            await driver.delayMs(waitUiReadyMs);
            await driver.triggerKey(18)
            await driver.delayMs(waitUiReadyMs);
            let defaultDisplay = display.getDefaultDisplaySync()
            if (defaultDisplay.state == display.DisplayState.STATE_ON) {
                return
            } else {
                await driver.wakeUpDisplay()
                await driver.delayMs(waitUiReadyMs)
                await driver.swipe(300, 600, 300, 100)
                await driver.delayMs(waitUiReadyMs)
            }
            let button = await driver.findComponent(ON.text('scroll'))
            await driver.delayMs(waitUiReadyMs);
            await button.click();
            await driver.delayMs(waitUiReadyMs);
            let scrollBar = await driver.findComponent(ON.id('horizontalScroll'));
            await driver.delayMs(waitUiReadyMs);
            let text1 = await scrollBar.scrollSearch(ON.text('8'), false);
            await driver.delayMs(waitUiReadyMs);
            expect(text1 == null).assertTrue();
            await driver.delayMs(waitUiReadyMs);
            let text2 = await scrollBar.scrollSearch(ON.text('11'), false, 200);
            await driver.delayMs(waitUiReadyMs);
            expect(text2 == null).assertTrue();
            await driver.delayMs(waitUiReadyMs);
            let text3 = await scrollBar.scrollSearch(ON.text('2'), false, 200);
            await driver.delayMs(waitUiReadyMs);
            expect(await text3.getText()).assertEqual('2');
            await driver.delayMs(waitUiReadyMs);
            let text4 = await scrollBar.scrollSearch(ON.text('8'), false, 200);
            await driver.delayMs(waitUiReadyMs);
            expect(await text4.getText()).assertEqual('8');
            await driver.delayMs(waitUiReadyMs);
            console.log(TestTag, 'testScrollSearchHorizontal end');
            await stopApplication('com.uitestScene.acts');
        })

        /*
        * @tc.number: UiTest_API16_019
        * @tc.name: testScrollSearchHorizontal_401
        * @tc.desc: param 401 test.
        */
        it('testScrollSearchHorizontal_401', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            let driver = Driver.create();
            await driver.delayMs(waitUiReadyMs);
            let button = await driver.findComponent(ON.text('scroll'));
            if (button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                button = await scorll.scrollSearch(ON.text('scroll'))
            }
            await driver.delayMs(waitUiReadyMs);
            await button.click();
            await driver.delayMs(waitUiReadyMs);
            let scrollBar = await driver.findComponent(ON.id('verticalScroll'));
            try {
                let text1 = await scrollBar.scrollSearch(null);
                expect(false).assertTrue();
            } catch (error) {
                let err = error as BusinessError;
                expect(err.code).assertEqual(401);
            }
            try {
                let text2 = await scrollBar.scrollSearch(undefined);
                expect(false).assertTrue();
            } catch (error) {
                let err = error as BusinessError;
                expect(err.code).assertEqual(401);
            }
            try {
                let text3 = await scrollBar.scrollSearch(ON.text('8'), true, -1);
                expect(false).assertTrue();
            } catch (error) {
                let err = error as BusinessError;
                expect(err.code).assertEqual(401);
            }
            try {
                let rect = await scrollBar.getBounds();
                let text4 = await scrollBar.scrollSearch(ON.text('8'), true, (rect.bottom + rect.top) / 2);
                expect(false).assertTrue();
            } catch (error) {
                let err = error as BusinessError;
                expect(err.code).assertEqual(401);
            }
            await driver.delayMs(waitUiReadyMs);
            await stopApplication('com.uitestScene.acts');
        })

        /*
        * @tc.number: UiTest_API16_020
        * @tc.name: testMatchPatternIcase
        * @tc.desc: find button component by Regular Expression ignore icase，and doubleClick button by mouse.
        */
        it('testMatchPatternIcase', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            let driver : Driver = Driver.create();
            await driver.delayMs(waitUiReadyMs);
            let Button = await driver.findComponent(ON.text('click twice', MatchPattern.REG_EXP_ICASE));
            if (Button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                Button = await scorll.scrollSearch(ON.text('Click twice'))
            }
            await driver.delayMs(waitUiReadyMs);
            let center = await Button.getBoundsCenter();
            await driver.delayMs(waitUiReadyMs);
            await driver.mouseDoubleClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 0);
            await driver.delayMs(waitUiReadyMs);
            let button = await driver.findComponent(ON.text('doublec\\w{2,4}', MatchPattern.REG_EXP_ICASE));
            await driver.delayMs(waitUiReadyMs);
            let text = await button.getText();
            await driver.delayMs(waitUiReadyMs);
            expect(text == 'doubleClick').assertTrue();
            await stopApplication('com.uitestScene.acts');
        })

        /*
        * @tc.number: UiTest_API16_021
        * @tc.name: testMatchPatternRegExp
        * @tc.desc: find button component by Regular Expression, and longClick button by mouse.
        */
        it('testMatchPatternRegExp', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            let driver = Driver.create();
            await driver.delayMs(waitUiReadyMs);
            let btn = await driver.findComponent(ON.text('next \\w{2,6}', MatchPattern.REG_EXP));
            if (btn == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                btn = await scorll.scrollSearch(ON.text('next \\w{2,6}', MatchPattern.REG_EXP))
            }
            await driver.delayMs(waitUiReadyMs);
            let center = await btn.getBoundsCenter();
            await driver.delayMs(waitUiReadyMs);
            await driver.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 0);
            await driver.delayMs(waitUiReadyMs);
            let newButton = await driver.findComponent(ON.text('longClick'));
            await driver.delayMs(waitUiReadyMs);
            let text = await newButton.getText();
            await driver.delayMs(waitUiReadyMs);
            expect(text == 'longClick').assertTrue();
            await stopApplication('com.uitestScene.acts');
        })

        /*
        * @tc.number: UiTest_API16_022
        * @tc.name: testGetHint
        * @tc.desc: find button component by Regular Expression, and get Hint of the component.
        */
        it('testGetHint', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            let driver = Driver.create();
            await driver.delayMs(waitUiReadyMs);
            let button = await driver.findComponent(ON.hint('welcome', MatchPattern.REG_EXP));
            if (button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                button = await scorll.scrollSearch(ON.hint('welcome', MatchPattern.REG_EXP))
            }
            await driver.delayMs(waitUiReadyMs);
            let hint = await button.getHint();
            await driver.delayMs(waitUiReadyMs);
            expect(hint == 'welcome').assertTrue();
            await stopApplication('com.uitestScene.acts');
        })

        /*
        * @tc.number: UiTest_API16_023
        * @tc.name: testGetHint1
        * @tc.desc: find button component by Hint.
        */
        it('testGetHint1', 0, async () => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            let driver = Driver.create();
            await driver.delayMs(waitUiReadyMs);
            let button = await driver.findComponent(ON.text('Hello \\w{3,6}', MatchPattern.REG_EXP));
            if (button == null) {
                let scorll = await driver.findComponent(ON.type('Scroll'))
                button = await scorll.scrollSearch(ON.text('Hello \\w{3,6}', MatchPattern.REG_EXP))
            }
            await driver.delayMs(waitUiReadyMs);
            let hint = await button.getHint();
            await driver.delayMs(waitUiReadyMs);
            expect(hint == 'welcome').assertTrue();
            await stopApplication('com.uitestScene.acts');
        })
    })
}
