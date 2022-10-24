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

export default function AVSessionManagerCallback() {
    describe('AVSessionManagerCallback', function () {
        let tag = 'ApplicationA';
        let type = 'audio';
        let id = 9527;
        let keyItem = {code:10, pressedTime:123456789, deviceId:0};
        let event = {action:2, key:keyItem, keys:[keyItem]};
        let context = featureAbility.getContext();

        function sleep (ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        beforeAll(function () {
            console.info('TestLog: Start Testing AVSessionManager Interfaces');
        })

        beforeEach(function () {
            console.info('TestLog: Start testing testcase');
        })

        afterEach(async function (done) {
            console.info('TestLog: End testing testcase');
            await sleep(1000);
            done();
        })

        afterAll(function () {
            console.info('TestLog: End Testing AVSessionManager Interfaces');
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_0100
         * @tc.name      : CREATEAVSESSION_0100
         * @tc.desc      : Testing createAVSession with right parameter - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_0100', 0, async function (done) {
            let session;
            avSession.createAVSession(context, tag, type, (err, value) => {
                if (err) {
                    console.info(`TestLog: AVSession created error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue()
                } else if (value.sessionId.length === 64){
                    session = value;
                    console.info(`TestLog: AVSession :${session.sessionId}created successfully`);
                    expect(true).assertTrue()
                } else {
                    console.info('TestLog: AVSession created failed');
                    expect(false).assertTrue();
                }
            });
            await sleep(500);
            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
                console.info(`TestLog: AVSession :${session.sessionId}destroyed successfully`);
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })
        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_0200
         * @tc.name      : CREATEAVSESSION_0200
         * @tc.desc      : Testing createAVSession with wrong type - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_0200', 0, async function (done) {
            avSession.createAVSession(context, tag, 'aaa', (err, data) => {
                if (err) {
                    console.info(`TestLog: AVSession created error: code: ${err.code}, message: ${err.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: AVSession ${data.sessionId} created successfully`);
                    expect(false).assertTrue();
                }
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_0300
         * @tc.name      : CREATEAVSESSION_0300
         * @tc.desc      : Testing createAVSession with wrong parameter - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_0300', 0, async function (done) {
            avSession.createAVSession(context, '', type, (err, data) => {
                if (err) {
                    console.info(`TestLog: AVSession created error: code: ${err.code}, message: ${err.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: AVSession ${data.sessionId} created successfully`);
                    expect(false).assertTrue();
                }
                done();
            });
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETALLSESSIONDESCRIPTORS_CALLBACK_0100
         * @tc.name      : GETALLSESSIONDESCRIPTORS_0100
         * @tc.desc      : Testing get sessionDescriptors - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETALLSESSIONDESCRIPTORS_CALLBACK_0100', 0, async function (done) {
            let session;
            avSession.createAVSession(context, 'ApplicationB', type, (err, value) => {
                if (err) {
                    console.info(`TestLog: Session Created error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    session = value;
                }
            });
            await sleep(500);
            avSession.getAllSessionDescriptors((err, descriptors) => {
                if (err) {
                    console.info(`TestLog: Get AllSessionDescriptors error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (descriptors[0].isActive === false && descriptors[0].type === 'audio'
                    && descriptors[0].sessionTag === 'ApplicationB') {
                    console.info('TestLog: Get AllSessionDescriptors successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get AllSessionDescriptors failed');
                    expect(false).assertTrue();
                }

            });
            await sleep(500);
            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
                console.info(`TestLog: AVSession :${session.sessionId}destroyed successfully`);
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CREATECONTROLLER_CALLBACK_0100
         * @tc.name      : CREATECONTROLLER_0100
         * @tc.desc      : Testing creat session controller - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATECONTROLLER_CALLBACK_0100', 0, async function (done) {
            avSession.createController(id, (err, controller) => {
                if (err) {
                    console.info(`TestLog: Controller created error: code: ${err.code}, message: ${err.message}`);
                    expect(true).assertTrue();
                } else if (controller.sessionId === id) {
                    console.info('TestLog: Controller created successfully');
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Controller created failed');
                    expect(false).assertTrue();
                }
            })
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CREATECONTROLLER_CALLBACK_0200
         * @tc.name      : CREATECONTROLLER_0200
         * @tc.desc      : Testing creat session controller - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATECONTROLLER_CALLBACK_0200', 0, async function (done) {
            let session;
            let controller;
            avSession.createAVSession(context, tag, type, (err, value) => {
                if (err) {
                    console.info(`TestLog: AVSession created error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    session = value;
                }
                done();
            });
            await sleep(500);
            avSession.createController(session.sessionId, (err, value) => {
                if (err) {
                    console.info(`TestLog: Controller created error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.sessionId === session.sessionId) {
                    console.info('TestLog: Controller created successfully');
                    controller = value;
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Controller created failed');
                    expect(false).assertTrue();
                }
            });
            await sleep(500);
            session.destroy((err) => {
                if (err) {
                    console.info(`TestLog: session destroy error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: session destroy successfully');
                    console.info(`TestLog: AVSession :${session.sessionId}destroyed successfully`);
                }
            });
            await sleep(500);
            controller.destroy((err) => {
                if (err) {
                    console.info(`TestLog: controller destroy error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: controller destroy successfully');
                }
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMAVKEYEVENT_CALLBACK_0100
         * @tc.name      : SENDSYSTEMAVKEYEVENT_0100
         * @tc.desc      : Testing send systemKeyEvent - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMAVKEYEVENT_CALLBACK_0100', 0, async function (done) {
            let session;
            avSession.createAVSession(context, tag, type, (err, value) => {
                if (err) {
                    console.info(`TestLog: AVSession created error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    session = value;
                }
                done();
            });

            await sleep(500);

            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
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

            avSession.sendSystemAVKeyEvent(event, (err) => {
                if (err) {
                    console.info(`TestLog: Send System KeyEvent error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Send System KeyEvent');
                }
            });
            await sleep(500);

            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
                console.info(`TestLog: AVSession :${session.sessionId}destroyed successfully`);
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_CALLBACK_0100
         * @tc.name      : SENDSYSTEMCONTROLCOMMAND_0100
         * @tc.desc      : Testing send system control command - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_CALLBACK_0100', 0, async function (done) {
            let session;
            avSession.createAVSession(context, tag, type, (err, value) => {
                if (err) {
                    console.info(`TestLog: Session created error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    session = value;
                }
            });
            await sleep(500);

            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            session.on('play', () => {
                console.info('TestLog: Play command callback registration successful');
            });

            avSession.sendSystemControlCommand({command:'play'}, (err) => {
                if (err) {
                    console.info(`TestLog: Send System control command error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Send System control command successfully');
                    expect(true).assertTrue();
                }
            });
            await sleep(500);
            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
                console.info(`TestLog: AVSession :${session.sessionId}destroyed successfully`);
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_CALLBACK_0200
         * @tc.name      : SENDSYSTEMCONTROLCOMMAND_0200
         * @tc.desc      : Testing send system control command - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_CALLBACK_0200', 0, async function (done) {
            let session;
            avSession.createAVSession(context, tag, type, (err, value) => {
                if (err) {
                    console.info(`TestLog: Session created error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    session = value;
                }
            });
            await sleep(500);

            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            session.on('pause', () => {
                console.info('TestLog: Pause command callback registration successful');
            });

            avSession.sendSystemControlCommand({command:'pause'}, (err) => {
                if (err) {
                    console.info(`TestLog: Send System control command error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Send System control command successfully');
                    expect(true).assertTrue();
                }
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
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_CALLBACK_0300
         * @tc.name      : SENDSYSTEMCONTROLCOMMAND_0300
         * @tc.desc      : Testing send system control command - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_CALLBACK_0300', 0, async function (done) {
            let session;
            avSession.createAVSession(context, tag, type, (err, value) => {
                if (err) {
                    console.info(`TestLog: Session created error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    session = value;
                }
            });
            await sleep(500);

            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            session.on('stop', () => {
                console.info('TestLog: stop command callback registration successful');
            });

            avSession.sendSystemControlCommand({command:'stop'}, (err) => {
                if (err) {
                    console.info(`TestLog: Send System control command error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Send System control command successfully');
                    expect(true).assertTrue();
                }
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
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_CALLBACK_0400
         * @tc.name      : SENDSYSTEMCONTROLCOMMAND_0400
         * @tc.desc      : Testing send system control command - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_CALLBACK_0400', 0, async function (done) {
            let session;
            avSession.createAVSession(context, tag, type, (err, value) => {
                if (err) {
                    console.info(`TestLog: Session created error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    session = value;
                }
            });
            await sleep(500);

            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            session.on('playNext', () => {
                console.info('TestLog: playNext command callback registration successful');
            });

            avSession.sendSystemControlCommand({command:'playNext'}, (err) => {
                if (err) {
                    console.info(`TestLog: Send System control command error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Send System control command successfully');
                    expect(true).assertTrue();
                }
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
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_CALLBACK_0500
         * @tc.name      : SENDSYSTEMCONTROLCOMMAND_0500
         * @tc.desc      : Testing send system control command - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_CALLBACK_0500', 0, async function (done) {
            let session;
            avSession.createAVSession(context, tag, type, (err, value) => {
                if (err) {
                    console.info(`TestLog: Session created error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    session = value;
                }
            });
            await sleep(500);

            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            session.on('playPrevious', () => {
                console.info('TestLog: playPrevious command callback registration successful');
            });

            avSession.sendSystemControlCommand({command:'playPrevious'}, (err) => {
                if (err) {
                    console.info(`TestLog: Send System control command error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Send System control command successfully');
                    expect(true).assertTrue();
                }
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
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_CALLBACK_0600
         * @tc.name      : SENDSYSTEMCONTROLCOMMAND_0600
         * @tc.desc      : Testing send system control command - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_CALLBACK_0600', 0, async function (done) {
            let session;
            avSession.createAVSession(context, tag, type, (err, value) => {
                if (err) {
                    console.info(`TestLog: Session created error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    session = value;
                }
            });
            await sleep(500);

            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            session.on('fastForward', () => {
                console.info('TestLog: fastForward command callback registration successful');
            });

            avSession.sendSystemControlCommand({command:'fastForward'}, (err) => {
                if (err) {
                    console.info(`TestLog: Send System control command error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Send System control command successfully');
                    expect(true).assertTrue();
                }
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
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_CALLBACK_0700
         * @tc.name      : SENDSYSTEMCONTROLCOMMAND_0700
         * @tc.desc      : Testing send system control command - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_CALLBACK_0700', 0, async function (done) {
            let session;
            avSession.createAVSession(context, tag, type, (err, value) => {
                if (err) {
                    console.info(`TestLog: Session created error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    session = value;
                }
            });
            await sleep(500);

            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            session.on('rewind', () => {
                console.info('TestLog: rewind command callback registration successful');
            });

            avSession.sendSystemControlCommand({command:'rewind'}, (err) => {
                if (err) {
                    console.info(`TestLog: Send System control command error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Send System control command successfully');
                    expect(true).assertTrue();
                }
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
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_CALLBACK_0800
         * @tc.name      : SENDSYSTEMCONTROLCOMMAND_0800
         * @tc.desc      : Testing send system control command - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_CALLBACK_0800', 0, async function (done) {
            let session;
            avSession.createAVSession(context, tag, type, (err, value) => {
                if (err) {
                    console.info(`TestLog: Session created error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    session = value;
                }
            });
            await sleep(500);

            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            session.on('seek', (callback) => {
                console.info('TestLog: seek command callback registration successful');
            });


            avSession.sendSystemControlCommand({command:'seek', parameter:10}, (err) => {
                if (err) {
                    console.info(`TestLog: Send System control command error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Send System control command successfully');
                    expect(true).assertTrue();
                }
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
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_CALLBACK_0900
         * @tc.name      : SENDSYSTEMCONTROLCOMMAND_0900
         * @tc.desc      : Testing send system control command - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_CALLBACK_0900', 0, async function (done) {
            let session;
            avSession.createAVSession(context, tag, type, (err, value) => {
                if (err) {
                    console.info(`TestLog: Session created error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    session = value;
                }
            });
            await sleep(500);

            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            session.on('setSpeed', (callback) => {
                console.info('TestLog: setSpeed command callback registration successful');
            });

            avSession.sendSystemControlCommand({command:'setSpeed', parameter:2.6}, (err) => {
                if (err) {
                    console.info(`TestLog: Send System control command error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Send System control command successfully');
                    expect(true).assertTrue();
                }
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
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_CALLBACK_1000
         * @tc.name      : SENDSYSTEMCONTROLCOMMAND_1000
         * @tc.desc      : Testing send system control command - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_CALLBACK_1000', 0, async function (done) {
            let session;
            avSession.createAVSession(context, tag, type, (err, value) => {
                if (err) {
                    console.info(`TestLog: Session created error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    session = value;
                }
            });
            await sleep(500);

            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            session.on('setLoopMode', (callback) => {
                console.info('TestLog: setLoopMode command callback registration successful');
            });

            avSession.sendSystemControlCommand({command:'setLoopMode', parameter:
                avSession.LoopMode.LOOP_MODE_SINGLE}, (err) => {
                if (err) {
                    console.info(`TestLog: Send System control command error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Send System control command successfully');
                    expect(true).assertTrue();
                }
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
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_CALLBACK_1100
         * @tc.name      : SENDSYSTEMCONTROLCOMMAND_1100
         * @tc.desc      : Testing send system control command - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDSYSTEMCONTROLCOMMAND_CALLBACK_1100', 0, async function (done) {
            let session;
            avSession.createAVSession(context, tag, type, (err, value) => {
                if (err) {
                    console.info(`TestLog: Session created error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    session = value;
                }
            });
            await sleep(500);

            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            session.on('toggleFavorite', (callback) => {
                console.info('TestLog: toggleFavorite command callback registration successful');
            });

            avSession.sendSystemControlCommand({command:'toggleFavorite', parameter:'false'}, (err) => {
                if (err) {
                    console.info(`TestLog: Send System control command error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Send System control command successfully');
                    expect(true).assertTrue();
                }
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