/*import NetworkManagerMulticastconnection201Test from './NetworkManagerMulticastconnection_201.test';
 */
import MulticastconnectionAsyncTest from './MulticastconnectionAsync.test';
import MulticastconnectionPromiseTest from './MulticastconnectionPromise.test';

export default function testsuite() {
  MulticastconnectionAsyncTest();
  MulticastconnectionPromiseTest();
}