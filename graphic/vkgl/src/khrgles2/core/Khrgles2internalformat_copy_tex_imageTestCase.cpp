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
#include "../Khrgles2BaseFunc.h"
#include "../ActsKhrgles20001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000449,
        "KHR-GLES2.core.internalf",
        "ormat.copy_tex_image.rgb");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000450,
        "KHR-GLES2.core.internalf",
        "ormat.copy_tex_image.rgba");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000451,
        "KHR-GLES2.core.internalfo",
        "rmat.copy_tex_image.alpha");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000452,
        "KHR-GLES2.core.internalform",
        "at.copy_tex_image.luminance");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000453,
        "KHR-GLES2.core.internalformat.",
        "copy_tex_image.luminance_alpha");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000454,
        "KHR-GLES2.core.internalfor",
        "mat.copy_tex_image.rgb5_a1");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000455,
        "KHR-GLES2.core.internalfo",
        "rmat.copy_tex_image.rgb565");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000456,
        "KHR-GLES2.core.internalfo",
        "rmat.copy_tex_image.rgba4");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000457,
        "KHR-GLES2.core.internalformat.cop",
        "y_tex_image.luminance4_alpha4_oes");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000458,
        "KHR-GLES2.core.internalformat.cop",
        "y_tex_image.luminance8_alpha8_oes");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000459,
        "KHR-GLES2.core.internalformat",
        ".copy_tex_image.luminance8_oes");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000460,
        "KHR-GLES2.core.internalform",
        "at.copy_tex_image.alpha8_oes");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000461,
        "KHR-GLES2.core.internalfor",
        "mat.copy_tex_image.rgb10_a2");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000462,
        "KHR-GLES2.core.internalfo",
        "rmat.copy_tex_image.rgb10");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000223,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000224,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000225,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000226,
        "KHR-GLES2.texture_3d.filtering.combinations.lin",
        "ear_mipmap_nearest_nearest_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000227,
        "KHR-GLES2.texture_3d.filtering.combinations.lin",
        "ear_mipmap_nearest_nearest_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000228,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000229,
        "KHR-GLES2.texture_3d.filtering.combinations.lin",
        "ear_mipmap_nearest_nearest_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000230,
        "KHR-GLES2.texture_3d.filtering.combinations.lin",
        "ear_mipmap_nearest_nearest_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000231,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000232,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000233,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000234,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000235,
        "KHR-GLES2.texture_3d.filtering.combinations.lin",
        "ear_mipmap_nearest_nearest_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000236,
        "KHR-GLES2.texture_3d.filtering.combinations.lin",
        "ear_mipmap_nearest_nearest_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000237,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_nearest_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000238,
        "KHR-GLES2.texture_3d.filtering.combinations.lin",
        "ear_mipmap_nearest_nearest_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000239,
        "KHR-GLES2.texture_3d.filtering.combinations.lin",
        "ear_mipmap_nearest_nearest_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000240,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_nearest_linear_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000241,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_nearest_linear_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000242,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_nearest_linear_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000243,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_nearest_linear_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000244,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000245,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000246,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_nearest_linear_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000247,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000248,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000249,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_nearest_linear_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000250,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000251,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000252,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000253,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000254,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000255,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000256,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000257,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000258,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_nearest_linear_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000259,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000260,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000261,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000262,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000263,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000264,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000265,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000266,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_nearest_linear_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000267,
        "KHR-GLES2.texture_3d.filtering.combinations.n",
        "earest_mipmap_linear_nearest_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000268,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000269,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000270,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000271,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000272,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000273,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000274,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000275,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000276,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000277,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000278,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000279,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000280,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_linear_nearest_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000281,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_linear_nearest_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000282,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000283,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_linear_nearest_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000284,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_linear_nearest_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000285,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000286,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000287,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000288,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000289,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_linear_nearest_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000290,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_linear_nearest_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000291,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_nearest_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000292,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_linear_nearest_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000293,
        "KHR-GLES2.texture_3d.filtering.combinations.nea",
        "rest_mipmap_linear_nearest_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000294,
        "KHR-GLES2.texture_3d.filtering.combinations.n",
        "earest_mipmap_linear_linear_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000295,
        "KHR-GLES2.texture_3d.filtering.combinations.n",
        "earest_mipmap_linear_linear_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000296,
        "KHR-GLES2.texture_3d.filtering.combinations.n",
        "earest_mipmap_linear_linear_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000297,
        "KHR-GLES2.texture_3d.filtering.combinations.n",
        "earest_mipmap_linear_linear_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000298,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000299,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000300,
        "KHR-GLES2.texture_3d.filtering.combinations.n",
        "earest_mipmap_linear_linear_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000301,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000302,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000303,
        "KHR-GLES2.texture_3d.filtering.combinations.n",
        "earest_mipmap_linear_linear_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000304,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000305,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000306,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000307,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000308,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000309,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000310,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000311,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000312,
        "KHR-GLES2.texture_3d.filtering.combinations.n",
        "earest_mipmap_linear_linear_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000313,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000314,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000315,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000316,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000317,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000318,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000319,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000320,
        "KHR-GLES2.texture_3d.filtering.combinations.ne",
        "arest_mipmap_linear_linear_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000321,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_nearest_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000322,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_nearest_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000323,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_nearest_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000324,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_nearest_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000325,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000326,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000327,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_nearest_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000328,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000329,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000330,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_nearest_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000331,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000332,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000333,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000334,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000335,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000336,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000337,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000338,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000339,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_nearest_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000340,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000341,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000342,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000343,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000344,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000345,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000346,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000347,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_nearest_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000348,
        "KHR-GLES2.texture_3d.filtering.combinations.",
        "linear_mipmap_linear_linear_clamp_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000349,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_clamp_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000350,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_clamp_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000351,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_clamp_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000352,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_clamp_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000353,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_clamp_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000354,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_clamp_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000355,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_clamp_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000356,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_clamp_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000357,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_repeat_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000358,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_repeat_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000359,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_repeat_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000360,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_repeat_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000361,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_linear_repeat_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000362,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_linear_repeat_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000363,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_repeat_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000364,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_linear_repeat_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000365,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_linear_repeat_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000366,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_mirror_clamp_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000367,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_mirror_clamp_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000368,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_mirror_clamp_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000369,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_mirror_repeat_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000370,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_linear_mirror_repeat_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000371,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_linear_mirror_repeat_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000372,
        "KHR-GLES2.texture_3d.filtering.combinations.l",
        "inear_mipmap_linear_linear_mirror_mirror_clamp");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000373,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_linear_mirror_mirror_repeat");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000374,
        "KHR-GLES2.texture_3d.filtering.combinations.li",
        "near_mipmap_linear_linear_mirror_mirror_mirror");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000375,
        "KHR-GLES2.texture_3d.filte",
        "ring.combinations.negative");