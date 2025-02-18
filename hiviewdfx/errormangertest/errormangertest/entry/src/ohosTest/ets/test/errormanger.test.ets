/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { errorManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

function errorFunc(observer: errorManager.GlobalError) {
  console.log("result name :" + observer.name);
  console.log("result message :" + observer.message);
  console.log("result stack :" + observer.stack);
  console.log("result instanceName :" + observer.instanceName);
  console.log("result instaceType :" + observer.instanceType);
}

function promiseFunc(observer: errorManager.GlobalError) {
  console.log("result name :" + observer.name);
  console.log("result message :" + observer.message);
  console.log("result stack :" + observer.stack);
  console.log("result instanceName :" + observer.instanceName);
  console.log("result instaceType :" + observer.instanceType);
}

function unregisterErrorObserverCallback(err: BusinessError) {
  if (err) {
    console.error('------------ unregisterErrorObserverCallback ------------', err);
  }
}

export default function ErrormangerTest() {
  describe('ErrormangerTest', () => {
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
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_0100
     * @tc.name testErrorManger_0100
     * @tc.desc 验证在进程中的任一线程注册errormanager.on接口，支持捕获其他子线程
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testErrorManger_0100',0, async (done:Function) => {
      console.info("====> testErrorManger_0100 globalErrorOccurred start");
      // promiseFunc
      errorManager.on("globalErrorOccurred", errorFunc);
      try {
        console.info("====> testErrorManger_0100 globalErrorOccurred end 01");
        errorManager.off('globalErrorOccurred', errorFunc);
        console.info("====> testErrorManger_0100 globalErrorOccurred end 02");
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.info("====> testErrorManger_0100 globalErrorOccurred catch: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    
    /**
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_0200
     * @tc.name testErrorManger_0200
     * @tc.desc 验证在进程中任一线程注册被拒绝promise监听器，注册后可以捕获到当前进程中未被捕获到的promise rejection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testErrorManger_0200',0, async (done:Function) => {
      console.info("====> testErrorManger_0200 globalUnhandledRejectionDetected start");
      // promiseFunc
      errorManager.on("globalUnhandledRejectionDetected", promiseFunc);
      try {
        console.info("====> testErrorManger_0200 globalUnhandledRejectionDetected end 01");
        errorManager.off('globalUnhandledRejectionDetected', promiseFunc);
        console.info("====> testErrorManger_0200 globalUnhandledRejectionDetected end 02");
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.info("====> testErrorManger_0100 globalUnhandledRejectionDetected catch: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_0300
     * @tc.name testErrorManger_0300
     * @tc.desc 验证注册主线程消息处理耗时监听器。注册后可以捕获到应用主线程处理消息的具体执行时间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testErrorManger_0300',0, async (done:Function) => {
      let observer: errorManager.LoopObserver = {
        onLoopTimeOut(timeout: number) {
          console.log('Duration timeout: ' + timeout);
        }
      };
      try {
        console.info("====>testErrorManger_0300 loopObserver start");
        errorManager.on("loopObserver", 2000, observer)
        console.info("====>testErrorManger_0300 loopObserver end 01");
        errorManager.off("loopObserver");
        console.info("====>testErrorManger_0300 loopObserver end 02");
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.error(`====>testErrorManger_0300 loopObserver catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_0400
     * @tc.name testErrorManger_0400
     * @tc.desc 验证注册主线程消息处理耗时监听器。注册后可以捕获到应用主线程处理消息的具体执行时间,传入异常值 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testErrorManger_0400',0, async (done:Function) => {
      let observer: errorManager.LoopObserver = {
        onLoopTimeOut(timeout: number) {
          console.log('Duration timeout: ' + timeout);
        }
      };
      try {
        console.info("====>testErrorManger_0400 loopObserver start");
        errorManager.on("loopObserver", -1, observer);
        console.info("====>testErrorManger_0400 loopObserver error");
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`testErrorManger_0400 loopObserver catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_0500
     * @tc.name testErrorManger_0500
     * @tc.desc 验证注册主线程消息处理耗时监听器。注册后可以捕获到应用主线程处理消息的具体执行时间,on传入异常值 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testErrorManger_0500',0, async (done:Function) => {
      let observer: errorManager.LoopObserver = {
        onLoopTimeOut(timeout: number) {
          console.log('Duration timeout: ' + timeout);
        }
      };
      try {
        console.info("====>testErrorManger_0500 loopObserver start");
        errorManager.on(undefined, 2000, observer);
        console.info("====>testErrorManger_0500 loopObserver error");
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`testErrorManger_0500 loopObserver catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_0600
     * @tc.name testErrorManger_0600
     * @tc.desc 验证注册主线程消息处理耗时监听器。注册后可以捕获到应用主线程处理消息的具体执行时间,off传入异常值 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testErrorManger_0600',0, async (done:Function) => {
      let observer: errorManager.LoopObserver = {
        onLoopTimeOut(timeout: number) {
          console.log('Duration timeout: ' + timeout);
        }
      };
      try {
        console.info("====>testErrorManger_0600 loopObserver start");
        errorManager.off(undefined);
        console.info("====>testErrorManger_0600 loopObserver end");
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`testErrorManger_0600 loopObserver catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code == 401).assertTrue()
        done();
      }
    })

    /**
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_0700
     * @tc.name testErrorManger_0700
     * @tc.desc 注册被拒绝promise监听器,注册后可以捕获到当前线程中未被捕获到的promise rejection。
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testErrorManger_0700',0, async (done:Function) => {
      let observer: errorManager.UnhandledRejectionObserver = (reason: Error, promise: Promise<void>) => {
        if (promise === promise1) {
          console.log("promise1 is rejected");
        }
        console.log("reason.name: ", reason.name);
        console.log("reason.message: ", reason.message);
        if (reason.stack) {
          console.log("reason.stack: ", reason.stack);
        }
      };
      let promise1 = new Promise<void>(() => {}).then(() => {
        throw new Error("uncaught error");
      });

      try {
        console.info("====>testErrorManger_0700 unhandledRejection start");
        errorManager.on("unhandledRejection", observer);
        console.info("====>testErrorManger_0700 unhandledRejection end 01");
        errorManager.off("unhandledRejection");
        console.info("====>testErrorManger_0700 unhandledRejection end 02");
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.error(`testErrorManger_0700 unhandledRej catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_0800
     * @tc.name testErrorManger_0800
     * @tc.desc 在主线程注册errormanager.on接口,不支持捕获其他线程
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testErrorManger_0800',0, async (done:Function) => {
      let observer: errorManager.ErrorObserver = {
        onUnhandledException(errorMsg) {
          console.log('onUnhandledException, errorMsg: ', errorMsg);
        },
        onException(errorObj) {
          console.log('onException, name: ', errorObj.name);
          console.log('onException, message: ', errorObj.message);
          if (typeof(errorObj.stack) === 'string') {
            console.log('onException, stack: ', errorObj.stack);
          }
        }
      };
      let observerId = -1;
      try {
        console.info("====>testErrorManger_0800 error start");
        observerId = errorManager.on('error', observer);
        console.info("====>testErrorManger_0800 error end 01 " + observerId.toString());
        errorManager.off('error', observerId);
        console.info("====>testErrorManger_0800 error end 02");
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.error(`====>testErrorManger_0800 catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_0900
     * @tc.name testErrorManger_0900
     * @tc.desc 注销错误观测器。使用callback异步返回
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testErrorManger_0900',0, async (done:Function) => {
      let observerId = 100;
      try {
        console.info("====>testErrorManger_0900 offcallback start");
        errorManager.off('error', observerId, unregisterErrorObserverCallback);
        console.info("====>testErrorManger_0900 offcallback end");
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.error(`testErrorManger_0900 offcallback catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.number SUB_DFX_DFR_Errormanger_Ets_1000
     * @tc.name testErrorManger_1000
     * @tc.desc 注册主线程消息处理耗时监听器。注册后可以捕获到应用主线程处理消息的具体执行时间。校验错误码 16200001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testErrorManger_1000',0, async (done:Function) => {
      console.info("====>testErrorManger_1000 start");
      try {
        let observer: errorManager.LoopObserver = {
          onLoopTimeOut(timeout: number) {
            console.info('Duration timeout: ' + timeout);
          }
        };
        errorManager.on("loopObserver", 1, observer);
        setTimeout(() => {
          done();
        }, 2500);
        errorManager.off("loopObserver");
        done();
      } catch (error) {
        console.info("====>testErrorManger_1000 catch error: " + JSON.stringify(error));
        expect(error.code == 16200001).assertTrue();
        done();
      }
    });

  })
}
