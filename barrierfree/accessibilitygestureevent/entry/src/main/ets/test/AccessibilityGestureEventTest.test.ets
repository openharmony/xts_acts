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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import commonEvent from '@ohos.commonEvent'
import config from '@ohos.accessibility.config'
import { GesturePath } from '@ohos.accessibility.GesturePath';
import { GesturePoint } from '@ohos.accessibility.GesturePoint';

function publishCaseExecute(caseName: string) {
    let commonEventPublishData = {
        data: caseName
    }

    commonEvent.publish('caseExecute', commonEventPublishData, (err) => {
        console.info('caseExecute publish [' + caseName + '] callback result: ' + JSON.stringify(err));
    });
}

export default function abilityTest() {
    let gestureEventTypes: Array<string> = [];
    describe('AccessibilityGestureEventTest', function () {
        let subScriber = undefined;
        let isConnect = false;

        beforeAll(async function (done) {
            console.info('AccessibilityGestureEventTest: beforeAll');
            subScriber = await commonEvent.createSubscriber({events: ['onConnectState', 'accessibilityEvent']});
            commonEvent.subscribe(subScriber, (err, data) => {
                console.info('AccessibilityGestureEventTest beforeAll data:' + JSON.stringify(data) );
                if (data.data == 'connect') {
                    isConnect = true;
                } else if (data.data == 'disconnect') {
                    isConnect = false;
                } else if (data.data == 'accessibilityEvent') {
                    gestureEventTypes.push(data.parameters.eventType);
                }
            });

            config.enableAbility('com.example.accessibilityxts/AccessibilityExtAbility',
                                    ["retrieve", "touchGuide", "gesture"]
            ).then(() => {
                console.info(`AccessibilityGestureEventTest enableAbility: then`);
            }).catch((err) => {
                console.error(`AccessibilityGestureEventTest enableAbility has error: ${err.code}`);
            });

            setTimeout(done, 3000);
        })

        afterAll(async function (done) {
            console.info('AccessibilityGestureEventTest: afterAll');
            commonEvent.unsubscribe(subScriber);
            config.disableAbility('com.example.accessibilityxts/AccessibilityExtAbility').then(() => {
                console.info(`AccessibilityGestureEventTest disableAbility: then`);
            }).catch((err) => {
                console.error(`AccessibilityGestureEventTest disableAbility has error: ${err.code}`);
            });
            setTimeout(done, 5000);
        })

        beforeEach(async function (done) {
            console.info('AccessibilityGestureEventTest: beforeEach');
            gestureEventTypes.length = 0;
            setTimeout(done, 5000);
        })

        afterEach(async function (done) {
            console.info('AccessibilityGestureEventTest: afterEach');
            done();
        })

        /*
         * @tc.number  AccessibilityGestureEventTest_0100
         * @tc.name    AccessibilityGestureEventTest_0100
         * @tc.desc    The inject Gesture is 'left', test the received accessibility
         *             gesture event is 'left' and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityGestureEventTest_0100', 0, async function (done) {
            let caseName = 'AccessibilityGestureEventTest_0100';
            console.info(caseName + 'start');

            let gestureType = 'left';

            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    let gestureTypes = gestureEventTypes;
                    let findResult = false;
                    for (let eventType of gestureTypes) {
                        if (gestureType == eventType || gestureTypes.length != 0) {
                            findResult = true;
                        }
                    }
                    console.info('AccessibilityGestureEventTest_0100 case: ' + findResult);
                    expect(findResult).assertTrue();
                    done();
                }, 3000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityGestureEventTest_0200
         * @tc.name    AccessibilityGestureEventTest_0200
         * @tc.desc    The inject Gesture is 'leftThenRight', test the received accessibility
         *             gesture event is 'leftThenRight' and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityGestureEventTest_0200', 0, async function (done) {
            let caseName = 'AccessibilityGestureEventTest_0200';
            console.info(caseName + 'start');

            let gestureType = 'leftThenRight';

            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    let gestureTypes = gestureEventTypes;
                    let findResult = false;
                    for (let eventType of gestureTypes) {
                        if (gestureType == eventType || gestureTypes.length != 0) {
                            findResult = true;
                        }
                    }
                    console.info('AccessibilityGestureEventTest_0200 case: ' + findResult);
                    expect(findResult).assertTrue();
                    done();
                }, 3000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityGestureEventTest_0300
         * @tc.name    AccessibilityGestureEventTest_0300
         * @tc.desc    The inject Gesture is 'leftThenUp', test the received accessibility
         *             gesture event is 'leftThenUp' and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityGestureEventTest_0300', 0, async function (done) {
            let caseName = 'AccessibilityGestureEventTest_0300';
            console.info(caseName + 'start');

            let gestureType = 'leftThenUp';

            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    let gestureTypes = gestureEventTypes;
                    let findResult = false;
                    for (let eventType of gestureTypes) {
                        if (gestureType == eventType || gestureTypes.length != 0) {
                            findResult = true;
                        }
                    }
                    console.info('AccessibilityGestureEventTest_0300 case: ' + findResult);
                    expect(findResult).assertTrue();
                    done();
                }, 3000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityGestureEventTest_0400
         * @tc.name    AccessibilityGestureEventTest_0400
         * @tc.desc    The inject Gesture is 'leftThenDown', test the received accessibility
         *             gesture event is 'leftThenDown' and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityGestureEventTest_0400', 0, async function (done) {
            let caseName = 'AccessibilityGestureEventTest_0400';
            console.info(caseName + 'start');

            let gestureType = 'leftThenDown';

            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    let gestureTypes = gestureEventTypes;
                    let findResult = false;
                    for (let eventType of gestureTypes) {
                        if (gestureType == eventType || gestureTypes.length != 0) {
                            findResult = true;
                        }
                    }
                    console.info('AccessibilityGestureEventTest_0400 case: ' + findResult);
                    expect(findResult).assertTrue();
                    done();
                }, 3000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityGestureEventTest_0500
         * @tc.name    AccessibilityGestureEventTest_0500
         * @tc.desc    The inject Gesture is 'right', test the received accessibility
         *             gesture event is 'right' and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityGestureEventTest_0500', 0, async function (done) {
            let caseName = 'AccessibilityGestureEventTest_0500';
            console.info(caseName + 'start');

            let gestureType = 'right';

            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    let gestureTypes = gestureEventTypes;
                    let findResult = false;
                    for (let eventType of gestureTypes) {
                        if (gestureType == eventType || gestureTypes.length != 0) {
                            findResult = true;
                        }
                    }
                    console.info('AccessibilityGestureEventTest_0500 case: ' + findResult);
                    expect(findResult).assertTrue();
                    done();
                }, 3000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityGestureEventTest_0600
         * @tc.name    AccessibilityGestureEventTest_0600
         * @tc.desc    The inject Gesture is 'rightThenLeft', test the received accessibility
         *             gesture event is 'rightThenLeft' and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityGestureEventTest_0600', 0, async function (done) {
            let caseName = 'AccessibilityGestureEventTest_0600';
            console.info(caseName + 'start');

            let gestureType = 'rightThenLeft';

            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    let gestureTypes = gestureEventTypes;
                    let findResult = false;
                    for (let eventType of gestureTypes) {
                        if (gestureType == eventType || gestureTypes.length != 0) {
                            findResult = true;
                        }
                    }
                    console.info('AccessibilityGestureEventTest_0600 case: ' + findResult);
                    expect(findResult).assertTrue();
                    done();
                }, 3000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityGestureEventTest_0700
         * @tc.name    AccessibilityGestureEventTest_0700
         * @tc.desc    The inject Gesture is 'rightThenUp', test the received accessibility
         *             gesture event is 'rightThenUp' and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityGestureEventTest_0700', 0, async function (done) {
            let caseName = 'AccessibilityGestureEventTest_0700';
            console.info(caseName + 'start');

            let gestureType = 'rightThenUp';

            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    let gestureTypes = gestureEventTypes;
                    let findResult = false;
                    for (let eventType of gestureTypes) {
                        if (gestureType == eventType || gestureTypes.length != 0) {
                            findResult = true;
                        }
                    }
                    console.info('AccessibilityGestureEventTest_0700 case: ' + findResult);
                    expect(findResult).assertTrue();
                    done();
                }, 3000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityGestureEventTest_0800
         * @tc.name    AccessibilityGestureEventTest_0800
         * @tc.desc    The inject Gesture is 'rightThenDown', test the received accessibility
         *             gesture event is 'rightThenDown' and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityGestureEventTest_0800', 0, async function (done) {
            let caseName = 'AccessibilityGestureEventTest_0800';
            console.info(caseName + 'start');

            let gestureType = 'rightThenDown';

            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    let gestureTypes = gestureEventTypes;
                    let findResult = false;
                    for (let eventType of gestureTypes) {
                        if (gestureType == eventType || gestureTypes.length != 0) {
                            findResult = true;
                        }
                    }
                    console.info('AccessibilityGestureEventTest_0800 case: ' + findResult);
                    expect(findResult).assertTrue();
                    done();
                }, 3000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityGestureEventTest_0900
         * @tc.name    AccessibilityGestureEventTest_0900
         * @tc.desc    The inject Gesture is 'up', test the received accessibility
         *             gesture event is 'up' and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityGestureEventTest_0900', 0, async function (done) {
            let caseName = 'AccessibilityGestureEventTest_0900';
            console.info(caseName + 'start');

            let gestureType = 'up';

            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    let gestureTypes = gestureEventTypes;
                    let findResult = false;
                    for (let eventType of gestureTypes) {
                        if (gestureType == eventType || gestureTypes.length != 0) {
                            findResult = true;
                        }
                    }
                    console.info('AccessibilityGestureEventTest_0900 case: ' + findResult);
                    expect(findResult).assertTrue();
                    done();
                }, 3000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityGestureEventTest_1000
         * @tc.name    AccessibilityGestureEventTest_1000
         * @tc.desc    The inject Gesture is 'upThenLeft', test the received accessibility
         *             gesture event is 'upThenLeft' and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityGestureEventTest_1000', 0, async function (done) {
            let caseName = 'AccessibilityGestureEventTest_1000';
            console.info(caseName + 'start');

            let gestureType = 'upThenLeft';

            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    let gestureTypes = gestureEventTypes;
                    let findResult = false;
                    for (let eventType of gestureTypes) {
                        if (gestureType == eventType || gestureTypes.length != 0) {
                            findResult = true;
                        }
                    }
                    console.info('AccessibilityGestureEventTest_1000 case: ' + findResult);
                    expect(findResult).assertTrue();
                    done();
                }, 3000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityGestureEventTest_1100
         * @tc.name    AccessibilityGestureEventTest_1100
         * @tc.desc    The inject Gesture is 'upThenRight', test the received accessibility
         *             gesture event is 'upThenRight' and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityGestureEventTest_1100', 0, async function (done) {
            let caseName = 'AccessibilityGestureEventTest_1100';
            console.info(caseName + 'start');

            let gestureType = 'upThenRight';

            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    let gestureTypes = gestureEventTypes;
                    let findResult = false;
                    for (let eventType of gestureTypes) {
                        if (gestureType == eventType || gestureTypes.length != 0) {
                            findResult = true;
                        }
                    }
                    console.info('AccessibilityGestureEventTest_1100 case: ' + findResult);
                    expect(findResult).assertTrue();
                    done();
                }, 3000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityGestureEventTest_1200
         * @tc.name    AccessibilityGestureEventTest_1200
         * @tc.desc    The inject Gesture is 'upThenDown', test the received accessibility
         *             gesture event is 'upThenDown' and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityGestureEventTest_1200', 0, async function (done) {
            let caseName = 'AccessibilityGestureEventTest_1200';
            console.info(caseName + 'start');

            let gestureType = 'upThenDown';

            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    let gestureTypes = gestureEventTypes;
                    let findResult = false;
                    for (let eventType of gestureTypes) {
                        if (gestureType == eventType || gestureTypes.length != 0) {
                            findResult = true;
                        }
                    }
                    console.info('AccessibilityGestureEventTest_1200 case: ' + findResult);
                    expect(findResult).assertTrue();
                    done();
                }, 3000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityGestureEventTest_1300
         * @tc.name    AccessibilityGestureEventTest_1300
         * @tc.desc    The inject Gesture is 'down', test the received accessibility
         *             gesture event is 'down' and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityGestureEventTest_1300', 0, async function (done) {
            let caseName = 'AccessibilityGestureEventTest_1300';
            console.info(caseName + 'start');

            let gestureType = 'down';

            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    let gestureTypes = gestureEventTypes;
                    let findResult = false;
                    for (let eventType of gestureTypes) {
                        if (gestureType == eventType || gestureTypes.length != 0) {
                            findResult = true;
                        }
                    }
                    console.info('AccessibilityGestureEventTest_1300 case: ' + findResult);
                    expect(findResult).assertTrue();
                    done();
                }, 3000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityGestureEventTest_1400
         * @tc.name    AccessibilityGestureEventTest_1400
         * @tc.desc    The inject Gesture is 'downThenLeft', test the received accessibility
         *             gesture event is 'downThenLeft' and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityGestureEventTest_1400', 0, async function (done) {
            let caseName = 'AccessibilityGestureEventTest_1400';
            console.info(caseName + 'start');

            let gestureType = 'downThenLeft';

            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    let gestureTypes = gestureEventTypes;
                    let findResult = false;
                    for (let eventType of gestureTypes) {
                        if (gestureType == eventType || gestureTypes.length != 0) {
                            findResult = true;
                        }
                    }
                    console.info('AccessibilityGestureEventTest_1400 case: ' + findResult);
                    expect(findResult).assertTrue();
                    done();
                }, 3000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityGestureEventTest_1500
         * @tc.name    AccessibilityGestureEventTest_1500
         * @tc.desc    The inject Gesture is 'downThenRight', test the received accessibility
         *             gesture event is 'downThenRight' and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityGestureEventTest_1500', 0, async function (done) {
            let caseName = 'AccessibilityGestureEventTest_1500';
            console.info(caseName + 'start');

            let gestureType = 'downThenRight';

            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    let gestureTypes = gestureEventTypes;
                    let findResult = false;
                    for (let eventType of gestureTypes) {
                        if (gestureType == eventType || gestureTypes.length != 0) {
                            findResult = true;
                        }
                    }
                    console.info('AccessibilityGestureEventTest_1500 case: ' + findResult);
                    expect(findResult).assertTrue();
                    done();
                }, 3000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityGestureEventTest_1600
         * @tc.name    AccessibilityGestureEventTest_1600
         * @tc.desc    The inject Gesture is 'downThenUp', test the received accessibility
         *             gesture event is 'downThenUp' and return void. 
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityGestureEventTest_1600', 0, async function (done) {
            let caseName = 'AccessibilityGestureEventTest_1600';
            console.info(caseName + 'start');

            let gestureType = 'downThenUp';

            if (isConnect) {
                publishCaseExecute(caseName);

                setTimeout(() => {
                    let gestureTypes = gestureEventTypes;
                    let findResult = false;
                    for (let eventType of gestureTypes) {
                        if (gestureType == eventType || gestureTypes.length != 0) {
                            findResult = true;
                        }
                    }
                    console.info('AccessibilityGestureEventTest_1600 case: ' + findResult);
                    expect(findResult).assertTrue();
                    done();
                }, 3000);
            } else {
                console.error(caseName + ': extension not connected');
                expect(null).assertFail();
                done();
            }
        })

        /*
         * @tc.number  AccessibilityGestureEventTest_1700
         * @tc.name    AccessibilityGestureEventTest_1700
         * @tc.desc    test positionX positionX
         * @tc.size    SmallTest
         * @tc.type    User
         */
        it('AccessibilityGestureEventTest_1700', 0, async function (done) {
            let caseName = 'AccessibilityGestureEventTest_1700';
            console.info(caseName + 'start');

            let gesturePoint = new GesturePoint(676, 735);
            expect(gesturePoint.positionX == 676).assertTrue();
            expect(gesturePoint.positionY == 735).assertTrue();

            let gesturePath = new GesturePath(100);
            expect(gesturePath.durationTime == 100).assertTrue();

            gesturePath.points.push(new GesturePoint(676, 735),
                new GesturePoint(567, 729),
                new GesturePoint(444, 719),
                new GesturePoint(255, 714),
                new GesturePoint(153, 715),
                new GesturePoint(15, 729));
            expect(gesturePath.points.length == 6).assertTrue();
			console.info(caseName + 'start');
            done();
        })
    })
}
