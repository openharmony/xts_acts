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
import image from '@ohos.multimedia.image';
import WantAgent from '@ohos.wantAgent';
import featureAbility from '@ohos.ability.featureAbility';

export default function AVSessionCallback() {
    describe('AVSessionCallback', function () {
        let tag = 'ApplicationA';
        let type = 'audio';
        let session;
        let controller;
        let context = featureAbility.getContext();

        function sleep (ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        async function getPixelMap() {
            let color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            bufferArr.fill('3', 0, 95);
            let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 }, AlphaType: 3};
            return image.createPixelMap(color, opts);
        }

        beforeAll(function () {
            console.info('TestLog: Start Testing AVSession Interfaces');
        })

        beforeEach(async function () {
            console.info('TestLog: Init Session And Controller');
            await avSession.createAVSession(context, tag, type).then((data) => {
                session = data;
            }).catch((err) => {
                console.info(`TestLog: Session created error: code: ${err.code}, message: ${err.message}`);
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
            console.info('TestLog: End Testing AVSession Interfaces');
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0100
         * @tc.name      : SETMETADATA_0100
         * @tc.desc      : Testing set assetId - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0100', 0, async function (done) {
            let metadata0  = {
                assetId: '121278',
            };

            session.setAVMetadata(metadata0, (err) => {
                if (err) {
                    console.info(`TestLog: Set assetId error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            });
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get assetId error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.assetId === metadata0.assetId) {
                    console.info('TestLog: Get assetId Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get assetId failed: ${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0200
         * @tc.name      : SETMETADATA_0200
         * @tc.desc      : Testing set artist - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0200', 0, async function (done) {
            let metadata1  = {
                assetId: '121278',
                artist: 'Eminem',
            };
            session.setAVMetadata(metadata1, (err) => {
                if (err) {
                    console.info(`TestLog: Set artist error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            });
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get artist error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.artist === metadata1.artist) {
                    console.info('TestLog: Get artist Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get artist failed' ${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0300
         * @tc.name      : SETMETADATA_0300
         * @tc.desc      : Testing set author - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0300', 0, async function (done) {
            let metadata2  = {
                assetId: '121278',
                author: 'ST',
            };
            session.setAVMetadata(metadata2, (err) => {
                if (err) {
                    console.info(`TestLog: Set author error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get author error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.author === metadata2.author) {
                    console.info('TestLog: Get author Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get author failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0400
         * @tc.name      : SETMETADATA_0400
         * @tc.desc      : Testing set album - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0400', 0, async function (done) {
            let metadata3  = {
                assetId: '121278',
                album: 'Slim shady',
            };
            session.setAVMetadata(metadata3, (err) => {
                if (err) {
                    console.info(`TestLog: Set album error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get album error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.album === metadata3.album) {
                    console.info('TestLog: Get album Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get album failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0500
         * @tc.name      : SETMETADATA_0500
         * @tc.desc      : Testing set writer - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0500', 0, async function (done) {
            let metadata4  = {
                assetId: '121278',
                writer: 'ST',
            };
            session.setAVMetadata(metadata4, (err) => {
                if (err) {
                    console.info(`TestLog: Set writer error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get writer error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.writer === metadata4.writer) {
                    console.info('TestLog: Get writer Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get writer failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0600
         * @tc.name      : SETMETADATA_0600
         * @tc.desc      : Testing set composer - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0600', 0, async function (done) {
            let metadata5  = {
                assetId: '121278',
                composer: 'ST',
            };
            session.setAVMetadata(metadata5, (err) => {
                if (err) {
                    console.info(`TestLog: Set composer error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get composer error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.composer === metadata5.composer) {
                    console.info('TestLog: Get composer Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get composer failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0700
         * @tc.name      : SETMETADATA_0700
         * @tc.desc      : Testing set duration - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0700', 0, async function (done) {
            let metadata6  = {
                assetId: '121278',
                duration: 2222,
            };
            session.setAVMetadata(metadata6, (err) => {
                if (err) {
                    console.info(`TestLog: Set duration error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get duration error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.duration === metadata6.duration) {
                    console.info('TestLog: Get duration Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get duration failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0800
         * @tc.name      : SETMETADATA_0800
         * @tc.desc      : Testing set mediaImage - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0800', 0, async function (done) {
            let metadata7  = {
                assetId: '121278',
                mediaImage: 'https://img2.baidu.com/it/u=3583435814,2833583486&fm=253&fmt=auto&app=138&f=JPEG?w=526&h=500',
            };
            session.setAVMetadata(metadata7, (err) => {
                if (err) {
                    console.info(`TestLog: Set mediaImage error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get mediaImage error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.mediaImage === metadata7.mediaImage) {
                    console.info('TestLog: Get mediaImage Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get mediaImage failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0900
         * @tc.name      : SETMETADATA_0900
         * @tc.desc      : Testing set mediaImage - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_0900', 0, async function (done) {
            console.info('TestLog: Create pixelmap');
            let pixelMap = await getPixelMap();
            let readBuffer0 = new ArrayBuffer(96);
            await pixelMap.readPixelsToBuffer(readBuffer0);
            let bufferArr0 = new Uint8Array(readBuffer0);
            let metadata8  = {
                assetId: '121278',
                mediaImage: pixelMap,
            };
            session.setAVMetadata(metadata8, (err) => {
                if (err) {
                    console.info(`TestLog: Set pixelMap error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            let pixMap;
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get pixelMap error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.assetId === metadata8.assetId) {
                    console.info('TestLog: Get pixelMap Successfully');
                    pixMap = value.mediaImage;
                } else {
                    console.info(`TestLog: Get pixelMap failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
            let pixelSize = pixMap.getPixelBytesNumber();
            console.info(`TestLog: pixelSize is:${pixelSize}`);
            let readBuffer = new ArrayBuffer(pixelSize);
            pixMap.readPixelsToBuffer(readBuffer);
            await sleep(500);
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
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1000
         * @tc.name      : SETMETADATA_1000
         * @tc.desc      : Testing set publishDate - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1000', 0, async function (done) {
            let metadata9  = {
                assetId: '121278',
                publishDate: new Date(1994,1,1,1),
            };
            session.setAVMetadata(metadata9, (err) => {
                if (err) {
                    console.info(`TestLog: Set publishDate error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set publishDate : successfully');
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get publishDate error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.publishDate.getTime() === metadata9.publishDate.getTime()) {
                    console.info('TestLog: Get publishDate Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get publishDate failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1100
         * @tc.name      : SETMETADATA_1100
         * @tc.desc      : Testing set subtitle - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1100', 0, async function (done) {
            let metadata10  = {
                assetId: '121278',
                subtitle: '8 Mile',
            };

            session.setAVMetadata(metadata10, (err) => {
                if (err) {
                    console.info(`TestLog: Set subtitle error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set subtitle successfully');
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get subtitle error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.subtitle === metadata10.subtitle) {
                    console.info('TestLog: Get subtitle Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get subtitle failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1200
         * @tc.name      : SETMETADATA_1200
         * @tc.desc      : Testing set description - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1200', 0, async function (done) {
            let metadata11  = {
                assetId: '121278',
                description: 'Rap',
            };
            session.setAVMetadata(metadata11, (err) => {
                if (err) {
                    console.info(`TestLog: Set description error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get description error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.description === metadata11.description) {
                    console.info('TestLog: Get description Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get description failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1300
         * @tc.name      : SETMETADATA_1300
         * @tc.desc      : Testing set lyric - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1300', 0, async function (done) {
            let metadata12  = {
                assetId: '121278',
                lyric: 'https://lyric.tingmall.com/lyric/58/970/58970104-LRC-LRC.lrc?t=1649918948000',
            };

            session.setAVMetadata(metadata12, (err) => {
                if (err) {
                    console.info(`TestLog: Set lyric error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get lyric error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.lyric === metadata12.lyric) {
                    console.info('TestLog: Get lyric Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get lyric failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1400
         * @tc.name      : SETMETADATA_1400
         * @tc.desc      : Testing set assetId - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1400', 0, async function (done) {
            let metadata13  = {
                assetId: '121278',
                previousAssetId: '121277',
                nextAssetId: '121279',
            };

            session.setAVMetadata(metadata13, (err) => {
                if (err) {
                    console.info(`TestLog: Set assetId error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            controller.getAVMetadata((err, value) => {
                if (err) {
                    console.info(`TestLog: Get assetId error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value.previousAssetId === metadata13.previousAssetId
                    && value.nextAssetId === metadata13.nextAssetId) {
                    console.info('TestLog: Get assetId Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info(`TestLog: Get assetId failed:${value}`);
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1500
         * @tc.name      : SETMETADATA_1500
         * @tc.desc      : Testing set metadata - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1500', 0, async function (done) {
            let metadata14  = {
                assetId: '121278',
            };
            session.destroy((err) => {
                if (err) {
                    console.info('TestLog: session destroy failed');
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: session destroy successfully');
                }
            });
            await sleep(500);
            session.setAVMetadata(metadata14, (err) => {
                if (err) {
                    console.info(`TestLog: Set metadata error: code: ${err.code}, message: ${err.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Set metadata : successfully');
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            session = await avSession.createAVSession(context,tag,type);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1600
         * @tc.name      : SETMETADATA_1600
         * @tc.desc      : Testing set error metadata - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETMETADATA_CALLBACK_1600', 0, async function (done) {
            let metadata15  = {
                assetId: '121278',
                duration: -2,
            };

            session.setAVMetadata(metadata15, (err) => {
                if (err) {
                    console.info(`TestLog: Set duration error: code: ${err.code}, message: ${err.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Set duration : successfully');
                    expect(false).assertTrue();
                }
               done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0100
         * @tc.name      : SETAVPLAYBACKSTATE_0100
         * @tc.desc      : Testing set playbackstate - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0100', 0, async function (done) {
            let PlaybackState1 = {
                state:avSession.PlaybackState.PLAYBACK_STATE_PLAY,
            };
            session.setAVPlaybackState(PlaybackState1, (err) => {
                if (err) {
                    console.info(`TestLog: Set State error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set State successfully');
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else if (value.state === 2) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0200
         * @tc.name      : SETAVPLAYBACKSTATE_0200
         * @tc.desc      : Testing set speed - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0200', 0, async function (done) {
            let PlaybackState2 = {
                speed: 2.6,
            };

            session.setAVPlaybackState(PlaybackState2, (err) => {
                if (err) {
                    console.info(`TestLog: Set speed error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set speed successfully');
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get speed error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else if (value.speed === 2.6) {
                    console.info('TestLog: Get speed successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get speed failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0300
         * @tc.name      : SETAVPLAYBACKSTATE_0300
         * @tc.desc      : Testing set position - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0300', 0, async function (done) {
            let PlaybackState3 = {
                position:{elapsedTime:10, updateTime:(new Date()).getTime()},
            };

            session.setAVPlaybackState(PlaybackState3, (err) => {
                if (err) {
                    console.info(`TestLog: Set position error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set position successfully');
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get position error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else if (value.position.elapsedTime === 10) {
                    console.info('TestLog: Get position successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get position failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0400
         * @tc.name      : SETAVPLAYBACKSTATE_0400
         * @tc.desc      : Testing set bufferedTime - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0400', 0, async function (done) {
            let PlaybackState4 = {
                bufferedTime: 1000,
            };

            session.setAVPlaybackState(PlaybackState4, (err) => {
                if (err) {
                    console.info(`TestLog: Set bufferedTime error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set bufferedTime successfully');
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get bufferedTime error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else if (value.bufferedTime === 1000) {
                    console.info('TestLog: Get bufferedTime successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get bufferedTime failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0500
         * @tc.name      : SETAVPLAYBACKSTATE_0500
         * @tc.desc      : Testing set loopMode - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0500', 0, async function (done) {
            let PlaybackState5 = {
                loopMode:avSession.LoopMode.LOOP_MODE_SEQUENCE,
            };

            session.setAVPlaybackState(PlaybackState5, (err) => {
                if (err) {
                    console.info(`TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set loopMode successfully');
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else if (value.loopMode === 0) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(1000);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0600
         * @tc.name      : SETAVPLAYBACKSTATE_0600
         * @tc.desc      : Testing set loopMode - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0600', 0, async function (done) {
            let PlaybackState6 = {
                loopMode:avSession.LoopMode.LOOP_MODE_SINGLE,
            };

            session.setAVPlaybackState(PlaybackState6, (err) => {
                if (err) {
                    console.info(`TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set loopMode successfully');
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else if (value.loopMode === 1) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(1000);
        })
        
        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0700
         * @tc.name      : SETAVPLAYBACKSTATE_0700
         * @tc.desc      : Testing set loopMode - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0700', 0, async function (done) {
            let PlaybackState7 = {
                loopMode:avSession.LoopMode.LOOP_MODE_LIST,
            };

            session.setAVPlaybackState(PlaybackState7, (err) => {
                if (err) {
                    console.info(`TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set loopMode successfully');
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else if (value.loopMode === 2) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(1000);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0800
         * @tc.name      : SETAVPLAYBACKSTATE_0800
         * @tc.desc      : Testing set loopMode - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0800', 0, async function (done) {
            let PlaybackState8 = {
                loopMode:avSession.LoopMode.LOOP_MODE_SHUFFLE,
            };

            session.setAVPlaybackState(PlaybackState8, (err) => {
                if (err) {
                    console.info(`TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set loopMode successfully');
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else if (value.loopMode === 3) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(1000);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0900
         * @tc.name      : SETAVPLAYBACKSTATE_0900
         * @tc.desc      : Testing set isFavorite - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_0900', 0, async function (done) {
            let PlaybackState9 = {
                isFavorite:true,
            };

            session.setAVPlaybackState(PlaybackState9, (err) => {
                if (err) {
                    console.info(`TestLog: Set isFavorite error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Set isFavorite successfully');
                }
            })
            await sleep(500);
            controller.getAVPlaybackState((err, value) => {
                if (err) {
                    console.info(`TestLog: Get isFavorite error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }else if (value.isFavorite === true) {
                    console.info('TestLog: Get isFavorite successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get isFavorite failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(1000);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1000
         * @tc.name      : SETAVPLAYBACKSTATE_1000
         * @tc.desc      : Testing set playbackstate - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1000', 0, async function (done) {
            let PlaybackState10 = {
                state:avSession.PlaybackState.PLAYBACK_STATE_PLAY,
                speed: 1.0,
                position:{elapsedTime:10, updateTime:(new Date()).getTime()},
                bufferedTime:1000,
                loopMode:avSession.LoopMode.LOOP_MODE_SINGLE,
                isFavorite:true,
            };
            session.destroy((err) => {
                if (err) {
                    console.info(`TestLog: session destroy error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
            });
            await sleep(500);
            session.setAVPlaybackState(PlaybackState10, (err) => {
                if (err) {
                    console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Set playbackState successfully');
                    expect(false).assertTrue();
                }
            })
            await sleep(500);
            session = avSession.createAVSession(context,tag,type);
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1100
         * @tc.name      : SETAVPLAYBACKSTATE_1100
         * @tc.desc      : Testing set playbackstate - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_CALLBACK_1100', 0, async function (done) {
            let PlaybackState11 = {
                state:avSession.PlaybackState.PLAYBACK_STATE_PLAY,
                speed: -2,
                position:{elapsedTime:-2, updateTime:(new Date()).getTime()},
                bufferedTime:-4,
                loopMode:avSession.LoopMode.LOOP_MODE_SINGLE,
                isFavorite:true,
            };
            session.setAVPlaybackState(PlaybackState11, (err) => {
                if (err) {
                    console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Set playbackState successfully');
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_CALLBACK_0100
         * @tc.name      : SETLAUNCHABILITY_0100
         * @tc.desc      : Testing set LaunchAbility - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETLAUNCHABILITY_CALLBACK_0100', 0, async function(done) {
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
                    console.info('AVSessionTest : Set LaunchAbility successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('AVSessionTest : Set LaunchAbility failed');
                    expect(false).assertTrue();
                }
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_CALLBACK_0100
         * @tc.name      : SESSIONACTIVATE_0100
         * @tc.desc      : Testing set session active - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_CALLBACK_0100', 0, async function (done) {
            controller.isActive((err, value) => {
                if (err) {
                    console.info(`TestLog: error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value) {
                    console.info('TestLog: session is active');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: session is directive');
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_CALLBACK_0100
         * @tc.name      : SESSIONDEACTIVATE_0100
         * @tc.desc      : Testing deactivate session- callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_CALLBACK_0100', 0, async function (done) {
            session.deactivate((err) => {
                if (err) {
                    console.info(`TestLog: Deactivate session error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Deactivate session');
                }

            });
            await sleep(500);

            await controller.isActive((err, value) => {
                if (err) {
                    console.info(`TestLog: error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else if (value === false) {
                    console.info('TestLog: session deactivate successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: session deactivate failed');
                    expect(false).assertTrue();
                }
                done();
            })
            await sleep(500);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SESSIONDESTROY_CALLBACK_0100
         * @tc.name      : SESSIONDESTROY_0100
         * @tc.desc      : Testing destroy session - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONDESTROY_CALLBACK_0100', 0, async function (done) {
            let flag = false;
            controller.on('sessionDestroy', () => {
                console.info('TestLog: Session destroyed successfully');
                flag = true;
            });

            session.destroy((err) => {
                if (err) {
                    console.info(`TestLog: Session destroy error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: Session destroy');
                }
            });

            await sleep(500);

            if (flag) {
                console.info('TestLog: Session destroyed successful');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Session destroyed failed');
                expect(false).assertTrue();
            }
            session = avSession.createAVSession(context,tag,type);
            done();
        })
    })
}