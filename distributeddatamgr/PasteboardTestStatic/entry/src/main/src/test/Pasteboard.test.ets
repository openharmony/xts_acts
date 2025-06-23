/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import pasteboard from '@ohos.pasteboard';
import Want from "@ohos.app.ability.Want";
import image from "@ohos.multimedia.image";
import { BusinessError } from "@ohos.base"

let domain: number = 0x0000; // The log tag 0x0000 acts as the business ID for the test framework.
// The log identifier string is used as a tag to identify the test behavior under the current runner class.
let tag: string = 'testTag';
let error = undefined;
const HTMLTEXT = "<!DOCTYPE html>\n" + "<html>\n" + "<head>\n" + "<meta charset=\"utf-8\">\n" +
           "<title>HTML-PASTEBOARD_HTML</title>\n" + "</head>\n" + "<body>\n" + "    <h1>HEAD</h1>\n" +
           "    <p></p>\n" + "</body>\n" + "</html>";
const ARRAY_BUFFER = new ArrayBuffer(256);
const OBJECTWANT: Want = {
  bundleName: "com.example.aafwk.test",
  abilityName: "com.example.aafwk.test.TwoAbility"
};
const OPTS: image.InitializationOptions = {
  size:  { height: 480, width: 360},
  editable: true,
};

