/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import featureAbility from '@ohos.ability.featureAbility';

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';
const fileKeyObj = mediaLibrary.FileKey;
const fileType = mediaLibrary.MediaType.FILE;
const imageType = mediaLibrary.MediaType.IMAGE;
const videoType = mediaLibrary.MediaType.VIDEO;
const audioType = mediaLibrary.MediaType.AUDIO;
const fileFetchOp = {
    selections: fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: [fileType.toString()],
};
const imageFetchOp = {
    selections: fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: [imageType.toString()],
};
const videoFetchOp = {
    selections: fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: [videoType.toString()],
};
const audioFetchOp = {
    selections: fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: [audioType.toString()],
};

export default function favoriteTestPromiseTest(abilityContext) {
    describe('favoriteTestPromiseTest', function () {
        var context = featureAbility.getContext();
        console.info('MediaLibraryTest : getMediaLibrary IN');
        var media = mediaLibrary.getMediaLibrary(abilityContext);
        console.info('MediaLibraryTest : getMediaLibrary OUT');
        beforeAll(function () {
        });
        beforeEach(function () {
        });
        afterEach(function () {
        });
        afterAll(function () {
        });

        // ------------------------------ file type start ------------------------
        /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_001_01
     * @tc.name      : favorite
     * @tc.desc      : favorite(file) by true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
        it('SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_001_01', 0, async function (done) {
            try {
                const fileAssets = await media.getFileAssets(fileFetchOp);
                const dataList = await fileAssets.getAllObject();
                const asset = dataList[0];
                let isFavorite = await asset.isFavorite();
                if (isFavorite) {
                    await asset.favorite(false);
                    isFavorite = await asset.isFavorite();
                    if (isFavorite) {
                        console.info('MediaLibraryTest : FAV_ASSET_PROMISE 001_01 failed');
                        expect(false).assertTrue();
                        done();
                    }
                }
                await asset.favorite(true);
                isFavorite = await asset.isFavorite();
                if (isFavorite) {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 001_01 passed');
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 001_01 failed');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                console.info('MediaLibraryTest : FAV_ASSET_PROMISE 001_01 failed, message = ' + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_001_02
     * @tc.name      : favorite
     * @tc.desc      : favorite(file) by false
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
        it('SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_001_02', 0, async function (done) {
            try {
                const fileAssets = await media.getFileAssets(fileFetchOp);
                const dataList = await fileAssets.getAllObject();
                const asset = dataList[0];
                let isFavorite = await asset.isFavorite();
                if (!isFavorite) {
                    await asset.favorite(true);
                    isFavorite = await asset.isFavorite();
                    if (!isFavorite) {
                        console.info('MediaLibraryTest : FAV_ASSET_PROMISE 001_02 failed');
                        expect(false).assertTrue();
                        done();
                    }
                }
                await asset.favorite(false);
                isFavorite = await asset.isFavorite();
                if (!isFavorite) {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 001_02 passed');
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 001_02 failed');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                console.info('MediaLibraryTest : FAV_ASSET_PROMISE 001_02 failed, message = ' + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_001_08
     * @tc.name      : isFavorite
     * @tc.desc      : isFavorite(file) result false
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
        it('SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_001_08', 0, async function (done) {
            try {
                const fileAssets = await media.getFileAssets(fileFetchOp);
                const dataList = await fileAssets.getAllObject();
                const asset = dataList[0];
                let isFavorite = await asset.isFavorite();
                if (isFavorite) {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 001_08 failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 001_08 passed');
                    expect(true).assertTrue();
                    done();
                }
            } catch (error) {
                console.info('MediaLibraryTest : FAV_ASSET_PROMISE 001_08 failed, message = ' + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_001_09
     * @tc.name      : isFavorite
     * @tc.desc      : isFavorite(file) result true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
        it('SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_001_09', 0, async function (done) {
            try {
                const fileAssets = await media.getFileAssets(fileFetchOp);
                const dataList = await fileAssets.getAllObject();
                const asset = dataList[0];
                await asset.favorite(true);
                let isFavorite = await asset.isFavorite();
                if (isFavorite) {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 001_09 passed');
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 001_09 failed');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                console.info('MediaLibraryTest : FAV_ASSET_PROMISE 001_09 failed, message = ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        // ------------------------------ file type end ------------------------

        // ------------------------------ image type start ------------------------
        /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_002_01
     * @tc.name      : favorite
     * @tc.desc      : favorite(image) by true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
        it('SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_002_01', 0, async function (done) {
            try {
                const fileAssets = await media.getFileAssets(imageFetchOp);
                const dataList = await fileAssets.getAllObject();
                const asset = dataList[0];
                let isFavorite = await asset.isFavorite();
                if (isFavorite) {
                    await asset.favorite(false);
                    isFavorite = await asset.isFavorite();
                    if (isFavorite) {
                        console.info('MediaLibraryTest : FAV_ASSET_PROMISE 002_01 failed');
                        expect(false).assertTrue();
                        done();
                    }
                }
                await asset.favorite(true);
                isFavorite = await asset.isFavorite();
                if (isFavorite) {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 002_01 passed');
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 002_01 failed');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                console.info('MediaLibraryTest : FAV_ASSET_PROMISE 002_01 failed, message = ' + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_002_02
     * @tc.name      : favorite
     * @tc.desc      : favorite(image) by false
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
        it('SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_002_02', 0, async function (done) {
            try {
                const fileAssets = await media.getFileAssets(imageFetchOp);
                const dataList = await fileAssets.getAllObject();
                const asset = dataList[0];
                let isFavorite = await asset.isFavorite();
                if (!isFavorite) {
                    await asset.favorite(true);
                    isFavorite = await asset.isFavorite();
                    if (!isFavorite) {
                        console.info('MediaLibraryTest : FAV_ASSET_PROMISE 002_02 failed');
                        expect(false).assertTrue();
                        done();
                    }
                }
                await asset.favorite(false);
                isFavorite = await asset.isFavorite();
                if (!isFavorite) {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 002_02 passed');
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 002_02 failed');

                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                console.info('MediaLibraryTest : FAV_ASSET_PROMISE 002_02 failed, message = ' + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_002_08
     * @tc.name      : isFavorite
     * @tc.desc      : isFavorite(image) result false
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
        it('SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_002_08', 0, async function (done) {
            try {
                const fileAssets = await media.getFileAssets(imageFetchOp);
                const dataList = await fileAssets.getAllObject();
                const asset = dataList[0];
                let isFavorite = await asset.isFavorite();
                if (isFavorite) {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 002_08 failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 002_08 passed');
                    expect(true).assertTrue();
                    done();
                }
            } catch (error) {
                console.info('MediaLibraryTest : FAV_ASSET_PROMISE 002_08 failed, message = ' + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_002_09
     * @tc.name      : isFavorite
     * @tc.desc      : isFavorite(image) result true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
        it('SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_002_09', 0, async function (done) {
            try {
                const fileAssets = await media.getFileAssets(imageFetchOp);
                const dataList = await fileAssets.getAllObject();
                const asset = dataList[0];
                await asset.favorite(true);
                let isFavorite = await asset.isFavorite();
                if (isFavorite) {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 002_09 passed');
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 002_09 failed');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                console.info('MediaLibraryTest : FAV_ASSET_PROMISE 002_09 failed, message = ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        // ------------------------------ image type end ------------------------

        // ------------------------------ video type start ------------------------
        /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_003_01
     * @tc.name      : favorite
     * @tc.desc      : favorite(video) by true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
        it('SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_003_01', 0, async function (done) {
            try {
                const fileAssets = await media.getFileAssets(videoFetchOp);
                const dataList = await fileAssets.getAllObject();
                const asset = dataList[0];
                let isFavorite = await asset.isFavorite();
                if (isFavorite) {
                    await asset.favorite(false);
                    isFavorite = await asset.isFavorite();
                    if (isFavorite) {
                        console.info('MediaLibraryTest : FAV_ASSET_PROMISE 003_01 failed');
                        expect(false).assertTrue();
                        done();
                    }
                }
                await asset.favorite(true);
                isFavorite = await asset.isFavorite();
                if (isFavorite) {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 003_01 passed');
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 003_01 failed');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                console.info('MediaLibraryTest : FAV_ASSET_PROMISE 003_01 failed, message = ' + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_003_02
     * @tc.name      : favorite
     * @tc.desc      : favorite(video) by false
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
        it('SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_003_02', 0, async function (done) {
            try {
                const fileAssets = await media.getFileAssets(videoFetchOp);
                const dataList = await fileAssets.getAllObject();
                const asset = dataList[0];
                let isFavorite = await asset.isFavorite();
                if (!isFavorite) {
                    await asset.favorite(true);
                    isFavorite = await asset.isFavorite();
                    if (!isFavorite) {
                        console.info('MediaLibraryTest : FAV_ASSET_PROMISE 003_02 failed');
                        expect(false).assertTrue();
                        done();
                    }
                }
                await asset.favorite(false);
                isFavorite = await asset.isFavorite();
                if (!isFavorite) {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 003_02 passed');
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 003_02 failed');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                console.info('MediaLibraryTest : FAV_ASSET_PROMISE 003_02 failed, message = ' + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_003_08
     * @tc.name      : isFavorite
     * @tc.desc      : isFavorite(video) result false
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
        it('SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_003_08', 0, async function (done) {
            try {
                const fileAssets = await media.getFileAssets(videoFetchOp);
                const dataList = await fileAssets.getAllObject();
                const asset = dataList[0];
                let isFavorite = await asset.isFavorite();
                if (isFavorite) {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 003_08 failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 003_08 passed');
                    expect(true).assertTrue();
                    done();
                }
            } catch (error) {
                console.info('MediaLibraryTest : FAV_ASSET_PROMISE 003_08 failed, message = ' + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_003_09
     * @tc.name      : isFavorite
     * @tc.desc      : isFavorite(video) result true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
        it('SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_003_09', 0, async function (done) {
            try {
                const fileAssets = await media.getFileAssets(videoFetchOp);
                const dataList = await fileAssets.getAllObject();
                const asset = dataList[0];
                await asset.favorite(true);
                let isFavorite = await asset.isFavorite();
                if (isFavorite) {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 003_09 passed');
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 003_09 failed');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                console.info('MediaLibraryTest : FAV_ASSET_PROMISE 003_09 failed, message = ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        // ------------------------------ video type end ------------------------

        // ------------------------------ audio type start ------------------------
        /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_004_01
     * @tc.name      : favorite
     * @tc.desc      : favorite(audio) by true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
        it('SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_004_01', 0, async function (done) {
            try {
                const fileAssets = await media.getFileAssets(audioFetchOp);
                const dataList = await fileAssets.getAllObject();
                const asset = dataList[0];
                let isFavorite = await asset.isFavorite();
                if (isFavorite) {
                    await asset.favorite(false);
                    isFavorite = await asset.isFavorite();
                    if (isFavorite) {
                        console.info('MediaLibraryTest : FAV_ASSET_PROMISE 004_01 failed');
                        expect(false).assertTrue();
                        done();
                    }
                }
                await asset.favorite(true);
                isFavorite = await asset.isFavorite();
                if (isFavorite) {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 004_01 passed');
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 004_01 failed');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                console.info('MediaLibraryTest : FAV_ASSET_PROMISE 004_01 failed, message = ' + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_004_02
     * @tc.name      : favorite
     * @tc.desc      : favorite(audio) by false
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
        it('SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_004_02', 0, async function (done) {
            try {
                const fileAssets = await media.getFileAssets(audioFetchOp);
                const dataList = await fileAssets.getAllObject();
                const asset = dataList[0];
                let isFavorite = await asset.isFavorite();
                if (!isFavorite) {
                    await asset.favorite(true);
                    isFavorite = await asset.isFavorite();
                    if (!isFavorite) {
                        console.info('MediaLibraryTest : FAV_ASSET_PROMISE 004_02 failed');
                        expect(false).assertTrue();
                        done();
                    }
                }
                await asset.favorite(false);
                isFavorite = await asset.isFavorite();
                if (!isFavorite) {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 004_02 passed');
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 004_02 failed');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                console.info('MediaLibraryTest : FAV_ASSET_PROMISE 004_02 failed, message = ' + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_004_08
     * @tc.name      : isFavorite
     * @tc.desc      : isFavorite(audio) result false
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
        it('SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_004_08', 0, async function (done) {
            try {
                const fileAssets = await media.getFileAssets(audioFetchOp);
                const dataList = await fileAssets.getAllObject();
                const asset = dataList[0];
                let isFavorite = await asset.isFavorite();
                if (isFavorite) {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 004_08 failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 004_08 passed');
                    expect(true).assertTrue();
                    done();
                }
            } catch (error) {
                console.info('MediaLibraryTest : FAV_ASSET_PROMISE 004_08 failed, message = ' + error);
                expect(false).assertTrue();
                done();
            }
        });

        /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_004_09
     * @tc.name      : isFavorite
     * @tc.desc      : isFavorite(audio) result true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
        it('SUB_MEDIA_MEDIALIBRARY_FAV_ASSET_PROMISE_004_09', 0, async function (done) {
            try {
                const fileAssets = await media.getFileAssets(audioFetchOp);
                const dataList = await fileAssets.getAllObject();
                const asset = dataList[0];
                await asset.favorite(true);
                let isFavorite = await asset.isFavorite();
                if (isFavorite) {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 004_09 passed');
                    expect(true).assertTrue();
                    done();
                } else {
                    console.info('MediaLibraryTest : FAV_ASSET_PROMISE 004_09 failed');
                    expect(false).assertTrue();
                    done();
                }
            } catch (error) {
                console.info('MediaLibraryTest : FAV_ASSET_PROMISE 004_09 failed, message = ' + error);
                expect(false).assertTrue();
                done();
            }
        });
        // ------------------------------ audio type end ------------------------
    });
}
