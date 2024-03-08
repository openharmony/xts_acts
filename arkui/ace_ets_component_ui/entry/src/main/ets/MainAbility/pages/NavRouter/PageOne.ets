class TmpClass{
  count:number=10
}
@Component
export struct PageOneTmp {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @State text1: string = ''

  build() {
    NavDestination() {
      Column() {
        // Button('pop', { stateEffect: true, type: ButtonType.Capsule })
        //   .width('80%')
        //   .height(40)
        //   .margin(20)
        //   .onClick(() => {
        //     this.pageInfos.pop()
        //   })
      }.width('100%').height('100%')
    }.title('pageOne')
    .onBackPressed(() => {
      this.pageInfos.pop({number: 1})
      return true
    })
  }
}