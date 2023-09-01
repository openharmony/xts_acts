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
#include "../ActsTexture0008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsTexture0008TS, TCUfloatnegativevaluesB10g11r11, "dEQP-VK.texture.conversion.ufloat_negative_values.b10g11r11*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclampA2b10g10r10snormpack32, "dEQP-VK.texture.conversion.snorm_clamp.a2b10g10r10_snorm_pack32*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclampA2r10g10b10snormpack32, "dEQP-VK.texture.conversion.snorm_clamp.a2r10g10b10_snorm_pack32*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclampA8b8g8r8snormpack32, "dEQP-VK.texture.conversion.snorm_clamp.a8b8g8r8_snorm_pack32*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclampB8g8r8a8snorm, "dEQP-VK.texture.conversion.snorm_clamp.b8g8r8a8_snorm*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclampB8g8r8snorm, "dEQP-VK.texture.conversion.snorm_clamp.b8g8r8_snorm*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclampR16g16b16a16snorm, "dEQP-VK.texture.conversion.snorm_clamp.r16g16b16a16_snorm*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclampR16g16b16snorm, "dEQP-VK.texture.conversion.snorm_clamp.r16g16b16_snorm*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclampR16g16snorm, "dEQP-VK.texture.conversion.snorm_clamp.r16g16_snorm*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclampR16snorm, "dEQP-VK.texture.conversion.snorm_clamp.r16_snorm*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclampR8g8b8a8snorm, "dEQP-VK.texture.conversion.snorm_clamp.r8g8b8a8_snorm*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclampR8g8b8snorm, "dEQP-VK.texture.conversion.snorm_clamp.r8g8b8_snorm*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclampR8g8snorm, "dEQP-VK.texture.conversion.snorm_clamp.r8g8_snorm*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclampR8snorm, "dEQP-VK.texture.conversion.snorm_clamp.r8_snorm*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclamplinearA2b10g10r10snormpack32, "dEQP-VK.texture.conversion.snorm_clamp_linear.a2b10g10r10_snorm_pack32*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclamplinearA2r10g10b10snormpack32, "dEQP-VK.texture.conversion.snorm_clamp_linear.a2r10g10b10_snorm_pack32*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclamplinearA8b8g8r8snormpack32, "dEQP-VK.texture.conversion.snorm_clamp_linear.a8b8g8r8_snorm_pack32*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclamplinearB8g8r8a8snorm, "dEQP-VK.texture.conversion.snorm_clamp_linear.b8g8r8a8_snorm*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclamplinearB8g8r8snorm, "dEQP-VK.texture.conversion.snorm_clamp_linear.b8g8r8_snorm*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclamplinearR16g16b16a16snorm, "dEQP-VK.texture.conversion.snorm_clamp_linear.r16g16b16a16_snorm*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclamplinearR16g16b16snorm, "dEQP-VK.texture.conversion.snorm_clamp_linear.r16g16b16_snorm*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclamplinearR16g16snorm, "dEQP-VK.texture.conversion.snorm_clamp_linear.r16g16_snorm*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclamplinearR16snorm, "dEQP-VK.texture.conversion.snorm_clamp_linear.r16_snorm*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclamplinearR8g8b8a8snorm, "dEQP-VK.texture.conversion.snorm_clamp_linear.r8g8b8a8_snorm*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclamplinearR8g8b8snorm, "dEQP-VK.texture.conversion.snorm_clamp_linear.r8g8b8_snorm*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclamplinearR8g8snorm, "dEQP-VK.texture.conversion.snorm_clamp_linear.r8g8_snorm*");

static SHRINK_HWTEST_F(ActsTexture0008TS, TCSnormclamplinearR8snorm, "dEQP-VK.texture.conversion.snorm_clamp_linear.r8_snorm*");
