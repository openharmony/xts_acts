/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:// www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import avSession from '@ohos.multimedia.avsession';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';
import featureAbility from '@ohos.ability.featureAbility';

export default function AVSessionManager() {
    describe('AVSessionManager', function () {
        let tag = 'ApplicationA';
        let type = 'audio';
        let session;
        let controller;
        let id = '9527';
        let keyItem = {code:10, pressedTime:123456789, deviceId:0};
        let event = {action:2, key:keyItem, keys:[keyItem]};
        let context = featureAbility.getContext();

        function sleep (ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        beforeAll(function () {
            console.info('TestLog: Start Testing avSessionManager Interfaces');
        })

        beforeEach(function () {
            console.info('TestLog: Start testing testcase');
        })

        afterEach(function () {
            console.info('TestLog: End testing testcase');
        })

        afterAll(function () {
            console.info('TestLog: End Testing avSessionManager Interfaces');
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0100
         * @tc.name      : CREATEAVSESSION_0100
         * @tc.desc      : Testing createavSession with right parameter - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0100', 0, async function (done) {
            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
                if(session.sessionId.length === 64) {
                    console.info('TestLog: avSession create successfully');
                    expect(true).assertTrue();
                }
                else {
                    console.info('TestLog: avSession create failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: avSession create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })
        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0200
         * @tc.name      : CREATEAVSESSION_0200
         * @tc.desc      : Testing createavSession with wrong type
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0200', 0, async function (done) {
            await avSession.createAVSession(context, tag, 'aaa').then((data) => {
                console.info('TestLog: avSession create successfully');
            }).catch((err) => {
                console.info(`TestLog: avSession create error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0300
         * @tc.name      : CREATEAVSESSION_0300
         * @tc.desc      : Testing createavSession with wrong parameter
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0300', 0, async function (done) {
            await avSession.createAVSession(context, '', type).then((data) => {
                console.info('TestLog: avSession create successfully');
            }).catch((err) => {
                console.info(`TestLog: avSession create error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETALLSESSIONDESCRIPTORS_PROMISE_0100
         * @tc.name      : GETALLSESSIONDESCRIPTORS_0100
         * @tc.desc      : Testing get sessionDescriptors - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETALLSESSIONDESCRIPTORS_PROMISE_0100', 0, async function (done) {
            await avSession.createAVSession(context, 'ApplicationB', type).then((data) => {
                session = data;
            }).catch((err) => {
                console.info(`TestLog: Session Create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await avSession.getAllSessionDescriptors().then((descriptors) => {
                if (descriptors[0].isActive === false && descriptors[0].type === 'audio'
                    && descriptors[0].sessionTag === 'ApplicationB') {
                    console.info('TestLog: Get AllSessionDescriptors successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get AllSessionDescriptors failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get AllSessionDescriptors error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CREATECONTROLLER_PROMISE_0100
         * @tc.name      : CREATECONTROLLER_0100
         * @tc.desc      : Testing creat session controller - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATECONTROLLER_PROMISE_0100', 0, async function (done) {
            await avSession.createController(id).then((controller) => {
                if (controller.sessionId.length === 64) {
                    console.info('TestLog: Controller create successfully');
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Controller create failed');
                    expect(true).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Controller create error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CREATECONTROLLER_PROMISE_0200
         * @tc.name      : CREATECONTROLLER_0200
         * @tc.desc      : Testing creat session controller - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATECONTROLLER_PROMISE_0200', 0, async function (done) {
            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
            }).catch((err) => {
                console.info(`TestLog: avSession create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await avSession.createController(session.sessionId).then((data) => {
                controller = data;
                if (controller.sessionId === session.sessionId) {
                    console.info('TestLog: Controller create successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Controller create failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Controller create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await controller.destroy().then(() => {
                console.info('TestLog: controller Destroy SUCCESS');
            }).catch((err) => {
                console.info(`TestLog: controller Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONWRONGCALLBACK_0100
         * @tc.name      : ONWRONGCALLBACK_0100
         * @tc.desc      : Testing wrong callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONWRONGCALLBACK_0100', 0, function (done) {
            try {
                avSession.on('wrongCall', () => {
                    console.info('TestLog: Wrong callback registration successful');
                    expect(false).assertTrue();
                });
            } catch (err) {
                console.info(`TestLog: Wrong callback registration error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
                done();
            }
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONSESSIONCREATE_0100
         * @tc.name      : ONSESSIONCREATE_0100
         * @tc.desc      : Testing session create Callback registration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level1
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSESSIONCREATE_0100', 0, async function (done) {
            let newSessionId;
            avSession.on('sessionCreate', (descriptor) => {
                console.info(`TestLog: descriptor.sessionId = ${descriptor.sessionId}`);
                newSessionId = descriptor.sessionId;
            });

            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
                console.info('TestLog: Session create successfully');
            }).catch((err) => {
                console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            if (newSessionId === session.sessionId) {
                console.info('TestLog: sessionId equels');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: sessionId not equels');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONSESSIONDESTROY_0100
         * @tc.name      : ONSESSIONDESTROY_0100
         * @tc.desc      : Testing session destroy Callback registration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSESSIONDESTROY_0100', 0, async function (done) {
            avSession.on('sessionDestroy', (callback) => {
                if (callback.sessionId === session.sessionId) {
                    console.info(`TestLog: Session: ${callback.sessionId} destroy callback registration successful`);
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Session destroy callback registration failed');
                    expect(false).assertTrue();
                }
            });

            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONTOPSESSIONCHANGE_0100
         * @tc.name      : ONTOPSESSIONCHANGE_0100
         * @tc.desc      : Testing top session change Callback registration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONTOPSESSIONCHANGE_0100', 0, async function (done) {
            avSession.on('topSessionChange', (callback) => {
                if (callback.sessionId.length === 64) {
                    console.info(`TestLog: Session: ${callback.sessionId} is top session now`);
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Top session change callback registration failed');
                    expect(false).assertTrue();
                }
            });

            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
                console.info('TestLog: Session create successfully');
            }).catch((err) => {
                console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);

            avSession.off('topSessionChange');
            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFSESSIONCREATE_0100
         * @tc.name      : OFFSESSIONCREATE_0100
         * @tc.desc      : Testing session create Callback unRegistration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level1
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSESSIONCREATE_0100', 0, async function (done) {
            let flag = true;
            function callback1(callback) {
                console.info(`TestLog: Session: ${callback.sessionId} created`);
                flag = false;
            }

            function callback2(callback) {
                console.info(`TestLog: Session: ${callback.sessionId} created`);
                flag = false;
            }

            avSession.on('sessionCreate', callback1);

            avSession.on('sessionCreate', callback2);

            avSession.off('sessionCreate');

            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
                console.info('TestLog: Session create successfully');
            }).catch((err) => {
                console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            if (flag) {
                console.info('TestLog: Session created callback unRegistration successful');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Session created callback unRegistration failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFSESSIONDESTROY_0100
         * @tc.name      : OFFSESSIONDESTROY_0100
         * @tc.desc      : Testing session destroy Callback unRegistration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSESSIONDESTROY_0100', 0, async function (done) {
            let flag = true;
            function callback1(callback) {
                console.info(`TestLog: Session: ${callback.sessionId} destroyed`);
                flag = false;
            }

            function callback2(callback) {
                console.info(`TestLog: Session: ${callback.sessionId} destroyed`);
                flag = false;
            }

            avSession.on('sessionDestroy', callback1);

            avSession.on('sessionDestroy', callback2);

            avSession.off('sessionDestroy');

            await session.destroy().then(() => {
                console.info('TestLog: Session destroy successfully');
            }).catch((err) => {
                console.info(`TestLog: Session destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            if (flag) {
                console.info('TestLog: Session destroy callback unRegistration successful');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Session destroy callback unRegistration failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFSESSIONCREATE_0200
         * @tc.name      : OFFSESSIONCREATE_0200
         * @tc.desc      : Testing session create Callback unRegistration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSESSIONCREATE_0200', 0, async function (done) {
            function callback1(callback) {
                console.info(`TestLog: Session: ${callback.sessionId} created`);
                expect(false).assertTrue();
            }

            function callback2(callback) {
                console.info(`TestLog: Session: ${callback.sessionId} created`);
                expect(true).assertTrue();
            }

            avSession.on('sessionCreate', callback1);

            avSession.on('sessionCreate', callback2);

            avSession.off('sessionCreate', callback1);

            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
                console.info('TestLog: Session create successfully');
            }).catch((err) => {
                console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(100);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFSESSIONDESTROY_0200
         * @tc.name      : OFFSESSIONDESTROY_0200
         * @tc.desc      : Testing session destroy Callback unRegistration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSESSIONDESTROY_0200', 0, async function (done) {
            function callback1(callback) {
                console.info(`TestLog: Session: ${callback.sessionId} destroyed`);
                expect(false).assertTrue();
            }

            function callback2(callback) {
                console.info(`TestLog: Session: ${callback.sessionId} destroyed`);
                expect(true).assertTrue();
            }

            avSession.on('sessionDestroy', callback1);

            avSession.on('sessionDestroy', callback2);

            avSession.off('sessionDestroy', callback1);

            await session.destroy().then(() => {
                console.info('TestLog: Session destroy successfully');
            }).catch((err) => {
                console.info(`TestLog: Session destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFTOPSESSIONCHANGE_0100
         * @tc.name      : OFFTOPSESSIONCHANGE_0100
         * @tc.desc      : Testing top session change Callback unRegistration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFTOPSESSIONCHANGE_0100', 0, async function (done) {
            let flag = true;
            function callback1(callback) {
                if (callback.sessionId.length === 64) {
                    console.info(`TestLog: Session:${callback.sessionId} is top session now`);
                    flag = false;
                } else {
                    console.info('TestLog: Top session change callback registration failed');
                    flag = false;
                }
            }

            function callback2(callback) {
                if (callback.sessionId.length === 64) {
                    console.info(`TestLog: Session:${callback.sessionId}is top session now`);
                    flag = false;
                } else {
                    console.info('TestLog: Top session change callback registration failed');
                    flag = false;
                }
            }
            avSession.on('topSessionChange', callback1);

            avSession.on('topSessionChange', callback2);

            avSession.off('topSessionChange');

            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
                console.info('TestLog: Session create successfully');
            }).catch((err) => {
                console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);

            if (flag) {
                console.info('TestLog: Top session change callback unRegistration successfully');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Top session change callback unRegistration failed');
                expect(false).assertTrue();
            }

            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFTOPSESSIONCHANGE_0200
         * @tc.name      : OFFTOPSESSIONCHANGE_0200
         * @tc.desc      : Testing top session change Callback unRegistration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFTOPSESSIONCHANGE_0200', 0, async function (done) {
            function callback1(callback) {
                if (callback.sessionId.length === 64) {
                    console.info(`TestLog: Session:${callback.sessionId} is top session now`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Top session change callback registration failed');
                    expect(false).assertTrue();
                }
            }

            function callback2(callback) {
                if (callback.sessionId.length === 64) {
                    console.info(`TestLog: Session:${callback.sessionId}is top session now`);
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Top session change callback registration failed');
                    expect(false).assertTrue();
                }
            }
            avSession.on('topSessionChange', callback1);

            avSession.on('topSessionChange', callback2);

            avSession.off('topSessionChange', callback1);

            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
                console.info('TestLog: Session create successfully');
            }).catch((err) => {
                console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);

            avSession.off('topSessionChange', callback2);

            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMAVKEYEVENT_PROMISE_0100
         * @tc.name      : SENDSYSTEMAVKEYEVENT_0100
         * @tc.desc      : Testing send systemKeyEvent - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMAVKEYEVENT_PROMISE_0100', 0, async function (done) {
            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
            }).catch((err) => {
                console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
            });

            session.on('handleKeyEvent', (callback) => {
                if (callback.action === 2) {
                    console.info('TestLog: Send System keyEvent successful');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Send System keyEvent failed');
                    expect(false).assertTrue();
                }
            });

            await avSession.sendSystemAVKeyEvent(event).then(() => {
                console.info('TestLog: Send System KeyEvent');
            }).catch((err) => {
                console.info(`TestLog: Send System KeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_PROMISE_0100
         * @tc.name      : SENDSYSTEMCONTROLCOMMAND_0100
         * @tc.desc      : Testing send system control command - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_PROMISE_0100', 0, async function (done) {
            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
            }).catch((err) => {
                console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
            });

            session.on('play', () => {
                console.info('TestLog: Play command callback registration successful');
                expect(true).assertTrue();
            });

            await avSession.sendSystemControlCommand({command:'play'}).then(() => {
                console.info('TestLog: Send System control command successfully');
            }).catch((err) => {
                console.info(`TestLog: Send System control command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);
            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_PROMISE_0200
         * @tc.name      : SENDSYSTEMCONTROLCOMMAND_0200
         * @tc.desc      : Testing send system control command - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_PROMISE_0200', 0, async function (done) {
            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
            }).catch((err) => {
                console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
            });

            session.on('pause', () => {
                console.info('TestLog: Pause command callback registration successful');
                expect(true).assertTrue();
            });

            await avSession.sendSystemControlCommand({command:'pause'}).then(() => {
                console.info('TestLog: Send System control command successfully');
            }).catch((err) => {
                console.info(`TestLog: Send System control command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_PROMISE_0300
         * @tc.name      : SENDSYSTEMCONTROLCOMMAND_0300
         * @tc.desc      : Testing send system control command - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_PROMISE_0300', 0, async function (done) {
            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
            }).catch((err) => {
                console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
            });

            session.on('stop', () => {
                console.info('TestLog: stop command callback registration successful');
                expect(true).assertTrue();
            });

            await avSession.sendSystemControlCommand({command:'stop'}).then(() => {
                console.info('TestLog: Send System control command successfully');
            }).catch((err) => {
                console.info(`TestLog: Send System control command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_PROMISE_0400
         * @tc.name      : SENDSYSTEMCONTROLCOMMAND_0400
         * @tc.desc      : Testing send system control command - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_PROMISE_0400', 0, async function (done) {
            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
            }).catch((err) => {
                console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
            });

            session.on('playNext', () => {
                console.info('TestLog: playNext command callback registration successful');
                expect(true).assertTrue();
            });

            await avSession.sendSystemControlCommand({command:'playNext'}).then(() => {
                console.info('TestLog: Send System control command successfully');
            }).catch((err) => {
                console.info(`TestLog: Send System control command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_PROMISE_0500
         * @tc.name      : SENDSYSTEMCONTROLCOMMAND_0500
         * @tc.desc      : Testing send system control command - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_PROMISE_0500', 0, async function (done) {
            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
            }).catch((err) => {
                console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
            });

            session.on('playPrevious', () => {
                console.info('TestLog: playPrevious command callback registration successful');
                expect(true).assertTrue();
            });

            await avSession.sendSystemControlCommand({command:'playPrevious'}).then(() => {
                console.info('TestLog: Send System control command successfully');
            }).catch((err) => {
                console.info(`TestLog: Send System control command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_PROMISE_0600
         * @tc.name      : SENDSYSTEMCONTROLCOMMAND_0600
         * @tc.desc      : Testing send system control command - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_PROMISE_0600', 0, async function (done) {
            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
            }).catch((err) => {
                console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
            });

            session.on('fastForward', () => {
                console.info('TestLog: fastForward command callback registration successful');
                expect(true).assertTrue();
            });

            await avSession.sendSystemControlCommand({command:'fastForward'}).then(() => {
                console.info('TestLog: Send System control command successfully');
            }).catch((err) => {
                console.info(`TestLog: Send System control command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_PROMISE_0700
         * @tc.name      : SENDSYSTEMCONTROLCOMMAND_0700
         * @tc.desc      : Testing send system control command - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_PROMISE_0700', 0, async function (done) {
            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
            }).catch((err) => {
                console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
            });

            session.on('rewind', () => {
                console.info('TestLog: rewind command callback registration successful');
                expect(true).assertTrue();
            });

            await avSession.sendSystemControlCommand({command:'rewind'}).then(() => {
                console.info('TestLog: Send System control command successfully');
            }).catch((err) => {
                console.info(`TestLog: Send System control command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_PROMISE_0800
         * @tc.name      : SENDSYSTEMCONTROLCOMMAND_0800
         * @tc.desc      : Testing send system control command - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_PROMISE_0800', 0, async function (done) {
            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
            }).catch((err) => {
                console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
            });

            session.on('seek', (callback) => {
                if (callback === 10) {
                    console.info('TestLog: Get seek command successfully');
                    expect(true).assertTrue();
                }
            });

            await avSession.sendSystemControlCommand({command:'seek', parameter:10}).then(() => {
                console.info('TestLog: Send System control command successfully');
            }).catch((err) => {
                console.info(`TestLog: Send System control command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_PROMISE_0900
         * @tc.name      : SENDSYSTEMCONTROLCOMMAND_0900
         * @tc.desc      : Testing send system control command - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_PROMISE_0900', 0, async function (done) {
            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
            }).catch((err) => {
                console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
            });

            session.on('setSpeed', (callback) => {
                if (callback === 2.6) {
                    console.info('TestLog: Get setSpeed command successfully');
                    expect(true).assertTrue();
                }
            });

            await avSession.sendSystemControlCommand({command:'setSpeed', parameter:2.6}).then(() => {
                console.info('TestLog: Send System control command successfully');
            }).catch((err) => {
                console.info(`TestLog: Send System control command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_PROMISE_1000
         * @tc.name      : SENDSYSTEMCONTROLCOMMAND_1000
         * @tc.desc      : Testing send system control command - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_PROMISE_1000', 0, async function (done) {
            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
            }).catch((err) => {
                console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
            });

            session.on('setLoopMode', (callback) => {
                if (callback === 1) {
                    console.info('TestLog: Get setLoopMode command successfully');
                    expect(true).assertTrue();
                }
            });

            await avSession.sendSystemControlCommand({command:'setLoopMode', parameter:
                avSession.LoopMode.LOOP_MODE_SINGLE}).then(() => {
                console.info('TestLog: Send System control command successfully');
            }).catch((err) => {
                console.info(`TestLog: Send System control command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_PROMISE_1100
         * @tc.name      : SENDSYSTEMCONTROLCOMMAND_1100
         * @tc.desc      : Testing send system control command - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_PROMISE_1100', 0, async function (done) {
            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
            }).catch((err) => {
                console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
            });

            session.on('toggleFavorite', (callback) => {
                if (callback === 'false') {
                    console.info('TestLog: Get toggleFavorite command successfully');
                    expect(true).assertTrue();
                }
            });

            await avSession.sendSystemControlCommand({command:'toggleFavorite', parameter:'false'}).then(() => {
                console.info('TestLog: Send System control command successfully');
            }).catch((err) => {
                console.info(`TestLog: Send System control command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })
    })
}