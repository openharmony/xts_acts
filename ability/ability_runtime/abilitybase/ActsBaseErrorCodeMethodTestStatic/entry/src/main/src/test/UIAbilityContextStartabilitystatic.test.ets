import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import StartOptions from '@ohos.app.ability.StartOptions'

let domain: number = 0x0000;
let tag: string = 'testTag';
let context:common.UIAbilityContext;

export default function UiAbilityContextStartAbilityStatic() {
  describe("AbilityUIAbilityContextTestStatic", (): void => {

    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.actsbaseerrrocodemethodtest.static");
      await Utils.msSleep(2000);
      context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_StartAbilityError_static_1200
     * @tc.name   : SUB_Ability_AbilityBase_StartAbilityError_static_1200
     * @tc.desc   : Call UIAbilityContext startAbility with options failed.(callback),
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_static_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityBase_StartAbilityError_static_1200`;
      hilog.info(domain, tag, `it begin`);
      let Fd: Record<String,Object> = {
        'type': 'FD',
        'value': -1
      }
      let parameters: Record<String,Object> = {
        'keyFd': Fd
      }
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.baseerrorrely.static',
        abilityName: 'EntryAbility',
        parameters: parameters
      };
      let options: StartOptions = {
        windowLeft: 20,
        windowTop: 20
      };
      try {
        context.startAbility(want, options, (err: BusinessError | null) => {
          if (err?.code !== 0) {
            hilog.info(domain, tag,`startAbility failed, code is ${err?.code}, message is ${err?.message}`);
            expect(err?.code).assertEqual(16000050);
            done();
          } else {
            hilog.info(domain, tag, `startAbility success`);
            expect().assertFail();
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbility fail: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityBase_StartAbilityError_static_1700
     * @tc.name   : SUB_Ability_AbilityBase_StartAbilityError_static_1700
     * @tc.desc   : To verify StartAbility with option ErrorCode.Expect: 16000004
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_StartAbilityError_static_1700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityBase_StartAbilityError_static_1700`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.ability.baseerrorrely.static',
        abilityName: 'EntryAbility1'
      };
      let options: StartOptions = {
        windowLeft: 20,
        windowTop: 20
      };
      try {
        context.startAbility(want, options, (err: BusinessError | null) => {
          if (err?.code !== 0) {
            hilog.info(domain, tag,`startAbility failed, code is ${err?.code}, message is ${err?.message}`);
            expect(err?.code).assertEqual(16000004);
            done();
          } else {
            hilog.info(domain, tag, `startAbility success`);
            expect().assertFail();
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `startAbility fail: ` + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityBase_ErrorCode_static_1800
     * @tc.name   : SUB_Ability_AbilityBase_ErrorCode_static_1800
     * @tc.desc   : Call UIAbilityContext startAbility with options failed.(promise).Expect: 16000004
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_ErrorCode_static_1800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityBase_ErrorCode_static_1800`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.ability.baseerrorrely.static',
        abilityName: 'EntryAbility1'
      };
      let options: StartOptions = {
        windowLeft: 20,
        windowTop: 20
      };
      try {
        context.startAbility(want, options).then(() => {
          hilog.info(domain, tag, `startAbility success`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError<void>): void => {
          hilog.info(domain, tag, `startAbility error: ${JSON.stringify(err)}.`)
          expect(err.code).assertEqual(16000004);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbility fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityBase_ErrorCode_static_1900
     * @tc.name   : SUB_Ability_AbilityBase_ErrorCode_static_1900
     * @tc.desc   : Call UIAbilityContext startAbility with options failed.(promise).Expect: 16000050
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_ErrorCode_static_1900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityBase_ErrorCode_static_1900`;
      hilog.info(domain, tag, `it begin`);
      let Fd: Record<String,Object> = {
        'type': 'FD',
        'value': -1
      }
      let parameters: Record<String,Object> = {
        'keyFd': Fd
      }
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.baseerrorrely.static',
        abilityName: 'EntryAbility',
        parameters: parameters
      };
      let options: StartOptions = {
        windowLeft: 20,
        windowTop: 20
      };
      try {
        context.startAbility(want, options).then(() => {
          hilog.info(domain, tag, `startAbility success`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError<void>): void => {
          hilog.info(domain, tag, `startAbility error: ${JSON.stringify(err)}.`)
          expect(err.code).assertEqual(16000050);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbility fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityBase_ErrorCode_static_2000
     * @tc.name   : SUB_Ability_AbilityBase_ErrorCode_static_2000
     * @tc.desc   : Call UIAbilityContext startAbility failed.(promise).Expect: 16000004
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_ErrorCode_static_2000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `SUB_Ability_AbilityBase_ErrorCode_static_2000`;
      hilog.info(domain, tag, `it begin`);
      let want: Want = {
        bundleName: 'com.acts.ability.baseerrorrely.static',
        abilityName: 'EntryAbility1',
      };
      let options: StartOptions = {
        windowLeft: 20,
        windowTop: 20
      };
      try {
        context.startAbility(want).then(() => {
          hilog.info(domain, tag, `startAbility success`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError<void>): void => {
          hilog.info(domain, tag, `startAbility error: ${JSON.stringify(err)}.`)
          expect(err.code).assertEqual(16000004);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbility fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number : SUB_Ability_AbilityBase_ErrorCode_static_2100
     * @tc.name   : SUB_Ability_AbilityBase_ErrorCode_static_2100
     * @tc.desc   : Call UIAbilityContext startAbility failed.(promise).Expect: 16000050
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_ErrorCode_static_2100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      tag = `startAbility_Static_0017`;
      hilog.info(domain, tag, `it begin`);
      let Fd: Record<String,Object> = {
        'type': 'FD',
        'value': -1
      }
      let parameters: Record<String,Object> = {
        'keyFd': Fd
      }
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.ability.baseerrorrely.static',
        abilityName: 'EntryAbility',
        parameters: parameters
      };
      let options: StartOptions = {
        windowLeft: 20,
        windowTop: 20
      };
      try {
        context.startAbility(want).then(() => {
          hilog.info(domain, tag, `startAbility success`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError<void>): void => {
          hilog.info(domain, tag, `startAbility error: ${JSON.stringify(err)}.`)
          expect(err.code).assertEqual(16000050);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `startAbility fail: ` + err);
        expect().assertFail();
        done();
      }
    })
  });
}