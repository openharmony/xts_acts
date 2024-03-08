import { PageOneTmp } from './PageOne'
@Entry
@Component
struct NavDestination_onBackPressed {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  @State message:string  = ''
  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      PageOneTmp()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column() {
        Button('pushPath', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick(() => {
            this.pageInfos.pushPath({ name: 'pageOne',onPop: (popInfo: PopInfo)=>{
              this.message = JSON.stringify(popInfo.result);
            }});
          })
          .id('NavDestination_onBackPressed_btn1')
        Text(this.message).key('NavDestination_onBackPressed_text1')
      }
    }.title('NavIndex').navDestination(this.PageMap).height('50%')

  }
}