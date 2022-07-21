import formBindingData from '@ohos.application.formBindingData';
import formInfo from '@ohos.application.formInfo';

var TAG_F1 = "Fa:Auxiliary:MainAbility2:";
var listPushF1 = "Fa_Auxiliary_MainAbility2_";
export default {
    onCreate(want) {
        console.info(TAG_F1 + 'onCreate');
        let formData = {};
        return formBindingData.createFormBindingData(formData);
    },

    onCastToNormal(formId) {
        console.info(TAG_F1 + 'onCastToNormal');
    },

    onUpdate(formId) {
        console.info(TAG_F1 + 'onUpdate');
    },

    onVisibilityChange(newStatus) {
        console.info(TAG_F1 + 'onVisibilityChange');
    },

    onEvent(formId, message) {
        console.info(TAG_F1 + 'onEvent');
    },

    onDestroy(formId) {
        console.info(TAG_F1 + 'onDestroy');
    },

    onAcquireFormState(want) {
        console.info(TAG_F1 + 'onAcquireFormState');
        return formInfo.FormState.READY;
    }
};