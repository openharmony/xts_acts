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

import alphabetIndexerOnSelectJsunit from './alphabetIndexer.test.ets';
import checkBoxGroupSelectAllJsunit from './checkBoxGroup.test.ets';
import circleNewJsunit from './circle.test.ets';
import commonBackgroundBlurStyleJsunit from './common.test.ets';
import ellipseNeJsunit from './ellipse.test.ets';
import gaugeColorsJsunit from './gauge.test.ets';
import gridMaxCountJsunit from './grid.test.ets';
import gridItemOnSelectJsunit from './gridItem.test.ets';
import grid_colSpanJsunit from './grid_col.test.ets';
import grid_rowOnBreakpointChangeJsunit from './grid_row.test.ets';
import inspectorJsunit from  './inspector.test.ets'
import lazyForEachOnDataAddJsunit from './lazyForEach.test.ets';
import navigatorTargetJsunit from './navigator.test.ets'
import pathNewTest from './path.test.ets';
import polygonNewJsunit from './polygon.test.ets';
import polyLineNeJsunit from './polyLine.test.ets';
import progressScaleCountJsunit from './progress.test.ets';
import rectNeJsunit from './rect.test.ets';
import scrollOnScrollBeginJsunit from './scroll.test.ets';
import searchOnCutJsunit from './search.test.ets'
import sideBarShowSideBarJsunit from './sideBar.test.ets';
import stackAlignContentJsunit from './stack.test.ets';
import swiperCurveJsunit from './swiper.test.ets';
import tabsBarPositionJsunit from './tabs.test.ets';
import textMinFontSizeJsunit from './text.test.ets';
import textAreaOnCutJsunit from './textArea.test.ets';
import textInputOnEditChangeJsunit from './textInput.test.ets';
import textPickerDefaultPickerItemHeightJsunit from './textPicker.test.ets';
import videoOnFullscreenChangeJsunit from './video.test.ets';
import webGetTitleJsunit from './web.test.ets';

export default function testsuite() {
  lazyForEachOnDataAddJsunit()
  alphabetIndexerOnSelectJsunit()
  checkBoxGroupSelectAllJsunit()
  circleNewJsunit()
  commonBackgroundBlurStyleJsunit()
  ellipseNeJsunit()
  gaugeColorsJsunit()
  grid_rowOnBreakpointChangeJsunit()
  gridMaxCountJsunit()
  gridItemOnSelectJsunit()
  inspectorJsunit()
  navigatorTargetJsunit()
  pathNewTest()
  polygonNewJsunit()
  polyLineNeJsunit()
  progressScaleCountJsunit()
  rectNeJsunit()
  scrollOnScrollBeginJsunit()
  searchOnCutJsunit()
  sideBarShowSideBarJsunit()
  stackAlignContentJsunit()
  swiperCurveJsunit()
  tabsBarPositionJsunit()
  textMinFontSizeJsunit()
  textAreaOnCutJsunit()
  textInputOnEditChangeJsunit()
  textPickerDefaultPickerItemHeightJsunit()
  videoOnFullscreenChangeJsunit()
  webGetTitleJsunit()
}