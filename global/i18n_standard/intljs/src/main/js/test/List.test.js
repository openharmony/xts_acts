/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import BreakIteratorInI18nTest from './BreakIteratorInI18n.test.js'
import CalendarInI18nTest from './CalendarInI18n.test.js'
import I18nTest from './I18n.test.js'
import I18nUtilInI18nTest from './I18nUtilInI18n.test.js'
import IndexUtilInI18nTest from './IndexUtilInI18n.test.js'
import intlTest from './Intl.test.js'
import PhoneNumberFormatInI18nTest from './PhoneNumberFormatInI18n.test.js'
import LangTest from './Lang.test.js'
import SystemInI18nTest from './SystemInI18n.test.js'
import UtilInI18nTest from './UtilInI18n.test.js'
export default function testsuite() {
BreakIteratorInI18nTest()
CalendarInI18nTest()
I18nTest()
I18nUtilInI18nTest()
IndexUtilInI18nTest()
intlTest()
PhoneNumberFormatInI18nTest()
LangTest()
SystemInI18nTest()
UtilInI18nTest()
}
