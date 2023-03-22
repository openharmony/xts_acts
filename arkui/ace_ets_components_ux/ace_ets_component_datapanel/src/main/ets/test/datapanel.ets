/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
// @ts-nocheck
import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import hilog from '@ohos.hilog';

let emitKey = "emitUserAgent";

export default function datapanelTest() {
  describe('ActsDatapanelTest', function () {

    /**
     * @tc.number    ArkUX_Stage_DataPanel_ValueColors_0100
     * @tc.name      Tests the valueColors property of the DataPanel component
     * @tc.desc      DataPanel common components, set valueColors property parameter to
     *               ["#FFFF0000", "#FF00FF00", "#FF0000FF", "#FF000000"]
     */
    it('ArkUX_Stage_DataPanel_ValueColors_0100', 0, async function (done) {
      console.info('ArkUX_Stage_DataPanel_ValueColors_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_0100');
          console.info('ArkUX_Stage_DataPanel_ValueColors_0100 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0100 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0100 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.$attrs.valueColors));
          expect(obj.$attrs.valueColors[0][0].color).assertEqual("#FFFF0000");
          expect(obj.$attrs.valueColors[0][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[0][1].color).assertEqual("#FFFF0000");
          expect(obj.$attrs.valueColors[0][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[1][0].color).assertEqual("#FF00FF00");
          expect(obj.$attrs.valueColors[1][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[1][1].color).assertEqual("#FF00FF00");
          expect(obj.$attrs.valueColors[1][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[2][0].color).assertEqual("#FF0000FF");
          expect(obj.$attrs.valueColors[2][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[2][1].color).assertEqual("#FF0000FF");
          expect(obj.$attrs.valueColors[2][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[3][0].color).assertEqual("#FF000000");
          expect(obj.$attrs.valueColors[3][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[3][1].color).assertEqual("#FF000000");
          expect(obj.$attrs.valueColors[3][1].offset).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_DataPanel_ValueColors_0200
     * @tc.name      Tests the valueColors property of the DataPanel component
     * @tc.desc      DataPanel common components, set valueColors property parameter to
     *               ['rgb(255,0,0)', 'rgb(0,255,0)', 'rgb(0,0,255)', 'rgb(0,0,0)']
     */
    it('ArkUX_Stage_DataPanel_ValueColors_0200', 0, async function (done) {
      console.info('ArkUX_Stage_DataPanel_ValueColors_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_0200');
          console.info('ArkUX_Stage_DataPanel_ValueColors_0200 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0200 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0200 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.$attrs.valueColors));
          expect(obj.$attrs.valueColors[0][0].color).assertEqual("#FFFF0000");
          expect(obj.$attrs.valueColors[0][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[0][1].color).assertEqual("#FFFF0000");
          expect(obj.$attrs.valueColors[0][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[1][0].color).assertEqual("#FF00FF00");
          expect(obj.$attrs.valueColors[1][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[1][1].color).assertEqual("#FF00FF00");
          expect(obj.$attrs.valueColors[1][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[2][0].color).assertEqual("#FF0000FF");
          expect(obj.$attrs.valueColors[2][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[2][1].color).assertEqual("#FF0000FF");
          expect(obj.$attrs.valueColors[2][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[3][0].color).assertEqual("#FF000000");
          expect(obj.$attrs.valueColors[3][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[3][1].color).assertEqual("#FF000000");
          expect(obj.$attrs.valueColors[3][1].offset).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_DataPanel_ValueColors_0300
     * @tc.name      Tests the valueColors property of the DataPanel component
     * @tc.desc      DataPanel common components, set valueColors property parameter to
     *               [Color.Red, Color.Green, Color.Blue, Color.Black]
     */
    it('ArkUX_Stage_DataPanel_ValueColors_0300', 0, async function (done) {
      console.info('ArkUX_Stage_DataPanel_ValueColors_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_0300');
          console.info('ArkUX_Stage_DataPanel_ValueColors_0300 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0300 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0300 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.$attrs.valueColors));
          expect(obj.$attrs.valueColors[0][0].color).assertEqual("#FFFF0000");
          expect(obj.$attrs.valueColors[0][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[0][1].color).assertEqual("#FFFF0000");
          expect(obj.$attrs.valueColors[0][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[1][0].color).assertEqual("#FF008000");
          expect(obj.$attrs.valueColors[1][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[1][1].color).assertEqual("#FF008000");
          expect(obj.$attrs.valueColors[1][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[2][0].color).assertEqual("#FF0000FF");
          expect(obj.$attrs.valueColors[2][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[2][1].color).assertEqual("#FF0000FF");
          expect(obj.$attrs.valueColors[2][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[3][0].color).assertEqual("#FF000000");
          expect(obj.$attrs.valueColors[3][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[3][1].color).assertEqual("#FF000000");
          expect(obj.$attrs.valueColors[3][1].offset).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_DataPanel_ValueColors_0400
     * @tc.name      Tests the valueColors property of the DataPanel component
     * @tc.desc      DataPanel common components, set valueColors property parameter to
     *               [$r("app.color.DataPanel_ValueColors1"), $r("app.color.DataPanel_ValueColors2"),
     *               $r("app.color.DataPanel_ValueColors3"), $r("app.color.DataPanel_ValueColors4")]
     */
    it('ArkUX_Stage_DataPanel_ValueColors_0400', 0, async function (done) {
      console.info('ArkUX_Stage_DataPanel_ValueColors_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_0400');
          console.info('ArkUX_Stage_DataPanel_ValueColors_0400 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          let valueColors = obj.$attrs.valueColors;
          console.info("ArkUX_Stage_DataPanel_ValueColors_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0400 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0400 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.$attrs.valueColors));
          hilog.info(0x0000, 'testTag', '%{public}s', JSON.stringify(valueColors));
          expect(obj.$attrs.valueColors[0][0].color).assertEqual("#FFFF0000");
          expect(obj.$attrs.valueColors[0][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[0][1].color).assertEqual("#FFFF0000");
          expect(obj.$attrs.valueColors[0][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[1][0].color).assertEqual("#FF00FF00");
          expect(obj.$attrs.valueColors[1][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[1][1].color).assertEqual("#FF00FF00");
          expect(obj.$attrs.valueColors[1][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[2][0].color).assertEqual("#FF0000FF");
          expect(obj.$attrs.valueColors[2][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[2][1].color).assertEqual("#FF0000FF");
          expect(obj.$attrs.valueColors[2][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[3][0].color).assertEqual("#FF000000");
          expect(obj.$attrs.valueColors[3][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[3][1].color).assertEqual("#FF000000");
          expect(obj.$attrs.valueColors[3][1].offset).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_DataPanel_ValueColors_0500
     * @tc.name      Tests the valueColors property of the DataPanel component
     * @tc.desc      DataPanel common components, set valueColors property parameter to
     *               ["#FFFF0000", "#FF00FF00", "#FF0000FF", "#FF000000"]
     */
    it('ArkUX_Stage_DataPanel_ValueColors_0500', 0, async function (done) {
      console.info('ArkUX_Stage_DataPanel_ValueColors_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_0500');
          console.info('ArkUX_Stage_DataPanel_ValueColors_0500 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0500 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0500 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.$attrs.valueColors));
          expect(obj.$attrs.valueColors[0][0].color).assertEqual("#FFFF0000");
          expect(obj.$attrs.valueColors[0][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[0][1].color).assertEqual("#FFFF0000");
          expect(obj.$attrs.valueColors[0][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[1][0].color).assertEqual("#FF00FF00");
          expect(obj.$attrs.valueColors[1][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[1][1].color).assertEqual("#FF00FF00");
          expect(obj.$attrs.valueColors[1][1].offset).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_DataPanel_ValueColors_0600
     * @tc.name      Tests the valueColors property of the DataPanel component
     * @tc.desc      DataPanel common components, set valueColors property parameter to
     *               ["#FF000000", "#FFFF0000", "#FF00FF00"]
     */
    it('ArkUX_Stage_DataPanel_ValueColors_0600', 0, async function (done) {
      console.info('ArkUX_Stage_DataPanel_ValueColors_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_0600');
          console.info('ArkUX_Stage_DataPanel_ValueColors_0600 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0600 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0600 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.$attrs.valueColors));
          expect(obj.$attrs.valueColors[0][0].color).assertEqual("#FF000000");
          expect(obj.$attrs.valueColors[0][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[0][1].color).assertEqual("#FF000000");
          expect(obj.$attrs.valueColors[0][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[1][0].color).assertEqual("#FFFF0000");
          expect(obj.$attrs.valueColors[1][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[1][1].color).assertEqual("#FFFF0000");
          expect(obj.$attrs.valueColors[1][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[2][0].color).assertEqual("#FF00FF00");
          expect(obj.$attrs.valueColors[2][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[2][1].color).assertEqual("#FF00FF00");
          expect(obj.$attrs.valueColors[2][1].offset).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_0600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_DataPanel_ValueColors_0700
     * @tc.name      Tests the valueColors property of the DataPanel component
     * @tc.desc      DataPanel common components, set valueColors property parameter to
     *               ['rgb(255,0,0)', 'rgb(0,255,0)', 'rgb(0,0,255)', 'rgb(0,0,0)']
     *               DataPanel common components, set valueColors property once more parameter to
     *               [Color.Red, Color.Green, Color.Blue, Color.Black]
     */
    it('ArkUX_Stage_DataPanel_ValueColors_0700', 0, async function (done) {
      console.info('ArkUX_Stage_DataPanel_ValueColors_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_0700');
          console.info('ArkUX_Stage_DataPanel_ValueColors_0700 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0700 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0700 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.$attrs.valueColors));
          expect(obj.$attrs.valueColors[0][0].color).assertEqual("#FFFF0000");
          expect(obj.$attrs.valueColors[0][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[0][1].color).assertEqual("#FFFF0000");
          expect(obj.$attrs.valueColors[0][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[1][0].color).assertEqual("#FF008000");
          expect(obj.$attrs.valueColors[1][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[1][1].color).assertEqual("#FF008000");
          expect(obj.$attrs.valueColors[1][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[2][0].color).assertEqual("#FF0000FF");
          expect(obj.$attrs.valueColors[2][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[2][1].color).assertEqual("#FF0000FF");
          expect(obj.$attrs.valueColors[2][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[3][0].color).assertEqual("#FF000000");
          expect(obj.$attrs.valueColors[3][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[3][1].color).assertEqual("#FF000000");
          expect(obj.$attrs.valueColors[3][1].offset).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_DataPanel_ValueColors_0800
     * @tc.name      Tests the valueColors property of the DataPanel component
     * @tc.desc      DataPanel common components, set valueColors property parameter to
     *               ["#FFFF0000", "#FF00FF00", "#FF0000FF", "#FF000000"]
     *               set the general attribute backgroundColor parameter to Color.Pink
     */
    it('ArkUX_Stage_DataPanel_ValueColors_0800', 0, async function (done) {
      console.info('ArkUX_Stage_DataPanel_ValueColors_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_0800');
          console.info('ArkUX_Stage_DataPanel_ValueColors_0800 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0800 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0800 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.$attrs.valueColors));
          expect(obj.$attrs.valueColors[0][0].color).assertEqual("#FFFF0000");
          expect(obj.$attrs.valueColors[0][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[0][1].color).assertEqual("#FFFF0000");
          expect(obj.$attrs.valueColors[0][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[1][0].color).assertEqual("#FF00FF00");
          expect(obj.$attrs.valueColors[1][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[1][1].color).assertEqual("#FF00FF00");
          expect(obj.$attrs.valueColors[1][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[2][0].color).assertEqual("#FF0000FF");
          expect(obj.$attrs.valueColors[2][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[2][1].color).assertEqual("#FF0000FF");
          expect(obj.$attrs.valueColors[2][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[3][0].color).assertEqual("#FF000000");
          expect(obj.$attrs.valueColors[3][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[3][1].color).assertEqual("#FF000000");
          expect(obj.$attrs.valueColors[3][1].offset).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_0800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_DataPanel_ValueColors_0900
     * @tc.name      Tests the valueColors property of the DataPanel component
     * @tc.desc      DataPanel common components, set valueColors property parameter to
     *               ['rgb(255,0,0)', 'rgb(0,255,0)', 'rgb(0,0,255)', 'rgb(0,0,0)'],
     *               and set the valueColors parameter to undefined
     */
    it('ArkUX_Stage_DataPanel_ValueColors_0900', 0, async function (done) {
      console.info('ArkUX_Stage_DataPanel_ValueColors_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_0900');
          console.info('ArkUX_Stage_DataPanel_ValueColors_0900 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0900 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_DataPanel_ValueColors_0900 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.$attrs.valueColors));
          expect(obj.$attrs.valueColors[0][0].color).assertEqual("#FFF7CE00");
          expect(obj.$attrs.valueColors[0][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[0][1].color).assertEqual("#FFF99B11");
          expect(obj.$attrs.valueColors[0][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[1][0].color).assertEqual("#FFF76223");
          expect(obj.$attrs.valueColors[1][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[1][1].color).assertEqual("#FFF2400A");
          expect(obj.$attrs.valueColors[1][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[2][0].color).assertEqual("#FFF772AC");
          expect(obj.$attrs.valueColors[2][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[2][1].color).assertEqual("#FFE65392");
          expect(obj.$attrs.valueColors[2][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[3][0].color).assertEqual("#FFA575EB");
          expect(obj.$attrs.valueColors[3][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[3][1].color).assertEqual("#FFA12DF7");
          expect(obj.$attrs.valueColors[3][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[4][0].color).assertEqual("#FF7B79F7");
          expect(obj.$attrs.valueColors[4][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[4][1].color).assertEqual("#FF4B48F7");
          expect(obj.$attrs.valueColors[4][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[5][0].color).assertEqual("#FF4B8AF3");
          expect(obj.$attrs.valueColors[5][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[5][1].color).assertEqual("#FF007DFF");
          expect(obj.$attrs.valueColors[5][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[6][0].color).assertEqual("#FF73C1E6");
          expect(obj.$attrs.valueColors[6][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[6][1].color).assertEqual("#FF4FB4E3");
          expect(obj.$attrs.valueColors[6][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[7][0].color).assertEqual("#FFA5D61D");
          expect(obj.$attrs.valueColors[7][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[7][1].color).assertEqual("#FF69D14F");
          expect(obj.$attrs.valueColors[7][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[8][0].color).assertEqual("#FFA2A2B0");
          expect(obj.$attrs.valueColors[8][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[8][1].color).assertEqual("#FF8E8E93");
          expect(obj.$attrs.valueColors[8][1].offset).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_0900 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_0900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_DataPanel_ValueColors_1000
     * @tc.name      Tests the valueColors property of the DataPanel component
     * @tc.desc      DataPanel common components, set valueColors property parameter to
     *               [{ color: "#FFA500", offset: 0 }, { color: "#FFFFFF00", offset: 1 }];
     *               [{ color: "#FFC0CB", offset: 0 }, { color: "#FF00FF00", offset: 1 }]
     *               [{ color: "#FF0000FF", offset: 0 }, { color: "#FFFF0000", offset: 1 }]
     */
    it('ArkUX_Stage_DataPanel_ValueColors_1000', 0, async function (done) {
      console.info('ArkUX_Stage_DataPanel_ValueColors_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_1000');
          console.info('ArkUX_Stage_DataPanel_ValueColors_1000 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1000 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1000 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.$attrs.valueColors));
          expect(obj.$attrs.valueColors[0][0].color).assertEqual("#FFFFA500");
          expect(obj.$attrs.valueColors[0][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[0][1].color).assertEqual("#FFFFFF00");
          expect(obj.$attrs.valueColors[0][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[1][0].color).assertEqual("#FFFFC0CB");
          expect(obj.$attrs.valueColors[1][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[1][1].color).assertEqual("#FF00FF00");
          expect(obj.$attrs.valueColors[1][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[2][0].color).assertEqual("#FF0000FF");
          expect(obj.$attrs.valueColors[2][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[2][1].color).assertEqual("#FFFF0000");
          expect(obj.$attrs.valueColors[2][1].offset).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_1000 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_1000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_DataPanel_ValueColors_1100
     * @tc.name      Tests the valueColors property of the DataPanel component
     * @tc.desc      DataPanel common components, set valueColors property parameter to
     *               [{ color: 'rgb(255,165,0)', offset: 0 }, { color: 'rgb(255,255,0)', offset: 1 }]
     *               [{ color: 'rgb(255,192,203)', offset: 0 }, { color: 'rgb(0,128,0)', offset: 1 }]
     *               [{ color: 'rgb(0,0,255)', offset: 0 }, { color: 'rgb(255,0,0)', offset: 1 }]
     */
    it('ArkUX_Stage_DataPanel_ValueColors_1100', 0, async function (done) {
      console.info('ArkUX_Stage_DataPanel_ValueColors_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_1100');
          console.info('ArkUX_Stage_DataPanel_ValueColors_1100 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1100 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1100 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.$attrs.valueColors));
          expect(obj.$attrs.valueColors[0][0].color).assertEqual("#FFFFA500");
          expect(obj.$attrs.valueColors[0][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[0][1].color).assertEqual("#FFFFFF00");
          expect(obj.$attrs.valueColors[0][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[1][0].color).assertEqual("#FFFFC0CB");
          expect(obj.$attrs.valueColors[1][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[1][1].color).assertEqual("#FF008000");
          expect(obj.$attrs.valueColors[1][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[2][0].color).assertEqual("#FF0000FF");
          expect(obj.$attrs.valueColors[2][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[2][1].color).assertEqual("#FFFF0000");
          expect(obj.$attrs.valueColors[2][1].offset).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_1100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_1100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_DataPanel_ValueColors_1200
     * @tc.name      Tests the valueColors property of the DataPanel component
     * @tc.desc      DataPanel common components, set valueColors property parameter to
     *               [{ color: Color.Orange, offset: 0 }, { color: Color.Yellow, offset: 1 }]
     *               [{ color: Color.Pink, offset: 0 }, { color: Color.Green, offset: 1 }]
     *               [{ color: Color.Blue, offset: 0 }, { color: Color.Red, offset: 1 }]
     */
    it('ArkUX_Stage_DataPanel_ValueColors_1200', 0, async function (done) {
      console.info('ArkUX_Stage_DataPanel_ValueColors_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_1200');
          console.info('ArkUX_Stage_DataPanel_ValueColors_1200 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1200 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1200 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.$attrs.valueColors));
          expect(obj.$attrs.valueColors[0][0].color).assertEqual("#FFFFA500");
          expect(obj.$attrs.valueColors[0][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[0][1].color).assertEqual("#FFFFFF00");
          expect(obj.$attrs.valueColors[0][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[1][0].color).assertEqual("#FFFFC0CB");
          expect(obj.$attrs.valueColors[1][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[1][1].color).assertEqual("#FF008000");
          expect(obj.$attrs.valueColors[1][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[2][0].color).assertEqual("#FF0000FF");
          expect(obj.$attrs.valueColors[2][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[2][1].color).assertEqual("#FFFF0000");
          expect(obj.$attrs.valueColors[2][1].offset).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_1200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_1200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_DataPanel_ValueColors_1300
     * @tc.name      Tests the valueColors property of the DataPanel component
     * @tc.desc      DataPanel common components, set valueColors property parameter to
     *               [$r("app.color.DataPanel_ValueColors5"), $r("app.color.DataPanel_ValueColors6"),
     *               $r("app.color.DataPanel_ValueColors7"), $r("app.color.DataPanel_ValueColors8"),
     *               $r("app.color.DataPanel_ValueColors9"), $r("app.color.DataPanel_ValueColors10")]
     */
    it('ArkUX_Stage_DataPanel_ValueColors_1300', 0, async function (done) {
      console.info('ArkUX_Stage_DataPanel_ValueColors_1300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_1300');
          console.info('ArkUX_Stage_DataPanel_ValueColors_1300 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          let valueColors = obj.$attrs.valueColors;
          console.info("ArkUX_Stage_DataPanel_ValueColors_1300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1300 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1300 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.$attrs.valueColors));
          hilog.info(0x0000, 'testTag', '%{public}s', JSON.stringify(valueColors));
          expect(obj.$attrs.valueColors[0][0].color).assertEqual("#FFFFA500");
          expect(obj.$attrs.valueColors[0][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[0][1].color).assertEqual("#FFFFA500");
          expect(obj.$attrs.valueColors[0][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[1][0].color).assertEqual("#FFFFFF00");
          expect(obj.$attrs.valueColors[1][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[1][1].color).assertEqual("#FFFFFF00");
          expect(obj.$attrs.valueColors[1][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[2][0].color).assertEqual("#FFFFC0CB");
          expect(obj.$attrs.valueColors[2][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[2][1].color).assertEqual("#FFFFC0CB");
          expect(obj.$attrs.valueColors[2][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[3][0].color).assertEqual("#FF00FF00");
          expect(obj.$attrs.valueColors[3][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[3][1].color).assertEqual("#FF00FF00");
          expect(obj.$attrs.valueColors[3][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[4][0].color).assertEqual("#FF0000FF");
          expect(obj.$attrs.valueColors[4][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[4][1].color).assertEqual("#FF0000FF");
          expect(obj.$attrs.valueColors[4][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[5][0].color).assertEqual("#FFFF0000");
          expect(obj.$attrs.valueColors[5][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[5][1].color).assertEqual("#FFFF0000");
          expect(obj.$attrs.valueColors[5][1].offset).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_1300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_1300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_DataPanel_ValueColors_1400
     * @tc.name      Tests the valueColors property of the DataPanel component
     * @tc.desc      DataPanel common components, set valueColors property parameter to
     *               [{ color: 'rgb(255,165,0)', offset: 0 }, { color: 'rgb(255,255,0)', offset: 1 }]
     *               [{ color: 'rgb(255,192,203)', offset: 0 }, { color: 'rgb(0,128,0)', offset: 1 }]
     *               [{ color: 'rgb(0,0,255)', offset: 0 }, { color: 'rgb(255,0,0)', offset: 1 }],
     *               and set the valueColors parameter to
     *               [{ color: Color.Orange, offset: 0 }, { color: Color.Yellow, offset: 1 }]
     *               [{ color: Color.Pink, offset: 0 }, { color: Color.Green, offset: 1 }]
     *               [{ color: Color.Blue, offset: 0 }, { color: Color.Red, offset: 1 }]
     */
    it('ArkUX_Stage_DataPanel_ValueColors_1400', 0, async function (done) {
      console.info('ArkUX_Stage_DataPanel_ValueColors_1400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_1400');
          console.info('ArkUX_Stage_DataPanel_ValueColors_1400 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_1400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1400 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1400 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.$attrs.valueColors));
          expect(obj.$attrs.valueColors[0][0].color).assertEqual("#FFFFA500");
          expect(obj.$attrs.valueColors[0][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[0][1].color).assertEqual("#FFFFFF00");
          expect(obj.$attrs.valueColors[0][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[1][0].color).assertEqual("#FFFFC0CB");
          expect(obj.$attrs.valueColors[1][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[1][1].color).assertEqual("#FF008000");
          expect(obj.$attrs.valueColors[1][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[2][0].color).assertEqual("#FF0000FF");
          expect(obj.$attrs.valueColors[2][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[2][1].color).assertEqual("#FFFF0000");
          expect(obj.$attrs.valueColors[2][1].offset).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_1400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_1400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_DataPanel_ValueColors_1500
     * @tc.name      Tests the valueColors property of the DataPanel component
     * @tc.desc      DataPanel common components, set valueColors property parameter to
     *               [{ color: "#FFA500", offset: 0 }, { color: "#FFFFFF00", offset: 1 }]
     *               [{ color: "#FFC0CB", offset: 0 }, { color: "#FF00FF00", offset: 1 }]
     *               [{ color: "#FF0000FF", offset: 0 }, { color: "#FFFF0000", offset: 1 }]
     *               set the general attribute backgroundColor parameter to Color.Green
     */
    it('ArkUX_Stage_DataPanel_ValueColors_1500', 0, async function (done) {
      console.info('ArkUX_Stage_DataPanel_ValueColors_1500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_1500');
          console.info('ArkUX_Stage_DataPanel_ValueColors_1500 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_1500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1500 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1500 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.$attrs.valueColors));
          expect(obj.$attrs.valueColors[0][0].color).assertEqual("#FFFFA500");
          expect(obj.$attrs.valueColors[0][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[0][1].color).assertEqual("#FFFFFF00");
          expect(obj.$attrs.valueColors[0][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[1][0].color).assertEqual("#FFFFC0CB");
          expect(obj.$attrs.valueColors[1][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[1][1].color).assertEqual("#FF00FF00");
          expect(obj.$attrs.valueColors[1][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[2][0].color).assertEqual("#FF0000FF");
          expect(obj.$attrs.valueColors[2][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[2][1].color).assertEqual("#FFFF0000");
          expect(obj.$attrs.valueColors[2][1].offset).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_1500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_1500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_DataPanel_ValueColors_1600
     * @tc.name      Tests the valueColors property of the DataPanel component
     * @tc.desc      DataPanel common components, set valueColors property parameter to
     *               [{ color: 'rgb(255,165,0)', offset: 0 }, { color: 'rgb(255,255,0)', offset: 1 }],
     *               [{ color: 'rgb(255,192,203)', offset: 0 }, { color: 'rgb(0,128,0)', offset: 1 }],
     *               [{ color: 'rgb(0,0,255)', offset: 0 }, { color: 'rgb(255,0,0)', offset: 1 }]
     *               and set the valueColors parameter to undefined
     */
    it('ArkUX_Stage_DataPanel_ValueColors_1600', 0, async function (done) {
      console.info('ArkUX_Stage_DataPanel_ValueColors_1600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_1600');
          console.info('ArkUX_Stage_DataPanel_ValueColors_1600 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_1600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1600 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1600 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.$attrs.valueColors));
          expect(obj.$attrs.valueColors[0][0].color).assertEqual("#FFF7CE00");
          expect(obj.$attrs.valueColors[0][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[0][1].color).assertEqual("#FFF99B11");
          expect(obj.$attrs.valueColors[0][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[1][0].color).assertEqual("#FFF76223");
          expect(obj.$attrs.valueColors[1][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[1][1].color).assertEqual("#FFF2400A");
          expect(obj.$attrs.valueColors[1][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[2][0].color).assertEqual("#FFF772AC");
          expect(obj.$attrs.valueColors[2][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[2][1].color).assertEqual("#FFE65392");
          expect(obj.$attrs.valueColors[2][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[3][0].color).assertEqual("#FFA575EB");
          expect(obj.$attrs.valueColors[3][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[3][1].color).assertEqual("#FFA12DF7");
          expect(obj.$attrs.valueColors[3][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[4][0].color).assertEqual("#FF7B79F7");
          expect(obj.$attrs.valueColors[4][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[4][1].color).assertEqual("#FF4B48F7");
          expect(obj.$attrs.valueColors[4][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[5][0].color).assertEqual("#FF4B8AF3");
          expect(obj.$attrs.valueColors[5][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[5][1].color).assertEqual("#FF007DFF");
          expect(obj.$attrs.valueColors[5][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[6][0].color).assertEqual("#FF73C1E6");
          expect(obj.$attrs.valueColors[6][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[6][1].color).assertEqual("#FF4FB4E3");
          expect(obj.$attrs.valueColors[6][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[7][0].color).assertEqual("#FFA5D61D");
          expect(obj.$attrs.valueColors[7][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[7][1].color).assertEqual("#FF69D14F");
          expect(obj.$attrs.valueColors[7][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[8][0].color).assertEqual("#FFA2A2B0");
          expect(obj.$attrs.valueColors[8][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[8][1].color).assertEqual("#FF8E8E93");
          expect(obj.$attrs.valueColors[8][1].offset).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_1600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_1600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_DataPanel_ValueColors_1700
     * @tc.name      Tests the valueColors property of the DataPanel component
     * @tc.desc      DataPanel common components, set valueColors property parameter to
     *               ["#01FFA500", "#4CFFFF00", "#9AFFC0CB", "#FF00FF00"]
     */
    it('ArkUX_Stage_DataPanel_ValueColors_1700', 0, async function (done) {
      console.info('ArkUX_Stage_DataPanel_ValueColors_1700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_1700');
          console.info('ArkUX_Stage_DataPanel_ValueColors_1700 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_1700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1700 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1700 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.$attrs.valueColors));
          expect(obj.$attrs.valueColors[0][0].color).assertEqual("#01FFA500");
          expect(obj.$attrs.valueColors[0][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[0][1].color).assertEqual("#01FFA500");
          expect(obj.$attrs.valueColors[0][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[1][0].color).assertEqual("#4CFFFF00");
          expect(obj.$attrs.valueColors[1][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[1][1].color).assertEqual("#4CFFFF00");
          expect(obj.$attrs.valueColors[1][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[2][0].color).assertEqual("#9AFFC0CB");
          expect(obj.$attrs.valueColors[2][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[2][1].color).assertEqual("#9AFFC0CB");
          expect(obj.$attrs.valueColors[2][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[3][0].color).assertEqual("#FF00FF00");
          expect(obj.$attrs.valueColors[3][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[3][1].color).assertEqual("#FF00FF00");
          expect(obj.$attrs.valueColors[3][1].offset).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_1700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_1700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_DataPanel_ValueColors_1800
     * @tc.name      Tests the valueColors property of the DataPanel component
     * @tc.desc      DataPanel common components, set valueColors property parameter to
     *               ['rgba(255,165,0,0)', 'rgba(255,255,0,0)', 'rgba(255,192,203,0)', 'rgba(0,128,0,0)']
     */
    it('ArkUX_Stage_DataPanel_ValueColors_1800', 0, async function (done) {
      console.info('ArkUX_Stage_DataPanel_ValueColors_1800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_1800');
          console.info('ArkUX_Stage_DataPanel_ValueColors_1800 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_1800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1800 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1800 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.$attrs.valueColors));
          expect(obj.$attrs.valueColors[0][0].color).assertEqual("#00FFA500");
          expect(obj.$attrs.valueColors[0][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[0][1].color).assertEqual("#00FFA500");
          expect(obj.$attrs.valueColors[0][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[1][0].color).assertEqual("#00FFFF00");
          expect(obj.$attrs.valueColors[1][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[1][1].color).assertEqual("#00FFFF00");
          expect(obj.$attrs.valueColors[1][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[2][0].color).assertEqual("#00FFC0CB");
          expect(obj.$attrs.valueColors[2][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[2][1].color).assertEqual("#00FFC0CB");
          expect(obj.$attrs.valueColors[2][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[3][0].color).assertEqual("#00008000");
          expect(obj.$attrs.valueColors[3][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[3][1].color).assertEqual("#00008000");
          expect(obj.$attrs.valueColors[3][1].offset).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_1800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_1800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_DataPanel_ValueColors_1900
     * @tc.name      Tests the valueColors property of the DataPanel component
     * @tc.desc      DataPanel common components, set valueColors property parameter to
     *               [Color.Orange, Color.Yellow, Color.Pink, Color.Green]
     */
    it('ArkUX_Stage_DataPanel_ValueColors_1900', 0, async function (done) {
      console.info('ArkUX_Stage_DataPanel_ValueColors_1900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_1900');
          console.info('ArkUX_Stage_DataPanel_ValueColors_1900 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_1900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1900 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_DataPanel_ValueColors_1900 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.$attrs.valueColors));
          expect(obj.$attrs.valueColors[0][0].color).assertEqual("#FFFFA500");
          expect(obj.$attrs.valueColors[0][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[0][1].color).assertEqual("#FFFFA500");
          expect(obj.$attrs.valueColors[0][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[1][0].color).assertEqual("#FFFFFF00");
          expect(obj.$attrs.valueColors[1][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[1][1].color).assertEqual("#FFFFFF00");
          expect(obj.$attrs.valueColors[1][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[2][0].color).assertEqual("#FFFFC0CB");
          expect(obj.$attrs.valueColors[2][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[2][1].color).assertEqual("#FFFFC0CB");
          expect(obj.$attrs.valueColors[2][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[3][0].color).assertEqual("#FF008000");
          expect(obj.$attrs.valueColors[3][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[3][1].color).assertEqual("#FF008000");
          expect(obj.$attrs.valueColors[3][1].offset).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_1900 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_1900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_DataPanel_ValueColors_2000
     * @tc.name      Tests the valueColors property of the DataPanel component
     * @tc.desc      DataPanel common components, set valueColors property parameter to
     *               [$r("app.color.DataPanel_ValueColors11"), $r("app.color.DataPanel_ValueColors12"),
     *               $r("app.color.DataPanel_ValueColors13"), $r("app.color.DataPanel_ValueColors14")]
     */
    it('ArkUX_Stage_DataPanel_ValueColors_2000', 0, async function (done) {
      console.info('ArkUX_Stage_DataPanel_ValueColors_2000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_2000');
          console.info('ArkUX_Stage_DataPanel_ValueColors_2000 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          let valueColors = obj.$attrs.valueColors;
          console.info("ArkUX_Stage_DataPanel_ValueColors_2000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_2000 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_DataPanel_ValueColors_2000 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.$attrs.valueColors));
          hilog.info(0x0000, 'testTag', '%{public}s', JSON.stringify(valueColors));
          expect(obj.$attrs.valueColors[0][0].color).assertEqual("#01FFA500");
          expect(obj.$attrs.valueColors[0][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[0][1].color).assertEqual("#01FFA500");
          expect(obj.$attrs.valueColors[0][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[1][0].color).assertEqual("#4CFF0000");
          expect(obj.$attrs.valueColors[1][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[1][1].color).assertEqual("#4CFF0000");
          expect(obj.$attrs.valueColors[1][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[2][0].color).assertEqual("#9AC0CB00");
          expect(obj.$attrs.valueColors[2][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[2][1].color).assertEqual("#9AC0CB00");
          expect(obj.$attrs.valueColors[2][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[3][0].color).assertEqual("#FF00FF00");
          expect(obj.$attrs.valueColors[3][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[3][1].color).assertEqual("#FF00FF00");
          expect(obj.$attrs.valueColors[3][1].offset).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_2000 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_2000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_DataPanel_ValueColors_2100
     * @tc.name      Tests the valueColors property of the DataPanel component
     * @tc.desc      DataPanel common components, set valueColors property parameter to
     *               ['rgba(255,165,0,0)', 'rgba(255,255,0,0)', 'rgba(255,192,203,0)', 'rgba(0,128,0,0)'],
     *               and set the valueColors parameter to [Color.Orange, Color.Yellow, Color.Pink, Color.Green]
     */
    it('ArkUX_Stage_DataPanel_ValueColors_2100', 0, async function (done) {
      console.info('ArkUX_Stage_DataPanel_ValueColors_2100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_2100');
          console.info('ArkUX_Stage_DataPanel_ValueColors_2100 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_2100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_2100 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_DataPanel_ValueColors_2100 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.$attrs.valueColors));
          expect(obj.$attrs.valueColors[0][0].color).assertEqual("#FFFFA500");
          expect(obj.$attrs.valueColors[0][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[0][1].color).assertEqual("#FFFFA500");
          expect(obj.$attrs.valueColors[0][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[1][0].color).assertEqual("#FFFFFF00");
          expect(obj.$attrs.valueColors[1][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[1][1].color).assertEqual("#FFFFFF00");
          expect(obj.$attrs.valueColors[1][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[2][0].color).assertEqual("#FFFFC0CB");
          expect(obj.$attrs.valueColors[2][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[2][1].color).assertEqual("#FFFFC0CB");
          expect(obj.$attrs.valueColors[2][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[3][0].color).assertEqual("#FF008000");
          expect(obj.$attrs.valueColors[3][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[3][1].color).assertEqual("#FF008000");
          expect(obj.$attrs.valueColors[3][1].offset).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_2100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_2100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_DataPanel_ValueColors_2200
     * @tc.name      Tests the valueColors property of the DataPanel component
     * @tc.desc      DataPanel common components, set valueColors property parameter to
     *               ["#01FFA500", "#4CFFFF00", "#9AFFC0CB", "#FF00FF00"],
     *               set the general attribute backgroundColor parameter to Color.Green
     */
    it('ArkUX_Stage_DataPanel_ValueColors_2200', 0, async function (done) {
      console.info('ArkUX_Stage_DataPanel_ValueColors_2200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_2200');
          console.info('ArkUX_Stage_DataPanel_ValueColors_2200 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_2200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_2200 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_DataPanel_ValueColors_2200 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.$attrs.valueColors));
          expect(obj.$attrs.valueColors[0][0].color).assertEqual("#01FFA500");
          expect(obj.$attrs.valueColors[0][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[0][1].color).assertEqual("#01FFA500");
          expect(obj.$attrs.valueColors[0][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[1][0].color).assertEqual("#4CFFFF00");
          expect(obj.$attrs.valueColors[1][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[1][1].color).assertEqual("#4CFFFF00");
          expect(obj.$attrs.valueColors[1][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[2][0].color).assertEqual("#9AFFC0CB");
          expect(obj.$attrs.valueColors[2][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[2][1].color).assertEqual("#9AFFC0CB");
          expect(obj.$attrs.valueColors[2][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[3][0].color).assertEqual("#FF00FF00");
          expect(obj.$attrs.valueColors[3][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[3][1].color).assertEqual("#FF00FF00");
          expect(obj.$attrs.valueColors[3][1].offset).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_2200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_2200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_DataPanel_ValueColors_2300
     * @tc.name      Tests the valueColors property of the DataPanel component
     * @tc.desc      DataPanel common components, set valueColors property parameter to ''
     */
    it('ArkUX_Stage_DataPanel_ValueColors_2300', 0, async function (done) {
      console.info('ArkUX_Stage_DataPanel_ValueColors_2300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_2300');
          console.info('ArkUX_Stage_DataPanel_ValueColors_2300 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_2300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_2300 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_DataPanel_ValueColors_2300 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.$attrs.valueColors));
          expect(obj.$attrs.valueColors[0][0].color).assertEqual("#FFF7CE00");
          expect(obj.$attrs.valueColors[0][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[0][1].color).assertEqual("#FFF99B11");
          expect(obj.$attrs.valueColors[0][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[1][0].color).assertEqual("#FFF76223");
          expect(obj.$attrs.valueColors[1][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[1][1].color).assertEqual("#FFF2400A");
          expect(obj.$attrs.valueColors[1][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[2][0].color).assertEqual("#FFF772AC");
          expect(obj.$attrs.valueColors[2][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[2][1].color).assertEqual("#FFE65392");
          expect(obj.$attrs.valueColors[2][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[3][0].color).assertEqual("#FFA575EB");
          expect(obj.$attrs.valueColors[3][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[3][1].color).assertEqual("#FFA12DF7");
          expect(obj.$attrs.valueColors[3][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[4][0].color).assertEqual("#FF7B79F7");
          expect(obj.$attrs.valueColors[4][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[4][1].color).assertEqual("#FF4B48F7");
          expect(obj.$attrs.valueColors[4][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[5][0].color).assertEqual("#FF4B8AF3");
          expect(obj.$attrs.valueColors[5][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[5][1].color).assertEqual("#FF007DFF");
          expect(obj.$attrs.valueColors[5][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[6][0].color).assertEqual("#FF73C1E6");
          expect(obj.$attrs.valueColors[6][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[6][1].color).assertEqual("#FF4FB4E3");
          expect(obj.$attrs.valueColors[6][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[7][0].color).assertEqual("#FFA5D61D");
          expect(obj.$attrs.valueColors[7][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[7][1].color).assertEqual("#FF69D14F");
          expect(obj.$attrs.valueColors[7][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[8][0].color).assertEqual("#FFA2A2B0");
          expect(obj.$attrs.valueColors[8][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[8][1].color).assertEqual("#FF8E8E93");
          expect(obj.$attrs.valueColors[8][1].offset).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_2300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_2300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_DataPanel_ValueColors_2400
     * @tc.name      Tests the valueColors property of the DataPanel component
     * @tc.desc      DataPanel common components, set valueColors property parameter to null
     */
    it('ArkUX_Stage_DataPanel_ValueColors_2400', 0, async function (done) {
      console.info('ArkUX_Stage_DataPanel_ValueColors_2400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_DataPanel_ValueColors_2400');
          console.info('ArkUX_Stage_DataPanel_ValueColors_2400 strJson  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_DataPanel_ValueColors_2400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_DataPanel_ValueColors_2400 component obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_DataPanel_ValueColors_2400 component obj.$attrs.valueColors is: " +
          JSON.stringify(obj.$attrs.valueColors));
          expect(obj.$attrs.valueColors[0][0].color).assertEqual("#FFF7CE00");
          expect(obj.$attrs.valueColors[0][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[0][1].color).assertEqual("#FFF99B11");
          expect(obj.$attrs.valueColors[0][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[1][0].color).assertEqual("#FFF76223");
          expect(obj.$attrs.valueColors[1][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[1][1].color).assertEqual("#FFF2400A");
          expect(obj.$attrs.valueColors[1][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[2][0].color).assertEqual("#FFF772AC");
          expect(obj.$attrs.valueColors[2][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[2][1].color).assertEqual("#FFE65392");
          expect(obj.$attrs.valueColors[2][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[3][0].color).assertEqual("#FFA575EB");
          expect(obj.$attrs.valueColors[3][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[3][1].color).assertEqual("#FFA12DF7");
          expect(obj.$attrs.valueColors[3][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[4][0].color).assertEqual("#FF7B79F7");
          expect(obj.$attrs.valueColors[4][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[4][1].color).assertEqual("#FF4B48F7");
          expect(obj.$attrs.valueColors[4][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[5][0].color).assertEqual("#FF4B8AF3");
          expect(obj.$attrs.valueColors[5][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[5][1].color).assertEqual("#FF007DFF");
          expect(obj.$attrs.valueColors[5][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[6][0].color).assertEqual("#FF73C1E6");
          expect(obj.$attrs.valueColors[6][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[6][1].color).assertEqual("#FF4FB4E3");
          expect(obj.$attrs.valueColors[6][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[7][0].color).assertEqual("#FFA5D61D");
          expect(obj.$attrs.valueColors[7][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[7][1].color).assertEqual("#FF69D14F");
          expect(obj.$attrs.valueColors[7][1].offset).assertEqual("1.000000");
          expect(obj.$attrs.valueColors[8][0].color).assertEqual("#FFA2A2B0");
          expect(obj.$attrs.valueColors[8][0].offset).assertEqual("0.000000");
          expect(obj.$attrs.valueColors[8][1].color).assertEqual("#FF8E8E93");
          expect(obj.$attrs.valueColors[8][1].offset).assertEqual("1.000000");
          console.info('ArkUX_Stage_DataPanel_ValueColors_2400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_DataPanel_ValueColors_2400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });
  })
}