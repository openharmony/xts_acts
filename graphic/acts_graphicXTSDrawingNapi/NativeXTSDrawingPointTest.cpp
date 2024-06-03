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

#include "drawing_point.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class NativeXTSDrawingPointTest : public testing::Test {};

/*
 * @tc.name: OH_Drawing_PointCreate
 * @tc.desc: test for OH_Drawing_PointCreate.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPointTest, OH_Drawing_PointCreate, TestSize.Level1) {
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 60);
    EXPECT_NE(point, nullptr);
    OH_Drawing_PointDestroy(point);
}

/*
 * @tc.name: OH_Drawing_PointDestroy
 * @tc.desc: test for OH_Drawing_PointDestroy.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeXTSDrawingPointTest, OH_Drawing_PointDestroy, TestSize.Level1) {
    OH_Drawing_Point *point = OH_Drawing_PointCreate(100, 60);
    EXPECT_NE(point, nullptr);
    OH_Drawing_PointDestroy(point);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS