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
// @ts-nocheck
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'

const START_ABILITY_TIMEOUT = 3000;
const ABILITY_TIMEOUT = 5000;

export default function singleusermodelTest() {
    describe('ActsSingleUserTest', function () {
        var user100 = 100
        function onConnectCallback(element, remote) {
            console.log("ACTS_ExtensionSingleUserModel_1800====>callback start====>")
            console.log('ACTS_ExtensionSingleUserModel_1800 onConnectCallback====> element=' + JSON.stringify(element));
            console.log('ACTS_ExtensionSingleUserModel_1800 onConnectCallback====> remote=' + JSON.stringify(remote));
        }

        function onDisconnectCallback(element) {
            console.log('ACTS_ConnectAbility onDisconnectCallback')
        }

        function onFailedCallback(code) {
            console.log('ACTS_ConnectAbility ConnectAbility onFailed errCode : ' + code)
        }
        /**
         *@tc.number: ACTS_ExtensionSingleUserModel_1800
         *@tc.name: Support singleuser operation mode
         *@tc.desc:When singleuser not set  under the third-party application, the current user starts a serviceability
         */
        it('ACTS_ExtensionSingleUserModel_1800', 0, async function (done) {
            let abilityDelegator = undefined
            abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
            console.log("ACTS_ExtensionSingleUserModel_1800====>callback start====>")
            let connId;

            console.debug("====>start connectAbilityWithAccount====>");
            console.info('executeShellCommand :  globalThis.abilityContext : ' +
                JSON.stringify(globalThis.abilityContext));
            connId = await globalThis.abilityContext.connectAbilityWithAccount(
                {
                    bundleName: "com.singleusermodel.actssingleusertest",
                    abilityName: "ServiceAbility1",
                    action: "StartAbilityPromise"
                },
                user100,
                {
                    onConnect: onConnectCallback,
                    onDisconnect: onDisconnectCallback,
                    onFailed: onFailedCallback,
                }
            );
            console.log('StartConnectNative ConnectAbility connId : ' + connId);
            setTimeout(async () => {
                let temp
                var cmd = 'aa dump -e'
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                    console.info('executeShellCommand : data : ' + JSON.stringify(data));
                    temp = data["stdResult"];
                    expect(temp.indexOf("ServiceAbility1") >= 0).assertTrue()
                    console.info('executeShellCommand : data : ' + data.exitCode);
                })
                    .catch((err) => {
                        console.info('executeShellCommand 0: err : ' + JSON.stringify(err));
                    })
                cmd = 'aa dump -e -u 0'
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                    console.info('executeShellCommand 0: data : ' + JSON.stringify(data));
                    temp = data["stdResult"];
                    expect(temp.indexOf("ServiceAbility1") == -1).assertTrue()
                    console.info('executeShellCommand 0: data : ' + data.exitCode);
                }).catch((err) => {
                    console.info('executeShellCommand 0: err : ' + JSON.stringify(err));
                })
                globalThis.ability2Context.terminateSelf();
                console.debug('ACTS_ExtensionSingleUserModel_1800====>timeout====>');
                globalThis.abilityContex.disconnectAbility(connId).then((data, err) => {
                    console.debug("====>data is====>" + JSON.stringify(data));
                    console.debug("====>err is====>" + JSON.stringify(err));
                })
            }, START_ABILITY_TIMEOUT);
            setTimeout(() => {
                console.debug('ACTS_ExtensionSingleUserModel_1800====>done====>');
                done();
            }, ABILITY_TIMEOUT)
        })
    })
}