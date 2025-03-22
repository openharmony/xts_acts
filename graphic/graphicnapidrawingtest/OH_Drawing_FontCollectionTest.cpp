/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include "drawing_font_collection.h"

#include "gtest/gtest.h"
#include "drawing_text_declaration.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
class OH_Drawing_FontCollectionTest : public testing::Test {
};

/*
 * @tc.name: NativeDrawingTest001
 * @tc.desc: test for creating fontCollection
 * @tc.type: FUNC
 */
HWTEST_F(OH_Drawing_FontCollectionTest, OH_Drawing_FontCollectionTest001, Function | MediumTest | Level1)
{
    OH_Drawing_FontCollection* fontCollection = OH_Drawing_CreateFontCollection();
    EXPECT_EQ(fontCollection == nullptr, false);
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_FontCollection* sharedFontCollection = OH_Drawing_CreateSharedFontCollection();
    EXPECT_EQ(sharedFontCollection == nullptr, false);
    OH_Drawing_DisableFontCollectionFallback(sharedFontCollection);
    OH_Drawing_DisableFontCollectionSystemFont(sharedFontCollection);
    OH_Drawing_DestroyFontCollection(sharedFontCollection);
}
}