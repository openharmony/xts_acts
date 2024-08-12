import { DownloadDescription, DownloadFileButton, DownloadIconStyle, DownloadLayoutDirection } from '@kit.ArkUI'

@Entry
@Component
struct Index13 {
  build() {
    Column() {
      this.test13()
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  test13(){
    DownloadFileButton({
      contentOptions: {
        icon: DownloadIconStyle.FULL_FILLED,
        text: DownloadDescription.CONTINUE_TO_RECEIVE
      },
      styleOptions: {
        iconSize: '16vp',
        layoutDirection: DownloadLayoutDirection.HORIZONTAL,
        fontSize: '16vp',
        fontStyle: FontStyle.Normal,
        fontWeight: FontWeight.Medium,
        fontFamily: 'HarmonyOS Sans',
        fontColor: '#ffffffff',
        iconColor: '#ffffffff',
        textIconSpace: '4vp'
      }
    })
      .backgroundColor('#007dff')
      .borderStyle(BorderStyle.Dotted)
      .borderWidth(0)
      .borderColor('')
      .borderRadius('24vp')
      .position({ x: 0, y: 0 })
      .markAnchor({ x: 0, y: 0 })
      .offset({ x: 0, y: 0 })
      .constraintSize({})
      .padding({
        top: '12vp',
        bottom: '12vp',
        left: '24vp',
        right: '24vp'
      })
      .onClick(() => {
      })
  }
}