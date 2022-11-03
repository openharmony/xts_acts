/*
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
import Ability from '@ohos.app.ability.UIAbility'
import rpc from '@ohos.rpc'

var connection = -1;
let options = {
    onConnect: function(elementName, proxy) {
        console.log("mxh onConnect success");
        if (proxy == null) {
            console.log("mxh proxy == null");
            return;
        }
        let option = new rpc.MessageOption();
        let data = new rpc.MessageParcel();
        let reply = new rpc.MessageParcel();
        data.writeInt(1);
        data.writeInt(99);
        proxy.sendRequest(1, data, reply, option);
        let msg = reply.readInt();
        console.log("mxh onConnect msg:" + msg);
    },

    onDisconnect: function() {console.log("mxh onDisconnect success");},
    onFailed: function() {console.log("mxh onFailed");}
}
export default class MainAbility extends Ability {
    onCreate(want, launchParam) {
        console.log('mxh MainAbility onCreate is called' + want + launchParam);
    }

    onDestroy() {
        console.log('mxh MainAbility onDestroy is called');
    }

    onWindowStageCreate(windowStage) {
        console.log('mxh MainAbility onWindowStageCreate is called');
        let context = this.context;
        globalThis.startServiceExtAbility = (() => {
            console.log("mxh startServiceExtAbility begin");
            var want = {
                "bundleName": "com.example.ohosproject.hmservice",
                "abilityName": "ServiceExtAbility",
            }
            context.startAbility(want).then((data) => {
                console.info("mxh startAbility success:" + JSON.stringify(data));
            }).catch((error) => {
                console.error("mxh startAbility failed:" + JSON.stringify(error));
            })
            console.log("mxh startServiceExtAbility end");
        })

        globalThis.connectServiceExtAbility = (() => {
            console.log("mxh connectServiceExtAbility begin");
            var want = {
                "bundleName": "com.example.ohosproject.hmservice",
                "abilityName": "ServiceExtAbility",
            }
            connection = context.connectServiceExtensionAbility(want, options);
            console.log("mxh connectServiceExtAbility end, connection:" + connection);
        })

        globalThis.disconnectServiceExtAbility = (() => {
            console.log("mxh disconnectServiceExtAbility begin");
            context.disconnectServiceExtensionAbility(connection).then((data) => {
                console.info("mxh startAbility success:" + JSON.stringify(data));
            }).catch((error) => {
                console.error("mxh startAbility failed:" + JSON.stringify(error));
            });
            console.log("mxh disconnectServiceExtAbility end, connection:" + connection);
        })

        windowStage.setUIContent(this.context, 'pages/index/index', null);
    }

    onWindowStageDestroy() {
        console.log('mxh MainAbility onWindowStageDestroy is called');
    }

    onForeground() {
        console.log('mxh MainAbility onForeground is called');
    }

    onBackground() {
        console.log('mxh MainAbility onBackground is called');
    }
}