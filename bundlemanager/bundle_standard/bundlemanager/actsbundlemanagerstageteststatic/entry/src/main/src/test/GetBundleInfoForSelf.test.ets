import bundle from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import { BundleInfo } from 'bundleManager.BundleInfo';
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";

let domain: number = 0x0000;
let tag: string = 'testTag';
const BUNDLE_NAME = "ohos.acts.bundle.stage.test.static";
const VENDOR = "example";

export default function getBundleInfoForSelf() {
  describe('getBundleInfoForSelf', (): void => {

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_5580
     * @tc.name: getBundleInfoForSelfCallbackDefault
     * @tc.desc: Test getBundleInfoForSelf with default flag(by callback).
     */
    it('getBundleInfoForSelfCallbackDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT, (err: BusinessError<void>, data : BundleInfo) => {
          hilog.info(domain, tag, 'getBundleInfoForSelfPromiseDefault  ====> start');
          hilog.info(domain, tag, 'getBundleInfoForSelfCallbackDefault  ====> data' + JSON.stringify(data));
          hilog.info(domain, tag, 'getBundleInfoForSelfCallbackDefault  ====> err' + JSON.stringify(err));
          expect(data.name).assertEqual(BUNDLE_NAME);
          expect(data.vendor).assertEqual(VENDOR);
          expect(data.versionCode + '').assertEqual('1000000');
          expect(data.versionName).assertEqual("1.0.0");
          expect(data.minCompatibleVersionCode + '').assertEqual('1000000');
          expect(data.targetVersion  + '').assertEqual('20');
          expect(data.installTime).assertLarger(0.0);
          expect(data.updateTime).assertLarger(0.0);
          expect(data.firstInstallTime).assertLarger(0.0);
          expect(data.appInfo).assertEqual(null);
          expect(data.hapModulesInfo.length + '').assertEqual('0');
          expect(data.reqPermissionDetails.length + '').assertEqual('0');
          expect(data.permissionGrantStates.length + '').assertEqual('0');
          hilog.info(domain, tag, 'getBundleInfoForSelfPromiseDefault  ====> end');
          done();
        })
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_5560
     * @tc.name: getBundleInfoForSelfPromiseDefault
     * @tc.desc: Test getBundleInfoForSelf with default flag(by promise).
     */
    it('getBundleInfoForSelfPromiseDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).then((data : BundleInfo) => {
          hilog.info(domain, tag, 'getBundleInfoForSelfPromiseDefault  ====> start');
          expect(data.name).assertEqual(BUNDLE_NAME);
          expect(data.vendor).assertEqual(VENDOR);
          expect(data.versionCode + '').assertEqual('1000000');
          expect(data.versionName).assertEqual("1.0.0");
          expect(data.minCompatibleVersionCode + '').assertEqual('1000000');
          expect(data.targetVersion  + '').assertEqual('20');
          expect(data.installTime).assertLarger(0.0);
          expect(data.updateTime).assertLarger(0.0);
          expect(data.firstInstallTime).assertLarger(0.0);
          expect(data.appInfo).assertEqual(null);
          expect(data.hapModulesInfo.length + '').assertEqual('0');
          expect(data.reqPermissionDetails.length + '').assertEqual('0');
          expect(data.permissionGrantStates.length + '').assertEqual('0');
          hilog.info(domain, tag, 'getBundleInfoForSelfPromiseDefault  ====> end');
          done();
        }).catch(err => {
          hilog.info(domain, tag, 'getBundleInfoForSelfCal  ====> err');
          expect(err).assertFail();
          done();
        })
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_5570
     * @tc.name: getBundleInfoForSelfSyncDefault
     * @tc.desc: Test getBundleInfoForSelf with default flag(by sync).
     */
    it('getBundleInfoForSelfSyncDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'getBundleInfoForSelfSyncDefault  ====> Start');
        let data: bundle.BundleInfo =
          bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT);
        hilog.info(domain, tag, 'getBundleInfoForSelfSyncDefault data ====>' + JSON.stringify(data));
        expect(data.name).assertEqual(BUNDLE_NAME);
        expect(data.vendor).assertEqual(VENDOR);
        expect(data.versionCode + '').assertEqual('1000000');
        expect(data.versionName).assertEqual("1.0.0");
        expect(data.minCompatibleVersionCode + '').assertEqual('1000000');
        expect(data.targetVersion  + '').assertEqual('20');
        expect(data.installTime).assertLarger(0.0);
        expect(data.updateTime).assertLarger(0.0);
        expect(data.firstInstallTime).assertLarger(0.0);
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length + '').assertEqual('0');
        expect(data.reqPermissionDetails.length + '').assertEqual('0');
        expect(data.permissionGrantStates.length + '').assertEqual('0');
        done();
        hilog.info(domain, tag, 'getBundleInfoForSelfSyncDefault end');
      })

    /*
      * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_5620
      * @tc.name: getBundleInfoForSelfApplicationCallback
      * @tc.desc: Test getBundleInfoForSelf with application flag(by callback).
      */
    it('getBundleInfoForSelfApplicationCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION, (err: BusinessError<void>, data : BundleInfo) => {
          hilog.info(domain, tag, 'getBundleInfoForSelfApplicationCallback  ====> start');
          hilog.info(domain, tag, 'getBundleInfoForSelfApplicationCallback  ====> data' + JSON.stringify(data));
          expect(data.appInfo.debug).assertTrue();
          expect(data.appInfo.bundleType).assertEqual(bundle.BundleType.APP);
          expect(data.appInfo.name).assertEqual(BUNDLE_NAME);
          expect(data.appInfo.description).assertEqual("$string:module_desc");
          expect(data.appInfo.descriptionId).assertLarger(0.0);
          expect(data.appInfo.enabled).assertTrue();
          expect(data.appInfo.label).assertEqual("$string:app_name");
          expect(data.appInfo.labelId).assertLarger(0.0);
          expect(data.appInfo.icon).assertEqual("$media:app_icon");
          expect(data.appInfo.iconId).assertLarger(0.0);
          expect(data.appInfo.process).assertEqual(BUNDLE_NAME);
          expect(data.appInfo.codePath).assertEqual("/data/app/el1/bundle/public/ohos.acts.bundle.stage.test.static");
          expect(data.appInfo.removable).assertTrue();
          expect(data.appInfo.accessTokenId).assertLarger(0.0);
          expect(data.appInfo.uid).assertLarger(0.0);
          expect(data.appInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME);
          expect(data.appInfo.iconResource.moduleName).assertEqual("entry");
          expect(data.appInfo.iconResource.id).assertEqual(data.appInfo.iconId);
          expect(data.appInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME);
          expect(data.appInfo.labelResource.moduleName).assertEqual("entry");
          expect(data.appInfo.labelResource.id).assertLarger(0.0);
          expect(data.appInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME);
          expect(data.appInfo.descriptionResource.moduleName).assertEqual("entry");
          expect(data.appInfo.descriptionResource.id).assertLarger(0.0);
          expect(data.appInfo.appDistributionType).assertEqual("os_integration");
          expect(data.appInfo.appProvisionType).assertEqual("release");
          expect(data.appInfo.permissions.length).assertEqual(0.0);
          expect(data.appInfo.systemApp).assertEqual(false);
          expect(data.appInfo.dataUnclearable).assertFalse();
          expect(data.hapModulesInfo.length + '').assertEqual('0');
          expect(data.hapModulesInfo.length + '').assertEqual('0');
          expect(data.reqPermissionDetails.length + '').assertEqual('0');
          expect(data.permissionGrantStates.length + '').assertEqual('0');
          expect(data.signatureInfo).assertEqual(null);
          expect(data.appInfo.installSource).assertEqual("unknown");
          expect(data.appInfo.releaseType.length).assertLarger(0.0);
          expect(data.appInfo.cloudFileSyncEnabled).assertFalse();
          hilog.info(domain, tag, 'getBundleInfoForSelfApplicationCallback  ====> end');
          done();
        })
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_5600
     * @tc.name: getBundleInfoForSelfApplicationPromise
     * @tc.desc: Test getBundleInfoForSelf with application flag(by promise).
     */
    it('getBundleInfoForSelfApplicationPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION).then((data : BundleInfo) => {
          hilog.info(domain, tag, 'getBundleInfoForSelfApplicationPromise  ====> start');
          expect(data.appInfo.debug).assertTrue();
          expect(data.appInfo.bundleType).assertEqual(bundle.BundleType.APP);
          expect(data.appInfo.name).assertEqual(BUNDLE_NAME);
          expect(data.appInfo.description).assertEqual("$string:module_desc");
          expect(data.appInfo.descriptionId).assertLarger(0.0);
          expect(data.appInfo.enabled).assertTrue();
          expect(data.appInfo.label).assertEqual("$string:app_name");
          expect(data.appInfo.labelId).assertLarger(0.0);
          expect(data.appInfo.icon).assertEqual("$media:app_icon");
          expect(data.appInfo.iconId).assertLarger(0.0);
          expect(data.appInfo.process).assertEqual(BUNDLE_NAME);
          expect(data.appInfo.codePath).assertEqual("/data/app/el1/bundle/public/ohos.acts.bundle.stage.test.static");
          expect(data.appInfo.removable).assertTrue();
          expect(data.appInfo.accessTokenId).assertLarger(0.0);
          expect(data.appInfo.uid).assertLarger(0.0);
          expect(data.appInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME);
          expect(data.appInfo.iconResource.moduleName).assertEqual("entry");
          expect(data.appInfo.iconResource.id).assertEqual(data.appInfo.iconId);
          expect(data.appInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME);
          expect(data.appInfo.labelResource.moduleName).assertEqual("entry");
          expect(data.appInfo.labelResource.id).assertLarger(0.0);
          expect(data.appInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME);
          expect(data.appInfo.descriptionResource.moduleName).assertEqual("entry");
          expect(data.appInfo.descriptionResource.id).assertLarger(0.0);
          expect(data.appInfo.appDistributionType).assertEqual("os_integration");
          expect(data.appInfo.appProvisionType).assertEqual("release");
          expect(data.appInfo.permissions.length).assertEqual(0.0);
          expect(data.appInfo.systemApp).assertEqual(false);
          expect(data.appInfo.dataUnclearable).assertFalse();
          expect(data.hapModulesInfo.length + '').assertEqual('0');
          expect(data.hapModulesInfo.length + '').assertEqual('0');
          expect(data.reqPermissionDetails.length + '').assertEqual('0');
          expect(data.permissionGrantStates.length + '').assertEqual('0');
          expect(data.signatureInfo).assertEqual(null);
          expect(data.appInfo.installSource).assertEqual("unknown");
          expect(data.appInfo.releaseType.length).assertLarger(0.0);
          expect(data.appInfo.cloudFileSyncEnabled).assertFalse();
          hilog.info(domain, tag, 'getBundleInfoForSelfApplicationPromise  ====> end');
          done();
        }).catch(err => {
          hilog.info(domain, tag, 'getBundleInfoForSelfApplicationPromise  ====> err');
          expect(err).assertFail();
          done();
        })
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_5610
     * @tc.name: getBundleInfoForSelfApplicationSync
     * @tc.desc: Test getBundleInfoForSelf with application flag(by sync).
     */
    it('getBundleInfoForSelfApplicationSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let data: bundle.BundleInfo =
          bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
        hilog.info(domain, tag, 'getBundleInfoForSelfApplicationSync  ====> start');
        expect(data.appInfo.debug).assertTrue();
        expect(data.appInfo.bundleType).assertEqual(bundle.BundleType.APP);
        expect(data.appInfo.name).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.description).assertEqual("$string:module_desc");
        expect(data.appInfo.descriptionId).assertLarger(0.0);
        expect(data.appInfo.enabled).assertTrue();
        expect(data.appInfo.label).assertEqual("$string:app_name");
        expect(data.appInfo.labelId).assertLarger(0.0);
        expect(data.appInfo.icon).assertEqual("$media:app_icon");
        expect(data.appInfo.iconId).assertLarger(0.0);
        expect(data.appInfo.process).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.codePath).assertEqual("/data/app/el1/bundle/public/ohos.acts.bundle.stage.test.static");
        expect(data.appInfo.removable).assertTrue();
        expect(data.appInfo.accessTokenId).assertLarger(0.0);
        expect(data.appInfo.uid).assertLarger(0.0);
        expect(data.appInfo.iconResource.bundleName).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.iconResource.moduleName).assertEqual("entry");
        expect(data.appInfo.iconResource.id).assertEqual(data.appInfo.iconId);
        expect(data.appInfo.labelResource.bundleName).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.labelResource.moduleName).assertEqual("entry");
        expect(data.appInfo.labelResource.id).assertLarger(0.0);
        expect(data.appInfo.descriptionResource.bundleName).assertEqual(BUNDLE_NAME);
        expect(data.appInfo.descriptionResource.moduleName).assertEqual("entry");
        expect(data.appInfo.descriptionResource.id).assertLarger(0.0);
        expect(data.appInfo.appDistributionType).assertEqual("os_integration");
        expect(data.appInfo.appProvisionType).assertEqual("release");
        expect(data.appInfo.permissions.length).assertEqual(0.0);
        expect(data.appInfo.systemApp).assertEqual(false);
        expect(data.appInfo.dataUnclearable).assertFalse();
        expect(data.hapModulesInfo.length + '').assertEqual('0');
        expect(data.hapModulesInfo.length + '').assertEqual('0');
        expect(data.reqPermissionDetails.length + '').assertEqual('0');
        expect(data.permissionGrantStates.length + '').assertEqual('0');
        expect(data.signatureInfo).assertEqual(null);
        expect(data.appInfo.installSource).assertEqual("unknown");
        expect(data.appInfo.releaseType.length).assertLarger(0.0);
        expect(data.appInfo.cloudFileSyncEnabled).assertFalse();
        hilog.info(domain, tag, 'getBundleInfoForSelfApplicationSync  ====> end');
        done();
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_5660
     * @tc.name: getBundleInfoForSelfCallbackHapModuleInfo
     * @tc.desc: Test getBundleInfoForSelf with hapModuleInfo flag(by callback).
     */
    it('getBundleInfoForSelfCallbackHapModuleInfo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE, (err: BusinessError<void>, data : BundleInfo) => {
          hilog.info(domain, tag, 'getBundleInfoForSelfCallbackHapModuleInfo  ====> start');
          hilog.info(0x0000, tag, 'getBundleInfoForSelfCallbackHapModuleInfo  ====> ' + JSON.stringify(data));
          expect(data.appInfo).assertEqual(null);
          expect(data.hapModulesInfo.length).assertEqual(1.0);
          expect(data.hapModulesInfo[0].name).assertEqual("entry");
          expect(data.hapModulesInfo[0].icon).assertEqual("$media:layered_image");
          expect(data.hapModulesInfo[0].iconId).assertLarger(0.0);
          expect(data.hapModulesInfo[0].label).assertEqual("$string:EntryAbility_label");
          expect(data.hapModulesInfo[0].labelId).assertLarger(0.0);
          expect(data.hapModulesInfo[0].description).assertEqual("$string:module_desc");
          expect(data.hapModulesInfo[0].descriptionId).assertLarger(0.0);
          expect(data.hapModulesInfo[0].mainElementName).assertEqual("EntryAbility");
          expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0.0);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0.0);
          expect(data.hapModulesInfo[0].metadata.length).assertEqual(0.0);
          expect(data.hapModulesInfo[0].deviceTypes.length).assertEqual(0.0);
          expect(data.hapModulesInfo[0].installationFree).assertFalse();
          expect(data.hapModulesInfo[0].hashValue).assertEqual("");
          expect(data.hapModulesInfo[0].dependencies.length).assertEqual(0.0);
          expect(data.hapModulesInfo[0].preloads.length).assertEqual(0.0);
          expect(data.routerMap.length).assertEqual(0.0);
          expect(data.reqPermissionDetails.length).assertEqual(0.0);
          expect(data.permissionGrantStates.length).assertEqual(0.0);
          expect(data.signatureInfo).assertEqual(null);
          expect(data.hapModulesInfo[0].codePath).assertEqual("/data/storage/el1/bundle/entry.hap");
          expect(data.hapModulesInfo[0].nativeLibraryPath).assertEqual("");
          expect(data.hapModulesInfo[0].fileContextMenuConfig).assertEqual("");
          hilog.info(domain, tag, 'getBundleInfoForSelfCallbackHapModuleInfo  ====> end');
          done();
        })
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_5640
     * @tc.name: getBundleInfoForSelfHapModuleInfoPromise
     * @tc.desc: Test getBundleInfoForSelf with hapModuleInfo flag(by promise).
     */
    it('getBundleInfoForSelfHapModuleInfoPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE).then((data : BundleInfo) => {
          hilog.info(domain, tag, 'getBundleInfoForSelfHapModuleInfoPromise  ====> start');
          expect(data.appInfo).assertEqual(null);
          expect(data.hapModulesInfo.length).assertEqual(1.0);
          expect(data.hapModulesInfo[0].name).assertEqual("entry");
          expect(data.hapModulesInfo[0].icon).assertEqual("$media:layered_image");
          expect(data.hapModulesInfo[0].iconId).assertLarger(0.0);
          expect(data.hapModulesInfo[0].label).assertEqual("$string:EntryAbility_label");
          expect(data.hapModulesInfo[0].labelId).assertLarger(0.0);
          expect(data.hapModulesInfo[0].description).assertEqual("$string:module_desc");
          expect(data.hapModulesInfo[0].descriptionId).assertLarger(0.0);
          expect(data.hapModulesInfo[0].mainElementName).assertEqual("EntryAbility");
          expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0.0);
          expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0.0);
          expect(data.hapModulesInfo[0].metadata.length).assertEqual(0.0);
          expect(data.hapModulesInfo[0].deviceTypes.length).assertEqual(0.0);
          expect(data.hapModulesInfo[0].installationFree).assertFalse();
          expect(data.hapModulesInfo[0].hashValue).assertEqual("");
          expect(data.hapModulesInfo[0].dependencies.length).assertEqual(0.0);
          expect(data.hapModulesInfo[0].preloads.length).assertEqual(0.0);
          expect(data.routerMap.length).assertEqual(0.0);
          expect(data.reqPermissionDetails.length).assertEqual(0.0);
          expect(data.permissionGrantStates.length).assertEqual(0.0);
          expect(data.signatureInfo).assertEqual(null);
          expect(data.hapModulesInfo[0].codePath).assertEqual("/data/storage/el1/bundle/entry.hap");
          expect(data.hapModulesInfo[0].nativeLibraryPath).assertEqual("");
          expect(data.hapModulesInfo[0].fileContextMenuConfig).assertEqual("");
          hilog.info(domain, tag, 'getBundleInfoForSelfHapModuleInfoPromise  ====> end');
          done();
        }).catch(err => {
          hilog.info(domain, tag, 'getBundleInfoForSelfHapModuleInfoPromise  ====> err');
          expect(err).assertFail();
          done();
        })
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_7060
     * @tc.name: getBundleInfoForSelfHapModuleInfoSync
     * @tc.desc: Test getBundleInfoForSelf with HapModuleInfo flag(by sync).
     */
    it('getBundleInfoForSelfHapModuleInfoSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let data: bundle.BundleInfo =
          bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE);
        hilog.info(domain, tag, 'getBundleInfoForSelfHapModuleInfoSync  ====> start');
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo.length).assertEqual(1.0);
        expect(data.hapModulesInfo[0].name).assertEqual("entry");
        expect(data.hapModulesInfo[0].icon).assertEqual("$media:layered_image");
        expect(data.hapModulesInfo[0].iconId).assertLarger(0.0);
        expect(data.hapModulesInfo[0].label).assertEqual("$string:EntryAbility_label");
        expect(data.hapModulesInfo[0].labelId).assertLarger(0.0);
        expect(data.hapModulesInfo[0].description).assertEqual("$string:module_desc");
        expect(data.hapModulesInfo[0].descriptionId).assertLarger(0.0);
        expect(data.hapModulesInfo[0].mainElementName).assertEqual("EntryAbility");
        expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0.0);
        expect(data.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0.0);
        expect(data.hapModulesInfo[0].metadata.length).assertEqual(0.0);
        expect(data.hapModulesInfo[0].deviceTypes.length).assertEqual(0.0);
        expect(data.hapModulesInfo[0].installationFree).assertFalse();
        expect(data.hapModulesInfo[0].hashValue).assertEqual("");
        expect(data.hapModulesInfo[0].dependencies.length).assertEqual(0.0);
        expect(data.hapModulesInfo[0].preloads.length).assertEqual(0.0);
        expect(data.routerMap.length).assertEqual(0.0);
        expect(data.reqPermissionDetails.length).assertEqual(0.0);
        expect(data.permissionGrantStates.length).assertEqual(0.0);
        expect(data.signatureInfo).assertEqual(null);
        expect(data.hapModulesInfo[0].codePath).assertEqual("/data/storage/el1/bundle/entry.hap");
        expect(data.hapModulesInfo[0].nativeLibraryPath).assertEqual("");
        expect(data.hapModulesInfo[0].fileContextMenuConfig).assertEqual("");
        hilog.info(domain, tag, 'getBundleInfoForSelfHapModuleInfoSync  ====> end');
        done();
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_7080
     * @tc.name: getBundleInfoForSelfCallbackAbilitiesInfo
     * @tc.desc: Test getBundleInfoForSelf with ability flag(by callback).
     */
    it('getBundleInfoForSelfCallbackAbilitiesInfo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY, (err: BusinessError<void>, data : BundleInfo) => {
          hilog.info(domain, tag, 'getBundleInfoForSelfCallbackAbilitiesInfo  ====> start');
          hilog.info(domain, tag, 'getBundleInfoForSelfCallbackAbilitiesInfo  ====> data' + JSON.stringify(data));
          hilog.info(domain, tag, 'getBundleInfoForSelfCallbackAbilitiesInfo  ====> err' + JSON.stringify(err));
          expect(data.appInfo).assertEqual(null);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(BUNDLE_NAME);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual("entry");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].name).assertEqual("EntryAbility");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].label).assertEqual("$string:EntryAbility_label");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].labelId).assertLarger(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].description).assertEqual("$string:EntryAbility_desc");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].descriptionId).assertLarger(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].icon).assertEqual("$media:layered_image");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].iconId).assertLarger(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].process).assertEqual("");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].exported).assertTrue();
          expect(data.hapModulesInfo[0].abilitiesInfo[0].excludeFromDock).assertFalse();
          expect(data.hapModulesInfo[0].abilitiesInfo[0].orientation).assertEqual(bundle.DisplayOrientation.PORTRAIT);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].orientationId).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].launchType).assertEqual(bundle.LaunchType.SINGLETON);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].permissions.length).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].deviceTypes.length).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].skills.length).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].metadata.length).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].enabled).assertTrue();
          expect(data.hapModulesInfo[0].abilitiesInfo[0].appIndex).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].supportWindowModes.length).assertEqual(3);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowRatio).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowRatio).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowWidth).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowWidth).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowHeight).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowHeight).assertEqual(0.0);
          hilog.info(domain, tag, 'getBundleInfoForSelfCallbackAbilitiesInfo  ====> end');
          done();
        })
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_7070
     * @tc.name: getBundleInfoForSelfAbilitiesInfoPromise
     * @tc.desc: Test getBundleInfoForSelf with AbilitiesInfo flag(by promise).
     */
    it('getBundleInfoForSelfAbilitiesInfoPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY).then((data : BundleInfo) => {
          hilog.info(domain, tag, 'getBundleInfoForSelfAbilitiesInfoPromise  ====> start');
          expect(data.appInfo).assertEqual(null);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(BUNDLE_NAME);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual("entry");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].name).assertEqual("EntryAbility");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].label).assertEqual("$string:EntryAbility_label");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].labelId).assertLarger(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].description).assertEqual("$string:EntryAbility_desc");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].descriptionId).assertLarger(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].icon).assertEqual("$media:layered_image");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].iconId).assertLarger(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].process).assertEqual("");
          expect(data.hapModulesInfo[0].abilitiesInfo[0].exported).assertTrue();
          expect(data.hapModulesInfo[0].abilitiesInfo[0].excludeFromDock).assertFalse();
          expect(data.hapModulesInfo[0].abilitiesInfo[0].orientation).assertEqual(bundle.DisplayOrientation.PORTRAIT);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].orientationId).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].launchType).assertEqual(bundle.LaunchType.SINGLETON);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].permissions.length).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].deviceTypes.length).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].skills.length).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].metadata.length).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].enabled).assertTrue();
          expect(data.hapModulesInfo[0].abilitiesInfo[0].appIndex).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].supportWindowModes.length).assertEqual(3);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowRatio).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowRatio).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowWidth).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowWidth).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowHeight).assertEqual(0.0);
          expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowHeight).assertEqual(0.0);
          hilog.info(domain, tag, 'getBundleInfoForSelfAbilitiesInfoPromise  ====> end');
          done();
        }).catch(err => {
          hilog.info(domain, tag, 'getBundleInfoForSelfAbilitiesInfoPromise  ====> err');
          expect(err).assertFail();
          done();
        })
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_7090
     * @tc.name: getBundleInfoForSelfAbilitiesInfoSync
     * @tc.desc: Test getBundleInfoForSelf with AbilitiesInfo flag(by sync).
     */
    it('getBundleInfoForSelfAbilitiesInfoSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let data: bundle.BundleInfo =
          bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY);
        hilog.info(domain, tag, 'getBundleInfoForSelfAbilitiesInfoSync  ====> start');
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].bundleName).assertEqual(BUNDLE_NAME);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].moduleName).assertEqual("entry");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].name).assertEqual("EntryAbility");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].label).assertEqual("$string:EntryAbility_label");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].labelId).assertLarger(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].description).assertEqual("$string:EntryAbility_desc");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].descriptionId).assertLarger(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].icon).assertEqual("$media:layered_image");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].iconId).assertLarger(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].process).assertEqual("");
        expect(data.hapModulesInfo[0].abilitiesInfo[0].exported).assertTrue();
        expect(data.hapModulesInfo[0].abilitiesInfo[0].excludeFromDock).assertFalse();
        expect(data.hapModulesInfo[0].abilitiesInfo[0].orientation).assertEqual(bundle.DisplayOrientation.PORTRAIT);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].orientationId).assertEqual(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].launchType).assertEqual(bundle.LaunchType.SINGLETON);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].permissions.length).assertEqual(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].deviceTypes.length).assertEqual(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].skills.length).assertEqual(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].metadata.length).assertEqual(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].enabled).assertTrue();
        expect(data.hapModulesInfo[0].abilitiesInfo[0].appIndex).assertEqual(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].supportWindowModes.length).assertEqual(3);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowRatio).assertEqual(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowRatio).assertEqual(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowWidth).assertEqual(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowWidth).assertEqual(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.maxWindowHeight).assertEqual(0.0);
        expect(data.hapModulesInfo[0].abilitiesInfo[0].windowSize.minWindowHeight).assertEqual(0.0);
        hilog.info(domain, tag, 'getBundleInfoForSelfAbilitiesInfoSync  ====> end');
        done();
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_7100
     * @tc.name: getBundleInfoForSelfSyncExtensionAbilitiesInfo
     * @tc.desc: Test getBundleInfoForSelfSync with extensionAbilitiesInfo flag.
     */
    it('getBundleInfoForSelfSyncExtensionAbilitiesInfo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let data = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundle.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY);
        // console.info("getBundleInfoForSelfSyncExtensionAbilitiesInfo" + JSON.stringify(data.hapModulesInfo[0].extensionAbilitiesInfo));
        console.info("checkCommonBundleInfo start");
        expect(data.name).assertEqual(BUNDLE_NAME);
        expect(data.vendor).assertEqual(VENDOR);
        expect(data.versionCode + '').assertEqual('1000000');
        expect(data.versionName).assertEqual("1.0.0");
        expect(data.minCompatibleVersionCode + '').assertEqual('1000000');
        expect(data.targetVersion  + '').assertEqual('20');
        expect(data.installTime).assertLarger(0.0);
        expect(data.updateTime).assertLarger(0.0);
        expect(data.firstInstallTime).assertLarger(0.0);
        expect(data.appIndex).assertEqual(0.0);
        console.info("checkCommonBundleInfo end");
        expect(data.hapModulesInfo.length).assertEqual(1.0);
        expect(data.hapModulesInfo[0].name + '').assertEqual("entry");
        expect(data.hapModulesInfo[0].label + '').assertEqual("$string:EntryAbility_label");
        expect(data.hapModulesInfo[0].labelId).assertLarger(0.0);
        expect(data.hapModulesInfo[0].description + '').assertEqual("$string:module_desc");
        expect(data.hapModulesInfo[0].descriptionId).assertLarger(0.0);
        expect(data.hapModulesInfo[0].mainElementName + '').assertEqual("EntryAbility");
        expect(data.hapModulesInfo[0].deviceTypes.length).assertEqual(0.0);
        expect(data.hapModulesInfo[0].installationFree).assertFalse();
        expect(data.hapModulesInfo[0].hashValue + '').assertEqual("");
        console.info("checkCommonHapModuleInfo end");
        expect(data.appInfo).assertEqual(null);
        expect(data.hapModulesInfo[0].abilitiesInfo.length).assertEqual(0.0);
        let extensionList = data.hapModulesInfo[0].extensionAbilitiesInfo
        expect(extensionList.length).assertEqual(26);
        let count = 0;
        for (let i = 0; i < 24; i++) {
          switch (extensionList[i].name) {
            case "Form":
              console.info("Form" + JSON.stringify(extensionList[i]));
              expect(extensionList[i].bundleName).assertEqual(BUNDLE_NAME);
              expect(extensionList[i].moduleName + '').assertEqual("entry");
              expect(extensionList[i].name + '').assertEqual("Form");
              expect(extensionList[i].labelId).assertLarger(0.0);
              expect(extensionList[i].descriptionId).assertLarger(0.0);
              expect(extensionList[i].iconId).assertLarger(0.0);
              expect(extensionList[i].exported).assertTrue();
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.FORM);
              expect(extensionList[i].extensionAbilityTypeName + '').assertEqual("form");
              expect(extensionList[i].permissions.length).assertEqual(0.0);
              expect(extensionList[i].applicationInfo).not().assertEqual(null);
              expect(extensionList[i].metadata.length).assertEqual(0.0);
              expect(extensionList[i].enabled).assertTrue();
              expect(extensionList[i].readPermission + '').assertEqual("");
              expect(extensionList[i].writePermission + '').assertEqual("");
              expect(extensionList[i].skills + '').assertEqual("");
              expect(extensionList[i].appIndex).assertEqual(0.0);
              count = count + 1;
              break;
            case "Form1":
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].bundleName).assertEqual(BUNDLE_NAME);
              expect(extensionList[i].moduleName + '').assertEqual("entry");
              expect(extensionList[i].name + '').assertEqual("Form1");
              expect(extensionList[i].labelId).assertLarger(0.0);
              expect(extensionList[i].descriptionId).assertLarger(0.0);
              expect(extensionList[i].iconId).assertLarger(0.0);
              expect(extensionList[i].exported).assertTrue();
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.FORM);
              expect(extensionList[i].permissions.length).assertEqual(0.0);
              expect(extensionList[i].applicationInfo).not().assertEqual(null);
              expect(extensionList[i].metadata.length).assertEqual(0.0);
              expect(extensionList[i].enabled).assertTrue();
              expect(extensionList[i].readPermission + '').assertEqual("");
              expect(extensionList[i].writePermission + '').assertEqual("");
              expect(extensionList[i].appIndex).assertEqual(0.0);
              count = count + 2;
              break;
            case 'workScheduler':
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.WORK_SCHEDULER)
              count = count + 3;
              break;
            case 'inputMethod':
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.INPUT_METHOD)
              count = count + 4;
              break;
            case 'accessibility':
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.ACCESSIBILITY)
              count = count + 5;
              break;
            case 'fileShare':
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.FILE_SHARE)
              count = count + 6;
              break;
            case 'staticSubscriber':
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.STATIC_SUBSCRIBER)
              count = count + 7;
              break;
            case 'wallpaper':
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.WALLPAPER)
              count = count + 8;
              break;
            case 'backup':
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.BACKUP)
              count = count + 9;
              break;
            case 'window':
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.WINDOW)
              count = count + 10;
              break;
            case 'enterpriseAdmin':
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.ENTERPRISE_ADMIN)
              count = count + 11;
              break;
            case 'thumbnail':
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.THUMBNAIL)
              count = count + 12;
              break;
            case 'preview':
              console.info("Form" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.PREVIEW)
              count = count + 13;
              break;
            case 'driver':
              console.info("driver" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.DRIVER)
              count = count + 14;
              break;
            case 'push':
              console.info("push" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.PUSH)
              count = count + 15;
              break;
            case 'share':
              console.info("share" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.SHARE)
              count = count + 16;
              break;
            case 'action':
              console.info("action" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.ACTION)
              count = count + 17;
              break;
            case 'adsService':
              console.info("adsService" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.ADS_SERVICE)
              count = count + 18;
              break;
            case 'embeddedUI':
              console.info("embeddedUI" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.EMBEDDED_UI)
              count = count + 19;
              break;
            case 'assetAcceleration':
              console.info("assetAcceleration" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.ASSET_ACCELERATION)
              count = count + 20;
              break;
            case 'print':
              console.info("print" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.PRINT)
              count = count + 21;
              break;
            case 'insightIntentUI':
              console.info("insightIntentUI" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.INSIGHT_INTENT_UI)
              count = count + 22;
              break;
            case 'fence':
              console.info("fence" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.FENCE)
              count = count + 23;
              break;
            case 'formEdit':
              console.info("formEdit" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.FORM_EDIT)
              count = count + 24;
              break;
            case 'distributed':
              console.info("distributed" + JSON.stringify(extensionList[i].extensionAbilityType));
              expect(extensionList[i].extensionAbilityType).assertEqual(bundle.ExtensionAbilityType.DISTRIBUTED)
              count = count + 25;
              break;
          }
          console.info("count" + JSON.stringify(count));
        }
        expect(count).assertEqual(312);
        expect(data.hapModulesInfo[0].metadata.length).assertEqual(0);
        expect(data.reqPermissionDetails.length).assertEqual(0);
        expect(data.permissionGrantStates.length).assertEqual(0);
        expect(data.signatureInfo).assertEqual(null);
        done();
    })
  })
}