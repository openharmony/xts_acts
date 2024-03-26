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

import deviceKvStoreCallbackTest from './DeviceKvStoreCallbackStage.test';
import deviceKvStorePromiseTest from './DeviceKvStorePromiseStage.test';
import kvManagerPromiseTest from './KvManagerPromiseStage.test';
import singleKvStorePromiseTest from './SingleKvStorePromiseStage.test';
import singleKvStoreCallbackTest from './SingleKvStoreCallbackStage.test';
import kvStoreResultSetTest from './KvStoreResultSetStage.test';
import queryTest from './QueryStage.test';
import fieldNodeTest from './FieldNodeStage.test';
import schemaTest from './SchemaStage.test';
import singleKvStoreEnumTest from './SingleKvStoreEnumStage.test';
import kvManagerCallbackTest from './KvManagerCallbackStage.test'

export default function testsuite() {
  deviceKvStoreCallbackTest();
  deviceKvStorePromiseTest();
  kvManagerPromiseTest();
  singleKvStorePromiseTest();
  singleKvStoreCallbackTest();
  kvStoreResultSetTest();
  queryTest();
  fieldNodeTest();
  schemaTest();
  singleKvStoreEnumTest();
  kvManagerCallbackTest();
}