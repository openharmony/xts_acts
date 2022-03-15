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
import particleAbility from '@ohos.ability.particleAbility'
import bundle from "@ohos.bundle"
import commonEvent from '@ohos.commonEvent'

const injectRef = Object.getPrototypeOf(global) || global
injectRef.regeneratorRuntime = require('@babel/runtime/regenerator')
let mMyStub;
let code;
const MIN_CLONEUID = 20000000;

function publishCallBack() {
    console.debug("====>Publish CallBack ====>");
}

async function onCommandTest(want) {
    var abilityWant = await particleAbility.getWant();
    var result = "";
    var bundleInfo;
    console.log('ServiceExecutor onCommandTest');
    if ((abilityWant.bundleName == "com.example.amsmultiappserviceexecutor") &&
        (abilityWant.abilityName == "com.example.amsmultiappserviceexecutor.MainAbility")) {
            code = 1;
        } else {
            code = 2;
        }
    console.log('ServiceExecutor onCommand code =' + code );
    var info = await particleAbility.getAbilityInfo();
    console.log('ServiceExecutor onCommand info =' +  JSON.stringify(info));
    bundleInfo = await bundle.getBundleInfo("com.example.amsmultiappserviceexecutor", 1);
    console.info('ServiceExecutor getBundleInfo =' + JSON.stringify(bundleInfo));
    if (bundleInfo.uid >= MIN_CLONEUID) {
        if (info.applicationInfo.isCloned == true) {
            result = "isCloned";
        }
    } else {
        if (info.applicationInfo.isCloned == false) {
            result = "notCloned";
        }
    }
    var CommonEventPublishData = {
        code: code,
        data: result,
        isOrdered: false
    }
    if (want.action == 'StartSerciveExecutor') {
        console.log('ServiceExecutor onCommand publish');
        commonEvent.publish("subscriberInfoMultiAppServiceByServiceStart", CommonEventPublishData, publishCallBack);
    }
}

async function onConnectTest(want) {
    var abilityWant = await particleAbility.getWant();
    var result = "";
    var bundleInfo;
    console.log('ServiceExecutor onConnectTest');
    if ((abilityWant.bundleName == "com.example.amsmultiappserviceexecutor") &&
        (abilityWant.abilityName == "com.example.amsmultiappserviceexecutor.MainAbility")) {
        code = 1;
    } else {
        code = 2;
    }
    console.log('ServiceExecutor onCommand code =' + code);
    var info = await particleAbility.getAbilityInfo();
    console.info('ServiceExecutor MultiApp service executor info ' + JSON.stringify(info));
    bundleInfo = await bundle.getBundleInfo("com.example.amsmultiappserviceexecutor", 1);
    console.info('ServiceExecutor MultiApp service executor bundleInfo ' + JSON.stringify(bundleInfo));
    if (bundleInfo.uid >= MIN_CLONEUID) {
        if (info.applicationInfo.isCloned == true) {
            result = "isCloned";
        }
    } else {
        if (info.applicationInfo.isCloned == false) {
            result = "notCloned";
        }
    }
    var CommonEventPublishData = {
        code: code,
        data: result,
        isOrdered: false
    }
    if (want.action == 'ConnectSerciveExecutor') {
        console.log('ServiceExecutor onConnect publish' + want.action);
        commonEvent.publish("subscriberInfoMultiAppServiceByServiceConnect", CommonEventPublishData, publishCallBack);
    }
}

export default {
    data: {
        title: "ServiceExecutor"
    },
    onInit() {
        this.title = "ServiceExecutor";
    },
    onStart(want) {
        console.log('ServiceExecutor onStart');
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
        console.log('ServiceExecutor onStop');
    },
    onConnect(want) {
        console.log('stub ServiceExecutor OnConnect' + JSON.stringify(want));
        onConnectTest(want);
        return mMyStub;
    },
    onReconnect(want) {
        console.log('ServiceExecutor onReconnect');
    },
    onDisconnect() {
        console.log('ServiceExecutor OnDisConnect');
    },
    onCommand(want, restart, startId) {
        console.log('ServiceExecutor onCommand' + JSON.stringify(want));
        onCommandTest(want);
    },
}
