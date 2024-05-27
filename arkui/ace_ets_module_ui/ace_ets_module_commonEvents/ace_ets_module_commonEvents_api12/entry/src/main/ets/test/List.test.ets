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
import APIPreDragStatusTest from './DragController/APIPreDragStatusTest.test';
import addGestureApplyGesture from './addGestureApplyGesture.test';
import ShortcutKeyTABTest from './keyboardShortcutTest/ShortcutKeyTABTest.test';
import ShortcutKeyDPADUPTest from './keyboardShortcutTest/ShortcutKeyDPADUPTest.test';
import ShortcutKeyDPADDOWNTest from './keyboardShortcutTest/ShortcutKeyDPADDOWNTest.test';
import ShortcutKeyDPADLEFTTest from './keyboardShortcutTest/ShortcutKeyDPADLEFTTest.test';
import ShortcutKeyDPADRIGHTTest from './keyboardShortcutTest/ShortcutKeyDPADRIGHTTest.test';
import TapGestureHandlerTest from './GestureHandler/TapGesture.test';
import PanGestureHandlerTest from './GestureHandler/PanGesture.test';
import SwiperGestureHandlerTest from './GestureHandler/SwiperGesture.test';
import PinchGestureHandlerTest from './GestureHandler/PinchGesture.test';
import RotationGestureHandlerTest from './GestureHandler/RotationGesture.test';
import LongPressGestureHandlerTest from './GestureHandler/LongPressGesture.test';
import DragInteractionOptionsTest from './DragController/DragInteractionOptions.test';
import SourceToolTest from './GestureHandler/SourceTool.test';
export default function testsuite() {
  APIPreDragStatusTest();
  addGestureApplyGesture();
  ShortcutKeyTABTest();
  ShortcutKeyDPADUPTest();
  ShortcutKeyDPADDOWNTest();
  ShortcutKeyDPADLEFTTest();
  ShortcutKeyDPADRIGHTTest();
  addGestureApplyGesture();
  TapGestureHandlerTest();
  PanGestureHandlerTest();
  SwiperGestureHandlerTest();
  PinchGestureHandlerTest();
  RotationGestureHandlerTest();
  LongPressGestureHandlerTest();
  DragInteractionOptionsTest();
  SourceToolTest();

}