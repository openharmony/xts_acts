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
#include "../ActsDeqpgles310004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003257,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.i",
        "nterpolate_at_offset.at_sample_position.default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003258,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.in",
        "terpolate_at_offset.at_sample_position.singlesample_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003259,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.in",
        "terpolate_at_offset.at_sample_position.multisample_texture_1");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003260,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.in",
        "terpolate_at_offset.at_sample_position.multisample_texture_2");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003261,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.in",
        "terpolate_at_offset.at_sample_position.multisample_texture_4");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003262,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.in",
        "terpolate_at_offset.at_sample_position.multisample_texture_8");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003263,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.int",
        "erpolate_at_offset.at_sample_position.multisample_texture_16");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003264,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.",
        "interpolate_at_offset.at_sample_position.singlesample_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003265,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.",
        "interpolate_at_offset.at_sample_position.multisample_rbo_1");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003266,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.",
        "interpolate_at_offset.at_sample_position.multisample_rbo_2");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003267,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.",
        "interpolate_at_offset.at_sample_position.multisample_rbo_4");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003268,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.",
        "interpolate_at_offset.at_sample_position.multisample_rbo_8");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003269,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.i",
        "nterpolate_at_offset.at_sample_position.multisample_rbo_16");
