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
    data: {
        item_index: NaN,
        animationName: 'animationTest',
        animationName2: 'animation2',
        str: '',
        title: 'transition',
        pass: 'true ;',
        fail: 'false;'
    },

    help() {
        router.replace({
            uri: 'pages/help/index',
            params: {
                step: '操作步骤：观察界面变化',
                result: '预期结果：界面上元素平移后还原',
                url: 'pages/transition/index'
            }
        });
    },

    back() {
        console.info('onclick back ');
        router.replace({
            uri: 'pages/second-compent/index',
            params: {
                item_index: this.item_index
            }
        });
    },

    changeResult(result) {
        getApp().data.keyList[this.title] = result;
        this.back();
    },
};
