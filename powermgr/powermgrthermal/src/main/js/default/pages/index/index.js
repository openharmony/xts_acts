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

import device from '@system.device';

import {Core, ExpectExtend} from 'deccjsunit/index'

const core = Core.getInstance();

core.init()

require('../../test/List.test')

core.execute()

export default {
    data: {
        title: "world",
        width:0,
        height: 0
    },
    onInit() {
        device.getInfo({
            success:(data) =>{
                this.width = data.windowWidth;
                this.height = data.windowHeight;
            }
        });
    }
}
