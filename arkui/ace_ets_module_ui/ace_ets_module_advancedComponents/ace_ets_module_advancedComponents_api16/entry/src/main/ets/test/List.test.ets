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

import composeListItemPageTest from './composeListItem/composeListItemPageTest.test';
import composeListItemOperateItemSymbolStyle from './composeListItem/composeListItemOperateItemSymbolStyle.test';
import toolBarAccessibilityTest from './toolBar/toolBarAccessibilityPage.test';
import progressButtonV2PageTest from './progressButtonV2/progressButtonV2Page.test';
import subHeaderV2PageTest from './subHeaderV2/subHeaderV2Page.test';
import toolBarV2PageTest from './toolBarV2/toolBarV2Page.test';
import toolBarV2ItemStateTest from './toolBarV2/toolBarV2ItemState.test';
import editableTitleBarAccessibilityTest from './editableTitleBar/editableTitleBarAccessibilityPage.test';
import subHeaderAccessibilityTest from './subHeader/subHeaderAccessibilityPage.test';
import composeTitleBarAccessibilityTest from './composeTitleBar/composeTitleBarAccessibilityPage.test';
import selectTitleBarAccessibilityTest from './selectTitleBar/selectTitleBarAccessibilityPage.test';
import tabTitleBarAccessibilityTest from './tabTitleBar/tabTitleBarAccessibilityPage.test';
import toolBarV2AccessibilityTest from './toolBarV2/ToolBarV2AccessibilityPage.test';

export default function testsuite() {
  composeListItemPageTest();
  composeListItemOperateItemSymbolStyle();
  toolBarAccessibilityTest();
  progressButtonV2PageTest();
  subHeaderV2PageTest();
  toolBarV2PageTest();
  toolBarV2ItemStateTest();
  editableTitleBarAccessibilityTest();
  subHeaderAccessibilityTest();
  composeTitleBarAccessibilityTest();
  selectTitleBarAccessibilityTest();
  tabTitleBarAccessibilityTest();
  toolBarV2AccessibilityTest();
}