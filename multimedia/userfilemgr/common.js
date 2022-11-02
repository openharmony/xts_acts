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

import userFileManager from '@ohos.filemanagement.userFileManager';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundle from '@ohos.bundle';
import dataSharePredicates from '@ohos.data.dataSharePredicates';

const presetsCount = {
    ActsUserFileMgrAlbumJsTest: { albumsCount: 3, assetsCount: 3 },
    ActsUserFileMgrBaseJsTest: { albumsCount: 18, assetsCount: 33 },
    ActsUserFileMgrFileAssetJsTest: { albumsCount: 45, assetsCount: 87 },
}

const IMAGE_TYPE = userFileManager.FileType.IMAGE;
const VIDEO_TYPE = userFileManager.FileType.VIDEO;
const AUDIO_TYPE = userFileManager.FileType.AUDIO;

const AUDIOKEY = userFileManager.AudioKey;
const IMAGEVIDEOKEY = userFileManager.ImageVideoKey;
const ALBUMKEY = userFileManager.AlbumKey;
const THROW_ERROR_CODE = 13900020;
const sleep = async function sleep(times) {
    if (times == undefined) {
        times = 10
    }
    await new Promise(res => setTimeout(res, times));
}

const allFetchOp = function () {
    let predicates = new dataSharePredicates.DataSharePredicates();
    return {
        fetchColumns: [],
        predicates: predicates
    };
}

const audioFetchOps = function (testNum, path) {
    let predicates = new dataSharePredicates.DataSharePredicates();
    predicates.equalTo("relative_path", path);
    let ops = {
        fetchColumns: [],
        predicates: predicates
    };
    console.info(`${testNum} queryOps: relative_path = ${path}`);
    return ops
}

const imageVideoFetchOps = function (testNum, path) {
    let predicates = new dataSharePredicates.DataSharePredicates();
    predicates.equalTo("relative_path", path);
    let ops = {
        fetchColumns: [],
        predicates: predicates
    };
    console.info(`${testNum} queryOps: relative_path = ${path}`);
    return ops
}

const audioNameFetchOps = function (testNum, path, displayName) {
    let predicates = new dataSharePredicates.DataSharePredicates();
    predicates.equalTo("relative_path", path)
        .equalTo(AUDIOKEY.DISPLAY_NAME, displayName);
    let ops = {
        fetchColumns: [],
        predicates: predicates
    };
    console.info(`${testNum} queryOps: relative_path = ${path} AND display_name = ${displayName}`);
    return ops
}

const imageVideoNameFetchOps = function (testNum, path, displayName) {
    let predicates = new dataSharePredicates.DataSharePredicates();
    predicates.equalTo("relative_path", path)
        .equalTo(IMAGEVIDEOKEY.DISPLAY_NAME, displayName);
    let ops = {
        fetchColumns: [],
        predicates: predicates
    };
    console.info(`${testNum} queryOps: relative_path = ${path} AND display_name = ${displayName}`);
    return ops
}

const albumFetchOps = function (testNum, path, albumName) {
    let predicates = new dataSharePredicates.DataSharePredicates();
    predicates.equalTo("relative_path", path)
        .equalTo(ALBUMKEY.ALBUM_NAME, albumName);
    let ops = {
        predicates: predicates
    };
    console.info(`${testNum} queryOps: relative_path = ${path} AND bucket_display_name = ${albumName}`);
    return ops
}

const checkPresetsAssets = async function (userfilemgr, hapName) {
    console.info('checkPresetsAssets start')
    let fetchAlbumResult = await userfilemgr.getPhotoAlbums(allFetchOp());
    let albumsCount = fetchAlbumResult.getCount();
    let fetchPhotoResult = await userfilemgr.getPhotoAssets(allFetchOp());
    let fetchAudioResult = await userfilemgr.getAudioAssets(allFetchOp());
    let assetsCount = fetchPhotoResult.getCount() + fetchAudioResult.getCount();
    console.info(`${hapName}:: assetsCount: ${assetsCount} albumsCount: ${albumsCount},
            presetsassetsCount: ${presetsCount[hapName].assetsCount} 
            presetsalbumsCount: ${presetsCount[hapName].albumsCount}`);
    console.info('checkPresetsAssets end')
}

const checkAssetsCount = async function (done, testNum, fetchAssetResult, expectCount) {
    if (!fetchAssetResult) {
        console.info(`${testNum}:: fetchAssetResult is undefined`);
        expect(false).assertTrue();
        done();
        return false
    }
    let count = await fetchAssetResult.getCount();
    if (count != expectCount) {
        console.info(`${testNum}:: count:expectCount - ${count} : ${expectCount}`);
        expect(count).assertEqual(expectCount);
        done();
    }
    return count == expectCount;
}

const getPermission = async function (name = 'ohos.acts.multimedia.userfilemgr') {
    console.info('getPermission start', name)
    let appInfo = await bundle.getApplicationInfo('ohos.acts.multimedia.userfilemgr', 0, 100);
    let tokenID = appInfo.accessTokenId;
    let atManager = abilityAccessCtrl.createAtManager();
    try {
        await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.MEDIA_LOCATION", 1);
    } catch (error) {
        console.info('getPermission MEDIA_LOCATION failed')
    }
    try {
        await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.READ_IMAGEVIDEO", 1);
    } catch (error) {
        console.info('getPermission READ_IMAGEVIDEO failed')
    }
    try {
        await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.READ_AUDIO", 1);
    } catch (error) {
        console.info('getPermission READ_AUDIO failed')
    }
    try {
        await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.READ_DOCUMENT", 1);
    } catch (error) {
        console.info('getPermission READ_DOCUMENT failed')
    }
    try {
        await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.WRITE_IMAGEVIDEO", 1);
    } catch (error) {
        console.info('getPermission WRITE_IMAGEVIDEO failed')
    }
    try {
        await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.WRITE_AUDIO", 1);
    } catch (error) {
        console.info('getPermission WRITE_AUDIO failed')
    }
    try {
        await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.WRITE_DOCUMENT", 1);
    } catch (error) {
        console.info('getPermission WRITE_DOCUMENT failed')
    }
    let isGranted1 = await atManager.verifyAccessToken(tokenID, "ohos.permission.MEDIA_LOCATION");
    let isGrantedReadImageVideo = await atManager.verifyAccessToken(tokenID, "ohos.permission.READ_IMAGEVIDEO");
    let isGrantedReadAudio = await atManager.verifyAccessToken(tokenID, "ohos.permission.READ_AUDIO");
    let isGrantedReadDocument = await atManager.verifyAccessToken(tokenID, "ohos.permission.READ_DOCUMENT");
    let isGrantedWriteImageVideo = await atManager.verifyAccessToken(tokenID, "ohos.permission.WRITE_IMAGEVIDEO");
    let isGrantedWriteAudio = await atManager.verifyAccessToken(tokenID, "ohos.permission.WRITE_AUDIO");
    let isGrantedWriteDocument = await atManager.verifyAccessToken(tokenID, "ohos.permission.WRITE_DOCUMENT");
    if (isGranted1 !=0 ||
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
    THROW_ERROR_CODE,
    sleep,
    allFetchOp,
    audioFetchOps,
    imageVideoFetchOps,
    audioNameFetchOps,
    imageVideoNameFetchOps,
    albumFetchOps,
    checkPresetsAssets,
    checkAssetsCount,
    isNum,
};