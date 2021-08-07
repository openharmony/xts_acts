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
import Intl from "@ohos.intl"
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('intlTest', function () {
    console.log("*************00000000000000000000000*************");

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_0000
    * @tc.name format the language in locale
    * @tc.desc check the language
    */
    it('locale_test_000', 0, function () {
        var locale = new Intl.Locale("en-Latn-GB");
        console.log("jessie " + locale.language);
        expect(locale.language).assertEqual("en");
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_0100
    * @tc.name format the language in locale
    * @tc.desc check the language
    */
    it('locale_test_001', 0, function () {
        var locale = new Intl.Locale("ja-Jpan-JP-u-ca-japanese-hc-h12-co-emoji");
        console.log("jessie " + locale.language);
        expect(locale.language).assertEqual("ja");
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_0200
    * @tc.name format the script in locale
    * @tc.desc check the script
    */
    it('locale_test_002', 0, function () {
        var locale = new Intl.Locale("en-Latn-GB");
        console.log("jessie " + locale.script);
        expect(locale.script).assertEqual("Latn");
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_0300
    * @tc.name format the region in locale
    * @tc.desc check the region
    */
    it('locale_test_003', 0, function () {
        var locale = new Intl.Locale("en-Latn-GB");
        console.log("jessie " + locale.region);
        expect(locale.region).assertEqual("GB");
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_0400
    * @tc.name format the basename in locale
    * @tc.desc check the basename
    */
    it('locale_test_004', 0, function () {
        var locale = new Intl.Locale("en-Latn-GB");
        console.log("jessie " + locale.baseName);
        expect(locale.baseName).assertEqual("en-Latn-GB");
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_0500
    * @tc.name format the basename in ja-Jpan-JP-u-ca-japanese-hc-h12
    * @tc.desc check the ja-Jpan-JP-u-ca-japanese-hc-h12 basename
    */
    it('locale_test_005', 0, function () {
        var locale = new Intl.Locale("ja-Jpan-JP-u-ca-japanese-hc-h12");
        console.log("jessie " + locale.baseName);
        expect(locale.baseName).assertEqual("ja-Jpan-JP");
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_0600
    * @tc.name format the hourCycle
    * @tc.desc check the hourCycle
    */
    it('locale_test_006', 0, function () {
        var locale = new Intl.Locale('zh-CN', {hourCycle: 'h24', calendar: 'gregory'});
        expect(locale.hourCycle).assertEqual("h24");
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_0700
    * @tc.name format the calendar
    * @tc.desc check the calendar
    */
    it('locale_test_007', 0, function () {
        var locale = new Intl.Locale('zh-CN', {hourCycle: '24', calendar: 'gregory'});
        expect(locale.calendar).assertEqual("gregory");
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_0800
    * @tc.name format the japanese calendar
    * @tc.desc check the japanese calendar
    */
    it('locale_test_008', 0, function () {
        var locale = new Intl.Locale('ja-Jpan-JP-u-ca-japanese-hc-h12');
        expect(locale.calendar).assertEqual("japanese");
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_0900
    * @tc.name format the h12 hourCycle
    * @tc.desc check the h12 hourCycle
    */
    it('locale_test_009', 0, function () {
        var locale = new Intl.Locale('ja-Jpan-JP-u-ca-japanese-hc-h12');
        expect(locale.hourCycle).assertEqual("h12");
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1000
    * @tc.name format the caseFirst
    * @tc.desc check the caseFirst
    */
    it('locale_test_010', 0, function () {
        var locale = new Intl.Locale('ja-Jpan-JP', {caseFirst: true});
        expect(locale.caseFirst == true).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1100
    * @tc.name format the collation
    * @tc.desc check the collation
    */
    it('locale_test_011', 0, function () {
        var locale = new Intl.Locale('ja-Jpan-JP', {collation: 'big5han'});
        expect(locale.collation).assertEqual("big5han");
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1101
    * @tc.name test the toString interface
    * @tc.desc check the toString method
    */
    it('locale_test_012', 0, function () {
        var locale = new Intl.Locale('zh-CN', {calendar: 'gregory', collation: 'compact'});
        expect(locale.toString()).assertEqual("zh-CN-u-ca-gregory-co-compact");
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1102
    * @tc.name test the maximize interface
    * @tc.desc check the maximize method
    */
    it('locale_test_013', 0, function () {
        var locale = new Intl.Locale('zh', {calendar: 'gregory', collation: 'compact'});
        console.log("jessie 013 " + locale.maximize().toString());
        expect(locale.maximize().toString()).assertEqual("zh-hans-CN-u-ca-gregory-co-compact");
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1103
    * @tc.name test the mininize interface
    * @tc.desc check the mininize method
    */
    it('locale_test_014', 0, function () {
        var locale = new Intl.Locale('zh-hans-CN', {calendar: 'gregory', collation: 'compact'});
        console.log("jessie 014 " + locale.mininize().toString());
        expect(locale.mininize().toString()).assertEqual("zh-u-ca-gregory-co-compact");
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1104
    * @tc.name format the numeric
    * @tc.desc check the numeric
    */
    it('locale_test_015', 0, function () {
        var locale = new Intl.Locale('ja-Jpan-JP', {numeric: true});
        console.log("jessie 015 " + locale.numeric);
        expect(locale.numeric == true).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1105
    * @tc.name format the numeric
    * @tc.desc check the numeric
    */
    it('locale_test_016', 0, function () {
        var locale = new Intl.Locale('ja-Jpan-JP', {numberingSystem: 'arab'});
        expect(locale.numberingSystem).assertEqual("arab");
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1200
    * @tc.name format the datetime with en-GB locale
    * @tc.desc check the datetime is not null
    */
    it('dateTimeFormat_test_001', 0, function () {
        var datefmt = new Intl.DateTimeFormat("en-GB");
        expect(datefmt != null).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1300
    * @tc.name format the date with en-GB locale
    * @tc.desc check the date
    */
    it('formatDateTimeFormat_test_001', 0, function () {
        var date = new Date(2021, 11, 17, 3, 24, 0);
        var datefmt = new Intl.DateTimeFormat("en-GB");
        expect(datefmt.format(date)).assertEqual('17/12/2021');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1400
    * @tc.name format the date with full datestyle and mediu timestyle
    * @tc.desc check the date with full datestyle and mediu timestyle
    */
    it('formatDateTimeFormat_test_002', 0, function () {
        var date = new Date(2020, 11, 20, 14, 23, 16);
        var option = { dateStyle: 'full', timeStyle: 'medium' };
        var datefmt = new Intl.DateTimeFormat('zh-CN', option);
        expect(datefmt.format(date)).assertEqual('2020年12月20日星期日 下午2:23:16');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1500
    * @tc.name format the date with daterange
    * @tc.desc check the daterange
    */
    it('formatDateTimeFormat_test_003', 0, function () {
        var date = new Date(2020, 11, 20, 14, 23, 16);
        var date2 = new Date(2020, 11, 21, 14, 23, 16);
        var datefmt = new Intl.DateTimeFormat('en-GB');
        console.log("jessie 003 " + datefmt.formatRange(date, date2));
        expect(datefmt.formatRange(date, date2)).assertEqual('20/12/2020 – 21/12/2020');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1600
    * @tc.name format the date dateStyle
    * @tc.desc check the dateStyle
    */
    it('formatDateTimeFormat_test_004', 0, function () {
        var option = { dateStyle: 'full', timeStyle: 'medium' };
        var datefmt = new Intl.DateTimeFormat('zh-CN', option);
        expect(datefmt.resolvedOptions().dateStyle).assertEqual('full');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1700
    * @tc.name format the date timeStyle
    * @tc.desc check the timeStyle
    */
    it('formatDateTimeFormat_test_005', 0, function () {
        var option = { dateStyle: 'full', timeStyle: 'long' };
        var datefmt = new Intl.DateTimeFormat('en-GB', option);
        expect(datefmt.resolvedOptions().timeStyle).assertEqual('long');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1800
    * @tc.name format the year、month、day、weekday
    * @tc.desc check the year、month、day、weekday
    */
    it('formatDateTimeFormat_test_006', 0, function () {
        var date = new Date(2020, 11, 20, 14, 23, 16);
        var option = { year: 'numeric', month: 'long', day: 'numeric', weekday: 'long' };
        var datefmt = new Intl.DateTimeFormat('ja', option);
        console.log("jessie " + datefmt.format(date));
        expect(datefmt.format(date)).assertEqual('2020年12月20日日曜日');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1900
    * @tc.name format the timerange with year、month、day、weekday
    * @tc.desc check the timerange with year、month、day、weekday
    */
    it('formatDateTimeFormat_test_007', 0, function () {
        var date = new Date(2020, 11, 20, 14, 23, 16);
        var date2 = new Date(2021, 4, 5, 10, 5, 3);
        var option = { year: 'numeric', month: 'long', day: 'numeric', weekday: 'long' };
        var datefmt = new Intl.DateTimeFormat('en', option);
        console.log("jessie 007 " + datefmt.formatRange(date, date2));
        expect(datefmt.formatRange(date, date2)).assertEqual('Sunday, December 20, 2020 – Wednesday, May 5, 2021');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2000
    * @tc.name format the hour&minute&second
    * @tc.desc check the hour&minute&second
    */
    it('formatDateTimeFormat_test_008', 0, function () {
        var date = new Date(2020, 11, 20, 14, 23, 16);
        var option = { year: 'numeric', month: 'long', day: 'numeric',
            hour: 'numeric', minute: '2-digit', second: 'numeric', weekday: 'long', era: 'short' };
        var datefmt = new Intl.DateTimeFormat('zh-CN-u-hc-h12', option);
        console.log("jessie " + datefmt.format(date));
        expect(datefmt.format(date)).assertEqual('公元2020年12月20日星期日 下午2:23:16');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2100
    * @tc.name format the timeZone
    * @tc.desc check the timeZone
    */
    it('formatDateTimeFormat_test_009', 0, function () {
        var date = new Date(2020, 3, 14, 15, 5, 3);
        var option = { timeZone: 'America/Los_Angeles', timeZoneName: 'long' };
        var datefmt = new Intl.DateTimeFormat('zh-CN-u-hc-h12', option);
        console.log("jessie " + datefmt.format(date));
        expect(datefmt.format(date).indexOf('北美太平洋夏令时间') != -1).assertEqual(true);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2200
    * @tc.name format the America/Los_Angeles timeZone
    * @tc.desc check the America/Los_Angeles timeZone
    */
    it('formatDateTimeFormat_test_010', 0, function () {
        var option = { timeZone: 'America/Los_Angeles', timeZoneName: 'long' };
        var datefmt = new Intl.DateTimeFormat('zh-CN-u-hc-h12', option);
        expect(datefmt.resolvedOptions().timeZone).assertEqual('America/Los_Angeles');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2300
    * @tc.name format the America/Los_Angeles timeZoneName
    * @tc.desc check the America/Los_Angeles timeZoneName
    */
    it('formatDateTimeFormat_test_011', 0, function () {
        var option = { timeZone: 'America/Los_Angeles', timeZoneName: 'long' };
        var datefmt = new Intl.DateTimeFormat('zh-CN-u-hc-h12', option);
        expect(datefmt.resolvedOptions().timeZoneName).assertEqual('long');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2400
    * @tc.name format the year
    * @tc.desc check the year
    */
    it('formatDateTimeFormat_test_012', 0, function () {
        var option = { year: 'numeric', month: 'long', day: 'numeric',
            hour: 'numeric', minute: '2-digit', second: 'numeric', weekday: 'long', era: 'short' };
        var datefmt = new Intl.DateTimeFormat('zh-CN-u-hc-h12', option);
        expect(datefmt.resolvedOptions().year).assertEqual('numeric');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2500
    * @tc.name format the weekday
    * @tc.desc check the weekday
    */
    it('formatDateTimeFormat_test_013', 0, function () {
        var option = { year: 'numeric', month: 'long', day: 'numeric',
            hour: 'numeric', minute: '2-digit', second: 'numeric', weekday: 'long', era: 'short' };
        var datefmt = new Intl.DateTimeFormat('zh-CN-u-hc-h12', option);
        expect(datefmt.resolvedOptions().weekday).assertEqual('long');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2600
    * @tc.name format the hour
    * @tc.desc check the hour
    */
    it('formatDateTimeFormat_test_014', 0, function () {
        var option = { year: 'numeric', month: 'long', day: 'numeric',
            hour: 'numeric', minute: '2-digit', second: 'numeric', weekday: 'long', era: 'short' };
        var datefmt = new Intl.DateTimeFormat('zh-CN-u-hc-h12', option);
        expect(datefmt.resolvedOptions().hour).assertEqual('numeric');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2700
    * @tc.name format the hour
    * @tc.desc check the hour
    */
    it('formatDateTimeFormat_test_015', 0, function () {
        var date = new Date(2020, 11, 20, 14, 23, 16);
        var option = { dateStyle: 'full' };
        var datefmt = new Intl.DateTimeFormat('fr-Latn-FR-u-nu-mong', option);
        expect(datefmt.format(date)).assertEqual('dimanche ᠒᠐ décembre ᠒᠐᠒᠐');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2701
    * @tc.name format the hour
    * @tc.desc check the hour
    */
    it('formatDateTimeFormat_test_016', 0, function () {
        var date = new Date(2020, 11, 20, 14, 23, 16);
        var option = { dateStyle: 'full' };
        var datefmt = new Intl.DateTimeFormat(['ban', 'zh'], option);
        expect(datefmt.format(date)).assertEqual('2020年12月20日星期日');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2702
    * @tc.name format the hour
    * @tc.desc check the hour
    */
    it('formatDateTimeFormat_test_017', 0, function () {
        var option = { year: 'numeric', month: 'long', day: 'numeric',
            hour: 'numeric', minute: '2-digit', second: 'numeric', weekday: 'long', era: 'short',
            hourCycle: 'h24',numberingSystem: 'arab', hour12: true, dayPeriod: 'short',
            foramtMatcher: 'basic', localeMatcher: 'lookup' };
        var datefmt = new Intl.DateTimeFormat('zh-CN-u-hc-h12', option);
        expect(datefmt.resolvedOptions().locale).assertEqual('zh-CN');
        expect(datefmt.resolvedOptions().hourCycle).assertEqual('h24');
        expect(datefmt.resolvedOptions().numberingSystem).assertEqual('arab');
        expect(datefmt.resolvedOptions().hour12 == true).assertTrue();
        expect(datefmt.resolvedOptions().era).assertEqual('short');
        expect(datefmt.resolvedOptions().month).assertEqual('long');
        expect(datefmt.resolvedOptions().day).assertEqual('numeric');
        expect(datefmt.resolvedOptions().minute).assertEqual('2-digit');
        expect(datefmt.resolvedOptions().second).assertEqual('numeric');
        expect(datefmt.resolvedOptions().dayPeriod).assertEqual('short');
        // expect(datefmt.resolvedOptions().foramtMatcher).assertEqual('basic');
        // expect(datefmt.resolvedOptions().localeMatcher).assertEqual('lookup');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2800
    * @tc.name format the number in en-GB
    * @tc.desc check the number in en-GB
    */
    it('formatNumber_test_001', 0, function () {
        var numfmt = new Intl.NumberFormat('en-GB');
        console.log("jessie " + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('123,456.789');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2900
    * @tc.name format the number with scientific
    * @tc.desc check the number with scientific
    */
    it('formatNumber_test_002', 0, function () {
        var numfmt = new Intl.NumberFormat('en-GB', { style: 'decimal', notation: 'scientific' });
        console.log("jessie " + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('1.234568E5');
        expect(numfmt.resolvedOptions().style).assertEqual('decimal');
        expect(numfmt.resolvedOptions().notation).assertEqual('scientific');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_3000
    * @tc.name format the number with currency
    * @tc.desc check the number with currency
    */
    it('formatNumber_test_003', 0, function () {
        var numfmt = new Intl.NumberFormat('en-GB', { style: 'currency', currency: 'EUR',
            currencyDisplay: 'name', currencySign: 'accounting', signDisplay: 'always' });
        console.log("jessie " + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('+123,456.79 euros');
        expect(numfmt.resolvedOptions().locale).assertEqual('en-GB');
        expect(numfmt.resolvedOptions().style).assertEqual('currency');
        expect(numfmt.resolvedOptions().currency).assertEqual('EUR');
        expect(numfmt.resolvedOptions().currencyDisplay).assertEqual('name');
        expect(numfmt.resolvedOptions().currencySign).assertEqual('accounting');
        // expect(numfmt.resolvedOptions().signDisplay).assertEqual('always');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_3001
    * @tc.name format the number with currency
    * @tc.desc check the number with currency
    */
    it('formatNumber_test_00301', 0, function () {
        var numfmt = new Intl.NumberFormat('en-GB', { style: 'currency', currency: 'EUR',
            currencyDisplay: 'name', currencySign: 'accounting', signDisplay: 'always',
            notation: 'compact', compactDisplay: 'long', localeMatcher: 'lookup' });
        console.log("jessie " + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('+123 thousand euros');
        expect(numfmt.resolvedOptions().locale).assertEqual('en-GB');
        expect(numfmt.resolvedOptions().style).assertEqual('currency');
        expect(numfmt.resolvedOptions().currency).assertEqual('EUR');
        expect(numfmt.resolvedOptions().currencyDisplay).assertEqual('name');
        expect(numfmt.resolvedOptions().currencySign).assertEqual('accounting');
        expect(numfmt.resolvedOptions().compactDisplay).assertEqual('long');
        expect(numfmt.resolvedOptions().localeMatcher).assertEqual('lookup');
        // expect(numfmt.resolvedOptions().signDisplay).assertEqual('always');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_3100
    * @tc.name format the number with unit
    * @tc.desc check the number with unit
    */
    it('formatNumber_test_004', 0, function () {
        var numfmt = new Intl.NumberFormat('zh-CN', { style: 'unit', unit: 'meter',
            unitDisplay: 'long', maximumFractionDigits: 2, minimumIntegerDigits: 7 });
        console.log("jessie " + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('0,123,456.79米');
        expect(numfmt.resolvedOptions().style).assertEqual('unit');
        expect(numfmt.resolvedOptions().unit).assertEqual('meter');
        expect(numfmt.resolvedOptions().unitDisplay).assertEqual('long');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_3200
    * @tc.name format the number with unit
    * @tc.desc check the number with unit
    */
    it('formatNumber_test_005', 0, function () {
        var numfmt = new Intl.NumberFormat('en-CN', { style: 'percent', maximumFractionDigits: 2,
            minimumIntegerDigits: 7 });
        console.log("jessie " + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('0,123,456.79%');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_3300
    * @tc.name format the number with numberingSystem
    * @tc.desc check the number with numberingSystem
    */
    it('formatNumber_test_006', 0, function () {
        var numfmt = new Intl.NumberFormat('ar-EG', { numberingSystem: 'arab' });
        console.log("jessie " + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('١٢٣٬٤٥٦٫٧٨٩');
        expect(numfmt.resolvedOptions().numberingSystem).assertEqual('arab');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_3400
    * @tc.name format the number with style
    * @tc.desc check the number with style
    */
    it('formatNumber_test_007', 0, function () {
        var numfmt = new Intl.NumberFormat('ar', { style: 'percent', minimumFractionDigits: 1, maximumFractionDigits: 2,
            minimumIntegerDigits: 7, minimumSignificantDigits: 5, maximumSignificantDigits: 10, useGrouping: true  });
        console.log("jessie " + numfmt.resolvedOptions().style);
        expect(numfmt.resolvedOptions().style).assertEqual('percent');
        expect(numfmt.resolvedOptions().minimumFractionDigits).assertEqual(1);
        expect(numfmt.resolvedOptions().maximumFractionDigits).assertEqual(2);
        expect(numfmt.resolvedOptions().minimumIntegerDigits).assertEqual(7);
        expect(numfmt.resolvedOptions().minimumSignificantDigits).assertEqual(5);
        expect(numfmt.resolvedOptions().maximumSignificantDigits).assertEqual(10);
        expect(numfmt.resolvedOptions().useGrouping == true).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_3500
    * @tc.name format the number with style
    * @tc.desc check the number with style
    */
    it('formatNumber_test_008', 0, function () {
        var numfmt = new Intl.NumberFormat(['test', 'zh-CN'], { style: 'unit', unit: 'meter',
            unitDisplay: 'long', maximumFractionDigits: 2, minimumIntegerDigits: 7 });
        console.log("jessie " + numfmt.format(123456.789));
        expect(numfmt.format(123456.789)).assertEqual('0,123,456.79米');
    })
    console.log("*************00000000000000000000000*************");
}) 