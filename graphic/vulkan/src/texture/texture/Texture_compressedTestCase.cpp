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
#include "../TextureBaseFunc.h"
#include "../ActsTexture0004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEtc2r8g8b8unormblock2dpot, "dEQP-VK.texture.compressed.etc2_r8g8b8_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEtc2r8g8b8unormblock2dpotsparse, "dEQP-VK.texture.compressed.etc2_r8g8b8_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEtc2r8g8b8srgbblock2dpot, "dEQP-VK.texture.compressed.etc2_r8g8b8_srgb_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEtc2r8g8b8srgbblock2dpotsparse, "dEQP-VK.texture.compressed.etc2_r8g8b8_srgb_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEtc2r8g8b8a1unormblock2dpot, "dEQP-VK.texture.compressed.etc2_r8g8b8a1_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEtc2r8g8b8a1unormblock2dpotsparse, "dEQP-VK.texture.compressed.etc2_r8g8b8a1_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEtc2r8g8b8a1srgbblock2dpot, "dEQP-VK.texture.compressed.etc2_r8g8b8a1_srgb_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEtc2r8g8b8a1srgbblock2dpotsparse, "dEQP-VK.texture.compressed.etc2_r8g8b8a1_srgb_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEtc2r8g8b8a8unormblock2dpot, "dEQP-VK.texture.compressed.etc2_r8g8b8a8_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEtc2r8g8b8a8unormblock2dpotsparse, "dEQP-VK.texture.compressed.etc2_r8g8b8a8_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEtc2r8g8b8a8srgbblock2dpot, "dEQP-VK.texture.compressed.etc2_r8g8b8a8_srgb_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEtc2r8g8b8a8srgbblock2dpotsparse, "dEQP-VK.texture.compressed.etc2_r8g8b8a8_srgb_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEacr11unormblock2dpot, "dEQP-VK.texture.compressed.eac_r11_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEacr11unormblock2dpotsparse, "dEQP-VK.texture.compressed.eac_r11_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEacr11snormblock2dpot, "dEQP-VK.texture.compressed.eac_r11_snorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEacr11snormblock2dpotsparse, "dEQP-VK.texture.compressed.eac_r11_snorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEacr11g11unormblock2dpot, "dEQP-VK.texture.compressed.eac_r11g11_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEacr11g11unormblock2dpotsparse, "dEQP-VK.texture.compressed.eac_r11g11_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEacr11g11snormblock2dpot, "dEQP-VK.texture.compressed.eac_r11g11_snorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEacr11g11snormblock2dpotsparse, "dEQP-VK.texture.compressed.eac_r11g11_snorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc4x4unormblock2dpot, "dEQP-VK.texture.compressed.astc_4x4_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc4x4unormblock2dpotsparse, "dEQP-VK.texture.compressed.astc_4x4_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc4x4srgbblock2dpot, "dEQP-VK.texture.compressed.astc_4x4_srgb_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc4x4srgbblock2dpotsparse, "dEQP-VK.texture.compressed.astc_4x4_srgb_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc5x4unormblock2dpot, "dEQP-VK.texture.compressed.astc_5x4_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc5x4unormblock2dpotsparse, "dEQP-VK.texture.compressed.astc_5x4_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc5x4srgbblock2dpot, "dEQP-VK.texture.compressed.astc_5x4_srgb_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc5x4srgbblock2dpotsparse, "dEQP-VK.texture.compressed.astc_5x4_srgb_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc5x5unormblock2dpot, "dEQP-VK.texture.compressed.astc_5x5_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc5x5unormblock2dpotsparse, "dEQP-VK.texture.compressed.astc_5x5_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc5x5srgbblock2dpot, "dEQP-VK.texture.compressed.astc_5x5_srgb_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc5x5srgbblock2dpotsparse, "dEQP-VK.texture.compressed.astc_5x5_srgb_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc6x5unormblock2dpot, "dEQP-VK.texture.compressed.astc_6x5_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc6x5unormblock2dpotsparse, "dEQP-VK.texture.compressed.astc_6x5_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc6x5srgbblock2dpot, "dEQP-VK.texture.compressed.astc_6x5_srgb_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc6x5srgbblock2dpotsparse, "dEQP-VK.texture.compressed.astc_6x5_srgb_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc6x6unormblock2dpot, "dEQP-VK.texture.compressed.astc_6x6_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc6x6unormblock2dpotsparse, "dEQP-VK.texture.compressed.astc_6x6_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc6x6srgbblock2dpot, "dEQP-VK.texture.compressed.astc_6x6_srgb_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc6x6srgbblock2dpotsparse, "dEQP-VK.texture.compressed.astc_6x6_srgb_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc8x5unormblock2dpot, "dEQP-VK.texture.compressed.astc_8x5_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc8x5unormblock2dpotsparse, "dEQP-VK.texture.compressed.astc_8x5_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc8x5srgbblock2dpot, "dEQP-VK.texture.compressed.astc_8x5_srgb_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc8x5srgbblock2dpotsparse, "dEQP-VK.texture.compressed.astc_8x5_srgb_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc8x6unormblock2dpot, "dEQP-VK.texture.compressed.astc_8x6_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc8x6unormblock2dpotsparse, "dEQP-VK.texture.compressed.astc_8x6_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc8x6srgbblock2dpot, "dEQP-VK.texture.compressed.astc_8x6_srgb_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc8x6srgbblock2dpotsparse, "dEQP-VK.texture.compressed.astc_8x6_srgb_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc8x8unormblock2dpot, "dEQP-VK.texture.compressed.astc_8x8_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc8x8unormblock2dpotsparse, "dEQP-VK.texture.compressed.astc_8x8_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc8x8srgbblock2dpot, "dEQP-VK.texture.compressed.astc_8x8_srgb_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc8x8srgbblock2dpotsparse, "dEQP-VK.texture.compressed.astc_8x8_srgb_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x5unormblock2dpot, "dEQP-VK.texture.compressed.astc_10x5_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x5unormblock2dpotsparse, "dEQP-VK.texture.compressed.astc_10x5_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x5srgbblock2dpot, "dEQP-VK.texture.compressed.astc_10x5_srgb_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x5srgbblock2dpotsparse, "dEQP-VK.texture.compressed.astc_10x5_srgb_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x6unormblock2dpot, "dEQP-VK.texture.compressed.astc_10x6_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x6unormblock2dpotsparse, "dEQP-VK.texture.compressed.astc_10x6_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x6srgbblock2dpot, "dEQP-VK.texture.compressed.astc_10x6_srgb_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x6srgbblock2dpotsparse, "dEQP-VK.texture.compressed.astc_10x6_srgb_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x8unormblock2dpot, "dEQP-VK.texture.compressed.astc_10x8_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x8unormblock2dpotsparse, "dEQP-VK.texture.compressed.astc_10x8_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x8srgbblock2dpot, "dEQP-VK.texture.compressed.astc_10x8_srgb_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x8srgbblock2dpotsparse, "dEQP-VK.texture.compressed.astc_10x8_srgb_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x10unormblock2dpot, "dEQP-VK.texture.compressed.astc_10x10_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x10unormblock2dpotsparse, "dEQP-VK.texture.compressed.astc_10x10_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x10srgbblock2dpot, "dEQP-VK.texture.compressed.astc_10x10_srgb_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x10srgbblock2dpotsparse, "dEQP-VK.texture.compressed.astc_10x10_srgb_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc12x10unormblock2dpot, "dEQP-VK.texture.compressed.astc_12x10_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc12x10unormblock2dpotsparse, "dEQP-VK.texture.compressed.astc_12x10_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc12x10srgbblock2dpot, "dEQP-VK.texture.compressed.astc_12x10_srgb_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc12x10srgbblock2dpotsparse, "dEQP-VK.texture.compressed.astc_12x10_srgb_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc12x12unormblock2dpot, "dEQP-VK.texture.compressed.astc_12x12_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc12x12unormblock2dpotsparse, "dEQP-VK.texture.compressed.astc_12x12_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc12x12srgbblock2dpot, "dEQP-VK.texture.compressed.astc_12x12_srgb_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc12x12srgbblock2dpotsparse, "dEQP-VK.texture.compressed.astc_12x12_srgb_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc1rgbunormblock2dpot, "dEQP-VK.texture.compressed.bc1_rgb_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc1rgbunormblock2dpotsparse, "dEQP-VK.texture.compressed.bc1_rgb_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc1rgbsrgbblock2dpot, "dEQP-VK.texture.compressed.bc1_rgb_srgb_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc1rgbsrgbblock2dpotsparse, "dEQP-VK.texture.compressed.bc1_rgb_srgb_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc1rgbaunormblock2dpot, "dEQP-VK.texture.compressed.bc1_rgba_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc1rgbaunormblock2dpotsparse, "dEQP-VK.texture.compressed.bc1_rgba_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc1rgbasrgbblock2dpot, "dEQP-VK.texture.compressed.bc1_rgba_srgb_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc1rgbasrgbblock2dpotsparse, "dEQP-VK.texture.compressed.bc1_rgba_srgb_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc2unormblock2dpot, "dEQP-VK.texture.compressed.bc2_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc2unormblock2dpotsparse, "dEQP-VK.texture.compressed.bc2_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc2srgbblock2dpot, "dEQP-VK.texture.compressed.bc2_srgb_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc2srgbblock2dpotsparse, "dEQP-VK.texture.compressed.bc2_srgb_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc3unormblock2dpot, "dEQP-VK.texture.compressed.bc3_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc3unormblock2dpotsparse, "dEQP-VK.texture.compressed.bc3_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc3srgbblock2dpot, "dEQP-VK.texture.compressed.bc3_srgb_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc3srgbblock2dpotsparse, "dEQP-VK.texture.compressed.bc3_srgb_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc4unormblock2dpot, "dEQP-VK.texture.compressed.bc4_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc4unormblock2dpotsparse, "dEQP-VK.texture.compressed.bc4_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc4snormblock2dpot, "dEQP-VK.texture.compressed.bc4_snorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc4snormblock2dpotsparse, "dEQP-VK.texture.compressed.bc4_snorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc5unormblock2dpot, "dEQP-VK.texture.compressed.bc5_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc5unormblock2dpotsparse, "dEQP-VK.texture.compressed.bc5_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc5snormblock2dpot, "dEQP-VK.texture.compressed.bc5_snorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc5snormblock2dpotsparse, "dEQP-VK.texture.compressed.bc5_snorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc6hufloatblock2dpot, "dEQP-VK.texture.compressed.bc6h_ufloat_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc6hufloatblock2dpotsparse, "dEQP-VK.texture.compressed.bc6h_ufloat_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc6hsfloatblock2dpot, "dEQP-VK.texture.compressed.bc6h_sfloat_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc6hsfloatblock2dpotsparse, "dEQP-VK.texture.compressed.bc6h_sfloat_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc7unormblock2dpot, "dEQP-VK.texture.compressed.bc7_unorm_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc7unormblock2dpotsparse, "dEQP-VK.texture.compressed.bc7_unorm_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc7srgbblock2dpot, "dEQP-VK.texture.compressed.bc7_srgb_block_2d_pot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc7srgbblock2dpotsparse, "dEQP-VK.texture.compressed.bc7_srgb_block_2d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEtc2r8g8b8unormblock2dnpot, "dEQP-VK.texture.compressed.etc2_r8g8b8_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEtc2r8g8b8unormblock2dnpotsparse, "dEQP-VK.texture.compressed.etc2_r8g8b8_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEtc2r8g8b8srgbblock2dnpot, "dEQP-VK.texture.compressed.etc2_r8g8b8_srgb_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEtc2r8g8b8srgbblock2dnpotsparse, "dEQP-VK.texture.compressed.etc2_r8g8b8_srgb_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEtc2r8g8b8a1unormblock2dnpot, "dEQP-VK.texture.compressed.etc2_r8g8b8a1_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEtc2r8g8b8a1unormblock2dnpotsparse, "dEQP-VK.texture.compressed.etc2_r8g8b8a1_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEtc2r8g8b8a1srgbblock2dnpot, "dEQP-VK.texture.compressed.etc2_r8g8b8a1_srgb_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEtc2r8g8b8a1srgbblock2dnpotsparse, "dEQP-VK.texture.compressed.etc2_r8g8b8a1_srgb_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEtc2r8g8b8a8unormblock2dnpot, "dEQP-VK.texture.compressed.etc2_r8g8b8a8_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEtc2r8g8b8a8unormblock2dnpotsparse, "dEQP-VK.texture.compressed.etc2_r8g8b8a8_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEtc2r8g8b8a8srgbblock2dnpot, "dEQP-VK.texture.compressed.etc2_r8g8b8a8_srgb_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEtc2r8g8b8a8srgbblock2dnpotsparse, "dEQP-VK.texture.compressed.etc2_r8g8b8a8_srgb_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEacr11unormblock2dnpot, "dEQP-VK.texture.compressed.eac_r11_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEacr11unormblock2dnpotsparse, "dEQP-VK.texture.compressed.eac_r11_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEacr11snormblock2dnpot, "dEQP-VK.texture.compressed.eac_r11_snorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEacr11snormblock2dnpotsparse, "dEQP-VK.texture.compressed.eac_r11_snorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEacr11g11unormblock2dnpot, "dEQP-VK.texture.compressed.eac_r11g11_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEacr11g11unormblock2dnpotsparse, "dEQP-VK.texture.compressed.eac_r11g11_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEacr11g11snormblock2dnpot, "dEQP-VK.texture.compressed.eac_r11g11_snorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCEacr11g11snormblock2dnpotsparse, "dEQP-VK.texture.compressed.eac_r11g11_snorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc4x4unormblock2dnpot, "dEQP-VK.texture.compressed.astc_4x4_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc4x4unormblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_4x4_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc4x4srgbblock2dnpot, "dEQP-VK.texture.compressed.astc_4x4_srgb_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc4x4srgbblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_4x4_srgb_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc5x4unormblock2dnpot, "dEQP-VK.texture.compressed.astc_5x4_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc5x4unormblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_5x4_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc5x4srgbblock2dnpot, "dEQP-VK.texture.compressed.astc_5x4_srgb_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc5x4srgbblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_5x4_srgb_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc5x5unormblock2dnpot, "dEQP-VK.texture.compressed.astc_5x5_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc5x5unormblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_5x5_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc5x5srgbblock2dnpot, "dEQP-VK.texture.compressed.astc_5x5_srgb_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc5x5srgbblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_5x5_srgb_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc6x5unormblock2dnpot, "dEQP-VK.texture.compressed.astc_6x5_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc6x5unormblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_6x5_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc6x5srgbblock2dnpot, "dEQP-VK.texture.compressed.astc_6x5_srgb_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc6x5srgbblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_6x5_srgb_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc6x6unormblock2dnpot, "dEQP-VK.texture.compressed.astc_6x6_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc6x6unormblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_6x6_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc6x6srgbblock2dnpot, "dEQP-VK.texture.compressed.astc_6x6_srgb_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc6x6srgbblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_6x6_srgb_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc8x5unormblock2dnpot, "dEQP-VK.texture.compressed.astc_8x5_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc8x5unormblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_8x5_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc8x5srgbblock2dnpot, "dEQP-VK.texture.compressed.astc_8x5_srgb_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc8x5srgbblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_8x5_srgb_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc8x6unormblock2dnpot, "dEQP-VK.texture.compressed.astc_8x6_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc8x6unormblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_8x6_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc8x6srgbblock2dnpot, "dEQP-VK.texture.compressed.astc_8x6_srgb_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc8x6srgbblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_8x6_srgb_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc8x8unormblock2dnpot, "dEQP-VK.texture.compressed.astc_8x8_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc8x8unormblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_8x8_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc8x8srgbblock2dnpot, "dEQP-VK.texture.compressed.astc_8x8_srgb_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc8x8srgbblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_8x8_srgb_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x5unormblock2dnpot, "dEQP-VK.texture.compressed.astc_10x5_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x5unormblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_10x5_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x5srgbblock2dnpot, "dEQP-VK.texture.compressed.astc_10x5_srgb_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x5srgbblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_10x5_srgb_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x6unormblock2dnpot, "dEQP-VK.texture.compressed.astc_10x6_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x6unormblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_10x6_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x6srgbblock2dnpot, "dEQP-VK.texture.compressed.astc_10x6_srgb_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x6srgbblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_10x6_srgb_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x8unormblock2dnpot, "dEQP-VK.texture.compressed.astc_10x8_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x8unormblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_10x8_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x8srgbblock2dnpot, "dEQP-VK.texture.compressed.astc_10x8_srgb_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x8srgbblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_10x8_srgb_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x10unormblock2dnpot, "dEQP-VK.texture.compressed.astc_10x10_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x10unormblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_10x10_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x10srgbblock2dnpot, "dEQP-VK.texture.compressed.astc_10x10_srgb_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc10x10srgbblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_10x10_srgb_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc12x10unormblock2dnpot, "dEQP-VK.texture.compressed.astc_12x10_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc12x10unormblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_12x10_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc12x10srgbblock2dnpot, "dEQP-VK.texture.compressed.astc_12x10_srgb_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc12x10srgbblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_12x10_srgb_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc12x12unormblock2dnpot, "dEQP-VK.texture.compressed.astc_12x12_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc12x12unormblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_12x12_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc12x12srgbblock2dnpot, "dEQP-VK.texture.compressed.astc_12x12_srgb_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCAstc12x12srgbblock2dnpotsparse, "dEQP-VK.texture.compressed.astc_12x12_srgb_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc1rgbunormblock2dnpot, "dEQP-VK.texture.compressed.bc1_rgb_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc1rgbunormblock2dnpotsparse, "dEQP-VK.texture.compressed.bc1_rgb_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc1rgbsrgbblock2dnpot, "dEQP-VK.texture.compressed.bc1_rgb_srgb_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc1rgbsrgbblock2dnpotsparse, "dEQP-VK.texture.compressed.bc1_rgb_srgb_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc1rgbaunormblock2dnpot, "dEQP-VK.texture.compressed.bc1_rgba_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc1rgbaunormblock2dnpotsparse, "dEQP-VK.texture.compressed.bc1_rgba_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc1rgbasrgbblock2dnpot, "dEQP-VK.texture.compressed.bc1_rgba_srgb_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc1rgbasrgbblock2dnpotsparse, "dEQP-VK.texture.compressed.bc1_rgba_srgb_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc2unormblock2dnpot, "dEQP-VK.texture.compressed.bc2_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc2unormblock2dnpotsparse, "dEQP-VK.texture.compressed.bc2_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc2srgbblock2dnpot, "dEQP-VK.texture.compressed.bc2_srgb_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc2srgbblock2dnpotsparse, "dEQP-VK.texture.compressed.bc2_srgb_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc3unormblock2dnpot, "dEQP-VK.texture.compressed.bc3_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc3unormblock2dnpotsparse, "dEQP-VK.texture.compressed.bc3_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc3srgbblock2dnpot, "dEQP-VK.texture.compressed.bc3_srgb_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc3srgbblock2dnpotsparse, "dEQP-VK.texture.compressed.bc3_srgb_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc4unormblock2dnpot, "dEQP-VK.texture.compressed.bc4_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc4unormblock2dnpotsparse, "dEQP-VK.texture.compressed.bc4_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc4snormblock2dnpot, "dEQP-VK.texture.compressed.bc4_snorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc4snormblock2dnpotsparse, "dEQP-VK.texture.compressed.bc4_snorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc5unormblock2dnpot, "dEQP-VK.texture.compressed.bc5_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc5unormblock2dnpotsparse, "dEQP-VK.texture.compressed.bc5_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc5snormblock2dnpot, "dEQP-VK.texture.compressed.bc5_snorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc5snormblock2dnpotsparse, "dEQP-VK.texture.compressed.bc5_snorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc6hufloatblock2dnpot, "dEQP-VK.texture.compressed.bc6h_ufloat_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc6hufloatblock2dnpotsparse, "dEQP-VK.texture.compressed.bc6h_ufloat_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc6hsfloatblock2dnpot, "dEQP-VK.texture.compressed.bc6h_sfloat_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc6hsfloatblock2dnpotsparse, "dEQP-VK.texture.compressed.bc6h_sfloat_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc7unormblock2dnpot, "dEQP-VK.texture.compressed.bc7_unorm_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc7unormblock2dnpotsparse, "dEQP-VK.texture.compressed.bc7_unorm_block_2d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc7srgbblock2dnpot, "dEQP-VK.texture.compressed.bc7_srgb_block_2d_npot*");

static SHRINK_HWTEST_F(ActsTexture0004TS, TCBc7srgbblock2dnpotsparse, "dEQP-VK.texture.compressed.bc7_srgb_block_2d_npot_sparse*");
