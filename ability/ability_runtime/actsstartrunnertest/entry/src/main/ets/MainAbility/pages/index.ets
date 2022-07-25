import router from '@system.router';
import file from '@system.file';
@Entry
@Component
struct Index {
  aboutToAppear() {
    console.info('MainAbility index aboutToAppear')
  }

  @State message: string = 'MainAbility'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('next page')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }.type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('35%')
        .height('5%')
        .onClick(()=>{
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}