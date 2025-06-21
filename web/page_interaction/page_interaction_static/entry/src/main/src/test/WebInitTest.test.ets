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

export default function webInitTest() {

  describe("webInitTest", (): void => {
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
      await Utils.emitEvent('pages/WebInitTest', 10)
      await Utils.sleep(2000)
      inspector.sendEventByKey('Router', 10, '');
      await Utils.sleep(2000)
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_033
     *tc.name ContextMenuMediaType
     *tc.desic Save current page
     */
    it('ContextMenuMediaTypeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      await Utils.emitEvent("emitContextMenuMediaType", 10)
      Utils.registerEvent("ContextMenuMediaType", ContextMenuMediaType.Image, 33, done);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.sleep(3000)
      done()
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_034
     *tc.name ContextMenuInputFieldType
     *tc.desic Save current page
     */
    it('ContextMenuInputFieldTypeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      await Utils.emitEvent("emitContextMenuInputFieldType", 10)
      Utils.registerEvent("ContextMenuInputFieldType", ContextMenuInputFieldType.PlainText, 34, done);
      Utils.registerEvent("ContextMenuInputFieldType", ContextMenuInputFieldType.Telephone, 35, done);
      Utils.registerEvent("ContextMenuInputFieldType", ContextMenuInputFieldType.Other, 36, done);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.sleep(3000)
      done()
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_035
     *tc.name ContextMenuEditStateFlags
     *tc.desic Save current page
     */
    it('ContextMenuSourceTypeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      await Utils.emitEvent("ContextMenuSourceType", 10)
      Utils.registerEvent("ContextMenuSourceType", ContextMenuSourceType.None, 37, done);
      Utils.registerEvent("ContextMenuSourceType", ContextMenuSourceType.Mouse, 38, done);
      Utils.registerEvent("ContextMenuSourceType", ContextMenuSourceType.LongPress, 39, done);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.sleep(3000)
      done()
    })

    /*
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_API_014
     *tc.name requestFocus
     *tc.desic Gets the request focus
     */
    it('requestFocusStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      Utils.emitEvent("emitGetRequestFocus", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("requestFocus", "requestFocus", 126, done);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.sleep(3000)
      done()
    })

    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1100
      * tc.name testScrollableEleven
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableElevenStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      Utils.emitEvent("testScrollableEleven", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScrollableEleven", false, 234234, done);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.sleep(3000)
      done()
    })

    /*
      * tc.number SUB_ACE_BASIC_ETS_API_TESTSCROLLABLE_1200
      * tc.name testScrollableTwelve
      * tc.desc When the scrollTo interface is called, the y input parameter is a positive number and the x input
      * parameter is a positive number, both of which are greater than the page width and height
    */
    it('testScrollableTwelveStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      Utils.emitEvent("testScrollableTwelve", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testScrollableTwelve", true, 236236, done);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.sleep(3000)
      done()
    })

    /*
    * @tc.number      : SUB_WEB_JSRESULT_HANDLECANCEL_0100
    * @tc.name        : testJsResultHandleCancel001
    * @tc.desc        : test JsResultHandle.cancel()
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testJsResultHandleCancelStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      Utils.emitEvent("emitJsResultHandleCancel001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsResultHandleCancel001", "false", 70021, done);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.sleep(3000)
      done()
    })

    /*
    * @tc.number      : SUB_WEB_JSRESULT_HANDLECONFIRM_0100
    * @tc.name        : testJsResultHandleConfirm001
    * @tc.desc        : test JsResultHandle.confirm()
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testJsResultHandleConfirmStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      Utils.emitEvent("emitJsResultHandleConfirm001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testJsResultHandleConfirm001", "true", 70023, done);
      inspector.sendEventByKey('WebInitTestButton', 10, '');
      await Utils.sleep(3000)
      done()
    })

    /*
    * @tc.number      : SUB_WEB_JSRESULT_HANDLEPROMPTCONFIRM_0100
    * @tc.name        : testJsResultHandlePromptConfirm001
    * @tc.desc        : test JsResultHandle.promptConfirm()
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testJsResultHandlePromptConfirmStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        Utils.emitEvent("emitJsResultHandlePromptConfirm001", 10)
        await Utils.sleep(2000);
        Utils.registerEvent("testJsResultHandlePromptConfirm001", "\"handlePromptConfirm\"", 70025, done);
        inspector.sendEventByKey('WebInitTestButton', 10, '');
        await Utils.sleep(3000)

        hilog.info(domain, tag, '%{public}s', 'afterAll start');
        Utils.emitEvent("back", 10)
        await Utils.sleep(2000);
        inspector.sendEventByKey('WebInitTestButton', 10, '');

        done()
      })
  })

}