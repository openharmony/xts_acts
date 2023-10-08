import ServiceExtensionAbility from '@ohos.app.ability.ServiceExtensionAbility';
import display from '@ohos.display'
import window from '@ohos.window'
import rpc from '@ohos.rpc';

globalThis.createWindow = async (name, windowType, rect) => {
  let win;
  console.info(TAG, 'Start creating window.');
  let configuration = {
    name: name,
    windowType: windowType,
    ctx: globalThis.singleExtAbilityContext
  };
  try {
    win = await window.createWindow(configuration);
    await win.moveTo(rect.left, rect.top);
    await win.resetSize(rect.width, rect.height);
    // await win.setFullScreen(true)
    await win.loadContent('pages/uiPage3');
    await win.setBackgroundColor('#ffeae6e6')
    await win.show();
    console.info(TAG, 'Start creating window successfully!');
  } catch {
    console.error('Window create failed!');
  }
}

const TAG: string = "ServiceExtAbilityTAG";

class StubTest extends rpc.RemoteObject {
  // ...
}

export default class ServiceExtAbility extends ServiceExtensionAbility {
  onCreate(want) {
    console.info(TAG, `onCreate, want: ${want.abilityName}`);
    globalThis.singleExtAbilityContext = this.context;
    globalThis.singleExtApplicationContext = this.context.getApplicationContext();
  }

  onRequest(want, startId) {
    console.info(TAG, `onRequest, want: ${JSON.stringify(want)}`);
    globalThis.abilityWant = want;
    display.getDefaultDisplay().then(async (dis) => {
      let navigationBarRect = {
        left: 400,
        top: 850,
        width: 200,
        height: 200
      };
      await globalThis.createWindow('uiPages3', window.WindowType.TYPE_FLOAT, navigationBarRect);
    })
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