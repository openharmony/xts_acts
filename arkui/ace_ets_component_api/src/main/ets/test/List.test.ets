/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import ListDeleteTest from './ListDelete.test'
import ListSwipeTest1 from './ListSwipe1.test'
import ListSwipeTest2 from './ListSwipe2.test'
import ListSwipeTest3 from './ListSwipe3.test'
import ListSwipeTest4 from './ListSwipe4.test'
import ListReboundTest from './ListRebound.test'
import TextAreaCallbackTest from './TextAreaCallback.test'
import BindMenuTest from './BindMenu.test'
import NavigationParamTest from './NavigationParam.test'
import ImageTextTest from './ImageText.test'
import CanvasColorTest from './CanvasColor.test'
import OffScreenCanvasTest from './OffScreenCanvas.test'
import CanvasAPIUnitTest from './CanvasAPIUnit.test'
import CanvasAPICanvasRenderTest from './CanvasAPICanvasRender.test'
import CanvasAPITest from './CanvasAPI.test'
import CanvasShaderTest from './CanvasShader.test'

export default function testsuite() {
  ListSwipeTest1()
  ListSwipeTest2()
  ListSwipeTest3()
  ListSwipeTest4()
  ListDeleteTest()
  ListReboundTest()
  TextAreaCallbackTest()
  BindMenuTest()
  NavigationParamTest()
  ImageTextTest()
  CanvasColorTest()
  OffScreenCanvasTest()
  CanvasAPIUnitTest()
  CanvasAPICanvasRenderTest()
  CanvasAPITest()
  CanvasShaderTest()
}
