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

import selectApi1 from './select/selectApi1.test'
import triggerSelect from './select/triggerSelect.test'
import selectJsunit from './select/SelectJsunit.test'
import timepickerJsunit from './TimePicker/TimePickerJsunit.test';
import textpickerJsunit from './TextPicker/TextPickerJsunit.test';
import calendarPickerJsunit from './CalendarPicker/CalendarPicker.test';
import datePickerJsunit from './DatePicker/DatePicker.test';

export default function testsuite() {
    selectApi1();
    triggerSelect()
    selectJsunit()
    timepickerJsunit()
    textpickerJsunit()
    calendarPickerJsunit()
    datePickerJsunit()
}
