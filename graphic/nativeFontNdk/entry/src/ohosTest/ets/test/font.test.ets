/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import nativeFontNdk from 'libnativeFontNdk.so';

export default function fontTest() {
  describe('FontTest', () => {
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_MatchFontDescriptors_001
     * @tc.name       : testOHDrawingMatchFontDescriptors001
     * @tc.desc       : test OH_Drawing_MatchFontDescriptors_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingMatchFontDescriptors001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingMatchFontDescriptors001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_MatchFontDescriptors_002
     * @tc.name       : testOHDrawingMatchFontDescriptors002
     * @tc.desc       : test OH_Drawing_MatchFontDescriptors_002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingMatchFontDescriptors002', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingMatchFontDescriptors002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_MatchFontDescriptors_003
     * @tc.name       : testOHDrawingMatchFontDescriptors003
     * @tc.desc       : test OH_Drawing_MatchFontDescriptors_003
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingMatchFontDescriptors003', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingMatchFontDescriptors003();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetFontDescriptorByFullName_001
     * @tc.name       : testOHDrawingGetFontDescriptorByFullName001
     * @tc.desc       : test OH_Drawing_GetFontDescriptorByFullName_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetFontDescriptorByFullName001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetFontDescriptorByFullName001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetSystemFontFullNamesByType_001
     * @tc.name       : testOHDrawingGetSystemFontFullNamesByType001
     * @tc.desc       : test OH_Drawing_GetSystemFontFullNamesByType_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetSystemFontFullNamesByType001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetSystemFontFullNamesByType001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetSystemFontFullNameByIndex_001
     * @tc.name       : testOHDrawingGetSystemFontFullNameByIndex001
     * @tc.desc       : test OH_Drawing_GetSystemFontFullNameByIndex_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetSystemFontFullNameByIndex001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetSystemFontFullNameByIndex001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_CreateLineTypography_001
     * @tc.name       : testOHDrawingCreateLineTypography001
     * @tc.desc       : test OH_Drawing_CreateLineTypography_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingCreateLineTypography001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingCreateLineTypography001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_CreateLineTypography_002
     * @tc.name       : testOHDrawingCreateLineTypography002
     * @tc.desc       : test OH_Drawing_CreateLineTypography_002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingCreateLineTypography002', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingCreateLineTypography002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_LineTypographyGetLineBreak_001
     * @tc.name       : testOHDrawingLineTypographyGetLineBreak001
     * @tc.desc       : test OH_Drawing_LineTypographyGetLineBreak_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingLineTypographyGetLineBreak001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingLineTypographyGetLineBreak001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_LineTypographyCreateLine_001
     * @tc.name       : testOHDrawingLineTypographyCreateLine001
     * @tc.desc       : test OH_Drawing_LineTypographyCreateLine_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingLineTypographyCreateLine001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingLineTypographyCreateLine001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_FontGetBounds_001
     * @tc.name       : testOHDrawingFontGetBounds001
     * @tc.desc       : test OH_Drawing_FontGetBounds_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingFontGetBounds001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingFontGetBounds001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_RectDestroyArray_001
     * @tc.name       : testOHDrawingRectDestroyArray001
     * @tc.desc       : test OH_Drawing_RectDestroyArray_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingRectDestroyArray001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRectDestroyArray001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_FontGetPathForGlyph_001
     * @tc.name       : testOHDrawingFontGetPathForGlyph001
     * @tc.desc       : test OH_Drawing_FontGetPathForGlyph_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingFontGetPathForGlyph001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingFontGetPathForGlyph001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_RectGetArraySize_001
     * @tc.name       : testOHDrawingRectGetArraySize001
     * @tc.desc       : test OH_Drawing_RectGetArraySize_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingRectGetArraySize001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRectGetArraySize001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_RectGetArrayElement_001
     * @tc.name       : testOHDrawingRectGetArrayElement001
     * @tc.desc       : test OH_Drawing_RectGetArrayElement_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingRectGetArrayElement001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingRectGetArrayElement001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_CreateTextTab_001
     * @tc.name       : testOHDrawingCreateTextTab001
     * @tc.desc       : test OH_Drawing_CreateTextTab_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingCreateTextTab001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingCreateTextTab001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetTextTabAlignment_001
     * @tc.name       : testOHDrawingGetTextTabAlignment001
     * @tc.desc       : test OH_Drawing_GetTextTabAlignment_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetTextTabAlignment001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetTextTabAlignment001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetTextTabLocation_001
     * @tc.name       : testOHDrawingGetTextTabLocation001
     * @tc.desc       : test OH_Drawing_GetTextTabLocation_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetTextTabLocation001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetTextTabLocation001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_FontGetTextPath_001
     * @tc.name       : testOHDrawingFontGetTextPath001
     * @tc.desc       : test OH_Drawing_FontGetTextPath_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingFontGetTextPath001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingFontGetTextPath001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetDrawingArraySize_001
     * @tc.name       : testOHDrawingGetDrawingArraySize001
     * @tc.desc       : test OH_Drawing_GetDrawingArraySize_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetDrawingArraySize001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetDrawingArraySize001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TypographyGetTextLines_001
     * @tc.name       : testOHDrawingTypographyGetTextLines001
     * @tc.desc       : test OH_Drawing_TypographyGetTextLines_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingTypographyGetTextLines001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyGetTextLines001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TypographyGetTextLines_002
     * @tc.name       : testOHDrawingTypographyGetTextLines002
     * @tc.desc       : test OH_Drawing_TypographyGetTextLines_002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingTypographyGetTextLines002', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTypographyGetTextLines002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_DestroyTextLine_001
     * @tc.name       : testOHDrawingDestroyTextLine001
     * @tc.desc       : test OH_Drawing_DestroyTextLine_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingDestroyTextLine001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingDestroyTextLine001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetTextLineByIndex_001
     * @tc.name       : testOHDrawingGetTextLineByIndex001
     * @tc.desc       : test OH_Drawing_GetTextLineByIndex_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetTextLineByIndex001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetTextLineByIndex001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineGetTextRange_001
     * @tc.name       : testOHDrawingTextLineGetTextRange001
     * @tc.desc       : test OH_Drawing_TextLineGetTextRange_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingTextLineGetTextRange001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineGetTextRange001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineGetGlyphRuns_001
     * @tc.name       : testOHDrawingTextLineGetGlyphRuns001
     * @tc.desc       : test OH_Drawing_TextLineGetGlyphRuns_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingTextLineGetGlyphRuns001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineGetGlyphRuns001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_DestroyRuns_001
     * @tc.name       : testOHDrawingDestroyRuns001
     * @tc.desc       : test OH_Drawing_DestroyRuns_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingDestroyRuns001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingDestroyRuns001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRunByIndex_001
     * @tc.name       : testOHDrawingGetRunByIndex001
     * @tc.desc       : test OH_Drawing_GetRunByIndex_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetRunByIndex001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetRunByIndex001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLinePaint_001
     * @tc.name       : testOHDrawingGetRunByIndex001
     * @tc.desc       : test OH_Drawing_TextLinePaint_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingTextLinePaint001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLinePaint001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineCreateTruncatedLine_001
     * @tc.name       : testOHDrawingTextLineCreateTruncatedLine001
     * @tc.desc       : test OH_Drawing_TextLineCreateTruncatedLine_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingTextLineCreateTruncatedLine001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineCreateTruncatedLine001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineGetTypographicBounds_001
     * @tc.name       : testOHDrawingTextLineGetTypographicBounds001
     * @tc.desc       : test OH_Drawing_TextLineGetTypographicBounds_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingTextLineGetTypographicBounds001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineGetTypographicBounds001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineGetImageBounds_001
     * @tc.name       : testOHDrawingTextLineGetImageBounds001
     * @tc.desc       : test OH_Drawing_TextLineGetImageBounds_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingTextLineGetImageBounds001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineGetImageBounds001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineGetTrailingSpaceWidth_001
     * @tc.name       : testOHDrawingTextLineGetTrailingSpaceWidth001
     * @tc.desc       : test OH_Drawing_TextLineGetTrailingSpaceWidth_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingTextLineGetTrailingSpaceWidth001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineGetTrailingSpaceWidth001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineGetStringIndexForPosition_001
     * @tc.name       : testOHDrawingTextLineGetStringIndexForPosition001
     * @tc.desc       : test OH_Drawing_TextLineGetStringIndexForPosition_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingTextLineGetStringIndexForPosition001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineGetStringIndexForPosition001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineGetOffsetForStringIndex_001
     * @tc.name       : testOHDrawingTextLineGetOffsetForStringIndex001
     * @tc.desc       : test OH_Drawing_TextLineGetOffsetForStringIndex_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingTextLineGetOffsetForStringIndex001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineGetOffsetForStringIndex001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_TextLineGetAlignmentOffset_001
     * @tc.name       : testOHDrawingTextLineGetAlignmentOffset001
     * @tc.desc       : test OH_Drawing_TextLineGetAlignmentOffset_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingTextLineGetAlignmentOffset001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingTextLineGetAlignmentOffset001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRunGlyphCount_001
     * @tc.name       : testOHDrawingGetRunGlyphCount001
     * @tc.desc       : test OH_Drawing_GetRunGlyphCount_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetRunGlyphCount001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetRunGlyphCount001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRunStringRange_001
     * @tc.name       : testOHDrawingGetRunStringRange001
     * @tc.desc       : test OH_Drawing_GetRunStringRange_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetRunStringRange001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetRunStringRange001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRunTypographicBounds_001
     * @tc.name       : testOHDrawingGetRunTypographicBounds001
     * @tc.desc       : test OH_Drawing_GetRunTypographicBounds_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetRunTypographicBounds001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetRunTypographicBounds001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRunStringIndicesByIndex_001
     * @tc.name       : testOHDrawingGetRunTypographicBounds001
     * @tc.desc       : test OH_Drawing_GetRunStringIndicesByIndex_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetRunStringIndicesByIndex001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetRunStringIndicesByIndex001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRunImageBounds_001
     * @tc.name       : testOHDrawingGetRunImageBounds001
     * @tc.desc       : test OH_Drawing_GetRunImageBounds_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetRunImageBounds001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetRunImageBounds001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRunGlyphsByIndex_001
     * @tc.name       : testOHDrawingGetRunGlyphsByIndex001
     * @tc.desc       : test OH_Drawing_GetRunGlyphsByIndex_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetRunGlyphsByIndex001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetRunGlyphsByIndex001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetRunPositions_001
     * @tc.name       : testOHDrawingGetRunPositions001
     * @tc.desc       : test OH_Drawing_GetRunPositions_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetRunPositions001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetRunPositions001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_Drawing_GetFontCollectionGlobalInstance_001
     * @tc.name       : testOHDrawingGetFontCollectionGlobalInstance001
     * @tc.desc       : test OH_Drawing_GetFontCollectionGlobalInstance_001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHDrawingGetFontCollectionGlobalInstance001', 0, async (done: Function) => {
      let result: number = nativeFontNdk.oHDrawingGetFontCollectionGlobalInstance001();
      expect(result).assertEqual(0);
      done();
    });
  })
}