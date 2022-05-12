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

import resourceManager from '@ohos.resourceManager';
import {expect} from 'deccjsunit/index'
import router from '@system.router'
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'
import mediaLibrary from '@ohos.multimedia.mediaLibrary'

// File operation
export async function getFileDescriptor(fileName) {
    let fileDescriptor = undefined;
    await resourceManager.getResourceManager().then(async (mgr) => {
        await mgr.getRawFileDescriptor(fileName).then(value => {
            fileDescriptor = {fd: value.fd, offset: value.offset, length: value.length};
            console.log('case getRawFileDescriptor success fileName: ' + fileName);
        }).catch(error => {
            console.log('case getRawFileDescriptor err: ' + error);
        });
    });
    return fileDescriptor;
}

export async function closeFileDescriptor(fileName) {
    await resourceManager.getResourceManager().then(async (mgr) => {
        await mgr.closeRawFileDescriptor(fileName).then(()=> {
            console.log('case closeRawFileDescriptor ' + fileName);
        }).catch(error => {
            console.log('case closeRawFileDescriptor err: ' + error);
        });
    });
}

export function isFileOpen(fileDescriptor, done) {
    if (fileDescriptor == undefined) {
        expect().assertFail();
        console.info('case error fileDescriptor undefined, open file fail');
        done();
    }
}

// wait synchronously 
export function msleep(time) {
    for(let t = Date.now();Date.now() - t <= time;);
}

// wait asynchronously
export async function msleepAsync(ms) {
    return new Promise((resolve) => setTimeout(resolve, ms));
}

export function printError(error, done) {
    expect().assertFail();
    console.info(`case error called,errMessage is ${error.message}`);
    done();
}

// callback function for promise call back error
export function failureCallback(error) {
    expect().assertFail();
    console.info(`case error called,errMessage is ${error.message}`);
}

// callback function for promise catch error
export function catchCallback(error) {
    expect().assertFail();
    console.info(`case error called,errMessage is ${error.message}`);
}

export function printDescription(obj) { 
    let description = ""; 
    for(let i in obj) { 
        let property = obj[i];
        console.info('case key is  '+ i);
        console.info('case value is  '+ property);
        description += i + " = " + property + "\n"; 
    } 
}

export async function toNewPage(pagePath1, pagePath2, page) {
    let path = '';
    if (page == 0) {
        path = pagePath1;
    } else {
        path = pagePath2;
    }
    let options = {
        uri: path,
    }
    try {
        await router.push(options);
    } catch {
        console.info('case route failed');
    }
}

export async function clearRouter() {
    await router.clear();
}

export async function getFd(pathName) {
    let fdObject = {
        fileAsset : null,
        fdNumber : null
    }
    let displayName = pathName;
    const mediaTest = mediaLibrary.getMediaLibrary();
    let fileKeyObj = mediaLibrary.FileKey;
    let mediaType = mediaLibrary.MediaType.VIDEO;
    let publicPath = await mediaTest.getPublicDirectory(mediaLibrary.DirectoryType.DIR_VIDEO);
    let dataUri = await mediaTest.createAsset(mediaType, displayName, publicPath);
    if (dataUri != undefined) {
        let args = dataUri.id.toString();
        let fetchOp = {
            selections : fileKeyObj.ID + "=?",
            selectionArgs : [args],
        }
        let fetchFileResult = await mediaTest.getFileAssets(fetchOp);
        fdObject.fileAsset = await fetchFileResult.getAllObject();
        fdObject.fdNumber = await fdObject.fileAsset[0].open('Rw');
        console.info('case getFd number is: ' + fdObject.fdNumber);
    }
    return fdObject;
}

export async function closeFd(fileAsset, fdNumber) {
    if (fileAsset != null) {
        await fileAsset[0].close(fdNumber).then(() => {
            console.info('[mediaLibrary] case close fd success');
        }).catch((err) => {
            console.info('[mediaLibrary] case close fd failed');
        });
    } else {
        console.info('[mediaLibrary] case fileAsset is null');
    }
}

// apply permission for test hap
export async function applyPermission(applictionName, permissionNames) {
    let appInfo = await bundle.getApplicationInfo(applictionName, 0, 100);
    let atManager = abilityAccessCtrl.createAtManager();
    if (atManager != null) {
        let tokenID = appInfo.accessTokenId;
        console.info('[permission] case accessTokenID is ' + tokenID);
        for (let i = 0; i < permissionNames.length; i++) {
            await atManager.grantUserGrantedPermission(tokenID, permissionNames[i], 1).then((result) => {
                console.info('[permission] case grantUserGrantedPermission success :' + result);
            }).catch((err) => {
                console.info('[permission] case grantUserGrantedPermission failed :' + err);
            });
        }
    } else {
        console.info('[permission] case apply permission failed, createAtManager failed');
    }
}