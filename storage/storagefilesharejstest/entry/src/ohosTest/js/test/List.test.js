/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import FileSahre_PersistPermission_test from './persistPermission.test'
import FileShare_RevokePermission_test from './revokePermission.test'
import FileSahre_ActivatePermission_test from './activatePermission.test'
import FileSahre_DeactivatePermission_test from './deactivatePermission.test'
import FileSahre_CheckPersistentPermission_test from './checkPersistentPermission.test.js'
import EmptyTest from './Empty.test.js'
export default function testsuite() {
    if (canIUse(" SystemCapability.FileManagement.AppFileService.FolderAuthorization")){
      FileSahre_PersistPermission_test()
      FileShare_RevokePermission_test()
      FileSahre_ActivatePermission_test()
      FileSahre_DeactivatePermission_test()
      FileSahre_CheckPersistentPermission_test()
    }else{
      EmptyTest()
    }
}