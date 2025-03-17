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
import builtinsStatementBlockTest from "./BuiltinsStatementBlockTest.test";
import BuiltinsStatementBreakTest from "./BuiltinsStatementBreakTest.test";
import BuiltinsStatementContinueTest from "./BuiltinsStatementContinueTest.test";
import builtinsStatementForOfTest from "./BuiltinsStatementForOfTest.test";
import builtinsStatementForTest from "./BuiltinsStatementForTest.test";
import builtinsStatementIfTest from "./BuiltinsStatementIfTest.test";
import builtinsStatementThrowTest from "./BuiltinsStatementThrowTest.test";
import builtinsStatementTry from "./BuiltinsStatementTryTest.test";
import builtinsStatementWhileTest from "./BuiltinsStatementWhile.test";
import builtinsStatementReturnTest from "./StatementReturnTest.test";
import builtinsStatementSwitchTest from "./StatementSwitchTest.test";


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
}