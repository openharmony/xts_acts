/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import blankJsunit from './BlankJsunit.test.ets';
import buttonJsunit from './ButtonJsunit.test.ets';
import checkBoxGroupUIJsunit from './checkBoxGroupUIJsunit.test.ets';
import CheckBoxJsunit from './CheckBoxJsunit.test.ets';
import datelPanelJsunit from './datelPanelJsunit.test.ets';
import dataPickerJsunit from './dataPickerJsunit.test.ets';
import dividerJsunit from './dividerJsunit.test.ets';
import gaugeJsunit from './gaugeJsunit.test.ets';
import loadingProgressJsunit from './loadingProgressJsunit.test.ets';
import marqueeJsunit from './marqueeJsunit.test.ets';

export default function testsuite() {
  blankJsunit();
  buttonJsunit();
  //checkBoxGroupUIJsunit();
  CheckBoxJsunit();
  dataPickerJsunit();
  datelPanelJsunit();
  dividerJsunit();
  gaugeJsunit();
  loadingProgressJsunit();
  marqueeJsunit();
  

}