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
class DrawingRecordCmdUtilsFinishRecordingTest : public testing::Test {};

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECORDER_0300
 * @tc.name: testRecordCmdUtilsFinishRecordingNormal
 * @tc.desc: test for testRecordCmdUtilsFinishRecordingNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingRecordCmdUtilsFinishRecordingTest, testRecordCmdUtilsFinishRecordingNormal, TestSize.Level0) {
    // 1. None of the OH_Drawing_RecordCmdUtilsFinishRecording parameters are empty
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Canvas** canvass = &canvas;
    OH_Drawing_RecordCmd *recordCmd;
    OH_Drawing_RecordCmd **recordCmds = &recordCmd;
    OH_Drawing_RecordCmdUtils* recordcmdutil1 = OH_Drawing_RecordCmdUtilsCreate ();
    OH_Drawing_RecordCmdUtilsBeginRecording (recordcmdutil1, 1, 1, canvass);
    OH_Drawing_RecordCmdUtilsFinishRecording (recordcmdutil1, recordCmds);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_RECORDER_0301
 * @tc.name: testRecordCmdUtilsFinishRecordingNull
 * @tc.desc: test for testRecordCmdUtilsFinishRecordingNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingRecordCmdUtilsFinishRecordingTest, testRecordCmdUtilsFinishRecordingNull, TestSize.Level3) {
    // 1. OH-Drawing-RecordCmdUtelsFinishRecording, RecordCmd or RecordCmdUtils parameter is empty
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_Drawing_Canvas** canvass = &canvas;
    OH_Drawing_RecordCmd* recordCmd = nullptr;
    OH_Drawing_RecordCmd** recordCmds = &recordCmd;
    OH_Drawing_RecordCmdUtils* recordcmdutil1 = OH_Drawing_RecordCmdUtilsCreate ();
    OH_Drawing_RecordCmdUtilsBeginRecording (recordcmdutil1, 1, 1, canvass);
    OH_Drawing_RecordCmdUtilsFinishRecording (nullptr, recordCmds);
    OH_Drawing_RecordCmdUtilsBeginRecording (recordcmdutil1, 1, 1, canvass);
    OH_Drawing_RecordCmdUtilsFinishRecording (recordcmdutil1, nullptr);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
