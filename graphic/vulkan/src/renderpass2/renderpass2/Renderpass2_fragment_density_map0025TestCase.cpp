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
#include "../Renderpass2BaseFunc.h"
#include "../ActsRenderpass20026TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC2viewsRenderDivisibledensitysize8samples, "dEQP-VK.renderpass2.fragment_density_map.2_views.render.divisible_density_size.8_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC2viewsRenderNondivisibledensitysize1sample, "dEQP-VK.renderpass2.fragment_density_map.2_views.render.non_divisible_density_size.1_sample*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC2viewsRenderNondivisibledensitysize2samples, "dEQP-VK.renderpass2.fragment_density_map.2_views.render.non_divisible_density_size.2_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC2viewsRenderNondivisibledensitysize4samples, "dEQP-VK.renderpass2.fragment_density_map.2_views.render.non_divisible_density_size.4_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC2viewsRenderNondivisibledensitysize8samples, "dEQP-VK.renderpass2.fragment_density_map.2_views.render.non_divisible_density_size.8_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC2viewsRendercopyDivisibledensitysize1sample, "dEQP-VK.renderpass2.fragment_density_map.2_views.render_copy.divisible_density_size.1_sample*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC2viewsRendercopyDivisibledensitysize2samples, "dEQP-VK.renderpass2.fragment_density_map.2_views.render_copy.divisible_density_size.2_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC2viewsRendercopyDivisibledensitysize4samples, "dEQP-VK.renderpass2.fragment_density_map.2_views.render_copy.divisible_density_size.4_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC2viewsRendercopyDivisibledensitysize8samples, "dEQP-VK.renderpass2.fragment_density_map.2_views.render_copy.divisible_density_size.8_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC2viewsRendercopyNondivisibledensitysize1sample, "dEQP-VK.renderpass2.fragment_density_map.2_views.render_copy.non_divisible_density_size.1_sample*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC2viewsRendercopyNondivisibledensitysize2samples, "dEQP-VK.renderpass2.fragment_density_map.2_views.render_copy.non_divisible_density_size.2_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC2viewsRendercopyNondivisibledensitysize4samples, "dEQP-VK.renderpass2.fragment_density_map.2_views.render_copy.non_divisible_density_size.4_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC2viewsRendercopyNondivisibledensitysize8samples, "dEQP-VK.renderpass2.fragment_density_map.2_views.render_copy.non_divisible_density_size.8_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC4viewsRenderDivisibledensitysize1sample, "dEQP-VK.renderpass2.fragment_density_map.4_views.render.divisible_density_size.1_sample*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC4viewsRenderDivisibledensitysize2samples, "dEQP-VK.renderpass2.fragment_density_map.4_views.render.divisible_density_size.2_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC4viewsRenderDivisibledensitysize4samples, "dEQP-VK.renderpass2.fragment_density_map.4_views.render.divisible_density_size.4_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC4viewsRenderDivisibledensitysize8samples, "dEQP-VK.renderpass2.fragment_density_map.4_views.render.divisible_density_size.8_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC4viewsRenderNondivisibledensitysize1sample, "dEQP-VK.renderpass2.fragment_density_map.4_views.render.non_divisible_density_size.1_sample*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC4viewsRenderNondivisibledensitysize2samples, "dEQP-VK.renderpass2.fragment_density_map.4_views.render.non_divisible_density_size.2_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC4viewsRenderNondivisibledensitysize4samples, "dEQP-VK.renderpass2.fragment_density_map.4_views.render.non_divisible_density_size.4_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC4viewsRenderNondivisibledensitysize8samples, "dEQP-VK.renderpass2.fragment_density_map.4_views.render.non_divisible_density_size.8_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC4viewsRendercopyDivisibledensitysize1sample, "dEQP-VK.renderpass2.fragment_density_map.4_views.render_copy.divisible_density_size.1_sample*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC4viewsRendercopyDivisibledensitysize2samples, "dEQP-VK.renderpass2.fragment_density_map.4_views.render_copy.divisible_density_size.2_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC4viewsRendercopyDivisibledensitysize4samples, "dEQP-VK.renderpass2.fragment_density_map.4_views.render_copy.divisible_density_size.4_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC4viewsRendercopyDivisibledensitysize8samples, "dEQP-VK.renderpass2.fragment_density_map.4_views.render_copy.divisible_density_size.8_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC4viewsRendercopyNondivisibledensitysize1sample, "dEQP-VK.renderpass2.fragment_density_map.4_views.render_copy.non_divisible_density_size.1_sample*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC4viewsRendercopyNondivisibledensitysize2samples, "dEQP-VK.renderpass2.fragment_density_map.4_views.render_copy.non_divisible_density_size.2_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC4viewsRendercopyNondivisibledensitysize4samples, "dEQP-VK.renderpass2.fragment_density_map.4_views.render_copy.non_divisible_density_size.4_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC4viewsRendercopyNondivisibledensitysize8samples, "dEQP-VK.renderpass2.fragment_density_map.4_views.render_copy.non_divisible_density_size.8_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC6viewsRenderDivisibledensitysize1sample, "dEQP-VK.renderpass2.fragment_density_map.6_views.render.divisible_density_size.1_sample*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC6viewsRenderDivisibledensitysize2samples, "dEQP-VK.renderpass2.fragment_density_map.6_views.render.divisible_density_size.2_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC6viewsRenderDivisibledensitysize4samples, "dEQP-VK.renderpass2.fragment_density_map.6_views.render.divisible_density_size.4_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC6viewsRenderDivisibledensitysize8samples, "dEQP-VK.renderpass2.fragment_density_map.6_views.render.divisible_density_size.8_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC6viewsRenderNondivisibledensitysize1sample, "dEQP-VK.renderpass2.fragment_density_map.6_views.render.non_divisible_density_size.1_sample*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC6viewsRenderNondivisibledensitysize2samples, "dEQP-VK.renderpass2.fragment_density_map.6_views.render.non_divisible_density_size.2_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC6viewsRenderNondivisibledensitysize4samples, "dEQP-VK.renderpass2.fragment_density_map.6_views.render.non_divisible_density_size.4_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC6viewsRenderNondivisibledensitysize8samples, "dEQP-VK.renderpass2.fragment_density_map.6_views.render.non_divisible_density_size.8_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC6viewsRendercopyDivisibledensitysize1sample, "dEQP-VK.renderpass2.fragment_density_map.6_views.render_copy.divisible_density_size.1_sample*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC6viewsRendercopyDivisibledensitysize2samples, "dEQP-VK.renderpass2.fragment_density_map.6_views.render_copy.divisible_density_size.2_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC6viewsRendercopyDivisibledensitysize4samples, "dEQP-VK.renderpass2.fragment_density_map.6_views.render_copy.divisible_density_size.4_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC6viewsRendercopyDivisibledensitysize8samples, "dEQP-VK.renderpass2.fragment_density_map.6_views.render_copy.divisible_density_size.8_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC6viewsRendercopyNondivisibledensitysize1sample, "dEQP-VK.renderpass2.fragment_density_map.6_views.render_copy.non_divisible_density_size.1_sample*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC6viewsRendercopyNondivisibledensitysize2samples, "dEQP-VK.renderpass2.fragment_density_map.6_views.render_copy.non_divisible_density_size.2_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC6viewsRendercopyNondivisibledensitysize4samples, "dEQP-VK.renderpass2.fragment_density_map.6_views.render_copy.non_divisible_density_size.4_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TC6viewsRendercopyNondivisibledensitysize8samples, "dEQP-VK.renderpass2.fragment_density_map.6_views.render_copy.non_divisible_density_size.8_samples*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TCProperties2subsampledsamplers, "dEQP-VK.renderpass2.fragment_density_map.properties.2_subsampled_samplers*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TCProperties4subsampledsamplers, "dEQP-VK.renderpass2.fragment_density_map.properties.4_subsampled_samplers*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TCProperties6subsampledsamplers, "dEQP-VK.renderpass2.fragment_density_map.properties.6_subsampled_samplers*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TCProperties8subsampledsamplers, "dEQP-VK.renderpass2.fragment_density_map.properties.8_subsampled_samplers*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TCPropertiesSubsampledloads, "dEQP-VK.renderpass2.fragment_density_map.properties.subsampled_loads*");
static SHRINK_HWTEST_F(ActsRenderpass20026TS, TCPropertiesSubsampledcoarsereconstruction, "dEQP-VK.renderpass2.fragment_density_map.properties.subsampled_coarse_reconstruction*");