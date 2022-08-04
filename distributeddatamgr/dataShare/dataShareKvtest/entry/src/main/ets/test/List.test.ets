/*
* Copyright (c) 2022 Huawei Device Co., Ltd.
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

import DataShareSingleKvdb_Callback from "./DataShareSingleKvdb_Callback"
import DataShareSingleKvdb_Promise from "./DataShareSingleKvdb_Promise"
import DataSharePredicatesKvdb from "./DataSharePredicatesKvdb"
import DataShareCombinationKvdb from "./DataShareCombinationKvdb"

export default function testsuite() {

  DataShareSingleKvdb_Callback()
  DataShareSingleKvdb_Promise()
  DataSharePredicatesKvdb()
  DataShareCombinationKvdb()
}