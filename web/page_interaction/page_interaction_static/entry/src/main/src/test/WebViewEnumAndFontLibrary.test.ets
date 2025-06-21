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
import { ContextMenuMediaType, ContextMenuInputFieldType, ContextMenuSourceType } from '@ohos.arkui.component'

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext: common.UIAbilityContext;

export default function WebViewEnumAndFontLibrary() {

  describe("WebViewEnumAndFontLibraryTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(() => {
      // loadAndSetUpUiTest()

      // hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      // let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      // abilityDelegator.addAbilityMonitor({
      //   abilityName: "EntryAbility",
      //   moduleName: "entry",
      //   onAbilityCreate: (abilitys: UIAbility): void => {
      //     // let str1:string = abilitys.context.filesDir
      //     // hilog.info(domain, tag, '%{public}s', 'beforeAll fileDir' + str1);
      //     // if (abilitys.context) {
      //     //     hilog.info(domain, tag, '%{public}s', 'beforeAll context');
      //     //     if (abilitys.context.resourceManager) {}
      //     // }
      //     // abilityss.context.terminateSelf()
      //     testAbilityContext = abilitys.context
      //     hilog.info(domain, tag, '%{public}s', 'onAbilityCreate end');
      //
      //   },
      // }, (err: BusinessError): void => {
      //   if (err != null) {
      //     hilog.info(domain, tag, '%{public}s', '-----' + err.code);
      //   }
      //   hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
      // });
      // await Utils.sleep(2000)
      // abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.pageInteraction.test.static")
      await Utils.sleep(2000)
      await Utils.emitEvent('pages/WebViewEnumAndFontLibrary', 10)
      await Utils.sleep(2000)
      inspector.sendEventByKey('Router', 10, '');
      await Utils.sleep(2000)
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMGETINPUTFIELDTYPE_0100
    * @tc.name       : testWebContextMenuParamGetInputFieldType001
    * @tc.desc       : test WebContextMenuParamGetInputFieldType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamGetInputFieldTypeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        Utils.emitEvent("emitWebContextMenuParamGetInputFieldType", 10)
        await Utils.sleep(2000);
        Utils.registerEvent("testWebContextMenuParamGetInputFieldType001", ContextMenuInputFieldType.None, 810, done);
        inspector.sendEventByKey('buttonEnumAndFontLibrary', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMGETSOURCETYPE_0100
    * @tc.name       : testWebContextMenuParamGetSourceType001
    * @tc.desc       : test WebContextMenuParamGetSourceType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamGetSourceTypeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        Utils.emitEvent("emitWebContextMenuParamGetSourceType", 10)
        await Utils.sleep(2000);
        Utils.registerEvent("testWebContextMenuParamGetSourceType001", ContextMenuSourceType.LongPress, 809, done);
        inspector.sendEventByKey('buttonEnumAndFontLibrary', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMGETMEDIATYPE_0100
    * @tc.name       : testWebContextMenuParamGetMediaType001
    * @tc.desc       : test WebContextMenuParamGetMediaType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamGetMediaTypeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        Utils.emitEvent("emitWebContextMenuParamGetMediaType", 10)
        await Utils.sleep(2000);
        Utils.registerEvent("testWebContextMenuParamGetMediaType001", ContextMenuMediaType.None, 807, done);
        inspector.sendEventByKey('buttonEnumAndFontLibrary', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMGETUNFILTEREDLINKURL_0100
    * @tc.name       : testWebContextMenuParamGetUnfilteredLinkUrl001
    * @tc.desc       : test WebContextMenuParamGetUnfilteredLinkUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamGetUnfilteredLinkUrlStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        Utils.emitEvent("emitWebContextMenuParamGetUnfilteredLinkUrl", 10)
        await Utils.sleep(2000);
        Utils.registerEvent("testWebContextMenuParamGetUnfilteredLinkUrl001", "http://www.baidu.com/", 804, done);
        inspector.sendEventByKey('buttonEnumAndFontLibrary', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENUPARAMGETLINKURL_0100
    * @tc.name       : testWebContextMenuParamGetLinkUrl001
    * @tc.desc       : test WebContextMenuParamGetLinkUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuParamGetLinkUrlStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        Utils.emitEvent("emitWebContextMenuParamGetLinkUrl", 10)
        await Utils.sleep(2000);
        Utils.registerEvent("testWebContextMenuParamGetLinkUrl001", "http://www.baidu.com/", 803, done);
        inspector.sendEventByKey('buttonEnumAndFontLibrary', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENURESULTCOPY_0100
    * @tc.name       : testWebContextMenuResultCopy001
    * @tc.desc       : test WebContextMenuResultCopy
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuResultCopyStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        Utils.emitEvent("emitWebContextMenuResultCopy", 10)
        await Utils.sleep(2000);
        Utils.registerEvent("testWebContextMenuResultCopy001", "copy", 1252, done);
        inspector.sendEventByKey('buttonEnumAndFontLibrary', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENURESULTCUT_0100
    * @tc.name       : testWebContextMenuResultCut001
    * @tc.desc       : test WebContextMenuResultCut
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuResultCutStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        Utils.emitEvent("emitWebContextMenuResultCut", 10)
        await Utils.sleep(2000);
        Utils.registerEvent("testWebContextMenuPResultCut001", "cut", 1253, done);
        inspector.sendEventByKey('buttonEnumAndFontLibrary', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENURESULTCOPYIMAGE_0100
    * @tc.name       : testWebContextMenuResultCopyImage001
    * @tc.desc       : test WebContextMenuResultCopyImage
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuResultCopyImageStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        Utils.emitEvent("emitWebContextMenuResultCopyImage", 10)
        await Utils.sleep(2000);
        Utils.registerEvent("testWebContextMenuPResultCopyImage001", "copyImage", 1254, done);
        inspector.sendEventByKey('buttonEnumAndFontLibrary', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENURESULTSELECTALL_0100
    * @tc.name       : testWebContextMenuResultSelectAll001
    * @tc.desc       : test WebContextMenuResultSelectAll
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuResultSelectAllStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        Utils.emitEvent("emitWebContextMenuResultSelectAll", 10)
        await Utils.sleep(2000);
        Utils.registerEvent("testWebContextMenuPResultSelectAll001", "selectAll", 1255, done);
        inspector.sendEventByKey('buttonEnumAndFontLibrary', 10, '');
        await Utils.sleep(3000)
        done()
      })

    /*
    * @tc.number     : SUB_WEB_WEBCONTEXTMENURESULTCLOSECONTEXTMENU_0100
    * @tc.name       : testWebContextMenuResultCloseContextMenu001
    * @tc.desc       : test WebContextMenuResultCloseContextMenu
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebContextMenuResultCloseContextMenuStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        Utils.emitEvent("emitWebContextMenuResultCloseContextMenu", 10)
        await Utils.sleep(2000);
        Utils.registerEvent("testWebContextMenuPResultCloseContextMenu001", "closeContextMenu", 1256, done);
        inspector.sendEventByKey('buttonEnumAndFontLibrary', 10, '');
        await Utils.sleep(3000)

        hilog.info(domain, tag, '%{public}s', 'afterAll start');
        Utils.emitEvent("back", 10)
        await Utils.sleep(2000);
        inspector.sendEventByKey('buttonEnumAndFontLibrary', 10, '');

        done()
      })
  })

}