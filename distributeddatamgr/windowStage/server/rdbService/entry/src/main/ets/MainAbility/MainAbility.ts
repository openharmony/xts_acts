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
 
import Ability from '@ohos.application.Ability'
import ability_particleAbility from '@ohos.ability.particleAbility'
import dataSharePredicates from '@ohos.data.dataSharePredicates'
import dataShare from '@ohos.data.dataShare'
import featureAbility from '@ohos.ability.featureAbility'


import dataAbility from '@ohos.data.dataAbility'
import rdb from '@ohos.data.rdb';

import rpc from "@ohos.rpc";

var seConnect = {
    onConnect:function (elementName, proxy) {
        console.log("[ttt] [DataShareTest] <<Consumer>> seConnect onConnect called.");
        console.log("[ttt] [DataShareTest] <<Consumer>> seConnect onConnect elementName = " + elementName);
        console.log("[ttt] [DataShareTest] <<Consumer>> seConnect onConnect proxy = " + proxy);
         let data = rpc.MessageParcel.create();
         let reply = rpc.MessageParcel.create();
         let option = new rpc.MessageOption();
         data.writeInterfaceToken("connect-test");
         data.writeInt(111);

         console.log("[ttt] [DataShareTest] <<Consumer>> seConnect onConnect sendRequest.");
         proxy.sendRequest(1, data, reply, option)
             .then(function (result) {
                 if (result.errCode === 0) {
                     // let msg = reply.readString();
                     let msg = result.reply.readInt();
                     console.log("[ttt] [DataShareTest] <<Consumer>> seConnect reply msg: " + msg);
                 } else {
                     console.log("[ttt] [DataShareTest] <<Consumer>> seConnect sendRequest failed, errCode: " + result.errCode);
                 }
                 // callback没有返回值，默认返回undefined
             }).catch(function (e) {
             console.log("[ttt] [DataShareTest] <<Consumer>> seConnect sendRequest got exception: " + e);
         }).finally (async () => {
             console.log("[ttt] [DataShareTest] <<Consumer>> seConnect sendRequest ends, reclaim parcel");
             data.reclaim();
             reply.reclaim();
         })
    },
    onDisconnect:function (elementName) {
        console.log("[ttt] [DataShareTest] <<Consumer>> seConnect onDisconnect");
    },
    onFailed:function (code) {
        console.log("[ttt] [DataShareTest] <<Consumer>> seConnect onFailed");
    }
};

let dseProxy = 0;
let dseUri = ("datashare:///com.samples.datasharetest.DataShare");

var dseConnect = {
    onConnect:function (elementName, proxy) {
        console.log("[ttt] [DataShareTest] <<Consumer>> dseConnect onConnect called.");
        // console.log("[ttt] [DataShareTest] <<Consumer>> dseConnect onConnect elementName = " + elementName);
        // console.log("[ttt] [DataShareTest] <<Consumer>> dseConnect onConnect proxy = " + proxy);
        dseProxy = proxy;
    },
    onDisconnect:function (elementName) {
        console.log("[ttt] [DataShareTest] <<Consumer>> dseConnect onDisconnect, elementName:" + elementName);
    },
    onFailed:function (code) {
        console.log("[ttt] [DataShareTest] <<Consumer>> dseConnect onFailed, code:" + code);
    }
};

let seConnectionId = -1;
let dseConnectionId = -1;

let seWant = {
    "bundleName": "com.samples.datasharetest",
    "abilityName": "ServiceExtAbility",
}

let dseWant = {
    "bundleName": "com.samples.datasharetest",
    "abilityName": "DataShareExtAbility",
}

export function onCallback() {
    console.info("[ttt] [DataShareTest] <<Consumer>> **** Observer on callback ****");
}

export function offCallback() {
    console.info("[ttt] [DataShareTest] <<Consumer>> **** Observer off callback ****");
}

export default class MainAbility extends Ability {
    onCreate(want, launchParam) {
        // Ability is creating, initialize resources for this ability
        console.log("[ttt] [DataShareTest] <<Consumer>> MainAbility onCreate")
        globalThis.abilityWant = want;
    }

