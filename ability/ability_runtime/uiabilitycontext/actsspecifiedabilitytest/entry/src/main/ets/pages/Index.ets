import { common } from '@kit.AbilityKit';

const demo3BundleName = 'com.acts.ability.specifiedability.demo3';

@Entry
@Component
struct Index {
  @State message: string = 'Hello Entry';

  build() {
    Column() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.message = 'Welcome';
        })
      Button() {
        Text('start crash')
          .fontSize($r('app.float.page_text_font_size'))
          .fontWeight(FontWeight.Bold)
      }
      .onClick(async () => {
        let context = getContext(this) as common.UIAbilityContext;
        await context.startAbility({
          bundleName: demo3BundleName,
          abilityName: 'EntryAbility',
          parameters: {
            triggerCrash: true
          }
        });
        await context.startAbility({
          bundleName: demo3BundleName,
          abilityName: 'EntryAbility',
          parameters: {
            noexit: true
          }
        });
      })
    }
    .height('100%')
    .width('100%')
  }
}