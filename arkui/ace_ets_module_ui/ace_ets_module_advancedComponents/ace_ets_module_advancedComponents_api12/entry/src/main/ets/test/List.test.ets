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
import exceptionPromptTest from './exceptionPrompt/exceptionPromptTest.test';
import filterTest from './filter/filterTest.test';
import selectTitleBarTest from './selectTitleBar/selectTitleBarTest.test';
import swipeRefresherPageTest from './swipeRefresher/swipeRefresherPageTest.test';
import tabTitleBarPageTest from './tabTitleBar/tabTitleBarPageTest.test';
import toolBarPageTest from './toolBar/toolBarPageTest.test';

export default function testsuite() {
  composeListItemPageTest();
  exceptionPromptTest();
  filterTest();
  selectTitleBarTest();
  swipeRefresherPageTest();
  tabTitleBarPageTest();
  toolBarPageTest();
}