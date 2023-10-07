import ServiceExtensionAbility from '@ohos.app.ability.ServiceExtensionAbility';
import rpc from '@ohos.rpc';

const TAG: string = "[Example].[Entry].[ServiceExtAbility]";
const REQUEST_CODE = 210;


class StubTest extends rpc.RemoteObject {
  // ...
}

export default class ServiceExtAbility extends ServiceExtensionAbility {
  onCreate(want) {
    console.info(TAG, `onCreate, want: ${want.abilityName}`);
  }

  onRequest(want, startId) {
    console.info(TAG, `onRequest, want: ${want.abilityName}`);
  }

  onConnect(want) {
    console.info(TAG, `onConnect, want: ${want.abilityName}`);
    return new StubTest("test");
  }

  onDisconnect(want) {
    console.info(TAG, `onDisconnect, want: ${want.abilityName}`);
  }

  onDestroy() {
    console.info(TAG, `onDestroy`);
  }
}
