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
import albumGetFileAssetsCallbackTest from './albumGetFileAssetsCallback.test.ets'
import albumGetFileAssetsPromiseTest from './albumGetFileAssetsPromise.test.ets'
import favoriteTestCallBackTest from './favoriteTestCallBack.test.ets'
import favoriteTestPromiseTest from './favoriteTestPromise.test.ets'
import fetchFileResultCallBackTest from './fetchFileResultCallBack.test.ets'
import fetchFileResultPromiseTest from './fetchFileResultPromise.test.ets'
import fileAssetCallBack2Test from './fileAssetCallBack2.test.ets'
import FileAssetGetThumbnailCallBackTest from './FileAssetGetThumbnailCallBack.test.ets'
import FileAssetGetThumbnailPromiseTest from './FileAssetGetThumbnailPromise.test.ets'
import fileAssetPromise2Test from './fileAssetPromise2.test.ets'
import fileAssetTestCallbackTest from './fileAssetTestCallback.test.ets'
import fileAssetTestPromiseTest from './fileAssetTestPromise.test.ets'
import fileAssetUriTestCallBackTest from './fileAssetUriTestCallBack.test.ets'
import fileAssetUriTestPromiseTest from './fileAssetUriTestPromise.test.ets'
import filekeyTestCallBackTest from './filekeyTestCallBack.test.ets'
import filekeyTestPromiseTest from './filekeyTestPromise.test.ets'
import fileTestCallBackTest from './fileTestCallBack.test.ets'
import fileTestPromiseTest from './fileTestPromise.test.ets'
import mediaLibraryTestCallBackTest from './mediaLibraryTestCallBack.test.ets'
import mediaLibraryTestPromiseTest from './mediaLibraryTestPromise.test.ets'
import albumTestCallBackTest from './albumTestCallBack.test.ets'
import albumTestPromiseTest from './albumTestPromise.test.ets'
import mediaLibraryTestPromiseOnOffTest from './mediaLibraryTestPromiseOnOff.test.ets'

export default function testsuite(abilityContext) {
  getPermissionTest()
  albumGetFileAssetsCallbackTest(abilityContext)
  albumGetFileAssetsPromiseTest(abilityContext)
  favoriteTestCallBackTest(abilityContext)
  favoriteTestPromiseTest(abilityContext)
  fetchFileResultCallBackTest(abilityContext)
  fetchFileResultPromiseTest(abilityContext)
  fileAssetCallBack2Test(abilityContext)
  FileAssetGetThumbnailCallBackTest(abilityContext)
  FileAssetGetThumbnailPromiseTest(abilityContext)
  fileAssetPromise2Test(abilityContext)
  fileAssetTestCallbackTest(abilityContext)
  fileAssetTestPromiseTest(abilityContext)
  fileAssetUriTestCallBackTest(abilityContext)
  fileAssetUriTestPromiseTest(abilityContext)
  filekeyTestCallBackTest(abilityContext)
  filekeyTestPromiseTest(abilityContext)
  fileTestCallBackTest(abilityContext)
  fileTestPromiseTest(abilityContext)
  mediaLibraryTestCallBackTest(abilityContext)
  mediaLibraryTestPromiseTest(abilityContext)
  albumTestCallBackTest(abilityContext)
  albumTestPromiseTest(abilityContext)
  mediaLibraryTestPromiseOnOffTest(abilityContext)
}