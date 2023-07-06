/*
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


import defaultTest from './default/DefaultTest.test';
import defaultFocusValueTest from './default/DefaultFocusValueTest.test';
import defaultFlexTest from './default/DefaultFlexTest.test';
import defaultFlexByGridRowTest from './default/DefaultFlexByGridRowTest.test';
import marginStringTest from './margin/MarginStringTest.test';
import alignRulesTest from './alignRules/AlignRulesTest.test';
import positionTest from './position/PositionTest.test';
import markAnchorTest from './markAnchor/MarkAnchorTest.test';
import offsetTest from './offset/OffsetTest.test';
import paddingContainerTest from './padding/PaddingContainerTest.test';
import paddingContainerLengthTest from './padding/PaddingContainerLengthTest.test';
import paddingBaseTest from './padding/PaddingBaseTest.test';
import paddingBaseLengthTest from './padding/PaddingBaseLengthTest.test';
import layoutWeightRowTest from './layoutWeight/LayoutWeightRowTest.test';
import layoutWeightFlexTest from './layoutWeight/LayoutWeightFlexTest.test';
import marginLengthTest from './margin/MarginLengthTest.test';
import layoutWeightTest from './layoutWeight/LayoutWeightTest.test';
import constraintSizeTest from './constraintSize/ConstraintSizeTest.test';
import marginTest from './margin/MarginTest.test';
import widthTest from './width/WidthTest.test';
import heightTest from './height/HeightTest.test';
import sizeTest from './size/SizeTest.test';
import responseRegionTest from './responseRegion/ResponseRegionTest.test';
import visibilityTest from './visibility/VisibilityTest.test';
import aspectRatioWidthTest from './aspectRatio/AspectRatioWidthTest.test';
import aspectRatioHeightTest from './aspectRatio/AspectRatioHeightTest.test';
import displayPriorityTest from './displayPriority/DisplayPriorityTest.test';
import onAppearTest from './onAppear/OnAppearTest.test';
import onDisAppearTest from './onDisAppear/OnDisAppearTest.test';
import onAreaChangeTest from './onAreaChange/OnAreaChangeTest.test';
import onVisibleAreaChangeTest from './onVisibleAreaChange/OnVisibleAreaChangeTest.test';
import focusableTest from './focusable/FocusableTest.test';
import tabIndexTest from './tabIndex/TabIndexTest.test';
import defaultFocusTest from './defaultFocus/DefaultFocusTest.test';
import groupDefaultFocusTest from './groupDefaultFocus/GroupDefaultFocusTest.test';
import focusOnTouchTest from './focusOnTouch/FocusOnTouchTest.test';
import focusControlTest from './focusControl/FocusControlTest.test';
import focusableDefaultTest from './focusableDefault/FocusableDefaultTest.test';
import enabledTest from './enabled/EnabledTest.test';
import alignSelfTest from './flex/AlignSelfTest.test';
import flexShrinkTest from './flex/FlexShrinkTest.test';
import flexGrowTest from './flex/FlexGrowTest.test';
import flexBasisTest from './flex/FlexBasisTest.test';
import hitTestBehaviorTest from './hitTestBehaviorTest/HitTestBehaviorTest.test';
import alignSelfStretchNoSizeTest from './flex/AlignSelfStretchNoSizeTest.test';
import alignSelfStretchTest from './flex/AlignSelfStretchTest.test';
import alignSelfGridRowTest from './flex/AlignSelfGridRowTest.test';
import gridOffsetTest from './gridOffset/GridOffsetTest.test';
import gridSpanTest from './gridSpan/GridSpanTest.test';
import zIndexTest from './zIndex/ZIndexTest.test';
import useSizeTypeTest from './useSizeType/UseSizeTypeTest.test';
import touchableTest from './touchable/TouchableTest.test';
import stateStylesTest from './stateStyles/StateStylesTest.test';

export default function testsuite() {
  defaultTest();
  defaultFocusValueTest();
  defaultFlexTest();
  defaultFlexByGridRowTest();
  aspectRatioWidthTest();
  aspectRatioHeightTest();
  displayPriorityTest();
  onAppearTest();
  onDisAppearTest();
  onAreaChangeTest();
  onVisibleAreaChangeTest();
  positionTest();
  markAnchorTest();
  offsetTest();
  alignRulesTest();
  marginTest();
  marginLengthTest();
  //marginStringTest();
  layoutWeightTest();
  layoutWeightFlexTest();
  layoutWeightRowTest();
  constraintSizeTest();
  widthTest();
  heightTest();
  sizeTest();
  paddingContainerTest();
  paddingBaseTest();
  paddingContainerLengthTest();
  paddingBaseLengthTest();
  visibilityTest();
  responseRegionTest();
  focusableTest();
  tabIndexTest();
  defaultFocusTest();
  groupDefaultFocusTest();
  focusOnTouchTest();
  focusControlTest();
  focusableDefaultTest();
  enabledTest();
  flexBasisTest();
  flexGrowTest();
  flexShrinkTest();
  alignSelfTest();
//  alignSelfGridRowTest();
//  alignSelfStretchTest();
//  alignSelfStretchNoSizeTest();
  hitTestBehaviorTest();
  zIndexTest();
  gridSpanTest();
  gridOffsetTest();
  useSizeTypeTest();
  touchableTest();
  stateStylesTest();
}