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

import PerGlobalConnectTest from './PersistenceV2Test/PerGlobalConnectTest.test';
import ReuseV2Test0030 from './ReuseV2Test/ReuseV2Test0030.test';
import RepeatCloseReuseTest0110 from './repeat/RepeatCloseReuseTest0110.test';
import RepeatLazyTest0150 from './repeat/RepeatLazyTest0150.test';
import VOneToVTwoTest0010 from './v1tov2/VOneToVTwoTest0010.test';
import VTwoToVOneTest0070 from './v2tov1/VTwoToVOneTest0070.test';
import ArrayLikeStringTest from './ArrayLikeTest/ArrayLikeStringTest.test';
import repeatReusableFalse from './ReusableTest/repeatReusableFalse.test';
import repeatReusableTrue from './ReusableTest/repeatReusableTrue.test';

export default function testsuite() {
    PerGlobalConnectTest();
    ReuseV2Test0030();
    RepeatCloseReuseTest0110();
    RepeatLazyTest0150();
    VOneToVTwoTest0010();
    VTwoToVOneTest0070();
	ArrayLikeStringTest()
	repeatReusableFalse();
	repeatReusableTrue();
}