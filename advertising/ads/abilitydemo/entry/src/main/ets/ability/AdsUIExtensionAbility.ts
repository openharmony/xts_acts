import UIExtensionAbility from '@ohos.app.ability.UIExtensionAbility';
import Want from '@ohos.app.ability.Want';
import UIExtensionContentSession from '@ohos.app.ability.UIExtensionContentSession';
import Logger from '../log/HiAdLog';

const TAG: string = '[AdsUIExtensionAbility]';

/**
 * UEA入口
 */
export default class AdsUIExtensionAbility extends UIExtensionAbility {
  onCreate() {
    Logger.i(TAG, `AdsUIExtensionAbility test onCreate`);
    Logger.i(TAG, `AdsUIExtensionAbility test onCreate dir :${this.context.cacheDir}`);
  }

  onSessionCreate(want: Want, session: UIExtensionContentSession) {
    Logger.i(TAG, `AdsUIExtensionAbility test onSessionCreate`);
    const storage = new LocalStorage();
    storage.setOrCreate('session', session);
    storage.setOrCreate('want', want);
    let parameters = want?.parameters;
    Logger.i(TAG, `AdsUIExtensionAbility AdDisplayOptions: ${JSON.stringify(parameters)}`);
    let AdDisplayOptions = want?.parameters["displayOptions"];
    if (AdDisplayOptions["refreshTime"]) {
      Logger.i(TAG, `AdsUIExtensionAbility refreshTime: ${AdDisplayOptions["refreshTime"]}`);
      session.loadContent("adsmanager/pages/AutoRefreshPage", storage);
    } else {
      session.loadContent("adsmanager/pages/UIExtensionAbilityPage", storage);
    }

  }

  onForeground() {
    Logger.i(TAG, `AdsUIExtensionAbility test onForeground`);
  }

  onBackground() {
    Logger.i(TAG, `AdsUIExtensionAbility test onBackground`);
  }

  onDestroy() {
    Logger.i(TAG, `AdsUIExtensionAbility test onDestroy`);
  }
}