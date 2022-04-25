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