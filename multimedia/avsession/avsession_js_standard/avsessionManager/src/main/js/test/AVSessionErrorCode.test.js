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

export default function AVSessionErrorCode() {
    describe('AVSessionErrorCode', function () {
        let tag = 'ApplicationA';
        let type = 'audio';
        let session;
		let pid = 100;
		let uid = 200;
		let audioDevices;
		let sessionToken;
        let controller;
        let id = '9527';
        let sessionId;
        let keyItem = {code:10, pressedTime:123456789, deviceId:0};
        let event = {action:2, key:keyItem, keys:[keyItem]};
        let context = featureAbility.getContext();

        function sleep (ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        beforeAll(function () {
            console.info('TestLog: Start Testing avSession Interfaces');

        })

        beforeEach(async function () {
            console.info('TestLog: Init Session And Controller');
            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
            }).catch((err) => {
				expect(err.code == 6600101).assertTrue();
                console.info(avSession.AVSessionErrorCode.ERR_CODE_SERVICE_EXCEPTION);
                console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            controller = await session.getController();
        })

        afterEach(async function (done) {
            console.info('TestLog: Destroy Session And Controller');
            if(session){
                await session.destroy().then(() => {
                console.info('TestLog: Session destroy success');
            }).catch((err) => {
                console.info(`TestLog: Session destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
        }
        if(controller){
            await controller.destroy().then(() => {
                console.info('TestLog: Controller destroy success');
            }).catch((err) => {
                console.info(`TestLog: Controller destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
        }
            done();
        })

        afterAll(function () {
            console.info('TestLog: End Testing avSession Interfaces');
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0100
         * @tc.name      : SETMETADATA_0100
         * @tc.desc      : Testing set metadata - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0100', 0, async function (done) {
            let metadata1 = {
                assetId: '121278',
            };
			
            await sleep(500);
            await session.setAVMetadata(metadata1).then(() => {
                console.info('TestLog: Set metadata successfully');
                expect(true).assertTrue();
            }).catch((err) => {
                expect(err.code == 6600102).assertTrue();
                console.info(avSession.AVSessionErrorCode.ERR_CODE_SESSION_NOT_EXIST);
                console.info(`TestLog: Set metadata error: code: ${err.code}, message: ${err.message}`);
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_DESTROYCONTROLLER_PROMISE_0100
         * @tc.name      : DESTROYCONTROLLER_0100
         * @tc.desc      : Testing destroy the controller - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level1
         */
        it('SUB_MULTIMEDIA_AVSESSION_DESTROYCONTROLLER_PROMISE_0100', 0, async function (done) {
            await controller.destroy().then(() => {
                console.info('TestLog: Controller destroy successfully');
                expect(true).assertTrue();
            }).catch((err) => {
                expect(err.code == 6600103).assertTrue();
                console.info(avSession.AVSessionErrorCode.ERR_CODE_CONTROLLER_NOT_EXIST);
                console.info(`TestLog: Controller destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(200);
            controller = await session.getController();
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFPLAY_0100
         * @tc.name      : OFFPLAY_0100
         * @tc.desc      : Testing offPlay callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAY_0100', 0, async function (done) {
            function callback1() {
                console.info('TestLog: Play command registration1 success');
                expect(true).assertTrue();
            }

            session.on('play', callback1);

            await controller.sendControlCommand({ command: 'play' }).then(() => {
                console.info('TestLog: Controller send command successfully');
				expect(true).assertTrue();
            }).catch((err) => {
                expect(err.code == 6600105).assertTrue();
                console.info(avSession.AVSessionErrorCode.ERR_CODE_COMMAND_INVALID);
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
            });
            await sleep(500);
            done();
        })
        
		/* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CAST_AUDIO_PROMISE_0100
         * @tc.name      : CAST_AUDIO_0100
         * @tc.desc      : Testing cast audio
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
         it('SUB_MULTIMEDIA_AVSESSION_CAST_AUDIO_PROMISE_0100', 0, async function (done) {
            sessionId = session.sessionId;
            sessionToken = { sessionId, pid, uid };

            try {
                await avSession.castAudio(sessionToken, audioDevices).then(() => {
                    console.info('Cast audio to remote');
                }).catch((err) => {
                    console.info(avSession.AVSessionErrorCode.ERR_CODE_REMOTE_CONNECTION_ERR);
                    console.info(`Cast audio to remote BusinessError: ${err.code}, message: ${err.message}`);
                });
            } catch (err) {
                console.info(`Testing has failed BusinessError: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            }
            done();
        })
		
		/* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONHANDLEKEYEVENT_0100
         * @tc.name      : ONHANDLEKEYEVENT_0100
         * @tc.desc      : Testing Handle KeyEvent callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONHANDLEKEYEVENT_0100', 0, async function (done) {
            session.on('handleKeyEvent', (callback) => {
                if (callback.action === 2) {
                    console.info('TestLog: Handle keyEvent callback registration successful');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Handle keyEvent callback registration error');
                    expect(false).assertTrue();
                }
            });

            await controller.sendAVKeyEvent(event).then(() => {
                console.info('TestLog: Controller send AVKeyEvent successfully');
            }).catch((err) => {
				expect(err.code == 6600106).assertTrue();
                console.info(avSession.AVSessionErrorCode.ERR_CODE_SESSION_INACTIVE);
                console.info(`TestLog: Controller send AVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })
		
		/* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONPLAY_0100
         * @tc.name      : ONPLAY_0100
         * @tc.desc      : Testing onPlay callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAY_0100', 0, async function (done) {
            session.on('play', () => {
                console.info('TestLog: Play command callback registration successful');
                expect(true).assertTrue();
            });

            await controller.sendControlCommand({ command: 'play' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
				expect(err.code == 6600107).assertTrue();
                console.info(avSession.AVSessionErrorCode.ERR_CODE_MESSAGE_OVERLOAD);
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })
    })
}