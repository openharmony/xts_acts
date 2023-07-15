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

import image from "@ohos.multimedia.image";
import fileio from "@ohos.fileio";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import featureAbility from "@ohos.ability.featureAbility";
export default function imageGetImagePropertySecond() {
    describe("imageGetImagePropertySecond", function () {
        const { DATE_TIME, GPS_TIME_STAMP, GPS_DATE_STAMP, IMAGE_DESCRIPTION, MAKE, MODEL, SENSITIVITY_TYPE,
            RECOMMENDED_EXPOSURE_INDEX, ISO_SPEED, APERTURE_VALUE, EXPOSURE_BIAS_VALUE, METERING_MODE, LIGHT_SOURCE,
            FLASH, FOCAL_LENGTH, USER_COMMENT, PIXEL_X_DIMENSION, PIXEL_Y_DIMENSION, WHITE_BALANCE,
            FOCAL_LENGTH_IN_35_MM_FILM, PHOTO_MODE, STANDARD_OUTPUT_SENSITIVITY, CAPTURE_MODE, PHYSICAL_APERTURE } = image.PropertyKey;
        const props = {
            DateTime: "2019:11:15 20:48:30",
            GPSTimeStamp: "13:31:27.00",
            GPSDateStamp: "2023:04:13",
            ImageDescription: "A gray picture",
            Make: "HW",
            Model: "STK-LX1",
            SensitivityType: "Standard output sensitivity (SOS)",
            RecommendedExposureIndex: "200",
            ISOSpeedRatings: "200",
            ApertureValue: "1.69 EV (f/1.8)",
            ExposureBiasValue: "0.00 EV",
            MeteringMode: "Pattern",
            LightSource: "Daylight",
            Flash: "Flash fired, auto mode",
            FocalLength: "4.0 mm",
            UserComment: "gray",
            PixelXDimension: "3456",
            PixelYDimension: "4608",
            WhiteBalance: "Auto white balance",
            FocalLengthIn35mmFilm: "26"
        }
        let filePath;
        let fdNumber;
        async function getFd(fileName) {
            let context = await featureAbility.getContext();
            await context.getFilesDir().then((data) => {
                filePath = data + "/" + fileName;
                console.info("image case filePath is " + filePath);
            });
            await fileio
                .open(filePath)
                .then(
                    (data) => {
                        fdNumber = data;
                        console.info("image case open fd success " + fdNumber);
                    },
                    (err) => {
                        console.info("image cese open fd fail" + err);
                    }
                )
                .catch((err) => {
                    console.info("image case open fd err " + err);
                });
        }
        beforeAll(async function () {
            console.info("beforeAll case");
        });

        beforeEach(function () {
            console.info("beforeEach case");
        });

        afterEach(function () {
            console.info("afterEach case");
        });

        afterAll(function () {
            console.info("afterAll case");
        });

        async function getImagePropertyPromise(done, testNum, key) {
            await getFd("test_hw.jpg");
            let imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi
                    .getImageProperty(key)
                    .then((data) => {
                        console.info(`${testNum} ${key} ` + data);
                        expect(data == props[key]).assertTrue();
                        done();
                    })
                    .catch((error) => {
                        console.log(`${testNum} error: ` + error);
                        expect(false).assertTrue();
                        done();
                    });
            }
        }
        async function getImagePropertyCb(done, testNum, key) {
            await getFd("test_hw.jpg");
            let imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.getImageProperty(key, (err, data) => {
                    if (err) {
                        expect(false).assertTrue();
                        console.info(`${testNum} ${key} err: ` + err);
                        done();
                    } else {
                        console.info(`${testNum} ${key} ` + data);
                        expect(data == props[key]).assertTrue();
                        done();
                    }
                });
            }
        }
        async function getImagePropertyCb2(done, testNum, key) {
            await getFd("test_hw.jpg");
            let imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                let property = { index: 0, defaultValue: "9999" };
                imageSourceApi.getImageProperty(key, property, (err, data) => {
                    if (err) {
                        expect(false).assertTrue();
                        console.info(`${testNum} ${key} err: ` + err);
                        done();
                    } else {
                        console.info(`${testNum} ${key} ` + data);
                        expect(data != "9999" && data == props[key]).assertTrue();
                        done();
                    }
                });
            }
        }

        async function getImagePropertyErr(done, testNum, tag) {
            await getFd("test_hw.jpg");
            let imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(`${testNum} create image source failed`);
                expect(false).assertTrue();
                done();
            } else {
                try {
                    await imageSourceApi.getImageProperty(tag);
                    expect(false).assertTrue();
                    done();
                } catch (error) {
                    expect(error.code != 0).assertTrue();
                    console.log(`${testNum} error msg: ` + error);
                    done();
                }
            }
        }

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0100
         * @tc.name      : getImageProperty(DATE_TIME)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(DATE_TIME)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0100", 0, async function (done) {
            getImagePropertyPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0100", DATE_TIME);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0200
         * @tc.name      : getImageProperty(GPS_TIME_STAMP)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(GPS_TIME_STAMP)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0200", 0, async function (done) {
            getImagePropertyPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0200", GPS_TIME_STAMP);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0300
         * @tc.name      : getImageProperty(GPS_DATE_STAMP)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(GPS_DATE_STAMP)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0300", 0, async function (done) {
            getImagePropertyPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0300", GPS_DATE_STAMP);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0400
         * @tc.name      : getImageProperty(IMAGE_DESCRIPTION)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(IMAGE_DESCRIPTION)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0400", 0, async function (done) {
            getImagePropertyPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0400", IMAGE_DESCRIPTION);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0500
         * @tc.name      : getImageProperty(MAKE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(MAKE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0500", 0, async function (done) {
            getImagePropertyPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0500", MAKE);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0600
         * @tc.name      : getImageProperty(MODEL)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(MODEL)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0600", 0, async function (done) {
            getImagePropertyPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0600", MODEL);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0700
         * @tc.name      : getImageProperty(SENSITIVITY_TYPE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SENSITIVITY_TYPE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0700", 0, async function (done) {
            getImagePropertyPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0700", SENSITIVITY_TYPE);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0800
         * @tc.name      : getImageProperty(RECOMMENDED_EXPOSURE_INDEX)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(RECOMMENDED_EXPOSURE_INDEX)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0800", 0, async function (done) {
            getImagePropertyPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0800",
                RECOMMENDED_EXPOSURE_INDEX);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0900
         * @tc.name      : getImageProperty(ISO_SPEED)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ISO_SPEED)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0900", 0, async function (done) {
            getImagePropertyPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_0900", ISO_SPEED);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1000
         * @tc.name      : getImageProperty(APERTURE_VALUE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(APERTURE_VALUE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1000", 0, async function (done) {
            getImagePropertyPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1000", APERTURE_VALUE);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1100
         * @tc.name      : getImageProperty(EXPOSURE_BIAS_VALUE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(EXPOSURE_BIAS_VALUE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1100", 0, async function (done) {
            getImagePropertyPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1100", EXPOSURE_BIAS_VALUE);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1200
         * @tc.name      : getImageProperty(METERING_MODE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(METERING_MODE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1200", 0, async function (done) {
            getImagePropertyPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1200", METERING_MODE);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1300
         * @tc.name      : getImageProperty(LIGHT_SOURCE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(LIGHT_SOURCE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1300", 0, async function (done) {
            getImagePropertyPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1300", LIGHT_SOURCE);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1400
         * @tc.name      : getImageProperty(FLASH)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(FLASH)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1400", 0, async function (done) {
            getImagePropertyPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1400", FLASH);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1500
         * @tc.name      : getImageProperty(FOCAL_LENGTH)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(FOCAL_LENGTH)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1500", 0, async function (done) {
            getImagePropertyPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1500", FOCAL_LENGTH);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1600
         * @tc.name      : getImageProperty(USER_COMMENT)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(USER_COMMENT)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1600", 0, async function (done) {
            getImagePropertyPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1600", USER_COMMENT);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1700
         * @tc.name      : getImageProperty(PIXEL_X_DIMENSION)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(PIXEL_X_DIMENSION)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1700", 0, async function (done) {
            getImagePropertyPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1700", PIXEL_X_DIMENSION);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1800
         * @tc.name      : getImageProperty(PIXEL_Y_DIMENSION)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(PIXEL_Y_DIMENSION)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1800", 0, async function (done) {
            getImagePropertyPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1800", PIXEL_Y_DIMENSION);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1900
         * @tc.name      : getImageProperty(WHITE_BALANCE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(WHITE_BALANCE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1900", 0, async function (done) {
            getImagePropertyPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_1900", WHITE_BALANCE);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_2000
         * @tc.name      : getImageProperty(FOCAL_LENGTH_IN_35_MM_FILM)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(FOCAL_LENGTH_IN_35_MM_FILM)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_2000", 0, async function (done) {
            getImagePropertyPromise(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_PROMISE_2000",
                FOCAL_LENGTH_IN_35_MM_FILM);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0100
         * @tc.name      : getImageProperty(DATE_TIME)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(DATE_TIME)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0100", 0, async function (done) {
            getImagePropertyCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0100", DATE_TIME);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0200
         * @tc.name      : getImageProperty(GPS_TIME_STAMP)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(GPS_TIME_STAMP)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0200", 0, async function (done) {
            getImagePropertyCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0200", GPS_TIME_STAMP);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0300
         * @tc.name      : getImageProperty(GPS_DATE_STAMP)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(GPS_DATE_STAMP)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0300", 0, async function (done) {
            getImagePropertyCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0300", GPS_DATE_STAMP);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0400
         * @tc.name      : getImageProperty(IMAGE_DESCRIPTION)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(IMAGE_DESCRIPTION)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0400", 0, async function (done) {
            getImagePropertyCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0400", IMAGE_DESCRIPTION);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0500
         * @tc.name      : getImageProperty(MAKE)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(MAKE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0500", 0, async function (done) {
            getImagePropertyCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0500", MAKE);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0600
         * @tc.name      : getImageProperty(SENSITIVITY_TYPE)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(SENSITIVITY_TYPE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0600", 0, async function (done) {
            getImagePropertyCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0600", SENSITIVITY_TYPE);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0700
         * @tc.name      : getImageProperty(RECOMMENDED_EXPOSURE_INDEX)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(RECOMMENDED_EXPOSURE_INDEX)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0700", 0, async function (done) {
            getImagePropertyCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0700", RECOMMENDED_EXPOSURE_INDEX);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0800
         * @tc.name      : getImageProperty(MODEL)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(MODEL)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0800", 0, async function (done) {
            getImagePropertyCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0800", MODEL);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0900
         * @tc.name      : getImageProperty(ISO_SPEED)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(ISO_SPEED)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0900", 0, async function (done) {
            getImagePropertyCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_0900", ISO_SPEED);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1000
         * @tc.name      : getImageProperty(APERTURE_VALUE)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(APERTURE_VALUE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1000", 0, async function (done) {
            getImagePropertyCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1000", APERTURE_VALUE);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1100
         * @tc.name      : getImageProperty(EXPOSURE_BIAS_VALUE)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(EXPOSURE_BIAS_VALUE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1100", 0, async function (done) {
            getImagePropertyCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1100", EXPOSURE_BIAS_VALUE);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1200
         * @tc.name      : getImageProperty(METERING_MODE)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(METERING_MODE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1200", 0, async function (done) {
            getImagePropertyCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1200", METERING_MODE);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1300
         * @tc.name      : getImageProperty(LIGHT_SOURCE)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(LIGHT_SOURCE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1300", 0, async function (done) {
            getImagePropertyCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1300", LIGHT_SOURCE);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1400
         * @tc.name      : getImageProperty(FLASH)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(FLASH)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1400", 0, async function (done) {
            getImagePropertyCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1400", FLASH);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1500
         * @tc.name      : getImageProperty(FOCAL_LENGTH)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(FOCAL_LENGTH)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1500", 0, async function (done) {
            getImagePropertyCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1500", FOCAL_LENGTH);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1600
         * @tc.name      : getImageProperty(USER_COMMENT)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(USER_COMMENT)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1600", 0, async function (done) {
            getImagePropertyCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1600", USER_COMMENT);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1700
         * @tc.name      : getImageProperty(PIXEL_X_DIMENSION)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(PIXEL_X_DIMENSION)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1700", 0, async function (done) {
            getImagePropertyCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1700", PIXEL_X_DIMENSION);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1800
         * @tc.name      : getImageProperty(PIXEL_Y_DIMENSION)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(PIXEL_Y_DIMENSION)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1800", 0, async function (done) {
            getImagePropertyCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1800", PIXEL_Y_DIMENSION);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1900
         * @tc.name      : getImageProperty(WHITE_BALANCE)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(WHITE_BALANCE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1900", 0, async function (done) {
            getImagePropertyCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_1900", WHITE_BALANCE);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_2000
         * @tc.name      : getImageProperty(FOCAL_LENGTH_IN_35_MM_FILM)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.call getImageProperty(FOCAL_LENGTH_IN_35_MM_FILM)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_2000", 0, async function (done) {
            getImagePropertyCb(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK_2000", FOCAL_LENGTH_IN_35_MM_FILM);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0100
         * @tc.name      : getImageProperty(DATE_TIME,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(DATE_TIME,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0100", 0, async function (done) {
            getImagePropertyCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0100", DATE_TIME);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0200
         * @tc.name      : getImageProperty(GPS_TIME_STAMP,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(GPS_TIME_STAMP,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0200", 0, async function (done) {
            getImagePropertyCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0200", GPS_TIME_STAMP);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0300
         * @tc.name      : getImageProperty(GPS_DATE_STAMP,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(GPS_DATE_STAMP,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0300", 0, async function (done) {
            getImagePropertyCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0300", GPS_DATE_STAMP);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0400
         * @tc.name      : getImageProperty(IMAGE_DESCRIPTION,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(IMAGE_DESCRIPTION,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0400", 0, async function (done) {
            getImagePropertyCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0400", IMAGE_DESCRIPTION);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0500
         * @tc.name      : getImageProperty(MAKE,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(MAKE,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0500", 0, async function (done) {
            getImagePropertyCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0500", MAKE);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0600
         * @tc.name      : getImageProperty(MODEL,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(MODEL,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0600", 0, async function (done) {
            getImagePropertyCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0600", MODEL);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0700
         * @tc.name      : getImageProperty(SENSITIVITY_TYPE,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(SENSITIVITY_TYPE,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0700", 0, async function (done) {
            getImagePropertyCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0700", SENSITIVITY_TYPE);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0800
         * @tc.name      : getImageProperty(RECOMMENDED_EXPOSURE_INDEX,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(RECOMMENDED_EXPOSURE_INDEX,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0800", 0, async function (done) {
            getImagePropertyCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0800", RECOMMENDED_EXPOSURE_INDEX);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0900
         * @tc.name      : getImageProperty(ISO_SPEED,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(ISO_SPEED,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0900", 0, async function (done) {
            getImagePropertyCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_0900", ISO_SPEED);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1000
         * @tc.name      : getImageProperty(APERTURE_VALUE,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(APERTURE_VALUE,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1000", 0, async function (done) {
            getImagePropertyCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1000", APERTURE_VALUE);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1100
         * @tc.name      : getImageProperty(EXPOSURE_BIAS_VALUE,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(EXPOSURE_BIAS_VALUE,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1100", 0, async function (done) {
            getImagePropertyCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1100", EXPOSURE_BIAS_VALUE);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1200
         * @tc.name      : getImageProperty(METERING_MODE,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(METERING_MODE,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1200", 0, async function (done) {
            getImagePropertyCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1200", METERING_MODE);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1300
         * @tc.name      : getImageProperty(LIGHT_SOURCE,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(LIGHT_SOURCE,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1300", 0, async function (done) {
            getImagePropertyCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1300", LIGHT_SOURCE);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1400
         * @tc.name      : getImageProperty(FLASH,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(FLASH,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1400", 0, async function (done) {
            getImagePropertyCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1400", FLASH);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1500
         * @tc.name      : getImageProperty(FOCAL_LENGTH,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(FOCAL_LENGTH,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1500", 0, async function (done) {
            getImagePropertyCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1500", FOCAL_LENGTH);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1600
         * @tc.name      : getImageProperty(USER_COMMENT,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(USER_COMMENT,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1600", 0, async function (done) {
            getImagePropertyCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1600", USER_COMMENT);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1700
         * @tc.name      : getImageProperty(PIXEL_X_DIMENSION,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(PIXEL_X_DIMENSION,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1700", 0, async function (done) {
            getImagePropertyCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1700", PIXEL_X_DIMENSION);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1800
         * @tc.name      : getImageProperty(PIXEL_Y_DIMENSION,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(PIXEL_Y_DIMENSION,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1800", 0, async function (done) {
            getImagePropertyCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1800", PIXEL_Y_DIMENSION);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1900
         * @tc.name      : getImageProperty(WHITE_BALANCE,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(WHITE_BALANCE,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1900", 0, async function (done) {
            getImagePropertyCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_1900", WHITE_BALANCE);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2000
         * @tc.name      : getImageProperty(FOCAL_LENGTH_IN_35_MM_FILM,property)-callback
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(FOCAL_LENGTH_IN_35_MM_FILM,property)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2000", 0, async function (done) {
            getImagePropertyCb2(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_CALLBACK2_2000", FOCAL_LENGTH_IN_35_MM_FILM);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_ERR_0100
         * @tc.name      : getImageProperty(PHOTO_MODE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(PHOTO_MODE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_ERR_0100", 0, async function (done) {
            getImagePropertyErr(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_ERR_0100", PHOTO_MODE);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_ERR_0200
         * @tc.name      : getImageProperty(STANDARD_OUTPUT_SENSITIVITY)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(STANDARD_OUTPUT_SENSITIVITY)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_ERR_0200", 0, async function (done) {
            getImagePropertyErr(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_ERR_0200", STANDARD_OUTPUT_SENSITIVITY);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_ERR_0300
         * @tc.name      : getImageProperty(CAPTURE_MODE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(CAPTURE_MODE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_ERR_0300", 0, async function (done) {
            getImagePropertyErr(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_ERR_0300 ", CAPTURE_MODE);
        });

        /**
         * @tc.number    : SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_ERR_0400
         * @tc.name      : getImageProperty(PHYSICAL_APERTURE)
         * @tc.desc      : 1.create imagesource
         *                 2.set property
         *                 3.call getImageProperty(PHYSICAL_APERTURE)
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 0
         */
        it("SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_ERR_0400", 0, async function (done) {
            getImagePropertyErr(done, "SUB_GRAPHIC_IMAGE_GETIMAGEPROPERTY_ERR_0400 ", PHYSICAL_APERTURE);
        });
    });
}
