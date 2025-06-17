import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityConstant from '@ohos.app.ability.AbilityConstant';

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function abilityTest() {

  describe("ActsAbilityTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    /*
     * @tc.number    : abilityConstant_WindowMode_WINDOW_MODE_FULLSCREEN_0100
     * @tc.name      : abilityConstant_WindowMode_WINDOW_MODE_FULLSCREEN_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("abilityConstant_WindowMode_WINDOW_MODE_FULLSCREEN_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'abilityConstant_WindowMode_WINDOW_MODE_FULLSCREEN_0100 start');
      expect(abilityConstant.WindowMode.WINDOW_MODE_FULLSCREEN + '').assertEqual('1');
      hilog.info(domain, tag, 'abilityConstant_WindowMode_WINDOW_MODE_FULLSCREEN_0100 done');
      done();
      hilog.info(domain, tag, 'abilityConstant_WindowMode_WINDOW_MODE_FULLSCREEN_0100 end');
    })

    /*
     * @tc.number    : abilityConstant_ContinueState_0200
     * @tc.name      : abilityConstant_ContinueState_0200
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("abilityConstant_ContinueState_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'abilityConstant_ContinueState_0200 start');
      expect(abilityConstant.ContinueState.ACTIVE + '').assertEqual('0');
      expect(abilityConstant.ContinueState.INACTIVE + '').assertEqual('1');
      hilog.info(domain, tag, 'abilityConstant_ContinueState_0200 done');
      done();
      hilog.info(domain, tag, 'abilityConstant_ContinueState_0200 end');
    })

    /*
     * @tc.number    : abilityConstant_MemoryLevel_0300
     * @tc.name      : abilityConstant_MemoryLevel_0300
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("abilityConstant_MemoryLevel_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'abilityConstant_MemoryLevel_0300 start');
      expect(abilityConstant.MemoryLevel.MEMORY_LEVEL_MODERATE + '').assertEqual('0');
      expect(abilityConstant.MemoryLevel.MEMORY_LEVEL_LOW+ '').assertEqual('1');
      expect(abilityConstant.MemoryLevel.MEMORY_LEVEL_CRITICAL+ '').assertEqual('2');
      hilog.info(domain, tag, 'abilityConstant_MemoryLevel_0300 done');
      done();
      hilog.info(domain, tag, 'abilityConstant_MemoryLevel_0300 end');
    })

    /*
     * @tc.number    : abilityConstant_LastExitReason_0400
     * @tc.name      : abilityConstant_LastExitReason_0400
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 3
     */
    it("abilityConstant_LastExitReason_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'abilityConstant_MemoryLevel_0300 start');
      expect(abilityConstant.LastExitReason.UNKNOWN+ '').assertEqual('0');
      expect(abilityConstant.LastExitReason.NORMAL+ '').assertEqual('2');
      expect(abilityConstant.LastExitReason.CPP_CRASH + '').assertEqual('3');
      expect(abilityConstant.LastExitReason.JS_ERROR+ '').assertEqual('4');
      expect(abilityConstant.LastExitReason.APP_FREEZE+ '').assertEqual('5');
      expect(abilityConstant.LastExitReason.PERFORMANCE_CONTROL+ '').assertEqual('6');
      expect(abilityConstant.LastExitReason.RESOURCE_CONTROL+ '').assertEqual('7');
      expect(abilityConstant.LastExitReason.UPGRADE+ '').assertEqual('8');
      expect(abilityConstant.LastExitReason.USER_REQUEST+ '').assertEqual('9');
      expect(abilityConstant.LastExitReason.SIGNAL+ '').assertEqual('10');
      hilog.info(domain, tag, 'abilityConstant_LastExitReason_0400 done');
      done();
      hilog.info(domain, tag, 'abilityConstant_LastExitReason_0400 end');
    })

    /**
     * @tc.number    : Context_resourceManager_0300
     * @tc.name      : Context_resourceManager_0300
     * @tc.desc      : Function test
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('Context_resourceManager_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "begin");
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      hilog.info(domain, tag, 'Context_resourceManager_0300 abilityDelegator');
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.helloworld")
      await Utils.msSleep(2000);
      let Context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext");
      hilog.info(domain, tag, 'Context_resourceManager_0300 Context '+ JSON.stringify(Context));
      if (Context) {
        let result = Context.resourceManager
        hilog.info(domain, tag, "Context_resourceManager_0300 resourceManager:" + JSON.stringify(result));
        expect(result != null).assertTrue();
        done();
      } else {
        hilog.info(domain, tag, "Context_resourceManager_0300 abilityContext err");
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, 'Context_resourceManager_0300 end');
    })
  })
}