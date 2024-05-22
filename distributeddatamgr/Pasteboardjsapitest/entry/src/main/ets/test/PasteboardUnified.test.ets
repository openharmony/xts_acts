import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import pasteboard from '@ohos.pasteboard';
import {BusinessError} from '@ohos.base'
import unifiedDataChannel from '@ohos.data.unifiedDataChannel'
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor'

const TAG = 'ttt';
let systemPasteboard:pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();

export default function PasteboardUnifiedTest() {
  describe('PasteboardUnifiedTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name put Uint8Array promise interface test
     * @tc.number PasteboardSetUnifiedData_0100
     * @tc.desc setUnifiedData getUnifiedData interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PasteboardSetUnifiedData_0100', 0, () => {
      let plainTextData = new unifiedDataChannel.UnifiedData();
      let plainText = new unifiedDataChannel.PlainText();
      plainText.details = {
        Key:'delayPlaintext',
        Value:'delayPlaintext'
      };
      plainText.textContent = 'textContent';
      plainText.abstract = 'abstract';
      plainTextData.addRecord(plainText);
      systemPasteboard.clearDataSync();
      let result = systemPasteboard.hasDataSync();
      expect(result).assertFalse();
      systemPasteboard.setUnifiedData(plainTextData).then((data:void) => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting UnifiedData.');
      }).catch((error:BusinessError)=>{
        console.info(TAG + 'Failed to set UnifiedData.Cause' + error.message);
      })

      systemPasteboard.getUnifiedData().then((data) => {
        let outputData = data;
        let records = outputData.getRecords();
        if(records[0].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT){
          let record = records[0] as unifiedDataChannel.plainText;
          expect(JSON.stringify(record.details)).assertEqual(JSON.stringify(plainText.details));
          console.info(TAG + 'Get Plain Text Unified Data Success, type: ' + records[0].getType() + 'details:' + JSON.stringify(record.details));
        } else {
          console.info(TAG + 'Get Plain Text Data No Success, Type:' + records[0].getType());
        }
      }).catch((error:BusinessError) => {
        console.info(TAG + 'Get Plain Text Unified Data Fail:' + error);
      })
    })

    /**
     * @tc.name put Uint8Array promise interface test
     * @tc.number PasteboardSetUnifiedData_0200
     * @tc.desc setUnifiedDataSync getUnifiedDataSync interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PasteboardSetUnifiedData_0200', 0, () => {
      let plainTextData = new unifiedDataChannel.UnifiedData();
      let plainText = new unifiedDataChannel.PlainText();
      plainText.details = {
        Key:'delayPlaintext',
        Value:'delayPlaintext'
      };
      plainText.textContent = 'textContent';
      plainText.abstract = 'abstract';
      plainTextData.addRecord(plainText);
      systemPasteboard.clearDataSync();
      let result = systemPasteboard.hasDataSync();
      expect(result).assertFalse();
      try {
        systemPasteboard.setUnifiedDataSync(plainTextData);
        expect(systemPasteboard.hasDataSync()).assertTrue()
        console.info(TAG + 'Succeeded in setting UnifiedData.')
      } catch (error){
        console.info(TAG + 'Failed To Set UnifiedData.Cause:' + error.message);
      }
      try {
        let data:unifiedDataChannel.UnifiedData = systemPasteboard.getUnifiedDataSync();
        let outputData = data;
        let records = outputData.getRecords();
        if(records[0].getType() == uniformTypeDescriptor.UniformDataType.Plain_TEXT){
          let record = records[0] as unifiedDataChannel.PlainText;
          expect(JSON.stringify(record.details)).assertEqual(JSON.stringify(plainText.details));
          console.info(TAG + 'Get Plain Text UnifiedData Success, type:' + records[0].getType() + 'details:' + JSON.stringify(record.details));
        } else {
          console.info(TAG + 'Get Plain Text Data No Success,type:' + records[0].getType());
        }
      } catch (error){
        console.info(TAG + 'Get Plain Text UnifiedData Fail:' + error);
      }
    })
  })
}