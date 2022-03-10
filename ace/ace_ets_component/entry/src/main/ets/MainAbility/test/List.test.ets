/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import gaugeJsunit from './GaugeJsunit.test.ets';
import ellipseJsunit from './EllipseJsunit.test.ets';
import systemRouterJsunit from './SystemRouterJsunit.test.ets';
import marqueeJsunit from './MarqueeJsunit.test.ets';
import stepperJsunit from './StepperJsunit.test.ets';
import gridContainerJsunit from './GridContainerJsunit.test.ets';
import listJsunit from './ListJsunit.test.ets';
import sizeSettingJsunit from './general-properties/SizeSettingJsunit.test.ets';
import positionSettingJsunit from './general-properties/PositionSettingJsunit.test.ets';
import opacitySettingJsunit from './general-properties/OpacitySettingJsunit.test.ets';
import swiperJsunit from './SwiperJsunit.test.ets';
import enableJsunit from './EnableJsunit.test.ets';
import clickEventJsunit from './general-properties/ClickEventJsunit.test.ets';
import colorGradientJsunit from './general-properties/ColorGradientJsunit.test.ets';
import visibilityJsunit from './general-properties/VisibilityJsunit.test.ets';
import layoutConstraintsJsunit from './general-properties/LayoutConstraintsJsunit.test.ets';
import areaChangeJsunit from './AreaChangeJsunit.test.ets';
import appearJsunit from './AppearJsunit.test.ets';
import overlayJsunit from './OverlayJsunit.test.ets';
import ZIndexJsunit from './ZIndexJsunit.test.ets';
import touchAbleJsunit from './general-properties/TouchAbleJsunit.test.ets';
import shapeClippingJsunit from './general-properties/ShapeClippingJsunit.test.ets';
import textStyleJsunit from './general-properties/TextStyleJsunit.test.ets';
import imageEffectsJsunit from './general-properties/ImageEffectsJsunit.test.ets';
import transformJsunit from './general-properties/TransFormJsunit.test.ets';
import gridSettingsJsunit from './general-properties/GridSettingsJsunit.test.ets';
import touchJsunit from './general-properties/TouchJsunit.test.ets'
import backgroundJsunit from './general-properties/BackgroundJsunit.test.ets';
import borderJsunit from './general-properties/BorderJsunit.test.ets';
import flexJsunit from './general-properties/FlexJsunit.test.ets';
import gridJsunit from './GridJsunit.test.ets';
import canvasJsunit from './CanvasJsunit.test.ets';
import textJsunit from './TextJsunit.test.ets';
import badgeJsunit from './BadgeJsunit.test.ets';
import longPressGestureJsUnit from './LongPressGesture.test.ets';
import buttonJsunit from './ButtonJsunit.test.ets';
import responseRegionJsunit from './general-properties/ResponseRegionJsunit.test.ets';
import panGestureJsunit from './general-properties/PanGestureJsunit.test.ets';
import tabsJsunit from './TabsJsunit.test.ets';
import qrCodeJsunit from './QrCodeJsunit.test.ets';
import tapGesture from './TapGesture.test.ets';
import progressJsunit from './ProgressJsunit.test.ets';
import animateJsunit from './AnimateJsunit.test.ets';
import commonJsunit from './CommonJsunit.test.ets';
import spanJsunit from './SpanJsunit.test.ets';
import columnJsunit from './ColumnJsunit.test.ets';
import ratingJsunit from './RatingJsunit.test.ets';
import canvas2Jsunit from './Canvas2Jsunit.test.ets';
import toggleJsunit from './ToggleJsunit.test.ets';
import shapeJsunit from './ShapeJsunit.test.ets'
import motionPathJsunit from './MotionPathJsunit.test.ets';
import scrollCodeJsunit from './ScrollCodeJsunit.test.ets';
import transitionJsunit from './TransitionJsunit.test.ets';
import priorityGestureJsunit from './PriorityGestureJsunit.test.ets';
import parallelGestureJsunit from './ParallelGestureJsunit.test.ets';
import blankJsunit from './BlankJsunit.test.ets';
import sharedTransitionJsunit from './SharedTransitionJsunit.test.ets';
import alphabetIndexerJsunit from './AlphabetIndexerJsunit.test.ets';
import lineJsunit from './LineJsunit.test.ets';
import circleJsunit from './CircleJsunit.test.ets';
import aboutToDisappearJsunit from './AboutToDisappearJsunit.test.ets';
import bindMenuJsunit from './BindMenuJsunit.test.ets';
import bindPopupJsunit from './BindPopupJsunit.test.ets';
import directionJsunit from './DirectionJsunit.test.ets';
import timeStampJsunit from './TimeStampJsunit.test.ets';
import listItemJsunit from './ListItemJsunit.test.ets';
import navigatorCodeJsunit from './NavigatorCodeJsunit.test.ets';
import pieceJsunit from './PieceJsunit.test.ets';
import dividerJsunit from './DividerJsunit.test.ets';
import systemAppJsunit from './SystemAppJsunit.test.ets';
import systempromptJsunit from './SystempromptJsunit.test.ets';
import configurationJsunit from './ConfigurationJsunit.test.ets';
import sourceTypeJsunit from './SourceTypeJsunit.test.ets';
import pageTransitionJsunit from './PageTransitionJsunit.test.ets';
import navigationJsunit from './NavigationJsunit.test.ets';
import loadingProgressJsunit from './LoadingProgressJsunit.test.ets';
import radioJsunit from './RadioJsunit.test.ets';
import rowJsunit from './RowJsunit.test.ets';
import scrollBarJsunit from './ScrollBarJsunit.test.ets';
import searchJsunit from './SearchJsunit.test.ets';

