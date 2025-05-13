import abilityTest from './Ability.test';
import ProcessInterfacetTest from './ProcessInterfacetTest.test';
import ProcessSupplementSecondTest from './ProcessSupplementSecondTest.test';
import ProcessSupplementTest from './ProcessSupplementTes.test';

export default function testsuite() {
  abilityTest();
  ProcessSupplementTest();
  ProcessInterfacetTest();
  ProcessSupplementSecondTest();
}