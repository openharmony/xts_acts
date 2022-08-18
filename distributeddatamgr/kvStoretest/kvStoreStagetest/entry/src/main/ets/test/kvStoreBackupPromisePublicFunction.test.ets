/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {describe, it, expect} from "@ohos/hypium"
import distributedData from '@ohos.data.distributedData';
import deviceManager from '@ohos.distributedHardware.deviceManager';
import prompt from '@system.prompt';

let BUNDLE_NAME = 'ohos.acts.kvStoreStage';

let STORE_ID = 'kvstoreBackupPromise';

let mKVMgrConfig = {
    userInfo: {
        userId: '0',
        userType: distributedData.UserType.SAME_USER_ID
    },
    bundleName: BUNDLE_NAME,
    context : globalThis.abilityContext
};

//getKvStore公共方法
function publicgetKvStore(optionsp){
    console.log(`TestDFX getKvStore `)
    return new Promise(function(resolve, reject) {
        distributedData.createKVManager(mKVMgrConfig, (err, data) => {
            console.info('TestDFX createKVManager begin')
            if (err) {
                console.info('TestDFX createKVManager err = ' + err );
                reject(err);
            }
            console.info('TestDFX createKVManager data = ' + data);

            //            this.log('create success: ' + JSON.stringify(data));
            globalThis.kvManager = data;
            data.getKVStore(STORE_ID, optionsp, (err, data) => {
                console.info('TestDFX getKVStore begin')
                if (err) {
                    console.info('TestDFX getKVStore err = ' + err);
                    reject(err);
                }
                console.info('TestDFX getKVStore data = ' + data);
                globalThis.kvStore = data;
                resolve(data);
            });
        });
    })
}

//closeKvStore公共方法
function publiccloseKvStore() {
    console.log(`TestDFX closeKvStore `)
    return new Promise(function (resolve, reject) {
        globalThis.kvManager.closeKVStore(BUNDLE_NAME, STORE_ID, globalThis.kvStore, (err, data) => {
            console.info('TestDFX closeKvStore begin')
            if (err) {
                console.info('TestDFX closeKvStore err = ' + err);
                reject(err);
            }
            console.info('TestDFX closeKvStore data = ' + data);
            globalThis.kvManager.deleteKVStore(BUNDLE_NAME, STORE_ID, (err, data) => {
                console.info('TestDFX deleteKVStore begin')
                if (err) {
                    console.info('TestDFX deleteKVStore err = ' + err);
                    reject(err);
                }
                console.info('TestDFX deleteKVStore data = ' + data);
            });
        });
    })
}

//插入数据公共方法
function publicput(kvStore,key,value){
    console.log(`TestDFX put ${JSON.stringify(key,value)}`)
    return new Promise(function(resolve, reject) {
        globalThis.kvStore.put(key,value, function(err, data){
            console.log("TestDFX put task =" + JSON.stringify(data));
            if (err != undefined) {
                console.log("TestDFX put err information: " + err );
                reject(err);
            }else{
                resolve(data);
            }
        })
    })
}

//查询插入数据公共方法
function publicget(kvStore,key){
    console.log(`TestDFX get ${JSON.stringify(key)}`)
    return new Promise(function(resolve, reject) {
        globalThis.kvStore.get(key, function(err, data){
            console.log("TestDFX get task =" + JSON.stringify(data));
            if (err != undefined) {
                console.log("TestDFX get err information: " + err );
                reject(err);
            }else{
                resolve(data);
            }
        })
    })
}

//手动备份公共方法
function publicbackup(kvStore,file){
    console.log(`TestDFX backup ${JSON.stringify(file)}`)
    return new Promise(function(resolve, reject) {
        globalThis.kvStore.backup(file).then((data) => {
            console.log("TestDFX backup task =" + data);
            resolve(data);
        }).catch((err) => {
            console.log("TestDFX backup err information: " + err);
            reject(err);
        })
    })
}

//删除公共方法
function publicdeleteBackup(kvStore,files) {
    console.log(`TestDFX deleteBackup ${JSON.stringify(files)}`)
    return new Promise(function (resolve, reject) {
        globalThis.kvStore.deleteBackup(files).then((data) => {
            console.log("TestDFX deleteBackup BackUpInfo =" + data);
            var devices = new Array();
            devices = data;
            globalThis.delresult = devices;
            console.log("TestDFX deleteBackup pass ");
            resolve(data);
        }).catch((err) => {
            console.log("test deleteBackup err information: " + err);
            reject(err);
        })
    })
}

//恢复到指定版本公共方法
function publicrestoresp(kvStore,file){
    console.log(`TestDFX restoresp ${JSON.stringify(file)}`)
    return new Promise(function(resolve, reject) {
        globalThis.kvStore.restore(file).then((data) => {
            console.log("TestDFX restoresp backupinfo information: " + JSON.stringify(data));
            resolve(data);
        }).catch((err) => {
            console.log("TestDFX restoresp err information: " + err  );
            reject(err);
        })
    })
}

//恢复到最近的备份公共方法
function publicrestore(kvStore){
    console.log(`TestDFX restore `)
    return new Promise(function(resolve, reject) {
        globalThis.kvStore.restore.then((data) => {
            console.log("TestDFX restore backupinfo information: " + JSON.stringify(data) );
            resolve(data);
        }).catch((err) => {
            console.log("TestDFX restore err information: " + err );
            reject(err);
        })
    })
}
export{publicgetKvStore,publicput,publicget,publicbackup,publicdeleteBackup,publicrestoresp,publicrestore,publiccloseKvStore}