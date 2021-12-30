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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'
import ddm from '@ohos.data.distributedData';

const TEST_BUNDLE_NAME = 'ohos.acts.distributeddatamgr';

const config = {
    bundleName : TEST_BUNDLE_NAME,
    userInfo : {
        userId : '0',
        userType : ddm.UserType.SAME_USER_ID
    }
}

describe('SchemaTest', function() {

    // toJsonString():string
    it('testToJsonString001', 0, async function(done) {
        try {
            let schema = new ddm.Schema();
            var str = schema.toJsonString();
            console.log("schema: " + str);
        } catch (e) {
            expect(null).assertFail();
        }
        done();
    })

    it('testToJsonString002', 0, async function(done) {
        try {
            let schema = new ddm.Schema();
            var str = schema.toJsonString();
            console.log("testToJsonString002: " + str);
            const options = {
                createIfMissing : true,
                encrypt : false,
                backup : false,
                autoSync : true,
                kvStoreType : ddm.KVStoreType.SINGLE_VERSION,
                schema : str,
                securityLevel : ddm.SecurityLevel.S2,
            }
            console.log("testToJsonString002: createKVManager (single) with " + JSON.stringify(options));
            await ddm.createKVManager(config).then((manager) => {
                var kvManager = manager;
                console.log('testToJsonString002 createKVManager success');
            }).catch((err) => {
                console.log('testToJsonString002 createKVManager err ' + err);
            });

        } catch (e) {
            expect(null).assertFail();
        }
        done();
    })

    it('testToJsonString003', 0, async function(done) {
        try {
            let schema = new ddm.Schema();
            var str = schema.toJsonString();
            console.log("testToJsonString003: " + str);

            const options = {
                createIfMissing : true,
                encrypt : false,
                backup : false,
                autoSync : true,
                kvStoreType : ddm.KVStoreType.DEVICE_COLLABORATION,
                schema : str,
                securityLevel : ddm.SecurityLevel.S2,
            }
            console.log("testToJsonString003: createKVManager (device) with " + JSON.stringify(options));
            await ddm.createKVManager(config).then((manager) => {
                var kvManager = manager;
                console.log('testToJsonString003 createKVManager success');
            }).catch((err) => {
                console.log('testToJsonString003 createKVManager err ' + err);
            });

        } catch (e) {
            expect(null).assertFail();
        }
        done();
    })
})