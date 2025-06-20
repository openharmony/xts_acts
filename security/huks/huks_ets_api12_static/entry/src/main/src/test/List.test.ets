import SecurityHuksImportKeyTest from "./SecurityHuksImportKey.test";
import SecurityHuksInterfaceErrorCodeTest from "./SecurityHuksInterfaceErrorCode.test";
import SecurityHuksMacHmacTest from "./SecurityHuksMacHmac.test";
import SecurityHuksSignVerifyEccTest from "./SecurityHuksSignVerifyEcc.test";

export default function testsuite() {
  SecurityHuksImportKeyTest();
  SecurityHuksInterfaceErrorCodeTest();
  SecurityHuksMacHmacTest();
  SecurityHuksSignVerifyEccTest();
}
