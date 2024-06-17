/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import account_osAccount from '@ohos.account.osAccount';
import runningLock from '@ohos.runningLock';

const PERMISSION_DENIED_CODE = 201
const PARAMETER_ERROR_CODE = 401
const SERVICE_EXCEPTION_CODE = 14500101
const SERVICE_EXCEPTION_MSG = 'Service exception.'
const PARAMETER_ERROR_MSG = 'The parameter invalid.'
const SENSOR_NO_SUPPORT_CODE = 14500102
const PERMISSION_DENIED_MSG = 'Permission denied.'

export default function RunningLock_nop_Test() {
  describe('RunningLock_nop_Test', () => {
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

    /*
     * @tc.number  AccountLocal_nop_Test_0100
     * @tc.name   Create a RunningLock lock (callback)
     * @tc.desc    Function test
     */
    it('AccountLocal_nop_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      runningLock.create('running_lock_test', runningLock.RunningLockType.BACKGROUND, (err: BusinessError, lock: runningLock.RunningLock) => {
        if (err.code === PERMISSION_DENIED_CODE) {
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        } else {
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
          done();
        }
      });
    });

    /*
     * @tc.number  AccountLocal_nop_Test_0200
     * @tc.name   Create a RunningLock lock (then)
     * @tc.desc    Function test
     */
    it('AccountLocal_nop_Test_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------AccountLocal_nop_Test_0200--------');
      runningLock.create('running_lock_test', runningLock.RunningLockType.BACKGROUND).then((RunningLock) => {
        console.info('--------AccountLocal_nop_Test_0200-----RunningLock---' + RunningLock);
      }).catch((error: BusinessError) => {
        console.info('--------AccountLocal_nop_Test_0200------error--' + error.code);
        if (error.code === PERMISSION_DENIED_CODE) {
          expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        } else {
          expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
          done();
        }
      })
    });

    /*
     * @tc.number  AccountLocal_nop_Test_0300
     * @tc.name   Lock and hold RunningLock
     * @tc.desc    Function test
     */
    it('AccountLocal_nop_Test_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------AccountLocal_nop_Test_0300--------');
      runningLock.create('running_lock_test', runningLock.RunningLockType.BACKGROUND, (err: BusinessError, lock: runningLock.RunningLock) => {
        console.info('hold running lock err'+err.code);
        if(err.code === PERMISSION_DENIED_CODE){
          try {
            lock.hold(500);
            console.info('hold running lock success');
          } catch(err) {
            let error:BusinessError = err as BusinessError
            console.info('catch hold err'+error.code);
            if (error.code === PERMISSION_DENIED_CODE) {
              expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
              done();
            } else if(error.code === PARAMETER_ERROR_CODE){
              expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            }else {
              expect(error.code).assertUndefined();
              done();
            }
          }
        }
      });

    });

    /*
     * @tc.number  AccountLocal_nop_Test_0400
     * @tc.name   Release RunningLock
     * @tc.desc    Function test
     */
    it('AccountLocal_nop_Test_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------AccountLocal_nop_Test_0400--------');
      runningLock.create('running_lock_test', runningLock.RunningLockType.BACKGROUND, (err: BusinessError, lock: runningLock.RunningLock) => {
        if(err.code === PERMISSION_DENIED_CODE){
          try {
            lock.unhold();
            console.info('hold running lock success');
          } catch(err) {
            let error:BusinessError = err as BusinessError
            console.info('catch hold err'+error.code);
            if (error.code === PERMISSION_DENIED_CODE) {
              expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
              done();
            } else if(error.code === PARAMETER_ERROR_CODE){
              expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            }else {
              expect(error.code).assertUndefined();
              done();
            }
          }
        }
      });
    });
  })
}