import { Want, UIExtensionAbility, UIExtensionContentSession } from '@kit.AbilityKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

const TAG: string = 'UIExtensionContentSession03 UIExtAbility';
const caseTag:string = 'Sub_UIExtensionContentSession_errorCode_0300'

export default class UIExtensionProvider03 extends UIExtensionAbility {
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
    console.log(TAG, `onSessionCreate, want: ${JSON.stringify(want)}}`);
    let storage: LocalStorage = new LocalStorage();
    storage.setOrCreate('session', session);
    try {
      session?.terminateSelfWithResult(undefined, (err: BusinessError) => {
        if (err) {
          console.error(`Failed to terminate self with result, code: ${err.code}, msg: ${err.message}`);
          return;
        }
        console.info(`Successed in terminateSelf with result.`);
        console.error(`Test case execution results do not match expected outcomes.`);
        commonEventManager.publish('ACTS_TEST_DESTROY', function () {
          console.info(`${caseTag} publish ACTS_TEST_DESTROY`);
        });
      });
    } catch (error) {
      console.error(`session.terminateSelfWithResult fail, error: ${JSON.stringify(error)}`);
      if(error.code==401){
        session?.terminateSelf((err: BusinessError) => {
          if (err) {
            console.error(`Failed to terminate self, code: ${err.code}, msg: ${err.message}`);
            return;
          }
          console.info(`Successed in terminating self.`);
          commonEventManager.publish('ACTS_TEST_DESTROY', function () {
            console.info(`${caseTag} publish ACTS_TEST_DESTROY`);
          });
        });
      }
    }
  }

  onSessionDestroy(session: UIExtensionContentSession) {
    console.log(TAG, `onSessionDestroy`);
  }
}
