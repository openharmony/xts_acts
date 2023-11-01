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
import diRentNdkTest from './DirentNdk.test';
import mathNdkTest from './MathNdk.test';
import regexNdkTest from './RegexNdk.test';
import sCheDNdkTest from './SchedNdk.test';
import semaphoreNdkTest from './SemaphoreNdk.test';
import stdlibNdkTest from './StdlibNdk.test';
import wcharNdkTest from './WcharNdk.test';
import muslIfAddSNdkTest from './IfaddrsNdk.test';
import muslInetNdkTest from './InetNdk.test';
import muslInotifyNdkTest from './InotifyNdk.test';
import muslPThreadNdkTest from './PthreadNdk.test';
import muslNetDbNdkTest from './NetdbNdk.test';
import muslResourceNdkTest from './ResourceNdk';
import muslUnistdNdkTest from './UnistdNdk';
import muslStringNdkTest from './StringNdk.test';
import muslStringsNdkTest from './StringsNdk.test';
import intTypesNdkTest from './InttypesNdk.test';
import cTypeNdkTest from './CtypeNdk.test';
import wcTypeNdkTest from './WctypeNdk.test';

import timeNdkTest from './TimeNdk.test';
import setJmpNdkTest from './SetjmpNdk.test';
import signalNdkTest from './SignalNdk.test';

export default function testsuite() {
  stdlibNdkTest();
  mathNdkTest();
  regexNdkTest();
  wcharNdkTest();
  diRentNdkTest();
  sCheDNdkTest();
  semaphoreNdkTest();
  muslUnistdNdkTest()
  muslInotifyNdkTest()
  muslInetNdkTest()
  muslIfAddSNdkTest()
  muslResourceNdkTest()
  muslNetDbNdkTest()
  muslPThreadNdkTest()
  intTypesNdkTest();
  timeNdkTest();
  cTypeNdkTest();
  wcTypeNdkTest();
  muslStringNdkTest();
  muslStringsNdkTest();
  setJmpNdkTest();
  signalNdkTest();
}