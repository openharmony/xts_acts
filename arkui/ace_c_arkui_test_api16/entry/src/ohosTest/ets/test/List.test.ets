/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import postFrameCallbackTest from "./postFrame/PostFrameCallbackTest.test"
import checkboxGroupTest from "./checkbox/CheckboxGroupTest.test"
import checkboxGroupGroupTest from "./checkboxgroup/CheckboxGroupGroupTest.test"
import checkboxGroupSelectAllTest from "./checkboxgroup/CheckboxGroupSelectAllTest.test"
import swiperTest from "./swiper/SwiperTest.test"
import textImmutablfFontWeight from "./text/textImmutablfFontWeight.test"
import listCaseTest from "./list/ListCaseTest.test"
import listScrollToIndexTest from "./listScrollTo/ListScrollToTest.test"
import listItemGroupNodeAdapterTest from "./listItemGroup/ListItemGroupTest.test"
import TextAreaLetterSpacing from "./textArea/TextAreaLetterSpacing.test"
import TextInputLetterSpacing from "./textInput/TextInputLetterSpacing.test"
import textPickerTest from "./textpicker/TextPickerColumnWidthsTest.test"
import scrollBackToTopTest from './scroll/ScrollBackToTopTest.test'

export default function testsuite() {
  postFrameCallbackTest();
  swiperTest();
  checkboxGroupTest();
  checkboxGroupGroupTest();
  checkboxGroupSelectAllTest();
  textImmutablfFontWeight();
  listCaseTest();
  listScrollToIndexTest();
  listItemGroupNodeAdapterTest();
  TextAreaLetterSpacing();
  TextInputLetterSpacing();
  textPickerTest();
  scrollBackToTopTest();
}
