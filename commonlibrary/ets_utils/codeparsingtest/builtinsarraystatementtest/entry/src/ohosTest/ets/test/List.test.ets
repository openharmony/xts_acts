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
import builtinsArrayIsArrayTest from './BuiltinsArrayIsArray.test';
import builtinsArrayOfTest from './BuiltinsArrayOf.test';
import builtinsArrayPopTest from './BuiltinsArrayPop.test';
import builtinsArrayPushTest from './BuiltinsArrayPush.test';
import builtinsArrayReverseTest from './BuiltinsArrayReverseTest.test';
import builtinsArrayShiftTest from './BuiltinsArrayShift.test';
import builtinsArrayUnshiftTest from './BuiltinsArrayUnshift.test';
import builtinsArrayValuesTest from './BuiltinsArrayValues.test';


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
}