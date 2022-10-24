/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

export default function ControllerCallback() {
    describe('ControllerCallback', function () {
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
            console.info('TestLog: Start Testing AVSessionController Interfaces');
        })

        beforeEach(async function () {
            console.info('TestLog: Init the AVSession And Controller');
            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
            }).catch((err) => {
                console.info(`TestLog: Session created error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activated error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await avSession.createController(session.sessionId).then((data) => {
                controller = data;
            }).catch((err) => {
                console.info(`TestLog: Controller created error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
        })

        afterEach(async function (done) {
            console.info('TestLog: Destroy the Session And Controller');
            await session.destroy();
            await controller.destroy();
            done();
        })

        afterAll(function () {
            console.info('TestLog: End Testing AVSessionController Interfaces');
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_CALLBACK_0100
         * @tc.name      : GETAVPLAYBACKSTATE_0100
         * @tc.desc      : Testing get playbackstate - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         *
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_CALLBACK_0100', 0, async function (done) {
            session.setAVPlaybackState(PlaybackState, (err) => {
                if (err) {
                    console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set playbackState successfully');
                }
            });

            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get playbackState error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.state === 2 && value.speed === 2.0
                    && value.isFavorite === true && value.bufferedTime === 1000
                    && value.loopMode === 1) {
                    console.info('TestLog: Get playbackState successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get playbackState failed');
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_CALLBACK_0100
         * @tc.name      : GETAVMETADATA_0100
         * @tc.desc      : Testing get metadata - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_CALLBACK_0100', 0, async function (done) {
            session.setAVMetadata(metadata, (err) => {
                if (err) {
                    console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set playbackState successfully');
                }
            });
            await sleep(500);

            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get Metadata error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.assetId === '121278' && value.title === 'lose yourself'
                    && value.artist === 'Eminem' && value.author === 'ST'
                    && value.album === 'Slim shady' && value.writer === 'ST'
                    && value.composer === 'ST' && value.duration === 2222
                    && value.mediaImage ===
                    'https://img2.baidu.com/it/u=3583435814,2833583486&fm=253&fmt=auto&app=138&f=JPEG?w=526&h=500'
                    && value.subtitle === '8 Mile' && value.description === 'Rap'
                    && value.lyric === 'https://lyric.tingmall.com/lyric/58/970/58970104-LRC-LRC.lrc?t=1649918948000') {
                    console.info('TestLog: Get metadata successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get metadata failed');
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CONTROLLERSENDEVENT_CALLBACK_0100
         * @tc.name      : CONTROLLERSENDEVENT_0100
         * @tc.desc      : Testing send AVKeyEvent - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CONTROLLERSENDEVENT_CALLBACK_0100', 0, async function (done) {
            let flag = false;
            session.on('handleKeyEvent', (callback) => {
                if (callback.action === 2) {
                    console.info('TestLog: Get AVKeyEvent successfully');
                    flag = true;
                } else {
                    console.info('TestLog: Get AVKeyEvent error');
                }
            });
            controller.sendAVKeyEvent(event, (err) => {
                if (err) {
                    console.info(`TestLog: Send AVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Send AVKeyEvent');
                }
            });
            await sleep(500);
            if (flag) {
                console.info('TestLog: Controller send AVKeyEvent successfully');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Controller send AVKeyEvent failed');
                expect(false).assertTrue();
            }
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_CALLBACK_0100
         * @tc.name      : GETLAUNCHABILITY_0100
         * @tc.desc      : Testing get LaunchAbility - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_CALLBACK_0100', 0, async function(done) {
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

            session.setLaunchAbility(agent, (err) => {
                if (err) {
                    console.info(`TestLog: Set launchAbility error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set launchAbility successfully');
                }
            });

            await sleep(500);
            let wantagent;
            controller.getLaunchAbility((err, value) => {
                if (err) {
                    console.info(`TestLog: error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Get launchAbility');
                    wantagent = value;
                }
            });
            await sleep(500);
            await WantAgent.equal(agent, wantagent).then((bool) => {
                if (bool) {
                    console.info('AVSessionTest : Get LaunchAbility successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('AVSessionTest : Get LaunchAbility failed');
                    expect(false).assertTrue();
                }
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CONTROLLERISACTIVE_CALLBACK_0100
         * @tc.name      : CONTROLLERISACTIVE_0100
         * @tc.desc      : Testing session active - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CONTROLLERISACTIVE_CALLBACK_0100', 0, async function (done) {
            controller.isActive((err, value) => {
                if (err) {
                    console.info(`TestLog: isActive error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value) {
                    console.info('TestLog: session is active');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: session is directive');
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CONTROLLERISACTIVE_CALLBACK_0200
         * @tc.name      : CONTROLLERISACTIVE_0200
         * @tc.desc      : Testing session active - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CONTROLLERISACTIVE_CALLBACK_0200', 0, async function (done) {
            await session.deactivate().then(() => {
                console.info('TestLog: Set session deactivate successfully');
            }).catch((err) => {
                console.info(`TestLog: Set deactivate error: code: ${err.code}, message: ${err.message}`);
            });

            controller.isActive((err, value) => {
                if (err) {
                    console.info(`TestLog: isActive error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value) {
                    console.info('TestLog: session is active');
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: session is directive');
                    expect(true).assertTrue();
                }
            })
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_DESTROYCONTROLLER_CALLBACK_0100
         * @tc.name      : DESTROYCONTROLLER_0100
         * @tc.desc      : Testing destroy the controller - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_DESTROYCONTROLLER_CALLBACK_0100', 0, async function (done) {
            controller.destroy((err) => {
                if (err) {
                    console.info(`TestLog: Controller destroy error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Controller destroy successfully');
                    expect(true).assertTrue();
                }
            })
            await sleep(500);
            avSession.createController(session.sessionId, (err, value) => {
                if (err) {
                    console.info(`TestLog: Controller created error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    controller = value;
                }
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMAND_CALLBACK_0100
         * @tc.name      : GETVALIDCOMMAND_0100
         * @tc.desc      : Testing get valid command - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMAND_CALLBACK_0100', 0, async function (done) {
            session.on('play', () => {
                console.info('TestLog: Play command callback registration successful');
            });

            session.on('pause', () => {
                console.info('TestLog: Pause command callback registration successful');
            });

            session.on('stop', () => {
                console.info('TestLog: Stop command callback registration successful');
            });

            controller.getValidCommands((err, value) => {
                if (err) {
                    console.info(`TestLog: Get valid command error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.length === 3 && value[0] === 'play') {
                    console.info('TestLog: Get valid command successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get valid command failed');
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_0100
         * @tc.name      : SENDCONTROLCOMMAND_0100
         * @tc.desc      : Testing send control command - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_0100', 0, async function (done) {
            let flag = false;

            session.on('play', () => {
                console.info('TestLog: Get play command successfully');
                flag = true;
            });

            controller.sendControlCommand({command:'play'}, (err) => {
                if (err) {
                    console.info(`TestLog: Send play command error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Send play command');
                }
                done();
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
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_0200
         * @tc.name      : SENDCONTROLCOMMAND_0200
         * @tc.desc      : Testing send control command - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_0200', 0, async function (done) {
            let flag = false;
            session.on('pause', () => {
                console.info('TestLog: Get pause command successfully');
                flag = true;
            });

            controller.sendControlCommand({command:'pause'}, (err) => {
                if (err) {
                    console.info(`TestLog: Send pause command error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Send pause command');
                }
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
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_0300
         * @tc.name      : SENDCONTROLCOMMAND_0300
         * @tc.desc      : Testing send control command - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_0300', 0, async function (done) {
            let flag = false;

            session.on('stop', () => {
                console.info('TestLog: Get stop command successfully');
                flag = true;
            });

            controller.sendControlCommand({command:'stop'}, (err) => {
                if (err) {
                    console.info(`TestLog: Send stop command error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Send stop command');
                }
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
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_0400
         * @tc.name      : SENDCONTROLCOMMAND_0400
         * @tc.desc      : Testing send control command - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_0400', 0, async function (done) {
            let flag = false;

            session.on('playNext', () => {
                console.info('TestLog: Get playNext command successfully');
                flag = true;
            });

            controller.sendControlCommand({command:'playNext'}, (err) => {
                if (err) {
                    console.info(`TestLog: Send playNext command error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Send playNext command');
                }
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
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_0500
         * @tc.name      : SENDCONTROLCOMMAND_0500
         * @tc.desc      : Testing send control command - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_0500', 0, async function (done) {
            let flag = false;

            session.on('playPrevious', () => {
                console.info('TestLog: Get playPrevious command successfully');
                flag = true;
            });

            controller.sendControlCommand({command:'playPrevious'}, (err) => {
                if (err) {
                    console.info(`TestLog: Send playPrevious command error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Send playPrevious command');
                }
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
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_0600
         * @tc.name      : SENDCONTROLCOMMAND_0600
         * @tc.desc      : Testing send control command - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_0600', 0, async function (done) {
            let flag = false;

            session.on('fastForward', () => {
                console.info('TestLog: Get fastForward command successfully');
                flag = true;
            });

            controller.sendControlCommand({command:'fastForward'}, (err) => {
                if (err) {
                    console.info(`TestLog: Send fastForward command error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Send fastForward command');
                }
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
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_0700
         * @tc.name      : SENDCONTROLCOMMAND_0700
         * @tc.desc      : Testing send control command - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_0700', 0, async function (done) {
            let flag = false;

            session.on('rewind', () => {
                console.info('TestLog: Get rewind command successfully');
                flag = true;
            });

            controller.sendControlCommand({command:'rewind'}, (err) => {
                if (err) {
                    console.info(`TestLog: Send rewind command error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Send rewind command');
                }
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
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_0800
         * @tc.name      : SENDCONTROLCOMMAND_0800
         * @tc.desc      : Testing send control command - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_0800', 0, async function (done) {
            let flag = false;

            session.on('seek', (callback) => {
                if (callback === 10) {
                    console.info('TestLog: Get seek command successfully');
                    flag = true;
                }
            });
            controller.sendControlCommand({command:'seek', parameter:10}, (err) => {
                if (err) {
                    console.info(`TestLog: Send seek command error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Send seek command');
                }
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
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_0900
         * @tc.name      : SENDCONTROLCOMMAND_0900
         * @tc.desc      : Testing send control command - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_0900', 0, async function (done) {
            let flag = false;

            session.on('setSpeed', (callback) => {
                if (callback === 2.6) {
                    console.info('TestLog: Get setSpeed command successfully');
                    flag = true;
                }
            });
            controller.sendControlCommand({command:'setSpeed', parameter:2.6}, (err) => {
                if (err) {
                    console.info(`TestLog: Send setSpeed command error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Send setSpeed command');
                }
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
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1000
         * @tc.name      : SENDCONTROLCOMMAND_1000
         * @tc.desc      : Testing send control command - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1000', 0, async function (done) {
            let flag = false;

            session.on('setLoopMode', (callback) => {
                if (callback === 1) {
                    console.info('TestLog: Get setLoopMode command successfully');
                    flag = true;
                }
            });
            controller.sendControlCommand({command:'setLoopMode', parameter:avSession.LoopMode.LOOP_MODE_SINGLE}, (err) => {
                if (err) {
                    console.info(`TestLog: Send setLoopMode command error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Send setLoopMode command');
                }
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
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1100
         * @tc.name      : SENDCONTROLCOMMAND_1100
         * @tc.desc      : Testing send control command - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1100', 0, async function (done) {
            let flag = false;

            session.on('toggleFavorite', (callback) => {
                if (callback === 'false') {
                    console.info('TestLog: Get toggleFavorite command successfully');
                    flag = true;
                }
            });
            controller.sendControlCommand({command:'toggleFavorite', parameter:'false'}, (err) => {
                if (err) {
                    console.info(`TestLog: Send toggleFavorite command error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Send toggleFavorite command');
                }
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
    })
}