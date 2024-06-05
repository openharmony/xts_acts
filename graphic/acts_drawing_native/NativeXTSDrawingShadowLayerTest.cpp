/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include "gtest/gtest.h"

#include "drawing_shadow_layer.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class NativeXTSDrawingShadowLayerTest : public testing::Test {};

/*
 * @tc.name: OH_Drawing_ShadowLayerCreate
 * @tc.desc: test for OH_Drawing_ShadowLayerCreate.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingShadowLayerTest, OH_Drawing_ShadowLayerCreate, TestSize.Level1) {
    OH_Drawing_ShadowLayer *shadowLayer = OH_Drawing_ShadowLayerCreate(3.f, -3.f, 3.f, 0xFF00FF00);
    EXPECT_NE(shadowLayer, nullptr);
    OH_Drawing_ShadowLayerDestroy(shadowLayer);
}

/*
 * @tc.name: OH_Drawing_ShadowLayerDestroy
 * @tc.desc: test for OH_Drawing_ShadowLayerDestroy.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingShadowLayerTest, OH_Drawing_ShadowLayerDestroy, TestSize.Level1) {
    OH_Drawing_ShadowLayer *shadowLayer = OH_Drawing_ShadowLayerCreate(3.f, -3.f, 3.f, 0xFF00FF00);
    EXPECT_NE(shadowLayer, nullptr);
    OH_Drawing_ShadowLayerDestroy(shadowLayer);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS