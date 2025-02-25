/*
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

import keyDispatchTest from "./keydispatchTest/KeyDispatchTest.test"
import ProgressLinearStyleTest from "./progress/progressLinearStyleTest.test"

import FocusControlTest from "./foucscontrolTest/FocusControlTest.test"
import FocusControlTest2 from "./foucscontrolTest/FocusControlTest2.test"
import FocusControlTest3 from "./foucscontrolTest/FocusControlTest3.test"
import FocusControlTest4 from "./foucscontrolTest/FocusControlTest4.test"



import textImmutablfFontWeight from "./text/textImmutablfFontWeight.test"
import TextAreaLetterSpacing from "./textArea/TextAreaLetterSpacing.test"
import TextInputLetterSpacing from "./textInput/TextInputLetterSpacing.test"

import columnBackDropBlurTest from "./visual/columnBackDropBlurTest.test"


export default function testsuite() {
   ProgressLinearStyleTest();
   keyDispatchTest();
   FocusControlTest();
   FocusControlTest2();
   FocusControlTest3();
   FocusControlTest4();
   textImmutablfFontWeight();
   TextAreaLetterSpacing();
   TextInputLetterSpacing();
   columnBackDropBlurTest();
}
