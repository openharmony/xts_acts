/*
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
import webSetNetErrorCode3 from './webSetNetErrorCode3.test'
import ActsAceWebSetNetErrorCode2 from './ActsAceWebSetNetErrorCode2.test'
import webSetNetErrorCodeChen2 from './webSetNetErrorCodeChen2.test'
import webInitTest from './WebInitTest.test'
import webSetNetErrorCode from './webSetNetErrorCode.test'
import webSetNetErrorCodeChen1 from './webSetNetErrorCodeChen1.test'
import webSetNetErrorCodeFly from './webSetNetErrorCodeFly.test'

export default function testsuite() {
  webInitTest()
  ActsAceWebSetNetErrorCode2()
  webSetNetErrorCode3()
  webSetNetErrorCodeChen2()
  webSetNetErrorCodeChen1()
  webSetNetErrorCode()
  webSetNetErrorCodeFly()
}