import abilityTest from "./ActsAbility.test";
import versionInfoTest from "./ActsVersionInfo.test";
import classOperationsTest from "./ActsClassOperations.test";
import globalRefTest from "./ActsGlobalRef.test.ets";
import objectOperationsTest from "./ActsObjectOperations.test"
import accessingFiledsOfObjectsTest from "./ActsAccessingFiledsOfObjects.test"

export default function testsuite() {
    abilityTest();
    versionInfoTest();
    classOperationsTest();
    globalRefTest();
    objectOperationsTest();
    accessingFiledsOfObjectsTest();
}
