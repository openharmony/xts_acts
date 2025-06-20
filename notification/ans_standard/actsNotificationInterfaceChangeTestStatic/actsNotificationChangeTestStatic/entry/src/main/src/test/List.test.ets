import  ActsNotificationContentTest from "./notificationContent.test";
import  ActsNotificationRequestTest from "./notificationRequest.test";
import  ActsNotificationwantAgentInfoTest from "./notificationWantAgent.test";
export default function testsuite() {
  ActsNotificationRequestTest();
  ActsNotificationContentTest();
  ActsNotificationwantAgentInfoTest();
}