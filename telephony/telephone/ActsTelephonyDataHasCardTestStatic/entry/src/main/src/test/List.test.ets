import dataManagerTest from "./DataManagerHasCard.test";
import dataJsunit from './DataJsunit.test'
export default function testsuite() {
    dataJsunit();
    dataManagerTest();
}
