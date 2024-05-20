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
import { describe, it, expect , beforeAll} from '@ohos/hypium';
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

export default function imageExifDngGetModifyTest() {

  describe('ImageExifDngGetModify', () => {
    let filePath: string;
    let fdNumber: number;

    const getFd = async (fileName: string) => {
      filePath = AppStorage.get('pathDir') + "/" + fileName;
      await fs.open(filePath, fs.OpenMode.READ_WRITE).then(file => {
        fdNumber = file.fd;
        console.info("image case open fd success " + fdNumber);
      })
    }

    const getPromiseResult = async (done: Function, testTag: string, key: string, value: string) => {
      await getFd('test_exif_v2.dng');
      let imageSourceApi = image.createImageSource(fdNumber);
      if (imageSourceApi == undefined) {
        console.info(testTag + " create image source failed");
        expect().assertFail();
        done();
      } else {
        await imageSourceApi.getImageProperty(key)
          .then((data: string) => {
            hilog.info(0x0000, testTag,
              `getImageProperty promise success [%{public}s] [%{public}s] [%{public}s]`, key, data, value);
            expect(data == value).assertTrue();
            done();
          })
          .catch((err: BusinessError) => {
            hilog.info(0x0000, testTag,
              `getImageProperty promise failed %{public}s %{public}s `, key, err.code);
            expect().assertFail();
            done();
          })
      }
    }


    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0100
     * @tc.name      : getImageProperty('BitsPerSample', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('BitsPerSample')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0100'
      const key: string = 'BitsPerSample';
      const value: string = '8, 8, 8';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error BitsPerSample ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0200
     * @tc.name      : getImageProperty('Orientation', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('Orientation')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0200'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0300
     * @tc.name      : getImageProperty('ImageLength', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ImageLength')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0300'
      const key: string = 'ImageLength';
      const value: string = '192';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ImageLength ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0400
     * @tc.name      : getImageProperty('ImageWidth', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ImageWidth')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0400'
      const key: string = 'ImageWidth';
      const value: string = '256';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ImageWidth ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0500
     * @tc.name      : getImageProperty('GPSLatitude', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSLatitude')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0500'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0600
     * @tc.name      : getImageProperty('GPSLongitude', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSLongitude')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0600'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0700
     * @tc.name      : getImageProperty('GPSLatitudeRef', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSLatitudeRef')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0700'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0800
     * @tc.name      : getImageProperty('GPSLongitudeRef', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSLongitudeRef')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0800'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0900
     * @tc.name      : getImageProperty('DateTimeOriginal', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('DateTimeOriginal')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_0900'
      const key: string = 'DateTimeOriginal';
      const value: string = '2024:04:18 18:18:43';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error DateTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01000
     * @tc.name      : getImageProperty('ExposureTime', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ExposureTime')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01000'
      const key: string = 'ExposureTime';
      const value: string = '1/100 sec.';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ExposureTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01100
     * @tc.name      : getImageProperty('SceneType', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SceneType')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01100'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01200
     * @tc.name      : getImageProperty('ISOSpeedRatings', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ISOSpeedRatings')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01200'
      const key: string = 'ISOSpeedRatings';
      const value: string = '205';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ISOSpeedRatings ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01300
     * @tc.name      : getImageProperty('FNumber', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('FNumber')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01300'
      const key: string = 'FNumber';
      const value: string = 'f/2.0';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error FNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01400
     * @tc.name      : getImageProperty('DateTime', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('DateTime')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01400'
      const key: string = 'DateTime';
      const value: string = '2024:04:18 18:18:43';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error DateTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01500
     * @tc.name      : getImageProperty('GPSTimeStamp', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSTimeStamp')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01500'
      const key: string = 'GPSTimeStamp';
      const value: string = '11:37:56.00';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSTimeStamp ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01600
     * @tc.name      : getImageProperty('GPSDateStamp', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSDateStamp')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01600'
      const key: string = 'GPSDateStamp';
      const value: string = '2023:10:19';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDateStamp ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01700
     * @tc.name      : getImageProperty('ImageDescription', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ImageDescription')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01700'
      const key: string = 'ImageDescription';
      const value: string = `_cuva`;
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ImageDescription ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01800
     * @tc.name      : getImageProperty('Make', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('Make')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01800'
      const key: string = 'Make';
      const value: string = 'HUAWEI';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Make ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01900
     * @tc.name      : getImageProperty('Model', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('Model')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_01900'
      const key: string = 'Model';
      const value: string = 'MNA-AL00';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Model ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02000
     * @tc.name      : getImageProperty('PhotoMode', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('PhotoMode')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02000'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02100
     * @tc.name      : getImageProperty('SensitivityType', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SensitivityType')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02100'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02200
     * @tc.name      : getImageProperty('StandardOutputSensitivity', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('StandardOutputSensitivity')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02200'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02300
     * @tc.name      : getImageProperty('RecommendedExposureIndex', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('RecommendedExposureIndex')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02300'
      const key: string = 'RecommendedExposureIndex';
      const value: string = '241';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error RecommendedExposureIndex ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02400
     * @tc.name      : getImageProperty('ApertureValue', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ApertureValue')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02400'
      const key: string = 'ApertureValue';
      const value: string = '2.00 EV (f/2.0)';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ApertureValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02500
     * @tc.name      : getImageProperty('ExposureBiasValue', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ExposureBiasValue')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02500'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02600
     * @tc.name      : getImageProperty('MeteringMode', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('MeteringMode')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02600'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02700
     * @tc.name      : getImageProperty('LightSource', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('LightSource')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02700'
      const key: string = 'LightSource';
      const value: string = 'Fluorescent';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error LightSource ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02800
     * @tc.name      : getImageProperty('Flash', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('Flash')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02800'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02900
     * @tc.name      : getImageProperty('FocalLength', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('FocalLength')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_02900'
      const key: string = 'FocalLength';
      const value: string = '6.3 mm';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error FocalLength ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03000
     * @tc.name      : getImageProperty('UserComment', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('UserComment')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03000'
      const key: string = 'UserComment';
      const value: string = 'comm';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error UserComment ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03100
     * @tc.name      : getImageProperty('PixelXDimension', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('PixelXDimension')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03100'
      const key: string = 'PixelXDimension';
      const value: string = '1000';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error PixelXDimension ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03200
     * @tc.name      : getImageProperty('PixelYDimension', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('PixelYDimension')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03200'
      const key: string = 'PixelYDimension';
      const value: string = '2000';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error PixelYDimension ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03300
     * @tc.name      : getImageProperty('WhiteBalance', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('WhiteBalance')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03300'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03400
     * @tc.name      : getImageProperty('FocalLengthIn35mmFilm', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('FocalLengthIn35mmFilm')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03400'
      const key: string = 'FocalLengthIn35mmFilm';
      const value: string = '26';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error FocalLengthIn35mmFilm ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03500
     * @tc.name      : getImageProperty('Compression', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('Compression')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03500'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03600
     * @tc.name      : getImageProperty('PhotometricInterpretation', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('PhotometricInterpretation')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03600'
      const key: string = 'PhotometricInterpretation';
      const value: string = 'RGB';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error PhotometricInterpretation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03700
     * @tc.name      : getImageProperty('StripOffsets', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('StripOffsets')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03700'
      const key: string = 'StripOffsets';
      const value: string = '10348';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error StripOffsets ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03800
     * @tc.name      : getImageProperty('SamplesPerPixel', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SamplesPerPixel')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03800'
      const key: string = 'SamplesPerPixel';
      const value: string = '3';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SamplesPerPixel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03900
     * @tc.name      : getImageProperty('RowsPerStrip', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('RowsPerStrip')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_03900'
      const key: string = 'RowsPerStrip';
      const value: string = '192';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error RowsPerStrip ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04000
     * @tc.name      : getImageProperty('StripByteCounts', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('StripByteCounts')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04000'
      const key: string = 'StripByteCounts';
      const value: string = '147456';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error StripByteCounts ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04100
     * @tc.name      : getImageProperty('XResolution', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('XResolution')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04100'
      const key: string = 'XResolution';
      const value: string = '72';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error XResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04200
     * @tc.name      : getImageProperty('YResolution', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('YResolution')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04200'
      const key: string = 'YResolution';
      const value: string = '72';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error YResolution ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04300
     * @tc.name      : getImageProperty('PlanarConfiguration', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('PlanarConfiguration')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04300'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04400
     * @tc.name      : getImageProperty('ResolutionUnit', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ResolutionUnit')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04400'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04500
     * @tc.name      : getImageProperty('TransferFunction', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('TransferFunction')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04500'
      const key: string = 'TransferFunction';
      const value: string = '2';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error TransferFunction ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04600
     * @tc.name      : getImageProperty('Software', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('Software')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04600'
      const key: string = 'Software';
      const value: string = 'HUAWEI/MNA-AL00/HWMNA:12/HUAWEIMNA-AL00/104.0.0.56C00:user/release-keys';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Software ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04700
     * @tc.name      : getImageProperty('Artist', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('Artist')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04700'
      const key: string = 'Artist';
      const value: string = 'Joseph.Xu';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Artist ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04800
     * @tc.name      : getImageProperty('WhitePoint', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('WhitePoint')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04800'
      const key: string = 'WhitePoint';
      const value: string = '124.2';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error WhitePoint ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04900
     * @tc.name      : getImageProperty('PrimaryChromaticities', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('PrimaryChromaticities')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_04900'
      const key: string = 'PrimaryChromaticities';
      const value: string = '124';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error PrimaryChromaticities ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05000
     * @tc.name      : getImageProperty('YCbCrCoefficients', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('YCbCrCoefficients')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05000'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05100
     * @tc.name      : getImageProperty('YCbCrSubSampling', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('YCbCrSubSampling')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05100'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05200
     * @tc.name      : getImageProperty('YCbCrPositioning', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('YCbCrPositioning')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05200'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05300
     * @tc.name      : getImageProperty('ReferenceBlackWhite', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ReferenceBlackWhite')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05300'
      const key: string = 'ReferenceBlackWhite';
      const value: string = '221';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ReferenceBlackWhite ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05400
     * @tc.name      : getImageProperty('Copyright', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('Copyright')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05400'
      const key: string = 'Copyright';
      const value: string = 'Hw (Photographer) - [None] (Editor)';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Copyright ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05500
     * @tc.name      : getImageProperty('JPEGInterchangeFormat', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('JPEGInterchangeFormat')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05500'
      const key: string = 'JPEGInterchangeFormat';
      const value: string = '10344';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error JPEGInterchangeFormat ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05600
     * @tc.name      : getImageProperty('JPEGInterchangeFormatLength', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('JPEGInterchangeFormatLength')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05600'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05700
     * @tc.name      : getImageProperty('ExposureProgram', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ExposureProgram')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05700'
      const key: string = 'ExposureProgram';
      const value: string = 'Normal program';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ExposureProgram ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05800
     * @tc.name      : getImageProperty('SpectralSensitivity', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SpectralSensitivity')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05800'
      const key: string = 'SpectralSensitivity';
      const value: string = 'sensitivity';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SpectralSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05900
     * @tc.name      : getImageProperty('OECF', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('OECF')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_05900'
      const key: string = 'OECF';
      const value: string = '1 bytes undefined data';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error OECF ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06000
     * @tc.name      : getImageProperty('ExifVersion', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ExifVersion')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06000'
      const key: string = 'ExifVersion';
      const value: string = 'Exif Version 2.2';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ExifVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06100
     * @tc.name      : getImageProperty('DateTimeDigitized', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('DateTimeDigitized')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06100'
      const key: string = 'DateTimeDigitized';
      const value: string = '2023:01:19 10:39:58';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error DateTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06200
     * @tc.name      : getImageProperty('ComponentsConfiguration', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ComponentsConfiguration')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06200'
      const key: string = 'ComponentsConfiguration';
      const value: string = 'R G B -';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ComponentsConfiguration ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06300
     * @tc.name      : getImageProperty('ShutterSpeedValue', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ShutterSpeedValue')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06300'
      const key: string = 'ShutterSpeedValue';
      const value: string = '6.64 EV (1/100 sec.)';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ShutterSpeedValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06400
     * @tc.name      : getImageProperty('BrightnessValue', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('BrightnessValue')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06400'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06500
     * @tc.name      : getImageProperty('MaxApertureValue', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('MaxApertureValue')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06500'
      const key: string = 'MaxApertureValue';
      const value: string = '0.08 EV (f/1.0)';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error MaxApertureValue ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06600
     * @tc.name      : getImageProperty('SubjectDistance', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SubjectDistance')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06600'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06700
     * @tc.name      : getImageProperty('SubjectArea', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SubjectArea')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06700'
      const key: string = 'SubjectArea';
      const value: string = 'Within rectangle (width 2318, height 1390) around (x,y) = (2009,1506)';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SubjectArea ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06800
     * @tc.name      : getImageProperty('MakerNote', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('MakerNote')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06800'
      const key: string = 'MakerNote';
      const value: string = 'HwMnoteCaptureMode:1,HwMnoteBurstNumber:2,HwMnoteFrontCamera:3,HwMnoteRollAngle:4,' +
        'HwMnotePitchAngle:5,HwMnotePhysicalAperture:6,HwMnoteFocusMode:7,MovingPhotoId:8,MovingPhotoVersion:9,' +
        'MicroVideoPresentationTimestampUS:1713866834879000,HwMnoteFacePointer:166,HwMnoteFaceVersion:1,' +
        'HwMnoteFaceCount:2,HwMnoteFaceConf:3,HwMnoteFaceSmileScore:1 2 3 4 5 6 7 8,' +
        'HwMnoteFaceRect:1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8,HwMnoteFaceLeyeCenter:1 2 3 4,HwMnoteFaceReyeCenter:5 6 7 8,' +
        'HwMnoteFaceMouthCenter:1 2 3 4 5 6 7 8,HwMnoteScenePointer:300,HwMnoteSceneVersion:1,HwMnoteSceneFoodConf:2,' +
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06900
     * @tc.name      : getImageProperty('SubsecTime', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SubsecTime')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_06900'
      const key: string = 'SubsecTime';
      const value: string = '427000';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SubsecTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07000
     * @tc.name      : getImageProperty('SubsecTimeOriginal', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SubsecTimeOriginal')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07000'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07100
     * @tc.name      : getImageProperty('SubsecTimeDigitized', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SubsecTimeDigitized')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07100'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07200
     * @tc.name      : getImageProperty('FlashpixVersion', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('FlashpixVersion')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07200'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07300
     * @tc.name      : getImageProperty('ColorSpace', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ColorSpace')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07300'
      const key: string = 'ColorSpace';
      const value: string = 'Adobe RGB';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ColorSpace ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07400
     * @tc.name      : getImageProperty('RelatedSoundFile', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('RelatedSoundFile')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07400'
      const key: string = 'RelatedSoundFile';
      const value: string = '/usr/home/sound/sea.wav';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error RelatedSoundFile ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07500
     * @tc.name      : getImageProperty('FlashEnergy', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('FlashEnergy')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07500'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07600
     * @tc.name      : getImageProperty('SpatialFrequencyResponse', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SpatialFrequencyResponse')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07600'
      const key: string = 'SpatialFrequencyResponse';
      const value: string = '.';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SpatialFrequencyResponse ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07700
     * @tc.name      : getImageProperty('FocalPlaneXResolution', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('FocalPlaneXResolution')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07700'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07800
     * @tc.name      : getImageProperty('FocalPlaneYResolution', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('FocalPlaneYResolution')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07800'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07900
     * @tc.name      : getImageProperty('FocalPlaneResolutionUnit', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('FocalPlaneResolutionUnit')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_07900'
      const key: string = 'FocalPlaneResolutionUnit';
      const value: string = 'Centimeter';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error FocalPlaneResolutionUnit ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08000
     * @tc.name      : getImageProperty('SubjectLocation', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SubjectLocation')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08000'
      const key: string = 'SubjectLocation';
      const value: string = '2009, 1506, 2318, 1390';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SubjectLocation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08100
     * @tc.name      : getImageProperty('ExposureIndex', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ExposureIndex')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08100'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08200
     * @tc.name      : getImageProperty('SensingMethod', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SensingMethod')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08200'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08300
     * @tc.name      : getImageProperty('FileSource', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('FileSource')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08300'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08400
     * @tc.name      : getImageProperty('CFAPattern', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('CFAPattern')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08400'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08500
     * @tc.name      : getImageProperty('CustomRendered', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('CustomRendered')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08500'
      const key: string = 'CustomRendered';
      const value: string = 'Custom process';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error CustomRendered ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08600
     * @tc.name      : getImageProperty('ExposureMode', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ExposureMode')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08600'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08700
     * @tc.name      : getImageProperty('DigitalZoomRatio', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('DigitalZoomRatio')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08700'
      const key: string = 'DigitalZoomRatio';
      const value: string = ' 0';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error DigitalZoomRatio ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08800
     * @tc.name      : getImageProperty('SceneCaptureType', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SceneCaptureType')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08800'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08900
     * @tc.name      : getImageProperty('GainControl', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GainControl')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_08900'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09000
     * @tc.name      : getImageProperty('Contrast', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('Contrast')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09000'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09100
     * @tc.name      : getImageProperty('Saturation', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('Saturation')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09100'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09200
     * @tc.name      : getImageProperty('Sharpness', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('Sharpness')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09200'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09300
     * @tc.name      : getImageProperty('DeviceSettingDescription', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('DeviceSettingDescription')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09300'
      const key: string = 'DeviceSettingDescription';
      const value: string = '.';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error DeviceSettingDescription ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09400
     * @tc.name      : getImageProperty('SubjectDistanceRange', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SubjectDistanceRange')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09400'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09500
     * @tc.name      : getImageProperty('ImageUniqueID', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ImageUniqueID')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09500'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09600
     * @tc.name      : getImageProperty('GPSVersionID', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSVersionID')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09600'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09700
     * @tc.name      : getImageProperty('GPSAltitudeRef', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSAltitudeRef')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09700'
      const key: string = 'GPSAltitudeRef';
      const value: string = 'Sea level reference';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSAltitudeRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09800
     * @tc.name      : getImageProperty('GPSAltitude', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSAltitude')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09800'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09900
     * @tc.name      : getImageProperty('GPSSatellites', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSSatellites')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_09900'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010000
     * @tc.name      : getImageProperty('GPSStatus', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSStatus')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010000'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010100
     * @tc.name      : getImageProperty('GPSMeasureMode', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSMeasureMode')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010100'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010200
     * @tc.name      : getImageProperty('GPSDOP', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSDOP')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010200'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010300
     * @tc.name      : getImageProperty('GPSSpeedRef', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSSpeedRef')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010300'
      const key: string = 'GPSSpeedRef';
      const value: string = 'K';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSSpeedRef ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010400
     * @tc.name      : getImageProperty('GPSSpeed', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSSpeed')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010400'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010500
     * @tc.name      : getImageProperty('GPSTrackRef', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSTrackRef')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010500'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010600
     * @tc.name      : getImageProperty('GPSTrack', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSTrack')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010600'
      const key: string = 'GPSTrack';
      const value: string = '56';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSTrack ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010700
     * @tc.name      : getImageProperty('GPSImgDirectionRef', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSImgDirectionRef')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010700'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010800
     * @tc.name      : getImageProperty('GPSImgDirection', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSImgDirection')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010800'
      const key: string = 'GPSImgDirection';
      const value: string = '2.23214';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSImgDirection ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010900
     * @tc.name      : getImageProperty('GPSMapDatum', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSMapDatum')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_010900'
      const key: string = 'GPSMapDatum';
      const value: string = 'xxxx';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSMapDatum ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011000
     * @tc.name      : getImageProperty('GPSDestLatitudeRef', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSDestLatitudeRef')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011000'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011100
     * @tc.name      : getImageProperty('GPSDestLatitude', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSDestLatitude')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011100'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011200
     * @tc.name      : getImageProperty('GPSDestLongitudeRef', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSDestLongitudeRef')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011200'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011300
     * @tc.name      : getImageProperty('GPSDestLongitude', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSDestLongitude')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011300'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011400
     * @tc.name      : getImageProperty('GPSDestBearingRef', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSDestBearingRef')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011400'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011500
     * @tc.name      : getImageProperty('GPSDestBearing', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSDestBearing')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011500'
      const key: string = 'GPSDestBearing';
      const value: string = ' 0';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDestBearing ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011600
     * @tc.name      : getImageProperty('GPSDestDistanceRef', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSDestDistanceRef')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011600'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011700
     * @tc.name      : getImageProperty('GPSDestDistance', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSDestDistance')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011700'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011800
     * @tc.name      : getImageProperty('GPSProcessingMethod', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSProcessingMethod')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011800'
      const key: string = 'GPSProcessingMethod';
      const value: string = 'GPS';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSProcessingMethod ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011900
     * @tc.name      : getImageProperty('GPSAreaInformation', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSAreaInformation')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_011900'
      const key: string = 'GPSAreaInformation';
      const value: string = '23...15...57';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSAreaInformation ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012000
     * @tc.name      : getImageProperty('GPSDifferential', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSDifferential')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012000'
      const key: string = 'GPSDifferential';
      const value: string = '1';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSDifferential ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012100
     * @tc.name      : getImageProperty('BodySerialNumber', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('BodySerialNumber')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012100'
      const key: string = 'BodySerialNumber';
      const value: string = 'xx';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error BodySerialNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012200
     * @tc.name      : getImageProperty('CameraOwnerName', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('CameraOwnerName')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012200'
      const key: string = 'CameraOwnerName';
      const value: string = 'xx';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error CameraOwnerName ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012300
     * @tc.name      : getImageProperty('CompositeImage', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('CompositeImage')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012300'
      const key: string = 'CompositeImage';
      const value: string = '1';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error CompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012400
     * @tc.name      : getImageProperty('CompressedBitsPerPixel', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('CompressedBitsPerPixel')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012400'
      const key: string = 'CompressedBitsPerPixel';
      const value: string = '1.5';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error CompressedBitsPerPixel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012500
     * @tc.name      : getImageProperty('DNGVersion', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('DNGVersion')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012500'
      const key: string = 'DNGVersion';
      const value: string = '0x01, 0x01, 0x02, 0x03';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error DNGVersion ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012600
     * @tc.name      : getImageProperty('DefaultCropSize', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('DefaultCropSize')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012600'
      const key: string = 'DefaultCropSize';
      const value: string = '1';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error DefaultCropSize ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012700
     * @tc.name      : getImageProperty('Gamma', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('Gamma')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012700'
      const key: string = 'Gamma';
      const value: string = '1.5';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error Gamma ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012800
     * @tc.name      : getImageProperty('ISOSpeedLatitudeyyy', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ISOSpeedLatitudeyyy')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012800'
      const key: string = 'ISOSpeedLatitudeyyy';
      const value: string = '3';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ISOSpeedLatitudeyyy ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012900
     * @tc.name      : getImageProperty('ISOSpeedLatitudezzz', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('ISOSpeedLatitudezzz')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_012900'
      const key: string = 'ISOSpeedLatitudezzz';
      const value: string = '3';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error ISOSpeedLatitudezzz ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013000
     * @tc.name      : getImageProperty('LensMake', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('LensMake')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013000'
      const key: string = 'LensMake';
      const value: string = 'xxx';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error LensMake ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013100
     * @tc.name      : getImageProperty('LensModel', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('LensModel')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013100'
      const key: string = 'LensModel';
      const value: string = 'xxx';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error LensModel ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013200
     * @tc.name      : getImageProperty('LensSerialNumber', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('LensSerialNumber')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013200'
      const key: string = 'LensSerialNumber';
      const value: string = 'xxx';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error LensSerialNumber ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013300
     * @tc.name      : getImageProperty('LensSpecification', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('LensSpecification')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013300'
      const key: string = 'LensSpecification';
      const value: string = ' 1, 1.5,  1,  2';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error LensSpecification ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013400
     * @tc.name      : getImageProperty('NewSubfileType', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('NewSubfileType')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013400'
      const key: string = 'NewSubfileType';
      const value: string = '1';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error NewSubfileType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013500
     * @tc.name      : getImageProperty('OffsetTime', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('OffsetTime')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013500'
      const key: string = 'OffsetTime';
      const value: string = 'xx';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error OffsetTime ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013600
     * @tc.name      : getImageProperty('OffsetTimeDigitized', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('OffsetTimeDigitized')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013600'
      const key: string = 'OffsetTimeDigitized';
      const value: string = 'xx';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error OffsetTimeDigitized ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013700
     * @tc.name      : getImageProperty('OffsetTimeOriginal', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('OffsetTimeOriginal')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013700'
      const key: string = 'OffsetTimeOriginal';
      const value: string = 'xx';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error OffsetTimeOriginal ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013800
     * @tc.name      : getImageProperty('SourceExposureTimesOfCompositeImage', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SourceExposureTimesOfCompositeImage')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013800'
      const key: string = 'SourceExposureTimesOfCompositeImage';
      const value: string = '.';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SourceExposureTimesOfCompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013900
     * @tc.name      : getImageProperty('SourceImageNumberOfCompositeImage', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SourceImageNumberOfCompositeImage')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_013900'
      const key: string = 'SourceImageNumberOfCompositeImage';
      const value: string = '1234';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SourceImageNumberOfCompositeImage ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014000
     * @tc.name      : getImageProperty('SubfileType', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('SubfileType')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014000'
      const key: string = 'SubfileType';
      const value: string = '1';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error SubfileType ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014100
     * @tc.name      : getImageProperty('GPSHPositioningError', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('GPSHPositioningError')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014100'
      const key: string = 'GPSHPositioningError';
      const value: string = ' 3';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error GPSHPositioningError ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014200
     * @tc.name      : getImageProperty('PhotographicSensitivity', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('PhotographicSensitivity')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014200'
      const key: string = 'PhotographicSensitivity';
      const value: string = '205';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error PhotographicSensitivity ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014300
     * @tc.name      : getImageProperty('HwMnoteCaptureMode', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteCaptureMode')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014300'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014400
     * @tc.name      : getImageProperty('HwMnotePhysicalAperture', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnotePhysicalAperture')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014400'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014500
     * @tc.name      : getImageProperty('HwMnoteRollAngle', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteRollAngle')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014500'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014600
     * @tc.name      : getImageProperty('HwMnotePitchAngle', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnotePitchAngle')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014600'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014700
     * @tc.name      : getImageProperty('HwMnoteSceneFoodConf', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteSceneFoodConf')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014700'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014800
     * @tc.name      : getImageProperty('HwMnoteSceneStageConf', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteSceneStageConf')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014800'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014900
     * @tc.name      : getImageProperty('HwMnoteSceneBlueSkyConf', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteSceneBlueSkyConf')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_014900'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015000
     * @tc.name      : getImageProperty('HwMnoteSceneGreenPlantConf', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteSceneGreenPlantConf')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015000'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015100
     * @tc.name      : getImageProperty('HwMnoteSceneBeachConf', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteSceneBeachConf')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015100'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015200
     * @tc.name      : getImageProperty('HwMnoteSceneSnowConf', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteSceneSnowConf')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015200'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015300
     * @tc.name      : getImageProperty('HwMnoteSceneSunsetConf', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteSceneSunsetConf')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015300'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015400
     * @tc.name      : getImageProperty('HwMnoteSceneFlowersConf', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteSceneFlowersConf')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015400'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015500
     * @tc.name      : getImageProperty('HwMnoteSceneNightConf', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteSceneNightConf')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015500'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015600
     * @tc.name      : getImageProperty('HwMnoteSceneTextConf', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteSceneTextConf')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015600'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015700
     * @tc.name      : getImageProperty('HwMnoteFaceCount', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteFaceCount')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015700'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015800
     * @tc.name      : getImageProperty('HwMnoteFocusMode', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteFocusMode')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015800'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015900
     * @tc.name      : getImageProperty('HwMnoteBurstNumber', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteBurstNumber')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_015900'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016000
     * @tc.name      : getImageProperty('HwMnoteFaceConf', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteFaceConf')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016000'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016100
     * @tc.name      : getImageProperty('HwMnoteFaceLeyeCenter', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteFaceLeyeCenter')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016100', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016100'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016200
     * @tc.name      : getImageProperty('HwMnoteFaceMouthCenter', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteFaceMouthCenter')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016200', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016200'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016300
     * @tc.name      : getImageProperty('HwMnoteFacePointer', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteFacePointer')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016300', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016300'
      const key: string = 'HwMnoteFacePointer';
      const value: string = '166';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteFacePointer ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016400
     * @tc.name      : getImageProperty('HwMnoteFaceRect', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteFaceRect')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016400', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016400'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016500
     * @tc.name      : getImageProperty('HwMnoteFaceReyeCenter', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteFaceReyeCenter')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016500', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016500'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016600
     * @tc.name      : getImageProperty('HwMnoteFaceSmileScore', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteFaceSmileScore')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016600'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016700
     * @tc.name      : getImageProperty('HwMnoteFaceVersion', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteFaceVersion')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016700', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016700'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016800
     * @tc.name      : getImageProperty('HwMnoteFrontCamera', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteFrontCamera')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016800', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016800'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016900
     * @tc.name      : getImageProperty('HwMnoteScenePointer', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteScenePointer')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016900', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_016900'
      const key: string = 'HwMnoteScenePointer';
      const value: string = '300';
      try {
        await getPromiseResult(done, testTag, key, value);
      } catch (e) {
        hilog.info(0x0000, testTag, `getImageProperty error HwMnoteScenePointer ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_017000
     * @tc.name      : getImageProperty('HwMnoteSceneVersion', property)_promise
     * @tc.desc      : 1.create imageSource
     *                 2.getImageProperty('HwMnoteSceneVersion')_promise
     *                 3.the getImageProperty value is the expected value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_017000', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_GETIMAGEPROPERTY_PROMISE_017000'
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
     * @tc.number    : SUB_MULTIMEDIA_DNG_EXIF_MODIFYIMAGEPROPERTY_ERROR_014600
     * @tc.name      : getImageProperty('BitsPerSample')_promise
     * @tc.desc      : 1.create imagesource
     *                 2.getImageProperty('BitsPerSample')_promise
     *                 3.getImageProperty_promise error code is the expected code
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_DNG_EXIF_MODIFYIMAGEPROPERTY_ERROR_014600', 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_DNG_EXIF_MODIFYIMAGEPROPERTY_ERROR_014600';
      const key: string = 'BitsPerSample';
      try {
        await getFd('test_exif_empty2.dng');
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

  })
}
