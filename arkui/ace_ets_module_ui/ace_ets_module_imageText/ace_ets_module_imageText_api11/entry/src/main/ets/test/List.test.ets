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
import marqueeJsunit from './marqueeTest/MarqueeJsunit.test';
import textStyleJsunit from './textTest/TextStyleJsunit.test';
import TextStateJsunit from './textTest/TextStateJsunit.test';
import ImageTextTest from './textTest/ImageText.test';
import TextAreaCallbackTest from './TextAreaTest/TextAreaCallback.test';
import TextAreaSelectTest from './TextAreaTest/TextAreaSelect.test';
import arkuiNodeTest from "./NodeContainerTest/arkuinode/arkuinode.test";
import arkuiNodeEventTest from './NodeContainerTest/arkuinode/arkuinodeEnvent.test';
import arkuiNodeRenderTest from './NodeContainerTest/arkuinode/arkuinodeRender.test';
import Image_QRCode_Api from './textTest/Image_QRCode_Api.test';
import RichEditorApi from './RichEditorTest/RichEditorApi.test';
import RichEditorApi2 from './RichEditorTest/RichEditorApi2.test';
import APIgetUIFontConfigJsunit from './fontTest/APIgetUIFontConfigJsunit.test';
import APITextBackgroundStyleJsunit from './ContainerSpanTest/APITextBackgroundStyleJsunit.test'
import SXrenderingStrategyJsunit from './RichEditorTest/SXrenderingStrategyJsunit.test';
import SXsymbolSpanStyleJsunit from './RichEditorTest/SXsymbolSpanStyleJsunit.test';
import SXsymbolStyleJsunit from './RichEditorTest/SXsymbolStyleJsunit.test';
import SXvalueResourceJsunit from './RichEditorTest/SXvalueResourceJsunit.test'
import SXSymbolGlyphSINGLE01Jsunit from './SymbolGlyphTest/SXSymbolGlyphSINGLE01Jsunit.test'
import buttonControlTest from "./buttonTest/buttonControl.test"
import textDataDataDetectorConfig from './textTest/textDataDataDetectorConfig.test'
import RelativeGuideLine from './RelativeContainerTest/RelativeGuideLine.test'
import RelativeGuideLine2 from './RelativeContainerTest/RelativeGuideLine2.test'
import RelativeGuideLine3 from './RelativeContainerTest/RelativeGuideLine3.test'
import RelativeGuideLine4 from './RelativeContainerTest/RelativeGuideLine4.test'
import RelativeGuideLine5 from './RelativeContainerTest/RelativeGuideLine5.test'
import RelativeGuideLine6 from './RelativeContainerTest/RelativeGuideLine6.test'
import RelativeGuideLine7 from './RelativeContainerTest/RelativeGuideLine7.test'
import RelativeChain from './RelativeContainerTest/RelativeChain.test'
import RelativeChain2 from './RelativeContainerTest/RelativeChain2.test'
import RelativeChain3 from './RelativeContainerTest/RelativeChain3.test'
import RelativeChain4 from './RelativeContainerTest/RelativeChain4.test'
import RelativeChain5 from './RelativeContainerTest/RelativeChain5.test'
import RelativeChain6 from './RelativeContainerTest/RelativeChain6.test'
import RelativeChain7 from './RelativeContainerTest/RelativeChain7.test'
import RelativeChain8 from './RelativeContainerTest/RelativeChain8.test'
import RelativeChain9 from './RelativeContainerTest/RelativeChain9.test'
import RelativeChain10 from './RelativeContainerTest/RelativeChain10.test'
import RelativeChain11 from './RelativeContainerTest/RelativeChain11.test'
import RelativeChain12 from './RelativeContainerTest/RelativeChain12.test'
import RelativeBarrier from './RelativeContainerTest/RelativeBarrier.test'
import RelativeBarrier2 from './RelativeContainerTest/RelativeBarrier2.test'
import RelativeBarrier3 from './RelativeContainerTest/RelativeBarrier3.test'
import RelativeBarrier4 from './RelativeContainerTest/RelativeBarrier4.test'
import RelativeBarrier5 from './RelativeContainerTest/RelativeBarrier5.test'
import RelativeBarrier6 from './RelativeContainerTest/RelativeBarrier6.test'
import RelativeBarrier7 from './RelativeContainerTest/RelativeBarrier7.test'
import RelativeBarrier8 from './RelativeContainerTest/RelativeBarrier8.test'
import RelativeBorder from './RelativeContainerTest/RelativeBorder.test'
import RelativePadding from './RelativeContainerTest/RelativePadding.test'

import Navigation1 from './RelativeContainerTest/relativeApi11/Navigation1.test'
import Navigation2 from './RelativeContainerTest/relativeApi11/Navigation2.test'
import Navigation3 from './RelativeContainerTest/relativeApi11/Navigation3.test'
import Navigation4 from './RelativeContainerTest/relativeApi11/Navigation4.test'
import RelativeContainer from './RelativeContainerTest/relativeApi11/RelativeContainer.test'

import relativeCTest from "./RelativeContainerTest/relative/relative.test"

