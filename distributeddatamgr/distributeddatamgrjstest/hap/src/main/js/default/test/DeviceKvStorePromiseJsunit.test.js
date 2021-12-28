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

describe('DeviceKvStorePromiseTest', function () {
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
            console.log('beforeAll on ' + JSON.stringify(data));
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
        await kvManager.getKVStore(TEST_STORE_ID, options).then((store) => {
            kvStore = store;
            console.log('beforeEach getKVStore success');
        }).catch((err) => {
            console.log('beforeEach getKVStore err ' + err);
        });
        console.log('beforeEach end');
        done();
    })

    afterEach(async function (done) {
        console.log('afterEach');
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore).then(async () => {
            console.log('afterEach closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
                console.log('afterEach deleteKVStore success');
                kvStore = null;
            }).catch((err) => {
                console.log('afterEach deleteKVStore err ' + err);
            });
        }).catch((err) => {
            console.log('afterEach closeKVStore err ' + err);
        });
        done();
    })

    it('testDeviceKvStorePutString001', 0, async function (done) {
        console.log('testDeviceKvStorePutString001');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, null).then((data) => {
                console.log('testDeviceKvStorePutString001 put success');
                expect(null).assertFail();
            }).catch((error) => {
                console.log('testDeviceKvStorePutString001 put error' + error);
            });
        } catch (e) {
            console.log('testDeviceKvStorePutString001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStorePutString002', 0, async function (done) {
        console.log('testDeviceKvStorePutString002');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, '').then((data) => {
                console.log('testDeviceKvStorePutString002 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.log('testDeviceKvStorePutString002 put error' + error);
                expect(null).assertFail();
            });
        } catch (e) {
            console.log('testDeviceKvStorePutString002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStorePutString003', 0, async function (done) {
        console.log('testDeviceKvStorePutString003');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then((data) => {
                console.log('testDeviceKvStorePutString003 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.log('testDeviceKvStorePutString003 put error' + error);
                expect(null).assertFail();
            });
        } catch (e) {
            console.log('testDeviceKvStorePutString003 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStorePutString004', 0, async function (done) {
        console.log('testDeviceKvStorePutString004');
        try {
            var str = '';
            for (var i = 0 ; i < 4095; i++) {
                str += 'x';
            }
            await kvStore.put(KEY_TEST_STRING_ELEMENT, str).then(async (data) => {
                console.log('testDeviceKvStorePutString004 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT).then((data) => {
                    console.log('testDeviceKvStorePutString004 get success data ' + data);
                    expect(str == data).assertTrue();
                }).catch((err) => {
                    console.log('testDeviceKvStorePutString004 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((error) => {
                console.log('testDeviceKvStorePutString004 put error' + error);
                expect(null).assertFail();
            });
        } catch (e) {
            console.log('testDeviceKvStorePutString004 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreGetString001', 0, async function (done) {
        console.log('testDeviceKvStoreGetString001');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then(async (data) => {
                console.log('testDeviceKvStoreGetString001 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT).then((data) => {
                    console.log('testDeviceKvStoreGetString001 get success');
                    expect(VALUE_TEST_STRING_ELEMENT == data).assertTrue();
                }).catch((err) => {
                    console.log('testDeviceKvStoreGetString001 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((error) => {
                console.log('testDeviceKvStoreGetString001 put error' + error);
                expect(null).assertFail();
            });
        } catch (e) {
            console.log('testDeviceKvStoreGetString001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreGetString002', 0, async function (done) {
        console.log('testDeviceKvStoreGetString002');
        try {
            await kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT).then((data) => {
                console.log('testDeviceKvStoreGetString002 get success');
                expect(null).assertFail();
            }).catch((err) => {
                console.log('testDeviceKvStoreGetString002 get fail ' + err);
            });
        } catch (e) {
            console.log('testDeviceKvStoreGetString002 get e ' + e);
        }
        done();
    })

    it('testDeviceKvStorePutInt001', 0, async function (done) {
        console.log('testDeviceKvStorePutInt001');
        try {
            await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).then((data) => {
                console.log('testDeviceKvStorePutInt001 put success');
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStorePutInt001 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.log('testDeviceKvStorePutInt001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStorePutInt002', 0, async function (done) {
        console.log('testDeviceKvStorePutInt002');
        try {
            var intValue = 987654321;
            await kvStore.put(KEY_TEST_INT_ELEMENT, intValue).then(async (data) => {
                console.log('testDeviceKvStorePutInt002 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT).then((data) => {
                    console.log('testDeviceKvStorePutInt002 get success');
                    expect(intValue == data).assertTrue();
                }).catch((err) => {
                    console.log('testDeviceKvStorePutInt002 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.log('testDeviceKvStorePutInt002 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.log('testDeviceKvStorePutInt002 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStorePutInt003', 0, async function (done) {
        console.log('testDeviceKvStorePutInt003');
        try {
            var intValue = Number.MAX_VALUE;
            await kvStore.put(KEY_TEST_INT_ELEMENT, intValue).then(async (data) => {
                console.log('testDeviceKvStorePutInt003 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT).then((data) => {
                    console.log('testDeviceKvStorePutInt003 get success');
                    expect(intValue == data).assertTrue();
                }).catch((err) => {
                    console.log('testDeviceKvStorePutInt003 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.log('testDeviceKvStorePutInt003 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.log('testDeviceKvStorePutInt003 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStorePutInt004', 0, async function (done) {
        console.log('testDeviceKvStorePutInt004');
        try {
            var intValue = Number.MIN_VALUE;
            await kvStore.put(KEY_TEST_INT_ELEMENT, intValue).then(async (data) => {
                console.log('testDeviceKvStorePutInt004 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT).then((data) => {
                    console.log('testDeviceKvStorePutInt004 get success');
                    expect(intValue == data).assertTrue();
                }).catch((err) => {
                    console.log('testDeviceKvStorePutInt004 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.log('testDeviceKvStorePutInt004 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.log('testDeviceKvStorePutInt004 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreGetInt001', 0, async function (done) {
        console.log('testDeviceKvStoreGetInt001');
        try {
            await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).then(async (data) => {
                console.log('testDeviceKvStoreGetInt001 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_INT_ELEMENT).then((data) => {
                    console.log('testDeviceKvStoreGetInt001 get success');
                    expect(VALUE_TEST_INT_ELEMENT == data).assertTrue();
                }).catch((err) => {
                    console.log('testDeviceKvStoreGetInt001 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.log('testDeviceKvStoreGetInt001 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.log('testDeviceKvStoreGetInt001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStorePutBool001', 0, async function (done) {
        console.log('testDeviceKvStorePutBool001');
        try {
            await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT).then((data) => {
                console.log('testDeviceKvStorePutBool001 put success');
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStorePutBool001 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.log('testDeviceKvStorePutBool001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreGetBool001', 0, async function (done) {
        console.log('testDeviceKvStoreGetBool001');
        try {
            var boolValue = false;
            await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, boolValue).then(async (data) => {
                console.log('testDeviceKvStoreGetBool001 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_BOOLEAN_ELEMENT).then((data) => {
                    console.log('testDeviceKvStoreGetBool001 get success');
                    expect(boolValue == data).assertTrue();
                }).catch((err) => {
                    console.log('testDeviceKvStoreGetBool001 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.log('testDeviceKvStoreGetBool001 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.log('testDeviceKvStoreGetBool001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStorePutFloat001', 0, async function (done) {
        console.log('testDeviceKvStorePutFloat001');
        try {
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
                console.log('testDeviceKvStorePutFloat001 put success');
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStorePutFloat001 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.log('testDeviceKvStorePutFloat001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreGetFloat001', 0, async function (done) {
        console.log('testDeviceKvStoreGetFloat001');
        try {
            var floatValue = 123456.654321;
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue).then(async (data) => {
                console.log('testDeviceKvStoreGetFloat001 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT).then((data) => {
                    console.log('testDeviceKvStoreGetFloat001 get success');
                    expect(floatValue == data).assertTrue();
                }).catch((err) => {
                    console.log('testDeviceKvStoreGetFloat001 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.log('testDeviceKvStoreGetFloat001 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.log('testDeviceKvStoreGetFloat001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreGetFloat002', 0, async function (done) {
        console.log('testDeviceKvStoreGetFloat002');
        try {
            var floatValue = 123456.0;
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue).then(async (data) => {
                console.log('testDeviceKvStoreGetFloat002 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT).then((data) => {
                    console.log('testDeviceKvStoreGetFloat002 get success');
                    expect(floatValue == data).assertTrue();
                }).catch((err) => {
                    console.log('testDeviceKvStoreGetFloat002 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.log('testDeviceKvStoreGetFloat002 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.log('testDeviceKvStoreGetFloat002 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreGetFloat003', 0, async function (done) {
        console.log('testDeviceKvStoreGetFloat003');
        try {
            var floatValue = 123456.00;
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, floatValue).then(async (data) => {
                console.log('testDeviceKvStoreGetFloat003 put success');
                expect(data == undefined).assertTrue();
                await kvStore.get(localDeviceId, KEY_TEST_FLOAT_ELEMENT).then((data) => {
                    console.log('testDeviceKvStoreGetFloat003 get success');
                    expect(floatValue == data).assertTrue();
                }).catch((err) => {
                    console.log('testDeviceKvStoreGetFloat003 get fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.log('testDeviceKvStoreGetFloat003 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.log('testDeviceKvStoreGetFloat003 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreDeleteString001', 0, async function (done) {
        console.log('testDeviceKvStoreDeleteString001');
        try {
            var str = 'this is a test string';
            await kvStore.put(KEY_TEST_STRING_ELEMENT, str).then(async (data) => {
                console.log('testDeviceKvStoreDeleteString001 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_STRING_ELEMENT).then((data) => {
                    console.log('testDeviceKvStoreDeleteString001 delete success');
                    expect(data == undefined).assertTrue();
                }).catch((err) => {
                    console.log('testDeviceKvStoreDeleteString001 delete fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.log('testDeviceKvStoreDeleteString001 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.log('testDeviceKvStoreDeleteString001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreDeleteString002', 0, async function (done) {
        console.log('testDeviceKvStoreDeleteString002');
        try {
            var str = '';
            for (var i = 0 ; i < 4096; i++) {
                str += 'x';
            }
            await kvStore.put(KEY_TEST_STRING_ELEMENT, str).then(async (data) => {
                console.log('testDeviceKvStoreDeleteString002 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_STRING_ELEMENT).then((data) => {
                    console.log('testDeviceKvStoreDeleteString002 delete success');
                    expect(data == undefined).assertTrue();
                }).catch((err) => {
                    console.log('testDeviceKvStoreDeleteString002 delete fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.log('testDeviceKvStoreDeleteString002 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.log('testDeviceKvStoreDeleteString002 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreDeleteString003', 0, async function (done) {
        console.log('testDeviceKvStoreDeleteString003');
        try {
            await kvStore.delete(KEY_TEST_STRING_ELEMENT).then((data) => {
                console.log('testDeviceKvStoreDeleteString003 delete success');
                expect(data == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStoreDeleteString003 delete fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.log('testDeviceKvStoreDeleteString003 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreDeleteInt001', 0, async function (done) {
        console.log('testDeviceKvStoreDeleteInt001');
        try {
            await kvStore.put(KEY_TEST_INT_ELEMENT, VALUE_TEST_INT_ELEMENT).then(async (data) => {
                console.log('testDeviceKvStoreDeleteInt001 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_INT_ELEMENT).then((data) => {
                    console.log('testDeviceKvStoreDeleteInt001 delete success');
                    expect(data == undefined).assertTrue();
                }).catch((err) => {
                    console.log('testDeviceKvStoreDeleteInt001 delete fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.log('testDeviceKvStoreDeleteInt001 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.log('testDeviceKvStoreDeleteInt001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreDeleteFloat001', 0, async function (done) {
        console.log('testDeviceKvStoreDeleteFloat001');
        try {
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then(async (data) => {
                console.log('testDeviceKvStoreDeleteFloat001 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_FLOAT_ELEMENT).then((data) => {
                    console.log('testDeviceKvStoreDeleteFloat001 delete success');
                    expect(data == undefined).assertTrue();
                }).catch((err) => {
                    console.log('testDeviceKvStoreDeleteFloat001 delete fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.log('testDeviceKvStoreDeleteFloat001 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.log('testDeviceKvStoreDeleteFloat001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreDeleteBool001', 0, async function (done) {
        console.log('testDeviceKvStoreDeleteBool001');
        try {
            await kvStore.put(KEY_TEST_BOOLEAN_ELEMENT, VALUE_TEST_BOOLEAN_ELEMENT).then(async (data) => {
                console.log('testDeviceKvStoreDeleteBool001 put success');
                expect(data == undefined).assertTrue();
                await kvStore.delete(KEY_TEST_BOOLEAN_ELEMENT).then((data) => {
                    console.log('testDeviceKvStoreDeleteBool001 delete success');
                    expect(data == undefined).assertTrue();
                }).catch((err) => {
                    console.log('testDeviceKvStoreDeleteBool001 delete fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.log('testDeviceKvStoreDeleteBool001 put fail ' + err);
                expect(null).assertFail();
            });
        } catch (e) {
            console.log('testDeviceKvStoreDeleteBool001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreOnChange001', 0, async function (done) {
        try {
            kvStore.on('dataChange', 0, function (data) {
                console.log('testDeviceKvStoreOnChange001 0' + JSON.stringify(data))
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
                console.log('testDeviceKvStoreOnChange001 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.log('testDeviceKvStoreOnChange001 put fail ' + error);
                expect(null).assertFail();
            });
        }catch(e) {
            console.log('testDeviceKvStoreOnChange001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreOnChange002', 0, async function (done) {
        try {
            kvStore.on('dataChange', 1, function (data) {
                console.log('testDeviceKvStoreOnChange002 0' + JSON.stringify(data))
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
                console.log('testDeviceKvStoreOnChange002 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.log('testDeviceKvStoreOnChange002 put fail ' + error);
                expect(null).assertFail();
            });
        }catch(e) {
            console.log('testDeviceKvStoreOnChange002 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreOnChange003', 0, async function (done) {
        try {
            kvStore.on('dataChange', 2, function (data) {
                console.log('testDeviceKvStoreOnChange003 0' + JSON.stringify(data))
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_FLOAT_ELEMENT, VALUE_TEST_FLOAT_ELEMENT).then((data) => {
                console.log('testDeviceKvStoreOnChange003 put success');
                expect(data == undefined).assertTrue();
            }).catch((error) => {
                console.log('testDeviceKvStoreOnChange003 put fail ' + error);
                expect(null).assertFail();
            });
        }catch(e) {
            console.log('testDeviceKvStoreOnChange003 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreOnSyncComplete001', 0, async function (done) {
        try {
            kvStore.on('syncComplete', function (data) {
                console.log('testDeviceKvStoreOnSyncComplete001 0' + data)
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_SYNC_ELEMENT, VALUE_TEST_SYNC_ELEMENT).then((data) => {
                console.log('testDeviceKvStoreOnSyncComplete001 put success');
                expect(data == undefined).assertTrue();
                var devices = ['A12C1F9261528B21F95778D2FDC0B2E33943E6251AC5487F4473D005758905DB'];
                var mode = factory.SyncMode.PULL_ONLY;
                kvStore.sync(devices, mode);
            }).catch((error) => {
                console.log('testDeviceKvStoreOnSyncComplete001 no peer device :e:' + error);
                // expect(null).assertFail();
            });
        }catch(e) {
            console.log('testDeviceKvStoreOnSyncComplete001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreOnSyncComplete002', 0, async function (done) {
        try {
            kvStore.on('syncComplete', function (data) {
                console.log('testDeviceKvStoreOnSyncComplete002 0' + data)
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_SYNC_ELEMENT, VALUE_TEST_SYNC_ELEMENT).then((data) => {
                console.log('testDeviceKvStoreOnSyncComplete002 put success');
                expect(data == undefined).assertTrue();
                var devices = ['A12C1F9261528B21F95778D2FDC0B2E33943E6251AC5487F4473D005758905DB'];
                var mode = factory.SyncMode.PUSH_ONLY;
                kvStore.sync(devices, mode);
            }).catch((error) => {
                console.log('testDeviceKvStoreOnSyncComplete002 no peer device :e:' + error);
                // expect(null).assertFail();
            });
        }catch(e) {
            console.log('testDeviceKvStoreOnSyncComplete002 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreOnSyncComplete003', 0, async function (done) {
        try {
            kvStore.on('syncComplete', function (data) {
                console.log('testDeviceKvStoreOnSyncComplete003 0' + data)
                expect(data != null).assertTrue();
            });
            await kvStore.put(KEY_TEST_SYNC_ELEMENT, VALUE_TEST_SYNC_ELEMENT).then((data) => {
                console.log('testDeviceKvStoreOnSyncComplete003 put success');
                expect(data == undefined).assertTrue();
                var devices = ['A12C1F9261528B21F95778D2FDC0B2E33943E6251AC5487F4473D005758905DB'];
                var mode = factory.SyncMode.PUSH_PULL;
                kvStore.sync(devices, mode);
            }).catch((error) => {
                console.log('testDeviceKvStoreOnSyncComplete003 no peer device :e:' + error);
                // expect(null).assertFail();
            });
        }catch(e) {
            console.log('testDeviceKvStoreOnSyncComplete003 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreOffChange001', 0, async function (done) {
        console.log('testDeviceKvStoreOffChange001');
        try {
            var func = function (data) {
                console.log('testDeviceKvStoreOffChange001 0' + data)
            };
            kvStore.on('dataChange', 0, func);
            kvStore.off('dataChange', func);
        }catch(e) {
            console.log('testDeviceKvStoreOffChange001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreOffChange002', 0, async function (done) {
        console.log('testDeviceKvStoreOffChange002');
        try {
            var func = function (data) {
                console.log('testDeviceKvStoreOffChange002 0' + data)
            };
            var func1 = function (data) {
                console.log('testDeviceKvStoreOffChange002 0' + data)
            };
            kvStore.on('dataChange', 0, func);
            kvStore.on('dataChange', 0, func1);
            kvStore.off('dataChange', func);
        }catch(e) {
            console.log('testDeviceKvStoreOffChange002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreOffChange003', 0, async function (done) {
        console.log('testDeviceKvStoreOffChange003');
        try {
            var func = function (data) {
                console.log('testDeviceKvStoreOffChange003 0' + data)
            };
            var func1 = function (data) {
                console.log('testDeviceKvStoreOffChange003 0' + data)
            };
            kvStore.on('dataChange', 0, func);
            kvStore.on('dataChange', 0, func1);
            kvStore.off('dataChange', func);
            kvStore.off('dataChange', func1);
        }catch(e) {
            console.log('testDeviceKvStoreOffChange003 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreOffChange004', 0, async function (done) {
        console.log('testDeviceKvStoreOffChange004');
        try {
            var func = function (data) {
                console.log('testDeviceKvStoreOffChange004 0' + data)
            };
            kvStore.on('dataChange', 0, func);
            kvStore.off('dataChange');
        }catch(e) {
            console.log('testDeviceKvStoreOffChange004 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreOffSyncComplete001', 0, async function (done) {
        console.log('testDeviceKvStoreOffSyncComplete001');
        try {
            var func = function (data) {
                console.log('testDeviceKvStoreOffSyncComplete001 0' + data)
            };
            kvStore.on('syncComplete', func);
            kvStore.off('syncComplete', func);
        }catch(e) {
            console.log('testDeviceKvStoreOffSyncComplete001 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreOffSyncComplete002', 0, async function (done) {
        console.log('testDeviceKvStoreOffSyncComplete002');
        try {
            var func = function (data) {
                console.log('testDeviceKvStoreOffSyncComplete002 0' + data)
            };
            var func1 = function (data) {
                console.log('testDeviceKvStoreOffSyncComplete002 0' + data)
            };
            kvStore.on('syncComplete', func);
            kvStore.on('syncComplete', func1);
            kvStore.off('syncComplete', func);
            expect(null).assertFail();
        }catch(e) {
            console.log('testDeviceKvStoreOffSyncComplete002 put e ' + e);
            expect(true).assertTrue();
        }
        done();
    })

    it('testDeviceKvStoreOffSyncComplete003', 0, async function (done) {
        console.log('testDeviceKvStoreOffSyncComplete003');
        try {
            var func = function (data) {
                console.log('testDeviceKvStoreOffSyncComplete003 0' + data)
            };
            var func1 = function (data) {
                console.log('testDeviceKvStoreOffSyncComplete003 0' + data)
            };
            kvStore.on('syncComplete', func);
            kvStore.on('syncComplete', func1);
            kvStore.off('syncComplete', func);
            kvStore.off('syncComplete', func1);
            expect(null).assertFail();
        }catch(e) {
            console.log('testDeviceKvStoreOffSyncComplete003 put e ' + e);
            expect(true).assertTrue();
        }
        done();
    })

    it('testDeviceKvStoreOffSyncComplete004', 0, async function (done) {
        console.log('testDeviceKvStoreOffSyncComplete004');
        try {
            var func = function (data) {
                console.log('testDeviceKvStoreOffSyncComplete004 0' + data)
            };
            kvStore.on('syncComplete', func);
            kvStore.off('syncComplete');
        }catch(e) {
            console.log('testDeviceKvStoreOffSyncComplete004 put e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreSetSyncRange001', 0, async function (done) {
        console.log('testDeviceKvStoreSetSyncRange001');
        try {
            var localLabels = ['A', 'B'];
            var remoteSupportLabels = ['C', 'D'];
            await kvStore.setSyncRange(localLabels, remoteSupportLabels).then((err) => {
                console.log('testDeviceKvStoreSetSyncRange001 setSyncRange success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStoreDeleteString003 delete fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.log('testDeviceKvStoreSetSyncRange001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreSetSyncRange002', 0, async function (done) {
        console.log('testDeviceKvStoreSetSyncRange002');
        try {
            var localLabels = ['A', 'B'];
            var remoteSupportLabels = ['B', 'C'];
            await kvStore.setSyncRange(localLabels, remoteSupportLabels).then((err) => {
                console.log('testDeviceKvStoreSetSyncRange002 setSyncRange success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStoreSetSyncRange002 delete fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.log('testDeviceKvStoreSetSyncRange002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreSetSyncRange003', 0, async function (done) {
        console.log('testDeviceKvStoreSetSyncRange003');
        try {
            var localLabels = ['A', 'B'];
            var remoteSupportLabels = ['A', 'B'];
            await kvStore.setSyncRange(localLabels, remoteSupportLabels).then((err) => {
                console.log('testDeviceKvStoreSetSyncRange003 setSyncRange success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStoreSetSyncRange003 delete fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.log('testDeviceKvStoreSetSyncRange003 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStorePutBatch001', 0, async function (done) {
        console.log('testDeviceKvStorePutBatch001');
        try {
            let entries = putBatchString(10, 'batch_test_string_key');
            console.log('testDeviceKvStorePutBatch001 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.log('testDeviceKvStorePutBatch001 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_string_key').then((entrys) => {
                    console.log('testDeviceKvStorePutBatch001 getEntries success');
                    console.log('testDeviceKvStorePutBatch001 entrys.length: ' + entrys.length);
                    console.log('testDeviceKvStorePutBatch001 entrys[0]: ' + JSON.stringify(entrys[0]));
                    console.log('testDeviceKvStorePutBatch001 entrys[0].value: ' + JSON.stringify(entrys[0].value));
                    console.log('testDeviceKvStorePutBatch001 entrys[0].value.value: ' + entrys[0].value.value);
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 'batch_test_string_value').assertTrue();
                }).catch((err) => {
                    console.log('testDeviceKvStorePutBatch001 getEntries fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.log('testDeviceKvStorePutBatch001 putBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.log('testDeviceKvStorePutBatch001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStorePutBatch002', 0, async function (done) {
        console.log('testDeviceKvStorePutBatch002');
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
            console.log('testDeviceKvStorePutBatch002 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.log('testDeviceKvStorePutBatch002 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_number_key').then((entrys) => {
                    console.log('testDeviceKvStorePutBatch002 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 222).assertTrue();
                }).catch((err) => {
                    console.log('testDeviceKvStorePutBatch002 getEntries fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.log('testDeviceKvStorePutBatch002 putBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.log('testDeviceKvStorePutBatch002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStorePutBatch003', 0, async function (done) {
        console.log('testDeviceKvStorePutBatch003');
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
            console.log('testDeviceKvStorePutBatch003 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.log('testDeviceKvStorePutBatch003 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_number_key').then((entrys) => {
                    console.log('testDeviceKvStorePutBatch003 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 2.0).assertTrue();
                }).catch((err) => {
                    console.log('testDeviceKvStorePutBatch003 getEntries fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.log('testDeviceKvStorePutBatch003 putBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.log('testDeviceKvStorePutBatch003 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStorePutBatch004', 0, async function (done) {
        console.log('testDeviceKvStorePutBatch004');
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
            console.log('testDeviceKvStorePutBatch004 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.log('testDeviceKvStorePutBatch004 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_number_key').then((entrys) => {
                    console.log('testDeviceKvStorePutBatch004 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == 2.00).assertTrue();
                }).catch((err) => {
                    console.log('testDeviceKvStorePutBatch004 getEntries fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.log('testDeviceKvStorePutBatch004 putBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.log('testDeviceKvStorePutBatch004 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStorePutBatch005', 0, async function (done) {
        console.log('testDeviceKvStorePutBatch005');
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
            console.log('testDeviceKvStorePutBatch005 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.log('testDeviceKvStorePutBatch005 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_bool_key').then((entrys) => {
                    console.log('testDeviceKvStorePutBatch005 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value == bo).assertTrue();
                }).catch((err) => {
                    console.log('testDeviceKvStorePutBatch005 getEntries fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.log('testDeviceKvStorePutBatch005 putBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.log('testDeviceKvStorePutBatch005 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStorePutBatch006', 0, async function (done) {
        console.log('testDeviceKvStorePutBatch006');
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
            console.log('testDeviceKvStorePutBatch006 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.log('testDeviceKvStorePutBatch006 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.getEntries(localDeviceId, 'batch_test_bool_key').then((entrys) => {
                    console.log('testDeviceKvStorePutBatch006 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
                }).catch((err) => {
                    console.log('testDeviceKvStorePutBatch006 getEntries fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.log('testDeviceKvStorePutBatch006 putBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.log('testDeviceKvStorePutBatch005 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreDeleteBatch001', 0, async function (done) {
        console.log('testDeviceKvStoreDeleteBatch001');
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
            console.log('testDeviceKvStoreDeleteBatch001 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.log('testDeviceKvStoreDeleteBatch001 putBatch success');
                expect(err == undefined).assertTrue();
                await kvStore.deleteBatch(keys).then((err) => {
                    console.log('testDeviceKvStoreDeleteBatch001 deleteBatch success');
                    expect(err == undefined).assertTrue();
                }).catch((err) => {
                    console.log('testDeviceKvStoreDeleteBatch001 deleteBatch fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.log('testDeviceKvStoreDeleteBatch001 putBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.log('testDeviceKvStoreDeleteBatch001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreDeleteBatch002', 0, async function (done) {
        console.log('testDeviceKvStoreDeleteBatch002');
        try {
            let keys = ['batch_test_string_key1', 'batch_test_string_key2'];
            await kvStore.deleteBatch(keys).then((err) => {
                console.log('testDeviceKvStoreDeleteBatch002 deleteBatch success');
            }).catch((err) => {
                console.log('testDeviceKvStoreDeleteBatch002 deleteBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.log('testDeviceKvStoreDeleteBatch002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreDeleteBatch003', 0, async function (done) {
        console.log('testDeviceKvStoreDeleteBatch003');
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
            console.log('testDeviceKvStoreDeleteBatch003 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.log('testDeviceKvStoreDeleteBatch003 putBatch success');
                expect(err == undefined).assertTrue();
                let keys = ['batch_test_string_key1', 'batch_test_string_keya'];
                await kvStore.deleteBatch(keys).then((err) => {
                    console.log('testDeviceKvStoreDeleteBatch003 deleteBatch success');
                }).catch((err) => {
                    console.log('testDeviceKvStoreDeleteBatch003 deleteBatch fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.log('testDeviceKvStoreDeleteBatch003 putBatch fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.log('testDeviceKvStoreDeleteBatch003 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStorestartTransaction001', 0, async function (done) {
        console.log('testDeviceKvStorestartTransaction001');
        try {
            var count = 0;
            kvStore.on('dataChange', 0, function (data) {
                console.log('testDeviceKvStoreOnChange001 0' + JSON.stringify(data))
                count++;
            });
            await kvStore.startTransaction().then(async (err) => {
                console.log('testDeviceKvStorestartTransaction001 startTransaction success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStorestartTransaction001 startTransaction fail ' + err);
                expect(null).assertFail();
            });
            let entries = putBatchString(10, 'batch_test_string_key');
            console.log('testDeviceKvStorestartTransaction001 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.log('testDeviceKvStorestartTransaction001 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStorestartTransaction001 putBatch fail ' + err);
                expect(null).assertFail();
            });
            let keys = Object.keys(entries).slice(5); //delete 5 beginnings
            await kvStore.deleteBatch(keys).then((err) => {
                console.log('testDeviceKvStorestartTransaction001 deleteBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStorestartTransaction001 deleteBatch fail ' + err);
                expect(null).assertFail();
            });
            await kvStore.commit().then(async (err) => {
                console.log('testDeviceKvStorestartTransaction001 commit success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStorestartTransaction001 commit fail ' + err);
                expect(null).assertFail();
            });
            await sleep(2000);
            expect(count == 1).assertTrue();
        }catch(e) {
            console.log('testDeviceKvStorestartTransaction001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStorestartTransaction002', 0, async function (done) {
        console.log('testDeviceKvStorestartTransaction002');
        try {
            var count = 0;
            kvStore.on('dataChange', 0, function (data) {
                console.log('testDeviceKvStoreOnChange001 0' + JSON.stringify(data))
                count++;
            });
            await kvStore.startTransaction().then(async (err) => {
                console.log('testDeviceKvStorestartTransaction002 startTransaction success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStorestartTransaction002 startTransaction fail ' + err);
                expect(null).assertFail();
            });
            let entries = putBatchString(10, 'batch_test_string_key');
            console.log('testDeviceKvStorestartTransaction002 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.log('testDeviceKvStorestartTransaction002 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStorestartTransaction002 putBatch fail ' + err);
                expect(null).assertFail();
            });
            let keys = Object.keys(entries).slice(5); //delete 5 beginnings
            await kvStore.deleteBatch(keys).then((err) => {
                console.log('testDeviceKvStorestartTransaction002 deleteBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStorestartTransaction002 deleteBatch fail ' + err);
                expect(null).assertFail();
            });
            await kvStore.rollback().then(async (err) => {
                console.log('testDeviceKvStorestartTransaction002 rollback success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStorestartTransaction002 rollback fail ' + err);
                expect(null).assertFail();
            });
            await sleep(2000);
            expect(count == 0).assertTrue();
        }catch(e) {
            console.log('testDeviceKvStorestartTransaction002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStorestartTransaction003', 0, async function (done) {
        console.log('testDeviceKvStorestartTransaction002');
        try {
            await kvStore.startTransaction(1).then(async (err) => {
                console.log('testDeviceKvStorestartTransaction003 startTransaction success');
                expect(null).assertFail();
            }).catch((err) => {
                console.log('testDeviceKvStorestartTransaction003 startTransaction fail ' + err);
            });
        }catch(e) {
            console.log('testDeviceKvStorestartTransaction003 e ' + e);
        }
        done();
    })

    it('testDeviceKvStorestartTransaction004', 0, async function (done) {
        console.log('testDeviceKvStorestartTransaction004');
        try {
            await kvStore.startTransaction('test_string').then(async (err) => {
                console.log('testDeviceKvStorestartTransaction004 startTransaction success');
                expect(null).assertFail();
            }).catch((err) => {
                console.log('testDeviceKvStorestartTransaction004 startTransaction fail ' + err);
            });
        }catch(e) {
            console.log('testDeviceKvStorestartTransaction004 e ' + e);
        }
        done();
    })

    it('testDeviceKvStorestartTransaction005', 0, async function (done) {
        console.log('testDeviceKvStorestartTransaction005');
        try {
            await kvStore.startTransaction(2.000).then(async (err) => {
                console.log('testDeviceKvStorestartTransaction005 startTransaction success');
                expect(null).assertFail();
            }).catch((err) => {
                console.log('testDeviceKvStorestartTransaction005 startTransaction fail ' + err);
            });
        }catch(e) {
            console.log('testDeviceKvStorestartTransaction005 e ' + e);
        }
        done();
    })

    it('testDeviceKvStoreCommit001', 0, async function (done) {
        console.log('testDeviceKvStoreCommit001');
        try {
            await kvStore.commit(1).then(async (err) => {
                console.log('testDeviceKvStoreCommit001 commit success');
                expect(null).assertFail();
            }).catch((err) => {
                console.log('testDeviceKvStoreCommit001 commit fail ' + err);
            });
        }catch(e) {
            console.log('testDeviceKvStoreCommit001 e ' + e);
        }
        done();
    })

    it('testDeviceKvStoreCommit002', 0, async function (done) {
        console.log('testDeviceKvStoreCommit002');
        try {
            await kvStore.commit('test_string').then(async (err) => {
                console.log('testDeviceKvStoreCommit002 commit success');
                expect(null).assertFail();
            }).catch((err) => {
                console.log('testDeviceKvStoreCommit002 commit fail ' + err);
            });
        }catch(e) {
            console.log('testDeviceKvStoreCommit002 e ' + e);
        }
        done();
    })

    it('testDeviceKvStoreCommit003', 0, async function (done) {
        console.log('testDeviceKvStoreCommit003');
        try {
            await kvStore.commit(2.000).then(async (err) => {
                console.log('testDeviceKvStoreCommit003 commit success');
                expect(null).assertFail();
            }).catch((err) => {
                console.log('testDeviceKvStoreCommit003 commit fail ' + err);
            });
        }catch(e) {
            console.log('testDeviceKvStoreCommit003 e ' + e);
        }
        done();
    })

    it('testDeviceKvStoreRollback001', 0, async function (done) {
        console.log('testDeviceKvStoreRollback001');
        try {
            await kvStore.rollback(1).then(async (err) => {
                console.log('testDeviceKvStoreRollback001 rollback success');
                expect(null).assertFail();
            }).catch((err) => {
                console.log('testDeviceKvStoreRollback001 rollback fail ' + err);
            });
        }catch(e) {
            console.log('testDeviceKvStoreRollback001 e ' + e);
        }
        done();
    })

    it('testDeviceKvStoreRollback002', 0, async function (done) {
        console.log('testDeviceKvStoreRollback002');
        try {
            await kvStore.rollback('test_string').then(async (err) => {
                console.log('testDeviceKvStoreRollback002 rollback success');
                expect(null).assertFail();
            }).catch((err) => {
                console.log('testDeviceKvStoreRollback002 rollback fail ' + err);
            });
        }catch(e) {
            console.log('testDeviceKvStoreRollback002 e ' + e);
        }
        done();
    })

    it('testDeviceKvStoreRollback003', 0, async function (done) {
        console.log('testDeviceKvStoreRollback003');
        try {
            await kvStore.rollback(2.000).then(async (err) => {
                console.log('testDeviceKvStoreRollback003 rollback success');
                expect(null).assertFail();
            }).catch((err) => {
                console.log('testDeviceKvStoreRollback003 rollback fail ' + err);
            });
        }catch(e) {
            console.log('testDeviceKvStoreRollback003 e ' + e);
        }
        done();
    })

    it('testDeviceKvStoreEnableSync001', 0, async function (done) {
        console.log('testDeviceKvStoreEnableSync001');
        try {
            await kvStore.enableSync(true).then((err) => {
                console.log('testDeviceKvStoreEnableSync001 enableSync success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStoreEnableSync001 enableSync fail ' + err);
                expect(null).assertFail();
            });

        }catch(e) {
            console.log('testDeviceKvStoreEnableSync001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreEnableSync002', 0, async function (done) {
        console.log('testDeviceKvStoreEnableSync002');
        try {
            await kvStore.enableSync(false).then((err) => {
                console.log('testDeviceKvStoreEnableSync002 enableSync success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStoreEnableSync002 enableSync fail ' + err);
                expect(null).assertFail();
            });

        }catch(e) {
            console.log('testDeviceKvStoreEnableSync002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreEnableSync003', 0, async function (done) {
        console.log('testDeviceKvStoreEnableSync003');
        try {
            await kvStore.enableSync().then((err) => {
                console.log('testDeviceKvStoreEnableSync003 enableSync success');
                expect(null).assertFail();
            }).catch((err) => {
                console.log('testDeviceKvStoreEnableSync003 enableSync fail ' + err);
            });
        }catch(e) {
            console.log('testDeviceKvStoreEnableSync003 e ' + e);
        }
        done();
    })

    it('testDeviceKvStoreEnableSync004', 0, async function (done) {
        console.log('testDeviceKvStoreEnableSync004');
        try {
            await kvStore.enableSync(null).then((err) => {
                console.log('testDeviceKvStoreEnableSync004 enableSync success');
                expect(null).assertFail();
            }).catch((err) => {
                console.log('testDeviceKvStoreEnableSync004 enableSync fail ' + err);
            });

        }catch(e) {
            console.log('testDeviceKvStoreEnableSync004 e ' + e);
        }
        done();
    })

    it('testDeviceKvStoreRemoveDeviceData001', 0, async function (done) {
        console.log('testDeviceKvStoreRemoveDeviceData001');
        try {
            await kvStore.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then((err) => {
                console.log('testDeviceKvStoreRemoveDeviceData001 put success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStoreRemoveDeviceData001 put fail ' + err);
                expect(null).assertFail();
            });

            var deviceid = 'no_exist_device_id';
            await kvStore.removeDeviceData(deviceid).then((err) => {
                console.log('testDeviceKvStoreRemoveDeviceData001 removeDeviceData success');
                expect(null).assertFail();
            }).catch((err) => {
                console.log('testDeviceKvStoreRemoveDeviceData001 removeDeviceData fail ' + err);
            });

            await kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT).then((data) => {
                console.log('testDeviceKvStoreRemoveDeviceData001 get success data:' + data);
                expect(data == VALUE_TEST_STRING_ELEMENT).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStoreRemoveDeviceData001 get fail ' + err);
                expect(null).assertFail();
            });

        }catch(e) {
            console.log('testDeviceKvStoreRemoveDeviceData001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreRemoveDeviceData002', 0, async function (done) {
        console.log('testDeviceKvStoreRemoveDeviceData002');
        try {
            await kvStore.removeDeviceData().then((err) => {
                console.log('testDeviceKvStoreRemoveDeviceData002 removeDeviceData success');
                expect(null).assertFail();
            }).catch((err) => {
                console.log('testDeviceKvStoreRemoveDeviceData002 removeDeviceData fail ' + err);
            });
        }catch(e) {
            console.log('testDeviceKvStoreRemoveDeviceData002 e ' + e);
        }
        done();
    })

    it('testDeviceKvStoreRemoveDeviceData003', 0, async function (done) {
        console.log('testDeviceKvStoreRemoveDeviceData003');
        try {
            await kvStore.removeDeviceData('').then((err) => {
                console.log('testDeviceKvStoreRemoveDeviceData003 removeDeviceData success');
                expect(null).assertFail();
            }).catch((err) => {
                console.log('testDeviceKvStoreRemoveDeviceData003 removeDeviceData fail ' + err);
            });
        }catch(e) {
            console.log('testDeviceKvStoreRemoveDeviceData003 e ' + e);
        }
        done();
    })

    it('testDeviceKvStoreRemoveDeviceData004', 0, async function (done) {
        console.log('testDeviceKvStoreRemoveDeviceData004');
        try {
            await kvStore.removeDeviceData(null).then((err) => {
                console.log('testDeviceKvStoreRemoveDeviceData004 removeDeviceData success');
                expect(null).assertFail();
            }).catch((err) => {
                console.log('testDeviceKvStoreRemoveDeviceData004 removeDeviceData fail ' + err);
            });
        }catch(e) {
            console.log('testDeviceKvStoreRemoveDeviceData004 e ' + e);
        }
        done();
    })

    it('testDeviceKvStoreGetResultSet001', 0, async function (done) {
        console.log('testDeviceKvStoreGetResultSet001');
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
                console.log('testDeviceKvStoreGetResultSet001 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStorePutBatch001 putBatch fail ' + err);
                expect(null).assertFail();
            });
            await kvStore.getResultSet(localDeviceId, 'batch_test_string_key').then((result) => {
                console.log('testDeviceKvStoreGetResultSet001 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 10).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStoreGetResultSet001 getResultSet fail ' + err);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.log('testDeviceKvStoreGetResultSet001 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStoreGetResultSet001 closeResultSet fail ' + err);
                expect(null).assertFail();
            });

        }catch(e) {
            console.log('testDeviceKvStoreGetResultSet001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreGetResultSet002', 0, async function (done) {
        console.log('testDeviceKvStoreGetResultSet002');
        try {
            let resultSet;
            await kvStore.getResultSet(localDeviceId, 'batch_test_string_key').then((result) => {
                console.log('testDeviceKvStoreGetResultSet002 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 0).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStoreGetResultSet002 getResultSet fail ' + err);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.log('testDeviceKvStoreGetResultSet002 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStoreGetResultSet002 closeResultSet fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.log('testDeviceKvStoreGetResultSet002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreGetResultSet003', 0, async function (done) {
        console.log('testDeviceKvStoreGetResultSet003');
        try {
            let resultSet;
            await kvStore.getResultSet().then((result) => {
                console.log('testDeviceKvStoreGetResultSet003 getResultSet success');
                expect(null).assertFail();
            }).catch((err) => {
                console.log('testDeviceKvStoreGetResultSet003 getResultSet fail ' + err);

            });
        }catch(e) {
            console.log('testDeviceKvStoreGetResultSet003 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreGetResultSet004', 0, async function (done) {
        console.log('testDeviceKvStoreGetResultSet004');
        try {
            let resultSet;
            await kvStore.getResultSet('test_key_string', 123).then((result) => {
                console.log('testDeviceKvStoreGetResultSet004 getResultSet success');
                expect(null).assertFail();
            }).catch((err) => {
                console.log('testDeviceKvStoreGetResultSet004 getResultSet fail ' + err);

            });
        }catch(e) {
            console.log('testDeviceKvStoreGetResultSet004 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreGetResultSet005', 0, async function (done) {
        console.log('testDeviceKvStoreGetResultSet005');
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
                console.log('testDeviceKvStoreGetResultSet005 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStorePutBatch001 putBatch fail ' + err);
                expect(null).assertFail();
            });
            var query = new factory.Query();
            query.prefixKey("batch_test");
            await kvStore.getResultSet(localDeviceId, query).then((result) => {
                console.log('testDeviceKvStoreGetResultSet005 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 10).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStoreGetResultSet005 getResultSet fail ' + err);
                expect(null).assertFail();
            });
            query.deviceId(localDeviceId);
            console.log("testDeviceKvStoreGetResultSet005 " + query.getSqlLike());
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.log('testDeviceKvStoreGetResultSet005 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStoreGetResultSet005 closeResultSet fail ' + err);
                expect(null).assertFail();
            });

        }catch(e) {
            console.log('testDeviceKvStoreGetResultSet005 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreGetResultSet006', 0, async function (done) {
        console.log('testDeviceKvStoreGetResultSet006');
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
                console.log('testDeviceKvStoreGetResultSet006 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStorePutBatch001 putBatch fail ' + err);
                expect(null).assertFail();
            });
            var query = new factory.Query();
            query.deviceId(localDeviceId);
            query.prefixKey("batch_test");
            console.log("testDeviceKvStoreGetResultSet006 " + query.getSqlLike());
            await kvStore.getResultSet(query).then((result) => {
                console.log('testDeviceKvStoreGetResultSet006 getResultSet success');
                resultSet = result;
                expect(resultSet.getCount() == 10).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStoreGetResultSet006 getResultSet fail ' + err);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.log('testDeviceKvStoreGetResultSet006 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStoreGetResultSet006 closeResultSet fail ' + err);
                expect(null).assertFail();
            });

        }catch(e) {
            console.log('testDeviceKvStoreGetResultSet006 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreCloseResultSet001', 0, async function (done) {
        console.log('testDeviceKvStoreCloseResultSet001');
        try {
            console.log('testDeviceKvStoreCloseResultSet001 success');
            let resultSet = null;
            await kvStore.closeResultSet(resultSet).then(() => {
                console.log('testDeviceKvStoreCloseResultSet001 closeResultSet success');
                expect(null).assertFail();
            }).catch((err) => {
                console.log('testDeviceKvStoreCloseResultSet001 closeResultSet fail ' + err);
            });
        }catch(e) {
            console.log('testDeviceKvStoreCloseResultSet001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreCloseResultSet002', 0, async function (done) {
        console.log('testDeviceKvStoreCloseResultSet002');
        try {
            console.log('testDeviceKvStoreCloseResultSet002 success');
            let resultSet = null;
            await kvStore.getResultSet(localDeviceId, 'batch_test_string_key').then((result) => {
                console.log('testDeviceKvStoreCloseResultSet002 getResultSet success');
                resultSet = result;
            }).catch((err) => {
                console.log('testDeviceKvStoreCloseResultSet002 getResultSet fail ' + err);
                expect(null).assertFail();
            });
            await kvStore.closeResultSet(resultSet).then((err) => {
                console.log('testDeviceKvStoreCloseResultSet002 closeResultSet success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStoreCloseResultSet002 closeResultSet fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.log('testDeviceKvStoreCloseResultSet002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreCloseResultSet003', 0, async function (done) {
        console.log('testDeviceKvStoreCloseResultSet003');
        try {
            console.log('testDeviceKvStoreCloseResultSet003 success');
            let resultSet = null;
            await kvStore.closeResultSet().then(() => {
                console.log('testDeviceKvStoreCloseResultSet003 closeResultSet success');
                expect(null).assertFail();
            }).catch((err) => {
                console.log('testDeviceKvStoreCloseResultSet003 closeResultSet fail ' + err);
            });
        }catch(e) {
            console.log('testDeviceKvStoreCloseResultSet003 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreCloseResultSet004', 0, async function (done) {
        console.log('testDeviceKvStoreCloseResultSet004');
        try {
            // pass query
            console.log('testDeviceKvStoreCloseResultSet004 success');
        }catch(e) {
            console.log('testDeviceKvStoreCloseResultSet004 e ' + e);
            expect(null).assertFail();
        }
        done();
    })


    it('testDeviceKvStoreGetResultSize001', 0, async function (done) {
        console.log('testDeviceKvStoreGetResultSize001');
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
                console.log('testDeviceKvStoreGetResultSize001 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStorePutBatch001 putBatch fail ' + err);
                expect(null).assertFail();
            });
            var query = new factory.Query();
            query.prefixKey("batch_test");
            query.deviceId(localDeviceId);
            await kvStore.getResultSize(query).then((resultSize) => {
                console.log('testDeviceKvStoreGetResultSize001 getResultSet success');
                expect(resultSize == 10).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStoreGetResultSize001 getResultSet fail ' + err);
                expect(null).assertFail();
            });

        }catch(e) {
            console.log('testDeviceKvStoreGetResultSize001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreGetResultSize002', 0, async function (done) {
        console.log('testDeviceKvStoreGetResultSize001');
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
                console.log('testDeviceKvStoreGetResultSize001 putBatch success');
                expect(err == undefined).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStorePutBatch001 putBatch fail ' + err);
                expect(null).assertFail();
            });
            var query = new factory.Query();
            query.prefixKey("batch_test");
            await kvStore.getResultSize(localDeviceId, query).then((resultSize) => {
                console.log('testDeviceKvStoreGetResultSize001 getResultSet success');
                expect(resultSize == 10).assertTrue();
            }).catch((err) => {
                console.log('testDeviceKvStoreGetResultSize001 getResultSet fail ' + err);
                expect(null).assertFail();
            });
        }catch(e) {
            console.log('testDeviceKvStoreGetResultSize001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreGetEntries001', 0, async function (done) {
        console.log('testDeviceKvStoreGetEntries001');
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
            console.log('testDeviceKvStoreGetEntries001 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.log('testDeviceKvStoreGetEntries001 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.deviceId(localDeviceId);
                query.prefixKey("batch_test");
                await kvStore.getEntries(localDeviceId, query).then((entrys) => {
                    console.log('testDeviceKvStoreGetEntries001 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
                }).catch((err) => {
                    console.log('testDeviceKvStoreGetEntries001 getEntries fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.log('testDeviceKvStoreGetEntries001 putBatch fail ' + err);
                expect(null).assertFail();
            });
            console.log('testDeviceKvStoreGetEntries001 success');
        }catch(e) {
            console.log('testDeviceKvStoreGetEntries001 e ' + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceKvStoreGetEntries002', 0, async function (done) {
        console.log('testDeviceKvStoreGetEntries002');
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
            console.log('testDeviceKvStoreGetEntries002 entries: ' + JSON.stringify(entries));
            await kvStore.putBatch(entries).then(async (err) => {
                console.log('testDeviceKvStoreGetEntries002 putBatch success');
                expect(err == undefined).assertTrue();
                var query = new factory.Query();
                query.prefixKey("batch_test");
                query.deviceId(localDeviceId);
                await kvStore.getEntries(query).then((entrys) => {
                    console.log('testDeviceKvStoreGetEntries002 getEntries success');
                    expect(entrys.length == 10).assertTrue();
                    expect(entrys[0].value.value.toString() == arr.toString()).assertTrue();
                }).catch((err) => {
                    console.log('testDeviceKvStoreGetEntries002 getEntries fail ' + err);
                    expect(null).assertFail();
                });
            }).catch((err) => {
                console.log('testDeviceKvStoreGetEntries002 putBatch fail ' + err);
                expect(null).assertFail();
            });
            console.log('testDeviceKvStoreGetEntries002 success');
        }catch(e) {
            console.log('testDeviceKvStoreGetEntries002 e ' + e);
            expect(null).assertFail();
        }
        done();
    })
})