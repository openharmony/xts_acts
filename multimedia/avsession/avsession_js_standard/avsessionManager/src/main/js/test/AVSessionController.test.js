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
import {afterAll, afterEach, beforeAll, beforeEach, describe, expect, it} from '@ohos/hypium';
import WantAgent from '@ohos.wantAgent';
import featureAbility from '@ohos.ability.featureAbility';

export default function Controller() {
    describe('Controller', function () {
        let tag = 'ApplicationA';
        let type = 'audio';
        let session;
        let controller;
        let keyItem = {code:10, pressedTime:123456789, deviceId:0};
        let event = {action:2, key:keyItem, keys:[keyItem]};
        let PlaybackState = {
            state:avSession.PlaybackState.PLAYBACK_STATE_PLAY,
            speed: 2.0,
            position:{elapsedTime:10, updateTime:(new Date()).getTime()},
            bufferedTime:1000,
            loopMode:avSession.LoopMode.LOOP_MODE_SINGLE,
            isFavorite:true,
        };
        let metadata  = {
            assetId: '121278',
            title: 'lose yourself',
            artist: 'Eminem',
            author: 'ST',
            album: 'Slim shady',
            writer: 'ST',
            composer: 'ST',
            duration: 2222,
            mediaImage: 'https://img2.baidu.com/it/u=3583435814,2833583486&fm=253&fmt=auto&app=138&f=JPEG?w=526&h=500',
            subtitle: '8 Mile',
            description: 'Rap',
            lyric: 'https://lyric.tingmall.com/lyric/58/970/58970104-LRC-LRC.lrc?t=1649918948000',
            previousAssetId: '121277',
            nextAssetId: '121279',
        };
        let context = featureAbility.getContext();

        function sleep (ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        beforeAll(function () {
            console.info('TestLog: Start Testing avSessionController Interfaces');
        })

        beforeEach(async function () {
            console.info('TestLog: Init the avSession And Controller');
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
                expect(false).assertTrue();
            });

            await avSession.createController(session.sessionId).then((data) => {
                controller = data;
            }).catch((err) => {
                console.info(`TestLog: Controller create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
        })

        afterEach(async function (done) {
            console.info('TestLog: Destroy the Session And Controller');
            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await controller.destroy().then(() => {
                console.info('TestLog: Controller Destroy SUCCESS');
            }).catch((err) => {
                console.info(`TestLog: Controller Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        afterAll(function () {
            console.info('TestLog: End Testing avSessionController Interfaces');
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETSESSIONID_0100
         * @tc.name      : GETSESSIONID_0100
         * @tc.desc      : Testing get sessionId
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETSESSIONID_0100', 0, async function (done) {
            if (controller.sessionId.length === 64) {
                console.info('TestLog: Get sessionId successfully');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Get sessionId failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_PROMISE_0100
         * @tc.name      : GETAVPLAYBACKSTATE_0100
         * @tc.desc      : Testing get playbackstate - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level1
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_PROMISE_0100', 0, async function (done) {
            await session.setAVPlaybackState(PlaybackState).then(() => {
                console.info('TestLog: Set playbackState successfully');
            }).catch((err) => {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVPlaybackState().then((data) => {
                if (data.state === 2 && data.speed === 2.0
                    && data.isFavorite === true && data.bufferedTime === 1000
                    && data.loopMode === 1) {
                    console.info('TestLog: Get playbackState successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get playbackState failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_PROMISE_0100
         * @tc.name      : GETAVMETADATA_0100
         * @tc.desc      : Testing get metadata -promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level1
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_PROMISE_0100', 0, async function (done) {
            await session.setAVMetadata(metadata).then(() => {
                console.info('TestLog: Set metadata successfully');
            }).catch((err) => {
                console.info(`TestLog: Set metadata error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.assetId === '121278' && data.title === 'lose yourself'
                    && data.artist === 'Eminem' && data.author === 'ST'
                    && data.album === 'Slim shady' && data.writer === 'ST'
                    && data.composer === 'ST' && data.duration === 2222
                    && data.mediaImage === 'https://img2.baidu.com/it/u=3583435814,2833583486&fm=253&fmt=auto&app=138&f=JPEG?w=526&h=500'
                    && data.subtitle === '8 Mile' && data.description === 'Rap'
                    && data.lyric === 'https://lyric.tingmall.com/lyric/58/970/58970104-LRC-LRC.lrc?t=1649918948000'
                ) {
                    console.info('TestLog: Get metadata successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get metadata failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get Metadata error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CONTROLLERSENDEVENT_PROMISE_0100
         * @tc.name      : CONTROLLERSENDEVENT_0100
         * @tc.desc      : Testing send AVKeyEvent - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level1
         */
        it('SUB_MULTIMEDIA_AVSESSION_CONTROLLERSENDEVENT_PROMISE_0100', 0, async function (done) {
            let flag = false;
            session.on('handleKeyEvent', (callback) => {
                if (callback.action === 2) {
                    console.info('TestLog: Get AVKeyEvent successfully');
                    flag = true;
                } else {
                    console.info('TestLog: Get AVKeyEvent error');
                }
            });
            await controller.sendAVKeyEvent(event).then(() => {
                console.info('TestLog: Send AVKeyEvent');
            }).catch((err) => {
                console.info(`TestLog: Send AVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);
            if (flag) {
                console.info('TestLog: Controller send AVKeyEvent successfully');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Controller send AVKeyEvent failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_0100
         * @tc.name      : GETLAUNCHABILITY_0100
         * @tc.desc      : Testing get LaunchAbility - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level1
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_0100', 0, async function(done) {
            let wantAgentInfo = {
                wants : [
                    {
                        bundleName : 'com.example.myapplication',
                        abilityName: 'com.example.myapplication.MainAbility'
                    }
                ],
                operationType: WantAgent.OperationType.START_ABILITIES,
                requestCode: 0,
                wantAgentFlags: [WantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
            };
            let agent;
            await WantAgent.getWantAgent(wantAgentInfo).then((callback) => {
                agent = callback;
            });

            await session.setLaunchAbility(agent).then(() => {
                console.info('TestLog: Set LaunchAbility');
            }).catch((err) => {
                console.info(`TestLog: Set LaunchAbility error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            let wantagent;
            await controller.getLaunchAbility().then((data) => {
                wantagent = data;
                console.info('TestLog: Get launchAbility');
            }).catch((err) => {
                console.info(`TestLog: Get LaunchAbility error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await WantAgent.equal(agent, wantagent).then((bool) => {
                if (bool) {
                    console.info('TestLog: Get LaunchAbility successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get LaunchAbility failed');
                    expect(false).assertTrue();
                }
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETREALPLAYBACKPOSITIONSYNC_0100
         * @tc.name      : GETREALPLAYBACKPOSITIONSYNC_0100
         * @tc.desc      : Testing get position
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETREALPLAYBACKPOSITIONSYNC_0100', 0, async function (done) {
            controller.on('playbackStateChange', 'all', (callback) => {
                console.info(`TestLog: Current elapsedTime is :${callback.position.elapsedTime}`);
                console.info(`TestLog: Current updateTime is :${callback.position.updateTime}`);
            });
            let changeState = {
                position:{elapsedTime:20, updateTime:(new Date()).getTime()},
            };
            await session.setAVPlaybackState(changeState).then(() => {
                console.info('TestLog: Set playbackState successfully');
            }).catch((err) => {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(1000);
            let position = controller.getRealPlaybackPositionSync();
            if (position > 20) {
                console.info(`TestLog: Get realPosition successfully and position is:${position}`);
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Get realPosition failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CONTROLLERISACTIVE_PROMISE_0100
         * @tc.name      : CONTROLLERISACTIVE_0100
         * @tc.desc      : Testing session active -promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CONTROLLERISACTIVE_PROMISE_0100', 0, async function (done) {
            await controller.isActive().then((data) => {
                if (data) {
                    console.info('TestLog: session is active');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: session is directive');
                    expect(false).assertTrue();
                }
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CONTROLLERISACTIVE_PROMISE_0200
         * @tc.name      : CONTROLLERISACTIVE_0200
         * @tc.desc      : Testing session active - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CONTROLLERISACTIVE_PROMISE_0200', 0, async function (done) {
            await session.deactivate().then(() => {
                console.info('TestLog: Set session deactivate successfully');
            }).catch((err) => {
                console.info(`TestLog: Set deactivate error: code: ${err.code}, message: ${err.message}`);
            });

            await sleep(500);

            await controller.isActive().then((data) => {
                if (data) {
                    console.info('TestLog: session is active');
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: session is directive');
                    expect(true).assertTrue();
                }
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
                console.info(`TestLog: Controller destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMAND_PROMISE_0100
         * @tc.name      : GETVALIDCOMMAND_0100
         * @tc.desc      : Testing get valid command - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMAND_PROMISE_0100', 0, async function (done) {
            session.on('play', () => {
                console.info('TestLog: Play command callback registration successful');
            });

            session.on('pause', () => {
                console.info('TestLog: Pause command callback registration successful');
            });

            session.on('stop', () => {
                console.info('TestLog: Stop command callback registration successful');
            });

            await controller.getValidCommands().then((data) => {
                if (data.length === 3 && data[0] === 'play') {
                    console.info('TestLog: Get valid command successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get valid command failed');
                    console.info(`TestLog: Valid command size is:${data.length}`);
                    for(var i = 0; i < data.length; i++) {
                        console.info(data[i]);
                    }
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get valid command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_0100
         * @tc.name      : SENDCONTROLCOMMAND_0100
         * @tc.desc      : Testing send system control command - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level1
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_0100', 0, async function (done) {
            let flag = false;
            session.on('play', () => {
                console.info('TestLog: Get play command successfully');
                flag = true;
            });

            await controller.sendControlCommand({command:'play'}).then(() => {
                console.info('TestLog: Send play command');
            }).catch((err) => {
                console.info(`TestLog: Send play command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            if (flag) {
                console.info('TestLog: Send play command successfully');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Send play command failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_0200
         * @tc.name      : SENDCONTROLCOMMAND_0200
         * @tc.desc      : Testing send control command - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_0200', 0, async function (done) {
            let flag = false;
            session.on('pause', () => {
                console.info('TestLog: Get pause command successfully');
                flag = true;
            });

            await controller.sendControlCommand({command:'pause'}).then(() => {
                console.info('TestLog: Send pause command');
            }).catch((err) => {
                console.info(`TestLog: Send pause command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            if (flag) {
                console.info('TestLog: Send pause command successfully');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Send pause command failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_0300
         * @tc.name      : SENDCONTROLCOMMAND_0300
         * @tc.desc      : Testing send control command - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_0300', 0, async function (done) {
            let flag = false;
            session.on('stop', () => {
                console.info('TestLog: Get stop command successfully');
                flag = true;
            });

            await controller.sendControlCommand({command:'stop'}).then(() => {
                console.info('TestLog: Send stop command');
            }).catch((err) => {
                console.info(`TestLog: Send stop command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            if (flag) {
                console.info('TestLog: Send stop command successfully');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Send stop command failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_0400
         * @tc.name      : SENDCONTROLCOMMAND_0400
         * @tc.desc      : Testing send control command - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_0400', 0, async function (done) {
            let flag = false;
            session.on('playNext', () => {
                console.info('TestLog: Get playNext command successfully');
                flag = true;
            });

            await controller.sendControlCommand({command:'playNext'}).then(() => {
                console.info('TestLog: Send playNext command');
            }).catch((err) => {
                console.info(`TestLog: Send playNext command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            if (flag) {
                console.info('TestLog: Send playNext command successfully');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Send playNext command failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_0500
         * @tc.name      : SENDCONTROLCOMMAND_0500
         * @tc.desc      : Testing send control command - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_0500', 0, async function (done) {
            let flag = false;
            session.on('playPrevious', () => {
                console.info('TestLog: Get playPrevious command successfully');
                flag = true;
            });

            await controller.sendControlCommand({command:'playPrevious'}).then(() => {
                console.info('TestLog: Send playPrevious command');
            }).catch((err) => {
                console.info(`TestLog: Send playPrevious command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            if (flag) {
                console.info('TestLog: Send playPrevious command successfully');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Send playPrevious command failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_0600
         * @tc.name      : SENDCONTROLCOMMAND_0600
         * @tc.desc      : Testing send control command - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_0600', 0, async function (done) {
            let flag = false;
            session.on('fastForward', () => {
                console.info('TestLog: Get fastForward command successfully');
                flag = true;
            });

            await controller.sendControlCommand({command:'fastForward'}).then(() => {
                console.info('TestLog: Send fastForward command');
            }).catch((err) => {
                console.info(`TestLog: Send fastForward command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            if (flag) {
                console.info('TestLog: Send fastForward command successfully');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Send fastForward command failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_0700
         * @tc.name      : SENDCONTROLCOMMAND_0700
         * @tc.desc      : Testing send control command - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_0700', 0, async function (done) {
            let flag = false;
            session.on('rewind', () => {
                console.info('TestLog: Get rewind command successfully');
                flag = true;
            });

            await controller.sendControlCommand({command:'rewind'}).then(() => {
                console.info('TestLog: Send rewind command');
            }).catch((err) => {
                console.info(`TestLog: Send rewind command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            if (flag) {
                console.info('TestLog: Send rewind command successfully');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Send rewind command failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_0800
         * @tc.name      : SENDCONTROLCOMMAND_0800
         * @tc.desc      : Testing send control command - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_0800', 0, async function (done) {
            let flag = false;
            session.on('seek', (callback) => {
                if (callback === 10) {
                    console.info('TestLog: Get seek command successfully');
                    flag = true;
                }
            });
            await controller.sendControlCommand({command:'seek', parameter:10}).then(() => {
                console.info('TestLog: Send seek command');
            }).catch((err) => {
                console.info(`TestLog: Send seek command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            if (flag) {
                console.info('TestLog: Send seek command successfully');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Send seek command failed');
                expect(false).assertTrue();
            }

            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_0900
         * @tc.name      : SENDCONTROLCOMMAND_0900
         * @tc.desc      : Testing send control command - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_0900', 0, async function (done) {
            let flag = false;
            session.on('setSpeed', (callback) => {
                if (callback === 2.6) {
                    console.info('TestLog: Get setSpeed command successfully');
                    flag = true;
                }
            });
            await controller.sendControlCommand({command:'setSpeed', parameter:2.6}).then(() => {
                console.info('TestLog: Send setSpeed command');
            }).catch((err) => {
                console.info(`TestLog: Send setSpeed command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            if (flag) {
                console.info('TestLog: Send setSpeed command successfully');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Send setSpeed command failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1000
         * @tc.name      : SENDCONTROLCOMMAND_1000
         * @tc.desc      : Testing send control command - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1000', 0, async function (done) {
            let flag = false;
            session.on('setLoopMode', (callback) => {
                if (callback === 1) {
                    console.info('TestLog: Get setLoopMode command successfully');
                    flag = true;
                }
            });
            await controller.sendControlCommand({command:'setLoopMode', parameter:avSession.LoopMode.LOOP_MODE_SINGLE}).then(() => {
                console.info('TestLog: Send setLoopMode command');
            }).catch((err) => {
                console.info(`TestLog: Send setLoopMode command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            if (flag) {
                console.info('TestLog: Send setLoopMode command successfully');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Send setLoopMode command failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1100
         * @tc.name      : SENDCONTROLCOMMAND_1100
         * @tc.desc      : Testing send control command - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1100', 0, async function (done) {
            let flag = false;
            session.on('toggleFavorite', (callback) => {
                if (callback === 'false') {
                    console.info('TestLog: Get toggleFavorite command successfully');
                    flag = true;
                }
            });
            await controller.sendControlCommand({command:'toggleFavorite', parameter:'false'}).then(() => {
                console.info('TestLog: Send toggleFavorite command');
            }).catch((err) => {
                console.info(`TestLog: Send toggleFavorite command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            if (flag) {
                console.info('TestLog: Send toggleFavorite command successfully');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Send toggleFavorite command failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONWRONGCALLBACK_0100
         * @tc.name      : ONWRONGCALLBACK_0100
         * @tc.desc      : Testing wrong callback registration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONWRONGCALLBACK_0100', 0, function (done) {
            try {
                controller.on('wrongCall', () => {
                    console.info('TestLog: Wrong callback registration successful');
                });
            } catch (err) {
                console.info(`TestLog: Wrong callback registration error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
                done();
            }
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0100
         * @tc.name      : ONMETADATACHANGE_0100
         * @tc.desc      : Testing metadata change callback registration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0100', 0, async function (done) {
            let filter = ['title', 'author', 'artist'];
            let flag = false;
            controller.on('metadataChange', filter, (callback) => {
                if (callback.title === 'love yourself' && callback.artist === 'Justin Biber') {
                    console.info('TestLog: Metadata filter set successful');
                    flag = true;
                }
                else {
                    console.info('TestLog: Metadata filter set error');
                }
            });

            let changedata = {
                assetId : '9526',
                title: 'love yourself',
                artist: 'Justin Biber',
                author: 'St',
            };

            await session.setAVMetadata(changedata).then(() => {
                console.info('TestLog: Change metadata successfully');
            }).catch((err) => {
                console.info(`TestLog: Change metadata error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            if (flag) {
                console.info('TestLog: Metadata change callback registration successful');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Metadata change callback registration failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0200
         * @tc.name      : ONMETADATACHANGE_0200
         * @tc.desc      : Testing metadata change callback registration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0200', 0, async function (done) {
            let filter = ['title', 'author', 'artist'];
            let flag = true;
            controller.on('metadataChange', filter, (callback) => {
                if (callback.album === 'HhHhHHH' && callback.writer === 'ST') {
                    console.info('TestLog: Metadata filter set failed');
                    flag = false;
                }
                else {
                    console.info('TestLog: Metadata filter set error');
                    flag = false;
                }
            });

            let changedata  = {
                assetId: '9527',
                album: 'HhHhHHH',
                writer: 'ST',
                composer: 'ST',
                duration: 2222,
                mediaImage: 'aaa',
            };

            await session.setAVMetadata(changedata).then(() => {
                console.info('TestLog: Change metadata successfully');
            }).catch((err) => {
                console.info(`TestLog: Change metadata error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            if (flag) {
                console.info('TestLog: Metadata change callback registration successful');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Metadata change callback registration failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0300
         * @tc.name      : ONMETADATACHANGE_0300
         * @tc.desc      : Testing metadata change callback registration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0300', 0, async function (done) {
            let flag = false;
            controller.on('metadataChange', 'all', (callback) => {
                if (callback.album=== 'HhHhHHH' && callback.writer === 'ST') {
                    console.info('TestLog: Metadata filter set successful');
                    flag = true;
                }
                else {
                    console.info('TestLog: Metadata filter set error');
                }
            });

            let changedata  = {
                assetId: '9527',
                title: 'love yourself',
                artist: 'Justin Biber',
                author: 'St',
                album: 'HhHhHHH',
                writer: 'ST',
                composer: 'ST',
                duration: 2222,
                mediaImage: 'aaa',
            };

            await session.setAVMetadata(changedata).then(() => {
                console.info('TestLog: Change metadata successfully');
            }).catch((err) => {
                console.info(`TestLog: Change metadata error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);
            if (flag) {
                console.info('TestLog: Metadata change callback registration successful');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Metadata change callback registration failed');
                expect(false).assertTrue();
            }

            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0100
         * @tc.name      : ONPLAYBACKSTATECHANGE_0100
         * @tc.desc      : Testing playbackState change callback registration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0100', 0, async function (done) {
            let flag = false;
            controller.on('playbackStateChange', 'all', (callback) => {
                if (callback.isFavorite === false && callback.speed === 3.0) {
                    console.info('TestLog: PlaybackState filter set successful');
                    console.info(`TestLog: Current speed is :${callback.speed}`);
                    flag = true;
                } else {
                    console.info('TestLog: PlaybackState filter set error');
                }
            });
            let changestate = {speed: 3.0, isFavorite:false,};

            await session.setAVPlaybackState(changestate).then(() => {
                console.info('TestLog: Change playbackState successfully');
            }).catch((err) => {
                console.info(`TestLog: Change playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            if (flag) {
                console.info('TestLog: PlaybackState change callback registration successful');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: PlaybackState change callback registration failed');
                expect(false).assertTrue();
            }

            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0200
         * @tc.name      : ONPLAYBACKSTATECHANGE_0200
         * @tc.desc      : Testing playbackState change callback registration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0200', 0, async function (done) {
            let flag = false;
            let filter = ['speed', 'isFavorite'];
            controller.on('playbackStateChange', filter, (callback) => {
                if (callback.isFavorite === false && callback.speed === 3.0) {
                    console.info('TestLog: PlaybackState filter set successful');
                    console.info(`TestLog: Current speed is :${callback.speed}`);
                    flag = true;
                } else {
                    console.info('TestLog: PlaybackState filter set error');
                }
            });

            let changestate = {speed: 3.0, isFavorite:false,};

            await session.setAVPlaybackState(changestate).then(() => {
                console.info('TestLog: Change playbackState successfully');
            }).catch((err) => {
                console.info(`TestLog: Change playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            if (flag) {
                console.info('TestLog: PlaybackState changed callback registration successful');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: PlaybackState changed callback registration failed');
                expect(false).assertTrue();
            }

            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0300
         * @tc.name      : ONPLAYBACKSTATECHANGE_0300
         * @tc.desc      : Testing playbackState change callback registration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0300', 0, async function (done) {
            let flag = true;
            let filter = ['speed', 'isFavorite'];
            controller.on('playbackStateChange', filter, (callback) => {
                if (callback.bufferedTime === 1000) {
                    console.info('TestLog: PlaybackState filter set failed');
                    flag = false;
                } else {
                    console.info('TestLog: PlaybackState filter set error');
                    flag = false;
                }
            });

            let changestate = {bufferedTime:1000, loopMode:avSession.LoopMode.LOOP_MODE_SINGLE,};

            await session.setAVPlaybackState(changestate).then(() => {
                console.info('TestLog: Change playbackState successfully');
            }).catch((err) => {
                console.info(`TestLog: Change playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            if (flag) {
                console.info('TestLog: PlaybackState change callback registration successful');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: PlaybackState change callback registration failed');
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
            let flag = false;
            controller.on('sessionDestroy', () => {
                console.info('TestLog: Session destroy successfully');
                flag = true;
            });

            await session.destroy();

            await sleep(500);

            if (flag) {
                console.info('TestLog: onSessionDestroy callback registration successful');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: onSessionDestroy callback registration failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONACTIVESTATECHANGE_0100
         * @tc.name      : ONACTIVESTATECHANGE_0100
         * @tc.desc      : Testing active State callback registration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONACTIVESTATECHANGE_0100', 0, async function (done) {
            let flag = false;
            controller.on('activeStateChange', (callback) => {
                if (callback) {
                    console.info('TestLog: Active state change successful');
                    flag = true;
                } else {
                    console.info('TestLog: Active state change error');
                }
            });

            await session.activate();
            await sleep(500);

            if (flag) {
                console.info('TestLog: ActiveStateChange callback registration successful');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: ActiveStateChange callback registration failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONVALIDCOMMANDCHANGE_0100
         * @tc.name      : ONVALIDCOMMANDCHANGE_0100
         * @tc.desc      : Testing valid command change callback registration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONVALIDCOMMANDCHANGE_0100', 0, async function (done) {
            let flag = false;
            controller.on('validCommandChange', (callback) => {
                if (callback.length > 0 && callback[0] === 'play') {
                    console.info('TestLog: Valid command change successfully');
                    flag = true;
                } else {
                    console.info('TestLog: Get valid command failed');
                    console.info(`TestLog: Valid command size is:${callback.length}`);
                    for(var i = 0; i < callback.length; i++) {
                        console.info(callback[i]);
                    }
                    console.info('TestLog: Valid Command change error');
                }
            });

            session.on('play', () => {
                console.info('TestLog: Play command callback registration successful');
            });

            await sleep(500);

            if (flag) {
                console.info('TestLog: ValidCommandChange callback registration successful');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: ValidCommandChange callback registration failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFMETADATACHANGE_0100
         * @tc.name      : OFFMETADATACHANGE_0100
         * @tc.desc      : Testing metadata change callback unRegistration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFMETADATACHANGE_0100', 0, async function (done) {
            let flag = true;
            function callback1(data) {
                if (data.title === 'love yourself' && data.artist === 'Justin Biber') {
                    console.info('TestLog: MetadataChange command registration1 success');
                    flag = false;
                }
                else {
                    console.info('TestLog: Metadata set error');
                    flag = false;
                }
            }

            function callback2(data) {
                if (data.title === 'love yourself' && data.artist === 'Justin Biber') {
                    console.info('TestLog: MetadataChange command registration2 success');
                    flag = false;
                }
                else {
                    console.info('TestLog: Metadata set error');
                    flag = false;
                }
            }

            controller.on('metadataChange', 'all', callback1);

            controller.on('metadataChange', 'all', callback2);

            controller.off('metadataChange');

            let changedata  = {
                assetId: '9527',
                title: 'love yourself',
                artist: 'Justin Biber',
                author: 'St',
                album: 'HhHhHHH',
                writer: 'ST',
                composer: 'ST',
                duration: 2222,
                mediaImage: 'aaa',
            };

            await session.setAVMetadata(changedata).then(() => {
                console.info('TestLog: Change metadata successfully');
            }).catch((err) => {
                console.info(`TestLog: Change metadata error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);

            if (flag) {
                console.info('TestLog: metadataChanged callback unRegistration successful');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: metadataChanged callback unRegistration failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFMETADATACHANGE_0200
         * @tc.name      : OFFMETADATACHANGE_0200
         * @tc.desc      : Testing metadata change callback unRegistration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFMETADATACHANGE_0200', 0, async function (done) {
            function callback1(data) {
                if (data.title === 'love yourself' && data.artist === 'Justin Biber') {
                    console.info('TestLog: MetadataChange command registration1 success');
                    expect(false).assertTrue();
                }
                else {
                    console.info('TestLog: Metadata set error');
                    expect(false).assertTrue();
                }
            }

            function callback2(data) {
                if (data.title === 'love yourself' && data.artist === 'Justin Biber') {
                    console.info('TestLog: MetadataChange command registration2 success');
                    expect(true).assertTrue();
                }
                else {
                    console.info('TestLog: Metadata set error');
                    expect(false).assertTrue();
                }
            }

            controller.on('metadataChange', 'all', callback1);

            controller.on('metadataChange', 'all', callback2);

            controller.off('metadataChange', callback1);

            let changedata  = {
                assetId: '9527',
                title: 'love yourself',
                artist: 'Justin Biber',
                author: 'St',
                album: 'HhHhHHH',
                writer: 'ST',
                composer: 'ST',
                duration: 2222,
                mediaImage: 'aaa',
            };

            await session.setAVMetadata(changedata).then(() => {
                console.info('TestLog: Change metadata successfully');
            }).catch((err) => {
                console.info(`TestLog: Change metadata error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFPLAYBACKSTATECHANGE_0100
         * @tc.name      : OFFPLAYBACKSTATECHANGE_0100
         * @tc.desc      : Testing playbackState change callback unRegistration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYBACKSTATECHANGE_0100', 0, async function (done) {
            let flag = true;
            function callback1(data) {
                if (data.isFavorite === false && data.speed === 3.0) {
                    console.info('TestLog: PlaybackState set successful');
                    console.info(`TestLog: Current speed is :${data.speed}`);
                    flag = false;
                } else {
                    console.info('TestLog: PlaybackState set error');
                    flag = false;
                }
            }

            function callback2(data) {
                if (data.isFavorite === false && data.speed === 3.0) {
                    console.info('TestLog: PlaybackState set successful');
                    console.info(`TestLog: Current speed is :${data.speed}`);
                    flag = false;
                } else {
                    console.info('TestLog: PlaybackState set error');
                    flag = false;
                }
            }

            controller.on('playbackStateChange', 'all', callback1);

            controller.on('playbackStateChange', 'all', callback2);

            controller.off('playbackStateChange');

            let changestate = {speed: 3.0, isFavorite:false,};

            await session.setAVPlaybackState(changestate).then(() => {
                console.info('TestLog: Change playbackState successfully');
            }).catch((err) => {
                console.info(`TestLog: Change playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            if (flag) {
                console.info('TestLog: playbackStateChanged callback unRegistration successful');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: playbackStateChanged callback unRegistration failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFPLAYBACKSTATECHANGE_0200
         * @tc.name      : OFFPLAYBACKSTATECHANGE_0200
         * @tc.desc      : Testing playbackState change callback unRegistration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYBACKSTATECHANGE_0200', 0, async function (done) {
            function callback1(data) {
                if (data.isFavorite === false && data.speed === 3.0) {
                    console.info('TestLog: PlaybackState set successful');
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: PlaybackState set error');
                    expect(false).assertTrue();
                }
            }

            function callback2(data) {
                if (data.isFavorite === false && data.speed === 3.0) {
                    console.info('TestLog: PlaybackState set successful');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: PlaybackState set error');
                    expect(false).assertTrue();
                }
            }

            controller.on('playbackStateChange', 'all', callback1);

            controller.on('playbackStateChange', 'all', callback2);

            controller.off('playbackStateChange', callback1);

            let changestate = {speed: 3.0, isFavorite:false,};

            await session.setAVPlaybackState(changestate).then(() => {
                console.info('TestLog: Change playbackState successfully');
            }).catch((err) => {
                console.info(`TestLog: Change playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);
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
            function callback1() {
                console.info('TestLog: SessionDestory command registration1 success');
                flag = false;
            }

            function callback2() {
                console.info('TestLog: SessionDestory command registration2 success');
                flag = false;
            }

            controller.on('sessionDestroy', callback1);

            controller.on('sessionDestroy', callback2);

            controller.off('sessionDestroy');

            await session.destroy().then(() => {
                console.info('TestLog: Destory session successfully');
            }).catch((err) => {
                console.info(`TestLog: Destory session error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            if (flag) {
                console.info('TestLog: SessionDestroy callback unRegistration successful');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: SessionDestroy callback unRegistration failed');
                expect(false).assertTrue();
            }
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
            function callback1() {
                console.info('TestLog: SessionDestory command registration1 success');
                expect(false).assertTrue;
            }

            function callback2() {
                console.info('TestLog: SessionDestory command registration2 success');
                expect(true).assertTrue;
            }

            controller.on('sessionDestroy', callback1);

            controller.on('sessionDestroy', callback2);

            controller.off('sessionDestroy', callback1);

            await session.destroy().then(() => {
                console.info('TestLog: Destory session successfully');
            }).catch((err) => {
                console.info(`TestLog: Destory session error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFACTIVESTATECHANGE_0100
         * @tc.name      : OFFACTIVESTATECHANGE_0100
         * @tc.desc      : Testing active State callback unRegistration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFACTIVESTATECHANGE_0100', 0, async function (done) {
            let flag = true;

            function callback1(data) {
                if (data) {
                    console.info('TestLog: ActiveStateChange command registration1 success');
                    flag = false;
                }
            }

            function callback2(data) {
                if (data) {
                    console.info('TestLog: ActiveStateChange command registration2 success');
                    flag = false;
                }
            }

            controller.on('activeStateChange', callback1);

            controller.on('activeStateChange', callback2);

            controller.off('activeStateChange');

            await session.activate().then(() => {
                console.info('TestLog: Session activate successfully');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);

            if (flag) {
                console.info('TestLog: activeStateChange command unRegistration success')
                expect(true).assertTrue();
            } else {
                console.info('TestLog: activeStateChange command unRegistration failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFACTIVESTATECHANGE_0200
         * @tc.name      : OFFACTIVESTATECHANGE_0200
         * @tc.desc      : Testing active State callback unRegistration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFACTIVESTATECHANGE_0200', 0, async function (done) {
            function callback1(data) {
                if (data) {
                    console.info('TestLog: ActiveStateChange command registration1 success');
                    expect(false).assertTrue();
                }
            }

            function callback2(data) {
                if (data) {
                    console.info('TestLog: ActiveStateChange command registration1 success');
                    expect(true).assertTrue();
                }
            }

            controller.on('activeStateChange', callback1);

            controller.on('activeStateChange', callback2);

            controller.off('activeStateChange', callback1);

            await session.activate().then(() => {
                console.info('TestLog: Session activate successfully');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);

            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFVALIDCOMMANDCHANGE_0100
         * @tc.name      : OFFVALIDCOMMANDCHANGE_0100
         * @tc.desc      : Testing valid command change callback unRegistration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFVALIDCOMMANDCHANGE_0100', 0, async function (done) {
            let flag = true;

            function callback1(data) {
                if (data.length > 0 && data[0] === 'play') {
                    console.info('TestLog: Valid command change successfully');
                    flag = false;
                } else {
                    console.info('TestLog: Get valid command failed');
                    flag = false;
                }
            }

            function callback2(data) {
                if (data.length > 0 && data[0] === 'play') {
                    console.info('TestLog: Valid command change successfully');
                    flag = false;
                } else {
                    console.info('TestLog: Get valid command failed');
                    flag = false;
                }
            }

            controller.on('validCommandChange', callback1);

            controller.on('validCommandChange', callback2);

            controller.off('validCommandChange');

            session.on('play', () => {
                console.info('TestLog: Play command callback registration successful');
            });

            await sleep(500);

            if (flag) {
                console.info('TestLog: Valid command changed callback unRegistration successful');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Valid command changed callback unRegistration failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFVALIDCOMMANDCHANGE_0200
         * @tc.name      : OFFVALIDCOMMANDCHANGE_0200
         * @tc.desc      : Testing valid command change callback unRegistration
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFVALIDCOMMANDCHANGE_0200', 0, async function (done) {
            function callback1(data) {
                if (data.length > 0 && data[0] === 'play') {
                    console.info('TestLog: Valid command change successfully');
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Get valid command failed');
                    expect(false).assertTrue();
                }
            }

            function callback2(data) {
                if (data.length > 0 && data[0] === 'play') {
                    console.info('TestLog: Valid command change successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get valid command failed');
                    expect(false).assertTrue();
                }
            }

            controller.on('validCommandChange', callback1);

            controller.on('validCommandChange', callback2);

            controller.off('validCommandChange', callback1);

            session.on('play', () => {
                console.info('TestLog: Play command callback registration successful');
            });

            await sleep(500);
            done();
        })
    })
}