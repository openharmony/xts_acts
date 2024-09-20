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
#include "drawing_brush.h"
#include "drawing_canvas.h"
#include "drawing_color.h"
#include "drawing_color_filter.h"
#include "drawing_filter.h"
#include "drawing_font.h"
#include "drawing_image.h"
#include "drawing_mask_filter.h"
#include "drawing_matrix.h"
#include "drawing_memory_stream.h"
#include "drawing_path.h"
#include "drawing_pen.h"
#include "drawing_point.h"
#include "drawing_rect.h"
#include "drawing_region.h"
#include "drawing_round_rect.h"
#include "drawing_sampling_options.h"
#include "drawing_shader_effect.h"
#include "drawing_text_blob.h"
#include "drawing_typeface.h"
#include "drawing_record_cmd.h"
#include "utils/scalar.h"
#include <random>

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingCanvasDrawRecordCmdTest : public testing::Test {};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECORDER_0500
 * @tc.name: testCanvasDrawRecordCmdAbNormal
 * @tc.desc: test for testCanvasDrawRecordCmdAbNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingCanvasDrawRecordCmdTest, testCanvasDrawRecordCmdAbNormal, TestSize.Level0) {
    // 1. The OH_Drawing_CanvasDrawRecordCmd parameter is not empty, and
    //the width and height of the canvas are smaller than the recorded canvas
    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_RecordCmdUtils *recordcmdutil = OH_Drawing_RecordCmdUtilsCreate ();
    OH_Drawing_Canvas **canvass = &canvas;
    OH_Drawing_RecordCmd *recordCmd = nullptr;
    OH_Drawing_RecordCmd **recordCmds = &recordCmd;
    int a= OH_Drawing_CanvasGetWidth (canvas);
    int b= OH_Drawing_CanvasGetHeight (canvas);
    OH_Drawing_RecordCmdUtilsBeginRecording (recordcmdutil, a-1, b-1, canvass);
    OH_Drawing_RecordCmdUtilsFinishRecording (recordcmdutil, recordCmds);
    // 2. The OH_Drawing_CanvasDrawRecordCmd parameter is not empty, and the width and height
    //of the canvas are bigger than the recorded canvas
    OH_Drawing_RecordCmdUtilsBeginRecording (recordcmdutil, a+1, b+1, canvass);
    OH_Drawing_RecordCmdUtilsFinishRecording (recordcmdutil, recordCmds);
    // 3. OH_Drawing_CanvasDrawRecordCmd parameters are not empty, and recordCmd
    //has a start recording-end recording
    OH_Drawing_RecordCmdUtilsBeginRecording (recordcmdutil, 1, 1, canvass);
    OH_Drawing_RecordCmdUtilsFinishRecording (recordcmdutil, recordCmds);
    // 4. OH_Drawing_CanvasDrawRecordCmd parameters are not empty, and recordCmd
    //has Start Recording-Draw Operation-End Recording
    OH_Drawing_RecordCmdUtilsBeginRecording (recordcmdutil, 1, 1, canvass);
    OH_Drawing_CanvasDrawRecordCmd (canvas, recordCmd);
    OH_Drawing_RecordCmdUtilsFinishRecording (recordcmdutil, recordCmds);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
