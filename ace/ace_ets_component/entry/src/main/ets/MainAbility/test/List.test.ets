// @ts-nocheck
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
import touchJsunit from './general-properties/touchJsunit.test.ets'
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
  longPressGestureJsUnit();
  buttonJsunit();
  responseRegionJsunit();
  tabsJsunit();
  panGestureJsunit();
  qrCodeJsunit();
  tapGesture();
  progressJsunit();
  animateJsunit();
}