@Entry
@Component
struct RepeatParent {
  @State simpleList: Array<string> = ['one', 'two', 'three'];

  build() {
    Row() {
      Column() {
        Text('message: '+ this.simpleList[2] ).id('mess_repeat')
          .margin(10)

        Text('点击修改第3个数组项的值').id('repeat_modify')
          .fontSize(24)
          .fontColor(Color.Red)
          .onClick(() => {
            this.simpleList[2] = 'new three';
          })

        Repeat<string>(this.simpleList)
          .each((obj: RepeatItem<string>)=>{
            ChildItem({ item: obj.item })
              .margin({top: 20})
          })
          .key((item: string) => item)
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height('100%')
    }
    .height('100%')
    .backgroundColor(0xF1F3F5)
  }
}

@Component
struct ChildItem {
  @Prop item: string;

  build() {
    Text(this.item)
      .fontSize(30)
  }
}