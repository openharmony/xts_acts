/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function ActsMediaLibraryStoreTest() {
describe('ActsMediaLibraryStoreTest', function () {
    let TAG = "SUB_MEDIALIBRARY_STORE_TEST===>"
    console.info(`${TAG} SUB_MEDIALIBRARY_STORE_TEST START`)
    /* *
        * @tc.number    : SUB_MEDIALIBRARY_STORE_TEST_0100
        * @tc.name      : storeMediaAsset
        * @tc.desc      : Function of callback
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MEDIALIBRARY_STORE_TEST_0100', 0, async function (done) {
        let option = {
            src : '/data/storage/el2/base/haps/entry/image.png',
            mimeType : 'image/*',
            relativePath : 'Pictures/'
        };
        mediaLibrary.getMediaLibrary().storeMediaAsset(option, (error, value) => {
            if (error) {
                console.info(`storeMediaAsset callback err ${error}`)
                expect(false).assertTrue()
                done()
            } else {
                console.info(`storeMediaAsset callback success ${value}`)
                expect(true).assertTrue()
                done()
            }
        });
    })    

    /* *
        * @tc.number    : SUB_MEDIALIBRARY_STORE_TEST_0200
        * @tc.name      : storeMediaAsset
        * @tc.desc      : Function of Promise
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MEDIALIBRARY_STORE_TEST_0200', 0, async function (done) {
        let option = {
            src : '/data/storage/el2/base/haps/entry/image.png',
            mimeType : 'image/*',
            relativePath : 'Pictures/'
        };
        mediaLibrary.getMediaLibrary().storeMediaAsset(option).then((value) => {
            console.info(`storeMediaAsset Promise success ${value}`)
            expect(true).assertTrue()
            done()
        }).catch((error) => {
            console.info(`storeMediaAsset Promise err ${error}`)
            expect(false).assertTrue()
            done()
        });
    })     
 
    /* *
        * @tc.number    : SUB_MEDIALIBRARY_STORE_TEST_0300
        * @tc.name      : startImagePreview
        * @tc.desc      : Function of callback
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MEDIALIBRARY_STORE_TEST_0300', 0, async function (done) {
        let images = [
            'datashare:///media/xxxx/2',
            'datashare:///media/xxxx/3'
        ];

        let index = 1;
        mediaLibrary.getMediaLibrary().startImagePreview(images, index, (error) => {
            if (error) {
                console.info(`startImagePreview callback err ${error}`)
                expect(false).assertTrue()
                done()
            } else {
                console.info(`startImagePreview callback success ${value}`)
                expect(true).assertTrue()
                done()
            }
        });
    })    

    /* *
        * @tc.number    : SUB_MEDIALIBRARY_STORE_TEST_0400
        * @tc.name      : startImagePreview
        * @tc.desc      : Function of callback
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MEDIALIBRARY_STORE_TEST_0400', 0, async function (done) {
        let images = [
            'datashare:///media/xxxx/2',
            'datashare:///media/xxxx/3'
        ];
 
        mediaLibrary.getMediaLibrary().startImagePreview(images, (error) => {
            if (error) {
                console.info(`startImagePreview callback err ${error}`)
                expect(false).assertTrue()
                done()
            } else {
                console.info(`startImagePreview callback success ${value}`)
                expect(true).assertTrue()
                done()
            }
        });
    })    
    
    /* *
        * @tc.number    : SUB_MEDIALIBRARY_STORE_TEST_0500
        * @tc.name      : startImagePreview
        * @tc.desc      : Function of Promise
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MEDIALIBRARY_STORE_TEST_0500', 0, async function (done) {
        let images = [
            'datashare:///media/xxxx/2',
            'datashare:///media/xxxx/3'
        ];

        let index = 1;
        mediaLibrary.getMediaLibrary().startImagePreview(images, index).then(() => {
            console.info(`storeMediaAsset Promise success ${value}`)
            expect(true).assertTrue()
            done()
        }).catch((error) => {
            console.info(`storeMediaAsset Promise err ${error}`)
            expect(false).assertTrue()
            done()
        });
    })      
  
    /* *
        * @tc.number    : SUB_MEDIALIBRARY_STORE_TEST_0600
        * @tc.name      : startMediaSelect
        * @tc.desc      : Function of callback
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MEDIALIBRARY_STORE_TEST_0600', 0, async function (done) {
        let option = mediaLibrary.MediaSelectOption = {
            type : 'media',
            count : 2
        };
        mediaLibrary.getMediaLibrary().startMediaSelect(option, (error, value) => {
            if (error) {
                console.info(`startMediaSelect callback err ${error}`)
                expect(false).assertTrue()
                done()
            } else {
                console.info(`startMediaSelect callback success ${value}`)
                expect(true).assertTrue()
                done()
            }
        });
    })    

    /* *
        * @tc.number    : SUB_MEDIALIBRARY_STORE_TEST_0700
        * @tc.name      : startMediaSelect
        * @tc.desc      : Function of Promise
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level2
    */
    it('SUB_MEDIALIBRARY_STORE_TEST_0200', 0, async function (done) {
        let option = mediaLibrary.MediaSelectOption = {
            type : 'media',
            count : 2
        };
        mediaLibrary.getMediaLibrary().startMediaSelect(option).then((value) => {
            console.info(`startMediaSelect Promise success ${value}`)
            expect(true).assertTrue()
            done()
        }).catch((error) => {
            console.info(`startMediaSelect Promise err ${error}`)
            expect(false).assertTrue()
            done()
        });
    })      
 
    console.info(`${TAG} SUB_MEDIALIBRARY_STORE_TEST END`)

})
}
