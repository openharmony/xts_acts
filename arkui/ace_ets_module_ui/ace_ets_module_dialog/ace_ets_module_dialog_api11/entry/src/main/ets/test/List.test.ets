/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import CustomDialogMaskTest from './promptActionTest/CustomDialogMask.test'
import menu from './MenuTest/menu.test'
import menuTest from './MenuTest/menufirst.test'
import menuSecondTest from './MenuTest/menusecond.test'
import ToastShowMode from './promptActionTest/ToastShowMode.test';
import promptTest from './promptActionTest/promptTest.test';
import DialogTest from './promptActionTest/Dialog.test';
import panelJsunit from './Panel/PanelJsunit.test';
import panelClose from './panelTest/panelClose'

export default function testsuite() {
  CustomDialogMaskTest()
  menu()
  menuTest()
  menuSecondTest();
  ToastShowMode()
  promptTest()
  DialogTest();
  panelJsunit();
  panelClose()
}