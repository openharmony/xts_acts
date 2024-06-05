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

#include "drawing_font_mgr.h"
#include "drawing_text_typography.h"
#include "drawing_typeface.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeFontMgrTest : public testing::Test {};

/*
 * @tc.name: OH_Drawing_FontMgrCreate
 * @tc.desc: test for OH_Drawing_FontMgrCreate.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeFontMgrTest, OH_Drawing_FontMgrCreate, TestSize.Level1) {
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);
    OH_Drawing_FontMgrDestroy(mgr);
}

/*
 * @tc.name: OH_Drawing_FontMgrDestroy
 * @tc.desc: test for OH_Drawing_FontMgrDestroy.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeFontMgrTest, OH_Drawing_FontMgrDestroy, TestSize.Level1) {
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);
    OH_Drawing_FontMgrDestroy(mgr);
}

/*
 * @tc.name: OH_Drawing_FontMgrGetFamilyCount
 * @tc.desc: test for OH_Drawing_FontMgrGetFamilyCount.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeFontMgrTest, OH_Drawing_FontMgrGetFamilyCount, TestSize.Level1) {
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);
    int count = OH_Drawing_FontMgrGetFamilyCount(mgr);
    EXPECT_TRUE(count > 0);
    OH_Drawing_FontMgrDestroy(mgr);
}

/*
 * @tc.name: OH_Drawing_FontMgrGetFamilyName
 * @tc.desc: test for OH_Drawing_FontMgrGetFamilyName.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeFontMgrTest, OH_Drawing_FontMgrGetFamilyName, TestSize.Level1) {
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);
    char *familyName = OH_Drawing_FontMgrGetFamilyName(mgr, 0);
    OH_Drawing_FontMgrDestroyFamilyName(familyName);
    OH_Drawing_FontMgrDestroy(mgr);
}

/*
 * @tc.name: OH_Drawing_FontMgrDestroyFamilyName
 * @tc.desc: test for OH_Drawing_FontMgrDestroyFamilyName.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeFontMgrTest, OH_Drawing_FontMgrDestroyFamilyName, TestSize.Level1) {
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);
    char *familyName = OH_Drawing_FontMgrGetFamilyName(mgr, 0);
    OH_Drawing_FontMgrDestroyFamilyName(familyName);
    OH_Drawing_FontMgrDestroy(mgr);
}

/*
 * @tc.name: OH_Drawing_FontMgrCreateFontStyleSet
 * @tc.desc: test for OH_Drawing_FontMgrCreateFontStyleSet.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeFontMgrTest, OH_Drawing_FontMgrCreateFontStyleSet, TestSize.Level1) {
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    OH_Drawing_FontStyleSet *fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(mgr, 0);
    EXPECT_NE(fontStyleSet, nullptr);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
 * @tc.name: OH_Drawing_FontMgrDestroyFontStyleSet
 * @tc.desc: test for OH_Drawing_FontMgrDestroyFontStyleSet.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeFontMgrTest, OH_Drawing_FontMgrDestroyFontStyleSet, TestSize.Level1) {
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);

    OH_Drawing_FontStyleSet *fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(mgr, 0);
    EXPECT_NE(fontStyleSet, nullptr);
    OH_Drawing_FontMgrDestroyFontStyleSet(fontStyleSet);

    OH_Drawing_FontMgrDestroy(mgr);
}

/*
 * @tc.name: OH_Drawing_FontMgrMatchFamily
 * @tc.desc: test for OH_Drawing_FontMgrMatchFamily.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeFontMgrTest, OH_Drawing_FontMgrMatchFamily, TestSize.Level1) {
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    EXPECT_NE(mgr, nullptr);
    const char *testFamilyName = "";
    OH_Drawing_FontStyleSet *fontStyleSet = OH_Drawing_FontMgrMatchFamily(mgr, testFamilyName);
    EXPECT_NE(fontStyleSet, nullptr);
    OH_Drawing_FontMgrDestroyFontStyleSet(fontStyleSet);
    OH_Drawing_FontMgrDestroy(mgr);
}

/*
 * @tc.name: OH_Drawing_FontMgrMatchFamilyStyle
 * @tc.desc: test for OH_Drawing_FontMgrMatchFamilyStyle.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeFontMgrTest, OH_Drawing_FontMgrMatchFamilyStyle, TestSize.Level1) {
    // todo cpp crash when OH_Drawing_FontMgrCreate
}

/*
 * @tc.name: OH_Drawing_FontMgrMatchFamilyStyleCharacter
 * @tc.desc: test for OH_Drawing_FontMgrMatchFamilyStyleCharacter.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeFontMgrTest, OH_Drawing_FontMgrMatchFamilyStyleCharacter, TestSize.Level1) {
    // todo cpp crash when OH_Drawing_FontMgrCreate
}

/*
 * @tc.name: OH_Drawing_FontStyleSetCreateTypeface
 * @tc.desc: test for OH_Drawing_FontStyleSetCreateTypeface.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeFontMgrTest, OH_Drawing_FontStyleSetCreateTypeface, TestSize.Level1) {
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    OH_Drawing_FontStyleSet *fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(mgr, 0);
    OH_Drawing_Typeface *typeface = OH_Drawing_FontStyleSetCreateTypeface(fontStyleSet, 0);
    EXPECT_NE(typeface, nullptr);
    typeface = OH_Drawing_FontStyleSetCreateTypeface(nullptr, 0);
    EXPECT_TRUE(typeface == nullptr);
    OH_Drawing_FontMgrDestroyFontStyleSet(fontStyleSet);
    OH_Drawing_TypefaceDestroy(typeface);
    OH_Drawing_FontMgrDestroy(mgr);
}

/*
 * @tc.name: OH_Drawing_FontStyleSetGetStyle
 * @tc.desc: test for OH_Drawing_FontStyleSetGetStyle.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeFontMgrTest, OH_Drawing_FontStyleSetGetStyle, TestSize.Level1) {
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    OH_Drawing_FontStyleSet *fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(mgr, 0);
    OH_Drawing_FontStyleStruct normalStyle;
    char **styleName = nullptr;
    normalStyle = OH_Drawing_FontStyleSetGetStyle(fontStyleSet, 0, styleName);
    EXPECT_TRUE(normalStyle.weight == FONT_WEIGHT_400);
    OH_Drawing_FontStyleSetFreeStyleName(styleName);
    OH_Drawing_FontMgrDestroyFontStyleSet(fontStyleSet);
    OH_Drawing_FontMgrDestroy(mgr);
}

/*
 * @tc.name: OH_Drawing_FontStyleSetFreeStyleName
 * @tc.desc: test for OH_Drawing_FontStyleSetFreeStyleName.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeFontMgrTest, OH_Drawing_FontStyleSetFreeStyleName, TestSize.Level1) {
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    OH_Drawing_FontStyleSet *fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(mgr, 0);
    OH_Drawing_FontStyleStruct normalStyle;
    char **styleName = nullptr;
    normalStyle = OH_Drawing_FontStyleSetGetStyle(fontStyleSet, 0, styleName);
    EXPECT_TRUE(normalStyle.weight == FONT_WEIGHT_400);
    OH_Drawing_FontStyleSetFreeStyleName(styleName);
    OH_Drawing_FontMgrDestroyFontStyleSet(fontStyleSet);
    OH_Drawing_FontMgrDestroy(mgr);
}

/*
 * @tc.name: OH_Drawing_FontStyleSetMatchStyle
 * @tc.desc: test for OH_Drawing_FontStyleSetMatchStyle.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeFontMgrTest, OH_Drawing_FontStyleSetMatchStyle, TestSize.Level1) {
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    OH_Drawing_FontStyleSet *fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(mgr, 0);
    OH_Drawing_FontStyleStruct normalStyle;
    normalStyle.weight = FONT_WEIGHT_400;
    normalStyle.width = FONT_WIDTH_NORMAL;
    normalStyle.slant = FONT_STYLE_NORMAL;
    OH_Drawing_Typeface *typeface = OH_Drawing_FontStyleSetMatchStyle(fontStyleSet, normalStyle);
    EXPECT_NE(typeface, nullptr);

    typeface = OH_Drawing_FontStyleSetMatchStyle(nullptr, normalStyle);
    EXPECT_TRUE(typeface == nullptr);
    OH_Drawing_FontMgrDestroyFontStyleSet(fontStyleSet);
    OH_Drawing_TypefaceDestroy(typeface);
    OH_Drawing_FontMgrDestroy(mgr);
}

/*
 * @tc.name: OH_Drawing_FontStyleSetCount
 * @tc.desc: test for OH_Drawing_FontStyleSetCount.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(DrawingNativeFontMgrTest, OH_Drawing_FontStyleSetCount, TestSize.Level1) {
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    OH_Drawing_FontStyleSet *fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(mgr, 0);
    int count = OH_Drawing_FontStyleSetCount(fontStyleSet);
    EXPECT_TRUE(count > 0);

    OH_Drawing_FontMgrDestroyFontStyleSet(fontStyleSet);
    OH_Drawing_FontMgrDestroy(mgr);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS