@Entry
@Component
struct image_textcase {
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Column() {
        Text(`Image page`)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Image("/resources/rawfile/hand.png")
          .objectFit(ImageFit.Cover)
          .objectRepeat(ImageRepeat.NoRepeat)
          .interpolation(ImageInterpolation.None)
          .renderMode(ImageRenderMode.Original)
          .sourceSize({ width: 200, height: 100 })
          .alt("/resources/rawfile/person.png")
          .key('image1')
        Image("/resources/rawfile/hand.png")
          .objectFit(ImageFit.Contain)
          .objectRepeat(ImageRepeat.X)
          .interpolation(ImageInterpolation.High)
          .renderMode(ImageRenderMode.Template)
          .key('image2')
        Image("/resources/rawfile/hand.png")
          .objectFit(ImageFit.Fill)
          .objectRepeat(ImageRepeat.Y)
          .interpolation(ImageInterpolation.Low)
          .key('image3')
        Image("/resources/rawfile/hand.png")
          .objectFit(ImageFit.None)
          .objectRepeat(ImageRepeat.XY)
          .interpolation(ImageInterpolation.Medium)
          .key('image4')
        Image("/resources/rawfile/hand.png")
          .objectFit(ImageFit.ScaleDown)
          .key('image5')
      }.width(300)
      .height(300)
      .borderColor(Color.Pink)
      .borderWidth(4)
    }
  }
}