    onDestroy() {
        // Ability is destroying, release resources for this ability
        console.log("[ttt] [DataShareTest] <<Consumer>> MainAbility onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[ttt] [DataShareTest] <<Consumer>> MainAbility onWindowStageCreate")
        globalThis.abilityContext = this.context;
        let context = this.context;
//        console.log('[ttt] [DataShareTest] <<Consumer>> MainAbility onWindowStageCreate this.context.stageMode:' + context.stageMode);
//        console.log('[ttt] [DataShareTest] <<Consumer>> MainAbility onWindowStageCreate this.context.bundleName:' + context.bundleName);
//        console.log('[ttt] [DataShareTest] <<Consumer>> MainAbility onWindowStageCreate this.context.name:' + context.name);
        globalThis.connectServiceExtAbility = (async () => {
            console.log("[ttt] [DataShareTest] <<Consumer>> connectServiceExtAbility begin");
            seConnectionId = await context.connectAbility(seWant, seConnect);
            console.log("[ttt] [DataShareTest] <<Consumer>> connectServiceExtAbility end, seConnectionId:" + seConnectionId);
        })

        globalThis.disconnectServiceExtAbility = (async () => {
          console.log("[ttt] [DataShareTest] <<Consumer>> disconnectServiceExtAbility begin");
          await context.disconnectAbility(seConnectionId).then((data) => {
            console.info("[ttt] [DataShareTest] <<Consumer>> startAbility success:" + JSON.stringify(data));
          }).catch((error) => {
            console.error("[ttt] [DataShareTest] <<Consumer>> startAbility failed:" + JSON.stringify(error));
          });
          console.log("[ttt] [DataShareTest] <<Consumer>> disconnectServiceExtAbility end, seConnectionId:" + seConnectionId);
        })



        globalThis.connectDataShareExtAbility = (async () => {
            console.log("[ttt] [DataShareTest] <<Consumer>> connectDataShareExtAbility begin");
//                        globalThis.dsHelper = await dataShare.createDataShareHelper(this.context,dseUri);

            await dataShare.createDataShareHelper(globalThis.abilityContext, dseUri, (err,data)=>{
                globalThis.dsHelper = data;
                console.info("[ttt] [DataShareTest] <<Consumer>> ----- 1 -----, globalThis.dsHelper = " + globalThis.dsHelper);
                console.info("[ttt] [DataShareTest] <<Consumer>> ----- 2 -----, data = " + data);
                console.info("[ttt] [DataShareTest] <<Consumer>> ----- 3 -----, err = " + err);
                console.info("[ttt] [DataShareTest] <<Consumer>> ----- 4 -----, JSON.stringify(err) = " + JSON.stringify(err));
            });

//           await dataShare.createDataShareHelper(this.context,dseUri).then((data)=>{
//                globalThis.dsHelper = data;
//                console.info("[ttt] [DataShareTest] <<Consumer>> ----- 1 -----, globalThis.dsHelper = " + globalThis.dsHelper);
//                console.info("[ttt] [DataShareTest] <<Consumer>> ----- 2 -----, data = " + data);
//            }).catch((err)=>{
//                console.info("[ttt] [DataShareTest] <<Consumer>> ----- 3 -----, err = " + err);
//                console.info("[ttt] [DataShareTest] <<Consumer>> ----- 4 -----, JSON.stringify(err) = " + JSON.stringify(err));
//            })
            dseConnectionId = await context.connectAbility(dseWant, dseConnect);
//            console.log("[ttt] [DataShareTest] <<Consumer>> ----- 5 -----, globalThis.dsHelper = " + globalThis.dsHelper);
//            console.log("[ttt] [DataShareTest] <<Consumer>> connectDataShareExtAbility end, dseConnectionId:" + dseConnectionId);
        })

        globalThis.disconnectDataShareExtAbility = (async () => {
          console.log("[ttt] [DataShareTest] <<Consumer>> disconnectDataShareExtAbility begin");
          await context.disconnectAbility(dseConnectionId).then((data) => {
            console.info("[ttt] [DataShareTest] <<Consumer>> disconnectDataShareExtAbility success:" + JSON.stringify(data));
          }).catch((error) => {
            console.error("[ttt] [DataShareTest] <<Consumer>> disconnectDataShareExtAbility failed:" + JSON.stringify(error));
          });
          globalThis.dsHelper = null;
          console.log("[ttt] [DataShareTest] <<Consumer>> disconnectDataShareExtAbility end, dseConnectionId:" + dseConnectionId);
        })

        globalThis.on = (async () => {
            console.log("[ttt] [DataShareTest] <<Consumer>> on begin");
            if (globalThis.dsHelper == null) {
                console.log("[ttt] [DataShareTest] <<Consumer>> on end, DSHelper is null");
                return;
            }
            await globalThis.dsHelper.on("dataChange", dseUri, onCallback);
            console.log("[ttt] [DataShareTest] <<Consumer>> on end");
        })

        globalThis.off = (async () => {
            console.log("[ttt] [DataShareTest] <<Consumer>> off begin");
            if (globalThis.dsHelper == null) {
                console.log("[ttt] [DataShareTest] <<Consumer>> off end, DSHelper is null");
                return;
            }
            await globalThis.dsHelper.off("dataChange", dseUri);
            await globalThis.dsHelper.off("dataChange", dseUri, offCallback);
            console.log("[ttt] [DataShareTest] <<Consumer>> off end");
        })

        globalThis.query = (async () => {
            console.log("[ttt] [DataShareTest] <<Consumer>> query begin");
            let da =  new dataSharePredicates.DataSharePredicates();
            if (da == null || da == undefined) {
                console.log("[ttt] [DataShareTest] <<Consumer>> da is null or undefined");
                return;
            }
            let count = 0;
            if (globalThis.dsHelper == null) {
                console.log("[ttt] [DataShareTest] <<Consumer>> query end, DSHelper is null");
                return;
            }
            da.notEqualTo("$.name", "rpf");
            da.limit(1,0);
            let result = await globalThis.dsHelper.query(dseUri, da, ["*"], (err,resultSet)=> {
                if (err) {
                    console.error("[ttt] [DataShareTest] <<Consumer>> query err:" + JSON.stringify(err));
                    console.log("[ttt] [DataShareTest] <<Consumer>> query data:" + resultSet);
                    console.log("[ttt] [DataShareTest] <<Consumer>> query data.rowCount:" + resultSet.rowCount);
                    console.log("[ttt] [DataShareTest] <<Consumer>> query data.columnCount:" + resultSet.columnCount);
                } else {
                    console.log("[ttt] [DataShareTest] <<Consumer>> query data:" + resultSet);
                    console.log("[ttt] [DataShareTest] <<Consumer>> query data.rowCount:" + resultSet.rowCount);
                    console.log("[ttt] [DataShareTest] <<Consumer>> query data.columnCount:" + resultSet.columnCount);
                }
            });
            if (result != undefined) {
                count = result.rowCount;
            }
            console.log("[ttt] [DataShareTest] <<Consumer>> query end, count:" + count);
            return count;
        })

        globalThis.insert = (async () => {

            console.log("[ttt] [DataShareTest] <<Consumer>> insert begin");
            if (globalThis.dsHelper == null) {
                console.log("[ttt] [DataShareTest] <<Consumer>> insert end, DSHelper is null");
                return;
            }
            let vb = {"age": 21}

            let v8Arr = [];
            let ar = new Uint8Array([1,2,3,4,5,6]);
            let arr = new Uint8Array([4,5,6,7]);
            let vb1 = {"key":ar,"value":arr}
            v8Arr.push(vb1);

            console.log("[ttt] [DataShareTest] <<Consumer>> insert vb:" + JSON.stringify(vb));
            console.log("[ttt] [DataShareTest] <<Consumer>> insert vb:" + JSON.stringify(vb));
            let ret = await globalThis.dsHelper.insert(dseUri, vb, (err,ret)=>{
                if(err){
                    console.error("[ttt] [DataShareTest] <<Consumer>> insert err:" + JSON.stringify(err));
                    console.log("[ttt] [DataShareTest] <<Consumer>> insert data:" + ret);
                }else {
                    console.log("[ttt] [DataShareTest] <<Consumer>> insert data:" + ret);
                }
            });
            await globalThis.notifyChange();
            console.log("[ttt] [DataShareTest] <<Consumer>> insert end, ret:" + ret);
            return ret;
        })

        globalThis.update = (async () => {
            console.log("[ttt] [DataShareTest] <<Consumer>> update begin");
            if (globalThis.dsHelper == null) {
                console.log("[ttt] [DataShareTest] <<Consumer>> update end, DSHelper is null");
                return;
            }
            console.log("[ttt] [DataShareTest] <<Consumer>> update begin RPF666");
            let da =  new dataSharePredicates.DataSharePredicates();
            console.log("[ttt] [DataShareTest] <<Consumer>> update begin RPF777");
            if (da == null || da == undefined) {
                console.log("[ttt] [DataShareTest] <<Consumer>> da is null or u" +
                "ndefined");
                return;
            }
//            da.equalTo("name", "ZhangSan");
            let ret = await globalThis.dsHelper.update(dseUri, da, {"age": 31}, (err,ret)=>{
                if(err){
                    console.error("[ttt] [DataShareTest] <<Consumer>> update err:" + JSON.stringify(err));
                    console.log("[ttt] [DataShareTest] <<Consumer>> update data:" + ret);
                }else {
                    console.log("[ttt] [DataShareTest] <<Consumer>> update data:" + ret);
                }
                });
            await globalThis.notifyChange();
            console.log("[ttt] [DataShareTest] <<Consumer>> update end, result:" + ret);
            return ret;
        })

        globalThis.delete = (async () => {
            console.log("[ttt] [DataShareTest] <<Consumer>> delete begin");
            if (globalThis.dsHelper == null) {
                console.log("[ttt] [DataShareTest] <<Consumer>> delete end, DSHelper is null");
                return;
            }
            let da =  new dataSharePredicates.DataSharePredicates();
            if (da == null || da == undefined) {
                console.log("[ttt] [DataShareTest] <<Consumer>> da is null or undefined");
                return;
            }
//            da.equalTo("name", "ZhangSan");
            let ret = globalThis.dsHelper.delete(dseUri, da, (err,ret)=>{
                if(err){
                    console.error("[ttt] [DataShareTest] <<Consumer>> delete err:" + JSON.stringify(err));
                    console.log("[ttt] [DataShareTest] <<Consumer>> delete data:" + ret);
                }else {
                    console.log("[ttt] [DataShareTest] <<Consumer>> delete data:" + ret);
                }
                });
            await globalThis.notifyChange();
            console.log("[ttt] [DataShareTest] <<Consumer>> delete end, result:" + ret);
            return ret;
        })

        globalThis.batchInsert = (async () => {
            console.log("[ttt] [DataShareTest] <<Consumer>> batchInsert begin");
            if (globalThis.dsHelper == null) {
                console.log("[ttt] [DataShareTest] <<Consumer>> batchInsert end, DSHelper is null");
                return;
            }
            let ar = new Uint8Array([1,2,3,4,5,6]);
            let arr = new Uint8Array([4,5,6,7]);
            let people = new Array(
                {"name": "LiSi", "age": 41, "Binary": ar},
                {"name": "WangWu", "age": 21, "Binary": arr},
                {"name": "ZhaoLiu", "age": 61, "Binary": arr});
//            let ar = new Uint8Array([1,2,3,4,5,6]);
//            let arr = new Uint8Array([4,5,6,7]);
//            let v8Arr = [];
//            let vb = {"key":ar,"jii":arr,"value":arr,"njj":arr};
//            v8Arr.push(vb)
            let ret = await globalThis.dsHelper.batchInsert(dseUri, people);
            await globalThis.notifyChange();
            console.log("[ttt] [DataShareTest] <<Consumer>> batchInsert end, result:" + ret);
            return ret;
        })

        globalThis.notifyChange = (async () => {
            console.log("[ttt] [DataShareTest] <<Consumer>> notifyChange begin");
            if (globalThis.dsHelper == null) {
                console.log("[ttt] [DataShareTest] <<Consumer>> notifyChange end, DSHelper is null");
                return;
            }
            await globalThis.dsHelper.notifyChange(dseUri);
            console.log("[ttt] [DataShareTest] <<Consumer>> notifyChange end");
        })

        globalThis.openFile = (async () => {
            console.log("[ttt] [DataShareTest] <<Consumer>> openFile begin");
            if (globalThis.dsHelper == null) {
                console.log("[ttt] [DataShareTest] <<Consumer>> openFile end, DSHelper is null");
                return;
            }
            let result = await globalThis.dsHelper.openFile(dseUri, "rwt");
            console.log("[ttt] [DataShareTest] <<Consumer>> openFile end, result:" + result);
            return result;
        })

        globalThis.getType = (async () => {
            console.log("[ttt] [DataShareTest] <<Consumer>> getType begin");
            if (globalThis.dsHelper == null) {
                console.log("[ttt] [DataShareTest] <<Consumer>> getType end, DSHelper is null");
                return;
            }
            let result;
            globalThis.dsHelper.getType(dseUri,(err,data)=>{
                if(err){
                    console.log("[ttt] [DataShareTest] <<Consumer>> getType err, err:" + JSON.stringify(err));
                    console.log("[ttt] [DataShareTest] <<Consumer>> getType end, err:" + JSON.stringify(data));
                    result = data;
                }else{
                    console.log("[ttt] [DataShareTest] <<Consumer>> getType end, err:" + JSON.stringify(data));
                    result = data;
                }
            });
            console.log("[ttt] [DataShareTest] <<Consumer>> getType end, result:" + result);
            return result;
        })

        globalThis.getFileTypes = (async () => {
            console.log("[ttt] [DataShareTest] <<Consumer>> getFileTypes begin");
            if (globalThis.dsHelper == null) {
                console.log("[ttt] [DataShareTest] <<Consumer>> getFileTypes end, DSHelper is null");
                return;
            }
            let result = await globalThis.dsHelper.getFileTypes(dseUri, "image/*",(err,data)=>{
                if(err){
                    console.log("[ttt] [DataShareTest] <<Consumer>> getType err, err:" + JSON.stringify(err));
                    console.log("[ttt] [DataShareTest] <<Consumer>> getType end, err:" + JSON.stringify(data));
                    result = data;
                }else{
                    console.log("[ttt] [DataShareTest] <<Consumer>> getType end, err:" + JSON.stringify(data));
                    result = data;
                }
            });
            return result;
        })

        globalThis.normalizeUri = (async () => {
            console.log("[ttt] [DataShareTest] <<Consumer>> normalizeUri begin");
            if (globalThis.dsHelper == null) {
                console.log("[ttt] [DataShareTest] <<Consumer>> normalizeUri end, DSHelper is null");
                return;
            }
            let result = await globalThis.dsHelper.normalizeUri(dseUri,(err,data)=>{
                if(err){
                    console.log("[ttt] [DataShareTest] <<Consumer>> normalizeUri err, err:" + JSON.stringify(err));
//                    console.log("[ttt] [DataShareTest] <<Consumer>> getType end, data:" + JSON.stringify(data));
//                    result = data;
                }else{
                    console.log("[ttt] [DataShareTest] <<Consumer>> normalizeUri end, data:" + JSON.stringify(data));
                    result = data;
                }
            });
            return result;
        })

        globalThis.denormalizeUri = (async () => {
            console.log("[ttt] [DataShareTest] <<Consumer>> denormalizeUri begin");
            if (globalThis.dsHelper == null) {
                console.log("[ttt] [DataShareTest] <<Consumer>> denormalizeUri end, DSHelper is null");
                return;
            }
            let result = await globalThis.dsHelper.denormalizeUri(dseUri,(err,data)=>{
                if(err){
                    console.log("[ttt] [DataShareTest] <<Consumer>> denormalizeUri err, err:" + JSON.stringify(err));
//                    console.log("[ttt] [DataShareTest] <<Consumer>> getType end, err:" + JSON.stringify(data));
//                    result = data;
                }else{
                    console.log("[ttt] [DataShareTest] <<Consumer>> denormalizeUri end, err:" + JSON.stringify(data));
                    result = data;
                }
            });
            return result;
        })

        windowStage.setUIContent(this.context, "pages/index", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[ttt] [DataShareTest] <<Consumer>> MainAbility onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[ttt] [DataShareTest] <<Consumer>> MainAbility onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.log("[ttt] [DataShareTest] <<Consumer>> MainAbility onBackground")
    }
};
