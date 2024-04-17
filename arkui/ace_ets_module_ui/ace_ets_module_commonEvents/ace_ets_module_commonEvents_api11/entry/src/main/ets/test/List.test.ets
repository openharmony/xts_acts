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
import touchJsunit from './onTouchTest/TouchJsunit.test';
import appearJsunit from './onAppearTest/AppearJsunit.test';
import areaChangeJsunit from './onAreaChangeTest/AreaChangeJsunit.test';
import ShortcutKeyTest from './keyboardShortcutTest/ShortcutKey.test'
import aboutToAppearTest from './onAppearTest/ComAttr_aboutToAppear.test';
import parentX_parentY_strategy_Test from './onChildTouchTestTest/ComAttr_parentX_parentY_strategy.test';
import onGestureTest from './onGestureJudgeBeginTest/onGestureTest.test';
import touchPoint from './DragController/touchPoint_Auto.test';
import previewOptions from './DragController/touchPoint_Disable.test';
import createDragAction from './DragController/createDragAction.test';
import setForegroundColor from './DragController/setForegroundColor.test';
import DragActionJsunit from './DragController/DragActionJsSuit.test';
import dragPreviewJsSuit from './DragController/dragPreviewJsSuit.test';
import dragPreviewOptionsJsSuit from './DragController/dragPreviewOptionsJsSuit.test';
import GestureTagJsSuit from './TapGestureTest/GestureTagJsSuit.test';
import freezeInactive from './freezeTest/freezeInactive.test'

export default function testsuite() {
  touchJsunit();
  appearJsunit();
  areaChangeJsunit();
  ShortcutKeyTest();
  aboutToAppearTest();
  parentX_parentY_strategy_Test();
  onGestureTest()
  touchPoint()
  previewOptions()
  createDragAction()
  setForegroundColor()
  DragActionJsunit()
  dragPreviewJsSuit()
  dragPreviewOptionsJsSuit()
  GestureTagJsSuit()
  freezeInactive()
  GesturePanGesture();
  OnClick1();
  OnClick2();
  OnClick3();
  SwipeGesture1();
  SwipeGesture2();
  SwipeGesture3();
  TapGesture1();
  TapGesture2();
  TapGesture3();
  OnTouch1();
  OnTouch2();
  OnTouch3();
  GestureClick();
  GestureContiune();
  GestureDrag();
  GestureIsSystemGesture();
  GesturePinchGesture();
  GestureReject();
  GestureRotationGesture();
  GestureSwipeGesture();
  GestureTap();
  GestureTapGesture();
  PanGesture1()
  PanGesture2()
  PanGesture3()
  LongPressGesture1()
  LongPressGesture2()
  LongPressGesture3()
  GestureLongPressGesture();
}