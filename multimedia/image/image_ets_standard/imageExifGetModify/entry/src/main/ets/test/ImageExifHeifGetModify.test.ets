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

import hilog from '@ohos.hilog';
import { describe, it, expect } from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import { BusinessError } from '@ohos.base';
import fs from '@ohos.file.fs';

const callbackExpectFail = (done: Function, testTag: string) => {
  try {
    expect().assertFail();
    done();
  } catch (e) {
    const msg = 'Prevents asynchronous intra-call expect from failing to exit the application';
    hilog.info(0x0000, testTag, `getimageProperty failed %{public}s `, msg, e);
    done();
  }
};

export default function imageExifHeifGetModifyTest() {

  describe('ImageExifHeifGetModify', () => {
    let filePath: string;
    let fdNumber: number;

    const getFd = async (fileName: string) => {
      filePath = AppStorage.get('pathDir') + "/" + fileName;
      await fs.open(filePath, fs.OpenMode.READ_WRITE).then(file => {
        fdNumber = file.fd;
        console.info("image case open fd success " + fdNumber);
      })
    }

    const modifyPromiseResult = async (done: Function, testTag: string, key: string,
                                       modifyDate: string, compareDate: string) => {
      await getFd('test_exif_empty.heic');
      let imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info(testTag + " create image source failed");
        expect().assertFail();
        done();
      } else {
        await imageSourceApi.modifyImageProperty(key, modifyDate)
          .then(async () => {
            hilog.info(0x0000, testTag,
              `modifyImageProperty promise success %{public}s `, key);
            let imageSourceApiGet = image.createImageSource(fdNumber);
            imageSourceApiGet.getImageProperty(key, (err: BusinessError, data: string) => {
              if (!err) {
                try {
                  hilog.info(0x0000, testTag,
                    `getModifiedProperty callback success %{public}s %{public}s %{public}s`, key, data, compareDate);
                  if (data == compareDate) {
                    expect(true).assertTrue();
                  done();
                  } else {
                    expect().assertFail();
                    done();
                  }
                } catch (e) {
                  hilog.info(0x0000, testTag,
                    `getimageProperty callback failed %{public}s %{public}s `, key, e);
                  callbackExpectFail(done, testTag);
                }
              } else {
                hilog.info(0x0000, testTag,
                  `getimageProperty callback failed %{public}s %{public}s `, key, err.code);
                callbackExpectFail(done, testTag);
              }
            })
          })
          .catch((err: BusinessError) => {
            hilog.info(0x0000, testTag,
              `modifyImageProperty promise failed %{public}s %{public}s `, key, err.code);
            expect().assertFail();
            done();
          })
      }
    }

    const modifyCallbackResult = async (done: Function, testTag: string, key: string,
                                        modifyDate: string, compareDate: string) => {
      await getFd('test_exif_v2.heic');
      let imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info(testTag + " create image source failed");
        expect().assertFail();
        done();
      } else {
        imageSourceApi.modifyImageProperty(key, modifyDate, async (error: BusinessError) => {
          if (!error) {
            let imageSourceApiGet = image.createImageSource(fdNumber);
            await imageSourceApiGet.getImageProperty(key)
              .then((data: string) => {
                hilog.info(0x0000, testTag,
                  `getModifiedProperty promise success %{public}s %{public}s %{public}s`, key, data, compareDate);
                if (data == compareDate) {
                  expect(true).assertTrue();
                done();
                } else {
                  expect().assertFail();
                  done();
                }
              })
              .catch((err: BusinessError) => {
                hilog.info(0x0000, testTag,
                  `getModifiedProperty promise error %{public}s %{public}s `, key, err.code);
                expect().assertFail();
                done();
              })
          } else {
            hilog.info(0x0000, testTag,
              `modifyImageProperty callback failed %{public}s %{public}s `, key, error.code);
            callbackExpectFail(done, testTag);
          }
        })
      }
    }

    const getPromiseResult = async (done: Function, testTag: string, key: string, value: string) => {
      await getFd('test_exif_v2.heic');
      let imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info(testTag + " create image source failed");
        expect().assertFail();
        done();
      } else {
        await imageSourceApi.getImageProperty(key)
          .then((data: string) => {
            hilog.info(0x0000, testTag,
              `getImageProperty promise success %{public}s %{public}s %{public}s`, key, data, value);
            if (data == value) {
              expect(true).assertTrue();
            done();
            } else {
              expect().assertFail();
              done();
            }
          })
          .catch((err: BusinessError) => {
            hilog.info(0x0000, testTag,
              `getImageProperty promise failed %{public}s %{public}s `, key, err.code);
            expect().assertFail();
            done();
          })
      }
    }

    const modifyPromiseErrorResult = async (done: Function, testTag: string, key: string, errorDate: string,
                                            value: string) => {
      await getFd('test_exif_v2.heic');
      let imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info(testTag + " create image source failed");
        expect().assertFail();
        done();
      } else {
        imageSourceApi.modifyImageProperty(key, errorDate, async (error: BusinessError) => {
          if (!error) {
            hilog.info(0x0000, testTag,
              `modifyPromiseErrorResult modifyImageProperty error code success %{public}s %{public}s`, key, errorDate);
            let imageSourceApiGet = image.createImageSource(fdNumber);
            await imageSourceApiGet.getImageProperty(key)
              .then((data: string) => {
                hilog.info(0x0000, testTag,
                  `modifyPromiseErrorResult getModifiedProperty error success %{public}s %{public}s `, key, data);
              })
            expect().assertFail();
            done();
          } else {
            hilog.info(0x0000, testTag,
              `modifyPromiseErrorResult modifyImageProperty error code compare %{public}s %{public}s %{public}s `,
              key, error.code, '62980135');
            if (62980135 == error.code) {
              let imageSourceApiGet = image.createImageSource(fdNumber);
              await imageSourceApiGet.getImageProperty(key)
                .then((data: string) => {
                  hilog.info(0x0000, testTag,
                    `modifyPromiseErrorResult getModifiedProperty success %{public}s %{public}s %{public}s`, key, data, value);
                  if (data == value) {
                    expect(true).assertTrue();
                    done();
                  } else {
                    expect().assertFail();
                    done();
                  }
                })
                .catch((err: BusinessError) => {
                  hilog.info(0x0000, testTag,
                    `modifyPromiseErrorResult getModifiedProperty error %{public}s %{public}s `, key, err.code);
                  expect().assertFail();
                  done();
                })
            } else {
              expect().assertFail();
              done();
            }
          }
        })
      }
    }

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0100
     * @tc.name      : getImageProperty('BitsPerSample', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('BitsPerSample')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0100'
      const key: string = 'BitsPerSample';
      const value: string = '1, 1, 1';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error BitsPerSample ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0200
     * @tc.name      : getImageProperty('Orientation', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('Orientation')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0200'
      const key: string = 'Orientation';
      const value: string = 'Top-left';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Orientation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0300
     * @tc.name      : getImageProperty('ImageLength', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ImageLength')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0300'
      const key: string = 'ImageLength';
      const value: string = '0';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ImageLength ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0400
     * @tc.name      : getImageProperty('ImageWidth', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ImageWidth')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0400'
      const key: string = 'ImageWidth';
      const value: string = '0';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ImageWidth ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0500
     * @tc.name      : getImageProperty('GPSLatitude', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSLatitude')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0500'
      const key: string = 'GPSLatitude';
      const value: string = '39, 54, 20';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSLatitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0600
     * @tc.name      : getImageProperty('GPSLongitude', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSLongitude')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0600'
      const key: string = 'GPSLongitude';
      const value: string = '120, 52, 26';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSLongitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0700
     * @tc.name      : getImageProperty('GPSLatitudeRef', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSLatitudeRef')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0700'
      const key: string = 'GPSLatitudeRef';
      const value: string = 'N';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSLatitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0800
     * @tc.name      : getImageProperty('GPSLongitudeRef', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSLongitudeRef')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0800'
      const key: string = 'GPSLongitudeRef';
      const value: string = 'E';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSLongitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0900
     * @tc.name      : getImageProperty('DateTimeOriginal', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('DateTimeOriginal')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_0900'
      const key: string = 'DateTimeOriginal';
      const value: string = '2024:01:25 05:51:34';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error DateTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01000
     * @tc.name      : getImageProperty('ExposureTime', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ExposureTime')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01000'
      const key: string = 'ExposureTime';
      const value: string = '1/34 sec.';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ExposureTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01100
     * @tc.name      : getImageProperty('SceneType', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SceneType')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01100'
      const key: string = 'SceneType';
      const value: string = 'Directly photographed';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SceneType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01200
     * @tc.name      : getImageProperty('ISOSpeedRatings', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ISOSpeedRatings')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01200'
      const key: string = 'ISOSpeedRatings';
      const value: string = '1';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ISOSpeedRatings ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01300
     * @tc.name      : getImageProperty('FNumber', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('FNumber')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01300'
      const key: string = 'FNumber';
      const value: string = 'f/1.0';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error FNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01400
     * @tc.name      : getImageProperty('DateTime', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('DateTime')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01400'
      const key: string = 'DateTime';
      const value: string = '2024:12:31';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error DateTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01500
     * @tc.name      : getImageProperty('GPSTimeStamp', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSTimeStamp')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01500'
      const key: string = 'GPSTimeStamp';
      const value: string = '11:37:58.00';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSTimeStamp ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01600
     * @tc.name      : getImageProperty('GPSDateStamp', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSDateStamp')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01600'
      const key: string = 'GPSDateStamp';
      const value: string = '2025:01:11';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDateStamp ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01700
     * @tc.name      : getImageProperty('ImageDescription', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ImageDescription')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01700'
      const key: string = 'ImageDescription';
      const value: string = `_cuva%s\\d`;
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ImageDescription ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01800
     * @tc.name      : getImageProperty('Make', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('Make')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01800'
      const key: string = 'Make';
      const value: string = '华为';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Make ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01900
     * @tc.name      : getImageProperty('Model', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('Model')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_01900'
      const key: string = 'Model';
      const value: string = 'TNY-AL00';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Model ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02000
     * @tc.name      : getImageProperty('PhotoMode', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('PhotoMode')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02000'
      const key: string = 'PhotoMode';
      const value: string = '252';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error PhotoMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02100
     * @tc.name      : getImageProperty('SensitivityType', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SensitivityType')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02100'
      const key: string = 'SensitivityType';
      const value: string = 'Standard output sensitivity (SOS) and ISO speed';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SensitivityType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02200
     * @tc.name      : getImageProperty('StandardOutputSensitivity', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('StandardOutputSensitivity')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02200'
      const key: string = 'StandardOutputSensitivity';
      const value: string = '5';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error StandardOutputSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02300
     * @tc.name      : getImageProperty('RecommendedExposureIndex', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('RecommendedExposureIndex')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02300'
      const key: string = 'RecommendedExposureIndex';
      const value: string = '123';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error RecommendedExposureIndex ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02400
     * @tc.name      : getImageProperty('ApertureValue', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ApertureValue')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02400'
      const key: string = 'ApertureValue';
      const value: string = '4.00 EV (f/4.0)';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ApertureValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02500
     * @tc.name      : getImageProperty('ExposureBiasValue', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ExposureBiasValue')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02500'
      const key: string = 'ExposureBiasValue';
      const value: string = '23.00 EV';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ExposureBiasValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02600
     * @tc.name      : getImageProperty('MeteringMode', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('MeteringMode')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02600'
      const key: string = 'MeteringMode';
      const value: string = 'Pattern';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error MeteringMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02700
     * @tc.name      : getImageProperty('LightSource', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('LightSource')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02700'
      const key: string = 'LightSource';
      const value: string = 'Daylight';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error LightSource ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02800
     * @tc.name      : getImageProperty('Flash', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('Flash')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02800'
      const key: string = 'Flash';
      const value: string = 'Strobe return light not detected';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Flash ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02900
     * @tc.name      : getImageProperty('FocalLength', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('FocalLength')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_02900'
      const key: string = 'FocalLength';
      const value: string = '0.0 mm';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error FocalLength ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03000
     * @tc.name      : getImageProperty('UserComment', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('UserComment')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03000'
      const key: string = 'UserComment';
      const value: string = 'place for user comments';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error UserComment ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03100
     * @tc.name      : getImageProperty('PixelXDimension', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('PixelXDimension')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03100'
      const key: string = 'PixelXDimension';
      const value: string = '123';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error PixelXDimension ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03200
     * @tc.name      : getImageProperty('PixelYDimension', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('PixelYDimension')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03200'
      const key: string = 'PixelYDimension';
      const value: string = '234';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error PixelYDimension ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03300
     * @tc.name      : getImageProperty('WhiteBalance', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('WhiteBalance')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03300'
      const key: string = 'WhiteBalance';
      const value: string = 'Manual white balance';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error WhiteBalance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03400
     * @tc.name      : getImageProperty('FocalLengthIn35mmFilm', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('FocalLengthIn35mmFilm')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03400'
      const key: string = 'FocalLengthIn35mmFilm';
      const value: string = '2';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error FocalLengthIn35mmFilm ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03500
     * @tc.name      : getImageProperty('Compression', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('Compression')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03500'
      const key: string = 'Compression';
      const value: string = 'Uncompressed';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Compression ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03600
     * @tc.name      : getImageProperty('PhotometricInterpretation', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('PhotometricInterpretation')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03600'
      const key: string = 'PhotometricInterpretation';
      const value: string = 'Reversed mono';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error PhotometricInterpretation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03700
     * @tc.name      : getImageProperty('StripOffsets', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('StripOffsets')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03700'
      const key: string = 'StripOffsets';
      const value: string = '123';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error StripOffsets ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03800
     * @tc.name      : getImageProperty('SamplesPerPixel', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SamplesPerPixel')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03800'
      const key: string = 'SamplesPerPixel';
      const value: string = '0';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SamplesPerPixel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03900
     * @tc.name      : getImageProperty('RowsPerStrip', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('RowsPerStrip')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_03900'
      const key: string = 'RowsPerStrip';
      const value: string = '123';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error RowsPerStrip ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04000
     * @tc.name      : getImageProperty('StripByteCounts', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('StripByteCounts')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04000'
      const key: string = 'StripByteCounts';
      const value: string = '123';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error StripByteCounts ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04100
     * @tc.name      : getImageProperty('XResolution', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('XResolution')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04100'
      const key: string = 'XResolution';
      const value: string = ' 0';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error XResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04200
     * @tc.name      : getImageProperty('YResolution', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('YResolution')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04200'
      const key: string = 'YResolution';
      const value: string = ' 0';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error YResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04300
     * @tc.name      : getImageProperty('PlanarConfiguration', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('PlanarConfiguration')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04300'
      const key: string = 'PlanarConfiguration';
      const value: string = 'Chunky format';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error PlanarConfiguration ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04400
     * @tc.name      : getImageProperty('ResolutionUnit', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ResolutionUnit')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04400'
      const key: string = 'ResolutionUnit';
      const value: string = 'Inch';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ResolutionUnit ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04500
     * @tc.name      : getImageProperty('TransferFunction', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('TransferFunction')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04500'
      const key: string = 'TransferFunction';
      const value: string = '3 bytes undefined data';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error TransferFunction ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04600
     * @tc.name      : getImageProperty('Software', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('Software')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04600'
      const key: string = 'Software';
      const value: string = '华为';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Software ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04700
     * @tc.name      : getImageProperty('Artist', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('Artist')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04700'
      const key: string = 'Artist';
      const value: string = 'None';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Artist ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04800
     * @tc.name      : getImageProperty('WhitePoint', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('WhitePoint')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04800'
      const key: string = 'WhitePoint';
      const value: string = '252, 0/0';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error WhitePoint ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04900
     * @tc.name      : getImageProperty('PrimaryChromaticities', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('PrimaryChromaticities')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_04900'
      const key: string = 'PrimaryChromaticities';
      const value: string = ' 0';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error PrimaryChromaticities ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05000
     * @tc.name      : getImageProperty('YCbCrCoefficients', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('YCbCrCoefficients')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05000'
      const key: string = 'YCbCrCoefficients';
      const value: string = '0.299, 0.587, 0.114';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error YCbCrCoefficients ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05100
     * @tc.name      : getImageProperty('YCbCrSubSampling', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('YCbCrSubSampling')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05100'
      const key: string = 'YCbCrSubSampling';
      const value: string = '3, 2';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error YCbCrSubSampling ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05200
     * @tc.name      : getImageProperty('YCbCrPositioning', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('YCbCrPositioning')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05200'
      const key: string = 'YCbCrPositioning';
      const value: string = 'Centered';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error YCbCrPositioning ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05300
     * @tc.name      : getImageProperty('ReferenceBlackWhite', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ReferenceBlackWhite')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05300'
      const key: string = 'ReferenceBlackWhite';
      const value: string = '222,  0, 1.5,  0, 25.2, 25.2';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ReferenceBlackWhite ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05400
     * @tc.name      : getImageProperty('Copyright', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('Copyright')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05400'
      const key: string = 'Copyright';
      const value: string = 'undefined (Photographer) - [None] (Editor)';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Copyright ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05500
     * @tc.name      : getImageProperty('JPEGInterchangeFormat', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('JPEGInterchangeFormat')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05500'
      const key: string = 'JPEGInterchangeFormat';
      const value: string = '2798';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error JPEGInterchangeFormat ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05600
     * @tc.name      : getImageProperty('JPEGInterchangeFormatLength', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('JPEGInterchangeFormatLength')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05600'
      const key: string = 'JPEGInterchangeFormatLength';
      const value: string = '4';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error JPEGInterchangeFormatLength ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05700
     * @tc.name      : getImageProperty('ExposureProgram', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ExposureProgram')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05700'
      const key: string = 'ExposureProgram';
      const value: string = 'Not defined';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ExposureProgram ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05800
     * @tc.name      : getImageProperty('SpectralSensitivity', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SpectralSensitivity')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05800'
      const key: string = 'SpectralSensitivity';
      const value: string = 'abc';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SpectralSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05900
     * @tc.name      : getImageProperty('OECF', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('OECF')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_05900'
      const key: string = 'OECF';
      const value: string = '4 bytes undefined data';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error OECF ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06000
     * @tc.name      : getImageProperty('ExifVersion', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ExifVersion')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06000'
      const key: string = 'ExifVersion';
      const value: string = 'Exif Version 1.1';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ExifVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06100
     * @tc.name      : getImageProperty('DateTimeDigitized', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('DateTimeDigitized')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06100'
      const key: string = 'DateTimeDigitized';
      const value: string = '2022:06:02 15:51:34';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error DateTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06200
     * @tc.name      : getImageProperty('ComponentsConfiguration', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ComponentsConfiguration')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06200'
      const key: string = 'ComponentsConfiguration';
      const value: string = 'Y R G B';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ComponentsConfiguration ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06300
     * @tc.name      : getImageProperty('ShutterSpeedValue', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ShutterSpeedValue')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06300'
      const key: string = 'ShutterSpeedValue';
      const value: string = '2.50 EV (1/6 sec.)';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ShutterSpeedValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06400
     * @tc.name      : getImageProperty('BrightnessValue', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('BrightnessValue')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06400'
      const key: string = 'BrightnessValue';
      const value: string = '2.50 EV (19.38 cd/m^2)';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error BrightnessValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06500
     * @tc.name      : getImageProperty('MaxApertureValue', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('MaxApertureValue')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06500'
      const key: string = 'MaxApertureValue';
      const value: string = '2.50 EV (f/2.4)';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error MaxApertureValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06600
     * @tc.name      : getImageProperty('SubjectDistance', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SubjectDistance')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06600'
      const key: string = 'SubjectDistance';
      const value: string = '2.5 m';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SubjectDistance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06700
     * @tc.name      : getImageProperty('SubjectArea', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SubjectArea')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06700'
      const key: string = 'SubjectArea';
      const value: string = '(x,y) = (12,13)';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SubjectArea ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06800
     * @tc.name      : getImageProperty('MakerNote', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('MakerNote')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06800'
      const key: string = 'MakerNote';
      const value: string = 'HwMnoteCaptureMode:1,HwMnoteBurstNumber:2,HwMnoteFrontCamera:3,HwMnoteRollAngle:4,' +
        'HwMnotePitchAngle:5,HwMnotePhysicalAperture:6,HwMnoteFocusMode:7,HwMnoteFacePointer:122,' +
        'HwMnoteFaceVersion:1,HwMnoteFaceCount:2,HwMnoteFaceConf:3,HwMnoteFaceSmileScore:1 2 3 4 5 6 7 8,' +
        'HwMnoteFaceRect:1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8,HwMnoteFaceLeyeCenter:1 2 3 4,HwMnoteFaceReyeCenter:5 6 7 8,' +
        'HwMnoteFaceMouthCenter:1 2 3 4 5 6 7 8,HwMnoteScenePointer:256,HwMnoteSceneVersion:1,HwMnoteSceneFoodConf:2,' +
        'HwMnoteSceneStageConf:3,HwMnoteSceneBlueSkyConf:4,HwMnoteSceneGreenPlantConf:5,HwMnoteSceneBeachConf:6,' +
        'HwMnoteSceneSnowConf:7,HwMnoteSceneSunsetConf:8,HwMnoteSceneFlowersConf:9,HwMnoteSceneNightConf:10,' +
        'HwMnoteSceneTextConf:11';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error MakerNote ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06900
     * @tc.name      : getImageProperty('SubsecTime', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SubsecTime')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_06900'
      const key: string = 'SubsecTime';
      const value: string = '123456';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SubsecTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07000
     * @tc.name      : getImageProperty('SubsecTimeOriginal', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SubsecTimeOriginal')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07000'
      const key: string = 'SubsecTimeOriginal';
      const value: string = '427000';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SubsecTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07100
     * @tc.name      : getImageProperty('SubsecTimeDigitized', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SubsecTimeDigitized')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07100'
      const key: string = 'SubsecTimeDigitized';
      const value: string = '427000';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SubsecTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07200
     * @tc.name      : getImageProperty('FlashpixVersion', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('FlashpixVersion')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07200'
      const key: string = 'FlashpixVersion';
      const value: string = 'FlashPix Version 1.0';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error FlashpixVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07300
     * @tc.name      : getImageProperty('ColorSpace', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ColorSpace')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07300'
      const key: string = 'ColorSpace';
      const value: string = 'sRGB';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ColorSpace ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07400
     * @tc.name      : getImageProperty('RelatedSoundFile', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('RelatedSoundFile')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07400'
      const key: string = 'RelatedSoundFile';
      const value: string = '/usr/home';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error RelatedSoundFile ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07500
     * @tc.name      : getImageProperty('FlashEnergy', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('FlashEnergy')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07500'
      const key: string = 'FlashEnergy';
      const value: string = '832';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error FlashEnergy ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07600
     * @tc.name      : getImageProperty('SpatialFrequencyResponse', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SpatialFrequencyResponse')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07600'
      const key: string = 'SpatialFrequencyResponse';
      const value: string = '13';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SpatialFrequencyResponse ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07700
     * @tc.name      : getImageProperty('FocalPlaneXResolution', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('FocalPlaneXResolution')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07700'
      const key: string = 'FocalPlaneXResolution';
      const value: string = '1080';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error FocalPlaneXResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07800
     * @tc.name      : getImageProperty('FocalPlaneYResolution', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('FocalPlaneYResolution')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07800'
      const key: string = 'FocalPlaneYResolution';
      const value: string = '880';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error FocalPlaneYResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07900
     * @tc.name      : getImageProperty('FocalPlaneResolutionUnit', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('FocalPlaneResolutionUnit')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_07900'
      const key: string = 'FocalPlaneResolutionUnit';
      const value: string = 'Inch';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error FocalPlaneResolutionUnit ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08000
     * @tc.name      : getImageProperty('SubjectLocation', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SubjectLocation')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08000'
      const key: string = 'SubjectLocation';
      const value: string = '0, 1';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SubjectLocation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08100
     * @tc.name      : getImageProperty('ExposureIndex', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ExposureIndex')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08100'
      const key: string = 'ExposureIndex';
      const value: string = '1.5';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ExposureIndex ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08200
     * @tc.name      : getImageProperty('SensingMethod', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SensingMethod')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08200'
      const key: string = 'SensingMethod';
      const value: string = 'Two-chip color area sensor';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SensingMethod ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08300
     * @tc.name      : getImageProperty('FileSource', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('FileSource')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08300'
      const key: string = 'FileSource';
      const value: string = 'DSC';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error FileSource ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08400
     * @tc.name      : getImageProperty('CFAPattern', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('CFAPattern')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08400'
      const key: string = 'CFAPattern';
      const value: string = '1 bytes undefined data';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error CFAPattern ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08500
     * @tc.name      : getImageProperty('CustomRendered', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('CustomRendered')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08500'
      const key: string = 'CustomRendered';
      const value: string = 'Normal process';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error CustomRendered ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08600
     * @tc.name      : getImageProperty('ExposureMode', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ExposureMode')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08600'
      const key: string = 'ExposureMode';
      const value: string = 'Auto exposure';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ExposureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08700
     * @tc.name      : getImageProperty('DigitalZoomRatio', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('DigitalZoomRatio')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08700'
      const key: string = 'DigitalZoomRatio';
      const value: string = '321';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error DigitalZoomRatio ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08800
     * @tc.name      : getImageProperty('SceneCaptureType', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SceneCaptureType')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08800'
      const key: string = 'SceneCaptureType';
      const value: string = 'Standard';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SceneCaptureType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08900
     * @tc.name      : getImageProperty('GainControl', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GainControl')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_08900'
      const key: string = 'GainControl';
      const value: string = 'Normal';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GainControl ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09000
     * @tc.name      : getImageProperty('Contrast', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('Contrast')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09000'
      const key: string = 'Contrast';
      const value: string = 'Normal';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Contrast ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09100
     * @tc.name      : getImageProperty('Saturation', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('Saturation')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09100'
      const key: string = 'Saturation';
      const value: string = 'Normal';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Saturation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09200
     * @tc.name      : getImageProperty('Sharpness', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('Sharpness')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09200'
      const key: string = 'Sharpness';
      const value: string = 'Normal';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Sharpness ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09300
     * @tc.name      : getImageProperty('DeviceSettingDescription', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('DeviceSettingDescription')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09300'
      const key: string = 'DeviceSettingDescription';
      const value: string = '2xxx';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error DeviceSettingDescription ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09400
     * @tc.name      : getImageProperty('SubjectDistanceRange', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SubjectDistanceRange')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09400'
      const key: string = 'SubjectDistanceRange';
      const value: string = 'Unknown';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SubjectDistanceRange ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09500
     * @tc.name      : getImageProperty('ImageUniqueID', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ImageUniqueID')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09500'
      const key: string = 'ImageUniqueID';
      const value: string = 'FXIC012';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ImageUniqueID ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09600
     * @tc.name      : getImageProperty('GPSVersionID', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSVersionID')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09600'
      const key: string = 'GPSVersionID';
      const value: string = '2.2.0.0';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSVersionID ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09700
     * @tc.name      : getImageProperty('GPSAltitudeRef', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSAltitudeRef')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09700'
      const key: string = 'GPSAltitudeRef';
      const value: string = 'Sea level';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSAltitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09800
     * @tc.name      : getImageProperty('GPSAltitude', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSAltitude')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09800'
      const key: string = 'GPSAltitude';
      const value: string = '0.00';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSAltitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09900
     * @tc.name      : getImageProperty('GPSSatellites', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSSatellites')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_09900'
      const key: string = 'GPSSatellites';
      const value: string = 'xxx';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSSatellites ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010000
     * @tc.name      : getImageProperty('GPSStatus', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSStatus')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010000'
      const key: string = 'GPSStatus';
      const value: string = 'A';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSStatus ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010100
     * @tc.name      : getImageProperty('GPSMeasureMode', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSMeasureMode')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010100'
      const key: string = 'GPSMeasureMode';
      const value: string = '2';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSMeasureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010200
     * @tc.name      : getImageProperty('GPSDOP', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSDOP')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010200'
      const key: string = 'GPSDOP';
      const value: string = '182';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDOP ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010300
     * @tc.name      : getImageProperty('GPSSpeedRef', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSSpeedRef')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010300'
      const key: string = 'GPSSpeedRef';
      const value: string = 'N';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSSpeedRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010400
     * @tc.name      : getImageProperty('GPSSpeed', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSSpeed')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010400'
      const key: string = 'GPSSpeed';
      const value: string = '150';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSSpeed ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010500
     * @tc.name      : getImageProperty('GPSTrackRef', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSTrackRef')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010500'
      const key: string = 'GPSTrackRef';
      const value: string = 'T';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSTrackRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010600
     * @tc.name      : getImageProperty('GPSTrack', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSTrack')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010600'
      const key: string = 'GPSTrack';
      const value: string = '38.0';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSTrack ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010700
     * @tc.name      : getImageProperty('GPSImgDirectionRef', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSImgDirectionRef')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010700'
      const key: string = 'GPSImgDirectionRef';
      const value: string = 'M';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSImgDirectionRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010800
     * @tc.name      : getImageProperty('GPSImgDirection', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSImgDirection')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010800'
      const key: string = 'GPSImgDirection';
      const value: string = '2.23';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSImgDirection ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010900
     * @tc.name      : getImageProperty('GPSMapDatum', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSMapDatum')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_010900'
      const key: string = 'GPSMapDatum';
      const value: string = 'xxx';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSMapDatum ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011000
     * @tc.name      : getImageProperty('GPSDestLatitudeRef', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSDestLatitudeRef')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011000'
      const key: string = 'GPSDestLatitudeRef';
      const value: string = 'N';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDestLatitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011100
     * @tc.name      : getImageProperty('GPSDestLatitude', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSDestLatitude')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011100'
      const key: string = 'GPSDestLatitude';
      const value: string = '33, 22, 11';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDestLatitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011200
     * @tc.name      : getImageProperty('GPSDestLongitudeRef', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSDestLongitudeRef')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011200'
      const key: string = 'GPSDestLongitudeRef';
      const value: string = 'E';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDestLongitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011300
     * @tc.name      : getImageProperty('GPSDestLongitude', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSDestLongitude')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011300'
      const key: string = 'GPSDestLongitude';
      const value: string = '33, 22, 11';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDestLongitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011400
     * @tc.name      : getImageProperty('GPSDestBearingRef', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSDestBearingRef')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011400'
      const key: string = 'GPSDestBearingRef';
      const value: string = 'T';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDestBearingRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011500
     * @tc.name      : getImageProperty('GPSDestBearing', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSDestBearing')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011500'
      const key: string = 'GPSDestBearing';
      const value: string = '2.0';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDestBearing ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011600
     * @tc.name      : getImageProperty('GPSDestDistanceRef', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSDestDistanceRef')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011600'
      const key: string = 'GPSDestDistanceRef';
      const value: string = 'N';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDestDistanceRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011700
     * @tc.name      : getImageProperty('GPSDestDistance', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSDestDistance')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011700'
      const key: string = 'GPSDestDistance';
      const value: string = '10';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDestDistance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011800
     * @tc.name      : getImageProperty('GPSProcessingMethod', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSProcessingMethod')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011800'
      const key: string = 'GPSProcessingMethod';
      const value: string = 'CELLID';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSProcessingMethod ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011900
     * @tc.name      : getImageProperty('GPSAreaInformation', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSAreaInformation')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_011900'
      const key: string = 'GPSAreaInformation';
      const value: string = 'arexxx';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSAreaInformation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012000
     * @tc.name      : getImageProperty('GPSDifferential', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSDifferential')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012000'
      const key: string = 'GPSDifferential';
      const value: string = '0';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDifferential ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012100
     * @tc.name      : getImageProperty('BodySerialNumber', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('BodySerialNumber')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012100'
      const key: string = 'BodySerialNumber';
      const value: string = 'exoch';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error BodySerialNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012200
     * @tc.name      : getImageProperty('CameraOwnerName', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('CameraOwnerName')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012200'
      const key: string = 'CameraOwnerName';
      const value: string = 'c.uec';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error CameraOwnerName ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012300
     * @tc.name      : getImageProperty('CompositeImage', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('CompositeImage')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012300'
      const key: string = 'CompositeImage';
      const value: string = '2';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error CompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012400
     * @tc.name      : getImageProperty('CompressedBitsPerPixel', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('CompressedBitsPerPixel')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012400'
      const key: string = 'CompressedBitsPerPixel';
      const value: string = '24';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error CompressedBitsPerPixel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012500
     * @tc.name      : getImageProperty('DNGVersion', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('DNGVersion')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012500'
      const key: string = 'DNGVersion';
      const value: string = '2, 2, 3, 1';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error DNGVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012600
     * @tc.name      : getImageProperty('DefaultCropSize', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('DefaultCropSize')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012600'
      const key: string = 'DefaultCropSize';
      const value: string = '153, 841';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error DefaultCropSize ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012700
     * @tc.name      : getImageProperty('Gamma', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('Gamma')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012700'
      const key: string = 'Gamma';
      const value: string = '2.5';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Gamma ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012800
     * @tc.name      : getImageProperty('ISOSpeedLatitudeyyy', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ISOSpeedLatitudeyyy')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012800'
      const key: string = 'ISOSpeedLatitudeyyy';
      const value: string = '1456';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ISOSpeedLatitudeyyy ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012900
     * @tc.name      : getImageProperty('ISOSpeedLatitudezzz', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ISOSpeedLatitudezzz')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_012900'
      const key: string = 'ISOSpeedLatitudezzz';
      const value: string = '1456';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ISOSpeedLatitudezzz ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013000
     * @tc.name      : getImageProperty('LensMake', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('LensMake')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013000'
      const key: string = 'LensMake';
      const value: string = 'xxwx';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error LensMake ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013100
     * @tc.name      : getImageProperty('LensModel', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('LensModel')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013100'
      const key: string = 'LensModel';
      const value: string = 'txaw';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error LensModel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013200
     * @tc.name      : getImageProperty('LensSerialNumber', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('LensSerialNumber')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013200'
      const key: string = 'LensSerialNumber';
      const value: string = 'qxhc';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error LensSerialNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013300
     * @tc.name      : getImageProperty('LensSpecification', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('LensSpecification')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013300'
      const key: string = 'LensSpecification';
      const value: string = '0.8, 2.5, 1.5, 0.5';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error LensSpecification ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013400
     * @tc.name      : getImageProperty('NewSubfileType', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('NewSubfileType')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013400'
      const key: string = 'NewSubfileType';
      const value: string = '3';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error NewSubfileType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013500
     * @tc.name      : getImageProperty('OffsetTime', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('OffsetTime')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013500'
      const key: string = 'OffsetTime';
      const value: string = '2024:01:25';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error OffsetTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013600
     * @tc.name      : getImageProperty('OffsetTimeDigitized', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('OffsetTimeDigitized')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013600'
      const key: string = 'OffsetTimeDigitized';
      const value: string = 'cfh';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error OffsetTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013700
     * @tc.name      : getImageProperty('OffsetTimeOriginal', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('OffsetTimeOriginal')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013700'
      const key: string = 'OffsetTimeOriginal';
      const value: string = 'chex';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error OffsetTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013800
     * @tc.name      : getImageProperty('SourceExposureTimesOfCompositeImage', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SourceExposureTimesOfCompositeImage')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013800'
      const key: string = 'SourceExposureTimesOfCompositeImage';
      const value: string = 'xxxw';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SourceExposureTimesOfCompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013900
     * @tc.name      : getImageProperty('SourceImageNumberOfCompositeImage', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SourceImageNumberOfCompositeImage')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_013900'
      const key: string = 'SourceImageNumberOfCompositeImage';
      const value: string = '23, 34';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SourceImageNumberOfCompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014000
     * @tc.name      : getImageProperty('SubfileType', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SubfileType')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014000'
      const key: string = 'SubfileType';
      const value: string = '2';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SubfileType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014100
     * @tc.name      : getImageProperty('GPSHPositioningError', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSHPositioningError')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014100'
      const key: string = 'GPSHPositioningError';
      const value: string = '2.5';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSHPositioningError ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014200
     * @tc.name      : getImageProperty('PhotographicSensitivity', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('PhotographicSensitivity')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014200'
      const key: string = 'PhotographicSensitivity';
      const value: string = '1';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error PhotographicSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014300
     * @tc.name      : getImageProperty('HwMnoteCaptureMode', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteCaptureMode')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014300'
      const key: string = 'HwMnoteCaptureMode';
      const value: string = '1';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteCaptureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014400
     * @tc.name      : getImageProperty('HwMnotePhysicalAperture', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnotePhysicalAperture')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014400'
      const key: string = 'HwMnotePhysicalAperture';
      const value: string = '6';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnotePhysicalAperture ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014500
     * @tc.name      : getImageProperty('HwMnoteRollAngle', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteRollAngle')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014500'
      const key: string = 'HwMnoteRollAngle';
      const value: string = '4';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteRollAngle ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014600
     * @tc.name      : getImageProperty('HwMnotePitchAngle', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnotePitchAngle')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014600'
      const key: string = 'HwMnotePitchAngle';
      const value: string = '5';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnotePitchAngle ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014700
     * @tc.name      : getImageProperty('HwMnoteSceneFoodConf', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteSceneFoodConf')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014700'
      const key: string = 'HwMnoteSceneFoodConf';
      const value: string = '2';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteSceneFoodConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014800
     * @tc.name      : getImageProperty('HwMnoteSceneStageConf', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteSceneStageConf')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014800'
      const key: string = 'HwMnoteSceneStageConf';
      const value: string = '3';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteSceneStageConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014900
     * @tc.name      : getImageProperty('HwMnoteSceneBlueSkyConf', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteSceneBlueSkyConf')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_014900'
      const key: string = 'HwMnoteSceneBlueSkyConf';
      const value: string = '4';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteSceneBlueSkyConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015000
     * @tc.name      : getImageProperty('HwMnoteSceneGreenPlantConf', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteSceneGreenPlantConf')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015000'
      const key: string = 'HwMnoteSceneGreenPlantConf';
      const value: string = '5';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteSceneGreenPlantConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015100
     * @tc.name      : getImageProperty('HwMnoteSceneBeachConf', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteSceneBeachConf')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015100'
      const key: string = 'HwMnoteSceneBeachConf';
      const value: string = '6';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteSceneBeachConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015200
     * @tc.name      : getImageProperty('HwMnoteSceneSnowConf', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteSceneSnowConf')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015200'
      const key: string = 'HwMnoteSceneSnowConf';
      const value: string = '7';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteSceneSnowConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015300
     * @tc.name      : getImageProperty('HwMnoteSceneSunsetConf', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteSceneSunsetConf')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015300'
      const key: string = 'HwMnoteSceneSunsetConf';
      const value: string = '8';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteSceneSunsetConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015400
     * @tc.name      : getImageProperty('HwMnoteSceneFlowersConf', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteSceneFlowersConf')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015400'
      const key: string = 'HwMnoteSceneFlowersConf';
      const value: string = '9';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteSceneFlowersConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015500
     * @tc.name      : getImageProperty('HwMnoteSceneNightConf', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteSceneNightConf')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015500'
      const key: string = 'HwMnoteSceneNightConf';
      const value: string = '10';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteSceneNightConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015600
     * @tc.name      : getImageProperty('HwMnoteSceneTextConf', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteSceneTextConf')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015600'
      const key: string = 'HwMnoteSceneTextConf';
      const value: string = '11';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteSceneTextConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015700
     * @tc.name      : getImageProperty('HwMnoteFaceCount', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteFaceCount')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015700'
      const key: string = 'HwMnoteFaceCount';
      const value: string = '2';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFaceCount ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015800
     * @tc.name      : getImageProperty('HwMnoteFocusMode', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteFocusMode')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015800'
      const key: string = 'HwMnoteFocusMode';
      const value: string = '7';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFocusMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015900
     * @tc.name      : getImageProperty('HwMnoteBurstNumber', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteBurstNumber')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_015900'
      const key: string = 'HwMnoteBurstNumber';
      const value: string = '2';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteBurstNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016000
     * @tc.name      : getImageProperty('HwMnoteFaceConf', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteFaceConf')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016000'
      const key: string = 'HwMnoteFaceConf';
      const value: string = '3';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFaceConf ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016100
     * @tc.name      : getImageProperty('HwMnoteFaceLeyeCenter', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteFaceLeyeCenter')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016100'
      const key: string = 'HwMnoteFaceLeyeCenter';
      const value: string = '1 2 3 4';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFaceLeyeCenter ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016200
     * @tc.name      : getImageProperty('HwMnoteFaceMouthCenter', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteFaceMouthCenter')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016200'
      const key: string = 'HwMnoteFaceMouthCenter';
      const value: string = '1 2 3 4 5 6 7 8';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFaceMouthCenter ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016300
     * @tc.name      : getImageProperty('HwMnoteFacePointer', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteFacePointer')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016300'
      const key: string = 'HwMnoteFacePointer';
      const value: string = '122';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFacePointer ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016400
     * @tc.name      : getImageProperty('HwMnoteFaceRect', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteFaceRect')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016400'
      const key: string = 'HwMnoteFaceRect';
      const value: string = '1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFaceRect ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016500
     * @tc.name      : getImageProperty('HwMnoteFaceReyeCenter', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteFaceReyeCenter')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016500'
      const key: string = 'HwMnoteFaceReyeCenter';
      const value: string = '5 6 7 8';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFaceReyeCenter ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016600
     * @tc.name      : getImageProperty('HwMnoteFaceSmileScore', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteFaceSmileScore')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016600'
      const key: string = 'HwMnoteFaceSmileScore';
      const value: string = '1 2 3 4 5 6 7 8';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFaceSmileScore ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016700
     * @tc.name      : getImageProperty('HwMnoteFaceVersion', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteFaceVersion')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016700'
      const key: string = 'HwMnoteFaceVersion';
      const value: string = '1';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFaceVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016800
     * @tc.name      : getImageProperty('HwMnoteFrontCamera', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteFrontCamera')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016800'
      const key: string = 'HwMnoteFrontCamera';
      const value: string = '3';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFrontCamera ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016900
     * @tc.name      : getImageProperty('HwMnoteScenePointer', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteScenePointer')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_016900'
      const key: string = 'HwMnoteScenePointer';
      const value: string = '256';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteScenePointer ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_017000
     * @tc.name      : getImageProperty('HwMnoteSceneVersion', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteSceneVersion')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_017000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_GETIMAGEPROPERTY_PROMISE_017000'
      const key: string = 'HwMnoteSceneVersion';
      const value: string = '1';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteSceneVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0100
     * @tc.name      : modifyImageProperty('BitsPerSample')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('BitsPerSample', `1,1,1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0100';
      const key: string = 'BitsPerSample';
      const modifyDate: string = `1,1,1`;
      const compareDate: string = `1, 1, 1`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error BitsPerSample ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0200
     * @tc.name      : modifyImageProperty('Orientation')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('Orientation', `1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0200';
      const key: string = 'Orientation';
      const modifyDate: string = `1`;
      const compareDate: string = `Top-left`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Orientation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0300
     * @tc.name      : modifyImageProperty('ImageLength')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ImageLength', `0`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0300';
      const key: string = 'ImageLength';
      const modifyDate: string = `0`;
      const compareDate: string = `0`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ImageLength ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0400
     * @tc.name      : modifyImageProperty('ImageWidth')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ImageWidth', `0`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0400';
      const key: string = 'ImageWidth';
      const modifyDate: string = `0`;
      const compareDate: string = `0`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ImageWidth ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0500
     * @tc.name      : modifyImageProperty('GPSLatitude')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSLatitude', `39,54,20`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0500';
      const key: string = 'GPSLatitude';
      const modifyDate: string = `39,54,20`;
      const compareDate: string = `39, 54, 20`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSLatitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0600
     * @tc.name      : modifyImageProperty('GPSLongitude')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSLongitude', `120/1 52/1 26/1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0600';
      const key: string = 'GPSLongitude';
      const modifyDate: string = `120/1 52/1 26/1`;
      const compareDate: string = `120, 52, 26`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSLongitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0700
     * @tc.name      : modifyImageProperty('GPSLatitudeRef')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSLatitudeRef', `N`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0700';
      const key: string = 'GPSLatitudeRef';
      const modifyDate: string = `N`;
      const compareDate: string = `N`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSLatitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0800
     * @tc.name      : modifyImageProperty('GPSLongitudeRef')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSLongitudeRef', `E`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0800';
      const key: string = 'GPSLongitudeRef';
      const modifyDate: string = `E`;
      const compareDate: string = `E`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSLongitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0900
     * @tc.name      : modifyImageProperty('DateTimeOriginal')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('DateTimeOriginal', `2024:01:25 05:51:34`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_0900';
      const key: string = 'DateTimeOriginal';
      const modifyDate: string = `2024:01:25 05:51:34`;
      const compareDate: string = `2024:01:25 05:51:34`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DateTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01000
     * @tc.name      : modifyImageProperty('ExposureTime')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ExposureTime', `1/34`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01000';
      const key: string = 'ExposureTime';
      const modifyDate: string = `1/34`;
      const compareDate: string = `1/34 sec.`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExposureTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01100
     * @tc.name      : modifyImageProperty('SceneType')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SceneType', `1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01100';
      const key: string = 'SceneType';
      const modifyDate: string = `1`;
      const compareDate: string = `Directly photographed`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SceneType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01200
     * @tc.name      : modifyImageProperty('ISOSpeedRatings')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ISOSpeedRatings', `1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01200';
      const key: string = 'ISOSpeedRatings';
      const modifyDate: string = `1`;
      const compareDate: string = `1`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ISOSpeedRatings ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01300
     * @tc.name      : modifyImageProperty('FNumber')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('FNumber', `1/1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01300';
      const key: string = 'FNumber';
      const modifyDate: string = `1/1`;
      const compareDate: string = `f/1.0`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01400
     * @tc.name      : modifyImageProperty('DateTime')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('DateTime', `2024:12:31`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01400';
      const key: string = 'DateTime';
      const modifyDate: string = `2024:12:31`;
      const compareDate: string = `2024:12:31`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DateTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01500
     * @tc.name      : modifyImageProperty('GPSTimeStamp')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSTimeStamp', `11/1 37/1 58/1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01500';
      const key: string = 'GPSTimeStamp';
      const modifyDate: string = `11/1 37/1 58/1`;
      const compareDate: string = `11:37:58.00`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSTimeStamp ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01600
     * @tc.name      : modifyImageProperty('GPSDateStamp')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSDateStamp', `2025:01:11`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01600';
      const key: string = 'GPSDateStamp';
      const modifyDate: string = `2025:01:11`;
      const compareDate: string = `2025:01:11`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDateStamp ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01700
     * @tc.name      : modifyImageProperty('ImageDescription')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ImageDescription', `_cuva%s\d`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01700';
      const key: string = 'ImageDescription';
      const modifyDate: string = `_cuva%s\\d`;
      const compareDate: string = `_cuva%s\\d`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ImageDescription ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01800
     * @tc.name      : modifyImageProperty('Make')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('Make', `华为`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01800';
      const key: string = 'Make';
      const modifyDate: string = `华为`;
      const compareDate: string = `华为`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Make ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01900
     * @tc.name      : modifyImageProperty('Model')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('Model', `TNY-AL00`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_01900';
      const key: string = 'Model';
      const modifyDate: string = `TNY-AL00`;
      const compareDate: string = `TNY-AL00`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Model ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02000
     * @tc.name      : modifyImageProperty('PhotoMode')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('PhotoMode', `252`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02000';
      const key: string = 'PhotoMode';
      const modifyDate: string = `252`;
      const compareDate: string = `252`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PhotoMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02100
     * @tc.name      : modifyImageProperty('SensitivityType')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SensitivityType', `5`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02100';
      const key: string = 'SensitivityType';
      const modifyDate: string = `5`;
      const compareDate: string = `Standard output sensitivity (SOS) and ISO speed`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SensitivityType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02200
     * @tc.name      : modifyImageProperty('StandardOutputSensitivity')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('StandardOutputSensitivity', `5`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02200';
      const key: string = 'StandardOutputSensitivity';
      const modifyDate: string = `5`;
      const compareDate: string = `5`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error StandardOutputSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02300
     * @tc.name      : modifyImageProperty('RecommendedExposureIndex')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('RecommendedExposureIndex', `123`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02300';
      const key: string = 'RecommendedExposureIndex';
      const modifyDate: string = `123`;
      const compareDate: string = `123`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error RecommendedExposureIndex ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02400
     * @tc.name      : modifyImageProperty('ApertureValue')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ApertureValue', `4/1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02400';
      const key: string = 'ApertureValue';
      const modifyDate: string = `4/1`;
      const compareDate: string = `4.00 EV (f/4.0)`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ApertureValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02500
     * @tc.name      : modifyImageProperty('ExposureBiasValue')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ExposureBiasValue', `23/1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02500';
      const key: string = 'ExposureBiasValue';
      const modifyDate: string = `23/1`;
      const compareDate: string = `23.00 EV`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExposureBiasValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02600
     * @tc.name      : modifyImageProperty('MeteringMode')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('MeteringMode', `5`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02600';
      const key: string = 'MeteringMode';
      const modifyDate: string = `5`;
      const compareDate: string = `Pattern`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error MeteringMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02700
     * @tc.name      : modifyImageProperty('LightSource')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('LightSource', `1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02700';
      const key: string = 'LightSource';
      const modifyDate: string = `1`;
      const compareDate: string = `Daylight`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error LightSource ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02800
     * @tc.name      : modifyImageProperty('Flash')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('Flash', `5`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02800';
      const key: string = 'Flash';
      const modifyDate: string = `5`;
      const compareDate: string = `Strobe return light not detected`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Flash ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02900
     * @tc.name      : modifyImageProperty('FocalLength')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('FocalLength', `0/1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_02900';
      const key: string = 'FocalLength';
      const modifyDate: string = `0/1`;
      const compareDate: string = `0.0 mm`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FocalLength ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03000
     * @tc.name      : modifyImageProperty('UserComment')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('UserComment', `place for user comments`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03000';
      const key: string = 'UserComment';
      const modifyDate: string = `place for user comments`;
      const compareDate: string = `place for user comments`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error UserComment ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03100
     * @tc.name      : modifyImageProperty('PixelXDimension')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('PixelXDimension', `123`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03100';
      const key: string = 'PixelXDimension';
      const modifyDate: string = `123`;
      const compareDate: string = `123`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PixelXDimension ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03200
     * @tc.name      : modifyImageProperty('PixelYDimension')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('PixelYDimension', `234`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03200';
      const key: string = 'PixelYDimension';
      const modifyDate: string = `234`;
      const compareDate: string = `234`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PixelYDimension ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03300
     * @tc.name      : modifyImageProperty('WhiteBalance')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('WhiteBalance', `1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03300';
      const key: string = 'WhiteBalance';
      const modifyDate: string = `1`;
      const compareDate: string = `Manual white balance`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error WhiteBalance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03400
     * @tc.name      : modifyImageProperty('FocalLengthIn35mmFilm')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('FocalLengthIn35mmFilm', `2`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03400';
      const key: string = 'FocalLengthIn35mmFilm';
      const modifyDate: string = `2`;
      const compareDate: string = `2`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FocalLengthIn35mmFilm ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03500
     * @tc.name      : modifyImageProperty('Compression')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('Compression', `1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03500';
      const key: string = 'Compression';
      const modifyDate: string = `1`;
      const compareDate: string = `Uncompressed`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Compression ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03600
     * @tc.name      : modifyImageProperty('PhotometricInterpretation')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('PhotometricInterpretation', `0`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03600';
      const key: string = 'PhotometricInterpretation';
      const modifyDate: string = `0`;
      const compareDate: string = `Reversed mono`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PhotometricInterpretation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03700
     * @tc.name      : modifyImageProperty('StripOffsets')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('StripOffsets', `123`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03700';
      const key: string = 'StripOffsets';
      const modifyDate: string = `123`;
      const compareDate: string = `123`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error StripOffsets ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03800
     * @tc.name      : modifyImageProperty('SamplesPerPixel')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SamplesPerPixel', `0`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03800';
      const key: string = 'SamplesPerPixel';
      const modifyDate: string = `0`;
      const compareDate: string = `0`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SamplesPerPixel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03900
     * @tc.name      : modifyImageProperty('RowsPerStrip')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('RowsPerStrip', `123`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_03900';
      const key: string = 'RowsPerStrip';
      const modifyDate: string = `123`;
      const compareDate: string = `123`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error RowsPerStrip ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04000
     * @tc.name      : modifyImageProperty('StripByteCounts')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('StripByteCounts', `123`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04000';
      const key: string = 'StripByteCounts';
      const modifyDate: string = `123`;
      const compareDate: string = `123`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error StripByteCounts ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04100
     * @tc.name      : modifyImageProperty('XResolution')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('XResolution', `0/1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04100';
      const key: string = 'XResolution';
      const modifyDate: string = `0/1`;
      const compareDate: string = ` 0`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error XResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04200
     * @tc.name      : modifyImageProperty('YResolution')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('YResolution', `0/1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04200';
      const key: string = 'YResolution';
      const modifyDate: string = `0/1`;
      const compareDate: string = ` 0`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error YResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04300
     * @tc.name      : modifyImageProperty('PlanarConfiguration')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('PlanarConfiguration', `1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04300';
      const key: string = 'PlanarConfiguration';
      const modifyDate: string = `1`;
      const compareDate: string = `Chunky format`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PlanarConfiguration ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04400
     * @tc.name      : modifyImageProperty('ResolutionUnit')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ResolutionUnit', `2`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04400';
      const key: string = 'ResolutionUnit';
      const modifyDate: string = `2`;
      const compareDate: string = `Inch`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ResolutionUnit ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04500
     * @tc.name      : modifyImageProperty('TransferFunction')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('TransferFunction', `abc`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04500';
      const key: string = 'TransferFunction';
      const modifyDate: string = `abc`;
      const compareDate: string = `3 bytes undefined data`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error TransferFunction ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04600
     * @tc.name      : modifyImageProperty('Software')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('Software', `华为`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04600';
      const key: string = 'Software';
      const modifyDate: string = `华为`;
      const compareDate: string = `华为`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Software ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04700
     * @tc.name      : modifyImageProperty('Artist')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('Artist', `None`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04700';
      const key: string = 'Artist';
      const modifyDate: string = `None`;
      const compareDate: string = `None`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Artist ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04800
     * @tc.name      : modifyImageProperty('WhitePoint')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('WhitePoint', `252/1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04800';
      const key: string = 'WhitePoint';
      const modifyDate: string = `252/1`;
      const compareDate: string = `252, 0/0`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error WhitePoint ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04900
     * @tc.name      : modifyImageProperty('PrimaryChromaticities')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('PrimaryChromaticities', `0/1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_04900';
      const key: string = 'PrimaryChromaticities';
      const modifyDate: string = `0/1`;
      const compareDate: string = ` 0`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PrimaryChromaticities ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_05000
     * @tc.name      : modifyImageProperty('YCbCrCoefficients')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('YCbCrCoefficients', `299/1000 587/1000 114/1000`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_05000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_05000';
      const key: string = 'YCbCrCoefficients';
      const modifyDate: string = `299/1000 587/1000 114/1000`;
      const compareDate: string = `0.299, 0.587, 0.114`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error YCbCrCoefficients ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_05100
     * @tc.name      : modifyImageProperty('YCbCrSubSampling')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('YCbCrSubSampling', `3 2`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_05100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_05100';
      const key: string = 'YCbCrSubSampling';
      const modifyDate: string = `3 2`;
      const compareDate: string = `3, 2`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error YCbCrSubSampling ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_05200
     * @tc.name      : modifyImageProperty('YCbCrPositioning')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('YCbCrPositioning', `1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_05200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_05200';
      const key: string = 'YCbCrPositioning';
      const modifyDate: string = `1`;
      const compareDate: string = `Centered`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error YCbCrPositioning ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_05300
     * @tc.name      : modifyImageProperty('ReferenceBlackWhite')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ReferenceBlackWhite', `222 0 1.5 0 25.2 25.2`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_05300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_05300';
      const key: string = 'ReferenceBlackWhite';
      const modifyDate: string = `222 0 1.5 0 25.2 25.2`;
      const compareDate: string = `222,  0, 1.5,  0, 25.2, 25.2`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ReferenceBlackWhite ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_05400
     * @tc.name      : modifyImageProperty('Copyright')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('Copyright', `undefined`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_05400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_05400';
      const key: string = 'Copyright';
      const modifyDate: string = `undefined`;
      const compareDate: string = `undefined (Photographer) - [None] (Editor)`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Copyright ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_05700
     * @tc.name      : modifyImageProperty('ExposureProgram')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ExposureProgram', `0`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_05700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_05700';
      const key: string = 'ExposureProgram';
      const modifyDate: string = `0`;
      const compareDate: string = `Not defined`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExposureProgram ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_05800
     * @tc.name      : modifyImageProperty('SpectralSensitivity')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SpectralSensitivity', `abc`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_05800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_05800';
      const key: string = 'SpectralSensitivity';
      const modifyDate: string = `abc`;
      const compareDate: string = `abc`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SpectralSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_05900
     * @tc.name      : modifyImageProperty('OECF')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('OECF', `excc`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_05900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_05900';
      const key: string = 'OECF';
      const modifyDate: string = `excc`;
      const compareDate: string = `4 bytes undefined data`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error OECF ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06000
     * @tc.name      : modifyImageProperty('ExifVersion')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ExifVersion', `0110`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06000';
      const key: string = 'ExifVersion';
      const modifyDate: string = `0110`;
      const compareDate: string = `Exif Version 1.1`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExifVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06100
     * @tc.name      : modifyImageProperty('DateTimeDigitized')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('DateTimeDigitized', `2022:06:02 15:51:34`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06100';
      const key: string = 'DateTimeDigitized';
      const modifyDate: string = `2022:06:02 15:51:34`;
      const compareDate: string = `2022:06:02 15:51:34`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DateTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06200
     * @tc.name      : modifyImageProperty('ComponentsConfiguration')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ComponentsConfiguration', `1456`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06200';
      const key: string = 'ComponentsConfiguration';
      const modifyDate: string = `1456`;
      const compareDate: string = `Y R G B`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ComponentsConfiguration ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06300
     * @tc.name      : modifyImageProperty('ShutterSpeedValue')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ShutterSpeedValue', `5/2`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06300';
      const key: string = 'ShutterSpeedValue';
      const modifyDate: string = `5/2`;
      const compareDate: string = `2.50 EV (1/6 sec.)`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ShutterSpeedValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06400
     * @tc.name      : modifyImageProperty('BrightnessValue')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('BrightnessValue', `5/2`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06400';
      const key: string = 'BrightnessValue';
      const modifyDate: string = `5/2`;
      const compareDate: string = `2.50 EV (19.38 cd/m^2)`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error BrightnessValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06500
     * @tc.name      : modifyImageProperty('MaxApertureValue')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('MaxApertureValue', `5/2`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06500';
      const key: string = 'MaxApertureValue';
      const modifyDate: string = `5/2`;
      const compareDate: string = `2.50 EV (f/2.4)`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error MaxApertureValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06600
     * @tc.name      : modifyImageProperty('SubjectDistance')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SubjectDistance', `5/2`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06600';
      const key: string = 'SubjectDistance';
      const modifyDate: string = `5/2`;
      const compareDate: string = `2.5 m`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubjectDistance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06700
     * @tc.name      : modifyImageProperty('SubjectArea')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SubjectArea', `12 13`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06700';
      const key: string = 'SubjectArea';
      const modifyDate: string = `12 13`;
      const compareDate: string = `(x,y) = (12,13)`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubjectArea ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06900
     * @tc.name      : modifyImageProperty('SubsecTime')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SubsecTime', `123456`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_06900';
      const key: string = 'SubsecTime';
      const modifyDate: string = `123456`;
      const compareDate: string = `123456`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubsecTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07000
     * @tc.name      : modifyImageProperty('SubsecTimeOriginal')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SubsecTimeOriginal', `427000`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07000';
      const key: string = 'SubsecTimeOriginal';
      const modifyDate: string = `427000`;
      const compareDate: string = `427000`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubsecTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07100
     * @tc.name      : modifyImageProperty('SubsecTimeDigitized')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SubsecTimeDigitized', `427000`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07100';
      const key: string = 'SubsecTimeDigitized';
      const modifyDate: string = `427000`;
      const compareDate: string = `427000`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubsecTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07200
     * @tc.name      : modifyImageProperty('FlashpixVersion')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('FlashpixVersion', `0100`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07200';
      const key: string = 'FlashpixVersion';
      const modifyDate: string = `0100`;
      const compareDate: string = `FlashPix Version 1.0`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FlashpixVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07300
     * @tc.name      : modifyImageProperty('ColorSpace')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ColorSpace', `1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07300';
      const key: string = 'ColorSpace';
      const modifyDate: string = `1`;
      const compareDate: string = `sRGB`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ColorSpace ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07400
     * @tc.name      : modifyImageProperty('RelatedSoundFile')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('RelatedSoundFile', `/usr/home`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07400';
      const key: string = 'RelatedSoundFile';
      const modifyDate: string = `/usr/home`;
      const compareDate: string = `/usr/home`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error RelatedSoundFile ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07500
     * @tc.name      : modifyImageProperty('FlashEnergy')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('FlashEnergy', `832/1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07500';
      const key: string = 'FlashEnergy';
      const modifyDate: string = `832/1`;
      const compareDate: string = `832`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FlashEnergy ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07600
     * @tc.name      : modifyImageProperty('SpatialFrequencyResponse')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SpatialFrequencyResponse', `13`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07600';
      const key: string = 'SpatialFrequencyResponse';
      const modifyDate: string = `13`;
      const compareDate: string = `13`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SpatialFrequencyResponse ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07700
     * @tc.name      : modifyImageProperty('FocalPlaneXResolution')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('FocalPlaneXResolution', `1080/1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07700';
      const key: string = 'FocalPlaneXResolution';
      const modifyDate: string = `1080/1`;
      const compareDate: string = `1080`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FocalPlaneXResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07800
     * @tc.name      : modifyImageProperty('FocalPlaneYResolution')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('FocalPlaneYResolution', `880/1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07800';
      const key: string = 'FocalPlaneYResolution';
      const modifyDate: string = `880/1`;
      const compareDate: string = `880`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FocalPlaneYResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07900
     * @tc.name      : modifyImageProperty('FocalPlaneResolutionUnit')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('FocalPlaneResolutionUnit', `2`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_07900';
      const key: string = 'FocalPlaneResolutionUnit';
      const modifyDate: string = `2`;
      const compareDate: string = `Inch`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FocalPlaneResolutionUnit ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08000
     * @tc.name      : modifyImageProperty('SubjectLocation')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SubjectLocation', `0 1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08000';
      const key: string = 'SubjectLocation';
      const modifyDate: string = `0 1`;
      const compareDate: string = `0, 1`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubjectLocation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08100
     * @tc.name      : modifyImageProperty('ExposureIndex')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ExposureIndex', `3/2`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08100';
      const key: string = 'ExposureIndex';
      const modifyDate: string = `3/2`;
      const compareDate: string = `1.5`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExposureIndex ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08200
     * @tc.name      : modifyImageProperty('SensingMethod')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SensingMethod', `3`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08200';
      const key: string = 'SensingMethod';
      const modifyDate: string = `3`;
      const compareDate: string = `Two-chip color area sensor`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SensingMethod ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08300
     * @tc.name      : modifyImageProperty('FileSource')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('FileSource', `3`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08300';
      const key: string = 'FileSource';
      const modifyDate: string = `3`;
      const compareDate: string = `DSC`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FileSource ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08400
     * @tc.name      : modifyImageProperty('CFAPattern')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('CFAPattern', `3`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08400';
      const key: string = 'CFAPattern';
      const modifyDate: string = `3`;
      const compareDate: string = `1 bytes undefined data`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error CFAPattern ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08500
     * @tc.name      : modifyImageProperty('CustomRendered')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('CustomRendered', `0`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08500';
      const key: string = 'CustomRendered';
      const modifyDate: string = `0`;
      const compareDate: string = `Normal process`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error CustomRendered ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08600
     * @tc.name      : modifyImageProperty('ExposureMode')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ExposureMode', `0`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08600';
      const key: string = 'ExposureMode';
      const modifyDate: string = `0`;
      const compareDate: string = `Auto exposure`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExposureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08700
     * @tc.name      : modifyImageProperty('DigitalZoomRatio')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('DigitalZoomRatio', `321/1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08700';
      const key: string = 'DigitalZoomRatio';
      const modifyDate: string = `321/1`;
      const compareDate: string = `321`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DigitalZoomRatio ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08800
     * @tc.name      : modifyImageProperty('SceneCaptureType')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SceneCaptureType', `0`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08800';
      const key: string = 'SceneCaptureType';
      const modifyDate: string = `0`;
      const compareDate: string = `Standard`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SceneCaptureType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08900
     * @tc.name      : modifyImageProperty('GainControl')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GainControl', `0`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_08900';
      const key: string = 'GainControl';
      const modifyDate: string = `0`;
      const compareDate: string = `Normal`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GainControl ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09000
     * @tc.name      : modifyImageProperty('Contrast')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('Contrast', `0`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09000';
      const key: string = 'Contrast';
      const modifyDate: string = `0`;
      const compareDate: string = `Normal`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Contrast ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09100
     * @tc.name      : modifyImageProperty('Saturation')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('Saturation', `0`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09100';
      const key: string = 'Saturation';
      const modifyDate: string = `0`;
      const compareDate: string = `Normal`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Saturation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09200
     * @tc.name      : modifyImageProperty('Sharpness')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('Sharpness', `0`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09200';
      const key: string = 'Sharpness';
      const modifyDate: string = `0`;
      const compareDate: string = `Normal`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Sharpness ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09300
     * @tc.name      : modifyImageProperty('DeviceSettingDescription')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('DeviceSettingDescription', `2xxx`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09300';
      const key: string = 'DeviceSettingDescription';
      const modifyDate: string = `2xxx`;
      const compareDate: string = `2xxx`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DeviceSettingDescription ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09400
     * @tc.name      : modifyImageProperty('SubjectDistanceRange')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SubjectDistanceRange', `0`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09400';
      const key: string = 'SubjectDistanceRange';
      const modifyDate: string = `0`;
      const compareDate: string = `Unknown`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubjectDistanceRange ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09500
     * @tc.name      : modifyImageProperty('ImageUniqueID')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ImageUniqueID', `FXIC012`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09500';
      const key: string = 'ImageUniqueID';
      const modifyDate: string = `FXIC012`;
      const compareDate: string = `FXIC012`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ImageUniqueID ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09600
     * @tc.name      : modifyImageProperty('GPSVersionID')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSVersionID', `2.2.0.0`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09600';
      const key: string = 'GPSVersionID';
      const modifyDate: string = `2.2.0.0`;
      const compareDate: string = `2.2.0.0`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSVersionID ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09700
     * @tc.name      : modifyImageProperty('GPSAltitudeRef')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSAltitudeRef', `0`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09700';
      const key: string = 'GPSAltitudeRef';
      const modifyDate: string = `0`;
      const compareDate: string = `Sea level`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSAltitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09800
     * @tc.name      : modifyImageProperty('GPSAltitude')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSAltitude', `0/100`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09800';
      const key: string = 'GPSAltitude';
      const modifyDate: string = `0/100`;
      const compareDate: string = `0.00`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSAltitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09900
     * @tc.name      : modifyImageProperty('GPSSatellites')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSSatellites', `xxx`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_09900';
      const key: string = 'GPSSatellites';
      const modifyDate: string = `xxx`;
      const compareDate: string = `xxx`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSSatellites ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010000
     * @tc.name      : modifyImageProperty('GPSStatus')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSStatus', `A`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010000';
      const key: string = 'GPSStatus';
      const modifyDate: string = `A`;
      const compareDate: string = `A`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSStatus ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010100
     * @tc.name      : modifyImageProperty('GPSMeasureMode')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSMeasureMode', `2`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010100';
      const key: string = 'GPSMeasureMode';
      const modifyDate: string = `2`;
      const compareDate: string = `2`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSMeasureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010200
     * @tc.name      : modifyImageProperty('GPSDOP')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSDOP', `182/1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010200';
      const key: string = 'GPSDOP';
      const modifyDate: string = `182/1`;
      const compareDate: string = `182`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDOP ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010300
     * @tc.name      : modifyImageProperty('GPSSpeedRef')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSSpeedRef', `N`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010300';
      const key: string = 'GPSSpeedRef';
      const modifyDate: string = `N`;
      const compareDate: string = `N`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSSpeedRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010400
     * @tc.name      : modifyImageProperty('GPSSpeed')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSSpeed', `150/1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010400';
      const key: string = 'GPSSpeed';
      const modifyDate: string = `150/1`;
      const compareDate: string = `150`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSSpeed ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010500
     * @tc.name      : modifyImageProperty('GPSTrackRef')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSTrackRef', `T`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010500';
      const key: string = 'GPSTrackRef';
      const modifyDate: string = `T`;
      const compareDate: string = `T`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSTrackRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010600
     * @tc.name      : modifyImageProperty('GPSTrack')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSTrack', `114/3`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010600';
      const key: string = 'GPSTrack';
      const modifyDate: string = `114/3`;
      const compareDate: string = `38.0`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSTrack ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010700
     * @tc.name      : modifyImageProperty('GPSImgDirectionRef')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSImgDirectionRef', `M`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010700';
      const key: string = 'GPSImgDirectionRef';
      const modifyDate: string = `M`;
      const compareDate: string = `M`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSImgDirectionRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010800
     * @tc.name      : modifyImageProperty('GPSImgDirection')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSImgDirection', `125/56`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010800';
      const key: string = 'GPSImgDirection';
      const modifyDate: string = `125/56`;
      const compareDate: string = `2.23`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSImgDirection ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010900
     * @tc.name      : modifyImageProperty('GPSMapDatum')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSMapDatum', `xxx`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_010900';
      const key: string = 'GPSMapDatum';
      const modifyDate: string = `xxx`;
      const compareDate: string = `xxx`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSMapDatum ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011000
     * @tc.name      : modifyImageProperty('GPSDestLatitudeRef')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSDestLatitudeRef', `N`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011000';
      const key: string = 'GPSDestLatitudeRef';
      const modifyDate: string = `N`;
      const compareDate: string = `N`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestLatitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011100
     * @tc.name      : modifyImageProperty('GPSDestLatitude')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSDestLatitude', `33/1 22/1 11/1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011100';
      const key: string = 'GPSDestLatitude';
      const modifyDate: string = `33/1 22/1 11/1`;
      const compareDate: string = `33, 22, 11`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestLatitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011200
     * @tc.name      : modifyImageProperty('GPSDestLongitudeRef')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSDestLongitudeRef', `E`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011200';
      const key: string = 'GPSDestLongitudeRef';
      const modifyDate: string = `E`;
      const compareDate: string = `E`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestLongitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011300
     * @tc.name      : modifyImageProperty('GPSDestLongitude')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSDestLongitude', `33/1 22/1 11/1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011300';
      const key: string = 'GPSDestLongitude';
      const modifyDate: string = `33/1 22/1 11/1`;
      const compareDate: string = `33, 22, 11`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestLongitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011400
     * @tc.name      : modifyImageProperty('GPSDestBearingRef')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSDestBearingRef', `T`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011400';
      const key: string = 'GPSDestBearingRef';
      const modifyDate: string = `T`;
      const compareDate: string = `T`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestBearingRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011500
     * @tc.name      : modifyImageProperty('GPSDestBearing')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSDestBearing', `22/11`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011500';
      const key: string = 'GPSDestBearing';
      const modifyDate: string = `22/11`;
      const compareDate: string = `2.0`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestBearing ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011600
     * @tc.name      : modifyImageProperty('GPSDestDistanceRef')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSDestDistanceRef', `N`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011600';
      const key: string = 'GPSDestDistanceRef';
      const modifyDate: string = `N`;
      const compareDate: string = `N`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestDistanceRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011700
     * @tc.name      : modifyImageProperty('GPSDestDistance')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSDestDistance', `10/1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011700';
      const key: string = 'GPSDestDistance';
      const modifyDate: string = `10/1`;
      const compareDate: string = `10`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestDistance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011800
     * @tc.name      : modifyImageProperty('GPSProcessingMethod')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSProcessingMethod', `CELLID`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011800';
      const key: string = 'GPSProcessingMethod';
      const modifyDate: string = `CELLID`;
      const compareDate: string = `CELLID`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSProcessingMethod ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011900
     * @tc.name      : modifyImageProperty('GPSAreaInformation')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSAreaInformation', `arexxx`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_011900';
      const key: string = 'GPSAreaInformation';
      const modifyDate: string = `arexxx`;
      const compareDate: string = `arexxx`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSAreaInformation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012000
     * @tc.name      : modifyImageProperty('GPSDifferential')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSDifferential', `0`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012000';
      const key: string = 'GPSDifferential';
      const modifyDate: string = `0`;
      const compareDate: string = `0`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDifferential ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012100
     * @tc.name      : modifyImageProperty('BodySerialNumber')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('BodySerialNumber', `exoch`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012100';
      const key: string = 'BodySerialNumber';
      const modifyDate: string = `exoch`;
      const compareDate: string = `exoch`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error BodySerialNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012200
     * @tc.name      : modifyImageProperty('CameraOwnerName')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('CameraOwnerName', `c.uec`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012200';
      const key: string = 'CameraOwnerName';
      const modifyDate: string = `c.uec`;
      const compareDate: string = `c.uec`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error CameraOwnerName ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012300
     * @tc.name      : modifyImageProperty('CompositeImage')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('CompositeImage', `2`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012300';
      const key: string = 'CompositeImage';
      const modifyDate: string = `2`;
      const compareDate: string = `2`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error CompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012400
     * @tc.name      : modifyImageProperty('CompressedBitsPerPixel')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('CompressedBitsPerPixel', `24/1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012400';
      const key: string = 'CompressedBitsPerPixel';
      const modifyDate: string = `24/1`;
      const compareDate: string = `24`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error CompressedBitsPerPixel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012500
     * @tc.name      : modifyImageProperty('DNGVersion')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('DNGVersion', `2 2 3 1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012500';
      const key: string = 'DNGVersion';
      const modifyDate: string = `2 2 3 1`;
      const compareDate: string = `2, 2, 3, 1`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DNGVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012600
     * @tc.name      : modifyImageProperty('DefaultCropSize')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('DefaultCropSize', `153 841`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012600';
      const key: string = 'DefaultCropSize';
      const modifyDate: string = `153 841`;
      const compareDate: string = `153, 841`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DefaultCropSize ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012700
     * @tc.name      : modifyImageProperty('Gamma')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('Gamma', `5/2`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012700';
      const key: string = 'Gamma';
      const modifyDate: string = `5/2`;
      const compareDate: string = `2.5`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Gamma ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012800
     * @tc.name      : modifyImageProperty('ISOSpeedLatitudeyyy')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ISOSpeedLatitudeyyy', `1456`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012800';
      const key: string = 'ISOSpeedLatitudeyyy';
      const modifyDate: string = `1456`;
      const compareDate: string = `1456`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ISOSpeedLatitudeyyy ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012900
     * @tc.name      : modifyImageProperty('ISOSpeedLatitudezzz')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ISOSpeedLatitudezzz', `1456`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_012900';
      const key: string = 'ISOSpeedLatitudezzz';
      const modifyDate: string = `1456`;
      const compareDate: string = `1456`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ISOSpeedLatitudezzz ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013000
     * @tc.name      : modifyImageProperty('LensMake')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('LensMake', `xxwx`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013000';
      const key: string = 'LensMake';
      const modifyDate: string = `xxwx`;
      const compareDate: string = `xxwx`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error LensMake ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013100
     * @tc.name      : modifyImageProperty('LensModel')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('LensModel', `txaw`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013100';
      const key: string = 'LensModel';
      const modifyDate: string = `txaw`;
      const compareDate: string = `txaw`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error LensModel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013200
     * @tc.name      : modifyImageProperty('LensSerialNumber')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('LensSerialNumber', `qxhc`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013200';
      const key: string = 'LensSerialNumber';
      const modifyDate: string = `qxhc`;
      const compareDate: string = `qxhc`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error LensSerialNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013300
     * @tc.name      : modifyImageProperty('LensSpecification')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('LensSpecification', `3/4 5/2 3/2 1/2`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013300';
      const key: string = 'LensSpecification';
      const modifyDate: string = `3/4 5/2 3/2 1/2`;
      const compareDate: string = `0.8, 2.5, 1.5, 0.5`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error LensSpecification ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013400
     * @tc.name      : modifyImageProperty('NewSubfileType')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('NewSubfileType', `3`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013400';
      const key: string = 'NewSubfileType';
      const modifyDate: string = `3`;
      const compareDate: string = `3`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error NewSubfileType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013500
     * @tc.name      : modifyImageProperty('OffsetTime')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('OffsetTime', `2024:01:25`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013500';
      const key: string = 'OffsetTime';
      const modifyDate: string = `2024:01:25`;
      const compareDate: string = `2024:01:25`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error OffsetTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013600
     * @tc.name      : modifyImageProperty('OffsetTimeDigitized')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('OffsetTimeDigitized', `cfh`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013600';
      const key: string = 'OffsetTimeDigitized';
      const modifyDate: string = `cfh`;
      const compareDate: string = `cfh`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error OffsetTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013700
     * @tc.name      : modifyImageProperty('OffsetTimeOriginal')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('OffsetTimeOriginal', `chex`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013700';
      const key: string = 'OffsetTimeOriginal';
      const modifyDate: string = `chex`;
      const compareDate: string = `chex`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error OffsetTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013800
     * @tc.name      : modifyImageProperty('SourceExposureTimesOfCompositeImage')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SourceExposureTimesOfCompositeImage', `xxxw`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013800';
      const key: string = 'SourceExposureTimesOfCompositeImage';
      const modifyDate: string = `xxxw`;
      const compareDate: string = `xxxw`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SourceExposureTimesOfCompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013900
     * @tc.name      : modifyImageProperty('SourceImageNumberOfCompositeImage')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SourceImageNumberOfCompositeImage', `23 34`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_013900';
      const key: string = 'SourceImageNumberOfCompositeImage';
      const modifyDate: string = `23 34`;
      const compareDate: string = `23, 34`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SourceImageNumberOfCompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_014000
     * @tc.name      : modifyImageProperty('SubfileType')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SubfileType', `2`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_014000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_014000';
      const key: string = 'SubfileType';
      const modifyDate: string = `2`;
      const compareDate: string = `2`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubfileType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_014100
     * @tc.name      : modifyImageProperty('GPSHPositioningError')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSHPositioningError', `5/2`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_014100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_014100';
      const key: string = 'GPSHPositioningError';
      const modifyDate: string = `5/2`;
      const compareDate: string = `2.5`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSHPositioningError ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_014200
     * @tc.name      : modifyImageProperty('PhotographicSensitivity')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('PhotographicSensitivity', `50`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_014200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_014200';
      const key: string = 'PhotographicSensitivity';
      const modifyDate: string = `1`;
      const compareDate: string = `1`;
      try {
        await modifyPromiseResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PhotographicSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_014500
     * @tc.name      : modifyImageProperty('HwMnoteCaptureMode')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('HwMnoteCaptureMode', `1`)_promise
     *                 3.getImageProperty_callback value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_014500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_014500';
      const key: string = 'HwMnoteCaptureMode';
      const modifyDate: string = `1`;
      const compareDate: string = `1`;
      try {
        await getFd('test_exif_v2.heic');
        let imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info(testTag + " create image source failed");
          expect().assertFail();
          done();
        } else {
          await imageSourceApi.modifyImageProperty(key, modifyDate)
            .then(async () => {
              hilog.info(0x0000, testTag,
                `modifyImageProperty promise success %{public}s `, key);
              let imageSourceApiGet = image.createImageSource(fdNumber);
              imageSourceApiGet.getImageProperty(key, (err: BusinessError, data: string) => {
                if (!err) {
                  try {
                    hilog.info(0x0000, testTag,
                      `getModifiedProperty callback success %{public}s %{public}s %{public}s`, key, data, compareDate);
                    expect(data == compareDate).assertTrue();
                    done();
                  } catch (e) {
                    hilog.info(0x0000, testTag,
                      `getimageProperty callback failed %{public}s %{public}s `, key, e);
                    callbackExpectFail(done, testTag);
                  }
                } else {
                  hilog.info(0x0000, testTag,
                    `getimageProperty callback failed %{public}s %{public}s `, key, err.code);
                  callbackExpectFail(done, testTag);
                }
              })
            })
            .catch((err: BusinessError) => {
              hilog.info(0x0000, testTag,
                `modifyImageProperty promise failed %{public}s %{public}s `, key, err.code);
              expect().assertFail();
              done();
            })
        }
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error HwMnoteCaptureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0100
     * @tc.name      : modifyImageProperty('BitsPerSample')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('BitsPerSample', `65535,65535,65535`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0100';
      const key: string = 'BitsPerSample';
      const modifyDate: string = `65535,65535,65535`;
      const compareDate: string = `65535, 65535, 65535`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error BitsPerSample ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0200
     * @tc.name      : modifyImageProperty('Orientation')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('Orientation', `8`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0200';
      const key: string = 'Orientation';
      const modifyDate: string = `8`;
      const compareDate: string = `Left-bottom`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error Orientation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0300
     * @tc.name      : modifyImageProperty('ImageLength')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ImageLength', `65535`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0300';
      const key: string = 'ImageLength';
      const modifyDate: string = `65535`;
      const compareDate: string = `65535`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error ImageLength ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0400
     * @tc.name      : modifyImageProperty('ImageWidth')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ImageWidth', `65535`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0400';
      const key: string = 'ImageWidth';
      const modifyDate: string = `65535`;
      const compareDate: string = `65535`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error ImageWidth ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0500
     * @tc.name      : modifyImageProperty('GPSLatitude')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSLatitude', `114,3`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0500';
      const key: string = 'GPSLatitude';
      const modifyDate: string = `114,3`;
      const compareDate: string = `38.0,  0,  0`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSLatitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0600
     * @tc.name      : modifyImageProperty('GPSLongitude')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSLongitude', `114,3`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0600';
      const key: string = 'GPSLongitude';
      const modifyDate: string = `114,3`;
      const compareDate: string = `38.0,  0,  0`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSLongitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0700
     * @tc.name      : modifyImageProperty('GPSLatitudeRef')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSLatitudeRef', `S`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0700';
      const key: string = 'GPSLatitudeRef';
      const modifyDate: string = `S`;
      const compareDate: string = `S`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSLatitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0800
     * @tc.name      : modifyImageProperty('GPSLongitudeRef')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSLongitudeRef', `W`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0800';
      const key: string = 'GPSLongitudeRef';
      const modifyDate: string = `W`;
      const compareDate: string = `W`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSLongitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0900
     * @tc.name      : modifyImageProperty('DateTimeOriginal')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('DateTimeOriginal', `1900:01:01 00:00:00`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_0900';
      const key: string = 'DateTimeOriginal';
      const modifyDate: string = `1900:01:01 00:00:00`;
      const compareDate: string = `1900:01:01 00:00:00`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error DateTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01000
     * @tc.name      : modifyImageProperty('ExposureTime')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ExposureTime', `1/60`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01000';
      const key: string = 'ExposureTime';
      const modifyDate: string = `1/60`;
      const compareDate: string = `1/60 sec.`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error ExposureTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01200
     * @tc.name      : modifyImageProperty('ISOSpeedRatings')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ISOSpeedRatings', `65535`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01200';
      const key: string = 'ISOSpeedRatings';
      const modifyDate: string = `65535`;
      const compareDate: string = `65535`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error ISOSpeedRatings ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01300
     * @tc.name      : modifyImageProperty('FNumber')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('FNumber', `1/30`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01300';
      const key: string = 'FNumber';
      const modifyDate: string = `1/30`;
      const compareDate: string = `f/0.0`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error FNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01400
     * @tc.name      : modifyImageProperty('DateTime')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('DateTime', `1900:01:01`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01400';
      const key: string = 'DateTime';
      const modifyDate: string = `1900:01:01`;
      const compareDate: string = `1900:01:01`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error DateTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01500
     * @tc.name      : modifyImageProperty('GPSTimeStamp')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSTimeStamp', `12 54 20`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01500';
      const key: string = 'GPSTimeStamp';
      const modifyDate: string = `12 54 20`;
      const compareDate: string = `12:54:20.00`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSTimeStamp ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01600
     * @tc.name      : modifyImageProperty('GPSDateStamp')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSDateStamp', `1900:01:01`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01600';
      const key: string = 'GPSDateStamp';
      const modifyDate: string = `1900:01:01`;
      const compareDate: string = `1900:01:01`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSDateStamp ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01700
     * @tc.name      : modifyImageProperty('ImageDescription')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ImageDescription', `@  @`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01700';
      const key: string = 'ImageDescription';
      const modifyDate: string = `@  @`;
      const compareDate: string = `@  @`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error ImageDescription ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01800
     * @tc.name      : modifyImageProperty('Make')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('Make', `APPLE`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01800';
      const key: string = 'Make';
      const modifyDate: string = `APPLE`;
      const compareDate: string = `APPLE`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error Make ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01900
     * @tc.name      : modifyImageProperty('Model')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('Model', `%s \0`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_01900';
      const key: string = 'Model';
      const modifyDate: string = `%s \\0`;
      const compareDate: string = `%s \\0`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error Model ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02000
     * @tc.name      : modifyImageProperty('PhotoMode')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('PhotoMode', `13`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02000';
      const key: string = 'PhotoMode';
      const modifyDate: string = `13`;
      const compareDate: string = `13`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error PhotoMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02100
     * @tc.name      : modifyImageProperty('SensitivityType')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SensitivityType', `0`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02100';
      const key: string = 'SensitivityType';
      const modifyDate: string = `0`;
      const compareDate: string = `Unknown`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error SensitivityType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02200
     * @tc.name      : modifyImageProperty('StandardOutputSensitivity')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('StandardOutputSensitivity', `1000`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02200';
      const key: string = 'StandardOutputSensitivity';
      const modifyDate: string = `1000`;
      const compareDate: string = `1000`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error StandardOutputSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02300
     * @tc.name      : modifyImageProperty('RecommendedExposureIndex')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('RecommendedExposureIndex', `2147483647`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02300';
      const key: string = 'RecommendedExposureIndex';
      const modifyDate: string = `2147483647`;
      const compareDate: string = `2147483647`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error RecommendedExposureIndex ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02400
     * @tc.name      : modifyImageProperty('ApertureValue')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ApertureValue', `16`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02400';
      const key: string = 'ApertureValue';
      const modifyDate: string = `16`;
      const compareDate: string = `16.00 EV (f/256.0)`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error ApertureValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02500
     * @tc.name      : modifyImageProperty('ExposureBiasValue')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ExposureBiasValue', `4`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02500';
      const key: string = 'ExposureBiasValue';
      const modifyDate: string = `4`;
      const compareDate: string = `4.00 EV`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error ExposureBiasValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02600
     * @tc.name      : modifyImageProperty('MeteringMode')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('MeteringMode', `0`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02600';
      const key: string = 'MeteringMode';
      const modifyDate: string = `0`;
      const compareDate: string = `Unknown`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error MeteringMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02700
     * @tc.name      : modifyImageProperty('LightSource')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('LightSource', `2`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02700';
      const key: string = 'LightSource';
      const modifyDate: string = `2`;
      const compareDate: string = `Fluorescent`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error LightSource ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02800
     * @tc.name      : modifyImageProperty('Flash')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('Flash', `95`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02800';
      const key: string = 'Flash';
      const modifyDate: string = `95`;
      const compareDate: string = `Flash fired, auto mode, return light detected, red-eye reduction mode`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error Flash ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02900
     * @tc.name      : modifyImageProperty('FocalLength')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('FocalLength', `31/1`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_02900';
      const key: string = 'FocalLength';
      const modifyDate: string = `31/1`;
      const compareDate: string = `31.0 mm`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error FocalLength ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03000
     * @tc.name      : modifyImageProperty('UserComment')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('UserComment', `%s \0`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03000';
      const key: string = 'UserComment';
      const modifyDate: string = `%s \\0`;
      const compareDate: string = `%s \\0`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error UserComment ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03100
     * @tc.name      : modifyImageProperty('PixelXDimension')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('PixelXDimension', `0`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03100';
      const key: string = 'PixelXDimension';
      const modifyDate: string = `0`;
      const compareDate: string = `0`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error PixelXDimension ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03200
     * @tc.name      : modifyImageProperty('PixelYDimension')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('PixelYDimension', `0`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03200';
      const key: string = 'PixelYDimension';
      const modifyDate: string = `0`;
      const compareDate: string = `0`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error PixelYDimension ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03300
     * @tc.name      : modifyImageProperty('WhiteBalance')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('WhiteBalance', `0`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03300';
      const key: string = 'WhiteBalance';
      const modifyDate: string = `0`;
      const compareDate: string = `Auto white balance`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error WhiteBalance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03400
     * @tc.name      : modifyImageProperty('FocalLengthIn35mmFilm')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('FocalLengthIn35mmFilm', `12`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03400';
      const key: string = 'FocalLengthIn35mmFilm';
      const modifyDate: string = `12`;
      const compareDate: string = `12`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error FocalLengthIn35mmFilm ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03500
     * @tc.name      : modifyImageProperty('Compression')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('Compression', `32773`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03500';
      const key: string = 'Compression';
      const modifyDate: string = `32773`;
      const compareDate: string = `PackBits compression`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error Compression ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03600
     * @tc.name      : modifyImageProperty('PhotometricInterpretation')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('PhotometricInterpretation', `1`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03600';
      const key: string = 'PhotometricInterpretation';
      const modifyDate: string = `1`;
      const compareDate: string = `Normal mono`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error PhotometricInterpretation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03700
     * @tc.name      : modifyImageProperty('StripOffsets')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('StripOffsets', `456`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03700';
      const key: string = 'StripOffsets';
      const modifyDate: string = `456`;
      const compareDate: string = `456`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error StripOffsets ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03800
     * @tc.name      : modifyImageProperty('SamplesPerPixel')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SamplesPerPixel', `65535`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03800';
      const key: string = 'SamplesPerPixel';
      const modifyDate: string = `65535`;
      const compareDate: string = `65535`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error SamplesPerPixel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03900
     * @tc.name      : modifyImageProperty('RowsPerStrip')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('RowsPerStrip', `345`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_03900';
      const key: string = 'RowsPerStrip';
      const modifyDate: string = `345`;
      const compareDate: string = `345`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error RowsPerStrip ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04000
     * @tc.name      : modifyImageProperty('StripByteCounts')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('StripByteCounts', `345`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04000';
      const key: string = 'StripByteCounts';
      const modifyDate: string = `345`;
      const compareDate: string = `345`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error StripByteCounts ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04100
     * @tc.name      : modifyImageProperty('XResolution')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('XResolution', `31/1`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04100';
      const key: string = 'XResolution';
      const modifyDate: string = `31/1`;
      const compareDate: string = `31`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error XResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04200
     * @tc.name      : modifyImageProperty('YResolution')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('YResolution', `31/1`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04200';
      const key: string = 'YResolution';
      const modifyDate: string = `31/1`;
      const compareDate: string = `31`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error YResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04300
     * @tc.name      : modifyImageProperty('PlanarConfiguration')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('PlanarConfiguration', `2`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04300';
      const key: string = 'PlanarConfiguration';
      const modifyDate: string = `2`;
      const compareDate: string = `Planar format`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error PlanarConfiguration ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04400
     * @tc.name      : modifyImageProperty('ResolutionUnit')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ResolutionUnit', `3`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04400';
      const key: string = 'ResolutionUnit';
      const modifyDate: string = `3`;
      const compareDate: string = `Centimeter`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error ResolutionUnit ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04500
     * @tc.name      : modifyImageProperty('TransferFunction')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('TransferFunction', `123`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04500';
      const key: string = 'TransferFunction';
      const modifyDate: string = `123`;
      const compareDate: string = `3 bytes undefined data`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error TransferFunction ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04600
     * @tc.name      : modifyImageProperty('Software')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('Software', `%s \0`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04600';
      const key: string = 'Software';
      const modifyDate: string = `%s \\0`;
      const compareDate: string = `%s \\0`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error Software ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04700
     * @tc.name      : modifyImageProperty('Artist')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('Artist', `%s \0`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04700';
      const key: string = 'Artist';
      const modifyDate: string = `%s \\0`;
      const compareDate: string = `%s \\0`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error Artist ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04800
     * @tc.name      : modifyImageProperty('WhitePoint')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('WhitePoint', `31/1`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04800';
      const key: string = 'WhitePoint';
      const modifyDate: string = `31/1`;
      const compareDate: string = `31, 0/0`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error WhitePoint ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04900
     * @tc.name      : modifyImageProperty('PrimaryChromaticities')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('PrimaryChromaticities', `31/1`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_04900';
      const key: string = 'PrimaryChromaticities';
      const modifyDate: string = `31/1`;
      const compareDate: string = `31`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error PrimaryChromaticities ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_05000
     * @tc.name      : modifyImageProperty('YCbCrCoefficients')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('YCbCrCoefficients', `3/2 4/2 9/3`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_05000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_05000';
      const key: string = 'YCbCrCoefficients';
      const modifyDate: string = `3/2 4/2 9/3`;
      const compareDate: string = `1.5, 2.0, 3.0`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error YCbCrCoefficients ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_05100
     * @tc.name      : modifyImageProperty('YCbCrSubSampling')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('YCbCrSubSampling', `4 5`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_05100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_05100';
      const key: string = 'YCbCrSubSampling';
      const modifyDate: string = `4 5`;
      const compareDate: string = `4, 5`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error YCbCrSubSampling ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_05200
     * @tc.name      : modifyImageProperty('YCbCrPositioning')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('YCbCrPositioning', `2`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_05200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_05200';
      const key: string = 'YCbCrPositioning';
      const modifyDate: string = `2`;
      const compareDate: string = `Co-sited`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error YCbCrPositioning ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_05300
     * @tc.name      : modifyImageProperty('ReferenceBlackWhite')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ReferenceBlackWhite', `3`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_05300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_05300';
      const key: string = 'ReferenceBlackWhite';
      const modifyDate: string = `3 255 0 255 0 255`;
      const compareDate: string = ` 3, 255,  0, 255,  0, 255`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error ReferenceBlackWhite ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_05400
     * @tc.name      : modifyImageProperty('Copyright')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('Copyright', `joseph`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_05400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_05400';
      const key: string = 'Copyright';
      const modifyDate: string = `joseph`;
      const compareDate: string = `joseph (Photographer) - [None] (Editor)`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error Copyright ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_05700
     * @tc.name      : modifyImageProperty('ExposureProgram')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ExposureProgram', `8`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_05700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_05700';
      const key: string = 'ExposureProgram';
      const modifyDate: string = `8`;
      const compareDate: string = `Landscape mode (for landscape photos with the background in focus)`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error ExposureProgram ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_05800
     * @tc.name      : modifyImageProperty('SpectralSensitivity')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SpectralSensitivity', `1234`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_05800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_05800';
      const key: string = 'SpectralSensitivity';
      const modifyDate: string = `1234`;
      const compareDate: string = `1234`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error SpectralSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_05900
     * @tc.name      : modifyImageProperty('OECF')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('OECF', `ab`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_05900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_05900';
      const key: string = 'OECF';
      const modifyDate: string = `ab`;
      const compareDate: string = `2 bytes undefined data`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error OECF ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06000
     * @tc.name      : modifyImageProperty('ExifVersion')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ExifVersion', `0120`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06000';
      const key: string = 'ExifVersion';
      const modifyDate: string = `0120`;
      const compareDate: string = `Exif Version 1.2`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error ExifVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06100
     * @tc.name      : modifyImageProperty('DateTimeDigitized')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('DateTimeDigitized', `1900:01:01 00:00:00`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06100';
      const key: string = 'DateTimeDigitized';
      const modifyDate: string = `1900:01:01 00:00:00`;
      const compareDate: string = `1900:01:01 00:00:00`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error DateTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06200
     * @tc.name      : modifyImageProperty('ComponentsConfiguration')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ComponentsConfiguration', `1256`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06200';
      const key: string = 'ComponentsConfiguration';
      const modifyDate: string = `1256`;
      const compareDate: string = `Y Cb G B`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error ComponentsConfiguration ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06300
     * @tc.name      : modifyImageProperty('ShutterSpeedValue')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ShutterSpeedValue', `3/2`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06300';
      const key: string = 'ShutterSpeedValue';
      const modifyDate: string = `3/2`;
      const compareDate: string = `1.50 EV (1/3 sec.)`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error ShutterSpeedValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06400
     * @tc.name      : modifyImageProperty('BrightnessValue')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('BrightnessValue', `6/5`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06400';
      const key: string = 'BrightnessValue';
      const modifyDate: string = `6/5`;
      const compareDate: string = `1.20 EV (7.87 cd/m^2)`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error BrightnessValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06500
     * @tc.name      : modifyImageProperty('MaxApertureValue')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('MaxApertureValue', `8/5`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06500';
      const key: string = 'MaxApertureValue';
      const modifyDate: string = `8/5`;
      const compareDate: string = `1.60 EV (f/1.7)`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error MaxApertureValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06600
     * @tc.name      : modifyImageProperty('SubjectDistance')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SubjectDistance', `1/2`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06600';
      const key: string = 'SubjectDistance';
      const modifyDate: string = `1/2`;
      const compareDate: string = `0.5 m`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error SubjectDistance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06700
     * @tc.name      : modifyImageProperty('SubjectArea')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SubjectArea', `45 23`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06700';
      const key: string = 'SubjectArea';
      const modifyDate: string = `45 23`;
      const compareDate: string = `(x,y) = (45,23)`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error SubjectArea ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06900
     * @tc.name      : modifyImageProperty('SubsecTime')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SubsecTime', `427000`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_06900';
      const key: string = 'SubsecTime';
      const modifyDate: string = `427000`;
      const compareDate: string = `427000`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error SubsecTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07000
     * @tc.name      : modifyImageProperty('SubsecTimeOriginal')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SubsecTimeOriginal', `123456`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07000';
      const key: string = 'SubsecTimeOriginal';
      const modifyDate: string = `123456`;
      const compareDate: string = `123456`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error SubsecTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07100
     * @tc.name      : modifyImageProperty('SubsecTimeDigitized')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SubsecTimeDigitized', `999999`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07100';
      const key: string = 'SubsecTimeDigitized';
      const modifyDate: string = `999999`;
      const compareDate: string = `999999`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error SubsecTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07200
     * @tc.name      : modifyImageProperty('FlashpixVersion')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('FlashpixVersion', `0101`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07200';
      const key: string = 'FlashpixVersion';
      const modifyDate: string = `0101`;
      const compareDate: string = `FlashPix Version 1.01`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error FlashpixVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07300
     * @tc.name      : modifyImageProperty('ColorSpace')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ColorSpace', `2`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07300';
      const key: string = 'ColorSpace';
      const modifyDate: string = `2`;
      const compareDate: string = `Adobe RGB`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error ColorSpace ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07400
     * @tc.name      : modifyImageProperty('RelatedSoundFile')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('RelatedSoundFile', `abc`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07400';
      const key: string = 'RelatedSoundFile';
      const modifyDate: string = `abc`;
      const compareDate: string = `abc`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error RelatedSoundFile ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07500
     * @tc.name      : modifyImageProperty('FlashEnergy')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('FlashEnergy', `5/2`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07500';
      const key: string = 'FlashEnergy';
      const modifyDate: string = `5/2`;
      const compareDate: string = `2.5`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error FlashEnergy ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07600
     * @tc.name      : modifyImageProperty('SpatialFrequencyResponse')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SpatialFrequencyResponse', `corn`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07600';
      const key: string = 'SpatialFrequencyResponse';
      const modifyDate: string = `corn`;
      const compareDate: string = `corn`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error SpatialFrequencyResponse ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07700
     * @tc.name      : modifyImageProperty('FocalPlaneXResolution')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('FocalPlaneXResolution', `102/1`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07700';
      const key: string = 'FocalPlaneXResolution';
      const modifyDate: string = `102/1`;
      const compareDate: string = `102`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error FocalPlaneXResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07800
     * @tc.name      : modifyImageProperty('FocalPlaneYResolution')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('FocalPlaneYResolution', `81/1`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07800';
      const key: string = 'FocalPlaneYResolution';
      const modifyDate: string = `81/1`;
      const compareDate: string = `81`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error FocalPlaneYResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07900
     * @tc.name      : modifyImageProperty('FocalPlaneResolutionUnit')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('FocalPlaneResolutionUnit', `3`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_07900';
      const key: string = 'FocalPlaneResolutionUnit';
      const modifyDate: string = `3`;
      const compareDate: string = `Centimeter`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error FocalPlaneResolutionUnit ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08000
     * @tc.name      : modifyImageProperty('SubjectLocation')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SubjectLocation', `23 112`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08000';
      const key: string = 'SubjectLocation';
      const modifyDate: string = `23 112`;
      const compareDate: string = `23, 112`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error SubjectLocation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08100
     * @tc.name      : modifyImageProperty('ExposureIndex')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ExposureIndex', `5/2`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08100';
      const key: string = 'ExposureIndex';
      const modifyDate: string = `5/2`;
      const compareDate: string = `2.5`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error ExposureIndex ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08200
     * @tc.name      : modifyImageProperty('SensingMethod')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SensingMethod', `8`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08200';
      const key: string = 'SensingMethod';
      const modifyDate: string = `8`;
      const compareDate: string = `Color sequential linear sensor`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error SensingMethod ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08300
     * @tc.name      : modifyImageProperty('FileSource')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('FileSource', `4`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08300';
      const key: string = 'FileSource';
      const modifyDate: string = `4`;
      const compareDate: string = `Internal error (unknown value 4)`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error FileSource ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08400
     * @tc.name      : modifyImageProperty('CFAPattern')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('CFAPattern', `ab`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08400';
      const key: string = 'CFAPattern';
      const modifyDate: string = `ab`;
      const compareDate: string = `2 bytes undefined data`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error CFAPattern ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08500
     * @tc.name      : modifyImageProperty('CustomRendered')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('CustomRendered', `1`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08500';
      const key: string = 'CustomRendered';
      const modifyDate: string = `1`;
      const compareDate: string = `Custom process`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error CustomRendered ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08600
     * @tc.name      : modifyImageProperty('ExposureMode')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ExposureMode', `2`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08600';
      const key: string = 'ExposureMode';
      const modifyDate: string = `2`;
      const compareDate: string = `Auto bracket`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error ExposureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08700
     * @tc.name      : modifyImageProperty('DigitalZoomRatio')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('DigitalZoomRatio', `23/1`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08700';
      const key: string = 'DigitalZoomRatio';
      const modifyDate: string = `23/1`;
      const compareDate: string = `23`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error DigitalZoomRatio ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08800
     * @tc.name      : modifyImageProperty('SceneCaptureType')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SceneCaptureType', `3`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08800';
      const key: string = 'SceneCaptureType';
      const modifyDate: string = `3`;
      const compareDate: string = `Night scene`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error SceneCaptureType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08900
     * @tc.name      : modifyImageProperty('GainControl')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GainControl', `4`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_08900';
      const key: string = 'GainControl';
      const modifyDate: string = `4`;
      const compareDate: string = `High gain down`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GainControl ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09000
     * @tc.name      : modifyImageProperty('Contrast')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('Contrast', `2`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09000';
      const key: string = 'Contrast';
      const modifyDate: string = `2`;
      const compareDate: string = `Hard`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error Contrast ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09100
     * @tc.name      : modifyImageProperty('Saturation')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('Saturation', `2`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09100';
      const key: string = 'Saturation';
      const modifyDate: string = `2`;
      const compareDate: string = `High saturation`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error Saturation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09200
     * @tc.name      : modifyImageProperty('Sharpness')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('Sharpness', `2`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09200';
      const key: string = 'Sharpness';
      const modifyDate: string = `2`;
      const compareDate: string = `Hard`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error Sharpness ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09300
     * @tc.name      : modifyImageProperty('DeviceSettingDescription')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('DeviceSettingDescription', `coxex`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09300';
      const key: string = 'DeviceSettingDescription';
      const modifyDate: string = `coxex`;
      const compareDate: string = `coxex`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error DeviceSettingDescription ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09400
     * @tc.name      : modifyImageProperty('SubjectDistanceRange')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SubjectDistanceRange', `3`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09400';
      const key: string = 'SubjectDistanceRange';
      const modifyDate: string = `3`;
      const compareDate: string = `Distant view`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error SubjectDistanceRange ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09500
     * @tc.name      : modifyImageProperty('ImageUniqueID')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ImageUniqueID', `xxx`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09500';
      const key: string = 'ImageUniqueID';
      const modifyDate: string = `xxx`;
      const compareDate: string = `xxx`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error ImageUniqueID ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09600
     * @tc.name      : modifyImageProperty('GPSVersionID')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSVersionID', `2.2.0.1`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09600';
      const key: string = 'GPSVersionID';
      const modifyDate: string = `2.2.0.1`;
      const compareDate: string = `2.2.0.1`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSVersionID ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09700
     * @tc.name      : modifyImageProperty('GPSAltitudeRef')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSAltitudeRef', `1`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09700';
      const key: string = 'GPSAltitudeRef';
      const modifyDate: string = `1`;
      const compareDate: string = `Sea level reference`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSAltitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09800
     * @tc.name      : modifyImageProperty('GPSAltitude')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSAltitude', `100/100`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09800';
      const key: string = 'GPSAltitude';
      const modifyDate: string = `100/100`;
      const compareDate: string = `1.00`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSAltitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09900
     * @tc.name      : modifyImageProperty('GPSSatellites')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSSatellites', `a b c`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_09900';
      const key: string = 'GPSSatellites';
      const modifyDate: string = `a b c`;
      const compareDate: string = `a b c`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSSatellites ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010000
     * @tc.name      : modifyImageProperty('GPSStatus')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSStatus', `V`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010000';
      const key: string = 'GPSStatus';
      const modifyDate: string = `V`;
      const compareDate: string = `V`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSStatus ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010100
     * @tc.name      : modifyImageProperty('GPSMeasureMode')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSMeasureMode', `3`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010100';
      const key: string = 'GPSMeasureMode';
      const modifyDate: string = `3`;
      const compareDate: string = `3`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSMeasureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010200
     * @tc.name      : modifyImageProperty('GPSDOP')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSDOP', `100/100`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010200';
      const key: string = 'GPSDOP';
      const modifyDate: string = `100/100`;
      const compareDate: string = `1.00`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSDOP ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010300
     * @tc.name      : modifyImageProperty('GPSSpeedRef')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSSpeedRef', `K`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010300';
      const key: string = 'GPSSpeedRef';
      const modifyDate: string = `K`;
      const compareDate: string = `K`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSSpeedRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010400
     * @tc.name      : modifyImageProperty('GPSSpeed')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSSpeed', `0/1`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010400';
      const key: string = 'GPSSpeed';
      const modifyDate: string = `0/1`;
      const compareDate: string = ` 0`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSSpeed ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010500
     * @tc.name      : modifyImageProperty('GPSTrackRef')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSTrackRef', `M`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010500';
      const key: string = 'GPSTrackRef';
      const modifyDate: string = `M`;
      const compareDate: string = `M`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSTrackRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010600
     * @tc.name      : modifyImageProperty('GPSTrack')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSTrack', `3.5`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010600';
      const key: string = 'GPSTrack';
      const modifyDate: string = `3.5`;
      const compareDate: string = `3.5`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSTrack ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010700
     * @tc.name      : modifyImageProperty('GPSImgDirectionRef')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSImgDirectionRef', `T`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010700';
      const key: string = 'GPSImgDirectionRef';
      const modifyDate: string = `T`;
      const compareDate: string = `T`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSImgDirectionRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010800
     * @tc.name      : modifyImageProperty('GPSImgDirection')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSImgDirection', `2.5`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010800';
      const key: string = 'GPSImgDirection';
      const modifyDate: string = `2.5`;
      const compareDate: string = `2.5`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSImgDirection ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010900
     * @tc.name      : modifyImageProperty('GPSMapDatum')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSMapDatum', `%s\0`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_010900';
      const key: string = 'GPSMapDatum';
      const modifyDate: string = `%s\\0`;
      const compareDate: string = `%s\\0`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSMapDatum ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011000
     * @tc.name      : modifyImageProperty('GPSDestLatitudeRef')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSDestLatitudeRef', `S`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011000';
      const key: string = 'GPSDestLatitudeRef';
      const modifyDate: string = `S`;
      const compareDate: string = `S`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSDestLatitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011100
     * @tc.name      : modifyImageProperty('GPSDestLatitude')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSDestLatitude', `0/1 0/1 0/1`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011100';
      const key: string = 'GPSDestLatitude';
      const modifyDate: string = `0/1 0/1 0/1`;
      const compareDate: string = ` 0,  0,  0`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSDestLatitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011200
     * @tc.name      : modifyImageProperty('GPSDestLongitudeRef')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSDestLongitudeRef', `W`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011200';
      const key: string = 'GPSDestLongitudeRef';
      const modifyDate: string = `W`;
      const compareDate: string = `W`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSDestLongitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011300
     * @tc.name      : modifyImageProperty('GPSDestLongitude')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSDestLongitude', `0/1 0/1 0/1`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011300';
      const key: string = 'GPSDestLongitude';
      const modifyDate: string = `0/1 0/1 0/1`;
      const compareDate: string = ` 0,  0,  0`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSDestLongitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011400
     * @tc.name      : modifyImageProperty('GPSDestBearingRef')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSDestBearingRef', `C`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011400';
      const key: string = 'GPSDestBearingRef';
      const modifyDate: string = `M`;
      const compareDate: string = `M`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSDestBearingRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011500
     * @tc.name      : modifyImageProperty('GPSDestBearing')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSDestBearing', `2.5`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011500';
      const key: string = 'GPSDestBearing';
      const modifyDate: string = `2.5`;
      const compareDate: string = `2.5`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSDestBearing ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011600
     * @tc.name      : modifyImageProperty('GPSDestDistanceRef')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSDestDistanceRef', `K`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011600';
      const key: string = 'GPSDestDistanceRef';
      const modifyDate: string = `K`;
      const compareDate: string = `K`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSDestDistanceRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011700
     * @tc.name      : modifyImageProperty('GPSDestDistance')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSDestDistance', `2.5`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011700';
      const key: string = 'GPSDestDistance';
      const modifyDate: string = `2.5`;
      const compareDate: string = `2.5`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSDestDistance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011800
     * @tc.name      : modifyImageProperty('GPSProcessingMethod')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSProcessingMethod', `XXX`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011800';
      const key: string = 'GPSProcessingMethod';
      const modifyDate: string = `XXX`;
      const compareDate: string = `XXX`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSProcessingMethod ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011900
     * @tc.name      : modifyImageProperty('GPSAreaInformation')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSAreaInformation', `client`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_011900';
      const key: string = 'GPSAreaInformation';
      const modifyDate: string = `client`;
      const compareDate: string = `client`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSAreaInformation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012000
     * @tc.name      : modifyImageProperty('GPSDifferential')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSDifferential', `1`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012000';
      const key: string = 'GPSDifferential';
      const modifyDate: string = `1`;
      const compareDate: string = `1`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSDifferential ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012100
     * @tc.name      : modifyImageProperty('BodySerialNumber')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('BodySerialNumber', `xoinc`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012100';
      const key: string = 'BodySerialNumber';
      const modifyDate: string = `xoinc`;
      const compareDate: string = `xoinc`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error BodySerialNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012200
     * @tc.name      : modifyImageProperty('CameraOwnerName')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('CameraOwnerName', `joseph`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012200';
      const key: string = 'CameraOwnerName';
      const modifyDate: string = `joseph`;
      const compareDate: string = `joseph`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error CameraOwnerName ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012300
     * @tc.name      : modifyImageProperty('CompositeImage')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('CompositeImage', `3`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012300';
      const key: string = 'CompositeImage';
      const modifyDate: string = `3`;
      const compareDate: string = `3`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error CompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012400
     * @tc.name      : modifyImageProperty('CompressedBitsPerPixel')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('CompressedBitsPerPixel', `25`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012400';
      const key: string = 'CompressedBitsPerPixel';
      const modifyDate: string = `25`;
      const compareDate: string = `25`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error CompressedBitsPerPixel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012500
     * @tc.name      : modifyImageProperty('DNGVersion')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('DNGVersion', `2 2 3 2`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012500';
      const key: string = 'DNGVersion';
      const modifyDate: string = `2 2 3 2`;
      const compareDate: string = `2, 2, 3, 2`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error DNGVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012600
     * @tc.name      : modifyImageProperty('DefaultCropSize')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('DefaultCropSize', `123 654`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012600';
      const key: string = 'DefaultCropSize';
      const modifyDate: string = `123 654`;
      const compareDate: string = `123, 654`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error DefaultCropSize ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012700
     * @tc.name      : modifyImageProperty('Gamma')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('Gamma', `3/2`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012700';
      const key: string = 'Gamma';
      const modifyDate: string = `3/2`;
      const compareDate: string = `1.5`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error Gamma ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012800
     * @tc.name      : modifyImageProperty('ISOSpeedLatitudeyyy')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ISOSpeedLatitudeyyy', `123`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012800';
      const key: string = 'ISOSpeedLatitudeyyy';
      const modifyDate: string = `123`;
      const compareDate: string = `123`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error ISOSpeedLatitudeyyy ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012900
     * @tc.name      : modifyImageProperty('ISOSpeedLatitudezzz')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('ISOSpeedLatitudezzz', `123`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_012900';
      const key: string = 'ISOSpeedLatitudezzz';
      const modifyDate: string = `123`;
      const compareDate: string = `123`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error ISOSpeedLatitudezzz ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013000
     * @tc.name      : modifyImageProperty('LensMake')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('LensMake', `plex`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013000';
      const key: string = 'LensMake';
      const modifyDate: string = `plex`;
      const compareDate: string = `plex`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error LensMake ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013100
     * @tc.name      : modifyImageProperty('LensModel')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('LensModel', `world`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013100';
      const key: string = 'LensModel';
      const modifyDate: string = `world`;
      const compareDate: string = `world`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error LensModel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013200
     * @tc.name      : modifyImageProperty('LensSerialNumber')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('LensSerialNumber', `root`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013200';
      const key: string = 'LensSerialNumber';
      const modifyDate: string = `root`;
      const compareDate: string = `root`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error LensSerialNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013300
     * @tc.name      : modifyImageProperty('LensSpecification')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('LensSpecification', `3/4 5/2 3/2 5/2`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013300';
      const key: string = 'LensSpecification';
      const modifyDate: string = `3/4 5/2 3/2 5/2`;
      const compareDate: string = `0.8, 2.5, 1.5, 2.5`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error LensSpecification ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013400
     * @tc.name      : modifyImageProperty('NewSubfileType')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('NewSubfileType', `5`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013400';
      const key: string = 'NewSubfileType';
      const modifyDate: string = `5`;
      const compareDate: string = `5`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error NewSubfileType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013500
     * @tc.name      : modifyImageProperty('OffsetTime')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('OffsetTime', `2023:01:25`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013500';
      const key: string = 'OffsetTime';
      const modifyDate: string = `2023:01:25`;
      const compareDate: string = `2023:01:25`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error OffsetTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013600
     * @tc.name      : modifyImageProperty('OffsetTimeDigitized')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('OffsetTimeDigitized', `cirtize`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013600';
      const key: string = 'OffsetTimeDigitized';
      const modifyDate: string = `cirtize`;
      const compareDate: string = `cirtize`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error OffsetTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013700
     * @tc.name      : modifyImageProperty('OffsetTimeOriginal')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('OffsetTimeOriginal', `ject`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013700';
      const key: string = 'OffsetTimeOriginal';
      const modifyDate: string = `ject`;
      const compareDate: string = `ject`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error OffsetTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013800
     * @tc.name      : modifyImageProperty('SourceExposureTimesOfCompositeImage')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SourceExposureTimesOfCompositeImage', `xixe`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013800';
      const key: string = 'SourceExposureTimesOfCompositeImage';
      const modifyDate: string = `xixe`;
      const compareDate: string = `xixe`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error SourceExposureTimesOfCompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013900
     * @tc.name      : modifyImageProperty('SourceImageNumberOfCompositeImage')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SourceImageNumberOfCompositeImage', `11 23`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_013900';
      const key: string = 'SourceImageNumberOfCompositeImage';
      const modifyDate: string = `11 23`;
      const compareDate: string = `11, 23`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error SourceImageNumberOfCompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_014000
     * @tc.name      : modifyImageProperty('SubfileType')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('SubfileType', `3`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_014000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_014000';
      const key: string = 'SubfileType';
      const modifyDate: string = `3`;
      const compareDate: string = `3`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error SubfileType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_014100
     * @tc.name      : modifyImageProperty('GPSHPositioningError')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('GPSHPositioningError', `1/2`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_014100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_014100';
      const key: string = 'GPSHPositioningError';
      const modifyDate: string = `1/2`;
      const compareDate: string = `0.5`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error GPSHPositioningError ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_014200
     * @tc.name      : modifyImageProperty('PhotographicSensitivity')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('PhotographicSensitivity', `12800`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_014200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_014200';
      const key: string = 'PhotographicSensitivity';
      const modifyDate: string = `65535`;
      const compareDate: string = `65535`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error PhotographicSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_014500
     * @tc.name      : modifyImageProperty('HwMnoteCaptureMode')_callback
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('HwMnoteCaptureMode', `123456789`)_callback
     *                 3.getImageProperty_promise value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_014500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_CALLBACK_014500';
      const key: string = 'HwMnoteCaptureMode';
      const modifyDate: string = `123456789`;
      const compareDate: string = `123456789`;
      try {
        await modifyCallbackResult(done, testTag, key, modifyDate, compareDate);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty callback error HwMnoteCaptureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0100
     * @tc.name      : modifyImageProperty('BitsPerSample', `8,8`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('BitsPerSample', `8,8`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0100';
      const key: string = 'BitsPerSample';
      const errorDate: string = `8,8`;
      const value: string = `65535, 65535, 65535`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error BitsPerSample ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0200
     * @tc.name      : modifyImageProperty('Orientation', `0`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('Orientation', `0`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0200';
      const key: string = 'Orientation';
      const errorDate: string = `0`;
      const value: string = `Left-bottom`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Orientation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0300
     * @tc.name      : modifyImageProperty('ImageLength', `abc`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('ImageLength', `abc`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0300';
      const key: string = 'ImageLength';
      const errorDate: string = `abc`;
      const value: string = `65535`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ImageLength ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0400
     * @tc.name      : modifyImageProperty('ImageWidth', `@@@`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('ImageWidth', `@@@`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0400';
      const key: string = 'ImageWidth';
      const errorDate: string = `@@@`;
      const value: string = `65535`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ImageWidth ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0500
     * @tc.name      : modifyImageProperty('GPSLatitude', `abc,3`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSLatitude', `abc,3`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0500';
      const key: string = 'GPSLatitude';
      const errorDate: string = `abc,3`;
      const value: string = `38.0,  0,  0`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSLatitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0600
     * @tc.name      : modifyImageProperty('GPSLongitude', `12,a`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSLongitude', `12,a`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0600';
      const key: string = 'GPSLongitude';
      const errorDate: string = `12,a`;
      const value: string = `38.0,  0,  0`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSLongitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0700
     * @tc.name      : modifyImageProperty('GPSLatitudeRef', `W`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSLatitudeRef', `W`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0700';
      const key: string = 'GPSLatitudeRef';
      const errorDate: string = `W`;
      const value: string = `S`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSLatitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0800
     * @tc.name      : modifyImageProperty('GPSLongitudeRef', `S`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSLongitudeRef', `S`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0800';
      const key: string = 'GPSLongitudeRef';
      const errorDate: string = `S`;
      const value: string = `W`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSLongitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0900
     * @tc.name      : modifyImageProperty('PhotoMode', `05:61:34`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('DateTimeOriginal', `05:61:34`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_0900';
      const key: string = 'DateTimeOriginal';
      const errorDate: string = `05:61:34`;
      const value: string = `1900:01:01 00:00:00`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DateTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_01000
     * @tc.name      : modifyImageProperty('ExposureTime', `1/0`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('ExposureTime', `1/0`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_01000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_01000';
      const key: string = 'ExposureTime';
      const errorDate: string = `1/0`;
      const value: string = `1/60 sec.`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExposureTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_01200
     * @tc.name      : modifyImageProperty('ISOSpeedRatings', `-1`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('ISOSpeedRatings', `-1`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_01200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_01200';
      const key: string = 'ISOSpeedRatings';
      const errorDate: string = `-1`;
      const value: string = `65535`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ISOSpeedRatings ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_01300
     * @tc.name      : modifyImageProperty('FNumber', `1/0`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('FNumber', `1/0`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_01300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_01300';
      const key: string = 'FNumber';
      const errorDate: string = `1/0`;
      const value: string = `f/0.0`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_01400
     * @tc.name      : modifyImageProperty('DateTime', `2024:13:01`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('DateTime', `2024:13:01`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_01400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_01400';
      const key: string = 'DateTime';
      const errorDate: string = `2024:13:01`;
      const value: string = `1900:01:01`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DateTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_01500
     * @tc.name      : modifyImageProperty('GPSTimeStamp', `37/0,58/0`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSTimeStamp', `37/0,58/0`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_01500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_01500';
      const key: string = 'GPSTimeStamp';
      const errorDate: string = `37/0,58/0`;
      const value: string = `12:54:20.00`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSTimeStamp ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_01600
     * @tc.name      : modifyImageProperty('GPSDateStamp', `2023:01`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSDateStamp', `2023:01`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_01600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_01600';
      const key: string = 'GPSDateStamp';
      const errorDate: string = `2023:01`;
      const value: string = `1900:01:01`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDateStamp ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02000
     * @tc.name      : modifyImageProperty('PhotoMode', `Unknown`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('PhotoMode', `Unknown`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02000';
      const key: string = 'PhotoMode';
      const errorDate: string = `Unknown`;
      const value: string = `13`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PhotoMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02100
     * @tc.name      : modifyImageProperty('SensitivityType', `a`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('SensitivityType', `a`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02100';
      const key: string = 'SensitivityType';
      const errorDate: string = `a`;
      const value: string = `Unknown`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SensitivityType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02200
     * @tc.name      : modifyImageProperty('StandardOutputSensitivity', `abc`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('StandardOutputSensitivity', `abc`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02200';
      const key: string = 'StandardOutputSensitivity';
      const errorDate: string = `abc`;
      const value: string = `1000`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error StandardOutputSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02300
     * @tc.name      : modifyImageProperty('RecommendedExposureIndex', `-123`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('RecommendedExposureIndex', `-123`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02300';
      const key: string = 'RecommendedExposureIndex';
      const errorDate: string = `-123`;
      const value: string = `2147483647`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error RecommendedExposureIndex ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02400
     * @tc.name      : modifyImageProperty('ApertureValue', `a`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('ApertureValue', `a`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02400';
      const key: string = 'ApertureValue';
      const errorDate: string = `a`;
      const value: string = `16.00 EV (f/256.0)`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ApertureValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02500
     * @tc.name      : modifyImageProperty('ExposureBiasValue', `a`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('ExposureBiasValue', `a`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02500';
      const key: string = 'ExposureBiasValue';
      const errorDate: string = `a`;
      const value: string = `4.00 EV`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExposureBiasValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02600
     * @tc.name      : modifyImageProperty('MeteringMode', `256`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('MeteringMode', `256`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02600';
      const key: string = 'MeteringMode';
      const errorDate: string = `256`;
      const value: string = `Unknown`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error MeteringMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02700
     * @tc.name      : modifyImageProperty('LightSource', `256`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('LightSource', `256`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02700';
      const key: string = 'LightSource';
      const errorDate: string = `256`;
      const value: string = `Fluorescent`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error LightSource ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02800
     * @tc.name      : modifyImageProperty('Flash', `999`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('Flash', `999`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02800';
      const key: string = 'Flash';
      const errorDate: string = `999`;
      const value: string = `Flash fired, auto mode, return light detected, red-eye reduction mode`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Flash ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02900
     * @tc.name      : modifyImageProperty('FocalLength', `a`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('FocalLength', `a`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_02900';
      const key: string = 'FocalLength';
      const errorDate: string = `a`;
      const value: string = `31.0 mm`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FocalLength ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03100
     * @tc.name      : modifyImageProperty('PixelXDimension', `abc`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('PixelXDimension', `abc`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03100';
      const key: string = 'PixelXDimension';
      const errorDate: string = `abc`;
      const value: string = `0`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PixelXDimension ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03200
     * @tc.name      : modifyImageProperty('PixelYDimension', `!!!`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('PixelYDimension', `!!!`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03200';
      const key: string = 'PixelYDimension';
      const errorDate: string = `!!!`;
      const value: string = `0`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PixelYDimension ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03300
     * @tc.name      : modifyImageProperty('WhiteBalance', `2`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('WhiteBalance', `2`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03300';
      const key: string = 'WhiteBalance';
      const errorDate: string = `2`;
      const value: string = `Auto white balance`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error WhiteBalance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03400
     * @tc.name      : modifyImageProperty('FocalLengthIn35mmFilm', `abc`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('FocalLengthIn35mmFilm', `abc`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03400';
      const key: string = 'FocalLengthIn35mmFilm';
      const errorDate: string = `abc`;
      const value: string = `12`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FocalLengthIn35mmFilm ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03500
     * @tc.name      : modifyImageProperty('Compression', `11`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('Compression', `11`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03500';
      const key: string = 'Compression';
      const errorDate: string = `11`;
      const value: string = `PackBits compression`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Compression ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03600
     * @tc.name      : modifyImageProperty('PhotometricInterpretation', `a`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('PhotometricInterpretation', `a`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03600';
      const key: string = 'PhotometricInterpretation';
      const errorDate: string = `a`;
      const value: string = `Normal mono`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PhotometricInterpretation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03700
     * @tc.name      : modifyImageProperty('StripOffsets', `abc`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('StripOffsets', `abc`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03700';
      const key: string = 'StripOffsets';
      const errorDate: string = `abc`;
      const value: string = `456`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error StripOffsets ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03800
     * @tc.name      : modifyImageProperty('SamplesPerPixel', `-1`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('SamplesPerPixel', `-1`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03800';
      const key: string = 'SamplesPerPixel';
      const errorDate: string = `-1`;
      const value: string = `65535`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SamplesPerPixel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03900
     * @tc.name      : modifyImageProperty('RowsPerStrip', `abc`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('RowsPerStrip', `abc`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_03900';
      const key: string = 'RowsPerStrip';
      const errorDate: string = `abc`;
      const value: string = `345`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error RowsPerStrip ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_04000
     * @tc.name      : modifyImageProperty('StripByteCounts', `abc`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('StripByteCounts', `abc`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_04000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_04000';
      const key: string = 'StripByteCounts';
      const errorDate: string = `abc`;
      const value: string = `345`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error StripByteCounts ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_04100
     * @tc.name      : modifyImageProperty('XResolution', `a`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('XResolution', `a`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_04100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_04100';
      const key: string = 'XResolution';
      const errorDate: string = `a`;
      const value: string = `31`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error XResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_04200
     * @tc.name      : modifyImageProperty('YResolution', `b`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('YResolution', `b`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_04200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_04200';
      const key: string = 'YResolution';
      const errorDate: string = `b`;
      const value: string = `31`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error YResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_04300
     * @tc.name      : modifyImageProperty('PlanarConfiguration', `a`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('PlanarConfiguration', `a`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_04300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_04300';
      const key: string = 'PlanarConfiguration';
      const errorDate: string = `a`;
      const value: string = `Planar format`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PlanarConfiguration ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_04400
     * @tc.name      : modifyImageProperty('ResolutionUnit', `4`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('ResolutionUnit', `4`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_04400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_04400';
      const key: string = 'ResolutionUnit';
      const errorDate: string = `4`;
      const value: string = `Centimeter`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ResolutionUnit ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_04800
     * @tc.name      : modifyImageProperty('WhitePoint', `abc`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('WhitePoint', `abc`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_04800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_04800';
      const key: string = 'WhitePoint';
      const errorDate: string = `abc`;
      const value: string = `31, 0/0`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error WhitePoint ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_04900
     * @tc.name      : modifyImageProperty('PrimaryChromaticities', `abc`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('PrimaryChromaticities', `abc`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_04900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_04900';
      const key: string = 'PrimaryChromaticities';
      const errorDate: string = `abc`;
      const value: string = `31`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PrimaryChromaticities ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_05000
     * @tc.name      : modifyImageProperty('YCbCrCoefficients', `123,345`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('YCbCrCoefficients', `123,345`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_05000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_05000';
      const key: string = 'YCbCrCoefficients';
      const errorDate: string = `123,345`;
      const value: string = `1.5, 2.0, 3.0`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error YCbCrCoefficients ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_05100
     * @tc.name      : modifyImageProperty('YCbCrSubSampling', `4`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('YCbCrSubSampling', `4`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_05100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_05100';
      const key: string = 'YCbCrSubSampling';
      const errorDate: string = `4`;
      const value: string = `4, 5`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error YCbCrSubSampling ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_05200
     * @tc.name      : modifyImageProperty('YCbCrPositioning', `3`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('YCbCrPositioning', `3`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_05200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_05200';
      const key: string = 'YCbCrPositioning';
      const errorDate: string = `3`;
      const value: string = `Co-sited`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error YCbCrPositioning ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_05300
     * @tc.name      : modifyImageProperty('ReferenceBlackWhite', `undefined`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('ReferenceBlackWhite', `undefined`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_05300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_05300';
      const key: string = 'ReferenceBlackWhite';
      const errorDate: string = `undefined`;
      const value: string = ` 3, 255,  0, 255,  0, 255`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ReferenceBlackWhite ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_05700
     * @tc.name      : modifyImageProperty('ExposureProgram', `-1`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('ExposureProgram', `-1`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_05700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_05700';
      const key: string = 'ExposureProgram';
      const errorDate: string = `-1`;
      const value: string = `Landscape mode (for landscape photos with the background in focus)`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExposureProgram ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_06000
     * @tc.name      : modifyImageProperty('ExifVersion', `a`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('ExifVersion', `a`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_06000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_06000';
      const key: string = 'ExifVersion';
      const errorDate: string = `a`;
      const value: string = `Exif Version 1.2`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExifVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_06100
     * @tc.name      : modifyImageProperty('DateTimeDigitized', `a`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('DateTimeDigitized', `a`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_06100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_06100';
      const key: string = 'DateTimeDigitized';
      const errorDate: string = `a`;
      const value: string = `1900:01:01 00:00:00`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DateTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_06200
     * @tc.name      : modifyImageProperty('ComponentsConfiguration', `a`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('ComponentsConfiguration', `a`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_06200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_06200';
      const key: string = 'ComponentsConfiguration';
      const errorDate: string = `a`;
      const value: string = `Y Cb G B`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ComponentsConfiguration ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_06300
     * @tc.name      : modifyImageProperty('ShutterSpeedValue', `0/0`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('ShutterSpeedValue', `0/0`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_06300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_06300';
      const key: string = 'ShutterSpeedValue';
      const errorDate: string = `0/0`;
      const value: string = `1.50 EV (1/3 sec.)`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ShutterSpeedValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_06400
     * @tc.name      : modifyImageProperty('BrightnessValue', `12000000/0`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('BrightnessValue', `12000000/0`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_06400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_06400';
      const key: string = 'BrightnessValue';
      const errorDate: string = `12000000/0`;
      const value: string = `1.20 EV (7.87 cd/m^2)`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error BrightnessValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_06500
     * @tc.name      : modifyImageProperty('MaxApertureValue', `-1/0`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('MaxApertureValue', `-1/0`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_06500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_06500';
      const key: string = 'MaxApertureValue';
      const errorDate: string = `-1/0`;
      const value: string = `1.60 EV (f/1.7)`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error MaxApertureValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_06600
     * @tc.name      : modifyImageProperty('SubjectDistance', `meter`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('SubjectDistance', `meter`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_06600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_06600';
      const key: string = 'SubjectDistance';
      const errorDate: string = `meter`;
      const value: string = `0.5 m`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubjectDistance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_06700
     * @tc.name      : modifyImageProperty('SubjectArea', `abc`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('SubjectArea', `abc`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_06700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_06700';
      const key: string = 'SubjectArea';
      const errorDate: string = `abc`;
      const value: string = `(x,y) = (45,23)`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubjectArea ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_07200
     * @tc.name      : modifyImageProperty('FlashpixVersion', `abc`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('FlashpixVersion', `abc`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_07200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_07200';
      const key: string = 'FlashpixVersion';
      const errorDate: string = `abc`;
      const value: string = `FlashPix Version 1.01`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FlashpixVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_07300
     * @tc.name      : modifyImageProperty('ColorSpace', `abc`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('ColorSpace', `abc`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_07300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_07300';
      const key: string = 'ColorSpace';
      const errorDate: string = `abc`;
      const value: string = `Adobe RGB`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ColorSpace ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_07500
     * @tc.name      : modifyImageProperty('FlashEnergy', `华为`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('FlashEnergy', `华为`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_07500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_07500';
      const key: string = 'FlashEnergy';
      const errorDate: string = `华为`;
      const value: string = `2.5`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FlashEnergy ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_07700
     * @tc.name      : modifyImageProperty('FocalPlaneXResolution', `abc`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('FocalPlaneXResolution', `abc`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_07700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_07700';
      const key: string = 'FocalPlaneXResolution';
      const errorDate: string = `abc`;
      const value: string = `102`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FocalPlaneXResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_07800
     * @tc.name      : modifyImageProperty('FocalPlaneYResolution', `abc`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('FocalPlaneYResolution', `abc`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_07800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_07800';
      const key: string = 'FocalPlaneYResolution';
      const errorDate: string = `abc`;
      const value: string = `81`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FocalPlaneYResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_07900
     * @tc.name      : modifyImageProperty('FocalPlaneResolutionUnit', `255`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('FocalPlaneResolutionUnit', `255`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_07900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_07900';
      const key: string = 'FocalPlaneResolutionUnit';
      const errorDate: string = `255`;
      const value: string = `Centimeter`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error FocalPlaneResolutionUnit ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_08000
     * @tc.name      : modifyImageProperty('SubjectLocation', `beijing`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('SubjectLocation', `beijing`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_08000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_08000';
      const key: string = 'SubjectLocation';
      const errorDate: string = `beijing`;
      const value: string = `23, 112`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubjectLocation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_08100
     * @tc.name      : modifyImageProperty('ExposureIndex', `-1/1`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('ExposureIndex', `-1/1`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_08100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_08100';
      const key: string = 'ExposureIndex';
      const errorDate: string = `-1/1`;
      const value: string = `2.5`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExposureIndex ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_08200
     * @tc.name      : modifyImageProperty('SensingMethod', `9`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('SensingMethod', `9`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_08200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_08200';
      const key: string = 'SensingMethod';
      const errorDate: string = `9`;
      const value: string = `Color sequential linear sensor`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SensingMethod ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_08500
     * @tc.name      : modifyImageProperty('CustomRendered', `2`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('CustomRendered', `2`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_08500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_08500';
      const key: string = 'CustomRendered';
      const errorDate: string = `2`;
      const value: string = `Custom process`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error CustomRendered ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_08600
     * @tc.name      : modifyImageProperty('ExposureMode', `3`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('ExposureMode', `3`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_08600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_08600';
      const key: string = 'ExposureMode';
      const errorDate: string = `3`;
      const value: string = `Auto bracket`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ExposureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_08700
     * @tc.name      : modifyImageProperty('DigitalZoomRatio', `a`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('DigitalZoomRatio', `a`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_08700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_08700';
      const key: string = 'DigitalZoomRatio';
      const errorDate: string = `a`;
      const value: string = `23`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DigitalZoomRatio ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_08800
     * @tc.name      : modifyImageProperty('SceneCaptureType', `4`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('SceneCaptureType', `4`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_08800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_08800';
      const key: string = 'SceneCaptureType';
      const errorDate: string = `4`;
      const value: string = `Night scene`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SceneCaptureType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_08900
     * @tc.name      : modifyImageProperty('GainControl', `5`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GainControl', `5`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_08900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_08900';
      const key: string = 'GainControl';
      const errorDate: string = `5`;
      const value: string = `High gain down`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GainControl ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_09000
     * @tc.name      : modifyImageProperty('Contrast', `3`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('Contrast', `3`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_09000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_09000';
      const key: string = 'Contrast';
      const errorDate: string = `3`;
      const value: string = `Hard`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Contrast ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_09100
     * @tc.name      : modifyImageProperty('Saturation', `65536`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('Saturation', `65536`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_09100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_09100';
      const key: string = 'Saturation';
      const errorDate: string = `65536`;
      const value: string = `High saturation`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Saturation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_09200
     * @tc.name      : modifyImageProperty('Sharpness', `65535`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('Sharpness', `65535`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_09200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_09200';
      const key: string = 'Sharpness';
      const errorDate: string = `65535`;
      const value: string = `Hard`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Sharpness ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_09400
     * @tc.name      : modifyImageProperty('SubjectDistanceRange', `a`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('SubjectDistanceRange', `a`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_09400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_09400';
      const key: string = 'SubjectDistanceRange';
      const errorDate: string = `a`;
      const value: string = `Distant view`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubjectDistanceRange ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_09600
     * @tc.name      : modifyImageProperty('GPSVersionID', `23`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSVersionID', `23`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_09600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_09600';
      const key: string = 'GPSVersionID';
      const errorDate: string = `23`;
      const value: string = `2.2.0.1`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSVersionID ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_09700
     * @tc.name      : modifyImageProperty('GPSAltitudeRef', `2`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSAltitudeRef', `2`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_09700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_09700';
      const key: string = 'GPSAltitudeRef';
      const errorDate: string = `2`;
      const value: string = `Sea level reference`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSAltitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_09800
     * @tc.name      : modifyImageProperty('GPSAltitude', `abc`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSAltitude', `abc`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_09800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_09800';
      const key: string = 'GPSAltitude';
      const errorDate: string = `abc`;
      const value: string = `1.00`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSAltitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010000
     * @tc.name      : modifyImageProperty('GPSStatus', `C`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSStatus', `C`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010000';
      const key: string = 'GPSStatus';
      const errorDate: string = `C`;
      const value: string = `V`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSStatus ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010100
     * @tc.name      : modifyImageProperty('GPSMeasureMode', `4`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSMeasureMode', `4`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010100';
      const key: string = 'GPSMeasureMode';
      const errorDate: string = `4`;
      const value: string = `3`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSMeasureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010200
     * @tc.name      : modifyImageProperty('GPSDOP', `-1`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSDOP', `-1`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010200';
      const key: string = 'GPSDOP';
      const errorDate: string = `-1`;
      const value: string = `1.00`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDOP ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010300
     * @tc.name      : modifyImageProperty('GPSSpeedRef', `AA`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSSpeedRef', `AA`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010300';
      const key: string = 'GPSSpeedRef';
      const errorDate: string = `AA`;
      const value: string = `K`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSSpeedRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010400
     * @tc.name      : modifyImageProperty('GPSSpeed', `a`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSSpeed', `a`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010400';
      const key: string = 'GPSSpeed';
      const errorDate: string = `a`;
      const value: string = ` 0`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSSpeed ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010500
     * @tc.name      : modifyImageProperty('GPSTrackRef', `C`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSTrackRef', `C`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010500';
      const key: string = 'GPSTrackRef';
      const errorDate: string = `C`;
      const value: string = `M`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSTrackRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010600
     * @tc.name      : modifyImageProperty('GPSTrack', `a`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSTrack', `a`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010600';
      const key: string = 'GPSTrack';
      const errorDate: string = `a`;
      const value: string = `3.5`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSTrack ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010700
     * @tc.name      : modifyImageProperty('GPSImgDirectionRef', `C`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSImgDirectionRef', `C`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010700';
      const key: string = 'GPSImgDirectionRef';
      const errorDate: string = `C`;
      const value: string = `T`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSImgDirectionRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010800
     * @tc.name      : modifyImageProperty('GPSImgDirection', `a`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSImgDirection', `a`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_010800';
      const key: string = 'GPSImgDirection';
      const errorDate: string = `a`;
      const value: string = `2.5`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSImgDirection ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_011000
     * @tc.name      : modifyImageProperty('GPSDestLatitudeRef', `W`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSDestLatitudeRef', `W`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_011000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_011000';
      const key: string = 'GPSDestLatitudeRef';
      const errorDate: string = `W`;
      const value: string = `S`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestLatitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_011100
     * @tc.name      : modifyImageProperty('GPSDestLatitude', `abc`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSDestLatitude', `abc`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_011100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_011100';
      const key: string = 'GPSDestLatitude';
      const errorDate: string = `abc`;
      const value: string = ` 0,  0,  0`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestLatitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_011200
     * @tc.name      : modifyImageProperty('GPSDestLongitudeRef', `S`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSDestLongitudeRef', `S`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_011200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_011200';
      const key: string = 'GPSDestLongitudeRef';
      const errorDate: string = `S`;
      const value: string = `W`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestLongitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_011300
     * @tc.name      : modifyImageProperty('GPSDestLongitude', `none`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSDestLongitude', `none`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_011300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_011300';
      const key: string = 'GPSDestLongitude';
      const errorDate: string = `none`;
      const value: string = ` 0,  0,  0`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestLongitude ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_011500
     * @tc.name      : modifyImageProperty('GPSDestBearing', `x`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSDestBearing', `x`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_011500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_011500';
      const key: string = 'GPSDestBearing';
      const errorDate: string = `x`;
      const value: string = `2.5`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestBearing ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_011600
     * @tc.name      : modifyImageProperty('GPSDestDistanceRef', `C`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSDestDistanceRef', `C`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_011600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_011600';
      const key: string = 'GPSDestDistanceRef';
      const errorDate: string = `C`;
      const value: string = `K`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestDistanceRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_011700
     * @tc.name      : modifyImageProperty('GPSDestDistance', `B`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSDestDistance', `B`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_011700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_011700';
      const key: string = 'GPSDestDistance';
      const errorDate: string = `B`;
      const value: string = `2.5`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDestDistance ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_012000
     * @tc.name      : modifyImageProperty('GPSDifferential', `4`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSDifferential', `4`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_012000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_012000';
      const key: string = 'GPSDifferential';
      const errorDate: string = `4`;
      const value: string = `1`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSDifferential ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_012300
     * @tc.name      : modifyImageProperty('CompositeImage', `5`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('CompositeImage', `5`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_012300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_012300';
      const key: string = 'CompositeImage';
      const errorDate: string = `5`;
      const value: string = `3`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error CompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_012400
     * @tc.name      : modifyImageProperty('CompressedBitsPerPixel', `diry`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('CompressedBitsPerPixel', `diry`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_012400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_012400';
      const key: string = 'CompressedBitsPerPixel';
      const errorDate: string = `diry`;
      const value: string = `25`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error CompressedBitsPerPixel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_012500
     * @tc.name      : modifyImageProperty('DNGVersion', `2 3`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('DNGVersion', `2 3`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_012500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_012500';
      const key: string = 'DNGVersion';
      const errorDate: string = `2 3`;
      const value: string = `2, 2, 3, 2`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DNGVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_012600
     * @tc.name      : modifyImageProperty('DefaultCropSize', `hi xic`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('DefaultCropSize', `hi xic`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_012600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_012600';
      const key: string = 'DefaultCropSize';
      const errorDate: string = `hi xic`;
      const value: string = `123, 654`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error DefaultCropSize ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_012700
     * @tc.name      : modifyImageProperty('Gamma', `rat`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('Gamma', `rat`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_012700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_012700';
      const key: string = 'Gamma';
      const errorDate: string = `rat`;
      const value: string = `1.5`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error Gamma ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_012800
     * @tc.name      : modifyImageProperty('ISOSpeedLatitudeyyy', `a`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('ISOSpeedLatitudeyyy', `a`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_012800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_012800';
      const key: string = 'ISOSpeedLatitudeyyy';
      const errorDate: string = `a`;
      const value: string = `123`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ISOSpeedLatitudeyyy ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_012900
     * @tc.name      : modifyImageProperty('ISOSpeedLatitudezzz', `bc`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('ISOSpeedLatitudezzz', `bc`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_012900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_012900';
      const key: string = 'ISOSpeedLatitudezzz';
      const errorDate: string = `bc`;
      const value: string = `123`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error ISOSpeedLatitudezzz ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_013300
     * @tc.name      : modifyImageProperty('LensSpecification', `a b c`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('LensSpecification', `a b c`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_013300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_013300';
      const key: string = 'LensSpecification';
      const errorDate: string = `a b c`;
      const value: string = `0.8, 2.5, 1.5, 2.5`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error LensSpecification ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_013400
     * @tc.name      : modifyImageProperty('NewSubfileType', `a`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('NewSubfileType', `a`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_013400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_013400';
      const key: string = 'NewSubfileType';
      const errorDate: string = `a`;
      const value: string = `5`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error NewSubfileType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_013500
     * @tc.name      : modifyImageProperty('OffsetTime', `2023:01`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('OffsetTime', `2023:01`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_013500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_013500';
      const key: string = 'OffsetTime';
      const errorDate: string = `2023:01`;
      const value: string = `2023:01:25`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error OffsetTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_013900
     * @tc.name      : modifyImageProperty('SourceImageNumberOfCompositeImage', `a`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('SourceImageNumberOfCompositeImage', `a`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_013900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_013900';
      const key: string = 'SourceImageNumberOfCompositeImage';
      const errorDate: string = `a`;
      const value: string = `11, 23`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SourceImageNumberOfCompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_014000
     * @tc.name      : modifyImageProperty('SubfileType', `5`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('SubfileType', `5`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_014000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_014000';
      const key: string = 'SubfileType';
      const errorDate: string = `5`;
      const value: string = `3`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error SubfileType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_014100
     * @tc.name      : modifyImageProperty('GPSHPositioningError', `a`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('GPSHPositioningError', `a`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_014100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_014100';
      const key: string = 'GPSHPositioningError';
      const errorDate: string = `a`;
      const value: string = `0.5`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error GPSHPositioningError ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_014200
     * @tc.name      : modifyImageProperty('PhotographicSensitivity', `华为`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('PhotographicSensitivity', `华为`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_014200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_014200';
      const key: string = 'PhotographicSensitivity';
      const errorDate: string = `华为`;
      const value: string = `65535`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error PhotographicSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_014500
     * @tc.name      : modifyImageProperty('HwMnoteCaptureMode', `á`)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('HwMnoteCaptureMode', `á`)_callback
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_014500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_014500';
      const key: string = 'HwMnoteCaptureMode';
      const errorDate: string = `á`;
      const value: string = `123456789`;
      try {
        await modifyPromiseErrorResult(done, testTag, key, errorDate, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `modifyImageProperty promise error HwMnoteCaptureMode ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_014600
     * @tc.name      : getImageProperty('BitsPerSample')_promise
     * @tc.desc      : 1.create imagesource
     *                 2.getImageProperty('BitsPerSample')_promise
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_014600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_014600';
      const key: string = 'BitsPerSample';
      try {
        await getFd('test_exif_empty_2.heic');
        let imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info(testTag + " create image source failed");
          expect().assertFail();
          done();
        } else {
          await imageSourceApi.getImageProperty(key)
            .then((data: string) => {
              hilog.info(0x0000, testTag,
                `getImageProperty promise not exist error %{public}s %{public}s %{public}s`, key, data);
              expect().assertFail();
              done();
            })
            .catch((err: BusinessError) => {
              if(62980123 == err.code) {
                hilog.info(0x0000, testTag,
                  `getImageProperty promise not exist success %{public}s %{public}s `, key, err.code);
                expect(true).assertTrue();
                done();
              } else {
                hilog.info(0x0000, testTag,
                  `getImageProperty promise not exist compare error %{public}s %{public}s `, key, err.code);
                expect().assertFail();
                done();
              }
            })
        }
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty promise error BitsPerSample ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_014700
     * @tc.name      : getImageProperty('HwMnoteFaceMouthCenter')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('HwMnoteFaceMouthCenter', '987654321')_promise
     *                 3.getImageProperty('HwMnoteFaceMouthCenter')_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_014700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_014700';
      const key: string = 'HwMnoteFaceMouthCenter';
      try {
        await getFd('test_exif_v2.heic');
        let imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info(testTag + " create image source failed");
          expect().assertFail();
          done();
        } else {
          await imageSourceApi.modifyImageProperty(key, '987654321')
            .then(() => {
              hilog.info(0x0000, testTag,
                `modifyImageProperty promise success %{public}s `, key);
              expect().assertFail();
              done();
            })
            .catch(async (err: BusinessError) => {
              hilog.info(0x0000, testTag,
                `modifyImageProperty promise failed %{public}s %{public}s `, key, err.code);
              if (62980146 == err.code) {
                let imageSourceApiGet = image.createImageSource(fdNumber);
                await imageSourceApiGet.getImageProperty(key)
                  .then((data: string) => {
                    hilog.info(0x0000, testTag,
                      `getImageProperty promise success %{public}s %{public}s %{public}s`, key, data, '1234567890');
                    if ('1 2 3 4 5 6 7 8' == data) {
                      expect(true).assertTrue();
                      done();
                    } else {
                      expect().assertFail();
                      done();
                    }
                  })
                  .catch((err: BusinessError) => {
                    hilog.info(0x0000, testTag,
                      `getImageProperty promise error %{public}s %{public}s `, key, err.code);
                    expect().assertFail();
                    done();
                  })
              }
            })
        }
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource promise error HwMnoteFaceMouthCenter ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_014800
     * @tc.name      : getImageProperty('HwMnoteFaceMouthCenter')_promise
     * @tc.desc      : 1.create imagesource
     *                 2.modifyImageProperty('HwMnoteFaceMouthCenter', '987654321')_promise
     *                 3.getImageProperty('HwMnoteFaceMouthCenter') error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_014800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_014800';
      const key: string = 'HwMnoteFaceMouthCenter';
      try {
        await getFd('test_exif_empty_2.heic');
        let imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info(testTag + " create image source failed");
          expect().assertFail();
          done();
        } else {
          await imageSourceApi.modifyImageProperty(key, '987654321')
            .then(() => {
              hilog.info(0x0000, testTag,
                `modifyImageProperty promise success %{public}s `, key);
              expect().assertFail();
              done();
            })
            .catch(async (err: BusinessError) => {
              hilog.info(0x0000, testTag,
                `modifyImageProperty promise failed %{public}s %{public}s `, key, err.code);
              if (62980146 == err.code) {
                let imageSourceApiGet = image.createImageSource(fdNumber);
                await imageSourceApiGet.getImageProperty(key)
                  .then((data: string) => {
                    hilog.info(0x0000, testTag,
                      `getImageProperty promise success %{public}s %{public}s %{public}s`, key, data, 'default_exif_value');
                    if ('default_exif_value' == data) {
                      expect(true).assertTrue();
                      done();
                    } else {
                      expect().assertFail();
                      done();
                    }
                  })
                  .catch((error: BusinessError) => {
                    hilog.info(0x0000, testTag,
                      `getImageProperty promise error %{public}s %{public}s `, key, error.code);
                    expect().assertFail();
                    done();
                  })
              }
            })
        }
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource promise error HwMnoteFaceMouthCenter ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_014900
     * @tc.name      : getImageProperty('MakerNote')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('MakerNote', 'abc')_promise
     *                 3.getImageProperty('MakerNote') error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_014900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_ERROR_014900';
      const key: string = 'MakerNote';
      try {
        await getFd('test_exif_empty_2.heic');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info(testTag + " create image source failed");
          expect().assertFail();
          done();
        } else {
          await imageSourceApi.modifyImageProperty(key, 'abc')
            .then(() => {
              hilog.info(0x0000, testTag,
                `modifyImageProperty promise success %{public}s `, key);
              expect().assertFail();
              done();
            })
            .catch(async (err: BusinessError) => {
              hilog.info(0x0000, testTag,
                `modifyImageProperty promise failed %{public}s %{public}s `, key, err.code, '62980146');
              if (62980146 == err.code) {
                const imageSourceApiGet = image.createImageSource(fdNumber);
                await imageSourceApiGet.getImageProperty(key)
                  .then((data: string) => {
                    hilog.info(0x0000, testTag,
                      `getImageProperty promise success %{public}s %{public}s %{public}s`, key, data);
                    expect().assertFail();
                    done();
                  })
                  .catch((error: BusinessError) => {
                    hilog.info(0x0000, testTag,
                      `getImageProperty promise error %{public}s %{public}s `, key, error.code);
                    if (62980123 == error.code) {
                      expect(true).assertTrue();
                      done();
                    } else {
                      expect().assertFail();
                      done();
                    }
                  })
              } else {
                expect().assertFail();
                done();
              }
            })
        }
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource promise error MakerNote ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_014600
     * @tc.name      : getImageProperty('LightSource')_promise
     * @tc.desc      : 1.create imageSource
     *                 2.modifyImageProperty('LightSource', '1')_promise
     *                 3.getImageProperty('MakerNote') error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_014600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_HEIF_EXIF_MODIFYIMAGEPROPERTY_PROMISE_014600';
      const key: string = 'LightSource';
      try {
        await getFd('test_exif_empty_2.heic');
        let imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info(testTag + " create image source failed");
          expect().assertFail();
          done();
        } else {
          await imageSourceApi.modifyImageProperty(key, '1')
            .then(async () => {
              hilog.info(0x0000, testTag,
                `modifyImageProperty promise success %{public}s `, key);
              await imageSourceApi.getImageProperty(key)
                .then((data: string) => {
                  hilog.info(0x0000, testTag,
                    `getImageProperty promise success %{public}s %{public}s %{public}s`, key, data, '1');
                  if ('Daylight' == data) {
                    expect(true).assertTrue();
                    done();
                  } else {
                    expect().assertFail();
                    done();
                  }
                })
                .catch((error: BusinessError) => {
                  hilog.info(0x0000, testTag,
                    `getImageProperty promise error %{public}s %{public}s `, key, error.code);
                  expect().assertFail();
                  done();
                })
            })
            .catch(async (err: BusinessError) => {
              hilog.info(0x0000, testTag,
                `modifyImageProperty promise failed %{public}s %{public}s `, key, err.code);
              expect().assertFail();
              done();
            })
        }
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource promise error LightSource ` + e);
        expect().assertFail();
        done();
      }
    })
  })
}
