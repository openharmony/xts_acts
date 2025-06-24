import  ActsNotificationPublishTest from "./ActsNotificationPublishTest.test";
import  ActsNotificationManagerPublishTest from "./ActsNotificationManagerPublishTest.test";
import  abilityTest from "./Ability.test";
export default function testsuite() {
  abilityTest();
  ActsNotificationPublishTest();
  ActsNotificationManagerPublishTest();
}