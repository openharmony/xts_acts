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
import intl from '@ohos.intl'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('I18nTest', function () {
    console.log('*************start I18NTest*************');

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_0100
    * @tc.name getSystemLanguage
    * @tc.desc check the getSystemLanguage
    */
    it('i18n_test_0100', 0, function () {
        let lang = I18n.getSystemLanguage();
        console.log('i18n_test_0100 ' + lang);
        expect(lang).assertInstanceOf('String');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_0200
    * @tc.name getSystemRegion
    * @tc.desc check the getSystemRegion
    */
    it('i18n_test_0200', 0, function () {
        let region = I18n.getSystemRegion();
        console.log('i18n_test_0200 ' + region);
        expect(region).assertInstanceOf('String');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_0300
    * @tc.name getSystemLocale
    * @tc.desc check the getSystemLocale
    */
    it('i18n_test_0300', 0, function () {
        let locale = I18n.getSystemLocale();
        console.log('i18n_test_0300 ' + locale);
        expect(locale).assertInstanceOf('String');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_0400
    * @tc.name setSystemLanguage with en param
    * @tc.desc check the language
    */
    it('i18n_test_0400', 0, function () {
        let value = I18n.setSystemLanguage('en');
        console.log('i18n_test_0400 ' + value);
        expect(value).assertTrue();
        let lang = I18n.getSystemLanguage();
        console.log('i18n_test_0400 ' + lang);
        expect(lang).assertEqual('en');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_0500
    * @tc.name setSystemLanguage with ko-KR param
    * @tc.desc check the language
    */
    it('i18n_test_0500', 0, function () {
        let value = I18n.setSystemLanguage('ko-KR');
        console.log('i18n_test_0500 ' + value);
        expect(value).assertTrue();
        let lang = I18n.getSystemLanguage();
        console.log('i18n_test_0500 ' + lang);
        expect(lang).assertEqual('ko-KR');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_0600
    * @tc.name setSystemLanguage with it-Ital-IT param
    * @tc.desc check the language
    */
    it('i18n_test_0600', 0, function () {
        let value = I18n.setSystemLanguage('it-Ital-IT');
        console.log('i18n_test_0600 ' + value);
        expect(value).assertTrue();
        let lang = I18n.getSystemLanguage();
        console.log('i18n_test_0600 ' + lang);
        expect(lang).assertEqual('it-Ital-IT');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_0700
    * @tc.name setSystemLanguage with null param
    * @tc.desc check the language
    */
    it('i18n_test_0700', 0, function () {
        let value = I18n.setSystemLanguage('');
        console.log('i18n_test_0700 ' + value);
        expect(value).assertFalse();
        let lang = I18n.getSystemLanguage();
        console.log('i18n_test_0700 ' + lang);
        expect(lang).assertEqual('it-Ital-IT');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_0800
    * @tc.name setSystemLanguage with not exist param aa
    * @tc.desc check the language
    */
    it('i18n_test_0800', 0, function () {
        let value = I18n.setSystemLanguage('aa');
        console.log('i18n_test_0800 ' + value);
        expect(value).assertTrue();
        let lang = I18n.getSystemLanguage();
        console.log('i18n_test_0800 ' + lang);
        expect(lang).assertEqual('aa');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_0900
    * @tc.name setSystemLanguage with not exist param aabb
    * @tc.desc check the language
    */
    it('i18n_test_0900', 0, function () {
        let value = I18n.setSystemLanguage('aabb');
        console.log('i18n_test_0900 ' + value);
        expect(value).assertFalse();
        let lang = I18n.getSystemLanguage();
        console.log('i18n_test_0900 ' + lang);
        expect(lang).assertEqual('aa');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1000
    * @tc.name setSystemLanguage with es-aaaa param
    * @tc.desc check the language
    */
    it('i18n_test_1000', 0, function () {
        let value = I18n.setSystemLanguage('es-aaaa');
        console.log('i18n_test_1000 ' + value);
        expect(value).assertTrue();
        let lang = I18n.getSystemLanguage();
        console.log('i18n_test_1000 ' + lang);
        expect(lang).assertEqual('es-aaaa');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1100
    * @tc.name setSystemLanguage with it-Ital-AA param
    * @tc.desc check the language
    */
    it('i18n_test_1100', 0, function () {
        let value = I18n.setSystemLanguage('it-Ital-AA');
        console.log('i18n_test_1100 ' + value);
        expect(value).assertTrue();
        let lang = I18n.getSystemLanguage();
        console.log('i18n_test_1100 ' + lang);
        expect(lang).assertEqual('it-Ital-AA');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1200
    * @tc.name setSystemRegion with US param
    * @tc.desc check the region
    */
    it('i18n_test_1200', 0, function () {
        let value = I18n.setSystemRegion('US');
        console.log('i18n_test_1200 ' + value);
        expect(value).assertTrue();
        let region = I18n.getSystemRegion();
        console.log('i18n_test_1200 ' + region);
        expect(region).assertEqual('US');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1300
    * @tc.name setSystemRegion with null param
    * @tc.desc check the region
    */
    it('i18n_test_1300', 0, function () {
        let value = I18n.setSystemRegion('');
        console.log('i18n_test_1300 ' + value);
        expect(value).assertFalse();
        let region = I18n.getSystemRegion();
        console.log('i18n_test_1300 ' + region);
        expect(region).assertEqual('US');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1400
    * @tc.name setSystemRegion with AA param
    * @tc.desc check the region
    */
    it('i18n_test_1400', 0, function () {
        let value = I18n.setSystemRegion('AA');
        console.log('i18n_test_1400 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1500
    * @tc.name setSystemRegion with zh-CN param
    * @tc.desc check the reigon
    */
    it('i18n_test_1500', 0, function () {
        let value = I18n.setSystemRegion('zh-CN');
        console.log('i18n_test_1500 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1600
    * @tc.name setSystemLocale with en-Latn-US param
    * @tc.desc check the locale
    */
    it('i18n_test_1600', 0, function () {
        let value = I18n.setSystemLocale('en-Latn-US');
        console.log('i18n_test_1600 ' + value);
        expect(value).assertTrue();
        let locale = I18n.getSystemLocale();
        console.log('i18n_test_1600 ' + locale);
        expect(locale).assertEqual('en-Latn-US');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1700
    * @tc.name setSystemLocale with null param
    * @tc.desc check the locale
    */
    it('i18n_test_1700', 0, function () {
        let value = I18n.setSystemLocale('');
        console.log('i18n_test_1700 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1800
    * @tc.name setSystemLocale with aa param
    * @tc.desc check the locale
    */
    it('i18n_test_1800', 0, function () {
        let value = I18n.setSystemLocale('aa');
        console.log('i18n_test_1800 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_1900
    * @tc.name setSystemLocale with zh-AAAA param
    * @tc.desc check the locale
    */
    it('i18n_test_1900', 0, function () {
        let value = I18n.setSystemLocale('zh-AAAA');
        console.log('i18n_test_1900 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2000
    * @tc.name setSystemLocale with zh-Hans-AA param
    * @tc.desc check the locale
    */
    it('i18n_test_2000', 0, function () {
        let value = I18n.setSystemLocale('zh-Hans-AA');
        console.log('i18n_test_2000 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2100
    * @tc.name getSystemLanguages
    * @tc.desc check the language
    */
    it('i18n_test_2100', 0, function () {
        let lang = I18n.getSystemLanguages();
        let len = lang.length;
        console.log('i18n_test_2100 ' + len);
        expect(len).assertEqual(0);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2200
    * @tc.name getSystemCountries with en param
    * @tc.desc check the country
    */
    it('i18n_test_2200', 0, function () {
        let count = I18n.getSystemCountries('en');
        let len = count.length;
        console.log('i18n_test_2200 ' + len);
        expect(len).assertLarger(0);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2220
    * @tc.name getSystemCountries with zh-CN param
    * @tc.desc check the country
    */
    it('i18n_test_2220', 0, function () {
        let count = I18n.getSystemCountries('zh-CN');
        let len = count.length;
        console.log('i18n_test_2220 ' + len);
        expect(len).assertLarger(0);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2240
    * @tc.name getSystemCountries with zh-Hans-CN param
    * @tc.desc check the country
    */
    it('i18n_test_2240', 0, function () {
        let count = I18n.getSystemCountries('zh-Hans-CN');
        let len = count.length;
        console.log('i18n_test_2240 ' + len);
        expect(len).assertLarger(0);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2260
    * @tc.name getSystemCountries with null param
    * @tc.desc check the country
    */
    it('i18n_test_2260', 0, function () {
        let count = I18n.getSystemCountries('');
        let len = count.length;
        console.log('i18n_test_2260 ' + len);
        expect(len).assertLarger(0);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2280
    * @tc.name getSystemCountries with aaa param
    * @tc.desc check the country
    */
    it('i18n_test_2280', 0, function () {
        let count = I18n.getSystemCountries('aaa');
        let len = count.length;
        console.log('i18n_test_2280 ' + len);
        expect(len).assertLarger(0);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2300
    * @tc.name isSuggested with en param
    * @tc.desc check the language
    */
    it('i18n_test_2300', 0, function () {
        let region = I18n.setSystemRegion('US');
        console.log('i18n_test_2300 ' + region);
        expect(region).assertTrue();
        let value = I18n.isSuggested('en');
        console.log('i18n_test_2300 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2400
    * @tc.name isSuggested with zh-Hans param
    * @tc.desc check the language
    */
    it('i18n_test_2400', 0, function () {
        let region = I18n.setSystemRegion('CN');
        console.log('i18n_test_2400 ' + region);
        expect(region).assertTrue();
        let value = I18n.isSuggested('zh-Hans');
        console.log('i18n_test_2400 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2500
    * @tc.name isSuggested with zh-Hans-CN param
    * @tc.desc check the language
    */
    it('i18n_test_2500', 0, function () {
        let region = I18n.setSystemRegion('CN');
        console.log('i18n_test_2500 ' + region);
        expect(region).assertTrue();
        let value = I18n.isSuggested('zh-Hans-CN');
        console.log('i18n_test_2500 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2600
    * @tc.name isSuggested with fr param
    * @tc.desc check the language
    */
    it('i18n_test_2600', 0, function () {
        let value = I18n.isSuggested('fr');
        console.log('i18n_test_2600 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2700
    * @tc.name isSuggested with fr-FR param
    * @tc.desc check the language
    */
    it('i18n_test_2700', 0, function () {
        let value = I18n.isSuggested('fr-FR');
        console.log('i18n_test_2700 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2800
    * @tc.name isSuggested with az-Latn-AZ param
    * @tc.desc check the language
    */
    it('i18n_test_2800', 0, function () {
        let value = I18n.isSuggested('az-Latn-AZ');
        console.log('i18n_test_2800 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2900
    * @tc.name isSuggested with en-ZH param
    * @tc.desc check the language
    */
    it('i18n_test_2900', 0, function () {
        let value = I18n.isSuggested('en-ZH');
        console.log('i18n_test_2900 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_3000
    * @tc.name isSuggested with aa param
    * @tc.desc check the language
    */
    it('i18n_test_3000', 0, function () {
        let value = I18n.isSuggested('aa');
        console.log('i18n_test_3000 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_3100
    * @tc.name isSuggested with en and GB param
    * @tc.desc check the language
    */
    it('i18n_test_3100', 0, function () {
        let region = I18n.setSystemRegion('GB');
        console.log('i18n_test_3100 ' + region);
        expect(region).assertTrue();
        let value = I18n.isSuggested('en', 'GB');
        console.log('i18n_test_3100 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_3150
    * @tc.name isSuggested with en-SG and GB param
    * @tc.desc check the language
    */
    it('i18n_test_3150', 0, function () {
        let region = I18n.setSystemRegion('GB');
        console.log('i18n_test_3150 ' + region);
        expect(region).assertTrue();
        let value = I18n.isSuggested('en-SG', 'GB');
        console.log('i18n_test_3150 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_3200
    * @tc.name isSuggested with en and ZH param
    * @tc.desc check the language
    */
    it('i18n_test_3200', 0, function () {
        let value = I18n.isSuggested('en', 'ZH');
        console.log('i18n_test_3200 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_3300
    * @tc.name isSuggested with en-GB and ZH param
    * @tc.desc check the language
    */
    it('i18n_test_3300', 0, function () {
        let value = I18n.isSuggested('en-GB', 'ZH');
        console.log('i18n_test_3300 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_3400
    * @tc.name isSuggested with en-ZH and GB param
    * @tc.desc check the language
    */
    it('i18n_test_3400', 0, function () {
        let value = I18n.isSuggested('en-ZH', 'GB');
        console.log('i18n_test_3400 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_3500
    * @tc.name isSuggested with en-JP and GB param
    * @tc.desc check the language
    */
    it('i18n_test_3500', 0, function () {
        let value = I18n.isSuggested('en-JP', 'GB');
        console.log('i18n_test_3500 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_3600
    * @tc.name isSuggested with zh-Hans-TW and CN param
    * @tc.desc check the language
    */
    it('i18n_test_3600', 0, function () {
        let value = I18n.isSuggested('zh-Hans-TW', 'CN');
        console.log('i18n_test_3600 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_3700
    * @tc.name isSuggested with zh-Hans-CN and HK param
    * @tc.desc check the language
    */
    it('i18n_test_3700', 0, function () {
        let value = I18n.isSuggested('zh-Hans-CN', 'HK');
        console.log('i18n_test_3700 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_3800
    * @tc.name getDisplayCountry with zh-Hans-CN and en-US and true param
    * @tc.desc check the display country
    */
    it('i18n_test_3800', 0, function () {
        let value = I18n.getDisplayCountry('zh-Hans-CN', 'en-US', true);
        console.log('i18n_test_3800 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_3900
    * @tc.name getDisplayCountry with zh and en-US and true param
    * @tc.desc check the display country
    */
    it('i18n_test_3900', 0, function () {
        let value = I18n.getDisplayCountry('zh', 'en-US', true);
        console.log('i18n_test_3900 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_4000
    * @tc.name getDisplayCountry with zh-CN and en-US and true param
    * @tc.desc check the display country
    */
    it('i18n_test_4000', 0, function () {
        let value = I18n.getDisplayCountry('zh-CN', 'en-US', true);
        console.log('i18n_test_4000 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_4100
    * @tc.name getDisplayCountry with zh-Hans and en-US and true param
    * @tc.desc check the display country
    */
    it('i18n_test_4100', 0, function () {
        let value = I18n.getDisplayCountry('zh-Hans', 'en-US', true);
        console.log('i18n_test_4100 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_4200
    * @tc.name getDisplayCountry with zh-Hans-CN and en-US and false param
    * @tc.desc check the language
    */
    it('i18n_test_4200', 0, function () {
        let value = I18n.getDisplayCountry('zh-Hans-CN', 'en-US', false);
        console.log('i18n_test_4200 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_4300
    * @tc.name getDisplayCountry with zh-Hans-CN and en-US param
    * @tc.desc check the language
    */
    it('i18n_test_4300', 0, function () {
        let value = I18n.getDisplayCountry('zh-Hans-CN', 'en-US');
        console.log('i18n_test_4300 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_4400
    * @tc.name getDisplayLanguage with zh-Hans-CN and en-US and true param
    * @tc.desc check the language
    */
    it('i18n_test_4400', 0, function () {
        let value = I18n.getDisplayLanguage('zh-Hans-CN', 'en-US', true);
        console.log('i18n_test_4400 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_4500
    * @tc.name getDisplayLanguage with zh-Hans-CN and en-GB and true param
    * @tc.desc check the language
    */
    it('i18n_test_4500', 0, function () {
        let value = I18n.getDisplayLanguage('zh-Hans-CN', 'en-GB', true);
        console.log('i18n_test_4500 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_4600
    * @tc.name getDisplayLanguage with zh and en-US and true param
    * @tc.desc check the language
    */
    it('i18n_test_4600', 0, function () {
        let value = I18n.getDisplayLanguage('zh', 'en-US', true);
        console.log('i18n_test_4600 ' + value);
        expect(value).assertEqual('Chinese');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_4700
    * @tc.name getDisplayLanguage with zh-CN and en-US and true param
    * @tc.desc check the language
    */
    it('i18n_test_4700', 0, function () {
        let value = I18n.getDisplayLanguage('zh-CN', 'en-US', true);
        console.log('i18n_test_4700 ' + value);
        expect(value).assertEqual('Chinese');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_4800
    * @tc.name getDisplayLanguage with zh-Hans and en-US and true param
    * @tc.desc check the language
    */
    it('i18n_test_4800', 0, function () {
        let value = I18n.getDisplayLanguage('zh-Hans', 'en-US', true);
        console.log('i18n_test_4800 ' + value);
        expect(value).assertEqual('Chinese');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_4900
    * @tc.name getDisplayLanguage with zh-Hans-CN and en-US and false param
    * @tc.desc check the language
    */
    it('i18n_test_4900', 0, function () {
        let value = I18n.getDisplayLanguage('zh-Hans-CN', 'en-US', false);
        console.log('i18n_test_4900 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_5000
    * @tc.name getDisplayLanguage with zh-Hans-CN and en-US param
    * @tc.desc check the language
    */
    it('i18n_test_5000', 0, function () {
        let value = I18n.getDisplayLanguage('zh-Hans-CN', 'en-US');
        console.log('i18n_test_5000 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_5100
    * @tc.name test isValidNumber interface with 13510574676 param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_5100', 0, function () {
        console.error('i18n_test_5100 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let valid = phonenumber.isValidNumber('13510574676');
        console.error('i18n_test_5100 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_5200
    * @tc.name test isValidNumber interface with 135 1057 4676 param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_5200', 0, function () {
        console.error('i18n_test_5200 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let valid = phonenumber.isValidNumber('135 1057 4676');
        console.error('i18n_test_5200 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_5300
    * @tc.name test isValidNumber interface with +86 135 1057 4676 param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_5300', 0, function () {
        console.error('i18n_test_5300 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let valid = phonenumber.isValidNumber('+86 135 1057 4676');
        console.error('i18n_test_5300 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_5400
    * @tc.name test isValidNumber interface with 135-1057-4676 param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_5400', 0, function () {
        console.error('i18n_test_5400 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let valid = phonenumber.isValidNumber('135-1057-4676');
        console.error('i18n_test_5400 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_5500
    * @tc.name test isValidNumber interface with tel:+86-135-1057-4676 param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_5500', 0, function () {
        console.error('i18n_test_5500 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let valid = phonenumber.isValidNumber('tel:+86-135-1057-4676');
        console.error('i18n_test_5500 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_5600
    * @tc.name test isValidNumber interface with 86-135-1057-4676 param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_5600', 0, function () {
        console.error('i18n_test_5600 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let valid = phonenumber.isValidNumber('86-135-1057-4676');
        console.error('i18n_test_5600 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_5700
    * @tc.name test isValidNumber interface with +8613510574676 param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_5700', 0, function () {
        console.error('i18n_test_5700 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let valid = phonenumber.isValidNumber('+8613510574676');
        console.error('i18n_test_5700 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_5800
    * @tc.name test isValidNumber interface with 8613510574676 param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_5800', 0, function () {
        console.error('i18n_test_5800 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let valid = phonenumber.isValidNumber('8613510574676');
        console.error('i18n_test_5800 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_5900
    * @tc.name test isValidNumber interface with 1351057467 param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_5900', 0, function () {
        console.error('i18n_test_5900 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let valid = phonenumber.isValidNumber('1351057467');
        console.error('i18n_test_5900 ' + valid);
        expect(valid).assertEqual(false);
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_6000
    * @tc.name test isValidNumber interface with 135105746761 param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_6000', 0, function () {
        console.error('i18n_test_6000 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let valid = phonenumber.isValidNumber('135105746761');
        console.error('i18n_test_6000 ' + valid);
        expect(valid).assertEqual(false);
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_6100
    * @tc.name test isValidNumber interface with 1351057467a param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_6100', 0, function () {
        console.error('i18n_test_6100 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let valid = phonenumber.isValidNumber('1351057467a');
        console.error('i18n_test_6100 ' + valid);
        expect(valid).assertEqual(false);
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_6200
    * @tc.name test isValidNumber interface with 6262023379 param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_6200', 0, function () {
        console.error('i18n_test_6200 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US');
        let valid = phonenumber.isValidNumber('6262023379');
        console.error('i18n_test_6200 ' + valid);
        expect(valid).assertEqual(true);
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_6300
    * @tc.name test isValidNumber interface with 626202337 param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_6300', 0, function () {
        console.error('i18n_test_6300 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US');
        let valid = phonenumber.isValidNumber('626202337');
        console.error('i18n_test_6300 ' + valid);
        expect(valid).assertEqual(false);
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_6400
    * @tc.name test isValidNumber interface with 62620233791 param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_6400', 0, function () {
        console.error('i18n_test_6400 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US');
        let valid = phonenumber.isValidNumber('62620233791');
        console.error('i18n_test_6400 ' + valid);
        expect(valid).assertEqual(false);
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_6500
    * @tc.name test isValidNumber interface with 626202337a param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_6500', 0, function () {
        console.error('i18n_test_6500 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US');
        let valid = phonenumber.isValidNumber('626202337a');
        console.error('i18n_test_6500 ' + valid);
        expect(valid).assertEqual(false);
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_6600
    * @tc.name test format interface with 13510574676 param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_6600', 0, function () {
        console.error('i18n_test_6600 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN');
        let value = phonenumber.format('13510574676');
        console.error('i18n_test_6600 ' + value);
        expect(value).assertEqual('135 1057 4676');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_6700
    * @tc.name test format interface with 6262023379 param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_6700', 0, function () {
        console.error('i18n_test_6700 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US');
        let value = phonenumber.format('6262023379');
        console.error('i18n_test_6700 ' + value);
        expect(value).assertEqual('(626) 202-3379');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_6800
    * @tc.name test format interface with 13510574676 and NATIONAL type param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_6800', 0, function () {
        console.error('i18n_test_6800 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN', {'type': 'NATIONAL'});
        let value = phonenumber.format('13510574676');
        console.error('i18n_test_6800 ' + value);
        expect(value).assertEqual('135 1057 4676');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_6900
    * @tc.name test format interface with 1351057467 and NATIONAL type param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_6900', 0, function () {
        console.error('i18n_test_6900 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN', {'type': 'NATIONAL'});
        let value = phonenumber.format('1351057467');
        console.error('i18n_test_6900 ' + value);
        expect(value).assertEqual('1351057467');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_7000
    * @tc.name test format interface with 135105746761 and NATIONAL type param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_7000', 0, function () {
        console.error('i18n_test_7000 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN', {'type': 'NATIONAL'});
        let value = phonenumber.format('135105746761');
        console.error('i18n_test_7000 ' + value);
        expect(value).assertEqual('013 510 574 6761');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_7100
    * @tc.name test format interface with 135 1057 4676 and NATIONAL type param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_7100', 0, function () {
        console.error('i18n_test_7100 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN', {'type': 'NATIONAL'});
        let value = phonenumber.format('135 1057 4676');
        console.error('i18n_test_7100 ' + value);
        expect(value).assertEqual('135 1057 4676');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_7200
    * @tc.name test format interface with 13510574676 and INTERNATIONAL type param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_7200', 0, function () {
        console.error('i18n_test_7200 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN', {'type': 'INTERNATIONAL'});
        let value = phonenumber.format('13510574676');
        console.error('i18n_test_7200 ' + value);
        expect(value).assertEqual('+86 135 1057 4676');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_7300
    * @tc.name test format interface with 13510574676 and RFC3966 type param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_7300', 0, function () {
        console.error('i18n_test_7300 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN', {'type': 'RFC3966'});
        let value = phonenumber.format('13510574676');
        console.error('i18n_test_7300 ' + value);
        expect(value).assertEqual('tel:+86-135-1057-4676');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_7400
    * @tc.name test format interface with 13510574676 and E164 type param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_7400', 0, function () {
        console.error('i18n_test_7400 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('CN', {'type': 'E164'});
        let value = phonenumber.format('13510574676');
        console.error('i18n_test_7400 ' + value);
        expect(value).assertEqual('+8613510574676');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_7500
    * @tc.name test format interface with 6262023379 and NATIONAL type param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_7500', 0, function () {
        console.error('i18n_test_7500 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US', {'type': 'NATIONAL'});
        let value = phonenumber.format('6262023379');
        console.error('i18n_test_7500 ' + value);
        expect(value).assertEqual('(626) 202-3379');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_7600
    * @tc.name test format interface with 6262023379 and INTERNATIONAL type param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_7600', 0, function () {
        console.error('i18n_test_7600 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US', {'type': 'INTERNATIONAL'});
        let value = phonenumber.format('6262023379');
        console.error('i18n_test_7600 ' + value);
        expect(value).assertEqual('+1 626-202-3379');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_7700
    * @tc.name test format interface with 6262023379 and RFC3966 type param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_7700', 0, function () {
        console.error('i18n_test_7700 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US', {'type': 'RFC3966'});
        let value = phonenumber.format('6262023379');
        console.error('i18n_test_7700 ' + value);
        expect(value).assertEqual('tel:+1-626-202-3379');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_7800
    * @tc.name test format interface with 6262023379 and E164 type param
    * @tc.desc get the isValidNumber value
    */
    it('i18n_test_7800', 0, function () {
        console.error('i18n_test_7800 ' + 'start');
        let phonenumber = new I18n.PhoneNumberFormat('US', {'type': 'E164'});
        let value = phonenumber.format('6262023379');
        console.error('i18n_test_7800 ' + value);
        expect(value).assertEqual('+16262023379');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_7900
    * @tc.name test isWeekend interface
    * @tc.desc get the isWeekend value
    */
    it('i18n_test_7900', 0, function () {
        console.error('i18n_test_7900 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        let value = calendar.isWeekend(new Date(2021, 10, 1, 10, 0, 0, 0));
        console.error('i18n_test_7900 ' + value);
        expect(value).assertFalse();
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_8000
    * @tc.name test getDisplayName interface
    * @tc.desc get the getDisplayName value
    */
    it('i18n_test_8000', 0, function () {
        console.error('i18n_test_8000 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        let value = calendar.getDisplayName('zh');
        console.error('i18n_test_8000 ' + value);
        expect(value).assertEqual('公历');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_8100
    * @tc.name test get interface
    * @tc.desc get the get value
    */
    it('i18n_test_8100', 0, function () {
        console.error('i18n_test_8100 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        let value = calendar.get('year');
        console.error('i18n_test_8100 ' + value);
        expect(value).assertLarger(0);
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_8200
    * @tc.name test setMinimalDaysInFirstWeek and getMinimalDaysInFirstWeek interface
    * @tc.desc get the setMinimalDaysInFirstWeek and getMinimalDaysInFirstWeek value
    */
    it('i18n_test_8200', 0, function () {
        console.error('i18n_test_8200 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setMinimalDaysInFirstWeek(1);
        let value = calendar.getMinimalDaysInFirstWeek();
        console.error('i18n_test_8200 ' + value);
        expect(value).assertEqual(1);
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_8300
    * @tc.name test setFirstDayOfWeek and getFirstDayOfWeek interface
    * @tc.desc get the setFirstDayOfWeek and getFirstDayOfWeek value
    */
    it('i18n_test_8300', 0, function () {
        console.error('i18n_test_8300 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setFirstDayOfWeek(1);
        let value = calendar.getFirstDayOfWeek();
        console.error('i18n_test_8300 ' + value);
        expect(value).assertEqual(1);
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_8400
    * @tc.name test setTimeZone and getTimeZone interface
    * @tc.desc get the setTimeZone and getTimeZone value
    */
    it('i18n_test_8400', 0, function () {
        console.error('i18n_test_8400 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setTimeZone('Asia/Shanghai');
        let value = calendar.getTimeZone();
        console.error('i18n_test_8400 ' + value);
        expect(value).assertEqual('China Standard Time');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_8500
    * @tc.name test set interface
    * @tc.desc get the set value
    */
    it('i18n_test_8500', 0, function () {
        console.error('i18n_test_8500 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.set(2021, 11, 11);
        let value = calendar.isWeekend();
        console.error('i18n_test_8500 ' + value);
        expect(value).assertTrue();
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_8600
    * @tc.name test setTime interface with date param
    * @tc.desc get the setTime value
    */
    it('i18n_test_8600', 0, function () {
        console.error('i18n_test_8600 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        //actuall month is 9
        let date1 = new Date(2021, 8, 8, 8, 8, 8, 8);
        calendar.setTime(date1);
        let value = calendar.isWeekend();
        console.error('i18n_test_8600 ' + value);
        expect(value).assertFalse();
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_8700
    * @tc.name test setTime interface
    * @tc.desc get the setTime value
    */
    it('i18n_test_8700', 0, function () {
        console.error('i18n_test_8700 ' + 'start');
        let calendar = I18n.getCalendar('zh');
        calendar.setTime(10540800000);
        let value = calendar.isWeekend();
        console.error('i18n_test_8700 ' + value);
        expect(value).assertTrue();
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_8800
    * @tc.name test isRTL interface with zh-CN param
    * @tc.desc get the isRTL value
    */
    it('i18n_test_8800', 0, function () {
        console.error('i18n_test_8800 ' + 'start');
        let value = I18n.isRTL('zh-CN');
        console.error('i18n_test_8800 ' + value);
        expect(value).assertFalse();
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_8900
    * @tc.name test isRTL interface with en-US param
    * @tc.desc get the isRTL value
    */
    it('i18n_test_8900', 0, function () {
        console.error('i18n_test_8900 ' + 'start');
        let value = I18n.isRTL('en-US');
        console.error('i18n_test_8900 ' + value);
        expect(value).assertFalse();
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_9000
    * @tc.name test isRTL interface with ar param
    * @tc.desc get the isRTL value
    */
    it('i18n_test_9000', 0, function () {
        console.error('i18n_test_9000 ' + 'start');
        let value = I18n.isRTL('ar');
        console.error('i18n_test_9000 ' + value);
        expect(value).assertTrue();
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_9100
    * @tc.name test unitConvert interface from cup to liter unit with long style
    * @tc.desc get the unitConvert value
    */
    it('i18n_test_9100', 0, function () {
        console.error('i18n_test_9100 ' + 'start');
        let value = I18n.Util.unitConvert({unit: 'cup', measureSystem: 'US'}, {unit: 'liter', measureSystem: 'SI'}, 1000, 'en-US', 'long');
        console.error('i18n_test_9100 ' + value);
        expect(value).assertEqual('236.588 liters');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_9200
    * @tc.name test unitConvert interface from cup to liter unit with medium style
    * @tc.desc get the unitConvert value
    */
    it('i18n_test_9200', 0, function () {
        console.error('i18n_test_9200 ' + 'start');
        let value = I18n.Util.unitConvert({unit: 'cup', measureSystem: 'US'}, {unit: 'liter', measureSystem: 'SI'}, 1000, 'en-US', 'medium');
        console.error('i18n_test_9200 ' + value);
        expect(value).assertEqual('236.588L');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_9300
    * @tc.name test unitConvert interface from cup to liter unit with short style
    * @tc.desc get the unitConvert value
    */
    it('i18n_test_9300', 0, function () {
        console.error('i18n_test_9300 ' + 'start');
        let value = I18n.Util.unitConvert({unit: 'cup', measureSystem: 'US'}, {unit: 'liter', measureSystem: 'SI'}, 1000, 'en-US', 'short');
        console.error('i18n_test_9300 ' + value);
        expect(value).assertEqual('236.588 L');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_9400
    * @tc.name test unitConvert interface from meter to mile unit
    * @tc.desc get the unitConvert value
    */
    it('i18n_test_9400', 0, function () {
        console.error('i18n_test_9400 ' + 'start');
        let value = I18n.Util.unitConvert({unit: 'meter', measureSystem: 'SI'}, {unit: 'mile', measureSystem: 'SI'}, 1000, 'zh-CN', 'long');
        console.error('i18n_test_9400 ' + value);
        expect(value).assertEqual('0.621英里');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_9500
    * @tc.name test unitConvert interface from hour to second unit
    * @tc.desc get the unitConvert value
    */
    it('i18n_test_9500', 0, function () {
        console.error('i18n_test_9500 ' + 'start');
        let value = I18n.Util.unitConvert({unit: 'hour', measureSystem: 'SI'}, {unit: 'second', measureSystem: 'SI'}, 10, 'zh-CN', 'medium');
        console.error('i18n_test_9500 ' + value);
        expect(value).assertEqual('36,000秒');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_9600
    * @tc.name test unitConvert interface from celsius to fahrenheit unit
    * @tc.desc get the unitConvert value
    */
    it('i18n_test_9600', 0, function () {
        console.error('i18n_test_9600 ' + 'start');
        let value = I18n.Util.unitConvert({unit: 'celsius', measureSystem: 'SI'}, {unit: 'fahrenheit', measureSystem: 'SI'}, 1000, 'zh-CN', 'short');
        console.error('i18n_test_9600 ' + value);
        expect(value).assertEqual('1,832°F');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_9700
    * @tc.name test unitConvert interface from acre to hectare unit
    * @tc.desc get the unitConvert value
    */
    it('i18n_test_9700', 0, function () {
        console.error('i18n_test_9700 ' + 'start');
        let value = I18n.Util.unitConvert({unit: 'acre', measureSystem: 'SI'}, {unit: 'hectare', measureSystem: 'SI'}, 1000, 'zh-CN', 'long');
        console.error('i18n_test_9700 ' + value);
        expect(value).assertEqual('404.686公顷');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_9710
    * @tc.name test unitConvert interface from acre to square-meter unit
    * @tc.desc get the unitConvert value
    */
    it('i18n_test_9710', 0, function () {
        console.error('i18n_test_9710 ' + 'start');
        let value = I18n.Util.unitConvert({unit: 'acre', measureSystem: 'SI'}, {unit: 'square-meter', measureSystem: 'SI'}, 1000, 'zh-CN', 'long');
        console.error('i18n_test_9710 ' + value);
        expect(value).assertEqual('4,046,856.422平方米');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_9800
    * @tc.name test unitConvert interface from kilometer-per-hour to knot unit
    * @tc.desc get the unitConvert value
    */
    it('i18n_test_9800', 0, function () {
        console.error('i18n_test_9800 ' + 'start');
        let value = I18n.Util.unitConvert({unit: 'kilometer-per-hour', measureSystem: 'SI'}, {unit: 'knot', measureSystem: 'SI'}, 1000, 'zh-CN', 'long');
        console.error('i18n_test_9800 ' + value);
        expect(value).assertEqual('539.957节');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_9850
    * @tc.name test unitConvert interface from kilometer-per-hour to meter-per-second unit
    * @tc.desc get the unitConvert value
    */
    it('i18n_test_9850', 0, function () {
        console.error('i18n_test_9850 ' + 'start');
        let value = I18n.Util.unitConvert({unit: 'kilometer-per-hour', measureSystem: 'SI'}, {unit: 'meter-per-second', measureSystem: 'SI'}, 1000, 'zh-CN', 'long');
        console.error('i18n_test_9850 ' + value);
        expect(value).assertEqual('每秒277.778米');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_9900
    * @tc.name test unitConvert interface from meter to kilometer unit
    * @tc.desc get the unitConvert value
    */
    it('i18n_test_9900', 0, function () {
        console.error('i18n_test_9900 ' + 'start');
        let value = I18n.Util.unitConvert({unit: 'meter', measureSystem: 'SI'}, {unit: 'kilometer', measureSystem: 'SI'}, 1000, 'zh-CN', 'long');
        console.error('i18n_test_9900 ' + value);
        expect(value).assertEqual('1公里');
    })

    /**
    * @tc.number SUB_GLOBAL_I18N_JS_9910
    * @tc.name test unitConvert interface from meter to meter-per-second unit
    * @tc.desc get the unitConvert value
    */
    it('i18n_test_9910', 0, function () {
        console.error('i18n_test_9910 ' + 'start');
        let value = I18n.Util.unitConvert({unit: 'meter', measureSystem: 'SI'}, {unit: 'meter-per-second', measureSystem: 'SI'}, 1000, 'zh-CN', 'long');
        console.error('i18n_test_9910 ' + value);
        expect(value).assertEqual('1,000米');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_BREAKITERATOR_0100
    * @tc.name test current interface
    * @tc.desc check the current result
    */
    it('i18n_test_iterator_0100', 0, function () {
        console.log('i18n_test_iterator_0100 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.current();
        console.log('i18n_test_iterator_0100 ' + value);
        expect(value).assertEqual(0);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_BREAKITERATOR_0200
    * @tc.name test first interface
    * @tc.desc check the first
    */
    it('i18n_test_iterator_0200', 0, function () {
        console.log('i18n_test_iterator_0200 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.first();
        console.log('i18n_test_iterator_0200 ' + value);
        expect(value).assertEqual(0);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_BREAKITERATOR_0300
    * @tc.name test last interface
    * @tc.desc check the last interface
    */
    it('i18n_test_iterator_0300', 0, function () {
        console.log('i18n_test_iterator_0300 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.last();
        console.log('i18n_test_iterator_0300 ' + value);
        expect(value).assertEqual(40);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_BREAKITERATOR_0400
    * @tc.name test next interface
    * @tc.desc check the next interface
    */
    it('i18n_test_iterator_0400', 0, function () {
        console.log('i18n_test_iterator_0400 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.next();
        console.log('i18n_test_iterator_0400 ' + value);
        expect(value).assertEqual(3);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_BREAKITERATOR_0500
    * @tc.name test next interface with param
    * @tc.desc check the next interface with param
    */
    it('i18n_test_iterator_0500', 0, function () {
        console.log('i18n_test_iterator_0500 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.next(2);
        console.log('i18n_test_iterator_0500 ' + value);
        expect(value).assertEqual(8);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_BREAKITERATOR_0600
    * @tc.name test previous interface
    * @tc.desc check the previous interface
    */
    it('i18n_test_iterator_0600', 0, function () {
        console.log('i18n_test_iterator_0600 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.previous();
        console.log('i18n_test_iterator_0600 ' + value);
        expect(value).assertEqual(-1);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_BREAKITERATOR_0700
    * @tc.name test following interface
    * @tc.desc check the following interface
    */
    it('i18n_test_iterator_0700', 0, function () {
        console.log('i18n_test_iterator_0700 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.following(1);
        console.log('i18n_test_iterator_0700 ' + value);
        expect(value).assertEqual(3);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_BREAKITERATOR_0800
    * @tc.name test getLineBreakText interface
    * @tc.desc check the getLineBreakText interface
    */
    it('i18n_test_iterator_0800', 0, function () {
        console.log('i18n_test_iterator_0800 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.getLineBreakText();
        console.log('i18n_test_iterator_0800 ' + value);
        expect(value).assertEqual('My name is Tom.Welcome to the sky world.');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_BREAKITERATOR_0900
    * @tc.name test isBoundary interface
    * @tc.desc check the isBoundary interface
    */
    it('i18n_test_iterator_0900', 0, function () {
        console.log('i18n_test_iterator_0900 ' + 'start');
        let iterator =I18n.getLineInstance('en');
        iterator.setLineBreakText('My name is Tom.Welcome to the sky world.');
        let value = iterator.isBoundary(10);
        console.log('i18n_test_iterator_0900 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_INDEXUTIL_0100
    * @tc.name test getIndex interface
    * @tc.desc check the getIndex interface
    */
    it('i18n_test_indexutil_0100', 0, function () {
        console.log('i18n_test_indexutil_0100 ' + 'start');
        let index = I18n.getInstance();
        let value = index.getIndex('a');
        console.log('i18n_test_indexutil_0100 ' + value);
        expect(value).assertEqual('A');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_INDEXUTIL_0200
    * @tc.name test getIndexList interface
    * @tc.desc check the getIndexList interface
    */
    it('i18n_test_indexutil_0200', 0, function () {
        console.log('i18n_test_indexutil_0200 ' + 'start');
        let index = I18n.getInstance();
        let value = index.getIndexList();
        let len = value.length;
        console.log('i18n_test_indexutil_0200 ' + value);
        expect(len).assertLarger(0);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_INDEXUTIL_0300
    * @tc.name test addLocale interface
    * @tc.desc check the addLocale interface
    */
    it('i18n_test_indexutil_0300', 0, function () {
        console.log('i18n_test_indexutil_0300 ' + 'start');
        let index = I18n.getInstance();
        index.addLocale('en');
        let value = index.getIndex('a');
        console.log('i18n_test_indexutil_0300 ' + value);
        expect(value).assertEqual('A');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_INDEXUTIL_0400
    * @tc.name test getInstance interface with zh locale
    * @tc.desc check the getInstance interface with zh locale
    */
    it('i18n_test_indexutil_0400', 0, function () {
        console.log('i18n_test_indexutil_0400 ' + 'start');
        let index = I18n.getInstance('zh');
        let value = index.getIndex('z');
        console.log('i18n_test_indexutil_0400 ' + value);
        expect(value).assertEqual('Z');
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_CHARACTER_0100
    * @tc.name test isDigit interface
    * @tc.desc check the isDigit interface
    */
    it('i18n_test_character_0100', 0, function () {
        console.log('i18n_test_character_0100 ' + 'start');
        let value = I18n.Character.isDigit('abc');
        console.log('i18n_test_character_0100 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_CHARACTER_0200
    * @tc.name test isSpaceChar interface
    * @tc.desc check the isSpaceChar interface
    */
    it('i18n_test_character_0200', 0, function () {
        console.log('i18n_test_character_0200 ' + 'start');
        let value = I18n.Character.isSpaceChar('abc');
        console.log('i18n_test_character_0200 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_CHARACTER_0300
    * @tc.name test isWhitespace interface
    * @tc.desc check the isWhitespace interface
    */
    it('i18n_test_character_0300', 0, function () {
        console.log('i18n_test_character_0300 ' + 'start');
        let value = I18n.Character.isWhitespace('abc');
        console.log('i18n_test_character_0300 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_CHARACTER_0400
    * @tc.name test isRTL interface
    * @tc.desc check the isRTL interface
    */
    it('i18n_test_character_0400', 0, function () {
        console.log('i18n_test_character_0400 ' + 'start');
        let value = I18n.Character.isRTL('abc');
        console.log('i18n_test_character_0400 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_CHARACTER_0500
    * @tc.name test isIdeograph interface
    * @tc.desc check the isIdeograph interface
    */
    it('i18n_test_character_0500', 0, function () {
        console.log('i18n_test_character_0500 ' + 'start');
        let value = I18n.Character.isIdeograph('abc');
        console.log('i18n_test_character_0500 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_CHARACTER_0600
    * @tc.name test isLetter interface
    * @tc.desc check the isLetter interface
    */
    it('i18n_test_character_0600', 0, function () {
        console.log('i18n_test_character_0600 ' + 'start');
        let value = I18n.Character.isLetter('abc');
        console.log('i18n_test_character_0600 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_CHARACTER_0700
    * @tc.name test isLowerCase interface
    * @tc.desc check the isLowerCase interface
    */
    it('i18n_test_character_0700', 0, function () {
        console.log('i18n_test_character_0700 ' + 'start');
        let value = I18n.Character.isLowerCase('abc');
        console.log('i18n_test_character_0700 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_CHARACTER_0800
    * @tc.name test isUpperCase interface
    * @tc.desc check the isUpperCase interface
    */
    it('i18n_test_character_0800', 0, function () {
        console.log('i18n_test_character_0800 ' + 'start');
        let value = I18n.Character.isUpperCase('ABC');
        console.log('i18n_test_character_0800 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_CHARACTER_0900
    * @tc.name test getType interface
    * @tc.desc check the getType interface
    */
    it('i18n_test_character_0900', 0, function () {
        console.log('i18n_test_character_0900 ' + 'start');
        let value = I18n.Character.getType('a');
        console.log('i18n_test_character_0900 ' + value);
        expect(value).assertEqual('U_LOWERCASE_LETTER');
    })

    console.log('*************end I18NTest*************');
})