import { common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { expect } from '@ohos/hypium';

@Entry
@Component
struct Index {
  build() {
    Column() {
      Row() {
        // 创建启动按钮
        Button('start ability111111')
          .enabled(true)
          .onClick(() => {
            let context = getContext(this) as common.UIAbilityContext;
            let startWant: Want = {
              bundleName: 'com.test.runTime',
              abilityName: undefined,
            };
            try {
              // 启动UIServiceExtensionAbility
              context.startUIServiceExtensionAbility(startWant).then(() => {
                console.log('startUIServiceExtensionAbility success');
              }).catch((error: BusinessError) => {
                console.log('startUIServiceExtensionAbility error', JSON.stringify(error));
              })
            } catch (err) {
              console.log('startUIServiceExtensionAbility failed', JSON.stringify(err));
              expect(err.code).assertEqual(16000019)
            }
          })
      }
    }
  }
}