import getClipToFrameJsunit from './RenderNodeTest/RenderNodeTest_001/getClipToFrameJsunit.test'
import getOpacityJsunit from './RenderNodeTest/RenderNodeTest_001/getOpacityJsunit.test'
import getSizeJsunit from './RenderNodeTest/RenderNodeTest_001/getSizeJsunit.test'
import SetSizeJsunit from './RenderNodeTest/RenderNodeTest_001/SetSizeJsunit.test.ets'
import SetClipToFrameJsunit from './RenderNodeTest/RenderNodeTest_001/SetClipToFrameJsunit.test'
import SetOpacityJsunit from './RenderNodeTest/RenderNodeTest_001/SetOpacityJsunit.test'
import SetPositionJsunit from './RenderNodeTest/RenderNodeTest_001/SetPositionJsunit.test'
import getChildTest from './RenderNodeTest/RenderNodeTest_001/getChildTest.test';
import getColorTest from './RenderNodeTest/RenderNodeTest_001/getColorTest.test';
import frame from './RenderNodeTest/RenderNodeTest_001/frame.test';
import getPosition from './RenderNodeTest/RenderNodeTest_001/getPosition.test';
import pivot from './RenderNodeTest/RenderNodeTest_001/pivot.test';
import scale from './RenderNodeTest/RenderNodeTest_001/scale.test';

import RenderNodeInvalidateJsSuit from './RenderNodeTest/RenderNodeInvalidateJsSuit.test';
import RenderNodeDrawJsSuit from './RenderNodeTest/RenderNodeDrawJsSuit.test';
import RenderNodeShadowElevationJsSuit from './RenderNodeTest/RenderNodeShadowElevation.test';
import RenderNodeShadowRadiusJsSuit from './RenderNodeTest/RenderNodeShadowRadius.test';
import shadowAlphaJsunit from './RenderNodeTest/shadowAlphaJsunit.test';
import shadowColorJsunit from './RenderNodeTest/shadowColorJsunit.test';
import shadowOffsetJsunit from './RenderNodeTest/shadowOffsetJsunit.test';

import appendChildTest from './RenderNodeTest/renderNode/appendChild.test';
import drawContextGetSizeTest from './RenderNodeTest/renderNode/drawContextGetSize.test';
import keyframeTest from './RenderNodeTest/renderNode/keyframe.test';
import pixelRoundTest from './RenderNodeTest/renderNode/pixelRoundTest.test'

import richEditorApi1 from './RichEditorTest/richEditorApi/richEditorApi1.test'
import richEditorApi2 from './RichEditorTest/richEditorApi/richEditorApi2.test'
import richEditorApi3 from './RichEditorTest/richEditorApi/richEditorApi3.test'
import RichEditorTest from './RichEditorTest/RichEditor/RichEditor.test';
import spanApi1 from './spanTest/spanApi/spanApi1.test';
import symbolGlyphApi1 from './SymbolGlyphTest/symbolGlyphApi/symbolGlyphApi1.test'
import symbolGlyphApi2 from './SymbolGlyphTest/symbolGlyphApi/symbolGlyphApi2.test'
import symbolGlyphApi3 from './SymbolGlyphTest/symbolGlyphApi/symbolGlyphApi3.test'
import symbolGlyphApi4 from './SymbolGlyphTest/symbolGlyphApi/symbolGlyphApi4.test'
import symbolGlyphApi5 from './SymbolGlyphTest/symbolGlyphApi/symbolGlyphApi5.test'
import symbolSpanApi2Test from './symbolSpanTest/symbolSpanApi/symbolSpanApi2.test'
import symbolSpanApi1 from './symbolSpanTest/symbolSpanApi/symbolSpanApi1.test'
import TextStyle from './textTest/TextApi/TextStyle.test';
import tabsDemo from './textTest/TextApi/tabsDemo.test';
import TextSelectionMenu from './textTest/TextApi/TextSelectionMenu.test';
import textInputApi1 from './TextInputTest/textInputApi/textInputApi1.test'
import textInputApiTest from './TextInputTest/textInputApi/textinputkeyNewLine.test'
import UIfont from './fontTest/UIfont/UIfont.test';
import ImageAttr from './imageTest/ImageAttr.test';
import TextfieldMultiTest from './textTest/TextfieldMulti.test';
import TextfieldOtherTest from './textTest/TextfieldOther.test';
import TextfieldSingleTest from './textTest/TextfieldSingle.test';
import richEditorApi4 from './RichEditorTest/richEditorApi/richEditorApi4.test';
import richEditorApi5 from './RichEditorTest/richEditorApi/richEditorApi5.test';
import richEditorApi6 from './RichEditorTest/richEditorApi/richEditorApi6.test';
import richEditorApi7 from './RichEditorTest/richEditorApi/richEditorApi7.test';
import richEditorApi8 from './RichEditorTest/richEditorApi/richEditorApi8.test';
import search from './SearchTest/SearchTest.test';

