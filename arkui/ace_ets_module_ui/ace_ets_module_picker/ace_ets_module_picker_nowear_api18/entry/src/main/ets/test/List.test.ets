/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import calendarPickerDialogStartEndTest from './calendarPickerDialogTest/calendarPickerDialogStartEndTest.test';
import calendarPickerStartEndTest from './calendarPickerTest/calendarPickerStartEndTest.test';
import datePickerDialogMode from './datePickerDialogTest/DatePickerDialogMode.test';
import timePickerDialogEnableHapticFeedback from './timePickerDialog/timePickerDialogEnableHapticFeedback.test'
import disableDateRangeAndMarkTodayTest from './CalendarPickerTest/disableDateRangeAndMarkToday.test'
import dialogDisableDateRangeAndMarkTodayTest from './CalendarPickerTest/dialogDisableDateRangeAndMarkToday.test'
import textPickerDialogEnableHapticFeedback from './textPickerDialog/textPickerDialogEnableHapticFeedback.test'
import EnableHapticFeedback from './datePickerDialogTest/datePickerDialogEnableHapticFeedback.test'
import SliderEnableHapticFeedbackTest from './slider/SliderEnableHapticFeedbackTest.test'
export default function testsuite() {
    calendarPickerDialogStartEndTest()
    calendarPickerStartEndTest()
    datePickerDialogMode()
    timePickerDialogEnableHapticFeedback();
    disableDateRangeAndMarkTodayTest()
    dialogDisableDateRangeAndMarkTodayTest();
    textPickerDialogEnableHapticFeedback();
    EnableHapticFeedback()
    SliderEnableHapticFeedbackTest();

}