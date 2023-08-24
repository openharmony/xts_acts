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

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { describe, beforeAll, it, expect } from 'deccjsunit/index'
import {
  photoKeys,
  photoFetchOption,
  getFileAsset,
  getPermission,
  fetchOption,
} from '../../../../../../common'

export default function getExifTest () {
  describe('getExifTest', function () {
    beforeAll(async function () {
      console.info('beforeAll case')
      await getPermission()
    })

    const exifInfo = new Map([
      ['ApertureValue', '1.69 EV (f/1.8)'],
      ['BitsPerSample', '8, 8, 8'],
      ['DateTimeOriginal', '2019:11:15 20:48:30'],
      ['DateTime', '2019:11:15 20:48:30'],
      ['ExposureBiasValue', '0.00 EV'],
      ['ExposureTime', '1/33 sec.'],
      ['Flash', 'Flash fired, auto mode'],
      ['FNumber', 'f/1.8'],
      ['FocalLength', '4.0 mm'],
      ['FocalLengthIn35mmFilm', '26'],
      ['GPSLongitude', '0'],
      ['GPSLatitudeRef', ''],
      ['GPSLongitudeRef', ''],
      ['GPSTimeStamp', '13:31:27.00'],
      ['GPSDateStamp', '2023:04:13'],
      ['ImageDescription', 'A gray picture'],
      ['ImageLength', '4608'],
      ['ImageWidth', '3456'],
      ['ISOSpeedRatings', '200'],
      ['LightSource', 'Daylight'],
      ['Make', 'HW'],
      ['MakerNote', ''],
      ['MeteringMode', 'Pattern'],
      ['Model', 'STK-LX1'],
      ['Orientation', '0'],
      ['PhotoMode', ''],
      ['PixelXDimension', '3456'],
      ['PixelYDimension', '4608'],
      ['RecommendedExposureIndex', '200'],
      ['SceneType', 'Directly photographed'],
      ['SensitivityType', 'Standard output sensitivity (SOS)'],
      ['StandardOutputSensitivity', ''],
      ['WhiteBalance', 'Auto white balance'],
    ])

    async function getExifCallback (done, testNum, fetchOps) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        asset.getExif(async (err, result) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} result: ${result}`)
              expect(result.length > 0).assertTrue();
              const msg = JSON.parse(result);
              exifInfo.forEach((value, key, map) => {
                console.info(`${testNum} key: ${key}, value: ${value}, msg[key]: ${msg[key]}`)
                expect(value).assertEqual(msg[key].toString())
              });
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function getExifAbnormalCallback (done, testNum, fetchOps) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        asset.getExif(async (err, result) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} err: ${err}`);
            } else {
              console.info(`${testNum} result: ${result}`);
              expect(false).assertTrue();
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function getExifPromise (done, testNum, fetchOps) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        const result = await asset.getExif();
        console.info(`${testNum} result: ${result}`)
        expect(result.length > 0).assertTrue();
        const msg = JSON.parse(result);
        exifInfo.forEach((value, key, map) => {
          console.info(`${testNum} key: ${key}, value: ${value}, msg[key]: ${msg[key]}`)
          expect(value).assertEqual(msg[key].toString())
        });
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function getExifAbnormalPromise (done, testNum, fetchOps) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        await asset.getExif();
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        done();
      }
    }
    
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_EXIF_0000
     * @tc.name      : getExif_callback_000
     * @tc.desc      : getExif.jpg, fetchColumn with all_exif, check exif
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getExif_callback_000', 0, async function (done) {
      const testNum = 'getExif_callback_000';
      const predicates = new dataSharePredicates.DataSharePredicates();
      const fetchOps : photoAccessHelper.FetchOptions = {
        fetchColumns: ['all_exif'],
        predicates: predicates.equalTo(photoKeys.DISPLAY_NAME, 'getExif.jpg'),
      };
      await getExifCallback(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_EXIF_0100
     * @tc.name      : getExif_callback_001
     * @tc.desc      : getExif.jpg, fetchColumn without all_exif, check exif
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getExif_callback_001', 2, async function (done) {
      const testNum = 'getExif_callback_001';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getExif.jpg');
      await getExifAbnormalCallback(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_EXIF_0300
     * @tc.name      : getExif_callback_003
     * @tc.desc      : noExif.jpg, fetchColumn with all_exif and user_comment, check UserComment
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getExif_callback_003', 2, async function (done) {
      const testNum = 'getExif_callback_003';
      const predicates = new dataSharePredicates.DataSharePredicates();
      const fetchOps : photoAccessHelper.FetchOptions = {
        fetchColumns: ['all_exif', photoKeys.USER_COMMENT],
        predicates: predicates.equalTo(photoKeys.DISPLAY_NAME, 'getExif.jpg'),
      };
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        asset.getExif(async (err, result) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} result: ${result}`)
              expect(result.includes('UserComment')).assertTrue();
              const msg = JSON.parse(result);
              expect(msg.UserComment).assertEqual('gray');
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_EXIF_0500
     * @tc.name      : getExif_callback_005
     * @tc.desc      : getExif.jpg, fetchColumn with all_exif, has MEDIA_LOCATION permission, check GPSLongitude
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getExif_callback_005', 2, async function (done) {
      const testNum = 'getExif_callback_005';
      const predicates = new dataSharePredicates.DataSharePredicates();
      const fetchOps : photoAccessHelper.FetchOptions = {
        fetchColumns: ['all_exif'],
        predicates: predicates.equalTo(photoKeys.DISPLAY_NAME, 'getExif.jpg'),
      };
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        asset.getExif(async (err, result) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} result: ${result}`)
              expect(result.includes('GPSLongitude')).assertTrue();
              expect(result.includes('GPSLatitudeRef')).assertTrue();
              expect(result.includes('GPSLongitudeRef')).assertTrue();
              const msg = JSON.parse(result);
              expect(msg.GPSLongitude).assertEqual(0);
              expect(msg.GPSLatitudeRef).assertEqual('');
              expect(msg.GPSLongitudeRef).assertEqual('');
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_EXIF_0600
     * @tc.name      : getExif_callback_006
     * @tc.desc      : noExif.jpg, fetchColumn with all_exif, check ImageWidth
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getExif_callback_006', 2, async function (done) {
      const testNum = 'getExif_callback_006';
      const predicates = new dataSharePredicates.DataSharePredicates();
      const fetchOps : photoAccessHelper.FetchOptions = {
        fetchColumns: ['all_exif'],
        predicates: predicates.equalTo(photoKeys.DISPLAY_NAME, 'noExif.jpg'),
      };
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        asset.getExif(async (err, result) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} result: ${result}`);
              expect(result.includes('ImageWidth')).assertTrue();
              const msg = JSON.parse(result);
              expect(msg.ImageWidth).assertEqual('');
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_EXIF_0700
     * @tc.name      : getExif_callback_007
     * @tc.desc      : noExif.jpg, fetchColumn withoutout all_exif, check ImageWidth
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getExif_callback_007', 2, async function (done) {
      const testNum = 'getExif_callback_007';
      const predicates = new dataSharePredicates.DataSharePredicates();
      const fetchOps : photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates.equalTo(photoKeys.DISPLAY_NAME, 'noExif.jpg'),
      };
      await getExifAbnormalCallback(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_EXIF_0900
     * @tc.name      : getExif_callback_009
     * @tc.desc      : noExif.jpg, fetchColumn with all_exif and USER_COMMENT, check UserComment
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getExif_callback_009', 2, async function (done) {
      const testNum = 'getExif_callback_009';
      const predicates = new dataSharePredicates.DataSharePredicates();
      const fetchOps : photoAccessHelper.FetchOptions = {
        fetchColumns: ['all_exif', photoKeys.USER_COMMENT],
        predicates: predicates.equalTo(photoKeys.DISPLAY_NAME, 'noExif.jpg'),
      };
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        asset.getExif(async (err, result) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} result: ${result}`)
              expect(result.includes('UserComment')).assertTrue();
              const msg = JSON.parse(result);
              expect(msg.UserComment).assertEqual('');
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_EXIF_0000
     * @tc.name      : getExif_promise_000
     * @tc.desc      : getExif.jpg, fetchColumn with all_exif, check ImageWidth、UserComment
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getExif_promise_000', 0, async function (done) {
      const testNum = 'getExif_promise_000';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'getExif.jpg');
      await getExifPromise(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_EXIF_0100
     * @tc.name      : getExif_promise_001
     * @tc.desc      : getExif.jpg, fetchColumn without all_exif, check ImageWidth、UserComment
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getExif_promise_001', 2, async function (done) {
      const testNum = 'getExif_promise_001';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getExif.jpg');
      await getExifAbnormalPromise(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_EXIF_0300
     * @tc.name      : getExif_promise_003
     * @tc.desc      : noExif.jpg, fetchColumn with all_exif and user_comment, check UserComment
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getExif_promise_003', 2, async function (done) {
      const testNum = 'getExif_promise_003';
      const predicates = new dataSharePredicates.DataSharePredicates();
      const fetchOps : photoAccessHelper.FetchOptions = {
        fetchColumns: ['all_exif', photoKeys.USER_COMMENT],
        predicates: predicates.equalTo(photoKeys.DISPLAY_NAME, 'getExif.jpg'),
      };
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        const result = await asset.getExif();
        console.info(`${testNum} result: ${result}`);
        expect(result.includes('UserComment')).assertTrue();
        const msg = JSON.parse(result);
        expect(msg.UserComment).assertEqual('gray');
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_EXIF_0500
     * @tc.name      : getExif_promise_005
     * @tc.desc      : getExif.jpg, fetchColumn with all_exif, has MEDIA_LOCATION permission, check GPSLongitude
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getExif_promise_005', 2, async function (done) {
      const testNum = 'getExif_promise_005';
      const predicates = new dataSharePredicates.DataSharePredicates();
      const fetchOps : photoAccessHelper.FetchOptions = {
        fetchColumns: ['all_exif'],
        predicates: predicates.equalTo(photoKeys.DISPLAY_NAME, 'getExif.jpg'),
      };
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        const result = await asset.getExif();
        console.info(`${testNum} result: ${result}`);
        expect(result.includes('GPSLongitude')).assertTrue();
        expect(result.includes('GPSLatitudeRef')).assertTrue();
        expect(result.includes('GPSLongitudeRef')).assertTrue();
        const msg = JSON.parse(result);
        expect(msg.GPSLongitude).assertEqual(0);
        expect(msg.GPSLatitudeRef).assertEqual('');
        expect(msg.GPSLongitudeRef).assertEqual('');
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_EXIF_0600
     * @tc.name      : getExif_promise_006
     * @tc.desc      : noExif.jpg, fetchColumn with all_exif, check ImageWidth
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getExif_promise_006', 2, async function (done) {
      const testNum = 'getExif_promise_006';
      const predicates = new dataSharePredicates.DataSharePredicates();
      const fetchOps : photoAccessHelper.FetchOptions = {
        fetchColumns: ['all_exif'],
        predicates: predicates.equalTo(photoKeys.DISPLAY_NAME, 'noExif.jpg'),
      };
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        const result = await asset.getExif();
        console.info(`${testNum} result: ${result}`);
        expect(result.includes('ImageWidth')).assertTrue();
        const msg = JSON.parse(result);
        expect(msg.ImageWidth).assertEqual('');
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_EXIF_0700
     * @tc.name      : getExif_promise_007
     * @tc.desc      : noExif.jpg, fetchColumn withoutout all_exif, check ImageWidth
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getExif_promise_007', 2, async function (done) {
      const testNum = 'getExif_promise_007';
      const predicates = new dataSharePredicates.DataSharePredicates();
      const fetchOps : photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates.equalTo(photoKeys.DISPLAY_NAME, 'noExif.jpg'),
      };
      await getExifAbnormalPromise(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_EXIF_0900
     * @tc.name      : getExif_promise_009
     * @tc.desc      : noExif.jpg, fetchColumn with all_exif and USER_COMMENT, check UserComment
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getExif_promise_009', 2, async function (done) {
      const testNum = 'getExif_promise_009';
      const predicates = new dataSharePredicates.DataSharePredicates();
      const fetchOps : photoAccessHelper.FetchOptions = {
        fetchColumns: ['all_exif', photoKeys.USER_COMMENT],
        predicates: predicates.equalTo(photoKeys.DISPLAY_NAME, 'noExif.jpg'),
      };
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        const result = await asset.getExif();
        console.info(`${testNum} result: ${result}`)
        expect(result.includes('UserComment')).assertTrue();
        const msg = JSON.parse(result);
        expect(msg.UserComment).assertEqual('');
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}
