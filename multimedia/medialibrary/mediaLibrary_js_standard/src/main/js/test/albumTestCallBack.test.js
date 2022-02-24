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
import featureAbility from '@ohos.ability.featureAbility';

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';
let fileKeyObj = mediaLibrary.FileKey;
let mediaType = mediaLibrary.MediaType.IMAGE;
let AlbumNoArgsfetchOp = {
    selections: '',
    selectionArgs: [],
};
let AlbumHasArgsfetchOp = {
    selections: fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: [mediaType.toString()],
};

let fileHasArgsfetchOp = {
    selections: fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: [mediaType.toString()],
};
let fileNoArgsfetchOp = {
    selections: '',
    selectionArgs: [],
};

describe('album.callback.test.js', function () {
    let path = 'Pictures/';
    console.info('MediaLibraryTest : Delete begin');
    let fetchFileResult = await media.getFileAssets(fileNoArgsfetchOp);
    let assetList = await fetchFileResult.getAllObject();
    assetList.forEach(getAllObjectInfoDelete);
    console.info('MediaLibraryTest : Delete end');
    await media.createAsset(mediaType, 'imageAlbum0003.jpg', path);
    await media.createAsset(mediaType2, 'imageAlbum0004.avi', path);
    var context = featureAbility.getContext();
    console.info('MediaLibraryTest : getMediaLibrary IN');
    var media = mediaLibrary.getMediaLibrary(context);
    console.info('MediaLibraryTest : getMediaLibrary OUT');
    var album;
    beforeAll(function () {
        onsole.info('Album Callback MediaLibraryTest: beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.');
    });
    beforeEach(function () {
        console.info('Album Callback MediaLibraryTest: beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.');
    });
    afterEach(function () {
        console.info('Album Callback MediaLibraryTest: afterEach: Test case-level clearance conditions, which are executed after each test case is executed.');
    });
    afterAll(function () {
        console.info('Album Callback MediaLibraryTest: afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed');
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_001_01
     * @tc.name      : media.getAlbums
     * @tc.desc      : Get Album by AlbumNoArgsfetchOp
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_001_01', 0, async function (done) {
        media.getAlbums(AlbumNoArgsfetchOp, (err, albumList) => {
            if (albumList != undefined) {
                const album = albumList[0];
                console.info('MediaLibraryTest : ALBUM_CALLBACK getAlbum 001_01 album.albumName = ' + album.albumName);
                console.info('MediaLibraryTest : ALBUM_CALLBACK getAlbum 001_01 album.count = ' + album.count);
                expect(true).assertTrue();
                done();
            } else {
                console.info('MediaLibraryTest : ALBUM_CALLBACK getAlbum 001_01 fail, message = ' + err);
                expect(false).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_001_02
     * @tc.name      : media.getAlbums
     * @tc.desc      : Get Album by null
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_001_02', 0, async function (done) {
        media.getAlbums(null, (err, albumList) => {
            if (albumList != undefined) {
                const album = albumList[0];
                console.info('MediaLibraryTest : ALBUM_CALLBACK getAlbum 001_02 album.albumName = ' + album.albumName);
                console.info('MediaLibraryTest : ALBUM_CALLBACK getAlbum 001_02 album.count = ' + album.count);
                expect(false).assertTrue();
                done();
            } else {
                console.info('MediaLibraryTest : ALBUM_CALLBACK getAlbum 001_02 fail, message = ' + err);
                expect(true).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_002_01
     * @tc.name      : media.getAlbums
     * @tc.desc      : Get Album by AlbumHasArgsfetchOp
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_002_01', 0, async function (done) {
        media.getAlbums(AlbumHasArgsfetchOp, (err, albumList) => {
            if (albumList != undefined) {
                const album = albumList[0];
                console.info('MediaLibraryTest : ALBUM_CALLBACK getAlbum 002_01 album.albumName = ' + album.albumName);
                console.info('MediaLibraryTest : ALBUM_CALLBACK getAlbum 002_01 album.count = ' + album.count);
                expect(true).assertTrue();
                done();
            } else {
                console.info('MediaLibraryTest : ALBUM_CALLBACK getAlbum 002_01 fail, message = ' + err);
                expect(false).assertTrue();
                done();
            }
        });
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_002_02
     * @tc.name      : media.getAlbums
     * @tc.desc      : Get Album by 666
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_002_02', 0, async function (done) {
        media.getAlbums(666, (err, albumList) => {
            if (albumList != undefined) {
                const album = albumList[0];
                console.info('MediaLibraryTest : ALBUM_CALLBACK getAlbum 001_02 album.albumName = ' + album.albumName);
                console.info('MediaLibraryTest : ALBUM_CALLBACK getAlbum 001_02 album.count = ' + album.count);
                expect(false).assertTrue();
                done();
            } else {
                console.info('MediaLibraryTest : ALBUM_CALLBACK getAlbum 001_02 fail, message = ' + err);
                expect(true).assertTrue();
                done();
            }
        });
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_002_03
     * @tc.name      : media.getAlbums
     * @tc.desc      : Get Album by '666'
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_002_03', 0, async function (done) {
        media.getAlbums('666', (err, albumList) => {
            if (albumList != undefined) {
                const album = albumList[0];
                console.info('MediaLibraryTest : ALBUM_CALLBACK getAlbum 001_03 album.albumName = ' + album.albumName);
                console.info('MediaLibraryTest : ALBUM_CALLBACK getAlbum 001_03 album.count = ' + album.count);
                expect(false).assertTrue();
                done();
            } else {
                console.info('MediaLibraryTest : ALBUM_CALLBACK getAlbum 001_03 fail, message = ' + err);
                expect(true).assertTrue();
                done();
            }
        });
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_002_04
     * @tc.name      : media.getAlbums
     * @tc.desc      : Get Album by 0.666
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_002_04', 0, async function (done) {
        media.getAlbums(0.666, (err, albumList) => {
            if (albumList != undefined) {
                const album = albumList[0];
                console.info('MediaLibraryTest : ALBUM_CALLBACK getAlbum 002_04 album.albumName = ' + album.albumName);
                console.info('MediaLibraryTest : ALBUM_CALLBACK getAlbum 002_04 album.count = ' + album.count);
                expect(false).assertTrue();
                done();
            } else {
                console.info('MediaLibraryTest : ALBUM_CALLBACK getAlbum 002_04 fail, message = ' + err);
                expect(true).assertTrue();
                done();
            }
        });
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_002_05
     * @tc.name      : media.getAlbums
     * @tc.desc      : Get Album true
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUM_CALLBACK_002_05', 0, async function (done) {
        media.getAlbums(true, (err, albumList) => {
            if (albumList != undefined) {
                const album = albumList[0];
                console.info('MediaLibraryTest : ALBUM_CALLBACK getAlbum 002_05 album.albumName = ' + album.albumName);
                console.info('MediaLibraryTest : ALBUM_CALLBACK getAlbum 002_05 album.count = ' + album.count);
                expect(false).assertTrue();
                done();
            } else {
                console.info('MediaLibraryTest : ALBUM_CALLBACK getAlbum 002_05 fail, message = ' + err);
                expect(true).assertTrue();
                done();
            }
        });
        done();
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_CALLBACK_003_01
     * @tc.name      : album.commitModify
     * @tc.desc      : Modify Album name 'hello'
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_CALLBACK_003_01', 0, async function (done) {
        const albumList = await media.getAlbums(AlbumNoArgsfetchOp);
        const album = albumList[0];
        console.info('MediaLibraryTest : ALBUM_CALLBACK Modify 003_01 album.albumName(old) = ' + album.albumName);
        album.albumName = 'hello';
        album.commitModify((err) => {
            if (err == undefined) {
                console.info('MediaLibraryTest : ALBUM_CALLBACK Modify 003_01 album.albumName(new) = ' + album.albumName);
                expect(true).assertTrue();
                done();
            } else {
                console.info('MediaLibraryTest :  ALBUM_CALLBACK Modify 003_01 fail, message = ' + err);
                expect(false).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_CALLBACK_003_02
     * @tc.name      : album.commitModify
     * @tc.desc      : Modify Album name ''
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_CALLBACK_003_02', 0, async function (done) {
        const albumList = await media.getAlbums(AlbumNoArgsfetchOp);
        const album = albumList[0];
        console.info('MediaLibraryTest : ALBUM_CALLBACK Modify 003_01 album.albumName(old) = ' + album.albumName);
        album.albumName = '';
        album.commitModify((err) => {
            if (err == undefined) {
                console.info('MediaLibraryTest : ALBUM_CALLBACK Modify 003_02 album.albumName(new) = ' + album.albumName);
                expect(false).assertTrue();
                done();
            } else {
                console.info('MediaLibraryTest :  ALBUM_CALLBACK Modify 003_02 fail, message = ' + err);
                expect(true).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_CALLBACK_003_03
     * @tc.name      : album.commitModify
     * @tc.desc      : Modify Album name '?*hello'
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_CALLBACK_003_03', 0, async function (done) {
        const albumList = await media.getAlbums(AlbumNoArgsfetchOp);
        const album = albumList[0];
        console.info('MediaLibraryTest : ALBUM_CALLBACK Modify 003_01 album.albumName(old) = ' + album.albumName);
        album.albumName = '?*hello';
        album.commitModify((err) => {
            if (err == undefined) {
                console.info('MediaLibraryTest : ALBUM_CALLBACK Modify 003_03 album.albumName(new) = ' + album.albumName);
                expect(false).assertTrue();
                done();
            } else {
                console.info('MediaLibraryTest :  ALBUM_CALLBACK Modify 003_03 fail, message = ' + err);
                expect(true).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_CALLBACK_003_04
     * @tc.name      : album.commitModify
     * @tc.desc      : Modify Album name 'i123456...119'
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_MODIFYALBUM_CALLBACK_003_04', 0, async function (done) {
        const albumList = await media.getAlbums(AlbumNoArgsfetchOp);
        const album = albumList[0];
        console.info('MediaLibraryTest : ALBUM_CALLBACK Modify 003_01 album.albumName(old) = ' + album.albumName);
        var name = 'i';
        for (var i = 0; i < 120; i++) {
            title += 'i';
        }
        album.albumName = name;
        album.commitModify((err) => {
            if (err == undefined) {
                console.info('MediaLibraryTest : ALBUM_CALLBACK Modify 003_03 album.albumName(new) = ' + album.albumName);
                expect(false).assertTrue();
                done();
            } else {
                console.info('MediaLibraryTest :  ALBUM_CALLBACK Modify 003_03 fail, message = ' + err);
                expect(true).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_CALLBACK_004_01
     * @tc.name      : album.getFileAssets
     * @tc.desc      : Get Album Assets by fileNoArgsfetchOp
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_CALLBACK_004_01', 0, async function (done) {
        album.getFileAssets(fileNoArgsfetchOp, (err, albumFetchFileResult) => {
            if (albumFetchFileResult != undefined) {
                console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets success');
                albumFetchFileResult.getAllObject((err1, data1) => {
                    if (data1 != undefined) {
                        data1.forEach(getAllObjectInfo);
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 004_01 success');
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 004_01 getAllObject :PASS');
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 004_01 fail, message = ' + err1);
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 004_01 getFileAssets :No data');
                        expect(false).assertTrue();
                        done();
                    }
                });
            } else {
                console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 004_01 fail, message = ' + err);
                expect(false).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_CALLBACK_004_01
     * @tc.name      : album.getFileAssets
     * @tc.desc      : Get Album Assets by null
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_CALLBACK_004_02', 0, async function (done) {
        album.getFileAssets(null, (err, albumFetchFileResult) => {
            if (albumFetchFileResult != undefined) {
                console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets success');
                albumFetchFileResult.getAllObject((err1, data1) => {
                    if (data1 != undefined) {
                        data1.forEach(getAllObjectInfo);
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 004_02 success');
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 004_02 getAllObject :PASS');
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 004_02 fail, message = ' + err1);
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 004_02 getFileAssets :No data');
                        expect(false).assertTrue();
                        done();
                    }
                });
            } else {
                console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 004_02 fail, message = ' + err);
                expect(false).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_CALLBACK_005_01
     * @tc.name      : album.getFileAssets
     * @tc.desc      : Get Album Assets by fileHasArgsfetchOp
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_CALLBACK_005_01', 0, async function (done) {
        album.getFileAssets(fileHasArgsfetchOp, (err, albumFetchFileResult) => {
            if (albumFetchFileResult != undefined) {
                console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets success');
                albumFetchFileResult.getAllObject((err1, data1) => {
                    if (data1 != undefined) {
                        data1.forEach(getAllObjectInfo);
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_01 success');
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_01 getAllObject :PASS');
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_01 fail, message = ' + err1);
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_01 getFileAssets :No data');
                        expect(false).assertTrue();
                        done();
                    }
                });
            } else {
                console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_01 fail, message = ' + err);
                expect(false).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_CALLBACK_005_02
     * @tc.name      : album.getFileAssets
     * @tc.desc      : Get Album Assets by fileHasArgsfetchOp2
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_CALLBACK_005_02', 0, async function (done) {
        let type2 = mediaLibrary.MediaType.VIDEO;
        let fileHasArgsfetchOp2 = {
            selections: fileKeyObj.MEDIA_TYPE + ' = ?',
            selectionArgs: [type2.toString()],
        };
        album.getFileAssets(fileHasArgsfetchOp2, (err, albumFetchFileResult) => {
            if (albumFetchFileResult != undefined) {
                console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets success');
                albumFetchFileResult.getAllObject((err1, data1) => {
                    if (data1 != undefined) {
                        data1.forEach(getAllObjectInfo);
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_02 success');
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_02 getAllObject :PASS');
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_02 fail, message = ' + err1);
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_02 getFileAssets :No data');
                        expect(false).assertTrue();
                        done();
                    }
                });
            } else {
                console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_02 fail, message = ' + err);
                expect(false).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_CALLBACK_005_03
     * @tc.name      : album.getFileAssets
     * @tc.desc      : Get Album Assets by fileHasArgsfetchOp3
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_CALLBACK_005_03', 0, async function (done) {
        let fileHasArgsfetchOp3 = {
            selections: fileKeyObj.MEDIA_TYPE + ' = ?',
            selectionArgs: ['666'],
        };
        album.getFileAssets(fileHasArgsfetchOp3, (err, albumFetchFileResult) => {
            if (albumFetchFileResult != undefined) {
                console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets success');
                albumFetchFileResult.getAllObject((err1, data1) => {
                    if (data1 != undefined) {
                        data1.forEach(getAllObjectInfo);
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_03 success');
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_03 getAllObject :PASS');
                        expect(false).assertTrue();
                        done();
                    } else {
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_03 fail, message = ' + err1);
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_03 getFileAssets :No data');
                        expect(false).assertTrue();
                        done();
                    }
                });
            } else {
                console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_03 fail, message = ' + err);
                expect(true).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_CALLBACK_005_04
     * @tc.name      : album.getFileAssets
     * @tc.desc      : Get Album Assets by fileHasArgsfetchOp4
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_CALLBACK_005_04', 0, async function (done) {
        let type4 = mediaLibrary.MediaType.VIDEO;
        let fileHasArgsfetchOp4 = {
            selections: '666' + '= ?',
            selectionArgs: [type4.toString()],
        };
        album.getFileAssets(fileHasArgsfetchOp4, (err, albumFetchFileResult) => {
            if (albumFetchFileResult != undefined) {
                console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets success');
                albumFetchFileResult.getAllObject((err1, data1) => {
                    if (data1 != undefined) {
                        data1.forEach(getAllObjectInfo);
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_03 success');
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_03 getAllObject :PASS');
                        expect(false).assertTrue();
                        done();
                    } else {
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_03 fail, message = ' + err1);
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_03 getFileAssets :No data');
                        expect(false).assertTrue();
                        done();
                    }
                });
            } else {
                console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_03 fail, message = ' + err);
                expect(true).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_CALLBACK_005_05
     * @tc.name      : album.getFileAssets
     * @tc.desc      : Get Album Assets by fileHasArgsfetchOp5
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */

    it('SUB_MEDIA_MEDIALIBRARY_GETALBUMASSETS_CALLBACK_005_05', 0, async function (done) {
        let fileHasArgsfetchOp5 = {
            selections: '666' + '= ?',
            selectionArgs: ['666'],
        };
        album.getFileAssets(fileHasArgsfetchOp5, (err, albumFetchFileResult) => {
            if (albumFetchFileResult != undefined) {
                console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets success');
                albumFetchFileResult.getAllObject((err1, data1) => {
                    if (data1 != undefined) {
                        data1.forEach(getAllObjectInfo);
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_03 success');
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_03 getAllObject :PASS');
                        expect(false).assertTrue();
                        done();
                    } else {
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_03 fail, message = ' + err1);
                        console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_03 getFileAssets :No data');
                        expect(false).assertTrue();
                        done();
                    }
                });
            } else {
                console.info('MediaLibraryTest : ALBUM_CALLBACK getFileAssets 005_03 fail, message = ' + err);
                expect(true).assertTrue();
                done();
            }
        });
    });

    function getAllObjectInfo(data) {
        if (data != undefined) {
            console.info('MediaLibraryTest : ALBUM_CALLBACK id is ' + data.id);
            console.info('MediaLibraryTest : ALBUM_CALLBACK uri is ' + data.uri);
            console.info('MediaLibraryTest : ALBUM_CALLBACK displayName is ' + data.displayName);
            console.info('MediaLibraryTest : ALBUM_CALLBACK mediaType is ' + data.title);
            console.info('MediaLibraryTest : ALBUM_CALLBACK relativePath is ' + data.relativePath);
        } else {
            console.info('MediaLibraryTest : ALBUM_CALLBACK getAllObjectInfo no album');
        }
    }
});
