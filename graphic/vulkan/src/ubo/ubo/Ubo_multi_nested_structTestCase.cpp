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
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd140vertex, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std140_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd140fragment, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std140_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd140both, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std140_both*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd140mixed, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std140_mixed*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd140vertexcompaccess, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std140_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd140fragmentcompaccess, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std140_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd140bothcompaccess, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std140_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd140mixedcompaccess, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std140_mixed_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd140instancearrayvertex, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std140_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd140instancearrayfragment, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std140_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd140instancearrayboth, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std140_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd140instancearraymixed, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std140_instance_array_mixed*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd140instancearrayvertexcompaccess, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std140_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd140instancearrayfragmentcompaccess, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std140_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd140instancearraybothcompaccess, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std140_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd140instancearraymixedcompaccess, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std140_instance_array_mixed_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd430vertex, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std430_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd430fragment, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std430_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd430both, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std430_both*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd430mixed, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std430_mixed*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd430vertexcompaccess, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std430_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd430fragmentcompaccess, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std430_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd430bothcompaccess, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std430_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd430mixedcompaccess, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std430_mixed_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd430instancearrayvertex, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std430_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd430instancearrayfragment, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std430_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd430instancearrayboth, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std430_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd430instancearraymixed, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std430_instance_array_mixed*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd430instancearrayvertexcompaccess, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std430_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd430instancearrayfragmentcompaccess, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std430_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd430instancearraybothcompaccess, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std430_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferStd430instancearraymixedcompaccess, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.std430_instance_array_mixed_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferScalarvertex, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.scalar_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferScalarfragment, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.scalar_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferScalarboth, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.scalar_both*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferScalarmixed, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.scalar_mixed*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferScalarvertexcompaccess, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.scalar_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferScalarfragmentcompaccess, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.scalar_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferScalarbothcompaccess, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.scalar_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferScalarmixedcompaccess, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.scalar_mixed_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferScalarinstancearrayvertex, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.scalar_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferScalarinstancearrayfragment, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.scalar_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferScalarinstancearrayboth, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.scalar_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferScalarinstancearraymixed, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.scalar_instance_array_mixed*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferScalarinstancearrayvertexcompaccess, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.scalar_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferScalarinstancearrayfragmentcompaccess, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.scalar_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferScalarinstancearraybothcompaccess, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.scalar_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSPerblockbufferScalarinstancearraymixedcompaccess, "dEQP-VK.ubo.multi_nested_struct.per_block_buffer.scalar_instance_array_mixed_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd140vertex, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std140_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd140fragment, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std140_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd140both, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std140_both*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd140mixed, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std140_mixed*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd140vertexcompaccess, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std140_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd140fragmentcompaccess, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std140_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd140bothcompaccess, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std140_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd140mixedcompaccess, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std140_mixed_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd140instancearrayvertex, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std140_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd140instancearrayfragment, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std140_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd140instancearrayboth, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std140_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd140instancearraymixed, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std140_instance_array_mixed*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd140instancearrayvertexcompaccess, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std140_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd140instancearrayfragmentcompaccess, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std140_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd140instancearraybothcompaccess, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std140_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd140instancearraymixedcompaccess, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std140_instance_array_mixed_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd430vertex, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std430_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd430fragment, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std430_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd430both, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std430_both*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd430mixed, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std430_mixed*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd430vertexcompaccess, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std430_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd430fragmentcompaccess, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std430_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd430bothcompaccess, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std430_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd430mixedcompaccess, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std430_mixed_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd430instancearrayvertex, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std430_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd430instancearrayfragment, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std430_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd430instancearrayboth, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std430_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd430instancearraymixed, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std430_instance_array_mixed*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd430instancearrayvertexcompaccess, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std430_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd430instancearrayfragmentcompaccess, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std430_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd430instancearraybothcompaccess, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std430_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferStd430instancearraymixedcompaccess, "dEQP-VK.ubo.multi_nested_struct.single_buffer.std430_instance_array_mixed_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferScalarvertex, "dEQP-VK.ubo.multi_nested_struct.single_buffer.scalar_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferScalarfragment, "dEQP-VK.ubo.multi_nested_struct.single_buffer.scalar_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferScalarboth, "dEQP-VK.ubo.multi_nested_struct.single_buffer.scalar_both*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferScalarmixed, "dEQP-VK.ubo.multi_nested_struct.single_buffer.scalar_mixed*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferScalarvertexcompaccess, "dEQP-VK.ubo.multi_nested_struct.single_buffer.scalar_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferScalarfragmentcompaccess, "dEQP-VK.ubo.multi_nested_struct.single_buffer.scalar_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferScalarbothcompaccess, "dEQP-VK.ubo.multi_nested_struct.single_buffer.scalar_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferScalarmixedcompaccess, "dEQP-VK.ubo.multi_nested_struct.single_buffer.scalar_mixed_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferScalarinstancearrayvertex, "dEQP-VK.ubo.multi_nested_struct.single_buffer.scalar_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferScalarinstancearrayfragment, "dEQP-VK.ubo.multi_nested_struct.single_buffer.scalar_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferScalarinstancearrayboth, "dEQP-VK.ubo.multi_nested_struct.single_buffer.scalar_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferScalarinstancearraymixed, "dEQP-VK.ubo.multi_nested_struct.single_buffer.scalar_instance_array_mixed*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferScalarinstancearrayvertexcompaccess, "dEQP-VK.ubo.multi_nested_struct.single_buffer.scalar_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferScalarinstancearrayfragmentcompaccess, "dEQP-VK.ubo.multi_nested_struct.single_buffer.scalar_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferScalarinstancearraybothcompaccess, "dEQP-VK.ubo.multi_nested_struct.single_buffer.scalar_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0008TS, TCMNSSinglebufferScalarinstancearraymixedcompaccess, "dEQP-VK.ubo.multi_nested_struct.single_buffer.scalar_instance_array_mixed_comp_access*");
