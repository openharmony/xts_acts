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
 
import Extension from '@ohos.application.DataShareExtensionAbility'
import distributedData from '@ohos.data.distributedData';
import dataAbility from '@ohos.data.dataAbility';
import rdb from '@ohos.data.rdb';
import hilog from '@ohos.hilog';
import featureAbility from '@ohos.ability.featureAbility'
import fileIo from '@ohos.fileio'
import deviceManager from '@ohos.distributedHardware.deviceManager';


let DB_NAME = "DB00.db";
let TBL_NAME = "TBL00";
let DDL_TBL_CREATE = "CREATE TABLE IF NOT EXISTS "
+ TBL_NAME
+ " (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, phoneNumber DOUBLE, isStudent BOOLEAN, Binary BINARY)";
const BUNDLE_NAME = 'com.samples.datasharetest';

let rdbStore;
let result;
let devManager;
let deviceIds = [];

export default class DataShareExtAbility extends Extension {
    private rdbStore_;
    private kvdbStore_;

    onCreate(want, callback) {
        console.log('[ttt] [DataShareTest] <<Provider>> DataShareExtAbility onCreate, want:' + want.abilityName);
        console.log('[ttt] [DataShareTest] <<Provider>> this.context:' + this.context);
        result = this.context.cacheDir + '/datashare.txt'
        console.info('[ttt] [DataAbilityTest] <<Provider>> resultpath = ' + result);
        rdb.getRdbStore(this.context, {
            name: DB_NAME
        }, 1, function (err, data) {
            console.log('[ttt] [DataShareTest] <<Provider>> DataShareExtAbility onCreate, getRdbStore done err:' + JSON.stringify(err));
            console.log('[ttt] [DataShareTest] <<Provider>> DataShareExtAbility onCreate, getRdbStore done data:' + JSON.stringify(data));
            rdbStore = data;
            rdbStore.executeSql(DDL_TBL_CREATE, [], function (err) {
                console.log('[ttt] [DataShareTest] <<Provider>> DataShareExtAbility onCreate, executeSql done err:' + JSON.stringify(err));
            });
            callback();
        });
    }


    async insert(uri, value, callback) {
        console.info('[ttt] [DataShareTest] <<Provider>> [insert] enter');
//        deviceManager.createDeviceManager(BUNDLE_NAME, (err, value) => {
//            if (err) {
//                console.info("[ttt] [DataShareTest] <<Provider>> [createDeviceManager] err = " + err);
//            }
//            devManager = value;
//            console.info('[ttt] [DataShareTest] <<Provider>> [createDeviceManager] enter');
//            // get deviceIds
//            if (devManager != null) {
//                var devices = devManager.getTrustedDeviceListSync();
//                for (var i = 0; i < devices.length; i++) {
//                    deviceIds[i] = devices[i].deviceId;
//                }
//            }
//            console.log("[ttt] [DataShareTest] <<Provider>> deviceIds :" + deviceIds);
//        });
        if (value == null) {
            console.info('[ttt] [DataShareTest] <<Provider>> [insert] invalid valueBuckets');
            return;
        }
        console.info('[ttt] [DataShareTest] <<Provider>> [insert]  value = ' + value);
        console.info('[ttt] [DataShareTest] <<Provider>> [insert]  value = ' + JSON.stringify(value));
        await rdbStore.insert(TBL_NAME, value, function (err, ret) {
            console.info('[ttt] [DataShareTest] <<Provider>> [insert] callback ret:' + ret);
            if (callback != undefined) {
                callback(err, ret);
            }
        });
//        let predicate = new rdb.RdbPredicates('TBL00')
//        predicate.inAllDevices();
//        rdbStore.sync(rdb.SyncMode.SYNC_MODE_PUSH,predicate,(err,data) => {
//            if(err) {
//                console.info("[ttt] [DataShareTest] <<Provider>> [sync] err = " + err);
//            }
//            console.info("[ttt] [DataShareTest] <<Provider>> [sync] data = " + JSON.stringify(data));
//        })
        console.info('[ttt] [DataShareTest] <<Provider>> [insert] leave');
    }

    update(uri, predicates, value, callback) {
        console.info('[ttt] [DataShareTest] <<Provider>> [update] enter');
        if (predicates == null || predicates == undefined) {
            console.info('[ttt] [DataShareTest] <<Provider>> [update] invalid predicates');
            return;
        }
        console.info('[ttt] [DataShareTest] <<Provider>> [update]  values = ' + value);
        console.info('[ttt] [DataShareTest] <<Provider>> [update]  values = ' + JSON.stringify(value));
        console.info('[ttt] [DataShareTest] <<Provider>> [update]  predicates = ' + predicates);
        console.info('[ttt] [DataShareTest] <<Provider>> [update]  predicates = ' + JSON.stringify(predicates));
        try {
            rdbStore.update(TBL_NAME,value, predicates, function (err, ret) {
                console.info('[ttt] [DataShareTest] <<Provider>> [update] callback ret:' + ret);
                console.info('[ttt] [DataShareTest] <<Provider>> [update] callback err:' + err);
                if (callback != undefined) {
                    callback(err, ret);
                }
            });
        } catch (err) {
            console.error('[ttt] [DataShareTest] <<Provider>> [update] error' + err);
        }
        console.info('[ttt] [DataShareTest] <<Provider>> [update] leave');
    }

