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
import SR000HTP23Test from './SR000HTP23.test'
import SR000HTP2CTest from './SR000HTP2C.test'
import SR000HTP2GTest from './SR000HTP2G.test'
import SR000HTP2KTest from './SR000HTP2K.test'
import SR000HTP2OTest from './SR000HTP2O.test'
import SR000HR4C4Test from './SR000HR4C4.test'
import SR000HUES3Test from './SR000HUES3.test'
import SR000HUESCTest from './SR000HUESC.test'
import SR000HUESLTest from './SR000HUESL.test'
import SR000HUET2Test from './SR000HUET2.test'
import SR000HUESG_SITest from './SR000HUESG_SI.test'
import SR000HUES7Test from './SR000HUES7.test'

export default function testsuite() {
  SR000HTP23Test()
  SR000HTP2CTest()
  SR000HTP2GTest()
  SR000HTP2KTest()
  SR000HTP2OTest()
  SR000HR4C4Test()
  SR000HUES3Test()
  SR000HUESCTest()
  SR000HUESLTest()
  SR000HUET2Test()
  SR000HUESG_SITest()
  SR000HUES7Test()
}