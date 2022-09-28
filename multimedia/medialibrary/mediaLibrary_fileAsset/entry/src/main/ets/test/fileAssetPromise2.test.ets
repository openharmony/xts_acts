/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import mediaLibrary from '@ohos.multimedia.mediaLibrary';

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';

import {
    sleep,
    IMAGE_TYPE,
    FILEKEY,
    checkAssetsCount,
    nameFetchOps,
} from '../../../../../../common';

export default function fileAssetPromise2Test(abilityContext) {
    describe('fileAssetPromise2Test', function () {
        const media = mediaLibrary.getMediaLibrary(abilityContext);
        beforeAll(async function () {
            console.info('beforeAll case');
        });
        beforeEach(function () {
            console.info('beforeEach case');
        });
        afterEach(async function () {
            console.info('afterEach case');
            await sleep()
        });
        afterAll(function () {
            console.info('afterAll case');
        });

        const checkCommitModify = async function (done, testNum, fetchOp, prop, val) {
            try {
                const fetchFileResult = await media.getFileAssets(fetchOp);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, 1);
                if (!checkAssetCountPass) return;
                const asset = await fetchFileResult.getFirstObject();
                const oldVal = asset[prop]
                asset[prop] = val;
                const id = asset.id;
                await asset.commitModify();
                let currentfetchOp = {
                    selections: FILEKEY.ID + '= ?',
                    selectionArgs: [id + ''],
                };
                const fetchFileResultById = await media.getFileAssets(currentfetchOp);
                const currentAsset = await fetchFileResultById.getFirstObject();
                expect(currentAsset[prop]).assertEqual(val);

                asset[prop] = oldVal;
                await asset.commitModify();
                await fetchFileResult.close();
                done();
            } catch (error) {
                console.info(`${testNum} error : ${error}`)
                expect(false).assertTrue();
                done();
            }
        }
        const staticPropsCommitModify = async (done, testNum, fetchOp, prop, val) => {
            try {
                const fetchFileResult = await media.getFileAssets(fetchOp);
                let checkAssetCountPass = await checkAssetsCount(done, testNum, fetchFileResult, 1);
                if (!checkAssetCountPass) return;
                const asset = await fetchFileResult.getFirstObject();
                try {
                    asset[prop] = val;
                    console.info(`${testNum} failed`)
                    expect(false).assertTrue();
                    done();
                } catch (error) {
                    console.info(`${testNum} passed  : ${error}`)
                    expect(true).assertTrue();
                    done();
                }
                done();
            } catch (error) {
                console.info(`${testNum} error : ${error}`)
                expect(false).assertTrue();
                done();
            }
        }
        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_PROMISE_001
         * @tc.name      : commitModify
         * @tc.desc      : Modify displayName
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_PROMISE_001', 0, async function (done) {
            let testNum = 'SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_PROMISE_001'
            let fetchOp = nameFetchOps(testNum, 'Pictures/ModifyPro/', '01', IMAGE_TYPE);
            let prop = 'displayName'
            let val = new Date().getTime() + '.jpg'
            await checkCommitModify(done, testNum, fetchOp, prop, val)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_PROMISE_002
         * @tc.name      : commitModify
         * @tc.desc      : Modify title
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_PROMISE_002', 0, async function (done) {
            let testNum = 'SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_PROMISE_002'
            let fetchOp = nameFetchOps(testNum, 'Pictures/ModifyPro/', '02', IMAGE_TYPE);
            let prop = 'title'
            let val = new Date().getTime() + 'newTitle'
            await checkCommitModify(done, testNum, fetchOp, prop, val)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_PROMISE_003
         * @tc.name      : commitModify
         * @tc.desc      : Modify relativePath
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_PROMISE_003', 0, async function (done) {
            let testNum = 'SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_PROMISE_003'
            let fetchOp = nameFetchOps(testNum, 'Pictures/ModifyPro/', '03', IMAGE_TYPE);
            let prop = 'relativePath'
            let val = 'Pictures/Temp/'
            await checkCommitModify(done, testNum, fetchOp, prop, val)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_PROMISE_004
         * @tc.name      : commitModify
         * @tc.desc      : Modify orientation
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_PROMISE_004', 0, async function (done) {
            let testNum = 'SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_PROMISE_004'
            let fetchOp = nameFetchOps(testNum, 'Pictures/ModifyPro/', '04', IMAGE_TYPE);
            let prop = 'orientation'
            let val = 1
            await checkCommitModify(done, testNum, fetchOp, prop, val)
        });

        /**
                 * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_PROMISE_005
                 * @tc.name      : commitModify
                 * @tc.desc      : Modify uri
                 * @tc.size      : MEDIUM
                 * @tc.type      : Function
                 * @tc.level     : Level 0
                 */
        it('SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_PROMISE_005', 0, async function (done) {
            let testNum = 'SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_PROMISE_005'
            let fetchOp = nameFetchOps(testNum, 'Pictures/ModifyPro/', '06', IMAGE_TYPE);
            let prop = 'uri'
            let val = 'newUri'
            await staticPropsCommitModify(done, testNum, fetchOp, prop, val)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_PROMISE_006
         * @tc.name      : commitModify
         * @tc.desc      : Modify mediaType
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_PROMISE_006', 0, async function (done) {
            let testNum = 'SUB_MEDIA_MEDIALIBRARY_FILEASSET_COMMITMODIFY_PROMISE_006'
            let fetchOp = nameFetchOps(testNum, 'Pictures/ModifyPro/', '07', IMAGE_TYPE);
            let prop = 'mediaType'
            let val = 'newMediaType'
            await staticPropsCommitModify(done, testNum, fetchOp, prop, val)
        });

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_FILEASSET_ISDIRECTORY_PROMISE_001
         * @tc.name      : isDirectory
         * @tc.desc      : isDirectory asset
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('SUB_MEDIA_MEDIALIBRARY_FILEASSET_ISDIRECTORY_PROMISE_001', 0, async function (done) {
            try {
                let testNum = 'SUB_MEDIA_MEDIALIBRARY_FILEASSET_ISDIRECTORY_PROMISE_001'
                let fetchOp = nameFetchOps(testNum, 'Pictures/ModifyPro/', '05', IMAGE_TYPE);
                const fetchFileResult = await media.getFileAssets(fetchOp);
                const asset = await fetchFileResult.getFirstObject();
                const isDir = await asset.isDirectory();
                expect(isDir).assertEqual(false);
                done();
            } catch (error) {
                console.info('FileAsset isDirectory 001 failed, message = ' + error);
                expect(false).assertTrue();
                done();
            }
        });
    });
}

