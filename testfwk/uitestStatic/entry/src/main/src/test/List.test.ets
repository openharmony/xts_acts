import uitestComponentTest from './UitestComponent.test';
import uitestDriverTest from './UitestDriver.test';
import uitestEnumTest from './UitestEnum.test';
import uitestOnTest from './UitestOn.test';
import uitestUiWindowTest from './UitestUiWindow.test';
export default function testsuite() {
  uitestEnumTest();
  uitestComponentTest();
  uitestDriverTest();
  uitestOnTest();
  uitestUiWindowTest()
}