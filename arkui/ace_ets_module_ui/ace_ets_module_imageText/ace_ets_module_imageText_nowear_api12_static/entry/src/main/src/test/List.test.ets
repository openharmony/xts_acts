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

import textAreaInputTest from './TextArea/textAreaInputTest.test';
import styledStringChange from './Text/styledStringChange.test'
import editMeunOptionsTest from './Text/editMeunOptions.test'
import setTextSelection from './TextArea/setTextSelection.test'
import TextDeleteDirectionTest from "./TextArea/TextDeleteDirectionTest.test";
import searchTest from './Search/searchTest.test';
import RichEditorApi5 from './RichEditor/RichEditorApi5.test'
import onSelectionChange1 from './RichEditorTest/onSelectionChange1.test'
import onSelectionChange4 from './RichEditorTest/onSelectionChange4.test'
import onSelectionChange5 from './RichEditorTest/onSelectionChange5.test'
import onSelectionChange6 from './RichEditorTest/onSelectionChange6.test'
import onSelectionChange7 from './RichEditorTest/onSelectionChange7.test'
import onSelectionChange8 from './RichEditorTest/onSelectionChange8.test'
import onSelectionChange10 from './RichEditorTest/onSelectionChange10.test'
import onSelectionChange15 from './RichEditorTest/onSelectionChange15.test'
import onSelectionChange18 from './RichEditorTest/onSelectionChange18.test'
import onSelectionChange19 from './RichEditorTest/onSelectionChange19.test'
import onDidIMEInputTest from './RichEditor/onDidIMEInput.test';
import RichEditorApi1 from './RichEditor/RichEditorApi1.test'

export default function testsuite() {
  // editMeunOptionsTest();
  styledStringChange();
  setTextSelection();
  textAreaInputTest();
  TextDeleteDirectionTest();
  searchTest();
  onDidIMEInputTest();
  onSelectionChange1();
  onSelectionChange4();
  onSelectionChange5();
  onSelectionChange6();
  onSelectionChange7();
  onSelectionChange8();
  onSelectionChange10();
  onSelectionChange15();
  onSelectionChange18();
  onSelectionChange19();
  RichEditorApi5();
  RichEditorApi1();
}