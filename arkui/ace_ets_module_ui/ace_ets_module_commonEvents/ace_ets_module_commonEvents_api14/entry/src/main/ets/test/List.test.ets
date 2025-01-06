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

import unicodeTest from './onKeyEventTest/unicode.test';
import defaultFocus from './FocusView/defaultFocus.test';
import tabStopApiTest from './tabStopApiTest/tabStopApiTest.test';
import activeApiTest from './UIContext/FocusController/activeApiTest.test';
import TapGestureAllowedTypesTest from './GestureAllowedTypes/TapGestureAllowedTypesTest.test';
import LongPressGestureAllowedTypesTest from './GestureAllowedTypes/LongPressGestureAllowedTypesTest.test';
import PinchGestureAllowedTypesTest from './GestureAllowedTypes/PinchGestureAllowedTypesTest.test';
import PanGestureAllowedTypesTest from './GestureAllowedTypes/PanGestureAllowedTypesTest.test';
import RotationGestureAllowedTypesTest from './GestureAllowedTypes/RotationGestureAllowedTypesTest.test';
import SwipeGestureAllowedTypesTest from './GestureAllowedTypes/SwipeGestureAllowedTypesTest.test';
import TapGestureHandlerAllowedTypesTest from './GestureHandlerAllowedTypes/TapGestureHandlerAllowedTypesTest.test';
import LongPressGestureHandlerAllowedTypesTest from './GestureHandlerAllowedTypes/LongPressGestureHandlerAllowedTypesTest.test';
import PinchGestureHandlerAllowedTypesTest from './GestureHandlerAllowedTypes/PinchGestureHandlerAllowedTypesTest.test';
import PanGestureHandlerAllowedTypesTest from './GestureHandlerAllowedTypes/PanGestureHandlerAllowedTypesTest.test';
import RotationGestureHandlerAllowedTypesTest from './GestureHandlerAllowedTypes/RotationGestureHandlerAllowedTypesTest.test';
import SwipeGestureHandlerAllowedTypesTest from './GestureHandlerAllowedTypes/SwipeGestureHandlerAllowedTypesTest.test';
export default function testsuite() {
  unicodeTest();
  defaultFocus();
  tabStopApiTest();
  activeApiTest();
  TapGestureAllowedTypesTest();
  LongPressGestureAllowedTypesTest();
  PinchGestureAllowedTypesTest();
  PanGestureAllowedTypesTest();
  RotationGestureAllowedTypesTest();
  SwipeGestureAllowedTypesTest();
  TapGestureHandlerAllowedTypesTest();
  LongPressGestureHandlerAllowedTypesTest();
  PinchGestureHandlerAllowedTypesTest();
  PanGestureHandlerAllowedTypesTest();
  RotationGestureHandlerAllowedTypesTest();
  SwipeGestureHandlerAllowedTypesTest();
}