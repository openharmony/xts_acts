import signNormalNotAccessBiometricExecute from "./SignNormalNotAccessBiometricExecute.test"
import userauthTest_Nopermission_API12 from "./Security_IAM_FUNC_API12_Nopermission_Jsunit.test"
import userAuthTestExecute from "./nopermisson.test"

export default function testsuite() {
    signNormalNotAccessBiometricExecute();
    userauthTest_Nopermission_API12();
    userAuthTestExecute();
}
