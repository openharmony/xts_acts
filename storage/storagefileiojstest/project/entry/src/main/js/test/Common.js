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

import fileio from '@system.fileio'

export const FILE_CONTENT = "仙女星系 （英语: Andromeda Galaxy; M31; NGC 224 ；曾被称为 仙女座大星云 ），位于仙女座方位的拥有巨大盘状结构的 \
旋涡星系 ， 梅西耶星表 编号为M31， 星云星团新总表 编号位 NGC 224 ，直径22万光年，距离地球有254万光年，是距银河系最近的大星系。"

//创建一个可读写文件
export function prepareFile(fpath, content) {
    try {
        let fd = fileio.openSync(fpath, 0o102, 0o666)
        fileio.ftruncateSync(fd)
        fileio.writeSync(fd, content)
        fileio.fsyncSync(fd)
        fileio.closeSync(fd)
        return true
    } catch (e) {
        console.log("Failed to prepareFile for " + e)
        return false
    }
}
export function prepareFile1(fpath, content) {
    try {
        let fd = fileio.openSync(fpath, 0o102, 0o777)
        fileio.ftruncateSync(fd)
        fileio.writeSync(fd, content)
        fileio.fsyncSync(fd)
        fileio.closeSync(fd)
        return true
    } catch (e) {
        console.log("Failed to prepareFile for " + e)
        return false
    }
}
//创建一个可读的空文件
export function prepareEmptyFile(fpath) {
    try {
        let fd = fileio.openSync(fpath, 0o102, 0o777)
        fileio.closeSync(fd)
        return true
    } catch (e) {
        console.log("Failed to prepareFile for " + e)
        return false
    }
}
//将已存在的文件访问权限改为只读
export function fileToReadOnly(fpath) {
    try {
        let fd = fileio.openSync(fpath, 0o1)
        fileio.fchmodSync(fd, 0o444)
        fileio.fsyncSync(fd)
        fileio.closeSync(fd)
        return true
    } catch (e) {
        console.log("Failed to fileToReadOnly for " + e)
        return false
    }
}
//将已存在的文件访问权限改为只写
export function fileToWriteOnly(fpath) {
    try {
        let fd = fileio.openSync(fpath, 0o2)
        fileio.fchmodSync(fd, 0o222)
        fileio.fsyncSync(fd)
        fileio.closeSync(fd)
        return true
    } catch (e) {
        console.log("Failed to fileToWriteOnly " + e)
        return false
    }
}
//将已存在的文件访问权限改为读写
export function fileToReadAndWrite(fpath) {
    try {
        let fd = fileio.openSync(fpath, 0o1)
        fileio.fchmodSync(fd, 0o777)
        fileio.fsyncSync(fd)
        fileio.closeSync(fd)
        return true
    } catch (e) {
        console.log("Failed to fileToReadAndWrite " + e)
        return false
    }
}
var fileSeed = 0
export function nextFileName(testName) {
    const BASE_PATH = "/data/accounts/account_0/appdata/ohos.acts.stroage.fileio/cache/"
    return BASE_PATH + testName
}
export function fileName(testName) {
    const BASE_PATH = "/data/accounts/account_0/appdata/ohos.acts.stroage.fileio/files/"
    return BASE_PATH + testName
}
export function differentFileName(testName) {
    const BASE_PATH = "/data/accounts/account_0/ohos.acts.distributeddatamgr.distributedfile/"
    return BASE_PATH + testName
}
export function cacheFileName(testName) {
    const BASE_PATH = "/data/accounts/account_0/appdata/ohos.acts.stroage.fileio/files/cache/"
    return BASE_PATH + testName
}

export function getFileTextLen(fpath) {
    let ss
    try{
        ss = fileio.Stream.createStreamSync(fpath, "r+")
        expect(ss !== null).assertTrue()
        let len = ss.readSync(new ArrayBuffer(4096))
        console.log("文件:" + fpath)
        console.log("文本长度:" + len)
        expect(ss.closeSync() !== null).assertTrue()
        return len
    } catch (e) {
        console.log("Failed to getFileTextLen " + e)
        expect(ss.closeSync() !== null).assertTrue()
        return null
    }
}
export function isFileExist(fpath) {
    try{
        expect(fileio.accessSync(fpath) !== null).assertTrue()
        console.log("文件:" + fpath)
        console.log("状态:存在")
        return true
    } catch (e) {
        console.log("文件:" + fpath)
        console.log("状态:不存在")
        return false
    }
}
export function sleep(n) {
    var start = new Date().getTime();
    while (true) {
        if (new Date().getTime() - start > n) {
            break;
        }
    }
}
export function randomString(len) {
    len = len;
    var $chars = 'aaaabbbbcccc';
    var maxPos = $chars.length;
    var pwd = '';
    for (var i = 0; i < len; i++) {
        pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
    }
    return pwd;
}