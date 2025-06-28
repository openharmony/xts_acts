import versionInfoTest from "./ActsVersionInfo.test";
import classOperationsTest from "./ActsClassOperations.test";
import objectOperationsTest from "./ActsObjectOperations.test"
import GlobalAndLocalReferencesTest from "./ActsGlobalAndLocalReferences.test.ets"
import globalAndLocalReferencesTest from "./ActsGlobalAndLocalReferences.test.ets"
import accessingStaticFieldsTest from "./ActsAccessingStaticFields.test.ets"
import callingStaticMethodsTest from "./ActsClassCallingStaticMethods.test";

export default function testsuite() {
    versionInfoTest();
    classOperationsTest();
    objectOperationsTest();
    globalAndLocalReferencesTest();
    accessingStaticFieldsTest();
    callingStaticMethodsTest();
}
