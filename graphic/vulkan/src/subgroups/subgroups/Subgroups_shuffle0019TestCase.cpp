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
#include "../SubgroupsBaseFunc.h"
#include "../ActsSubgroups0020TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsSubgroups0020TS, TCRaytracingSubgroupshuffleupdvec3, "dEQP-VK.subgroups.shuffle.ray_tracing.subgroupshuffleup_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0020TS, TCRaytracingSubgroupshuffledowndvec3, "dEQP-VK.subgroups.shuffle.ray_tracing.subgroupshuffledown_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0020TS, TCRaytracingSubgroupshuffledvec4, "dEQP-VK.subgroups.shuffle.ray_tracing.subgroupshuffle_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0020TS, TCRaytracingSubgroupshufflexordvec4, "dEQP-VK.subgroups.shuffle.ray_tracing.subgroupshufflexor_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0020TS, TCRaytracingSubgroupshuffleupdvec4, "dEQP-VK.subgroups.shuffle.ray_tracing.subgroupshuffleup_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0020TS, TCRaytracingSubgroupshuffledowndvec4, "dEQP-VK.subgroups.shuffle.ray_tracing.subgroupshuffledown_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0020TS, TCRaytracingSubgroupshufflebool, "dEQP-VK.subgroups.shuffle.ray_tracing.subgroupshuffle_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0020TS, TCRaytracingSubgroupshufflexorbool, "dEQP-VK.subgroups.shuffle.ray_tracing.subgroupshufflexor_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0020TS, TCRaytracingSubgroupshuffleupbool, "dEQP-VK.subgroups.shuffle.ray_tracing.subgroupshuffleup_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0020TS, TCRaytracingSubgroupshuffledownbool, "dEQP-VK.subgroups.shuffle.ray_tracing.subgroupshuffledown_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0020TS, TCRaytracingSubgroupshufflebvec2, "dEQP-VK.subgroups.shuffle.ray_tracing.subgroupshuffle_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0020TS, TCRaytracingSubgroupshufflexorbvec2, "dEQP-VK.subgroups.shuffle.ray_tracing.subgroupshufflexor_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0020TS, TCRaytracingSubgroupshuffleupbvec2, "dEQP-VK.subgroups.shuffle.ray_tracing.subgroupshuffleup_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0020TS, TCRaytracingSubgroupshuffledownbvec2, "dEQP-VK.subgroups.shuffle.ray_tracing.subgroupshuffledown_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0020TS, TCRaytracingSubgroupshufflebvec3, "dEQP-VK.subgroups.shuffle.ray_tracing.subgroupshuffle_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0020TS, TCRaytracingSubgroupshufflexorbvec3, "dEQP-VK.subgroups.shuffle.ray_tracing.subgroupshufflexor_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0020TS, TCRaytracingSubgroupshuffleupbvec3, "dEQP-VK.subgroups.shuffle.ray_tracing.subgroupshuffleup_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0020TS, TCRaytracingSubgroupshuffledownbvec3, "dEQP-VK.subgroups.shuffle.ray_tracing.subgroupshuffledown_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0020TS, TCRaytracingSubgroupshufflebvec4, "dEQP-VK.subgroups.shuffle.ray_tracing.subgroupshuffle_bvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0020TS, TCRaytracingSubgroupshufflexorbvec4, "dEQP-VK.subgroups.shuffle.ray_tracing.subgroupshufflexor_bvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0020TS, TCRaytracingSubgroupshuffleupbvec4, "dEQP-VK.subgroups.shuffle.ray_tracing.subgroupshuffleup_bvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0020TS, TCRaytracingSubgroupshuffledownbvec4, "dEQP-VK.subgroups.shuffle.ray_tracing.subgroupshuffledown_bvec4*");