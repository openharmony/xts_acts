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

import userfile_manager from '@ohos.filemanagement.userfile_manager';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundle from '@ohos.bundle';

const presetsCount = {
    ActsUserFileMgrAlbumJsTest: { albumsCount: 9, assetsCount: 9 },
    ActsUserFileMgrBaseJsTest: { albumsCount: 12, assetsCount: 24 },
    ActsUserFileMgrFileAssetJsTest: { albumsCount: 45, assetsCount: 116 },
}

const IMAGE_TYPE = userfile_manager.MediaType.IMAGE;
const VIDEO_TYPE = userfile_manager.MediaType.VIDEO;
const AUDIO_TYPE = userfile_manager.MediaType.AUDIO;
const FILE_TYPE = userfile_manager.MediaType.FILE;

const FILEKEY = userfile_manager.FileKey;
const AUDIOKEY = userfile_manager.AudioKey;
const IMAGEVIDEOKEY = userfile_manager.ImageVideoKey;
const ALBUMKEY = userfile_manager.AlbumKey;
const sleep = async function sleep(times) {
    if (times == undefined) {
        times = 10
    }
    await new Promise(res => setTimeout(res, times));
}

const allFetchOp = function () {
    return {
        selections: '',
        selectionArgs: [],
    };
}

const fileFetchOps = function (testNum, path) {
    let ops = {
        selections: FILEKEY.RELATIVE_PATH + '= ?',
        selectionArgs: [path],
    };
    console.info(`${testNum}: fileFetchOps${JSON.stringify(ops)}`)
    return ops
}

const audioFetchOps = function (testNum, path) {
    let ops = {
        selections: AUDIOKEY.RELATIVE_PATH + '= ?',
        selectionArgs: [path],
    };
    console.info(`${testNum}: audioFetchOps${JSON.stringify(ops)}`)
    return ops
}

const imageVideoFetchOps = function (testNum, path) {
    let ops = {
        selections: IMAGEVIDEOKEY.RELATIVE_PATH + '= ?',
        selectionArgs: [path],
    };
    console.info(`${testNum}: imageVideoFetchOps${JSON.stringify(ops)}`)
    return ops
}

const fileNameFetchOps = function (testNum, path, displayName) {
    let ops = {
        selections: FILEKEY.RELATIVE_PATH + '= ? AND ' + FILEKEY.DISPLAY_NAME + '= ?',
        selectionArgs: [path, displayName],
    };
    console.info(`${testNum}: fileNameFetchOps${JSON.stringify(ops)}`)
    return ops
}

const audioNameFetchOps = function (testNum, path, displayName) {
    let ops = {
        selections: AUDIOKEY.RELATIVE_PATH + '= ? AND ' + AUDIOKEY.DISPLAY_NAME + '= ?',
        selectionArgs: [path, displayName],
    };
    console.info(`${testNum}: audioNameFetchOps${JSON.stringify(ops)}`)
    return ops
}

const imageVideoNameFetchOps = function (testNum, path, displayName) {
    let ops = {
        selections: IMAGEVIDEOKEY.RELATIVE_PATH + '= ? AND ' + IMAGEVIDEOKEY.DISPLAY_NAME + '= ?',
        selectionArgs: [path, displayName],
    };
    console.info(`${testNum}: imageVideoNameFetchOps${JSON.stringify(ops)}`)
    return ops
}

const albumFetchOps = function (testNum, path, albumName) {
    let ops = {
        selections: ALBUMKEY.RELATIVE_PATH + '= ? AND ' + 'bucket_display_name' + '= ?',
        selectionArgs: [path, albumName],
    };
    console.info(`${testNum}: albumFetchOps${JSON.stringify(ops)}`)
    return ops
}

const checkPresetsAssets = async function (userfilemgr, hapName) {
    console.info('checkPresetsAssets start')
    let albumList = await userfilemgr.getAlbums([IMAGE_TYPE, VIDEO_TYPE, AUDIO_TYPE], allFetchOp());
    let albumsCount = albumList.length;
    let fetchFileResult = await userfilemgr.getFileAssets([IMAGE_TYPE, VIDEO_TYPE, AUDIO_TYPE],
        allFetchOp());
    let assetsCount = await fetchFileResult.getCount();
    console.info(`${hapName}:: assetsCount: ${assetsCount} albumsCount: ${albumsCount},
            presetsassetsCount: ${presetsCount[hapName].assetsCount} 
            presetsalbumsCount: ${presetsCount[hapName].albumsCount}`);
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
        console.info(`${testNum}:: count:expectCount - ${count} : ${expectCount}`);
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
        console.info(`${testNum}:: albumsCount: expectCount - ${albumsCount} : ${expectCount}`);
        expect(albumsCount).assertEqual(expectCount);
        done();
    }
    return albumsCount == expectCount;
}

const getPermission = async function (name = 'ohos.acts.multimedia.userfilemgr') {
    console.info('getPermission start', name)
    let appInfo = await bundle.getApplicationInfo('ohos.acts.multimedia.userfilemgr', 0, 100);
    let tokenID = appInfo.accessTokenId;
    let atManager = abilityAccessCtrl.createAtManager();
    let result1 = await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.MEDIA_LOCATION", 1);
    let resultReadImageVideo = await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.READ_IMAGEVIDEO", 1);
    let resultReadAudio = await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.READ_AUDIO", 1);
    let resultReadDocument = await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.READ_DOCUMENT", 1);
    let resultWriteImageVideo = await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.WRITE_IMAGEVIDEO", 1);
    let resultWriteAudio = await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.WRITE_AUDIO", 1);
    let resultWriteDocument = await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.WRITE_DOCUMENT", 1);
    let isGranted1 = await atManager.verifyAccessToken(tokenID, "ohos.permission.MEDIA_LOCATION");
    let isGrantedReadImageVideo = await atManager.verifyAccessToken(tokenID, "ohos.permission.READ_IMAGEVIDEO");
    let isGrantedReadAudio = await atManager.verifyAccessToken(tokenID, "ohos.permission.READ_AUDIO");
    let isGrantedReadDocument = await atManager.verifyAccessToken(tokenID, "ohos.permission.READ_DOCUMENT");
    let isGrantedWriteImageVideo = await atManager.verifyAccessToken(tokenID, "ohos.permission.WRITE_IMAGEVIDEO");
    let isGrantedWriteAudio = await atManager.verifyAccessToken(tokenID, "ohos.permission.WRITE_AUDIO");
    let isGrantedWriteDocument = await atManager.verifyAccessToken(tokenID, "ohos.permission.WRITE_DOCUMENT");
    if (result1 != 0 || isGranted1 !=0 || !(resultReadImageVideo == 0 && resultReadAudio == 0 && resultReadDocument == 0) ||
        !(resultWriteImageVideo == 0 && resultWriteAudio == 0 && resultWriteDocument == 0) ||
        !(isGrantedReadImageVideo == 0 && isGrantedReadAudio == 0 && isGrantedReadDocument == 0) ||
        !(isGrantedWriteImageVideo == 0 && isGrantedWriteAudio == 0 && isGrantedWriteDocument == 0)) {
        console.info('getPermission failed')
    }
    console.info('getPermission end')
}

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
    fileFetchOps,
    audioFetchOps,
    imageVideoFetchOps,
    fileNameFetchOps,
    audioNameFetchOps,
    imageVideoNameFetchOps,
    albumFetchOps,
    checkPresetsAssets,
    checkAssetsCount,
    checkAlbumsCount,
    isNum,
};