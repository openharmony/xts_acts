/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, it, expect } from '@ohos/hypium';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { systemDateTime } from '@kit.BasicServicesKit';
import {
  photoKeys,
  fetchOption,
  getFileAsset,
  createMovingPhoto
} from '../../../../../../../common'


export default function cloneAssetTest() {

  const context = globalThis.abilityContext;
  let helper = photoAccessHelper.getPhotoAccessHelper(context);
  const fileNameList = ["cloneTest.jpg", "cloneTest.mp4"];

  describe('cloneAssetTest', () => {

    beforeAll(async () => {
      await getPermission();
      await sleep();
    })

    it("test_clone_image_001", 0, async (done: Function) => {
      let testNum: string = "test_clone_image_001";
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "cloneTest.jpg");
        let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(testNum, context, fetchOps);
        if (photoAsset === undefined) {
          console.error(`${testNum} :: getFileAsset cloneTest.jpg failed !`)
          expect(false).assertTrue();
          done();
        }
        let title: string = systemDateTime.getTime().toString();
        console.log(`${testNum} :: title is ${title}`);
        let newPhotoAsset: photoAccessHelper.PhotoAsset | undefined = await photoAsset?.clone(title);
        if (newPhotoAsset === undefined ) {
          console.error(`${testNum} :: clone failed !`)
          expect(false).assertTrue();
          done();
        }
        let fetchCloneOps = fetchOption(testNum, photoKeys.DISPLAY_NAME,(title + ".jpg"));
        let cloneAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(testNum, context, fetchCloneOps);
        if (cloneAsset === undefined) {
          console.error(`${testNum} :: after clone, then query, is undefined !`)
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (error) {
        console.error(`${testNum} :: test failed ,error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    it("test_clone_video_001", 0, async (done: Function) => {
      let testNum: string = "test_clone_video_001";
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "cloneTest.mp4");
        let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(testNum, context, fetchOps);
        if (photoAsset === undefined) {
          console.error(`${testNum} :: getFileAsset cloneTest.mp4 failed !`)
          expect(false).assertTrue();
          done();
        }
        let title: string = systemDateTime.getTime().toString();
        console.log(`${testNum} :: title is ${title}`);
        let newPhotoAsset: photoAccessHelper.PhotoAsset | undefined = await photoAsset?.clone(title);
        if (newPhotoAsset === undefined ) {
          console.error(`${testNum} :: clone failed !`)
          expect(false).assertTrue();
          done();
        }
        let fetchCloneOps = fetchOption(testNum, photoKeys.DISPLAY_NAME,(title + ".mp4"));
        let cloneAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(testNum, context, fetchCloneOps);
        if (cloneAsset === undefined) {
          console.error(`${testNum} :: after clone, then query, is undefined !`)
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (error) {
        console.error(`${testNum} :: test failed ,error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    it("test_clone_moving_photo_001", 0, async (done: Function) => {
      let testNum = "test_clone_moving_photo_001";
      try {
        let title = "cloneMovingPhoto"
        let movingPhotoAsset = await createMovingPhoto(testNum, context, title);
        if (movingPhotoAsset === undefined) {
          console.error(`${testNum} :: create moving Photo failed !`);
          expect(false).assertTrue();
          done();
        }
        let cloneTitle: string = systemDateTime.getTime().toString();
        console.log(`${testNum} :: title is ${title}`);
        let newPhotoAsset: photoAccessHelper.PhotoAsset | undefined = await movingPhotoAsset?.clone(cloneTitle);
        if (newPhotoAsset === undefined ) {
          console.error(`${testNum} :: clone failed !`)
          expect(false).assertTrue();
          done();
        }
        let fetchCloneOps = fetchOption(testNum, photoKeys.DISPLAY_NAME,(cloneTitle + ".jpg"));
        let cloneAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(testNum, context, fetchCloneOps);
        if (cloneAsset === undefined) {
          console.error(`${testNum} :: after clone, then query, is undefined !`)
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (error) {
        console.error(`${testNum} :: test failed ,error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    it("test_clone_long_title_001", 0, async (done: Function) => {
      let testNum: string = "test_clone_long_title_001";
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "cloneTest.jpg");
        let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(testNum, context, fetchOps);
        if (photoAsset === undefined) {
          console.error(`${testNum} :: getFileAsset cloneTest.jpg failed !`)
          expect(false).assertTrue();
          done();
        }
        let title: string = "";
        for (let i = 0; i < 251; i++) {
          title += "1";
        }
        console.log(`${testNum} :: title len is ${title.length}`);
        let newPhotoAsset: photoAccessHelper.PhotoAsset | undefined = await photoAsset?.clone(title);
        if (newPhotoAsset === undefined ) {
          console.error(`${testNum} :: clone failed !`)
          expect(false).assertTrue();
          done();
        }
        let assetName = title + ".jpg";
        console.log(`${testNum} :: assetName len is ${assetName.length}`);
        let fetchCloneOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, assetName);
        let cloneAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(testNum, context, fetchCloneOps);
        if (cloneAsset === undefined) {
          console.error(`${testNum} :: after clone, then query, is undefined !`)
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (error) {
        console.error(`${testNum} :: test failed ,error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    it("test_clone_long_title_002", 0, async (done: Function) => {
      let testNum: string = "test_clone_long_title_002";
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "cloneTest.jpg");
        let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(testNum, context, fetchOps);
        if (photoAsset === undefined) {
          console.error(`${testNum} :: getFileAsset cloneTest.jpg failed !`)
          expect(false).assertTrue();
          done();
        }
        let title: string = "";
        for (let i = 0; i < 252; i++) {
          title += "1";
        }
        console.log(`${testNum} :: title lenght is ${title.length}`);
        let newPhotoAsset: photoAccessHelper.PhotoAsset | undefined = await photoAsset?.clone(title);
        console.log(`${testNum} :: clone success, expect failed !`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test failed ,errorCode is ${error.code}`);
        console.error(`${testNum} :: test failed ,error is ${error}`);
        expect(error.code).assertEqual("401");
        done();
      }
    })

    it("test_clone_with_suffix_001", 0, async (done: Function) => {
      let testNum: string = "test_clone_with_suffix_001";
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "cloneTest.jpg");
        let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(testNum, context, fetchOps);
        if (photoAsset === undefined) {
          console.error(`${testNum} :: getFileAsset cloneTest.jpg failed !`)
          expect(false).assertTrue();
          done();
        }
        let title: string = "xyz.jpg";
        console.log(`${testNum} :: title lenght is ${title}`);
        let newPhotoAsset: photoAccessHelper.PhotoAsset | undefined = await photoAsset?.clone(title);
        console.log(`${testNum} :: clone success, expect failed !`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test failed ,errorCode is ${error.code}`);
        console.error(`${testNum} :: test failed ,error is ${error}`);
        expect(error.code).assertEqual("401");
        done();
      }
    })

    it("test_clone_with_illegal_str_001", 0, async (done: Function) => {
      let testNum: string = "test_clone_with_illegal_str_001";
      try {
        let count = 0;
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "cloneTest.jpg");
        let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(testNum, context, fetchOps);
        if (photoAsset === undefined) {
          console.error(`${testNum} :: getFileAsset cloneTest.jpg failed !`)
          expect(false).assertTrue();
          done();
        }
        let illegalStrList: Array<string> = [
          ".", "\\", "/", ":", "*", "?", "\"", "'", "`", "<", ">", "|", "{", "}", "[", "]"
        ]
        for (let i = 0; i < illegalStrList.length; i++) {
          try {
            let title: string = "test001" + illegalStrList[i];
            photoAsset?.clone(title);
          } catch (error) {
            console.log(`${testNum} :: illegal titile , errCode is ${error.code}`);
            expect(error.code).assertEqual("401");
            count++;
          }
        }
        console.log(`${testNum} :: sumCount = ${count}, illegalStrList len = ${illegalStrList.length}`);
        expect(count).assertEqual(illegalStrList.length);
        done();
      } catch (error) {
        console.error(`${testNum} :: test failed ,errorCode is ${error.code}`);
        console.error(`${testNum} :: test failed ,error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    it("test_clone_with_empty_str_001", 0, async (done: Function) => {
      let testNum: string = "test_clone_with_empty_str_001";
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "cloneTest.jpg");
        let photoAsset: photoAccessHelper.PhotoAsset | undefined = await getFileAsset(testNum, context, fetchOps);
        if (photoAsset === undefined) {
          console.error(`${testNum} :: getFileAsset cloneTest.jpg failed !`)
          expect(false).assertTrue();
          done();
        }
        let title: string = "";
        console.log(`${testNum} :: title lenght is ${title}`);
        let newPhotoAsset: photoAccessHelper.PhotoAsset | undefined = await photoAsset?.clone(title);
        console.log(`${testNum} :: clone success, expect failed !`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: test failed ,errorCode is ${error.code}`);
        console.error(`${testNum} :: test failed ,error is ${error}`);
        expect(error.code).assertEqual("401");
        done();
      }
    })

  });
}