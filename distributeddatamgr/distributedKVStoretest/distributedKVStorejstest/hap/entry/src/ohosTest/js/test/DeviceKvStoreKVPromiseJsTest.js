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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import factory from '@ohos.data.distributedKVStore'
import dataSharePredicates from '@ohos.data.dataSharePredicates'
import abilityFeatureAbility from '@ohos.ability.featureAbility'

var context = abilityFeatureAbility.getContext();
const KEY_TEST_INT_ELEMENT = 'key_test_int';
const KEY_TEST_FLOAT_ELEMENT = 'key_test_float';
const KEY_TEST_BOOLEAN_ELEMENT = 'key_test_boolean';
const KEY_TEST_STRING_ELEMENT = 'key_test_string';
const KEY_TEST_SYNC_ELEMENT = 'key_test_sync';

const VALUE_TEST_INT_ELEMENT = 123;
const VALUE_TEST_FLOAT_ELEMENT = 321.12;
const VALUE_TEST_BOOLEAN_ELEMENT = true;
const VALUE_TEST_STRING_ELEMENT = 'value-string-001';
const VALUE_TEST_SYNC_ELEMENT = 'value-string-001';

const TEST_BUNDLE_NAME = 'ohos.acts.distributedKvStore';
const TEST_STORE_ID = 'dstoreId';
var kvManager = null;
var kvStore = null;
var localDeviceId = null;
const USED_DEVICE_IDS =  ['A12C1F9261528B21F95778D2FDC0B2E33943E6251AC5487F4473D005758905DB'];
const UNUSED_DEVICE_IDS =  [];  /* add you test device-ids here */
var syncDeviceIds = USED_DEVICE_IDS.concat(UNUSED_DEVICE_IDS);

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

