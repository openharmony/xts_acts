// xxx.ets
@Entry
@Component
struct DatePickerDialogExample {
  selectedDate: Date = new Date("2010-1-1")
  @State AppearText: string = ''

  build() {
    Row() {
      Column() {
        Text(this.AppearText)
          .fontSize(20)
          .margin(10)
          .id('AppearText')
        Button("DatePickerDialog")
          .id('DatePickerDialog')
          .margin(20)
          .onClick(() => {
            DatePickerDialog.show({
              start: new Date("2000-1-1"),
              end: new Date("2100-12-31"),
              selected: this.selectedDate,
              showTime:true,
              useMilitaryTime:false,
              disappearTextStyle: {color: Color.Pink, font: {size: '22fp', weight: FontWeight.Bold}},
              textStyle: {color: '#ff00ff00', font: {size: '18fp', weight: FontWeight.Normal}},
              selectedTextStyle: {color: '#ff182431', font: {size: '14fp', weight: FontWeight.Regular}},
              onDateAccept: (value: Date) => {
                // 通过Date的setFullYear方法设置按下确定按钮时的日期，这样当弹窗再次弹出时显示选中的是上一次确定的日期
                this.selectedDate = value
                console.info("DatePickerDialog:onDateAccept()" + value.toString())
              },
              onCancel: () => {
                console.info("DatePickerDialog:onCancel()")
              },
              onDateChange: (value: Date) => {
                console.info("DatePickerDialog:onDateChange()" + value.toString())
              },
              onDidAppear: () => {
                this.AppearText = this.AppearText + "onDidAppear_"
              },
              onDidDisappear: () => {
                this.AppearText = this.AppearText + "onDidDisappear"
              },
              onWillAppear: () => {
                this.AppearText = this.AppearText + "onWillAppear_"
              },
              onWillDisappear: () => {
                this.AppearText = this.AppearText + "onWillDisappear_"
              }
            })
          })
      }.width('100%')
    }.height('100%').id('row')
  }
}