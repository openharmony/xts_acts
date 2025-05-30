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
#include "../ActsDeqpgles310026TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025304,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_128_bits.rgba32i_rgba32f.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025305,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_128_bits.rgba32i_rgba32f.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025306,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_128_bits.rgba32i_rgba32f.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025307,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_128_bits.rgba32i_rgba32f.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025308,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_128_bits.rgba32i_rgba32f.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025309,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_128_bits.rgba32i_rgba32f.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025310,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_128_bits.rgba32i_rgba32f.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025311,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_128_bits.rgba32i_rgba32f.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025312,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_128_bits.rgba32i_rgba32f.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025313,
        "dEQP-GLES31.functional.copy_image.non_compressed.vie",
        "wclass_128_bits.rgba32i_rgba32f.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025314,
        "dEQP-GLES31.functional.copy_image.non_compressed.vi",
        "ewclass_128_bits.rgba32i_rgba32f.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025315,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_128_bits.rgba32i_rgba32f.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025316,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_128_bits.rgba32i_rgba32f.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025317,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcla",
        "ss_128_bits.rgba32i_rgba32f.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025318,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewcl",
        "ass_128_bits.rgba32i_rgba32f.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025319,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclass_",
        "128_bits.rgba32i_rgba32f.texture2d_array_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025320,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_128_bits.rgba32i_rgba32f.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025321,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewc",
        "lass_128_bits.rgba32i_rgba32f.renderbuffer_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025322,
        "dEQP-GLES31.functional.copy_image.non_compressed.view",
        "class_128_bits.rgba32i_rgba32f.renderbuffer_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310026TestSuite, TestCase_025323,
        "dEQP-GLES31.functional.copy_image.non_compressed.viewclas",
        "s_128_bits.rgba32i_rgba32f.renderbuffer_to_texture2d_array");