function putBatchString(len, prefix) {
    let entries = [];
    for (var i = 0; i < len; i++) {
        var entry = {
            key : prefix + i,
            value : {
                type : factory.ValueType.STRING,
                value : 'batch_test_string_value'
            }
        }
        entries.push(entry);
    }
    return entries;
}
export default function deviceKvStorePromiseTest(){
describe('deviceKvStorePromiseTest', function () {
    const config = {
        bundleName : TEST_BUNDLE_NAME,
        context: context
    }

    const options = {
        createIfMissing : true,
        encrypt : false,
        backup : false,
        autoSync : true,
        kvStoreType : factory.KVStoreType.DEVICE_COLLABORATION,
        schema : '',
        securityLevel : factory.SecurityLevel.S2,
    }

    beforeAll(async function (done) {
        console.info('beforeAll config:'+ JSON.stringify(config));
        kvManager = factory.createKVManager(config);
        await kvManager.getKVStore(TEST_STORE_ID, options).then((store) => {
            kvStore = store;
            console.info('beforeAll getKVStore for getDeviceId success');
        }).catch((err) => {
            console.error('beforeAll getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        });
        var getDeviceId = new Promise((resolve, reject) => {
            kvStore.on('dataChange', 0, function (data) {
                console.info('beforeAll on data change: ' + JSON.stringify(data));
                resolve(data.deviceId);
            });
            kvStore.put("getDeviceId", "byPut").then((data) => {
                console.info('beforeAll put success');
                expect(data == undefined).assertTrue();
            });
            setTimeout(() => {
                reject(new Error('not resolved in 2 second, reject it.'))
            }, 2000);
        });
        await getDeviceId.then(function(deviceId) {
            console.info('beforeAll getDeviceId ' + JSON.stringify(deviceId));
            localDeviceId = deviceId;
        }).catch((error) => {
            console.error('beforeAll can NOT getDeviceId, fail: ' + `, error code is ${error.code}, message is ${error.message}`);
            expect(null).assertFail();
        });
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore);
        await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
        kvStore = null;
        console.info('beforeAll end');
        done();
    })

    afterAll(async function (done) {
        console.info('afterAll');
        kvManager = null;
        kvStore = null;
        done();
    })

    beforeEach(async function (done) {
        console.info('beforeEach' + JSON.stringify(options));
        await kvManager.getKVStore(TEST_STORE_ID, options).then((store) => {
            kvStore = store;
            console.info('beforeEach getKVStore success');
        }).catch((err) => {
            console.error('beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        });
        console.info('beforeEach end');
        done();
    })

    afterEach(async function (done) {
        console.info('afterEach');
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(async () => {
            console.info('afterEach closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
                console.info('afterEach deleteKVStore success');
            }).catch((err) => {
                console.error('afterEach deleteKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }).catch((err) => {
            console.error('afterEach closeKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        });
        kvStore = null;
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_1300
     * @tc.desc Test Js Api DeviceKvStore.Put(String) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(String) testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0100');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, null).then((data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0100 put success');
                expect(null).assertFail();
            }).catch((error) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0100 put error' + `, error code is ${error.code}, message is ${error.message}`);
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(e.code == 401).assertTrue();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_1400
     * @tc.desc Test Js Api DeviceKvStore.Put(String) testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(String) testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0200');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, '').then((data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0200 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0200 put error' + `, error code is ${error.code}, message is ${error.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_1100
     * @tc.desc Test Js Api DeviceKvStore.Put(String) testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(String) testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0300');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0300 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0300 put error' + `, error code is ${error.code}, message is ${error.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_1200
     * @tc.desc Test Js Api DeviceKvStore.Put(String) testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(String) testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0400');
        try {
            var str = '';
            for (var i = 0 ; i < 4095; i++) {
                str += 'x';
            }
            await kvStore.put(KEY_TEST_STRING_ELEMENT, str).then(async (data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0400 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0400 get success data ' + data);
                    expect(str == data).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0400 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((error) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTSTRING_PROMISE_0400 put error' + `, error code is ${error.code}, message is ${error.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DEVICEKVSTORE_PUTSTRING_PROMISE_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_1700
     * @tc.desc Test Js Api DeviceKvStore.Get(String) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Get(String) testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0100');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then(async (data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0100 get success');
                    expect(VALUE_TEST_STRING_ELEMENT == data).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0100 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((error) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0100 put error' + `, error code is ${error.code}, message is ${error.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_1800
     * @tc.desc Test Js Api DeviceKvStore.Get(String) testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Get(String) testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0200');
        try {
            await kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0200 get success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0200 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETSTRING_PROMISE_0200 get e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_0700
     * @tc.desc Test Js Api DeviceKvStore.Put(Int) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Int) testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0100');
        try {
            await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_0800
     * @tc.desc Test Js Api DeviceKvStore.Put(Int) testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Int) testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0200');
        try {
            var intValue = 987654321;
            await kvStore.put(KEY_TEST_INT_ELEMENT, intValue).then(async (data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0200 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0200 get success');
                    expect(intValue == data).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0200 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0200 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0200 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_0900
     * @tc.desc Test Js Api DeviceKvStore.Put(Int) testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Int) testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0300');
        try {
            var intValue = Number.MAX_VALUE;
            await kvStore.put(KEY_TEST_INT_ELEMENT, intValue).then(async (data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0300 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0300 get success');
                    expect(intValue == data).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0300 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0300 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0300 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_1000
     * @tc.desc Test Js Api DeviceKvStore.Put(Int) testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Int) testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0400');
        try {
            var intValue = Number.MIN_VALUE;
            await kvStore.put(KEY_TEST_INT_ELEMENT, intValue).then(async (data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0400 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0400 get success');
                    expect(intValue == data).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0400 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0400 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTINT_PROMISE_0400 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_1600
     * @tc.desc Test Js Api DeviceKvStore.Get(Int) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Get(Int) testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETINT_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETINT_PROMISE_0100');
        try {
            await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).then(async (data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETINT_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETINT_PROMISE_0100 get success');
                    expect(VALUE_TEST_INT_ELEMENT == data).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETINT_PROMISE_0100 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETINT_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETINT_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_0200
     * @tc.desc Test Js Api DeviceKvStore.Put(Bool) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Bool) testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTBOOLEAN_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBOOLEAN_PROMISE_0100');
        try {
            await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBOOLEAN_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBOOLEAN_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBOOLEAN_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_1500
     * @tc.desc Test Js Api DeviceKvStore.Get(Bool) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Get(Bool) testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETBOOLEAN_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETBOOLEAN_PROMISE_0100');
        try {
            var boolValue = false;
            await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, boolValue).then(async (data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETBOOLEAN_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_BOOLEAN_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETBOOLEAN_PROMISE_0100 get success');
                    expect(boolValue == data).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETBOOLEAN_PROMISE_0100 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETBOOLEAN_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETBOOLEAN_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_0600
     * @tc.desc Test Js Api DeviceKvStore.Put(Float) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Float) testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTFLOAT_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTFLOAT_PROMISE_0100');
        try {
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTFLOAT_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTFLOAT_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTFLOAT_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_0500
     * @tc.desc Test Js Api DeviceKvStore.Get(Float) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Get(Float) testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0100');
        try {
            var floatValue = 123456.654321;
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue).then(async (data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0100 get success');
                    expect(floatValue == data).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0100 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_0300
     * @tc.desc Test Js Api DeviceKvStore.Get(Float) testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Get(Float) testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0200');
        try {
            var floatValue = 123456.0;
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue).then(async (data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0200 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0200 get success');
                    expect(floatValue == data).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0200 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0200 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0200 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_0400
     * @tc.desc Test Js Api DeviceKvStore.Get(Float) testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Get(Float) testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0300');
        try {
            var floatValue = 123456.00;
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue).then(async (data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0300 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0300 get success');
                    expect(floatValue == data).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0300 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0300 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETFLOAT_PROMISE_0300 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_6400
     * @tc.desc Test Js Api DeviceKvStore.DeleteString() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.DeleteString() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0100');
        try {
            var str = 'this is a test string';
            await kvStore.put(KEY_TEST_STRING_ELEMENT, str).then(async (data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_STRING_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0100 delete success');
                    expect(data == undefined).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0100 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_6500
     * @tc.desc Test Js Api DeviceKvStore.DeleteString() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.DeleteString() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0200');
        try {
            var str = '';
            for (var i = 0 ; i < 4096; i++) {
                str += 'x';
            }
            await kvStore.put(KEY_TEST_STRING_ELEMENT, str).then(async (data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0200 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_STRING_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0200 delete success');
                    expect(data == undefined).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0200 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0200 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0200 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_8300
     * @tc.desc Test Js Api DeviceKvStore.DeleteString() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.DeleteString() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0300');
        try {
            await kvStore.delete(KEY_TEST_STRING_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0300 delete success');
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0300 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETESTRING_PROMISE_0300 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_6300
     * @tc.desc Test Js Api DeviceKvStore.DeleteInt() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.DeleteInt() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_DELETEINT_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEINT_PROMISE_0100');
        try {
            await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).then(async (data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEINT_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_INT_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEINT_PROMISE_0100 delete success');
                    expect(data == undefined).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEINT_PROMISE_0100 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEINT_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEINT_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_6200
     * @tc.desc Test Js Api DeviceKvStore.DeleteFloat() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.DeleteFloat() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_DELETEFLOAT_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEFLOAT_PROMISE_0100');
        try {
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then(async (data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEFLOAT_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_FLOAT_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEFLOAT_PROMISE_0100 delete success');
                    expect(data == undefined).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEFLOAT_PROMISE_0100 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEFLOAT_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEFLOAT_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_6100
     * @tc.desc Test Js Api DeviceKvStore.DeleteBool() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.DeleteBool() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBOOLEAN_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBOOLEAN_PROMISE_0100');
        try {
            await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT).then(async (data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBOOLEAN_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_BOOLEAN_ELEMENT).then((data) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBOOLEAN_PROMISE_0100 delete success');
                    expect(data == undefined).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBOOLEAN_PROMISE_0100 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBOOLEAN_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        } catch (e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBOOLEAN_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_1900
     * @tc.desc Test Js Api DeviceKvStore.OnChange() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.OnChange() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        try {
            kvStore.on('dataChange', 0, function (data) {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0100 0' + JSON.stringify(data))
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0100 put fail ' + `, error code is ${error.code}, message is ${error.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_2100
     * @tc.desc Test Js Api DeviceKvStore.OnChange() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.OnChange() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        try {
            kvStore.on('dataChange', 1, function (data) {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0200 0' + JSON.stringify(data))
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0200 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0200 put fail ' + `, error code is ${error.code}, message is ${error.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0200 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_2000
     * @tc.desc Test Js Api DeviceKvStore.OnChange() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.OnChange() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        try {
            kvStore.on('dataChange', 2, function (data) {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0300 0' + JSON.stringify(data))
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0300 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0300 put fail ' + `, error code is ${error.code}, message is ${error.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONCHANGE_PROMISE_0300 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_3300
     * @tc.desc Test Js Api DeviceKvStore.OnSyncComplete() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.OnSyncComplete() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        try {
            kvStore.on('syncComplete', function (data) {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100 0' + data)
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_SYNC_ELEMENT, VALUE_TEST_SYNC_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100 put failed:' + `, error code is ${e.code}, message is ${e.message}`);
                expect(null).assertFail();
            });
            try {
                var mode = factory.SyncMode.PULL_ONLY;
                console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
                kvStore.sync(syncDeviceIds, mode);
            } catch (e) {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100 sync no peer device :e:' + `, error code is ${e.code}, message is ${e.message}`);
            }
        } catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_3500
     * @tc.desc Test Js Api DeviceKvStore.OnSyncComplete() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.OnSyncComplete() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        try {
            kvStore.on('syncComplete', function (data) {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200 0' + data)
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_SYNC_ELEMENT, VALUE_TEST_SYNC_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200 put failed:' + `, error code is ${e.code}, message is ${e.message}`);
                expect(null).assertFail();
            });
            try {
                var mode = factory.SyncMode.PUSH_ONLY;
                console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
                kvStore.sync(syncDeviceIds, mode);
            } catch(error) {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200 no peer device :e:' + `, error code is ${error.code}, message is ${error.message}`);
            }
        } catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0200 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_3400
     * @tc.desc Test Js Api DeviceKvStore.OnSyncComplete() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.OnSyncComplete() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        try {
            kvStore.on('syncComplete', function (data) {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300 0' + data)
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_SYNC_ELEMENT, VALUE_TEST_SYNC_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300 put failed:' + `, error code is ${e.code}, message is ${e.message}`);
                expect(null).assertFail();
            });
            try {
                var mode = factory.SyncMode.PUSH_PULL;
                console.info('kvStore.sync to ' + JSON.stringify(syncDeviceIds));
                kvStore.sync(syncDeviceIds, mode);
            } catch(error) {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300 no peer device :e:' + `, error code is ${error.code}, message is ${error.message}`);
            }
        } catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_ONSYNCCOMPLETE_PROMISE_0300 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_5700
     * @tc.desc Test Js Api DeviceKvStore.OffChange() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.OffChange() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0100');
        try {
            var func = function (data) {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0100 0' + data)
            };
            kvStore.on('dataChange', 0, func);
            kvStore.off('dataChange', func);
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_5300
     * @tc.desc Test Js Api DeviceKvStore.OffChange() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.OffChange() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0200');
        try {
            var func = function (data) {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0200 0' + data)
            };
            var func1 = function (data) {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0200 0' + data)
            };
            kvStore.on('dataChange', 0, func);
            kvStore.on('dataChange', 0, func1);
            kvStore.off('dataChange', func);
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_5500
     * @tc.desc Test Js Api DeviceKvStore.OffChange() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.OffChange() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0300');
        try {
            var func = function (data) {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0300 0' + data)
            };
            var func1 = function (data) {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0300 0' + data)
            };
            kvStore.on('dataChange', 0, func);
            kvStore.on('dataChange', 0, func1);
            kvStore.off('dataChange', func);
            kvStore.off('dataChange', func1);
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_5800
     * @tc.desc Test Js Api DeviceKvStore.OffChange() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.OffChange() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0400');
        try {
            var func = function (data) {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0400 0' + data)
            };
            kvStore.on('dataChange', 0, func);
            kvStore.off('dataChange');
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_OFFCHANGE_PROMISE_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_5900
     * @tc.desc Test Js Api DeviceKvStore.OffSyncComplete() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.OffSyncComplete() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0100');
        try {
            var func = function (data) {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0100 0' + data)
            };
            kvStore.on('syncComplete', func);
            kvStore.off('syncComplete', func);
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0100 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_5400
     * @tc.desc Test Js Api DeviceKvStore.OffSyncComplete() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.OffSyncComplete() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0200');
        try {
            var func = function (data) {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0200 0' + data)
            };
            var func1 = function (data) {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0200 0' + data)
            };
            kvStore.on('syncComplete', func);
            kvStore.on('syncComplete', func1);
            kvStore.off('syncComplete', func);
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0200 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_5600
     * @tc.desc Test Js Api DeviceKvStore.OffSyncComplete() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.OffSyncComplete() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0300');
        try {
            var func = function (data) {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0300 0' + data)
            };
            var func1 = function (data) {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0300 0' + data)
            };
            kvStore.on('syncComplete', func);
            kvStore.on('syncComplete', func1);
            kvStore.off('syncComplete', func);
            kvStore.off('syncComplete', func1);
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0300 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_6000
     * @tc.desc Test Js Api DeviceKvStore.OffSyncComplete() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.OffSyncComplete() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0400');
        try {
            var func = function (data) {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0400 0' + data)
            };
            kvStore.on('syncComplete', func);
            kvStore.off('syncComplete');
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_OFFSYNCCOMPLETE_PROMISE_0400 put e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_7600
     * @tc.desc Test Js Api DeviceKvStore.SetSyncRange() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.SetSyncRange() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0100');
        try {
            var localLabels = ['A', 'B'];
            var remoteSupportLabels = ['C', 'D'];
            await kvStore.setSyncRange(localLabels, remoteSupportLabels).then((err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0100 setSyncRange success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0100 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_7500
     * @tc.desc Test Js Api DeviceKvStore.SetSyncRange() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.SetSyncRange() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0200');
        try {
            var localLabels = ['A', 'B'];
            var remoteSupportLabels = ['B', 'C'];
            await kvStore.setSyncRange(localLabels, remoteSupportLabels).then((err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0200 setSyncRange success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0200 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_7400
     * @tc.desc Test Js Api DeviceKvStore.SetSyncRange() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.SetSyncRange() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0300');
        try {
            var localLabels = ['A', 'B'];
            var remoteSupportLabels = ['A', 'B'];
            await kvStore.setSyncRange(localLabels, remoteSupportLabels).then((err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0300 setSyncRange success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0300 delete fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_SETSYNCRANGE_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_4500
     * @tc.desc Test Js Api DeviceKvStore.Put(Batch) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Batch) testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100');
        try {
            let entries = putBatchString(10, 'batch_test_string_key');
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_string_key').then((entrys) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 getEntries success');
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 entrys.length: ' + entrys.length);
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 entrys[0]: ' + JSON.stringify(entrys[0]));
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 entrys[0].value: ' + JSON.stringify(entrys[0].value));
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 entrys[0].value.value: ' + entrys[0].value.value);
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 'batch_test_string_value').assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_4400
     * @tc.desc Test Js Api DeviceKvStore.Put(Batch) testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Batch) testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0200');
        try {
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_number_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.INTEGER,
                        value : 222
                    }
                }
                entries.push(entry);
            }
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0200 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0200 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_number_key').then((entrys) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0200 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 222).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0200 getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0200 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_4300
     * @tc.desc Test Js Api DeviceKvStore.Put(Batch) testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Batch) testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0300');
        try {
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_number_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.FLOAT,
                        value : 2.0
                    }
                }
                entries.push(entry);
            }
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0300 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0300 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_number_key').then((entrys) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0300 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 2.0).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0300 getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0300 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_4200
     * @tc.desc Test Js Api DeviceKvStore.Put(Batch) testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Batch) testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0400');
        try {
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_number_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.DOUBLE,
                        value : 2.00
                    }
                }
                entries.push(entry);
            }
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0400 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0400 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_number_key').then((entrys) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0400 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 2.00).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0400 getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0400 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_4100
     * @tc.desc Test Js Api DeviceKvStore.Put(Batch) testcase 005
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Batch) testcase 005
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0500');
        try {
            var bo = false;
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_bool_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.BOOLEAN,
                        value : bo
                    }
                }
                entries.push(entry);
            }
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0500 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0500 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_bool_key').then((entrys) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0500 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == bo).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0500 getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0500 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0500 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_4600
     * @tc.desc Test Js Api DeviceKvStore.Put(Batch) testcase 006
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Put(Batch) testcase 006
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0600');
        try {
            var arr = new Uint8Array([21,31]);
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_bool_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.BYTE_ARRAY,
                        value : arr
                    }
                }
                entries.push(entry);
            }
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0600 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0600 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_bool_key').then((entrys) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0600 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0600 getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0600 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0600 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_5200
     * @tc.desc Test Js Api DeviceKvStore.DeleteBatch() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.DeleteBatch() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0100');
        try {
            let entries = [];
            let keys = [];
            for (var i = 0; i < 5; i++) {
                var key = 'batch_test_string_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.STRING,
                        value : 'batch_test_string_value'
                    }
                }
                entries.push(entry);
                keys.push(key + i);
            }
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0100 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0100 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.deleteBatch(keys).then((err) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0100 deleteBatch success');
                    expect(err == undefined).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0100 deleteBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0100 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_5000
     * @tc.desc Test Js Api DeviceKvStore.DeleteBatch() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.DeleteBatch() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0200');
        try {
            let keys = ['batch_test_string_key1', 'batch_test_string_key2'];
            await kvStore.deleteBatch(keys).then((err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0200 deleteBatch success');
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0200 deleteBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_5100
     * @tc.desc Test Js Api DeviceKvStore.DeleteBatch() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.DeleteBatch() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0300');
        try {
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_string_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.STRING,
                        value : 'batch_test_string_value'
                    }
                }
                entries.push(entry);
            }
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0300 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0300 putBatch success');
                expect(err == undefined).assertTrue();
                let keys = ['batch_test_string_key1', 'batch_test_string_keya'];
                await kvStore.deleteBatch(keys).then((err) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0300 deleteBatch success');
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0300 deleteBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0300 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_DELETEBATCH_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_4000
     * @tc.desc Test Js Api DeviceKvStore.startTransaction() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.startTransaction() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100');
        try {
            var count = 0;
            kvStore.on('dataChange', 0, function (data) {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100' + JSON.stringify(data))
                count++;
            });
            await kvStore.startTransaction().then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100 startTransaction success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100 startTransaction fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            let entries = putBatchString(10, 'batch_test_string_key');
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            let keys = Object.keys(entries).slice(5);
            await kvStore.deleteBatch(keys).then((err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100 deleteBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100 deleteBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            await kvStore.commit().then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100 commit success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100 commit fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            await sleep(500);
            expect(count == 1).assertTrue();
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_3900
     * @tc.desc Test Js Api DeviceKvStore.startTransaction() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.startTransaction() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200');
        try {
            var count = 0;
            kvStore.on('dataChange', 0, function (data) {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200' + JSON.stringify(data))
                count++;
            });
            await kvStore.startTransaction().then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200 startTransaction success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200 startTransaction fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            let entries = putBatchString(10, 'batch_test_string_key');
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            let keys = Object.keys(entries).slice(5);
            await kvStore.deleteBatch(keys).then((err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200 deleteBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200 deleteBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            await kvStore.rollback().then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200 rollback success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200 rollback fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            await sleep(500);
            expect(count == 0).assertTrue();
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_3700
     * @tc.desc Test Js Api DeviceKvStore.startTransaction() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.startTransaction() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0200');
        try {
            await kvStore.startTransaction(1).then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0300 startTransaction success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0300 startTransaction fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_3800
     * @tc.desc Test Js Api DeviceKvStore.startTransaction() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.startTransaction() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0400');
        try {
            await kvStore.startTransaction('test_string').then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0400 startTransaction success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0400 startTransaction fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_3600
     * @tc.desc Test Js Api DeviceKvStore.startTransaction() testcase 005
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.startTransaction() testcase 005
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0500');
        try {
            await kvStore.startTransaction(2.000).then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0500 startTransaction success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0500 startTransaction fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_STARTTRANSACTION_PROMISE_0500 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_8100
     * @tc.desc Test Js Api DeviceKvStore.Commit() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Commit() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_COMMIT_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_COMMIT_PROMISE_0100');
        try {
            await kvStore.commit(1).then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_COMMIT_PROMISE_0100 commit success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_COMMIT_PROMISE_0100 commit fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_COMMIT_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_8200
     * @tc.desc Test Js Api DeviceKvStore.Commit() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Commit() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_COMMIT_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_COMMIT_PROMISE_0200');
        try {
            await kvStore.commit('test_string').then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_COMMIT_PROMISE_0200 commit success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_COMMIT_PROMISE_0200 commit fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_COMMIT_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_8000
     * @tc.desc Test Js Api DeviceKvStore.Commit() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Commit() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_COMMIT_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_COMMIT_PROMISE_0300');
        try {
            await kvStore.commit(2.000).then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_COMMIT_PROMISE_0300 commit success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_COMMIT_PROMISE_0300 commit fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_COMMIT_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_7800
     * @tc.desc Test Js Api DeviceKvStore.Rollback() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Rollback() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_ROOLBACK_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_ROOLBACK_PROMISE_0100');
        try {
            await kvStore.rollback(1).then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_ROOLBACK_PROMISE_0100 rollback success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_ROOLBACK_PROMISE_0100 rollback fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_ROOLBACK_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_7900
     * @tc.desc Test Js Api DeviceKvStore.Rollback() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Rollback() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_ROOLBACK_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_ROOLBACK_PROMISE_0200');
        try {
            await kvStore.rollback('test_string').then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_ROOLBACK_PROMISE_0200 rollback success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_ROOLBACK_PROMISE_0200 rollback fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_ROOLBACK_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_7700
     * @tc.desc Test Js Api DeviceKvStore.Rollback() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Rollback() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_ROOLBACK_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_ROOLBACK_PROMISE_0300');
        try {
            await kvStore.rollback(2.000).then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_ROOLBACK_PROMISE_0300 rollback success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_ROOLBACK_PROMISE_0300 rollback fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_ROOLBACK_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_7100
     * @tc.desc Test Js Api DeviceKvStore.EnableSync() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.EnableSync() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0100');
        try {
            await kvStore.enableSync(true).then((err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0100 enableSync success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0100 enableSync fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_7000
     * @tc.desc Test Js Api DeviceKvStore.EnableSync() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.EnableSync() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0200');
        try {
            await kvStore.enableSync(false).then((err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0200 enableSync success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0200 enableSync fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_7200
     * @tc.desc Test Js Api DeviceKvStore.EnableSync() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.EnableSync() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0300');
        try {
            await kvStore.enableSync().then((err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0300 enableSync success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0300 enableSync fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_7300
     * @tc.desc Test Js Api DeviceKvStore.EnableSync() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.EnableSync() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0400');
        try {
            await kvStore.enableSync(null).then((err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0400 enableSync success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0400 enableSync fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_ENABLESYNC_PROMISE_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_6700
     * @tc.desc Test Js Api DeviceKvStore.RemoveDeviceData() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.RemoveDeviceData() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then((err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 put success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 put fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            var deviceid = 'no_exist_device_id';
            await kvStore.removeDeviceData(deviceid).then((err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 removeDeviceData success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 removeDeviceData fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
            await kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT).then((data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 get success data:' + data);
                expect(data == VALUE_TEST_STRING_ELEMENT).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 get fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_6600
     * @tc.desc Test Js Api DeviceKvStore.RemoveDeviceData() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.RemoveDeviceData() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0200');
        try {
            await kvStore.removeDeviceData().then((err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0200 removeDeviceData success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0200 removeDeviceData fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_6900
     * @tc.desc Test Js Api DeviceKvStore.RemoveDeviceData() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.RemoveDeviceData() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
     it('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0300');
        try {
            await kvStore.removeDeviceData('').then((data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0300 removeDeviceData success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0300 removeDeviceData fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_6800
     * @tc.desc Test Js Api DeviceKvStore.RemoveDeviceData() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.RemoveDeviceData() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0400');
        try {
            await kvStore.removeDeviceData(null).then((data) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0400 removeDeviceData success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0400 removeDeviceData fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_REMOVEDEVICEDATA_PROMISE_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_2600
     * @tc.desc Test Js Api DeviceKvStore.getResultSet() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.getResultSet() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0100');
        try {
            let resultSet;
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_string_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.STRING,
                        value : 'batch_test_string_value'
                    }
                }
                entries.push(entry);
            }
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0100 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            await kvStore.getResultSet(localDeviceId, 'batch_test_string_key').then((result) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0100 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 10).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0100 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0100 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0100 closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_0100
     * @tc.desc Test Js Api DeviceKvStore.getResultSet() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.getResultSet() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0200');
        try {
            let resultSet;
            await kvStore.getResultSet(localDeviceId, 'batch_test_string_key').then((result) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0200 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 0).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0200 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0200 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0200 closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_3000
     * @tc.desc Test Js Api DeviceKvStore.getResultSet() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.getResultSet() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0300');
        try {
            let resultSet;
            await kvStore.getResultSet().then((result) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0300 getResultSet success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0300 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(e.code == 401).assertTrue();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_3100
     * @tc.desc Test Js Api DeviceKvStore.getResultSet() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.getResultSet() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0400');
        try {
            let resultSet;
            await kvStore.getResultSet('test_key_string', 123).then((result) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0400 getResultSet success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0400 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(e.code == 401).assertTrue();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_2800
     * @tc.desc Test Js Api DeviceKvStore.getResultSet() testcase 005
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.getResultSet() testcase 005
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0500');
        try {
            let resultSet;
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_string_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.STRING,
                        value : 'batch_test_string_value'
                    }
                }
                entries.push(entry);
            }
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0500 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            var query = new factory.Query();
            query.prefixKey("batch_test");
            await kvStore.getResultSet(localDeviceId, query).then((result) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0500 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 10).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0500 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            query.deviceId(localDeviceId);
            console.info("testDeviceKvStoreGetResultSet005 " + query.getSqlLike());
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0500 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0500 closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0500 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_2700
     * @tc.desc Test Js Api DeviceKvStore.getResultSet() testcase 006
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.getResultSet() testcase 006
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0600');
        try {
            let resultSet;
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_string_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.STRING,
                        value : 'batch_test_string_value'
                    }
                }
                entries.push(entry);
            }
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0600 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            var query = new factory.Query();
            query.deviceId(localDeviceId);
            query.prefixKey("batch_test");
            console.info("testDeviceKvStoreGetResultSet006 " + query.getSqlLike());
            await kvStore.getResultSet(query).then((result) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0600 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 10).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0600 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0600 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0600 closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0600 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_2900
     * @tc.desc Test Js Api DeviceKvStore.GetResultSet() testcase 007
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.getResultSet() testcase 007
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0700');
        try {
            let resultSet;
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_string_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.STRING,
                        value : 'batch_test_string_value'
                    }
                }
                entries.push(entry);
            }
            await kvStore.putBatch(entries).then( async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0700 putBatch success');
                expect(err == undefined).assertTrue();
                let query = new factory.Query();
                query.prefixKey("batch_test");
                await kvStore.getResultSet(localDeviceId, query).then( async (result) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0700 getResultSet success');
                    resultSet = result;
                    expect(resultSet.getCount() == 10).assertTrue();
                    await kvStore.closeResultSet(resultSet).then(err => {
                        console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0700 closeResultSet success');
                        expect(err == undefined).assertTrue();
                        done();
                    })
                });
            });
        } catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSET_PROMISE_0700 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
        }
    })  

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_2400
     * @tc.desc Test Js Api DeviceKvStore.CloseResultSet() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.CloseResultSet() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0100');
        try {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0100 success');
            let resultSet = null;
            await kvStore.closeResultSet(resultSet).then(() => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0100 closeResultSet success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0100 closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(e.code == 401).assertTrue();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_2200
     * @tc.desc Test Js Api DeviceKvStore.CloseResultSet() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.CloseResultSet() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0200');
        try {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0200 success');
            let resultSet = null;
            await kvStore.getResultSet(localDeviceId, 'batch_test_string_key').then((result) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0200 getResultSet success');
                resultSet = result;
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0200 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0200 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0200 closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_2300
     * @tc.desc Test Js Api DeviceKvStore.CloseResultSet() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.CloseResultSet() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0300');
        try {
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0300 success');
            let resultSet = null;
            await kvStore.closeResultSet().then(() => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0300 closeResultSet success');
                expect(null).assertFail();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0300 closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0300 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(e.code == 401).assertTrue();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_2500
     * @tc.desc Test Js Api DeviceKvStore.CloseResultSet() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.CloseResultSet() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0400');
        let errorInfo = undefined;
        try {
            await kvStore.closeResultSet(1).then(() => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0400 success(promise)')
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0400 e ')
            })
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0400 success');
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_CLOSERESULTSET_PROMISE_0400 e ' + `, error code is ${e.code}, message is ${e.message}`);
            errorInfo = e
            expect(e.code).assertEqual(401);
        }
        expect(errorInfo != undefined).assertTrue();
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_3200
     * @tc.desc Test Js Api DeviceKvStore.Get(ResultSize) testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Get(ResultSize) testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0100');
        try {
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_string_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.STRING,
                        value : 'batch_test_string_value'
                    }
                }
                entries.push(entry);
            }
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0100 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_PUTBATCH_PROMISE_0100 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            var query = new factory.Query();
            query.prefixKey("batch_test");
            query.deviceId(localDeviceId);
            await kvStore.getResultSize(query).then((resultSize) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0100 getResultSet success');
                expect(resultSize == 10).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0100 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_4700
     * @tc.desc Test Js Api DeviceKvStore.Get(ResultSize) testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.Get(ResultSize) testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0200');
        try {
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_string_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.STRING,
                        value : 'batch_test_string_value'
                    }
                }
                entries.push(entry);
            }
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0200 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0200 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            var query = new factory.Query();
            query.prefixKey("batch_test");
            await kvStore.getResultSize(localDeviceId, query).then((resultSize) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0200 getResultSet success');
                expect(resultSize == 10).assertTrue();
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0200 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETRESULTSIZE_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_4900
     * @tc.desc Test Js Api DeviceKvStore.GetEntries() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.GetEntries() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0100');
        try {
            var arr = new Uint8Array([21,31]);
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_bool_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.BYTE_ARRAY,
                        value : arr
                    }
                }
                entries.push(entry);
            }
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0100 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0100 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.deviceId(localDeviceId);
                query.prefixKey("batch_test");
                await kvStore.getEntries(localDeviceId, query).then((entrys) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0100 getEntries success');
                    console.info(entrys.length);
                    console.info(entrys[0].value.value.toString());
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0100 getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0100 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0100 success');
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0100 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DeviceKVPromiseJsApiTest_4800
     * @tc.desc Test Js Api DeviceKvStore.GetEntries() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api DeviceKvStore.GetEntries() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0200');
        try {
            var arr = new Uint8Array([21,31]);
            let entries = [];
            for (var i = 0; i < 10; i++) {
                var key = 'batch_test_bool_key';
                var entry = {
                    key : key + i,
                    value : {
                        type : factory.ValueType.BYTE_ARRAY,
                        value : arr
                    }
                }
                entries.push(entry);
            }
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0200 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0200 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.prefixKey("batch_test");
                query.deviceId(localDeviceId);
                await kvStore.getEntries(query).then((entrys) => {
                    console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0200 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
                }).catch((err) => {
                    console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0200 getEntries fail ' + `, error code is ${err.code}, message is ${err.message}`);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0200 putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
                expect(null).assertFail();
            });
            console.info('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0200 success');
        }catch(e) {
            console.error('SUB_DDM_DKV_DEVICEKVSTORE_GETENTRIES_PROMISE_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
        }
        done();
    })
})
}