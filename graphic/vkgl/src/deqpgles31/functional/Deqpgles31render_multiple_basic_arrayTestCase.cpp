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
#include "../ActsDeqpgles310018TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017062,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.render.multiple_basic_array.vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017063,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.render.multiple_basic_array.fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017064,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.render.multiple_basic_array.both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017431,
        "dEQP-GLES31.functional.program_uniform.by",
        "_value.render.multiple_basic_array.vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017432,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.render.multiple_basic_array.fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017433,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_value.render.multiple_basic_array.both");
