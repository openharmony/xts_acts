/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import fs from '@ohos.file.fs'

interface Size {
  height: 4,
  width: 6
}

interface Opts {
  editable: boolean,
  pixelFormat: number,
  size: Size
}

interface packOpts {
  format?: string,
  quality?: number,
  bufferSize?: number
};

export default function imagePackToData() {
  describe("imagePackToData", () => {
    let testContext: common.UIAbilityContext =
      AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;
    let filesDir: string = AppStorage.get<string>("pathDir") as string;
    let globalpixelmap: ESObject;
    let globalPacker: ESObject;
    let globalImagesource: ESObject;
    let filePath: string;
    let fdNumber: ESObject;
    const ERROR_CODE = 401;

    let getFd = async (fileName: string) => {
      console.log('image case filePath is1111', filePath)
      filePath = filesDir + "/" + fileName;
      console.log('image case filePath is1111', filePath)

      let file = fs.openSync(filePath);
      fdNumber = file.fd
      console.log('image case filePath is', fdNumber + filePath)
    }

    beforeAll(async () => {
      console.info("beforeAll case");
    });

    beforeEach(() => {
      console.info("beforeEach case");
    });

    afterEach(async () => {
      if (globalpixelmap != undefined) {
        console.info("globalpixelmap release start");
        try {
          await globalpixelmap.release();
        } catch (error) {
          console.info("globalpixelmap release fail");
        }
      }
      if (globalImagesource != undefined) {
        console.info("globalpixelmap release start");
        try {
          await globalImagesource.release();
        } catch (error) {
          console.info("globalImagesource release fail");
        }
      }
      if (globalPacker != undefined) {
        console.info("globalPacker release start");
        try {
          await globalPacker.release();
        } catch (error) {
          console.info("globalPacker release fail");
        }
      }
      console.info("afterEach case");
    });

    afterAll(() => {
      console.info("afterAll case");
    });

    let packToDataPromise = (done: ESObject, testNum: ESObject, pixFormat: ESObject, arg: ESObject) => {
      let opts: Opts;
      const Color = new ArrayBuffer(96);
      if (pixFormat == 2) {
        opts = {
          editable: true, pixelFormat: 2, size: {
            height: 4, width: 6
          }
        };
      } else {
        opts = {
          editable: true, pixelFormat: 5, size: {
            height: 4, width: 6
          }
        };
      }
      image.createPixelMap(Color, opts).then((pixelmap) => {
        if (pixelmap == undefined) {
          expect(false).assertTrue();
          console.info(`${testNum} create pixelmap fail`);
          done();
        } else {
          globalpixelmap = pixelmap;
          const imagePackerApi = image.createImagePacker();
          if (imagePackerApi == undefined) {
            expect(false).assertTrue();
            console.info(`${testNum} create imagepacker fail`);
            done();
          } else {
            globalPacker = imagePackerApi;
            imagePackerApi.packToData(pixelmap, arg).then((data) => {
              let dataArr = new Uint8Array(data);
              console.info(`${testNum} dataArr.length=` + dataArr.length);
              for (let i = 0; i < dataArr.length; i++) {
                console.info(`dataArr[` + i + `]=` + dataArr[i]);
              }
              expect(data != undefined).assertTrue();
              console.info(`${testNum} success`);
              done();
            }).catch((error: BusinessError) => {
              console.log(`${testNum} error:` + JSON.stringify(error));
              expect().assertFail();
              done();
            });
          }
        }
      }).catch((error: BusinessError) => {
        console.log("createpixelmap error: " + JSON.stringify(error));
        expect().assertFail();
        done();
      });
    }
    
    let packingPromiseFail = (done: ESObject, testNum: ESObject, pixFormat: ESObject, packOpts: ESObject) => {
      const Color = new ArrayBuffer(96);
      let opts: Opts;
      if (pixFormat == 2) {
        opts = {
          editable: true, pixelFormat: 2, size: {
            height: 4, width: 6
          }
        };
      } else {
        opts = {
          editable: true, pixelFormat: 5, size: {
            height: 4, width: 6
          }
        };
      }
      image.createPixelMap(Color, opts).then((pixelmap) => {
        if (pixelmap == undefined) {
          expect(false).assertTrue();
          done();
        } else {
          globalpixelmap = pixelmap;
          const imagePackerApi = image.createImagePacker();
          if (imagePackerApi == undefined) {
            expect(false).assertTrue();
            done();
          } else {
            globalPacker = imagePackerApi;
            imagePackerApi.packToData(pixelmap, packOpts).then((data: ESObject) => {
              expect(false).assertTrue();
              done();
            }).catch((error: BusinessError) => {
              console.log(`${testNum} error:` + JSON.stringify(error));
              console.log(`${testNum} error.code:` + error.code);
              expect(error.code == ERROR_CODE).assertTrue();
              done();
            });
          }
        }
      }).catch((error: BusinessError) => {
        console.log("createpixelmap error: " + JSON.stringify(error));
        expect().assertFail();
        done();
      });
    }

    let packToDataimgSourcePromise = async (done: ESObject, testNum: ESObject, packOpts: ESObject) => {
      try {
        await getFd("test.png");
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info(`${testNum} create image source failed`);
          expect(false).assertTrue();
          done();
        } else {
          globalImagesource = imageSourceApi;
          const imagePackerApi: ESObject = image.createImagePacker();
          if (imagePackerApi == undefined) {
            console.info(`${testNum} create image packer failed`);
            expect(false).assertTrue();
            done();
          } else {
            globalPacker = imagePackerApi;
            imagePackerApi.packToData(imageSourceApi, packOpts).then((data: ESObject) => {
              console.info(`${testNum} success`);
              expect(data != undefined).assertTrue();
              done();
            }).catch((error: BusinessError) => {
              console.info(`${testNum} error: ` + JSON.stringify(error));
              expect(false).assertFail();
              done();
            });
          }
        }
      } catch (error) {
        console.info(`${testNum} error: ` + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    }

    let packToDataimgSourcePromiseFail = async (done: ESObject, testNum: ESObject, packOpts: ESObject) => {
      try {
        await getFd("test.png");
        const imageSourceApi: ESObject = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info(`${testNum} create image source failed`);
          expect(false).assertTrue();
          done();
        } else {
          globalImagesource = imageSourceApi;
          const imagePackerApi = image.createImagePacker();
          if (imagePackerApi == undefined) {
            console.info(`${testNum} create image packer failed`);
            expect(false).assertTrue();
            done();
          } else {
            globalPacker = imagePackerApi;
            imagePackerApi.packToData(imageSourceApi, packOpts).then((data: ESObject) => {
              console.info(`${testNum} failed`);
              expect(data == undefined).assertTrue();
              done();
            }).catch((error: BusinessError) => {
              console.info(`${testNum} error: ` + JSON.stringify(error));
              console.log(`${testNum} error.code:` + error.code);
              expect(error.code == ERROR_CODE).assertTrue();
              done();
            });
          }
        }
      } catch (error) {
        console.info(`${testNum} error: ` + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    }

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0100
     * @tc.name      : SUB_IMAGE_packToData_PixelMap_001
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packToData
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0100", Level.LEVEL0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg",
        quality: 99
      };
      packToDataPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0100", 2, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0200
     * @tc.name      : SUB_IMAGE_packToData_PixelMap_002 - Promise - RGB565 quality 123
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packToData
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0200", Level.LEVEL0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg",
        quality: 123
      };
      packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0200", 2, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0300
     * @tc.name      : SUB_IMAGE_packToData_PixelMap_003 - Promise - RGB565 quality null
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packToData
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0300", Level.LEVEL0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg"
      };
      packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0300", 2, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0400
     * @tc.name      : SUB_IMAGE_packToData_PixelMap_004 - Promise - RGB565 format null
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packToData
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0400", Level.LEVEL0, async (done: Function) => {
      let packOpts: packOpts = {
        quality: 99
      };
      packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0400", 2, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0500
     * @tc.name      : SUB_IMAGE_packToData_PixelMap_005 - Promise - RGB565 wrong format
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packToData
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0500", Level.LEVEL0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/txt", 
        quality: 99
      };
      packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0500", 2, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0600
     * @tc.name      : SUB_IMAGE_packToData_PixelMap_006
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packToData
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0600", Level.LEVEL0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg",
        quality: 50
      };
      packToDataPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0600", 5, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0700
     * @tc.name      : SUB_IMAGE_packToData_PixelMap_007 - Promise - RGB888 quality 123
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packToData
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0700", Level.LEVEL0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg",
        quality: 123
      };
      packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0700", 5, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0800
     * @tc.name      : SUB_IMAGE_packToData_PixelMap_008 - Promise - RGB888 quality null
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packToData
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0800", Level.LEVEL0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg"
      };
      packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0800", 5, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0900
     * @tc.name      : SUB_IMAGE_packToData_PixelMap_009 - Promise - RGB888 format null
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packToData
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0900", Level.LEVEL0, async (done: Function) => {
      let packOpts: packOpts = {
        quality: 99
      };
      packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_0900", 5, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_1000
     * @tc.name      : SUB_IMAGE_packToData_PixelMap_010 - Promise - RGB888 wrong format
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packToData
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_1000", Level.LEVEL0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/txt",
        quality: 99
      };
      packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_1000", 5, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0100
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packToData
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0100", Level.LEVEL0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg", 
        quality: 99, 
        bufferSize: 10485760
      };
      packToDataPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0100", 2, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0200
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packToData
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0200", Level.LEVEL0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg", 
        quality: 99, 
        bufferSize: 20480
      };
      console.info(`SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0200 buffersize: ${packOpts.bufferSize}`);
      packToDataPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0200", 2, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0300-over maxbufferSize
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packToData
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0300", Level.LEVEL0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg", 
        quality: 99, 
        bufferSize: 20000000
      };
      packToDataPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_0300", 2, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0100
     * @tc.name      : packToData ImageSource - promise
     * @tc.desc      : 1.create ImageSource
     *                 2.call packToData
     *                 3.return array
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0100", Level.LEVEL0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg", 
        quality: 99
      };
      packToDataimgSourcePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0100", packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0200
     * @tc.name      : packToData ImageSource - promise - quality 123
     * @tc.desc      : 1.create ImageSource
     *                 2.call packToData
     *                 3.call return array
     *                 4.call return 401
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */

    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0200", Level.LEVEL0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg", 
        quality: 123
      };
      packToDataimgSourcePromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0200", packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0300
     * @tc.name      : packToData ImageSource - promise - no quality
     * @tc.desc      : 1.create ImageSource
     *                 2.call packToData
     *                 3.call return array
     *                 4.call return 401
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0300", Level.LEVEL0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg"
      };
      packToDataimgSourcePromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0300", packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0400
     * @tc.name      : packToData ImageSource - promise - no format
     * @tc.desc      : 1.create ImageSource
     *                 2.call packToData
     *                 3.call return array
     *                 4.call return 401
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0400", Level.LEVEL0, async (done: Function) => {
      let packOpts: packOpts = {
        quality: 50
      };
      packToDataimgSourcePromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0400", packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0500
     * @tc.name      : packToData ImageSource - promise - wrong format
     * @tc.desc      : 1.create ImageSource
     *                 2.call packToData
     *                 3.call return array
     *                 4.call return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0500", Level.LEVEL0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/txt", 
        quality: 99
      };
      packToDataimgSourcePromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_0500", packOpts);
    });
  })
}