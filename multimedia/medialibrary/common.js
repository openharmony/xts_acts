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
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundle from '@ohos.bundle';

const presetsCount = {
    ActsMediaLibraryAlbum: { assetsCount: 19, albumsCount: 7 },
    ActsMediaLibraryFavorite: { assetsCount: 32, albumsCount: 6 },
    //ActsMediaLibraryAlbumFileResultPro test case create 1 album 5 assets
    ActsMediaLibraryAlbumFileResultPro: { assetsCount: 123, albumsCount: 6 },
    //ActsMediaLibraryAlbumFileResultCb test case create 1 album 5 assets
    ActsMediaLibraryAlbumFileResultCb: { assetsCount: 118, albumsCount: 5 },
    ActsMediaLibraryFileKey: { assetsCount: 4, albumsCount: 4 },
    ActsMediaLibraryFileAsset: { assetsCount: 4, albumsCount: 4 },
    ActsMediaLibraryFile: { assetsCount: 4, albumsCount: 4 },
    ActsMediaLibraryGetThumbnail: { assetsCount: 3, albumsCount: 3 },
}

const IMAGE_TYPE = mediaLibrary.MediaType.IMAGE;
const VIDEO_TYPE = mediaLibrary.MediaType.VIDEO;
const AUDIO_TYPE = mediaLibrary.MediaType.AUDIO;
const FILE_TYPE = mediaLibrary.MediaType.FILE;

const FILEKEY = mediaLibrary.FileKey;
const { RELATIVE_PATH, ALBUM_NAME, MEDIA_TYPE } = FILEKEY
const sleep = async function sleep(times = 10) {
    await new Promise(res => setTimeout(res, times));
}

const allFetchOp = function (others = {}) {
    return {
        selections: '',
        selectionArgs: [],
        ...others
    };
}

const fetchOps = function (path, type, others = {}) {
    return {
        selections: FILEKEY.RELATIVE_PATH + '= ? AND ' + FILEKEY.MEDIA_TYPE + '=?',
        selectionArgs: [path, type.toString()],
        ...others
    };
}
const nameFetchOps = function (path, title, type) {
    return {
        selections: FILEKEY.RELATIVE_PATH + '= ? AND ' + FILEKEY.TITLE + '= ? AND ' + FILEKEY.MEDIA_TYPE + '=?',
        selectionArgs: [path, title, type.toString()],
    };
}

const idFetchOps = function (albumId) {
    return {
        selections: FILEKEY.ALBUM_ID + '= ?',
        selectionArgs: [albumId + ''],
    };
}

const albumFetchOps = function (path, albumName, type, others = { order: FILEKEY.DATE_ADDED + " DESC", }) {
    return {
        selections: RELATIVE_PATH + '= ? AND ' + ALBUM_NAME + '= ? AND ' + MEDIA_TYPE + '= ?',
        selectionArgs: [path, albumName, type.toString()],
        ...others
    };
}

// albums of two resource types
const albumTwoTypesFetchOps = function (paths, albumName, types, others = { order: FILEKEY.DATE_ADDED + " DESC", }) {
    try {
        let ops = {
            selections: '(' + RELATIVE_PATH + '= ? or ' +
                RELATIVE_PATH + '= ? ) AND ' +
                ALBUM_NAME + '= ? AND (' +
                MEDIA_TYPE + '= ? or ' +
                MEDIA_TYPE + '= ?)',
            selectionArgs: [paths[0], paths[1], albumName, types[0].toString(), types[1].toString()],
            ...others
        };
        return ops
    } catch (error) {
        console.info(`albumTwoTypesFetchOps :: error: ${error}`);
    }
}

// albums of three resource types
const albumThreeTypesFetchOps = function (paths, albumName, types, others = { order: FILEKEY.DATE_ADDED, }) {
    try {
        let ops = {
            selections: '(' + RELATIVE_PATH + '= ? or ' +
                RELATIVE_PATH + '= ? or ' +
                RELATIVE_PATH + '= ? ) AND ' +
                ALBUM_NAME + '= ? AND (' +
                MEDIA_TYPE + '= ? or ' +
                MEDIA_TYPE + '= ? or ' +
                MEDIA_TYPE + '= ?)',
            selectionArgs: [paths[0], paths[1], paths[2], albumName,
            types[0].toString(), types[1].toString(), types[2].toString()],
            ...others
        };
        return ops
    } catch (error) {
        console.info(`albumThreeTypesFetchOps :: error: ${error}`);
    }
}

