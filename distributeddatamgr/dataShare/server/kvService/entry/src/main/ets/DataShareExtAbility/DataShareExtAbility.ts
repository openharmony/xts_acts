/*
* Copyright (c) 2022 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import Extension from '@ohos.application.DataShareExtensionAbility'
import dataSharePredicates from '@ohos.data.dataSharePredicates'
import distributedData from '@ohos.data.distributedData';
import fileIo from '@ohos.fileio'


let kvManager;
let kvdbStore;
let kvResultSet;
let result;

const BUNDLE_NAME = 'com.samples.datasharetest';
const STORE_ID = 'storeId';


export default class DataShareExtAbility extends Extension {
    private rdbStore_;
    private kvdbStore_;


    onCreate(want,callback) {
        console.info('[ttt] [DataShareTest] <<Provider>> DataShareExtAbility onCreate, want:' + want.abilityName);
        let mKVMgrConfig = {
            userInfo : {
                userId : '0',
                userType : distributedData.UserType.SAME_USER_ID
            },
            bundleName: BUNDLE_NAME,
            context : this.context
        }
        var options = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : distributedData.KVStoreType.SINGLE_VERSION,
            schema : {},
            securityLevel : distributedData.SecurityLevel.NO_LEVEL,
        }
        let name = new distributedData.FieldNode('name');
        name.type = distributedData.ValueType.STRING;
        name.nullable = false;
        name.default = 'name';

        let age = new distributedData.FieldNode('age');
        age.type = distributedData.ValueType.INTEGER;
        age.nullable = false;
        age.default = '0';

        let isStudent = new distributedData.FieldNode('isStudent');
        isStudent.type = distributedData.ValueType.STRING;
        isStudent.nullable = false;
        isStudent.default = 'false';


        let schema1 = new distributedData.Schema();
        schema1.root.appendChild(name);
        schema1.root.appendChild(age);
        schema1.root.appendChild(isStudent);
        schema1.indexes = ['$.name', "$.age", "$.isStudent"];
        //            options.kvStoreType = distributedData.KVStoreType.DEVICE_COLLABORATION;
        options.schema = schema1;
        distributedData.createKVManager(mKVMgrConfig, function (err, manager) {
            if (err) {
                console.info("[ttt] [DataShareTest] <<Provider>> createKVManager err: "  + err);
                return;
            }
            console.info("[ttt] [DataShareTest] <<Provider>> createKVManager success");
            kvManager  = manager;
            console.info('[ttt] [DataShareTest] <<Provider>> createKVManager kvManager = ' + kvManager);
            kvManager.getKVStore(STORE_ID, options, function (err, store) {
                if (err) {
                    console.info("[ttt] [DataShareTest] <<Provider>> getKVStore err: "  + err);
                    return;
                }
                console.info("[ttt] [DataShareTest] <<Provider>> getKVStore success");
                kvdbStore = store;
                console.info('[ttt] [DataShareTest] <<Provider>> createKVManager kvdbStore = ' + kvdbStore);
            });
            callback();
        });
        result = this.context.cacheDir + '/datashare.txt'
        console.info('[ttt] [DataAbilityTest] <<Provider>> resultpath = ' + result);
    }

    getFileTypes(uri: string, mimeTypeFilter: string, callback) {
        console.info('[ttt] [DataShareTest] <<Provider>> [getFileTypes] enter');
        let ret = new Array("type01", "type02", "type03");
        console.info('[ttt] [DataShareTest] <<Provider>> [getFileTypes] leave, ret:' + ret);
        let err = {"code":2};
        callback(err,ret);
        return ret;
    }

    async insert(uri, value, callback) {
        console.info('[ttt] [DataShareTest] <<Provider>> [insert] enterkvdb');
        if (value == null) {
            console.info('[ttt] [DataShareTest] <<Provider>> [insert] invalid valueBuckets');
            return;
        }
        console.info('[ttt] [DataShareTest] <<Provider>> [insert] kvdb value = ' + JSON.stringify(value));
        let vbArr = new Array();
        let insertBucket = {"name":value.name, "age":value.age, "isStudent":String(value.isStudent)}
        console.info('[ttt] [DataShareTest] <<Provider>> [insert] kvdb insertBucket = ' + JSON.stringify(insertBucket));
        vbArr.push({
                "key":"testkey0",
                "value": JSON.stringify(insertBucket)
            });

        console.info('[ttt] [DataShareTest] <<Provider>> [insert] kvdb vbArr = ' + JSON.stringify(vbArr) + "?????????????");
        kvdbStore.putBatch(vbArr,  function (err,data) {
            if (err != undefined) {
                console.info("[ttt] [DataShareTest] <<Provider>> [insert kvdb put] callback err: " + err);
                if (callback != undefined) {
                    callback(-1,-1);
                }
            }else{
                if (callback != undefined) {
                    callback(0,1);
                }
            }
            console.info("[ttt] [DataShareTest] <<Provider>> [insert kvdb put] callback data:" + JSON.stringify(data));
        });
        console.info('[ttt] [DataShareTest] <<Provider>> [insert] leave');
    }

    update(uri, predicates, value, callback) {
        console.info('[ttt] [DataShareTest] <<Provider>> [update] enter');
        console.info('[ttt] [DataShareTest] <<Provider>> [update] value = ' + JSON.stringify(value));
        console.info('[ttt] [DataShareTest] <<Provider>> [update] predicates = ' + predicates);

        if (predicates == null || predicates == undefined) {
            console.info('[ttt] [DataShareTest] <<Provider>> [update] invalid predicates');
            return;
        }
        let vbArr = new Array();
        let keyName = "testkey0";
        let updateBucket = {"name":value.name, "age":value.age, "isStudent":String(value.isStudent)}
//                let da = new dataShare.DataSharePredicates();
//                da.notEqualTo("$.name", "789");
//        kvdbStore.getResultSet(da, function (err, data) {
//            if (err != undefined) {
//                console.info("[ttt] [DataShareTest] <<Provider>> [query kvdb get] callback err: " + err);
//                return;
//            }
//            console.info("[ttt] [DataShareTest] <<Provider>> [query kvdb get] callback data:" + JSON.stringify(data));
//            if (callback != undefined) {
//                callback(err, data);
//            }
//        })

        console.info('[ttt] [DataShareTest] <<Provider>> [update] updateBucket = ' + JSON.stringify(updateBucket));
        console.info('[ttt] [DataShareTest] <<Provider>> [update] keyName = ' + keyName);
        vbArr.push({
            "key": keyName,
            "value": JSON.stringify(updateBucket)
        });
        console.info('[ttt] [DataShareTest] <<Provider>> [update] vbArr = ' + JSON.stringify(vbArr));



        kvdbStore.putBatch(vbArr, function (err,data) {
            if (err != undefined) {
                console.info("[ttt] [DataShareTest] <<Provider>> [update kvdb put] callback err: " + JSON.stringify(err));
                if (callback != undefined) {
                    callback(-1,-1);
                }
            }else{
                if (callback != undefined) {
                    callback(0,1);
                }
            }
            console.info("[ttt] [DataShareTest] <<Provider>> [update kvdb put] callback data:" + JSON.stringify(data));
        });
        console.info('[ttt] [DataShareTest] <<Provider>> [update] leave');
    }

    delete(uri, predicates, callback) {
        console.info('[ttt] [DataShareTest] <<Provider>> [delete] enter');
        if (predicates == null || predicates == undefined) {
            console.info('[ttt] [DataShareTest] <<Provider>> [delete] invalid predicates');
            return;
        }
        kvdbStore.delete(predicates, function(err, data) {
            if (err != undefined) {
                console.info("[ttt] [DataShareTest] <<Provider>> [delete kvdb] callback err: " + err);
                if (callback != undefined) {
                    callback(-1, -1);
                }
            }else {
                console.info("[ttt] [DataShareTest] <<Provider>> [delete kvdb] callback data:" + JSON.stringify(data));
                if (callback != undefined) {
                    callback(0, 1);
                }
            }
        });
        console.info('[ttt] [DataShareTest] <<Provider>> [delete] leave');
    }

    query(uri, predicates, columns, callback) {
        console.info('[ttt] [DataShareTest] <<Provider>> [query] enter');
        if (predicates == null || predicates == undefined) {
            console.info('[ttt] [DataShareTest] <<Provider>> [query] invalid predicates');
        }
        console.info("[ttt] [DataShareTest] <<Provider>> [query] getDADADADADADADA!!!")
        if(kvResultSet != null || kvResultSet != undefined){
            kvdbStore.closeResultSet(kvResultSet,function (err, data) {
                if (err != undefined) {
                    console.info("[ttt] [DataShareTest] <<Provider>> [query kvdb closeResultSet] callback err: " + err);
                    return;
                }
                console.info("[ttt] [DataShareTest] <<Provider>> [query kvdb closeResultSet] callback data:" + JSON.stringify(data));
            })
        }
        console.info("[ttt] [DataShareTest] <<Provider>> [RPF66666] " );
//        let da = new dataSharePredicates.DataSharePredicates();
//        da.notEqualTo("$.name", "789");
//        da.limit(1, 0);
//        var query = new distributedData.Query();
//        query.notEqualTo("$.name", 3);
//        query.limit(1, 0);
        kvdbStore.getResultSet(predicates, function (err, data) {
            if (err != undefined) {
                console.info("[ttt] [DataShareTest] <<Provider>> [query kvdb get] callback err: " + err);
                return;
            }
            kvResultSet = data;
            console.info("[ttt] [DataShareTest] <<Provider>> [query kvdb get] getCount = " + kvResultSet.getCount())
            console.info("[ttt] [DataShareTest] <<Provider>> [query kvdb get] callback data:" + JSON.stringify(data));
            if (callback != undefined) {
                callback(err, data);
            }
        })
        console.info('[ttt] [DataShareTest] <<Provider>> [query] leave');
    }

    getType(uri: string,callback) {
        console.info('[ttt] [DataShareTest] <<Provider>> [getType] enter');
        let ret = "image";
        console.info('[ttt] [DataShareTest] <<Provider>> [getType] leave, ret:' + ret);
        let err = {"code":2};
        callback(err,ret);
        return ret;
    }

    batchInsert(uri, valueBuckets, callback) {
        console.info('[ttt] [DataShareTest] <<Provider>> [batchInsert] enter');
        if (valueBuckets == null || valueBuckets.length == undefined) {
            console.info('[ttt] [DataShareTest] <<Provider>> [batchInsert] invalid valueBuckets');
            return;
        }
        console.info('[ttt] [DataShareTest] <<Provider>> [batchInsert] valueBuckets.length:' + valueBuckets.length);

        console.info('[ttt] [DataShareTest] <<Provider>> [batchInsert] valueBuckets.isStudent :' + JSON.stringify(valueBuckets[0].isStudent));

        let vbArr = new Array();
        let batchInsertBucket = new Array();
        let num = 0;
        for(let i = 0; i < valueBuckets.length; i++) {
            console.info('[ttt] [DataShareTest] <<Provider>> [batchInsert] valueBuckets.boolean :' + JSON.stringify(valueBuckets[i].isStudent));
            batchInsertBucket[i] = {"name":valueBuckets[i].name, "age":valueBuckets[i].age, "isStudent":String(valueBuckets[i].isStudent)}
            vbArr.push({
                "key":"testkey"+num,
                "value": JSON.stringify(batchInsertBucket[i])
            });
            num++;
        }


        console.info('[ttt] [DataShareTest] <<Provider>> [batchInsert] valueBuckets :' + JSON.stringify(batchInsertBucket));
        kvdbStore.putBatch(vbArr, function(err, data) {
            if (err != undefined) {
                console.info("[ttt] [DataShareTest] <<Provider>> [batchInsert kvdb] callback err: " + err);
                if (callback != undefined) {
                    callback(-1, -1);
                }
                return;
            }else{
                if (callback != undefined) {
                    callback(0,1);
                }
            }
            console.info("[ttt] [DataShareTest] <<Provider>> [batchInsert kvdb] callback data:" + JSON.stringify(data));

        });
        console.info('[ttt] [DataShareTest] <<Provider>> [batchInsert] leave');
    }


    openFile(uri: string, mode: string, callback) {
        console.info('[ttt] [DataAbilityTest] <<Provider>> DataAbility openFile in');
        fileIo.open(result, 0o2 | 0o100, 0o666, function(err, fd) {
            if(err) {
                console.info('[ttt] [DataAbilityTest] <<Provider>> OpenFile err = ' + err);
                console.info('[ttt] [DataAbilityTest] <<Provider>> OpenFile err = ' + JSON.stringify(err));
            }
            console.log('[ttt] [DataAbilityTest] <<Provider>> EtsFileIo fd =' + fd);
            let num = fileIo.writeSync(fd, "this is a boring test of DataShare");
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