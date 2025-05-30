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
#include "../ActsDeqpgles310035TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034027,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgba",
        ".srgb8_alpha8_astc_12x12_khr_rgba_astc_12x12_khr.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034028,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgba",
        ".srgb8_alpha8_astc_12x12_khr_rgba_astc_12x12_khr.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034029,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgb",
        "a.srgb8_alpha8_astc_12x12_khr_rgba_astc_12x12_khr.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034030,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgba.sr",
        "gb8_alpha8_astc_12x12_khr_rgba_astc_12x12_khr.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034031,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgba",
        ".srgb8_alpha8_astc_12x12_khr_rgba_astc_12x12_khr.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034032,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgba",
        ".srgb8_alpha8_astc_12x12_khr_rgba_astc_12x12_khr.texture3d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034033,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgb",
        "a.srgb8_alpha8_astc_12x12_khr_rgba_astc_12x12_khr.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034034,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgba.sr",
        "gb8_alpha8_astc_12x12_khr_rgba_astc_12x12_khr.texture3d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034035,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgb",
        "a.srgb8_alpha8_astc_12x12_khr_rgba_astc_12x12_khr.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034036,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgb",
        "a.srgb8_alpha8_astc_12x12_khr_rgba_astc_12x12_khr.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034037,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rg",
        "ba.srgb8_alpha8_astc_12x12_khr_rgba_astc_12x12_khr.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034038,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgba.s",
        "rgb8_alpha8_astc_12x12_khr_rgba_astc_12x12_khr.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034039,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgba.sr",
        "gb8_alpha8_astc_12x12_khr_rgba_astc_12x12_khr.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034040,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgba.sr",
        "gb8_alpha8_astc_12x12_khr_rgba_astc_12x12_khr.texture2d_array_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034041,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgba.s",
        "rgb8_alpha8_astc_12x12_khr_rgba_astc_12x12_khr.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034042,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_astc_12x12_rgba.srgb8",
        "_alpha8_astc_12x12_khr_rgba_astc_12x12_khr.texture2d_array_to_texture2d_array");
