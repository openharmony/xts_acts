/*
* Copyright (C) 2025 HiHope Open Source Organization.
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

import AsynclockDifferentTest from "./AsynclockDifferentTest.test";
import AsynclockSameTest from "./AsynclockSameTest.test";
import AsynclockSameAddTest from "./AsynclockSameAddTest.test";
import AsynclockDifferentSecondTest from "./AsynclockDifferentSecondTest.test";
import AsynclockDifferentThirdTest from "./AsynclockDifferentThirdTest.test";
import AsynclockDifferentForthTest from "./AsynclockDifferentForthTest.test";
import AsynclockSameSecondTest from "./AsynclockSameSecondTest.test";
import AsynclockSameAddSecondTest from "./AsynclockSameAddSecondTest.test";

export default function testsuite() {
  AsynclockDifferentTest();
  AsynclockSameTest();
  AsynclockSameAddTest();
  AsynclockDifferentSecondTest();
  AsynclockDifferentThirdTest();
  AsynclockDifferentForthTest();
  AsynclockSameSecondTest();
  AsynclockSameAddSecondTest();
}