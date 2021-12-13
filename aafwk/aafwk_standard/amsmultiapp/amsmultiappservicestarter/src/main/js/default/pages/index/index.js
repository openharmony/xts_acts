/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import rpc from "@ohos.rpc"
import particleAbility from '@ohos.ability.particleability'
import commonEvent from '@ohos.commonevent'

const injectRef = Object.getPrototypeOf(global) || global
injectRef.regeneratorRuntime = require('@babel/runtime/regenerator')
let mMyStub;
let bundleName = "com.example.amsmultiappserviceexecutor";
let abilityName = "com.example.amsmultiappserviceexecutor.MainAbility";
let pageBundleName = "com.example.amsmultiapppageexecutor";
let pageAbilityName = "com.example.amsmultiapppageexecutor.MainAbility";
let connId;
var mRemote;

function onConnectCallback(element, remote) {
    console.log('ServiceStarter ConnectAbility onConnect element.deviceId : ' + element.deviceId)
    console.log('ServiceStarter ConnectAbility onConnect element.bundleName : ' + element.bundleName)
    console.log('ServiceStarter ConnectAbility onConnect element.abilityName : ' + element.abilityName)
    console.log('ServiceStarter ConnectAbility onConnect element.uri : ' + element.uri)
    console.log('ServiceStarter ConnectAbility onConnect element.shortName : ' + element.shortName)
    console.log('ServiceStarter ConnectAbility onConnect remote : ' + remote);
    mRemote = remote;
    console.log('ServiceStarter ConnectAbility onConnect remote 是否为proxy:' + (remote instanceof rpc.RemoteProxy));
    particleAbility.disconnectAbility(
        connId,
        (error, data) => {
            console.log('MultiAppService DisconnectAbility result errCode : ' + error.code + " data: " + data)
        },
    );
}
function onDisconnectCallback(element) {
    commonEvent.publish("DISCONNECT_0100", ()=>{console.log('disconnect finish1')});
    console.log('ServiceStarter ConnectAbility onDisconnect element.deviceId : ' + element.deviceId)
    console.log('ServiceStarter ConnectAbility onDisconnect element.bundleName : ' + element.bundleName)
    console.log('ServiceStarter ConnectAbility onDisconnect element.abilityName : ' + element.abilityName)
    console.log('ServiceStarter ConnectAbility onDisconnect element.uri : ' + element.uri)
    console.log('ServiceStarter ConnectAbility onDisconnect element.shortName : ' + element.shortName)
}
function onFailedCallback(code) {
    console.log('ServiceStarter ConnectAbility onFailed errCode : ' + code)
}

async function connectSerciveExecutor() {
    console.log('ServiceStarter StartSerciveExecutor ConnectAbility set time before : ');
    connId = await particleAbility.connectAbility(
        {
            bundleName: bundleName,
            abilityName: abilityName,
            action: "ConnectSerciveExecutor"
        },
        {
            onConnect: onConnectCallback,
            onDisconnect: onDisconnectCallback,
            onFailed: onFailedCallback,
        },
    );
    console.log('ServiceStarter StartSerciveExecutor ConnectAbility connId : ' + connId);
}

export default {
    data: {
        title: "ServiceStarter"
    },
    onInit() {
        this.title = "ServiceStarter";
    },
    onStart(want) {
        console.log('ServiceStarter onStart');

        class MyStub extends rpc.RemoteObject {
            constructor(des) {
                super(des);
            }

            onRemoteRequest(code, message, reply, option) {
                console.log("RPCTestServer onRemoteRequest called 1111");
                console.log("RPCTestServer onRemoteRequest code:" + code);
                if (code === 1) {
                    let getContextObject = rpc.IPCSkeleton.getContextObject();
                    let getCallingPid = rpc.IPCSkeleton.getCallingPid();
                    let getCallingUid = rpc.IPCSkeleton.getCallingUid();
                    let getCallingDeviceID = rpc.IPCSkeleton.getCallingDeviceID();
                    let getLocalDeviceID = rpc.IPCSkeleton.getLocalDeviceID();
                    let isLocalCalling = rpc.IPCSkeleton.isLocalCalling();
                    let remoteObject = new rpc.RemoteObject("aaa", 3);
                    let flushCommands = rpc.IPCSkeleton.flushCommands(remoteObject);
                    let resetCallingIdentity = rpc.IPCSkeleton.resetCallingIdentity();
                    let setCallingIdentity = rpc.IPCSkeleton.setCallingIdentity("aaa", 3);
                    let num = message.readInt();
                    let msg = message.readString();
                    console.log("num is " + num + "msg is " + msg);
                    reply.writeString("Success");
                    return true;
                }
            }
        }
        mMyStub = new MyStub("ServiceStarter-test");
    },
    onStop() {
        console.log('ServiceStarter onStop');
    },
    onConnect(want) {
        console.log('stub ServiceStarter OnConnect' + JSON.stringify(want));
        if (want.action == 'ConnectSerciveExecutor') {
            console.log('ServiceStarter ConnectSerciveExecutor IN')
            connectSerciveExecutor();
        }
        if (want.action == 'StartSerciveExecutor') {
            console.log('stub ServiceStarter OnConnect start service executor')
            particleAbility.startAbility(
                {
                    want:
                    {
                        action: "StartSerciveExecutor",
                        type: "MIMETYPE",
                        deviceId: "",
                        bundleName: bundleName,
                        abilityName: abilityName,
                        uri: ""
                    },
                }
            );
        }
        if (want.action == 'StartPageExecutor') {
            console.log('stub ServiceStarter  start page executor')
            particleAbility.startAbility(
                {
                    want:
                    {
                        action: "StartPageExecutor",
                        deviceId: "",
                        bundleName: pageBundleName,
                        abilityName: pageAbilityName,
                        uri: ""
                    },
                }
            );
        }
        return mMyStub;
    },
    onReconnect(want) {
        console.log('ServiceStarter onReconnect');
    },
    onDisconnect() {
        console.log('ServiceStarter OnDisConnect');
    },
    onCommand(want, restart, startId) {
        console.log('ServiceStarter onCommand');
    },
}