const checkPresetsAssets = async function (media, hapName) {
    console.info('checkPresetsAssets start')
    let albumList = await media.getAlbums(allFetchOp());
    let albumsCount = albumList.length;
    let fetchFileResult = await media.getFileAssets(allFetchOp());
    let assetsCount = await fetchFileResult.getCount();
    console.info(`${hapName}:: assetsCount: ${assetsCount}`);
    console.info(`${hapName}:: albumsCount: ${albumsCount}`);
    console.info(`${hapName}:: presetsassetsCount: ${presetsCount[hapName].assetsCount}`);
    console.info(`${hapName}:: presetsalbumsCount: ${presetsCount[hapName].albumsCount}`);
    console.info('checkPresetsAssets end')
}

const checkAssetsCount = async function (done, testNum, fetchFileResult, expectCount) {
    if (!fetchFileResult) {
        console.info(`${testNum}:: fetchFileResult error:`);
        expect(false).assertTrue();
        done();
        return false
    }
    let count = await fetchFileResult.getCount();
    if (count != expectCount) {
        console.info(`${testNum}:: count: ${count}`);
        console.info(`${testNum}:: expectCount: ${expectCount}`);
        expect(count).assertEqual(expectCount);
        done();
    }
    return count == expectCount;
}

const checkAlbumsCount = function (done, testNum, albumList, expectCount) {
    if (!Array.isArray(albumList)) {
        console.info(`${testNum}:: albumList error:`);
        expect(false).assertTrue();
        done();
        return false
    }
    let albumsCount = albumList.length;
    if (albumsCount != expectCount) {
        console.info(`${testNum}:: albumsCount: ${albumsCount}`);
        console.info(`${testNum}:: expectCount: ${expectCount}`);
        console.info(`${testNum} failed:: albums length error`);
        expect(albumsCount).assertEqual(expectCount);
        done();
    }
    return albumsCount == expectCount;
}

const getPermission = async function (name = 'ohos.acts.multimedia.mediaLibrary') {
    console.info('getPermission start', name)
    let appInfo = await bundle.getApplicationInfo('ohos.acts.multimedia.mediaLibrary', 0, 100);
    let tokenID = appInfo.accessTokenId;
    let atManager = abilityAccessCtrl.createAtManager();
    let result1 = await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.MEDIA_LOCATION", 1);
    let result2 = await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.READ_MEDIA", 1);
    let result3 = await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.WRITE_MEDIA", 1);
    let isGranted1 = await atManager.verifyAccessToken(tokenID, "ohos.permission.MEDIA_LOCATION");
    let isGranted2 = await atManager.verifyAccessToken(tokenID, "ohos.permission.READ_MEDIA");
    let isGranted3 = await atManager.verifyAccessToken(tokenID, "ohos.permission.WRITE_MEDIA");
    if (!(result1 == 0 && result2 == 0 && result3 == 0) || !(isGranted1 == 0 && isGranted2 == 0 && isGranted3 == 0)) {
        console.info('getPermission failed')
    }
    console.info('getPermission end')
}

const MODIFY_ERROR_CODE_01 = '-1000';

const isNum = function (value) {
    return typeof value === 'number' && !isNaN(value);
}
export {
    getPermission,
    IMAGE_TYPE,
    VIDEO_TYPE,
    AUDIO_TYPE,
    FILE_TYPE,
    FILEKEY,
    sleep,
    allFetchOp,
    fetchOps,
    nameFetchOps,
    idFetchOps,
    albumFetchOps,
    albumTwoTypesFetchOps,
    albumThreeTypesFetchOps,
    checkPresetsAssets,
    checkAssetsCount,
    checkAlbumsCount,
    MODIFY_ERROR_CODE_01,
    isNum,
}
