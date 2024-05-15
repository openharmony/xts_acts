/*
 * Copyright (C) 2023-2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file expect in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import UTD from '@ohos.data.uniformTypeDescriptor'
import { BusinessError } from '@ohos.base';

export default function UtdfMimeTypeTest() {
  describe('UtdfMimeTypeTest', () => {
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest_0010
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0010
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/msword"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0010', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0010 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/msword");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WORD_DOC);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0020
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0020
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.ms-execl"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0020', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0020 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.ms-excel");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.EXCEL);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0030
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0030
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/mspowerpoint"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0030', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0030 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/mspowerpoint");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0040
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0040
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/wav"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0040', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0040 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/wav");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WAVEFORM_AUDIO);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0050
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0050
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/wave"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0050', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0050 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/wave");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WAVEFORM_AUDIO);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0060
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0060
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-ms-wm"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0060', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0060 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-ms-wm");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WM);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0070
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0070
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-ms-wmv"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0070', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0070 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-ms-wmv");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WMV);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0080
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0080
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-ms-wmp"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0080', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0080 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-ms-wmp");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WMP);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0090
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0090
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/x-ms-wma"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0090', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0090 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/x-ms-wma");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WMA);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0100
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-ms-wmx"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0100', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0100 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-ms-wmx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WMX);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0110
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0110
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-ms-wvx"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0110', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0110 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-ms-wvx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WVX);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0120
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0120
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/x-ms-wax"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0120', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0120 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/x-ms-wax");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.WINDOWS_MEDIA_WAX);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0130
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0130
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/pdf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0130', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0130 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/pdf");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PDF);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0140
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0140
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/postscript"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0140', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0140 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/postscript");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.POSTSCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0150
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0150
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-photoshop"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0150', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0150 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-photoshop");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHOTOSHOP_IMAGE);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0160
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0160
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/photoshop"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0160', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0160 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/photoshop");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHOTOSHOP_IMAGE);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0170
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0170
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/psd"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0170', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0170 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/psd");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHOTOSHOP_IMAGE);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0180
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0180
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/photoshop"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0180', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0180 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/photoshop");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHOTOSHOP_IMAGE);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0190
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0190
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.microsoft.portable-executable"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0190', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0190 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.microsoft.portable-executable");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PORTABLE_EXECUTABLE);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0200
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/java-archive"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0200', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0200 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/java-archive");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.JAVA_ARCHIVE);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0210
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0210
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-gtar"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0210', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0210 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-gtar");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.GNU_TAR_ARCHIVE);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0220
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0220
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-gzip"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0220', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0220 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-gzip");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.GNU_ZIP_ARCHIVE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0230
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0230
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/gzip"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0230', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0230 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/gzip");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.GNU_ZIP_ARCHIVE);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0240
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0240
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-mobipocket-ebook"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0240', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0240 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-mobipocket-ebook");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MOBI);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0250
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0250
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.amazon.ebook"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0250', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0250 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.amazon.ebook");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AZW);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0260
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0260
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.amazon.mobi8-ebook"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0260', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0260 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.amazon.mobi8-ebook");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AZW3);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0270
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0270
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-mobi8-ebook"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0270', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0270 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-mobi8-ebook");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AZW3);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0280
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0280
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/targa"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0280', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0280 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/targa");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TGA_IMAGE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0290
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0290
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/tga"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0290', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0290 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/tga");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TGA_IMAGE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0300
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/tga"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0300', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0300 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/tga");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TGA_IMAGE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0310
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0310
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/sgi"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0310', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0310 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/sgi");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.SGI_IMAGE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0320
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0320
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/fpx"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0320', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0320 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/fpx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.FLASHPIX_IMAGE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0330
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0330
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.fpx"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0330', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0330 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.fpx");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.FLASHPIX_IMAGE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0340
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0340
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/efax"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0340', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0340 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/efax");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.EFX_FAX);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0350
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0350
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/vnd.rn-realaudio"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0350', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0350 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/vnd.rn-realaudio");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.REALAUDIO);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0360
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0360
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/x-pn-realaudio"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0360', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0360 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/x-pn-realaudio");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.REALAUDIO);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0370
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0370
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/smil"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0370', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0370 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/smil");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.SMIL);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0380
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0380
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-stuffit"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0380', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0380 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-stuffit");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.STUFFIT_ARCHIVE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0390
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0390
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-sit"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0390', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0390 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-sit");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.STUFFIT_ARCHIVE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0400
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/stuffit"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0400', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0400 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/stuffit");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.STUFFIT_ARCHIVE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0410
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0410
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0410', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0410 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
      expect(result).assertEqual(UTD.UniformDataType.WORDPROCESSINGML_DOCUMENT);


    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0420
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0420
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0420', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0420 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
      expect(result).assertEqual(UTD.UniformDataType.SPREADSHEETML_SHEET);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0430
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0430
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.openxmlformats-officedocument.presentationmal.presentation"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0430', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0430 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.openxmlformats-officedocument.presentationml.presentation");
      expect(result).assertEqual(UTD.UniformDataType.PRESENTATIONML_PRESENTATION);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0440
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0440
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.text"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0440', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0440 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.text");
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_TEXT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0450
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0450
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.spreadsheet"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0450', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0450 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.spreadsheet");
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_SPREADSHEET);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0460
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0460
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.presentation"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0460', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0460 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.presentation");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_PRESENTATION);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0470
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0470
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.graphics"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0470', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0470 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.graphics");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_GRAPHICS);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0480
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0480
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.formula"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0480', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0480 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.formula");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENDOCUMENT_FORMULA);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0480
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0490
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/png"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0490', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0490 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/png");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PNG);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0500
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/jpeg"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0500', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0500 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/jpeg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.JPEG);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0510
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0510
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/tiff"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0510', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0510 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/tiff");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TIFF);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0960
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0960
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-quicktime"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0960', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0960 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-quicktime");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.XBITMAP_IMAGE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0520
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0520
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/avi"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0520', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0520 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/avi");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AVI);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0530
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0530
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/msvideo"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0530', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0530 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/msvideo");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AVI);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0540
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0540
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-msvideo"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0540', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0540 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-msvideo");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AVI);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0550
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0550
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/mpg"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0550', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0550 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/mpg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MPEG);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0560
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0560
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/mpeg"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0560', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0560 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/mpeg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MPEG);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0570
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0570
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-mpeg"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0570', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0570 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-mpeg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MPEG);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0580
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0580
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-mpg"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0580', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0580 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-mpg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MPEG);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0590
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0590
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/mp4"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0590', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0590 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/mp4");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MPEG4);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0600
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/mp4v"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0600', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0600 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/mp4v");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MPEG4);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0720
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0720
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/3gpp"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0720', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0720 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/3gpp");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.VIDEO_3GPP);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0610
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0610
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/3gpp2"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0610', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0610 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/3gpp2");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.VIDEO_3GPP2);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0620
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0620
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/ogg"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0620', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0620 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/ogg");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OGG);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0630
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0630
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/aiff"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0630', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0630 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/aiff");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AIFF);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0640
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0640
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/aiff"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0640', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0640 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/pcm");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PCM);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0650
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0650
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/flac"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0650', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0650 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/flac");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.FLAC);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0660
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0660
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/alac"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0660', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0660 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/alac");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.ALAC);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0670
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0670
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/mp3"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0670', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0670 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/mp3");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MP3);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0680
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0680
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/aac"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0680', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0680 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/aac");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AAC);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0690
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0690
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/basic"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0690', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0690 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/basic");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AU_AUDIO);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0700
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/au"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0700', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0700 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/au");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AU_AUDIO);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0710
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0710
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/snd"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0710', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0710 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/snd");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AU_AUDIO);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0730
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0730,audio/x-aiff
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/x-aiff"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0730', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0730 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/x-aiff");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.AIFC_AUDIO);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0740
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0740
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-tar"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0740', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0740 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-tar");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TAR_ARCHIVE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0750
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0750
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/tar"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0750', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0750 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/tar");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TAR_ARCHIVE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0760
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0760
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/zip"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0760', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0760 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/zip");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.ZIP_ARCHIVE);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0770
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0770
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-bzip2"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0770', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0770 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-bzip2");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.BZ2_ARCHIVE);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0780
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0780
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/plain"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0780', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0780 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/plain");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PLAIN_TEXT);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0790
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0790
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/html"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0790', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0790 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/html");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.HTML);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0800
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/xml"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0800', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0800 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/xml");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.XML);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0950
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0950
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/markdown"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0950', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0950 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/markdown");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.MARKDOWN);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0810
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0810
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-perl-script"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0810', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0810 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-perl-script");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PERL_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0820
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0820
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-python-script"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0820', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0820 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-python-script");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PYTHON_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0830
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0830
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-python-script"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0830', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0830 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/ruby-script");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.RUBY_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0840
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0840
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-python-script"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0840', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0840 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-php-script");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHP_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0850
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0850
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/php"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0850', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0850 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/php");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHP_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0860
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0860
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is"application/php"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0860', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0860 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/php");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.PHP_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0870
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0870
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/javascript"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0870', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0870 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/javascript");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.JAVA_SCRIPT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0880
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0880
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/calendar"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0880', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0880 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/calendar");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.CALENDAR);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0890
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0890
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/ics"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0890', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0890 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/ics");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.ICS);
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0900
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/epub+zip"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0900', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0900 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/epub+zip");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.EPUB);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0910
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "font/ttf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0910', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0910 start');
      let result = UTD.getUniformDataTypeByMIMEType("font/ttf");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TRUETYPE_FONT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0910
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0920
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "font/collection"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0920', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0920 start');
      let result = UTD.getUniformDataTypeByMIMEType("font/collection");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TRUETYPE_COLLECTION_FONT);

    }); /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest092 0
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0930
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "font/otf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0930', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0930 start');
      let result = UTD.getUniformDataTypeByMIMEType("font/otf");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.OPENTYPE_FONT);
    });
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKUtdMimeTypeJsAPITest0940
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0940
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vcs"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0940', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0940 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vcs");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.VCS);
    });
  });
}