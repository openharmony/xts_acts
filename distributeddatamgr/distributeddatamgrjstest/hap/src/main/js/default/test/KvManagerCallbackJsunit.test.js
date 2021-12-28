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

describe('KVManagerCallbackTest', function () {
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
        await factory.createKVManager(config, function (err, manager) {
            kvManager = manager;
            done();
        });
        console.log('beforeAll end');
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
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, async function () {
            console.log('afterEach closeKVStore success');
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function () {
                console.log('afterEach deleteKVStore success');
                done();
            });
        });
    })

    it('testKVManagerGetKVStore101', 0, async function (done) {
        console.log('testKVManagerGetKVStore101');
        try {
            await kvManager.getKVStore(TEST_STORE_ID, options, function (err, store) {
                console.log('testKVManagerGetKVStore101 getKVStore success');
                kvStore = store;
                done();
            });
        } catch (e) {
            console.log('testKVManagerGetKVStore101 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testKVManagerGetKVStore102', 0, async function (done) {
        console.log('testKVManagerGetKVStore102');
        try {
            await kvManager.getKVStore(options, function (err, store) {
                if (err == undefined) {
                    console.log('testKVManagerGetKVStore102 getKVStore success');
                    expect(null).assertFail();
                } else {
                    console.log('testKVManagerGetKVStore102 getKVStore fail');
                }
                done();
            });
        } catch (e) {
            console.log('testKVManagerGetKVStore102 getKVStore e ' + e);
            done();
        }
    })

    it('testKVManagerGetKVStore103', 0, async function (done) {
        console.log('testKVManagerGetKVStore103');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.log('testKVManagerGetKVStore103 getKVStore success');
                console.log('testKVManagerGetKVStore103 err ' + err + ' store ' + store);
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.log('testKVManagerGetKVStore103 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testKVManagerGetKVStore104', 0, async function (done) {
        console.log('testKVManagerGetKVStore104');
        const optionsInfo = {
            createIfMissing : false, // when false getkvstore error
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                if (err == undefined) {
                    console.log('testKVManagerGetKVStore104 getKVStore success');
                    expect(null).assertFail();
                } else {
                    console.log('testKVManagerGetKVStore104 getKVStore fail');
                }
                done();
            });
        } catch (e) {
            console.log('testKVManagerGetKVStore104 getKVStore e ' + e);
            done();
        }
    })

    it('testKVManagerGetKVStore105', 0, async function (done) {
        console.log('testKVManagerGetKVStore105');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : true,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.log('testKVManagerGetKVStore105 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.log('testKVManagerGetKVStore105 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testKVManagerGetKVStore106', 0, async function (done) {
        console.log('testKVManagerGetKVStore106');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.log('testKVManagerGetKVStore106 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.log('testKVManagerGetKVStore106 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testKVManagerGetKVStore107', 0, async function (done) {
        console.log('testKVManagerGetKVStore107');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : true,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.log('testKVManagerGetKVStore107 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.log('testKVManagerGetKVStore107 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testKVManagerGetKVStore108', 0, async function (done) {
        console.log('testKVManagerGetKVStore108');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.log('testKVManagerGetKVStore108 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.log('testKVManagerGetKVStore108 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testKVManagerGetKVStore109', 0, async function (done) {
        console.log('testKVManagerGetKVStore109');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.log('testKVManagerGetKVStore109 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.log('testKVManagerGetKVStore109 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testKVManagerGetKVStore110', 0, async function (done) {
        console.log('testKVManagerGetKVStore110');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : false,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.log('testKVManagerGetKVStore110 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.log('testKVManagerGetKVStore110 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testKVManagerGetKVStore111', 0, async function (done) {
        console.log('testKVManagerGetKVStore111');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.log('testKVManagerGetKVStore111 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.log('testKVManagerGetKVStore111 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testKVManagerGetKVStore112', 0, async function (done) {
        console.log('testKVManagerGetKVStore112');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.DEVICE_COLLABORATION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.log('testKVManagerGetKVStore112 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.log('testKVManagerGetKVStore112 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testKVManagerGetKVStore113', 0, async function (done) {
        console.log('testKVManagerGetKVStore113');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.MULTI_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                if (err == undefined) {
                    console.log('testKVManagerGetKVStore113 getKVStore success');
                    expect(null).assertFail();
                } else {
                    console.log('testKVManagerGetKVStore113 getKVStore fail');
                }
                done();
            });
        } catch (e) {
            console.log('testKVManagerGetKVStore113 getKVStore e ' + e);
            done();
        }
    })

    it('testKVManagerGetKVStore114', 0, async function (done) {
        console.log('testKVManagerGetKVStore114');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.NO_LEVEL,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.log('testKVManagerGetKVStore114 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.log('testKVManagerGetKVStore114 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testKVManagerGetKVStore115', 0, async function (done) {
        console.log('testKVManagerGetKVStore115');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S0,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.log('testKVManagerGetKVStore115 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.log('testKVManagerGetKVStore115 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testKVManagerGetKVStore116', 0, async function (done) {
        console.log('testKVManagerGetKVStore116');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S1,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.log('testKVManagerGetKVStore116 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.log('testKVManagerGetKVStore116 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testKVManagerGetKVStore117', 0, async function (done) {
        console.log('testKVManagerGetKVStore117');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S2,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.log('testKVManagerGetKVStore117 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.log('testKVManagerGetKVStore117 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testKVManagerGetKVStore118', 0, async function (done) {
        console.log('testKVManagerGetKVStore118');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S3,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.log('testKVManagerGetKVStore118 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.log('testKVManagerGetKVStore118 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testKVManagerGetKVStore119', 0, async function (done) {
        console.log('testKVManagerGetKVStore119');
        const optionsInfo = {
            createIfMissing : true,
            encrypt : false,
            backup : false,
            autoSync : true,
            kvStoreType : factory.KVStoreType.SINGLE_VERSION,
            schema : '',
            securityLevel : factory.SecurityLevel.S4,
        }
        try {
            await kvManager.getKVStore(TEST_STORE_ID, optionsInfo, function (err, store) {
                console.log('testKVManagerGetKVStore119 getKVStore success');
                expect((err == undefined) && (store != null)).assertTrue();
                kvStore = store;
                done();
            });
        } catch (e) {
            console.log('testKVManagerGetKVStore119 getKVStore e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testKVManagerCloseKVStore101', 0, async function (done) {
        console.log('testKVManagerCloseKVStore101');
        try {
            await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
                console.log('testKVManagerCloseKVStore101 getKVStore success');
                kvStore = store;
                await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, function (err, data) {
                    console.log('testKVManagerCloseKVStore101 closeKVStore success');
                    expect((err == undefined) && (data == undefined)).assertTrue();
                    done();
                });
            });
        } catch (e) {
            console.log('testKVManagerCloseKVStore101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testKVManagerCloseKVStore102', 0, async function (done) {
        console.log('testKVManagerCloseKVStore102');
        try {
            await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
                console.log('testKVManagerCloseKVStore102 getKVStore success');
                kvStore = store;
                try {
                    await kvManager.closeKVStore(TEST_BUNDLE_NAME, function (err, data) {
                        if (err == undefined) {
                            console.log('testKVManagerCloseKVStore102 closeKVStore success');
                            expect(null).assertFail();
                        } else {
                            console.log('testKVManagerCloseKVStore102 closeKVStore fail');
                        }
                        done();
                    });
                } catch (e) {
                    console.log('testKVManagerCloseKVStore102 closeKVStore e ' + e);
                    done();
                }
            });
        } catch (ee) {
            console.log('testKVManagerCloseKVStore102 getKVStore ee ' + ee);
            expect(null).assertFail();
            done();
        }
    })

    it('testKVManagerCloseKVStore103', 0, async function (done) {
        console.log('testKVManagerCloseKVStore103');
        try {
            await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
                console.log('testKVManagerCloseKVStore103 getKVStore success');
                kvStore = store;
                try {
                    await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
                        if (err == undefined) {
                            console.log('testKVManagerCloseKVStore103 closeKVStore success');
                            expect(null).assertFail();
                        } else {
                            console.log('testKVManagerCloseKVStore103 closeKVStore fail');
                        }
                        done();
                    });
                } catch (e) {
                    console.log('testKVManagerCloseKVStore103 closeKVStore e ' + e);
                    done();
                }
            });
        } catch (ee) {
            console.log('testKVManagerCloseKVStore103 getKVStore ee ' + ee);
            expect(null).assertFail();
            done();
        }
    })

    it('testKVManagerCloseKVStore104', 0, async function (done) {
        console.log('testKVManagerCloseKVStore104');
        try {
            await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore, function (err, data) {
                console.log('testKVManagerCloseKVStore104 closeKVStore success');
                expect((err == undefined) && (data == undefined)).assertTrue();
                done();
            });
        } catch (e) {
            console.log('testKVManagerCloseKVStore104 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testKVManagerDeleteKVStore101', 0, async function (done) {
        console.log('testKVManagerDeleteKVStore101');
        try {
            await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
                console.log('testKVManagerDeleteKVStore101 getKVStore success');
                kvStore = store;
                await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
                    console.log('testKVManagerDeleteKVStore101 deleteKVStore success');
                    expect((err == undefined) && (data == undefined)).assertTrue();
                    done();
                });
            });
        } catch (e) {
            console.log('testKVManagerDeleteKVStore101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testKVManagerDeleteKVStore102', 0, async function (done) {
        console.log('testKVManagerDeleteKVStore102');
        try {
            await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
                console.log('testKVManagerDeleteKVStore102 getKVStore success');
                kvStore = store;
                try {
                    await kvManager.deleteKVStore(TEST_BUNDLE_NAME, function (err, data) {
                        if (err == undefined) {
                            console.log('testKVManagerDeleteKVStore102 deleteKVStore success');
                            expect(null).assertFail();
                        } else {
                            console.log('testKVManagerDeleteKVStore102 deleteKVStore fail');
                        }
                        done();
                    });
                } catch (e) {
                    console.log('testKVManagerDeleteKVStore102 deleteKVStore e ' + e);
                    done();
                }
            });
        } catch (ee) {
            console.log('testKVManagerDeleteKVStore102 getKVStore ee ' + ee);
            expect(null).assertFail();
            done();
        }
    })

    it('testKVManagerDeleteKVStore103', 0, async function (done) {
        console.log('testKVManagerDeleteKVStore103');
        try {
            await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, function (err, data) {
                if (err == undefined){
                    console.log('testKVManagerDeleteKVStore103 deleteKVStore success');
                    expect(null).assertFail();
                } else {
                    console.log('testKVManagerDeleteKVStore103 deleteKVStore fail');
                }
                done();
            });
        } catch (e) {
            console.log('testKVManagerDeleteKVStore103 e ' + e);
            done();
        }
    })

    it('testKVManagerGetAllKVStoreId101', 0, async function (done) {
        console.log('testKVManagerGetAllKVStoreId101');
        try {
            await kvManager.getAllKVStoreId(TEST_BUNDLE_NAME, function (err, data) {
                console.log('testKVManagerGetAllKVStoreId101 getAllKVStoreId success');
                console.log('testKVManagerGetAllKVStoreId101 size = ' + data.length);
                expect(0).assertEqual(data.length);
                done();
            });
        } catch (e) {
            console.log('testKVManagerGetAllKVStoreId101 e ' + e);
            expect(null).assertFail();
            done();
        }
    })

    it('testKVManagerGetAllKVStoreId102', 0, async function (done) {
        console.log('testKVManagerGetAllKVStoreId102');
        try {
            await kvManager.getKVStore(TEST_STORE_ID, options, async function (err, store) {
                console.log('testKVManagerGetAllKVStoreId102 getKVStore success');
                kvStore = store;
                try {
                    await kvManager.getAllKVStoreId(TEST_BUNDLE_NAME, function (err, data) {
                        console.log('testKVManagerGetAllKVStoreId102 getAllKVStoreId success');
                        console.log('testKVManagerGetAllKVStoreId102 size = ' + data.length);
                        expect(1).assertEqual(data.length);
                        console.log('testKVManagerGetAllKVStoreId102 data[0] = ' + data[0]);
                        expect(TEST_STORE_ID).assertEqual(data[0]);
                        done();
                    });
                } catch (e) {
                    console.log('testKVManagerGetAllKVStoreId102 getAllKVStoreId e ' + e);
                    expect(null).assertFail();
                    done();
                }
            });
        } catch (ee) {
            console.log('testKVManagerGetAllKVStoreId102 getKVStore ee ' + ee);
            expect(null).assertFail();
            done();
        }
    })
})