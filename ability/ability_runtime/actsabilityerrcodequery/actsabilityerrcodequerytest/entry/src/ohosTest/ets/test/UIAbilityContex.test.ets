/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { AtomicServiceOptions, common, contextConstant,
  OpenLinkOptions,
  StartOptions, startupManager,
  UIAbility } from '@kit.AbilityKit';
import { BusinessError ,systemParameterEnhance} from '@kit.BasicServicesKit';
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
     * @tc.desc: Capability not support
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_showAbility_0100', 0, async (done:Function) => {
      let want: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
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
      let info:string;
      globalThis.context.showAbility().then(() => {
            console.log(`showAbility success`);
          }).catch((err: BusinessError) => {
            console.error(`showAbility fail, err: ${JSON.stringify(err)}`);
            if(err.code===801)
            {
              done();
            }
            else{
              try {
                let info: string = systemParameterEnhance.getSync("persist.sys.abilityms.start_options_with_process_option");
                console.log("getSync"+JSON.stringify(info));
                if(!info)
                {
                    expect(err.code).assertEqual(16000067);
                    done();
                }
              } catch(e) {
                console.log("getSync unexpected error: " + e);
              }
            }
          });
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_showAbility_0200
     * @tc.name: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_showAbility_0200
     * @tc.desc: Start options check failed.
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_showAbility_0200', 0, async (done:Function) => {
      let want: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
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
      let info:string;
      globalThis.context.showAbility().then(() => {
        console.log(`showAbility success`);
      }).catch((err: BusinessError) => {
        console.error(`showAbility fail, err: ${JSON.stringify(err)}`);
        if(err.code===801)
        {
          done();
        }
        else{
          try {
            let info: string = systemParameterEnhance.getSync("persist.sys.abilityms.start_options_with_process_option");
            console.log("getSync"+JSON.stringify(info));
            if(!info)
            {
              expect(err.code).assertEqual(16000067);
            }
          } catch(e) {
            console.log("getSync unexpected error: " + e);
          }
        }
      });
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_hideAbility_0100
     * @tc.name: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_hideAbility_0100
     * @tc.desc: Capability not support.
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_hideAbility_0100', 0, async (done:Function) => {
      let want: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
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
      let info:string;
      globalThis.context.hideAbility().then(() => {
        console.log(`highAbility success`);
      }).catch((err: BusinessError) => {
        console.error(`highAbility fail, err: ${JSON.stringify(err)}`);
        if(err.code===801)
        {
          done();
        }
        else{
          try {
            let info: string = systemParameterEnhance.getSync("persist.sys.abilityms.start_options_with_process_option");
            console.log("getSync"+JSON.stringify(info));
            if(!info)
            {
              expect(err.code).assertEqual(16000067);
            }
          } catch(e) {
            console.log("getSync unexpected error: " + e);
          }
        }
      });
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_hideAbility_0200
     * @tc.name: SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_hideAbility_0200
     * @tc.desc: Start options check failed.
     */
    it('SUB_Ability_AbilityRuntime_ErrorCode_UIAbilityContext_hideAbility_0200', 0, async (done:Function) => {
      let want: Want = {
        bundleName: 'com.test.actsabilityerrcodequerytest',
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
      let info:string;
      globalThis.context.hideAbility().then(() => {
        console.log(`highAbility success`);
      }).catch((err: BusinessError) => {
        console.error(`highAbility fail, err: ${JSON.stringify(err)}`);
        if(err.code===801)
        {
          done();
        }
        else{
          try {
            let info: string = systemParameterEnhance.getSync("persist.sys.abilityms.start_options_with_process_option");
            console.log("getSync"+JSON.stringify(info));
            if(!info)
            {
              expect(err.code).assertEqual(16000067);
            }
          } catch(e) {
            console.log("getSync unexpected error: " + e);
          }
        }
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
            expect(err.code).assertEqual(16000050)
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
  })
}