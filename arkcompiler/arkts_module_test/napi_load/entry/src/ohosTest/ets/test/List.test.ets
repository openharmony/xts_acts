import HapNapiLoadTest from './HapNapiLoad.test';
import HarNapiLoadTest from './HarNapiLoad.test';
import HspNapiLoadTest from './HspNapiLoad.test';

export default function testsuite() {
  HapNapiLoadTest();
  HarNapiLoadTest();
  HspNapiLoadTest();
}