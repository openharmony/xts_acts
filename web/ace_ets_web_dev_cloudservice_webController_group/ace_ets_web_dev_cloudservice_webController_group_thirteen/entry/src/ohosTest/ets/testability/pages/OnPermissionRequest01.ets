import { webview } from '@kit.ArkWeb';
import { LocalContext } from '../../test/GloablConfig';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityAccessCtrl, common, PermissionRequestResult } from '@kit.AbilityKit';

let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
try {
  let context: Context = getContext(this) as common.UIAbilityContext;
  atManager.requestPermissionsFromUser(context, ['ohos.permission.CAMERA'],
    (err: BusinessError, data: PermissionRequestResult) => {
      console.info('data:' + JSON.stringify(data));
      console.info('data permissions:' + data.permissions);
      console.info('data authResults:' + data.authResults);
    })
} catch (error) {
  console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
}

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();

  aboutToAppear(): void {
    try {
      webview.WebviewController.setWebDebuggingAccess(true);
    } catch (error) {
      console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
    }
  }

  build() {
    Column() {
      Web({ src: $rawfile('index1.html'), controller: this.controller })
        .onPermissionRequest((event) => {
          if (event) {
            AlertDialog.show({
              title: 'title',
              message: 'text',
              primaryButton: {
                value: 'deny',
                action: () => {
                  event.request.deny();
                  LocalContext.context.eventHub.emit('testWebView_onPermissionRequest0005', 1)
                }
              },
              secondaryButton: {
                value: 'onConfirm',
                action: () => {
                  event.request.grant(event.request.getAccessibleResource());
                }
              },
              cancel: () => {
                event.request.deny();
              }
            })
          }
        })
    }
  }
}