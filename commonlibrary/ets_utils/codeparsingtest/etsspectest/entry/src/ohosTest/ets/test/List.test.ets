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
import builtinsArrayBufferByteLengthTest from "./ArrayBuffer/BuildinsArrayBufferByteLengthTest.test";
import builtinsArrayBufferConstructorTest from "./ArrayBuffer/BuildinsArrayBufferConstructorTest.test";
import builtinsArrayBufferIsViewTest from "./ArrayBuffer/BuildinsArrayBufferIsViewTest.test";
import builtinsArrayBufferLikeTest from "./ArrayBuffer/BuildinsArrayBufferLikeTest.test";
import builtinsArrayBufferSliceTest from "./ArrayBuffer/BuildinsArrayBufferSliceTest.test";
import builtinsArrayBufferViewTest from "./ArrayBuffer/BuildinsArrayBufferViewTest.test";
import builtinsArrayLikeIndexTest from "./ArrayBuffer/BuiltinsArrayLikeIndexTest.test";
import builtinsArrayLikeLengthTest from "./ArrayBuffer/BuiltinsArrayLikeLengthTest.test";
import builtinsConcatArrayIndexTest from "./ArrayBuffer/BuiltinsConcatArrayIndexTest.test";
import builtinsConcatArrayJoinTest from "./ArrayBuffer/BuiltinsConcatArrayJoinTest.test";
import builtinsConcatArrayLengthTest from "./ArrayBuffer/BuiltinsConcatArrayLengthTest.test";
import builtinsConcatArraySliceTest from "./ArrayBuffer/BuiltinsConcatArraySliceTest.test";
import builtinsReadonlyArrayKeysTest from "./ReadonlyArray/BuildinsReadonlyArrayKeysTest.test";
import builtinsReadonlyArrayLastIndexOfTest from "./ReadonlyArray/BuildinsReadonlyArrayLastIndexOfTest.test";
import builtinsReadonlyArrayMapTest from "./ReadonlyArray/BuildinsReadonlyArrayMapTest.test";
import builtinsReadonlyArrayForEachTest from "./ReadonlyArray/BuiltinsReadonlyArrayForEachTest.test";
import builtinsReadonlyArrayIncludesTest from "./ReadonlyArray/BuiltinsReadonlyArrayIncludesTest.test";
import builtinsReadonlyArrayIndexOfTest from "./ReadonlyArray/BuiltinsReadonlyArrayIndexOfTest.test";
import builtinsReadonlyArrayJoinTest from "./ReadonlyArray/BuiltinsReadonlyArrayJoinTest.test";
import builtinsReadonlyArrayReduceTest from "./ReadonlyArray/BuiltinsReadonlyArrayReduce.test";
import builtinsReadonlyArrayReduceRightTest from "./ReadonlyArray/BuiltinsReadonlyArrayReduceRight.test";
import builtinsReadonlyArraySliceTest from "./ReadonlyArray/BuiltinsReadonlyArraySliceTest.test";
import builtinsReadonlyArraySomeTest from "./ReadonlyArray/BuiltinsReadonlyArraySomeTest.test";
import builtinsReadonlyArrayToLocaleStringTest from "./ReadonlyArray/BuiltinsReadonlyArrayToLocaleStringTest.test";
import builtinsReadonlyArrayToStringTest from "./ReadonlyArray/BuiltinsReadonlyArrayToStringTest.test";
import builtinsReadonlyArrayValuesTest from "./ReadonlyArray/BuiltinsReadonlyArrayValues.test";
import builtinsReadonlyArrayAtTest from "./ReadonlyArray/ReadonlyArrayAt.test";
import builtinsReadonlyArrayConcatTest from "./ReadonlyArray/ReadonlyArrayConcat.test";
import builtinsReadonlyArrayEntriesTest from "./ReadonlyArray/ReadonlyArrayEntries.test";
import builtinsReadonlyArrayEveryTest from "./ReadonlyArray/ReadonlyArrayEvery.test";
import builtinsRegExpExecArrayGroupsTest from "./RegExpArray/RegExpExecArrayGroups.test";
import builtinsRegExpExecArrayIndexTest from "./RegExpArray/RegExpExecArrayIndex.test";
import builtinsRegExpExecArrayInputTest from "./RegExpArray/RegExpExecArrayInput.test";
import builtinsRegExpExecArrayStringTest from "./RegExpArray/RegExpExecArrayString.test";
import builtinsRegExpMatchArrayGroupsTest from "./RegExpArray/RegExpMatchArrayGroups.test";
import builtinsRegExpMatchArrayIndexTest from "./RegExpArray/RegExpMatchArrayIndex.test";
import builtinsRegExpMatchArrayInputTest from "./RegExpArray/RegExpMatchArrayInput.test";
import builtinsRegExpMatchArrayStringTest from "./RegExpArray/RegExpMatchArrayString.test";
import builtinsStatementBlockTest from "./statement/BuiltinsStatementBlockTest.test";
import BuiltinsStatementBreakTest from "./statement/BuiltinsStatementBreakTest.test";
import BuiltinsStatementContinueTest from "./statement/BuiltinsStatementContinueTest.test";
import builtinsStatementForOfTest from "./statement/BuiltinsStatementForOfTest.test";
import builtinsStatementForTest from "./statement/BuiltinsStatementForTest.test";
import builtinsStatementIfTest from "./statement/BuiltinsStatementIfTest.test";
import builtinsStatementThrowTest from "./statement/BuiltinsStatementThrowTest.test";
import builtinsStatementTry from "./statement/BuiltinsStatementTryTest.test";
import builtinsStatementWhileTest from "./statement/BuiltinsStatementWhile.test";
import builtinsStatementReturnTest from "./statement/StatementReturnTest.test";
import builtinsStatementSwitchTest from "./statement/StatementSwitchTest.test";


