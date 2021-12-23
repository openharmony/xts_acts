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

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}
describe('FieldNodeTest', function() {

    // appendChild(child: FieldNode): boolean 
    it('testAppendChild001', 0, async function(done) {
        try {
            let node = new ddm.FieldNode("root");
            let child1 = new ddm.FieldNode("child1");
            let child2 = new ddm.FieldNode("child2");
            let child3 = new ddm.FieldNode("child3");
            node.appendChild(child1);
            node.appendChild(child2);
            node.appendChild(child3);
            console.log("appendNode " + node.toJson());
            child1 = null;
            child2 = null;
            child3 = null;
            node = null;
        } catch (e) {
            console.log("testAppendChild001 " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testAppendChild002', 0, async function(done) {
        try {
            let node = new ddm.FieldNode("root");
            let child = new ddm.FieldNode("child");
            node.appendChild(child);
            console.log("appendNode " + node.toJson());
            child = null;
            node = null;
        } catch (e) {
            console.log("testAppendChild002 " + e);
        }
        done();
    })

    it('testAppendChild003', 0, async function(done) {
        try {
            let node = new ddm.FieldNode("root");
            let child = new ddm.FieldNode();
            node.appendChild(child);
            console.log("appendNode " + node.toJson());
            expect(null).assertFail();
        } catch (e) {
            console.log("testAppendChild003 is ok :" + e);
        }
        done();
    })

    // toJson(): string
    it('testToJson001', 0, async function(done) {
        try {
            let node = new ddm.FieldNode("root");
            let child = new ddm.FieldNode("child");
            node.appendChild(child);
            console.log("appendNode " + node.toJson());
        } catch (e) {
            expect(null).assertFail();
        }
        done();
    })

    it('testToJson002', 0, async function(done) {
        try {
            let node = new ddm.FieldNode("root");
            let child = new ddm.FieldNode("child");
            node.appendChild(child);
            console.log("appendNode " + node.toJson());
        } catch (e) {
            expect(null).assertFail();
        }
        done();
    })

    it('testToJson003', 0, async function(done) {
        try {
            let node = new ddm.FieldNode();
            let child = new ddm.FieldNode();
            node.appendChild(child);
            console.log("appendNode " + node.toJson());
            expect(null).assertFail();
        } catch (e) {
            console.log("testToJson003 is ok : " + e);
        }
        done();
    })
})