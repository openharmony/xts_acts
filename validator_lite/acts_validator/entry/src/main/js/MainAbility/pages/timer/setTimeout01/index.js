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

import router from '@system.router';

export default {
    data:{
        itemIndex: NaN,
        value:'show',
        timeoutId: -1,
        str: '',
        title: 'timer(timeout)',
        pass: 'true ;',
        fail: 'false;'
    },
    startTimer() {
        this.value = 'show';
        if (this.timeoutId !== -1) {
            clearTimeout(this.timeoutId);
        }
        this.timeoutId = setTimeout(()=> {
            console.info('start setTimeout');
            this.value = 'once_timer success';
        }, 3000);
    },

    clearTimer() {
        clearTimeout(this.timeoutId);
    },

    onDestroy() {
        clearTimeout(this.timeoutId);
    },

    help() {
        router.replace({
            uri: 'pages/help/index',
            params: {
                step: '操作步骤：startTimer、clearTimer',
                result: '预期结果：点击startTimer过3s后show变成once_timer success，在点startTimer时文字显示show时点clearTimer，show不会再变化',
                url: 'pages/timer/setTimeout01/index'
            }
        });
    },

    back() {
        console.info('onclick back ');
        router.replace({
            uri: 'pages/second-api/index',
            params: {
                itemIndex: this.itemIndex
            }
        });
    },

    changeResult(result) {
        getApp().data.keyList[this.title] = result;
        this.back();
    },
};