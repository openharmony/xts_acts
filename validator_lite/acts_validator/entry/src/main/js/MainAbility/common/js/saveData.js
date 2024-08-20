/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import file from '@system.file';

export const saveTxtData = function (obj, str) {
    let writeData = function  () {
        console.info("write  obj.str: " + obj.str);
        file.writeText({
            uri: 'internal://app/'+obj.txtName,
            text: obj.str,
            success: function() {
                console.log('call writeText success.');
            },
            fail: function(data, code) {
                console.error('write call fail callback fail, code: ' + code + ', data: ' + data);
            },
        })
    }

    let checkStr = function () {
        console.info("checkStr obj.str: "+ obj.str +", obj.title: " + obj.title)
        if (obj.str != "" && obj.str.includes(obj.title)) {
            if (obj.str.includes(obj.title + "true;")) {
                if (str == "false;") {
                    obj.str.replace(obj.title + "true ;", obj.title + "false;")
                }
            } else if (obj.str.includes(obj.title + "false;")) {
                if (str == "true ;") {
                    obj.str.replace(obj.title + "false;", obj.title + "true ;")
                }
            }
        } else {
            obj.str += obj.title + str;
        }
    }

    file.readText({
        uri: 'internal://app/' + obj.txtName,
        success: function(data) {
            obj.str = data.text
            console.log('call readText success: ' + data.text);
            checkStr();
            writeData()
        },
        fail: function(data, code) {
            console.error('read call fail callback fail, code: ' + code + ', data: ' + data);
            checkStr();
            writeData()
        },
    });
};