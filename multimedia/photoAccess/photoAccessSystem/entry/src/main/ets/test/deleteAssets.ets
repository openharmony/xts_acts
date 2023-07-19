/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect } from 'deccjsunit/index'
import {
  photoKeys,
  fetchOption,
  getFileAsset,
} from '../../../../../../common'

export default function trashAssetsTest () {
  describe('trashAssetsTest', function () {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext)

    async function deleteAssetsCallbackTest (done, testNum, fetchOps) {
      try {
				const asset = await getFileAsset(testNum, fetchOps);
				helper.deleteAssets([asset.uri], async (err) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} err: ${err}`)
              expect(false).assertTrue();
            } else {
              let newFetchResult = await helper.getAssets(fetchOps);
              expect(newFetchResult.getCount()).assertEqual(0);
              newFetchResult.close();
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`)
          }
          done();
				})
      } catch (error) {
				console.info(`${testNum} failed; error: ${error}`);
				expect(false).assertTrue();
        done();
      }
    }

    async function deleteAssetsPromiseTest (done, testNum, fetchOps) {
			try {
				const asset = await getFileAsset(testNum, fetchOps);
				await helper.deleteAssets([asset.uri]);
				let newFetchResult = await helper.getAssets(fetchOps);
				expect(newFetchResult.getCount()).assertEqual(0);
				newFetchResult.close();
        done();
			} catch (error) {
				console.info(`${testNum} failed; error: ${error}`);
				expect(false).assertTrue();
        done();
      }
    }

    //callback
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_TRASH_ASSETS_0000
     * @tc.name      : trash_callback_000
     * @tc.desc      : delete image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('trash_callback_000', 0, async function (done) {
			let testNum = 'trash_callback_000'
			let currentFetchOp = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'trashCb01.jpg');
			await deleteAssetsCallbackTest(done, testNum, currentFetchOp)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_TRASH_ASSETS_0100
     * @tc.name      : trash_callback_001
     * @tc.desc      : delete video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('trash_callback_001', 2, async function (done) {
			let testNum = 'trash_callback_001'
			let currentFetchOp = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'trashCb01.mp4');
			await deleteAssetsCallbackTest(done, testNum, currentFetchOp)
    });

    //promise
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_TRASH_ASSETS_0000
     * @tc.name      : trash_promise_000
     * @tc.desc      : delete image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('trash_promise_000', 2, async function (done) {
			let testNum = 'trash_promise_000'
			let currentFetchOp = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'trashPro01.jpg');
			await deleteAssetsPromiseTest(done, testNum, currentFetchOp)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_TRASH_ASSETS_0100
     * @tc.name      : trash_promise_001
     * @tc.desc      : delete video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('trash_promise_001', 2, async function (done) {
			let testNum = 'trash_promise_001'
			let currentFetchOp = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'trashPro01.mp4');
			await deleteAssetsPromiseTest(done, testNum, currentFetchOp)
    });
  })
}