export default function testsuite() {
  builtinsStatementBlockTest();
  builtinsStatementForOfTest();
  builtinsStatementThrowTest();
  builtinsStatementTry();
  builtinsStatementIfTest();
  BuiltinsStatementBreakTest();
  BuiltinsStatementContinueTest();
  builtinsStatementForTest();
  builtinsStatementReturnTest();
  builtinsStatementSwitchTest();
  builtinsStatementWhileTest();

  builtinsArrayBufferByteLengthTest();
  builtinsArrayBufferConstructorTest();
  builtinsArrayBufferIsViewTest();
  builtinsArrayBufferLikeTest();
  builtinsArrayBufferSliceTest();
  builtinsArrayBufferViewTest();
  builtinsArrayLikeIndexTest();
  builtinsArrayLikeLengthTest();
  builtinsConcatArrayIndexTest();
  builtinsConcatArrayJoinTest();
  builtinsConcatArrayLengthTest();
  builtinsConcatArraySliceTest();

  builtinsReadonlyArrayKeysTest();
  builtinsReadonlyArrayLastIndexOfTest();
  builtinsReadonlyArrayMapTest();
  builtinsReadonlyArrayForEachTest();
  builtinsReadonlyArrayIncludesTest();
  builtinsReadonlyArrayIndexOfTest();
  builtinsReadonlyArrayJoinTest();
  builtinsReadonlyArrayReduceTest();
  builtinsReadonlyArrayReduceRightTest();
  builtinsReadonlyArraySliceTest();
  builtinsReadonlyArraySomeTest();
  builtinsReadonlyArrayToLocaleStringTest();
  builtinsReadonlyArrayToStringTest();
  builtinsReadonlyArrayValuesTest();
  builtinsReadonlyArrayAtTest();
  builtinsReadonlyArrayConcatTest();
  builtinsReadonlyArrayEntriesTest();
  builtinsReadonlyArrayEveryTest();

  builtinsRegExpExecArrayGroupsTest();
  builtinsRegExpExecArrayIndexTest();
  builtinsRegExpExecArrayInputTest();
  builtinsRegExpExecArrayStringTest();
  builtinsRegExpMatchArrayGroupsTest();
  builtinsRegExpMatchArrayIndexTest();
  builtinsRegExpMatchArrayInputTest();
  builtinsRegExpMatchArrayStringTest();

}
