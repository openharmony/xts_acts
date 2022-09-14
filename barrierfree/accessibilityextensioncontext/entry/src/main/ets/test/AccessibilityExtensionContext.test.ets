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
    describe('AccessibilityExtensionContextTest', function () {
        let subScriber = undefined;
        let isConnect = false;
        let caseResult = undefined;

        beforeAll(async function (done) {
            console.info('AccessibilityExtensionContextTest: beforeAll');
            subScriber = await commonEvent.createSubscriber({events: ['onConnectState', 'caseResult']});
            commonEvent.subscribe(subScriber, (err, data) => {
                console.info('AccessibilityExtensionContextTest beforeAll data:' + JSON.stringify(data) );
                if (data.data == 'connect') {
                    isConnect = true;
                } else if (data.data == 'disconnect') {
                    isConnect = false;
                } else if (data.data == passStr || data.data == failStr) {
                    caseResult = data;
                }
            });

            config.enableAbility('com.example.accessibilityxts/AccessibilityExtAbility',
                                    ["retrieve", "touchGuide", "gesture"]
            ).then(() => {
                console.info(`AccessibilityExtensionContextTest enableAbility: then`);
            }).catch((err) => {
                console.error(`AccessibilityExtensionContextTest enableAbility has error: ${err.code}`);
            });

            setTimeout(done, 5000);
        })

        afterAll(async function (done) {
            console.info('AccessibilityElementTest: afterAll');
            commonEvent.unsubscribe(subScriber);
            isConnect = false;
            config.disableAbility('com.example.accessibilityxts/AccessibilityExtAbility').then(() => {
                console.info(`AccessibilityExtensionContextTest disableAbility: then`);
            }).catch((err) => {
                console.error(`AccessibilityExtensionContextTest disableAbility has error: ${err.code}`);
            });
            setTimeout(done, 5000);
        })

        beforeEach(async function (done) {
            console.info('AccessibilityElementTest: beforeEach');
            caseResult = undefined;
            done();
        })

        afterEach(async function (done) {
            console.info('AccessibilityElementTest: afterEach');
            done();
        })

        /*
        * @tc.number  AccessibilityExtensionContextTest_setTargetBundleName_asyncCallback_1500
        * @tc.name    AccessibilityExtensionContextTest_setTargetBundleName_asyncCallback_1500
        * @tc.desc    The parameter input is 'com.example.accessibleformextension', 
        *             test the setTargetBundleName() function,
        *             The result of setTargetBundleName() should be boolean type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_setTargetBundleName_asyncCallback_1500', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_setTargetBundleName_asyncCallback_1500';
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
        * @tc.number  AccessibilityExtensionContextTest_setTargetBundleName_asyncCallback_1600
        * @tc.name    AccessibilityExtensionContextTest_setTargetBundleName_asyncCallback_1600
        * @tc.desc    The parameter input is 'com.example.accessibleformextension', 
        *             test the setTargetBundleName() function,
        *             The result of setTargetBundleName() should be boolean type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_setTargetBundleName_asyncCallback_1600', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_setTargetBundleName_asyncCallback_1600';
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
        * @tc.number  AccessibilityExtensionContextTest_setTargetBundleName_asyncCallback_1700
        * @tc.name    AccessibilityExtensionContextTest_setTargetBundleName_asyncCallback_1700
        * @tc.desc    The parameter input is 'com.example.accessibleformextension', 
        *             test the setTargetBundleName() function,
        *             The result of setTargetBundleName() should be boolean type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_setTargetBundleName_asyncCallback_1700', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_setTargetBundleName_asyncCallback_1700';
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
        * @tc.number  AccessibilityExtensionContextTest_setTargetBundleName_asyncPromise_1800
        * @tc.name    AccessibilityExtensionContextTest_setTargetBundleName_asyncPromise_1800
        * @tc.desc    The parameter input is 'com.example.accessibleformextension', 
        *             test the setTargetBundleName() function,
        *             The result of setTargetBundleName() should be boolean type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_setTargetBundleName_asyncPromise_1800', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_setTargetBundleName_asyncPromise_1800';
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
        * @tc.number  AccessibilityExtensionContextTest_setTargetBundleName_asyncPromise_1900
        * @tc.name    AccessibilityExtensionContextTest_setTargetBundleName_asyncPromise_1900
        * @tc.desc    The parameter input is 'com.example.accessibleformextension', 
        *             test the setTargetBundleName() function,
        *             The result of setTargetBundleName() should be boolean type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_setTargetBundleName_asyncPromise_1900', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_setTargetBundleName_asyncPromise_1900';
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
        * @tc.number  AccessibilityExtensionContextTest_setTargetBundleName_asyncPromise_2000
        * @tc.name    AccessibilityExtensionContextTest_setTargetBundleName_asyncPromise_2000
        * @tc.desc    The parameter input is 'com.example.accessibleformextension', 
        *             test the setTargetBundleName() function,
        *             The result of setTargetBundleName() should be boolean type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_setTargetBundleName_asyncPromise_2000', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_setTargetBundleName_asyncPromise_2000';
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
        * @tc.number  AccessibilityExtensionContextTest_getWindowRootElement_asyncCallback_2100
        * @tc.name    AccessibilityExtensionContextTest_getWindowRootElement_asyncCallback_2100
        * @tc.desc    The parameter input is null,
        *             The result of getWindowRootElement() should be AccessibilityElement type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_getWindowRootElement_asyncCallback_2100', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_getWindowRootElement_asyncCallback_2100';
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
        * @tc.number  AccessibilityExtensionContextTest_getWindowRootElement_asyncCallback_2200
        * @tc.name    AccessibilityExtensionContextTest_getWindowRootElement_asyncCallback_2200
        * @tc.desc    The parameter input is null,
        *             The result of getWindowRootElement() should be AccessibilityElement type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
       it('AccessibilityExtensionContextTest_getWindowRootElement_asyncCallback_2200', 0, async function (done) {
        let caseName = 'AccessibilityExtensionContextTest_getWindowRootElement_asyncCallback_2200';
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
        * @tc.number  AccessibilityExtensionContextTest_getWindowRootElement_asyncCallback_2300
        * @tc.name    AccessibilityExtensionContextTest_getWindowRootElement_asyncCallback_2300
        * @tc.desc    The parameter input is windowId, test the getWindowRootElement() function.
        *             The result of getWindowRootElement() should be AccessibilityElement type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_getWindowRootElement_asyncCallback_2300', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_getWindowRootElement_asyncCallback_2300';
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
        * @tc.number  AccessibilityExtensionContextTest_getWindowRootElement_asyncCallback_2400
        * @tc.name    AccessibilityExtensionContextTest_getWindowRootElement_asyncCallback_2400
        * @tc.desc    The parameter input is windowId, test the getWindowRootElement() function.
        *             The result of getWindowRootElement() should be AccessibilityElement type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_getWindowRootElement_asyncCallback_2400', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_getWindowRootElement_asyncCallback_2400';
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
        * @tc.number  AccessibilityExtensionContextTest_getWindowRootElement_Promise_2500
        * @tc.name    AccessibilityExtensionContextTest_getWindowRootElement_Promise_2500
        * @tc.desc    The parameter input is windowId, test the getWindowRootElement() function.
        *             The result of getWindowRootElement() should be AccessibilityElement type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
       it('AccessibilityExtensionContextTest_getWindowRootElement_Promise_2500', 0, async function (done) {
        let caseName = 'AccessibilityExtensionContextTest_getWindowRootElement_Promise_2500';
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
        * @tc.number  AccessibilityExtensionContextTest_getWindowRootElement_Promise_2600
        * @tc.name    AccessibilityExtensionContextTest_getWindowRootElement_Promise_2600
        * @tc.desc    The parameter input is windowId, test the getWindowRootElement() function.
        *             The result of getWindowRootElement() should be AccessibilityElement type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_getWindowRootElement_Promise_2600', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_getWindowRootElement_Promise_2600';
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
        * @tc.number  AccessibilityExtensionContextTest_getWindowRootElement_Promise_2700
        * @tc.name    AccessibilityExtensionContextTest_getWindowRootElement_Promise_2700
        * @tc.desc    The parameter input is windowId, test the getWindowRootElement() function.
        *             The result of getWindowRootElement() should be AccessibilityElement type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_getWindowRootElement_Promise_2700', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_getWindowRootElement_Promise_2700';
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
        * @tc.number  AccessibilityExtensionContextTest_getWindows_asyncCallback_2800
        * @tc.name    AccessibilityExtensionContextTest_getWindows_asyncCallback_2800
        * @tc.desc    The parameter input is null, test the getWindows() function,
        *             The result of getWindows() should be Array type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_getWindows_asyncCallback_2800', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_getWindows_asyncCallback_2800';
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
        * @tc.number  AccessibilityExtensionContextTest_getWindows_asyncCallback_2900
        * @tc.name    AccessibilityExtensionContextTest_getWindows_asyncCallback_2900
        * @tc.desc    The parameter input is dispalyId, test the getWindows() function,
        *             The result of getWindows() should be Array type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_getWindows_asyncCallback_2900', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_getWindows_asyncCallback_2900';
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
        * @tc.number  AccessibilityExtensionContextTest_getWindows_asyncCallback_3000
        * @tc.name    AccessibilityExtensionContextTest_getWindows_asyncCallback_3000
        * @tc.desc    The parameter input is dispalyId, test the getWindows() function,
        *             The result of getWindows() should be Array type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_getWindows_asyncCallback_3000', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_getWindows_asyncCallback_3000';
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
        * @tc.number  AccessibilityExtensionContextTest_getWindows_asyncCallback_3100
        * @tc.name    AccessibilityExtensionContextTest_getWindows_asyncCallback_3100
        * @tc.desc    The parameter input is dispalyId, test the getWindows() function,
        *             The result of getWindows() should be Array type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_getWindows_asyncCallback_3100', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_getWindows_asyncCallback_3100';
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
        * @tc.number  AccessibilityExtensionContextTest_getWindows_Promise_3200
        * @tc.name    AccessibilityExtensionContextTest_getWindows_Promise_3200
        * @tc.desc    The parameter input is dispalyId, test the getWindows() function,
        *             The result of getWindows() should be Array type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_getWindows_Promise_3200', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_getWindows_Promise_3200';
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
        * @tc.number  AccessibilityExtensionContextTest_getWindows_Promise_3300
        * @tc.name    AccessibilityExtensionContextTest_getWindows_Promise_3300
        * @tc.desc    The parameter input is dispalyId, test the getWindows() function,
        *             The result of getWindows() should be Array type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_getWindows_Promise_3300', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_getWindows_Promise_3300';
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
        * @tc.number  AccessibilityExtensionContextTest_getWindows_Promise_3400
        * @tc.name    AccessibilityExtensionContextTest_getWindows_Promise_3400
        * @tc.desc    The parameter input is dispalyId, test the getWindows() function,
        *             The result of getWindows() should be Array type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_getWindows_Promise_3400', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_getWindows_Promise_3400';
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
        * @tc.number  AccessibilityExtensionContextTest_getFocusElement_asyncCallback_3700
        * @tc.name    AccessibilityExtensionContextTest_getFocusElement_asyncCallback_3700
        * @tc.desc    The parameter input is true, test the getFocusElement() function,
        *             The result of getFocusElement() should be AccessibilityElement type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_getFocusElement_asyncCallback_3700', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_getFocusElement_asyncCallback_3700';
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
        * @tc.number  AccessibilityExtensionContextTest_getFocusElement_asyncCallback_3900
        * @tc.name    AccessibilityExtensionContextTest_getFocusElement_asyncCallback_3900
        * @tc.desc    The parameter input is true, test the getFocusElement() function,
        *             The result of getFocusElement() should be AccessibilityElement type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_getFocusElement_asyncCallback_3900', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_getFocusElement_asyncCallback_3900';
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
        * @tc.number  AccessibilityExtensionContextTest_getFocusElement_asyncPromise_4100
        * @tc.name    AccessibilityExtensionContextTest_getFocusElement_asyncPromise_4100
        * @tc.desc    The parameter input is true, test the getFocusElement() function,
        *             The result of getFocusElement() should be AccessibilityElement type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_getFocusElement_asyncPromise_4100', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_getFocusElement_asyncPromise_4100';
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
        * @tc.number  AccessibilityExtensionContextTest_getFocusElement_asyncPromise_4300
        * @tc.name    AccessibilityExtensionContextTest_getFocusElement_asyncPromise_4300
        * @tc.desc    The parameter input is true, test the getFocusElement() function,
        *             The result of getFocusElement() should be AccessibilityElement type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_getFocusElement_asyncPromise_4300', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_getFocusElement_asyncPromise_4300';
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
        * @tc.number  AccessibilityExtensionContextTest_gestureInject_asyncCallback_4500
        * @tc.name    AccessibilityExtensionContextTest_gestureInject_asyncCallback_4500
        * @tc.desc    The parameter input is gesturePath, test the gestureInject() function.
        *             The result of gestureInject() should be boolean type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_gestureInject_asyncCallback_4500', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_gestureInject_asyncCallback_4500';
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
        * @tc.number  AccessibilityExtensionContextTest_gestureInject_asyncCallback_4600
        * @tc.name    AccessibilityExtensionContextTest_gestureInject_asyncCallback_4600
        * @tc.desc    The parameter input is gesturePath, test the gestureInject() function.
        *             The result of gestureInject() should be boolean type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_gestureInject_asyncCallback_4600', 0, async function(done) {
            let caseName = 'AccessibilityExtensionContextTest_gestureInject_asyncCallback_4600';
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
        * @tc.number  AccessibilityExtensionContextTest_gestureInject_asyncCallback_4700
        * @tc.name    AccessibilityExtensionContextTest_gestureInject_asyncCallback_4700
        * @tc.desc    The parameter input is gesturePath, test the gestureInject() function.
        *             The result of gestureInject() should be boolean type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_gestureInject_asyncCallback_4700', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_gestureInject_asyncCallback_4700';
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
        * @tc.number  AccessibilityExtensionContextTest_gestureInject_asyncCallback_4800
        * @tc.name    AccessibilityExtensionContextTest_gestureInject_asyncCallback_4800
        * @tc.desc    The parameter input is gesturePath, test the gestureInject() function.
        *             The result of gestureInject() should be boolean type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_gestureInject_asyncCallback_4800', 0, async function(done) {
            let caseName = 'AccessibilityExtensionContextTest_gestureInject_asyncCallback_4800';
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
        * @tc.number  AccessibilityExtensionContextTest_gestureInject_asyncCallback_4900
        * @tc.name    AccessibilityExtensionContextTest_gestureInject_asyncCallback_4900
        * @tc.desc    The parameter input is gesturePath, test the gestureInject() function.
        *             The result of gestureInject() should be boolean type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_gestureInject_asyncCallback_4900', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_gestureInject_asyncCallback_4900';
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
        * @tc.number  AccessibilityExtensionContextTest_gestureInject_asyncPromise_5000
        * @tc.name    AccessibilityExtensionContextTest_gestureInject_asyncPromise_5000
        * @tc.desc    The parameter input is gesturePath, test the gestureInject() function.
        *             The result of gestureInject() should be boolean type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_gestureInject_asyncPromise_5000', 0, async function(done) {
            let caseName = 'AccessibilityExtensionContextTest_gestureInject_asyncPromise_5000';
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
        * @tc.number  AccessibilityExtensionContextTest_gestureInject_asyncPromise_5100
        * @tc.name    AccessibilityExtensionContextTest_gestureInject_asyncPromise_5100
        * @tc.desc    The parameter input is gesturePath, test the gestureInject() function.
        *             The result of gestureInject() should be boolean type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_gestureInject_asyncPromise_5100', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_gestureInject_asyncPromise_5100';
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
        * @tc.number  AccessibilityExtensionContextTest_gestureInject_asyncPromise_5200
        * @tc.name    AccessibilityExtensionContextTest_gestureInject_asyncPromise_5200
        * @tc.desc    The parameter input is gesturePath, test the gestureInject() function.
        *             The result of gestureInject() should be boolean type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_gestureInject_asyncPromise_5200', 0, async function(done) {
            let caseName = 'AccessibilityExtensionContextTest_gestureInject_asyncPromise_5200';
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
        * @tc.number  AccessibilityExtensionContextTest_gestureInject_asyncPromise_5300
        * @tc.name    AccessibilityExtensionContextTest_gestureInject_asyncPromise_5300
        * @tc.desc    The parameter input is gesturePath, test the gestureInject() function.
        *             The result of gestureInject() should be boolean type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_gestureInject_asyncPromise_5300', 0, async function (done) {
            let caseName = 'AccessibilityExtensionContextTest_gestureInject_asyncPromise_5300';
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
        * @tc.number  AccessibilityExtensionContextTest_gestureInject_asyncPromise_5400
        * @tc.name    AccessibilityExtensionContextTest_gestureInject_asyncPromise_5400
        * @tc.desc    The parameter input is gesturePath, test the gestureInject() function.
        *             The result of gestureInject() should be boolean type.
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AccessibilityExtensionContextTest_gestureInject_asyncPromise_5400', 0, async function(done) {
            let caseName = 'AccessibilityExtensionContextTest_gestureInject_asyncPromise_5400';
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
