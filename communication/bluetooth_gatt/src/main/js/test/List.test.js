/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import btGattAdvertTest from './BtGattAdvertiser.test.js'
import btGattManagerTest from './BtGattManager.test.js'
import btGattServiceTest from './BtGattService.test.js'
import btManagerGattAdvertTest from './BtManagerGattAdvertiser.test.js'
import btManagerGattManagerTest from './BtManagerGattManager.test.js'
import btManagerGattServiceTest from './BtManagerGattService.test.js'
import btBleManagerTest from './BtBleManager.test.js'
import btBleServiceTest from './BtBleService.test.js'
export default function testsuite() {
    btBleManagerTest()
    btBleServiceTest()
    btManagerGattManagerTest()
    btManagerGattServiceTest()
    btGattServiceTest()
    btGattManagerTest()
    btManagerGattAdvertTest()
    btGattAdvertTest()
}
