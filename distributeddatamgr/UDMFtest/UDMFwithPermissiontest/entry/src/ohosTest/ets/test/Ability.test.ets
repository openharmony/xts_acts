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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';

const TAG = '[ttt]'

export default function dragPerssionNormalTest() {
  describe('DragPerssionNormalTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async() => {
     unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
     let options1 = {
        intention: unifiedDataChannel.Intention.DRAG
      };
      await unifiedDataChannel.deleteData(options1).then((data) => {
        let size = data.length;
        console.info(TAG, ` [beforeEach] success to deleteData data.size = ${size}`);
      }).catch((err) => {
        console.info(TAG, ` [beforeEach] Failed to deleteData. code is ${err.code},message is ${err.message} `);
      });
    })
    beforeEach(async() => {
     unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
     let options1 = {
        intention: unifiedDataChannel.Intention.DRAG
      };
      await unifiedDataChannel.deleteData(options1).then((data) => {
        let size = data.length;
        console.info(TAG, ` [beforeEach] success to deleteData data.size = ${size}`);
      }).catch((err) => {
        console.info(TAG, ` [beforeEach] Failed to deleteData. code is ${err.code},message is ${err.message} `);
      });
    })
    afterEach(async() => {
      unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
      let options1 = {
        intention: unifiedDataChannel.Intention.DRAG
      };
      await unifiedDataChannel.deleteData(options1).then((data) => {
        let size = data.length;
        console.info(TAG, ` [beforeEach] success to deleteData data.size = ${size}`);
      }).catch((err) => {
        console.info(TAG, ` [beforeEach] Failed to deleteData. code is ${err.code},message is ${err.message} `);
      });
    })
    afterAll(async() => {
      unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
      let options1 = {
        intention: unifiedDataChannel.Intention.DRAG
      };
      await unifiedDataChannel.deleteData(options1).then((data) => {
        let size = data.length;
        console.info(TAG, ` [beforeEach] success to deleteData data.size = ${size}`);
      }).catch((err) => {
        console.info(TAG, ` [beforeEach] Failed to deleteData. code is ${err.code},message is ${err.message} `);
      });
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0100
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG, unifiedDataChannel.ShareOptions.IN_APP);
        console.info(TAG, `setAppShareOptions is successed`);
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0200
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG, unifiedDataChannel.ShareOptions.CROSS_APP);
        console.info(TAG, `setAppShareOptions is successed`);
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0300
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {

      try {
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DATA_HUB, unifiedDataChannel.ShareOptions.CROSS_APP);
        console.info(TAG, `setAppShareOptions is successed`);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error.code ).assertEqual('401');
      }
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0400
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      try {
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DATA_HUB, unifiedDataChannel.ShareOptions.IN_APP);
        console.info(TAG, `setAppShareOptions is successed`);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error.code ).assertEqual('401');
      }
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0500
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      try {
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG, unifiedDataChannel.ShareOptions.IN_APP);
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG, unifiedDataChannel.ShareOptions.IN_APP);
        console.info(TAG, `setAppShareOptions is successed`);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
        expect(error.code ).assertEqual('20400001');
      }
    })

    
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0600
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      try {
        unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG); 
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
    })   
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0700
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {

      try {
        unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DATA_HUB);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error.code ).assertEqual('401');
      }
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0800
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      try {
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG, unifiedDataChannel.ShareOptions.IN_APP);
        unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0900
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      try {
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG, unifiedDataChannel.ShareOptions.IN_APP);
        unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG, unifiedDataChannel.ShareOptions.IN_APP);
        unifiedDataChannel.removeAppShareOptions(unifiedDataChannel.Intention.DRAG);
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
      }
    })
/**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragPerssionNormal_1000
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : setAppShareOptions
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragPerssionNormal_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async(done: Function) => {
      let options = {
        intention: unifiedDataChannel.Intention.DRAG
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = 'this is textContent';
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.setAppShareOptions(unifiedDataChannel.Intention.DRAG, unifiedDataChannel.ShareOptions.IN_APP);
        console.info(TAG, `SUB_DistributedData_UDMF_SDK_DragPerssionNormal_1000 setAppShareOptions is successed`);
        done();
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect().assertFail();
        done();
      }
      try {
        unifiedDataChannel.insertData(options, unifiedData).then((data) => {
        console.info(TAG + ` SUB_DistributedData_UDMF_SDK_DragPerssionNormal_1000 data = ${data}`);
        expect().assertFail();
        done();
      }).catch((err) => {
        console.error(TAG, `Failed to SUB_DistributedData_UDMF_SDK_DragPerssionNormal_1000 code is ${err.code},message is ${err.message} `);
        expect(err != null).assertFail();
        done();
      });
      }catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error.code == 401 ).assertTrue();
        done();
      }
      
    })
  })
}