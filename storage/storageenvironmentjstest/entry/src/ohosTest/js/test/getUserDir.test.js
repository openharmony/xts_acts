/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
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
import {
  describe,
  it,
  expect,
  environment,
  isSting,
  isIntNum
} from './Common';
import { TestType, Size, Level } from '@ohos/hypium';

export default function getUserDir() {
  describe('environment_getUserDir_test', function () {

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getDesktopDir_0100
     * @tc.name environment_test_getDesktopDir_001
     * @tc.desc Test getDesktopDir() interfaces.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
    */
    it('environment_test_getDesktopDir_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      try {
        let path = environment.getDesktopDir();
        expect(isSting(path)).assertTrue();
      } catch (e) {
        console.info('environment_test_getDesktopDir_001 has failed for ' + e.message + ',code:' + e.code);
        if (e.message == 'is not callable') {
          expect(true).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getDesktopDir_0200
     * @tc.name environment_test_getDesktopDir_002
     * @tc.desc Test getDesktopDir() interfaces.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
    */
    it('environment_test_getDesktopDir_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      try {
        let path = environment.getDesktopDir("123%$&^");
        expect(false).assertTrue();
      } catch (e) {
        console.info('environment_test_getDesktopDir_002 has failed for ' + e.message + ',code:' + e.code);
        if (isIntNum(e.code)) {
          expect(e.code == 13900020 && e.message == "Invalid argunment").assertTrue();
        } else {
          expect(e.message == 'is not callable').assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getDesktopDir_0300
     * @tc.name environment_test_getDesktopDir_003
     * @tc.desc Test getDesktopDir() interfaces.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
    */
    it('environment_test_getDesktopDir_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      try {
        let path = environment.getDesktopDir(true);
        expect(false).assertTrue();
      } catch (e) {
        console.info('environment_test_getDesktopDir_003 has failed for ' + e.message + ',code:' + e.code);
        if (isIntNum(e.code)) {
          expect(e.code == 13900020 && e.message == "Invalid argunment").assertTrue();
        } else {
          expect(e.message == 'is not callable').assertTrue();
        }
      }
    });

    /**
    * @tc.number SUB_BASIC_FM_FileAPI_Environment_getDesktopDir_0400
    * @tc.name environment_test_getDesktopDir_004
    * @tc.desc Test getDesktopDir() interfaces.
    * @tc.size MEDIUM
    * @tc.type Function
    * @tc.level Level 0
    * @tc.require
   */
    it('environment_test_getDesktopDir_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      try {
        let path = environment.getUserDesktopDir();
        expect(isSting(path)).assertTrue();
      } catch (e) {
        console.info('environment_test_getDesktopDir_004 has failed for ' + e.message + ',code:' + e.code);
        if (e.code == 801) {
          expect(e.code == 801 && e.message == "The device doesn't support this api").assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getDesktopDir_0500
     * @tc.name environment_test_getDesktopDir_005
     * @tc.desc Test getDesktopDir() interfaces.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
    */
    it('environment_test_getDesktopDir_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      try {
        let path = environment.getUserDesktopDir("123%$&^");
        expect(isSting(path)).assertTrue();
      } catch (e) {
        console.info('environment_test_getDesktopDir_005 has failed for ' + e.message + ',code:' + e.code);
        if (e.code == 801) {
          expect(e.code == 801 && e.message == "The device doesn't support this api").assertTrue();
        } else {
          expect(e.code == 401 && e.message == "The input parameter is invalid").assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getDesktopDir_0600
     * @tc.name environment_test_getDesktopDir_006
     * @tc.desc Test getDesktopDir() interfaces.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
    */
    it('environment_test_getDesktopDir_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      try {
        let path = environment.getUserDesktopDir(true);
        expect(isSting(path)).assertTrue();
      } catch (e) {
        console.info('environment_test_getDesktopDir_006 has failed for ' + e.message + ',code:' + e.code);
        if (e.code == 801) {
          expect(e.code == 801 && e.message == "The device doesn't support this api").assertTrue();
        } else {
          expect(e.code == 401 && e.message == "The input parameter is invalid").assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getUserDocumentDir_0100
     * @tc.name environment_test_getUserDocumentDir_001
     * @tc.desc Test getUserDocumentDir() interfaces.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
    */
    it('environment_test_getUserDocumentDir_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      try {
        let path = environment.getUserDocumentDir();
        expect(isSting(path)).assertTrue();
      } catch (e) {
        console.info('environment_test_getUserDocumentDir_001 has failed for ' + e.message + ',code:' + e.code);
        if (e.message == 'is not callable') {
          expect(true).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getUserDocumentDir_0200
     * @tc.name environment_test_getUserDocumentDir_002
     * @tc.desc Test getUserDocumentDir() interfaces.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
    */
    it('environment_test_getUserDocumentDir_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      try {
        let path = environment.getUserDocumentDir("123%$&^");
        expect(false).assertTrue();
      } catch (e) {
        console.info('environment_test_getUserDocumentDir_002 has failed for ' + e.message + ',code:' + e.code);
        if (e.code == 801) {
          expect(e.message == "The device doesn't support this api").assertTrue();
        } else {
          expect(e.code == 401).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getUserDocumentDir_0300
     * @tc.name environment_test_getUserDocumentDir_003
     * @tc.desc Test getUserDocumentDir() interfaces.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
    */
    it('environment_test_getUserDocumentDir_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      try {
        let path = environment.getUserDocumentDir(true);
        expect(false).assertTrue();
      } catch (e) {
        console.info('environment_test_getUserDocumentDir_003 has failed for ' + e.message + ',code:' + e.code);
        if (e.code == 801) {
          expect(e.message == "The device doesn't support this api").assertTrue();
        } else {
          expect(e.code == 401).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getUserDownloadDir_0100
     * @tc.name environment_test_getUserDownloadDir_001
     * @tc.desc Test getUserDownloadDir() interfaces.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
    */
    it('environment_test_getUserDownloadDir_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      try {
        let path = environment.getUserDownloadtDir();
        expect(isSting(path)).assertTrue();
      } catch (e) {
        console.info('environment_test_getUserDownloadDir_001 has failed for ' + e.message + ',code:' + e.code);
        if (e.code == 801) {
          expect(e.message == "The device doesn't support this api").assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getUserDownloadDir_0200
     * @tc.name environment_test_getUserDownloadDir_002
     * @tc.desc Test getUserDownloadDir() interfaces.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
    */
    it('environment_test_getUserDownloadDir_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      try {
        let path = environment.getUserDownloadDir("123%$&^");
        expect(false).assertTrue();
      } catch (e) {
        console.info('environment_test_getUserDownloadDir_002 has failed for ' + e.message + ',code:' + e.code);
        if (e.code == 801) {
          expect(e.message == "The device doesn't support this api").assertTrue();
        } else {
          expect(e.code == 401).assertTrue();
        }
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getUserDownloadDir_0300
     * @tc.name environment_test_getUserDownloadDir_003
     * @tc.desc Test getUserDownloadDir() interfaces.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
    */
    it('environment_test_getUserDownloadDir_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      try {
        let path = environment.getUserDownloadDir(true);
        expect(false).assertTrue();
      } catch (e) {
        console.info('environment_test_getUserDownloadDir_003 has failed for ' + e.message + ',code:' + e.code);
        if (e.code == 801) {
          expect(e.message == "The device doesn't support this api").assertTrue();
        } else {
          expect(e.code == 401).assertTrue();
        }
      }
    });
  });
}