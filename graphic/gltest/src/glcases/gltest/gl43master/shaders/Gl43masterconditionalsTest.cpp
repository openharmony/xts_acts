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
#include "../Gl43masterBaseFunc.h"
#include "../ActsGl43master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002401,
    "KHR-GL43.shaders.preprocessor.conditionals.ifdef_1_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002402,
    "KHR-GL43.shaders.preprocessor.conditionals.ifdef_1_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002403,
    "KHR-GL43.shaders.preprocessor.conditionals.ifdef_2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002404,
    "KHR-GL43.shaders.preprocessor.conditionals.ifdef_2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002405,
    "KHR-GL43.shaders.preprocessor.conditionals.ifdef_3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002406,
    "KHR-GL43.shaders.preprocessor.conditionals.ifdef_3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002407,
    "KHR-GL43.shaders.preprocessor.conditionals.ifndef_1_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002408,
    "KHR-GL43.shaders.preprocessor.conditionals.ifndef_1_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002409,
    "KHR-GL43.shaders.preprocessor.conditionals.ifndef_2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002410,
    "KHR-GL43.shaders.preprocessor.conditionals.ifndef_2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002411,
    "KHR-GL43.shaders.preprocessor.conditionals.mixed_conditional_inclusion_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002412,
    "KHR-GL43.shaders.preprocessor.conditionals.mixed_conditional_inclusion_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002413,
    "KHR-GL43.shaders.preprocessor.conditionals.nested_if_1_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002414,
    "KHR-GL43.shaders.preprocessor.conditionals.nested_if_1_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002415,
    "KHR-GL43.shaders.preprocessor.conditionals.nested_if_2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002416,
    "KHR-GL43.shaders.preprocessor.conditionals.nested_if_2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002417,
    "KHR-GL43.shaders.preprocessor.conditionals.nested_if_3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_002418,
    "KHR-GL43.shaders.preprocessor.conditionals.nested_if_3_fragment");
