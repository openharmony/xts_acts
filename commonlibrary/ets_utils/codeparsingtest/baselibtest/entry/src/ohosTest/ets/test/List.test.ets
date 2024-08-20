/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import bufferTest from './buffer/Buffer.test';
import processTest from './process/Process.test';
import uriTest from './uri/Uri.test';
import urlTest from './url/Url.test';
import utilTest from './util/Util.test';
import timerTest from './timer/Timer.test';


export default function testsuite() {
  bufferTest();
  processTest();
  uriTest();
  urlTest();
  utilTest();
  timerTest();
}