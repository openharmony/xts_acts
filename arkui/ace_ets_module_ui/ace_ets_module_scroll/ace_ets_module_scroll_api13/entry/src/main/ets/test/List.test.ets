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
 
import enableScrollJsunit from './ScrollBarTest/enableScrollJsunit.test';
import getListVisible from './ListTest/getListVisible.test'; 
import headerListJsunit from './ListTest/headerListJsunit.test'; 
import waterFlowFad from './WaterFlowTest/waterFlowFad.test';
import tabsOpacityJsunit from './TabsTest/tabsOpacityJsunit.test'; 
import bindTabsScroll from './TabsTest/bindTabsScroll.test';
import listItemGroupComponent from './ListTest/listItemGroupComponent.test'; 
import itemIndexList from './ListTest/itemIndexList.test'; 
import groupAnimation from './ListTest/groupAnimation.test'; 
import animationCallback from './ListTest/animationCallback.test'; 

export default function testsuite() {
  enableScrollJsunit()
  getListVisible()
  headerListJsunit()
  waterFlowFad()
  tabsOpacityJsunit()
  bindTabsScroll()
  listItemGroupComponent()
  itemIndexList()
  groupAnimation()
  animationCallback()
}