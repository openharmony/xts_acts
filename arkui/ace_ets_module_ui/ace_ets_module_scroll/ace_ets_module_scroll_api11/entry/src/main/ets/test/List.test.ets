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
import listJsunit from './ListTest/ListJsunit.test';
import swiperJsunit from './SwiperTest/SwiperJsunit.test';
import ListDeleteTest from './ListTest/ListDelete.test'
import ListSwipeTest from './ListTest/ListSwipe.test'
import ListReboundTest from './ListTest/ListRebound.test'
import SwiperMarginTest from './SwiperTest/SwiperMargin.test'
import ListScrollTest from './ListTest/ListScroll.test'
import ListScrollToItemInGroup from './ListTest/ListScrollToItemInGroup.test'
import TabsApi from './TabsTest/TabsApi.test';
import APIScrollflingSpeedLimitJsunit from './ScrollTest/APIScrollflingSpeedLimitJsunit.test';
import APITabsBarBackgroundBlurStyleJsunit from './TabsTest/APITabsBarBackgroundBlurStyleJsunit.test';
import alphabetTest from './AlphabetIndexerTest/alphabetTest.test';
import gridIndexTest from "./gridTest/grid.test"
import listSContentTest from "./ListTest/list.test"
import SwiperLoop from './SwiperTest/Swiper/SwiperLoop.test'
import SwiperVisibility from './SwiperTest/Swiper/SwiperVisibility.test'
import swiper1 from './SwiperTest/Swiper/swiper1.test'
import swiper2 from './SwiperTest/Swiper/swiper2.test'
import swiperWidthTest from './SwiperTest/swiper2/swiperTwidth.test'
import swiperGroupTest from './SwiperTest/swiper2/swiperGroup.test'
import swiperPageTest from './SwiperTest/swiper2/swiperPage.test'
import swiperNextPreTest from './SwiperTest/swiper2/swiperNextPrevious.test'
import swiperDelAddTest from './SwiperTest/swiper2/swiperDeleteAdd.test'
import swiperEdgeTest from './SwiperTest/swiper2/swiperEdge.test'
import swipeleftScrollTest from './SwiperTest/swiper2/swiperleftScroll.test'
import swiperRightScrollTest from './SwiperTest/swiper2/swiperightscroll.test'
import tabsApi1 from './TabsTest/tabs/tabsApi1.test';
import TouchTestStrategy from './ScrollTest/TouchTestStrategy.test';
import ScrollTest from './ScrollTest/Scroll.test'
import AlphabetIndexer from './AlphabetIndexerTest/AlphabetIndexer'

export default function testsuite() {
  listJsunit();
  swiperJsunit();
  ListDeleteTest();
  ListSwipeTest();
  ListReboundTest();
  SwiperMarginTest();
  ListScrollTest();
  ListScrollToItemInGroup();
  TabsApi();
  APIScrollflingSpeedLimitJsunit();
  APITabsBarBackgroundBlurStyleJsunit();
  alphabetTest()
  gridIndexTest()
  listSContentTest()
  SwiperLoop()
  SwiperVisibility()
  swiper1()
  swiper2()
  swiperWidthTest()
  swiperGroupTest()
  swiperPageTest()
  swiperNextPreTest()
  swiperDelAddTest()
  swiperEdgeTest()
  swipeleftScrollTest()
  swiperRightScrollTest()
  tabsApi1()
  TouchTestStrategy()
  ScrollTest()
  AlphabetIndexer()
}