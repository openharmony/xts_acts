import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function UDMFApiTest() {
  describe("UDMFApiTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'UDMFApiTest start');

    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100 start');
      let unifiedRecord = new unifiedDataChannel.UnifiedRecord();
      let unifiedData = new unifiedDataChannel.UnifiedData(unifiedRecord);
      let records = unifiedData.getRecords();
      let record:unifiedDataChannel.UnifiedRecord = (records[0]) as unifiedDataChannel.UnifiedRecord;
      expect(records.length == 1).assertEqual(true);
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100 end');
      done();
    })
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100 start');
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let records = unifiedData.getRecords();
      expect(records.length == 0).assertEqual(true);
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100 end');
      done();
    })
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100 start');
      let unifiedRecord = new unifiedDataChannel.UnifiedRecord("string",true);
      let unifiedData = new unifiedDataChannel.UnifiedData(unifiedRecord);
      let records = unifiedData.getRecords();
      let record:unifiedDataChannel.UnifiedRecord = (records[0]) as unifiedDataChannel.UnifiedRecord;
      expect(records.length == 1).assertEqual(true);
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100 end');
      done();
    })
    hilog.info(domain, tag, '%{public}s', 'UDMFApiTest end');
  });
}

