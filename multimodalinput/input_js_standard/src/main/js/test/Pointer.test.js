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

import pointer from '@ohos.multimodalInput.pointer'
import window from '@ohos.window'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
export default function MultimodalInput_Pointer_test() {
  describe('MultimodalInput_Pointer_test', function () {

    it('MultimodalInput_Pointer_test::PointerVisibleTest_001', 0, function () {
      console.info(`MultimodalInput_Pointer_test::SetPointerVisibleTest_001 enter`);
      try {
        pointer.setPointerVisible(false, (err, data) => {
          if (err) {
            console.info(`MultimodalInput_Pointer_test::SetPointerVisibleTest_001 failed, err=${JSON.stringify(err)}`);
            expect(false).assertTrue();
          } else {
            console.info(`MultimodalInput_Pointer_test::SetPointerVisibleTest_001 success. data=${JSON.stringify(data)}`);
            expect(true).assertTrue();
          }
        });
      } catch (error) {
        console.info(`MultimodalInput_Pointer_test::SetPointerVisibleTest_001 error`);
        expect(false).assertTrue();
      }
      try {
        pointer.isPointerVisible().then(data => {
          console.info(`MultimodalInput_Pointer_test::PointerVisibleTest_001 success, data=${JSON.stringify(data)}`);
          expect(data == false).assertTrue();
        }).catch((err) => {
          console.info(`MultimodalInput_Pointer_test::PointerVisibleTest_001 failed, err=${JSON.stringify(err)}`);
          expect(false).assertTrue();
        });
      } catch (error) {
        console.info(`MultimodalInput_Pointer_test::SetPointerVisibleTest_001 error`);
        expect(false).assertTrue();
      }
      console.info(`MultimodalInput_Pointer_test::PointerVisibleTest_001 exit`);
    })

    it('MultimodalInput_Pointer_test::PointerVisibleTest_002', 0, function () {
      console.info(`MultimodalInput_Pointer_test::PointerVisibleTest_002 enter`);
      try {
        pointer.setPointerVisible(true).then(data => {
          console.info(`MultimodalInput_Pointer_test::PointerVisibleTest_002 success, data=${JSON.stringify(data)}`);
          expect(true).assertTrue();
        }).catch((err) => {
          console.info(`MultimodalInput_Pointer_test::PointerVisibleTest_002 failed, err=${JSON.stringify(err)}`);
          expect(false).assertTrue();
        });
      } catch (error) {
        console.info(`MultimodalInput_Pointer_test::PointerVisibleTest_002 error`);
        expect(false).assertTrue();
      }
      try {
        pointer.isPointerVisible((err, data) => {
          if (err) {
            console.info(`MultimodalInput_Pointer_test::PointerVisibleTest_002 failed, err=${JSON.stringify(err)}`);
            expect(false).assertTrue();
          } else {
            console.info(`MultimodalInput_Pointer_test::PointerVisibleTest_002 success, data=${JSON.stringify(data)}`);
            expect(data == true).assertTrue();
          }
        });
      } catch (error) {
        console.info(`MultimodalInput_Pointer_test::PointerVisibleTest_002 error`);
        expect(false).assertTrue();
      }
      console.info(`MultimodalInput_Pointer_test::PointerVisibleTest_002 exit`);
    })

    it('MultimodalInput_Pointer_test::SetPointerStyle_001', 0, function () {
      console.info(`SetPointerStyle_001 enter`);
      window.getTopWindow((err, data) => {
        if (err) {
          console.info(`SetPointerStyle_001 failed, err=${JSON.stringify(err)}`);
          expect(false).assertTrue();
        }
        var windowClass = data;
        windowClass.getProperties((err, data) => {
          if (err) {
            console.info(`SetPointerStyle_001 failed, err=${JSON.stringify(err)}`);
            expect(false).assertTrue();
          }
          try {
            var windowId = data.id;
            pointer.setPointerStyle(windowId, 4).then(() => {
              expect(true).assertTrue();
              console.info(`SetPointerStyle_001 success`);
            }).catch((err) => {
              expect(false).assertTrue();
              console.info(`SetPointerStyle_001 failed, err=${JSON.stringify(err)}`);
            });
          } catch (error) {
            console.info(`SetPointerStyle_001 error`);
            expect(false).assertTrue();
          }
        })
      })
    })

    it('MultimodalInput_Pointer_test::SetPointerStyle_002', 0, function () {
      console.info(`SetPointerStyle_002 enter`);
      window.getTopWindow((err, data) => {
        var windowClass = data;
        if (err) {
          console.info(`SetPointerStyle_002 failed, err=${JSON.stringify(err)}`);
          expect(false).assertTrue();
        }
        windowClass.getProperties((err, data) => {
          if (err) {
            console.info(`SetPointerStyle_002 failed, err=${JSON.stringify(err)}`);
            expect(false).assertTrue();
          }
          try {
            var windowId = data.id;
            pointer.setPointerStyle(windowId, 4, (err) => {
              if (err) {
                console.info(`SetPointerStyle_002 failed, err=${JSON.stringify(err)}`);
                expect(false).assertTrue();
              } else {
                console.info(`SetPointerStyle_002 success`);
                expect(true).assertTrue();
              }
            });
          } catch (error) {
            console.info(`SetPointerStyle_002 error`);
            expect(false).assertTrue();
          }
        })
      })
    })

    it('MultimodalInput_Pointer_test::GetPointerStyle_001', 0, function () {
      console.info(`GetPointerStyle_001 enter`);
      window.getTopWindow((err, data) => {
        if (err) {
          console.info(`GetPointerStyle_001 failed, err=${JSON.stringify(err)}`);
          expect(false).assertTrue();
        }
        var windowClass = data;
        windowClass.getProperties((err, data) => {
          if (err) {
            console.info(`GetPointerStyle_001 failed, err=${JSON.stringify(err)}`);
            expect(false).assertTrue();
          }
          var windowId = data.id;
          try {
            pointer.getPointerStyle(windowId).then((data) => {
              console.info(`GetPointerStyle_001 success, data=${JSON.stringify(data)}`);
              expect(data).assertTrue('Number');
            }).catch((err) => {
              console.info(`GetPointerStyle_001 failed, err=${JSON.stringify(err)}`);
              expect(false).assertTrue();
            });
          } catch (error) {
            console.info(`GetPointerStyle_001 error`);
            expect(false).assertTrue();
          }
        })
      })
    })

    it('MultimodalInput_Pointer_test::GetPointerStyle_002', 0, function () {
      console.info(`GetPointerStyle_002 enter`);
      window.getTopWindow((err, data) => {
        if (err) {
          console.info(`GetPointerStyle_002 failed, err=${JSON.stringify(err)}`);
          expect(false).assertTrue();
        }
        var windowClass = data;
        windowClass.getProperties((err, data) => {
          if (err) {
            console.info(`GetPointerStyle_002 failed, err=${JSON.stringify(err)}`);
            expect(false).assertTrue();
          }
          try {
            var windowId = data.id;
            pointer.getPointerStyle(windowId, (err, data) => {
              if (err) {
                console.info(`GetPointerStyle_002 failed, err=${JSON.stringify(err)}`);
                expect(false).assertTrue();
              } else {
                console.info(`GetPointerStyle_002 success, data=${JSON.stringify(data)}`);
                expect(data).assertTrue('Number');
              }
            });
          } catch (error) {
            console.info(`GetPointerStyle_002 error`);
            expect(false).assertTrue();
          }
        })
      })
    })

    it('MultimodalInput_Pointer_test::Pointer_PointerStyle_test', 0, function () {
      console.info('MultimodalInput_Pointer_test::Pointer_PointerStyle_test = ' + pointer.PointerStyle.DEFAULT);
      expect(pointer.PointerStyle.DEFAULT == 0).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_EAST_test = ' + pointer.PointerStyle.EAST);
      expect(pointer.PointerStyle.EAST == 1).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_WEST_test = ' + pointer.PointerStyle.WEST);
      expect(pointer.PointerStyle.WEST == 2).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_SOUTH_test = ' + pointer.PointerStyle.SOUTH);
      expect(pointer.PointerStyle.SOUTH == 3).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_NORTH_test = ' + pointer.PointerStyle.NORTH);
      expect(pointer.PointerStyle.NORTH == 4).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_WEST_EAST_test = ' + pointer.PointerStyle.WEST_EAST);
      expect(pointer.PointerStyle.WEST_EAST == 5).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_NORTH_SOUTH_test = ' + pointer.PointerStyle.NORTH_SOUTH);
      expect(pointer.PointerStyle.NORTH_SOUTH == 6).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_NORTH_EAST_test = ' + pointer.PointerStyle.NORTH_EAST);
      expect(pointer.PointerStyle.NORTH_EAST == 7).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_NORTH_WEST_test = ' + pointer.PointerStyle.NORTH_WEST);
      expect(pointer.PointerStyle.NORTH_WEST == 8).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_SOUTH_EAST_test = ' + pointer.PointerStyle.SOUTH_EAST);
      expect(pointer.PointerStyle.SOUTH_EAST == 9).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_SOUTH_WEST_test = ' + pointer.PointerStyle.SOUTH_WEST);
      expect(pointer.PointerStyle.SOUTH_WEST == 10).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_NORTH_EAST_SOUTH_WEST_test = ' + pointer.PointerStyle.NORTH_EAST_SOUTH_WEST);
      expect(pointer.PointerStyle.NORTH_EAST_SOUTH_WEST == 11).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_NORTH_WEST_SOUTH_EAST_test = ' + pointer.PointerStyle.NORTH_WEST_SOUTH_EAST);
      expect(pointer.PointerStyle.NORTH_WEST_SOUTH_EAST == 12).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_CROSS_test = ' + pointer.PointerStyle.CROSS);
      expect(pointer.PointerStyle.CROSS == 13).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_CURSOR_COPY_test = ' + pointer.PointerStyle.CURSOR_COPY);
      expect(pointer.PointerStyle.CURSOR_COPY == 14).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_CURSOR_FORBID_test = ' + pointer.PointerStyle.CURSOR_FORBID);
      expect(pointer.PointerStyle.CURSOR_FORBID == 15).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_COLOR_SUCKER_test = ' + pointer.PointerStyle.COLOR_SUCKER);
      expect(pointer.PointerStyle.COLOR_SUCKER == 16).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_HAND_GRABBING_test = ' + pointer.PointerStyle.HAND_GRABBING);
      expect(pointer.PointerStyle.HAND_GRABBING == 17).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_HAND_OPEN_test = ' + pointer.PointerStyle.HAND_OPEN);
      expect(pointer.PointerStyle.HAND_OPEN == 18).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_HAND_POINTING_test = ' + pointer.PointerStyle.HAND_POINTING);
      expect(pointer.PointerStyle.HAND_POINTING == 19).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_HELP_test = ' + pointer.PointerStyle.HELP);
      expect(pointer.PointerStyle.HELP == 20).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_MOVE_test = ' + pointer.PointerStyle.MOVE);
      expect(pointer.PointerStyle.MOVE == 21).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_RESIZE_UP_DOWN_test = ' + pointer.PointerStyle.RESIZE_UP_DOWN);
      expect(pointer.PointerStyle.RESIZE_UP_DOWN == 22).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_RESIZE_LEFT_RIGHT_test = ' + pointer.PointerStyle.RESIZE_LEFT_RIGHT);
      expect(pointer.PointerStyle.RESIZE_LEFT_RIGHT == 23).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_SCREENSHOT_CHOOSE_test = ' + pointer.PointerStyle.SCREENSHOT_CHOOSE);
      expect(pointer.PointerStyle.SCREENSHOT_CHOOSE == 24).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_SCREENSHOT_CURSOR_test = ' + pointer.PointerStyle.SCREENSHOT_CURSOR);
      expect(pointer.PointerStyle.SCREENSHOT_CURSOR == 25).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_TEXT_CURSOR_test = ' + pointer.PointerStyle.TEXT_CURSOR);
      expect(pointer.PointerStyle.TEXT_CURSOR == 26).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_ZOOM_IN_test = ' + pointer.PointerStyle.ZOOM_IN);
      expect(pointer.PointerStyle.ZOOM_IN == 27).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_ZOOM_OUT_test = ' + pointer.PointerStyle.ZOOM_OUT);
      expect(pointer.PointerStyle.ZOOM_OUT == 28).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_MIDDLE_BTN_EAST_test = ' + pointer.PointerStyle.MIDDLE_BTN_EAST);
      expect(pointer.PointerStyle.MIDDLE_BTN_EAST == 29).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_MIDDLE_BTN_WEST_test = ' + pointer.PointerStyle.MIDDLE_BTN_WEST);
      expect(pointer.PointerStyle.MIDDLE_BTN_WEST == 30).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_MIDDLE_BTN_SOUTH_test = ' + pointer.PointerStyle.MIDDLE_BTN_SOUTH);
      expect(pointer.PointerStyle.MIDDLE_BTN_SOUTH == 31).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_MIDDLE_BTN_NORTH_test = ' + pointer.PointerStyle.MIDDLE_BTN_NORTH);
      expect(pointer.PointerStyle.MIDDLE_BTN_NORTH == 32).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_MIDDLE_BTN_NORTH_SOUTH_test = ' + pointer.PointerStyle.MIDDLE_BTN_NORTH_SOUTH);
      expect(pointer.PointerStyle.MIDDLE_BTN_NORTH_SOUTH == 33).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_MIDDLE_BTN_NORTH_EAST_test = ' + pointer.PointerStyle.MIDDLE_BTN_NORTH_EAST);
      expect(pointer.PointerStyle.MIDDLE_BTN_NORTH_EAST == 34).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_MIDDLE_BTN_NORTH_WEST_test = ' + pointer.PointerStyle.MIDDLE_BTN_NORTH_WEST);
      expect(pointer.PointerStyle.MIDDLE_BTN_NORTH_WEST == 35).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_MIDDLE_BTN_SOUTH_EAST_test = ' + pointer.PointerStyle.MIDDLE_BTN_SOUTH_EAST);
      expect(pointer.PointerStyle.MIDDLE_BTN_SOUTH_EAST == 36).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_MIDDLE_BTN_SOUTH_WEST_test = ' + pointer.PointerStyle.MIDDLE_BTN_SOUTH_WEST);
      expect(pointer.PointerStyle.MIDDLE_BTN_SOUTH_WEST == 37).assertTrue();

      console.info('MultimodalInput_Pointer_test::Pointer_MIDDLE_BTN_NORTH_SOUTH_WEST_EAST_test = ' + pointer.PointerStyle.MIDDLE_BTN_NORTH_SOUTH_WEST_EAST);
      expect(pointer.PointerStyle.MIDDLE_BTN_NORTH_SOUTH_WEST_EAST == 38).assertTrue();
    })
  })
}