export default function pasteBoardTest() {
  describe("pasteBoardTest", (): void => {
    console.info("pasteBoardTest describe start")

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_PasteboardQJTest_0100
     * @tc.name PasteBoardQjTest01
     * @tc.desc Test pasteBoard add record fail with 1025 bit mimeType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQjTest01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest01 start");
      hilog.info(domain, tag, 'minetype: %{public}s', "x".repeat(1025));
      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      let catchFlag = false;
      try {
        pasteData.addRecord("x".repeat(1025), ARRAY_BUFFER);
        expect().assertFail();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `catch error ${err.code}`);
        catchFlag = true;
        expect(err.code == 401).assertTrue();
      }
      if (!catchFlag) {
        hilog.info(domain, tag, '%{public}s', "Add record success");
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest01 end");
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_PasteboardQJTest_0200
     * @tc.name PasteBoardQjTest02
     * @tc.desc Test pasteBoard add 613th record successful
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQjTest02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest02 start");

      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      for (let i = 0; i < 998; i++) {
        pasteData.addRecord("stringRecord" + i, ARRAY_BUFFER);
      }
      try {
        pasteData.addRecord("stringRecord1000", ARRAY_BUFFER);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `catch error ${err.code}`);
        expect(err != undefined).assertFail();
      }
      let count = pasteData.getRecordCount();
      hilog.info(domain, tag, 'RecordCount is: %{public}d', count);
      expect(count == 1000).assertTrue();

      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest02 end");
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_PasteboardQJTest_0300
     * @tc.name PasteBoardQjTest03
     * @tc.desc Test pasteBoard SetProperty API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQjTest03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest03 start");

      let pasteData = pasteboard.createData("string", ARRAY_BUFFER);
      let prop = pasteData.getProperty();
      prop.shareOption = pasteboard.ShareOption.INAPP;
      pasteData.setProperty(prop);
      let property = pasteData.getProperty();
      expect(pasteboard.ShareOption.INAPP).assertEqual(property.shareOption);

      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest03 end");
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_PasteboardQJTest_0400
     * @tc.name PasteBoardQjTest04
     * @tc.desc Get specified record success
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQjTest04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest04 start");

      let uri = "file:///C:/Users/username/Documents/report.pdf";
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, uri);
      expect(pasteData.getRecord(0).uri).assertEqual(uri);

      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest04 end");
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_PasteboardQJTest_0500
     * @tc.name PasteBoardQjTest05
     * @tc.desc Get specified record failed,index out of range
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQjTest05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest05 start");

      let catchFlag = false;
      let pasteData = pasteboard.createData("arraybuffer", ARRAY_BUFFER)
      try {
        pasteData.getRecord(1);
        expect().assertFail();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `catch error: ${err.code}`);
        catchFlag = true;
        expect(err.code == 12900001).assertTrue();
      }
      if (!catchFlag) {
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest05 end");
      done();
    })

    //=================================================================
    /**
     * @tc.number SUB_Pasteboard_Local_PasteboardQJTest_0600
     * @tc.name PasteBoardQjTest06
     * @tc.desc Test pasteBoard create data fail with 1025 bytes mimeType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQjTest06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest06 start");

      let catchFlag = false;
      try {
        let pasteData = pasteboard.createData("x".repeat(1025), ARRAY_BUFFER);
        expect().assertFail();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `catch error ${err.code}`);
        catchFlag = true;
        expect(err.code == 401).assertTrue();
      }
      if (!catchFlag) {
        hilog.info(domain, tag, '%{public}s', "CreateData success");
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest06 end");
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_PasteboardQJTest_0700
     * @tc.name PasteBoardQjTest07
     * @tc.desc Test pasteBoard create data fail with 0 bytes mimeType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQjTest07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest07 start");

      let catchFlag = false;
      try {
        let pasteData = pasteboard.createData("", ARRAY_BUFFER);
        expect().assertFail();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `catch error ${err.code}`);
        catchFlag = true;
        expect(err.code == 401).assertTrue();
      }
      if (!catchFlag) {
        hilog.info(domain, tag, '%{public}s', "CreateData success");
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest07 end");
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_PasteboardQJTest_0800
     * @tc.name PasteBoardQjTest08
     * @tc.desc Test pasteBoard create data success with self defined type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQjTest08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest08 start");

      try {
        let pasteData = pasteboard.createData('selfdefined', ARRAY_BUFFER);
        let count = pasteData.getRecordCount();
        expect(count).assertEqual(1);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `catch error ${err.code}`);
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest08 end");
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_PasteboardQJTest_0900
     * @tc.name PasteBoardQjTest09
     * @tc.desc Test pasteBoard create data success with uri type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQjTest09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest09 start");

      try {
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, "file:///C:/Users/Documents/report.pdf");
        expect(pasteData != null).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `catch error ${err.code}`);
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest09 end");
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_PasteboardQJTest_1000
     * @tc.name PasteBoardQjTest10
     * @tc.desc Test pasteBoard create data success with pasteboard.MIMETYPE_TEXT_PLAIN type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQjTest10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest10 start");

      try {
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "hello");
        expect(pasteData != null).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `catch error ${err.code}`);
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest10 end");
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_PasteboardQJTest_1100
     * @tc.name PasteBoardQjTest11
     * @tc.desc Test pasteBoard create data success with pasteboard.MIMETYPE_TEXT_HTML type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQjTest11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest11 start");

      try {
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, HTMLTEXT);
        expect(pasteData != null).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `catch error ${err.code}`);
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest11 end");
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_PasteboardQJTest_1200
     * @tc.name PasteBoardQjTest12
     * @tc.desc Test pasteBoard create data success with pasteboard.MIMETYPE_TEXT_WANT type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQjTest12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest12 start");

      try {
        let pasteData = pasteboard.createData('text/want', OBJECTWANT);
        expect(pasteData != null).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `catch error ${err.code}`);
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest12 end");
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_PasteboardQJTest_1300
     * @tc.name PasteBoardQjTest13
     * @tc.desc Test pasteBoard create data success with pasteboard.MIMETYPE_PIXELMAP type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQjTest13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest13 start");

      const pixelMap = image.createPixelMapSync(OPTS);
      try {
        let pasteData = pasteboard.createData('pixelMap', pixelMap);
        expect(pasteData != null).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `catch error ${err.code}`);
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest13 end");
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_PasteboardQJTest_1400
     * @tc.name PasteBoardQjTest14
     * @tc.desc Test pasteBoard create data success with record<> parameter
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQjTest14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest14 start");

      const pixelMap = image.createPixelMapSync(OPTS);
      let record: Record<string, pasteboard.ValueType> = {};
      record[pasteboard.MIMETYPE_TEXT_URI] = 'hello';
      record[pasteboard.MIMETYPE_TEXT_PLAIN] = 'hello';
      record[pasteboard.MIMETYPE_TEXT_HTML] = HTMLTEXT;
      record['selfdefined'] = ARRAY_BUFFER;
      try {
        let pasteData = pasteboard.createData(record);
        expect(pasteData != null).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `catch error ${err.code}`);
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest14 end");
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_PasteboardQJTest_1500
     * @tc.name PasteBoardQjTest15
     * @tc.desc Test pasteBoard create data fail with record<> parameter, length of self defined type is more than 1024.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQjTest15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest15 start");

      const pixelMap = image.createPixelMapSync(OPTS);
      let record: Record<string, pasteboard.ValueType> = {};
      record[pasteboard.MIMETYPE_TEXT_URI] = 'hello';
      record[pasteboard.MIMETYPE_TEXT_PLAIN] = 'hello';
      record[pasteboard.MIMETYPE_TEXT_HTML] = HTMLTEXT;
      record["x".repeat(1025)] = ARRAY_BUFFER;
      let catchFlag = false;
      try {
        let pasteData = pasteboard.createData(record);
        expect().assertFail();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `catch error ${err.code}`);
        catchFlag = true;
        expect(err.code == 401).assertTrue();
      }
      if (!catchFlag) {
        hilog.info(domain, tag, '%{public}s', "CreateData success");
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest15 end");
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_PasteboardQJTest_1600
     * @tc.name PasteBoardQjTest16
     * @tc.desc Test pasteBoard create data fail with record<> parameter, length of self defined type is empty.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQjTest16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest16 start");

      const pixelMap = image.createPixelMapSync(OPTS);
      let record: Record<string, pasteboard.ValueType> = {};
      record[pasteboard.MIMETYPE_TEXT_URI] = 'hello';
      record[pasteboard.MIMETYPE_TEXT_PLAIN] = 'hello';
      record[pasteboard.MIMETYPE_TEXT_HTML] = HTMLTEXT;
      record[''] = ARRAY_BUFFER;
      let catchFlag = false;
      try {
        let pasteData = pasteboard.createData(record);
        expect().assertFail();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `catch error ${err.code}`);
        catchFlag = true;
        expect(err.code == 401).assertTrue();
      }
      if (!catchFlag) {
        hilog.info(domain, tag, '%{public}s', "CreateData success");
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest16 end");
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_PasteboardQJTest_1700
     * @tc.name PasteBoardQjTest17
     * @tc.desc Test pasteBoard create data fail with record<> parameter, length of self defined type is 1024.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQjTest17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest17 start");

      const pixelMap = image.createPixelMapSync(OPTS);
      let record: Record<string, pasteboard.ValueType> = {};
      record[pasteboard.MIMETYPE_TEXT_URI] = 'hello';
      record[pasteboard.MIMETYPE_TEXT_PLAIN] = 'hello';
      record[pasteboard.MIMETYPE_TEXT_HTML] = HTMLTEXT;
      record["x".repeat(1023)] = ARRAY_BUFFER;
      let catchFlag = false;
      try {
        let pasteData = pasteboard.createData(record);
        expect(pasteData != null).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `catch error ${err.code}`);
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest17 end");
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_PasteboardQJTest_1800
     * @tc.name PasteBoardQjTest18
     * @tc.desc Test pasteBoard create data fail with record<> parameter, length of self defined type is 1024.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQjTest18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest18 start");

      try {
        let pasteData = pasteboard.createData("x".repeat(1023), ARRAY_BUFFER);
        expect(pasteData != null).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `catch error ${err.code}`);
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest18 end");
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_PasteboardQJTest_1900
     * @tc.name PasteBoardQjTest19
     * @tc.desc Test pasteBoard add record fail with empty mimetype
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQjTest19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest19 start");

      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, "file:///C:/Users/Documents/report.pdf")
      try {
        pasteData.addRecord('', ARRAY_BUFFER);
        expect().assertFail();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `catch error ${err.code}`);
        expect(err.code == 401).assertTrue();
      }

      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest19 end");
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_PasteboardQJTest_2000
     * @tc.name PasteBoardQjTest20
     * @tc.desc Test pasteBoard add record success with all kinds of type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQjTest20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest20 start");

      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, "file:///C:/Users/Documents/report.pdf")
      const pixelMap = image.createPixelMapSync(OPTS);
      try {
        pasteData.addRecord('selfdefined', ARRAY_BUFFER);
        pasteData.addRecord(pasteboard.MIMETYPE_TEXT_URI, "file:///C:/Users/Documents/report.pdf");
        pasteData.addRecord(pasteboard.MIMETYPE_TEXT_PLAIN, "hello");
        pasteData.addRecord(pasteboard.MIMETYPE_TEXT_HTML, HTMLTEXT);
        let count = pasteData.getRecordCount();
        expect(count == 5).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `catch error ${err.code}`);
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest20 end");
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_PasteboardQJTest_2100
     * @tc.name PasteBoardQjTest21
     * @tc.desc Test pasteBoard add record success with pastedataRecord parameter
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQjTest21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest21 start");

      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, "file:///C:/Users/Documents/report.pdf")
      const pixelMap = image.createPixelMapSync(OPTS);
      let record = pasteData.getRecord(0);
      try {
        pasteData.addRecord(record);
        let count = pasteData.getRecordCount();
        expect(count == 2).assertTrue();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `catch error ${err.code}`);
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest21 end");
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_PasteboardQJTest_2200
     * @tc.name PasteBoardQjTest22
     * @tc.desc Test pasteBoard add record fail with empty mimetype
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQjTest22', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest22 start");

      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, "file:///C:/Users/Documents/report.pdf")
      try {
        pasteData.addRecord('x'.repeat(1023), ARRAY_BUFFER);
        expect(pasteData.getRecordCount()).assertEqual(2);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `catch error ${err.code}`);
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest22 end");
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_PasteboardQJTest_2300
     * @tc.name PasteBoardQjTest23
     * @tc.desc Get specified record failed,index out of range
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQjTest23', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest23 start");

      let catchFlag = false;
      let pasteData = pasteboard.createData("arraybuffer", ARRAY_BUFFER)
      try {
        pasteData.getRecord(-1);
        expect().assertFail();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `catch error: ${err.code}`);
        catchFlag = true;
        expect(err.code == 12900001).assertTrue();
      }
      if (!catchFlag) {
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest23 end");
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_PasteboardQJTest_2400
     * @tc.name PasteBoardQjTest24
     * @tc.desc Test pasteBoard SetProperty API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQjTest24', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest24 start");

      let pasteData = pasteboard.createData("string", ARRAY_BUFFER)
      let prop = pasteData.getProperty();
      prop.shareOption = pasteboard.ShareOption.LOCALDEVICE;
      pasteData.setProperty(prop);
      let property = pasteData.getProperty();
      expect(pasteboard.ShareOption.LOCALDEVICE).assertEqual(property.shareOption)

      hilog.info(domain, tag, '%{public}s', "PasteBoardQjTest24 end");
      done();
    })

    console.info("pasteBoardTest describe end")
  })
}