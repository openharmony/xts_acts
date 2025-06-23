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
import fileUri from "@ohos.file.fileuri";
import pasteboard from '@ohos.pasteboard';
import Want from "@ohos.app.ability.Want";
import image from "@ohos.multimedia.image";
import { BusinessError } from "@ohos.base"

let domain: number = 0x0000; // The log tag 0x0000 acts as the business ID for the test framework.
// The log identifier string is used as a tag to identify the test behavior under the current runner class.
let tag: string = 'testTag';
let error = undefined
const URITEXT = "file:///C:/Users/Documents/report.pdf";
const HTMLTEXT = "<!DOCTYPE html>\n" + "<html>\n" + "<head>\n" + "<meta charset=\"utf-8\">\n" +
  "<title>HTML-PASTEBOARD_HTML</title>\n" + "</head>\n" + "<body>\n" + "    <h1>HEAD</h1>\n" +
  "    <p></p>\n" + "</body>\n" + "</html>";
const ARRAY_BUFFER = new ArrayBuffer(256)
const OBJECTWANT: Want = {
  bundleName: "com.example.aafwk.test",
  abilityName: "com.example.aafwk.test.TwoAbility"
};
const OPTS: image.InitializationOptions = {
  size:  { height: 480, width: 360},
  editable: true,
};