export default function testsuite() {
  gaugeJsunit();
  ellipseJsunit();
  systemRouterJsunit();
  marqueeJsunit();
  stepperJsunit();
  gridContainerJsunit();
  listJsunit();
  sizeSettingJsunit();
  positionSettingJsunit();
  opacitySettingJsunit();
  swiperJsunit();
  enableJsunit();
  clickEventJsunit();
  layoutConstraintsJsunit();
  colorGradientJsunit();
  areaChangeJsunit();
  appearJsunit();
  overlayJsunit();
  visibilityJsunit();
  ZIndexJsunit();
  touchAbleJsunit();
  shapeClippingJsunit();
  textStyleJsunit();
  imageEffectsJsunit();
  transformJsunit();
  gridSettingsJsunit();
  touchJsunit();
  backgroundJsunit();
  borderJsunit();
  flexJsunit();
  gridJsunit();
  textJsunit();
  badgeJsunit();
  canvasJsunit();
  canvas2Jsunit();
  longPressGestureJsUnit();
  buttonJsunit();
  responseRegionJsunit();
  tabsJsunit();
  panGestureJsunit();
  qrCodeJsunit();
  tapGesture();
  progressJsunit();
  animateJsunit();
  commonJsunit();
  spanJsunit();
  ratingJsunit();
  toggleJsunit();
  shapeJsunit();
  motionPathJsunit();
  columnJsunit();
  scrollCodeJsunit();
  transitionJsunit();
  priorityGestureJsunit();
  parallelGestureJsunit();
  blankJsunit();
  sharedTransitionJsunit();
  alphabetIndexerJsunit();
  lineJsunit();
  circleJsunit();
  aboutToDisappearJsunit();
  timeStampJsunit();
  bindMenuJsunit();
  bindPopupJsunit();
  directionJsunit();
  dividerJsunit();
  systempromptJsunit();
  configurationJsunit();
  sourceTypeJsunit();
  pageTransitionJsunit();
  navigationJsunit();
  loadingProgressJsunit();
  radioJsunit();
  rowJsunit();
  listItemJsunit();
  navigatorCodeJsunit();
  pieceJsunit();
  searchJsunit();
  scrollBarJsunit();
  systemAppJsunit();
}
