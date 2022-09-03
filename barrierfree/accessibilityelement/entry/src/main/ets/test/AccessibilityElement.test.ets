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
    describe('AccessibilityElementTest', function () {
        let subScriber = undefined;
        let isConnect = false;
        let caseResult = undefined;

        beforeAll(async function (done) {
            console.info('AccessibilityElementTest: beforeAll');
            subScriber = await commonEvent.createSubscriber({events: ['onConnectState', 'caseResult']});
            commonEvent.subscribe(subScriber, (err, data) => {
                console.info('AccessibilityElementTest beforeAll data:' + JSON.stringify(data) );
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
                console.info(`AccessibilityElementTest enableAbility: then`);
		
            config.enableAbility('com.example.accessibilityxts/AccessibilityExtAbility1',
                                    ["retrieve", "touchGuide", "gesture"]
            ).then(() => {
                console.info(`AccessibilityElementTest1 enableAbility: then`);
            }).catch((err) => {
                console.error(`AccessibilityElementTest1 enableAbility has error: ${err.code}`);
            });
            }).catch((err) => {
                console.error(`AccessibilityElementTest enableAbility has error: ${err.code}`);
            });


            setTimeout(async () => {
                done();
            }, 5000);
        })

        afterAll(async function (done) {
            console.info('AccessibilityElementTest: afterAll');
            commonEvent.unsubscribe(subScriber);
            isConnect = false;
            config.disableAbility('com.example.accessibilityxts/AccessibilityExtAbility').then(() => {
                console.info(`AccessibilityElementTest disableAbility: then`);
            }).catch((err) => {
                console.error(`AccessibilityElementTest disableAbility has error: ${err.code}`);
            });
            setTimeout(async () => {
                done();
            }, 5000);
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
         * @tc.number  AccessibilityElementTest_attributeNames_asyncPromise_0100
         * @tc.name    AccessibilityElementTest_attributeNames_asyncPromise_0100
         * @tc.desc    Test attributeNames(), should return an array of names in ElementAttributeValues.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeNames_asyncPromise_0100', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeNames_asyncPromise_0100';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_0200
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_0200
         * @tc.desc    Test attributeValue() when input is 'componentId', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_0200', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_0200';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_0300
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_0300
         * @tc.desc    Test attributeValue() when input is 'pageId', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_0300', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_0300';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_0500
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_0500
         * @tc.desc    Test attributeValue() when input is 'inspectorKey', should return a string type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_0500', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_0500';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_0600
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_0600
         * @tc.desc    Test attributeValue() when input is 'bundleName', should return a string type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_0600', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_0600';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_0700
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_0700
         * @tc.desc    Test attributeValue() when input is 'componentType', should return a string type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_0700', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_0700';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_0800
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_0800
         * @tc.desc    Test attributeValue() when input is 'inputType', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_0800', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_0800';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_0900
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_0900
         * @tc.desc    Test attributeValue() when input is 'text', should return a string type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_0900', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_0900';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_1000
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_1000
         * @tc.desc    Test attributeValue() when input is 'hintText', should return a string type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_1000', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_1000';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_1100
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_1100
         * @tc.desc    Test attributeValue() when input is 'description', should return a string type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_1100', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_1100';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_1200
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_1200
         * @tc.desc    Test attributeValue() when input is 'resourceName', should return a string type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_1200', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_1200';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_1400
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_1400
         * @tc.desc    Test attributeValue() when input is 'textLengthLimit', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_1400', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_1400';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_1500
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_1500
         * @tc.desc    Test attributeValue() when input is 'rect', should return a Rect type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_1500', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_1500';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_1600
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_1600
         * @tc.desc    Test attributeValue() when input is 'checkable', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_1600', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_1600';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_1700
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_1700
         * @tc.desc    Test attributeValue() when input is 'checked', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_1700', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_1700';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_1800
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_1800
         * @tc.desc    Test attributeValue() when input is 'focusable', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_1800', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_1800';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_1900
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_1900
         * @tc.desc    Test attributeValue() when input is 'isVisible', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_1900', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_1900';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_2000
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_2000
         * @tc.desc    Test attributeValue() when input is 'accessibilityFocused', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_2000', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_2000';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_2100
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_2100
         * @tc.desc    Test attributeValue() when input is 'selected', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_2100', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_2100';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_2200
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_2200
         * @tc.desc    Test attributeValue() when input is 'clickable', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_2200', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_2200';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_2300
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_2300
         * @tc.desc    Test attributeValue() when input is 'longClickable', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_2300', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_2300';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_2400
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_2400
         * @tc.desc    Test attributeValue() when input is 'isEnable', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_2400', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_2400';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_2500
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_2500
         * @tc.desc    Test attributeValue() when input is 'isPassword', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_2500', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_2500';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_2600
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_2600
         * @tc.desc    Test attributeValue() when input is 'scrollable', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_2600', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_2600';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_2700
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_2700
         * @tc.desc    Test attributeValue() when input is 'editable', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_2700', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_2700';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_2900
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_2900
         * @tc.desc    Test attributeValue() when input is 'pluralLineSupported', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_2900', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_2900';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_3100
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_3100
         * @tc.desc    Test attributeValue() when input is 'isHint', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_3100', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_3100';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_3300
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_3300
         * @tc.desc    Test attributeValue() when input is 'itemCount', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_3300', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_3300';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_3400
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_3400
         * @tc.desc    Test attributeValue() when input is 'currentIndex', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_3400', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_3400';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_3500
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_3500
         * @tc.desc    Test attributeValue() when input is 'startIndex', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_3500', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_3500';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_3600
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_3600
         * @tc.desc    Test attributeValue() when input is 'endIndex', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_3600', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_3600';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_3700
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_3700
         * @tc.desc    Test attributeValue() when input is 'valueMax', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_3700', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_3700';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_3800
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_3800
         * @tc.desc    Test attributeValue() when input is 'valueMin', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_3800', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_3800';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_3900
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_3900
         * @tc.desc    Test attributeValue() when input is 'valueNow', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_3900', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_3900';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_4200
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_4200
         * @tc.desc    Test attributeValue() when input is 'error', should return a string type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_4200', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_4200';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_4300
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_4300
         * @tc.desc    Test attributeValue() when input is 'triggerAction', should return a string type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_4300', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_4300';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_4400
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_4400
         * @tc.desc    Test attributeValue() when input is 'textMoveUnit', should return a string type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_4400', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_4400';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_4500
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_4500
         * @tc.desc    Test attributeValue() when input is 'contents', should return an array of string.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_4500', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_4500';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_4600
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_4600
         * @tc.desc    Test attributeValue() when input is 'lastContent', should return a string type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_4600', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_4600';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_4700
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_4700
         * @tc.desc    Test attributeValue() when input is 'parent', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_4700', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_4700';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_4800
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_4800
         * @tc.desc    Test attributeValue() when input is 'children', should return an array of AccessibilityElement.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_4800', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_4800';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_5200
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_5200
         * @tc.desc    Test attributeValue() when input is 'isActive', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_5200', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_5200';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_5300
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_5300
         * @tc.desc    Test attributeValue() when input is 'screenRect', should return a Rect type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_5300', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_5300';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_5400
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_5400
         * @tc.desc    Test attributeValue() when input is 'layer', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_5400', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_5400';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_5500
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_5500
         * @tc.desc    Test attributeValue() when input is 'type', should return a WindowType(string) type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_5500', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_5500';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_5600
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_5600
         * @tc.desc    Test attributeValue() when input is 'rootElement', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_5600', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_5600';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_5700
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_5700
         * @tc.desc    Test attributeValue() when input is 'windowId', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_5700', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_5700';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_5800
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_5800
         * @tc.desc    Test attributeValue() when input is 'isFocused', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_5800', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_5800';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncPromise_5900
         * @tc.name    AccessibilityElementTest_findElement_asyncPromise_5900
         * @tc.desc    Test findElement() when input is 'focusDirection' and 'down' in same layout, should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncPromise_5900', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncPromise_5900';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_actionNames_asyncPromise_6000
         * @tc.name    AccessibilityElementTest_actionNames_asyncPromise_6000
         * @tc.desc    Test actionNames(), should return an array of action names in CommonAction.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_actionNames_asyncPromise_6000', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_actionNames_asyncPromise_6000';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncPromise_6100
         * @tc.name    AccessibilityElementTest_performAction_asyncPromise_6100
         * @tc.desc    Test performAction() when input is 'accessibilityFocus'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncPromise_6100', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncPromise_6100';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncPromise_6200
         * @tc.name    AccessibilityElementTest_performAction_asyncPromise_6200
         * @tc.desc    Test performAction() when input is 'clearAccessibilityFocus'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncPromise_6200', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncPromise_6200';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncPromise_6300
         * @tc.name    AccessibilityElementTest_performAction_asyncPromise_6300
         * @tc.desc    Test performAction() when input is 'focus'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncPromise_6300', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncPromise_6300';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncPromise_6400
         * @tc.name    AccessibilityElementTest_performAction_asyncPromise_6400
         * @tc.desc    Test performAction() when input is 'clearFocus'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncPromise_6400', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncPromise_6400';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncPromise_6500
         * @tc.name    AccessibilityElementTest_performAction_asyncPromise_6500
         * @tc.desc    Test performAction() when input is 'clearSelection'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncPromise_6500', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncPromise_6500';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncPromise_6600
         * @tc.name    AccessibilityElementTest_performAction_asyncPromise_6600
         * @tc.desc    Test performAction() when input is 'click'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncPromise_6600', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncPromise_6600';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncPromise_6700
         * @tc.name    AccessibilityElementTest_performAction_asyncPromise_6700
         * @tc.desc    Test performAction() when input is 'longClick'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncPromise_6700', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncPromise_6700';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncPromise_6800
         * @tc.name    AccessibilityElementTest_performAction_asyncPromise_6800
         * @tc.desc    Test performAction() when input is 'cut'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncPromise_6800', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncPromise_6800';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncPromise_6900
         * @tc.name    AccessibilityElementTest_performAction_asyncPromise_6900
         * @tc.desc    Test performAction() when input is 'copy'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncPromise_6900', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncPromise_6900';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncPromise_7000
         * @tc.name    AccessibilityElementTest_performAction_asyncPromise_7000
         * @tc.desc    Test performAction() when input is 'paste'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncPromise_7000', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncPromise_7000';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncPromise_7100
         * @tc.name    AccessibilityElementTest_performAction_asyncPromise_7100
         * @tc.desc    Test performAction() when input is 'select'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncPromise_7100', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncPromise_7100';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncPromise_7200
         * @tc.name    AccessibilityElementTest_performAction_asyncPromise_7200
         * @tc.desc    Test performAction() when input is 'setText'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncPromise_7200', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncPromise_7200';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncPromise_7300
         * @tc.name    AccessibilityElementTest_performAction_asyncPromise_7300
         * @tc.desc    Test performAction() when input is 'delete'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncPromise_7300', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncPromise_7300';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncPromise_7400
         * @tc.name    AccessibilityElementTest_performAction_asyncPromise_7400
         * @tc.desc    Test performAction() when input is 'scrollForward'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncPromise_7400', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncPromise_7400';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncPromise_7500
         * @tc.name    AccessibilityElementTest_performAction_asyncPromise_7500
         * @tc.desc    Test performAction() when input is 'scrollBackward'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncPromise_7500', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncPromise_7500';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncPromise_7600
         * @tc.name    AccessibilityElementTest_performAction_asyncPromise_7600
         * @tc.desc    Test performAction() when input is 'setSelection'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncPromise_7600', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncPromise_7600';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncPromise_7700
         * @tc.name    AccessibilityElementTest_findElement_asyncPromise_7700
         * @tc.desc    Test findElement() when input is 'content' and 'xxx', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncPromise_7700', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncPromise_7700';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncPromise_7800
         * @tc.name    AccessibilityElementTest_findElement_asyncPromise_7800
         * @tc.desc    Test findElement() when input is 'content' and 'button1', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncPromise_7800', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncPromise_7800';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncPromise_7900
         * @tc.name    AccessibilityElementTest_findElement_asyncPromise_7900
         * @tc.desc    Test findElement() when input is 'focusType' and 'accessibility', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncPromise_7900', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncPromise_7900';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncPromise_8000
         * @tc.name    AccessibilityElementTest_findElement_asyncPromise_8000
         * @tc.desc    Test findElement() when input is 'focusType' and 'normal', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncPromise_8000', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncPromise_8000';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncPromise_8100
         * @tc.name    AccessibilityElementTest_findElement_asyncPromise_8100
         * @tc.desc    Test findElement() when input is 'focusDirection' and 'up', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncPromise_8100', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncPromise_8100';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncPromise_8200
         * @tc.name    AccessibilityElementTest_findElement_asyncPromise_8200
         * @tc.desc    Test findElement() when input is 'focusDirection' and 'down', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncPromise_8200', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncPromise_8200';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncPromise_8300
         * @tc.name    AccessibilityElementTest_findElement_asyncPromise_8300
         * @tc.desc    Test findElement() when input is 'focusDirection' and 'left', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncPromise_8300', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncPromise_8300';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncPromise_8400
         * @tc.name    AccessibilityElementTest_findElement_asyncPromise_8400
         * @tc.desc    Test findElement() when input is 'focusDirection' and 'right', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncPromise_8400', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncPromise_8400';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncPromise_8500
         * @tc.name    AccessibilityElementTest_findElement_asyncPromise_8500
         * @tc.desc    Test findElement() when input is 'focusDirection' and 'forward', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncPromise_8500', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncPromise_8500';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncPromise_8600
         * @tc.name    AccessibilityElementTest_findElement_asyncPromise_8600
         * @tc.desc    Test findElement() when input is 'focusDirection' and 'backward', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncPromise_8600', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncPromise_8600';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncPromise_8700
         * @tc.name    AccessibilityElementTest_findElement_asyncPromise_8700
         * @tc.desc    Test findElement() when input is 'focusType' and 'xxx', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncPromise_8700', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncPromise_8700';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncPromise_8800
         * @tc.name    AccessibilityElementTest_findElement_asyncPromise_8800
         * @tc.desc    Test findElement() when input is 'focusDirection' and 'xxx', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncPromise_8800', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncPromise_8800';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncPromise_8900
         * @tc.name    AccessibilityElementTest_performAction_asyncPromise_8900
         * @tc.desc    Test performAction() when input is 'xxx'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncPromise_8900', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncPromise_8900';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncPromise_9000
         * @tc.name    AccessibilityElementTest_attributeValue_asyncPromise_9000
         * @tc.desc    Test attributeValue() when input is 'xxx', should catch error.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncPromise_9000', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncPromise_9000';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeNames_asyncCallback_0100
         * @tc.name    AccessibilityElementTest_attributeNames_asyncCallback_0100
         * @tc.desc    Test attributeNames(), should return an array of names in ElementAttributeValues.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeNames_asyncCallback_0100', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeNames_asyncCallback_0100';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_0200
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_0200
         * @tc.desc    Test attributeValue() when input is 'componentId', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_0200', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_0200';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_0300
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_0300
         * @tc.desc    Test attributeValue() when input is 'pageId', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_0300', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_0300';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_0500
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_0500
         * @tc.desc    Test attributeValue() when input is 'inspectorKey', should return a string type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_0500', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_0500';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_0600
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_0600
         * @tc.desc    Test attributeValue() when input is 'bundleName', should return a string type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_0600', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_0600';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_0700
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_0700
         * @tc.desc    Test attributeValue() when input is 'componentType', should return a string type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_0700', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_0700';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_0800
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_0800
         * @tc.desc    Test attributeValue() when input is 'inputType', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_0800', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_0800';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_0900
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_0900
         * @tc.desc    Test attributeValue() when input is 'text', should return a string type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_0900', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_0900';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_1000
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_1000
         * @tc.desc    Test attributeValue() when input is 'hintText', should return a string type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_1000', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_1000';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_1100
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_1100
         * @tc.desc    Test attributeValue() when input is 'description', should return a string type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_1100', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_1100';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_1200
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_1200
         * @tc.desc    Test attributeValue() when input is 'resourceName', should return a string type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_1200', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_1200';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_1400
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_1400
         * @tc.desc    Test attributeValue() when input is 'textLengthLimit', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_1400', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_1400';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_1500
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_1500
         * @tc.desc    Test attributeValue() when input is 'rect', should return a Rect type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_1500', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_1500';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_1600
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_1600
         * @tc.desc    Test attributeValue() when input is 'checkable', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_1600', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_1600';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_1700
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_1700
         * @tc.desc    Test attributeValue() when input is 'checked', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_1700', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_1700';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_1800
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_1800
         * @tc.desc    Test attributeValue() when input is 'focusable', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_1800', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_1800';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_1900
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_1900
         * @tc.desc    Test attributeValue() when input is 'isVisible', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_1900', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_1900';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_2000
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_2000
         * @tc.desc    Test attributeValue() when input is 'accessibilityFocused', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_2000', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_2000';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_2100
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_2100
         * @tc.desc    Test attributeValue() when input is 'selected', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_2100', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_2100';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_2200
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_2200
         * @tc.desc    Test attributeValue() when input is 'clickable', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_2200', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_2200';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_2300
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_2300
         * @tc.desc    Test attributeValue() when input is 'longClickable', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_2300', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_2300';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_2400
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_2400
         * @tc.desc    Test attributeValue() when input is 'isEnable', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_2400', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_2400';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_2500
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_2500
         * @tc.desc    Test attributeValue() when input is 'isPassword', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_2500', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_2500';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_2600
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_2600
         * @tc.desc    Test attributeValue() when input is 'scrollable', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_2600', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_2600';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_2700
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_2700
         * @tc.desc    Test attributeValue() when input is 'editable', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_2700', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_2700';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_2900
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_2900
         * @tc.desc    Test attributeValue() when input is 'pluralLineSupported', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_2900', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_2900';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_3100
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_3100
         * @tc.desc    Test attributeValue() when input is 'isHint', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_3100', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_3100';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_3300
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_3300
         * @tc.desc    Test attributeValue() when input is 'itemCount', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_3300', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_3300';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_3400
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_3400
         * @tc.desc    Test attributeValue() when input is 'currentIndex', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_3400', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_3400';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_3500
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_3500
         * @tc.desc    Test attributeValue() when input is 'startIndex', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_3500', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_3500';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_3600
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_3600
         * @tc.desc    Test attributeValue() when input is 'endIndex', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_3600', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_3600';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_3700
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_3700
         * @tc.desc    Test attributeValue() when input is 'valueMax', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_3700', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_3700';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_3800
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_3800
         * @tc.desc    Test attributeValue() when input is 'valueMin', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_3800', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_3800';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_3900
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_3900
         * @tc.desc    Test attributeValue() when input is 'valueNow', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_3900', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_3900';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_4200
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_4200
         * @tc.desc    Test attributeValue() when input is 'error', should return a string type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_4200', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_4200';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_4300
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_4300
         * @tc.desc    Test attributeValue() when input is 'triggerAction', should return a string type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_4300', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_4300';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_4400
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_4400
         * @tc.desc    Test attributeValue() when input is 'textMoveUnit', should return a string type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_4400', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_4400';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_4500
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_4500
         * @tc.desc    Test attributeValue() when input is 'contents', should return an array of string.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_4500', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_4500';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_4600
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_4600
         * @tc.desc    Test attributeValue() when input is 'lastContent', should return a string type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_4600', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_4600';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_4700
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_4700
         * @tc.desc    Test attributeValue() when input is 'parent', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_4700', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_4700';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_4800
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_4800
         * @tc.desc    Test attributeValue() when input is 'children', should return an array of AccessibilityElement.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_4800', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_4800';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_5200
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_5200
         * @tc.desc    Test attributeValue() when input is 'isActive', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_5200', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_5200';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_5300
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_5300
         * @tc.desc    Test attributeValue() when input is 'screenRect', should return a Rect type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_5300', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_5300';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_5400
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_5400
         * @tc.desc    Test attributeValue() when input is 'layer', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_5400', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_5400';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_5500
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_5500
         * @tc.desc    Test attributeValue() when input is 'type', should return a WindowType(string) type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_5500', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_5500';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_5600
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_5600
         * @tc.desc    Test attributeValue() when input is 'rootElement', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_5600', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_5600';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_5700
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_5700
         * @tc.desc    Test attributeValue() when input is 'windowId', should return a number type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_5700', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_5700';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_5800
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_5800
         * @tc.desc    Test attributeValue() when input is 'isFocused', should return a boolean type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_5800', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_5800';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncCallback_5900
         * @tc.name    AccessibilityElementTest_findElement_asyncCallback_5900
         * @tc.desc    Test findElement() when input is 'focusDirection' and 'down' in same layout, should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncCallback_5900', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncCallback_5900';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_actionNames_asyncCallback_6000
         * @tc.name    AccessibilityElementTest_actionNames_asyncCallback_6000
         * @tc.desc    Test actionNames(), should return an array of action names in CommonAction.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_actionNames_asyncCallback_6000', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_actionNames_asyncCallback_6000';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncCallback_6100
         * @tc.name    AccessibilityElementTest_performAction_asyncCallback_6100
         * @tc.desc    Test performAction() when input is 'accessibilityFocus'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncCallback_6100', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncCallback_6100';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncCallback_6200
         * @tc.name    AccessibilityElementTest_performAction_asyncCallback_6200
         * @tc.desc    Test performAction() when input is 'clearAccessibilityFocus'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncCallback_6200', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncCallback_6200';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncCallback_6300
         * @tc.name    AccessibilityElementTest_performAction_asyncCallback_6300
         * @tc.desc    Test performAction() when input is 'focus'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncCallback_6300', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncCallback_6300';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncCallback_6400
         * @tc.name    AccessibilityElementTest_performAction_asyncCallback_6400
         * @tc.desc    Test performAction() when input is 'clearFocus'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncCallback_6400', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncCallback_6400';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncCallback_6500
         * @tc.name    AccessibilityElementTest_performAction_asyncCallback_6500
         * @tc.desc    Test performAction() when input is 'clearSelection'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncCallback_6500', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncCallback_6500';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncCallback_6600
         * @tc.name    AccessibilityElementTest_performAction_asyncCallback_6600
         * @tc.desc    Test performAction() when input is 'click'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncCallback_6600', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncCallback_6600';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncCallback_6700
         * @tc.name    AccessibilityElementTest_performAction_asyncCallback_6700
         * @tc.desc    Test performAction() when input is 'longClick'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncCallback_6700', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncCallback_6700';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncCallback_6800
         * @tc.name    AccessibilityElementTest_performAction_asyncCallback_6800
         * @tc.desc    Test performAction() when input is 'cut'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncCallback_6800', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncCallback_6800';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncCallback_6900
         * @tc.name    AccessibilityElementTest_performAction_asyncCallback_6900
         * @tc.desc    Test performAction() when input is 'copy'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncCallback_6900', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncCallback_6900';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncCallback_7000
         * @tc.name    AccessibilityElementTest_performAction_asyncCallback_7000
         * @tc.desc    Test performAction() when input is 'paste'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncCallback_7000', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncCallback_7000';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncCallback_7100
         * @tc.name    AccessibilityElementTest_performAction_asyncCallback_7100
         * @tc.desc    Test performAction() when input is 'select'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncCallback_7100', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncCallback_7100';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncCallback_7200
         * @tc.name    AccessibilityElementTest_performAction_asyncCallback_7200
         * @tc.desc    Test performAction() when input is 'setText'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncCallback_7200', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncCallback_7200';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncCallback_7300
         * @tc.name    AccessibilityElementTest_performAction_asyncCallback_7300
         * @tc.desc    Test performAction() when input is 'delete'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncCallback_7300', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncCallback_7300';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncCallback_7400
         * @tc.name    AccessibilityElementTest_performAction_asyncCallback_7400
         * @tc.desc    Test performAction() when input is 'scrollForward'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncCallback_7400', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncCallback_7400';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncCallback_7500
         * @tc.name    AccessibilityElementTest_performAction_asyncCallback_7500
         * @tc.desc    Test performAction() when input is 'scrollBackward'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncCallback_7500', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncCallback_7500';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncCallback_7600
         * @tc.name    AccessibilityElementTest_performAction_asyncCallback_7600
         * @tc.desc    Test performAction() when input is 'setSelection'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncCallback_7600', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncCallback_7600';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncCallback_7700
         * @tc.name    AccessibilityElementTest_findElement_asyncCallback_7700
         * @tc.desc    Test findElement() when input is 'content' and 'xxx', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncCallback_7700', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncCallback_7700';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncCallback_7800
         * @tc.name    AccessibilityElementTest_findElement_asyncCallback_7800
         * @tc.desc    Test findElement() when input is 'content' and 'button1', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncCallback_7800', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncCallback_7800';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncCallback_7900
         * @tc.name    AccessibilityElementTest_findElement_asyncCallback_7900
         * @tc.desc    Test findElement() when input is 'focusType' and 'accessibility', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncCallback_7900', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncCallback_7900';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncCallback_8000
         * @tc.name    AccessibilityElementTest_findElement_asyncCallback_8000
         * @tc.desc    Test findElement() when input is 'focusType' and 'normal', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncCallback_8000', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncCallback_8000';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncCallback_8100
         * @tc.name    AccessibilityElementTest_findElement_asyncCallback_8100
         * @tc.desc    Test findElement() when input is 'focusDirection' and 'up', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncCallback_8100', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncCallback_8100';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncCallback_8200
         * @tc.name    AccessibilityElementTest_findElement_asyncCallback_8200
         * @tc.desc    Test findElement() when input is 'focusDirection' and 'down', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncCallback_8200', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncCallback_8200';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncCallback_8300
         * @tc.name    AccessibilityElementTest_findElement_asyncCallback_8300
         * @tc.desc    Test findElement() when input is 'focusDirection' and 'left', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncCallback_8300', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncCallback_8300';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncCallback_8400
         * @tc.name    AccessibilityElementTest_findElement_asyncCallback_8400
         * @tc.desc    Test findElement() when input is 'focusDirection' and 'right', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncCallback_8400', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncCallback_8400';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncCallback_8500
         * @tc.name    AccessibilityElementTest_findElement_asyncCallback_8500
         * @tc.desc    Test findElement() when input is 'focusDirection' and 'forward', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncCallback_8500', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncCallback_8500';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncCallback_8600
         * @tc.name    AccessibilityElementTest_findElement_asyncCallback_8600
         * @tc.desc    Test findElement() when input is 'focusDirection' and 'backward', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncCallback_8600', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncCallback_8600';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncCallback_8700
         * @tc.name    AccessibilityElementTest_findElement_asyncCallback_8700
         * @tc.desc    Test findElement() when input is 'focusType' and 'xxx', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncCallback_8700', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncCallback_8700';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_findElement_asyncCallback_8800
         * @tc.name    AccessibilityElementTest_findElement_asyncCallback_8800
         * @tc.desc    Test findElement() when input is 'focusDirection' and 'xxx', should return an AccessibilityElement type.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_findElement_asyncCallback_8800', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_findElement_asyncCallback_8800';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_performAction_asyncCallback_8900
         * @tc.name    AccessibilityElementTest_performAction_asyncCallback_8900
         * @tc.desc    Test performAction() when input is 'xxx'.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_performAction_asyncCallback_8900', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_performAction_asyncCallback_8900';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityElementTest_attributeValue_asyncCallback_9000
         * @tc.name    AccessibilityElementTest_attributeValue_asyncCallback_9000
         * @tc.desc    Test attributeValue() when input is 'xxx', should catch error.
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityElementTest_attributeValue_asyncCallback_9000', 0, async function (done) {
            let caseName = 'AccessibilityElementTest_attributeValue_asyncCallback_9000';
            console.info(caseName + ' start');
            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    if (caseResult != undefined) {
                        expect(passStr).assertEqual(caseResult.data);
                        expect(caseName).assertEqual(caseResult.parameters.case);
                    } else {
                        console.info(caseName + ': fail, for no caseResult');
                        expect(null).assertFail();
                    }
                    done();
                }, 2000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })
    })
}