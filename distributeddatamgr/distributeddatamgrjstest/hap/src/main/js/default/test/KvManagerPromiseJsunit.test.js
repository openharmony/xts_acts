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
import factory from '@ohos.data.distributedData';

const TEST_BUNDLE_NAME = 'ohos.acts.distributeddatamgr';
const TEST_STORE_ID = 'storeId';
var kvManager = null;
var kvStore = null;

describe('KVManagerPromiseTest', function () {
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
        kvStoreType : factory.KVStoreType.SINGLE_VERSION,
        schema : '',
        securityLevel : factory.SecurityLevel.S2,
    }

    beforeAll(async function (done) {
        console.log('beforeAll');
        await factory.createKVManager(config).then((manager) => {
            kvManager = manager;
            console.log('beforeAll createKVManager success');
        }).catch((err) => {
            console.log('beforeAll createKVManager err ' + err);
        });
        console.log('beforeAll end');
        done();
    })

    afterAll(async function (done) {
        console.log('afterAll');
        done();
    })

    beforeEach(async function (done) {
        console.log('beforeEach');
        done();
    })

    afterEach(async function (done) {
        console.log('afterEach');
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore).then(async () => {
            console.log('afterEach closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
                console.log('afterEach deleteKVStore success');
            }).catch((err) => {
                console.log('afterEach deleteKVStore err ' + err);
            });
        }).catch((err) => {
            console.log('afterEach closeKVStore err ' + err);
        });
        done();
    })

    it('testKVManagerGetKVStore001', 0, async function (done) {
        console.log('testKVManagerGetKVStore001');
        try {
            await kvManager.getKVStore(TEST_STORE_ID).then((store) => {
                console.log('testKVManagerGetKVStore001 getKVStore success');
                expect(null).assertFail();
            }).catch((err) => {
                console.log('testKVManagerGetKVStore001 getKVStore err ' + err);
            });
        }catch(e) {
            console.log('testKVManagerGetKVStore001 getKVStore e ' + e);
        }
        done();
    })

    it('testKVManagerGetKVStore002', 0, async function (done) {
        console.log('testKVManagerGetKVStore002');
        try {
            await kvManager.getKVStore(options).then((store) => {
                console.log('testKVManagerGetKVStore002 getKVStore success');
                expect(null).assertFail();
            }).catch((err) => {
                console.log('testKVManagerGetKVStore002 getKVStore err ' + err);
            });
        }catch(e) {
            console.log('testKVManagerGetKVStore002 getKVStore e ' + e);
        }
        done();
    })

    it('testKVManagerGetKVStore003', 0, async function (done) {
        console.log('testKVManagerGetKVStore003');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.log('testKVManagerGetKVStore003 getKVStore success');
            kvStore = store;
            expect(store != null).assertTrue();
        }).catch((err) => {
            console.log('testKVManagerGetKVStore003 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    it('testKVManagerGetKVStore004', 0, async function (done) {
        console.log('testKVManagerGetKVStore004');
        const optionsInfo = {
            createIfMissing : false, // when false getkvstore error
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.log('testKVManagerGetKVStore004 getKVStore success');
            expect(null).assertFail();
        }).catch((err) => {
            console.log('testKVManagerGetKVStore004 getKVStore err ' + err);
        });
        done();
    })

    it('testKVManagerGetKVStore005', 0, async function (done) {
        console.log('testKVManagerGetKVStore005');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : true,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.log('testKVManagerGetKVStore005 getKVStore success');
            kvStore = store;
            expect(store != null).assertTrue();
        }).catch((err) => {
            console.log('testKVManagerGetKVStore005 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    it('testKVManagerGetKVStore006', 0, async function (done) {
        console.log('testKVManagerGetKVStore006');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.log('testKVManagerGetKVStore006 getKVStore success');
            kvStore = store;
            expect(store != null).assertTrue();
        }).catch((err) => {
            console.log('testKVManagerGetKVStore006 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    it('testKVManagerGetKVStore007', 0, async function (done) {
        console.log('testKVManagerGetKVStore006');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : true,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.log('testKVManagerGetKVStore007 getKVStore success');
            kvStore = store;
            expect(store != null).assertTrue();
        }).catch((err) => {
            console.log('testKVManagerGetKVStore007 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    it('testKVManagerGetKVStore008', 0, async function (done) {
        console.log('testKVManagerGetKVStore008');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.log('testKVManagerGetKVStore008 getKVStore success');
            kvStore = store;
            expect(store != null).assertTrue();
        }).catch((err) => {
            console.log('testKVManagerGetKVStore008 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    it('testKVManagerGetKVStore009', 0, async function (done) {
        console.log('testKVManagerGetKVStore009');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.log('testKVManagerGetKVStore009 getKVStore success');
            kvStore = store;
            expect(store != null).assertTrue();
        }).catch((err) => {
            console.log('testKVManagerGetKVStore009 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    it('testKVManagerGetKVStore010', 0, async function (done) {
        console.log('testKVManagerGetKVStore010');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : false,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.log('testKVManagerGetKVStore010 getKVStore success');
            kvStore = store;
            expect(store != null).assertTrue();
        }).catch((err) => {
            console.log('testKVManagerGetKVStore010 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    it('testKVManagerGetKVStore011', 0, async function (done) {
        console.log('testKVManagerGetKVStore011');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.log('testKVManagerGetKVStore011 getKVStore success');
            kvStore = store;
            expect(store != null).assertTrue();
        }).catch((err) => {
            console.log('testKVManagerGetKVStore011 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    it('testKVManagerGetKVStore012', 0, async function (done) {
        console.log('testKVManagerGetKVStore012');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.DEVICE_COLLABORATION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.log('testKVManagerGetKVStore012 getKVStore success');
            kvStore = store;
            expect(store != null).assertTrue();
        }).catch((err) => {
            console.log('testKVManagerGetKVStore012 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    it('testKVManagerGetKVStore013', 0, async function (done) {
        console.log('testKVManagerGetKVStore013');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.MULTI_VERSION, // unsupport MULTI_VERSION
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
                console.log('testKVManagerGetKVStore013 getKVStore success');
                expect(null).assertFail();
            }).catch((err) => {
                console.log('testKVManagerGetKVStore013 getKVStore err ' + err);
            });
        }catch(e) {
            console.log('testKVManagerGetKVStore013 getKVStore e ' + e);
        }
        done();
    })

    it('testKVManagerGetKVStore014', 0, async function (done) {
        console.log('testKVManagerGetKVStore014');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.NO_LEVEL,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.log('testKVManagerGetKVStore014 getKVStore success');
            kvStore = store;
            expect(store != null).assertTrue();
        }).catch((err) => {
            console.log('testKVManagerGetKVStore014 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    it('testKVManagerGetKVStore015', 0, async function (done) {
        console.log('testKVManagerGetKVStore015');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S0,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.log('testKVManagerGetKVStore015 getKVStore success');
            kvStore = store;
            expect(store != null).assertTrue();
        }).catch((err) => {
            console.log('testKVManagerGetKVStore015 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    it('testKVManagerGetKVStore016', 0, async function (done) {
        console.log('testKVManagerGetKVStore016');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S1,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.log('testKVManagerGetKVStore016 getKVStore success');
            kvStore = store;
            expect(store != null).assertTrue();
        }).catch((err) => {
            console.log('testKVManagerGetKVStore016 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    it('testKVManagerGetKVStore017', 0, async function (done) {
        console.log('testKVManagerGetKVStore017');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.log('testKVManagerGetKVStore017 getKVStore success');
            kvStore = store;
            expect(store != null).assertTrue();
        }).catch((err) => {
            console.log('testKVManagerGetKVStore017 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    it('testKVManagerGetKVStore018', 0, async function (done) {
        console.log('testKVManagerGetKVStore018');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S3,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.log('testKVManagerGetKVStore018 getKVStore success');
            kvStore = store;
            expect(store != null).assertTrue();
        }).catch((err) => {
            console.log('testKVManagerGetKVStore018 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    it('testKVManagerGetKVStore019', 0, async function (done) {
        console.log('testKVManagerGetKVStore019');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S4,
        }
        await kvManager.getKVStore(TEST_STORE_ID, optionsInfo).then((store) => {
            console.log('testKVManagerGetKVStore019 getKVStore success');
            kvStore = store;
            expect(store != null).assertTrue();
        }).catch((err) => {
            console.log('testKVManagerGetKVStore019 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    it('testKVManagerCloseKVStore001', 0, async function (done) {
        console.log('testKVManagerCloseKVStore001');
        await kvManager.getKVStore(TEST_STORE_ID, options).then(async (store) => {
            console.log('testKVManagerCloseKVStore001 getKVStore success');
            kvStore = store;
            await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore).then(() => {
                console.log('testKVManagerCloseKVStore001 closeKVStore success');
            }).catch((err) => {
                console.log('testKVManagerCloseKVStore001 closeKVStore err ' + err);
                expect(null).assertFail();
            });
        }).catch((err) => {
            console.log('testKVManagerCloseKVStore001 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    it('testKVManagerCloseKVStore002', 0, async function (done) {
        console.log('testKVManagerCloseKVStore002');
        await kvManager.getKVStore(TEST_STORE_ID, options).then(async (store) => {
            console.log('testKVManagerCloseKVStore002 getKVStore success');
            kvStore = store;
            try {
                await kvManager.closeKVStore(TEST_BUNDLE_NAME).then(() => {
                    console.log('testKVManagerCloseKVStore002 closeKVStore success');
                    expect(null).assertFail();
                }).catch((err) => {
                    console.log('testKVManagerCloseKVStore002 closeKVStore err ' + err);
                });
            }catch(e) {
                console.log('testKVManagerCloseKVStore002 closeKVStore e ' + e);
            }
        }).catch((err) => {
            console.log('testKVManagerCloseKVStore002 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    it('testKVManagerCloseKVStore003', 0, async function (done) {
        console.log('testKVManagerCloseKVStore003');
        await kvManager.getKVStore(TEST_STORE_ID, options).then(async (store) => {
            console.log('testKVManagerCloseKVStore003 getKVStore success');
            kvStore = store;
            try {
                await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
                    console.log('testKVManagerCloseKVStore003 closeKVStore success');
                    expect(null).assertFail();
                }).catch((err) => {
                    console.log('testKVManagerCloseKVStore003 closeKVStore err ' + err);
                });
            }catch(e) {
                console.log('testKVManagerCloseKVStore003 closeKVStore e ' + e);
            }
        }).catch((err) => {
            console.log('testKVManagerCloseKVStore003 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    it('testKVManagerCloseKVStore004', 0, async function (done) {
        console.log('testKVManagerCloseKVStore004');
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore).then(() => {
            console.log('testKVManagerCloseKVStore004 closeKVStore success');
        }).catch((err) => {
            console.log('testKVManagerCloseKVStore004 closeKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    it('testKVManagerDeleteKVStore001', 0, async function (done) {
        console.log('testKVManagerDeleteKVStore001');
        await kvManager.getKVStore(TEST_STORE_ID, options).then(async (store) => {
            console.log('testKVManagerDeleteKVStore001 getKVStore success');
            kvStore = store;
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
                console.log('testKVManagerDeleteKVStore001 deleteKVStore success');
            }).catch((err) => {
                console.log('testKVManagerDeleteKVStore001 deleteKVStore err ' + err);
                expect(null).assertFail();
            });
        }).catch((err) => {
            console.log('testKVManagerDeleteKVStore001 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    it('testKVManagerDeleteKVStore002', 0, async function (done) {
        console.log('testKVManagerDeleteKVStore002');
        await kvManager.getKVStore(TEST_STORE_ID, options).then(async (store) => {
            console.log('testKVManagerDeleteKVStore002 getKVStore success');
            kvStore = store;
            try {
                await kvManager.deleteKVStore(TEST_BUNDLE_NAME).then(() => {
                    console.log('testKVManagerDeleteKVStore002 deleteKVStore success');
                    expect(null).assertFail();
                }).catch((err) => {
                    console.log('testKVManagerDeleteKVStore002 deleteKVStore err ' + err);
                });
            }catch(e){
                console.log('testKVManagerDeleteKVStore002 deleteKVStore e ' + e);
            }
        }).catch((err) => {
            console.log('testKVManagerDeleteKVStore002 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    it('testKVManagerDeleteKVStore003', 0, async function (done) {
        console.log('testKVManagerDeleteKVStore003');
        await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
            console.log('testKVManagerDeleteKVStore003 deleteKVStore success');
            expect(null).assertFail();
        }).catch((err) => {
            console.log('testKVManagerDeleteKVStore003 deleteKVStore err ' + err);
        });
        done();
    })

    it('testKVManagerGetAllKVStoreId001', 0, async function (done) {
        console.log('testKVManagerGetAllKVStoreId001');
        await kvManager.getAllKVStoreId(TEST_BUNDLE_NAME).then((data) => {
            console.log('testKVManagerGetAllKVStoreId001 getAllKVStoreId success');
            console.log('testKVManagerGetAllKVStoreId001 size = ' + data.length);
            expect(0).assertEqual(data.length);
        }).catch((err) => {
            console.log('testKVManagerGetAllKVStoreId001 getAllKVStoreId err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    it('testKVManagerGetAllKVStoreId002', 0, async function (done) {
        console.log('testKVManagerGetAllKVStoreId002');
        await kvManager.getKVStore(TEST_STORE_ID, options).then(async (store) => {
            console.log('testKVManagerGetAllKVStoreId002 getKVStore success');
            kvStore = store;
            await kvManager.getAllKVStoreId(TEST_BUNDLE_NAME).then((data) => {
                console.log('testKVManagerGetAllKVStoreId002 getAllKVStoreId success');
                console.log('testKVManagerGetAllKVStoreId002 size = ' + data.length);
                expect(1).assertEqual(data.length);
                console.log('testKVManagerGetAllKVStoreId002 data[0] = ' + data[0]);
                expect(TEST_STORE_ID).assertEqual(data[0]);
            }).catch((err) => {
                console.log('testKVManagerGetAllKVStoreId002 getAllKVStoreId err ' + err);
                expect(null).assertFail();
            });
        }).catch((err) => {
            console.log('testKVManagerGetAllKVStoreId002 getKVStore err ' + err);
            expect(null).assertFail();
        });
        done();
    })

    it('testKVManagerOn001', 0, function (done) {
        console.log('testKVManagerOn001');
        var deathCallback = function () {
            console.log('death callback call');
        }
        kvManager.on('distributedDataServiceDie', deathCallback);
        kvManager.off('distributedDataServiceDie', deathCallback);
        done();
    })

    it('testKVManagerOn002', 0, function (done) {
        console.log('testKVManagerOn002');
        var deathCallback1 = function () {
            console.log('death callback call');
        }
        var deathCallback2 = function () {
            console.log('death callback call');
        }
        kvManager.on('distributedDataServiceDie', deathCallback1);
        kvManager.on('distributedDataServiceDie', deathCallback2);
        kvManager.off('distributedDataServiceDie', deathCallback1);
        kvManager.off('distributedDataServiceDie', deathCallback2);
        done();
    })

    it('testKVManagerOn003', 0, function (done) {
        console.log('testKVManagerOn003');
        var deathCallback = function () {
            console.log('death callback call');
        }
        kvManager.on('distributedDataServiceDie', deathCallback);
        kvManager.on('distributedDataServiceDie', deathCallback);
        kvManager.off('distributedDataServiceDie', deathCallback);
        done();
    })

    it('testKVManagerOff001', 0, function (done) {
        console.log('testKVManagerOff001');
        var deathCallback = function () {
            console.log('death callback call');
        }
        kvManager.off('distributedDataServiceDie', deathCallback);
        done();
    })

    it('testKVManagerOff002', 0, function (done) {
        console.log('testKVManagerOff002');
        var deathCallback = function () {
            console.log('death callback call');
        }
        kvManager.on('distributedDataServiceDie', deathCallback);
        kvManager.off('distributedDataServiceDie', deathCallback);
        done();
    })

    it('testKVManagerOff003', 0, function (done) {
        console.log('testKVManagerOff003');
        var deathCallback1 = function () {
            console.log('death callback call');
        }
        var deathCallback2 = function () {
            console.log('death callback call');
        }
        kvManager.on('distributedDataServiceDie', deathCallback1);
        kvManager.on('distributedDataServiceDie', deathCallback2);
        kvManager.off('distributedDataServiceDie', deathCallback1);
        done();
    })

    it('testKVManagerOff004', 0, function (done) {
        console.log('testKVManagerOff004');
        var deathCallback = function () {
            console.log('death callback call');
        }
        kvManager.on('distributedDataServiceDie', deathCallback);
        kvManager.off('distributedDataServiceDie', deathCallback);
        kvManager.off('distributedDataServiceDie', deathCallback);
        done();
    })

    it('testKVManagerOff005', 0, function (done) {
        console.log('testKVManagerOff001');
        var deathCallback = function () {
            console.log('death callback call');
        }
        kvManager.on('distributedDataServiceDie', deathCallback);
        kvManager.off('distributedDataServiceDie');
        done();
    })
})