/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include <string>
#include <fstream>
#include <filesystem>
#include <js_native_api.h>
#include "napi/native_api.h"
#include "hilog/log.h"
#include "native_drawing/drawing_bitmap.h"
#include "native_drawing/drawing_brush.h"
#include "native_drawing/drawing_canvas.h"
#include "native_drawing/drawing_color.h"
#include "native_drawing/drawing_font.h"
#include "native_drawing/drawing_font_collection.h"
#include "native_drawing/drawing_path.h"
#include "native_drawing/drawing_point.h"
#include "native_drawing/drawing_pen.h"
#include "native_drawing/drawing_rect.h"
#include "native_drawing/drawing_text_run.h"
#include "native_drawing/drawing_text_declaration.h"
#include "native_drawing/drawing_text_typography.h"
#include "native_drawing/drawing_text_font_descriptor.h"
#include "native_drawing/drawing_text_line.h"
#include "native_drawing/drawing_text_lineTypography.h"

#define SUCCESS 0
#define FAIL (-1)
#define ALIGNMENT600 600
#define ALIGNMENT700 700
#define ALIGNMENT20 20
#define TEXTLINE30 30
#define TEXTLINE250 250
#define HEIGHT40 40
#define NUM_50 50
#define NUM_500 500.0
#define INT_NUM_2 2
#define INT_NUM_100 100
#define INT_NUM_200 200
#define INT_NUM_5 5
#define DOUBLE_NUM_2 2.0
#define DOUBLE_NUM_0 0.0
#define DOUBLE_NEGATIVE_NUM_1 (-1.0)
#define DOUBLE_NUM_05 0.5
#define DOUBLE_NUM_100 100.0
#define DOUBLE_NUM_800 800.0

static OH_Drawing_TypographyStyle *typoStyle_ = nullptr;
static OH_Drawing_TextStyle *txtStyle_ = nullptr;
static OH_Drawing_FontCollection *fontCollection_ = nullptr;
static OH_Drawing_TypographyCreate *handler_ = nullptr;
static OH_Drawing_Typography *typography_ = nullptr;
static OH_Drawing_Bitmap *cBitmap_ = nullptr;
static OH_Drawing_Canvas *canvas_ = nullptr;
static OH_Drawing_TypographyCreate *handler2_ = nullptr;
static OH_Drawing_FontCollection *fontCollection2_ = nullptr;
static OH_Drawing_TextStyle *txtStyle2_ = nullptr;
static OH_Drawing_TypographyStyle *typoStyle2_ = nullptr;
std::string g_text;

