/*
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include <climits>
#include <gtest/gtest.h>
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012235,
        "dEQP-GLES31.functional.atomic_counter.layout.defa",
        "ult_offset_set.get_inc.8_counters_1_call_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012236,
        "dEQP-GLES31.functional.atomic_counter.layout.defaul",
        "t_offset_set.get_inc.8_counters_1_call_1000_threads");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012237,
        "dEQP-GLES31.functional.atomic_counter.layout.defa",
        "ult_offset_set.get_inc.8_counters_5_calls_1_thread");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012238,
        "dEQP-GLES31.functional.atomic_counter.layout.defaul",
        "t_offset_set.get_inc.8_counters_5_calls_1000_threads");
