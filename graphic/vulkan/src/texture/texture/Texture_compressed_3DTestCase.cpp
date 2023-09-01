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
#include "../ActsTexture0005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEtc2r8g8b8unormblock3dpot, "dEQP-VK.texture.compressed_3D.etc2_r8g8b8_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEtc2r8g8b8unormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.etc2_r8g8b8_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEtc2r8g8b8srgbblock3dpot, "dEQP-VK.texture.compressed_3D.etc2_r8g8b8_srgb_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEtc2r8g8b8srgbblock3dpotsparse, "dEQP-VK.texture.compressed_3D.etc2_r8g8b8_srgb_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEtc2r8g8b8a1unormblock3dpot, "dEQP-VK.texture.compressed_3D.etc2_r8g8b8a1_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEtc2r8g8b8a1unormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.etc2_r8g8b8a1_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEtc2r8g8b8a1srgbblock3dpot, "dEQP-VK.texture.compressed_3D.etc2_r8g8b8a1_srgb_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEtc2r8g8b8a1srgbblock3dpotsparse, "dEQP-VK.texture.compressed_3D.etc2_r8g8b8a1_srgb_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEtc2r8g8b8a8unormblock3dpot, "dEQP-VK.texture.compressed_3D.etc2_r8g8b8a8_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEtc2r8g8b8a8unormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.etc2_r8g8b8a8_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEtc2r8g8b8a8srgbblock3dpot, "dEQP-VK.texture.compressed_3D.etc2_r8g8b8a8_srgb_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEtc2r8g8b8a8srgbblock3dpotsparse, "dEQP-VK.texture.compressed_3D.etc2_r8g8b8a8_srgb_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEacr11unormblock3dpot, "dEQP-VK.texture.compressed_3D.eac_r11_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEacr11unormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.eac_r11_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEacr11snormblock3dpot, "dEQP-VK.texture.compressed_3D.eac_r11_snorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEacr11snormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.eac_r11_snorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEacr11g11unormblock3dpot, "dEQP-VK.texture.compressed_3D.eac_r11g11_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEacr11g11unormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.eac_r11g11_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEacr11g11snormblock3dpot, "dEQP-VK.texture.compressed_3D.eac_r11g11_snorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEacr11g11snormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.eac_r11g11_snorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc4x4unormblock3dpot, "dEQP-VK.texture.compressed_3D.astc_4x4_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc4x4unormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_4x4_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc4x4srgbblock3dpot, "dEQP-VK.texture.compressed_3D.astc_4x4_srgb_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc4x4srgbblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_4x4_srgb_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc5x4unormblock3dpot, "dEQP-VK.texture.compressed_3D.astc_5x4_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc5x4unormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_5x4_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc5x4srgbblock3dpot, "dEQP-VK.texture.compressed_3D.astc_5x4_srgb_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc5x4srgbblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_5x4_srgb_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc5x5unormblock3dpot, "dEQP-VK.texture.compressed_3D.astc_5x5_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc5x5unormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_5x5_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc5x5srgbblock3dpot, "dEQP-VK.texture.compressed_3D.astc_5x5_srgb_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc5x5srgbblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_5x5_srgb_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc6x5unormblock3dpot, "dEQP-VK.texture.compressed_3D.astc_6x5_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc6x5unormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_6x5_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc6x5srgbblock3dpot, "dEQP-VK.texture.compressed_3D.astc_6x5_srgb_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc6x5srgbblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_6x5_srgb_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc6x6unormblock3dpot, "dEQP-VK.texture.compressed_3D.astc_6x6_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc6x6unormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_6x6_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc6x6srgbblock3dpot, "dEQP-VK.texture.compressed_3D.astc_6x6_srgb_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc6x6srgbblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_6x6_srgb_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc8x5unormblock3dpot, "dEQP-VK.texture.compressed_3D.astc_8x5_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc8x5unormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_8x5_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc8x5srgbblock3dpot, "dEQP-VK.texture.compressed_3D.astc_8x5_srgb_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc8x5srgbblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_8x5_srgb_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc8x6unormblock3dpot, "dEQP-VK.texture.compressed_3D.astc_8x6_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc8x6unormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_8x6_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc8x6srgbblock3dpot, "dEQP-VK.texture.compressed_3D.astc_8x6_srgb_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc8x6srgbblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_8x6_srgb_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc8x8unormblock3dpot, "dEQP-VK.texture.compressed_3D.astc_8x8_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc8x8unormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_8x8_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc8x8srgbblock3dpot, "dEQP-VK.texture.compressed_3D.astc_8x8_srgb_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc8x8srgbblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_8x8_srgb_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x5unormblock3dpot, "dEQP-VK.texture.compressed_3D.astc_10x5_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x5unormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_10x5_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x5srgbblock3dpot, "dEQP-VK.texture.compressed_3D.astc_10x5_srgb_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x5srgbblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_10x5_srgb_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x6unormblock3dpot, "dEQP-VK.texture.compressed_3D.astc_10x6_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x6unormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_10x6_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x6srgbblock3dpot, "dEQP-VK.texture.compressed_3D.astc_10x6_srgb_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x6srgbblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_10x6_srgb_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x8unormblock3dpot, "dEQP-VK.texture.compressed_3D.astc_10x8_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x8unormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_10x8_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x8srgbblock3dpot, "dEQP-VK.texture.compressed_3D.astc_10x8_srgb_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x8srgbblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_10x8_srgb_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x10unormblock3dpot, "dEQP-VK.texture.compressed_3D.astc_10x10_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x10unormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_10x10_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x10srgbblock3dpot, "dEQP-VK.texture.compressed_3D.astc_10x10_srgb_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x10srgbblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_10x10_srgb_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc12x10unormblock3dpot, "dEQP-VK.texture.compressed_3D.astc_12x10_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc12x10unormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_12x10_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc12x10srgbblock3dpot, "dEQP-VK.texture.compressed_3D.astc_12x10_srgb_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc12x10srgbblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_12x10_srgb_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc12x12unormblock3dpot, "dEQP-VK.texture.compressed_3D.astc_12x12_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc12x12unormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_12x12_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc12x12srgbblock3dpot, "dEQP-VK.texture.compressed_3D.astc_12x12_srgb_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc12x12srgbblock3dpotsparse, "dEQP-VK.texture.compressed_3D.astc_12x12_srgb_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc1rgbunormblock3dpot, "dEQP-VK.texture.compressed_3D.bc1_rgb_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc1rgbunormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.bc1_rgb_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc1rgbsrgbblock3dpot, "dEQP-VK.texture.compressed_3D.bc1_rgb_srgb_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc1rgbsrgbblock3dpotsparse, "dEQP-VK.texture.compressed_3D.bc1_rgb_srgb_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc1rgbaunormblock3dpot, "dEQP-VK.texture.compressed_3D.bc1_rgba_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc1rgbaunormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.bc1_rgba_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc1rgbasrgbblock3dpot, "dEQP-VK.texture.compressed_3D.bc1_rgba_srgb_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc1rgbasrgbblock3dpotsparse, "dEQP-VK.texture.compressed_3D.bc1_rgba_srgb_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc2unormblock3dpot, "dEQP-VK.texture.compressed_3D.bc2_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc2unormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.bc2_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc2srgbblock3dpot, "dEQP-VK.texture.compressed_3D.bc2_srgb_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc2srgbblock3dpotsparse, "dEQP-VK.texture.compressed_3D.bc2_srgb_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc3unormblock3dpot, "dEQP-VK.texture.compressed_3D.bc3_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc3unormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.bc3_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc3srgbblock3dpot, "dEQP-VK.texture.compressed_3D.bc3_srgb_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc3srgbblock3dpotsparse, "dEQP-VK.texture.compressed_3D.bc3_srgb_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc4unormblock3dpot, "dEQP-VK.texture.compressed_3D.bc4_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc4unormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.bc4_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc4snormblock3dpot, "dEQP-VK.texture.compressed_3D.bc4_snorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc4snormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.bc4_snorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc5unormblock3dpot, "dEQP-VK.texture.compressed_3D.bc5_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc5unormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.bc5_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc5snormblock3dpot, "dEQP-VK.texture.compressed_3D.bc5_snorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc5snormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.bc5_snorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc6hufloatblock3dpot, "dEQP-VK.texture.compressed_3D.bc6h_ufloat_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc6hufloatblock3dpotsparse, "dEQP-VK.texture.compressed_3D.bc6h_ufloat_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc6hsfloatblock3dpot, "dEQP-VK.texture.compressed_3D.bc6h_sfloat_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc6hsfloatblock3dpotsparse, "dEQP-VK.texture.compressed_3D.bc6h_sfloat_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc7unormblock3dpot, "dEQP-VK.texture.compressed_3D.bc7_unorm_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc7unormblock3dpotsparse, "dEQP-VK.texture.compressed_3D.bc7_unorm_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc7srgbblock3dpot, "dEQP-VK.texture.compressed_3D.bc7_srgb_block_3d_pot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc7srgbblock3dpotsparse, "dEQP-VK.texture.compressed_3D.bc7_srgb_block_3d_pot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEtc2r8g8b8unormblock3dnpot, "dEQP-VK.texture.compressed_3D.etc2_r8g8b8_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEtc2r8g8b8unormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.etc2_r8g8b8_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEtc2r8g8b8srgbblock3dnpot, "dEQP-VK.texture.compressed_3D.etc2_r8g8b8_srgb_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEtc2r8g8b8srgbblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.etc2_r8g8b8_srgb_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEtc2r8g8b8a1unormblock3dnpot, "dEQP-VK.texture.compressed_3D.etc2_r8g8b8a1_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEtc2r8g8b8a1unormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.etc2_r8g8b8a1_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEtc2r8g8b8a1srgbblock3dnpot, "dEQP-VK.texture.compressed_3D.etc2_r8g8b8a1_srgb_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEtc2r8g8b8a1srgbblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.etc2_r8g8b8a1_srgb_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEtc2r8g8b8a8unormblock3dnpot, "dEQP-VK.texture.compressed_3D.etc2_r8g8b8a8_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEtc2r8g8b8a8unormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.etc2_r8g8b8a8_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEtc2r8g8b8a8srgbblock3dnpot, "dEQP-VK.texture.compressed_3D.etc2_r8g8b8a8_srgb_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEtc2r8g8b8a8srgbblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.etc2_r8g8b8a8_srgb_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEacr11unormblock3dnpot, "dEQP-VK.texture.compressed_3D.eac_r11_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEacr11unormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.eac_r11_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEacr11snormblock3dnpot, "dEQP-VK.texture.compressed_3D.eac_r11_snorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEacr11snormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.eac_r11_snorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEacr11g11unormblock3dnpot, "dEQP-VK.texture.compressed_3D.eac_r11g11_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEacr11g11unormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.eac_r11g11_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEacr11g11snormblock3dnpot, "dEQP-VK.texture.compressed_3D.eac_r11g11_snorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCEacr11g11snormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.eac_r11g11_snorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc4x4unormblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_4x4_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc4x4unormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_4x4_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc4x4srgbblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_4x4_srgb_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc4x4srgbblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_4x4_srgb_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc5x4unormblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_5x4_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc5x4unormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_5x4_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc5x4srgbblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_5x4_srgb_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc5x4srgbblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_5x4_srgb_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc5x5unormblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_5x5_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc5x5unormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_5x5_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc5x5srgbblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_5x5_srgb_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc5x5srgbblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_5x5_srgb_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc6x5unormblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_6x5_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc6x5unormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_6x5_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc6x5srgbblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_6x5_srgb_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc6x5srgbblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_6x5_srgb_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc6x6unormblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_6x6_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc6x6unormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_6x6_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc6x6srgbblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_6x6_srgb_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc6x6srgbblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_6x6_srgb_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc8x5unormblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_8x5_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc8x5unormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_8x5_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc8x5srgbblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_8x5_srgb_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc8x5srgbblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_8x5_srgb_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc8x6unormblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_8x6_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc8x6unormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_8x6_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc8x6srgbblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_8x6_srgb_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc8x6srgbblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_8x6_srgb_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc8x8unormblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_8x8_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc8x8unormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_8x8_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc8x8srgbblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_8x8_srgb_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc8x8srgbblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_8x8_srgb_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x5unormblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_10x5_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x5unormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_10x5_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x5srgbblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_10x5_srgb_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x5srgbblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_10x5_srgb_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x6unormblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_10x6_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x6unormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_10x6_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x6srgbblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_10x6_srgb_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x6srgbblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_10x6_srgb_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x8unormblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_10x8_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x8unormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_10x8_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x8srgbblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_10x8_srgb_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x8srgbblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_10x8_srgb_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x10unormblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_10x10_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x10unormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_10x10_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x10srgbblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_10x10_srgb_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc10x10srgbblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_10x10_srgb_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc12x10unormblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_12x10_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc12x10unormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_12x10_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc12x10srgbblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_12x10_srgb_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc12x10srgbblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_12x10_srgb_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc12x12unormblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_12x12_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc12x12unormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_12x12_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc12x12srgbblock3dnpot, "dEQP-VK.texture.compressed_3D.astc_12x12_srgb_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCAstc12x12srgbblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.astc_12x12_srgb_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc1rgbunormblock3dnpot, "dEQP-VK.texture.compressed_3D.bc1_rgb_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc1rgbunormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.bc1_rgb_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc1rgbsrgbblock3dnpot, "dEQP-VK.texture.compressed_3D.bc1_rgb_srgb_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc1rgbsrgbblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.bc1_rgb_srgb_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc1rgbaunormblock3dnpot, "dEQP-VK.texture.compressed_3D.bc1_rgba_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc1rgbaunormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.bc1_rgba_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc1rgbasrgbblock3dnpot, "dEQP-VK.texture.compressed_3D.bc1_rgba_srgb_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc1rgbasrgbblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.bc1_rgba_srgb_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc2unormblock3dnpot, "dEQP-VK.texture.compressed_3D.bc2_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc2unormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.bc2_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc2srgbblock3dnpot, "dEQP-VK.texture.compressed_3D.bc2_srgb_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc2srgbblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.bc2_srgb_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc3unormblock3dnpot, "dEQP-VK.texture.compressed_3D.bc3_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc3unormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.bc3_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc3srgbblock3dnpot, "dEQP-VK.texture.compressed_3D.bc3_srgb_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc3srgbblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.bc3_srgb_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc4unormblock3dnpot, "dEQP-VK.texture.compressed_3D.bc4_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc4unormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.bc4_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc4snormblock3dnpot, "dEQP-VK.texture.compressed_3D.bc4_snorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc4snormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.bc4_snorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc5unormblock3dnpot, "dEQP-VK.texture.compressed_3D.bc5_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc5unormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.bc5_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc5snormblock3dnpot, "dEQP-VK.texture.compressed_3D.bc5_snorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc5snormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.bc5_snorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc6hufloatblock3dnpot, "dEQP-VK.texture.compressed_3D.bc6h_ufloat_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc6hufloatblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.bc6h_ufloat_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc6hsfloatblock3dnpot, "dEQP-VK.texture.compressed_3D.bc6h_sfloat_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc6hsfloatblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.bc6h_sfloat_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc7unormblock3dnpot, "dEQP-VK.texture.compressed_3D.bc7_unorm_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc7unormblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.bc7_unorm_block_3d_npot_sparse*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc7srgbblock3dnpot, "dEQP-VK.texture.compressed_3D.bc7_srgb_block_3d_npot*");

static SHRINK_HWTEST_F(ActsTexture0005TS, TCBc7srgbblock3dnpotsparse, "dEQP-VK.texture.compressed_3D.bc7_srgb_block_3d_npot_sparse*");
