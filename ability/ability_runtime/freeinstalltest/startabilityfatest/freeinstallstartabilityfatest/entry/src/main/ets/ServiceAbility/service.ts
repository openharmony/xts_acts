/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import particleAbility from '@ohos.ability.particleAbility';
import wantConstant from '@ohos.ability.wantConstant';
import commonEvent from '@ohos.commonEvent';


var publishOptions = {
    parameters: {
        "assertData": "onSuccess"
    }
};

function PublishCallBack(err) {
    if (err.code) {
        console.error("ConnectAbilityTest_Ext service publish failed " + JSON.stringify(err));
    } else {
        console.info("ConnectAbilityTest_Ext service publish success!!!");
    }
}

export default {
    onStart() {
        console.info('PAStartAbilityPromise001 ServiceAbility onStart');
    },
    onStop() {
        console.info('PAStartAbilityPromise001 ServiceAbility onStop');
    },
    onCommand(want, startId) {
        var str = {
            'want': {
                'deviceId': '',
                'bundleName': 'com.example.qianyiyingyong.hmservice',
                'abilityName': 'com.example.qianyiyingyong.ServiceAbility',
                'moduleName': 'entry',
                'flags': wantConstant.Flags.FLAG_INSTALL_ON_DEMAND,
            }
        };
        console.info('PAStartAbilityPromise001 ServiceAbility startAbility START' + JSON.stringify(str));
        particleAbility.startAbility(str)
            .then((data) => {
                console.info('FreeInstall_FA_Local_StartAbility_3700 ServiceAbility startAbility successful.' +
                ' Data: ' + JSON.stringify(data))
                commonEvent.publish("service_event", publishOptions, PublishCallBack);
            }).catch((error) => {
            console.info('FreeInstall_FA_Local_StartAbility_3700 ServiceAbility startAbility failed. ' +
            'error: ' + JSON.stringify(error));
        })
        console.info('FreeInstall_FA_Local_StartAbility_3700 ServiceAbility startAbility END');
    }
};