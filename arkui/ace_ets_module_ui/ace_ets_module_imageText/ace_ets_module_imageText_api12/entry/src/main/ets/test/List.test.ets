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

import onSelectionChange1 from './RichEditorTest/onSelectionChange1.test'
import onSelectionChange2 from './RichEditorTest/onSelectionChange2.test'
import onSelectionChange3 from './RichEditorTest/onSelectionChange3.test'
import onSelectionChange4 from './RichEditorTest/onSelectionChange4.test'
import onSelectionChange5 from './RichEditorTest/onSelectionChange5.test'
import onSelectionChange6 from './RichEditorTest/onSelectionChange6.test'
import onSelectionChange7 from './RichEditorTest/onSelectionChange7.test'
import onSelectionChange8 from './RichEditorTest/onSelectionChange8.test'
import onSelectionChange9 from './RichEditorTest/onSelectionChange9.test'
import onSelectionChange10 from './RichEditorTest/onSelectionChange10.test'
import onSelectionChange11 from './RichEditorTest/onSelectionChange11.test'
import onSelectionChange12 from './RichEditorTest/onSelectionChange12.test'
import onSelectionChange13 from './RichEditorTest/onSelectionChange13.test'
import onSelectionChange14 from './RichEditorTest/onSelectionChange14.test'
import onSelectionChange15 from './RichEditorTest/onSelectionChange15.test'
import onSelectionChange16 from './RichEditorTest/onSelectionChange16.test'
import onSelectionChange17 from './RichEditorTest/onSelectionChange17.test'
import onSelectionChange18 from './RichEditorTest/onSelectionChange18.test'
import onSelectionChange19 from './RichEditorTest/onSelectionChange19.test'
import MediaCachedImageTest from './ImageTest/MediaCachedImageTest.test';
import onComplete from './ImageTest/onComplete.test'
import removeStyles from './TextTest/removeStyles.test'
import StyledStringTest from './TextTest/StyledStringTest.test'
import clearStyles from './TextTest/clearStyles.test'
import TextStyle from './TextTest/TextStyle.test';
import TextStyleWavy from './TextTest/TextStyleWavy.test';

import MarqueeApi from './Marquee/MarqueeApi.test';
import APIContentTypeTest from './TextInput/APIContentTypeTest.test';
import APIUnderlineColorTest from './TextInput/APIUnderlineColorTest.test';
import srcIndexTest from './MatrixTest/srcIndexTest.test'
import dstIndexTest from './MatrixTest/dstIndexTest.test'
import underlineColor from './TextInput/underlineColor.test'

import RichEditorApi1 from './RichEditor/RichEditorApi1.test'
import RichEditorApi3 from './RichEditor/RichEditorApi3.test'
import RichEditorApi5 from './RichEditor/RichEditorApi5.test'
import RichEditorChangeCallback from './RichEditor/RichEditorChangeCallback.test'
import RichEditorWordBreakJsunitTest from './RichEditorEnhance01/RichEditorWordBreakJsunitTest.test'
import RichEditorMenuPolicyJsunit from './RichEditorEnhance01/RichEditorMenuPolicyJsunit.test'
import RichEditorTextStyleJsunit from './RichEditorEnhance01/RichEditorTextStyleJsunit.test'
import RichEditorFontFeatureJsunit from './RichEditorEnhance01/RichEditorFontFeatureJsunit.test'
import RichEditor1 from './RichEditorEnhance/RichEditor1.test'
import RichEditor2 from './RichEditorEnhance/RichEditor2.test'
import RichEditor3 from './RichEditorEnhance/RichEditor3.test'
import RichEditor4 from './RichEditorEnhance/RichEditor4.test'
import RichEditor5 from './RichEditorEnhance/RichEditor5.test'
import RichEditor6 from './RichEditorEnhance/RichEditor6.test'
import RichEditor7 from './RichEditorEnhance/RichEditor7.test'
import TextInputTextAreaSearch from './RichEditorEnhance/TextInputTextAreaSearch.test'
import TextAreaApi1 from './TextArea/TextAreaApi1.test'
import TextAreaApi2 from './TextArea/TextAreaApi2.test'
import TextAreaApi3 from './TextArea/TextAreaApi3.test'
import textApi1 from './Text/TextApi1.test'

import TextArea_lineBreakStrategyTest from './TextAreaTest/TextAreaAPITest/TextArea_lineBreakStrategyTest.test'
import TextArea_lineSpacingTest from './TextAreaTest/TextAreaAPITest/TextArea_lineSpacingTest.test'
import TextInput_lineBreakStrategyTest from './TextInput/TextInputAPITest/TextInput_lineBreakStrategyTest.test'
import Text_lineBreakStrategyTest from './TextTest/TextAPITest/Text_lineBreakStrategyTest.test'
import Text_lineSpacingTest from './TextTest/TextAPITest/Text_lineSpacingTest.test'
import marqueeOptionsTest from './TextTest/TextAPITest/marqueeOptionsTest.test'
import textStrategyJsunit from './TextTest/textStrategyJsunit.test';

export default function testsuite() {
  APIContentTypeTest();
  APIUnderlineColorTest();
  onSelectionChange1();
  onSelectionChange2();
  onSelectionChange3();
  onSelectionChange4();
  onSelectionChange5();
  onSelectionChange6();
  onSelectionChange7();
  onSelectionChange8();
  onSelectionChange9();
  onSelectionChange10();
  onSelectionChange11();
  onSelectionChange12();
  onSelectionChange13();
  onSelectionChange14();
  onSelectionChange15();
  onSelectionChange16();
  onSelectionChange17();
  onSelectionChange18();
  onSelectionChange19();
  MediaCachedImageTest();
  onComplete()
  removeStyles()
  clearStyles()
  StyledStringTest()
  TextStyle();
  MarqueeApi();
  underlineColor();
  srcIndexTest();
  dstIndexTest();
  
  RichEditorApi1();
  RichEditorApi3();
  RichEditorApi5();
  RichEditorChangeCallback();
  RichEditorWordBreakJsunitTest();
  RichEditorMenuPolicyJsunit();
  RichEditorTextStyleJsunit();
  RichEditorFontFeatureJsunit();
  RichEditor1();
  RichEditor2();
  RichEditor3();
  RichEditor4();
  RichEditor5();
  RichEditor6();
  RichEditor7();
  TextInputTextAreaSearch();
  TextAreaApi1();
  TextAreaApi2();
  TextAreaApi3();
  textApi1();

  TextArea_lineBreakStrategyTest();
  TextArea_lineSpacingTest();
  TextInput_lineBreakStrategyTest();
  Text_lineBreakStrategyTest();
  Text_lineSpacingTest();
  marqueeOptionsTest();
  textStrategyJsunit();
}