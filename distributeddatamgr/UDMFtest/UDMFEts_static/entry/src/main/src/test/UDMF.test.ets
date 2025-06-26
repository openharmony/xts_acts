/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function UDMFApiTest() {
  describe("UDMFApiTest", (): void => {
    /**
     * @tc.name       : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100
     * @tc.number     : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100
     * @tc.desc       : predicates orderByAsc normal test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
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
    /**
     * @tc.name       : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200
     * @tc.number     : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200
     * @tc.desc       : predicates orderByAsc normal test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200 start');
      let unifiedData = new unifiedDataChannel.UnifiedData();
      let records = unifiedData.getRecords();
      expect(records.length).assertEqual(1);
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0200 end');
      done();
    })
    /**
     * @tc.name       : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0300
     * @tc.number     : SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0300
     * @tc.desc       : predicates orderByAsc normal test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UnifiedDataJsAPITest_0100 start');
      let unifiedRecord = new unifiedDataChannel.UnifiedRecord("general.composite-object",string);
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

