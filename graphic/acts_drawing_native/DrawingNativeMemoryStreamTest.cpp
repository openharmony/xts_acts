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

#include "drawing_bitmap.h"
#include "drawing_color.h"
#include "drawing_color_filter.h"
#include "drawing_image.h"
#include "drawing_image_filter.h"
#include "drawing_mask_filter.h"
#include "drawing_memory_stream.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeMemoryStreamTest : public testing::Test {};

/*
 * @tc.name: OH_Drawing_MemoryStreamCreate
 * @tc.desc: test for OH_Drawing_MemoryStreamCreate.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeMemoryStreamTest, OH_Drawing_MemoryStreamCreate, TestSize.Level1) {
    size_t length = 1;
    OH_Drawing_MemoryStream *memoryStream = OH_Drawing_MemoryStreamCreate(nullptr, length, false);
    OH_Drawing_MemoryStreamDestroy(memoryStream);
    EXPECT_TRUE(true);
}

/*
 * @tc.name: OH_Drawing_MemoryStreamDestroy
 * @tc.desc: test for OH_Drawing_MemoryStreamDestroy.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeMemoryStreamTest, OH_Drawing_MemoryStreamDestroy, TestSize.Level1) {
    size_t length = 1;
    OH_Drawing_MemoryStream *memoryStream = OH_Drawing_MemoryStreamCreate(nullptr, length, false);
    OH_Drawing_MemoryStreamDestroy(memoryStream);
    EXPECT_TRUE(true);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS