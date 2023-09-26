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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import WantAgent from '@ohos.wantAgent';
import featureAbility from '@ohos.ability.featureAbility';

export default function AVSession() {
    describe('AVSession', function () {
        let tag = 'ApplicationA';
        let type = 'audio';
        let session;
        let controller;
        let OutputDeviceInfo = { isRemote: false, audioDeviceId: [0], deviceName: ['LocalDevice'] };
        let keyItem = { code: 0x49, pressedTime: 123456789, deviceId: 0 };
        let event = { action: 2, key: keyItem, keys: [keyItem] };
        let context = featureAbility.getContext();
        let castControlCommandType = 'play';
        let deviceInfo = {
            castCategory: 0,
            deviceId: "deviceId",
            deviceName: "deviceName",
        }
        let outputDeviceInfo = {
            devices: [deviceInfo],
        }

        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        async function getPixelMap() {
            let color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            bufferArr.fill('3', 0, 95);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 }, AlphaType: 3 };
            return image.createPixelMap(color, opts);
        }

        beforeAll(function () {
            console.info('TestLog: Start Testing avSession Interfaces');
        })

        beforeEach(async function () {
            console.info('TestLog: Init Session And Controller');
            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
                session.sessionType = 'audio';
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

            controller = await session.getController();
        });


        afterEach(async function (done) {
            console.info('TestLog: Destroy Session And Controller');
            await session.destroy().then(() => {
                console.info('TestLog: Session destroy success');
            }).catch((err) => {
                console.info(`TestLog: Session destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await controller.destroy().then(() => {
                console.info('TestLog: Controller destroy success');
            }).catch((err) => {
                console.info(`TestLog: Controller destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        afterAll(function () {
            console.info('TestLog: End Testing avSession Interfaces');
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_READ_SESSION_ID_0100
         * @tc.name      : READ_SESSION_ID_0100
         * @tc.desc      : Testing read sessionId
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_READ_SESSION_ID_0100', 0, async function (done) {
            if (session.sessionId.length === 64) {
                console.info('TestLog: Read sessionId successfully');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Read sessionId failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0100
         * @tc.name      : SETMETADATA_0100
         * @tc.desc      : Testing set assetId - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0100', 0, async function (done) {
            let metadata0 = {
                assetId: '121278',
            };
            await session.setAVMetadata(metadata0).then(() => {
                console.info('TestLog: Set assetId successfully');
            }).catch((err) => {
                console.info(`TestLog: Set assetId error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.assetId === '121278') {
                    console.info('TestLog: Get assetId Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get assetId failed');
                    console.info(`TestLog: assetId is: ${data.assetId}`);
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get assetId error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0200
         * @tc.name      : SETMETADATA_0200
         * @tc.desc      : Testing set artist - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0200', 0, async function (done) {
            let metadata1 = {
                assetId: '121278',
                artist: 'Eminem',
            };
            await session.setAVMetadata(metadata1).then(() => {
                console.info('TestLog: Set artist successfully');
            }).catch((err) => {
                console.info(`TestLog: Set artist error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.artist === metadata1.artist) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get artist failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get artist error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0300
         * @tc.name      : SETMETADATA_0300
         * @tc.desc      : Testing set author - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0300', 0, async function (done) {
            let metadata2 = {
                assetId: '121278',
                author: 'ST',
            };
            await session.setAVMetadata(metadata2).then(() => {
                console.info('TestLog: Set author successfully');
            }).catch((err) => {
                console.info(`TestLog: Set author error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.author === metadata2.author) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get author failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get author error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0400
         * @tc.name      : SETMETADATA_0400
         * @tc.desc      : Testing set album - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0400', 0, async function (done) {
            let metadata3 = {
                assetId: '121278',
                album: 'Slim shady',
            };
            await session.setAVMetadata(metadata3).then(() => {
                console.info('TestLog: Set album successfully');
            }).catch((err) => {
                console.info(`TestLog: Set album error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.album === metadata3.album) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get album failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get album error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0500
         * @tc.name      : SETMETADATA_0500
         * @tc.desc      : Testing set writer - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0500', 0, async function (done) {
            let metadata4 = {
                assetId: '121278',
                writer: 'ST',
            };
            await session.setAVMetadata(metadata4).then(() => {
                console.info('TestLog: Set writer successfully');
            }).catch((err) => {
                console.info(`TestLog: Set writer error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.writer === metadata4.writer) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get writer failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get writer error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0600
         * @tc.name      : SETMETADATA_0600
         * @tc.desc      : Testing set composer - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0600', 0, async function (done) {
            let metadata5 = {
                assetId: '121278',
                composer: 'ST',
            };
            await session.setAVMetadata(metadata5).then(() => {
                console.info('TestLog: Set composer successfully');
            }).catch((err) => {
                console.info(`TestLog: Set composer error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.composer === metadata5.composer) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get composer failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get composer error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0700
         * @tc.name      : SETMETADATA_0700
         * @tc.desc      : Testing set duration - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0700', 0, async function (done) {
            let metadata6 = {
                assetId: '121278',
                duration: 2222,
            };
            await session.setAVMetadata(metadata6).then(() => {
                console.info('TestLog: Set duration successfully');
            }).catch((err) => {
                console.info(`TestLog: Set duration error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.duration === metadata6.duration) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get duration failed');
                    console.info(`TestLog: Get duration is: ${data.duration}`);
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get duration error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0800
         * @tc.name      : SETMETADATA_0800
         * @tc.desc      : Testing set mediaImage - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0800', 0, async function (done) {
            let metadata7 = {
                assetId: '121278',
                mediaImage: 'https://img2.baidu.com/it/u=3583435814,2833583486&fm=253&fmt=auto&app=138&f=JPEG?w=526&h=500',
            };
            await session.setAVMetadata(metadata7).then(() => {
                console.info('TestLog: Set mediaImage successfully');
            }).catch((err) => {
                console.info(`TestLog: Set mediaImage error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.mediaImage === metadata7.mediaImage) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get mediaImage failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get mediaImage error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0900
         * @tc.name      : SETMETADATA_0900
         * @tc.desc      : Testing set mediaImage - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_0900', 0, async function (done) {
            console.info('TestLog: Creat pixelmap');
            let pixelMap = await getPixelMap();
            let readBuffer0 = new ArrayBuffer(96);
            await pixelMap.readPixelsToBuffer(readBuffer0);
            let bufferArr0 = new Uint8Array(readBuffer0);
            let metadata8 = {
                assetId: '121278',
                mediaImage: pixelMap,
            };
            await session.setAVMetadata(metadata8).then(() => {
                console.info('TestLog: Set pixelMap successfully');
            }).catch((err) => {
                console.info(`TestLog: Set pixelMap error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            let pixMap;
            await controller.getAVMetadata().then((data) => {
                if (data.assetId === '121278') {
                    pixMap = data.mediaImage;
                } else {
                    console.info('TestLog: Get pixelMap failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get pixelMap error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            let pixelSize = pixMap.getPixelBytesNumber();
            console.info(`TestLog: pixelSize is: ${pixelSize}`);
            let readBuffer = new ArrayBuffer(pixelSize);
            await pixMap.readPixelsToBuffer(readBuffer);
            let bufferArr2 = new Uint8Array(readBuffer);
            for (let i = 0; i < bufferArr2.length; i++) {
                if (bufferArr0[i] !== bufferArr2[i]) {
                    expect(false).assertTrue();
                } else {
                    expect(true).assertTrue();
                }
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1000
         * @tc.name      : SETMETADATA_1000
         * @tc.desc      : Testing set publishDate - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1000', 0, async function (done) {
            let metadata9 = {
                assetId: '121278',
                publishDate: new Date(1994, 1, 1, 1),
            };
            await session.setAVMetadata(metadata9).then(() => {
                console.info('TestLog: Set publishDate successfully');
            }).catch((err) => {
                console.info(`TestLog: Set publishDate error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.publishDate.getTime() === metadata9.publishDate.getTime()) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get publishDate failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get publishDate error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1100
         * @tc.name      : SETMETADATA_1100
         * @tc.desc      : Testing set subtitle - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1100', 0, async function (done) {
            let metadata10 = {
                assetId: '121278',
                subtitle: '8 Mile',
            };
            await session.setAVMetadata(metadata10).then(() => {
                console.info('TestLog: Set subtitle successfully');
            }).catch((err) => {
                console.info(`TestLog: Set subtitle error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            await controller.getAVMetadata().then((data) => {
                if (data.subtitle === metadata10.subtitle) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get subtitle failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get subtitle error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1200
         * @tc.name      : SETMETADATA_1200
         * @tc.desc      : Testing set description - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1200', 0, async function (done) {
            let metadata11 = {
                assetId: '121278',
                description: 'Rap',
            };
            await session.setAVMetadata(metadata11).then(() => {
                console.info('TestLog: Set description successfully');
            }).catch((err) => {
                console.info(`TestLog: Set description error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await controller.getAVMetadata().then((data) => {
                if (data.description === metadata11.description) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get description failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get description error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1300
         * @tc.name      : SETMETADATA_1300
         * @tc.desc      : Testing set lyric - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1300', 0, async function (done) {
            let metadata12 = {
                assetId: '121278',
                lyric: 'https://lyric.tingmall.com/lyric/58/970/589710004-LRC-LRC.lrc?t=1649918948000',
            };
            await session.setAVMetadata(metadata12).then(() => {
                console.info('TestLog: Set lyric successfully');
            }).catch((err) => {
                console.info(`TestLog: Set lyric error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            await controller.getAVMetadata().then((data) => {
                if (data.lyric === metadata12.lyric) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get lyric failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get lyric error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1400
         * @tc.name      : SETMETADATA_1400
         * @tc.desc      : Testing set assetId - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1400', 0, async function (done) {
            let metadata13 = {
                assetId: '121278',
                previousAssetId: '121277',
                nextAssetId: '121279',
            };
            await session.setAVMetadata(metadata13).then(() => {
                console.info('TestLog: Set assetId successfully');
            }).catch((err) => {
                console.info(`TestLog: Set assetId error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            await controller.getAVMetadata().then((data) => {
                if (data.previousAssetId === metadata13.previousAssetId
                    && data.nextAssetId === metadata13.nextAssetId) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get assetId failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get assetId error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1500
         * @tc.name      : SETMETADATA_1500
         * @tc.desc      : Testing set metadata - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1500', 0, async function (done) {
            let metadata14 = {
                assetId: '121278',
            };
            await session.destroy();
            await sleep(500);
            await session.setAVMetadata(metadata14).then(() => {
                console.info('TestLog: Set metadata successfully');
                expect(false).assertTrue();
            }).catch((err) => {
                console.info(`TestLog: Set metadata error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            sleep(200);
            session = await avSession.createAVSession(context,tag,type);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1600
         * @tc.name      : SETMETADATA_1600
         * @tc.desc      : Testing set error metadata - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_1600', 0, async function (done) {
            let metadata15 = {
                assetId: '121278',
                duration: -2,
            };
            await session.setAVMetadata(metadata15).then(() => {
                console.info('TestLog: Set duration successfully');
                expect(false).assertTrue();
            }).catch((err) => {
                console.info(`TestLog: Set duration error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0100
         * @tc.name      : SETAVPLAYBACKSTATE_0100
         * @tc.desc      : Testing set playbackstate - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0100', 0, async function (done) {
            let PlaybackState1 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_PLAY,
                activeItemId: 0,
            };
            await session.setAVPlaybackState(PlaybackState1).then(() => {
                console.info('TestLog: Set State successfully');
            }).catch((err) => {
                console.info(`TestLog: Set State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            await controller.getAVPlaybackState().then((data) => {
                if (data.state === 2) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0200
         * @tc.name      : SETAVPLAYBACKSTATE_0200
         * @tc.desc      : Testing set speed - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0200', 0, async function (done) {
            let PlaybackState2 = {
                speed: 2.6,
            };

            await session.setAVPlaybackState(PlaybackState2).then(() => {
                console.info('TestLog: Set speed successfully');
            }).catch((err) => {
                console.info(`TestLog: Set speed error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            await controller.getAVPlaybackState().then((data) => {
                if (data.speed === 2.6) {
                    console.info('TestLog: Get speed successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get speed failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get speed error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0300
         * @tc.name      : SETAVPLAYBACKSTATE_0300
         * @tc.desc      : Testing set position - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0300', 0, async function (done) {
            let PlaybackState3 = {
                position: { elapsedTime: 10, updateTime: (new Date()).getTime() },
            };

            await session.setAVPlaybackState(PlaybackState3).then(() => {
                console.info('TestLog: Set position successfully');
            }).catch((err) => {
                console.info(`TestLog: Set position error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            await controller.getAVPlaybackState().then((data) => {
                if (data.position.elapsedTime === 10) {
                    console.info('TestLog: Get position successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get position failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get position error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0400
         * @tc.name      : SETAVPLAYBACKSTATE_0400
         * @tc.desc      : Testing set bufferedTime - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0400', 0, async function (done) {
            let PlaybackState4 = {
                bufferedTime: 1000,
            };

            await session.setAVPlaybackState(PlaybackState4).then(() => {
                console.info('TestLog: Set bufferedTime successfully');
            }).catch((err) => {
                console.info(`TestLog: Set bufferedTime error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            await controller.getAVPlaybackState().then((data) => {
                if (data.bufferedTime === 1000) {
                    console.info('TestLog: Get bufferedTime successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get bufferedTime failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get bufferedTime error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0500
         * @tc.name      : SETAVPLAYBACKSTATE_0500
         * @tc.desc      : Testing set loopMode - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0500', 0, async function (done) {
            let PlaybackState5 = {
                loopMode: avSession.LoopMode.LOOP_MODE_SEQUENCE,
            };

            await session.setAVPlaybackState(PlaybackState5).then(() => {
                console.info('TestLog: Set loopMode successfully');
            }).catch((err) => {
                console.info(`TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            await controller.getAVPlaybackState().then((data) => {
                if (data.loopMode === 0) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0600
         * @tc.name      : SETAVPLAYBACKSTATE_0600
         * @tc.desc      : Testing set loopMode - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0600', 0, async function (done) {
            let PlaybackState6 = {
                loopMode: avSession.LoopMode.LOOP_MODE_SINGLE,
            };

            await session.setAVPlaybackState(PlaybackState6).then(() => {
                console.info('TestLog: Set loopMode successfully');
            }).catch((err) => {
                console.info(`TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            await controller.getAVPlaybackState().then((data) => {
                if (data.loopMode === 1) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0700
         * @tc.name      : SETAVPLAYBACKSTATE_0700
         * @tc.desc      : Testing set loopMode - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0700', 0, async function (done) {
            let PlaybackState7 = {
                loopMode: avSession.LoopMode.LOOP_MODE_LIST,
            };

            await session.setAVPlaybackState(PlaybackState7).then(() => {
                console.info('TestLog: Set loopMode successfully');
            }).catch((err) => {
                console.info(`TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            await controller.getAVPlaybackState().then((data) => {
                if (data.loopMode === 2) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0800
         * @tc.name      : SETAVPLAYBACKSTATE_0800
         * @tc.desc      : Testing set loopMode - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0800', 0, async function (done) {
            let PlaybackState8 = {
                loopMode: avSession.LoopMode.LOOP_MODE_SHUFFLE,
            };

            await session.setAVPlaybackState(PlaybackState8).then(() => {
                console.info('TestLog: Set loopMode successfully');
            }).catch((err) => {
                console.info(`TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            await controller.getAVPlaybackState().then((data) => {
                if (data.loopMode === 3) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0900
         * @tc.name      : SETAVPLAYBACKSTATE_0900
         * @tc.desc      : Testing set isFavorite - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_0900', 0, async function (done) {
            let PlaybackState9 = {
                isFavorite: true,
            };

            await session.setAVPlaybackState(PlaybackState9).then(() => {
                console.info('TestLog: Set isFavorite successfully');
            }).catch((err) => {
                console.info(`TestLog: Set isFavorite error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            await controller.getAVPlaybackState().then((data) => {
                if (data.isFavorite === true) {
                    console.info('TestLog: Get isFavorite successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get isFavorite failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get isFavorite error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1000
         * @tc.name      : SETAVPLAYBACKSTATE_1000
         * @tc.desc      : Testing set playbackstate - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1000', 0, async function (done) {
            let PlaybackState10 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_PLAY,
                speed: 1.0,
                position: { elapsedTime: 10, updateTime: (new Date()).getTime() },
                bufferedTime: 1000,
                loopMode: avSession.LoopMode.LOOP_MODE_SINGLE,
                isFavorite: true,
            };
            await session.destroy();
            await sleep(500);
            await session.setAVPlaybackState(PlaybackState10).then(() => {
                console.info('TestLog: Set playbackState successfully');
                expect(false).assertTrue();
            }).catch((err) => {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            sleep(200);
            session = await avSession.createAVSession(context,tag,type);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1100
         * @tc.name      : SETAVPLAYBACKSTATE_1100
         * @tc.desc      : Testing set playbackstate - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1100', 0, async function (done) {
            let PlaybackState11 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_PLAY,
                speed: -2,
                position: { elapsedTime: -2, updateTime: (new Date()).getTime() },
                bufferedTime: -4,
                loopMode: avSession.LoopMode.LOOP_MODE_SINGLE,
                isFavorite: true,
            };
            await session.setAVPlaybackState(PlaybackState11).then(() => {
                console.info('TestLog: Set playbackState successfully');
                expect(false).assertTrue();
            }).catch((err) => {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1200
         * @tc.name      : SETAVPLAYBACKSTATE_1200
         * @tc.desc      : Testing set playbackstate - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1200', 0, async function (done) {
            let PlaybackState12 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_INITIAL,
            };
            await session.setAVPlaybackState(PlaybackState12).then(() => {
                console.info('TestLog: Set playbackState successfully');
                expect(true).assertTrue();
            }).catch((err) => {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            await controller.getAVPlaybackState().then((data) => {
                if (data.state === 0) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1300
         * @tc.name      : SETAVPLAYBACKSTATE_1300
         * @tc.desc      : Testing set playbackstate - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1300', 0, async function (done) {
            let PlaybackState13 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_PREPARE,
            };
            await session.setAVPlaybackState(PlaybackState13).then(() => {
                console.info('TestLog: Set playbackState successfully');
                expect(true).assertTrue();
            }).catch((err) => {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            await controller.getAVPlaybackState().then((data) => {
                if (data.state === 1) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1400
         * @tc.name      : SETAVPLAYBACKSTATE_1400
         * @tc.desc      : Testing set playbackstate - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1400', 0, async function (done) {
            let PlaybackState14 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_PAUSE,
            };
            await session.setAVPlaybackState(PlaybackState14).then(() => {
                console.info('TestLog: Set playbackState successfully');
                expect(true).assertTrue();
            }).catch((err) => {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            await controller.getAVPlaybackState().then((data) => {
                if (data.state === 3) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1500
         * @tc.name      : SETAVPLAYBACKSTATE_1500
         * @tc.desc      : Testing set playbackstate - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1500', 0, async function (done) {
            let PlaybackState15 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_FAST_FORWARD,
            };
            await session.setAVPlaybackState(PlaybackState15).then(() => {
                console.info('TestLog: Set playbackState successfully');
                expect(true).assertTrue();
            }).catch((err) => {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            await controller.getAVPlaybackState().then((data) => {
                if (data.state === 4) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1600
         * @tc.name      : SETAVPLAYBACKSTATE_1600
         * @tc.desc      : Testing set playbackstate - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1600', 0, async function (done) {
            let PlaybackState16 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_REWIND,
            };
            await session.setAVPlaybackState(PlaybackState16).then(() => {
                console.info('TestLog: Set playbackState successfully');
                expect(true).assertTrue();
            }).catch((err) => {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            await controller.getAVPlaybackState().then((data) => {
                if (data.state === 5) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1700
         * @tc.name      : SETAVPLAYBACKSTATE_1700
         * @tc.desc      : Testing set playbackstate - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_1700', 0, async function (done) {
            let PlaybackState17 = {
                state: avSession.PlaybackState.PLAYBACK_STATE_STOP,
            };
            await session.setAVPlaybackState(PlaybackState17).then(() => {
                console.info('TestLog: Set playbackState successfully');
                expect(true).assertTrue();
            }).catch((err) => {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });

            await sleep(500);

            await controller.getAVPlaybackState().then((data) => {
                if (data.state === 6) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_PROMISE_0100
         * @tc.name      : SETLAUNCHABILITY_0100
         * @tc.desc      : Testing set LaunchAbility - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level1
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_PROMISE_0100', 0, async function (done) {
            let wantAgentInfo = {
                wants: [
                    {
                        bundleName: 'com.example.myapplication',
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
                console.info('TestLog: AVSessionTest : Set LaunchAbility');
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
                    console.info('TestLog: AVSessionTest : Set LaunchAbility successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: AVSessionTest : Set LaunchAbility failed');
                    expect(false).assertTrue();
                }
            }).catch((error) => {
                console.info(`TestLog: compare LaunchAbility error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_PROMISE_0100
         * @tc.name      : SESSIONACTIVATE_PROMISE_0100
         * @tc.desc      : Testing set session active - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level1
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_PROMISE_0100', 0, async function (done) {
            await session.activate().then(() => {
                console.info('TestLog: Set session active successfully');
            }).catch((err) => {
                console.info(`TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            await controller.isActive().then((data) => {
                if (data) {
                    console.info('TestLog: session is active');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: session is directive');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: AVSessionTest error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_PROMISE_0100
         * @tc.name      : SESSIONDEACTIVATE_PROMISE_0100
         * @tc.desc      : Testing deactivate session- promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level1
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_PROMISE_0100', 0, async function (done) {
            await session.activate().then(() => {
                console.info('TestLog: Set session active');
            }).catch((err) => {
                console.info(`TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);

            await session.deactivate().then(() => {
                console.info('TestLog: Deactivate session');
            }).catch((err) => {
                console.info(`TestLog: Deactivate session error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);

            await controller.isActive().then((data) => {
                if (data) {
                    console.info('TestLog: session deactivate failed');
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: session deactivate successfully');
                    expect(true).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: AVSessionTest error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_CALLBACK_0100
         * @tc.name      : SESSIONACTIVATE_CALLBACK_0100
         * @tc.desc      : Testing set session active - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_CALLBACK_0100', 0, async function (done) {
            try {
                session.activate((err) => {
                    if (err) {
                        console.info(`TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info('TestLog: Set session active successfully');
                    }
                })
            } catch (err) {
                console.info(`TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }

            await sleep(500);
            await controller.isActive().then((data) => {
                if (data) {
                    console.info('TestLog: session is active');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: session is directive');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: AVSessionTest error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_CALLBACK_0100
         * @tc.name      : SESSIONDEACTIVATE_CALLBACK_0100
         * @tc.desc      : Testing deactivate session- callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_CALLBACK_0100', 0, async function (done) {
            await session.activate().then(() => {
                console.info('TestLog: Set session active');
            }).catch((err) => {
                console.info(`TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);

            try {
                session.deactivate((err) => {
                    if (err) {
                        console.info(`TestLog: Deactivate session error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info('TestLog: Deactivate session');
                    }
                })
            } catch (err) {
                console.info(`TestLog: Deactivate session error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await sleep(500);

            await controller.isActive().then((data) => {
                if (data) {
                    console.info('TestLog: session deactivate failed');
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: session deactivate successfully');
                    expect(true).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: AVSessionTest error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
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
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONPAUSE_0100
         * @tc.name      : ONPAUSE_0100
         * @tc.desc      : Testing onPause callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPAUSE_0100', 0, async function (done) {
            session.on('pause', () => {
                console.info('TestLog: Pause command callback registration successful');
                expect(true).assertTrue();
            });

            await controller.sendControlCommand({ command: 'pause' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONSTOP_0100
         * @tc.name      : ONSTOP_0100
         * @tc.desc      : Testing onStop callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSTOP_0100', 0, async function (done) {
            session.on('stop', () => {
                console.info('TestLog: Stop command callback registration successful');
                expect(true).assertTrue();
            });

            await controller.sendControlCommand({ command: 'stop' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_0100
         * @tc.name      : ONPLAYNEXT_0100
         * @tc.desc      : Testing onPlayNext callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_0100', 0, async function (done) {
            session.on('playNext', () => {
                console.info('TestLog: PlayNext command callback registration successful');
                expect(true).assertTrue();
            });

            await controller.sendControlCommand({ command: 'playNext' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_0100
         * @tc.name      : ONPLAYPREVIOUS_0100
         * @tc.desc      : Testing onPlayPrevious callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_0100', 0, async function (done) {
            session.on('playPrevious', () => {
                console.info('TestLog: PlayPrevious command callback registration successful');
                expect(true).assertTrue();
            });

            await controller.sendControlCommand({ command: 'playPrevious' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_0100
         * @tc.name      : ONFASTFORWARD_0100
         * @tc.desc      : Testing onFastForward callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_0100', 0, async function (done) {
            session.on('fastForward', () => {
                console.info('TestLog: FastForward command callback registration successful');
                expect(true).assertTrue();
            });

            await controller.sendControlCommand({ command: 'fastForward' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONREWIND_0100
         * @tc.name      : ONREWIND_0100
         * @tc.desc      : Testing onRewind callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONREWIND_0100', 0, async function (done) {
            session.on('rewind', () => {
                console.info('TestLog: Rewind command callback registration successful');
                expect(true).assertTrue();
            });

            await controller.sendControlCommand({ command: 'rewind' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONSEEK_0100
         * @tc.name      : ONSEEK_0100
         * @tc.desc      : Testing onSeek callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSEEK_0100', 0, async function (done) {
            session.on('seek', (callback) => {
                if (callback === 10) {
                    console.info('TestLog: Seek command callback registration successful');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Seek command callback registration failed');
                    expect(false).assertTrue();
                }
            });

            await controller.sendControlCommand({ command: 'seek', parameter: 10 }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONSETSPEED_0100
         * @tc.name      : ONSETSPEED_0100
         * @tc.desc      : Testing Set Speed callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSETSPEED_0100', 0, async function (done) {
            session.on('setSpeed', (callback) => {
                if (callback === 2.6) {
                    console.info('TestLog: SetSpeed command callback registration successful');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: SetSpeed command callback registration error');
                    expect(false).assertTrue();
                }
            });

            await controller.sendControlCommand({ command: 'setSpeed', parameter: 2.6 }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONSETLOOPMODE_0100
         * @tc.name      : ONSETLOOPMODE_0100
         * @tc.desc      : Testing Set LoopMode callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSETLOOPMODE_0100', 0, async function (done) {
            session.on('setLoopMode', (callback) => {
                if (callback === 1) {
                    console.info('TestLog: Set LoopMode command callback registration successful');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Set LoopMode command callback registration error');
                    expect(false).assertTrue();
                }
            });

            await controller.sendControlCommand({
                command: 'setLoopMode', parameter:
                    avSession.LoopMode.LOOP_MODE_SINGLE
            }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONTOGGLEFAVORITE_0100
         * @tc.name      : ONTOGGLEFAVORITE_0100
         * @tc.desc      : Testing Set toggleFavorite callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONTOGGLEFAVORITE_0100', 0, async function (done) {
            session.on('toggleFavorite', (callback) => {
                if (callback === 'false') {
                    console.info('TestLog: Set toggleFavorite command callback registration successful');
                    expect(true).assertTrue();
                }
                else {
                    console.info('TestLog: Set toggleFavorite command callback registration error');
                    expect(false).assertTrue();
                }
            });

            await controller.sendControlCommand({ command: 'toggleFavorite', parameter: 'false' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
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
                console.info(`TestLog: Controller send AVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
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
                session.on('wrongCall', () => {
                    console.info('TestLog: Wrong callback registration successful');
                });
            } catch (err) {
                console.info(`TestLog: Wrong callback registration error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
                done();
            }
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
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: Play command registration2 success');
                expect(false).assertTrue();
            }

            session.on('play', callback1);

            session.on('play', callback2);

            session.off('play');

            await controller.sendControlCommand({ command: 'play' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFPLAY_0200
         * @tc.name      : OFFPLAY_0200
         * @tc.desc      : Testing offPlay callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAY_0200', 0, async function (done) {
            function callback1() {
                console.info('TestLog: Play command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: Play command registration2 success');
                expect(true).assertTrue();
            }

            session.on('play', callback1);

            session.on('play', callback2);

            session.off('play', callback1);

            await controller.sendControlCommand({ command: 'play' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })


        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_0100
         * @tc.name      : OFFPAUSE_0100
         * @tc.desc      : Testing offPause callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_0100', 0, async function (done) {
            function callback1() {
                console.info('TestLog: Pause command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: Pause command registration2 success');
                expect(false).assertTrue();
            }

            session.on('pause', callback1);

            session.on('pause', callback2);

            session.off('pause');

            await controller.sendControlCommand({ command: 'pause' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_0200
         * @tc.name      : OFFPAUSE_0200
         * @tc.desc      : Testing offPause callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_0200', 0, async function (done) {
            function callback1() {
                console.info('TestLog: Pause command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: Pause command registration2 success');
                expect(true).assertTrue();
            }

            session.on('pause', callback1);

            session.on('pause', callback2);

            session.off('pause', callback1);

            await controller.sendControlCommand({ command: 'pause' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })


        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFSTOP_0100
         * @tc.name      : OFFSTOP_0100
         * @tc.desc      : Testing offStop callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSTOP_0100', 0, async function (done) {
            function callback1() {
                console.info('TestLog: Stop command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: Stop command registration2 success');
                expect(false).assertTrue();
            }

            session.on('stop', callback1)

            session.on('stop', callback2)

            session.off('stop');

            await controller.sendControlCommand({ command: 'stop' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFSTOP_0200
         * @tc.name      : OFFSTOP_0200
         * @tc.desc      : Testing offStop callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSTOP_0200', 0, async function (done) {
            function callback1() {
                console.info('TestLog: Stop command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: Stop command registration2 success');
                expect(true).assertTrue();
            }

            session.on('stop', callback1)

            session.on('stop', callback2)

            session.off('stop', callback1)

            await controller.sendControlCommand({ command: 'stop' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_0100
         * @tc.name      : OFFPLAYNEXT_0100
         * @tc.desc      : Testing offPlayNext callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_0100', 0, async function (done) {
            function callback1() {
                console.info('TestLog: PlayNext command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: PlayNext command registration2 success');
                expect(false).assertTrue();
            }

            session.on('playNext', callback1);

            session.on('playNext', callback2);

            session.off('playNext');

            await controller.sendControlCommand({ command: 'playNext' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_0200
         * @tc.name      : OFFPLAYNEXT_0200
         * @tc.desc      : Testing offPlayNext callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_0200', 0, async function (done) {
            function callback1() {
                console.info('TestLog: PlayNext command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: PlayNext command registration2 success');
                expect(true).assertTrue();
            }

            session.on('playNext', callback1);

            session.on('playNext', callback2);

            session.off('playNext', callback1);

            await controller.sendControlCommand({ command: 'playNext' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_0100
         * @tc.name      : OFFPLAYPREVIOUS_0100
         * @tc.desc      : Testing offPlayPrevious callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_0100', 0, async function (done) {
            function callback1() {
                console.info('TestLog: PlayPrevious command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: PlayPrevious command registration2 success');
                expect(false).assertTrue();
            }

            session.on('playPrevious', callback1);

            session.on('playPrevious', callback2);

            session.off('playPrevious');

            await controller.sendControlCommand({ command: 'playPrevious' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_0200
         * @tc.name      : OFFPLAYPREVIOUS_0200
         * @tc.desc      : Testing offPlayPrevious callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_0200', 0, async function (done) {
            function callback1() {
                console.info('TestLog: PlayPrevious command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: PlayPrevious command registration2 success');
                expect(true).assertTrue();
            }

            session.on('playPrevious', callback1);

            session.on('playPrevious', callback2);

            session.off('playPrevious', callback1);

            await controller.sendControlCommand({ command: 'playPrevious' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_0100
         * @tc.name      : OFFFASTFORWARD_0100
         * @tc.desc      : Testing offFastForward callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_0100', 0, async function (done) {
            function callback1() {
                console.info('TestLog: FastForward command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: FastForward command registration2 success');
                expect(false).assertTrue();
            }

            session.on('fastForward', callback1);

            session.on('fastForward', callback2);

            session.off('fastForward');

            await controller.sendControlCommand({ command: 'fastForward' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_0200
         * @tc.name      : OFFFASTFORWARD_0200
         * @tc.desc      : Testing offFastForward callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_0200', 0, async function (done) {
            function callback1() {
                console.info('TestLog: FastForward command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: FastForward command registration2 success');
                expect(true).assertTrue();
            }

            session.on('fastForward', callback1);

            session.on('fastForward', callback2);

            session.off('fastForward', callback1);

            await controller.sendControlCommand({ command: 'fastForward' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFREWIND_0100
         * @tc.name      : OFFREWIND_0100
         * @tc.desc      : Testing offRewind callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFREWIND_0100', 0, async function (done) {
            function callback1() {
                console.info('TestLog: Rewind command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: Rewind command registration2 success');
                expect(false).assertTrue();
            }

            session.on('rewind', callback1);

            session.on('rewind', callback2);

            session.off('rewind');

            await controller.sendControlCommand({ command: 'rewind' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFREWIND_0200
         * @tc.name      : OFFREWIND_0200
         * @tc.desc      : Testing offRewind callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFREWIND_0200', 0, async function (done) {
            function callback1() {
                console.info('TestLog: Rewind command registration1 success');
                expect(false).assertTrue();
            }

            function callback2() {
                console.info('TestLog: Rewind command registration2 success');
                expect(true).assertTrue();
            }

            session.on('rewind', callback1);

            session.on('rewind', callback2);

            session.off('rewind', callback1);

            await controller.sendControlCommand({ command: 'rewind' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFSEEK_0100
         * @tc.name      : OFFSEEK_0100
         * @tc.desc      : Testing offSeek callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSEEK_0100', 0, async function (done) {
            function callback1(data) {
                if (data === 5) {
                    console.info('TestLog: offSeek callback1 registration');
                    expect(false).assertTrue;
                }
            }

            function callback2(data) {
                if (data === 10) {
                    console.info('TestLog: offSeek callback2 registration');
                    expect(false).assertTrue;
                }
            }

            session.on('seek', callback1);

            session.on('seek', callback2);

            session.off('seek');

            await controller.sendControlCommand({ command: 'seek', parameter: 10 }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFSEEK_0200
         * @tc.name      : OFFSEEK_0200
         * @tc.desc      : Testing offSeek callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSEEK_0200', 0, async function (done) {
            function callback1(data) {
                if (data === 5) {
                    console.info('TestLog: offSeek callback1 registration');
                    expect(false).assertTrue;
                }
            }

            function callback2(data) {
                if (data === 10) {
                    console.info('TestLog: offSeek callback2 registration');
                    expect(true).assertTrue;
                }
            }

            session.on('seek', callback1);

            session.on('seek', callback2);

            session.off('seek', callback1);

            await controller.sendControlCommand({ command: 'seek', parameter: 10 }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_0100
         * @tc.name      : OFFSETSPEED_0100
         * @tc.desc      : Testing offSetSpeed callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_0100', 0, async function (done) {
            function callback1(data) {
                if (data === 1.0) {
                    console.info('TestLog: SetSpend command registration1 success');
                    expect(false).assertTrue;
                }
            }

            function callback2(data) {
                if (data === 2.0) {
                    console.info('TestLog: SetSpend command registration2 success');
                    expect(false).assertTrue;
                }
            }

            session.on('setSpeed', callback1);

            session.on('setSpeed', callback2);

            session.off('setSpeed');

            await controller.sendControlCommand({ command: 'setSpeed', parameter: 2.0 }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_0200
         * @tc.name      : OFFSETSPEED_0200
         * @tc.desc      : Testing offSetSpeed callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_0200', 0, async function (done) {
            function callback1(data) {
                if (data === 1.0) {
                    console.info('TestLog: SetSpend command registration1 success');
                    expect(false).assertTrue;
                }
            }

            function callback2(data) {
                if (data === 2.0) {
                    console.info('TestLog: SetSpend command registration2 success');
                    expect(true).assertTrue;
                }
            }

            session.on('setSpeed', callback1);

            session.on('setSpeed', callback2);

            session.off('setSpeed', callback1);

            await controller.sendControlCommand({ command: 'setSpeed', parameter: 2.0 }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_0100
         * @tc.name      : OFFSETLOOPMODE_0100
         * @tc.desc      : Testing offSetLoopMode callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_0100', 0, async function (done) {
            function callback1(data) {
                if (data === 1) {
                    console.info('TestLog: SetLoopMode command registration1 success');
                    expect(false).assertTrue;
                }
            }

            function callback2(data) {
                if (data === 2) {
                    console.info('TestLog: SetLoopMode command registration2 success');
                    expect(false).assertTrue;
                }
            }

            session.on('setLoopMode', callback1);

            session.on('setLoopMode', callback2);

            session.off('setLoopMode');

            await controller.sendControlCommand({
                command: 'setLoopMode',
                parameter: avSession.LoopMode.LOOP_MODE_SINGLE
            }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_0200
         * @tc.name      : OFFSETLOOPMODE_0200
         * @tc.desc      : Testing offSetLoopMode callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_0200', 0, async function (done) {
            function callback1(data) {
                if (data === 2) {
                    console.info('TestLog: SetLoopMode command registration1 success');
                    expect(false).assertTrue;
                }
            }

            function callback2(data) {
                if (data === 1) {
                    console.info('TestLog: SetLoopMode command registration2 success');
                    expect(true).assertTrue;
                }
            }

            session.on('setLoopMode', callback1);

            session.on('setLoopMode', callback2);

            session.off('setLoopMode', callback1);

            await controller.sendControlCommand({
                command: 'setLoopMode',
                parameter: avSession.LoopMode.LOOP_MODE_SINGLE
            }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_0100
         * @tc.name      : OFFTOGGLEFAVORITE_0100
         * @tc.desc      : Testing offToggleFavorite callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_0100', 0, async function (done) {
            function callback1(data) {
                if (data === 'true') {
                    console.info('TestLog: ToggleFavorite command registration1 success');
                    expect(false).assertTrue;
                }
            }

            function callback2(data) {
                if (data === 'false') {
                    console.info('TestLog: ToggleFavorite command registration1 success');
                    expect(false).assertTrue;
                }
            }

            session.on('toggleFavorite', callback1);

            session.on('toggleFavorite', callback2);

            session.off('toggleFavorite');

            await controller.sendControlCommand({ command: 'toggleFavorite', parameter: 'false' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_0200
         * @tc.name      : OFFTOGGLEFAVORITE_0200
         * @tc.desc      : Testing offToggleFavorite callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_0200', 0, async function (done) {
            function callback1(data) {
                if (data === 'true') {
                    console.info('TestLog: ToggleFavorite command registration1 success');
                    expect(false).assertTrue;
                }
            }

            function callback2(data) {
                if (data === 'false') {
                    console.info('TestLog: ToggleFavorite command registration2 success');
                    expect(true).assertTrue;
                }
            }

            session.on('toggleFavorite', callback1);

            session.on('toggleFavorite', callback2);

            session.off('toggleFavorite', callback1);

            await controller.sendControlCommand({ command: 'toggleFavorite', parameter: 'false' }).then(() => {
                console.info('TestLog: Controller send command successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_0100
         * @tc.name      : OFFHANDLEKEYEVENT_0100
         * @tc.desc      : Testing offHandleKeyEvent callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_0100', 0, async function (done) {
            let flag = true;
            function callback1(data) {
                if (data.action === 1) {
                    console.info('TestLog: HandleKeyEvent command registration1 success');
                    flag = false;
                }
            }

            function callback2(data) {
                if (data.action === 2) {
                    console.info('TestLog: HandleKeyEvent command registration2 success');
                    flag = false;
                }
            }

            session.on('handleKeyEvent', callback1);

            session.on('handleKeyEvent', callback2);

            session.off('handleKeyEvent');

            await controller.sendAVKeyEvent(event).then(() => {
                console.info('TestLog: Controller send AVKeyEvent successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send AVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);

            if (flag) {
                console.info('TestLog: HandleKeyEvent command callback unRegistration successful');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: HandleKeyEvent command callback unRegistration failed');
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_0200
         * @tc.name      : OFFHANDLEKEYEVENT_0200
         * @tc.desc      : Testing offHandleKeyEvent callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_0200', 0, async function (done) {
            function callback1(data) {
                if (data.action === 1) {
                    console.info('TestLog: HandleKeyEvent command registration1 success');
                    expect(false).assertTrue();
                }
            }

            function callback2(data) {
                if (data.action === 2) {
                    console.info('TestLog: HandleKeyEvent command registration2 success');
                    expect(true).assertTrue();
                }
            }

            session.on('handleKeyEvent', callback1);

            session.on('handleKeyEvent', callback2);

            session.off('handleKeyEvent', callback1);

            await controller.sendAVKeyEvent(event).then(() => {
                console.info('TestLog: Controller send AVKeyEvent successfully');
            }).catch((err) => {
                console.info(`TestLog: Controller send AVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await sleep(500);
            done();
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_PROMISE_0100
        * @tc.name      : GETOUTPUTDEVICE_PROMISE_0100
        * @tc.desc      : Testing get output device
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_PROMISE_0100', 0, async function (done) {
            session.on('outputDeviceChange', (callback) => {
                if (!callback.isRemote) {
                    console.info(callback.audioDeviceId.size);
                    console.info(callback.deviceName.size);
                    console.info('outputDeviceChange callback registration successful');
                    expect(true).assertTrue();
                } else {
                    console.info('outputDeviceChange callback registration fail');
                    expect(false).assertTrue();
                }
            });

            session.off('outputDeviceChange');

            await session.getOutputDevice().then((data) => {
                if (!data.isRemote) {
                    expect(true).assertTrue();
                } else {
                    console.info(avSession.OutputDeviceInfo.isRemote);
                    console.info(avSession.OutputDeviceInfo.audioDeviceId.size);
                    console.info(avSession.OutputDeviceInfo.deviceName.size);
                    console.info('getOutputDevice successfully');
                    console.info('Get device information failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`Get device BusinessError: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            })
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_0100
         * @tc.name      : GETOUTPUTDEVICE_CALLBACK_0100
         * @tc.desc      : Testing get output device
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_0100', 0, async function (done) {
            session.getOutputDevice((err, value) => {
                if (err) {
                    console.info(`Get device information BusinessError: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (!value.isRemote) {
                    console.info('Get device information successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('Get device information failed');
                    expect(false).assertTrue();
                }
            });
            done();
        })

        /* *
 * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_0200
 * @tc.name      : GETOUTPUTDEVICE_CALLBACK_0100
 * @tc.desc      : Testing get output device
 * @tc.size      : MediumTest
 * @tc.type      : Function
 * @tc.level     : Level2
 */
        it('SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_0200', 0, async function (done) {
            await session.getOutputDevice().then((data) => {
                if (data.devices.length > 0) {
                    console.info('SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_0200' + JSON.stringify(data.devices[0].deviceid))
                    console.info('SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_0200' + JSON.stringify(data.devices[0].deviceName))
                    console.info('SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_0200' + JSON.stringify(data.devices[0].castCategory))
                    expect(true).assertTrue();
                }
            }).catch((err) => {
                console.info(`Get device BusinessError: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            })
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_PROMISE_0100
         * @tc.name      : GETCONTROLLER_PROMISE_0100
         * @tc.desc      : Testing get controller
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_PROMISE_0100', 0, async function (done) {
            await session.getController().then((data) => {
                console.info('Get controller successfully');
                expect(true).assertTrue();
            }).catch((err) => {
                console.info('Get controller failed');
                console.info(`Get controller BusinessError: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_CALLBACK_0100
         * @tc.name      : GETCONTROLLER_CALLBACK_0100
         * @tc.desc      : Testing get controller
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_CALLBACK_0100', 0, async function (done) {
            session.getController((err, data) => {
                if (err) {
                    console.info('Get controller failed');
                    expect(false).assertTrue();
                } else {
                    console.info('Get controller successfully');
                    expect(true).assertTrue();
                }
            })
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_CALLBACK_0100
         * @tc.name      : SENDAVKEYEVENT_CALLBACK_0100
         * @tc.desc      : Testing set key event
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_CALLBACK_0100', 0, async function (done) {
            let keyItem = { code: 0x49, pressedTime: 123456789, deviceId: 0 };
            let event = { action: 2, key: keyItem, keys: [keyItem] };
            try {
                controller.sendAVKeyEvent(event, (err, data) => {
                    if (err) {
                        console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info('sendAVKeyEvent Successfully');
                        expect(true).assertTrue();
                    }
                })
            } catch (err) {
                console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_PROMISE_0100
         * @tc.name      : SENDAVKEYEVENT_PROMISE_0100
         * @tc.desc      : Testing set key event
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_PROMISE_0100', 0, async function (done) {
            let keyItem = { code: 0x49, pressedTime: 123456789, deviceId: 0 };
            let event = { action: 2, key: keyItem, keys: [keyItem] };
            await controller.sendAVKeyEvent(event).then(() => {
                console.info('sendAVKeyEvent Successfully');
                expect(true).assertTrue();
            }).catch((err) => {
                console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETREALPLAYBACKPOSITIONSYNC_0100
         * @tc.name      : GETREALPLAYBACKPOSITIONSYNC_0100
         * @tc.desc      : Testing get real playback position
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETREALPLAYBACKPOSITIONSYNC_0100', 0, async function (done) {
            let realPosition = -1;
            try {
                realPosition = controller.getRealPlaybackPositionSync();
            } catch (err) {
                console.info(`TestLog: getRealPlaybackPositionSync error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            if (realPosition < 0) {
                console.info(`TestLog: getRealPlaybackPositionSync error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            } else {
                console.info(`TestLog: getRealPlaybackPositionSync Successfully, positon: ${realPosition}`);
                expect(true).assertTrue();
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_PROMISE_0100
         * @tc.name      : GETVALIDCOMMANDS_PROMISE_0100
         * @tc.desc      : Testing get valid commands - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_PROMISE_0100', 0, async function (done) {
            await controller.getValidCommands().then((data) => {
                console.info(`TestLog: getValidCommands Successfully, the length ${data.length}`);
                expect(true).assertTrue();
            }).catch((err) => {
                console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_CALLBACK_0100
         * @tc.name      : GETVALIDCOMMANDS_CALLBACK_0100
         * @tc.desc      : Testing get valid commands - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_CALLBACK_0100', 0, async function (done) {
            try {
                controller.getValidCommands((err, data) => {
                    if (err) {
                        console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info(`TestLog: getValidCommands Successfully, the length ${data.length}`);
                        expect(true).assertTrue();
                    }
                })
            } catch (err) {
                console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        })
    })
}
