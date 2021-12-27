@Entry
@Component
struct qrcode_textcase {
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text(`Qrcode page`)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      QRCode('hello world')
        .color("#FFFFC0CB")
        .width("200")
        .height("100")
        .key('qrcode')
    }
  }
}


