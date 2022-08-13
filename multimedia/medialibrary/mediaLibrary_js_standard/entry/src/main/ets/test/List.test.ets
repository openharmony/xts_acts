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
import getPermissionTest from './getPermission.test.ets'
import fileAssetCallBack2Test from './fileAssetCallBack2.test.ets'
import FileAssetGetThumbnailCallBackTest from './FileAssetGetThumbnailCallBack.test.ets'
import FileAssetGetThumbnailPromiseTest from './FileAssetGetThumbnailPromise.test.ets'
import fileAssetTestCallbackTest from './fileAssetTestCallback.test.ets'
import fileAssetUriTestCallBackTest from './fileAssetUriTestCallBack.test.ets'
import fileAssetUriTestPromiseTest from './fileAssetUriTestPromise.test.ets'
import fileTestCallBackTest from './fileTestCallBack.test.ets'
import mediaLibraryTestCallBackTest from './mediaLibraryTestCallBack.test.ets'
import mediaLibraryTestPromiseTest from './mediaLibraryTestPromise.test.ets'
import mediaLibraryTestPromiseOnOffTest from './mediaLibraryTestPromiseOnOff.test.ets'

export default function testsuite(abilityContext) {
  getPermissionTest()
  fileAssetCallBack2Test(abilityContext)
  FileAssetGetThumbnailCallBackTest(abilityContext)
  FileAssetGetThumbnailPromiseTest(abilityContext)
  fileAssetTestCallbackTest(abilityContext)
  fileAssetUriTestCallBackTest(abilityContext)
  fileAssetUriTestPromiseTest(abilityContext)
  fileTestCallBackTest(abilityContext)
  mediaLibraryTestCallBackTest(abilityContext)
  mediaLibraryTestPromiseTest(abilityContext)
  mediaLibraryTestPromiseOnOffTest(abilityContext)
}
