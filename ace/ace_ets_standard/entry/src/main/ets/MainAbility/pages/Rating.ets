@Entry
@Component
struct rating_testcase {
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Column() {
        Text(`Rating page`)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Rating({ rating: 2, indicator: false })
          .stepSize(0.5)
          .stars(5)
          .starStyle({
            backgroundUri: '/resources/rawfile/star-1-1.png',
            foregroundUri: '/resources/rawfile/star-1-3.png',
            secondaryUri: '/resources/rawfile/star-1-2.png'
          })
          .key('rating1')
        Rating({ rating: 2, indicator: true })
          .stepSize(0.5)
          .stars(5)
          .starStyle({
            backgroundUri: '/resources/rawfile/star-1-1.png',
            foregroundUri: '/resources/rawfile/star-1-3.png',
            secondaryUri: '/resources/rawfile/star-1-2.png'
          })
          .key('rating2')
      }.width(300)
      .height(300)
      .borderColor(Color.Pink)
      .borderWidth(2)
    }
  }
}

