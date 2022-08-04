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

import image from '@ohos.multimedia.image'
import fileio from '@ohos.fileio'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'
import featureAbility from '@ohos.ability.featureAbility'

describe('imageExif', function () {
    let filePath;
    let fdNumber;
    let globalpixelmap;
    async function getFd(fileName) {
        let context = await featureAbility.getContext();
        await context.getFilesDir().then((data) => {
            filePath = data + '/' + fileName;
            console.info('image case filePath is ' + filePath);
        })
        await fileio.open(filePath).then((data) => {
            fdNumber = data;
            console.info("image case open fd success " + fdNumber);
        }, (err) => {
            console.info("image cese open fd fail" + err)
        }).catch((err) => {
            console.info("image case open fd err " + err);
        })
    }
    beforeAll(async function () {
        console.info('beforeAll case');
    })

    beforeEach(function () {
        console.info('beforeEach case');
    })

    afterEach(async function () {
        if (globalpixelmap != undefined) {
            await globalpixelmap.release();
        }
        await fileio.close(fdNumber).then(function(){
            console.info("close file succeed");
        }).catch(function(err){
            console.info("close file failed with error:"+ err);
        });
        console.info('afterEach case');
    })

    afterAll(async function () {
        console.info('afterAll case');
    })
 
    /**
     * @tc.number    : TC_171
     * @tc.name      : getImageProperty(BitsPerSample)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(BitsPerSample)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171', 0, async function (done) {
        await getFd('test_exif1.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_171 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("BitsPerSample")
                .then(data => {
                    console.info('TC_171 BitsPerSample ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                })
                .catch(error => {
                    console.log('TC_171 error: ' + error);
                    expect(false).assertFail();
                    done();
                })
        }
    })

    /**
     * @tc.number    : TC_171-1
     * @tc.name      : getImageProperty(Orientation)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(Orientation)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171-1', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_171-1 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("Orientation")
                .then(data => {
                    console.info('TC_171-1 Orientation ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                })
                .catch(error => {
                    console.log('TC_171-1 error: ' + error);
                    expect(false).assertFail();
                    done();
                })
        }
    })

    /**
     * @tc.number    : TC_171-2
     * @tc.name      : getImageProperty(ImageLength)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ImageLength)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171-2', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_171-2 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("ImageLength")
                .then(data => {
                    console.info('TC_171-2 ImageLength ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                })
                .catch(error => {
                    console.log('TC_171-2 error: ' + error);
                    expect(false).assertFail();
                    done();
                })
        }
    })

    /**
     * @tc.number    : TC_171-3
     * @tc.name      : getImageProperty(ImageWidth)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ImageWidth)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171-3', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_171-3 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("ImageWidth")
                .then(data => {
                    console.info('TC_171-3 ImageWidth ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                })
                .catch(error => {
                    console.log('TC_171-3 error: ' + error);
                    expect(false).assertFail();
                    done();
                })
        }
    })

    /**
     * @tc.number    : TC_171-4
     * @tc.name      : getImageProperty(GPSLatitude)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLatitude)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171-4', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_171-4 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLatitude")
                .then(data => {
                    console.info('TC_171-4 GPSLatitude ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                })
                .catch(error => {
                    console.log('TC_171-4 error: ' + error);
                    expect(false).assertFail();
                    done();
                })
        }
    })

    /**
     * @tc.number    : TC_171-5
     * @tc.name      : getImageProperty(GPSLongitude)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLongitude)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171-5', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_171-5 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLongitude")
                .then(data => {
                    console.info('TC_171-5 GPSLongitude ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                })
                .catch(error => {
                    console.log('TC_171-5 error: ' + error);
                    expect(false).assertFail();
                    done();
                })
        }
    })

    /**
     * @tc.number    : TC_171-6
     * @tc.name      : getImageProperty(GPSLatitudeRef)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLatitudeRef)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171-6', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_171-6 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLatitudeRef")
                .then(data => {
                    console.info('TC_171-6 GPSLatitudeRef ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                })
                .catch(error => {
                    console.log('TC_171-6 error: ' + error);
                    expect(false).assertFail();
                    done();
                })
        }
    })

    /**
     * @tc.number    : TC_171-7
     * @tc.name      : getImageProperty(GPSLongitudeRef)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLongitudeRef)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171-7', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_171-7 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLongitudeRef")
                .then(data => {
                    console.info('TC_171-7 GPSLongitudeRef ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                })
                .catch(error => {
                    console.log('TC_171-7 error: ' + error);
                    expect(false).assertFail();
                    done();
                })
        }
    })

    /**
     * @tc.number    : TC_171-8
     * @tc.name      : getImageProperty(DateTimeOriginal)
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ImageLength)
     *                 4.The return value is not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_171-8', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_171-8 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("DateTimeOriginal")
                .then(data => {
                    console.info('TC_171-8 DateTimeOriginal ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                })
                .catch(error => {
                    console.log('TC_171-8 error: ' + error);
                    expect(false).assertFail();
                    done();
                })
        }
    })

    /**
     * @tc.number    : TC_172
     * @tc.name      : getImageProperty(BitsPerSample)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(BitsPerSample)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172', 0, async function (done) {
        await getFd('test_exif1.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_172 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("BitsPerSample", (error, data) => {
                if (error) {
                    console.info('TC_172 getImageProperty BitsPerSample error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('TC_172 BitsPerSample ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_172-1
     * @tc.name      : getImageProperty(Orientation)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(Orientation)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172-1', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_172-1 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("Orientation", (error, data) => {
                if (error) {
                    console.info('TC_172-1 getImageProperty Orientation error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('TC_172-1 Orientation ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_172-2
     * @tc.name      : getImageProperty(ImageLength)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(ImageLength)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172-2', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_172-2 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("ImageLength", (error, data) => {
                if (error) {
                    console.info('TC_172-2 getImageProperty ImageLength error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('TC_172-2 ImageLength ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_172-3
     * @tc.name      : getImageProperty(ImageWidth)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(ImageWidth)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172-3', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_172-3 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("ImageWidth", (error, data) => {
                if (error) {
                    console.info('TC_172-3 getImageProperty ImageWidth error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('TC_172-3 ImageWidth ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_172-4
     * @tc.name      : getImageProperty(GPSLatitude)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(GPSLatitude)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172-4', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_172-4 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLatitude", (error, data) => {
                if (error) {
                    console.info('TC_172-4 getImageProperty GPSLatitude error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('TC_172-4 GPSLatitude ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_172-5
     * @tc.name      : getImageProperty(GPSLongitude)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(GPSLongitude)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172-5', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_172-5 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLongitude", (error, data) => {
                if (error) {
                    console.info('TC_172-5 getImageProperty GPSLongitude error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('TC_172-5 GPSLongitude ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_172-6
     * @tc.name      : getImageProperty(GPSLatitudeRef)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(GPSLatitudeRef)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172-6', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_172-6 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLatitudeRef", (error, data) => {
                if (error) {
                    console.info('TC_172-6 getImageProperty GPSLatitudeRef error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('TC_172-6 GPSLatitudeRef ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_172-7
     * @tc.name      : getImageProperty(GPSLongitudeRef)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(GPSLongitudeRef)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172-7', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_172-7 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("GPSLongitudeRef", (error, data) => {
                if (error) {
                    console.info('TC_172-7 getImageProperty GPSLongitudeRef error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('TC_172-7 GPSLongitudeRef ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_172-8
     * @tc.name      : getImageProperty(DateTimeOriginal)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(DateTimeOriginal)
     *                 3.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_172-8', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_172-8 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            imageSourceApi.getImageProperty("DateTimeOriginal", (error, data) => {
                if (error) {
                    console.info('TC_172-8 getImageProperty DateTimeOriginal error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('TC_172-8 DateTimeOriginal ' + data);
                    expect(data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_173
     * @tc.name      : getImageProperty(BitsPerSample,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(BitsPerSample,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173', 0, async function (done) {
        await getFd('test_exif1.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_173 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = { index: 0, defaultValue: '9999' }
            imageSourceApi.getImageProperty("BitsPerSample", property, (error, data) => {
                if (error) {
                    console.info('TC_173 getImageProperty BitsPerSample error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('TC_173 BitsPerSample ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_173-1
     * @tc.name      : getImageProperty(Orientation,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(Orientation,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173-1', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_173-1 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = { index: 0, defaultValue: '9999' }
            imageSourceApi.getImageProperty("Orientation", property, (error, data) => {
                if (error) {
                    console.info('TC_173-1 getImageProperty Orientation error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('TC_173-1 Orientation ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_173-2
     * @tc.name      : getImageProperty(ImageLength,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ImageLength,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173-2', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_173-2 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = { index: 0, defaultValue: '9999' }
            imageSourceApi.getImageProperty("ImageLength", property, (error, data) => {
                if (error) {
                    console.info('TC_173-2 getImageProperty ImageLength error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('TC_173-2 ImageLength ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_173-3
     * @tc.name      : getImageProperty(ImageWidth,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ImageWidth,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173-3', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_173-3 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = { index: 0, defaultValue: '9999' }
            imageSourceApi.getImageProperty("ImageWidth", property, (error, data) => {
                if (error) {
                    console.info('TC_173-3 getImageProperty ImageWidth error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('TC_173-3 ImageWidth ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_173-4
     * @tc.name      : getImageProperty(GPSLatitude,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLatitude,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173-4', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_173-4 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = { index: 0, defaultValue: '9999' }
            imageSourceApi.getImageProperty("GPSLatitude", property, (error, data) => {
                if (error) {
                    console.info('TC_173-4 getImageProperty GPSLatitude error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('TC_173-4 GPSLatitude ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_173-5
     * @tc.name      : getImageProperty(GPSLongitude,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLongitude,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173-5', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_173-5 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = { index: 0, defaultValue: '9999' }
            imageSourceApi.getImageProperty("GPSLongitude", property, (error, data) => {
                if (error) {
                    console.info('TC_173-5 getImageProperty GPSLongitude error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('TC_173-5 GPSLongitude ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_173-6
     * @tc.name      : getImageProperty(GPSLatitudeRef,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLatitudeRef,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173-6', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_173-6 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = { index: 0, defaultValue: '9999' }
            imageSourceApi.getImageProperty("GPSLatitudeRef", property, (error, data) => {
                if (error) {
                    console.info('TC_173-6 getImageProperty GPSLatitudeRef error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('TC_173-6 GPSLatitudeRef ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_173-7
     * @tc.name      : getImageProperty(GPSLongitudeRef,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(GPSLongitudeRef,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173-7', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_173-7 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = { index: 0, defaultValue: '9999' }
            imageSourceApi.getImageProperty("GPSLongitudeRef", property, (error, data) => {
                if (error) {
                    console.info('TC_173-7 getImageProperty GPSLongitudeRef error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('TC_173-7 GPSLongitudeRef ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })

    /**
     * @tc.number    : TC_173-8
     * @tc.name      : getImageProperty(DateTimeOriginal,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(DateTimeOriginal,property)
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('TC_173-8', 0, async function (done) {
        await getFd('test_exif.jpg');
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
            console.info('TC_173-8 create image source failed');
            expect(false).assertTrue();
            done();
        } else {
            let property = { index: 0, defaultValue: '9999' }
            imageSourceApi.getImageProperty("DateTimeOriginal", property, (error, data) => {
                if (error) {
                    console.info('TC_173-8 getImageProperty DateTimeOriginal error');
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('TC_173-8 DateTimeOriginal ' + data);
                    expect(data != '9999' && data != undefined && data != '').assertTrue();
                    done();
                }
            })
        }
    })
})
