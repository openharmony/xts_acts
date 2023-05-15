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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function I18nTest() {
describe('I18nTest', function () {
    console.log('*************start I18NTest*************');

    let hour = I18n.is24HourClock();
    console.log('init 24 hour clock value ' + hour);

    /* *
    * execute this step before all testcases
    */
    beforeAll(function(){
        console.log('step before all cases in I18n.'
        + ' 24hour: ' + I18n.is24HourClock()
        + ' prelang: ' + I18n.getPreferredLanguageList()
        + ' syslocale: ' + I18n.getSystemLocale());
    })

    /* *
    * execute this step before every testcase
    */
    beforeEach(function(){
        console.log('step before every case in I18n.');
    })

    /* *
    * execute this step after every testcase
    */
    afterEach(function(){
        console.log('step after every case in I18n.');
    })

    /* *
    * execute this step after all testcases
    */
    afterAll(function(){
        console.log('step after all cases in I18n.'
        + ' 24hour: ' + I18n.is24HourClock()
        + ' prelang: ' + I18n.getPreferredLanguageList()
        + ' syslocale: ' + I18n.getSystemLocale());
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_0100
    * @tc.name    getSystemLanguage
    * @tc.desc    check the getSystemLanguage
    */
    it('i18n_test_0100', 0, function () {
        let lang = I18n.getSystemLanguage();
        console.log('i18n_test_0100 ' + lang);
        expect(lang).assertInstanceOf('String');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_0120
    * @tc.name    getSystemLanguage
    * @tc.desc    check the getSystemLanguage
    */
    it('i18n_test_0120', 0, function () {
        let lang = I18n.System.getSystemLanguage();
        console.log('i18n_test_0120 ' + lang);
        expect(lang).assertInstanceOf('String');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_0200
    * @tc.name    getSystemRegion
    * @tc.desc    check the getSystemRegion
    */
    it('i18n_test_0200', 0, function () {
        let region = I18n.getSystemRegion();
        console.log('i18n_test_0200 ' + region);
        expect(region).assertInstanceOf('String');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_0220
    * @tc.name    getSystemRegion
    * @tc.desc    check the getSystemRegion
    */
    it('i18n_test_0220', 0, function () {
        let region = I18n.System.getSystemRegion();
        console.log('i18n_test_0220 ' + region);
        expect(region).assertInstanceOf('String');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_0300
    * @tc.name    getSystemLocale
    * @tc.desc    check the getSystemLocale
    */
    it('i18n_test_0300', 0, function () {
        let locale = I18n.getSystemLocale();
        console.log('i18n_test_0300 ' + locale);
        expect(locale).assertInstanceOf('String');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_0320
    * @tc.name    getSystemLocale
    * @tc.desc    check the getSystemLocale
    */
    it('i18n_test_0320', 0, function () {
        let locale = I18n.System.getSystemLocale();
        console.log('i18n_test_0320 ' + locale);
        expect(locale).assertInstanceOf('String');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_0340
    * @tc.name    is24HourClock
    * @tc.desc    check the is24HourClock
    */
    it('i18n_test_0340', 0, function () {
        let value = I18n.System.is24HourClock();
        console.log('i18n_test_0340 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2110
    * @tc.name getSystemLanguages test
    * @tc.desc check the getSystemLanguages
    */
    it('i18n_test_2110', 0, function () {
        let value = I18n.System.getSystemLanguages();
        let len = value.length;
        console.log('i18n_test_2110 ' + len);
        expect(len).assertLarger(0);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2120
    * @tc.name getSystemCountries with en param
    * @tc.desc check the getSystemCountries
    */
    it('i18n_test_2120', 0, function () {
        let value = I18n.System.getSystemCountries('en');
        let len = value.length;
        console.log('i18n_test_2120 ' + len);
        expect(len).assertLarger(0);
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2140
    * @tc.name getSystemCountries with en param
    * @tc.desc check the getSystemCountries
    */
    it('i18n_test_2140', 0, function () {
        try{
            let value = I18n.System.getSystemCountries();
            let len = value.length;
            console.log('i18n_test_2140 ' + len);
            expect(len).assertLarger(0);
        }catch(e){
            console.log('i18n_test_2140 ' + e.code);
            console.log('i18n_test_2140 ' + e.message);
            expect(e.code).assertEqual('401');
            expect(e.message).assertEqual('Check param failed');
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2160
    * @tc.name getSystemCountries with en param
    * @tc.desc check the getSystemCountries
    */
    it('i18n_test_2160', 0, function () {
        try{
            let value = I18n.System.getSystemCountries(12345);
            let len = value.length;
            console.log('i18n_test_2160 ' + len);
            expect(len).assertLarger(0);
        }catch(e){
            console.log('i18n_test_2160 ' + e.code);
            console.log('i18n_test_2160 ' + e.message);
            expect(e.code).assertEqual('890001');
            expect(e.message).assertEqual('Param value not valid');
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2310
    * @tc.name isSuggested with zh param
    * @tc.desc check the isSuggested
    */
    it('i18n_test_2310', 0, function () {
        let value = I18n.isSuggested('zh');
        console.log('i18n_test_2310 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2320
    * @tc.name isSuggested with en param
    * @tc.desc check the isSuggested
    */
    it('i18n_test_2320', 0, function () {
        let value = I18n.isSuggested('en');
        console.log('i18n_test_2320 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2330
    * @tc.name isSuggested with zh-CN param
    * @tc.desc check the isSuggested
    */
    it('i18n_test_2330', 0, function () {
        let value = I18n.isSuggested('zh', 'CN');
        console.log('i18n_test_2330 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2340
    * @tc.name isSuggested with en-US param
    * @tc.desc check the isSuggested
    */
    it('i18n_test_2340', 0, function () {
        let value = I18n.isSuggested('en' , 'US');
        console.log('i18n_test_2340 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2350
    * @tc.name isSuggested with zh param
    * @tc.desc check the isSuggested
    */
    it('i18n_test_2350', 0, function () {
        let value = I18n.System.isSuggested('zh');
        console.log('i18n_test_2350 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2360
    * @tc.name isSuggested with en param
    * @tc.desc check the isSuggested
    */
    it('i18n_test_2360', 0, function () {
        let value = I18n.System.isSuggested('en');
        console.log('i18n_test_2360 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2370
    * @tc.name isSuggested with zh-CN param
    * @tc.desc check the isSuggested
    */
    it('i18n_test_2370', 0, function () {
        let value = I18n.System.isSuggested('zh', 'CN');
        console.log('i18n_test_2370 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2380
    * @tc.name isSuggested with en-US param
    * @tc.desc check the isSuggested
    */
    it('i18n_test_2380', 0, function () {
        let value = I18n.System.isSuggested('en' , 'US');
        console.log('i18n_test_2380 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2390
    * @tc.name isSuggested with en-US param
    * @tc.desc check the isSuggested
    */
    it('i18n_test_2390', 0, function () {
        try{
            let value = I18n.System.isSuggested();
            console.log('i18n_test_2390 ' + value);
            expect(value).assertTrue();
        }catch(e){
            console.log('i18n_test_2390 ' + e.code);
            console.log('i18n_test_2390 ' + e.message);
            expect(e.code).assertEqual('401');
            expect(e.message).assertEqual('Check param failed');
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_I18N_JS_2391
    * @tc.name isSuggested with en-US param
    * @tc.desc check the isSuggested
    */
    it('i18n_test_2391', 0, function () {
        try{
            let value = I18n.System.isSuggested(12345);
            console.log('i18n_test_2391 ' + value);
            expect(value).assertTrue();
        }catch(e){
            console.log('i18n_test_2391 ' + e.code);
            console.log('i18n_test_2391 ' + e.message);
            expect(e.code).assertEqual('890001');
            expect(e.message).assertEqual('Param value not valid');
        }
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_3800
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US and true param
    * @tc.desc    check the display country
    */
    it('i18n_test_3800', 0, function () {
        let value = I18n.getDisplayCountry('zh-Hans-CN', 'en-US', true);
        console.log('i18n_test_3800 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_3820
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US and undefined param
    * @tc.desc    check the display country
    */
    it('i18n_test_3820', 0, function () {
        let value = I18n.getDisplayCountry('zh-Hans-CN', 'en-US', undefined);
        console.log('i18n_test_3820 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_3840
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US and null param
    * @tc.desc    check the display country
    */
    it('i18n_test_3840', 0, function () {
        let value = I18n.getDisplayCountry('zh-Hans-CN', 'en-US', null);
        console.log('i18n_test_3840 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_3900
    * @tc.name    getDisplayCountry with zh and en-US and true param
    * @tc.desc    check the display country
    */
    it('i18n_test_3900', 0, function () {
        let value = I18n.getDisplayCountry('zh', 'en-US', true);
        console.log('i18n_test_3900 ' + value);
        expect(value).assertEqual('');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4000
    * @tc.name    getDisplayCountry with zh-CN and en-US and true param
    * @tc.desc    check the display country
    */
    it('i18n_test_4000', 0, function () {
        let value = I18n.getDisplayCountry('zh-CN', 'en-US', true);
        console.log('i18n_test_4000 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4100
    * @tc.name    getDisplayCountry with zh-Hans and en-US and true param
    * @tc.desc    check the display country
    */
    it('i18n_test_4100', 0, function () {
        let value = I18n.getDisplayCountry('zh-Hans', 'en-US', true);
        console.log('i18n_test_4100 ' + value);
        expect(value).assertEqual('');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4200
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US and false param
    * @tc.desc    check the language
    */
    it('i18n_test_4200', 0, function () {
        let value = I18n.getDisplayCountry('zh-Hans-CN', 'en-US', false);
        console.log('i18n_test_4200 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4300
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US param
    * @tc.desc    check the language
    */
    it('i18n_test_4300', 0, function () {
        let value = I18n.getDisplayCountry('zh-Hans-CN', 'en-US');
        console.log('i18n_test_4300 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4310
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US and true param
    * @tc.desc    check the display country
    */
    it('i18n_test_4310', 0, function () {
        let value = I18n.System.getDisplayCountry('zh-Hans-CN', 'en-US', true);
        console.log('i18n_test_4310 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4320
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US and undefined param
    * @tc.desc    check the display country
    */
    it('i18n_test_4320', 0, function () {
        let value = I18n.System.getDisplayCountry('zh-Hans-CN', 'en-US', undefined);
        console.log('i18n_test_4320 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4321
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US and null param
    * @tc.desc    check the display country
    */
    it('i18n_test_4321', 0, function () {
        let value = I18n.System.getDisplayCountry('zh-Hans-CN', 'en-US', null);
        console.log('i18n_test_4321 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4330
    * @tc.name    getDisplayCountry with zh and en-US and true param
    * @tc.desc    check the display country
    */
    it('i18n_test_4330', 0, function () {
        try{
            let value = I18n.System.getDisplayCountry('zh', 'en-US', true);
            console.log('i18n_test_4330 ' + value);
            expect(value).assertEqual('');
        }catch(e){
            console.log('i18n_test_4330 ' + e.code);
            console.log('i18n_test_4330 ' + e.message);
            expect(e.code).assertEqual('890001');
            expect(e.message).assertEqual('Param value not valid');
        }
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4340
    * @tc.name    getDisplayCountry with zh-CN and en-US and true param
    * @tc.desc    check the display country
    */
    it('i18n_test_4340', 0, function () {
        let value = I18n.System.getDisplayCountry('zh-CN', 'en-US', true);
        console.log('i18n_test_4340 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4350
    * @tc.name    getDisplayCountry with zh-Hans and en-US and true param
    * @tc.desc    check the display country
    */
    it('i18n_test_4350', 0, function () {
        try{
            let value = I18n.System.getDisplayCountry('zh-Hans', 'en-US', true);
            console.log('i18n_test_4350 ' + value);
            expect(value).assertEqual('');
        }catch(e){
            console.log('i18n_test_4350 ' + e.code);
            console.log('i18n_test_4350 ' + e.message);
            expect(e.code).assertEqual('890001');
            expect(e.message).assertEqual('Param value not valid');
        }
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4360
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US and false param
    * @tc.desc    check the language
    */
    it('i18n_test_4360', 0, function () {
        let value = I18n.System.getDisplayCountry('zh-Hans-CN', 'en-US', false);
        console.log('i18n_test_4360 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4370
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US param
    * @tc.desc    check the language
    */
    it('i18n_test_4370', 0, function () {
        let value = I18n.System.getDisplayCountry('zh-Hans-CN', 'en-US');
        console.log('i18n_test_4370 ' + value);
        expect(value).assertEqual('China');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4380
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US param
    * @tc.desc    check the language
    */
    it('i18n_test_4380', 0, function () {
        try{
            let value = I18n.System.getDisplayCountry('zh-Hans-CN');
            console.log('i18n_test_4380 ' + value);
            expect(value).assertEqual('China');
        }catch(e){
            console.log('i18n_test_4380 ' + e.code);
            console.log('i18n_test_4380 ' + e.message);
            expect(e.code).assertEqual('401');
            expect(e.message).assertEqual('Check param failed');
        }
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4390
    * @tc.name    getDisplayCountry with zh-Hans-CN and en-US param
    * @tc.desc    check the language
    */
    it('i18n_test_4390', 0, function () {
        try{
            let value = I18n.System.getDisplayCountry('zh-Hans-CN', 12345);
            console.log('i18n_test_4390 ' + value);
            expect(value).assertEqual('China');
        }catch(e){
            console.log('i18n_test_4390 ' + e.code);
            console.log('i18n_test_4390 ' + e.message);
            expect(e.code).assertEqual('890001');
            expect(e.message).assertEqual('Param value not valid');
        }
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4400
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US and true param
    * @tc.desc    check the language
    */
    it('i18n_test_4400', 0, function () {
        let value = I18n.getDisplayLanguage('zh-Hans-CN', 'en-US', true);
        console.log('i18n_test_4400 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4420
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US and undefined param
    * @tc.desc    check the language
    */
    it('i18n_test_4420', 0, function () {
        let value = I18n.getDisplayLanguage('zh-Hans-CN', 'en-US', undefined);
        console.log('i18n_test_4420 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4440
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US and null param
    * @tc.desc    check the language
    */
    it('i18n_test_4440', 0, function () {
        let value = I18n.getDisplayLanguage('zh-Hans-CN', 'en-US', null);
        console.log('i18n_test_4440 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4500
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-GB and true param
    * @tc.desc    check the language
    */
    it('i18n_test_4500', 0, function () {
        let value = I18n.getDisplayLanguage('zh-Hans-CN', 'en-GB', true);
        console.log('i18n_test_4500 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4600
    * @tc.name    getDisplayLanguage with zh and en-US and true param
    * @tc.desc    check the language
    */
    it('i18n_test_4600', 0, function () {
        let value = I18n.getDisplayLanguage('zh', 'en-US', true);
        console.log('i18n_test_4600 ' + value);
        expect(value).assertEqual('Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4700
    * @tc.name    getDisplayLanguage with zh-CN and en-US and true param
    * @tc.desc    check the language
    */
    it('i18n_test_4700', 0, function () {
        let value = I18n.getDisplayLanguage('zh-CN', 'en-US', true);
        console.log('i18n_test_4700 ' + value);
        expect(value).assertEqual('Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4800
    * @tc.name    getDisplayLanguage with zh-Hans and en-US and true param
    * @tc.desc    check the language
    */
    it('i18n_test_4800', 0, function () {
        let value = I18n.getDisplayLanguage('zh-Hans', 'en-US', true);
        console.log('i18n_test_4800 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_4900
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US and false param
    * @tc.desc    check the language
    */
    it('i18n_test_4900', 0, function () {
        let value = I18n.getDisplayLanguage('zh-Hans-CN', 'en-US', false);
        console.log('i18n_test_4900 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_5000
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US param
    * @tc.desc    check the language
    */
    it('i18n_test_5000', 0, function () {
        let value = I18n.getDisplayLanguage('zh-Hans-CN', 'en-US');
        console.log('i18n_test_5000 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_5010
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US and true param
    * @tc.desc    check the language
    */
    it('i18n_test_5010', 0, function () {
        let value = I18n.System.getDisplayLanguage('zh-Hans-CN', 'en-US', true);
        console.log('i18n_test_5010 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_5020
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US and undefined param
    * @tc.desc    check the language
    */
    it('i18n_test_5020', 0, function () {
        let value = I18n.System.getDisplayLanguage('zh-Hans-CN', 'en-US', undefined);
        console.log('i18n_test_5020 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_5021
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US and null param
    * @tc.desc    check the language
    */
    it('i18n_test_5021', 0, function () {
        let value = I18n.System.getDisplayLanguage('zh-Hans-CN', 'en-US', null);
        console.log('i18n_test_5021 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_5030
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-GB and true param
    * @tc.desc    check the language
    */
    it('i18n_test_5030', 0, function () {
        let value = I18n.System.getDisplayLanguage('zh-Hans-CN', 'en-GB', true);
        console.log('i18n_test_5030 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_5040
    * @tc.name    getDisplayLanguage with zh and en-US and true param
    * @tc.desc    check the language
    */
    it('i18n_test_5040', 0, function () {
        let value = I18n.System.getDisplayLanguage('zh', 'en-US', true);
        console.log('i18n_test_5040 ' + value);
        expect(value).assertEqual('Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_5050
    * @tc.name    getDisplayLanguage with zh-CN and en-US and true param
    * @tc.desc    check the language
    */
    it('i18n_test_5050', 0, function () {
        let value = I18n.System.getDisplayLanguage('zh-CN', 'en-US', true);
        console.log('i18n_test_5050 ' + value);
        expect(value).assertEqual('Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_5060
    * @tc.name    getDisplayLanguage with zh-Hans and en-US and true param
    * @tc.desc    check the language
    */
    it('i18n_test_5060', 0, function () {
        let value = I18n.System.getDisplayLanguage('zh-Hans', 'en-US', true);
        console.log('i18n_test_5060 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_5070
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US and false param
    * @tc.desc    check the language
    */
    it('i18n_test_5070', 0, function () {
        let value = I18n.System.getDisplayLanguage('zh-Hans-CN', 'en-US', false);
        console.log('i18n_test_5070 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_5080
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US param
    * @tc.desc    check the language
    */
    it('i18n_test_5080', 0, function () {
        let value = I18n.System.getDisplayLanguage('zh-Hans-CN', 'en-US');
        console.log('i18n_test_5080 ' + value);
        expect(value).assertEqual('Simplified Chinese');
    })

    /* *
        * @tc.number  SUB_GLOBAL_I18N_JS_5090
        * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US param
        * @tc.desc    check the language
        */
    it('i18n_test_5090', 0, function () {
        try{
            let value = I18n.System.getDisplayLanguage('zh-Hans-CN');
            console.log('i18n_test_5090 ' + value);
            expect(value).assertEqual('Simplified Chinese');
        }catch(e){
            console.log('i18n_test_5090 ' + e.code);
            console.log('i18n_test_5090 ' + e.message);
            expect(e.code).assertEqual('401');
            expect(e.message).assertEqual('Check param failed');
        }
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_5091
    * @tc.name    getDisplayLanguage with zh-Hans-CN and en-US param
    * @tc.desc    check the language
    */
    it('i18n_test_5091', 0, function () {
        try{
            let value = I18n.System.getDisplayLanguage('zh-Hans-CN', 12345);
            console.log('i18n_test_5091 ' + value);
            expect(value).assertEqual('Simplified Chinese');
        }catch(e){
            console.log('i18n_test_5091 ' + e.code);
            console.log('i18n_test_5091 ' + e.message);
            expect(e.code).assertEqual('890001');
            expect(e.message).assertEqual('Param value not valid');
        }
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8800
    * @tc.name    test isRTL interface with zh-CN param
    * @tc.desc    get the isRTL value
    */
    it('i18n_test_8800', 0, function () {
        console.log('i18n_test_8800 ' + 'start');
        let value = I18n.isRTL('zh-CN');
        console.log('i18n_test_8800 ' + value);
        expect(value).assertFalse();
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_8900
    * @tc.name    test isRTL interface with en-US param
    * @tc.desc    get the isRTL value
    */
    it('i18n_test_8900', 0, function () {
        console.log('i18n_test_8900 ' + 'start');
        let value = I18n.isRTL('en-US');
        console.log('i18n_test_8900 ' + value);
        expect(value).assertFalse();
    })

    /**
    * @tc.number  SUB_GLOBAL_I18N_JS_9000
    * @tc.name    test isRTL interface with ar param
    * @tc.desc    get the isRTL value
    */
    it('i18n_test_9000', 0, function () {
        console.log('i18n_test_9000 ' + 'start');
        let value = I18n.isRTL('ar');
        console.log('i18n_test_9000 ' + value);
        expect(value).assertTrue();
    })

    console.log('*************end I18NTest*************');
})}