static void PrepareCreateTextLine(const std::string &text)
{
    double maxWidth = 500.0;
    uint32_t height = 40;
    typoStyle_ = OH_Drawing_CreateTypographyStyle();
    txtStyle_ = OH_Drawing_CreateTextStyle();
    fontCollection_ = OH_Drawing_CreateFontCollection();
    handler_ = OH_Drawing_CreateTypographyHandler(typoStyle_, fontCollection_);
    OH_Drawing_SetTextStyleColor(txtStyle_, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 30;
    OH_Drawing_SetTextStyleFontSize(txtStyle_, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle_, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle_, halfLeading);
    const char *fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle_, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler_, txtStyle_);
    OH_Drawing_TypographyHandlerAddText(handler_, text.c_str());
    OH_Drawing_TypographyHandlerPopTextStyle(handler_);
    typography_ = OH_Drawing_CreateTypography(handler_);
    OH_Drawing_TypographyLayout(typography_, maxWidth);
    double position[2] = {10.0, 15.0};
    cBitmap_ = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = 20;
    OH_Drawing_BitmapBuild(cBitmap_, width, height, &cFormat);
    canvas_ = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(canvas_, cBitmap_);
    OH_Drawing_CanvasClear(canvas_, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    OH_Drawing_TypographyPaint(typography_, canvas_, position[0], position[1]);
}

static void TearDown()
{
    if (canvas_ != nullptr) {
        OH_Drawing_CanvasDestroy(canvas_);
        canvas_ = nullptr;
    }
    if (typography_ != nullptr) {
        OH_Drawing_DestroyTypography(typography_);
        typography_ = nullptr;
    }
    if (handler_ != nullptr) {
        OH_Drawing_DestroyTypographyHandler(handler_);
        handler_ = nullptr;
    }
    if (txtStyle_ != nullptr) {
        OH_Drawing_DestroyTextStyle(txtStyle_);
        txtStyle_ = nullptr;
    }
    if (typoStyle_ != nullptr) {
        OH_Drawing_DestroyTypographyStyle(typoStyle_);
        typoStyle_ = nullptr;
    }
    if (cBitmap_ != nullptr) {
        OH_Drawing_BitmapDestroy(cBitmap_);
        cBitmap_ = nullptr;
    }
    if (fontCollection_ != nullptr) {
        OH_Drawing_DestroyFontCollection(fontCollection_);
        fontCollection_ = nullptr;
    }
}

static void PrepareTypographyCreate(const char *text)
{
    fontCollection2_ = OH_Drawing_CreateFontCollection();
    typoStyle2_ = OH_Drawing_CreateTypographyStyle();
    handler2_ = OH_Drawing_CreateTypographyHandler(typoStyle2_, fontCollection2_);
    txtStyle2_ = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleColor(txtStyle2_, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 30;
    OH_Drawing_SetTextStyleFontSize(txtStyle2_, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle2_, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(txtStyle2_, TEXT_BASELINE_ALPHABETIC);
    const char *fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle2_, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler2_, txtStyle2_);
    if (text != nullptr) {
        OH_Drawing_TypographyHandlerAddText(handler2_, text);
    }
}

static void TypographyTearDown()
{
    if (handler2_ != nullptr) {
        OH_Drawing_DestroyTypographyHandler(handler2_);
        handler2_ = nullptr;
    }
    if (txtStyle2_ != nullptr) {
        OH_Drawing_DestroyTextStyle(txtStyle2_);
        txtStyle2_ = nullptr;
    }
    if (fontCollection2_ != nullptr) {
        OH_Drawing_DestroyFontCollection(fontCollection2_);
        fontCollection2_ = nullptr;
    }
    if (typoStyle2_ != nullptr) {
        OH_Drawing_DestroyTypographyStyle(typoStyle2_);
        typoStyle2_ = nullptr;
    }
}

static napi_value OHDrawingMatchFontDescriptors001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontDescriptor *descArr = OH_Drawing_MatchFontDescriptors(nullptr, nullptr);
    if (descArr == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHDrawingMatchFontDescriptors002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontDescriptor *desc = OH_Drawing_CreateFontDescriptor();
    size_t num = 0;
    OH_Drawing_FontDescriptor *descArr = OH_Drawing_MatchFontDescriptors(desc, &num);
    if ((descArr != nullptr) && (num != 0)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyFontDescriptor(desc);
    OH_Drawing_DestroyFontDescriptors(descArr, num);
    return result;
}

static napi_value OHDrawingMatchFontDescriptors003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontDescriptor *desc = OH_Drawing_CreateFontDescriptor();
    desc->weight = -1;
    size_t num = 0;
    OH_Drawing_FontDescriptor *descArr = OH_Drawing_MatchFontDescriptors(desc, &num);
    if ((descArr == nullptr) && (num == 0)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyFontDescriptor(desc);
    return result;
}

static napi_value OHDrawingGetFontDescriptorByFullName001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_SystemFontType fontType = OH_Drawing_SystemFontType(0b10000);
    OH_Drawing_FontDescriptor *descriptor = OH_Drawing_GetFontDescriptorByFullName(nullptr, fontType);
    if (descriptor == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHDrawingGetSystemFontFullNamesByType001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_SystemFontType fontType = OH_Drawing_SystemFontType(0b10000);
    OH_Drawing_Array *fontList = OH_Drawing_GetSystemFontFullNamesByType(fontType);
    if (fontList == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHDrawingGetSystemFontFullNameByIndex001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const OH_Drawing_String *fullName = OH_Drawing_GetSystemFontFullNameByIndex(nullptr, 0 | 500);
    if (fullName == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroySystemFontFullNames(nullptr);
    return result;
}

static napi_value OHDrawingCreateLineTypography001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyCreate *handler_ = nullptr;
    OH_Drawing_LineTypography *lineTypography = OH_Drawing_CreateLineTypography(handler_);
    if (lineTypography == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHDrawingCreateLineTypography002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyCreate *handler_ = nullptr;
    OH_Drawing_FontCollection *fontCollection_ = nullptr;
    OH_Drawing_TypographyStyle *typoStyle_ = nullptr;
    const char *text = "OpenHarmony\n";
    fontCollection_ = OH_Drawing_CreateFontCollection();
    typoStyle_ = OH_Drawing_CreateTypographyStyle();
    handler_ = OH_Drawing_CreateTypographyHandler(typoStyle_, fontCollection_);
    OH_Drawing_TypographyHandlerAddText(handler_, text);
    OH_Drawing_LineTypography *lineTypography1 = OH_Drawing_CreateLineTypography(handler_);
    if (lineTypography1 != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyFontCollection(fontCollection_);
    OH_Drawing_DestroyTypographyStyle(typoStyle_);
    OH_Drawing_DestroyTypographyHandler(handler_);
    OH_Drawing_DestroyLineTypography(lineTypography1);
    return result;
}

static napi_value OHDrawingLineTypographyGetLineBreak001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyCreate *handler_ = nullptr;
    OH_Drawing_FontCollection *fontCollection_ = nullptr;
    OH_Drawing_TypographyStyle *typoStyle_ = nullptr;
    const char *text = "OpenHarmony\n";
    fontCollection_ = OH_Drawing_CreateFontCollection();
    typoStyle_ = OH_Drawing_CreateTypographyStyle();
    handler_ = OH_Drawing_CreateTypographyHandler(typoStyle_, fontCollection_);
    OH_Drawing_TypographyHandlerAddText(handler_, text);
    OH_Drawing_LineTypography *lineTypography = OH_Drawing_CreateLineTypography(handler_);
    double maxWidth = DOUBLE_NUM_800;
    size_t startIndex = 0;
    auto count = OH_Drawing_LineTypographyGetLineBreak(lineTypography, startIndex, maxWidth);
    if (count == strlen(text)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyFontCollection(fontCollection_);
    OH_Drawing_DestroyTypographyStyle(typoStyle_);
    OH_Drawing_DestroyTypographyHandler(handler_);
    OH_Drawing_DestroyLineTypography(lineTypography);
    return result;
}

static napi_value OHDrawingLineTypographyCreateLine001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyCreate *handler_ = nullptr;
    OH_Drawing_FontCollection *fontCollection_ = nullptr;
    OH_Drawing_TypographyStyle *typoStyle_ = nullptr;
    const char *text = "OpenHarmony\n";
    fontCollection_ = OH_Drawing_CreateFontCollection();
    typoStyle_ = OH_Drawing_CreateTypographyStyle();
    handler_ = OH_Drawing_CreateTypographyHandler(typoStyle_, fontCollection_);
    OH_Drawing_TypographyHandlerAddText(handler_, text);
    OH_Drawing_LineTypography *lineTypography = OH_Drawing_CreateLineTypography(handler_);
    size_t startIndex = 0;
    size_t count = strlen(text);
    auto line = OH_Drawing_LineTypographyCreateLine(lineTypography, startIndex, count);
    if (line != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyFontCollection(fontCollection_);
    OH_Drawing_DestroyTypographyStyle(typoStyle_);
    OH_Drawing_DestroyTypographyHandler(handler_);
    OH_Drawing_DestroyLineTypography(lineTypography);
    OH_Drawing_DestroyTextLine(line);
    return result;
}

static napi_value OHDrawingFontGetBounds001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, NUM_50);
    const char *space = "   ";
    uint32_t count = OH_Drawing_FontCountText(font, space, strlen(space), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    uint16_t glyphs[count];
    OH_Drawing_FontTextToGlyphs(font, space, strlen(space), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8,
        glyphs, count);
    OH_Drawing_Array *outRectarr = OH_Drawing_RectCreateArray(count - 1);
    if ((OH_Drawing_FontGetBounds(font, glyphs, count, outRectarr) == OH_DRAWING_ERROR_INVALID_PARAMETER) &&
        (OH_Drawing_FontGetBounds(nullptr, glyphs, count, outRectarr) == OH_DRAWING_ERROR_INVALID_PARAMETER) &&
        (OH_Drawing_FontGetBounds(font, nullptr, count, outRectarr) == OH_DRAWING_ERROR_INVALID_PARAMETER) &&
        (OH_Drawing_FontGetBounds(font, glyphs, count, nullptr) == OH_DRAWING_ERROR_INVALID_PARAMETER)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_FontDestroy(font);
    return result;
}

static napi_value OHDrawingRectDestroyArray001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, NUM_50);
    const char *space = "   ";
    uint32_t count = OH_Drawing_FontCountText(font, space, strlen(space), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    uint16_t glyphs[count];
    OH_Drawing_FontTextToGlyphs(font, space, strlen(space), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8,
        glyphs, count);
    OH_Drawing_Array *outRectarr = OH_Drawing_RectCreateArray(count - 1);
    if (OH_Drawing_RectDestroyArray(outRectarr) == OH_DRAWING_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_FontDestroy(font);
    return result;
}

static napi_value OHDrawingFontGetPathForGlyph001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    OH_Drawing_FontSetTextSize(font, NUM_50);
    uint16_t glyphsNotExist = 65535;
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    if (OH_Drawing_FontGetPathForGlyph(font, glyphsNotExist, path) == OH_DRAWING_ERROR_INVALID_PARAMETER) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    if (path != nullptr) {
        OH_Drawing_PathDestroy(path);
    }
    OH_Drawing_FontDestroy(font);
    return result;
}

static napi_value OHDrawingRectGetArraySize001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_Array *rectArray = OH_Drawing_RectCreateArray(NUM_50);
    size_t size = 0;
    if ((OH_Drawing_RectGetArraySize(nullptr, &size) == OH_DRAWING_ERROR_INVALID_PARAMETER) &&
        (OH_Drawing_RectGetArraySize(rectArray, nullptr) == OH_DRAWING_ERROR_INVALID_PARAMETER)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHDrawingRectGetArrayElement001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t size = NUM_50;
    OH_Drawing_Array *rectArray = OH_Drawing_RectCreateArray(size);
    OH_Drawing_Rect *rect = nullptr;
    if ((OH_Drawing_RectGetArrayElement(rectArray, size, &rect) == OH_DRAWING_ERROR_INVALID_PARAMETER) &&
        (OH_Drawing_RectGetArrayElement(rectArray, size - 1, nullptr) == OH_DRAWING_ERROR_INVALID_PARAMETER) &&
        (OH_Drawing_RectGetArrayElement(rectArray, size - 1, &rect) == OH_DRAWING_SUCCESS)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHDrawingCreateTextTab001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TextTab *textTab = OH_Drawing_CreateTextTab(TEXT_ALIGN_LEFT, DOUBLE_NUM_0);
    if (textTab != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyTextTab(textTab);
    return result;
}

static napi_value OHDrawingGetTextTabAlignment001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TextTab *textTab = OH_Drawing_CreateTextTab(TEXT_ALIGN_LEFT, DOUBLE_NUM_0);
    if (OH_Drawing_GetTextTabAlignment(textTab) == TEXT_ALIGN_LEFT) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyTextTab(textTab);
    return result;
}

static napi_value OHDrawingGetTextTabLocation001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TextTab *textTab = OH_Drawing_CreateTextTab(TEXT_ALIGN_LEFT, DOUBLE_NUM_0);
    if (OH_Drawing_GetTextTabLocation(textTab) == DOUBLE_NUM_0) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyTextTab(textTab);
    return result;
}

static napi_value OHDrawingFontGetTextPath001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    const char *str = "Hello 中文";
    size_t length = std::char_traits<char>::length(str);
    float x = 12.0f;
    float y = 150.0f;
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    if ((OH_Drawing_FontGetTextPath(nullptr, str, sizeof(char) * length, TEXT_ENCODING_UTF8, x, y, path) ==
         OH_DRAWING_ERROR_INVALID_PARAMETER) &&
        (OH_Drawing_FontGetTextPath(font, nullptr, sizeof(char) * length, TEXT_ENCODING_UTF8, x, y, path) ==
         OH_DRAWING_ERROR_INVALID_PARAMETER) &&
        (OH_Drawing_FontGetTextPath(font, str, 0, TEXT_ENCODING_UTF8, x, y, path) ==
         OH_DRAWING_ERROR_INVALID_PARAMETER) &&
        (OH_Drawing_FontGetTextPath(font, str, sizeof(char) * length, TEXT_ENCODING_UTF8, x, y, nullptr) ==
         OH_DRAWING_ERROR_INVALID_PARAMETER)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_FontDestroy(font);
    return result;
}

static napi_value OHDrawingGetDrawingArraySize001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_SystemFontType fontType = OH_Drawing_SystemFontType::GENERIC;
    OH_Drawing_Array *fontList = OH_Drawing_GetSystemFontFullNamesByType(fontType);
    size_t size = OH_Drawing_GetDrawingArraySize(fontList);
    if (size != 0) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroySystemFontFullNames(fontList);
    return result;
}

static napi_value OHDrawingTypographyGetTextLines001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("");
    OH_Drawing_Array *textLines = textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    if (size == 0) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

static napi_value OHDrawingTypographyGetTextLines002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("\n");
    OH_Drawing_Array *textLines = textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    if (size == INT_NUM_2) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

static napi_value OHDrawingDestroyTextLine001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const char *text = "OpenHarmoney\n";
    PrepareTypographyCreate(text);
    OH_Drawing_LineTypography *lineTypography = OH_Drawing_CreateLineTypography(handler2_);
    size_t startIndex = 0;
    size_t count = strlen(text);
    auto line = OH_Drawing_LineTypographyCreateLine(lineTypography, startIndex, count);
    if (OH_Drawing_TextLineGetGlyphCount(line) == 12L) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyTextLine(line);
    OH_Drawing_DestroyLineTypography(lineTypography);
    TypographyTearDown();
    return result;
}

static napi_value OHDrawingGetTextLineByIndex001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("\n\n\n");
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, -1 | 10);
    if (textLine == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

static napi_value OHDrawingTextLineGetTextRange001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("\n\n\n");
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);
    size_t start = 0;
    OH_Drawing_TextLineGetTextRange(textLine, &start, nullptr);
    if (start == 0) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

static napi_value OHDrawingTextLineGetGlyphRuns001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("\n\n\n");
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);
    OH_Drawing_Array *runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
    if (runs == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

static napi_value OHDrawingDestroyRuns001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("\n\n\n");
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    for (size_t index = 0; index < size - 1; index++) {
        OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        OH_Drawing_Array *runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
        size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
        if (runsSize == 0) {
            napi_create_int32(env, SUCCESS, &result);
        } else {
            napi_create_int32(env, FAIL, &result);
        }
        OH_Drawing_DestroyRuns(runs);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

static napi_value OHDrawingGetRunByIndex001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_Run *run = OH_Drawing_GetRunByIndex(nullptr, 0);
    if (run == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHDrawingTextLinePaint001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("Hello 测 World \n!@#$%^&*~(){}[] 123 4567890 - = ,. < >、/Drawing testlp 试 Drawing  ");
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        OH_Drawing_TextLine *truncatedLine =
        OH_Drawing_TextLineCreateTruncatedLine(textLine, INT_NUM_100, ELLIPSIS_MODAL_HEAD, "...");
        OH_Drawing_TextLinePaint(truncatedLine, canvas_, TEXTLINE30, TEXTLINE250);
        double count = OH_Drawing_TextLineGetGlyphCount(truncatedLine);
        if (count > 0) {
            napi_create_int32(env, SUCCESS, &result);
        } else {
            napi_create_int32(env, FAIL, &result);
        }
        OH_Drawing_DestroyTextLine(truncatedLine);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

static napi_value OHDrawingTextLineCreateTruncatedLine001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("\n\n");
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);
    OH_Drawing_TextLine *truncatedLine = OH_Drawing_TextLineCreateTruncatedLine(textLine, INT_NUM_200, INT_NUM_5, "1");
    if (truncatedLine == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

static napi_value OHDrawingTextLineGetTypographicBounds001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("\n\n\n\n");
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    double ascent = DOUBLE_NUM_0;
    double descent = DOUBLE_NUM_0;
    double leading = DOUBLE_NUM_0;
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        double width = OH_Drawing_TextLineGetTypographicBounds(textLine, &ascent, &descent, &leading);
        if ((ascent > 0) && (descent > 0) && (leading == 0) && (width == 0)) {
            napi_create_int32(env, SUCCESS, &result);
        } else {
            napi_create_int32(env, FAIL, &result);
        }
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

static napi_value OHDrawingTextLineGetImageBounds001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("Hello 测 World \n!@#$%^&*~(){}[] 123 4567890 - = ,. < >、/Drawing testlp 试 Drawing  ");
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        OH_Drawing_Rect *rect = OH_Drawing_TextLineGetImageBounds(textLine);
        if ((OH_Drawing_RectGetRight(rect) > OH_Drawing_RectGetLeft(rect)) &&
            (OH_Drawing_RectGetBottom(rect) > OH_Drawing_RectGetTop(rect)) &&
            (OH_Drawing_RectGetWidth(rect) < NUM_500) &&
            (OH_Drawing_RectGetHeight(rect) <= HEIGHT40)) {
            napi_create_int32(env, SUCCESS, &result);
        } else {
            napi_create_int32(env, FAIL, &result);
        }
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

static napi_value OHDrawingTextLineGetTrailingSpaceWidth001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("Hello 测 World \n!@#$%^&*~(){}[] 123 4567890 - = ,. < >、/Drawing testlp 试 Drawing  ");
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        double width = OH_Drawing_TextLineGetTrailingSpaceWidth(textLine);
        if (width > 1) {
            napi_create_int32(env, SUCCESS, &result);
        } else {
            napi_create_int32(env, FAIL, &result);
        }
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

static napi_value OHDrawingTextLineGetStringIndexForPosition001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("\n\n");
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    OH_Drawing_TextLine *textLine = textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);
    if ((OH_Drawing_TextLineGetStringIndexForPosition(textLine, nullptr) == 0) &&
        (OH_Drawing_TextLineGetStringIndexForPosition(nullptr, nullptr) == 0)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

static napi_value OHDrawingTextLineGetOffsetForStringIndex001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("\n\n");
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        if ((OH_Drawing_TextLineGetOffsetForStringIndex(textLine, 0) == DOUBLE_NUM_0) &&
            (OH_Drawing_TextLineGetOffsetForStringIndex(textLine, INT_NUM_100) == DOUBLE_NUM_0)) {
            napi_create_int32(env, SUCCESS, &result);
        } else {
            napi_create_int32(env, FAIL, &result);
        }
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

static napi_value OHDrawingTextLineGetAlignmentOffset001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PrepareCreateTextLine("Hello 测 World \n!@#$%^&*~(){}[] 123 4567890 - = ,. < >、/Drawing testlp 试 Drawing  ");
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        if ((OH_Drawing_TextLineGetAlignmentOffset(textLine, DOUBLE_NUM_0, ALIGNMENT600) == DOUBLE_NUM_0) &&
            (OH_Drawing_TextLineGetAlignmentOffset(textLine, DOUBLE_NUM_05, ALIGNMENT700) > DOUBLE_NUM_100) &&
            (OH_Drawing_TextLineGetAlignmentOffset(textLine, DOUBLE_NEGATIVE_NUM_1, ALIGNMENT700) == DOUBLE_NUM_0) &&
            (OH_Drawing_TextLineGetAlignmentOffset(textLine, DOUBLE_NUM_2, ALIGNMENT20) == DOUBLE_NUM_0)) {
            napi_create_int32(env, SUCCESS, &result);
        } else {
            napi_create_int32(env, FAIL, &result);
        }
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

static napi_value OHDrawingGetRunGlyphCount001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    uint32_t count = OH_Drawing_GetRunGlyphCount(nullptr);
    if (count == 0) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHDrawingGetRunStringRange001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    uint64_t location = 0;
    uint64_t length = 0;
    OH_Drawing_GetRunStringRange(nullptr, &location, &length);
    if ((location == 0) && (length == 0) && (OH_Drawing_GetRunStringIndices(nullptr, 0, 0) == nullptr) &&
        (OH_Drawing_GetRunGlyphs(nullptr, 0, 0) == nullptr) &&
        (OH_Drawing_GetRunPositions(nullptr, 0, 0) == nullptr) &&
        (OH_Drawing_GetRunImageBounds(nullptr) == nullptr)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHDrawingGetRunTypographicBounds001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_RunPaint(nullptr, nullptr, 0, 0);
    float ascent = DOUBLE_NUM_0;
    float descent = DOUBLE_NUM_0;
    float leading = DOUBLE_NUM_0;
    float width = OH_Drawing_GetRunTypographicBounds(nullptr, &ascent, &descent, &leading);
    if ((ascent == DOUBLE_NUM_0) && (descent == DOUBLE_NUM_0) && (leading == DOUBLE_NUM_0) && (width == DOUBLE_NUM_0)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHDrawingGetRunStringIndicesByIndex001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    g_text = "Hello 你好 World";
    PrepareCreateTextLine(g_text);
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        OH_Drawing_Array *runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
        size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
        for (size_t runIndex = 0; runIndex < runsSize; runIndex++) {
            OH_Drawing_Run *run = OH_Drawing_GetRunByIndex(runs, runIndex);
            uint32_t count = OH_Drawing_GetRunGlyphCount(run);
            uint64_t location = 0;
            uint64_t length = 0;
            OH_Drawing_GetRunStringRange(run, &location, &length);
            OH_Drawing_Array *stringIndicesArr = OH_Drawing_GetRunStringIndices(run, 0, count);
            size_t sizeArr = OH_Drawing_GetDrawingArraySize(stringIndicesArr);
            for (size_t stringIndex = 0; stringIndex < sizeArr; stringIndex++) {
                uint64_t indices = OH_Drawing_GetRunStringIndicesByIndex(stringIndicesArr, stringIndex);
                if (indices >= 0) {
                    napi_create_int32(env, SUCCESS, &result);
                } else {
                    napi_create_int32(env, FAIL, &result);
                }
            }
            OH_Drawing_DestroyRunStringIndices(stringIndicesArr);
        }
        OH_Drawing_DestroyRuns(runs);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

static napi_value OHDrawingGetRunImageBounds001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    g_text = "Hello 你好 World";
    PrepareCreateTextLine(g_text);
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        OH_Drawing_Array *runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
        size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
        for (size_t runIndex = 0; runIndex < runsSize; runIndex++) {
            OH_Drawing_Run *run = OH_Drawing_GetRunByIndex(runs, runIndex);
            uint32_t count = OH_Drawing_GetRunGlyphCount(run);
            uint64_t location = 0;
            uint64_t length = 0;
            OH_Drawing_GetRunStringRange(run, &location, &length);
            OH_Drawing_Array *stringIndicesArr = OH_Drawing_GetRunStringIndices(run, 0, count);
            size_t sizeArr = OH_Drawing_GetDrawingArraySize(stringIndicesArr);
            for (size_t stringIndex = 0; stringIndex < sizeArr; stringIndex++) {
                uint64_t indices = OH_Drawing_GetRunStringIndicesByIndex(stringIndicesArr, stringIndex);
            }
            OH_Drawing_DestroyRunStringIndices(stringIndicesArr);
            OH_Drawing_Rect *bounds = OH_Drawing_GetRunImageBounds(run);
            if (bounds != nullptr) {
                napi_create_int32(env, SUCCESS, &result);
            } else {
                napi_create_int32(env, FAIL, &result);
            }
            OH_Drawing_DestroyRunImageBounds(bounds);
            OH_Drawing_RunPaint(canvas_, run, DOUBLE_NUM_0, DOUBLE_NUM_0);
        }
        OH_Drawing_DestroyRuns(runs);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

static napi_value OHDrawingGetRunGlyphsByIndex001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    g_text = "Hello 你好 World";
    PrepareCreateTextLine(g_text);
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        OH_Drawing_Array *runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
        size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
        for (size_t runIndex = 0; runIndex < runsSize; runIndex++) {
            OH_Drawing_Run *run = OH_Drawing_GetRunByIndex(runs, runIndex);
            uint32_t count = OH_Drawing_GetRunGlyphCount(run);
            float ascent = DOUBLE_NUM_0;
            float descent = DOUBLE_NUM_0;
            float leading = DOUBLE_NUM_0;
            float width = OH_Drawing_GetRunTypographicBounds(run, &ascent, &descent, &leading);
            OH_Drawing_Array *glyphs = OH_Drawing_GetRunGlyphs(run, 0, count);
            size_t glyphSize = OH_Drawing_GetDrawingArraySize(glyphs);
            for (size_t glyphsIndex = 0; glyphsIndex < glyphSize; glyphsIndex++) {
                if (OH_Drawing_GetRunGlyphsByIndex(glyphs, glyphsIndex) > 0) {
                    napi_create_int32(env, SUCCESS, &result);
                } else {
                    napi_create_int32(env, FAIL, &result);
                }
            }
            OH_Drawing_DestroyRunGlyphs(glyphs);
        }
        OH_Drawing_DestroyRuns(runs);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

static napi_value OHDrawingGetRunPositions001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    g_text = "Hello 你好 World";
    PrepareCreateTextLine(g_text);
    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography_);
    size_t size = OH_Drawing_GetDrawingArraySize(textLines);
    for (size_t index = 0; index < size; index++) {
        OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, index);
        OH_Drawing_Array *runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
        size_t runsSize = OH_Drawing_GetDrawingArraySize(runs);
        for (size_t runIndex = 0; runIndex < runsSize; runIndex++) {
            OH_Drawing_Run *run = OH_Drawing_GetRunByIndex(runs, runIndex);
            uint32_t count = OH_Drawing_GetRunGlyphCount(run);
            OH_Drawing_Array *positions = OH_Drawing_GetRunPositions(run, 0, count);
            size_t positionSize = OH_Drawing_GetDrawingArraySize(positions);
            for (size_t posIndex = 0; posIndex < positionSize; posIndex++) {
                OH_Drawing_Point *pos = OH_Drawing_GetRunPositionsByIndex(positions, posIndex);
                float x = DOUBLE_NUM_0;
                OH_Drawing_PointGetX(pos, &x);
                if (x >= DOUBLE_NUM_0) {
                    napi_create_int32(env, SUCCESS, &result);
                } else {
                    napi_create_int32(env, FAIL, &result);
                }
            }
            OH_Drawing_DestroyRunPositions(positions);
        }
        OH_Drawing_DestroyRuns(runs);
    }
    OH_Drawing_DestroyTextLines(textLines);
    TearDown();
    return result;
}

static napi_value OHDrawingGetFontCollectionGlobalInstance001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_CreateFontCollection();
    if (fontCollection != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Drawing_DestroyFontCollection(fontCollection);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"oHDrawingMatchFontDescriptors001", nullptr, OHDrawingMatchFontDescriptors001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingMatchFontDescriptors002", nullptr, OHDrawingMatchFontDescriptors002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingMatchFontDescriptors003", nullptr, OHDrawingMatchFontDescriptors003,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingGetFontDescriptorByFullName001", nullptr, OHDrawingGetFontDescriptorByFullName001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingGetSystemFontFullNamesByType001", nullptr, OHDrawingGetSystemFontFullNamesByType001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingGetSystemFontFullNameByIndex001", nullptr, OHDrawingGetSystemFontFullNameByIndex001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingCreateLineTypography001", nullptr, OHDrawingCreateLineTypography001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingCreateLineTypography002", nullptr, OHDrawingCreateLineTypography002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingLineTypographyGetLineBreak001", nullptr, OHDrawingLineTypographyGetLineBreak001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingLineTypographyCreateLine001", nullptr, OHDrawingLineTypographyCreateLine001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingFontGetBounds001", nullptr, OHDrawingFontGetBounds001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingRectDestroyArray001", nullptr, OHDrawingRectDestroyArray001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingFontGetPathForGlyph001", nullptr, OHDrawingFontGetPathForGlyph001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingRectGetArraySize001", nullptr, OHDrawingRectGetArraySize001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingRectGetArrayElement001", nullptr, OHDrawingRectGetArrayElement001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingCreateTextTab001", nullptr, OHDrawingCreateTextTab001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingGetTextTabAlignment001", nullptr, OHDrawingGetTextTabAlignment001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingGetTextTabLocation001", nullptr, OHDrawingGetTextTabLocation001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingFontGetTextPath001", nullptr, OHDrawingFontGetTextPath001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingGetDrawingArraySize001", nullptr, OHDrawingGetDrawingArraySize001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingTypographyGetTextLines001", nullptr, OHDrawingTypographyGetTextLines001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingTypographyGetTextLines002", nullptr, OHDrawingTypographyGetTextLines002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingDestroyTextLine001", nullptr, OHDrawingDestroyTextLine001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingGetTextLineByIndex001", nullptr, OHDrawingGetTextLineByIndex001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingTextLineGetTextRange001", nullptr, OHDrawingTextLineGetTextRange001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingTextLineGetGlyphRuns001", nullptr, OHDrawingTextLineGetGlyphRuns001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingDestroyRuns001", nullptr, OHDrawingDestroyRuns001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingGetRunByIndex001", nullptr, OHDrawingGetRunByIndex001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingTextLinePaint001", nullptr, OHDrawingTextLinePaint001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingTextLineCreateTruncatedLine001", nullptr, OHDrawingTextLineCreateTruncatedLine001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingTextLineGetTypographicBounds001", nullptr, OHDrawingTextLineGetTypographicBounds001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingTextLineGetImageBounds001", nullptr, OHDrawingTextLineGetImageBounds001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingTextLineGetTrailingSpaceWidth001", nullptr, OHDrawingTextLineGetTrailingSpaceWidth001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingTextLineGetStringIndexForPosition001", nullptr, OHDrawingTextLineGetStringIndexForPosition001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingTextLineGetOffsetForStringIndex001", nullptr, OHDrawingTextLineGetOffsetForStringIndex001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingTextLineGetAlignmentOffset001", nullptr, OHDrawingTextLineGetAlignmentOffset001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingGetRunGlyphCount001", nullptr, OHDrawingGetRunGlyphCount001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingGetRunStringRange001", nullptr, OHDrawingGetRunStringRange001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingGetRunTypographicBounds001", nullptr, OHDrawingGetRunTypographicBounds001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingGetRunStringIndicesByIndex001", nullptr, OHDrawingGetRunStringIndicesByIndex001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingGetRunImageBounds001", nullptr, OHDrawingGetRunImageBounds001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingGetRunGlyphsByIndex001", nullptr, OHDrawingGetRunGlyphsByIndex001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingGetRunPositions001", nullptr, OHDrawingGetRunPositions001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDrawingGetFontCollectionGlobalInstance001", nullptr, OHDrawingGetFontCollectionGlobalInstance001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "nativeFontNdk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }