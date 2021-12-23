/*
* Copyright (c) 2021 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
import factory from '@ohos.data.distributedData'

const KEY_TEST_INT_ELEMENT = 'key_test_int_2';
const KEY_TEST_FLOAT_ELEMENT = 'key_test_float_2';
const KEY_TEST_BOOLEAN_ELEMENT = 'key_test_boolean_2';
const KEY_TEST_STRING_ELEMENT = 'key_test_string_2';
const KEY_TEST_SYNC_ELEMENT = 'key_test_sync';

const VALUE_TEST_INT_ELEMENT = 1234;
const VALUE_TEST_FLOAT_ELEMENT = 4321.12;
const VALUE_TEST_BOOLEAN_ELEMENT = true;
const VALUE_TEST_STRING_ELEMENT = 'value-string-002';
const VALUE_TEST_SYNC_ELEMENT = 'value-string-001';

const TEST_BUNDLE_NAME = 'ohos.acts.distributeddatamgr';
const TEST_STORE_ID = 'storeId';
var kvManager = null;
var kvStore = null;
var localDeviceId = null;

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

describe('DeviceKvStoreCallbackTest', function () {
    const config = {
        bundleName : TEST_BUNDLE_NAME,
        userInfo : {
            userId : '0',
            userType : factory.UserType.SAME_USER_ID
        }
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
        console.log('beforeAll config:'+ JSON.stringify(config));
        await factory.createKVManager(config).then((manager) => {
            kvManager = manager;
            console.log('beforeAll createKVManager success');
        }).catch((err) => {
            console.log('beforeAll createKVManager err ' + err);
        });
        // get localDeviceId  - put, get deviceId on dataChange()..
        await kvManager.getKVStore(TEST_STORE_ID, options).then((store) => {
            kvStore = store;
            console.log('beforeAll getKVStore success');
        }).catch((err) => {
            console.log('beforeAll getKVStore err ' + err);
        });
        kvStore.on('dataChange', 0, function (data) {
            console.log('beforeAll on ' + JSON.stringify(data))
            localDeviceId = data.deviceId;
            expect(localDeviceId != null).assertTrue();
        });
        await kvStore.put("getDeviceId", "byPut");
        console.log('beforeAll end');
        done();
    })

    afterAll(async function (done) {
        console.log('afterAll');
        kvManager = null;
        kvStore = null;
        done();
    })

    beforeEach(async function (done) {
        console.log('beforeEach' + JSON.stringify(options));
        await kvManager.getKVStore(TEST_STORE_ID, options, function (err, store) {
            kvStore = store;
            console.log('beforeEach getKVStore success');
            done();
        });
    })

    afterEach(async function (done) {
        console.log('afterEach');
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function (err, data) {
            console.log('afterEach closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
                console.log('afterEach deleteKVStore success');
                done();
            });
        });
    })

    it('testDeviceKvStorePutString101', 0, async function (done) {
        console.log('testDeviceKvStorePutString101');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStorePutString101 put success');
                } else {
                    console.log('testDeviceKvStorePutString101 put fail' + err);
                    expect(null).assertFail();
                }
                done();
            });
        }catch (e) {
            console.log('testDeviceKvStorePutString101 put e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStorePutString102', 0, async function (done) {
        console.log('testDeviceKvStorePutString102');
        try {
            var str = '';
            for (var i = 0 ; i < 4095; i++) {
                str += 'x';
            }
            await kvStore.put(KEY_TEST_STRING_ELEMENT+'102', str, async function (err,data) {
                console.log('testDeviceKvStorePutString102 put success');
                expect(err == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT+'102', function (err,data) {
                    console.log('testDeviceKvStorePutString102 get success');
                    expect(str == data).assertTrue();
                    done();
                });
            });
        }catch (e) {
            console.log('testDeviceKvStorePutString102 put e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreGetString101', 0, async function (done) {
        console.log('testDeviceKvStoreGetString101');
        try{
            await kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT, function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStoreGetString101 get success');
                    expect(null).assertFail();
                } else {
                    console.log('testDeviceKvStoreGetString101 get fail');
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreGetString101 get e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreGetString102', 0, async function (done) {
        console.log('testDeviceKvStoreGetString102');
        try{
            await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, async function (err,data) {
                console.log('testDeviceKvStoreGetString102 put success');
                expect(err == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT, function (err,data) {
                    console.log('testDeviceKvStoreGetString102 get success');
                    expect((err == undefined) && (VALUE_TEST_STRING_ELEMENT == data)).assertTrue();
                    done();
                });
            })
        }catch(e) {
            console.log('testDeviceKvStoreGetString102 get e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStorePutInt101', 0, async function (done) {
        console.log('testDeviceKvStorePutInt101');
        try {
            await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT, async function (err,data) {
                console.log('testDeviceKvStorePutInt101 put success');
                expect(err == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT, function (err,data) {
                    console.log('testDeviceKvStorePutInt101 get success');
                    expect((err == undefined) && (VALUE_TEST_INT_ELEMENT == data)).assertTrue();
                    done();
                })
            });
        }catch(e) {
            console.log('testDeviceKvStorePutInt101 put e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStorePutInt102', 0, async function (done) {
        console.log('testDeviceKvStorePutInt102');
        try {
            var intValue = 987654321;
            await kvStore.put(KEY_TEST_INT_ELEMENT, intValue, async function (err,data) {
                console.log('testDeviceKvStorePutInt102 put success');
                expect(err == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT, function (err,data) {
                    console.log('testDeviceKvStorePutInt102 get success');
                    expect((err == undefined) && (intValue == data)).assertTrue();
                    done();
                })
            });
        }catch(e) {
            console.log('testDeviceKvStorePutInt102 put e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStorePutInt103', 0, async function (done) {
        console.log('testDeviceKvStorePutInt103');
        try {
            var intValue = Number.MIN_VALUE;
            await kvStore.put(KEY_TEST_INT_ELEMENT, intValue, async function (err,data) {
                console.log('testDeviceKvStorePutInt103 put success');
                expect(err == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT, function (err,data) {
                    console.log('testDeviceKvStorePutInt103 get success');
                    expect((err == undefined) && (intValue == data)).assertTrue();
                    done();
                })
            });
        }catch(e) {
            console.log('testDeviceKvStorePutInt103 put e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStorePutInt104', 0, async function (done) {
        console.log('testDeviceKvStorePutInt104');
        try {
            var intValue = Number.MAX_VALUE;
            await kvStore.put(KEY_TEST_INT_ELEMENT, intValue, async function (err,data) {
                console.log('testDeviceKvStorePutInt104 put success');
                expect(err == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT, function (err,data) {
                    console.log('testDeviceKvStorePutInt104 get success');
                    expect((err == undefined) && (intValue == data)).assertTrue();
                    done();
                })
            });
        }catch(e) {
            console.log('testDeviceKvStorePutInt104 put e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreGetInt101', 0, async function (done) {
        console.log('testDeviceKvStoreGetInt101');
        try {
            await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT, async function (err,data) {
                console.log('testDeviceKvStoreGetInt101 put success');
                expect(err == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT, function (err,data) {
                    console.log('testDeviceKvStoreGetInt101 get success');
                    expect((err == undefined) && (VALUE_TEST_INT_ELEMENT == data)).assertTrue();
                    done();
                })
            });
        }catch(e) {
            console.log('testDeviceKvStoreGetInt101 put e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreGetInt102', 0, async function (done) {
        console.log('testDeviceKvStoreGetInt102');
        try {
            await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT, function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStoreGetInt102 get success');
                    expect(null).assertFail();
                } else {
                    console.log('testDeviceKvStoreGetInt102 get fail');
                }
                done();
            })
        }catch(e) {
            console.log('testDeviceKvStoreGetInt102 put e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStorePutBool101', 0, async function (done) {
        console.log('testDeviceKvStorePutBool101');
        try {
            await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT, function (err,data) {
                console.log('testDeviceKvStorePutBool101 put success');
                expect(err == undefined).assertTrue();
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStorePutBool101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreGetBool101', 0, async function (done) {
        console.log('testDeviceKvStoreGetBool101');
        try {
            await kvStore.get(localDeviceId, KEY_TEST_BOOLEAN_ELEMENT, function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStoreGetBool101 get success');
                    expect(null).assertFail();
                } else {
                    console.log('testDeviceKvStoreGetBool101 get fail' + err);
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreGetBool101 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreGetBool102', 0, async function (done) {
        console.log('testDeviceKvStoreGetBool102');
        try {
            await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT, async function (err, data) {
                console.log('testDeviceKvStoreGetBool102 put success');
                expect(err == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_BOOLEAN_ELEMENT, function (err,data) {
                    console.log('testDeviceKvStoreGetBool102 get success');
                    expect((err == undefined) && (VALUE_TEST_BOOLEAN_ELEMENT == data)).assertTrue();
                    done();
                });
            })
        }catch(e) {
            console.log('testDeviceKvStoreGetBool102 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStorePutFloat101', 0, async function (done) {
        console.log('testDeviceKvStorePutFloat101');
        try {
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, function (err,data) {
                console.log('testDeviceKvStorePutFloat101 put success');
                expect(err == undefined).assertTrue();
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStorePutFloat101 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStorePutFloat102', 0, async function (done) {
        console.log('testDeviceKvStorePutFloat102');
        try {
            var floatValue = 123456.654321;
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue, async function (err,data) {
                console.log('testDeviceKvStorePutFloat102 put success');
                expect(err == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT, function (err, data) {
                    console.log('testDeviceKvStorePutFloat102 get success');
                    expect((err == undefined) && (floatValue == data)).assertTrue();
                    done();
                })
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStorePutFloat102 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStorePutFloat103', 0, async function (done) {
        console.log('testDeviceKvStorePutFloat103');
        try {
            var floatValue = 123456.0;
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue, async function (err,data) {
                console.log('testDeviceKvStorePutFloat103 put success');
                expect(err == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT, function (err, data) {
                    console.log('testDeviceKvStorePutFloat103 get success');
                    expect((err == undefined) && (floatValue == data)).assertTrue();
                    done();
                })
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStorePutFloat103 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStorePutFloat104', 0, async function (done) {
        console.log('testDeviceKvStorePutFloat104');
        try {
            var floatValue = 123456.00;
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue, async function (err,data) {
                console.log('testDeviceKvStorePutFloat104 put success');
                expect(err == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT, function (err, data) {
                    console.log('testDeviceKvStorePutFloat104 get success');
                    expect((err == undefined) && (floatValue == data)).assertTrue();
                    done();
                })
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStorePutFloat104 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreGetFloat101', 0, async function (done) {
        console.log('testDeviceKvStoreGetFloat101');
        try {
            await kvStore.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT, function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStoreGetFloat101 get success');
                    expect(null).assertFail();
                } else {
                    console.log('testDeviceKvStoreGetFloat101 get fail' + err);
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreGetFloat101 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreDeleteString101', 0, async function (done) {
        console.log('testDeviceKvStoreDeleteString101');
        try {
            await kvStore.delete(KEY_TEST_STRING_ELEMENT, function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStoreDeleteString101 delete success');
                } else {
                    console.log('testDeviceKvStoreDeleteString101 delete fail' + err);
                    expect(null).assertFail();
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreDeleteString101 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreDeleteString102', 0, async function (done) {
        console.log('testDeviceKvStoreDeleteString102');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, async function (err, data) {
                console.log('testDeviceKvStoreDeleteString102 put success');
                expect(err == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_STRING_ELEMENT, function (err,data) {
                    console.log('testDeviceKvStoreDeleteString102 delete success');
                    expect(err == undefined).assertTrue();
                    done();
                });
            })
        }catch(e) {
            console.log('testDeviceKvStoreDeleteString102 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreDeleteInt101', 0, async function (done) {
        console.log('testDeviceKvStoreDeleteInt101');
        try{
            await kvStore.delete(KEY_TEST_INT_ELEMENT, function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStoreDeleteInt101 get success');
                } else {
                    console.log('testDeviceKvStoreDeleteInt101 get fail' + err);
                    expect(null).assertFail();
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreDeleteInt101 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreDeleteInt102', 0, async function (done) {
        console.log('testDeviceKvStoreDeleteInt102');
        try{
            await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT, async function (err,data) {
                console.log('testDeviceKvStoreDeleteInt102 put success');
                expect(err == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_INT_ELEMENT, function (err,data) {
                    console.log('testDeviceKvStoreDeleteInt102 delete success');
                    expect(err == undefined).assertTrue();
                    done();
                });
            })
        }catch(e) {
            console.log('testDeviceKvStoreDeleteInt102 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreDeleteFloat101', 0, async function (done) {
        console.log('testDeviceKvStoreDeleteFloat101');
        try{
            await kvStore.delete(KEY_TEST_FLOAT_ELEMENT, function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStoreDeleteFloat101 get success');
                } else {
                    console.log('testDeviceKvStoreDeleteFloat101 get fail' + err);
                    expect(null).assertFail();
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreDeleteFloat101 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreDeleteFloat102', 0, async function (done) {
        console.log('testDeviceKvStoreDeleteFloat102');
        try{
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, async function (err, data) {
                console.log('testDeviceKvStoreDeleteFloat102 put success');
                expect(err == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_FLOAT_ELEMENT, function (err,data) {
                    console.log('testDeviceKvStoreDeleteFloat102 delete success');
                    expect(err == undefined).assertTrue();
                    done();
                });
            })
        }catch(e) {
            console.log('testDeviceKvStoreDeleteFloat102 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreDeleteBool101', 0, async function (done) {
        console.log('testDeviceKvStoreDeleteBool101');
        try{
            await kvStore.delete(KEY_TEST_BOOLEAN_ELEMENT, function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStoreDeleteBool101 get success');
                } else {
                    console.log('testDeviceKvStoreDeleteBool101 get fail' + err);
                    expect(null).assertFail();
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreDeleteBool101 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreDeleteBool102', 0, async function (done) {
        console.log('testDeviceKvStoreDeleteBool102');
        try{
            await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT, async function (err, data) {
                console.log('testDeviceKvStoreDeleteBool102 put success');
                expect(err == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_BOOLEAN_ELEMENT, function (err,data) {
                    console.log('testDeviceKvStoreDeleteBool102 delete success');
                    expect(err == undefined).assertTrue();
                    done();
                });
            })
        }catch(e) {
            console.log('testDeviceKvStoreDeleteBool102 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreOnChange101', 0, async function (done) {
        console.log('testDeviceKvStoreOnChange101');
        try {
            kvStore.on('dataChange', 0, function (data) {
                console.log('testDeviceKvStoreOnChange101 dataChange');
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, function (err,data) {
                console.log('testDeviceKvStoreOnChange101 put success');
                expect(err == undefined).assertTrue();
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreOnChange101 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreOnChange102', 0, async function (done) {
        console.log('testDeviceKvStoreOnChange102');
        try {
            kvStore.on('dataChange', 1, function (data) {
                console.log('testDeviceKvStoreOnChange102 dataChange');
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, function (err,data) {
                console.log('testDeviceKvStoreOnChange102 put success');
                expect(err == undefined).assertTrue();
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreOnChange102 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreOnChange103', 0, async function (done) {
        console.log('testDeviceKvStoreOnChange103');
        try {
            kvStore.on('dataChange', 2, function (data) {
                console.log('testDeviceKvStoreOnChange103 dataChange');
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT, function (err,data) {
                console.log('testDeviceKvStoreOnChange103 put success');
                expect(err == undefined).assertTrue();
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreOnChange103 e' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreOnSyncComplete101', 0, async function (done) {
        try {
            kvStore.on('syncComplete', function (data) {
                console.log('testDeviceKvStoreOnSyncComplete101 dataChange');
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_SYNC_ELEMENT + 'testSync101', VALUE_TEST_SYNC_ELEMENT, function (err,data) {
                console.log('testDeviceKvStoreOnSyncComplete101 put success');
                expect(err == undefined).assertTrue();
                var devices = ['A12C1F9261528B21F95778D2FDC0B2E33943E6251AC5487F4473D005758905DB'];
                var mode = factory.SyncMode.PULL_ONLY;
                try {
                    kvStore.sync(devices, mode);
                } catch(e) {
                    console.log('testDeviceKvStoreOnSyncComplete101 sync no peer device :e:' + e);
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreOnSyncComplete101 no peer device :e:' + e);
            done();
        }
    })

    it('testDeviceKvStoreOnSyncComplete102', 0, async function (done) {
        try {
            kvStore.on('syncComplete', function (data) {
                console.log('testDeviceKvStoreOnSyncComplete102 dataChange');
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_SYNC_ELEMENT + 'testSync101', VALUE_TEST_SYNC_ELEMENT, function (err,data) {
                console.log('testDeviceKvStoreOnSyncComplete102 put success');
                expect(err == undefined).assertTrue();
                var devices = ['A12C1F9261528B21F95778D2FDC0B2E33943E6251AC5487F4473D005758905DB'];
                var mode = factory.SyncMode.PUSH_ONLY;
                try {
                    kvStore.sync(devices, mode);
                } catch(e) {
                    console.log('testDeviceKvStoreOnSyncComplete101 sync no peer device :e:' + e);
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreOnSyncComplete102 no peer device :e:' + e);
            // expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreOnSyncComplete103', 0, async function (done) {
        try {
            kvStore.on('syncComplete', function (data) {
                console.log('testDeviceKvStoreOnSyncComplete103 dataChange');
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_SYNC_ELEMENT + 'testSync101', VALUE_TEST_SYNC_ELEMENT, function (err,data) {
                console.log('testDeviceKvStoreOnSyncComplete103 put success');
                expect(err == undefined).assertTrue();
                var devices = ['A12C1F9261528B21F95778D2FDC0B2E33943E6251AC5487F4473D005758905DB'];
                var mode = factory.SyncMode.PUSH_PULL;
                try {
                    kvStore.sync(devices, mode);
                } catch(e) {
                    console.log('testDeviceKvStoreOnSyncComplete101 sync no peer device :e:' + e);
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreOnSyncComplete103 no peer device :e:' + e);
            // expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreSetSyncRange101', 0, async function (done) {
        console.log('testDeviceKvStoreSetSyncRange101');
        try {
            var localLabels = ['A', 'B'];
            var remoteSupportLabels = ['C', 'D'];
            await kvStore.setSyncRange(localLabels, remoteSupportLabels, function (err,data) {
                console.log('testDeviceKvStoreSetSyncRange101 put success');
                expect(err == undefined).assertTrue();
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreSetSyncRange101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreSetSyncRange102', 0, async function (done) {
        console.log('testDeviceKvStoreSetSyncRange102');
        try {
            var localLabels = ['A', 'B'];
            var remoteSupportLabels = ['B', 'C'];
            await kvStore.setSyncRange(localLabels, remoteSupportLabels, function (err,data) {
                console.log('testDeviceKvStoreSetSyncRange102 put success');
                expect(err == undefined).assertTrue();
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreSetSyncRange102 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreSetSyncRange103', 0, async function (done) {
        console.log('testDeviceKvStoreSetSyncRange103');
        try {
            var localLabels = ['A', 'B'];
            var remoteSupportLabels = ['A', 'B'];
            await kvStore.setSyncRange(localLabels, remoteSupportLabels, function (err,data) {
                console.log('testDeviceKvStoreSetSyncRange103 put success');
                expect(err == undefined).assertTrue();
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreSetSyncRange103 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStorePutBatch101', 0, async function (done) {
        console.log('testDeviceKvStorePutBatch101');
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
            console.log('testDeviceKvStorePutBatch101 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries, async function (err,data) {
                console.log('testDeviceKvStorePutBatch101 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_string_key', function (err,entrys) {
                    console.log('testDeviceKvStorePutBatch101 getEntries success');
                    console.log('testDeviceKvStorePutBatch101 entrys.length: ' + entrys.length);
                    console.log('testDeviceKvStorePutBatch101 entrys[0]: ' + JSON.stringify(entrys[0]));
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 'batch_test_string_value').assertTrue();
                    done();
                });
            });
        }catch(e) {
            console.log('testDeviceKvStorePutBatch101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStorePutBatch102', 0, async function (done) {
        console.log('testDeviceKvStorePutBatch102');
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
            console.log('testDeviceKvStorePutBatch102 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries, async function (err,data) {
                console.log('testDeviceKvStorePutBatch102 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_number_key', function (err,entrys) {
                    console.log('testDeviceKvStorePutBatch102 getEntries success');
                    console.log('testDeviceKvStorePutBatch102 entrys.length: ' + entrys.length);
                    console.log('testDeviceKvStorePutBatch102 entrys[0]: ' + JSON.stringify(entrys[0]));
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 222).assertTrue();
                    done();
                });
            });
        }catch(e) {
            console.log('testDeviceKvStorePutBatch102 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStorePutBatch103', 0, async function (done) {
        console.log('testDeviceKvStorePutBatch103');
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
            console.log('testDeviceKvStorePutBatch103 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries, async function (err,data) {
                console.log('testDeviceKvStorePutBatch103 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_number_key', function (err,entrys) {
                    console.log('testDeviceKvStorePutBatch103 getEntries success');
                    console.log('testDeviceKvStorePutBatch103 entrys.length: ' + entrys.length);
                    console.log('testDeviceKvStorePutBatch103 entrys[0]: ' + JSON.stringify(entrys[0]));
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 2.0).assertTrue();
                    done();
                });
            });
        }catch(e) {
            console.log('testDeviceKvStorePutBatch103 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStorePutBatch104', 0, async function (done) {
        console.log('testDeviceKvStorePutBatch104');
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
            console.log('testDeviceKvStorePutBatch104 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries, async function (err,data) {
                console.log('testDeviceKvStorePutBatch104 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_number_key', function (err,entrys) {
                    console.log('testDeviceKvStorePutBatch104 getEntries success');
                    console.log('testDeviceKvStorePutBatch104 entrys.length: ' + entrys.length);
                    console.log('testDeviceKvStorePutBatch104 entrys[0]: ' + JSON.stringify(entrys[0]));
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 2.00).assertTrue();
                    done();
                });
            });
        }catch(e) {
            console.log('testDeviceKvStorePutBatch104 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStorePutBatch105', 0, async function (done) {
        console.log('testDeviceKvStorePutBatch105');
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
            console.log('testDeviceKvStorePutBatch105 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries, async function (err,data) {
                console.log('testDeviceKvStorePutBatch105 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_bool_key', function (err,entrys) {
                    console.log('testDeviceKvStorePutBatch105 getEntries success');
                    console.log('testDeviceKvStorePutBatch105 entrys.length: ' + entrys.length);
                    console.log('testDeviceKvStorePutBatch105 entrys[0]: ' + JSON.stringify(entrys[0]));
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == bo).assertTrue();
                    done();
                });
            });
        }catch(e) {
            console.log('testDeviceKvStorePutBatch105 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStorePutBatch106', 0, async function (done) {
        console.log('testDeviceKvStorePutBatch106');
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
            console.log('testDeviceKvStorePutBatch106 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries, async function (err,data) {
                console.log('testDeviceKvStorePutBatch106 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_bool_key', function (err,entrys) {
                    console.log('testDeviceKvStorePutBatch106 getEntries success');
                    console.log('testDeviceKvStorePutBatch106 entrys.length: ' + entrys.length);
                    console.log('testDeviceKvStorePutBatch106 entrys[0]: ' + JSON.stringify(entrys[0]));
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
                    done();
                });
            });
        }catch(e) {
            console.log('testDeviceKvStorePutBatch106 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreDeleteBatch101', 0, async function (done) {
        console.log('testDeviceKvStoreDeleteBatch101');
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
            console.log('testDeviceKvStoreDeleteBatch101 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries, async function (err,data) {
                console.log('testDeviceKvStoreDeleteBatch101 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.deleteBatch(keys, async function (err,data) {
                    console.log('testDeviceKvStoreDeleteBatch101 deleteBatch success');
                    expect(err == undefined).assertTrue();
                    done();
                });
            });
        }catch(e) {
            console.log('testDeviceKvStoreDeleteBatch101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreDeleteBatch102', 0, async function (done) {
        console.log('testDeviceKvStoreDeleteBatch102');
        try {
            let keys = ['batch_test_string_key1', 'batch_test_string_key2'];
            await kvStore.deleteBatch(keys, function (err,data) {
                console.log('testDeviceKvStoreDeleteBatch102 deleteBatch success');
                expect(err == undefined).assertTrue();
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreDeleteBatch102 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreDeleteBatch103', 0, async function (done) {
        console.log('testDeviceKvStoreDeleteBatch103');
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
            console.log('testDeviceKvStoreDeleteBatch103 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries, async function (err,data) {
                console.log('testDeviceKvStoreDeleteBatch103 putBatch success');
                expect(err == undefined).assertTrue();
                let keys = ['batch_test_string_key1', 'batch_test_string_keya'];
                await kvStore.deleteBatch(keys, async function (err,data) {
                    console.log('testDeviceKvStoreDeleteBatch103 deleteBatch success');
                    expect(err == undefined).assertTrue();
                    done();
                });
            });
        }catch(e) {
            console.log('testDeviceKvStoreDeleteBatch103 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStorestartTransaction101', 0, async function (done) {
        console.log('testDeviceKvStorestartTransaction101');
        try {
            var count = 0;
            kvStore.on('dataChange', 0, function (data) {
                console.log('testDeviceKvStorestartTransaction101 0' + data)
                count++;
            });
            // startTransaction
            await kvStore.startTransaction(async function (err,data) {
                console.log('testDeviceKvStorestartTransaction101 startTransaction success');
                expect(err == undefined).assertTrue();
                let entries = putBatchString(10, 'batch_test_string_key');
                console.log('testDeviceKvStorestartTransaction101 entries: ' + JSON.stringify(entries));
                await kvStore.putBatch(entries, async function (err,data) {
                    console.log('testDeviceKvStorestartTransaction101 putBatch success');
                    expect(err == undefined).assertTrue();
                    let keys = Object.keys(entries).slice(5); //delete 5 beginnings
                    await kvStore.deleteBatch(keys, async function (err,data) {
                        console.log('testDeviceKvStorestartTransaction101 deleteBatch success');
                        expect(err == undefined).assertTrue();
                        await kvStore.commit(async function (err,data) {
                            console.log('testDeviceKvStorestartTransaction101 commit success');
                            expect(err == undefined).assertTrue();
                            await sleep(2000);
                            // assert
                            expect(count == 1).assertTrue();
                            done();
                        });
                    });
                });
            });
        }catch(e) {
            console.log('testDeviceKvStorestartTransaction101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStorestartTransaction102', 0, async function (done) {
        console.log('testDeviceKvStorestartTransaction102');
        try {
            var count = 0;
            kvStore.on('dataChange', 0, function (data) {
                console.log('testDeviceKvStorestartTransaction102 0' + data)
                count++;
            });
            await kvStore.startTransaction(async function (err,data) {
                console.log('testDeviceKvStorestartTransaction102 startTransaction success');
                expect(err == undefined).assertTrue();
                let entries =  putBatchString(10, 'batch_test_string_key');
                console.log('testDeviceKvStorestartTransaction102 entries: ' + JSON.stringify(entries));
                await kvStore.putBatch(entries, async function (err,data) {
                    console.log('testDeviceKvStorestartTransaction102 putBatch success');
                    expect(err == undefined).assertTrue();
                    let keys = Object.keys(entries).slice(5); //delete 5 beginnings
                    await kvStore.deleteBatch(keys, async function (err,data) {
                        console.log('testDeviceKvStorestartTransaction102 deleteBatch success');
                        expect(err == undefined).assertTrue();
                        // rollback
                        await kvStore.rollback(async function (err,data) {
                            console.log('testDeviceKvStorestartTransaction102 rollback success');
                            expect(err == undefined).assertTrue();
                            await sleep(2000);
                            expect(count == 0).assertTrue();
                            done();
                        });
                    });
                });
            });
        }catch(e) {
            console.log('testDeviceKvStorestartTransaction102 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStorestartTransaction103', 0, async function (done) {
        console.log('testDeviceKvStorestartTransaction103');
        try {
            await kvStore.startTransaction(1, function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStorestartTransaction103 startTransaction success');
                    expect(null).assertFail();
                } else {
                    console.log('testDeviceKvStorestartTransaction103 startTransaction fail');
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStorestartTransaction103 e ' + e);
            done();
        }
    })

    it('testDeviceKvStorestartTransaction104', 0, async function (done) {
        console.log('testDeviceKvStorestartTransaction104');
        try {
            await kvStore.startTransaction('test_string', function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStorestartTransaction104 startTransaction success');
                    expect(null).assertFail();
                } else {
                    console.log('testDeviceKvStorestartTransaction104 startTransaction fail');
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStorestartTransaction104 e ' + e);
            done();
        }
    })

    it('testDeviceKvStorestartTransaction105', 0, async function (done) {
        console.log('testDeviceKvStorestartTransaction105');
        try {
            await kvStore.startTransaction(2.000, function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStorestartTransaction105 startTransaction success');
                    expect(null).assertFail();
                } else {
                    console.log('testDeviceKvStorestartTransaction105 startTransaction fail');
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStorestartTransaction105 e ' + e);
            done();
        }
    })

    it('testDeviceKvStoreCommit101', 0, async function (done) {
        console.log('testDeviceKvStoreCommit101');
        try {
            await kvStore.commit(1, function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStoreCommit101 commit success');
                    expect(null).assertFail();
                } else {
                    console.log('testDeviceKvStoreCommit101 commit fail');
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreCommit101 e ' + e);
            done();
        }
    })

    it('testDeviceKvStoreCommit102', 0, async function (done) {
        console.log('testDeviceKvStoreCommit102');
        try {
            await kvStore.commit('test_string', function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStoreCommit102 commit success');
                    expect(null).assertFail();
                } else {
                    console.log('testDeviceKvStoreCommit102 commit fail');
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreCommit102 e ' + e);
            done();
        }
    })

    it('testDeviceKvStoreCommit103', 0, async function (done) {
        console.log('testDeviceKvStoreCommit103');
        try {
            await kvStore.commit(2.000, function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStoreCommit103 commit success');
                    expect(null).assertFail();
                } else {
                    console.log('testDeviceKvStoreCommit103 commit fail');
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreCommit103 e ' + e);
            done();
        }
    })

    it('testDeviceKvStoreRollback101', 0, async function (done) {
        console.log('testDeviceKvStoreRollback101');
        try {
            await kvStore.rollback(1, function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStoreRollback101 commit success');
                    expect(null).assertFail();
                } else {
                    console.log('testDeviceKvStoreRollback101 commit fail');
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreRollback101 e ' + e);
            done();
        }
    })

    it('testDeviceKvStoreRollback102', 0, async function (done) {
        console.log('testDeviceKvStoreRollback102');
        try {
            await kvStore.rollback('test_string', function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStoreRollback102 commit success');
                    expect(null).assertFail();
                } else {
                    console.log('testDeviceKvStoreRollback102 commit fail');
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreRollback102 e ' + e);
            done();
        }
    })

    it('testDeviceKvStoreRollback103', 0, async function (done) {
        console.log('testDeviceKvStoreRollback103');
        try {
            await kvStore.rollback(2.000, function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStoreRollback103 commit success');
                    expect(null).assertFail();
                } else {
                    console.log('testDeviceKvStoreRollback103 commit fail');
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreRollback103 e ' + e);
            done();
        }
    })

    it('testDeviceKvStoreEnableSync101', 0, async function (done) {
        console.log('testDeviceKvStoreEnableSync101');
        try {
            await kvStore.enableSync(true, function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStoreEnableSync101 enableSync success');
                    expect(err == undefined).assertTrue();
                } else {
                    console.log('testDeviceKvStoreEnableSync101 enableSync fail');
                    expect(null).assertFail();
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreEnableSync101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreEnableSync102', 0, async function (done) {
        console.log('testDeviceKvStoreEnableSync102');
        try {
            await kvStore.enableSync(false, function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStoreEnableSync102 enableSync success');
                    expect(err == undefined).assertTrue();
                } else {
                    console.log('testDeviceKvStoreEnableSync102 enableSync fail');
                    expect(null).assertFail();
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreEnableSync102 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreEnableSync103', 0, async function (done) {
        console.log('testDeviceKvStoreEnableSync103');
        try {
            await kvStore.enableSync(function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStoreEnableSync103 enableSync success');
                    expect(null).assertFail();
                } else {
                    console.log('testDeviceKvStoreEnableSync103 enableSync fail');
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreEnableSync103 e ' + e);
            done();
        }
    })

    it('testDeviceKvStoreEnableSync104', 0, async function (done) {
        console.log('testDeviceKvStoreEnableSync104');
        try {
            await kvStore.enableSync(null, function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStoreEnableSync104 enableSync success');
                    expect(null).assertFail();
                } else {
                    console.log('testDeviceKvStoreEnableSync104 enableSync fail');
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreEnableSync104 e ' + e);
            done();
        }
    })

    it('testDeviceKvStoreRemoveDeviceData101', 0, async function (done) {
        console.log('testDeviceKvStoreRemoveDeviceData101');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT, async function (err,data) {
                console.log('testDeviceKvStoreRemoveDeviceData101 put success');
                expect(err == undefined).assertTrue();
                var deviceid = 'no_exist_device_id';
                await kvStore.removeDeviceData(deviceid, async function (err,data) {
                    if (err == undefined) {
                        console.log('testDeviceKvStoreRemoveDeviceData101 removeDeviceData success');
                        expect(null).assertFail();
                        done();
                    } else {
                        console.log('testDeviceKvStoreRemoveDeviceData101 removeDeviceData fail');
                        await kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT, async function (err,data) {
                            console.log('testDeviceKvStoreRemoveDeviceData101 get success');
                            expect(data == VALUE_TEST_STRING_ELEMENT).assertTrue();
                            done();
                        });
                    }
                });
            });
        }catch(e) {
            console.log('testDeviceKvStoreRemoveDeviceData101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreRemoveDeviceData102', 0, async function (done) {
        console.log('testDeviceKvStoreRemoveDeviceData102');
        try {
            await kvStore.removeDeviceData(function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStoreRemoveDeviceData102 removeDeviceData success');
                    expect(null).assertFail();
                } else {
                    console.log('testDeviceKvStoreRemoveDeviceData102 removeDeviceData fail');
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreRemoveDeviceData101 e ' + e);
            done();
        }
    })

    it('testDeviceKvStoreRemoveDeviceData103', 0, async function (done) {
        console.log('testDeviceKvStoreRemoveDeviceData103');
        try {
            await kvStore.removeDeviceData('', function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStoreRemoveDeviceData103 removeDeviceData success');
                    expect(null).assertFail();
                } else {
                    console.log('testDeviceKvStoreRemoveDeviceData103 removeDeviceData fail');
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreRemoveDeviceData103 e ' + e);
            done();
        }
    })

    it('testDeviceKvStoreRemoveDeviceData104', 0, async function (done) {
        console.log('testDeviceKvStoreRemoveDeviceData104');
        try {
            await kvStore.removeDeviceData(null, function (err,data) {
                if (err == undefined) {
                    console.log('testDeviceKvStoreRemoveDeviceData104 removeDeviceData success');
                    expect(null).assertFail();
                } else {
                    console.log('testDeviceKvStoreRemoveDeviceData104 removeDeviceData fail');
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreRemoveDeviceData104 e ' + e);
            done();
        }
    })

    it('testDeviceKvStoreGetResultSet101', 0, async function (done) {
        console.log('testDeviceKvStoreGetResultSet101');
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
            await kvStore.putBatch(entries, async function (err, data) {
                console.log('testDeviceKvStoreGetResultSet101 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getResultSet(localDeviceId, 'batch_test_string_key', async function (err, result) {
                    console.log('testDeviceKvStoreGetResultSet101 getResultSet success');
                    resultSet = result;
                    expect(resultSet.getCount() == 10).assertTrue();
                    await kvStore.closeResultSet(resultSet, function (err, data) {
                        console.log('testDeviceKvStoreGetResultSet101 closeResultSet success');
                        expect(err == undefined).assertTrue();
                        done();
                    })
                });
            });
        }catch(e) {
            console.log('testDeviceKvStoreGetResultSet101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreGetResultSet102', 0, async function (done) {
        console.log('testDeviceKvStoreGetResultSet102');
        try {
            let resultSet;
            await kvStore.getResultSet(localDeviceId, 'batch_test_string_key', async function (err, result) {
                console.log('testDeviceKvStoreGetResultSet102 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 0).assertTrue();
                await kvStore.closeResultSet(resultSet, function (err, data) {
                    console.log('testDeviceKvStoreGetResultSet102 closeResultSet success');
                    expect(err == undefined).assertTrue();
                    done();
                })
            });
        }catch(e) {
            console.log('testDeviceKvStoreGetResultSet102 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreGetResultSet103', 0, async function (done) {
        console.log('testDeviceKvStoreGetResultSet103');
        try {
            let resultSet;
            await kvStore.getResultSet(function (err, result) {
                console.log('testDeviceKvStoreGetResultSet103 getResultSet success');
                expect(err != undefined).assertTrue();
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreGetResultSet103 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreGetResultSet104', 0, async function (done) {
        console.log('testDeviceKvStoreGetResultSet104');
        try {
            let resultSet;
            await kvStore.getResultSet('test_key_string', 123, function (err, result) {
                console.log('testDeviceKvStoreGetResultSet104 getResultSet success');
                expect(err != undefined).assertTrue();
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreGetResultSet104 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreGetResultSet105', 0, async function (done) {
        console.log('testDeviceKvStoreGetResultSet105');
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
            await kvStore.putBatch(entries, async function (err, data) {
                console.log('testDeviceKvStoreGetResultSet105 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.prefixKey("batch_test");
                await kvStore.getResultSet(localDeviceId, query, async function (err, result) {
                    console.log('testDeviceKvStoreGetResultSet105 getResultSet success');
                    resultSet = result;
                    expect(resultSet.getCount() == 10).assertTrue();
                    await kvStore.closeResultSet(resultSet, function (err, data) {
                        console.log('testDeviceKvStoreGetResultSet105 closeResultSet success');
                        expect(err == undefined).assertTrue();
                        done();
                    })
                });
            });
        } catch(e) {
            console.log('testDeviceKvStoreGetResultSet105 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreGetResultSet106', 0, async function (done) {
        console.log('testDeviceKvStoreGetResultSet106');
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
            await kvStore.putBatch(entries, async function (err, data) {
                console.log('testDeviceKvStoreGetResultSet106 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.prefixKey("batch_test");
                query.deviceId(localDeviceId);
                await kvStore.getResultSet(query, async function (err, result) {
                    console.log('testDeviceKvStoreGetResultSet106 getResultSet success');
                    resultSet = result;
                    expect(resultSet.getCount() == 10).assertTrue();
                    await kvStore.closeResultSet(resultSet, function (err, data) {
                        console.log('testDeviceKvStoreGetResultSet106 closeResultSet success');
                        expect(err == undefined).assertTrue();
                        done();
                    })
                });
            });
        } catch(e) {
            console.log('testDeviceKvStoreGetResultSet106 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreCloseResultSet101', 0, async function (done) {
        console.log('testDeviceKvStoreCloseResultSet101');
        try {
            console.log('testDeviceKvStoreCloseResultSet101 success');
            let resultSet = null;
            await kvStore.closeResultSet(resultSet, function (err, data) {
                if (err == undefined) {
                    console.log('testDeviceKvStoreCloseResultSet101 closeResultSet success');
                    expect(null).assertFail();
                } else {
                    console.log('testDeviceKvStoreCloseResultSet101 closeResultSet fail');
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreCloseResultSet101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreCloseResultSet102', 0, async function (done) {
        console.log('testDeviceKvStoreCloseResultSet102');
        try {
            let resultSet = null;
            await kvStore.getResultSet(localDeviceId, 'batch_test_string_key', async function(err, result) {
                console.log('testDeviceKvStoreCloseResultSet102 getResultSet success');
                resultSet = result;
                await kvStore.closeResultSet(resultSet, function (err, data) {
                    if (err == undefined) {
                        console.log('testDeviceKvStoreCloseResultSet102 closeResultSet success');
                        expect(err == undefined).assertTrue();
                    } else {
                        console.log('testDeviceKvStoreCloseResultSet102 closeResultSet fail');
                        expect(null).assertFail();
                    }
                    done();
                });
            });
        }catch(e) {
            console.log('testDeviceKvStoreCloseResultSet102 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreCloseResultSet103', 0, async function (done) {
        console.log('testDeviceKvStoreCloseResultSet103');
        try {
            console.log('testDeviceKvStoreCloseResultSet103 success');
            await kvStore.closeResultSet(function (err, data) {
                if (err == undefined) {
                    console.log('testDeviceKvStoreCloseResultSet103 closeResultSet success');
                    expect(null).assertFail();
                } else {
                    console.log('testDeviceKvStoreCloseResultSet103 closeResultSet fail');
                }
                done();
            });
        }catch(e) {
            console.log('testDeviceKvStoreCloseResultSet103 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreCloseResultSet104', 0, async function (done) {
        console.log('testDeviceKvStoreCloseResultSet104');
        try {
            // pass query
            console.log('testDeviceKvStoreCloseResultSet104 success');
        }catch(e) {
            console.log('testDeviceKvStoreCloseResultSet104 e ' + e);
            expect(null).assertFail();
        }
        done();
    })


    it('testDeviceKvStoreGetResultSize101', 0, async function (done) {
        console.log('testDeviceKvStoreGetResultSize101');
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
            await kvStore.putBatch(entries, async function (err, data) {
                console.log('testDeviceKvStoreGetResultSize101 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.prefixKey("batch_test");
                query.deviceId(localDeviceId);
                await kvStore.getResultSize(query, async function (err, resultSize) {
                    console.log('testDeviceKvStoreGetResultSize101 getResultSet success');
                    expect(resultSize == 10).assertTrue();
                    done();
                });
            });
        } catch(e) {
            console.log('testDeviceKvStoreGetResultSize101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreGetResultSize102', 0, async function (done) {
        console.log('testDeviceKvStoreGetResultSize102');
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
            await kvStore.putBatch(entries, async function (err, data) {
                console.log('testDeviceKvStoreGetResultSize102 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.prefixKey("batch_test");
                await kvStore.getResultSize(localDeviceId, query, async function (err, resultSize) {
                    console.log('testDeviceKvStoreGetResultSize102 getResultSet success');
                    expect(resultSize == 10).assertTrue();
                    done();
                });
            });
        } catch(e) {
            console.log('testDeviceKvStoreGetResultSize102 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testDeviceKvStoreGetEntries101', 0, async function (done) {
        console.log('testDeviceKvStoreGetEntries101');
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
            console.log('testDeviceKvStoreGetEntries101 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries, async function (err,data) {
                console.log('testDeviceKvStoreGetEntries101 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.deviceId(localDeviceId);
                query.prefixKey("batch_test");
                await kvStore.getEntries(localDeviceId, query, function (err,entrys) {
                    console.log('testDeviceKvStoreGetEntries101 getEntries success');
                    console.log('testDeviceKvStoreGetEntries101 entrys.length: ' + entrys.length);
                    console.log('testDeviceKvStoreGetEntries101 entrys[0]: ' + JSON.stringify(entrys[0]));
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
                    done();
                });
            });
            console.log('testDeviceKvStoreGetEntries101 success');
        }catch(e) {
            console.log('testDeviceKvStoreGetEntries101 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreGetEntries102', 0, async function (done) {
        console.log('testDeviceKvStoreGetEntries102');
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
            console.log('testDeviceKvStoreGetEntries102 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries, async function (err,data) {
                console.log('testDeviceKvStoreGetEntries102 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.prefixKey("batch_test");
                query.deviceId(localDeviceId);
                await kvStore.getEntries(query, function (err,entrys) {
                    console.log('testDeviceKvStoreGetEntries102 getEntries success');
                    console.log('testDeviceKvStoreGetEntries102 entrys.length: ' + entrys.length);
                    console.log('testDeviceKvStoreGetEntries102 entrys[0]: ' + JSON.stringify(entrys[0]));
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
                    done();
                });
            });
            console.log('testDeviceKvStoreGetEntries101 success');
            console.log('testDeviceKvStoreGetEntries102 success');
        }catch(e) {
            console.log('testDeviceKvStoreGetEntries102 e ' + e);
            expect(null).assertFail();
        }
        done();
    })
})