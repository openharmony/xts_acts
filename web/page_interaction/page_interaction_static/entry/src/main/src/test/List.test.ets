import webInitTest from "./WebInitTest.test";
import webViewController from "./WebViewController.test";
import WebViewEnumAndFontLibrary from "./WebViewEnumAndFontLibrary.test";
export default function testsuite() {
  webViewController();
  webInitTest();
  WebViewEnumAndFontLibrary();
}