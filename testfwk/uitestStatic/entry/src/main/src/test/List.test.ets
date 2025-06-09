import abilityTest from "./Ability.test";
import uitestComponentTest from './UitestComponent.test';
import uitestDriverTest from './UitestDriver.test';
export default function testsuite() {
  abilityTest();
  uitestComponentTest();
  uitestDriverTest();
}