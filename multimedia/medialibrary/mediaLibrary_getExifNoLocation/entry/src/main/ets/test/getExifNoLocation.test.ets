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
import image from "@ohos.multimedia.image";
import mediaLibrary from "@ohos.multimedia.mediaLibrary";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "deccjsunit/index";
import abilityAccessCtrl from "@ohos.abilityAccessCtrl";
import bundle from "@ohos.bundle";
import uitest from "@ohos.uitest";

import { sleep } from "../../../../../../common";

export default function getExifNoLocation(abilityContext) {
    describe("getExifNoLocation", function () {
        beforeAll(async function () {
            console.info("beforeAll case");

            let permissions = ["ohos.permission.READ_MEDIA"];
            abilityContext.requestPermissionsFromUser(permissions, (data) => {
                console.info(`getPermission requestPermissionsFromUser ${JSON.stringify(data)}`);
            });
            await sleep(200);

            let driver = uitest.Driver.create();
            await sleep(200);

            let button = await driver.findComponent(uitest.ON.text("允许"));
            await button.click();
            let appInfo = await bundle.getApplicationInfo("ohos.acts.multimedia.mediaLibrary", 0, 100);
            let tokenID = appInfo.accessTokenId;
            let atManager = abilityAccessCtrl.createAtManager();
            let isGranted = await atManager.verifyAccessToken(tokenID, "ohos.permission.READ_MEDIA");
            if (isGranted != 0) {
                console.info("getpermission failed");
            }
        });
        beforeEach(function () {
            console.info("beforeEach case");
        });
        afterEach(async function () {
            console.info("afterEach case");
        });
        afterAll(function () {
            console.info("afterAll case");
        });
        let redactionGpsValue = "0/0, 0/0, 0/0, 0/0, 0/0, 0/0, 0/0, 0/0";
        let redactionRefValue = "";
        var media = mediaLibrary.getMediaLibrary(abilityContext);
        const fileKeyObj = mediaLibrary.FileKey;
        let imageType = mediaLibrary.MediaType.IMAGE;

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETEXIFNOLOCATION_001
         * @tc.name      : getImageProperty
         * @tc.desc      : open("r")
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETEXIFNOLOCATION_001", 0, async function (done) {
            try {
                console.info("SUB_MEDIA_MEDIALIBRARY_GETEXIFNOLOCATION_001 start1");
                let fetchOp = {
                    selections: fileKeyObj.RELATIVE_PATH + "= ? AND " + fileKeyObj.MEDIA_TYPE + "= ?",
                    selectionArgs: ["Pictures/Images/", imageType.toString()],
                };
                console.info("SUB_MEDIA_MEDIALIBRARY_GETEXIFNOLOCATION_001 start2");
                let fetchFileResult = await media.getFileAssets(fetchOp);
                const asset = await fetchFileResult.getFirstObject();
                let fd = await asset.open("r");
                console.info("SUB_MEDIA_MEDIALIBRARY_GETEXIFNOLOCATION_001 fd: " + fd);
                const imageSource = image.createImageSource(fd);
                let value1 = await imageSource.getImageProperty("GPSLatitude");
                let value2 = await imageSource.getImageProperty("GPSLongitude");
                let value3 = await imageSource.getImageProperty("GPSLatitudeRef");
                let value4 = await imageSource.getImageProperty("GPSLongitudeRef");
                expect(value1).assertEqual(redactionGpsValue);
                expect(value2).assertEqual(redactionGpsValue);
                expect(value3).assertEqual(redactionRefValue);
                expect(value4).assertEqual(redactionRefValue);
                done();
            } catch (error) {
                console.info("SUB_MEDIA_MEDIALIBRARY_GETEXIFNOLOCATION_001 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });
    });
}
