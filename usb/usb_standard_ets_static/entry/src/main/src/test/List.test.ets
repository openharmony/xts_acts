import UsbManagerNormalHapTest from "./UsbManagerNormalHap.test";
import AddUsbManagerTest from "./AddUsbManagerTest.test";
import SerialBaseTest from "./SerialBaseTest.test";
export default function testsuite() {
  UsbManagerNormalHapTest();
  AddUsbManagerTest();
  SerialBaseTest();
}