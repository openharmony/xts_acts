/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import buttonType from './buttonType/buttonTypeApi.test';
import overlayManagerTest from './overlayManager/overlayManagerTest.test'
import customDialogLevelOrder from './dialog/customDialogLevelOrder.test'
import showDialogLevelOrder from './dialog/showDialogLevelOrder.test'
import openCustomDialogLevelOrder from './dialog/openCustomDialogLevelOrder.test'
import openCustomDialogWithConOrder from './dialog/openCustomDialogWithConOrder.test'
import presentCustomDialogOrder from './dialog/presentCustomDialogOrder.test'
import alertDialogLevelOrder from './dialog/alertDialogLevelOrder.test'

export default function testsuite() {
    buttonType()
    overlayManagerTest()
    customDialogLevelOrder()
    showDialogLevelOrder()
    openCustomDialogLevelOrder()
    openCustomDialogWithConOrder()
    presentCustomDialogOrder()
    alertDialogLevelOrder()
}