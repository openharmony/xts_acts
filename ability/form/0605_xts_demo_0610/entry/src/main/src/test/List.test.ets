import formExtensionAbilityTest from "./FormExtensionAbility.test";
import formBindingDataTest from "./FormBindingData.test";
import formProviderTest from "./FormProvider.test";
import formLinkTest from "./FormLink.test";
import formInfoTest from "./FormInfo.test";
import formErrorTest from "./FormError.test";


export default function testsuite() {
  formExtensionAbilityTest();
  formBindingDataTest();
  formProviderTest();
  formLinkTest();
  formInfoTest();
  formErrorTest();
}