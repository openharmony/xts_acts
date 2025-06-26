/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import util from "@ohos.util";

interface Person {
  name: string,
  age: number
}

class Car {
  make: string;
  model: string;

  constructor(make: string, model: string) {
    this.make = make;
    this.model = model;
  }
}

function fnOne(val: Any, callback: (err: Error | null, ...value: FixedArray<Any>) => void) {
  if (typeof val === 'string') {
    callback(null, val);
  } else {
    callback(new Error('type err'));
  }
}

function fnTwo(val: Any, callback: (err: Error | null, ...value: FixedArray<Any>) => void) {
  callback(null, val);
}

function fnThree(val: Any, callback: (err: Error | null, ...value: FixedArray<Any>) => void) {
  if (typeof val === 'boolean') {
    callback(null, val);
  } else {
    callback(new Error('type err'));
  }
}

function fnFour(val: Any, callback: (err: Error | null, ...value: FixedArray<Any>) => void) {
  if (typeof val === 'number') {
    callback(null, val);
  } else {
    callback(new Error('type err'));
  }
}

export default function UtilTest() {
  describe('UtilTest',(): void =>  {
    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_HASH_001
     * @tc.name: testUtilGetHash001
     * @tc.desc: Get the hash value of an object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilGetHash001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let person: Person = {
        name: "Alice",
        age: 30
      };
      let result1 = util.getHash(person);
      let result2 = util.getHash(person);
      expect(result1).assertEqual(result2);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_HASH_002
     * @tc.name: testUtilGetHash002
     * @tc.desc: Get the hash value of an object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilGetHash002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let numbers = [1, 2, 3, 4, 5];
      let result1 = util.getHash(numbers);
      let result2 = util.getHash(numbers);
      expect(result1).assertEqual(result2);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_HASH_003
     * @tc.name: testUtilGetHash003
     * @tc.desc: Get the hash value of an object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilGetHash003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myCar = new Car("Toyota", "Corolla");
      let result1 = util.getHash(myCar);
      let result2 = util.getHash(myCar);
      expect(result1).assertEqual(result2);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_HASH_004
     * @tc.name: testUtilGetHash004
     * @tc.desc: Get the hash value of an object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilGetHash004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let now = new Date();
      let result1 = util.getHash(now);
      let result2 = util.getHash(now);
      expect(result1).assertEqual(result2);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_HASH_005
     * @tc.name: testUtilGetHash005
     * @tc.desc: Get the hash value of an object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilGetHash005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let regex = new RegExp("abc");
      let result1 = util.getHash(regex);
      let result2 = util.getHash(regex);
      expect(result1).assertEqual(result2);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GET_HASH_006
     * @tc.name: testUtilGetHash006
     * @tc.desc: Get the hash value of an object.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilGetHash006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let mathObject: Math = new Math();
      let result1 = util.getHash(mathObject);
      let result2 = util.getHash(mathObject);
      expect(result1).assertEqual(result2);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GENERATE_RANDOM_BINARY_UUID_001
     * @tc.name: testUtilgenerateRandomBinaryUUID001
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilgenerateRandomBinaryUUID001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () : Promise<void> => {
      const result = util.generateRandomBinaryUUID(true);
      expect(result!.length).assertEqual(16);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_GENERATE_RANDOM_BINARY_UUID_002
     * @tc.name: testUtilgenerateRandomBinaryUUID002
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilgenerateRandomBinaryUUID002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () : Promise<void> => {
      const result = util.generateRandomBinaryUUID(false);
      expect(result!.length).assertEqual(16);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_PARSE_UUID_001
     * @tc.name: testUtilParseUUID001
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilParseUUID001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () : Promise<void> => {
      const result = util.parseUUID('84bdf796-66cc-4655-9b89-d6218d100f9c');
      expect(result.length).assertEqual(16);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_PARSE_UUID_002
     * @tc.name: testUtilParseUUID002
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilParseUUID002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () : Promise<void> => {
      try {
        const result = util.parseUUID('84df796-66cc-4655-9b89-d6218d100f9c');
      } catch(e: BusinessError) {
        expect(e.message).assertEqual('Syntax Error.Invalid 84df796-66cc-4655-9b89-d6218d100f9c string');
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_UTIL_PARSE_UUID_003
     * @tc.name: testUtilParseUUID003
     * @tc.desc: Generate a random RFC 4122 version 4 UUID.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilParseUUID003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () : Promise<void> => {
      try {
        const result = util.parseUUID('84Wdf796-66cc-4655-9b89-d6218d100f9c');
      } catch(e: BusinessError) {
        expect(e.message).assertEqual('Syntax Error.Invalid 84Wdf796-66cc-4655-9b89-d6218d100f9c string');
      }
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0011
     * @tc.name: testUtilPromisify_new_001
     * @tc.desc: Takes a function following the common error-first callback style,
     * taking an callback as the last argument, and return a function that returns promises.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilPromisify_new_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () : Promise<void> => {
      let value = util.promisify(fnOne);
      let res = await value("Hello");
      expect(new String(res)).assertEqual("Hello");
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0012
     * @tc.name: testUtilPromisify_new_002
     * @tc.desc: Takes a function following the common error-first callback style,
     * taking an callback as the last argument, and return a function that returns promises.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilPromisify_new_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:()=>void) : Promise<void> => {
      let value = util.promisify(fnOne);
      let res: Any;
      let flag = false;
      value([1, 2]).then((d) => {
        flag = true;
        res = d;
      }).catch((e: Error) => {
        flag = true;
        expect(e.message).assertEqual('type err');
        done();
      })
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0013
     * @tc.name: testUtilPromisify_new_003
     * @tc.desc: Takes a function following the common error-first callback style,
     * taking an callback as the last argument, and return a function that returns promises.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilPromisify_new_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () : Promise<void> => {
      const value = util.promisify(fnTwo);
      let res = await value(42);
      expect(new String(res)).assertEqual('42');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0014
     * @tc.name: testUtilPromisify_new_004
     * @tc.desc: Takes a function following the common error-first callback style,
     * taking an callback as the last argument, and return a function that returns promises.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilPromisify_new_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () : Promise<void> => {
      const value = util.promisify(fnThree);
      expect(Boolean(await value(true))).assertEqual(true);
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_TEXTENCODER_TEXTDECODER_0015
     * @tc.name: testUtilPromisify_new_005
     * @tc.desc: Takes a function following the common error-first callback style,
     * taking an callback as the last argument, and return a function that returns promises.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testUtilPromisify_new_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () : Promise<void> => {
      const value = util.promisify(fnFour);
      let res = await value(100);
      expect(new String(res)).assertEqual('100');
    })
  });
}
