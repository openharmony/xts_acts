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
import { BusinessError } from '@ohos.base';
import UTD from '@ohos.data.uniformTypeDescriptor'
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function UDMFApiDescriptorTest() {
  describe("UDMFApiDescriptorTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'UDMFApiDescriptorTest start');
    /**
     * @tc.name       : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9775
     * @tc.number     : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9775
     * @tc.desc       : predicates orderByAsc normal test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9775', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9775 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".xls");
        hilog.info(domain, tag, '%{public}s', "result=====>" + result);
        expect(result == "com.microsoft.excel.xls").assertEqual(true);
      } catch (err : BusinessError) {
        hilog.info(domain, tag, '%{public}s', "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9775 end');
    });
    /**
     * @tc.name       : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9776
     * @tc.number     : SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9776
     * @tc.desc       : predicates orderByAsc normal test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9776', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9776 start');
      try {
        let result = UTD.getUniformDataTypeByFilenameExtension(".xls","general.composite-object");
        hilog.info(domain, tag, '%{public}s', "result=====>" + result);
        expect(result == "com.microsoft.excel.xls").assertEqual(true);
      } catch (err : BusinessError) {
        hilog.info(domain, tag, '%{public}s', "err message:" + err.message + ";err code:" + err.code);
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'SUB_DistributedData_UDMF_SDK_UniformTypeDescriptorJsAPITest_9776 end');
    });
    hilog.info(domain, tag, '%{public}s', 'UDMFApiDescriptorTest end');
  });
}

