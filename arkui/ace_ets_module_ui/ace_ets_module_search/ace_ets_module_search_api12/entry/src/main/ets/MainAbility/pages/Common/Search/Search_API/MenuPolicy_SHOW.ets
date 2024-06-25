@Entry
@Component
struct MenuPolicy_SHOW {
  @State changeValue: string = ''
  @State MenuPolicyStatus: string = ''
  @State submitValue: string = ''
  @State positionInfo: CaretOffset = { index: 0, x: 0, y: 0 }
  controller: SearchController = new SearchController()

  build() {
    Column({space: 10}) {
      Text(this.MenuPolicyStatus)
        .id('MenuPolicy_SHOW')
      Search({ value: this.changeValue, placeholder: 'Type to search...', controller: this.controller })
        .searchButton('SEARCH')
        .width('95%')
        .height(40)
        .backgroundColor('#F5F5F5')
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .textFont({ size: 14, weight: 400 })
        .onSubmit((value: string) => {
          this.submitValue = value
        })
        .onChange((value: string) => {
          this.changeValue = value
          this.MenuPolicyStatus = "SHOW"
        })
        .margin(20)
        .id('Search')
      Button('Hide Selected Text')
        .onClick(() => {
          this.controller.setTextSelection(2, 3, { menuPolicy: MenuPolicy.SHOW })
        }).id('btn')
    }.width('100%')
  }
}