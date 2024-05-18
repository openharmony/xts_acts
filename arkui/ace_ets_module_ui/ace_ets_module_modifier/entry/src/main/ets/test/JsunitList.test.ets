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

import marqueeJsunit from './MarqueeJsunit.test.ets';
import swiperJsunit from './SwiperJsunit.test.ets';
import buttonJsunit from './ButtonJsunit.test.ets';
import tabsFirstJsunit from './TabsFirstJsunit.test.ets';
import columnJsunit from './ColumnJsunit.test.ets';
import columnSplitJsunit from './ColumnSplitJsunit.test.ets';
import rowJsunit from './RowJsunit.test.ets';
import rowSplitJsunit from './RowSplitJsunit.test.ets';
import sideBarContainerJsunit from './SideBarContainerJsunit.test.ets';
import imageSpanJsunit from './ImageSpanJsunit.test.ets';
import textJsunit from './TextJsunit.test.ets';
import stepperItemJsunit from './StepperItem.test.ets';
import navigationJsunit from './NavigationJsunit.test.ets';
import navigatorJsunit from './NavigatorJsunit.test.ets';
import timepickerJsunit from './TimePickerJsunit.test.ets';
import textpickerJsunit from './TextPickerJsunit.test.ets';
import sliderJsunit from './SliderJsunit.test.ets';
import selectJsunit from './SelectJsunit.test.ets';
import ratingJsunit from './RatingJsunit.test.ets';
import alphabetIndexerJsunit from './AlphabetIndexerJsunit.test.ets';
import formComponentJsunit from './FormComponentJsunit.test.ets';
import panelJsunit from './PanelJsunit.test.ets';
import menuItemJsunit from './MenuItemJsunit.test.ets';
import checkboxJsunit from './CheckboxJsunit.test.ets';
import loadingProgressJsunit from './LoadingProgress.test.ets';
import checkBoxGroupJsunit from './CheckBoxGroup.test.ets';
import datePickerJsunit from './DatePicker.test.ets';
import radioJsunit from './Radio.test.ets';
import hyperLinkJsunit from './HyperLink.test.ets';
import menuJsunit from './Menu.test.ets';
import pathJsunit from './Path.test.ets';
import shapeJsunit from './Shape.test.ets';
import lineJsunit from './Line.test.ets';
import dataPanelJsunit from './DataPanelJsunit.test.ets';
import gaugeJsunit from './GaugeJsunit.test.ets';
import progressJsunit from './Progress.test.ets';
import textTimerJsunit from './TextTimer.test.ets';
import textClockJsunit from './TextClockJsunit.test.ets';
import scrollJsunit from './Scroll.test.ets';
import waterFlowViewJsunit from './WaterFlowView.test.ets';
import qrCodeJsunitJsunit from './QrCodeJsunit.test.ets';
import calendarPickerJsunit from './CalendarPicker.test.ets';
import listJsunit from './List.test.ets';
import listItemJsunit from './ListItem.test.ets';
import listItemGroupJsunit from './ListItemGroup.test.ets';
import gridJsunit from './Grid.test.ets';
import gridItemJsunit from './GridItem.test.ets';
import toggleJsunit from './ToggleJsunit.test.ets';
import rectJsunit from './RectJsunit.test.ets';
import polyLineJsunit from './PolyLine.test.ets';
import counterJsunit from './Counter.test.ets';
import navRouterJsunit from './NavRouterJsunit.test.ets';
import navDestinationJsunit from './NavDestination.test.ets';
import sharedTransitionJsunit from './SharedTransitionJsunit.test.ets';
import transitionJsunit from './TransitionJsunit.test.ets';
import geometryTransitionJsunit from './GeometryTransitionJsunit.test.ets';
import motionPathJsunit from './MotionPathJsunit.test.ets';
import shortcutKeyJsunit from './ShortcutKey.test.ets';
import common1Jsunit from './Common1.test.ets';
import polygonJsunit from './Polygon.test.ets';
import common9Jsunit from './Common9Jsunit.test.ets';
import blankJsunit from './Blank.test.ets';
import dividerJsunit from './Divider.test.ets';
import gridColJsunit from './GridCol.test.ets';
import gridRowJsunit from './GridRow.test.ets';
import imageJsunit from './Image.test.ets';
import imageAnimatorJsunit from './ImageAnimator.test.ets';
import patternLockJsunit from './PatternLock.test.ets';
import videoJsunit from './Video.test.ets';
import waterflowNestedScrollJsunit from './WaterFlowNestedScroll.test.ets';
import scrollNestedScrollJsunit from './ScrollNestedScroll.test.ets';
import stackJsunit from './StackJsunit.test.ets';
import richEditorJsunit from './RichEditorJsunit.test.ets';
import searchJsunit from './SearchJsunit.test.ets';
import spanJsunit from './SpanJsunit.test.ets';
import textAreaJsunit from './TextAreaJsunit.test.ets';
import textInputJsunit from './TextInput.test.ets';
import gridNestedScrollJsunit from './GridNestedScroll.test.ets';
import listNestedScrollJsunit from './ListNestedScroll.test.ets';

export default function testsuite() {
  
  common9Jsunit();
  common1Jsunit();
  shortcutKeyJsunit();
  geometryTransitionJsunit();
  motionPathJsunit();
  sharedTransitionJsunit();
  transitionJsunit();

  columnJsunit();
  columnSplitJsunit();
  rowJsunit();
  rowSplitJsunit();
  sideBarContainerJsunit();

  blankJsunit();
  dividerJsunit();
  gridColJsunit();
  gridRowJsunit();
  navDestinationJsunit();
  navigationJsunit()
  navigatorJsunit();
  navRouterJsunit();
  stackJsunit();
  stepperItemJsunit();
  tabsFirstJsunit();

  gridJsunit();
  gridNestedScrollJsunit();
  gridItemJsunit();
  listJsunit();
  listNestedScrollJsunit();
  listItemJsunit();
  listItemGroupJsunit();

  scrollNestedScrollJsunit();
  scrollJsunit();
  swiperJsunit();
  waterflowNestedScrollJsunit();
  waterFlowViewJsunit();

  buttonJsunit();
  calendarPickerJsunit();
  checkboxJsunit();
  checkBoxGroupJsunit();
  counterJsunit();
  datePickerJsunit();
  radioJsunit();
  ratingJsunit();
  selectJsunit();
  sliderJsunit();
  textpickerJsunit();
  timepickerJsunit();
  toggleJsunit();

  imageSpanJsunit();
  patternLockJsunit();
  richEditorJsunit();
  searchJsunit();
  spanJsunit();
  textJsunit();  
  textAreaJsunit();
  textInputJsunit();

  imageJsunit();
  imageAnimatorJsunit();
  videoJsunit();

  dataPanelJsunit();
  gaugeJsunit();
  loadingProgressJsunit();
  marqueeJsunit();
  progressJsunit();
  qrCodeJsunitJsunit();
  textClockJsunit();
  textTimerJsunit();

  lineJsunit();
  pathJsunit();
  polygonJsunit();
  polyLineJsunit();
  rectJsunit();
  shapeJsunit();

  alphabetIndexerJsunit();
  formComponentJsunit();
  hyperLinkJsunit();
  menuItemJsunit();
  menuJsunit();
  panelJsunit();
}