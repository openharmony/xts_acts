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
import I18n from '@ohos.i18n'
import Intl from '@ohos.intl'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('LangTest', function () {
    console.log('*************start LangTest*************');

    let initPreferredLang = I18n.getPreferredLanguageList();
    let initLen = initPreferredLang.length;
    let hour = I18n.is24HourClock();

    /* *
    * get the current preferred language list
    */
    function getCurrentPreferredLang(){
        let value = I18n.getPreferredLanguageList();
        return value;
    }

    /* *
    * judge if the lang is in the preferred language list or not
    */
    function isContainLang(langList, lang){
        let len = langList.length;
        for (let i = 0; i < len; i++){
            if(langList[i] == lang){
                return true
            }
        }
        return false
    }

    /* *
    * execute this step before all testcases
    */
    beforeAll(function(){
        console.log('step before all cases in lang.'
        + ' 24hour: ' + I18n.is24HourClock()
        + ' prelang: ' + I18n.getPreferredLanguageList()
        + ' syslocale: ' + I18n.getSystemLocale());
    })

    /* *
    * execute this step before every testcase
    */
    beforeEach(function(){
        console.log('i18n_test_preferredlanguage_beforeEach ' + getCurrentPreferredLang());
    })

    /* *
    * execute this step after every testcase
    */
    afterEach(function(){
        let currLang = getCurrentPreferredLang();
        console.log('i18n_test_preferredlanguage_afterEach ' + currLang);
    })

    /* *
    * execute this step after all testcases
    */
    afterAll(function(){
        console.log('step after all cases.'
        + ' 24hour: ' + I18n.is24HourClock()
        + ' prelang: ' + I18n.getPreferredLanguageList()
        + ' syslocale: ' + I18n.getSystemLocale());
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_CLOCK_0100
    * @tc.name test the is24HourClock interface
    * @tc.desc check the value of is24HourClock method
    */
    it('i18n_test_clock_0100', 0, function () {
        console.log('i18n_test_clock_0100 ' + 'start');
        let value = I18n.is24HourClock();
        console.log('i18n_test_clock_0100 ' + value);
        if(hour)
        {
            expect(value).assertTrue();
        }
        else
        {
            expect(value).assertFalse();
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_PREFERREDLANGUAGE_0100
    * @tc.name test the getPreferredLanguageList interface with default value
    * @tc.desc check the value of getPreferredLanguageList method
    */
    it('i18n_test_preferredlanguage_0100', 0, function () {
        console.log('i18n_test_preferredlanguage_0100 ' + 'start');
        let value = I18n.getPreferredLanguageList();
        console.log('i18n_test_preferredlanguage_0100 ' + value);
        expect(value.length).assertLarger(0);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_PREFERREDLANGUAGE_1000
    * @tc.name test the getFirstPreferredLanguage interface
    * @tc.desc check the value of getFirstPreferredLanguage method
    */
    it('i18n_test_preferredlanguage_1000', 0, function () {
        console.log('i18n_test_preferredlanguage_1000 ' + 'start');
        let value = I18n.getFirstPreferredLanguage();
        console.log('i18n_test_preferredlanguage_1000 ' + value);
        let list = I18n.getPreferredLanguageList();
        console.log('i18n_test_preferredlanguage_1000 ' + list);
        expect(list.length).assertLarger(0);
        if(list[0] == 'zh-Hans'){
            expect(value).assertEqual('zh-Hans');
        }
        else if(list[0] == 'en'){
            expect(value).assertEqual('en');
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_INTL_JS_TRANSFER_0100
    * @tc.name transfer from lower to upper
    * @tc.desc check the transfer result
    */
    it('transfer_test_0100', 0, function () {
        let date = 'hello';
        let value = date.toLocaleUpperCase('zh-CN');
        console.log('transfer_test_0100 ' + value);
        expect(value).assertEqual('HELLO');
    })

    /* *
    * @tc.number SUB_GLOBAL_INTL_JS_TRANSFER_0200
    * @tc.name transfer from upper to lower
    * @tc.desc check the transfer result
    */
    it('transfer_test_0200', 0, function () {
        let date = 'WORLD';
        let value = date.toLocaleLowerCase('zh-CN');
        console.log('transfer_test_0200 ' + value);
        expect(value).assertEqual('world');
    })

    /* *
    * @tc.number SUB_GLOBAL_INTL_JS_TRANSFER_0300
    * @tc.name transfer to upper
    * @tc.desc check the transfer result
    */
    it('transfer_test_0300', 0, function () {
        let date = 'My name is Jack.';
        let value = date.toLocaleUpperCase('en-US');
        console.log('transfer_test_0300 ' + value);
        expect(value).assertEqual('MY NAME IS JACK.');
    })

    /* *
    * @tc.number SUB_GLOBAL_INTL_JS_TRANSFER_0400
    * @tc.name transfer to lower
    * @tc.desc check the transfer result
    */
    it('transfer_test_0400', 0, function () {
        let date = 'The sky is in BLUE-STYLE!';
        let value = date.toLocaleLowerCase('en-US');
        console.log('transfer_test_0400 ' + value);
        expect(value).assertEqual('the sky is in blue-style!');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_0100
    * @tc.name test getTimeZone method
    * @tc.desc get the getTimeZone value
    */
    it('timezone_test_0100', 0, function () {
        console.log('timezone_test_0100 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getID();
        console.log('timezone_test_0100 ' + value);
        expect(value == 'UTC' || value == 'Asia/Shanghai' || value == 'Asia/Seoul').assertTrue();
        expect(value.length > 0).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_0200
    * @tc.name test getDisplayName method
    * @tc.desc get the getDisplayName value
    */
    it('timezone_test_0200', 0, function () {
        console.log('timezone_test_0200 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getDisplayName();
        console.log('timezone_test_0200 ' + value);
        expect(value == 'GMT' || value == '中国标准时间' || value == '韩国标准时间').assertTrue();
        expect(value.length > 0).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_0300
    * @tc.name test getDisplayName method with zh-CN param
    * @tc.desc get the getDisplayName value
    */
    it('timezone_test_0300', 0, function () {
        console.log('timezone_test_0300 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getDisplayName('zh-CN');
        console.log('timezone_test_0300 ' + value);
        expect(value == 'GMT' || value == '中国标准时间' || value == '韩国标准时间').assertTrue();
        expect(value.length > 0).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_0400
    * @tc.name test getDisplayName method with true param
    * @tc.desc get the getDisplayName value
    */
    it('timezone_test_0400', 0, function () {
        console.log('timezone_test_0400 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getDisplayName(true);
        console.log('timezone_test_0400 ' + value);
        expect(value == 'GMT' || value == '中国标准时间' || value == '韩国标准时间').assertTrue();
        expect(value.length > 0).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_0500
    * @tc.name test getDisplayName method with false param
    * @tc.desc get the getDisplayName value
    */
    it('timezone_test_0500', 0, function () {
        console.log('timezone_test_0500 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getDisplayName(false);
        console.log('timezone_test_0500 ' + value);
        expect(value == 'GMT' || value == '中国标准时间' || value == '韩国标准时间').assertTrue();
        expect(value.length > 0).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_0600
    * @tc.name test getRawOffset method
    * @tc.desc get the getRawOffset value
    */
    it('timezone_test_0600', 0, function () {
        console.log('timezone_test_0600 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getRawOffset();
        console.log('timezone_test_0600 ' + value);
        expect(value >= 0).assertEqual(true);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_0700
    * @tc.name test getOffset method
    * @tc.desc get the getOffset value
    */
    it('timezone_test_0700', 0, function () {
        console.log('timezone_test_0700 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getOffset();
        console.log('timezone_test_0700 ' + value);
        expect(value >= 0).assertEqual(true);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_0800
    * @tc.name test getOffset method with date param
    * @tc.desc get the getOffset value
    */
    it('timezone_test_0800', 0, function () {
        console.log('timezone_test_0800 ' + 'start');
        let timezone = I18n.getTimeZone();
        let value = timezone.getOffset(10540800000);
        console.log('timezone_test_0800 ' + value);
        expect(value >= 0).assertEqual(true);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_0900
    * @tc.name test getID
    * @tc.desc get the getID value
    */
    it('timezone_test_0900', 0, function () {
        console.log('timezone_test_0900 ' + 'start');
        let timezone = I18n.getTimeZone('ACT');
        let value = timezone.getID();
        console.log('timezone_test_0900 ' + value);
        expect(value).assertEqual('ACT');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1000
    * @tc.name test getDisplayName with timezone id
    * @tc.desc get the getID value
    */
    it('timezone_test_1000', 0, function () {
        console.log('timezone_test_1000 ' + 'start');
        let timezone = I18n.getTimeZone('ACT');
        let value = timezone.getDisplayName();
        console.log('timezone_test_1000 ' + value);
        expect(value).assertEqual('澳大利亚中部标准时间');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1100
    * @tc.name test getDisplayName with locale
    * @tc.desc get the getID value
    */
    it('timezone_test_1100', 0, function () {
        console.log('timezone_test_1100 ' + 'start');
        let timezone = I18n.getTimeZone('Asia/Shanghai');
        let value = timezone.getDisplayName('zh-CN');
        console.log('timezone_test_1100 ' + value);
        expect(value).assertEqual('中国标准时间');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1200
    * @tc.name test getDisplayName with locale
    * @tc.desc get the getID value
    */
    it('timezone_test_1200', 0, function () {
        console.log('timezone_test_1200 ' + 'start');
        let timezone = I18n.getTimeZone('Asia/Shanghai');
        let value = timezone.getDisplayName('zh-CN', true);
        console.log('timezone_test_1200 ' + value);
        expect(value).assertEqual('中国标准时间');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1300
    * @tc.name test getDisplayName with en-US and true param
    * @tc.desc get the getID value
    */
    it('timezone_test_1300', 0, function () {
        console.log('timezone_test_1300 ' + 'start');
        let timezone = I18n.getTimeZone('Asia/Shanghai');
        let value = timezone.getDisplayName('en-US', true);
        console.log('timezone_test_1300 ' + value);
        expect(value).assertEqual('China Standard Time');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1400
    * @tc.name test getDisplayName with zh-CN and false param
    * @tc.desc get the getID value
    */
    it('timezone_test_1400', 0, function () {
        console.log('timezone_test_1400 ' + 'start');
        let timezone = I18n.getTimeZone('Asia/Shanghai');
        let value = timezone.getDisplayName('zh-CN', false);
        console.log('timezone_test_1400 ' + value);
        expect(value).assertEqual('中国标准时间');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1500
    * @tc.name test getRawOffset method with timezone id
    * @tc.desc get the getRawOffset value
    */
    it('timezone_test_1500', 0, function () {
        console.log('timezone_test_1500 ' + 'start');
        let timezone = I18n.getTimeZone('ACT');
        let value = timezone.getRawOffset();
        console.log('timezone_test_1500 ' + value);
        expect(value > 0).assertEqual(true);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1600
    * @tc.name test getOffset method with timezone id
    * @tc.desc get the getOffset value
    */
    it('timezone_test_1600', 0, function () {
        console.log('timezone_test_1600 ' + 'start');
        let timezone = I18n.getTimeZone('ACT');
        let value = timezone.getOffset();
        console.log('timezone_test_1600 ' + value);
        expect(value > 0).assertEqual(true);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_TIMEZONE_1700
    * @tc.name test getOffset method with date and timezone id param
    * @tc.desc get the getOffset value
    */
    it('timezone_test_1700', 0, function () {
        console.log('timezone_test_1700 ' + 'start');
        let timezone = I18n.getTimeZone('ACT');
        let value = timezone.getOffset(10540800000);
        console.log('timezone_test_1700 ' + value);
        expect(value > 0).assertEqual(true);
    })

    console.log('*************end LangTest*************');
})