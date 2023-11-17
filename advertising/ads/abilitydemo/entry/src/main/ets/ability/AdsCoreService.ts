import AdsServiceExtensionAbility from '@ohos.advertising.AdsServiceExtensionAbility';
import { RespCallback } from '@ohos.advertising.AdsServiceExtensionAbility';
import advertising from '@ohos.advertising';
import Logger from '../log/HiAdLog';


const TAG: string = "AdsExtensionAbility";

export default class AdsExtensionAbility extends AdsServiceExtensionAbility {

  onLoadAd(adParam: advertising.AdRequestParams, adOptions: advertising.AdOptions, respCallback: RespCallback) {
    try {
      Logger.i(TAG, `onLoadAd, adParam: ${JSON.stringify(adParam)}, adOptions: ${JSON.stringify(adOptions)}`);
      const ads: Array<advertising.Advertisement> = [];
      ads.push({adType: 7, uniqueId: '122222', rewardVerifyConfig: null, rewarded: false, shown: false,  clicked: false})
      const slot1: string = "test1";
      const resMap: Map<string, Array<advertising.Advertisement>> = new Map();
      resMap.set(slot1, ads);
      Logger.i(TAG, `onLoadAd, resMap: ${JSON.stringify(resMap.get(slot1))}`);
      test();
      Logger.i(TAG, `onLoadAd, respCallback`);
      respCallback(resMap);
    } catch(e) {
      Logger.i(TAG, `onLoadAd, error: ${JSON.stringify(e)}`);
    }
  }

  onLoadAdWithMultiSlots(adParams: advertising.AdRequestParams[], adOptions: advertising.AdOptions, respCallback: RespCallback) {
    Logger.i(TAG, `onLoadAdWithMultiSlots, adParams: ${JSON.stringify(adParams)}, adOptions: ${JSON.stringify(adOptions)}`);
    const ads: Array<advertising.Advertisement> = [];
    ads.push({adType: 7, uniqueId: '122222', rewardVerifyConfig: null, rewarded: false, shown: false,  clicked: false})
    ads.push({adType: 7, uniqueId: '133333', rewardVerifyConfig: null, rewarded: false, shown: false,  clicked: false})
    const slot1: string = "test1";
    const resMap: Map<string, Array<advertising.Advertisement>> = new Map();
    resMap.set(slot1, ads);
    Logger.i(TAG, `onLoadAdWithMultiSlots, resMap: ${JSON.stringify(resMap.get(slot1))}`);
    respCallback(resMap);
  }
}

function test() {
  Logger.i(TAG, `onLoadAd, test`);
}