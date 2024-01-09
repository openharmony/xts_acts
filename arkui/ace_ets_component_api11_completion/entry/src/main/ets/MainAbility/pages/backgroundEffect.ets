// xxx.ets
@Entry
@Component
struct BackgroundExample {
  @State grayscale2 :number[] =[3,56]
  @Builder renderBackground() {
    Column() {
      Progress({value : 50})
    }
  }

  build() {
    Column() {
      Text("content")
        .width(100)
        .height(40)
        .fontColor("#FFF")
        .key("texteffrct")
        .position({x:50, y:80})
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Green)
        .backgroundEffect({
          radius : 5,
          saturation : 50,
          brightness : 100,
          color :Color.Green,
          adaptiveColor : AdaptiveColor.DEFAULT,
          blurOptions : {
            grayscale: [3, 65]
          }
        })
    }
    .width(200).height(200)
    .background(this.renderBackground)
    .backgroundColor(Color.Gray)

  }
}