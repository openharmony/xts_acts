/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, expect, it } from '@ohos/hypium'
import baseDdkNdkTest from 'libbaseddkndk.so'

export default function baseDdkNdkJsTest() {
  describe('baseDdkNdkJsTest', () => {
    const TAG: string = "[baseDdkNdkJsTest]";
    const DDK_SUCCESS: number = 0;
    const DDK_FAILURE: number = 28600001;
    const DDK_INVALID_PARAMETER: number = 28600002;
    const DDK_NULL_PTR: number = 28600004;

    /**
     * @tc.name       : testDdkCreateAshmem001
     * @tc.desc       : OH_DDK_CreateAshmem Interface testing
     * @tc.type       : Function
     */
    it('testDdkCreateAshmem001', 0, async (done: Function) => {
      console.info('----------------------testDdkCreateAshmem001---------------------------');
      try {
        const ret = baseDdkNdkTest.ddkCreateAshmemOne();
        console.info("Test result testDdkCreateAshmem001 : " + ret);
        expect(ret).assertEqual(DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testDdkCreateAshmem001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name       : testDdkCreateAshmem002
     * @tc.desc       : OH_DDK_CreateAshmem Interface testing
     * @tc.type       : Function
     */
    it('testDdkCreateAshmem002', 0, async (done: Function) => {
      console.info('----------------------testDdkCreateAshmem002---------------------------');
      try {
        const ret = baseDdkNdkTest.ddkCreateAshmemTwo();
        console.info("Test result testDdkCreateAshmem002 : " + ret);
        expect(ret).assertEqual(DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testDdkCreateAshmem002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name       : testDdkCreateAshmem003
     * @tc.desc       : OH_DDK_CreateAshmem Interface testing
     * @tc.type       : Function
     */
    it('testDdkCreateAshmem003', 0, async (done: Function) => {
      console.info('----------------------testDdkCreateAshmem003---------------------------');
      try {
        const ret = baseDdkNdkTest.ddkCreateAshmemThree();
        console.info("Test result testDdkCreateAshmem003 : " + ret);
        expect(ret).assertEqual(DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testDdkCreateAshmem003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name       : testDdkMapAshmem001
     * @tc.desc       : OH_DDK_MapAshmem Interface testing
     * @tc.type       : Function
     */
    it('testDdkMapAshmem001', 0, async (done: Function) => {
      console.info('----------------------testDdkMapAshmem001---------------------------');
      try {
        const ret = baseDdkNdkTest.ddkMapAshmemOne();
        console.info("Test result testDdkMapAshmem001 : " + ret);
        expect(ret).assertEqual(DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testDdkMapAshmem001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name       : testDdkMapAshmem002
     * @tc.desc       : OH_DDK_MapAshmem Interface testing
     * @tc.type       : Function
     */
    it('testDdkMapAshmem002', 0, async (done: Function) => {
      console.info('----------------------testDdkMapAshmem002---------------------------');
      try {
        const ret = baseDdkNdkTest.ddkMapAshmemTwo();
        console.info("Test result testDdkMapAshmem002 : " + ret);
        expect(ret).assertEqual(DDK_NULL_PTR);
        done();
      } catch (err) {
        console.error(TAG, `testDdkMapAshmem002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name       : testDdkMapAshmem003
     * @tc.desc       : OH_DDK_MapAshmem Interface testing
     * @tc.type       : Function
     */
    it('testDdkMapAshmem003', 0, async (done: Function) => {
      console.info('----------------------testDdkMapAshmem003---------------------------');
      try {
        const ret = baseDdkNdkTest.ddkMapAshmemThree();
        console.info("Test result testDdkMapAshmem003 : " + ret);
        expect(ret).assertEqual(DDK_FAILURE);
        done();
      } catch (err) {
        console.error(TAG, `testDdkMapAshmem003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name       : testDdkUnmapAshmem001
     * @tc.desc       : OH_DDK_UnmapAshmem Interface testing
     * @tc.type       : Function
     */
    it('testDdkUnmapAshmem001', 0, async (done: Function) => {
      console.info('----------------------testDdkUnmapAshmem001---------------------------');
      try {
        const ret = baseDdkNdkTest.ddkUnmapAshmemOne();
        console.info("Test result testDdkUnmapAshmem001 : " + ret);
        expect(ret).assertEqual(DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testDdkUnmapAshmem001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name       : testDdkUnmapAshmem002
     * @tc.desc       : OH_DDK_UnmapAshmem Interface testing
     * @tc.type       : Function
     */
    it('testDdkUnmapAshmem002', 0, async (done: Function) => {
      console.info('----------------------testDdkUnmapAshmem002---------------------------');
      try {
        const ret = baseDdkNdkTest.ddkUnmapAshmemTwo();
        console.info("Test result testDdkUnmapAshmem002 : " + ret);
        expect(ret).assertEqual(DDK_NULL_PTR);
        done();
      } catch (err) {
        console.error(TAG, `testDdkUnmapAshmem002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name       : testDdkDestroyAshmem001
     * @tc.desc       : OH_DDK_DestoryAshmem Interface testing
     * @tc.type       : Function
     */
    it('testDdkDestroyAshmem001', 0, async (done: Function) => {
      console.info('----------------------testDdkDestroyAshmem001---------------------------');
      try {
        const ret = baseDdkNdkTest.ddkDestroyAshmemOne();
        console.info("Test result testDdkDestroyAshmem001 : " + ret);
        expect(ret).assertEqual(DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testDdkDestroyAshmem001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name       : testDdkDestroyAshmem002
     * @tc.desc       : OH_DDK_DestoryAshmem Interface testing
     * @tc.type       : Function
     */
    it('testDdkDestroyAshmem002', 0, async (done: Function) => {
      console.info('----------------------testDdkDestroyAshmem002---------------------------');
      try {
        const ret = baseDdkNdkTest.ddkDestroyAshmemTwo();
        console.info("Test result testDdkDestroyAshmem002 : " + ret);
        expect(ret).assertEqual(DDK_NULL_PTR);
        done();
      } catch (err) {
        console.error(TAG, `testDdkDestroyAshmem002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}
