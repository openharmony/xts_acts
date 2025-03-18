import { Want, UIExtensionAbility, UIExtensionContentSession } from '@kit.AbilityKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

const TAG: string = 'UIExtensionContentSession UIExtAbility';
let caseTag: string = 'Sub_UIExtensionContentSession_errorCode_0100';
export default class UIExtensionProvider extends UIExtensionAbility {
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
    caseTag = want.action
    if(want.action == 'Sub_UIExtensionContentSession_errorCode_0100'){
      try {
        session.loadContent(undefined);
        console.info(`${caseTag} session.loadContent success`);
        commonEventManager.publish('ACTS_TEST_DESTROY', function () {
          console.info(`${caseTag} publish ACTS_TEST_DESTROY`);
        });
      } catch (error) {
        console.error(`session.loadContent fail, error: ${JSON.stringify(error)}`);
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
    if(want.action == 'Sub_UIExtensionContentSession_errorCode_0200'){
      try {
        session.loadContentByName(undefined);
        console.info('loadContentByName session.loadContentByName success');
        commonEventManager.publish('ACTS_TEST_DESTROY', function () {
          console.info(`${caseTag} publish ACTS_TEST_DESTROY`);
        });
      } catch (error) {
        console.error(`session.loadContentByName fail, error: ${JSON.stringify(error)}`);
        if(error.code==undefined){
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
    if(want.action == 'Sub_UIExtensionContentSession_errorCode_0300'){
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
    if(want.action == 'Sub_UIExtensionContentSession_errorCode_0400'){

    }
    if(want.action == 'Sub_UIExtensionContentSession_errorCode_0500'){

    }
    if(want.action == 'Sub_UIExtensionContentSession_errorCode_0600'){

    }
  }

  onSessionDestroy(session: UIExtensionContentSession) {
    console.log(TAG, `onSessionDestroy`);
  }
}
