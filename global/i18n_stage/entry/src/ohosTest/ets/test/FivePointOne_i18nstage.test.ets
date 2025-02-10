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

import Ability from '@ohos.app.ability.UIAbility';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { intl } from '@kit.LocalizationKit';
import { LengthMetrics } from '@kit.ArkUI';
import { i18n } from '@kit.LocalizationKit';

export default function FivePointOne_i18nStageTest() {
  describe("FivePointOne_i18nStageTest", () => {
    console.log('*************start FivePointOne_i18nStageTest*************');

    beforeAll(async () => {
      console.info("beforeAll case");
    });
    beforeEach(() => {
      console.info("beforeEach case");
    });
    afterEach(async () => {
      console.info("afterEach case");
    });
    afterAll(() => {
      console.info("afterAll case");
    });

    /**
     * @tc.number   : SUB_GLOBAL_refinedFormat_0160
     * @tc.name     : SUB_GLOBAL_refinedFormat_0160
     * @tc.desc     : begin code same as stop code
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_refinedFormat_0160', 0, () => {
      let numFormat: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN");
      let formattedRange: string = numFormat.formatRange(0, 0);
      expect(formattedRange == "~0").assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_refinedFormat_0170
     * @tc.name     : SUB_GLOBAL_refinedFormat_0170
     * @tc.desc     : normally (begin code & stop code)
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_refinedFormat_0170', 0, () => {
      let numFormat: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN");
      let formattedRange: string = numFormat.formatRange(0, 9);
      expect(formattedRange == "0-9").assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_refinedFormat_0180
     * @tc.name     : SUB_GLOBAL_refinedFormat_0180
     * @tc.desc     : begin code with negative ,stop code with decimal
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_refinedFormat_0180', 0, () => {
      let numFormat: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN");
      let formattedRange: string = numFormat.formatRange(-9, 9.9);
      expect(formattedRange == "-9 - 9.9").assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_refinedFormat_0190
     * @tc.name     : SUB_GLOBAL_refinedFormat_0190
     * @tc.desc     : begin code large than stop code
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_refinedFormat_0190', 0, () => {
      let numFormat: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN");
      let formattedRange: string = numFormat.formatRange(9, 0);
      expect(formattedRange == "").assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getTemperatureName_0100
     * @tc.name     : I18N_test_getTemperatureName_0100
     * @tc.desc     : i18n.TemperatureType.CELSIUS
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('I18N_test_getTemperatureName_0100', 0, () => {
      let type = i18n.System.getTemperatureName(i18n.TemperatureType.CELSIUS);
      console.log('I18N_test_getTemperatureName_0100:' + type);
      expect(type).assertEqual('celsius');
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getTemperatureName_0200
     * @tc.name     : I18N_test_getTemperatureName_0200
     * @tc.desc     : i18n.TemperatureType.FAHRENHEIT
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('I18N_test_getTemperatureName_0200', 0, () => {
      let type = i18n.System.getTemperatureName(i18n.TemperatureType.FAHRENHEIT);
      console.log('I18N_test_getTemperatureName_0200:' + type);
      expect(type).assertEqual('fahrenheit');
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getTemperatureName_0300
     * @tc.name     : I18N_test_getTemperatureName_0300
     * @tc.desc     : i18n.TemperatureType.KELVIN
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('I18N_test_getTemperatureName_0300', 0, () => {
      let type = i18n.System.getTemperatureName(i18n.TemperatureType.KELVIN);
      console.log('I18N_test_getTemperatureName_0300:' + type);
      expect(type).assertEqual('kelvin');
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getTemperatureName_0400
     * @tc.name     : I18N_test_getTemperatureName_0400
     * @tc.desc     : input number zero
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('I18N_test_getTemperatureName_0400', 0, () => {
      try {
        i18n.System.getTemperatureName(0);
      } catch (e) {
        console.log('I18N_test_getTemperatureName_0400 code&message:' + e.code + e.message);
        expect(e.code).assertEqual('890001');
      }
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0100
     * @tc.name     : I18N_test_getSimplifiedLanguage_01_0100
     * @tc.desc     : en-GB & en-Latn-US
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('I18N_test_getSimplifiedLanguage_01_0100', 0, () => {
      let type_one = i18n.System.getSimplifiedLanguage('en-GB');
      console.log('I18N_test_getSimplifiedLanguage_01_0100 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('en-Latn-US');
      console.log('I18N_test_getSimplifiedLanguage_01_0100 type_two:' + type_two);
      expect(type_one).assertEqual('en-GB');
      expect(type_two).assertEqual('en');
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0200
     * @tc.name     : I18N_test_getSimplifiedLanguage_01_0200
     * @tc.desc     : zh-Hant-HK & zh-Hant-TW
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('I18N_test_getSimplifiedLanguage_01_0200', 0, () => {
      let type_one = i18n.System.getSimplifiedLanguage('zh-Hant-HK');
      console.log('I18N_test_getSimplifiedLanguage_01_0200 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('zh-Hant-TW');
      console.log('I18N_test_getSimplifiedLanguage_01_0200 type_two:' + type_two);
      expect(type_one).assertEqual('zh-HK');
      expect(type_two).assertEqual('zh-TW');
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0300
     * @tc.name     : I18N_test_getSimplifiedLanguage_01_0300
     * @tc.desc     : es-ES & es-US
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('I18N_test_getSimplifiedLanguage_01_0300', 0, () => {
      let type_one = i18n.System.getSimplifiedLanguage('es-ES');
      console.log('I18N_test_getSimplifiedLanguage_01_0300 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('es-US');
      console.log('I18N_test_getSimplifiedLanguage_01_0300 type_two:' + type_two);
      expect(type_one).assertEqual('es');
      expect(type_two).assertEqual('es-US');
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0400
     * @tc.name     : I18N_test_getSimplifiedLanguage_01_0400
     * @tc.desc     : pt-PT & pt-BR
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('I18N_test_getSimplifiedLanguage_01_0400', 0, () => {
      let type_one = i18n.System.getSimplifiedLanguage('pt-PT');
      console.log('I18N_test_getSimplifiedLanguage_01_0400 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('pt-BR');
      console.log('I18N_test_getSimplifiedLanguage_01_0400 type_two:' + type_two);
      expect(type_one).assertEqual('pt-PT');
      expect(type_two).assertEqual('pt');
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0500
     * @tc.name     : I18N_test_getSimplifiedLanguage_01_0500
     * @tc.desc     : en-CN & en-Test
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('I18N_test_getSimplifiedLanguage_01_0500', 0, () => {
      let type_one = i18n.System.getSimplifiedLanguage('en-CN');
      console.log('I18N_test_getSimplifiedLanguage_01_0500 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('en-Test');
      console.log('I18N_test_getSimplifiedLanguage_01_0500 type_two:' + type_two);
      expect(type_one).assertEqual('en-CN');
      expect(type_two).assertEqual('en-Test');
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0600
     * @tc.name     : I18N_test_getSimplifiedLanguage_01_0600
     * @tc.desc     : zh-Hant-CN & zh-Hant-Test
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('I18N_test_getSimplifiedLanguage_01_0600', 0, () => {
      let type_one = i18n.System.getSimplifiedLanguage('zh-Hant-CN');
      console.log('I18N_test_getSimplifiedLanguage_01_0600 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('zh-Hant-Test');
      console.log('I18N_test_getSimplifiedLanguage_01_0600 type_two:' + type_two);
      expect(type_one).assertEqual('zh-Hant-CN');
      expect(type_two).assertEqual('zh');
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0700
     * @tc.name     : I18N_test_getSimplifiedLanguage_01_0700
     * @tc.desc     : es-CN & es-Test
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('I18N_test_getSimplifiedLanguage_01_0700', 0, () => {
      let type_one = i18n.System.getSimplifiedLanguage('es-CN');
      console.log('I18N_test_getSimplifiedLanguage_01_0700 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('es-Test');
      console.log('I18N_test_getSimplifiedLanguage_01_0700 type_two:' + type_two);
      expect(type_one).assertEqual('es-CN');
      expect(type_two).assertEqual('es-Test');
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0800
     * @tc.name     : I18N_test_getSimplifiedLanguage_01_0800
     * @tc.desc     : pt-CN & pt-Test
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('I18N_test_getSimplifiedLanguage_01_0800', 0, () => {
      let type_one = i18n.System.getSimplifiedLanguage('pt-CN');
      console.log('I18N_test_getSimplifiedLanguage_01_0800 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('pt-Test');
      console.log('I18N_test_getSimplifiedLanguage_01_0800 type_two:' + type_two);
      expect(type_one).assertEqual('pt-CN');
      expect(type_two).assertEqual('pt-Test');
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_01_0900
     * @tc.name     : I18N_test_getSimplifiedLanguage_01_0900
     * @tc.desc     : bo-CN & bo-Test & bo-Test
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('I18N_test_getSimplifiedLanguage_01_0900', 0, () => {
      let type_one = i18n.System.getSimplifiedLanguage('bo-CN');
      console.log('I18N_test_getSimplifiedLanguage_01_0900 type_one:' + type_one);
      let type_two = i18n.System.getSimplifiedLanguage('bo-US');
      console.log('I18N_test_getSimplifiedLanguage_01_0900 type_two:' + type_two);
      let type_three = i18n.System.getSimplifiedLanguage('bo-Test');
      console.log('I18N_test_getSimplifiedLanguage_01_0900 type_three:' + type_three);
      expect(type_one).assertEqual('bo');
      expect(type_two).assertEqual('bo-US');
      expect(type_three).assertEqual('bo-Test');
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getSimplifiedLanguage_01_1000
     * @tc.name     : I18N_test_getSimplifiedLanguage_01_1000
     * @tc.desc     : pt-CN & pt-Test
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('I18N_test_getSimplifiedLanguage_01_1000', 0, () => {
      try {
        i18n.System.getSimplifiedLanguage("0");
      } catch (e) {
        console.log('I18N_test_getSimplifiedLanguage_01_1000 code&message:' + e.code + e.message);
        expect(e.code).assertEqual('890001');
      }
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_StyledNumberFormat_02_00100
     * @tc.name     : SUB_GLOBAL_I18N_StyledNumberFormat_02_00100
     * @tc.desc     :fontColor &fontFamily & fontSize & fontWeight & fontStyle
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_StyledNumberFormat_02_00100', 0, () => {
      let integer_textStyle = new TextStyle({
        fontColor: Color.Red,
        fontFamily: "Arial",
        fontSize: LengthMetrics.vp(10),
        fontWeight: FontWeight.Lighter,
        fontStyle: FontStyle.Italic
      });
      let decimal_textStyle = new TextStyle({
        fontColor: Color.Black,
        fontFamily: "Arial",
        fontSize: LengthMetrics.vp(15),
        fontWeight: FontWeight.Normal,
        fontStyle: FontStyle.Normal
      });
      let fraction_textStyle = new TextStyle({
        fontColor: Color.Green,
        fontFamily: "Arial",
        fontSize: LengthMetrics.fp(20),
        fontWeight: FontWeight.Regular,
        fontStyle: FontStyle.Normal
      });
      let unit_textStyle = new TextStyle({
        fontColor: Color.Blue,
        fontFamily: "Arial",
        fontSize: LengthMetrics.fp(30),
        fontWeight: FontWeight.Medium,
        fontStyle: FontStyle.Italic
      });
      let number_format = new intl.NumberFormat('en-GB', {
        style: 'currency',
        currency: 'EUR',
        currencyDisplay: 'name',
        currencySign: 'accounting',
        signDisplay: 'always'
      });
      let styledNumberFormat = new i18n.StyledNumberFormat(number_format, {
        integer: integer_textStyle,
        decimal: decimal_textStyle,
        fraction: fraction_textStyle,
        unit: unit_textStyle
      });
      let result = styledNumberFormat.format(123456.789);
      console.log('testscw', result.getString());
      expect(result.getString() == "+123,456.79 euros").assertTrue();

      let arrList = result.getStyles(0, result.length);
      let testList: Array<string> = [];
      let resultList: Array<string> = ["#FFFF0000", "Arial", "10", "12", "1", "#FF000000", "Arial", "15", "10", "0",
        "#FF008000", "Arial", "20", "14", "0", "#FF0000FF", "Arial", "30", "13", "1"];
      for (const arr of arrList) {
        testList.push(arr.styledValue["fontColor"])
        testList.push(arr.styledValue["fontFamily"])
        testList.push(arr.styledValue["fontSize"])
        testList.push(arr.styledValue["fontWeight"])
        testList.push(arr.styledValue["fontStyle"])
      };
      console.log('testscw', testList.toString());
      expect(testList.toString() == resultList.toString()).assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_refinedFormat_0310
     * @tc.name     : SUB_GLOBAL_refinedFormat_0310
     * @tc.desc     : maximumFractionDigits: 2 & maximumSignificantDigits: 6 & roundingPriority: "lessPrecision"
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_refinedFormat_0310', 0, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, maximumSignificantDigits: 6, roundingPriority: "lessPrecision"
      };
      let numfmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numfmt.format(123.456);
      expect(numberFormatted == "123.46").assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_refinedFormat_0630
     * @tc.name     : SUB_GLOBAL_refinedFormat_0630
     * @tc.desc     : roundingMode: "halfExpand" & maximumSignificantDigits: 5
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_refinedFormat_0630', 0, () => {
      let numOptions: intl.NumberOptions = {
        roundingMode: "halfExpand", maximumSignificantDigits: 5
      };
      let numfmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numfmt.format(123.454);
      expect(numberFormatted == "123.45").assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_FilePathMirroring_0100
     * @tc.name     : SUB_GLOBAL_FilePathMirroring_0100
     * @tc.desc     : path /data/out/tmp & delimiter /
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_FilePathMirroring_0100', 0, () => {
      let path: string = "/data/out/tmp";
      let delimiter: string = "/";
      let locale: intl.Locale = new intl.Locale("ug");
      let mirrorPath: string = i18n.I18NUtil.getUnicodeWrappedFilePath(path, delimiter, locale);
      let flag = i18n.Unicode.isRTL(mirrorPath);
      expect(flag).assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_refinedFormat_0020
     * @tc.name     : SUB_GLOBAL_refinedFormat_0020
     * @tc.desc     : Date(2024, 11, 13, 6, 30, 25) & 'y'/'M'/'d' 'h':'m':'s'
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_refinedFormat_0020', 0, () => {
      let locale: intl.Locale = new intl.Locale("zh-Hans-CN");
      let date: Date = new Date(2024, 11, 13, 6, 30, 25);
      let formatter: i18n.SimpleDateTimeFormat = i18n.getSimpleDateTimeFormatByPattern("'time('y'/'M'/'d' 'h':'m':'s')'", locale);
      let dateFormatted: string = formatter.format(date);
      expect(dateFormatted == "time(2024/12/13 6:30:25)").assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_refinedFormat_0790
     * @tc.name     : SUB_GLOBAL_refinedFormat_0790
     * @tc.desc     : skeletonFormat (1230000) & getSimpleNumberFormatBySkeleton "engineering/sign-always"
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_refinedFormat_0790', 0, () => {
      let locale: intl.Locale = new intl.Locale("zh-Hans-CN");
      let skeletonFormat: i18n.SimpleNumberFormat = i18n.getSimpleNumberFormatBySkeleton("engineering/sign-always", locale);
      let numberFormatted: string = skeletonFormat.format(1230000);
      expect(numberFormatted == "1.23E+6").assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_refinedFormat_0320
     * @tc.name     : SUB_GLOBAL_refinedFormat_0320
     * @tc.desc     : maximumFractionDigits: 2 & roundingIncrement: 1
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_refinedFormat_0320', 0, () => {
      let numOptions: intl.NumberOptions = {
        maximumFractionDigits: 2, roundingIncrement: 1
      };
      let numfmt: intl.NumberFormat = new intl.NumberFormat("zh-hans-CN", numOptions);
      let numberFormatted: string = numfmt.format(123.456);
      expect(numberFormatted == "123.46").assertTrue();
    })

    console.log('*************end FivePointOne_i18nStageTest*************');
  })
}