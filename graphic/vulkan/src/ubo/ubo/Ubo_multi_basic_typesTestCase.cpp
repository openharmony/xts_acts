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
#include "../UboBaseFunc.h"
#include "../ActsUbo0008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd140vertex, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std140_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd140fragment, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std140_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd140both, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std140_both*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd140mixed, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std140_mixed*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd140vertexcompaccess, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std140_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd140fragmentcompaccess, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std140_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd140bothcompaccess, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std140_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd140mixedcompaccess, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std140_mixed_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd140instancearrayvertex, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std140_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd140instancearrayfragment, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std140_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd140instancearrayboth, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std140_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd140instancearraymixed, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std140_instance_array_mixed*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd140instancearrayvertexcompaccess, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std140_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd140instancearrayfragmentcompaccess, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std140_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd140instancearraybothcompaccess, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std140_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd140instancearraymixedcompaccess, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std140_instance_array_mixed_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd430vertex, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std430_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd430fragment, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std430_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd430both, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std430_both*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd430mixed, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std430_mixed*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd430vertexcompaccess, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std430_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd430fragmentcompaccess, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std430_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd430bothcompaccess, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std430_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd430mixedcompaccess, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std430_mixed_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd430instancearrayvertex, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std430_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd430instancearrayfragment, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std430_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd430instancearrayboth, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std430_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd430instancearraymixed, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std430_instance_array_mixed*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd430instancearrayvertexcompaccess, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std430_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd430instancearrayfragmentcompaccess, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std430_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd430instancearraybothcompaccess, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std430_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferStd430instancearraymixedcompaccess, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.std430_instance_array_mixed_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferScalarvertex, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.scalar_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferScalarfragment, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.scalar_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferScalarboth, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.scalar_both*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferScalarmixed, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.scalar_mixed*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferScalarvertexcompaccess, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.scalar_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferScalarfragmentcompaccess, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.scalar_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferScalarbothcompaccess, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.scalar_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferScalarmixedcompaccess, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.scalar_mixed_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferScalarinstancearrayvertex, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.scalar_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferScalarinstancearrayfragment, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.scalar_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferScalarinstancearrayboth, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.scalar_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferScalarinstancearraymixed, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.scalar_instance_array_mixed*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferScalarinstancearrayvertexcompaccess, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.scalar_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferScalarinstancearrayfragmentcompaccess, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.scalar_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferScalarinstancearraybothcompaccess, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.scalar_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTPerblockbufferScalarinstancearraymixedcompaccess, "dEQP-VK.ubo.multi_basic_types.per_block_buffer.scalar_instance_array_mixed_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd140vertex, "dEQP-VK.ubo.multi_basic_types.single_buffer.std140_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd140fragment, "dEQP-VK.ubo.multi_basic_types.single_buffer.std140_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd140both, "dEQP-VK.ubo.multi_basic_types.single_buffer.std140_both*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd140mixed, "dEQP-VK.ubo.multi_basic_types.single_buffer.std140_mixed*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd140vertexcompaccess, "dEQP-VK.ubo.multi_basic_types.single_buffer.std140_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd140fragmentcompaccess, "dEQP-VK.ubo.multi_basic_types.single_buffer.std140_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd140bothcompaccess, "dEQP-VK.ubo.multi_basic_types.single_buffer.std140_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd140mixedcompaccess, "dEQP-VK.ubo.multi_basic_types.single_buffer.std140_mixed_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd140instancearrayvertex, "dEQP-VK.ubo.multi_basic_types.single_buffer.std140_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd140instancearrayfragment, "dEQP-VK.ubo.multi_basic_types.single_buffer.std140_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd140instancearrayboth, "dEQP-VK.ubo.multi_basic_types.single_buffer.std140_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd140instancearraymixed, "dEQP-VK.ubo.multi_basic_types.single_buffer.std140_instance_array_mixed*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd140instancearrayvertexcompaccess, "dEQP-VK.ubo.multi_basic_types.single_buffer.std140_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd140instancearrayfragmentcompaccess, "dEQP-VK.ubo.multi_basic_types.single_buffer.std140_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd140instancearraybothcompaccess, "dEQP-VK.ubo.multi_basic_types.single_buffer.std140_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd140instancearraymixedcompaccess, "dEQP-VK.ubo.multi_basic_types.single_buffer.std140_instance_array_mixed_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd430vertex, "dEQP-VK.ubo.multi_basic_types.single_buffer.std430_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd430fragment, "dEQP-VK.ubo.multi_basic_types.single_buffer.std430_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd430both, "dEQP-VK.ubo.multi_basic_types.single_buffer.std430_both*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd430mixed, "dEQP-VK.ubo.multi_basic_types.single_buffer.std430_mixed*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd430vertexcompaccess, "dEQP-VK.ubo.multi_basic_types.single_buffer.std430_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd430fragmentcompaccess, "dEQP-VK.ubo.multi_basic_types.single_buffer.std430_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd430bothcompaccess, "dEQP-VK.ubo.multi_basic_types.single_buffer.std430_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd430mixedcompaccess, "dEQP-VK.ubo.multi_basic_types.single_buffer.std430_mixed_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd430instancearrayvertex, "dEQP-VK.ubo.multi_basic_types.single_buffer.std430_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd430instancearrayfragment, "dEQP-VK.ubo.multi_basic_types.single_buffer.std430_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd430instancearrayboth, "dEQP-VK.ubo.multi_basic_types.single_buffer.std430_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd430instancearraymixed, "dEQP-VK.ubo.multi_basic_types.single_buffer.std430_instance_array_mixed*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd430instancearrayvertexcompaccess, "dEQP-VK.ubo.multi_basic_types.single_buffer.std430_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd430instancearrayfragmentcompaccess, "dEQP-VK.ubo.multi_basic_types.single_buffer.std430_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd430instancearraybothcompaccess, "dEQP-VK.ubo.multi_basic_types.single_buffer.std430_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferStd430instancearraymixedcompaccess, "dEQP-VK.ubo.multi_basic_types.single_buffer.std430_instance_array_mixed_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferScalarvertex, "dEQP-VK.ubo.multi_basic_types.single_buffer.scalar_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferScalarfragment, "dEQP-VK.ubo.multi_basic_types.single_buffer.scalar_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferScalarboth, "dEQP-VK.ubo.multi_basic_types.single_buffer.scalar_both*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferScalarmixed, "dEQP-VK.ubo.multi_basic_types.single_buffer.scalar_mixed*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferScalarvertexcompaccess, "dEQP-VK.ubo.multi_basic_types.single_buffer.scalar_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferScalarfragmentcompaccess, "dEQP-VK.ubo.multi_basic_types.single_buffer.scalar_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferScalarbothcompaccess, "dEQP-VK.ubo.multi_basic_types.single_buffer.scalar_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferScalarmixedcompaccess, "dEQP-VK.ubo.multi_basic_types.single_buffer.scalar_mixed_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferScalarinstancearrayvertex, "dEQP-VK.ubo.multi_basic_types.single_buffer.scalar_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferScalarinstancearrayfragment, "dEQP-VK.ubo.multi_basic_types.single_buffer.scalar_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferScalarinstancearrayboth, "dEQP-VK.ubo.multi_basic_types.single_buffer.scalar_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferScalarinstancearraymixed, "dEQP-VK.ubo.multi_basic_types.single_buffer.scalar_instance_array_mixed*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferScalarinstancearrayvertexcompaccess, "dEQP-VK.ubo.multi_basic_types.single_buffer.scalar_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferScalarinstancearrayfragmentcompaccess, "dEQP-VK.ubo.multi_basic_types.single_buffer.scalar_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferScalarinstancearraybothcompaccess, "dEQP-VK.ubo.multi_basic_types.single_buffer.scalar_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMBTSinglebufferScalarinstancearraymixedcompaccess, "dEQP-VK.ubo.multi_basic_types.single_buffer.scalar_instance_array_mixed_comp_access*");