    delete(uri, predicates, callback) {
        console.info('[ttt] [DataShareTest] <<Provider>> [delete] enter');
        if (predicates == null || predicates == undefined) {
            console.info('[ttt] [DataShareTest] <<Provider>> [delete] invalid predicates');
            return;
        }
        console.info('[ttt] [DataShareTest] <<Provider>> [delete]  predicates = ' + predicates);
        console.info('[ttt] [DataShareTest] <<Provider>> [delete]  predicates = ' + JSON.stringify(predicates));
        try {
            rdbStore.delete(TBL_NAME,predicates, function (err, ret) {
                console.info('[ttt] [DataShareTest] <<Provider>> [delete] ret:' + ret);
                if (callback != undefined) {
                    callback(err, ret);
                }
            });
        } catch (err) {
            console.error('[ttt] [DataShareTest] <<Provider>> [delete] error' + err);
        }
        console.info('[ttt] [DataShareTest] <<Provider>> [delete] leave');
    }

    query(uri, predicates, columns,  callback) {
        console.info('[ttt] [DataShareTest] <<Provider>> [query] enter');
        if (predicates == null || predicates == undefined) {
            console.info('[ttt] [DataShareTest] <<Provider>> [query] invalid predicates');
        }
        console.info('[ttt] [DataShareTest] <<Provider>> [query]  values = ' + columns);
        console.info('[ttt] [DataShareTest] <<Provider>> [query]  values = ' + JSON.stringify(columns));
        console.info('[ttt] [DataShareTest] <<Provider>> [query]  predicates = ' + predicates);
        console.info('[ttt] [DataShareTest] <<Provider>> [query]  predicates = ' + JSON.stringify(predicates));
        try {
//            let da = new dataSharePredicates.DataSharePredicates();
//            da.notEqualTo("name", "ert");
//            da.limit(1,0);
            rdbStore.query(TBL_NAME, predicates, columns, function (err, resultSet) {
                console.info('[ttt] [DataShareTest] <<Provider>> [query] ret: ' + resultSet);
                if (resultSet != undefined) {
                    console.info('[ttt] [DataShareTest] <<Provider>> [query] resultSet.rowCount: ' + resultSet.rowCount);
                }
                if (callback != undefined) {
                    callback(err, resultSet);
                }
            });
        } catch (err) {
            console.error('[ttt] [DataShareTest] <<Provider>> [query] error' + err);
        }
        console.info('[ttt] [DataShareTest] <<Provider>> [query] leave');
    }


    batchInsert(uri: string, valueBuckets, callback) {
        console.info('[ttt] [DataShareTest] <<Provider>> [batchInsert] enter');
        if (valueBuckets == null || valueBuckets.length == undefined) {
            console.info('[ttt] [DataShareTest] <<Provider>> [batchInsert] invalid valueBuckets');
            return;
        }
        console.info('[ttt] [DataShareTest] <<Provider>> [batchInsert] valueBuckets.length:' + valueBuckets.length);
        let resultNum = valueBuckets.length
        valueBuckets.forEach(vb => {
            console.info('[ttt] [DataShareTest] <<Provider>> [batchInsert] vb:' + JSON.stringify(vb));
            rdbStore.insert(TBL_NAME, vb, function (err, ret) {
                console.info('[ttt] [DataShareTest] <<Provider>> [batchInsert] callback ret:' + ret);
                if (callback != undefined) {
                    callback(err, resultNum);
                }
            });
        });
        console.info('[ttt] [DataShareTest] <<Provider>> [batchInsert] leave');
    }

    getType(uri: string,callback) {
        console.info('[ttt] [DataShareTest] <<Provider>> [getType] enter');
        let ret = "image";
        console.info('[ttt] [DataShareTest] <<Provider>> [getType] leave, ret:' + ret);
        let err = {"code":0};
        callback(err,ret);
        return ret;
    }

    getFileTypes(uri: string, mimeTypeFilter: string, callback) {
        console.info('[ttt] [DataShareTest] <<Provider>> [getFileTypes] enter');
        let ret = new Array("type01", "type02", "type03");
        console.info('[ttt] [DataShareTest] <<Provider>> [getFileTypes] leave, ret:' + ret);
        let err = {"code":2};
        callback(err,ret);
        return ret;
    }

    openFile(uri: string, mode: string, callback) {
        console.info('[ttt] [DataAbilityTest] <<Provider>> DataAbility openFile in');
        fileIo.open(result, 0o2 | 0o100, 0o666, function(err, fd) {
            if(err) {
                console.info('[ttt] [DataAbilityTest] <<Provider>> OpenFile err = ' + err);
                console.info('[ttt] [DataAbilityTest] <<Provider>> OpenFile err = ' + JSON.stringify(err));
            }
            console.log('[ttt] [DataAbilityTest] <<Provider>> EtsFileIo fd =' + fd);
            let num = fileIo.writeSync(fd, "this is a interesting test of DataAbility from the Great RPF");
            console.info("[ttt] [DataAbillityTest] <<Provider>> WriteSync length = " + num);
            console.info("[ttt] [DataAbillityTest] <<Provider>> WriteSync fd = " + fd);
            callback(err,fd);
        })
    }

    normalizeUri(uri: string,callback) {
        console.info('[ttt] [DataShareTest] <<Provider>> [normalizeUri] enter');
        let ret = "normalize+" + uri;
        console.info('[ttt] [DataShareTest] <<Provider>> [normalizeUri] leave, ret:' + ret);
        let err = {"code":2};
        console.info('[ttt] [DataShareTest] <<Provider>> [normalizeUri] enter!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        callback(err,ret);
        console.info('[ttt] [DataShareTest] <<Provider>> [normalizeUri] leave!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    }

    denormalizeUri(uri: string,callback) {
        console.info('[ttt] [DataShareTest] <<Provider>> [denormalizeUri] enter');
        let ret = "denormalize+" + uri;
        console.info('[ttt] [DataShareTest] <<Provider>> [denormalizeUri] leave, ret:' + ret);
        let err = {"code":2};
        callback(err,ret);
        return ret;
    }
};