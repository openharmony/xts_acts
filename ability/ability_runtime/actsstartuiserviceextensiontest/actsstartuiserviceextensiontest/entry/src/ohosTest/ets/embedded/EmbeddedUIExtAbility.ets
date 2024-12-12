import { EmbeddedUIExtensionAbility, UIExtensionContentSession, Want } from '@kit.AbilityKit';
import { commonEventManager } from '@kit.BasicServicesKit';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

const TAG: string = '[ExampleEmbeddedAbility]'

export default class ExampleEmbeddedAbility extends EmbeddedUIExtensionAbility {
  onCreate() {
    console.log(TAG, `onCreate`);
  }

  onForeground() {
    console.log(TAG, `onForeground`);
  }

  onBackground() {
    console.log(TAG, `onBackground`);
  }

  onDestroy() {
    console.log(TAG, `onDestroy`);
  }

  onSessionCreate(want: Want, session: UIExtensionContentSession) {
    console.log(TAG, `onSessionCreate, want: ${JSON.stringify(want)}`);
    let param: Record<string, UIExtensionContentSession> = {
      'session': session
    };
    let tag = want?.parameters?.caseName;
    let storage: LocalStorage = new LocalStorage(param);
    if(want?.parameters?.case == "startUIService"){
      this.context.startUIServiceExtensionAbility(null).then((data)=>{
        console.info(tag + '====> startUIServiceExtensionAbility: ' + JSON.stringify(data));

      }).catch((err:BusinessError)=>{
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish(want?.parameters?.caseName, commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      })
    }else if(want?.parameters?.case == "connectUIService"){
      let dataCallBack : common.UIServiceExtensionConnectCallback = {
        // 接收数据
        onData: (data: Record<string, Object>) => {
          console.log(tag + `dataCallBack received data`, JSON.stringify(data));
        },
        // 连接断开
        onDisconnect: () => {
          console.log(tag + `dataCallBack onDisconnect`);
        }
      }
      this.context.connectUIServiceExtensionAbility(null, dataCallBack).then((proxy: common.UIServiceProxy)=>{
        console.info(tag + '====> startUIServiceExtensionAbility: ' + JSON.stringify(proxy));
      }).catch((err:BusinessError)=>{
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish(want?.parameters?.caseName, commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      })
    }else if(want?.parameters?.case == "disconnectUIService"){
      this.context.disconnectUIServiceExtensionAbility(null)
        .then(() => {
          console.log(tag + `disconnectUIServiceExtensionAbility succeed`);
        }).catch((err: Error) => {
        console.log(TAG + `disconnectUIServiceExtensionAbility failed, code is ${err?.code}`);
        let commonEventData: commonEventManager.CommonEventPublishData = {
          parameters: {
            'result': err?.code,
          }
        }
        commonEventManager.publish(want?.parameters?.caseName, commonEventData, (result) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `onConnect, 50==: ${JSON.stringify(result)}`);
          this.context.terminateSelf()
        });
      });
    }
    session.loadContent('testability/pages/Index', storage);
  }

  onSessionDestroy(session: UIExtensionContentSession) {
    console.log(TAG, `onSessionDestroy`);
  }
}