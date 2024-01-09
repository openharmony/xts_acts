@Entry
@Component
struct ColoringStrategyPRIMARY {
  build() {
    Column({ space: 100 }) {
      Text('ColoringStrategy.PRIMARY').key('ColorPRIMARY')
      // 绘制一个直径为150的圆,默认填充色为黑色
      Circle({ width: 150, height: 200 })
      // 绘制一个直径为150的圆，设置前景色为组件背景色的反色
      Circle({ width: 150, height: 200 })
        .backgroundColor(Color.Black)
        .foregroundColor(ColoringStrategy.PRIMARY)
    }.width('100%')
  }
}