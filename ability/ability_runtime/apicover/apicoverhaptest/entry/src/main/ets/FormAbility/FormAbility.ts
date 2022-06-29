import commonEvent from '@ohos.commonEvent';
import FormExtension from '@ohos.application.FormExtension';
import formBindingData from '@ohos.application.formBindingData';
import formInfo from '@ohos.application.formInfo';

var extensionInfo_config_direction
export default class FormAbility extends FormExtension {
    onCreate(want) {
        // Called to return a FormBindingData object.
        let formData = {};

        let extensionInfo_currentInfo_name = this.context.currentHapModuleInfo.name
        let extensionInfo_currentInfo_description = this.context.currentHapModuleInfo.description

        this.context.resourceManager.getConfiguration((err, data) => {
                if (err.code != 0 ) {
                    console.error(`Ability: getConfiguration failed: ${JSON.stringify(err)}`);
                } else {
                    console.log(`Ability: getConfiguration success: ${JSON.stringify(data)}`);
                    extensionInfo_config_direction = data.direction
                }
            })
        var CommonEventPublishData = {
            parameters: {
                "extensionInfo_currentInfo_name": extensionInfo_currentInfo_name,
                "extensionInfo_currentInfo_description": extensionInfo_currentInfo_description,
                "extensionInfo_config_direction": extensionInfo_config_direction,
                "key":"value"
            }
        }
        commonEvent.publish("FormAbility_OnCreate", CommonEventPublishData, (err) => {
            console.log('FormAbility_OnCreate');
        });
        console.info("FormAbility onCreate")
        return formBindingData.createFormBindingData(formData);
    }

    onCastToNormal(formId) {
        // Called when the form provider is notified that a temporary form is successfully
        // converted to a normal form.
    }

    onUpdate(formId) {
        // Called to notify the form provider to update a specified form.
    }

    onVisibilityChange(newStatus) {
        // Called when the form provider receives form events from the system.
    }

    onEvent(formId, message) {
        // Called when a specified message event defined by the form provider is triggered.
    }

    onDestroy(formId) {
        // Called to notify the form provider that a specified form has been destroyed.
    }

    onAcquireFormState(want) {
        // Called to return a {@link FormState} object.
        return formInfo.FormState.READY;
    }
};