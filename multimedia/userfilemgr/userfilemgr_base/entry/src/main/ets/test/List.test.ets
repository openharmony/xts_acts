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

import getAlbumsCallbackTest from './getAlbumsCallback.test.ets'
import getAlbumsPromiseTest from './getAlbumsPromise.test.ets'
import getFileAssetsCallbackTest from './getFileAssetsCallback.test.ets'
import getFileAssetsPromiseTest from './getFileAssetsPromise.test.ets'
import getUserFileMgrTest from './getUserFileMgr.test.ets'
import onOffReleasePromiseTest from './onOffReleasePromise.test.ets'
export default function testsuite(abilityContext) {
  getAlbumsCallbackTest(abilityContext)
  getAlbumsPromiseTest(abilityContext)
  getFileAssetsCallbackTest(abilityContext)
  getFileAssetsPromiseTest(abilityContext)
  getUserFileMgrTest(abilityContext)
  onOffReleasePromiseTest(abilityContext)
}
