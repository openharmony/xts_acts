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

import { describe, beforeAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';
import { image } from '@kit.ImageKit';
import { taskpoolTest } from '../MainAbility/utils/taskpool'

export default function imagePixelMapTest() {
  describe('imagePixelMapTest', ()=> {
    beforeAll(async (done:Function)=> {
      console.info("imagePixelMapTest error code beforeEach start");
      done();
    });

    /**
     * @tc.number    ImagePixelMapTest
     * @tc.name      ImagePixelMapErrorCode_0100
     * @tc.desc      image pixelMap error code
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it("ImagePixelMapErrorCode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      image.createPixelMapFromSurface('11111111', region).then(() => {
        console.info('www data Succeeded in creating pixelmap from SurfaceData');
        expect().assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.error(`www data Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        expect(Number(error) == 62980178).assertTrue();
        done();
      });
    });

    /**
     * @tc.number    ImagePixelMapTest
     * @tc.name      ImagePixelMapErrorCode_0200
     * @tc.desc      image pixelMap error code
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it("ImagePixelMapErrorCode_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      image.createPixelMapFromSurface('11111111', null).then(() => {
        console.info('www data Succeeded in creating pixelmap from SurfaceData');
        expect().assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.error(`www data Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        expect(error.code == 62980105).assertTrue();
        done();
      });
    });

    /**
     * @tc.number    ImagePixelMapTest
     * @tc.name      ImagePixelMapErrorCode_0300
     * @tc.desc      image pixelMap error code
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it("ImagePixelMapErrorCode_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      image.createPixelMapFromSurface('11111111').then(() => {
        console.info('Succeeded in creating pixelmap from SurfaceData');
        expect().assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.error(`www data Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        expect(Number(error) == 62980178).assertTrue();
        done();
      });
    });

    /**
     * @tc.number    ImagePixelMapTest
     * @tc.name      ImagePixelMapErrorCode_0400
     * @tc.desc      image pixelMap error code
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it("ImagePixelMapErrorCode_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let context = getContext();
      let resourceMgr = context.resourceManager;
      const fileData = await resourceMgr.getRawFileContent("512.jpg");
      let bufferData: ArrayBuffer = fileData.buffer.slice(0);
      let imageSource = image.createImageSource(bufferData);
      let pixelMap: PixelMap = imageSource.createPixelMapSync();
      taskpoolTest(pixelMap);
      try {
        let staticMetaData = pixelMap.setTransferDetached(null);
        console.info('Succeeded to setTransferDetached');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to setTransferDetached. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 501).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    ImagePixelMapTest
     * @tc.name      ImagePixelMapErrorCode_0500
     * @tc.desc      image pixelMap error code
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it("ImagePixelMapErrorCode_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let context = getContext();
      let resourceMgr = context.resourceManager;
      const fileData = await resourceMgr.getRawFileContent("512.jpg");
      let bufferData: ArrayBuffer = fileData.buffer.slice(0);
      let imageSource = image.createImageSource(bufferData);
      let pixelMap: PixelMap = imageSource.createPixelMapSync();
      console.info('www data is true ' + pixelMap.isStrideAlignment);
      taskpoolTest(pixelMap);
      try {
        let staticMetaData = pixelMap.getMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA);
        console.info('Succeeded to getMetaData');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 501 || Number(error.code) == 62980173).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    ImagePixelMapTest
     * @tc.name      ImagePixelMapErrorCode_0600
     * @tc.desc      image pixelMap error code
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it("ImagePixelMapErrorCode_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let context = getContext();
      let resourceMgr = context.resourceManager;
      const fileData = await resourceMgr.getRawFileContent("512.jpg");
      let bufferData: ArrayBuffer = fileData.buffer.slice(0);
      let imageSource = image.createImageSource(bufferData);
      let pixelMap: PixelMap = imageSource.createPixelMapSync();
      taskpoolTest(pixelMap);
      try {
        let staticMetaData = pixelMap.getMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA);
        console.info('Succeeded to getMetaData');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 501 || Number(error.code) == 62980173).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    ImagePixelMapTest
     * @tc.name      ImagePixelMapErrorCode_0700
     * @tc.desc      image pixelMap error code
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it("ImagePixelMapErrorCode_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let img = getContext().resourceManager.getMediaContentSync($r('app.media.app_icon'));
      let imageSource = image.createImageSource(img.buffer.slice(0));
      let decodingOptions: image.DecodingOptions = {
        desiredDynamicRange: image.DecodingDynamicRange.AUTO
      };
      let pixelmap = imageSource.createPixelMapSync(decodingOptions);
      if (pixelmap != undefined) {
        console.info('www data Succeeded in creating pixelMap object.');
        try {
          let staticMetadata = pixelmap.getMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA);
          console.info('www data getMetadata 111');
          expect().assertFail();
        } catch(error) {
          console.info('pixelmap create failed' + error);
          expect(Number(error.code) == 62980173).assertTrue();
          done();
        }
      } else {
        console.info('www data Failed to create pixelMap.');
        done();
      }
    });

    /**
     * @tc.number    ImagePixelMapTest
     * @tc.name      ImagePixelMapErrorCode_0800
     * @tc.desc      image pixelMap error code
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it("ImagePixelMapErrorCode_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let context = getContext();
      let resourceMgr = context.resourceManager;
      const fileData = await resourceMgr.getRawFileContent('512.jpg');
      let bufferData: ArrayBuffer = fileData.buffer.slice(0);
      let imageSource = image.createImageSource(bufferData);
      let pixelMap: PixelMap = imageSource.createPixelMapSync();
      try {
        let staticMetaData = pixelMap.getMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA);
        console.info('Succeeded to getMetaData');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 62980302 || Number(error.code) == 62980173).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    ImagePixelMapTest
     * @tc.name      ImagePixelMapErrorCode_0900
     * @tc.desc      image pixelMap error code
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it("ImagePixelMapErrorCode_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      try {
        pixelMap.setMemoryNameSync(null);
        console.info('www data Succeeded to setMemoryNameSync');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to getMetaData. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    ImagePixelMapTest
     * @tc.name      ImagePixelMapErrorCode_1000
     * @tc.desc      image pixelMap error code
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it("ImagePixelMapErrorCode_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      try {
        pixelMap.cloneSync();
        console.info('www data Succeeded to cloneSync');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to cloneSync. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 62980103).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    ImagePixelMapTest
     * @tc.name      ImagePixelMapErrorCode_1100
     * @tc.desc      image pixelMap error code
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it("ImagePixelMapErrorCode_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let context = getContext();
      let resourceMgr = context.resourceManager;
      const fileData = await resourceMgr.getRawFileContent("512.jpg");
      let bufferData: ArrayBuffer = fileData.buffer.slice(0);
      let imageSource = image.createImageSource(bufferData);
      let pixelMap: PixelMap = imageSource.createPixelMapSync();
      taskpoolTest(pixelMap);
      try {
        let staticMetaData = pixelMap.cloneSync();
        console.info('Succeeded to cloneSync');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to cloneSync. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 501).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    ImagePixelMapTest
     * @tc.name      ImagePixelMapErrorCode_1200
     * @tc.desc      image pixelMap error code
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it("ImagePixelMapErrorCode_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { 
        editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 } 
      }
      let pixelMap : image.PixelMap = image.createPixelMapSync(color, opts);
      try {
        await pixelMap.clone();
        console.info('www data Succeeded to cloneSync');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to cloneSync. code is ${error.code}, message is ${error.message}`);
        expect(Number(error) == 62980104 || Number(error) == 62980103).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    ImagePixelMapTest
     * @tc.name      ImagePixelMapErrorCode_1300
     * @tc.desc      image pixelMap error code
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it("ImagePixelMapErrorCode_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let context = getContext();
      let resourceMgr = context.resourceManager;
      const fileData = await resourceMgr.getRawFileContent("512.jpg");
      let bufferData: ArrayBuffer = fileData.buffer.slice(0);
      let imageSource = image.createImageSource(bufferData);
      let pixelMap: PixelMap = imageSource.createPixelMapSync();
      taskpoolTest(pixelMap);
      try {
        let staticMetaData = await pixelMap.clone();
        console.info('Succeeded to clone');
        expect().assertFail();
        done();
      } catch(error){
        console.error(`www data Failed to clone. code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code) == 501).assertTrue();
        done();
      }
    });
  })
}