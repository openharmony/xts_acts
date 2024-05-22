@Entry
@Component
struct Time_cancel {
  private selectTime: Date = new Date('2020-12-25T08:30:00')
  @State cancelButtonStyle_Text: string = '';
  @State Time_Options: TimePickerDialogOptions = {
    selected: this.selectTime,
    useMilitaryTime: true,
    disappearTextStyle: { color: Color.Red, font: { size: 15, weight: FontWeight.Lighter } },
    textStyle: { color: Color.Black, font: { size: 20, weight: FontWeight.Normal } },
    selectedTextStyle: { color: Color.Blue, font: { size: 30, weight: FontWeight.Bolder } },
    acceptButtonStyle: { type: ButtonType.Normal, style: ButtonStyleMode.NORMAL, role: ButtonRole.NORMAL, fontColor: Color.Red,
      fontSize: '26fp', fontWeight: FontWeight.Bolder, fontStyle: FontStyle.Normal, fontFamily: 'sans-serif', backgroundColor:'#80834511',
      borderRadius: 20 },
    cancelButtonStyle: { type: ButtonType.Normal, style: ButtonStyleMode.NORMAL, role: ButtonRole.NORMAL, fontColor: Color.Blue,
      fontSize: '16fp', fontWeight: FontWeight.Normal, fontStyle: FontStyle.Italic, fontFamily: 'sans-serif', backgroundColor:'#50182431',
      borderRadius: 10 },
  }

  build() {
    Column() {
      Text(this.cancelButtonStyle_Text)
        .id('cancelButtonStyle_Text')
        .margin(20)
      Button("TimePickerDialog 24小时制")
        .margin(20)
        .onClick(() => {
          TimePickerDialog.show(this.Time_Options)
          if (this.Time_Options.cancelButtonStyle.type == ButtonType.Circle) {
            this.cancelButtonStyle_Text = 'cancelButtonStyle_Text'
          }
        })
        .id('btn')
    }.width('100%')
  }
}