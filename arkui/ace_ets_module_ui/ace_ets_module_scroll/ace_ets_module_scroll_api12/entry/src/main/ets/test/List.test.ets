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
import ListScrollTest1 from './ScrollTest/ListScroll.test';
import PopupAlphaTest from './AlphabetIndexerTest/PopupAlpha.test';
import ListMainChildrenTest from './ListTest/ListMainChildren.test';
import refreshOffsetJsunit from './RefreshTest/refreshOffsetJsunit.test';
import listVisibleJsunit from './ListTest/listVisibleJsunit.test';
import scrollOffsetJsunit from './ScrollTest/scrollOffsetJsunit.test';
import swiperCustomJsunit from './SwiperTest/swiperCustomJsunit.test';
import tabIconJsunit from './TabsTest/tabIconJsunit.test';
import ListFadeOut from './ListFadeOut/ListFadeOut.test';
import ListFadeOutEx from './ListFadeOut/ListFadeOutEx.test';
import ListFadeOutEx1 from './ListFadeOut/ListFadeOutEx1.test';
import listSwipeActionApi12Test from './ListTest/listSwipeActionApi12.test';
import ScrollSource from './ScrollTest/ScrollSource.test';
import offsetRemain from './ScrollTest/offsetRemain.test';

export default function testsuite() {
  ListScrollTest1()
  PopupAlphaTest()
  ListMainChildrenTest()
  refreshOffsetJsunit();
  listVisibleJsunit();
  scrollOffsetJsunit();
  swiperCustomJsunit();
  tabIconJsunit();
  ListFadeOut();
  ListFadeOutEx();
  ListFadeOutEx1();
  listSwipeActionApi12Test();
  ScrollSource();
  offsetRemain()
}