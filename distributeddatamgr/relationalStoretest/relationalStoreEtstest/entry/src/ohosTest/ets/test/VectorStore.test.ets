/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import data_Rdb from '@ohos.data.relationalStore';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { ValuesBucket } from '@kit.ArkData';

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const RDB_DB_ICUNAME = "VectorStoreTest.db";

const TAG = "[RelationalStore_Ets_TEST >>>>>> ]"

const STORE_CONFIG: data_Rdb.StoreConfig = {
    name: RDB_DB_ICUNAME,
    securityLevel: data_Rdb.SecurityLevel.S1,
    tokenizer: data_Rdb.Tokenizer.ICU_TOKENIZER,
    vector: true
}

let rdbStore:data_Rdb.RdbStore;


export default function VectorStoreTest() {
    describe('VectorStoreTest', () => {
        beforeAll(async () => {
            console.info(TAG + 'beforeAll');
        });
        beforeEach(async () => {
            console.info(TAG + 'beforeEach');
        });
        afterEach(async () => {
            console.info(TAG + 'afterEach');

        });
        afterAll(async () => {
            console.info(TAG + 'afterAll');
            await data_Rdb.deleteRdbStore(context, RDB_DB_ICUNAME);
        });
        console.info(TAG + "*************Unit Test Begin*************");
        /**
         * @tc.name VectorStoreTest0100
         * @tc.number SUB_DistributedData_RelationalStore_SDK_VectorEtsAPITest_0100
         * @tc.desc VectorEtsAPITest isVectorSupported
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('VectorStoreTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuInsert0100 ";
            const res = data_Rdb.isVectorSupported();
            console.info(TAGTEST + "res=" + res);
            if (res == false) {
                console.info(TAGTEST + "false res =" + res);
                try {
                    rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
                    console.info(TAGTEST + "success getRdbStore. rdbStore=" + rdbStore);
                    expect().assertFail();

                } catch(err){
                    console.info(TAGTEST + "fail getRdbStore, code=" + err.code + err.message);
                    expect(801).assertEqual(err.code);
                }

            } else {
                console.info(TAGTEST + "true res=" + res);
                try {
                    rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
                    console.info(TAGTEST + "success getRdbStore. rdbStore=" + rdbStore);
                    expect(rdbStore != null).assertTrue();
                } catch(err){
                    console.info(TAGTEST + "fail getRdbStore, code=" + err.code + err.message);
                    expect().assertFail();
                }
            }
            console.info(TAGTEST + " ************* End*************");
            done();
        });
        console.info(TAG + " *************Unit Test End*************");
    })
}
