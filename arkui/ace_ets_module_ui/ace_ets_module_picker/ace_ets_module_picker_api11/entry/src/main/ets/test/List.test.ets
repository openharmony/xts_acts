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
import SelectAttr from './SelectTest/SelectAttr.test'
import TimePickerTest from './TimePickerTest/TimePicker.test';
import selectoptionwithJsSuit from './SelectTest/selectoptionwithJsSuit.test';
import SelectTest from './SelectTest/Select.test';
import radioTest from './RadioTest/radio.test';
import CheckboxTest from './CheckboxTest/Checkbox.test';
import textpicker from './TextPicker/TextPicker';
import TextPickerSec from './TextPicker/TextPickerSec';
import textpickermultiTest from './TextPicker/TextPickerMulti';
import sliderTest from './SliderTest/SliderTest';
import SliderTestSec from './SliderTest/SliderTestSec';
import buttonJsunit from './ButtonTest/ButtonJsunit.test';
import ratingJsunit from './RatingTest/RatingJsunit.test';
import sliderJsunit from './SliderTest/SliderJsunit.test';
import TimePicker1Test from './TimePickerTest/TimePicker1.test';

import stageTimePickerDialog from './TimePickerTest/stageTimePickerDialog.test';
import stageTextPickerDialog from './TextPicker/stageTextPickerDialog.test';
import stageDatePickerDialog from './stageDatePickerDialog.test';
import toggleJsunit from './Toggle/ToggleJsunit.test';
import checkboxJsunit from './CheckboxTest/CheckboxJsunit.test';
import checkboxGroupJsunit from './checkboxGroup/CheckboxGroupJsunit.test';
import selectJsunit from './SelectTest/SelectJsunit1.test';
import sliderJsunit1 from './slider/SliderJsunit1.test';
import menuBackgroundBlurStyle from './SelectTest/menuBackgroundBlurStyle.test.ets'
import menuBackgroundColor from './SelectTest/menuBackgroundColor.test.ets'

import select from './SelectTest/Select';
import selectmenuTest from './SelectTest/SelectMenu';
import calendarpicker from './CalendarPickerTest/calendarpicker';
import datepicker from './DatePickerTest/DatePicker';
import ActsDatePickerTest from './DatePickerTest/DatePicker.test';
import checkBoxTest1 from './CheckboxTest/checkBox';
import checkBoxGroupTest from './checkboxGroup/checkBoxGroup';
export default function testsuite() {
  stageTimePickerDialog();
  stageTextPickerDialog();
  stageDatePickerDialog();
  TimePicker1Test()
  SelectAttr()
  TimePickerTest()
  selectoptionwithJsSuit()
  SelectTest()
  radioTest()
  CheckboxTest();
  textpicker()
  TextPickerSec()
  textpickermultiTest()

  toggleJsunit()
  checkboxJsunit()
  checkboxGroupJsunit()
  selectJsunit()
  sliderJsunit1()
  
  sliderTest()
  SliderTestSec()
  buttonJsunit()
  ratingJsunit()
  sliderJsunit()
  menuBackgroundBlurStyle()
  menuBackgroundColor()

  select()
  selectmenuTest()
  calendarpicker()
  ActsDatePickerTest()
  datepicker()
  checkBoxTest1()
  checkBoxGroupTest()
}