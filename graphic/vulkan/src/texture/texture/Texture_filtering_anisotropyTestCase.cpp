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
#include "../ActsTexture0003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsTexture0003TS, TCBasicAnisotropy2Magnearestminnearest, "dEQP-VK.texture.filtering_anisotropy.basic.anisotropy_2.mag_nearest_min_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCBasicAnisotropy2Maglinearminnearest, "dEQP-VK.texture.filtering_anisotropy.basic.anisotropy_2.mag_linear_min_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCBasicAnisotropy2Magnearestminlinear, "dEQP-VK.texture.filtering_anisotropy.basic.anisotropy_2.mag_nearest_min_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCBasicAnisotropy2Maglinearminlinear, "dEQP-VK.texture.filtering_anisotropy.basic.anisotropy_2.mag_linear_min_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCBasicAnisotropy4Magnearestminnearest, "dEQP-VK.texture.filtering_anisotropy.basic.anisotropy_4.mag_nearest_min_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCBasicAnisotropy4Maglinearminnearest, "dEQP-VK.texture.filtering_anisotropy.basic.anisotropy_4.mag_linear_min_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCBasicAnisotropy4Magnearestminlinear, "dEQP-VK.texture.filtering_anisotropy.basic.anisotropy_4.mag_nearest_min_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCBasicAnisotropy4Maglinearminlinear, "dEQP-VK.texture.filtering_anisotropy.basic.anisotropy_4.mag_linear_min_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCBasicAnisotropy8Magnearestminnearest, "dEQP-VK.texture.filtering_anisotropy.basic.anisotropy_8.mag_nearest_min_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCBasicAnisotropy8Maglinearminnearest, "dEQP-VK.texture.filtering_anisotropy.basic.anisotropy_8.mag_linear_min_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCBasicAnisotropy8Magnearestminlinear, "dEQP-VK.texture.filtering_anisotropy.basic.anisotropy_8.mag_nearest_min_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCBasicAnisotropy8Maglinearminlinear, "dEQP-VK.texture.filtering_anisotropy.basic.anisotropy_8.mag_linear_min_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCBasicAnisotropymaxMagnearestminnearest, "dEQP-VK.texture.filtering_anisotropy.basic.anisotropy_max.mag_nearest_min_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCBasicAnisotropymaxMaglinearminnearest, "dEQP-VK.texture.filtering_anisotropy.basic.anisotropy_max.mag_linear_min_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCBasicAnisotropymaxMagnearestminlinear, "dEQP-VK.texture.filtering_anisotropy.basic.anisotropy_max.mag_nearest_min_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCBasicAnisotropymaxMaglinearminlinear, "dEQP-VK.texture.filtering_anisotropy.basic.anisotropy_max.mag_linear_min_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCSinglelevelAnisotropy2Magnearestminnearest, "dEQP-VK.texture.filtering_anisotropy.single_level.anisotropy_2.mag_nearest_min_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCSinglelevelAnisotropy2Maglinearminnearest, "dEQP-VK.texture.filtering_anisotropy.single_level.anisotropy_2.mag_linear_min_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCSinglelevelAnisotropy2Magnearestminlinear, "dEQP-VK.texture.filtering_anisotropy.single_level.anisotropy_2.mag_nearest_min_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCSinglelevelAnisotropy2Maglinearminlinear, "dEQP-VK.texture.filtering_anisotropy.single_level.anisotropy_2.mag_linear_min_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCSinglelevelAnisotropy4Magnearestminnearest, "dEQP-VK.texture.filtering_anisotropy.single_level.anisotropy_4.mag_nearest_min_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCSinglelevelAnisotropy4Maglinearminnearest, "dEQP-VK.texture.filtering_anisotropy.single_level.anisotropy_4.mag_linear_min_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCSinglelevelAnisotropy4Magnearestminlinear, "dEQP-VK.texture.filtering_anisotropy.single_level.anisotropy_4.mag_nearest_min_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCSinglelevelAnisotropy4Maglinearminlinear, "dEQP-VK.texture.filtering_anisotropy.single_level.anisotropy_4.mag_linear_min_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCSinglelevelAnisotropy8Magnearestminnearest, "dEQP-VK.texture.filtering_anisotropy.single_level.anisotropy_8.mag_nearest_min_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCSinglelevelAnisotropy8Maglinearminnearest, "dEQP-VK.texture.filtering_anisotropy.single_level.anisotropy_8.mag_linear_min_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCSinglelevelAnisotropy8Magnearestminlinear, "dEQP-VK.texture.filtering_anisotropy.single_level.anisotropy_8.mag_nearest_min_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCSinglelevelAnisotropy8Maglinearminlinear, "dEQP-VK.texture.filtering_anisotropy.single_level.anisotropy_8.mag_linear_min_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCSinglelevelAnisotropymaxMagnearestminnearest, "dEQP-VK.texture.filtering_anisotropy.single_level.anisotropy_max.mag_nearest_min_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCSinglelevelAnisotropymaxMaglinearminnearest, "dEQP-VK.texture.filtering_anisotropy.single_level.anisotropy_max.mag_linear_min_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCSinglelevelAnisotropymaxMagnearestminlinear, "dEQP-VK.texture.filtering_anisotropy.single_level.anisotropy_max.mag_nearest_min_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCSinglelevelAnisotropymaxMaglinearminlinear, "dEQP-VK.texture.filtering_anisotropy.single_level.anisotropy_max.mag_linear_min_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropy2Magnearestminnearestmipmapnearest, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_2.mag_nearest_min_nearest_mipmap_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropy2Maglinearminnearestmipmapnearest, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_2.mag_linear_min_nearest_mipmap_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropy2Magnearestminnearestmipmaplinear, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_2.mag_nearest_min_nearest_mipmap_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropy2Maglinearminnearestmipmaplinear, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_2.mag_linear_min_nearest_mipmap_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropy2Magnearestminlinearmipmapnearest, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_2.mag_nearest_min_linear_mipmap_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropy2Maglinearminlinearmipmapnearest, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_2.mag_linear_min_linear_mipmap_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropy2Magnearestminlinearmipmaplinear, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_2.mag_nearest_min_linear_mipmap_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropy2Maglinearminlinearmipmaplinear, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_2.mag_linear_min_linear_mipmap_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropy4Magnearestminnearestmipmapnearest, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_4.mag_nearest_min_nearest_mipmap_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropy4Maglinearminnearestmipmapnearest, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_4.mag_linear_min_nearest_mipmap_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropy4Magnearestminnearestmipmaplinear, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_4.mag_nearest_min_nearest_mipmap_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropy4Maglinearminnearestmipmaplinear, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_4.mag_linear_min_nearest_mipmap_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropy4Magnearestminlinearmipmapnearest, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_4.mag_nearest_min_linear_mipmap_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropy4Maglinearminlinearmipmapnearest, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_4.mag_linear_min_linear_mipmap_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropy4Magnearestminlinearmipmaplinear, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_4.mag_nearest_min_linear_mipmap_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropy4Maglinearminlinearmipmaplinear, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_4.mag_linear_min_linear_mipmap_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropy8Magnearestminnearestmipmapnearest, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_8.mag_nearest_min_nearest_mipmap_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropy8Maglinearminnearestmipmapnearest, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_8.mag_linear_min_nearest_mipmap_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropy8Magnearestminnearestmipmaplinear, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_8.mag_nearest_min_nearest_mipmap_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropy8Maglinearminnearestmipmaplinear, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_8.mag_linear_min_nearest_mipmap_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropy8Magnearestminlinearmipmapnearest, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_8.mag_nearest_min_linear_mipmap_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropy8Maglinearminlinearmipmapnearest, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_8.mag_linear_min_linear_mipmap_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropy8Magnearestminlinearmipmaplinear, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_8.mag_nearest_min_linear_mipmap_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropy8Maglinearminlinearmipmaplinear, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_8.mag_linear_min_linear_mipmap_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropymaxMagnearestminnearestmipmapnearest, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_max.mag_nearest_min_nearest_mipmap_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropymaxMaglinearminnearestmipmapnearest, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_max.mag_linear_min_nearest_mipmap_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropymaxMagnearestminnearestmipmaplinear, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_max.mag_nearest_min_nearest_mipmap_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropymaxMaglinearminnearestmipmaplinear, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_max.mag_linear_min_nearest_mipmap_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropymaxMagnearestminlinearmipmapnearest, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_max.mag_nearest_min_linear_mipmap_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropymaxMaglinearminlinearmipmapnearest, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_max.mag_linear_min_linear_mipmap_nearest*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropymaxMagnearestminlinearmipmaplinear, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_max.mag_nearest_min_linear_mipmap_linear*");

static SHRINK_HWTEST_F(ActsTexture0003TS, TCMipmapAnisotropymaxMaglinearminlinearmipmaplinear, "dEQP-VK.texture.filtering_anisotropy.mipmap.anisotropy_max.mag_linear_min_linear_mipmap_linear*");