import CurveTest from './textTest/CurveJsunit.test';
import backgroundAndSizeSettingJsunit from './textTest/BackgroundAndSizeSettingJsunit.test';
import borderJsunit from './textTest/BorderJsunit.test';
import fillModeJsunit from './ImageAnimator/FillModeJsunit.test';
import ohosMatrix4Jsunit from './imageTest/OhosMatrix4Jsunit.test';
import positionSettingJsunit from './textTest/PositionSettingJsunit.test';
import ShapeClippingJsunit from './imageTest/ShapeClippingJsunit.test';
import textAreaJsunit from './TextAreaTest/TextAreaJsunit.test';
import textAreaUxTest  from './TextAreaTest/textareaux.test';
import textInputJsunit from './TextInputTest/TextInputJsunit.test';
import propJsunit from './textTest/PropJsunit.test';
import imageJsunit from './imageTest/ImageJsunit.test';
import spanJsunit from './spanTest/SpanJsunit.test';
import textJsunit from './textTest/TextJsunit.test';
import outline from './textTest/outline.test';
import rotationTest from './RenderNodeTest/rotation.test.ets'
import transformTest from './RenderNodeTest/transform.test.ets'
import translationTest from './RenderNodeTest/translation.test.ets'

import stageFontTest from './textTest/stageFont.test';
import stageMediaquery from './textTest/stageMediaquery.test';

import buttonTest from './buttonTest/button'
import textInputTest from './TextInputTest/textinput'
import textinputSec from './TextInputTest/textinputSec'
import segmentbuttonTest from './SegmentButtonTest/segmentbutton'
export default function testsuite() {
  stageFontTest();
  stageMediaquery();
  
  TextStateJsunit();
  richEditorApi4();
  richEditorApi5();
  richEditorApi6();
  richEditorApi7();
  richEditorApi8();
   search();
  textStyleJsunit();
  marqueeJsunit();
  ImageTextTest();
  TextAreaCallbackTest();
  TextAreaSelectTest();
  RenderNodeShadowElevationJsSuit();
  RenderNodeInvalidateJsSuit()
  shadowAlphaJsunit()
  RenderNodeShadowRadiusJsSuit()
  shadowColorJsunit()
  shadowOffsetJsunit()
  RenderNodeDrawJsSuit()
  arkuiNodeTest();
  arkuiNodeEventTest();
  arkuiNodeRenderTest();
  Image_QRCode_Api();
  RichEditorApi();
  RichEditorApi2();
  APIgetUIFontConfigJsunit();
  APITextBackgroundStyleJsunit();
  SXrenderingStrategyJsunit();
  SXsymbolSpanStyleJsunit();
  SXsymbolStyleJsunit();
  SXvalueResourceJsunit();
  SXSymbolGlyphSINGLE01Jsunit();
  buttonControlTest();
  textDataDataDetectorConfig()
  RelativeGuideLine()
  RelativeGuideLine2()
  RelativeGuideLine3()
  RelativeGuideLine4()
  RelativeGuideLine5()
  RelativeGuideLine6()
  RelativeGuideLine7()
  RelativeChain()
  RelativeChain2()
  RelativeChain3()
  RelativeChain4()
  RelativeChain5()
  RelativeChain6()
  RelativeChain7()
  RelativeChain8()
  RelativeChain9()
  RelativeChain10()
  RelativeChain11()
  RelativeChain12()
  RelativeBarrier()
  RelativeBarrier2()
  RelativeBarrier3()
  RelativeBarrier4()
  RelativeBarrier5()
  RelativeBarrier6()
  RelativeBarrier7()
  RelativeBarrier8()
  RelativePadding()
  RelativeBorder()
  Navigation1()
  Navigation2()
  Navigation3()
  Navigation4()
  RelativeContainer()
  relativeCTest()
  getClipToFrameJsunit()
  getOpacityJsunit()
  getSizeJsunit()
  SetClipToFrameJsunit()
  SetOpacityJsunit()
  SetPositionJsunit()
  getColorTest()
  getChildTest()
  frame()
  getPosition()
  pivot()
  scale()
  richEditorApi1()
  richEditorApi2()
  richEditorApi3()
  RichEditorTest()
  spanApi1()
  symbolGlyphApi1()
  symbolGlyphApi2()
  symbolGlyphApi3()
  symbolGlyphApi4()
  symbolGlyphApi5()
  symbolSpanApi2Test()
  symbolSpanApi1()
  TextStyle()
  tabsDemo()
  TextSelectionMenu()
  textInputApi1()
  textInputApiTest()
  UIfont()
  ImageAttr()
  SetSizeJsunit()
  appendChildTest()
  drawContextGetSizeTest()
  keyframeTest()
  pixelRoundTest()
  TextfieldOtherTest()
  TextfieldSingleTest()
  TextfieldMultiTest()
  
  CurveTest()
  backgroundAndSizeSettingJsunit()
  borderJsunit();
  fillModeJsunit();
  ohosMatrix4Jsunit();
  positionSettingJsunit();
  ShapeClippingJsunit();
  textAreaJsunit();
  textInputJsunit();
  propJsunit();
  imageJsunit()
  spanJsunit()
  textJsunit()
  outline()
  rotationTest()
  transformTest()
  translationTest()

  buttonTest();
  textInputTest()
  textinputSec()
  segmentbuttonTest()
  textAreaUxTest();
}