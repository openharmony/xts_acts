import { uiObserver } from '@kit.ArkUI';

@Component
struct PageOne {
  @Consume('stack') stack:NavPathStack;
  build() {
    NavDestination() {
      Text('pageOne')
      Button('back').onClick(() => {

        this.stack.pop();
      })
      .height('5%')
      .id('backId')
    }.title("pageOne")
  }
}

@Entry
@Component
struct NavDestinationStateActive {
  @Provide stack: NavPathStack = new NavPathStack();

  @Builder
  PageBuilder(name: string) {
    PageOne()
  }

  aboutToAppear() {
    uiObserver.on('navDestinationUpdate', (info) => {
      console.info('NavDestination state update', JSON.stringify(info));
      if (info.state == uiObserver.NavDestinationState.ON_ACTIVE) {
        AppStorage.setOrCreate('ON_ACTIVE', info.state);
      }
      if (info.state == uiObserver.NavDestinationState.ON_INACTIVE) {
        AppStorage.setOrCreate('ON_INACTIVE', info.state);
      }
    });
  }

  aboutToDisappear() {
    uiObserver.off('navDestinationUpdate');
  }

  build() {
    Column() {
      Navigation(this.stack) {
        Button('push').onClick(() => {
          this.stack.pushPath({ name: 'pageOne' });
        })
        .height('5%')
        .id('pushId')
      }
      .title('Navigation')
      .navDestination(this.PageBuilder)
      .mode(NavigationMode.Stack)
    }
    .width('100%')
    .height('100%')
  }
}