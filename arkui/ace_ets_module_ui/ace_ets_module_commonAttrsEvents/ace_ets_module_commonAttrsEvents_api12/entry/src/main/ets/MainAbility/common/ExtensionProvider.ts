// ExtensionProvider.ts
import EmbeddedUIExtensionAbility from '@ohos.app.ability.EmbeddedUIExtensionAbility';
import UIExtensionContentSession from '@ohos.app.ability.UIExtensionContentSession';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';

export default class EntryAbility extends EmbeddedUIExtensionAbility {
  onSessionCreate(want: Want, session: UIExtensionContentSession) {
    const extensionHostWindow = session.getUIExtensionHostWindowProxy();
    // 获取宿主应用窗口的避让信息
    const avoidArea = extensionHostWindow.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
    console.log(`avoidArea: ${JSON.stringify(avoidArea)}`);
  }
}