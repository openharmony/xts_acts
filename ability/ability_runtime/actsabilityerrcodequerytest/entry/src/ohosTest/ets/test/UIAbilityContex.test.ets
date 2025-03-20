import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { AtomicServiceOptions, common, contextConstant,
  OpenLinkOptions,
  StartOptions, startupManager,
  UIAbility } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { image } from '@kit.ImageKit';

const DOMAIN = 0xeeee;
const TAG: string = '[openLinkDemo]';
let buffer = new ArrayBuffer(640 * 1024);

const TWO_HUNDRED_KB = 200 * 1024;

// 生成一个指定长度的字符串
function generateLargeString(length: number): string {
  let result = '';
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  const charactersLength = characters.length;
  for (let i = 0; i < length; i++) {
    result += characters.charAt(Math.floor(Math.random() * charactersLength));
  }
  return result;
}
export default function UIAbilityContex() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    it('assertContain', 0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      let a = 'abc';
      let b = 'b';
      // Defines a variety of assertion methods, which are used to declare expected boolean conditions.
      expect(a).assertContain(b);
      expect(a).assertEqual(a);
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_ErrorCode_startupManager_run_0100
     * @tc.name: SUB_Ability_AbilityRuntime_ErrorCode_startupManager_run_0100
     * @tc.desc: run parameter error, pass undefined
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_startupManager_run_0100', 0, async (done:Function) => {
      let startParams = ['StartupTask_001'];
      try {
        startupManager.run(undefined).then(() => {
          console.log('StartupTest startupManager run then, startParams = ');
        }).catch((error: BusinessError) => {
          console.info("StartupTest promise catch error, error = " + JSON.stringify(error));
          console.info("StartupTest promise catch error, startParams = "
            + JSON.stringify(startParams));
        })
      } catch (error) {
        let errMsg = JSON.stringify(error);
        let errCode: number = error.code;
        console.log('Startup catch error , errCode= ' + errCode);
        console.log('Startup catch error ,error= ' + errMsg);
        expect(error.code).assertEqual(401)
      }
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_ErrorCode_startupManager_getStartupTaskResult_0100
     * @tc.name: SUB_Ability_AbilityRuntime_ErrorCode_startupManager_getStartupTaskResult_0100
     * @tc.desc: getStartupTaskResult parameter error, pass undefined
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_startupManager_getStartupTaskResult_0100', 0, async (done:Function) => {
      try {
        const data = startupManager.getStartupTaskResult(undefined)
      } catch (error) {
        console.log(`Error occurred while getStartupTaskResult:  ${JSON.stringify(error.code)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number: SUB_Ability_AbilityRuntime_ErrorCode_startupManager_isStartupTaskInitialized_0100
     * @tc.name: SUB_Ability_AbilityRuntime_ErrorCode_startupManager_isStartupTaskInitialized_0100
     * @tc.desc: isStartupTaskInitialized parameter error, pass undefined
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_startupManager_isStartupTaskInitialized_0100', 0, async (done:Function) => {
      try {
        const data = startupManager.isStartupTaskInitialized(undefined)
      } catch (error) {
        console.log(`Error occurred while isStartupTaskInitialized:  ${JSON.stringify(error.code)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_ErrorCode_startupManager_removeStartupTaskResult_0100
     * @tc.name: SUB_Ability_AbilityRuntime_ErrorCode_startupManager_removeStartupTaskResult_0100
     * @tc.desc: removeStartupTaskResult parameter error, pass undefined
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_startupManager_removeStartupTaskResult_0100', 0, async (done:Function) => {
      try {
        const data = startupManager.removeStartupTaskResult(undefined)
      } catch (error) {
        console.log(`Error occurred while isStartupTaskInitialized:  ${JSON.stringify(error.code)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityByType_0100
     * @tc.name: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityByType_0100
     * @tc.desc: startAbilityByType parameter error, pass undefined Async
     */
    it('SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_5', 0, async (done:Function) => {
      let wantParam: Record<string, Object> = {
        'time': '2023-10-23 20:45'
      };
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          console.log(`code:` + code + `name:` + name + `message:` + message);
        },
        onResult: (abilityResult: common.AbilityResult) => {
          console.log(`resultCode:` + abilityResult.resultCode + `bundleName:` + abilityResult.want?.bundleName);
        }
      };
      try{
        globalThis.context.startAbilityByType(undefined, wantParam, abilityStartCallback).then(() => {
          console.log(`startAbilityByType success`);
        }).catch((err: BusinessError) => {
          console.error(`startAbilityByType fail, err: ${JSON.stringify(err)}`);
        });
      }catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        expect(err.code).assertEqual(401)
        console.error(`startAbility failed, code is ${code}, message is ${message}`);
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityByType_0200
     * @tc.name: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityByType_0200
     * @tc.desc: startAbilityByType parameter error, pass undefined Promise
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityByType_0200', 0, async (done:Function) => {
      let wantParam: Record<string, Object> = {
        'time': '2023-10-23 20:45'
      };
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          console.log(`code:` + code + `name:` + name + `message:` + message);
        },
        onResult: (abilityResult: common.AbilityResult) => {
          console.log(`resultCode:` + abilityResult.resultCode + `bundleName:` + abilityResult.want?.bundleName);
        }
      };
      try{
        globalThis.context.startAbilityByType(undefined, wantParam, abilityStartCallback, (err:BusinessError) => {
          if (err) {
            console.error(`startAbilityByType fail, err: ${JSON.stringify(err)}`);
          } else {
            console.log(`success`);
          }
        });
      }catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        expect(err.code).assertEqual(401)
        console.error(`startAbility failed, code is ${code}, message is ${message}`);
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_openAtomicService_0100
     * @tc.name: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_openAtomicService_0100
     * @tc.desc: openAtomicService parameter error, pass undefined Promise
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_openAtomicService_0100', 0, async (done:Function) => {
      let appId: string = '6918661953712445909';
      let options: AtomicServiceOptions = {
        displayId: 0
      };
      try{
        globalThis.context.openAtomicService(undefined, options)
          .then((result: common.AbilityResult) => {
            console.info('openAtomicService succeed');
          })
          .catch((err: BusinessError) => {
            console.error(`openAtomicService failed, code is ${err.code}, message is ${err.message}`);
          });
      }catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        expect(err.code).assertEqual(401)
        console.error(`startAbility failed, code is ${code}, message is ${message}`);
        done();
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_showAbility_0100
     * @tc.name: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_showAbility_0100
     * @tc.desc: When the lifecycle times out, can exit the app normally
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_showAbility_0100', 0, async (done:Function) => {
      let want: Want = {
        bundleName: 'com.test.actscommoncomponenttest',
        abilityName: 'MainAbility1'
      };
      try {
        globalThis.context.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('startAbility succeed');
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        expect(err.code).assertEqual(16000004)
        console.error(`startAbility failed, code is ${code}, message is ${message}`);
      }
      globalThis.context.showAbility().then(() => {
        console.log(`showAbility success`);
      }).catch((err: BusinessError) => {
        console.error(`showAbility fail, err: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(801);
        done();
      });
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_hideAbility_0100
     * @tc.name: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_hideAbility_0100
     * @tc.desc: When the lifecycle times out, can exit the app normally
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_hideAbility_0100', 0, async (done:Function) => {
      let want: Want = {
        bundleName: 'com.test.actscommoncomponenttest',
        abilityName: 'MainAbility1'
      };
      try {
        globalThis.context.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('startAbility succeed');
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`startAbility failed, code is ${code}, message is ${message}`);
      }
      globalThis.context.hideAbility().then(() => {
        console.log(`showAbility success`);
      }).catch((err: BusinessError) => {
        console.error(`showAbility fail, err: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(801);
        done();
      });
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0400
     * @tc.name: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0400
     * @tc.desc: startAbility set flags=-1
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0400', 0, async (done:Function) => {
      let startWant: Want = {
        bundleName: 'com.test.actscommoncomponenttest',
        abilityName: 'MainAbility1',
        flags:-1
      };
      try {
        globalThis.context.startAbility(startWant, (err: BusinessError) => {
          if (err.code) {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000010)
            done();
          }
          console.info('startAbility succeed');
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`startAbility failed, code is ${code}, message is ${message}`);
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0300
     * @tc.name: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0300
     * @tc.desc: startAbilityForResult set flags=-1   Async
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0300', 0, async (done:Function) => {
      let startWant: Want = {
        bundleName: 'com.test.actscommoncomponenttest',
        abilityName: 'MainAbility2',
        flags:-1
      };
      try {
        globalThis.context.startAbilityForResult(startWant, (err: BusinessError, result: common.AbilityResult) => {
          if (err.code) {
            console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000010)
            done();
          }
          console.info('startAbilityForResult succeed');
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`startAbilityForResult failed, code is ${code}, message is ${message}`);
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0300
     * @tc.name: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0300
     * @tc.desc: startAbilityForResult set flags=-1   Promise
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0300', 0, async (done:Function) => {
      let startWant: Want = {
        bundleName: 'com.test.actscommoncomponenttest',
        abilityName: 'MainAbility1',
        flags:-1
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        globalThis.context.startAbilityForResult(startWant, options)
          .then((result: common.AbilityResult) => {
            console.info('startAbilityForResult succeed');
          })
          .catch((err: BusinessError) => {
            console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000010)
            done();
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`startAbilityForResult failed, code is ${code}, message is ${message}`);
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0500
     * @tc.name: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0500
     * @tc.desc: The premeters within the Want carry parameters with a size of more than 200k
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0500', 0, async (done:Function) => {
      // 构造一个超过 200KB 的对象
      const largeObject = generateLargeString(TWO_HUNDRED_KB + 100)
      let startWant: Want = {
        bundleName: 'com.test.actscommoncomponenttest',
        abilityName: 'MainAbility1',
        parameters:{
          key:largeObject
        }
      };
      try {
        globalThis.context.startAbility(startWant, (err: BusinessError) => {
          if (err.code) {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000010)
            done();
          }
          console.info('startAbility succeed');
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`startAbility failed, code is ${code}, message is ${message}`);
      }
    })


    //写完的 下面是异常用例

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_openLink_0300
     * @tc.name: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_openLink_0300
     * @tc.desc: When the lifecycle times
     *       openLink设置flag为-1     未返回预期错误码16000010 正常拉起
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_openLink_0300', 0, async (done:Function) => {
      let link: string = 'https://www.example.com';
      let openLinkOptions: OpenLinkOptions = {
        parameters: {
          flags:-1
        },
      };
      try {
        globalThis.context.openLink(
          link,
          openLinkOptions,
        ).then(() => {
          hilog.info(DOMAIN, TAG, `open link success.`);
        }).catch((err: BusinessError) => {
          hilog.error(DOMAIN, TAG, `open link failed, errCode ${JSON.stringify(err.code)}`);
          expect(err.code).assertEqual(16000050)
          done();
        });
      }
      catch (e) {
        hilog.error(DOMAIN, TAG, `exception occured, errCode ${JSON.stringify(e.code)}`);
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0300
     * @tc.name: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0300      49
     * @tc.desc: startAbility Configure the Capability permission for the target    能够正常拉起
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0300', 0, async (done:Function) => {
      let want: Want = {
        bundleName: 'com.test.actscommoncomponenttest',
        abilityName: 'EntryAbility'
      };
      try {
        globalThis.context.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('startAbility succeed');
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`startAbility failed, code is ${code}, message is ${message}`);
      }
    })


    /**
     * @tc.number: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0700
     * @tc.name: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0700      53
     * @tc.desc: startAbility Configure the Capability permission for the target    能够正常拉起
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbility_0700', 0, async (done:Function) => {
      let want: Want = {
        bundleName: 'com.test.actscommoncomponenttest',
        abilityName: 'EntryAbility'
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        globalThis.context.startAbility(want, options, (err: BusinessError) => {
          if (err.code) {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('startAbility succeed');
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`startAbility failed, code is ${code}, message is ${message}`);
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_openLink_0200
     * @tc.name: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_openLink_0200      56
     * @tc.desc: openLink Configure the Capability permission for the target    能够正常拉起
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_openLink_0200', 0, async (done:Function) => {
      let link: string = 'https://www.example2.com';
      try {
        globalThis.context.openLink(
          link
        ).then(() => {
          hilog.info(DOMAIN, TAG, `open link success.`);
          done();
        }).catch((err: BusinessError) => {
          hilog.error(DOMAIN, TAG, `open link failed, errCode ${JSON.stringify(err.code)}`);
          expect(err.code).assertEqual(16000050)
          done();
        });
      }
      catch (e) {
        hilog.error(DOMAIN, TAG, `exception occured, errCode ${JSON.stringify(e.code)}`);
      }
    })


    /**
     * @tc.number: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0200
     * @tc.name: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0200    60
     * @tc.desc: startAbilityForResult Configure the Capability permission for the target    能够正常拉起
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0200', 0, async (done:Function) => {
      let startWant: Want = {
        bundleName: 'com.test.actscommoncomponenttest',
        abilityName: 'EntryAbility',
      };
      try {
        globalThis.context.startAbilityForResult(startWant, (err: BusinessError, result: common.AbilityResult) => {
          if (err.code) {
            console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000010)
            done();
          }
          console.info('startAbilityForResult succeed');
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`startAbilityForResult failed, code is ${code}, message is ${message}`);
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0500
     * @tc.name: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0500    63
     * @tc.desc: startAbilityForResult Configure the Capability permission for the target    能够正常拉起
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0500', 0, async (done:Function) => {
      let startWant: Want = {
        bundleName: 'com.test.actscommoncomponenttest',
        abilityName: 'EntryAbility',
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        globalThis.context.startAbilityForResult(startWant,options, (err: BusinessError, result: common.AbilityResult) => {
          if (err.code) {
            console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000010)
            done();
          }
          console.info('startAbilityForResult succeed');
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`startAbilityForResult failed, code is ${code}, message is ${message}`);
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0700
     * @tc.name: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0700    65
     * @tc.desc: startAbilityForResult Configure the Capability permission for the target  Promise   能够正常拉起
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_startAbilityForResult_0700', 0, async (done:Function) => {
      let startWant: Want = {
        bundleName: 'com.test.actscommoncomponenttest',
        abilityName: 'EntryAbility',
      };
      let options: StartOptions = {
        displayId: 0
      };
      try {
        globalThis.context.startAbilityForResult(startWant, options)
          .then((result: common.AbilityResult) => {
            console.info('startAbilityForResult succeed');
          })
          .catch((err: BusinessError) => {
            console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`startAbilityForResult failed, code is ${code}, message is ${message}`);
      }
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0800
     * @tc.name: SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0800
     * @tc.desc: When the lifecycle times out, can exit the app normally
     * 无法拉起
     */
    it('SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_', 0, async (done:Function) => {
      let newLabel: string = 'instance label';
      let color = new ArrayBuffer(0);
      let imagePixelMap: image.PixelMap = await image.createPixelMap(color, {
        size: {
          height: 100,
          width: 100
        }
      });
      let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
      globalThis.context.setAbilityInstanceInfo(newLabel, imagePixelMap)
        .then(() => {
          console.info('setAbilityInstanceInfo success');
        }).catch((err: BusinessError) => {
        console.error(`setAbilityInstanceInfo failed, code is ${err.code}, message is ${err.message}`);
      });
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0800
     * @tc.name: SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_0800
     * @tc.desc: When the lifecycle times out, can exit the app normally  不支持此设备
     */
    it('SUB_Ability_AbilityRuntime_OnWindowStageWillDestory_100', 0, async (done:Function) => {
      let startWant: Want = {
        bundleName: 'com.test.actscommoncomponenttest',
        abilityName: 'MainAbility2',
      };
      try {
        // 启动UIServiceExtensionAbility
        globalThis.context.startUIServiceExtensionAbility(startWant).then(() => {
          console.log('startUIServiceExtensionAbility success');
        }).catch((error: BusinessError) => {
          console.log('startUIServiceExtensionAbility error', JSON.stringify(error));
          done();
        })
      } catch (err) {
        console.log('startUIServiceExtensionAbility failed', JSON.stringify(err));
      }
    })

  })
}