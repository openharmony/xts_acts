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
            schema.root = new ddm.FieldNode();
            var node = schema.root;
            console.log("schema: " + str);
        } catch (e) {
            expect(null).assertFail();
        }
        done();
    })

    it('testToJsonString003', 0, async function(done) {
        try {
            let schema = new ddm.Schema();
            var str = schema.toJsonString();
            console.log("schema: " + str);
        } catch (e) {
            expect(null).assertFail();
        }
        done();
    })
})