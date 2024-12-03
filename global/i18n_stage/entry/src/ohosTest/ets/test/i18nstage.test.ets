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

import Ability from '@ohos.app.ability.UIAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import I18n from '@ohos.i18n'

export default function i18nStageTest() {
  describe("i18nStageTest", () => {
    console.log('*************start i18nStageTest*************');

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

    //11月27号编写
    /**
     * @tc.number   : SUB_GLOBAL_I18N_getTimeInMillis_0100
     * @tc.name     : SUB_GLOBAL_I18N_SR000IFGMS_0100
     * @tc.desc     : hour=[21,5],local="en-US",at night
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_SR000IFGMS_0100', 0, () => {
      let value = I18n.I18NUtil.getTimePeriodName(5, "en-US");
      console.log('SUB_GLOBAL_I18N_SR000IFGMS_0100:' + value);
      expect(value == "at night").assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getTimeInMillis_0200
     * @tc.name     : SUB_GLOBAL_I18N_SR000IFGMS_0200
     * @tc.desc     : hour=[6,11],local="en-US",in the morning
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_SR000IFGMS_0200', 0, () => {
      let value = I18n.I18NUtil.getTimePeriodName(11, "en-US");
      console.log('SUB_GLOBAL_I18N_SR000IFGMS_0200:' + value);
      expect(value == "in the morning").assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getTimeInMillis_0300
     * @tc.name     : SUB_GLOBAL_I18N_SR000IFGMS_0300
     * @tc.desc     : hour=12,local="en-US",noon
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_SR000IFGMS_0300', 0, () => {
      let value = I18n.I18NUtil.getTimePeriodName(12, "en-US");
      console.log('SUB_GLOBAL_I18N_SR000IFGMS_0300:' + value);
      expect(value == "noon").assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getTimeInMillis_0400
     * @tc.name     : SUB_GLOBAL_I18N_SR000IFGMS_0400
     * @tc.desc     : hour=[13,17],local="en-US",in the afternoon
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_SR000IFGMS_0400', 0, () => {
      let value = I18n.I18NUtil.getTimePeriodName(41, "en-US"); //41%24=17
      console.log('SUB_GLOBAL_I18N_SR000IFGMS_0400:' + value);
      expect(value == "in the afternoon").assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getTimeInMillis_0500
     * @tc.name     : SUB_GLOBAL_I18N_SR000IFGMS_0500
     * @tc.desc     : hour=[18,20],local="en-US",in the evening
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_SR000IFGMS_0500', 0, () => {
      let value = I18n.I18NUtil.getTimePeriodName(-4, "en-US"); //24+(-4)=20
      console.log('SUB_GLOBAL_I18N_SR000IFGMS_0500:' + value);
      expect(value == "in the evening").assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getTimeInMillis_0600
     * @tc.name     : SUB_GLOBAL_I18N_SR000IFGMS_0600
     * @tc.desc     : hour=12,local=""
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_SR000IFGMS_0600', 0, () => {
      try {
        let value = I18n.I18NUtil.getTimePeriodName(12, "");
        console.log('SUB_GLOBAL_I18N_SR000IFGMS_0600:' + value);
      } catch (e) {
        console.log('SUB_GLOBAL_I18N_SR000IFGMS_0600 code&message:' + e.code + e.message);
        expect(e.code == 890001).assertTrue();
      }
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getTimeInMillis_0700
     * @tc.name     : SUB_GLOBAL_I18N_SR000IFGMS_0700
     * @tc.desc     : hour=12,local=invalid string
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_SR000IFGMS_0700', 0, () => {
      try {
        let value = I18n.I18NUtil.getTimePeriodName(12, "abcd");
        console.log('SUB_GLOBAL_I18N_SR000IFGMS_0700:' + value);
      } catch (e) {
        console.log('SUB_GLOBAL_I18N_SR000IFGMS_0700 code&message:' + e.code + e.message);
        expect(e.code == 890001).assertTrue();
      }
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_HolidayManager_0010
     * @tc.name     : SUB_GLOBAL_I18N_SR000IFGNH_0010
     * @tc.desc     : HolidayManager-input .ics file
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_SR000IFGNH_0010', 0, () => {
      try {
        let holidayManager = new I18n.HolidayManager("/system/lib/TR.ics");
        console.log('SUB_GLOBAL_I18N_SR000IFGNH_0010:' + holidayManager);
      } catch (e) {
        console.log('SUB_GLOBAL_I18N_SR000IFGNH_0010 code&message:' + e.code + e.message);
        expect(e.code == null).assertTrue();
      }
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_HolidayManager_0020
     * @tc.name     : SUB_GLOBAL_I18N_SR000IFGNH_0020
     * @tc.desc     : HolidayManager-input .xml file
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_SR000IFGNH_0020', 0, () => {
      try {
        let holidayManager = new I18n.HolidayManager("A.xml");
        console.log('SUB_GLOBAL_I18N_SR000IFGNH_0020:' + holidayManager);
      } catch (e) {
        console.log('SUB_GLOBAL_I18N_SR000IFGNH_0020 code&message:' + e.code + e.message);
        expect(e.code == '890001').assertTrue();
      }
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_isHoliday_0030
     * @tc.name     : SUB_GLOBAL_I18N_SR000IFGNH_0030
     * @tc.desc     : isHoliday-input null(The current date is used by default)
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_SR000IFGNH_0030', 0, () => {
      let holidayManager = new I18n.HolidayManager("/system/lib/TR.ics");
      let isHoliday = holidayManager.isHoliday();
      console.log('SUB_GLOBAL_I18N_SR000IFGNH_0030:' + isHoliday);
      expect(isHoliday == false).assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_isHoliday_0050
     * @tc.name     : SUB_GLOBAL_I18N_SR000IFGNH_0050
     * @tc.desc     : isHoliday-input correct date (is not holiday) parameter
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_SR000IFGNH_0050', 0, () => {
      let holidayManager = new I18n.HolidayManager("/system/lib/TR.ics");
      let isHoliday = holidayManager.isHoliday(new Date(2020, 6, 25));
      console.log('SUB_GLOBAL_I18N_SR000IFGNH_0050:' + isHoliday);
      expect(isHoliday == false).assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getHolidayInfoItemArray_0070
     * @tc.name     : SUB_GLOBAL_I18N_SR000IFGNH_0070
     * @tc.desc     : getHolidayInfoItemArray-input null(The current year is used by default)
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_SR000IFGNH_0070', 0, () => {
      let holidayManager = new I18n.HolidayManager("/system/lib/TR.ics");
      let holidayInfoItemArray = holidayManager.getHolidayInfoItemArray();
      console.log('SUB_GLOBAL_I18N_SR000IFGNH_0070:' + holidayInfoItemArray);
      expect(holidayInfoItemArray != null).assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getHolidayInfoItemArray_0080
     * @tc.name     : SUB_GLOBAL_I18N_SR000IFGNH_0080
     * @tc.desc     : getHolidayInfoItemArray-input correct year parameter (contain holidays)
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_SR000IFGNH_0080', 0, () => {
      let holidayManager = new I18n.HolidayManager("/system/lib/TR.ics");
      let holidayInfoItemArray = holidayManager.getHolidayInfoItemArray(2023);
      console.log('SUB_GLOBAL_I18N_SR000IFGNH_0080:' + holidayInfoItemArray);
      expect(holidayInfoItemArray != null).assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getHolidayInfoItemArray_0090
     * @tc.name     : SUB_GLOBAL_I18N_SR000IFGNH_0090
     * @tc.desc     : getHolidayInfoItemArray-input correct number parameter (don't contain holidays)
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_SR000IFGNH_0090', 0, () => {
      let holidayManager = new I18n.HolidayManager("/system/lib/TR.ics");
      let holidayInfoItemArray = holidayManager.getHolidayInfoItemArray(2022);
      console.log('SUB_GLOBAL_I18N_SR000IFGNH_0090:' + holidayInfoItemArray);
      expect(holidayInfoItemArray.length == 0).assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_add_0100
     * @tc.name     : SUB_GLOBAL_I18N_SR000IET4P_0100
     * @tc.desc     : add - amount >= 0
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_SR000IET4P_0100', 0, () => {
      let calendar: I18n.Calendar = I18n.getCalendar("zh-Hans");
      calendar.set(2023, 9, 22, 18, 0, 0); //set time to 2023.9.22 18:00:00
      calendar.add("year", 2); //2023+2
      let year: number = calendar.get("year"); //year = 2025
      console.log('SUB_GLOBAL_I18N_SR000IET4P_0100:' + year);
      expect(year == 2025).assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_add_0200
     * @tc.name     : SUB_GLOBAL_I18N_SR000IET4P_0200
     * @tc.desc     : add - amount parameter input 'week_of_year'
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_SR000IET4P_0200', 0, () => {
      let calendar: I18n.Calendar = I18n.getCalendar("zh-Hans");
      calendar.set(2023, 9, 22, 18, 0, 0); //set time to 2023.9.22 18:00:00
      calendar.add("week_of_year", 2); //add 2 weeks
      let month: number = calendar.get("month"); //month = 10
      let date: number = calendar.get("date");
      console.log('SUB_GLOBAL_I18N_SR000IET4P_0200_month:' + month);
      console.log('SUB_GLOBAL_I18N_SR000IET4P_0200_date:' + date);
      expect(month == 10 && date == 5).assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_add_0300
     * @tc.name     : SUB_GLOBAL_I18N_SR000IET4P_0300
     * @tc.desc     : add - amount < 0
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_SR000IET4P_0300', 0, () => {
      let calendar: I18n.Calendar = I18n.getCalendar("zh-Hans");
      calendar.set(2023, 9, 22, 18, 0, 0); //set time to 2023.9.22 18:00:00
      calendar.add("year", -1); //2023-2
      let year: number = calendar.get("year"); //year = 2022
      console.log('SUB_GLOBAL_I18N_SR000IET4P_0300:' + year);
      expect(year == 2022).assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_add_0600
     * @tc.name     : SUB_GLOBAL_I18N_SR000IET4P_0600
     * @tc.desc     : add - filed parameter input invalid parameter
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_SR000IET4P_0600', 0, () => {
      try {
        let calendar: I18n.Calendar = I18n.getCalendar("zh-Hans");
        calendar.set(2023, 9, 22, 18, 0, 0); //set time to 2023.9.22 18:00:00
        calendar.add("test", 2);
        let year: number = calendar.get("year"); //year = 2022
        console.log('SUB_GLOBAL_I18N_SR000IET4P_0600:' + year);
      } catch (e) {
        console.log('SUB_GLOBAL_I18N_SR000IET4P_0600 code&message:' + e.code + e.message);
        expect(e.code == '890001').assertTrue();
      }
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_getTimeInMillis_0700
     * @tc.name     : SUB_GLOBAL_I18N_SR000IET4P_0700
     * @tc.desc     : add - filed parameter input invalid parameter
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_SR000IET4P_0700', 0, () => {
      let calendar: I18n.Calendar = I18n.getCalendar("zh-Hans");
      calendar.setTime(5000);
      let millisecond: number = calendar.getTimeInMillis(); //millisecond = 5000
      console.log('SUB_GLOBAL_I18N_SR000IET4P_0700:' + millisecond);
      expect(millisecond == 5000).assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_compareDays_0100
     * @tc.name     : SUB_GLOBAL_I18N_CompareDays_0100
     * @tc.desc     : CompareDays - Compare the Date
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_CompareDays_0100', 0, () => {
      let calendar: I18n.Calendar = I18n.getCalendar("zh-Hans");
      calendar.set(2023, 9, 22, 18, 0, 0); //set time to 2023.9.22 18:00:00
      let date: Date = new Date(2023, 9, 23, 19, 0, 0);
      let diff: number = calendar.compareDays(date);
      console.log('SUB_GLOBAL_I18N_CompareDays_0100:' + diff);
      expect(diff == 2).assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_compareDays_0200
     * @tc.name     : SUB_GLOBAL_I18N_CompareDays_0200
     * @tc.desc     : CompareDays - Compare the Date
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_CompareDays_0200', 0, () => {
      let calendar: I18n.Calendar = I18n.getCalendar("zh-Hans");
      calendar.set(2023, 9, 22, 18, 0, 0); //set time to 2023.9.22 18:00:00
      let date: Date = new Date(2023, 9, 20, 13, 0, 0);
      let diff: number = calendar.compareDays(date);
      console.log('SUB_GLOBAL_I18N_CompareDays_0200:' + diff);
      expect(diff == -3).assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_compareDays_0300
     * @tc.name     : SUB_GLOBAL_I18N_CompareDays_0300
     * @tc.desc     : CompareDays - Compare the Date
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_CompareDays_0300', 0, () => {
      let calendar: I18n.Calendar = I18n.getCalendar("zh-Hans");
      calendar.setTime(5000);
      let date: Date = new Date(6000);
      let diff: number = calendar.compareDays(date);
      console.log('SUB_GLOBAL_I18N_CompareDays_0300:' + diff);
      expect(diff == 1).assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_EntityRecognizer_0100
     * @tc.name     : SUB_GLOBAL_I18N_EntityRecognizer_0100
     * @tc.desc     : findEntityInfo - Identifying Entity Information in Text
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_0100', 0, () => {
      let entityRecognizer: I18n.EntityRecognizer = new I18n.EntityRecognizer("zh-CN");
      let text: string = "如有疑问，请联系13801048417";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0100 type:' + result[0].type);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0100 begin:' + result[0].begin);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0100 end:' + result[0].end);
      expect(result[0].type == "phone_number").assertTrue();
      expect(result[0].begin == 8).assertTrue();
      expect(result[0].end == 19).assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_EntityRecognizer_0200
     * @tc.name     : SUB_GLOBAL_I18N_EntityRecognizer_0200
     * @tc.desc     : findEntityInfo - Identifying Entity Information in Text
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_0200', 0, () => {
      let entityRecognizer: I18n.EntityRecognizer = new I18n.EntityRecognizer("zh-CN");
      let text: string = "如有疑问，请联系010 1234 5678";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0200 type:' + result[0].type);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0200 begin:' + result[0].begin);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0200 end:' + result[0].end);
      expect(result[0].type == "phone_number").assertTrue();
      expect(result[0].begin == 8).assertTrue();
      expect(result[0].end == 21).assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_EntityRecognizer_0400
     * @tc.name     : SUB_GLOBAL_I18N_EntityRecognizer_0400
     * @tc.desc     : findEntityInfo - no recognizable entity information in Text
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_0400', 0, () => {
      let entityRecognizer: I18n.EntityRecognizer = new I18n.EntityRecognizer("zh-CN");
      let text: string = "如有疑问，请联系我";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0400:' + result);
      expect(result.length == 0).assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_EntityRecognizer_0600
     * @tc.name     : SUB_GLOBAL_I18N_EntityRecognizer_0600
     * @tc.desc     : findEntityInfo - Identifying Entity Information in Text
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_0600', 0, () => {
      let entityRecognizer: I18n.EntityRecognizer = new I18n.EntityRecognizer("en-GB");
      let text: string = "If you have any questions, Please call 13801048417";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0600 type:' + result[0].type);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0600 begin:' + result[0].begin);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0600 end:' + result[0].end);
      expect(result[0].type == "phone_number").assertTrue();
      expect(result[0].begin == 39).assertTrue();
      expect(result[0].end == 50).assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_EntityRecognizer_0800
     * @tc.name     : SUB_GLOBAL_I18N_EntityRecognizer_0800
     * @tc.desc     : findEntityInfo - Identifying Entity Date Information in Text(Chinese)
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_0800', 0, () => {
      let entityRecognizer: I18n.EntityRecognizer = new I18n.EntityRecognizer("zh-CN");
      let text: string = "我们2023年12月1日下午8点一起吃饭吧。";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0800 type:' + result[0].type);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0800 begin:' + result[0].begin);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0800 end:' + result[0].end);
      expect(result[0].type == "date").assertTrue();
      expect(result[0].begin == 2).assertTrue();
      expect(result[0].end == 16).assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_EntityRecognizer_0900
     * @tc.name     : SUB_GLOBAL_I18N_EntityRecognizer_0900
     * @tc.desc     : findEntityInfo - Identifying Entity Date Information in Text(Chinese)
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_0900', 0, () => {
      let entityRecognizer: I18n.EntityRecognizer = new I18n.EntityRecognizer("zh-CN");
      let text: string = "今天下午3点到5点有个会议。";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0900 type:' + result[0].type);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0900 begin:' + result[0].begin);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_0900 end:' + result[0].end);
      expect(result[0].type == "date").assertTrue();
      expect(result[0].begin == 0).assertTrue();
      expect(result[0].end == 9).assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_EntityRecognizer_1000
     * @tc.name     : SUB_GLOBAL_I18N_EntityRecognizer_1000
     * @tc.desc     : findEntityInfo - Identifying Entity Date Information in Text(English)
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_1000', 0, () => {
      let entityRecognizer: I18n.EntityRecognizer = new I18n.EntityRecognizer("en-GB");
      let text: string = "Let's have dinner in December 1, 2023.";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_1000:' + result);
      expect([result[0].type, result[1].type].indexOf("date") != -1).assertTrue();
      expect([result[0].begin, result[1].begin].indexOf(21) != -1).assertTrue();
      expect([result[0].end, result[1].end].indexOf(37) != -1).assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_EntityRecognizer_1100
     * @tc.name     : SUB_GLOBAL_I18N_EntityRecognizer_1100
     * @tc.desc     : findEntityInfo - Identifying Entity Date Information in Text(English)
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_EntityRecognizer_1100', 0, () => {
      let entityRecognizer: I18n.EntityRecognizer = new I18n.EntityRecognizer("en-GB");
      let text: string = "The time is 11/10/2023-11/13/2023.";
      let result = entityRecognizer.findEntityInfo(text);
      console.log('SUB_GLOBAL_I18N_EntityRecognizer_1100:' + result);
      expect(result[1].type == "date").assertTrue();
      expect(result[1].begin == 12).assertTrue();
      expect(result[1].end == 34).assertTrue();
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_AppPreferredLanguage_0100
     * @tc.name     : SUB_GLOBAL_I18N_AppPreferredLanguage_0100
     * @tc.desc     : setAppPreferredLanguage - Set App Preferred Language
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_AppPreferredLanguage_0100', 0, () => {
      try {
        I18n.System.setAppPreferredLanguage('zh'); //设置应用偏好语言
      } catch (e) {
        console.log('SUB_GLOBAL_I18N_AppPreferredLanguage_0100 code&message:' + e.code + e.message);
        expect(e.code).assertNull();
      }
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_AppPreferredLanguage_0200
     * @tc.name     : SUB_GLOBAL_I18N_AppPreferredLanguage_0200
     * @tc.desc     : setAppPreferredLanguage - Set App Preferred Language to invalid language
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_AppPreferredLanguage_0200', 0, () => {
      try {
        I18n.System.setAppPreferredLanguage('1'); //设置应用偏好语言
      } catch (e) {
        console.log('SUB_GLOBAL_I18N_AppPreferredLanguage_0200 code&message:' + e.code + e.message);
        expect(e.code == 890001).assertTrue();
      }
    })

    /**
     * @tc.number   : SUB_GLOBAL_I18N_AppPreferredLanguage_0400
     * @tc.name     : SUB_GLOBAL_I18N_AppPreferredLanguage_0400
     * @tc.desc     : setAppPreferredLanguage - Set App Preferred Language to zh-CN
     * @tc.size     : MEDIUM
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('SUB_GLOBAL_I18N_AppPreferredLanguage_0400', 0, () => {
      I18n.System.setAppPreferredLanguage('zh-CN'); //设置应用偏好语言'zh-CN'
      let appPreferredLanguage: string = I18n.System.getAppPreferredLanguage();
      console.log('SUB_GLOBAL_I18N_AppPreferredLanguage_0400:' + appPreferredLanguage);
      expect(appPreferredLanguage == 'zh-CN').assertTrue();
    })

    console.log('*************end i18nStageTest*************');
  })
}