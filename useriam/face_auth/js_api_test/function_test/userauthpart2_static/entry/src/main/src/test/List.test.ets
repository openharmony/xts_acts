import signNormalNotAccessBiometricEnumExecute from "./Enum.test";
import signNormalAccessBiometricExecute from "./Execute.test";
import userauthTest_API12 from "./Security_IAM_FUNC_API12_Jsunit.test"
import userauthTest_API9 from "./Security_IAM_FUNC_Jsunit.test"

export default function testsuite() {
    signNormalNotAccessBiometricEnumExecute();
    signNormalAccessBiometricExecute();
    userauthTest_API12();
    userauthTest_API9();
}
