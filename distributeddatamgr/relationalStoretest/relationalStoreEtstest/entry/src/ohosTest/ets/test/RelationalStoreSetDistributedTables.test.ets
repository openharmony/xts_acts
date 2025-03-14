/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';
import data_relationalStore from '@ohos.data.relationalStore';
import common from '@ohos.app.ability.common';
import deviceInfo from '@ohos.deviceInfo';

let context: common.UIAbilityContext;

const TAG = "[tttttt]";

let rdbStore: data_relationalStore.RdbStore | undefined = undefined;
const dbName = "LockRowTest.db";
const TABLE = 'lockrowtest';
const LOG_TABLE = "naturalbase_rdb_aux_" + TABLE + "_log";
const CHECK_STATUS = "SELECT " + LOG_TABLE + ".status FROM " + LOG_TABLE + " INNER JOIN " + TABLE + " ON " +
    LOG_TABLE + ".data_key = " + TABLE + ".ROWID WHERE " + TABLE + ".name = '";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS " + TABLE + " (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
    "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL)";
let STORE_CONFIG:data_relationalStore.StoreConfig = {
    name: dbName,
    securityLevel: data_relationalStore.SecurityLevel.S1,
}

const asset1:data_relationalStore.Asset = {
    name: "name2",
    uri: "uri2",
    createTime: "createTime2",
    modifyTime: "modifyTime2",
    size: "size2",
    path: "path2",
    status: data_relationalStore.AssetStatus.ASSET_NORMAL,
}
const asset2:data_relationalStore.Asset = {
    name: "name3",
    uri: "uri3",
    createTime: "createTime3",
    modifyTime: "modifyTime3",
    size: "size3",
    path: "path3",
    status: data_relationalStore.AssetStatus.ASSET_NORMAL,
}

export default function relationalStoreSetDistributedTables() {
    describe('RelationalStoreSetDistributedTables', () => {
        let currentDeviceIsWatch: boolean= false;
        beforeAll((done:Function) => {
            console.info('window_layout_test beforeAll begin');
            let deviceTypeInfo = deviceInfo.deviceType;
            currentDeviceIsWatch = deviceTypeInfo === 'wearable' ? true : false;
            console.info('the value of the deviceType is :' + deviceInfo.deviceType);
            console.info('window_layout_test beforeAll end');
            done();
        });
        beforeEach(async (done:Function) => {
            console.log(TAG + 'beforeEach');
        });
        afterEach(async (done:Function) => {
            console.log(TAG + 'afterEach');
            rdbStore.close();
            rdbStore = null;
            await data_relationalStore.deleteRdbStore(context, "LockRowTest.db");
            done();
        });
        afterAll(async (done:Function) => {
            console.log(TAG + 'afterAll');
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0100
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables params: setConfig={autoSync: false} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0100', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0100 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                const setConfig:data_relationalStore.DistributedConfig = {
                    autoSync: false,
                };
                await rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
                    setConfig);
                console.log(TAG + "set test to be distributed table success");
                done();
            } catch (err) {
                console.log(TAG + "set test to be distributed table failed");
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0100 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0200
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables params: setConfig={autoSync: false,asyncDownloadAsset:false,} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0200', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0200 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                const setConfig:data_relationalStore.DistributedConfig = {
                    autoSync: false,
                    asyncDownloadAsset: false,
                };
                await rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
                    setConfig);
                console.log(TAG + "set test to be distributed table success");
                done();
            } catch (err) {
                console.log(TAG + "set test to be distributed table failed");
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0200 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0300
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables params: setConfig={autoSync: false,asyncDownloadAsset:false,enableCloud:false,} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0300', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0300 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                const setConfig:data_relationalStore.DistributedConfig = {
                    autoSync: false,
                    asyncDownloadAsset: false,
                    enableCloud: false,
                };
                await rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
                    setConfig);
                console.log(TAG + "set test to be distributed table success");
                done();
            } catch (err) {
                console.log(TAG + "set test to be distributed table failed");
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0300 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0400
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables params: setConfig={autoSync: false,asyncDownloadAsset:false,enableCloud:true,} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0400', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0400 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                const setConfig:data_relationalStore.DistributedConfig = {
                    autoSync: false,
                    asyncDownloadAsset: false,
                    enableCloud: true,
                };
                await rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
                    setConfig);
                console.log(TAG + "set test to be distributed table success");
                done();
            } catch (err) {
                console.log(TAG + "set test to be distributed table failed");
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0400 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0500
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables params: setConfig={autoSync: false,asyncDownloadAsset:true,} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0500', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0500 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                const setConfig:data_relationalStore.DistributedConfig = {
                    autoSync: false,
                    asyncDownloadAsset: true,
                };
                await rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
                    setConfig);
                console.log(TAG + "set test to be distributed table success");
                done();
            } catch (err) {
                console.log(TAG + "set test to be distributed table failed");
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0500 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0600
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables params: setConfig={autoSync: false,asyncDownloadAsset:true,enableCloud:true,} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0600', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0600 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                const setConfig:data_relationalStore.DistributedConfig = {
                    autoSync: false,
                    asyncDownloadAsset: true,
                    enableCloud: true,
                };
                await rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
                    setConfig);
                console.log(TAG + "set test to be distributed table success");
                done();
            } catch (err) {
                console.log(TAG + "set test to be distributed table failed");
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0600 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0700
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables params: setConfig={autoSync: false,asyncDownloadAsset:true,enableCloud:false,} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0700', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0700 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                const setConfig:data_relationalStore.DistributedConfig = {
                    autoSync: false,
                    asyncDownloadAsset: true,
                    enableCloud: false,
                };
                await rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
                    setConfig);
                console.log(TAG + "set test to be distributed table success");
                done();
            } catch (err) {
                console.log(TAG + "set test to be distributed table failed");
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0700 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0800
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables params: setConfig={autoSync: true,} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0800', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0800 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                const setConfig:data_relationalStore.DistributedConfig = {
                    autoSync: true,
                };
                await rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
                    setConfig);
                console.log(TAG + "set test to be distributed table success");
                done();
            } catch (err) {
                console.log(TAG + "set test to be distributed table failed");
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0800 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0900
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables params: setConfig={autoSync: true,asyncDownloadAsset:false,} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0900', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0900 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                const setConfig:data_relationalStore.DistributedConfig = {
                    autoSync: true,
                    asyncDownloadAsset: false,
                };
                await rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
                    setConfig);
                console.log(TAG + "set test to be distributed table success");
                done();
            } catch (err) {
                console.log(TAG + "set test to be distributed table failed");
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0900 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1000
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables params: setConfig={autoSync: true,asyncDownloadAsset:false,enableCloud:false,} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1000', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1000 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                const setConfig:data_relationalStore.DistributedConfig = {
                    autoSync: true,
                    asyncDownloadAsset: false,
                    enableCloud: false,
                };
                await rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
                    setConfig);
                console.log(TAG + "set test to be distributed table success");
                done();
            } catch (err) {
                console.log(TAG + "set test to be distributed table failed");
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1000 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1100
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables params: setConfig={autoSync: true,asyncDownloadAsset:false,enableCloud:true,} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1100', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1100 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                const setConfig:data_relationalStore.DistributedConfig = {
                    autoSync: true,
                    asyncDownloadAsset: false,
                    enableCloud: true,
                };
                await rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
                    setConfig);
                console.log(TAG + "set test to be distributed table success");
                done();
            } catch (err) {
                console.log(TAG + "set test to be distributed table failed");
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1100 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1200
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables params: setConfig={autoSync: true,asyncDownloadAsset:true} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1200', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1200 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                const setConfig:data_relationalStore.DistributedConfig = {
                    autoSync: true,
                    asyncDownloadAsset: true,
                };
                await rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
                    setConfig);
                console.log(TAG + "set test to be distributed table success");
                done();
            } catch (err) {
                console.log(TAG + "set test to be distributed table failed");
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1200 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1300
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables params: setConfig={autoSync: true,asyncDownloadAsset:true,enableCloud:true,} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1300', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1300 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                const setConfig:data_relationalStore.DistributedConfig = {
                    autoSync: true,
                    asyncDownloadAsset: true,
                    enableCloud: true,
                };
                await rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
                    setConfig);
                console.log(TAG + "set test to be distributed table success");
                done();
            } catch (err) {
                console.log(TAG + "set test to be distributed table failed");
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1300 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1400
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables params: setConfig={autoSync: true,asyncDownloadAsset:true,enableCloud:false,} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1400', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1400 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                const setConfig:data_relationalStore.DistributedConfig = {
                    autoSync: true,
                    asyncDownloadAsset: true,
                    enableCloud: false,
                };
                await rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
                    setConfig);
                console.log(TAG + "set test to be distributed table success");
                done();
            } catch (err) {
                console.log(TAG + "set test to be distributed table failed");
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1400 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1400
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables params: setConfig={autoSync: true,asyncDownloadAsset:true,enableCloud:false,} DistributedType is DISTRIBUTED_DEVICE
         *          return 14800000
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1500', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1500 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                const setConfig:data_relationalStore.DistributedConfig = {
                    autoSync: false,
                };
                await rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_DEVICE,
                    setConfig);
                console.log(TAG + "set test to be distributed table success");
                done();
            } catch (err) {
                console.log(TAG + "set test to be distributed table failed" + err.code + err.message);
                expect(err.code).assertEqual(14800000);
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1500 end   *************");
        });

        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1600
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables params: setConfig={autoSync: true,asyncDownloadAsset:true,enableCloud:false,} DistributedType is DISTRIBUTED_DEVICE
         *          return 14800014
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1600', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1600 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            rdbStore.close();
            try {
                let tableArray = [TABLE];
                const setConfig:data_relationalStore.DistributedConfig = {
                    autoSync: true,
                    asyncDownloadAsset: true,
                    enableCloud: false,
                };
                await rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
                    setConfig);
                expect().assertFail();
                done();
            } catch (err) {
                console.log(TAG + "err code:" + err.code + "err message:" + err.message);
                expect(err.code).assertEqual("14800014");
                rdbStore = null;
                await data_relationalStore.deleteRdbStore(context, "LockRowTest.db");
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1600 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1700
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables callback params: setConfig={autoSync: true,} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1700', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1700 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
                    autoSync: false
                }, (err) => {
                    console.log(TAG +"SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1700  111111111111");
                    if (err) {
                        console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
                        console.log(TAG +"SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1700  222222222");
                        expect().assertFail();
                        done();
                    }
                    console.info('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1700 SetDistributedTables successfully.');
                    done();
                });
            } catch (err) {
                console.log(TAG + "err code:" + err.code + "err message:" + err.message);
                console.log(TAG +"SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1700  3333333");
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1700 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1800
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables callback params: setConfig={autoSync: true,asyncDownloadAsset:true} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1800', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1800 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
                    autoSync: true,
                    asyncDownloadAsset: true
                }, (err) => {
                    if (err) {
                        console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                    console.info('SetDistributedTables successfully.');
                    done();
                });
            } catch (err) {
                console.log(TAG + "err code:" + err.code + "err message:" + err.message);
                expect().assertFail();
                done();
            }
            
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1800 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1900
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables callback params: setConfig={autoSync: true,asyncDownloadAsset:false} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1900', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1900 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
                    autoSync: true,
                    asyncDownloadAsset: false
                }, (err) => {
                    if (err) {
                        console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                    console.info('SetDistributedTables successfully.');
                    done();
                });
            } catch (err) {
                console.log(TAG + "err code:" + err.code + "err message:" + err.message);
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1900 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2000
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables callback params: setConfig={autoSync: false,asyncDownloadAsset:true} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2000', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2000 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
                    autoSync: false,
                    asyncDownloadAsset: true
                }, (err) => {
                    if (err) {
                        console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                    console.info('SetDistributedTables successfully.');
                    done();
                });
            } catch (err) {
                console.log(TAG + "err code:" + err.code + "err message:" + err.message);
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2000 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2100
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables callback params: setConfig={autoSync: false,asyncDownloadAsset:false} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2100', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2100 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
                    autoSync: false,
                    asyncDownloadAsset: false
                }, (err) => {
                    if (err) {
                        console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                    console.info('SetDistributedTables successfully.');
                    done();
                });
            } catch (err) {
                console.log(TAG + "err code:" + err.code + "err message:" + err.message);
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2100 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2200
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables callback params: setConfig={autoSync: false,asyncDownloadAsset:false,enableCloud:false} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2200', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2200 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
                    autoSync: false,
                    asyncDownloadAsset: false,
                    enableCloud: false
                }, (err) => {
                    if (err) {
                        console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                    console.info('SetDistributedTables successfully.');
                    done();
                });
            } catch (err) {
                console.log(TAG + "err code:" + err.code + "err message:" + err.message);
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2200 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2300
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables callback params: setConfig={autoSync: false,asyncDownloadAsset:false,enableCloud:true} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2300', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2300 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
                    autoSync: false,
                    asyncDownloadAsset: false,
                    enableCloud: true
                }, (err) => {
                    if (err) {
                        console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                    console.info('SetDistributedTables successfully.');
                    done();
                });
            } catch (err) {
                console.log(TAG + "err code:" + err.code + "err message:" + err.message);
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2300 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2400
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables callback params: setConfig={autoSync: false,asyncDownloadAsset:true,enableCloud:false} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2400', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2400 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
                    autoSync: false,
                    asyncDownloadAsset: true,
                    enableCloud: false
                }, (err) => {
                    if (err) {
                        console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                    console.info('SetDistributedTables successfully.');
                    done();
                });
            } catch (err) {
                console.log(TAG + "err code:" + err.code + "err message:" + err.message);
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2400 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2500
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables callback params: setConfig={autoSync: false,asyncDownloadAsset:true,enableCloud:true} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2500', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2500 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
                    autoSync: false,
                    asyncDownloadAsset: true,
                    enableCloud: true
                }, (err) => {
                    if (err) {
                        console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                    console.info('SetDistributedTables successfully.');
                    done();
                });
            } catch (err) {
                console.log(TAG + "err code:" + err.code + "err message:" + err.message);
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2500 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2600
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables callback params: setConfig={autoSync: true,asyncDownloadAsset:false,enableCloud:false} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2600', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2600 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
                    autoSync: true,
                    asyncDownloadAsset: false,
                    enableCloud: false
                }, (err) => {
                    if (err) {
                        console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                    console.info('SetDistributedTables successfully.');
                    done();
                });
            } catch (err) {
                console.log(TAG + "err code:" + err.code + "err message:" + err.message);
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2600 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2700
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables callback params: setConfig={autoSync: true,asyncDownloadAsset:false,enableCloud:true} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2700', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2700 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
                    autoSync: true,
                    asyncDownloadAsset: false,
                    enableCloud: true
                }, (err) => {
                    if (err) {
                        console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                    console.info('SetDistributedTables successfully.');
                    done();
                });
            } catch (err) {
                console.log(TAG + "err code:" + err.code + "err message:" + err.message);
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2700 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2800
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables callback params: setConfig={autoSync: true,asyncDownloadAsset:true,enableCloud:false} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2800', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2800 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
                    autoSync: true,
                    asyncDownloadAsset: true,
                    enableCloud: false
                }, (err) => {
                    if (err) {
                        console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                    console.info('SetDistributedTables successfully.');
                    done();
                });
            } catch (err) {
                console.log(TAG + "err code:" + err.code + "err message:" + err.message);
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2800 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2900
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables callback params: setConfig={autoSync: true,asyncDownloadAsset:true,enableCloud:true} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2900', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2900 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
                    autoSync: true,
                    asyncDownloadAsset: true,
                    enableCloud: true
                }, (err) => {
                    if (err) {
                        console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                    console.info('SetDistributedTables successfully.');
                    done();
                });
            } catch (err) {
                console.log(TAG + "err code:" + err.code + "err message:" + err.message);
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2900 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_3000
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables callback params: setConfig={autoSync: true,asyncDownloadAsset:true,enableCloud:true} DistributedType is DISTRIBUTED_CLOUD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_3000', 0, async (done:Function) => {
            console.log(TAG + "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_3000 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            try {
                let tableArray = [TABLE];
                rdbStore.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
                autoSync: true,
                asyncDownloadAsset: false,
                enableCloud: false
                }, async (err) => {
                if (err) {
                    console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
                    expect().assertFail();
                    done();
                }
                console.info('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_3000 SetDistributedTables successfully.');
                let u8 = new Uint8Array([4, 5, 6]);
                const valueBucket1: data_relationalStore.ValuesBucket = {
                    'name': "zhangsan",
                    'age': 18,
                    'salary': 100.5
                };
                const valueBucket2: data_relationalStore.ValuesBucket = {
                    'name': "lisi",
                    'age': 18,
                    'salary': 100.5,
                };
                if (rdbStore != undefined ) {
                    let rowId: number = await rdbStore.insert(TABLE, valueBucket1);
                    console.log(TAG + "rowId:" + rowId);
                    let predicates = new data_relationalStore.RdbPredicates("lockrowtest");
                    predicates.equalTo("name", "zhangsan");
                    let resultSet: data_relationalStore.ResultSet = await rdbStore.query(predicates, ["id", "name", "age", "salary"]);
                    console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
                    expect(resultSet.rowCount).assertEqual(1);
                    rdbStore.update(valueBucket2, predicates, (err, rows) => {
                        if (err) {
                            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
                            expect().assertFail();
                            done();
                        }
                        console.info(`update rows: ${rows}`);
                        expect(rows).assertEqual(1);
                    });
                    predicates = new data_relationalStore.RdbPredicates("lockrowtest");
                    predicates.equalTo("name", "lisi");
                    rdbStore.delete(predicates, (err, rows) => {
                        if (err) {
                            console.error(`Delete failed, code is ${err.code},message is ${err.message}`);
                            expect().assertFail();
                            done();
                        }
                        console.info(`Delete rows: ${rows}`);
                        expect(rows).assertEqual(1);
                        done();
                    });
                } else {
                    expect().assertFail();
                    done();
                }
                })
            } catch (err) {
                console.log(TAG + "err code:" + err.code + "err message:" + err.message);
                expect().assertFail();
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_3000 end   *************");
        });
        /**
         * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_3100
         * @tc.name Normal test case of original state
         * @tc.desc 1.setDistributedTables params: setConfig={autoSync: true,asyncDownloadAsset:true,enableCloud:false,} DistributedType is data_relationalStore.DistributedType = 3;
         *          return 401
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_3100', 0, async (done:Function) => {
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_3100 start *************");
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            let num: data_relationalStore.DistributedType = 3;
            try {
                let tableArray = [TABLE];
                const setConfig:data_relationalStore.DistributedConfig = {
                    autoSync: true,
                    asyncDownloadAsset: true,
                    enableCloud: false,
                };
                await rdbStore.setDistributedTables(tableArray, num, setConfig);
                expect().assertFail();
                done();
            } catch (err) {
                console.log(TAG + "err code:" + err.code + "err message:" + err.message);
                expect(err.code).assertEqual("401");
                done();
            }
            console.log(TAG +
                "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_3100 end   *************");
        });
    })
}