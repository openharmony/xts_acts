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

import composeListItemIconType from './composeListItem/composeListItemIconType.test.ets';
import composeListItemOperateItemArrow from './composeListItem/composeListItemOperateItemArrow.test.ets';
import composeListItemOperateItemButton from './composeListItem/composeListItemOperateItemButton.test.ets';
import composeListItemOperateItemCheckbox from './composeListItem/composeListItemOperateItemCheckbox.test.ets';
import composeListItemOperateItemImage from './composeListItem/composeListItemOperateItemImage.test.ets';
import composeListItemOperateItemRadio from './composeListItem/composeListItemOperateItemRadio.test.ets';
import composeListItemOperateItemSubIcon from './composeListItem/composeListItemOperateItemSubIcon.test.ets';
import composeListItemOperateItemSwitch from './composeListItem/composeListItemOperateItemSwitch.test.ets';
import composeListItemPageTest from './composeListItem/composeListItemPageTest.test.ets';
import exceptionPromptTest from './exceptionPrompt/exceptionPromptTest.test.ets';
import filterTest from './filter/filterTest.test.ets';
import selectTitleBarTest from './selectTitleBar/selectTitleBarTest.test.ets';
import swipeRefresherPageTest from './swipeRefresher/swipeRefresherPageTest.test.ets';
import tabTitleBarPageTest from './tabTitleBar/tabTitleBarPageTest.test.ets';
import toolBarItemState from './toolBar/toolBarItemState.test.ets';
import toolBarPageTest from './toolBar/toolBarPageTest.test.ets';
import treeViewPageTest from './treeView/treeViewPageTest.test.ets';

export default function testsuite() {
  composeListItemIconType();
  composeListItemOperateItemArrow();
  composeListItemOperateItemButton();
  composeListItemOperateItemCheckbox();
  composeListItemOperateItemImage();
  composeListItemOperateItemRadio();
  composeListItemOperateItemSubIcon();
  composeListItemOperateItemSwitch();
  composeListItemPageTest();
  exceptionPromptTest();
  filterTest();
  selectTitleBarTest();
  swipeRefresherPageTest();
  tabTitleBarPageTest();
  toolBarItemState();
  toolBarPageTest();
  treeViewPageTest();
}