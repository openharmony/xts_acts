/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import builtinsArrayConcatTest from './array/BuiltinsArrayConcatTest.test';
import builtinsArrayCopyWithinTest from './array/BuiltinsArrayCopyWithinTest.test';
import builtinsArrayEntriesTest from './array/BuiltinsArrayEntriesTest.test';
import builtinsArrayEveryTest from './array/BuiltinsArrayEveryTest.test';
import builtinsArrayFillTest from './array/BuiltinsArrayFillsTest.test';
import builtinsArrayFilterTest from './array/BuiltinsArrayFiltersTest.test';
import builtinsArrayFindIndexTest from './array/BuiltinsArrayFindsIndexTest.test';
import builtinsArrayFindTest from './array/BuiltinsArrayFindsTest.test';
import builtinsArrayFlatMapTest from './array/BuiltinsArrayFlatMapTest.test';
import builtinsArrayFlatTest from './array/BuiltinsArrayFlatTest.test';
import builtinsArrayForEachTest from './array/BuiltinsArrayForEachTest.test';
import builtinsArrayFromTest from './array/BuiltinsArraysFromTest.test';
import builtinsArrayIncludesTest from './array/BuiltinsArrayIncludesTest.test';
import builtinsArrayIsArrayTest from './array/BuiltinsArrayIsArray.test';
import builtinsArrayJoinTest from './array/BuiltinsArrayJoinTest.test';
import builtinsArrayOfTest from './array/BuiltinsArrayOf.test';
import builtinsArrayPopTest from './array/BuiltinsArrayPop.test';
import builtinsArrayPushTest from './array/BuiltinsArrayPush.test';
import builtinsArrayReduceRightTest from './array/BuiltinsArrayReduceRightTest.test';
import builtinsArrayReduceTest from './array/BuiltinsArrayReduceTest.test';
import builtinsArrayReverseTest from './array/BuiltinsArrayReverseTest.test';
import builtinsArrayShiftTest from './array/BuiltinsArrayShift.test';
import builtinsArraySortTest from './array/BuiltinsArraySortsTest.test';
import builtinsArraySpliceTest from './array/BuiltinsArraySplicesTest.test';
import builtinsArrayToLocaleStringTest from './array/BuiltinsArrayToLocaleStringTest.test';
import builtinsArrayToReversedTest from './array/BuiltinsArrayToReversedTest.test';
import builtinsArrayToSortedTest from './array/BuiltinsArrayToSortedTest.test';
import builtinsArrayToSplicedTest from './array/BuiltinsArrayToSplicedTest.test';
import builtinsArrayToStringTest from './array/BuiltinsArrayToStringTest.test';
import builtinsArrayUnshiftTest from './array/BuiltinsArrayUnshift.test';
import builtinsArrayValuesTest from './array/BuiltinsArrayValues.test';
import builtinsArrayAtTest from './array/BuildinsArrayAtTest.test';
import builtinsArrayConstructorTest from './array/BuildinsArrayConstructorTest.test';
import builtinsArrayKeysTest from './array/BuildinsArrayKeysTest.test';
import builtinsArrayMapTest from './array/BuildinsArrayMapTest.test';
import builtinsArrayLastIndexOfTest from './array/BuildinsArrayLastIndexOfTest.test';
import BuiltinsArrayIndexOfTest from './array/BuiltinsArrayIndexOfTest.test';
import BuiltinsArraySliceTest from './array/BuiltinsArraySliceTest.test';
import BuiltinsArraySomeTest from './array/BuiltinsArraySomeTest.test';


export default function testsuite() {
  builtinsArrayConcatTest();
  builtinsArrayEntriesTest();
  builtinsArrayCopyWithinTest();
  builtinsArrayEveryTest();
  builtinsArrayIsArrayTest();
  builtinsArrayOfTest();
  builtinsArrayPopTest();
  builtinsArrayPushTest();
  builtinsArrayShiftTest();
  builtinsArrayUnshiftTest();
  builtinsArrayValuesTest();
  builtinsArrayReverseTest();
  builtinsArrayJoinTest();
  builtinsArrayReduceRightTest();
  builtinsArrayReduceTest();
  builtinsArrayFlatMapTest();
  builtinsArrayFlatTest();
  builtinsArrayForEachTest();
  builtinsArrayIncludesTest();
  builtinsArrayToLocaleStringTest();
  builtinsArrayToReversedTest();
  builtinsArrayToSortedTest();
  builtinsArrayToSplicedTest();
  builtinsArrayToStringTest();
  builtinsArraySortTest();
  builtinsArraySpliceTest();
  builtinsArrayFillTest();
  builtinsArrayFilterTest();
  builtinsArrayFindIndexTest();
  builtinsArrayFindTest();
  builtinsArrayFromTest();
  builtinsArrayAtTest();
  builtinsArrayConstructorTest();
  builtinsArrayKeysTest();
  builtinsArrayLastIndexOfTest();
  builtinsArrayMapTest();
  BuiltinsArrayIndexOfTest();
  BuiltinsArraySliceTest();
  BuiltinsArraySomeTest();
}