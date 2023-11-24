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
#include "../ActsTexture0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x2nearestnearestmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.2x2_nearest_nearest_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x2nearestnearestmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.2x2_nearest_nearest_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x2nearestnearestmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.2x2_nearest_nearest_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x2nearestnearestmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.2x2_nearest_nearest_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x2nearestlinearmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.2x2_nearest_linear_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x2nearestlinearmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.2x2_nearest_linear_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x2nearestlinearmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.2x2_nearest_linear_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x2nearestlinearmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.2x2_nearest_linear_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x2linearnearestmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.2x2_linear_nearest_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x2linearnearestmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.2x2_linear_nearest_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x2linearnearestmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.2x2_linear_nearest_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x2linearnearestmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.2x2_linear_nearest_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x2linearlinearmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.2x2_linear_linear_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x2linearlinearmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.2x2_linear_linear_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x2linearlinearmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.2x2_linear_linear_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x2linearlinearmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.2x2_linear_linear_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x3nearestnearestmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.2x3_nearest_nearest_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x3nearestnearestmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.2x3_nearest_nearest_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x3nearestnearestmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.2x3_nearest_nearest_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x3nearestnearestmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.2x3_nearest_nearest_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x3nearestlinearmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.2x3_nearest_linear_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x3nearestlinearmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.2x3_nearest_linear_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x3nearestlinearmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.2x3_nearest_linear_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x3nearestlinearmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.2x3_nearest_linear_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x3linearnearestmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.2x3_linear_nearest_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x3linearnearestmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.2x3_linear_nearest_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x3linearnearestmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.2x3_linear_nearest_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x3linearnearestmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.2x3_linear_nearest_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x3linearlinearmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.2x3_linear_linear_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x3linearlinearmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.2x3_linear_linear_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x3linearlinearmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.2x3_linear_linear_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes2x3linearlinearmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.2x3_linear_linear_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes3x7nearestnearestmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.3x7_nearest_nearest_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes3x7nearestnearestmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.3x7_nearest_nearest_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes3x7nearestnearestmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.3x7_nearest_nearest_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes3x7nearestnearestmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.3x7_nearest_nearest_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes3x7nearestlinearmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.3x7_nearest_linear_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes3x7nearestlinearmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.3x7_nearest_linear_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes3x7nearestlinearmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.3x7_nearest_linear_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes3x7nearestlinearmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.3x7_nearest_linear_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes3x7linearnearestmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.3x7_linear_nearest_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes3x7linearnearestmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.3x7_linear_nearest_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes3x7linearnearestmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.3x7_linear_nearest_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes3x7linearnearestmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.3x7_linear_nearest_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes3x7linearlinearmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.3x7_linear_linear_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes3x7linearlinearmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.3x7_linear_linear_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes3x7linearlinearmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.3x7_linear_linear_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes3x7linearlinearmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.3x7_linear_linear_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes4x8nearestnearestmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.4x8_nearest_nearest_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes4x8nearestnearestmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.4x8_nearest_nearest_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes4x8nearestnearestmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.4x8_nearest_nearest_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes4x8nearestnearestmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.4x8_nearest_nearest_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes4x8nearestlinearmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.4x8_nearest_linear_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes4x8nearestlinearmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.4x8_nearest_linear_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes4x8nearestlinearmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.4x8_nearest_linear_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes4x8nearestlinearmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.4x8_nearest_linear_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes4x8linearnearestmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.4x8_linear_nearest_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes4x8linearnearestmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.4x8_linear_nearest_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes4x8linearnearestmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.4x8_linear_nearest_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes4x8linearnearestmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.4x8_linear_nearest_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes4x8linearlinearmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.4x8_linear_linear_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes4x8linearlinearmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.4x8_linear_linear_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes4x8linearlinearmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.4x8_linear_linear_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes4x8linearlinearmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.4x8_linear_linear_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes31x55nearestnearestmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.31x55_nearest_nearest_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes31x55nearestnearestmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.31x55_nearest_nearest_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes31x55nearestnearestmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.31x55_nearest_nearest_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes31x55nearestnearestmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.31x55_nearest_nearest_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes31x55nearestlinearmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.31x55_nearest_linear_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes31x55nearestlinearmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.31x55_nearest_linear_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes31x55nearestlinearmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.31x55_nearest_linear_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes31x55nearestlinearmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.31x55_nearest_linear_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes31x55linearnearestmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.31x55_linear_nearest_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes31x55linearnearestmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.31x55_linear_nearest_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes31x55linearnearestmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.31x55_linear_nearest_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes31x55linearnearestmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.31x55_linear_nearest_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes31x55linearlinearmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.31x55_linear_linear_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes31x55linearlinearmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.31x55_linear_linear_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes31x55linearlinearmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.31x55_linear_linear_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes31x55linearlinearmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.31x55_linear_linear_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x32nearestnearestmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.32x32_nearest_nearest_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x32nearestnearestmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.32x32_nearest_nearest_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x32nearestnearestmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.32x32_nearest_nearest_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x32nearestnearestmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.32x32_nearest_nearest_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x32nearestlinearmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.32x32_nearest_linear_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x32nearestlinearmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.32x32_nearest_linear_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x32nearestlinearmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.32x32_nearest_linear_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x32nearestlinearmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.32x32_nearest_linear_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x32linearnearestmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.32x32_linear_nearest_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x32linearnearestmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.32x32_linear_nearest_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x32linearnearestmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.32x32_linear_nearest_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x32linearnearestmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.32x32_linear_nearest_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x32linearlinearmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.32x32_linear_linear_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x32linearlinearmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.32x32_linear_linear_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x32linearlinearmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.32x32_linear_linear_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x32linearlinearmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.32x32_linear_linear_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x64nearestnearestmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.32x64_nearest_nearest_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x64nearestnearestmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.32x64_nearest_nearest_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x64nearestnearestmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.32x64_nearest_nearest_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x64nearestnearestmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.32x64_nearest_nearest_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x64nearestlinearmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.32x64_nearest_linear_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x64nearestlinearmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.32x64_nearest_linear_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x64nearestlinearmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.32x64_nearest_linear_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x64nearestlinearmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.32x64_nearest_linear_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x64linearnearestmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.32x64_linear_nearest_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x64linearnearestmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.32x64_linear_nearest_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x64linearnearestmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.32x64_linear_nearest_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x64linearnearestmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.32x64_linear_nearest_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x64linearlinearmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.32x64_linear_linear_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x64linearlinearmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.32x64_linear_linear_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x64linearlinearmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.32x64_linear_linear_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes32x64linearlinearmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.32x64_linear_linear_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes57x35nearestnearestmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.57x35_nearest_nearest_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes57x35nearestnearestmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.57x35_nearest_nearest_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes57x35nearestnearestmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.57x35_nearest_nearest_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes57x35nearestnearestmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.57x35_nearest_nearest_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes57x35nearestlinearmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.57x35_nearest_linear_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes57x35nearestlinearmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.57x35_nearest_linear_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes57x35nearestlinearmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.57x35_nearest_linear_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes57x35nearestlinearmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.57x35_nearest_linear_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes57x35linearnearestmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.57x35_linear_nearest_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes57x35linearnearestmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.57x35_linear_nearest_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes57x35linearnearestmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.57x35_linear_nearest_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes57x35linearnearestmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.57x35_linear_nearest_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes57x35linearlinearmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.57x35_linear_linear_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes57x35linearlinearmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.57x35_linear_linear_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes57x35linearlinearmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.57x35_linear_linear_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes57x35linearlinearmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.57x35_linear_linear_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes128x128nearestnearestmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.128x128_nearest_nearest_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes128x128nearestnearestmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.128x128_nearest_nearest_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes128x128nearestnearestmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.128x128_nearest_nearest_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes128x128nearestnearestmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.128x128_nearest_nearest_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes128x128nearestlinearmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.128x128_nearest_linear_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes128x128nearestlinearmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.128x128_nearest_linear_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes128x128nearestlinearmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.128x128_nearest_linear_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes128x128nearestlinearmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.128x128_nearest_linear_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes128x128linearnearestmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.128x128_linear_nearest_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes128x128linearnearestmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.128x128_linear_nearest_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes128x128linearnearestmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.128x128_linear_nearest_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes128x128linearnearestmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.128x128_linear_nearest_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes128x128linearlinearmipmapnearestrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.128x128_linear_linear_mipmap_nearest_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes128x128linearlinearmipmapnearestclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.128x128_linear_linear_mipmap_nearest_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes128x128linearlinearmipmaplinearrepeat, "dEQP-VK.texture.explicit_lod.2d.sizes.128x128_linear_linear_mipmap_linear_repeat*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dSizes128x128linearlinearmipmaplinearclamp, "dEQP-VK.texture.explicit_lod.2d.sizes.128x128_linear_linear_mipmap_linear_clamp*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsB4g4r4a4unormpack16nearest, "dEQP-VK.texture.explicit_lod.2d.formats.b4g4r4a4_unorm_pack16_nearest*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsB4g4r4a4unormpack16linear, "dEQP-VK.texture.explicit_lod.2d.formats.b4g4r4a4_unorm_pack16_linear*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR5g6b5unormpack16nearest, "dEQP-VK.texture.explicit_lod.2d.formats.r5g6b5_unorm_pack16_nearest*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR5g6b5unormpack16linear, "dEQP-VK.texture.explicit_lod.2d.formats.r5g6b5_unorm_pack16_linear*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsA1r5g5b5unormpack16nearest, "dEQP-VK.texture.explicit_lod.2d.formats.a1r5g5b5_unorm_pack16_nearest*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsA1r5g5b5unormpack16linear, "dEQP-VK.texture.explicit_lod.2d.formats.a1r5g5b5_unorm_pack16_linear*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR8unormnearest, "dEQP-VK.texture.explicit_lod.2d.formats.r8_unorm_nearest*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR8unormlinear, "dEQP-VK.texture.explicit_lod.2d.formats.r8_unorm_linear*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR8snormnearest, "dEQP-VK.texture.explicit_lod.2d.formats.r8_snorm_nearest*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR8snormlinear, "dEQP-VK.texture.explicit_lod.2d.formats.r8_snorm_linear*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR8g8unormnearest, "dEQP-VK.texture.explicit_lod.2d.formats.r8g8_unorm_nearest*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR8g8unormlinear, "dEQP-VK.texture.explicit_lod.2d.formats.r8g8_unorm_linear*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR8g8snormnearest, "dEQP-VK.texture.explicit_lod.2d.formats.r8g8_snorm_nearest*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR8g8snormlinear, "dEQP-VK.texture.explicit_lod.2d.formats.r8g8_snorm_linear*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR8g8b8a8unormnearest, "dEQP-VK.texture.explicit_lod.2d.formats.r8g8b8a8_unorm_nearest*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR8g8b8a8unormlinear, "dEQP-VK.texture.explicit_lod.2d.formats.r8g8b8a8_unorm_linear*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR8g8b8a8snormnearest, "dEQP-VK.texture.explicit_lod.2d.formats.r8g8b8a8_snorm_nearest*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR8g8b8a8snormlinear, "dEQP-VK.texture.explicit_lod.2d.formats.r8g8b8a8_snorm_linear*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsB8g8r8a8unormnearest, "dEQP-VK.texture.explicit_lod.2d.formats.b8g8r8a8_unorm_nearest*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsB8g8r8a8unormlinear, "dEQP-VK.texture.explicit_lod.2d.formats.b8g8r8a8_unorm_linear*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsA8b8g8r8unormpack32nearest, "dEQP-VK.texture.explicit_lod.2d.formats.a8b8g8r8_unorm_pack32_nearest*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsA8b8g8r8unormpack32linear, "dEQP-VK.texture.explicit_lod.2d.formats.a8b8g8r8_unorm_pack32_linear*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsA8b8g8r8snormpack32nearest, "dEQP-VK.texture.explicit_lod.2d.formats.a8b8g8r8_snorm_pack32_nearest*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsA8b8g8r8snormpack32linear, "dEQP-VK.texture.explicit_lod.2d.formats.a8b8g8r8_snorm_pack32_linear*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsA2b10g10r10unormpack32nearest, "dEQP-VK.texture.explicit_lod.2d.formats.a2b10g10r10_unorm_pack32_nearest*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsA2b10g10r10unormpack32linear, "dEQP-VK.texture.explicit_lod.2d.formats.a2b10g10r10_unorm_pack32_linear*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR16sfloatnearest, "dEQP-VK.texture.explicit_lod.2d.formats.r16_sfloat_nearest*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR16sfloatlinear, "dEQP-VK.texture.explicit_lod.2d.formats.r16_sfloat_linear*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR16g16sfloatnearest, "dEQP-VK.texture.explicit_lod.2d.formats.r16g16_sfloat_nearest*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR16g16sfloatlinear, "dEQP-VK.texture.explicit_lod.2d.formats.r16g16_sfloat_linear*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR16g16b16a16sfloatnearest, "dEQP-VK.texture.explicit_lod.2d.formats.r16g16b16a16_sfloat_nearest*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR16g16b16a16sfloatlinear, "dEQP-VK.texture.explicit_lod.2d.formats.r16g16b16a16_sfloat_linear*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR32sfloatnearest, "dEQP-VK.texture.explicit_lod.2d.formats.r32_sfloat_nearest*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR32sfloatlinear, "dEQP-VK.texture.explicit_lod.2d.formats.r32_sfloat_linear*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR32g32sfloatnearest, "dEQP-VK.texture.explicit_lod.2d.formats.r32g32_sfloat_nearest*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR32g32sfloatlinear, "dEQP-VK.texture.explicit_lod.2d.formats.r32g32_sfloat_linear*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR32g32b32a32sfloatnearest, "dEQP-VK.texture.explicit_lod.2d.formats.r32g32b32a32_sfloat_nearest*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dFormatsR32g32b32a32sfloatlinear, "dEQP-VK.texture.explicit_lod.2d.formats.r32g32b32a32_sfloat_linear*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dDerivativesNearestnearestmipmapnearest, "dEQP-VK.texture.explicit_lod.2d.derivatives.nearest_nearest_mipmap_nearest*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dDerivativesNearestnearestmipmaplinear, "dEQP-VK.texture.explicit_lod.2d.derivatives.nearest_nearest_mipmap_linear*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dDerivativesNearestlinearmipmapnearest, "dEQP-VK.texture.explicit_lod.2d.derivatives.nearest_linear_mipmap_nearest*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dDerivativesNearestlinearmipmaplinear, "dEQP-VK.texture.explicit_lod.2d.derivatives.nearest_linear_mipmap_linear*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dDerivativesLinearnearestmipmapnearest, "dEQP-VK.texture.explicit_lod.2d.derivatives.linear_nearest_mipmap_nearest*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dDerivativesLinearnearestmipmaplinear, "dEQP-VK.texture.explicit_lod.2d.derivatives.linear_nearest_mipmap_linear*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dDerivativesLinearlinearmipmapnearest, "dEQP-VK.texture.explicit_lod.2d.derivatives.linear_linear_mipmap_nearest*");

static SHRINK_HWTEST_F(ActsTexture0001TS, TC2dDerivativesLinearlinearmipmaplinear, "dEQP-VK.texture.explicit_lod.2d.derivatives.linear_linear_mipmap_linear*");
