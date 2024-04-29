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
import gradientHeight from './TextPickerTest/gradientHeight.test';
import contentModifier from './CheckboxTest/contentModifier.test';
import triggerChange from './CheckboxTest/triggerChange.test';
import CheckBoxShape from './CheckboxGroupTest/CheckBoxShape.test';
import dateTimeOptions from './TimePickerTest/dateTimeOptions.test';

import ButtonApi1 from './Button/ButtonApi1.test'
import ButtonApi2 from './Button/ButtonApi2.test'
export default function testsuite() {
    gradientHeight()
    contentModifier()
    triggerChange()
    CheckBoxShape()
    
    ButtonApi1();
    ButtonApi2();
    dateTimeOptions()
}