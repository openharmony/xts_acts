import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';

import inspector from '@ohos.arkui.inspector';
import { loadAndSetUpUiTest } from '@ohos.UiTest';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext: common.UIAbilityContext;

export default function webViewController() {

  describe("WebViewControllerTestSuite", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(() => {
      loadAndSetUpUiTest()

      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void => {
          // let str1:string = abilitys.context.filesDir
          // hilog.info(domain, tag, '%{public}s', 'beforeAll fileDir' + str1);
          // if (abilitys.context) {
          //     hilog.info(domain, tag, '%{public}s', 'beforeAll context');
          //     if (abilitys.context.resourceManager) {}
          // }
          // abilityss.context.terminateSelf()
          testAbilityContext = abilitys.context
          hilog.info(domain, tag, '%{public}s', 'onAbilityCreate end');

        },
      }, (err: BusinessError): void => {
        if (err != null) {
          hilog.info(domain, tag, '%{public}s', '-----' + err.code);
        }
        hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
      });
      await Utils.sleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.pageInteraction.test.static")
      await Utils.sleep(2000)
      await Utils.emitEvent('pages/webViewController', 10)
      await Utils.sleep(2000)
      inspector.sendEventByKey('Router', 10, '');
      await Utils.sleep(2000)
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    /*
    * @tc.number     : SUB_WEB_ONSHOWFILESELECTOR_0100
    * @tc.name       : testOnShowFileSelector001
    * @tc.desc       : test onShowFileSelector
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOnShowFileSelectorStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testOnShowFileSelector001", 10)
        await Utils.sleep(2000);
        Utils.registerEvent("testOnShowFileSelector001", true, 31029, done);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /*
    * @tc.number     : SUB_WEB_FILESELECTORPARAM_GETTITLE_0100
    * @tc.name       : testFileSelectorParamGetTitle001
    * @tc.desc       : test FileSelectorParam getTitle
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFileSelectorParamGetTitleStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testFileSelectorParamGetTitle001", 10)
        await Utils.sleep(2000);
        Utils.registerEvent("testFileSelectorParamGetTitle001", 'open file', 31030, done);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /*
    * @tc.number     : SUB_WEB_FILESELECTORPARAM_GETMODE_0100
    * @tc.name       : testFileSelectorParamGetMode001
    * @tc.desc       : test FileSelectorParam getMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFileSelectorParamGetModeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testFileSelectorParamGetMode001", 10)
        await Utils.sleep(2000);
        Utils.registerEvent("testFileSelectorParamGetMode001", 0, 31031, done);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /*
    * @tc.number     : SUB_WEB_FILESELECTORPARAM_GETACCEPTTYPE_0100
    * @tc.name       : testFileSelectorParamGetAcceptType001
    * @tc.desc       : test FileSelectorParam getAcceptType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFileSelectorParamGetAcceptTypeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testFileSelectorParamGetAcceptType001", 10)
        await Utils.sleep(2000);
        Utils.registerEvent("testFileSelectorParamGetAcceptType001", '.json', 31032, done);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /*
   * @tc.number     : SUB_WEB_FILESELECTORPARAM_ISCAPTURE_0100
   * @tc.name       : testFileSelectorParamIsCapture001
   * @tc.desc       : test FileSelectorParam isCapture
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
   */
    it('testFileSelectorParamIsCaptureStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testFileSelectorParamIsCapture001", 10)
        await Utils.sleep(2000);
        Utils.registerEvent("testFileSelectorParamIsCapture001", false, 31033, done);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /*
    * @tc.number     : SUB_WEB_FILESELECTORRESULT_HANDLEFILELIST_0100
    * @tc.name       : testFileSelectorResultHandleFileList001
    * @tc.desc       : test FileSelectorResult handleFileList
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFileSelectorResultHandleFileListStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testFileSelectorResultHandleFileList001", 10)
        await Utils.sleep(2000);
        Utils.registerEvent("testFileSelectorResultHandleFileList001", "\"1.json\"", 31034, done);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /*
    * @tc.number     : SUB_WEB_FILESELECTORPARAM_GETMIMETYPES_0100
    * @tc.name       : testFileSelectorParamGetMimeTypes001
    * @tc.desc       : test FileSelectorParam getMimeTypes
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testFileSelectorParamGetMimeTypesStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testFileSelectorParamGetMimeTypes001", 10)
        await Utils.sleep(2000);
        Utils.registerEvent("testFileSelectorParamGetMimeTypes001", '.json', 31035, done);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');
        await Utils.sleep(3000)

        hilog.info(domain, tag, '%{public}s', 'afterAll start');
        Utils.emitEvent("back", 10)
        await Utils.sleep(2000);
        inspector.sendEventByKey('WebViewControllerButton', 10, '');

        done()
      })
  })

}