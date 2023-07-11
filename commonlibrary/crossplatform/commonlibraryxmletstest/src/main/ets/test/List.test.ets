import xmlTest from './xml.test'
import xmlParseOptionTest from './xmlEventType.test'
import xmlEventTypeTest from './xmlParseOption.test'

export default function testsuite() {
  xmlTest();
  xmlParseOptionTest();
  xmlEventTypeTest();
}