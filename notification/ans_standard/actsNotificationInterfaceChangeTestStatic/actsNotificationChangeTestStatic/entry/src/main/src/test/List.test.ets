import  ActsNotificationContentTest from "./NotificationContent.test";
import  ActsNotificationRequestTest from "./NotificationRequest.test";
import  ActsNotificationwantAgentInfoTest from "./NotificationWantAgent.test";
export default function testsuite() {
  ActsNotificationRequestTest();
  ActsNotificationContentTest();
  ActsNotificationwantAgentInfoTest();
}