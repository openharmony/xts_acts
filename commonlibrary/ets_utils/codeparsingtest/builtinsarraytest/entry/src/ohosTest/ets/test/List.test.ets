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

import builtinsArrayConcatTest from './BuiltinsArrayConcatTest.test';
import builtinsArrayCopyWithinTest from './BuiltinsArrayCopyWithinTest.test';
import builtinsArrayEntriesTest from './BuiltinsArrayEntriesTest.test';
import builtinsArrayEveryTest from './BuiltinsArrayEveryTest.test';
import builtinsArrayFillTest from './BuiltinsArrayFillsTest';
import builtinsArrayFilterTest from './BuiltinsArrayFiltersTest';
import builtinsArrayFindIndexTest from './BuiltinsArrayFindsIndexTest';
import builtinsArrayFindTest from './BuiltinsArrayFindsTest';
import builtinsArrayFlatMapTest from './BuiltinsArrayFlatMapTest.test';
import builtinsArrayFlatTest from './BuiltinsArrayFlatTest.test';
import builtinsArrayForEachTest from './BuiltinsArrayForEachTest.test';
import builtinsArrayFromTest from './BuiltinsArraysFromTest';
import builtinsArrayIncludesTest from './BuiltinsArrayIncludesTest.test';
import builtinsArrayIsArrayTest from './BuiltinsArrayIsArray.test';
import builtinsArrayJoinTest from './BuiltinsArrayJoinTest.test';
import builtinsArrayOfTest from './BuiltinsArrayOf.test';
import builtinsArrayPopTest from './BuiltinsArrayPop.test';
import builtinsArrayPushTest from './BuiltinsArrayPush.test';
import builtinsArrayReduceRightTest from './BuiltinsArrayReduceRightTest.test';
import builtinsArrayReduceTest from './BuiltinsArrayReduceTest.test';
import builtinsArrayReverseTest from './BuiltinsArrayReverseTest.test';
import builtinsArrayShiftTest from './BuiltinsArrayShift.test';
import builtinsArraySortTest from './BuiltinsArraySortsTest.test';
import builtinsArraySpliceTest from './BuiltinsArraySplicesTest.test';
import builtinsArrayToLocaleStringTest from './BuiltinsArrayToLocaleStringTest.test';
import builtinsArrayToReversedTest from './BuiltinsArrayToReversedTest.test';
import builtinsArrayToSortedTest from './BuiltinsArrayToSortedTest.test';
import builtinsArrayToSplicedTest from './BuiltinsArrayToSplicedTest.test';
import builtinsArrayToStringTest from './BuiltinsArrayToStringTest.test';
import builtinsArrayUnshiftTest from './BuiltinsArrayUnshift.test';
import builtinsArrayValuesTest from './BuiltinsArrayValues.test';
import builtinsArrayAtTest from './BuildinsArrayAtTest.test';
import builtinsArrayConstructorTest from './BuildinsArrayConstructorTest.test';
import builtinsArrayKeysTest from './BuildinsArrayKeysTest.test';
import builtinsArrayMapTest from './BuildinsArrayMapTest.test';
import builtinsArrayLastIndexOfTest from './BuildinsArrayLastIndexOfTest.test';
import BuiltinsArrayIndexOfTest from './BuiltinsArrayIndexOfTest.test';
import BuiltinsArraySliceTest from './BuiltinsArraySliceTest.test';
import BuiltinsArraySomeTest from './BuiltinsArraySomeTest.test';


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