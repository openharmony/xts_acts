
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
const ABILITY_TIMEOUT=5000;
const START_ABILITY_TIMEOUT = 3000;
export default function singleusermodelTest() {
    describe('ActsSingleUserTest', function () {
        var user100=100
        var user101=101
        var user102=102
        function onConnectCallbackA(element, remote) {
            console.log('ACTS_ExtensionSingleUserModel_1400 onConnectCallback====> element=' + JSON.stringify(element));
            console.log('ACTS_ExtensionSingleUserModel_1400 onConnectCallback====> remote=' + JSON.stringify(remote));
        }
        function onDisconnectCallbackA(element) {
            console.log('onDisconnectCallback====> element=' + JSON.stringify(element));
        }
        function onFailedCallbackA(code) {
            console.log('ACTS_ExtensionSingleUserModel_1400====>ACTS_ConnectAbility ' +
            'ConnectAbility onFailed errCode : ' + code)
        }

        /**
         *@tc.number: ACTS_ExtensionSingleUserModel_1400
         *@tc.name: Support singleuser operation mode
         *@tc.desc:When singleuser is false under the system application, the current user starts a serviceability
         */
        it('ACTS_ExtensionSingleUserModel_1400', 0, async function(done){
            console.log("ACTS_ExtensionSingleUserModel_1400====>callback start====>")
            let connId;

            console.debug("====>start connectAbilityWithAccount====>");

            connId = globalThis.abilityContext.connectAbilityWithAccount(
                {
                    bundleName: "com.singleusermodel.actssingleusertest",
                    abilityName:"ServiceAbility1",
                    action: "StartAbilityPromise"
                },
                user100,
                {
                    onConnect: onConnectCallbackA,
                    onDisconnect: onDisconnectCallbackA,
                    onFailed: onFailedCallbackA,
                }
            );
            setTimeout(async()=>{
                let abilityDelegator = undefined
                abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
                let temp
                let cmd ='aa dump -e'
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                        console.info('executeShellCommand : data : ' + JSON.stringify(data));
                        temp = data["stdResult"];
                        expect(temp.indexOf("ServiceAbility1") >= 0).assertTrue()
                        console.info('executeShellCommand : data : ' + data.exitCode);
                    }).catch((err) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                    })
                cmd ='aa dump -e -u 0'
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                        console.info('executeShellCommand : data 0: ' + JSON.stringify(data));
                        temp = data["stdResult"];
                        expect(temp.indexOf("ServiceAbility1") == -1).assertTrue()
                        console.info('executeShellCommand 0: data : ' + data.exitCode);
                    }).catch((err) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                    })
                console.debug('ACTS_ExtensionSingleUserModel_1400====>timeout====>');
                globalThis.abilityContex.disconnectAbility(connId).then((data)=>{
                    console.debug("====>data is====>" + JSON.stringify(data));
                })
            },START_ABILITY_TIMEOUT);
            console.log('ACTS_ExtensionSingleUserModel_1400====>StartConnectNative ' +
            'connectAbilityWithAccount connId : ' + connId);
            setTimeout(()=>{
                console.debug('ACTS_ExtensionSingleUserModel_1400====>done====>');
                done();
            },ABILITY_TIMEOUT)
        })

        function onConnectCallbackB(element, remote) {
            console.log('ACTS_ExtensionSingleUserModel_1500 onConnectCallback====> element=' + JSON.stringify(element));
            console.log('ACTS_ExtensionSingleUserModel_1500 onConnectCallback====> remote=' + JSON.stringify(remote));
        }
        function onDisconnectCallbackB(element) {
            console.log('onDisconnectCallback====> element=' + JSON.stringify(element));
        }
        function onFailedCallbackB(code) {
            console.log('ACTS_ExtensionSingleUserModel_1500====>ACTS_ConnectAbility ' +
            'ConnectAbility onFailed errCode : ' + code)
        }

        /**
         *@tc.number: ACTS_ExtensionSingleUserModel_1500
         *@tc.name: Support singleuser operation mode
         *@tc.desc:When singleuser is false under the system application, other existing users start a serviceability
         */
        it('ACTS_ExtensionSingleUserModel_1500', 0, async function(done){
            console.log("ACTS_ExtensionSingleUserModel_1500====>callback start====>")
            let connId;
            console.debug("====>start connectAbilityWithAccount====>");
            connId = globalThis.abilityContext.connectAbilityWithAccount(
                {
                    bundleName: "com.singleusermodel.actssingleusertest",
                    abilityName: "ServiceAbility2",
                    action: "StartAbilityPromise"
                },
                user101,
                {
                    onConnect: onConnectCallbackB,
                    onDisconnect: onDisconnectCallbackB,
                    onFailed: onFailedCallbackB,
                }
            );
            console.log('ACTS_ExtensionSingleUserModel_1500====>StartConnectNative ' +
            'connectAbilityWithAccount connId : ' + connId);

            setTimeout(async()=>{
                let abilityDelegator = undefined
                abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
                let temp
                let cmd ='aa dump -e'
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                        console.info('executeShellCommand : data : ' + JSON.stringify(data));
                        temp = data["stdResult"];
                        expect(temp.indexOf("ServiceAbility2") == -1).assertTrue()
                        console.info('executeShellCommand : data : ' + data.exitCode);
                    }).catch((err) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                    })
                cmd ='aa dump -e -u 0'
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                        console.info('executeShellCommand : data 0: ' + JSON.stringify(data));
                        temp = data["stdResult"];
                        expect(temp.indexOf("ServiceAbility2") == -1).assertTrue()
                        console.info('executeShellCommand 0: data : ' + data.exitCode);
                    }).catch((err) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                    })
                console.debug('ACTS_ExtensionSingleUserModel_1500====>timeout====>');
            },START_ABILITY_TIMEOUT);
            setTimeout(()=>{
                console.debug('ACTS_ExtensionSingleUserModel_1500====>done====>');
                done();
            },ABILITY_TIMEOUT)
        })

        function onConnectCallbackC(element, remote) {
            console.log('ACTS_ExtensionSingleUserModel_1600 onConnectCallback====> element=' + JSON.stringify(element));
            console.log('ACTS_ExtensionSingleUserModel_1600 onConnectCallback====> remote=' + JSON.stringify(remote));
        }
        function onDisconnectCallbackC(element) {
            console.log('onDisconnectCallback====> element=' + JSON.stringify(element));
        }
        function onFailedCallbackC(code) {
            console.log('ACTS_ExtensionSingleUserModel_1600====>ACTS_ConnectAbility ' +
            'ConnectAbility onFailed errCode : ' + code)
        }

        /**
         *@tc.number: ACTS_ExtensionSingleUserModel_1600
         *@tc.name: Support singleuser operation mode
         *@tc.desc:When singleuser is false under the system application, other users that do not exist
         * tart a serviceability
         */
        it('ACTS_ExtensionSingleUserModel_1600', 0, async function(done){
            console.log("ACTS_ExtensionSingleUserModel_1600====>callback start====>");

            try {
                let connId;
                console.debug("====>start connectAbilityWithAccount====>");
                connId = globalThis.abilityContext.connectAbilityWithAccount(
                    {
                        bundleName: "com.singleusermodel.actssingleusertest",
                        abilityName: "ServiceAbility3",
                        action: "StartAbilityPromise"
                    },
                    null,
                    {
                        onConnect: onConnectCallbackC,
                        onDisconnect: onDisconnectCallbackC,
                        onFailed: onFailedCallbackC,
                    }
                );
                console.log('ACTS_ExtensionSingleUserModel_1600====>StartConnectNative ' +
                'connectAbilityWithAccount connId : ' + connId);
            } catch (err) {
                let e = err.toString()
                let errLog = "Invalid input parameter"
                console.debug("====>e====>" + e);
                expect(e.indexOf(errLog) >= 0).assertTrue()
            }

            setTimeout(async()=> {
                let abilityDelegator = undefined
                abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
                let temp
                let cmd ='aa dump -e'
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                        console.info('executeShellCommand : data : ' + JSON.stringify(data));
                        temp = data["stdResult"];
                        expect(temp.indexOf("ServiceAbility3") == -1).assertTrue()
                        console.info('executeShellCommand : data : ' + data.exitCode);
                    }).catch((err) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                    })
                cmd ='aa dump -e -u 0'
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                        console.info('executeShellCommand : data 0: ' + JSON.stringify(data));
                        temp = data["stdResult"];
                        expect(temp.indexOf("ServiceAbility3") == -1).assertTrue()
                        console.info('executeShellCommand 0: data : ' + data.exitCode);
                    }).catch((err) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                    })
                console.debug('ACTS_ExtensionSingleUserModel_1600====>timeout====>');
            },START_ABILITY_TIMEOUT);
            setTimeout(()=>{
                console.debug('ACTS_ExtensionSingleUserModel_1600====>done====>');
                done();
            },ABILITY_TIMEOUT)
        })

        function onConnectCallbackD(element, remote) {
            console.log('ACTS_ExtensionSingleUserModel_1700 onConnectCallback====> element=' + JSON.stringify(element));
            console.log('ACTS_ExtensionSingleUserModel_1700 onConnectCallback====> remote=' + JSON.stringify(remote));
        }
        function onDisconnectCallbackD(element) {
            console.log('onDisconnectCallback====> element=' + JSON.stringify(element));
        }
        function onFailedCallbackD(code) {
            console.log('ACTS_ExtensionSingleUserModel_1700====>ACTS_ConnectAbility ' +
            'ConnectAbility onFailed errCode : ' + code)
        }

        /**
         *@tc.number: ACTS_ExtensionSingleUserModel_1700
         *@tc.name: Support singleuser operation mode
         *@tc.desc:When singleuser is false, create an ability page with the current user under the influence of
         * the system
         */
        it('ACTS_ExtensionSingleUserModel_1700', 0, async function(done){
            console.log("ACTS_ExtensionSingleUserModel_1700====>callback start====>")
            let connId;
            console.debug("====>start connectAbilityWithAccount====>");
            connId = globalThis.abilityContext.connectAbilityWithAccount(
                {
                    bundleName: "com.singleusermodel.actssingleusertest",
                    abilityName: "ServiceAbility4",
                    action: "StartAbilityPromise"
                },
                user102,
                {
                    onConnect: onConnectCallbackD,
                    onDisconnect: onDisconnectCallbackD,
                    onFailed: onFailedCallbackD,
                }
            );
            console.log('ACTS_ExtensionSingleUserModel_1700====>StartConnectNative ' +
            'connectAbilityWithAccount connId : ' + connId);
            setTimeout(async()=>{
                let abilityDelegator = undefined
                abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
                let temp
                let cmd ='aa dump -e'
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                        console.info('executeShellCommand : data : ' + JSON.stringify(data));
                        temp = data["stdResult"];
                        expect(temp.indexOf("ServiceAbility4") == -1).assertTrue()
                        console.info('executeShellCommand : data : ' + data.exitCode);
                    }).catch((err) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                    })
                cmd ='aa dump -e -u 0'
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                        console.info('executeShellCommand : data 0: ' + JSON.stringify(data));
                        temp = data["stdResult"];
                        expect(temp.indexOf("ServiceAbility4") == -1).assertTrue()
                        console.info('executeShellCommand 0: data : ' + data.exitCode);
                    }).catch((err) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                    })
                console.debug('ACTS_ExtensionSingleUserModel_1700====>timeout====>');
            },START_ABILITY_TIMEOUT);
            setTimeout(()=>{
                console.debug('ACTS_ExtensionSingleUserModel_1700====>done====>');
                done();
            },ABILITY_TIMEOUT)
        })

        function onConnectCallbackE(element, remote) {
            console.log('ACTS_ExtensionSingleUserModel_1900 onConnectCallback====> element=' + JSON.stringify(element));
            console.log('ACTS_ExtensionSingleUserModel_1900 onConnectCallback====> remote=' + JSON.stringify(remote));
        }
        function onDisconnectCallbackE(element) {
            console.log('onDisconnectCallback====> element=' + JSON.stringify(element));
        }
        function onFailedCallbackE(code) {
            console.log('ACTS_ExtensionSingleUserModel_1900====>ACTS_ConnectAbility ' +
            'ConnectAbility onFailed errCode : ' + code)
        }

        /**
         *@tc.number: ACTS_ExtensionSingleUserModel_1900
         *@tc.name: Support singleuser operation mode
         *@tc.desc:When singleuser is false under the system application, other users that do not exist
         * tart a serviceability
         */
        it('ACTS_ExtensionSingleUserModel_1900', 0, async function(done){
            console.log("ACTS_ExtensionSingleUserModel_1900====>callback start====>");

            try {
                let connId;
                connId = globalThis.abilityContext.connectAbilityWithAccount(
                    {
                        bundleName: "com.singleusermodel.actssingleusertest",
                        abilityName: "ServiceAbility5",
                        action: "StartAbilityPromise"
                    },
                    undefined,
                    {
                        onConnect: onConnectCallbackE,
                        onDisconnect: onDisconnectCallbackE,
                        onFailed: onFailedCallbackE,
                    }
                );
                console.log('ACTS_ExtensionSingleUserModel_1900====>StartConnectNative ' +
                'connectAbilityWithAccount connId : ' + connId);
            } catch (err) {
                let e = err.toString()
                let errLog = "Invalid input parameter"
                console.debug("====>e====>" + e);
                expect(e.indexOf(errLog) >= 0).assertTrue()
            }

            setTimeout(async()=> {
                let abilityDelegator = undefined
                abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
                let temp
                let cmd ='aa dump -e'
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                        console.info('executeShellCommand : data : ' + JSON.stringify(data));
                        temp = data["stdResult"];
                        expect(temp.indexOf("ServiceAbility5") == -1).assertTrue()
                        console.info('executeShellCommand : data : ' + data.exitCode);
                    }).catch((err) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                    })
                cmd ='aa dump -e -u 0'
                await abilityDelegator.executeShellCommand(cmd).then((data) => {
                        console.info('executeShellCommand : data 0: ' + JSON.stringify(data));
                        temp = data["stdResult"];
                        expect(temp.indexOf("ServiceAbility5") == -1).assertTrue()
                        console.info('executeShellCommand 0: data : ' + data.exitCode);
                    }).catch((err) => {
                        console.info('executeShellCommand : err : ' + JSON.stringify(err));
                    })
                console.debug('ACTS_ExtensionSingleUserModel_1900====>timeout====>');
            },START_ABILITY_TIMEOUT);
            setTimeout(()=>{
                console.debug('ACTS_ExtensionSingleUserModel_1900====>done====>');
                done();
            },ABILITY_TIMEOUT)
        })
    })
}