import inputMethodTest from "./inputMethod.test";
import inputMethodShowHideTest from "./inputMethod_showTextInput_hideTextInput_detach.test"
import inputMethodAttachTest from "./inputMethod_attach.test"
import inputMethodOnOffTest from "./inputMethod_on_off.test"
export default function testsuite() {
    inputMethodTest();
    inputMethodShowHideTest();
    inputMethodAttachTest();
    inputMethodOnOffTest();
}
