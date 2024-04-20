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
import gaugeJsunit from './gaugeTest/GaugeJsunit.test';
import CounterEnableTest from './CounterTest/CounterEnable.test'
import progressTest from './ProgressTest/progress.test'
import progressSecTest from './ProgressTest/progressSec.test'
import badgeJsunit from './BadgeTest/BadgeJsunit.test';
import counterJsunit from './CounterTest/CounterJsunit.test';
import datapanelJsunit from './DataPanelTest/DataPanelJsunit.test';
import progressJsunit from './ProgressTest/ProgressJsunit.test';
import qrcodeJsunit from './QrcodeTest/QrcodeJsunit.test';
import badgeTest from './BadgeTest/badge'
import datapanelTest from './DataPanelTest/datapanel'

export default function testsuite() {
  gaugeJsunit();
  CounterEnableTest();
  progressTest();
  progressSecTest();
  badgeJsunit()
  counterJsunit()
  datapanelJsunit()
  progressJsunit()
  qrcodeJsunit()
  badgeTest();
  datapanelTest();
}