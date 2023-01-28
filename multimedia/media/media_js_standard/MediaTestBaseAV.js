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

import featureAbility from '@ohos.ability.featureAbility'
import { UiDriver, BY, PointerMatrix } from '@ohos.uitest'
const CODECMIMEVALUE = ['video/avc', 'audio/mp4a-latm', 'audio/mpeg']

export async function getPermission(permissionNames) {
    featureAbility.getContext().requestPermissionsFromUser(permissionNames, 0, async (data) => {
        console.info("case request success" + JSON.stringify(data));
    })
}

export async function driveFn(num) {
    console.info(`case come in driveFn 111`);
    let driver = UiDriver.create();
    console.info(`case come in driveFn 222`);
    console.info(`driver is ${JSON.stringify(driver)}`);
    await msleepAsync(2000);
    console.info(`UiDriver start`);
    for (let i = 0; i < num; i++) {
        let button = await driver.findComponent(BY.text('允许'));
        console.info(`button is ${JSON.stringify(button)}`);
        await msleepAsync(2000);
        await button.click();
    }
    await msleepAsync(2000);
}

// File operation
export async function getFileDescriptor(fileName) {
    let fileDescriptor = undefined;
    let mgr = globalThis.abilityContext.resourceManager
    await mgr.getRawFileDescriptor(fileName).then(value => {
        fileDescriptor = {fd: value.fd, offset: value.offset, length: value.length};
        console.log('case getRawFileDescriptor success fileName: ' + fileName);
    }).catch(error => {
        console.log('case getRawFileDescriptor err: ' + error);
    });
    return fileDescriptor;
}
export async function closeFileDescriptor(fileName) {
    await globalThis.abilityContext.resourceManager.closeRawFileDescriptor(fileName).then(()=> {
        console.log('case closeRawFileDescriptor ' + fileName);
    }).catch(error => {
        console.log('case closeRawFileDescriptor err: ' + error);
    });
}


// wait asynchronously
export async function msleepAsync(ms) {
    return new Promise((resolve) => setTimeout(resolve, ms));
}

export function assertErr(opera, err, done) {
    console.info(`case ${opera} error,errMessage is ${err.message}`);
    expect().assertFail();
    done();
}
// callback function for promise call back error
export function failureCallback(error) {
    expect().assertFail();
    console.info(`case failureCallback promise called,errMessage is ${error.message}`);
}

// callback function for promise catch error
export function catchCallback(error) {
    expect().assertFail();
    console.info(`case error catch called,errMessage is ${error.message}`);
}
export function checkDescription(actualDescription, descriptionKey, descriptionValue) {
    for (let i = 0; i < descriptionKey.length; i++) {
        let property = actualDescription[descriptionKey[i]];
        console.info('case key is  '+ descriptionKey[i]);
        console.info('case actual value is  '+ property);
        console.info('case hope value is  '+ descriptionValue[i]);
        if (descriptionKey[i] == 'codec_mime') {
            expect(property).assertEqual(CODECMIMEVALUE[descriptionValue[i]]);
        } else {
            expect(property).assertEqual(descriptionValue[i]);
        }
        
    }
}


export async function getFd(pathName, fileType) {
    let fdObject = {
        fileAsset : null,
        fdNumber : null
    }
    let displayName = pathName;
    console.info('[mediaLibrary] fileType is ' + fileType);
    const mediaTest = mediaLibrary.getMediaLibrary(globalThis.abilityContext);
    let fileKeyObj = mediaLibrary.FileKey;
    let mediaType;
    let publicPath;
    if (fileType == 'audio') {
        mediaType = mediaLibrary.MediaType.AUDIO;
        publicPath = await mediaTest.getPublicDirectory(mediaLibrary.DirectoryType.DIR_AUDIO);
    } else {
        mediaType = mediaLibrary.MediaType.VIDEO;
        publicPath = await mediaTest.getPublicDirectory(mediaLibrary.DirectoryType.DIR_VIDEO);
    }
    console.info('[mediaLibrary] publicPath is ' + publicPath);
    let dataUri = await mediaTest.createAsset(mediaType, displayName, publicPath);
    if (dataUri != undefined) {
        let args = dataUri.id.toString();
        let fetchOp = {
            selections : fileKeyObj.ID + "=?",
            selectionArgs : [args],
        }
        let fetchFileResult = await mediaTest.getFileAssets(fetchOp);
        fdObject.fileAsset = await fetchFileResult.getAllObject();
        fdObject.fdNumber = await fdObject.fileAsset[0].open('rw');
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
