// xxx.ets
@Entry
@Component
struct FlexSpaceMainNumber {
  build() {
    Column() {
      Column({ space: 5 }) {
        Text('main：number=10').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ wrap: FlexWrap.Wrap, space:{ main: {value:10, unit:0}} }) { // 子组件多行布局
          Text('1').width('50%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('50%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('50%').height(50).backgroundColor(0xD2B48C)
        }
        .id("flex_main_number_1")
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text('main：number=0').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ wrap: FlexWrap.Wrap, space:{ main: {value:0, unit:1} }}) { // 子组件多行布局
          Text('1').width('50%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('50%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('50%').height(50).backgroundColor(0xD2B48C)
        }
        .id("flex_main_number_2")
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text('main：number=-10').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ wrap: FlexWrap.Wrap, space:{ main: {value:-10, unit:0} }}) { // 子组件多行布局
          Text('1').width('50%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('50%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('50%').height(50).backgroundColor(0xD2B48C)
        }
        .id("flex_main_number_3")
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text('main：number=undefined').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ wrap: FlexWrap.Wrap, space:{ main: undefined }}) { // 子组件多行布局
          Text('1').width('50%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('50%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('50%').height(50).backgroundColor(0xD2B48C)
        }
        .id("flex_main_number_4")
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text('main：number=3276789').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ wrap: FlexWrap.Wrap, space:{ main: {value:3276789, unit:0}}}) { // 子组件多行布局
          Text('1').width('50%').height(50).backgroundColor(0xF5DEB3)
          Text('2').width('50%').height(50).backgroundColor(0xD2B48C)
          Text('3').width('50%').height(50).backgroundColor(0xD2B48C)
        }
        .id("flex_main_number_5")
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)
      }.width('100%').margin({ top: 5 })
    }.width('100%')
  }
}