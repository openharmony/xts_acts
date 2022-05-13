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

export async function getFileDescriptor(fileName) {
    let fileDescriptor = undefined;
    await resourceManager.getResourceManager().then(async (mgr) => {
        await mgr.getRawFileDescriptor(fileName).then(value => {
            fileDescriptor = {fd: value.fd, offset: value.offset, length: value.length};
        }).catch(error => {
            console.log('case getRawFileDescriptor err: ' + error);
        });
    });
    return fileDescriptor;
}

export async function closeFileDescriptor(fileName) {
    await resourceManager.getResourceManager().then(async (mgr) => {
        await mgr.closeRawFileDescriptor(fileName).then(value => {
            console.log('case closeRawFileDescriptor success for file:' + fileName);
        }).catch(error => {
            console.log('case closeRawFileDescriptor err: ' + error);
        });
    });
}
