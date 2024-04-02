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
import overLayJsunit from './overlayTest/OverlayJsunit.test';
import zIndexJsunit from './zIndexTest/ZIndexJsunit.test';
import visibilityJsunit from './visibilityTest/VisibilityJsunit.test';
import AttributeModifierDemoAPI01 from './attributeModifierTest/AttributeModifierDemoAPI01Jsunit.test';
import AttributeModifierDemoAPI02 from './attributeModifierTest/AttributeModifierDemoAPI02Jsunit.test';
import AttributeModifierDemoAPI03 from './attributeModifierTest/AttributeModifierDemoAPI03Jsunit.test';
import accessVNTest from './AccessibleTest/accessVNTest.test';
import dymaticTest from "./attributeModifierTest/dymatic.test"
import outlineTest from './outlineTest/outlineTest.test';

export default function testsuite() {
  overLayJsunit();
  zIndexJsunit();
  visibilityJsunit();
  AttributeModifierDemoAPI01()
  AttributeModifierDemoAPI02()
  AttributeModifierDemoAPI03()
  accessVNTest()
  dymaticTest()
  outlineTest()
}