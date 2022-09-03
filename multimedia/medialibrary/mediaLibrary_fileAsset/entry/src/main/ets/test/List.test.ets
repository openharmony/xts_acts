/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import fileAssetCallback2 from './fileAssetCallback2.test.ets'
import fileAssetPromise2 from './fileAssetPromise2.test.ets'
import fileAssetTestCallback from './fileAssetTestCallback.test.ets'
import fileAssetTestPromise from './fileAssetTestPromise.test.ets'
export default function testsuite(abilityContext) {
  fileAssetCallback2(abilityContext)
  fileAssetPromise2(abilityContext)
  fileAssetTestCallback(abilityContext)
  fileAssetTestPromise(abilityContext)
}
