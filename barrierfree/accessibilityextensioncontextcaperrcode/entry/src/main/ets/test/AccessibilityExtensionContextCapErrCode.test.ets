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
import commonEvent from '@ohos.commonEvent'
import config from '@ohos.accessibility.config'

const passStr = 'pass';
const failStr = 'fail';

function publishCaseExecute(caseName: string) {
    let commonEventPublishData = {
        data: caseName
    }

    commonEvent.publish('caseExecute', commonEventPublishData, (err) => {
        console.info('caseExecute publish [' + caseName + '] callback result: ' + JSON.stringify(err));
    });
}

export default function abilityTest() {
    describe('AccessibilityExtensionContextCapErrCodeTest', function () {
        let subScriber = undefined;
        let isConnect = false;
        let caseResult = undefined;

        beforeAll(async function (done) {
            console.info('AccessibilityExtensionContextCapErrCodeTest: beforeAll');
            subScriber = await commonEvent.createSubscriber({events: ['onConnectState', 'caseResult']});
            commonEvent.subscribe(subScriber, (err, data) => {
                console.info('AccessibilityExtensionContextCapErrCodeTest beforeAll data:' + JSON.stringify(data) );
                if (data.data == 'connect') {
                    isConnect = true;
                } else if (data.data == 'disconnect') {
                    isConnect = false;
                } else if (data.data == passStr || data.data == failStr) {
                    caseResult = data;
                }
            });

            config.enableAbility('com.example.accessibilityxts/AccessibilityExtAbility',
                                    ["keyEventObserver"]
            ).then(() => {
                console.info(`AccessibilityExtensionContextCapErrCodeTest enableAbility: then`);
            }).catch((err) => {
                console.error(`AccessibilityExtensionContextCapErrCodeTest enableAbility has error: ${err.code}`);
            });

            setTimeout(done, 5000);
        })

        afterAll(async function (done) {
            console.info('AccessibilityExtensionContextCapErrCodeTest: afterAll');
            commonEvent.unsubscribe(subScriber);
            isConnect = false;
            config.disableAbility('com.example.accessibilityxts/AccessibilityExtAbility').then(() => {
                console.info(`AccessibilityExtensionContextCapErrCodeTest disableAbility: then`);
            }).catch((err) => {
                console.error(`AccessibilityExtensionContextCapErrCodeTest disableAbility has error: ${err.code}`);
            });
            setTimeout(done, 5000);
        })

        beforeEach(async function (done) {
            console.info('AccessibilityExtensionContextCapErrCodeTest: beforeEach');
            caseResult = undefined;
            done();
        })

        afterEach(async function (done) {
            console.info('AccessibilityExtensionContextCapErrCodeTest: afterEach');
            done();
        })

        /*
        * @tc.number  ActsAccessibilityExtensionContextCapErrCodeTest_getFocusElement_asyncCallback_0100
        * @tc.name    ActsAccessibilityExtensionContextCapErrCodeTest_getFocusElement_asyncCallback_0100
        * @tc.desc    No right accessibility so result of getFocusElement() should return errCode.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('ActsAccessibilityExtensionContextCapErrCodeTest_getFocusElement_asyncCallback_0100', 0, async function (done) {
            let caseName = 'ActsAccessibilityExtensionContextCapErrCodeTest_getFocusElement_asyncCallback_0100';
            console.info(caseName + 'start');

            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        console.info(caseName + ':' + caseResult.data);
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': caseResult is undefined');
                        expect(null).assertFail();
                    }
                    done();
                }, 5500);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
        * @tc.number  ActsAccessibilityExtensionContextCapErrCodeTest_getWindowRootElement_asyncCallback_0200
        * @tc.name    ActsAccessibilityExtensionContextCapErrCodeTest_getWindowRootElement_asyncCallback_0200
        * @tc.desc    No right accessibility so result of getWindowRootElement() should return errCode.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('ActsAccessibilityExtensionContextCapErrCodeTest_getWindowRootElement_asyncCallback_0200', 0, async function (done) {
            let caseName = 'ActsAccessibilityExtensionContextCapErrCodeTest_getWindowRootElement_asyncCallback_0200';
            console.info(caseName + 'start');

            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        console.info(caseName + ':' + caseResult.data);
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': caseResult is undefined');
                        expect(null).assertFail();
                    }
                    done();
                }, 5500);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
        * @tc.number  ActsAccessibilityExtensionContextCapErrCodeTest_getWindows_Callback_0300
        * @tc.name    ActsAccessibilityExtensionContextCapErrCodeTest_getWindows_Callback_0300
        * @tc.desc    No right accessibility so result of getWindows should return errCode.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('ActsAccessibilityExtensionContextCapErrCodeTest_getWindows_Callback_0300', 0, async function (done) {
            let caseName = 'ActsAccessibilityExtensionContextCapErrCodeTest_getWindows_Callback_0300';
            console.info(caseName + 'start');

            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        console.info(caseName + ':' + caseResult.data);
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': caseResult is undefined');
                        expect(null).assertFail();
                    }
                    done();
                }, 5500);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
        * @tc.number  ActsAccessibilityExtensionContextCapErrCodeTest_gestureInject_asyncCallback_0400
        * @tc.name    ActsAccessibilityExtensionContextCapErrCodeTest_gestureInject_asyncCallback_0400
        * @tc.desc    No right accessibility so result of injectGesture() should return errCode.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('ActsAccessibilityExtensionContextCapErrCodeTest_gestureInject_asyncCallback_0400', 0, async function(done) {
            let caseName = 'ActsAccessibilityExtensionContextCapErrCodeTest_gestureInject_asyncCallback_0400';
            console.info(caseName + 'start');

            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        console.info(caseName + ':' + caseResult.data);
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': caseResult is undefined');
                        expect(null).assertFail();
                    }
                    done();
                }, 3000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
        * @tc.number  ActsAccessibilityExtensionContextCapErrCodeTest_gestureInject_asyncCallback_0500
        * @tc.name    ActsAccessibilityExtensionContextCapErrCodeTest_gestureInject_asyncCallback_0500
        * @tc.desc    No right accessibility so result of injectGesture() should return errCode.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('ActsAccessibilityExtensionContextCapErrCodeTest_gestureInject_asyncCallback_0500', 0, async function (done) {
            let caseName = 'ActsAccessibilityExtensionContextCapErrCodeTest_gestureInject_asyncCallback_0500';
            console.info(caseName + 'start');

            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        console.info(caseName + ':' + caseResult.data);
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': caseResult is undefined');
                        expect(null).assertFail();
                    }
                    done();
                }, 3000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })
    })
}
