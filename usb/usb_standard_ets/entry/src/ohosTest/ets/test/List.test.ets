/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import UsbSystemApiNormalJsTest from './UsbSystemApiNormalJsTest.test';
import UsbSceneEtsTest from './UsbSceneEtsTest.test'
import UsbApiBulkTransferTest from './UsbApiBulkTransferTest.test';
import UsbApiInterruptTransferTest from './UsbApiInterruptTransferTest.test';
import UsbApiIsochronousTransferTest from './UsbApiIsochronousTransferTest.test';
import SerialTest from './SerialTest.test';
import SerialAddTest from './SerialAddTest.test';
import UsbAccessoryEtsTest from './UsbAccessoryEtsTest.test';
import UsbCoreEtsTest from './UsbCoreEtsTest.test';
import UsbCoreEtsTestEx from './UsbCoreEtsTestEx.test';
import UsbDevicePipeTest from './UsbDevicePipeTest.test';
import UsbDevicePipeTestEx from './UsbDevicePipeTestEx.test';
import UsbApiParamExceEtsTest from './UsbApiParamExceEtsTest.test';
import UsbApiTransferCompatEtsTest from './UsbApiTransferCompatEtsTest.test';
import UsbApiDeprecatedEtsTest from './UsbApiDeprecatedEtsTest.test';

export default function testsuite() {
  UsbSystemApiNormalJsTest()
  UsbSceneEtsTest()
  UsbApiBulkTransferTest()
  UsbApiInterruptTransferTest()
  UsbApiIsochronousTransferTest()
  SerialTest()
  SerialAddTest()
  UsbCoreEtsTest()
  UsbCoreEtsTestEx()
  UsbDevicePipeTest()
  UsbDevicePipeTestEx()
  UsbApiParamExceEtsTest()
  UsbApiTransferCompatEtsTest()
  UsbAccessoryEtsTest()
  UsbApiDeprecatedEtsTest()
}