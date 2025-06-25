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
        bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT,
          (err: BusinessError<void> | null, data: BundleInfo | undefined) => {
            hilog.info(domain, tag, 'getBundleInfoForSelfPromiseDefault  ====> start');
            hilog.info(domain, tag, 'getBundleInfoForSelfCallbackDefault  ====> data' + JSON.stringify(data));
            hilog.info(domain, tag, 'getBundleInfoForSelfCallbackDefault  ====> err' + JSON.stringify(err));
            if (data !== undefined) {
              expect(data.name).assertEqual(BUNDLE_NAME);
              expect(data.vendor).assertEqual(VENDOR);
              expect(data.versionCode + '').assertEqual('1000000');
              expect(data.versionName).assertEqual("1.0.0");
              expect(data.minCompatibleVersionCode + '').assertEqual('1000000');
              expect(data.targetVersion + '').assertEqual('20');
              expect(data.installTime).assertLarger(0.0);
              expect(data.updateTime).assertLarger(0.0);
              expect(data.firstInstallTime).assertLarger(0.0);
              expect(data.appInfo).assertEqual(null);
              expect(data.hapModulesInfo.length + '').assertEqual('0');
              expect(data.reqPermissionDetails.length + '').assertEqual('0');
              expect(data.permissionGrantStates.length + '').assertEqual('0');
              hilog.info(domain, tag, 'getBundleInfoForSelfPromiseDefault  ====> end');
              done();
            }
          })
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_5560
     * @tc.name: getBundleInfoForSelfPromiseDefault
     * @tc.desc: Test getBundleInfoForSelf with default flag(by promise).
     */
    it('getBundleInfoForSelfPromiseDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_DEFAULT).then((data: BundleInfo) => {
          hilog.info(domain, tag, 'getBundleInfoForSelfPromiseDefault  ====> start');
          expect(data.name).assertEqual(BUNDLE_NAME);
          expect(data.vendor).assertEqual(VENDOR);
          expect(data.versionCode + '').assertEqual('1000000');
          expect(data.versionName).assertEqual("1.0.0");
          expect(data.minCompatibleVersionCode + '').assertEqual('1000000');
          expect(data.targetVersion + '').assertEqual('20');
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
        expect(data.targetVersion + '').assertEqual('20');
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
        bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION,
          (err: BusinessError<void> | null, data: BundleInfo | undefined) => {
            hilog.info(domain, tag, 'getBundleInfoForSelfApplicationCallback  ====> start');
            hilog.info(domain, tag, 'getBundleInfoForSelfApplicationCallback  ====> data' + JSON.stringify(data));
            if (data !== undefined) {
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
              expect(data.appInfo.codePath)
                .assertEqual("/data/app/el1/bundle/public/ohos.acts.bundle.stage.test.static");
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
            }
          })
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_5600
     * @tc.name: getBundleInfoForSelfApplicationPromise
     * @tc.desc: Test getBundleInfoForSelf with application flag(by promise).
     */
    it('getBundleInfoForSelfApplicationPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION)
          .then((data: BundleInfo) => {
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
          })
          .catch(err => {
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
        bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE,
          (err: BusinessError<void> | null, data: BundleInfo | undefined) => {
            hilog.info(domain, tag, 'getBundleInfoForSelfCallbackHapModuleInfo  ====> start');
            hilog.info(0x0000, tag, 'getBundleInfoForSelfCallbackHapModuleInfo  ====> ' + JSON.stringify(data));
            if (data !== undefined) {
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
            }
          })
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_5640
     * @tc.name: getBundleInfoForSelfHapModuleInfoPromise
     * @tc.desc: Test getBundleInfoForSelf with hapModuleInfo flag(by promise).
     */
    it('getBundleInfoForSelfHapModuleInfoPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE)
          .then((data: BundleInfo) => {
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
          })
          .catch(err => {
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
        bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY,
          (err: BusinessError<void> | null, data: BundleInfo | undefined) => {
            hilog.info(domain, tag, 'getBundleInfoForSelfCallbackAbilitiesInfo  ====> start');
            hilog.info(domain, tag, 'getBundleInfoForSelfCallbackAbilitiesInfo  ====> data' + JSON.stringify(data));
            hilog.info(domain, tag, 'getBundleInfoForSelfCallbackAbilitiesInfo  ====> err' + JSON.stringify(err));
            if (data !== undefined) {
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
              expect(data.hapModulesInfo[0].abilitiesInfo[0].orientation)
                .assertEqual(bundle.DisplayOrientation.PORTRAIT);
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
            }
          })
      })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo_static_7070
     * @tc.name: getBundleInfoForSelfAbilitiesInfoPromise
     * @tc.desc: Test getBundleInfoForSelf with AbilitiesInfo flag(by promise).
     */
    it('getBundleInfoForSelfAbilitiesInfoPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY).then((data: BundleInfo) => {
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
          bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
          bundle.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY);
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
  })
}