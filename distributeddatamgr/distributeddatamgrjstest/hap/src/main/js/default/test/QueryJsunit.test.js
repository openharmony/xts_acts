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

describe('QueryTest', function() {

    // reset
    it('testReset001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.equalTo("test", 3);
            console.log("query is " + query.getSqlLike());
            expect(query.getSqlLike() !== "").assertTrue();
            query.reset();
            expect("").assertEqual(query.getSqlLike());
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("simply calls should be ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testReset002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.equalTo("number", 5);
            query.equalTo("string", 'v');
            query.equalTo("boolean", false);
            console.log("query is " + query.getSqlLike());
            expect(query.getSqlLike() !== "").assertTrue();
            query.reset();
            query.reset();
            query.reset();
            expect("").assertEqual(query.getSqlLike());
            console.log("sql after  reset: " + query.getSqlLike());
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testReset003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.equalTo("key", "value");
            expect(query.getSqlLike() !== "").assertTrue();
            let sql = query.getSqlLike();
            query.reset().equalTo("key", "value");
            console.log("query is " + query.getSqlLike());
            expect(sql === query.getSqlLike()).assertTrue();
            query = null;
        } catch (e) {
            console.log("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testReset004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.equalTo("key", "value");
            expect(query.getSqlLike() !== "").assertTrue();
            query.reset(3);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    // equalTo
    it('testEqaulTo001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.equalTo("key1", 5);       // number - interger?
            query.equalTo("key2", 5.0);     // number - double?
            query.equalTo("key3", false);   // bool
            query.equalTo("key3", "string");// string
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testEqualTo002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.equalTo("key1", 1).equalTo("key2", 2).equalTo("key3", 3);
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testEqualTo003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.equalTo("key2", NaN);
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
        } catch (e) {
            expect(null).assertFail();
        }
        done();
    })

    it('testEqualTo004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.equalTo("key1", "value", "too more");
            console.log("should throw exception on invalid arguments");
            console.log("query is " + query.getSqlLike());
            query = null;
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    // notEqualTo
    it('testNotEqualTo001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key1", 5);       // number - interger?
            query.notEqualTo("key2", 5.0);     // number - double?
            query.notEqualTo("key3", false);   // bool
            query.notEqualTo("key4", "string");// string
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testNotEqualTo002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", 5);
            query.reset();
            query.notEqualTo("key0", 5).equalTo("key1", 5).notEqualTo("key2", "str").notEqualTo("key3", false);
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testNotEqualTo003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key2", NaN);
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            expect(null).assertFail();
        }
        done();
    })

    it('testNotEqualTo004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key1", "value", "too more", 4);
            console.log("should throw exception on invalid arguments");
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    // greaterThan
    it('testGreaterThan001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.greaterThan("key1", 5);       // number - interger?
            query.greaterThan("key2", 5.0);     // number - double?
            query.greaterThan("key3", true);   // bool
            query.greaterThan("key4", "string");// string
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testGreatThan002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.greaterThan("key", 5);
            query.reset();
            query.greaterThan("key0", 5).greaterThan("key1", "v5").greaterThan("key3", false);
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testGreatThan003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.greaterThan("key2", NaN); // how to get NaN?
            console.log("should throw exception on invalid arguments");
            console.log("query is " + query.getSqlLike());
        } catch (e) {
            expect(null).assertFail();
        }
        done();
    })

    it('testGreatThan004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.greaterThan("key1", "value", "too more", 4);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    // lessThan
    it('testLessThan001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.lessThan("key1", 5);       // number - interger?
            query.lessThan("key2", 5.0);     // number - double?
            query.lessThan("key3", true);   // bool
            query.lessThan("key4", "string");// string
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("dumplicated calls should be ok : " + e);
        }
        done();
    })

    it('testLessThan002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.lessThan("key", 5);
            query.reset();
            query.lessThan("key0", 5).lessThan("key1", "v5").lessThan("key3", false);
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("should be ok on Method Chaining : " + e);
            expect(null).assertTrue();
        }
        done();
    })

    it('testLessThan003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.lessThan("key2", NaN);
            console.log("query is " + query.getSqlLike());
        } catch (e) {
            expect(null).assertFail();
        }
        done();
    })

    it('testLessThan004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.lessThan("key1", "value", "too more", 4);
            console.log("query is " + query.getSqlLike());
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })
    // greaterThanOrEqualTo
    it('testGreaterThanOrEqualTo001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.greaterThanOrEqualTo("key1", 5);       // number - interger?
            query.greaterThanOrEqualTo("key2", 5.0);     // number - double?
            query.greaterThanOrEqualTo("key3", true);   // bool
            query.greaterThanOrEqualTo("key4", "string");// string
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testGreaterThanOrEqualTo002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.greaterThanOrEqualTo("key", 5);
            query.reset();
            query.greaterThanOrEqualTo("key0", 5)
                .greaterThanOrEqualTo("key1", "v5")
                .greaterThanOrEqualTo("key3", false);
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testGreaterThanOrEqualTo003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.greaterThanOrEqualTo("key2", NaN);
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
        } catch (e) {
            expect(null).assertFail();
        }
        done();
    })

    it('testGreaterThanOrEqualTo004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.greaterThanOrEqualTo("key1", "value", "too more", 4);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    // lessThanOrEqualTo
    it('testLessThanOrEqualTo001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.lessThanOrEqualTo("key1", 5);       // number - interger?
            query.lessThanOrEqualTo("key2", 5.0);     // number - double?
            query.lessThanOrEqualTo("key3", true);   // bool
            query.lessThanOrEqualTo("key4", "string");// string
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testLessThanOrEqualTo002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.lessThanOrEqualTo("key", 5);
            query.reset();
            query.lessThanOrEqualTo("key0", 5).lessThanOrEqualTo("key1", "v5").lessThanOrEqualTo("key3", false);
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testLessThanOrEqualTo003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.lessThanOrEqualTo("key2", NaN);
            console.log("query is " + query.getSqlLike());
        } catch (e) {
            expect(null).assertFail();
        }
        done();
    })

    it('testLessThanOrEqualTo004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.lessThanOrEqualTo("key1", "value", "too more", 4);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    // isNull
    it('testIsNull001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.isNull("key");
            query.isNull("key2");
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testIsNull002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.isNull("key").notEqualTo("key1", 4).isNull("key2");
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testIsNull003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.isNUll("key", 0);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    it('testIsNull004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.isNUll(0);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    /*
    * =======================================================================================
    *           Int8Array             |  INTEGER
    *           Uint8Array            |  INTEGER
    *           Uint8ClampedArray     |  INTEGER
    *           Int16Array            |  INTEGER
    *           Uint16Array           |  INTEGER
    *           Int32Array            |  INTEGER
    *           Uint32Array           |  LONG
    *           Float32Array          |  DOUBLE
    *           Float64Array          |  DOUBLE
    *           BigInt64Array         |  ERROR: cannot convert to bigint
    *           BigUint64Array        |  ERROR: cannot convert to bigint
    * =======================================================================================
	*           Array                 |  DOUBLE    * not-typedArray treated as array of double.
    */
    // inNumber
    it('testInNumber001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            console.log("testInNumber001 start ");
            var i8 = new Int8Array([-21,31]);
            query.reset().inNumber("key", i8);
            console.log("inNumber(Int8Array([-21,31])  => " + query.getSqlLike());
            var u8 = new Uint8Array([-21,31]);
            query.reset().inNumber("key", u8);
            console.log("inNumber(Uint8Array([-21,31])  => " + query.getSqlLike());
            var c8 = new Uint8ClampedArray([-21,31]);
            query.reset().inNumber("key", c8);
            console.log("inNumber(Uint8Array([-21,31])  => " + query.getSqlLike());
            var i16 = new Int16Array([-21,31]);
            query.reset().inNumber("key", i16);
            console.log("inNumber(Int16Array([-21,31])  => " + query.getSqlLike());
            var u16 = new Uint16Array([-21,31]);
            query.reset().inNumber("key", u16);
            console.log("inNumber(Uint16Array([-21,31])  => " + query.getSqlLike());
            var i32 = new Int32Array([-21, 31]);
            query.reset().inNumber("key", i32);
            console.log("inNumber(Int32Array([-21,31])  => " + query.getSqlLike());
            var u32 = new Uint32Array([-21, 31]);
            query.reset().inNumber("key", u32);
            console.log("inNumber(UInt32Array([-21,31])  => " + query.getSqlLike());
            var f32 = new Float32Array([-21, 31]);
            query.reset().inNumber("key", f32);
            console.log("inNumber(Float32Array([-21,31])  => " + query.getSqlLike());
            var f32e = new Float32Array([21, 31, "a"]); // "a" will be ignored as not a float.
            query.reset().inNumber("key", f32e);
            console.log("inNumber(Float32Array([-21,31, 'a'])  => " + query.getSqlLike());
            var f64 = new Float64Array([-21, 31]);
            query.reset().inNumber("key", f64);
            console.log("inNumber(Float64Array([-21,31])  => " + query.getSqlLike());
            query.reset();
            query = null;
        } catch (e) {
            console.log("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testInNumber002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.inNumber("key", [1, 2.3, 987654]).
                inNumber("key2", [0x10abcdef]).
                inNumber("key2", [0xf0123456]).
                inNumber("key2", [0b10101]);
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testInNumber003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.inNumber("key", 0);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    it('testInNumber004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.inNumber([0, 1]);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    it('testInNumber005', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());

            // var u64 = new BigUint64Array([21n, 31n]); // build error.
            var u64 = new BigUint64Array([21, 31]); // cannot convert to bigint
            query.inNumber("key", u64);

            // var b64 = new BigInt64Array([21n, 31n]); // build error.
            var b64 = new BigInt64Array([21, 31]); // cannot convert to bigint
            query.inNumber("key", b64);

            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    it('testInNumber006', 0, async function(done) {
        try {
            let query = new ddm.Query();
            // no-typedArray treat as  array of double.
            console.log("typeof([1, 2, 97])" + typeof([1, 2, 97]))
            console.log("typeof([1, 2, 97][0])" + typeof([1, 2, 97][0]))
            query.inNumber("key", [1, 2, 97]);
            console.log("inNumber([1, 2, 97])  => " + query.getSqlLike());
            query.reset();

            query.inNumber("key1", [-1, 3, 987654.123, 0xabc123456]);
            console.log("inNumber([1, 2, 0xa1234567890123456])  => " + query.getSqlLike());
            query.reset();

            query.inNumber("key2", [-1, 3, -987654.123, 0xabc123456]);
            console.log("inNumber([1, 2, 0xa1234567890123456])  => " + query.getSqlLike());
            query.reset();

            query.inNumber("key3", [-1, 4, -987654.123, Number.MAX_VALUE]);
            console.log("inNumber([1, 2, Number.MAX_VALUE])  => " + query.getSqlLike());
            query.reset();

            query.inNumber("key4", [1, -2.3, Number.MIN_VALUE, Number.MAX_VALUE]);
            console.log("inNumber([1, -2.3, Number.MAX_VALUE])  => " + query.getSqlLike());
            expect(query.getSqlLike() !== "").assertTrue();

            console.log("query is " + query.getSqlLike());
            query.reset();
            query = null;
        } catch (e) {
            console.log("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    // inString
    it('testInString001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.inString("key", ["a2z" , 'z2a']);
            query.inString("key2", ["AAA" ]);
            console.log("query is " + query.getSqlLike());
            expect(query.getSqlLike() !== "").assertTrue();
            query = null;
        } catch (e) {
            console.log("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testInString002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.inString("key", ["a2z" , 'z2a'])
                .inString("key2", ["AAA" ])
                .inString("key2", ["AAA", "AAABBB","CCCAAA" ]);
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testInString003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.inString("key", 0);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    it('testInString004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.inString("key", [0, 1]);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    // notInNumber
    it('testNotInNumber001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notInNumber("key", [1, 2]);
            query.notInNumber("key", [1000]);
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testNotInNumber002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notInNumber("key", [1, 2, 3]).notInNumber("key", [1, 7, 8]).notEqualTo("kkk", 5);
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testNotInNumber003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notInNumber("key", [1], 2);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    it('testNotInNumber004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notInNumber("key", ["string"]);
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    // notInString
    it('testNotInString001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notInString("key", ["v1", "v2"]);
            query.notInString("key", ["v1", "NaN"]);
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testNotInString002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notInString("key", ["v1", "v2", "v3"]).notEqualTo("kkk", "v3");
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testNotInString003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notInString("key", ["", "abccd"], 2);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    it('testNotInString004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notInString("key", [1, 2]);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    // like
    it('testLike001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.like("key", "v1");
            query.like("key2", "v2");
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testLike002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.like("key", "v1").like("key", "v3").like("key", "v2");
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testLike003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.like("key", 0);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    it('testLike004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.like("key", "str1", "str2");
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    // unlike
    it('testUnlike001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.unlike("key", "v1");
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testUnlike002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.unlike("key", "v1").unlike("key", "v3").unlike("key", "v2");
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testUnlike003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.unlike("key", 0);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    it('testUnlike004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.unlike("key", "str1", "str2");
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    // and
    it('testAnd001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", 0);
            query.and();
            query.notEqualTo("key", "v1");
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testAnd002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.equalTo("key1", 0).and().equalTo("key2", "v1");
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testAnd003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", 0).and().notEqualTo("key", 1).and();
            expect(query.getSqlLike() !== "").assertTrue();
            query.reset();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            expect(null).assertFail();
        }
        done();
    })

    it('testAnd004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", 0).and(1).notInNumber("key", [1, 3]);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    // or
    it('testOr001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", 0);
            query.or();
            query.notEqualTo("key", "v1");
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testOr002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.equalTo("key1", 0).or().equalTo("key2", "v1");
            expect(query.getSqlLike() !== "").assertTrue();
            query.reset();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testOr003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", 0).or();
            console.log("or ... sql:" + query.getSqlLike());
            expect(query.getSqlLike() !== "").assertTrue();
            query.reset();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("throw exception is ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testOr004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", 0).or(1).notInNumber("key", [1, 3]);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    // orderByAsc
    it('testOrderByAsc001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", 0);
            query.orderByAsc("sortbykey");
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testOrderByAsc002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", "V0").orderByAsc("sortbykey1").orderByAsc("sortbykey2");
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testOrderByAsc003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", false).orderByAsc(1);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    it('testOrderByAsc004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.orderByAsc();
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    // orderByDesc
    it('testOrderByDesc001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", 0);
            query.orderByDesc("sortbykey");
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testOrderByDesc002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", "V0").orderByDesc("sortbykey1").orderByDesc("sortbykey2");
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testOrderByDesc003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", false).orderByDesc(1);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    it('testOrderByDesc004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.orderByDesc();
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    // limit(total:number, offset:number)
    it('testLimit001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", "vx");
            query.limit(10, 2);
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testLimit002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", "vx").limit(10, 2)
                .equalTo("key2", 2).limit(10, 2);
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testLimit003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", false).limit(10, 2, "any");
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    it('testLimit004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", false).limit(10);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    it('testLimit005', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.notEqualTo("key", false).limit("any", 10);
            console.log("should throw exception on invalid arguments");
            console.log("query is " + query.getSqlLike());
            query = null;
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    // isNotNull
    it('testIsNotNull001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.isNotNull("key");
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testIsNotNull002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.isNotNull("key1").and().notEqualTo("key1", 123);
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testIsNotNull003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.isNotNull("key2", "any");
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    it('testIsNotNull004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.isNotNull(1);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    // beginGroup
    it('testBeginGroup001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.beginGroup();
            query.isNotNull("$.name");
            query.endGroup();
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testBeginGroup002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.beginGroup();
            query.beginGroup();
            query.notEqualTo("$.name", 0);
            query.endGroup();
            query.beginGroup();
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testBeginGroup003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.beginGroup(1);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    it('testBeginGroup004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.beginGroup("any", 1);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    // endGroup
    it('testEndGroup001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.beginGroup();
            query.isNotNull("$.name");
            query.endGroup();
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            expect(null).assertFail();
        }
        done();
    })

    it('testEndGroup002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.endGroup();
            query.beginGroup();
            query.isNotNull("$.name");
            query.endGroup();
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            expect(null).assertFail();
        }
        done();
    })

    it('testEndGroup003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.endGroup(0);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    it('testEndGroup004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.endGroup("any");
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    // prefixKey
    it('testPrefixKey001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.prefixKey("$.name");
            query.prefixKey("0");
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            expect(null).assertFail();
        }
        done();
    })

    it('testPrefixKey002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.prefixKey("kx1").or().prefixKey("kx2").or().prefixKey("kx3");
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            expect(null).assertFail();
        }
        done();
    })

    it('testPrefixKey003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.prefixKey("k", "any");
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    it('testPrefixKey004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.prefixKey(123);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    // setSuggestIndex(index:string)
    it('testSetSuggestIndex001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.setSuggestIndex("$.name");
            query.setSuggestIndex("0");
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            expect(null).assertFail();
        }
        done();
    })

    it('testSetSuggestIndex002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.setSuggestIndex("kxx").or().equalTo("key2", "v1");
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            expect(null).assertFail();
        }
        done();
    })

    it('testSetSuggestIndex003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.setSuggestIndex("k", "any");
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    it('testSetSuggestIndex004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.setSuggestIndex(123);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    // deviceId
    it('testDeviceId001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.deviceId("$.name");
            query.deviceId("0");
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceId002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.deviceId("kxx").equalTo("key2", "v1");
            expect(query.getSqlLike() !== "").assertTrue();
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testDeviceId003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.deviceId("k", "any");
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    it('testDeviceId004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.deviceId(123);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    // getSqlLike
    it('testGetSqlLike001', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            let sql1 = query.getSqlLike();
            console.log("testGetSqlLike001 sql=" + sql1);
            let sql2 = query.getSqlLike();
            expect(sql1).assertEqual(sql2);
            console.log("query is " + query.getSqlLike());
            query = null;
        } catch (e) {
            console.log("dumplicated calls should be ok : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testGetSqlLike002', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            let sql1 = query.getSqlLike();
            console.log("testGetSqlLike002 sql=" + sql1);
            query.inString("key1", ["AAA", "BBB"])
                .or()
                .notEqualTo("key2", 0);
            let sql2 = query.getSqlLike();
            console.log("testGetSqlLike002 sql=" + sql2);
            console.log("query is " + query.getSqlLike());
            expect(sql1 !== sql2).assertTrue();
            query = null;
        } catch (e) {
            console.log("should be ok on Method Chaining : " + e);
            expect(null).assertFail();
        }
        done();
    })

    it('testGetSqlLike003', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.inNumber("key");
            query.getSqlLike(0);
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })

    it('testGetSqlLike004', 0, async function(done) {
        try {
            let query = new ddm.Query();
            expect("").assertEqual(query.getSqlLike());
            query.inNumber("key");
            query.getSqlLike("any");
            console.log("should throw exception on invalid arguments");
            expect(null).assertFail();
        } catch (e) {
            console.log("throw exception is ok : " + e);
        }
        done();
    })
})