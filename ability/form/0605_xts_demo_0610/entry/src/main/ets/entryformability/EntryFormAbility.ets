
import hilog from '@ohos.hilog'
import formBindingData from '@ohos.app.form.formBindingData'
import FormExtensionAbility from '@ohos.app.form.FormExtensionAbility'
import Want from '@ohos.app.ability.Want'
import { Configuration } from '@ohos.app.ability.Configuration';
import CommonEventManager from '@ohos.commonEventManager';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag EntryFormAbility'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default class EntryFormAbility extends FormExtensionAbility {

  constructor() {
    hilog.error(domain, tag, 'constructor register');

    try {
      this.onStop = () => {
        hilog.info(domain, tag, 'OnStop callback success');
        CommonEventManager.publish("XTS_FormExtensionAbilityOnStopTest_commonEvent", () => {
          hilog.info(domain, tag, '%{public}s', 'OnStopTest001 commonEvent publish');})
      }
      hilog.info(domain, tag, 'OnStop register success');
    } catch (error) {
      hilog.error(domain, tag, 'OnStop catch error');
    }

    try {
      this.onAcquireFormState = () => {
        hilog.info(domain, tag, 'onAcquireFormState callback success');
      }
      hilog.info(domain, tag, 'onAcquireFormState register success');
    } catch (error) {
      hilog.error(domain, tag, 'onAcquireFormState catch error');
    }
  }

  onAddForm(want: Want) : formBindingData.FormBindingData {
    hilog.info(domain, tag, 'onAddForm testing');
    // Called to return a FormBindingData object.
    const formData = '';
    return formBindingData.createFormBindingData(formData);
  }

  onCastToNormalForm(formId: string) {
    hilog.info(domain, tag, 'onCastToNormalForm testing');
    // Called when the form provider is notified that a temporary form is successfully
    // converted to a normal form.
  }

  onUpdateForm(formId: string) {
    hilog.info(domain, tag, 'onUpdateForm testing');
    // Called to notify the form provider to update a specified form.
  }

  onFormEvent(formId: string, message: string) {
    hilog.info(domain, tag, 'onFormEvent testing');
    // Called when a specified message event defined by the form provider is triggered.
  }

  onRemoveForm(formId: string) {
    // Called to notify the form provider that a specified form has been destroyed.
    hilog.info(domain, tag, 'onRemoveForm testing');
  }

  onConfigurationUpdate(newConfig: Configuration) {
    hilog.info(domain, tag, 'onConfigurationUpdate testing');
  }
}
