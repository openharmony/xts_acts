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
import textAreaInputTest from './TextAreaTest/textAreaInputTest.test';
import ActsgetcomponentaddTest from './buttonTest/getcomponentadd.test';
import textinputSec from './TextInputTest/textinputSec'
import SelectJsunit from './selectTest/SelectJsunit.test.ets';
import segmentbuttonTest from './SegmentButtonTest/segmentbutton'
import TextStateJsunit from './textTest/TextStateJsunit.test';
import text_drag from './textTest/text_drag.test';
import search_center from './SearchTest/search_center.test.ets'
import textArea_center from './TextAreaTest/textArea_center.test.ets'
import positionSettingJsunit from './textTest/PositionSettingJsunit.test';

export default function testsuite() {
  textAreaInputTest()
  ActsgetcomponentaddTest()
  textinputSec()
  SelectJsunit()
  segmentbuttonTest();
  TextStateJsunit();
  text_drag();
  search_center();
  textArea_center();
  positionSettingJsunit();
}