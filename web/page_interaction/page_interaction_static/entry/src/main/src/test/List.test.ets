// import abilityTest from "./Ability.test";
import webInitTest from "./WebInitTest.test";
import webViewController from "./WebViewController.test";
import WebViewEnumAndFontLibrary from "./WebViewEnumAndFontLibrary.test";
export default function testsuite() {
  // abilityTest();
  webViewController();
  webInitTest();
  WebViewEnumAndFontLibrary();
}