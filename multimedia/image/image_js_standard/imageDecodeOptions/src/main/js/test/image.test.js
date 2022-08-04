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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import featureAbility from '@ohos.ability.featureAbility'

export default function imageDecodeOptions() {
    describe('imageDecodeOptions', function () {
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
                console.info('globalpixelmap release start');
                try {
                    await globalpixelmap.release();
                } catch (error) {
                    console.info('globalpixelmap release fail');
                }
            }
            console.info('afterEach case');
        })

        afterAll(async function () {
            console.info('afterAll case');
        })
        
        /**
         * @tc.number    : TC_063
         * @tc.name      : release ImagePacker - promise
         * @tc.desc      : 1.create ImagePacker
         *                 2.call release
         *                 3.return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_063', 0, async function (done) {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
                console.info('TC_063 create image packer failed');
                expect(false).assertTrue();
                done();
            } else {
                imagePackerApi.release().then(() => {
                    console.info('TC_063 success');
                    expect(true).assertTrue();
                    done();
                }).catch(() => {
                    console.log('TC_063 error: ' + error);
                    expect(false).assertTrue();
                    done();
                })
            }
        })

        /**
         * @tc.number    : TC_063-1 
         * @tc.name      : release ImagePacker - callback
         * @tc.desc      : 1.create ImagePacker
         *                 2.call release
         *                 3.return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_063-1', 0, async function (done) {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
                console.info('TC_063-1 create image packer failed');
                expect(false).assertTrue();
                done();
            } else {
                imagePackerApi.release(() => {
                    console.info('TC_063-1 success');
                    expect(true).assertTrue();
                    done();
                })
            }
        })

        /**
         * @tc.number    : TC_050
         * @tc.name      : createPixelMap(decodingOptions)-pixelformat:RGBA_8888-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_050', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_050 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: 3,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info('TC_050 createPixelMap error  ' + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            console.info('TC_050 success ');
                            expect(pixelmap != undefined).assertTrue();
                            done();
                        }
                    })
                }
            } catch (error) {
                console.info('TC_050 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_050-1
         * @tc.name      : createPixelMap(decodingOptions)-pixelformat:RGB_565-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_050-1', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_050-1 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: 2,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info('TC_050-1 createPixelMap error  ' + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            console.info('TC_050-1 success ');
                            expect(pixelmap != undefined).assertTrue();
                            done();
                        }
                    })
                }
            } catch (error) {
                console.info('TC_050-1 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_050-2
         * @tc.name      : createPixelMap(decodingOptions)-pixelformat:unknown-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return null
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_050-2', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_050-2 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: 0,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info('TC_050-2 createPixelMap error  ' + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            console.info('TC_050-2 success ');
                            expect(pixelmap != undefined).assertTrue();
                            done();
                        }
                    })
                }
            } catch (error) {
                console.info('TC_050-2 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_050-3
         * @tc.name      : createPixelMap(decodingOptions: index 1})-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_050-3', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_050-3 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: 0,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 1
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info('TC_050-3 success ');
                            console.info('TC_050-3 createPixelMap error ' + JSON.stringify(err));
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info('TC_050-3 fail  ' + pixelmap);
                            expect(false).assertTrue();
                            done();
                        }
                    })
                }
            } catch (error) {
                console.info('TC_050-3 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_050-4
         * @tc.name      : createPixelMap(decodingOptions:index -1})-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_050-4', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_050-4 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: 0,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: -1
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info('TC_050-4 success ');
                            console.info('TC_050-4 createPixelMap error ' + JSON.stringify(err));
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info('TC_050-4 fail  ' + pixelmap);
                            expect(false).assertTrue();
                            done();
                        }
                    })
                }
            } catch (error) {
                console.info('TC_050-4 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_050-5
         * @tc.name      : createPixelMap(decodingOptions:sampleSize -1})-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_050-5', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_050-5 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: -1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: 0,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info('TC_050-5 success ');
                            console.info('TC_050-5 createPixelMap error ' + JSON.stringify(err));
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info('TC_050-5 fail  ' + pixelmap);
                            expect(false).assertTrue();
                            done();
                        }
                    })
                }
            } catch (error) {
                console.info('TC_050-5 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_050-6
         * @tc.name      : createPixelMap(decodingOptions:rotate -10})-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_050-6', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_050-6 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: -10,
                        desiredPixelFormat: 2,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info('TC_050-6 success ');
                            console.info('TC_050-6 createPixelMap error ' + JSON.stringify(err));
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info('TC_050-6 fail  ' + pixelmap);
                            expect(false).assertTrue();
                            done();
                        }
                    })
                }
            } catch (error) {
                console.info('TC_050-6 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_050-7
         * @tc.name      : createPixelMap(decodingOptions:unsupported pixelformat)-jpg 
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_050-7', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_050-7 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: 60,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info('TC_050-7 success ');
                            console.info('TC_050-7 createPixelMap error ' + JSON.stringify(err));
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info('TC_050-7 fail  ' + pixelmap);
                            expect(false).assertTrue();
                            done();
                        }
                    })
                }
            } catch (error) {
                console.info('TC_050-7 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_050-8
         * @tc.name      : createPixelMap(decodingOptions:editable false})-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1             
         */
        it('TC_050-8', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_050-8 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: false,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: 2,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info('TC_050-8 createPixelMap error ' + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            console.info('TC_050-8 success ');
                            expect(pixelmap != undefined).assertTrue();
                            done();
                        }
                    })
                }
            } catch (error) {
                console.info('TC_050-8 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_050-9
         * @tc.name      : createPixelMap(decodingOptions:desiredSize>imagesize)-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_050-9', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_050-9 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 10000, height: 10000 },
                        rotate: 10,
                        desiredPixelFormat: 2,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                        index: 0
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info('TC_050-9 createPixelMap error ' + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            console.info('TC_050-9 success ');
                            expect(pixelmap != undefined).assertTrue();
                            done();
                        }
                    })
                }
            } catch (error) {
                console.info('TC_050-9 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_050-10
         * @tc.name      : createPixelMap(decodingOptions:desiredRegion>imagesize)-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_050-10', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_050-10 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: 2,
                        desiredRegion: { size: { height: 10000, width: 10000 }, x: 0, y: 0 },
                        index: 0
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info('TC_050-10 createPixelMap err ' + JSON.stringify(err));
                            expect(false).assertTrue();
                            done();
                        } else {
                            globalpixelmap = pixelmap;
                            pixelmap.getImageInfo().then((imageInfo) => {
                                expect(imageInfo.size.height == 2).assertTrue();
                                expect(imageInfo.size.width == 1).assertTrue();
                                console.info('TC_050-10 success ');
                                console.info("imageInfo height :" + imageInfo.size.height );
                                console.info("imageInfo width : " + imageInfo.size.width);
                                done();
                            }).catch((err) => {
                                console.info('TC_050-10 getimageInfo err ' + JSON.stringify(err));
                            })
                        }
                    })
                }
            } catch (error) {
                console.info('TC_050-10 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_050-11
         * @tc.name      : createPixelMapdecodingOptions:x -1 y -1)-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_050-11', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_050-11 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: 2,
                        desiredRegion: { size: { height: 1, width: 2 }, x: -1, y: -1 },
                        index: 0
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info('TC_050-11 success ');
                            console.info('TC_050-11 createPixelMap error ' + JSON.stringify(err));
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info('TC_050-11 fail  ' + pixelmap);
                            expect(false).assertTrue();
                            done();
                        }
                    })
                }
            } catch (error) {
                console.info('TC_050-11 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_050-12
         * @tc.name      : createPixelMap(decodingOptions:x > image.height y > image.width)-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_050-12', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_050-12 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 10,
                        desiredPixelFormat: 2,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 10000, y: 10000 },
                        index: 0
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info('TC_050-12 success ');
                            console.info('TC_050-12 createPixelMap error ' + JSON.stringify(err));
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info('TC_050-12 fail  ' + pixelmap);
                            expect(false).assertTrue();
                            done();
                        }
                    })
                }
            } catch (error) {
                console.info('TC_050-12 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_050-13
         * @tc.name      : createPixelMap(decodingOptions:rotate>360)-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_050-13', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_050-13 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    let decodingOptions = {
                        sampleSize: 1,
                        editable: true,
                        desiredSize: { width: 1, height: 2 },
                        rotate: 500,
                        desiredPixelFormat: 2,
                        desiredRegion: { size: { height: 1, width: 2 }, x: 1, y: 2 },
                        index: 0
                    };
                    imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                        if (err) {
                            console.info('TC_050-13 success ');
                            console.info('TC_050-13 createPixelMap error ' + JSON.stringify(err));
                            expect(true).assertTrue();
                            done();
                        } else {
                            console.info('TC_050-13 fail  ' + pixelmap);
                            expect(false).assertTrue();
                            done();
                        }
                    })
                }
            } catch (error) {
                console.info('TC_050-13 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_050-14
         * @tc.name      : createPixelMap-promise-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_050-14', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_050-14 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.createPixelMap().then(pixelmap => {
                        globalpixelmap = pixelmap;
                        console.info('TC_050-14 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }).catch(error => {
                        console.log('TC_050-14 error: ' + error);
                        expect().assertFail();
                        done();
                    })
                }
            } catch (error) {
                console.info('TC_050-14 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_050-15
         * @tc.name      : createPixelMap-callback-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return null
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_050-15', 0, async function (done) {
            try {
                await getFd('test.jpg');
                const imageSourceApi = image.createImageSource(fdNumber);
                if (imageSourceApi == undefined) {
                    console.info('TC_050-15 create image source failed');
                    expect(false).assertTrue();
                    done();
                } else {
                    imageSourceApi.createPixelMap((err, pixelmap) => {
                        globalpixelmap = pixelmap;
                        console.info('TC_050-15 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    })
                }
            } catch (error) {
                console.info('TC_050-15 error: ' + error);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number    : TC_067
         * @tc.name      : createPixelMap(decodingOptions)-pixelformat:RGBA_8888-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_067', 0, async function (done) {
            await getFd('moving_test.gif');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_067 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 3,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_067 createPixelMap error ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info('TC_067 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_067-1
         * @tc.name      : createPixelMap(decodingOptions)-pixelformat:RGBA_565-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return null
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_067-1', 0, async function (done) {
            await getFd('moving_test.gif');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_067-1 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_067-1 createPixelMap error ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info('TC_067-1 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_067-2
         * @tc.name      : createPixelMap(decodingOptions)-pixelformat:unkonwn-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_067-2', 0, async function (done) {
            await getFd('moving_test.gif');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_067-2 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_067-2 createPixelMap error ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info('TC_067-2 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_067-3
         * @tc.name      : createPixelMap(decodingOptions:index 1})-gif 
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return null
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_067-3', 0, async function (done) {
            await getFd('moving_test.gif');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_067-3 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 1
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_067-3 createPixelMap error ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info('TC_067-3 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_067-4
         * @tc.name      : createPixelMap(decodingOptions:index -1})-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return null
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_067-4', 0, async function (done) {
            await getFd('moving_test.gif');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_067-4 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: -1
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_067-4 success ');
                        console.info('TC_067-4 createPixelMap error ' + JSON.stringify(err));
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('TC_067-4 fail  ' + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_067-5
         * @tc.name      : createPixelMap(decodingOptions:sampleSize -1})-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_067-5', 0, async function (done) {
            await getFd('moving_test.gif');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_067-5 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: -1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_067-5 success ');
                        console.info('TC_067-5 createPixelMap error ' + JSON.stringify(err));
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('TC_067-5 fail  ' + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_067-6
         * @tc.name      : createPixelMap(decodingOptions:rotate -10})-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_067-6', 0, async function (done) {
            await getFd('moving_test.gif');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_067-6 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: -10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_067-6 success ');
                        console.info('TC_067-6 createPixelMap error ' + JSON.stringify(err));
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('TC_067-6 fail  ' + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_067-7
         * @tc.name      : createPixelMap(decodingOptions:unsupported pixelformat)-gif 
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_067-7', 0, async function (done) {
            await getFd('moving_test.gif');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_067-7 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 60,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_067-7 success ');
                        console.info('TC_067-7 createPixelMap error ' + JSON.stringify(err));
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('TC_067-7 fail  ' + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_067-8
         * @tc.name      : createPixelMap(decodingOptions:editable false})-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_067-8', 0, async function (done) {
            await getFd('moving_test.gif');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_067-8 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: false,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_067-8 createPixelMap error  ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info('TC_067-8 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_067-9
         * @tc.name      : createPixelMap(decodingOptions:desiredSize>imagesize)-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_067-9', 0, async function (done) {
            await getFd('moving_test.gif');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_067-9 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 10000, height: 10000 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_067-9 createPixelMap error  ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info('TC_067-9 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_067-10
         * @tc.name      : createPixelMap(decodingOptions:desiredRegion>imagesize)-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_067-10', 0, async function (done) {
            await getFd('moving_test.gif');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(' TC_067-10 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 10000, width: 10000 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_067-10 createPixelMap error ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        pixelmap.getImageInfo().then((imageInfo) => {
                            expect(imageInfo.size.height == 2).assertTrue();
                            expect(imageInfo.size.width == 1).assertTrue();
                            console.info('TC_067-10 success ');
                                console.info("imageInfo height :" + imageInfo.size.height);
                                console.info("imageInfo width : " + imageInfo.size.width);
                            done();
                        }).catch((err) => {
                            console.info('TC_067-10 getimageInfo err ' + JSON.stringify(err));
                        })
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_067-11
         * @tc.name      : createPixelMapdecodingOptions:x -1 y -1)-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_067-11', 0, async function (done) {
            await getFd('moving_test.gif');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_067-11 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: -1, y: -1 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_067-11 success ');
                        console.info('TC_067-11createPixelMap error ' + JSON.stringify(err));
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('TC_067-11 fail  ' + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_067-12
         * @tc.name      : createPixelMap(decodingOptions:x > image.height y > image.width)-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_067-12', 0, async function (done) {
            await getFd('moving_test.gif');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_067-12 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 10000, y: 10000 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_067-12 success ');
                        console.info('TC_067-12 createPixelMap error ' + JSON.stringify(err));
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('TC_067-12 fail  ' + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_067-13
         * @tc.name      : createPixelMap(decodingOptions:rotate>360)-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_067-13', 0, async function (done) {
            await getFd('moving_test.gif');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_067-13 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 500,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 1, y: 2 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_067-13 success ');
                        console.info('TC_067-13 createPixelMap error ' + JSON.stringify(err));
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('TC_067-13 fail  ' + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_067-14
         * @tc.name      : createPixelMap-promise-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_067-14', 0, async function (done) {
            await getFd('moving_test.gif');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_067-14 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.createPixelMap().then(pixelmap => {
                    globalpixelmap = pixelmap;
                    console.info('TC_067-14 success ');
                    expect(pixelmap !== undefined).assertTrue();
                    done();
                }).catch(error => {
                    console.log('TC_067-14 error: ' + error);
                    expect().assertFail();
                    done();
                })
            }
        })

        /**
         * @tc.number    : TC_067-15
         * @tc.name      : createPixelMap-pcallback-gif
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return null
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_067-15', 0, async function (done) {
            await getFd('moving_test.gif');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_067-15 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                imageSourceApi.createPixelMap((err, pixelmap) => {

                    console.info('TC_067-15 success ');
                    expect(pixelmap !== undefined).assertTrue();
                    done();
                })
            }
        })

        /**
         * @tc.number    : TC_068
         * @tc.name      : createPixelMap(decodingOptions)-pixelformat:RGBA_8888-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_068', 0, async function (done) {
            await getFd('test.bmp');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_068 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 3,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_068 createPixelMap error  ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info('TC_068 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_068-1
         * @tc.name      : createPixelMap(decodingOptions)-pixelformat:RGB_565-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_068-1', 0, async function (done) {
            await getFd('test.bmp');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_068-1 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_068-1 createPixelMap error  ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info('TC_068-1 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_068-2
         * @tc.name      : createPixelMap(decodingOptions)-pixelformat:unkonwn-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_068-2', 0, async function (done) {
            await getFd('test.bmp');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_068-2 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_068-2 createPixelMap error  ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info('TC_068-2 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_068-3
         * @tc.name      : createPixelMap(decodingOptions: index 1})-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_068-3', 0, async function (done) {
            await getFd('test.bmp');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_068-3 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 1
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_068-3 success ');
                        console.info('TC_068-3 createPixelMap error ' + JSON.stringify(err));
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('TC_068-3 fail  ' + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_068-4
         * @tc.name      : createPixelMap(decodingOptions:index -1})-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_068-4', 0, async function (done) {
            await getFd('test.bmp');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_068-4 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: -1
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_068-4 success ');
                        console.info('TC_068-4 createPixelMap error ' + JSON.stringify(err));
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('TC_068-4 fail  ' + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_068-5
         * @tc.name      : createPixelMap(decodingOptions:sampleSize -1})-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_068-5', 0, async function (done) {
            await getFd('test.bmp');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_068-5 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: -1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_068-5 success ');
                        console.info('TC_068-5 createPixelMap error ' + JSON.stringify(err));
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('TC_068-5 fail  ' + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_068-6
         * @tc.name      : createPixelMap(decodingOptions:rotate -10})-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_068-6', 0, async function (done) {
            await getFd('test.bmp');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_068-6 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: -10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_068-6 success ');
                        console.info('TC_068-6 createPixelMap error ' + JSON.stringify(err));
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('TC_068-6 fail  ' + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_068-7
         * @tc.name      : createPixelMap(decodingOptions:unsupported pixelformat)-bmp 
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_068-7', 0, async function (done) {
            await getFd('test.bmp');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_068-7 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 60,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_068-7 success ');
                        console.info('TC_068-7 createPixelMap error ' + JSON.stringify(err));
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('TC_068-7 fail  ' + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_068-8
         * @tc.name      : createPixelMap(decodingOptions:editable false})-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_068-8', 0, async function (done) {
            await getFd('test.bmp');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_068-8 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: false,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_068-8 createPixelMap error  ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info('TC_068-8 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_068-9
         * @tc.name      : createPixelMap(decodingOptions:desiredSize>imagesize)-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_068-9', 0, async function (done) {
            await getFd('test.bmp');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_068-9 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1500, height: 1500 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_068-9 createPixelMap error  ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info('TC_068-9 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_068-10
         * @tc.name      : createPixelMap(decodingOptions:desiredRegion>imagesize)-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_068-10', 0, async function (done) {
            await getFd('test.bmp');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(' TC_068-10 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 10000, width: 10000 }, x: 0, y: 0 },
                    index: 0
                };

                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_068-10 createPixelMap error  ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        pixelmap.getImageInfo().then((imageInfo) => {
                            expect(imageInfo.size.height == 2).assertTrue();
                            expect(imageInfo.size.width == 1).assertTrue();
                            console.info('TC_068-10 success ');
                                console.info("imageInfo height :" + imageInfo.size.height);
                                console.info("imageInfo width : " + imageInfo.size.width);
                            done();
                        }).catch((err) => {
                            console.info('TC_068-10 getimageInfo err ' + JSON.stringify(err));
                        })
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_068-11
         * @tc.name      : createPixelMapdecodingOptions:x -1 y -1)-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_068-11', 0, async function (done) {
            await getFd('test.bmp');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_068-11 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: -1, y: -1 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_068-11 success ');
                        console.info('TC_068-11 createPixelMap error ' + JSON.stringify(err));
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('TC_068-11 fail  ' + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_068-12
         * @tc.name      : createPixelMap(decodingOptions:x > image.height y > image.width)-bmp
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_068-12', 0, async function (done) {
            await getFd('test.bmp');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_068-12 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 10000, y: 10000 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_068-12 success ');
                        console.info('TC_068-12 createPixelMap error ' + JSON.stringify(err));
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('TC_068-12 fail  ' + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_068-13
         * @tc.name      : createPixelMap(decodingOptions:rotate>360)-jpg
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_068-13', 0, async function (done) {
            await getFd('test.bmp');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_068-13 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 500,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 1, y: 2 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_068-13 success ');
                        console.info('TC_068-13 createPixelMap error ' + JSON.stringify(err));
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('TC_068-13 fail  ' + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_163
         * @tc.name      : createPixelMap(decodingOptions)-pixelformat:RGBA_8888-png
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_163', 0, async function (done) {
            await getFd('test.png');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_163 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 3,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_163 createPixelMap error  ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info('TC_163 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_163-1
         * @tc.name      : createPixelMap(decodingOptions)-pixelformat:RGB_565-png
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_163-1', 0, async function (done) {
            await getFd('test.png');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_163-1 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_163-1 createPixelMap error  ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info('TC_163-1 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_163-2
         * @tc.name      : createPixelMap(decodingOptions)-pixelformat:unkonwn-png
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_163-2', 0, async function (done) {
            await getFd('test.png');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_163-2 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_163-2 createPixelMap error  ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info('TC_163-2 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_163-3
         * @tc.name      : createPixelMap(decodingOptions: index 1})-png
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_163-3', 0, async function (done) {
            await getFd('test.png');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_163-3 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 1
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_163-3 success ');
                        console.info('TC_163-3 createPixelMap error ' + JSON.stringify(err));
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('TC_163-3 fail  ' + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_163-4
         * @tc.name      : createPixelMap(decodingOptions:index -1})-png
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         *                 4.set index=-1,options
         *                 5.return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_163-4', 0, async function (done) {
            await getFd('test.png');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_163-4 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: -1
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_163-4 success ');
                        console.info('TC_163-4 createPixelMap error ' + JSON.stringify(err));
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('TC_163-4 fail  ' + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_163-5
         * @tc.name      : createPixelMap(decodingOptions:sampleSize -1})-png
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         *                 4.set index=-1,options
         *                 5.return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_163-5', 0, async function (done) {
            await getFd('test.png');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_163-5 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: -1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 0,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_163-5 success ');
                        console.info('TC_163-5 createPixelMap error ' + JSON.stringify(err));
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('TC_163-5 fail  ' + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_163-6
         * @tc.name      : createPixelMap(decodingOptions:rotate -10})-png
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         *                 4.set index=-1,options
         *                 5.return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_163-6', 0, async function (done) {
            await getFd('test.png');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_163-6 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: -10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_163-6 success ');
                        console.info('TC_163-6 createPixelMap error ' + JSON.stringify(err));
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('TC_163-6 fail  ' + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_163-7
         * @tc.name      : createPixelMap(decodingOptions:unsupported pixelformat)-png
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         *                 4.set index=-1,options
         *                 5.return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_163-7', 0, async function (done) {
            await getFd('test.png');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_163-7 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 60,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_163-7 success ');
                        console.info('TC_163-7 createPixelMap error ' + JSON.stringify(err));
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('TC_163-7 fail  ' + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_163-8
         * @tc.name      : createPixelMap(decodingOptions:editable false})-png
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         *                 4.set index=-1,options
         *                 5.return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_163-8', 0, async function (done) {
            await getFd('test.png');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_163-8 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: false,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_163-8 createPixelMap error  ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info('TC_163-8 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_163-9
         * @tc.name      : createPixelMap(decodingOptions:desiredSize>imagesize)-png
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         *                 4.set index=-1,options
         *                 5.return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_163-9', 0, async function (done) {
            await getFd('test.png');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_163-9 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1500, height: 1500 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_163-9 createPixelMap error  ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        console.info('TC_163-9 success ');
                        expect(pixelmap != undefined).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_163-10
         * @tc.name      : createPixelMap(decodingOptions:desiredRegion>imagesize)-png
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         *                 4.set index=-1,options
         *                 5.return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_163-10', 0, async function (done) {
            await getFd('test.png');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info(' TC_163-10 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 10000, width: 10000 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_163-10 createPixelMap error  ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        pixelmap.getImageInfo().then((imageInfo) => {
                            expect(imageInfo.size.height == 2).assertTrue();
                            expect(imageInfo.size.width == 1).assertTrue();
                            console.info('TC_163-10 success ');
                                console.info("imageInfo height :" + imageInfo.size.height);
                                console.info("imageInfo width : " + imageInfo.size.width);
                            done();
                        }).catch((err) => {
                            console.info('TC_163-10 getimageInfo err ' + JSON.stringify(err));
                        })
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_163-11
         * @tc.name      : createPixelMapdecodingOptions:x -1 y -1)-png
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         *                 4.set index=-1,options
         *                 5.return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_163-11', 0, async function (done) {
            await getFd('test.png');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_163-11 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: -1, y: -1 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_163-11 success ');
                        console.info('TC_163-11 createPixelMap error ' + JSON.stringify(err));
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('TC_163-11 fail  ' + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_163-12
         * @tc.name      : createPixelMap(decodingOptions:x > image.height y > image.width)-png
         * @tc.desc      : 1.create imagesource
         *                 2.set decodingOptions
         *                 3.call createPixelMap
         *                 4.set index=-1,options
         *                 5.return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_163-12', 0, async function (done) {
            await getFd('test.png');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_163-12 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 10,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 10000, y: 10000 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_163-12 success ');
                        console.info('TC_163-12 createPixelMap error ' + JSON.stringify(err));
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('TC_163-12 fail  ' + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
             * @tc.number    : TC_163-13
             * @tc.name      : createPixelMap(decodingOptions:rotate>360)-png
             * @tc.desc      : 1.create imagesource
             *                 2.set index and DecodeOptions
             *                 3.create PixelMap
             *                 4.callback return undefined
             * @tc.size      : MEDIUM 
             * @tc.type      : Functional
             * @tc.level     : Level 1
             */
        it('TC_163-13', 0, async function (done) {
            await getFd('test.png');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_163-13 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 500,
                    desiredPixelFormat: 2,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 1, y: 2 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_163-13 success ');
                        console.info('TC_163-13 createPixelMap error ' + JSON.stringify(err));
                        expect(true).assertTrue();
                        done();
                    } else {
                        console.info('TC_163-13 fail  ' + pixelmap);
                        expect(false).assertTrue();
                        done();
                    }
                })
            }
        })

        /**
         * @tc.number    : TC_167
         * @tc.name      : createPixelMap-unsupported image format
         * @tc.desc      : 1.create imagesource
         *                 2.set index and DecodeOptions
         *                 3.create PixelMap
         *                 4.callback return undefined
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_167', 0, async function (done) {
            await getFd('test.tiff');
            const imageSourceApi = image.createImageSource(fdNumber);
            let decodingOptions = {
                sampleSize: 1,
                editable: true,
                desiredSize: { width: 1, height: 2 },
                rotate: 10,
                desiredPixelFormat: 3,
                desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                index: 0
            };
            imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                globalpixelmap = pixelmap;
                if (err) {
                    console.info('TC_167 success ');
                    console.info('TC_167 createPixelMap error ' + JSON.stringify(err));
                    expect(pixelmap == undefined).assertTrue();
                    done();
                } else {
                    console.info('TC_167 fail  ' + pixelmap);
                    expect(false).assertTrue();
                    done();
                }

            })
        })

        /**
         * @tc.number    : TC_169
         * @tc.name      : Decode the image to generate a bitmap 
         * @tc.desc      : 1.create imagesource
         *                 2.create pixelmap
         *                 3.call getimageinfo
         *                 4.Judging the length and width are opposite to the original
         * @tc.size      : MEDIUM 
         * @tc.type      : Functional
         * @tc.level     : Level 1
         */
        it('TC_169', 0, async function (done) {
            await getFd('test.jpg');
            const imageSourceApi = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('TC_169 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                let decodingOptions = {
                    sampleSize: 1,
                    editable: true,
                    desiredSize: { width: 1, height: 2 },
                    rotate: 90,
                    desiredPixelFormat: 3,
                    desiredRegion: { size: { height: 1, width: 2 }, x: 0, y: 0 },
                    index: 0
                };
                imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
                    if (err) {
                        console.info('TC_169 createPixelMap error  ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    } else {
                        globalpixelmap = pixelmap;
                        pixelmap.getImageInfo((error, imageInfo) => {
                            if (error) {
                                console.info('TC_169 getimageInfo err ' + JSON.stringify(error));
                                expect(false).assertTrue();
                                done();
                            } else {
                                if (imageInfo != undefined) {
                                    console.info('TC_169 success');
                                    expect(imageInfo.size.height == 2).assertTrue();
                                    expect(imageInfo.size.width == 1).assertTrue();
                                    done();
                                } else {
                                    console.info('TC_169 imageInfo is empty');
                                    expect(false).assertTrue()
                                    done();
                                }
                            }
                        })
                    }
                })
            }
        })
    })
}
