/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.ms-powerpoint"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0030', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0030 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.ms-powerpoint");
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
      let result = UTD.getUniformDataTypeByMIMEType("image/x-xbitmap");
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
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/pcm"
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
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/ruby-script"
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
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-php-script"
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
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/calendar"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0890', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0890 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/calendar");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.CALENDAR);
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
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/calendar"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0940', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0940 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/calendar");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.CALENDAR);
    });
    /**
     * @tc.name      : Test_SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0970
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0970
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-apple-diskimage"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0970', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0970 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-apple-diskimage");
      console.log("typeId:" + result);
      expect(result).assertEqual("macos.dmg");
    });
    /**
     * @tc.name      : Test_SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0980
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0980
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-debian-package"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0980', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0980 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-debian-package");
      console.log("typeId:" + result);
      expect(result).assertEqual("debian.deb");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0990
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0990
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.debian.binary-package"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0990', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_0990 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.debian.binary-package");
      console.log("typeId:" + result);
      expect(result).assertEqual("debian.deb");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1000
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/css"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1000', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1000 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/css");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.CSS);
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1010
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1010
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/mpeg"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1010', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1010 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/mpeg");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpeg");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1020
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1020
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-ms-vob"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1020', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1020 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-ms-vob");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.vob");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1030
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1030
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/dv"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1030', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1030 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/dv");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.dif-video");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1050
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1050
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/fli"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1050', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1050 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/fli");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.flc-animation");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1060
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1060
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/flc"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1060', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1060 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/flc");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.flc-animation");
    });

    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1070
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1070
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/x-mng"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1070', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1070 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/x-mng");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mng");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1080
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1080
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/vnd.mpegurl"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1080', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1080 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/vnd.mpegurl");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpegurl-video");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1090
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1090
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/mp2ts"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1090', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1090 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/mp2ts");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TS);
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1100
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "video/mp2t"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1100', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1100 start');
      let result = UTD.getUniformDataTypeByMIMEType("video/mp2t");
      console.log("typeId:" + result);
      expect(result).assertEqual(UTD.UniformDataType.TS);
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1110
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1110
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/amr"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1110', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1110 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/amr");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.amr");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1120
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1120
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/amr-wb"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1120', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1120 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/amr-wb");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.amr-wb");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1130
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1130
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/x-gsm"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1130', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1130 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/x-gsm");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.gsm");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1140
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1140
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/GSM"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1140', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1140 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/GSM");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.gsm");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1150
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1150
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/imelody"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1150', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1150 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/imelody");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.imy");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1160
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1160
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/midi"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1160', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1160 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/midi");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.kar");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1170
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1170
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/mpegurl"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1170', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1170 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/mpegurl");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpegurl-audio");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1180
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1180
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/x-mpegurl"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1180', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1180 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/x-mpegurl");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpegurl-audio");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1190
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1190
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/mpeg"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1190', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1190 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/mpeg");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mpeg-4-audio");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1230
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1230
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/mobile-xmf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1230', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1230 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/mobile-xmf");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mxmf");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1250
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1250
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/x-scpls"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1250', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1250 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/x-scpls");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.pls");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1270
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1270
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/prs.sid"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1270', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1270 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/prs.sid");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.psid");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1280
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1280
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/basic"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1280', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1280 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/basic");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.au-audio");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1290
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1290
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/au"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1290', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1290 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/au");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.au-audio");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1300
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "audio/snd"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1300', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1300 start');
      let result = UTD.getUniformDataTypeByMIMEType("audio/snd");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.au-audio");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1320
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1320
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/gif"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1320', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1320 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/gif");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.gif");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1330
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1330
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/vnd.djvu"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1330', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1330 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/vnd.djvu");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.djvu-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1340
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1340
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-jng"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1340', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1340 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-jng");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.jng-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1350
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1350
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/vnd.zbrush.pcx"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1350', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1350 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/vnd.zbrush.pcx");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.pcx-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1360
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1360
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-portable-bitmap"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1360', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1360 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-portable-bitmap");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.pbm-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1370
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1370
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-portable-bitmap"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1370', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1370 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-portable-graymap");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.pgm-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1380
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1380
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-portable-anymap"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1380', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1380 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-portable-anymap");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.pnm-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1390
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1390
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-portable-pixmap"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1390', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1390 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-portable-pixmap");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.ppm-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1400
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-rgb"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1400', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1400 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-rgb");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.rgb-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1420
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1420
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/svg+xml"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1420', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1420 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/svg+xml");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.svg-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1430
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1430
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/vnd.wap.wbmp"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1430', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1430 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/vnd.wap.wbmp");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.wbmp-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1440
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1440
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-xpixmap"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1440', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1440 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-xpixmap");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.xpixmap-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1450
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1450
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/x-xwindowdump"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1450', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1450 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/x-xwindowdump");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.xwindowdump-image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1460
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1460
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/heif"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1460', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1460 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/heif");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.heif");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1470
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1470
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "image/heic"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1470', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1470 start');
      let result = UTD.getUniformDataTypeByMIMEType("image/heic");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.heic");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1480
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1480
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-cdlink"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1480', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1480 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-cdlink");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.virtual-cd");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1490
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1490
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-haskell"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1490', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1490 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-haskell");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.haskell-script");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1500
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-literate-haskell"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1500', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1500 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-literate-haskell");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.literate-haskell-script");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1510
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1510
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-tcl"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1510', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1510 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-tcl");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.tcl-script");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1520
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1520
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/plain"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1520', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1520 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/plain");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.plain-text");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1540
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1540
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/rtf"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1540', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1540 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/rtf");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.rich-text");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1550
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1550
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/richtext"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1550', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1550 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/richtext");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.rich-text");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1570
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1570
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/csv"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1570', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1570 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/csv");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.comma-separated-values-text");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1590
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1590
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-setext"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1590', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1590 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-setext");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.setext");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1600
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/x-pcs-gcd"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1600', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1600 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/x-pcs-gcd");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.gcd");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1610
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1610
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/tab-separated-values"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1610', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1610 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/tab-separated-values");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.tab-separated-values-text");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1620
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1620
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-pkcs7-certreqresp"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1620', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1620 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-pkcs7-certreqresp");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.p7r");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1630
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1630
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-pem-file"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1630', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1630 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-pem-file");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.pem");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1640
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1640
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-chess-pgn"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1640', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1640 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-chess-pgn");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.chess-pgn");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1650
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1650
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.chess-pgn"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1650', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1650 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.chess-pgn");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.chess-pgn");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1660
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1660
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-lha"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1660', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1660 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-lha");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.lha-archive");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1670
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1670
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-lzh"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1670', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1670 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-lzh");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.lzh-archive");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1680
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1680
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-lzx"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1680', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1680 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-lzx");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.lzx-archive");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1690
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1690
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-gtar"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1690', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1690 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-gtar");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.gnu.gnu-tar-archive");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1700
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-shar"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1700', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1700 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-shar");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.shar-archive");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1710
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1710
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-cpio"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1710', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1710 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-cpio");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.cpio-archive");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1720
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1720
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-mimearchive"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1720', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1720 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-mimearchive");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.web-archive");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1730
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1730
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-ustar"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1730', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1730 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-ustar");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.ustar");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1740
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1740
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "text/mathml"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1740', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1740 start');
      let result = UTD.getUniformDataTypeByMIMEType("text/mathml");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mathml");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1750
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1750
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/mathml+xml"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1750', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1750 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/mathml+xml");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mathml");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1760
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1760
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/xhtml+xml"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1760', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1760 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/xhtml+xml");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.xhtml");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1770
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1770
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/rss+xml"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1770', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1770 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/rss+xml");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.rss");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1780
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1780
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/rdf+xml"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1780', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1780 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/rdf+xml");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.rdf");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1790
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1790
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "model/iges"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1790', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1790 start');
      let result = UTD.getUniformDataTypeByMIMEType("model/iges");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.iges");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1800
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/octet-stream"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1800', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1800 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/octet-stream");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.octet-stream");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1810
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1810
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-iso9660-image"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1810', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1810 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-iso9660-image");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.iso");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1820
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1820
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "model/mesh"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1820', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1820 start');
      let result = UTD.getUniformDataTypeByMIMEType("model/mesh");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.mesh-model");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1830
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1830
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-object"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1830', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1830 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-object");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.c-object");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1840
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1840
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/pkix-cert"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1840', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1840 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/pkix-cert");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.cer-certificate");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1850
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1850
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-x509-ca-cert"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1850', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1850 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-x509-ca-cert");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.crt-certificate");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1860
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1860
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-x509-server-cert"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1860', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1860 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-x509-server-cert");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.crt-certificate");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1870
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1870
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-x509-user-cert"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1870', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1870 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-x509-user-cert");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.crt-certificate");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1880
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1880
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/x-pkix-crl"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1880', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1880 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/x-pkix-crl");
      console.log("typeId:" + result);
      expect(result).assertEqual("general.crl-certificate");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1890
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1890
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.chart"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1890', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1890 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.chart");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.chart");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1900
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.text-master"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1900', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1900 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.text-master");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.text-master");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1910
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1910
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.text-web"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1910', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1910 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.text-web");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.text-web");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1920
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1920
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.database"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1920', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1920 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.database");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.database");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1930
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1930
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.image"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1930', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1930 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.image");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.image");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1940
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1940
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.formula-template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1940', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1940 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.formula-template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.formula-template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1950
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1950
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.chart-template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1950', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1950 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.chart-template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.chart-template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1960
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1960
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.presentation-template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1960', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1960 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.presentation-template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.presentation-template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1970
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1970
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.image-template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1970', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1970 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.image-template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.image-template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1980
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1980
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.graphics-template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1980', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1980 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.graphics-template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.graphics-template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1980
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1980
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.spreadsheet-template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1990', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_1990 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.spreadsheet-template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.spreadsheet-template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2000
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.oasis.opendocument.text-template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2000', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2000 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.oasis.opendocument.text-template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.oasis-open.opendocument.text-template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2010
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2010
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/msword"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2010', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2010 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/msword");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.word.doc");
    });

    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2020
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2020
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.ms-powerpoint"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2020', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2020 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.ms-powerpoint");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.powerpoint.ppt");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2040
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2040
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.ms-excel"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2040', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2030 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.ms-excel");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.excel.xls");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2050
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2050
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.visio"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2050', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2050 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.visio");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.microsoft.visio.vsd");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2060
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2060
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.openxmlformats-officedocument.drawingml.drawing"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2060', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2060 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.openxmlformats-officedocument.drawingml.drawing");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.drawingml.visio");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2070
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2070
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.openxmlformats-officedocument.wordprocessingml.template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2070', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2070 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.openxmlformats-officedocument.wordprocessingml.template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.wordprocessingml.template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2080
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2080
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.openxmlformats-officedocument.presentationml.template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2080', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2080 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.openxmlformats-officedocument.presentationml.template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.presentationml.template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2090
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2090
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.openxmlformats-officedocument.presentationml.slideshow"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2090', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2090 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.openxmlformats-officedocument.presentationml.slideshow");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.presentationml.slideshow");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2100
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.openxmlformats-officedocument.spreadsheetml.template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2100', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2100 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.openxmlformats-officedocument.spreadsheetml.template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openxmlformats.spreadsheetml.template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2110
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2110
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.sun.xml.calc"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2110', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2110 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.sun.xml.calc");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.calc");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2120
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2120
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.sun.xml.draw"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2120', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2120 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.sun.xml.draw");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.draw");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2130
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2130
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.sun.xml.writer.global"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2130', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2130 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.sun.xml.writer.global");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.writer-global");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2140
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2140
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.sun.xml.math"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2140', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2140 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.sun.xml.math");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.math");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2150
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2150
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.sun.xml.writer"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2150', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2150 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.sun.xml.writer");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.writer");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2160
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2160
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.sun.xml.calc.template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2160', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2160 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.sun.xml.calc.template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.calc.template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2170
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2170
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.sun.xml.draw.template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2170', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2170 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.sun.xml.draw.template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.draw.template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2180
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2180
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.sun.xml.impress.template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2180', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2180 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.sun.xml.impress.template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.impress.template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2190
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2190
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is application/vnd.sun.xml.impress.template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2190', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2190 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.sun.xml.impress.template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.impress.template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2200
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.sun.xml.writer.template"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2200', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2200 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.sun.xml.writer.template");
      console.log("typeId:" + result);
      expect(result).assertEqual("org.openoffice.writer.template");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2210
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2210
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.stardivision.draw"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2210', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2210 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.stardivision.draw");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.staroffice.draw");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2220
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2220
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.stardivision.calc"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2220', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2220 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.stardivision.calc");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.staroffice.calc");
    });
    /**
     * @tc.name      : testSUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2230
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2230
     * @tc.desc      : getUniformDataTypeByMIMEType paramter is "application/vnd.stardivision.impress"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2230', 0,  () => {
      console.log('SUB_DistributedData_UDMF_SDK_UtdMimeTypeJsAPITest_2230 start');
      let result = UTD.getUniformDataTypeByMIMEType("application/vnd.stardivision.impress");
      console.log("typeId:" + result);
      expect(result).assertEqual("com.staroffice.impress");
    });
  });
}