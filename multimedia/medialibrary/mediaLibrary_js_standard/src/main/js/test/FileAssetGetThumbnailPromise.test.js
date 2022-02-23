/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import mediaLibrary from '@ohos.multimedia.medialibrary';
import image from '@@ohos.multimedia.image';
import featureAbility from '@ohos.ability.featureAbility';

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';

describe('GetFileAssets_GetCount_GetAllObjects', function () {
    var context = featureAbility.getContext();
    console.info('MediaLibraryTest : getMediaLibrary IN');
    var media = mediaLibrary.getMediaLibrary(context);
    console.info('MediaLibraryTest : getMediaLibrary OUT');

    var URI;
    var name;
    var result1;
    var albumName;
    var albumId;
    var i;
    var fileAsset;
    var MAXNUM = 100;
    var PATH = 'data';
    var MEDIA_TYPE = 'media_type';
    let fileKeyObj = mediaLibrary.FileKey;

    let type = mediaLibrary.MediaType.IMAGE;
    let videoType = mediaLibrary.MediaType.VIDEO;
    let audioType = mediaLibrary.MediaType.AUDIO;
    let fetchOp = {
        selections: fileKeyObj.MEDIA_TYPE + '=?',
        selectionArgs: [type.toString()],
        order: fileKeyObj.dateAdded,
    };
    let videoFetchOp = {
        selections: fileKeyObj.MEDIA_TYPE + '=?',
        selectionArgs: [videoType.toString()],
        order: fileKeyObj.dateAdded,
    };
    let audioFetchOp = {
        selections: fileKeyObj.MEDIA_TYPE + '=?',
        selectionArgs: [audioType.toString()],
        order: fileKeyObj.dateAdded,
    };
    beforeAll(function () {
    });

    beforeEach(function () {
    });
    afterEach(function () {
    });
    afterAll(function () {
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_01
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by fetchOp & { width: 80, height: 80 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_01', 0, async function (done) {
        try {
            const data = await media.getFileAssets(fetchOp);
            console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
            const data1 = await data.getFirstObject();
            let size = { width: 80, height: 80 };
            const pixelmap = await data1.getThumbnail(size);
            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
            const info = pixelmap.getImageInfo();
            console.info('MediaLibraryTest : pixel image info ' + info);
            console.info('MediaLibraryTest : pixel width ' + info.size.width);
            console.info('MediaLibraryTest : pixel height ' + info.size.height);
            expect(info.size.width == size.width).assertTrue();
            expect(info.size.height == size.height).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
            console.info('MediaLibraryTest : getFileAssets :FAIL');
            expect(false).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_02
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by fetchOp & { width: 400, height: 400 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_02', 0, async function (done) {
        try {
            const data = await media.getFileAssets(fetchOp);
            console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
            const data1 = await data.getFirstObject();
            let size = { width: 400, height: 400 };
            const pixelmap = await data1.getThumbnail(size);
            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
            const info = pixelmap.getImageInfo();
            console.info('MediaLibraryTest : pixel image info ' + info);
            console.info('MediaLibraryTest : pixel width ' + info.size.width);
            console.info('MediaLibraryTest : pixel height ' + info.size.height);
            expect(info.size.width == size.width).assertTrue();
            expect(info.size.height == size.height).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
            console.info('MediaLibraryTest : getFileAssets :FAIL');
            expect(false).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_03
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by videoFetchOp & { width: 80, height: 80 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_03', 0, async function (done) {
        try {
            const data = await media.getFileAssets(videoFetchOp);
            console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
            const data1 = await data.getFirstObject();
            let size = { width: 80, height: 80 };
            const pixelmap = await data1.getThumbnail(size);
            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
            const info = pixelmap.getImageInfo();
            console.info('MediaLibraryTest : pixel image info ' + info);
            console.info('MediaLibraryTest : pixel width ' + info.size.width);
            console.info('MediaLibraryTest : pixel height ' + info.size.height);
            expect(info.size.width == size.width).assertTrue();
            expect(info.size.height == size.height).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
            console.info('MediaLibraryTest : getFileAssets :FAIL');
            expect(false).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_04
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by videoFetchOp & { width: 400, height: 400 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_04', 0, async function (done) {
        try {
            const data = await media.getFileAssets(videoFetchOp);
            console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
            const data1 = await data.getFirstObject();
            let size = { width: 400, height: 400 };
            const pixelmap = await data1.getThumbnail(size);
            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
            const info = pixelmap.getImageInfo();
            console.info('MediaLibraryTest : pixel image info ' + info);
            console.info('MediaLibraryTest : pixel width ' + info.size.width);
            console.info('MediaLibraryTest : pixel height ' + info.size.height);
            expect(info.size.width == size.width).assertTrue();
            expect(info.size.height == size.height).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
            console.info('MediaLibraryTest : getFileAssets :FAIL');
            expect(false).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_05
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by audioFetchOp & { width: 80, height: 80 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_05', 0, async function (done) {
        try {
            const data = await media.getFileAssets(audioFetchOp);
            console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
            const data1 = await data.getFirstObject();
            let size = { width: 80, height: 80 };
            const pixelmap = await data1.getThumbnail(size);
            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
            const info = pixelmap.getImageInfo();
            console.info('MediaLibraryTest : pixel image info ' + info);
            console.info('MediaLibraryTest : pixel width ' + info.size.width);
            console.info('MediaLibraryTest : pixel height ' + info.size.height);
            expect(info.size.width == size.width).assertTrue();
            expect(info.size.height == size.height).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
            console.info('MediaLibraryTest : getFileAssets :FAIL');
            expect(false).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_06
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by audioFetchOp & { width: 400, height: 400 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_06', 0, async function (done) {
        try {
            const data = await media.getFileAssets(audioFetchOp);
            console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
            const data1 = await data.getFirstObject();
            let size = { width: 400, height: 400 };
            const pixelmap = await data1.getThumbnail(size);
            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
            const info = pixelmap.getImageInfo();
            console.info('MediaLibraryTest : pixel image info ' + info);
            console.info('MediaLibraryTest : pixel width ' + info.size.width);
            console.info('MediaLibraryTest : pixel height ' + info.size.height);
            expect(info.size.width == size.width).assertTrue();
            expect(info.size.height == size.height).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
            console.info('MediaLibraryTest : getFileAssets :FAIL');
            expect(false).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_07
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by fetchOp & The default size
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_07', 0, async function (done) {
        try {
            const data = await media.getFileAssets(fetchOp);
            console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
            const data1 = await data.getFirstObject();
            let size = { width: 256, height: 256 };
            const pixelmap = await data1.getThumbnail();
            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
            const info = pixelmap.getImageInfo();
            console.info('MediaLibraryTest : pixel image info ' + info);
            console.info('MediaLibraryTest : pixel width ' + info.size.width);
            console.info('MediaLibraryTest : pixel height ' + info.size.height);
            expect(info.size.width == size.width).assertTrue();
            expect(info.size.height == size.height).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
            console.info('MediaLibraryTest : getFileAssets :FAIL');
            expect(false).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_08
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by fetchOp & { width: 1, height: 1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_08', 0, async function (done) {
        try {
            const data = await media.getFileAssets(fetchOp);
            console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
            const data1 = await data.getFirstObject();
            let size = { width: 1, height: 1 };
            const pixelmap = await data1.getThumbnail(size);
            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
            const info = pixelmap.getImageInfo();
            console.info('MediaLibraryTest : pixel image info ' + info);
            console.info('MediaLibraryTest : pixel width ' + info.size.width);
            console.info('MediaLibraryTest : pixel height ' + info.size.height);
            expect(info.size.width == size.width).assertTrue();
            expect(info.size.height == size.height).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
            console.info('MediaLibraryTest : getFileAssets :FAIL');
            expect(false).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_09
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by fetchOp & { width: 0, height: 0 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_09', 0, async function (done) {
        try {
            const data = await media.getFileAssets(fetchOp);
            console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
            const data1 = await data.getFirstObject();
            let size = { width: 0, height: 0 };
            const pixelmap = await data1.getThumbnail(size);
            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
            const info = pixelmap.getImageInfo();
            console.info('MediaLibraryTest : pixel image info ' + info);
            console.info('MediaLibraryTest : pixel width ' + info.size.width);
            console.info('MediaLibraryTest : pixel height ' + info.size.height);
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
            console.info('MediaLibraryTest : getFileAssets :FAIL');
            expect(true).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_010
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by fetchOp & { width: -80, height: -80 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_010', 0, async function (done) {
        try {
            const data = await media.getFileAssets(fetchOp);
            console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
            const data1 = await data.getFirstObject();
            let size = { width: -80, height: -80 };
            const pixelmap = await data1.getThumbnail(size);
            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
            const info = pixelmap.getImageInfo();
            console.info('MediaLibraryTest : pixel image info ' + info);
            console.info('MediaLibraryTest : pixel width ' + info.size.width);
            console.info('MediaLibraryTest : pixel height ' + info.size.height);
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
            console.info('MediaLibraryTest : getFileAssets :FAIL');
            expect(true).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_011
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by videoFetchOp & The default size
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_011', 0, async function (done) {
        try {
            const data = await media.getFileAssets(videoFetchOp);
            console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
            const data1 = await data.getFirstObject();
            let size = { width: 256, height: 256 };
            const pixelmap = await data1.getThumbnail();
            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
            const info = pixelmap.getImageInfo();
            console.info('MediaLibraryTest : pixel image info ' + info);
            console.info('MediaLibraryTest : pixel width ' + info.size.width);
            console.info('MediaLibraryTest : pixel height ' + info.size.height);
            expect(info.size.width == size.width).assertTrue();
            expect(info.size.height == size.height).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
            console.info('MediaLibraryTest : getFileAssets :FAIL');
            expect(false).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_012
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by videoFetchOp & { width: 1, height: 1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_012', 0, async function (done) {
        try {
            const data = await media.getFileAssets(videoFetchOp);
            console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
            const data1 = await data.getFirstObject();
            let size = { width: 1, height: 1 };
            const pixelmap = await data1.getThumbnail(size);
            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
            const info = pixelmap.getImageInfo();
            console.info('MediaLibraryTest : pixel image info ' + info);
            console.info('MediaLibraryTest : pixel width ' + info.size.width);
            console.info('MediaLibraryTest : pixel height ' + info.size.height);
            expect(info.size.width == size.width).assertTrue();
            expect(info.size.height == size.height).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
            console.info('MediaLibraryTest : getFileAssets :FAIL');
            expect(false).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_013
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by videoFetchOp & { width: 0, height: 0 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_013', 0, async function (done) {
        try {
            const data = await media.getFileAssets(videoFetchOp);
            console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
            const data1 = await data.getFirstObject();
            let size = { width: 0, height: 0 };
            const pixelmap = await data1.getThumbnail(size);
            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
            const info = pixelmap.getImageInfo();
            console.info('MediaLibraryTest : pixel image info ' + info);
            console.info('MediaLibraryTest : pixel width ' + info.size.width);
            console.info('MediaLibraryTest : pixel height ' + info.size.height);
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
            console.info('MediaLibraryTest : getFileAssets :FAIL');
            expect(true).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_014
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by videoFetchOp & { width: -80, height: -80 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_014', 0, async function (done) {
        try {
            const data = await media.getFileAssets(videoFetchOp);
            console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
            const data1 = await data.getFirstObject();
            let size = { width: -80, height: -80 };
            const pixelmap = await data1.getThumbnail(size);
            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
            const info = pixelmap.getImageInfo();
            console.info('MediaLibraryTest : pixel image info ' + info);
            console.info('MediaLibraryTest : pixel width ' + info.size.width);
            console.info('MediaLibraryTest : pixel height ' + info.size.height);
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
            console.info('MediaLibraryTest : getFileAssets :FAIL');
            expect(true).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_015
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by audioFetchOp & The default size
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_015', 0, async function (done) {
        try {
            const data = await media.getFileAssets(audioFetchOp);
            console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
            const data1 = await data.getFirstObject();
            let size = { width: 256, height: 256 };
            const pixelmap = await data1.getThumbnail();
            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
            const info = pixelmap.getImageInfo();
            console.info('MediaLibraryTest : pixel image info ' + info);
            console.info('MediaLibraryTest : pixel width ' + info.size.width);
            console.info('MediaLibraryTest : pixel height ' + info.size.height);
            expect(info.size.width == size.width).assertTrue();
            expect(info.size.height == size.height).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
            console.info('MediaLibraryTest : getFileAssets :FAIL');
            expect(false).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_016
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by audioFetchOp & { width: 1, height: 1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_016', 0, async function (done) {
        try {
            const data = await media.getFileAssets(audioFetchOp);
            console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
            const data1 = await data.getFirstObject();
            let size = { width: 1, height: 1 };
            const pixelmap = await data1.getThumbnail(size);
            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
            const info = pixelmap.getImageInfo();
            console.info('MediaLibraryTest : pixel image info ' + info);
            console.info('MediaLibraryTest : pixel width ' + info.size.width);
            console.info('MediaLibraryTest : pixel height ' + info.size.height);
            expect(info.size.width == size.width).assertTrue();
            expect(info.size.height == size.height).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
            console.info('MediaLibraryTest : getFileAssets :FAIL');
            expect(false).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_017
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by audioFetchOp & { width: 0, height: 0 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_017', 0, async function (done) {
        try {
            const data = await media.getFileAssets(audioFetchOp);
            console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
            const data1 = await data.getFirstObject();
            let size = { width: 0, height: 0 };
            const pixelmap = await data1.getThumbnail(size);
            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
            const info = pixelmap.getImageInfo();
            console.info('MediaLibraryTest : pixel image info ' + info);
            console.info('MediaLibraryTest : pixel width ' + info.size.width);
            console.info('MediaLibraryTest : pixel height ' + info.size.height);
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
            console.info('MediaLibraryTest : getFileAssets :FAIL');
            expect(true).assertTrue();
        }
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_018
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by audioFetchOp & { width: -80, height: -80 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_GETTHUMBNAIL_PROMISE_018', 0, async function (done) {
        try {
            const data = await media.getFileAssets(audioFetchOp);
            console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
            const data1 = await data.getFirstObject();
            let size = { width: -80, height: -80 };
            const pixelmap = await data1.getThumbnail(size);
            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
            const info = pixelmap.getImageInfo();
            console.info('MediaLibraryTest : pixel image info ' + info);
            console.info('MediaLibraryTest : pixel width ' + info.size.width);
            console.info('MediaLibraryTest : pixel height ' + info.size.height);
            expect(false).assertTrue();
        } catch (error) {
            console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
            console.info('MediaLibraryTest : getFileAssets :FAIL');
            expect(true).assertTrue();
        }
        done();
    });
});
