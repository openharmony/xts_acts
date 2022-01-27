/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import mediaLibrary from '@ohos.multimedia.medialibrary';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

let fileKeyObj = mediaLibrary.FileKey
let type = mediaLibrary.MediaType.IMAGE
let fetchOp = {
    selections : fileKeyObj.MEDIA_TYPE + " = ? ",
    selectionArgs : [type.toString()],
    order : fileKeyObj.DATE_ADDED,
}

describe('getMediaFileAssetStatus', function () {
    console.info("MediaLibraryTest Instance before");
    const media = mediaLibrary.getMediaLibrary();
    console.info("MediaLibraryTest Instance after");

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_FILE_ASSETS_TRASH_STATUS_01
     * @tc.name      : judge file asset trash or not
     * @tc.desc      : judge file asset trash or not
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_FILE_ASSETS_TRASH_STATUS_01', 0, async function () {
        try {
            let mediaType = mediaLibrary.MediaType.IMAGE;
            const cur = Date.now()
            let displayName = "FILE_ASSETS_TRASH_STATUS_01.jpg" + cur;
            let rp = "Pictures/";
            console.info('MediaLibraryTest : createAsset begin');
            media.createAsset(mediaType, displayName, rp, (createAssetErr, fileAsset) => {
                if (fileAsset != undefined) {
                    console.info('MediaLibraryTest : createAsset Successfull file uri = ' + fileAsset.uri);
                    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_01 : PASS');
                    fileAsset.isTrash((err, istrash) => {
                        console.info("MediaLibraryTest SUB_MEDIA_MEDIALIBRARY_GET_FILE_ASSETS_TRASH_STATUS_01 " +istrash)
                        expect(istrash == false).assertTrue;
                        done();
                    })
                } else {
                    console.info('MediaLibraryTest : createAsset Unsuccessfull ' + createAssetErr.message);
                    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_01 : FAIL');
                    expect(false).assertTrue();
                    done();
                }
            });
        }
        catch (e) {
            console.log('MediaLibraryTest has failed for ' + e);
            expect(null).assertFail();
        }
    });

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_FILE_ASSETS_TRASH_STATUS_02
     * @tc.name      : judge file asset trash or not
     * @tc.desc      : judge file asset trash or not
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GET_FILE_ASSETS_TRASH_STATUS_02', 0, async function () {
        try {
            let mediaType = mediaLibrary.MediaType.IMAGE;
            const cur = Date.now()
            let displayName = "FILE_ASSETS_TRASH_STATUS_02.jpg" + cur;
            let rp = "Pictures/";
            console.info('MediaLibraryTest : createAsset begin');
            media.createAsset(mediaType, displayName, rp, (createAssetErr, fileAsset) => {
                if (fileAsset != undefined) {
                    console.info('MediaLibraryTest : createAsset Successfull file uri = ' + fileAsset.uri);
                    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_01 : PASS');

                    fileAsset.trash(true, (err) => {
                        fileAsset.isTrash((err, istrash) => {
                            console.info("MediaLibraryTest SUB_MEDIA_MEDIALIBRARY_GET_FILE_ASSETS_TRASH_STATUS_02 " +istrash)
                            expect(istrash == true).assertTrue;
                            done();
                        })
                    })
                } else {
                    console.info('MediaLibraryTest : createAsset Unsuccessfull ' + createAssetErr.message);
                    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_01 : FAIL');
                    expect(false).assertTrue();
                    done();
                }
            });
        }
        catch (e) {
            console.log('MediaLibraryTest has failed for ' + e);
            expect(null).assertFail();
        }
    });

    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_FILE_ASSETS_TRASH_STATUS_03
     * @tc.name      : judge file asset trash or not
     * @tc.desc      : judge file asset trash or not
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GET_FILE_ASSETS_TRASH_STATUS_03', 0, async function () {
        try {
            let mediaType = mediaLibrary.MediaType.IMAGE;
            const cur = Date.now()
            let displayName = "FILE_ASSETS_TRASH_STATUS_03.jpg" + cur;
            let rp = "Pictures/";
            console.info('MediaLibraryTest : createAsset begin');
            media.createAsset(mediaType, displayName, rp, (createAssetErr, fileAsset) => {
                if (fileAsset != undefined) {
                    console.info('MediaLibraryTest : createAsset Successfull file uri = ' + fileAsset.uri);
                    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_01 : PASS');

                    fileAsset.trash(false, (err) => {
                        fileAsset.isTrash((err, istrash) => {
                            console.info("MediaLibraryTest SUB_MEDIA_MEDIALIBRARY_GET_FILE_ASSETS_TRASH_STATUS_03 " +istrash)
                            expect(istrash == false).assertTrue;
                            done();
                        })
                    })

                } else {
                    console.info('MediaLibraryTest : createAsset Unsuccessfull ' + createAssetErr.message);
                    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_01 : FAIL');
                    expect(false).assertTrue();
                    done();
                }
            });
        }
        catch (e) {
            console.log('MediaLibraryTest has failed for ' + e);
            expect(null).assertFail();
        }
    });


    /*
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_FILE_ASSETS_TRASH_STATUS_04
     * @tc.name      : judge file asset trash or not
     * @tc.desc      : judge file asset trash or not
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GET_FILE_ASSETS_TRASH_STATUS_04', 0, async function () {
        try {
            let mediaType = mediaLibrary.MediaType.IMAGE;
            const cur = Date.now()
            let displayName = "FILE_ASSETS_TRASH_STATUS_03.jpg" + cur;
            let rp = "Pictures/";
            console.info('MediaLibraryTest : createAsset begin');
            media.createAsset(mediaType, displayName, rp, (createAssetErr, fileAsset) => {
                if (fileAsset != undefined) {
                    console.info('MediaLibraryTest : createAsset Successfull file uri = ' + fileAsset.uri);
                    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_01 : PASS');

                    fileAsset.trash(true, (err) => {
                        fileAsset.isTrash((err, istrash) => {
                            console.info("SUB_MEDIA_MEDIALIBRARY_GET_FILE_ASSETS_TRASH_STATUS_04 istrash " +istrash)
                            expect(istrash == false).assertFalse;
                            done();
                        })
                    })

                } else {
                    console.info('MediaLibraryTest : createAsset Unsuccessfull ' + createAssetErr.message);
                    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_CREATE_FILE_01 : FAIL');
                    expect(false).assertTrue();
                    done();
                }
            });
        }
        catch (e) {
            console.log('MediaLibraryTest has failed for ' + e);
            expect(null).assertFail();
        }
    });


});
