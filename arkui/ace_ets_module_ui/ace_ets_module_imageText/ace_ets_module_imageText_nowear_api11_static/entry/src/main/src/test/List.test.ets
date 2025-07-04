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

import search_center from './SearchTest/search_center.test'
import search_gesture from './SearchTest/search_gesture.test';
import SearchJsunit from './SearchTest/SearchJsunit.test';
import textAreaInputTest from './TextAreaTest/textAreaInputTest.test';
// import textinputSec from './TextInputTest/textinputSec'
import TextStateJsunit from './textTest/TextStateJsunit.test';
import text_drag from './textTest/text_drag.test';
import textArea_center from './TextAreaTest/textArea_center.test'
import positionSettingJsunit from './textTest/PositionSettingJsunit.test';
import textAreaBC1Jsunit from './TextAreaTest/textAreaBC1Jsunit.test';
import textAreaUIJsunit from './TextAreaTest/textAreaUIJsunit.test';
import TextInputPageJsunit from './TextInputTest/TextInputPageJsunit.test';
import OnTextSelectionChangeTest from './textTest/onTextSelectionChange.test';
import richEditorApi1 from './RichEditorTest/richEditorApi/richEditorApi1.test'
import RichEditor01 from './RichEditorTest/RichEditor01.test'
import RichEditorApi222 from './RichEditorTest/RichEditorApi222.test'
import RichTextJsunit from './RichEditorTest/RichTextJsunit.test'
import richTextJsunitFOURFOUR from './RichEditorTest/RichTextJsunitFOUR.test'

export default function testsuite() {
  search_center();
  // search_gesture(); //vp2px
  SearchJsunit();
  OnTextSelectionChangeTest();
  positionSettingJsunit();
  text_drag();
  TextStateJsunit();
  textArea_center();
  textAreaBC1Jsunit();
  textAreaInputTest();
  textAreaUIJsunit();
  TextInputPageJsunit();
  richEditorApi1();
  RichEditor01();
  RichEditorApi222();
  RichTextJsunit();
  richTextJsunitFOURFOUR();
}