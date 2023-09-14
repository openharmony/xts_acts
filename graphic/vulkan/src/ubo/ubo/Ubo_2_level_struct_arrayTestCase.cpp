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
#include "../ActsUbo0003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferStd140vertex, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.std140_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferStd140fragment, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.std140_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferStd140both, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.std140_both*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferStd140vertexcompaccess, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.std140_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferStd140fragmentcompaccess, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.std140_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferStd140bothcompaccess, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.std140_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferStd140instancearrayvertex, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.std140_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferStd140instancearrayfragment, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.std140_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferStd140instancearrayboth, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.std140_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferStd140instancearrayvertexcompaccess, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.std140_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferStd140instancearrayfragmentcompaccess, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.std140_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferStd140instancearraybothcompaccess, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.std140_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferStd430vertex, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.std430_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferStd430fragment, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.std430_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferStd430both, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.std430_both*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferStd430vertexcompaccess, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.std430_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferStd430fragmentcompaccess, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.std430_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferStd430bothcompaccess, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.std430_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferStd430instancearrayvertex, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.std430_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferStd430instancearrayfragment, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.std430_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferStd430instancearrayboth, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.std430_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferStd430instancearrayvertexcompaccess, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.std430_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferStd430instancearrayfragmentcompaccess, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.std430_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferStd430instancearraybothcompaccess, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.std430_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferScalarvertex, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.scalar_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferScalarfragment, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.scalar_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferScalarboth, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.scalar_both*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferScalarvertexcompaccess, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.scalar_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferScalarfragmentcompaccess, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.scalar_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferScalarbothcompaccess, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.scalar_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferScalarinstancearrayvertex, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.scalar_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferScalarinstancearrayfragment, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.scalar_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferScalarinstancearrayboth, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.scalar_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferScalarinstancearrayvertexcompaccess, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.scalar_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferScalarinstancearrayfragmentcompaccess, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.scalar_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSAPerblockbufferScalarinstancearraybothcompaccess, "dEQP-VK.ubo.2_level_struct_array.per_block_buffer.scalar_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSASinglebufferStd140instancearrayvertex, "dEQP-VK.ubo.2_level_struct_array.single_buffer.std140_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSASinglebufferStd140instancearrayfragment, "dEQP-VK.ubo.2_level_struct_array.single_buffer.std140_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSASinglebufferStd140instancearrayboth, "dEQP-VK.ubo.2_level_struct_array.single_buffer.std140_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSASinglebufferStd140instancearrayvertexcompaccess, "dEQP-VK.ubo.2_level_struct_array.single_buffer.std140_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSASinglebufferStd140instancearrayfragmentcompaccess, "dEQP-VK.ubo.2_level_struct_array.single_buffer.std140_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSASinglebufferStd140instancearraybothcompaccess, "dEQP-VK.ubo.2_level_struct_array.single_buffer.std140_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSASinglebufferStd430instancearrayvertex, "dEQP-VK.ubo.2_level_struct_array.single_buffer.std430_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSASinglebufferStd430instancearrayfragment, "dEQP-VK.ubo.2_level_struct_array.single_buffer.std430_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSASinglebufferStd430instancearrayboth, "dEQP-VK.ubo.2_level_struct_array.single_buffer.std430_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSASinglebufferStd430instancearrayvertexcompaccess, "dEQP-VK.ubo.2_level_struct_array.single_buffer.std430_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSASinglebufferStd430instancearrayfragmentcompaccess, "dEQP-VK.ubo.2_level_struct_array.single_buffer.std430_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSASinglebufferStd430instancearraybothcompaccess, "dEQP-VK.ubo.2_level_struct_array.single_buffer.std430_instance_array_both_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSASinglebufferScalarinstancearrayvertex, "dEQP-VK.ubo.2_level_struct_array.single_buffer.scalar_instance_array_vertex*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSASinglebufferScalarinstancearrayfragment, "dEQP-VK.ubo.2_level_struct_array.single_buffer.scalar_instance_array_fragment*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSASinglebufferScalarinstancearrayboth, "dEQP-VK.ubo.2_level_struct_array.single_buffer.scalar_instance_array_both*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSASinglebufferScalarinstancearrayvertexcompaccess, "dEQP-VK.ubo.2_level_struct_array.single_buffer.scalar_instance_array_vertex_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSASinglebufferScalarinstancearrayfragmentcompaccess, "dEQP-VK.ubo.2_level_struct_array.single_buffer.scalar_instance_array_fragment_comp_access*");
static  SHRINK_HWTEST_F(ActsUbo0003TS, TCLSASinglebufferScalarinstancearraybothcompaccess, "dEQP-VK.ubo.2_level_struct_array.single_buffer.scalar_instance_array_both_comp_access*");
