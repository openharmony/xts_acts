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

import {Core, ExpectExtend} from 'deccjsunit/index'
import * as mediaTestBase from '../../../../../../../MediaTestBase.js';
export default {
    data: {
        title: ""
    },
    onInit() {
        this.title = this.$t('strings.world');
    },
    async onShow() {
        console.info('onShow finish')
        let applictionName = 'ohos.acts.multimedia.video.videorecorder';
        let permissionName1 = 'ohos.permission.CAMERA';
        let permissionName2 = 'ohos.permission.MICROPHONE';
        let permissionName3 = 'ohos.permission.MEDIA_LOCATION';
        let permissionName4 = 'ohos.permission.READ_MEDIA';
        let permissionName5 = 'ohos.permission.WRITE_MEDIA';
        let permissionNames = new Array(permissionName1, permissionName2, permissionName3,
                                        permissionName4, permissionName5);
        await mediaTestBase.applyPermission(applictionName, permissionNames);
        const core = Core.getInstance()
        const expectExtend = new ExpectExtend({
            'id': 'extend'
        })
        core.addService('expect', expectExtend)
        core.init()
        const configService = core.getDefaultService('config')
        this.timeout = 60000
        configService.setConfig(this)
        require('../../../test/List.test')
        core.execute()
    },
    onReady() {
    },
}