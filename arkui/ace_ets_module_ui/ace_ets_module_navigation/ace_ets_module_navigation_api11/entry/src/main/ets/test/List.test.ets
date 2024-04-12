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
import stepperJsunit from './stepperTest/StepperJsunit.test';
import NavigationParamTest from './NavigationTest/NavigationParam.test';
import NavigationApi from './NavigationTest/NavigationApi.test';
import NavigationApi2 from './NavigationTest/NavigationApi2.test';
import NavigationApi3 from './NavigationTest/NavigationApi3.test';
import NavPathStackApi1 from './NavigationTest/NavPathStackApi1.test';
import NavPathStackApi2 from './NavigationTest/NavPathStackApi2.test';
import NavPathStackApi3 from './NavigationTest/NavPathStackApi3.test';
import NavDestinationInfoStateJsunit  from './NavDestinationTest/NavDestinationInfoStateJsunit.test'
import QueryNavDestinationInfoNavDestinationJsunit from './NavDestinationTest/QueryNavDestinationInfoNavDestinationJsunit.test';
import NavigationAttr from './NavigationTest/NavigationAttr.test'
import navigationApi1 from './NavigationTest/navigationApi/navigationApi1.test'
import sidebar from './SideBarContainerTest/SideBar.test'

export default function testsuite() {
  stepperJsunit();
  NavigationParamTest();
  NavigationApi()
  NavigationApi2()
  NavigationApi3()
  NavPathStackApi1()
  NavPathStackApi2()
  NavPathStackApi3()
  NavDestinationInfoStateJsunit()
  QueryNavDestinationInfoNavDestinationJsunit()
  NavigationAttr()
  navigationApi1()
  sidebar()

}