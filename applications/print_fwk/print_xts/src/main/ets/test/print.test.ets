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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import print from '@ohos.print'

const DOMAIN: number = 0x0023
const TAG: string = 'printTestXTS';

export default function printTest() {
  describe('printTest', function () {

    function registerPrintTask(printTask: print.PrintTask) {
      printTask.on('block', () => {
        hilog.info(DOMAIN, TAG, 'print state is block')
      })
      printTask.on('succeed', () => {
        hilog.info(DOMAIN, TAG, 'print state is succeed')
      })
      printTask.on('fail', () => {
        hilog.info(DOMAIN, TAG, 'print state is fail')
      })
      printTask.on('cancel', () => {
        hilog.info(DOMAIN, TAG, 'print state is cancel')
      })
    }

    function UnregisterPrintTask(printTask: print.PrintTask) {
      printTask.off('block', () => {
        hilog.info(DOMAIN, TAG, 'unregister print state is blocked')
      })
      printTask.off('succeed', () => {
        hilog.info(DOMAIN, TAG, 'unregister print state is succeed')
      })
      printTask.off('fail', () => {
        hilog.info(DOMAIN, TAG, 'unregister print state is fail')
      })
      printTask.off('cancel', () => {
        hilog.info(DOMAIN, TAG, 'unregister print state is cancel')
      })
    }

    it('print_function_0001', 0, function () {
      let file = ['file://data/print/a.png', 'file://data/print/b.png'];
      // Permissions required: ohos.permission.PRINT
      print.print(file).then((printTask) => {
        expect(typeof (printTask)).assertEqual('object');
        expect(!!printTask).assertTrue();
        registerPrintTask(printTask);
        UnregisterPrintTask(printTask);
      }).catch((error) => {
        expect(false).assertTrue();
      })
    })

    it('print_function_0002', 0, function () {
      let file = ['file://data/print/a.png', 'file://data/print/b.png'];
      try {
        // Permissions required: ohos.permission.PRINT
        print.print(file, (err, printTask: print.PrintTask) => {
          if (err) {
            expect(false).assertTrue();
          } else {
            expect(typeof (printTask)).assertEqual('object');
            expect(!!printTask).assertTrue();
            registerPrintTask(printTask);
            UnregisterPrintTask(printTask);
          }
        })
      } catch (error) {
        expect().assertFail();
      }
    })
  })
}
