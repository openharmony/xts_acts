@Entry
@Component
struct calendar {
  @State curMonth: MonthData = { year: 0, month: 0, data: [] };
  @State preMonth: MonthData = { year: 0, month: 0, data: [] };
  @State nextMonth: MonthData = { year: 0, month: 0, data: [] }
  @State year: number = 0
  @State month: number = 0
  Controller: CalendarController = new CalendarController();
  private lunarMonthDays: string[] = [
    '初一', '初二', '初三', '初四', '初五', '初六', '初七', '初八', '初九', '初十',
    '十一', '十二', '十三', '十四', '十五', '十六', '十七', '十八', '十九', '二十',
    '廿一', '廿二', '廿三', '廿四', '廿五', '廿六', '廿七', '廿八', '廿九', '三十']
  private lunarMonthNames: string[] = ['正月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '冬月', '腊月']

  build() {

    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Start
    }) {

      Row() {
        Text(`${this.year} 年 ${this.month + 1} 月`)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }

      Calendar({
        date: { year: 2021, month: 8, day: 35 },
        currentData: this.curMonth,
        preData: this.preMonth,
        nextData: this.nextMonth,
        controller: this.Controller

      })
        .showHoliday(true)
        .needSlide(true)
        .offDays(Week.Tue | Week.Wed)
        .startOfWeek(Week.Sun)
        .currentDayStyle({
          dayColor: Color.Black,
          lunarColor: Color.Gray,
          dayFontSize: 15,
          lunarDayFontSize: 10,
          boundaryColOffset: 10

        })
        .nonCurrentDayStyle({
          nonCurrentMonthDayColor: Color.Black,
          nonCurrentMonthLunarColor: Color.Gray

        })
        .todayStyle({
          focusedDayColor: Color.Red,
          focusedLunarColor: Color.Orange,
          focusedAreaBackgroundColor: Color.Blue,
          focusedAreaRadius: 20

        })
        .onRequestData((request) => {
          switch (request.monthState) {
            case 0:
              this.year = request.currentYear;
              this.month = request.currentMonth;
              this.curMonth.year = request.year;
              this.curMonth.month = request.month;
              this.curMonth.data = [];
              for (var i = 0; i < 35; ++i) {
                this.curMonth.data.push({
                  index: i,
                  lunarMonth: this.lunarMonthNames[i%12],
                  lunarDay: this.lunarMonthDays[i % 30],
                  dayMark: "work",
                  dayMarkValue: "",
                  year: request.year;
                  month: request.month;
                  day: i + 1;
                  isFirstOfLunar: false,
                  hasSchedule: false,
                  markLunarDay: false
                });

                if (i % 7 == 0 || i % 7 == 6) {
                  this.curMonth.data[i].dayMarkValue = "休"
                }
              }
              break;
            case 1:
              this.year = request.currentYear;
              this.month = request.currentMonth;
              this.preMonth.year = request.year;
              this.preMonth.month = request.month
              this.preMonth.data = [];
              for (var i = 0; i < 35; ++i) {
                this.preMonth.data.push({
                  index: i,
                  lunarMonth: this.lunarMonthNames[i%12],
                  lunarDay: this.lunarMonthDays[i % 30],
                  dayMark: "work",
                  dayMarkValue: "",
                  year: request.year,
                  month: request.month,
                  day: i + 1,
                  isFirstOfLunar: false,
                  hasSchedule: false,
                  markLunarDay: false
                });
                if (i % 7 == 0 || i % 7 == 6) {
                  this.preMonth.data[i].dayMarkValue = "休"
                }
              }
              break;
            case 2:
              this.year = request.currentYear;
              this.month = request.currentMonth;
              this.nextMonth.year = request.year;
              this.nextMonth.month = request.month;
              this.nextMonth.data = [];
              for (var i = 0; i < 35; ++i) {
                this.nextMonth.data.push({
                  index: i,
                  lunarMonth: this.lunarMonthNames[i%12],
                  lunarDay: this.lunarMonthDays[i % 30],
                  dayMark: "work",
                  dayMarkValue: "",
                  year: request.year,
                  month: request.month,
                  day: i + 1,
                  isFirstOfLunar: false,
                  hasSchedule: false,
                  markLunarDay: false
                });
                if (i % 7 == 0 || i % 7 == 6) {
                  this.nextMonth.data[i].dayMarkValue = "休"
                }
              }
              break;
          }
        })
    }.margin({ bottom: 10, right: 20, left: 20, top: 0 })
    .height("50%")


  }
}