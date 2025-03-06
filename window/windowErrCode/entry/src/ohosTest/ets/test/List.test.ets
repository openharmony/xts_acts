/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import windowErrCode202_1 from './windowErrCode202_1.test'
import windowErrCode202_2 from './windowErrCode202_2.test'
import windowErrCode401_1 from './windowErrCode401_1.test'
import windowErrCode401_2 from './windowErrCode401_2.test'
import windowErrCode401_3 from './windowErrCode401_3.test'
import windowErrCode1300002_1 from './windowErrCode1300002_1.test'

export default function testsuite() {
  windowErrCode202_1(globalThis.abilityContext, globalThis.windowStage)
  windowErrCode202_2(globalThis.abilityContext, globalThis.windowStage)
  windowErrCode401_1(globalThis.abilityContext, globalThis.windowStage)
  windowErrCode401_2(globalThis.abilityContext, globalThis.windowStage)
  windowErrCode401_3(globalThis.abilityContext, globalThis.windowStage)
  windowErrCode1300002_1(globalThis.abilityContext, globalThis.windowStage)
}