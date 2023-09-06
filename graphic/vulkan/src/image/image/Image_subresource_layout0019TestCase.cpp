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
#include "../ImageBaseFunc.h"
#include "../ActsImage0020TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsB8g8r8a8uscaled, "dEQP-VK.image.subresource_layout.3d.all_levels.b8g8r8a8_uscaled*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsB8g8r8a8sscaled, "dEQP-VK.image.subresource_layout.3d.all_levels.b8g8r8a8_sscaled*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsB8g8r8a8uint, "dEQP-VK.image.subresource_layout.3d.all_levels.b8g8r8a8_uint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsB8g8r8a8sint, "dEQP-VK.image.subresource_layout.3d.all_levels.b8g8r8a8_sint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsB8g8r8a8srgb, "dEQP-VK.image.subresource_layout.3d.all_levels.b8g8r8a8_srgb*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsA8b8g8r8unormpack32, "dEQP-VK.image.subresource_layout.3d.all_levels.a8b8g8r8_unorm_pack32*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsA8b8g8r8snormpack32, "dEQP-VK.image.subresource_layout.3d.all_levels.a8b8g8r8_snorm_pack32*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsA8b8g8r8uscaledpack32, "dEQP-VK.image.subresource_layout.3d.all_levels.a8b8g8r8_uscaled_pack32*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsA8b8g8r8sscaledpack32, "dEQP-VK.image.subresource_layout.3d.all_levels.a8b8g8r8_sscaled_pack32*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsA8b8g8r8uintpack32, "dEQP-VK.image.subresource_layout.3d.all_levels.a8b8g8r8_uint_pack32*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsA8b8g8r8sintpack32, "dEQP-VK.image.subresource_layout.3d.all_levels.a8b8g8r8_sint_pack32*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsA8b8g8r8srgbpack32, "dEQP-VK.image.subresource_layout.3d.all_levels.a8b8g8r8_srgb_pack32*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsA2r10g10b10unormpack32, "dEQP-VK.image.subresource_layout.3d.all_levels.a2r10g10b10_unorm_pack32*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsA2r10g10b10snormpack32, "dEQP-VK.image.subresource_layout.3d.all_levels.a2r10g10b10_snorm_pack32*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsA2r10g10b10uscaledpack32, "dEQP-VK.image.subresource_layout.3d.all_levels.a2r10g10b10_uscaled_pack32*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsA2r10g10b10sscaledpack32, "dEQP-VK.image.subresource_layout.3d.all_levels.a2r10g10b10_sscaled_pack32*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsA2r10g10b10uintpack32, "dEQP-VK.image.subresource_layout.3d.all_levels.a2r10g10b10_uint_pack32*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsA2r10g10b10sintpack32, "dEQP-VK.image.subresource_layout.3d.all_levels.a2r10g10b10_sint_pack32*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsA2b10g10r10unormpack32, "dEQP-VK.image.subresource_layout.3d.all_levels.a2b10g10r10_unorm_pack32*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsA2b10g10r10snormpack32, "dEQP-VK.image.subresource_layout.3d.all_levels.a2b10g10r10_snorm_pack32*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsA2b10g10r10uscaledpack32, "dEQP-VK.image.subresource_layout.3d.all_levels.a2b10g10r10_uscaled_pack32*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsA2b10g10r10sscaledpack32, "dEQP-VK.image.subresource_layout.3d.all_levels.a2b10g10r10_sscaled_pack32*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsA2b10g10r10uintpack32, "dEQP-VK.image.subresource_layout.3d.all_levels.a2b10g10r10_uint_pack32*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsA2b10g10r10sintpack32, "dEQP-VK.image.subresource_layout.3d.all_levels.a2b10g10r10_sint_pack32*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16unorm, "dEQP-VK.image.subresource_layout.3d.all_levels.r16_unorm*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16snorm, "dEQP-VK.image.subresource_layout.3d.all_levels.r16_snorm*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16uscaled, "dEQP-VK.image.subresource_layout.3d.all_levels.r16_uscaled*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16sscaled, "dEQP-VK.image.subresource_layout.3d.all_levels.r16_sscaled*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16uint, "dEQP-VK.image.subresource_layout.3d.all_levels.r16_uint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16sint, "dEQP-VK.image.subresource_layout.3d.all_levels.r16_sint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16sfloat, "dEQP-VK.image.subresource_layout.3d.all_levels.r16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16g16unorm, "dEQP-VK.image.subresource_layout.3d.all_levels.r16g16_unorm*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16g16snorm, "dEQP-VK.image.subresource_layout.3d.all_levels.r16g16_snorm*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16g16uscaled, "dEQP-VK.image.subresource_layout.3d.all_levels.r16g16_uscaled*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16g16sscaled, "dEQP-VK.image.subresource_layout.3d.all_levels.r16g16_sscaled*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16g16uint, "dEQP-VK.image.subresource_layout.3d.all_levels.r16g16_uint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16g16sint, "dEQP-VK.image.subresource_layout.3d.all_levels.r16g16_sint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16g16sfloat, "dEQP-VK.image.subresource_layout.3d.all_levels.r16g16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16g16b16unorm, "dEQP-VK.image.subresource_layout.3d.all_levels.r16g16b16_unorm*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16g16b16snorm, "dEQP-VK.image.subresource_layout.3d.all_levels.r16g16b16_snorm*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16g16b16uscaled, "dEQP-VK.image.subresource_layout.3d.all_levels.r16g16b16_uscaled*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16g16b16sscaled, "dEQP-VK.image.subresource_layout.3d.all_levels.r16g16b16_sscaled*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16g16b16uint, "dEQP-VK.image.subresource_layout.3d.all_levels.r16g16b16_uint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16g16b16sint, "dEQP-VK.image.subresource_layout.3d.all_levels.r16g16b16_sint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16g16b16sfloat, "dEQP-VK.image.subresource_layout.3d.all_levels.r16g16b16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16g16b16a16unorm, "dEQP-VK.image.subresource_layout.3d.all_levels.r16g16b16a16_unorm*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16g16b16a16snorm, "dEQP-VK.image.subresource_layout.3d.all_levels.r16g16b16a16_snorm*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16g16b16a16uscaled, "dEQP-VK.image.subresource_layout.3d.all_levels.r16g16b16a16_uscaled*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16g16b16a16sscaled, "dEQP-VK.image.subresource_layout.3d.all_levels.r16g16b16a16_sscaled*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16g16b16a16uint, "dEQP-VK.image.subresource_layout.3d.all_levels.r16g16b16a16_uint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16g16b16a16sint, "dEQP-VK.image.subresource_layout.3d.all_levels.r16g16b16a16_sint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR16g16b16a16sfloat, "dEQP-VK.image.subresource_layout.3d.all_levels.r16g16b16a16_sfloat*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR32uint, "dEQP-VK.image.subresource_layout.3d.all_levels.r32_uint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR32sint, "dEQP-VK.image.subresource_layout.3d.all_levels.r32_sint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR32sfloat, "dEQP-VK.image.subresource_layout.3d.all_levels.r32_sfloat*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR32g32uint, "dEQP-VK.image.subresource_layout.3d.all_levels.r32g32_uint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR32g32sint, "dEQP-VK.image.subresource_layout.3d.all_levels.r32g32_sint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR32g32sfloat, "dEQP-VK.image.subresource_layout.3d.all_levels.r32g32_sfloat*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR32g32b32uint, "dEQP-VK.image.subresource_layout.3d.all_levels.r32g32b32_uint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR32g32b32sint, "dEQP-VK.image.subresource_layout.3d.all_levels.r32g32b32_sint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR32g32b32sfloat, "dEQP-VK.image.subresource_layout.3d.all_levels.r32g32b32_sfloat*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR32g32b32a32uint, "dEQP-VK.image.subresource_layout.3d.all_levels.r32g32b32a32_uint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR32g32b32a32sint, "dEQP-VK.image.subresource_layout.3d.all_levels.r32g32b32a32_sint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR32g32b32a32sfloat, "dEQP-VK.image.subresource_layout.3d.all_levels.r32g32b32a32_sfloat*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR64uint, "dEQP-VK.image.subresource_layout.3d.all_levels.r64_uint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR64sint, "dEQP-VK.image.subresource_layout.3d.all_levels.r64_sint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR64sfloat, "dEQP-VK.image.subresource_layout.3d.all_levels.r64_sfloat*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR64g64uint, "dEQP-VK.image.subresource_layout.3d.all_levels.r64g64_uint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR64g64sint, "dEQP-VK.image.subresource_layout.3d.all_levels.r64g64_sint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR64g64sfloat, "dEQP-VK.image.subresource_layout.3d.all_levels.r64g64_sfloat*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR64g64b64uint, "dEQP-VK.image.subresource_layout.3d.all_levels.r64g64b64_uint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR64g64b64sint, "dEQP-VK.image.subresource_layout.3d.all_levels.r64g64b64_sint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR64g64b64sfloat, "dEQP-VK.image.subresource_layout.3d.all_levels.r64g64b64_sfloat*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR64g64b64a64uint, "dEQP-VK.image.subresource_layout.3d.all_levels.r64g64b64a64_uint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR64g64b64a64sint, "dEQP-VK.image.subresource_layout.3d.all_levels.r64g64b64a64_sint*");
static SHRINK_HWTEST_F(ActsImage0020TS, TC3dAlllevelsR64g64b64a64sfloat, "dEQP-VK.image.subresource_layout.3d.all_levels.r64g64b64a64_sfloat*");