export default function systemPasteBoardTest() {
  describe("SystemPasteBoardTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'SystemPasteBoardTest describe start');
    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_0100
     * @tc.name PasteBoardQJTest01
     * @tc.desc set data than check the data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest01 start');
      let systemPasteboard = pasteboard.getSystemPasteboard()
      await systemPasteboard.clearData().then(async () => {
        let dataText = 'hello';
        let PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, dataText);
        await systemPasteboard.setData(PasteData).then(async () => {
          try {
            let bHasType = systemPasteboard.hasDataType(pasteboard.MIMETYPE_TEXT_PLAIN);
            expect(bHasType).assertTrue();
            done();
          } catch (err: BusinessError) {
            hilog.error(domain, tag, `test hasDataType err : ${JSON.stringify(err)}`);
            expect().assertFail();
            done();
          }
        })
      })
      hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest01 end');
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_0200
     * @tc.name PasteBoardQJTest02
     * @tc.desc set data than check the data type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest02 start');
        let systemPasteboard = pasteboard.getSystemPasteboard();
        await systemPasteboard.clearData().then(async () => {
          let dataText = 'hello';
          let PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, dataText);
          await systemPasteboard.setData(PasteData).then(async () => {
            try {
              let bHasType = systemPasteboard.hasDataType(pasteboard.MIMETYPE_TEXT_URI);
              expect(bHasType == false).assertTrue();
              done();
            } catch (err: BusinessError) {
              hilog.error(domain, tag, `test hasDataType err : ${JSON.stringify(err)}`);
              expect().assertFail();
              done();
            }
          })
        })
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest02 end');
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_0300
     * @tc.name PasteBoardQJTest03
     * @tc.desc Test setDataSync in systemPasteBoard
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("PasteBoardQJTest03", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest03 start');

      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, "file:///C:/Users/Documents/report.pdf");
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      hilog.info(domain, tag, `${systemPasteBoard}`);
      await systemPasteBoard.setData(pasteData).then<void, void>((): void => {
      });
      let result = systemPasteBoard.getDataSync();
      hilog.info(domain, tag, `Get the pasteboard from system PasteBoard success. Result: ${result}`);
      expect(result.getRecord(0).uri).assertEqual("file:///C:/Users/Documents/report.pdf");

      hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest03 end');
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_0400
     * @tc.name PasteBoardQJTest04
     * @tc.desc Test pasteBoard getDataSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest04 start');

      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, "file:///C:/Users/Documents/report.pdf");
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);
      try {
        let result: pasteboard.PasteData = systemPasteboard.getDataSync();
        expect(result.getRecord(0).uri).assertEqual("file:///C:/Users/Documents/report.pdf");
        hilog.info(domain, tag, '%{public}s', 'Succeeded in getting PasteData.');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, `catch error ${err.code}`);
        expect(err.code == 12900005).assertTrue();
        done();
      };

      hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest04 end');
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_0500
     * @tc.name PasteBoardQJTest05
     * @tc.desc get the pastedata from system pasteBoard success
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest05 start');

      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, HTMLTEXT);
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      await systemPasteBoard.setData(pasteData).then(async () => {
        try {
          let result = systemPasteBoard.getDataSync();
          let recordCount = result.getRecordCount();
          expect(recordCount).assertEqual(1);
          hilog.info(domain, tag, '%{public}s', 'Succeeded in getting recordCount.');
          done();
        } catch (err: BusinessError) {
          hilog.info(domain, tag, `catch error ${err.code}`);
          expect(err.code == 12900005).assertTrue();
          done();
        };
      }).catch((err) => {
        hilog.info(domain, tag, '%{public}s', 'System pasteBoard set pastedata error.');
        expect().assertFail();
        done();
      })

      hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest05 end');
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_0600
     * @tc.name PasteBoardQJTest06
     * @tc.desc Test pasteBoard getDataSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "PasteBoardQJTest06 start");

      let systemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.clearData().then(async () => {
        let dataText = 'hello';
          let PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, dataText);
        await systemPasteboard.setData(PasteData).then(async () => {
          try {
            let string = systemPasteboard.getDataSource();
            hilog.info(domain, tag, "bundle name :" + string);
            expect(string != null).assertTrue();
            done();
          } catch (err) {
            hilog.error(domain, tag, "test getDataSource err:" + err);
            expect().assertFail();
            done();
          }
        })
      })

      hilog.info(domain, tag, "PasteBoardQJTest06 end");
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_0700
     * @tc.name PasteBoardQJTest07
     * @tc.desc Test pasteBoard getDataSource
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_Pasteboard_getDataSource_ErrTest_0100 start');

      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content');
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);
      try {
        let result: string = systemPasteboard.getDataSource();
        hilog.info(domain, tag, `Succeeded in checking the RemoteData. Result: ${result}`);
        expect(result == 'label').assertTrue();
        done();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `Failed to getDataSource. Cause: ${err.message + err.code}`);
        expect(err.code == 12900005).assertTrue();
        done();
      };

      hilog.info(domain, tag, 'PasteBoardQJTest07 end');
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_0800
     * @tc.name PasteBoardQJTest08
     * @tc.desc Test pasteBoard progress single level path and no fileConflictOption
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'PasteBoardQJTest08 start')

      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content');
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);
      let prop: pasteboard.PasteDataProperty = pasteData.getProperty();
      pasteData.setProperty(prop);
      hilog.info(domain, tag, 'PasteDataProperty shareOption is: ' + prop.shareOption);
      expect(prop.shareOption == 1).assertTrue();

      hilog.info(domain, tag, 'PasteBoardQJTest08 end');
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_0900
     * @tc.name PasteBoardQJTest09
     * @tc.desc Clear the data in the system pasteBoard
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "PasteBoardQJTest09 start");

      let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      await systemPasteBoard.setData(pasteData);
      await systemPasteBoard.clearData().then(async () => {
        hilog.info(domain, tag, "Clear the data in the system pasteBoard finished");
        try {
          let bHasType = systemPasteBoard.hasDataType('string');
          expect(bHasType).assertFalse();
          done();
        } catch (err) {
          hilog.error(domain, tag, `test hasDataType err : ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })

      hilog.info(domain, tag, "PasteBoardQJTest09 end");
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_1000
     * @tc.name PasteBoardQJTest10
     * @tc.desc Put pastedata to system pasteBoard success
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "PasteBoardQJTest10 start");

      let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      await systemPasteBoard.setData(pasteData).then(async () => {
        hilog.info(domain, tag, "set the data in the system pasteBoard finished");
        try {
          let bHasType = systemPasteBoard.hasDataType('string');
          expect(bHasType).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, tag, `test hasDataType err : ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })

      hilog.info(domain, tag, "PasteBoardQJTest10 end");
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_1100
     * @tc.name PasteBoardQJTest11
     * @tc.desc Clear the data in the system pasteBoard by promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest11 start');

      let pasteData = pasteboard.createData('string', ARRAY_BUFFER);
      let systemPasteBoard = pasteboard.getSystemPasteboard();
      await systemPasteBoard.setData(pasteData);
      await systemPasteBoard.clearData().then<void, void>((): void => {
        hilog.info(0, 'testTag', `promise => test clearData`);
      });
      let bool_ret = systemPasteBoard.hasDataType('string');
      expect(bool_ret == false).assertTrue();

      hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest11 end');
      done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_1200
     * @tc.name PasteBoardQJTest12
     * @tc.desc set data in the system pasteBoard by promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest12 start');

        let pasteData = pasteboard.createData('text/want', OBJECTWANT);
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        await systemPasteBoard.setData(pasteData);
        let bool_ret = systemPasteBoard.hasDataType('text/want');
        expect(bool_ret == true).assertTrue();

        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest12 end');
        done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_1300
     * @tc.name PasteBoardQJTest13
     * @tc.desc set data in the system pasteBoard by promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest13 start');

        const pixelMap = image.createPixelMapSync(OPTS);
        let pasteData = pasteboard.createData('pixelMap', pixelMap);
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        await systemPasteBoard.setData(pasteData);
        let bool_ret = systemPasteBoard.hasDataType('pixelMap');
        expect(bool_ret == true).assertTrue();

        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest13 end');
        done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_1400
     * @tc.name PasteBoardQJTest14
     * @tc.desc set data in the system pasteBoard by promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest14 start');

        const pixelMap = image.createPixelMapSync(OPTS);
        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, URITEXT);
        pasteData.addRecord("selfDefined", ARRAY_BUFFER);
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        await systemPasteBoard.setData(pasteData);
        let bool_ret = systemPasteBoard.hasDataType(pasteboard.MIMETYPE_TEXT_URI);
        let bool_ret1 = systemPasteBoard.hasDataType('selfDefined');
        expect(bool_ret == true && bool_ret1 == true).assertTrue();

        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest14 end');
        done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_1500
     * @tc.name PasteBoardQJTest15
     * @tc.desc set data in the system pasteBoard by callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest15 start');

        const pixelMap = image.createPixelMapSync(OPTS);
        let pasteData = pasteboard.createData('pixelMap', pixelMap);
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        systemPasteBoard.setData(pasteData, () => {
          let bool_ret = systemPasteBoard.hasDataType('pixelMap');
          expect(bool_ret == true).assertTrue();
          hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest15 end');
          done();
        })
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_1600
     * @tc.name PasteBoardQJTest16
     * @tc.desc set data in the system pasteBoard by callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest16 start');

        let pasteData = pasteboard.createData('text/want', OBJECTWANT);
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        systemPasteBoard.setData(pasteData, () => {
          let bool_ret = systemPasteBoard.hasDataType('text/want');
          expect(bool_ret == true).assertTrue();
          hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest16 end');
          done();
        })
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_1700
     * @tc.name PasteBoardQJTest17
     * @tc.desc set data in the system pasteBoard by callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest17 start');

        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "content");
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        systemPasteBoard.setData(pasteData, () => {
          let bool_ret = systemPasteBoard.hasDataType(pasteboard.MIMETYPE_TEXT_PLAIN);
          expect(bool_ret == true).assertTrue();
          hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest17 end');
          done();
        })
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_1800
     * @tc.name PasteBoardQJTest18
     * @tc.desc set data in the system pasteBoard by callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest18 start');

        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, "content");
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        systemPasteBoard.setData(pasteData, () => {
          let bool_ret = systemPasteBoard.hasDataType(pasteboard.MIMETYPE_TEXT_HTML);
          expect(bool_ret == true).assertTrue();
          hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest18 end');
          done();
        })
      })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_1900
     * @tc.name PasteBoardQJTest19
     * @tc.desc set data in the system pasteBoard by callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest19 start');

        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, URITEXT);
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        systemPasteBoard.setData(pasteData, () => {
          let bool_ret = systemPasteBoard.hasDataType(pasteboard.MIMETYPE_TEXT_URI);
          expect(bool_ret == true).assertTrue();
          hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest19 end');
          done();
        })
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_2000
     * @tc.name PasteBoardQJTest20
     * @tc.desc set data in the system pasteBoard by callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest20 start');

        let pasteData = pasteboard.createData("selfDefined", ARRAY_BUFFER);
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        systemPasteBoard.setData(pasteData, () => {
          let bool_ret = systemPasteBoard.hasDataType("selfDefined");
          expect(bool_ret == true).assertTrue();
          hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest20 end');
          done();
        })
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_2100
     * @tc.name PasteBoardQJTest21
     * @tc.desc set data in the system pasteBoard by callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest21 start');

        let pasteData = pasteboard.createData("selfDefined", ARRAY_BUFFER);
        pasteData.addRecord("selfDefined1", ARRAY_BUFFER);
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        systemPasteBoard.setData(pasteData, () => {
          let bool_ret = systemPasteBoard.hasDataType("selfDefined");
          let bool_ret1 = systemPasteBoard.hasDataType("selfDefined1");
          expect(bool_ret == true && bool_ret1 == true).assertTrue();
          hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest21 end');
          done();
        })
      })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_2200
     * @tc.name PasteBoardQJTest22
     * @tc.desc clear data in the system pasteBoard by callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest22', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest22 start');

        let pasteData = pasteboard.createData("selfDefined", ARRAY_BUFFER);
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        await systemPasteBoard.setData(pasteData);
        let bool_set = systemPasteBoard.hasDataType("selfDefined");
        systemPasteBoard.clearData(() => {
          let bool_clear = systemPasteBoard.hasDataType("selfDefined");
          expect(bool_set == true && bool_clear == false).assertTrue();
          hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest22 end');
          done();
        })
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_2300
     * @tc.name PasteBoardQJTest23
     * @tc.desc clear data in the system pasteBoard by callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest23', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest23 start');

        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, URITEXT);
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        await systemPasteBoard.setData(pasteData);
        let bool_set = systemPasteBoard.hasDataType(pasteboard.MIMETYPE_TEXT_URI);
        systemPasteBoard.clearData(() => {
          let bool_clear = systemPasteBoard.hasDataType(pasteboard.MIMETYPE_TEXT_URI);
          expect(bool_set == true && bool_clear == false).assertTrue();
          hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest23 end');
          done();
        })
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_2400
     * @tc.name PasteBoardQJTest24
     * @tc.desc clear data in the system pasteBoard by callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest24', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest24 start');

        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "hello");
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        await systemPasteBoard.setData(pasteData);
        let bool_set = systemPasteBoard.hasDataType(pasteboard.MIMETYPE_TEXT_PLAIN);
        systemPasteBoard.clearData(() => {
          let bool_clear = systemPasteBoard.hasDataType(pasteboard.MIMETYPE_TEXT_PLAIN);
          expect(bool_set == true && bool_clear == false).assertTrue();
          hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest24 end');
          done();
        })
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_2500
     * @tc.name PasteBoardQJTest25
     * @tc.desc clear data in the system pasteBoard by callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest25', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest25 start');

        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, HTMLTEXT);
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        await systemPasteBoard.setData(pasteData);
        let bool_set = systemPasteBoard.hasDataType(pasteboard.MIMETYPE_TEXT_HTML);
        systemPasteBoard.clearData(() => {
          let bool_clear = systemPasteBoard.hasDataType(pasteboard.MIMETYPE_TEXT_HTML);
          expect(bool_set == true && bool_clear == false).assertTrue();
          hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest25 end');
          done();
        })
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_2600
     * @tc.name PasteBoardQJTest26
     * @tc.desc clear data in the system pasteBoard by callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest26', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest26 start');

        let pasteData = pasteboard.createData('text/want', OBJECTWANT);
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        await systemPasteBoard.setData(pasteData);
        let bool_set = systemPasteBoard.hasDataType('text/want');
        systemPasteBoard.clearData(() => {
          let bool_clear = systemPasteBoard.hasDataType('text/want');
          expect(bool_set == true && bool_clear == false).assertTrue();
          hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest26 end');
          done();
        })
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_2700
     * @tc.name PasteBoardQJTest27
     * @tc.desc clear data in the system pasteBoard by callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest27', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest27 start');

        const pixelMap = image.createPixelMapSync(OPTS);
        let pasteData = pasteboard.createData('pixelMap', pixelMap);
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        await systemPasteBoard.setData(pasteData);
        let bool_set = systemPasteBoard.hasDataType('pixelMap');
        systemPasteBoard.clearData(() => {
          let bool_clear = systemPasteBoard.hasDataType('pixelMap');
          expect(bool_set == true && bool_clear == false).assertTrue();
          hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest27 end');
          done();
        })
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_2800
     * @tc.name PasteBoardQJTest28
     * @tc.desc clear data in the system pasteBoard by callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest28', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest28 start');

        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, URITEXT);
        pasteData.addRecord("selfDefined", ARRAY_BUFFER);
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        await systemPasteBoard.setData(pasteData);
        let bool_set = systemPasteBoard.hasDataType(pasteboard.MIMETYPE_TEXT_URI);
        let bool_set1 = systemPasteBoard.hasDataType("selfDefined");
        systemPasteBoard.clearData(() => {
          let bool_clear = systemPasteBoard.hasDataType(pasteboard.MIMETYPE_TEXT_URI);
          let bool_clear1 = systemPasteBoard.hasDataType("selfDefined");
          expect(bool_set == true && bool_set1 && bool_clear == false && bool_clear1 == false).assertTrue();
          hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest28 end');
          done();
        })
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_2900
     * @tc.name PasteBoardQJTest29
     * @tc.desc clear data in the system pasteBoard by promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest29', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest29 start');

        const pixelMap = image.createPixelMapSync(OPTS);
        let pasteData = pasteboard.createData('pixelMap', pixelMap);
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        await systemPasteBoard.setData(pasteData);
        let bool_set = systemPasteBoard.hasDataType('pixelMap');
        await systemPasteBoard.clearData();
        let bool_clear = systemPasteBoard.hasDataType('pixelMap');
        expect(bool_set == true && bool_clear == false).assertTrue();
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest29 end');
        done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_3000
     * @tc.name PasteBoardQJTest30
     * @tc.desc clear data in the system pasteBoard by promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest30', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest30 start');

        let pasteData = pasteboard.createData('text/want', OBJECTWANT);
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        await systemPasteBoard.setData(pasteData);
        let bool_set = systemPasteBoard.hasDataType('text/want');
        await systemPasteBoard.clearData();
        let bool_clear = systemPasteBoard.hasDataType('text/want');
        expect(bool_set == true && bool_clear == false).assertTrue();
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest30 end');
        done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_3100
     * @tc.name PasteBoardQJTest31
     * @tc.desc clear data in the system pasteBoard by promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest31', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest31 start');

        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, "hello");
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        await systemPasteBoard.setData(pasteData);
        let bool_set = systemPasteBoard.hasDataType(pasteboard.MIMETYPE_TEXT_PLAIN);
        await systemPasteBoard.clearData();
        let bool_clear = systemPasteBoard.hasDataType(pasteboard.MIMETYPE_TEXT_PLAIN);
        expect(bool_set == true && bool_clear == false).assertTrue();
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest31 end');
        done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_3200
     * @tc.name PasteBoardQJTest32
     * @tc.desc clear data in the system pasteBoard by promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest32', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest32 start');

        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, HTMLTEXT);
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        await systemPasteBoard.setData(pasteData);
        let bool_set = systemPasteBoard.hasDataType(pasteboard.MIMETYPE_TEXT_HTML);
        await systemPasteBoard.clearData();
        let bool_clear = systemPasteBoard.hasDataType(pasteboard.MIMETYPE_TEXT_HTML);
        expect(bool_set == true && bool_clear == false).assertTrue();
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest32 end');
        done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_3300
     * @tc.name PasteBoardQJTest33
     * @tc.desc clear data in the system pasteBoard by promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest33', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest33 start');

        let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, URITEXT);
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        await systemPasteBoard.setData(pasteData);
        let bool_set = systemPasteBoard.hasDataType(pasteboard.MIMETYPE_TEXT_URI);
        await systemPasteBoard.clearData();
        let bool_clear = systemPasteBoard.hasDataType(pasteboard.MIMETYPE_TEXT_URI);
        expect(bool_set == true && bool_clear == false).assertTrue();
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest33 end');
        done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_3400
     * @tc.name PasteBoardQJTest34
     * @tc.desc clear data in the system pasteBoard by promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest34', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest34 start');

        let pasteData = pasteboard.createData("selfdefined", ARRAY_BUFFER );
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        await systemPasteBoard.setData(pasteData);
        let bool_set = systemPasteBoard.hasDataType("selfdefined");
        await systemPasteBoard.clearData();
        let bool_clear = systemPasteBoard.hasDataType("selfdefined");
        expect(bool_set == true && bool_clear == false).assertTrue();
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest34 end');
        done();
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SystemPasteboardQJTest_3500
     * @tc.name PasteBoardQJTest35
     * @tc.desc clear data in the system pasteBoard by promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('PasteBoardQJTest35', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest35 start');

        let pasteData = pasteboard.createData("selfdefined", ARRAY_BUFFER);
        pasteData.addRecord(pasteboard.MIMETYPE_TEXT_URI, URITEXT);
        let systemPasteBoard = pasteboard.getSystemPasteboard();
        await systemPasteBoard.setData(pasteData);
        let bool_set = systemPasteBoard.hasDataType("selfdefined");
        let bool_set1 = systemPasteBoard.hasDataType(pasteboard.MIMETYPE_TEXT_URI);
        await systemPasteBoard.clearData();
        let bool_clear = systemPasteBoard.hasDataType("selfdefined");
        let bool_clear1 = systemPasteBoard.hasDataType(pasteboard.MIMETYPE_TEXT_URI);
        expect(bool_set == true && bool_set1 == true && bool_clear == false && bool_clear1 == false).assertTrue();
        hilog.info(domain, tag, '%{public}s', 'PasteBoardQJTest35 end');
        done();
    })

    hilog.info(domain, tag, '%{public}s', 'SystemPasteBoardTest describe end');
  })
}