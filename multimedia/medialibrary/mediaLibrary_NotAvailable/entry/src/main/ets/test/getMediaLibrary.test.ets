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

import mediaLibrary from "@ohos.multimedia.mediaLibrary";
import { BusinessError } from '@ohos.base';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";

export default function getMediaLibraryTest() {

     describe("getMediaLibraryTest", () => {

        beforeAll(async () => {
            console.info("beforeAll case");
        });
        beforeEach(() => {
            console.info("beforeEach case");
        });
        afterEach(async () => {
            console.info("afterEach case");
        });
        afterAll(() => {
            console.info("afterAll case");
        });

        /**
         * @tc.number    : sub_media_mediaLibrary_acts_get_instance_001
         * @tc.name      : get_medialibrary_instance_001
         * @tc.desc      : get mediaLibrary instance , expect failed
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("get_medialibrary_instance_001", 0, async (done) => {
            let testNum: string = "get_medialibrary_instance_001";
            try {
                let media: mediaLibrary.MediaLibrary = mediaLibrary.getMediaLibrary(globalThis.abilityContext); 
                console.error(`${testNum} :: create MediaLibrary instance success, expect failed !`);
                expect(false).assertTrue();
                done();
            } catch(error: BusinessError) {
                console.log(`${testNum} :: ${error.code}`);
                console.log(`${testNum}:: create mediaLibrary instance failed :: ${error}`)
                // 20200001 媒体库内部业务定义的错误码
                expect(Number(error.code)).assertEqual(20200001);
                done();
            }
        });
        
     });
}