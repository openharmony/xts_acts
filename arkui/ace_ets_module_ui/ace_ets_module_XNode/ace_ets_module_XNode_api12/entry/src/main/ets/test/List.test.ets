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
import borderRadiuses from './GraphicsTest/borderRadiuses.test';
import borderStyles from './GraphicsTest/borderStyles.test';
import edgeColors from './GraphicsTest/edgeColors.test';
import edgeWidths from './GraphicsTest/edgeWidths.test';
import renderNodeGetInterfaceTest from './renderNode/renderNodeTestInterface.test';
import disposeTest from './FrameNodeTest/dispose.test';
import getAttrsTest from './FrameNodeTest/getAttrs.test';
import RenderNodeAttributeTest from './renderNode/RenderNodeAttributeTest.test';
import setRectShape from './GraphicsTest/setRectShape.test';
import LengthUnitTest from './GraphicsTest/LengthUnit.test'
import getBlendColor from './GraphicsTest/getBlendColor.test';
import resourceColor from './GraphicsTest/resourceColor.test';
import getNumeric from './GraphicsTest/getNumeric.test';
import getAlpha from './GraphicsTest/getAlpha.test';
import getBlue from './GraphicsTest/getBlue.test';
import getGreen from './GraphicsTest/getGreen.test';
import getRed from './GraphicsTest/getRed.test';

export default function testsuite() {
  borderRadiuses();
  borderStyles();
  edgeColors();
  edgeWidths();
  renderNodeGetInterfaceTest();
  disposeTest();
  getAttrsTest();
  RenderNodeAttributeTest();
  setRectShape();
  LengthUnitTest();
  getBlendColor();
  resourceColor();
  getNumeric();
  getAlpha();
  getBlue();
  getGreen();
  getRed();
}