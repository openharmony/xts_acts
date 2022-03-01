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

function stringToUint8Array(str) {
    var arr = [];
    for (var i = 0, j = str.length; i < j; ++i) {
        arr.push(str.charCodeAt(i));
    }
    var tmpUint8Array = new Uint8Array(arr);
    return tmpUint8Array
}

function uint8ArrayToString(array) {
    var dataString = "";
    for (var i = 0; i < array.length; i++) {
        dataString += String.fromCharCode(array[i]);
    }
    return dataString
}

function GetDataRandom() {
    var result = '';
    for (var i = 0; i < 16; i++) {
        result += Math.floor(Math.random() * 10).toString();
    }
    console.log(`test GetDataRandom ${result}`)
    return result;
}

function stringToArray(str) {
    var arr = [];
    for (var i = 0, j = str.length; i < j; ++i) {
        arr.push(str.charCodeAt(i));
    }
    return arr
}

export { stringToUint8Array, uint8ArrayToString, GetDataRandom, stringToArray };