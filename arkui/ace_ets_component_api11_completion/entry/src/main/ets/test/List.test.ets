/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import tabsApi1 from './tabs/tabsApi1.test';
import AttributeModifierDemoAPI01 from './AttributeModifier/AttributeModifierDemoAPI01Jsunit.test';
import AttributeModifierDemoAPI02 from './AttributeModifier/AttributeModifierDemoAPI02Jsunit.test';
import AttributeModifierDemoAPI03 from './AttributeModifier/AttributeModifierDemoAPI03Jsunit.test';
import FolderStack3ApiJsunit from './AttributeModifier/FolderStack3ApiJsunit.test';
import onChildTouchTest from './commonApi/onChildTouchTest.test.ets';
import promptTest from './commonApi/promptTest.test.ets';
import setCursorTest from './commonApi/setCursorTest.test.ets';
import onGestureTest from './commonApi/onGestureTest.test.ets';
import alphabetTest from './commonApi/alphabetTest.test.ets';
import NavigationApi from './AttrApi/NavigationApi.test.ets';
import NavigationApi2 from './AttrApi/NavigationApi2.test.ets';
import NavigationApi3 from './AttrApi/NavigationApi3.test.ets';
import RichEditorApi from './AttrApi/RichEditorApi.test.ets';
import TabsApi from './AttrApi/TabsApi.test.ets';
import Image_QRCode_Api from './AttrApi/Image_QRCode_Api.test';
import QueryNavDestinationInfoNavDestinationJsunit from './AttributeModifier/QueryNavDestinationInfoNavDestinationJsunit.test';
import aboutToAppearTest from './ComAttr/ComAttr_aboutToAppear.test.ets';
import parentX_parentY_strategy_Test from './ComAttr/ComAttr_parentX_parentY_strategy.test.ets';
import TextStyle from './TextApi/TextStyle.test.ets';
import freezeInactive from './freezeInactive.test.ets';
import allowOverride from './allowOverride.test.ets';
import ToastShowMode from './ToastShowMode.test.ets';
import ModalBlurStyle from './ModalBlurStyle.test.ets';
import TouchTestStrategy from './TouchTestStrategy.test.ets';

import tabsDemo from './TextApi/tabsDemo.test.ets';
import TextSelectionMenu from './TextApi/TextSelectionMenu.test.ets';
import touchPoint from './DragController/touchPoint_Auto.test.ets';
import previewOptions from './DragController/touchPoint_Disable.test.ets';
import createDragAction from './DragController/createDragAction.test.ets';
import setForegroundColor from './DragController/setForegroundColor.test.ets';
import backgroundEffectJsunit from './backgroundEffect/backgroundEffect.test.ets'
import blendMode1Jsunit from './backgroundEffect/blendMode1.test.ets'
import sheetSize1Jsunit from './backgroundEffect/sheetSize1.test.ets'
import monopolizeTest from './commonApi/monopolizeTest.test.ets';
import blendModeTest from './commonApi/blendModeTest.test.ets';
import outlineTest from './commonApi/outlineTest.test.ets';
import arkuiNodeTest from "./arkuinode/arkuinode.test.ets"
import atomicServiceBarTest from "./autoservice/atomicServiceBar.test.ets"
import buttonControlTest from "./buttonControlSize/buttonControl.test.ets"
import dymaticTest from "./dymaticattribute/dymatic.test.ets"
import listSContentTest from "./list/list.test.ets"
import  relativeCTest from "./relative/relative.test.ets"
import  gridIndexTest from "./grid/grid.test.ets"
import enumFolderTest from "./folder/enumflodstack.test.ets"

export default function testsuite() {
  tabsApi1()
  AttributeModifierDemoAPI01()
  AttributeModifierDemoAPI02()
  AttributeModifierDemoAPI03()
  FolderStack3ApiJsunit()
  onGestureTest()
  setCursorTest()
  onChildTouchTest()
  promptTest()
  alphabetTest()
  NavigationApi()
  NavigationApi2()
  NavigationApi3()
  RichEditorApi()
  TabsApi()
  Image_QRCode_Api()
  relativeCTest()
  listSContentTest()
  gridIndexTest()
  buttonControlTest()
  dymaticTest()
  enumFolderTest();
  arkuiNodeTest()
  atomicServiceBarTest()
  QueryNavDestinationInfoNavDestinationJsunit()
  aboutToAppearTest()
  parentX_parentY_strategy_Test()
  TextStyle()
  freezeInactive()
  allowOverride()
  ToastShowMode()
  ModalBlurStyle()
  TouchTestStrategy()
  tabsDemo()
  TextSelectionMenu()
  createDragAction()
  setForegroundColor()
  touchPoint()
  previewOptions()
  backgroundEffectJsunit()
  sheetSize1Jsunit()
  monopolizeTest()
  outlineTest()
}