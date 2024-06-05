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
import NavigationApi1 from './Navigation/NavigationApi1.test'
import NavigationApi2 from './Navigation/NavigationApi2.test'
import NavigationApi3 from './Navigation/NavigationApi3.test'
import NavigationApi4 from './Navigation/NavigationApi4.test'
import NavigationBarStyle from './Navigation/NavigationBarStyle.test'
import NavigationOnPop from './Navigation/NavigationOnPop.test'
import NavDestinationEvents from './NavDestinationTest/NavDestinationEvents.test'
import NavDestinationRouterMap from './NavDestinationTest/NavDestinationRouterMap.test'
import NavigationSymbolIcon from './Navigation/NavigationSymbolIcon.test'

export default function testsuite() {
  NavigationApi1();
  NavigationApi2();
  NavigationApi3();
  NavigationApi4();
  NavigationBarStyle();
  NavigationOnPop();
  NavDestinationEvents();
  NavDestinationRouterMap();
  NavigationSymbolIcon();
}