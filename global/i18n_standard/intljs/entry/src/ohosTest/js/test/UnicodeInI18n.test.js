/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function UnicodeInI18nTest() {
describe('UnicodeInI18nTest', function () {
    console.log('*************start UnicodeInI18nTest*************');

    let hour = I18n.System.is24HourClock();
    console.log('init 24 hour clock value ' + hour);

    /* *
    * execute this step before all testcases
    */
    beforeAll(function(){
        console.log('step before all cases in I18n.'
        + ' 24hour: ' + I18n.System.is24HourClock()
        + ' prelang: ' + I18n.System.getPreferredLanguageList()
        + ' syslocale: ' + I18n.System.getSystemLocale());
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
        + ' 24hour: ' + I18n.System.is24HourClock()
        + ' prelang: ' + I18n.System.getPreferredLanguageList()
        + ' syslocale: ' + I18n.System.getSystemLocale());
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0100
    * @tc.name    test isDigit interface
    * @tc.desc    check the isDigit interface
    */
    it('i18n_test_character_0100', 0, function () {
        console.log('i18n_test_character_0100 ' + 'start');
        let value = I18n.Unicode.isDigit('abc');
        console.log('i18n_test_character_0100 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0120
    * @tc.name    test isDigit interface with 123 param
    * @tc.desc    check the isDigit interface
    */
    it('i18n_test_character_0120', 0, function () {
        console.log('i18n_test_character_0120 ' + 'start');
        let value = I18n.Unicode.isDigit('123');
        console.log('i18n_test_character_0120 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0140
    * @tc.name    test isDigit interface with 123abc param
    * @tc.desc    check the isDigit interface
    */
    it('i18n_test_character_0140', 0, function () {
        console.log('i18n_test_character_0140 ' + 'start');
        let value = I18n.Unicode.isDigit('123abc');
        console.log('i18n_test_character_0140 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0150
    * @tc.name    test isDigit interface with abc123 param
    * @tc.desc    check the isDigit interface
    */
    it('i18n_test_character_0150', 0, function () {
        console.log('i18n_test_character_0150 ' + 'start');
        let value = I18n.Unicode.isDigit('abc123');
        console.log('i18n_test_character_0150 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0160
    * @tc.name    test isDigit interface with null param
    * @tc.desc    check the isDigit interface
    */
    it('i18n_test_character_0160', 0, function () {
        console.log('i18n_test_character_0160 ' + 'start');
        let value = I18n.Unicode.isDigit('');
        console.log('i18n_test_character_0160 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0200
    * @tc.name    test isSpaceChar interface with abc param
    * @tc.desc    check the isSpaceChar interface
    */
    it('i18n_test_character_0200', 0, function () {
        console.log('i18n_test_character_0200 ' + 'start');
        let value = I18n.Unicode.isSpaceChar('abc');
        console.log('i18n_test_character_0200 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0220
    * @tc.name    test isSpaceChar interface with one space param
    * @tc.desc    check the isSpaceChar interface
    */
    it('i18n_test_character_0220', 0, function () {
        console.log('i18n_test_character_0220 ' + 'start');
        let value = I18n.Unicode.isSpaceChar(' ');
        console.log('i18n_test_character_0220 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0240
    * @tc.name    test isSpaceChar interface with multi space param
    * @tc.desc    check the isSpaceChar interface
    */
    it('i18n_test_character_0240', 0, function () {
        console.log('i18n_test_character_0240 ' + 'start');
        let value = I18n.Unicode.isSpaceChar('   ');
        console.log('i18n_test_character_0240--' + value + '--');
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0300
    * @tc.name    test isWhitespace interface with abc param
    * @tc.desc    check the isWhitespace interface
    */
    it('i18n_test_character_0300', 0, function () {
        console.log('i18n_test_character_0300 ' + 'start');
        let value = I18n.Unicode.isWhitespace('abc');
        console.log('i18n_test_character_0300 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0320
    * @tc.name    test isWhitespace interface with \u0009 param
    * @tc.desc    check the isWhitespace interface
    */
    it('i18n_test_character_0320', 0, function () {
        console.log('i18n_test_character_0320 ' + 'start');
        let value = I18n.Unicode.isWhitespace('\u0009');
        console.log('i18n_test_character_0320--' + value + '--');
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0400
    * @tc.name    test isRTL interface with abc param
    * @tc.desc    check the isRTL interface
    */
    it('i18n_test_character_0400', 0, function () {
        console.log('i18n_test_character_0400 ' + 'start');
        let value = I18n.Unicode.isRTL('abc');
        console.log('i18n_test_character_0400 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0420
    * @tc.name    test isRTL interface with ١٢٣٤٥٦٧ param
    * @tc.desc    check the isRTL interface
    */
    it('i18n_test_character_0420', 0, function () {
        console.log('i18n_test_character_0420 ' + 'start');
        let value = I18n.Unicode.isRTL('١٢٣٤٥٦٧');
        console.log('i18n_test_character_0420 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0440
    * @tc.name    test isRTL interface with 我是小明 param
    * @tc.desc    check the isRTL interface
    */
    it('i18n_test_character_0440', 0, function () {
        console.log('i18n_test_character_0440 ' + 'start');
        let value = I18n.Unicode.isRTL('我是小明');
        console.log('i18n_test_character_0440 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0460
    * @tc.name    test isRTL interface with نحن param
    * @tc.desc    check the isRTL interface
    */
    it('i18n_test_character_0460', 0, function () {
        console.log('i18n_test_character_0460 ' + 'start');
        let value = I18n.Unicode.isRTL('نحن');
        console.log('i18n_test_character_0460 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0500
    * @tc.name    test isIdeograph interface with abc param
    * @tc.desc    check the isIdeograph interface
    */
    it('i18n_test_character_0500', 0, function () {
        console.log('i18n_test_character_0500 ' + 'start');
        let value = I18n.Unicode.isIdeograph('abc');
        console.log('i18n_test_character_0500 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0520
    * @tc.name    test isIdeograph interface with '我' param
    * @tc.desc    check the isIdeograph interface
    */
    it('i18n_test_character_0520', 0, function () {
        console.log('i18n_test_character_0520 ' + 'start');
        let value = I18n.Unicode.isIdeograph('我');
        console.log('i18n_test_character_0520 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0540
    * @tc.name    test isIdeograph interface with '우리' param
    * @tc.desc    check the isIdeograph interface
    */
    it('i18n_test_character_0540', 0, function () {
        console.log('i18n_test_character_0540 ' + 'start');
        let value = I18n.Unicode.isIdeograph('우리');
        console.log('i18n_test_character_0540 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0560
    * @tc.name    test isIdeograph interface with '私た' param
    * @tc.desc    check the isIdeograph interface
    */
    it('i18n_test_character_0560', 0, function () {
        console.log('i18n_test_character_0560 ' + 'start');
        let value = I18n.Unicode.isIdeograph('私たち');
        console.log('i18n_test_character_0560 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0600
    * @tc.name    test isLetter interface with abc param
    * @tc.desc    check the isLetter interface
    */
    it('i18n_test_character_0600', 0, function () {
        console.log('i18n_test_character_0600 ' + 'start');
        let value = I18n.Unicode.isLetter('abc');
        console.log('i18n_test_character_0600 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0620
    * @tc.name    test isLetter interface with 123 param
    * @tc.desc    check the isLetter interface
    */
    it('i18n_test_character_0620', 0, function () {
        console.log('i18n_test_character_0620 ' + 'start');
        let value = I18n.Unicode.isLetter('123');
        console.log('i18n_test_character_0620 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0640
    * @tc.name    test isLetter interface with abc123 param
    * @tc.desc    check the isLetter interface
    */
    it('i18n_test_character_0640', 0, function () {
        console.log('i18n_test_character_0640 ' + 'start');
        let value = I18n.Unicode.isLetter('abc123');
        console.log('i18n_test_character_0640 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0660
    * @tc.name    test isLetter interface with 123abc param
    * @tc.desc    check the isLetter interface
    */
    it('i18n_test_character_0660', 0, function () {
        console.log('i18n_test_character_0660 ' + 'start');
        let value = I18n.Unicode.isLetter('123abc');
        console.log('i18n_test_character_0660 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0700
    * @tc.name    test isLowerCase interface with abc param
    * @tc.desc    check the isLowerCase interface
    */
    it('i18n_test_character_0700', 0, function () {
        console.log('i18n_test_character_0700 ' + 'start');
        let value = I18n.Unicode.isLowerCase('abc');
        console.log('i18n_test_character_0700 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0720
    * @tc.name    ftest isLowerCase interface with ABC param
    * @tc.desc    check the isLowerCase interface
    */
    it('i18n_test_character_0720', 0, function () {
        console.log('i18n_test_character_0720 ' + 'start');
        let value = I18n.Unicode.isLowerCase('ABC');
        console.log('i18n_test_character_0720 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0740
    * @tc.name    test isLowerCase interface with abcDEF param
    * @tc.desc    check the isLowerCase interface
    */
    it('i18n_test_character_0740', 0, function () {
        console.log('i18n_test_character_0740 ' + 'start');
        let value = I18n.Unicode.isLowerCase('abcDEF');
        console.log('i18n_test_character_0740 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0760
    * @tc.name    test isLowerCase interface with ABCdef param
    * @tc.desc    check the isLowerCase interface
    */
    it('i18n_test_character_0760', 0, function () {
        console.log('i18n_test_character_0760 ' + 'start');
        let value = I18n.Unicode.isLowerCase('ABCdef');
        console.log('i18n_test_character_0760 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0800
    * @tc.name    test isUpperCase interface with ABC param
    * @tc.desc    check the isUpperCase interface
    */
    it('i18n_test_character_0800', 0, function () {
        console.log('i18n_test_character_0800 ' + 'start');
        let value = I18n.Unicode.isUpperCase('ABC');
        console.log('i18n_test_character_0800 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0820
    * @tc.name    test isUpperCase interface with abc param
    * @tc.desc    check the isUpperCase interface
    */
    it('i18n_test_character_0820', 0, function () {
        console.log('i18n_test_character_0820 ' + 'start');
        let value = I18n.Unicode.isUpperCase('abc');
        console.log('i18n_test_character_0820 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0840
    * @tc.name    test isUpperCase interface with ABCdef param
    * @tc.desc    check the isUpperCase interface
    */
    it('i18n_test_character_0840', 0, function () {
        console.log('i18n_test_character_0840 ' + 'start');
        let value = I18n.Unicode.isUpperCase('ABCdef');
        console.log('i18n_test_character_0840 ' + value);
        expect(value).assertTrue();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0860
    * @tc.name    test isUpperCase interface with abcDEF param
    * @tc.desc    check the isUpperCase interface
    */
    it('i18n_test_character_0860', 0, function () {
        console.log('i18n_test_character_0860 ' + 'start');
        let value = I18n.Unicode.isUpperCase('abcDEF');
        console.log('i18n_test_character_0860 ' + value);
        expect(value).assertFalse();
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0900
    * @tc.name    test getType interface with a param
    * @tc.desc    check the getType interface
    */
    it('i18n_test_character_0900', 0, function () {
        console.log('i18n_test_character_0900 ' + 'start');
        let value = I18n.Unicode.getType('a');
        console.log('i18n_test_character_0900 ' + value);
        expect(value).assertEqual('U_LOWERCASE_LETTER');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0920
    * @tc.name    ftest getType interface with ABC param
    * @tc.desc    check the getType interface
    */
    it('i18n_test_character_0920', 0, function () {
        console.log('i18n_test_character_0920 ' + 'start');
        let value = I18n.Unicode.getType('ABC');
        console.log('i18n_test_character_0920 ' + value);
        expect(value).assertEqual('U_UPPERCASE_LETTER');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0940
    * @tc.name    test getType interface with ABCdef param
    * @tc.desc    check the getType interface
    */
    it('i18n_test_character_0940', 0, function () {
        console.log('i18n_test_character_0940 ' + 'start');
        let value = I18n.Unicode.getType('ABCdef');
        console.log('i18n_test_character_0940 ' + value);
        expect(value).assertEqual('U_UPPERCASE_LETTER');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0960
    * @tc.name    test getType interface with 123 param
    * @tc.desc    check the getType interface
    */
    it('i18n_test_character_0960', 0, function () {
        console.log('i18n_test_character_0960 ' + 'start');
        let value = I18n.Unicode.getType('123');
        console.log('i18n_test_character_0960 ' + value);
        expect(value).assertEqual('U_DECIMAL_DIGIT_NUMBER');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0970
    * @tc.name    test getType interface with 123abc param
    * @tc.desc    check the getType interface
    */
    it('i18n_test_character_0970', 0, function () {
        console.log('i18n_test_character_0970 ' + 'start');
        let value = I18n.Unicode.getType('123abc');
        console.log('i18n_test_character_0970 ' + value);
        expect(value).assertEqual('U_DECIMAL_DIGIT_NUMBER');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0980
    * @tc.name    test getType interface with ١٢٣٤٥٦٧ param
    * @tc.desc    check the getType interface
    */
    it('i18n_test_character_0980', 0, function () {
        console.log('i18n_test_character_0980 ' + 'start');
        let value = I18n.Unicode.getType('١٢٣٤٥٦٧');
        console.log('i18n_test_character_0980 ' + value);
        expect(value).assertEqual('U_DECIMAL_DIGIT_NUMBER');
    })

    /* *
    * @tc.number  SUB_GLOBAL_I18N_JS_CHARACTER_0990
    * @tc.name    test getType interface with multi space param
    * @tc.desc    check the getType interface
    */
    it('i18n_test_character_0990', 0, function () {
        console.log('i18n_test_character_0990 ' + 'start');
        let value = I18n.Unicode.getType('   ');
        console.log('i18n_test_character_0990 ' + value);
        expect(value).assertEqual('U_SPACE_SEPARATOR');
    })

    console.log('*************end UnicodeInI18nTest*************');
})}
