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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';

import {
    sleep,
    IMAGE_TYPE,
    AUDIO_TYPE,
    FILEKEY,
    checkPresetsAssets,
    checkAssetsCount,
    fetchOps,
    getPermission,
} from '../../../../../../common';

const filekeys = {
    parent: 'PARENT',
    mimeType: 'MIME_TYPE',
    size: 'SIZE',
    dateAdded: 'DATE_ADDED',
    title: 'TITLE',
    duration: 'DURATION',
    width: 'WIDTH',
    height: 'HEIGHT',
    orientation: 'ORIENTATION',
    albumId: 'ALBUM_ID',
    artist: 'ARTIST',
    audioAlbum: 'AUDIOALBUM',
    dateModified: 'DATE_MODIFIED',
    dateTaken: 'DATE_TAKEN',
    relativePath: 'RELATIVE_PATH',
    displayName: 'DISPLAY_NAME',
}

export default function filekeyTestCallbackTest(abilityContext) {
    describe('filekeyTestCallbackTest', function () {
        const media = mediaLibrary.getMediaLibrary(abilityContext);

        beforeAll(async function () {
            await getPermission();
            await checkPresetsAssets(media, 'ActsMediaLibraryFileKey')
        });
        beforeEach(function () { });
        afterEach(async function () {
            await sleep()
        });
        afterAll(function () { });

        async function getFileAssetsBy(done, testNum, type, count = 1) {
            try {
                let assetOp = fetchOps('Pictures/ImageInfo/', IMAGE_TYPE);
                if (type == 'audioAlbum' || type == 'artist' || type == 'duration') {
                    assetOp = fetchOps('Audios/Static2/', AUDIO_TYPE);
                }
                console.info(`${testNum} assOp : ${JSON.stringify(assetOp)}`)
                let fetchFileResult = await media.getFileAssets(assetOp);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, 1);
                if (!checkAssetCountPass) return;
                const asset = await fetchFileResult.getFirstObject();
                let Op = {
                    selections: FILEKEY[filekeys[type]] + '= ?',
                    selectionArgs: [asset[type] + ''],
                };
                media.getFileAssets(Op, async (err, fetchFileResult) => {
                    if(err) {
                        console.info(`${testNum}, err: ${err}`)
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    const fetchCount = fetchFileResult.getCount();
                    const currentAsset = await fetchFileResult.getFirstObject();
                    expect(currentAsset[type]).assertEqual(asset[type]);
                    expect(fetchCount>0).assertTrue();
                    done();
                });
            } catch (error) {
                console.info(`${testNum} error : ${error}`)
                expect(false).assertTrue();
                done();
            }
        }

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_001
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey parentOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */

        it('SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_001', 0, async function (done) {
            let testNum = 'SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_001'
            await getFileAssetsBy(done, testNum, 'parent');
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_002
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey mimeTypeOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_002', 0, async function (done) {
            let testNum = 'SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_002'
            await getFileAssetsBy(done, testNum, 'mimeType');
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_003
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey sizeOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_003', 0, async function (done) {
            let testNum = 'SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_003'
            await getFileAssetsBy(done, testNum, 'size');
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_004
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey dateAddedOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_004', 0, async function (done) {
            let testNum = 'SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_004'
            await getFileAssetsBy(done, testNum, 'dateAdded', 2);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_005
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey dateModifiedOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_005', 0, async function (done) {
            let testNum = 'SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_005'
            await getFileAssetsBy(done, testNum, 'dateModified', 2);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_006
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey dateTakenOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_006', 0, async function (done) {
            let testNum = 'SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_006'
            await getFileAssetsBy(done, testNum, 'dateTaken', 2);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_007
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey titleOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_007', 0, async function (done) {
            let testNum = 'SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_007'
            await getFileAssetsBy(done, testNum, 'title', 2);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_008
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey durationOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_008', 0, async function (done) {
            let testNum = 'SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_008'
            await getFileAssetsBy(done, testNum, 'duration');
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_009
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey widthOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_009', 0, async function (done) {
            let testNum = 'SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_009'
            await getFileAssetsBy(done, testNum, 'width');
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_010
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey heightOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_010', 0, async function (done) {
            let testNum = 'SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_010'
            await getFileAssetsBy(done, testNum, 'height');
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_011
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey orientationOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_011', 0, async function (done) {
            let testNum = 'SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_011'
            await getFileAssetsBy(done, testNum, 'orientation', 2);
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_012
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey widthOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_012', 0, async function (done) {
            let testNum = 'SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_012'
            await getFileAssetsBy(done, testNum, 'albumId');
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_0014
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey artistOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_0014', 0, async function (done) {
            let testNum = 'SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_014'
            await getFileAssetsBy(done, testNum, 'artist');
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_0015
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey audioAlbumOp
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_0015', 0, async function (done) {
            let testNum = 'SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_015'
            await getFileAssetsBy(done, testNum, 'audioAlbum');
        });

        /**
        * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_0016
        * @tc.name      : getFileAssets
        * @tc.desc      : filekey relative_path
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
        it('SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_0016', 0, async function (done) {
            let testNum = 'SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_0016'
            await getFileAssetsBy(done, testNum, 'relativePath');
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_0017
         * @tc.name      : getFileAssets
         * @tc.desc      : filekey display_name
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_0017', 0, async function (done) {
            let testNum = 'SUB_MEDIA_MEDIALIBRARY_FILE_KEY_CALLBACK_0017'
            await getFileAssetsBy(done, testNum, 'displayName');

        });
        
    });
}

