import { router } from '@kit.ArkUI'

class RouteParam {
  constructor(msg: string) {
    this.msg = msg
  }
  private msg: string = '';
}

@Entry({routeName: 'nickNameOne'})
@Component
struct PageOne {
  @State paramString: string = '';

  aboutToAppear(): void {
    console.log('PageOne aboutToAppear');
  }

  onPageShow(): void {
    console.log('PageOne onPageShow');
    this.queryRouterPageInfo()
  }

  onNewParam(param: ESObject) {
    console.log('PageOne onNewParam, param: ' + JSON.stringify(param));
    this.paramString = JSON.stringify(param);
  }

  build() {
    Navigation() {
      Column() {
        Text(this.paramString).id('paramId').height('10%')
        Button('pushUrl PageOne Single')
          .onClick(() => {
            router.pushUrl({ url: 'pages/PageOne', params: new RouteParam('pushUrl One Single') }, router.RouterMode.Single)
          })
          .id('pushUrlId')
          .height('10%')
        Button('replaceUrl PageOne Single')
          .onClick(() => {
            router.replaceUrl({ url: 'pages/PageOne', params: 'test string'}, router.RouterMode.Single)
          })
          .id('replaceUrlId')
          .height('10%')
        Button('pushNamed PageOne Single')
          .onClick(async () => {
            await import ('./PageOne')
              .then(() => {
                router.pushNamedRoute({ name: 'nickNameOne', params: 20 }, router.RouterMode.Single)
              })
          })
          .id('pushNamedId')
          .height('10%')
      }
      .width('100%')
      .height('100%')
    }
    .title('PageOne')
    .titleMode(NavigationTitleMode.Mini)
  }
}