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
import file from '@system.file'
import {Core, ExpectExtend} from 'deccjsunit/index'
import rpc from "@ohos.rpc"
import commonEvent from '@ohos.commoneEvent'
import particleAbility from '@ohos.ability.particleAbility'
import bundle from "@ohos.bundle"


let mMyStub;
const MIN_CLONEUID = 20000000;

const injectRef = Object.getPrototypeOf(global) || global
injectRef.regeneratorRuntime = require('@babel/runtime/regenerator')

export default {
    data: {
        title: ""
    },
    onInit() {
        this.title = this.$t('strings.world');
    },
    onShow() {
        console.info('onShow finish ')

    },
    onStart(want) {
        console.debug('AMS_MultiApp ====>onStart'
            + want + " , JSON." + JSON.stringify(want));
            class MyStub extends rpc.RemoteObject {
                constructor(des) {
                    super(des);
                }
    
                onRemoteRequest(code, message, reply, option) {
                    console.log("AMS_MultiApp code:" + code);
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
            mMyStub = new MyStub("ServiceAbility-test");
    },
    async onConnect(want) {
        console.info('onConnect finish')
        console.info('AMS_MultiApp_0800 want' 
        + JSON.stringify(want));

        console.info('particleAbility--------------------------1');
        var featureData = await particleAbility.getWant();
        console.info('particleAbility--------------------------2');
        console.info('AMS_MultiApp_0800 featureData' + featureData);
        console.info('AMS_MultiApp_0800 featureData' + JSON.stringify(featureData));
        console.info('AMS_MultiApp_0800 featureData-->bundleName' + featureData.bundleName);

        var flag=0;
        if((featureData.bundleName) == ("com.example.actsamsmultiapppageconnectservice"))
        {
           if ((featureData.abilityName) == ("com.example.actsamsmultiapppageconnectservice.MainAbility"))
           {
               flag = 1;
           }
        }
        console.info('AMS_MultiApp_0800 flag' + JSON.stringify(flag));
        var info = await particleAbility.getAbilityInfo();
        console.info('AMS_MultiApp_0800 particleAbility.getAbilityInfo() ' 
        + JSON.stringify(info));
        console.info('AMS_MultiApp_0800 particleAbility.getAbilityInfo() ' 
        + info);
        console.info('AMS_MultiApp_0800 particleAbility.getAbilityInfo() ' 
        + JSON.stringify(info.applicationInfo));
        bundle.getBundleInfo("com.example.actsamsmultiapppageconnectservice", 1, async(err, data) => {
            console.info('AMS_MultiApp_0800 bundle.getBundleInfo ' 
            + JSON.stringify(data));
            if (data.uid >= MIN_CLONEUID) {
                console.info('AMS_MultiApp_0800 Clone info ' + JSON.stringify(info.applicationInfo));
                if (info.applicationInfo.isCloned == true)
                {
                    flag = 1;

                }
            } else {
                console.info('AMS_MultiApp_0800 Ontology info ' + JSON.stringify(info.applicationInfo));
                if (info.applicationInfo.isCloned == false)
                {
                    flag = 2;
                }
            }
            commonEvent.publish("ACTS_MultiAppPageConnectService_onConnect" + flag, err =>{
                console.info('AMS_MultiApp resultflag' + JSON.stringify(flag));
                console.debug("=ACTS_MultiAppPageConnectService_onConnect err,data=======>"
                    + ("json err【") + JSON.stringify(err) + (" 】")
                    + ("json flag【") + JSON.stringify(flag) + (" 】")
                     + " ,err=" + err + " ,flag=" + flag);
                });
        return mMyStub;
    }) 
    },
    onCommand(want,restart,startId) {
        console.info('onCommand finish')
        commonEvent.publish("ACTS_MultiAppPageConnectService_onCommand", (err,data) =>{
            console.debug("=ACTS_MultiAppPageConnectService_onCommand err,data=======>"
                    + ("json err【") + JSON.stringify(err) + (" 】")
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,err=" + err + " ,data=" + data);
        });
        
    },
    onReady() {
        console.info('onReady');
    },
}

