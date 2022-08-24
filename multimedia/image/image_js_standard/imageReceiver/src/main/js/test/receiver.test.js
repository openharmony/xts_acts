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
import image from '@ohos.multimedia.image'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function ImageReceiver() {
describe('ImageReceiver', function () {

    const YUV_Y = 1;
    const YUV_U = 2;
    const YUV_V = 3;
    const JPEG = 4;
    const WIDTH = 8192;
    const HEIGHT = 8;
    const FORMAT = 4;
    const CAPACITY = 8;
    const YCBCR_422_SP = 1000;
    const FORMATJPEG = 2000;
    let globalreceiver;
    let globalimg;

    beforeAll(async function () {
        console.info('beforeAll case');
    })

    beforeEach(function () {
        console.info('beforeEach case');
    })

    afterEach(async function () {
        if (globalreceiver != undefined) {
            console.info('globalreceiver release start');
            try {
                await globalreceiver.release();
            } catch (error) {
                console.info('globalreceiver release fail');
            }
        }
        if (globalimg != undefined) {
            try {
                console.info('globalimg release start');
                await globalimg.release();
            } catch (error) {
                console.info('globalimg release fail');
            }
        }
        console.info('afterEach case');
    })

    afterAll(async function () {
        console.info('afterAll case');
    })

    async function sleep(times = 200) {
        await new Promise(res => setTimeout(() => { res() }, times));
    }

    async function createRecriver(done, testNum, wid, hei, fmt, cap) {
        try {
            image.createImageReceiver(wid, hei, fmt, cap);
            expect(false).assertTrue();
            done();
        } catch (error) {
            expect(error.code == 1).assertTrue();
            console.info(`${testNum} err message: ` + error);
            done();
        }
    }

    async function getComponentProErr(done, testNum, param) {
        var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMAT, CAPACITY);
        globalreceiver = receiver;
        let once = false;
        if (receiver == undefined) {
            expect(false).assertTrue();
            done();
        } else {
            receiver.on('imageArrival', () => {
                if (once) {
                    return;
                }
                once = true;
                receiver.readLatestImage(async (err, img) => {
                    globalimg = img;
                    if (img == undefined) {
                        expect(false).assertTrue();
                        done();
                    } else {
                        expect(img.size.width == WIDTH).assertTrue();
                        expect(img.size.height == HEIGHT).assertTrue();
                        expect(img.format == 12).assertTrue();
                        expect(img.clipRect.size.width == WIDTH).assertTrue();
                        expect(img.clipRect.size.height == HEIGHT).assertTrue();
                        expect(img.clipRect.x == 0).assertTrue();
                        expect(img.clipRect.y == 0).assertTrue();
                        try {
                            await img.getComponent(param);
                            expect(false).assertTrue();
                            done();
                        } catch (error) {
                            expect(error.code == 1).assertTrue();
                            console.log(`${testNum} error msg: ` + error);
                            done();
                        }
                    }
                })
                expect(true).assertTrue();
            })
            var dummy = receiver.test;
        }
    }

    async function getComponentCbErr(done, testNum, param) {
        var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMAT, CAPACITY);
        globalreceiver = receiver;
        let once = false;
        if (receiver == undefined) {
            expect(false).assertTrue();
            done();
        } else {
            receiver.on('imageArrival', () => {
                if (once) {
                    return;
                }
                once = true;
                receiver.readLatestImage(async (err, img) => {
                    globalimg = img;
                    if (img == undefined) {
                        expect(false).assertTrue();
                        done();
                    } else {
                        expect(img.size.width == WIDTH).assertTrue();
                        expect(img.size.height == HEIGHT).assertTrue();
                        expect(img.format == 12).assertTrue();
                        expect(img.clipRect.size.width == WIDTH).assertTrue();
                        expect(img.clipRect.size.height == HEIGHT).assertTrue();
                        expect(img.clipRect.x == 0).assertTrue();
                        expect(img.clipRect.y == 0).assertTrue();
                        try {
                            img.getComponent(param, (err, component) => {
                                expect(false).assertTrue();
                                done();
                            })
                        } catch (error) {
                            expect(error.code == 1).assertTrue();
                            console.log(`${testNum} error msg: ` + error);
                            done();
                        }
                    }
                })
                expect(true).assertTrue();
            })
            var dummy = receiver.test;
        }
    }

    async function getComponentPromise(done, testNum, param, checkFormat, checkStride) {
        var receiver = image.createImageReceiver(WIDTH, HEIGHT, YCBCR_422_SP, CAPACITY);
        globalreceiver = receiver;
        let once = false;
        if (receiver == undefined) {
            expect(false).assertTrue();
            done();
            return;
        }
        receiver.on('imageArrival', () => {
            if (once) {
                return;
            }
            once = true;
            receiver.readLatestImage((err, img) => {
                globalimg = img;
                if (err) {
                    expect(false).assertTrue();
                    done();
                } else {
                    expect(img.size.width == WIDTH).assertTrue();
                    expect(img.size.height == HEIGHT).assertTrue();
                    checkFormat(img.format);
                    expect(img.clipRect.size.width == WIDTH).assertTrue();
                    expect(img.clipRect.size.height == HEIGHT).assertTrue();
                    expect(img.clipRect.x == 0).assertTrue();
                    expect(img.clipRect.y == 0).assertTrue();
                    console.info(`${testNum} ${param} img.format: ${img.format}`);
                    img.getComponent(param).then(component => {
                        if (component == undefined) {
                            expect(false).assertTrue();
                            done();
                        } else {
                            expect(component.componentType == param).assertTrue();
                            expect(component.byteBuffer != undefined).assertTrue();
                            checkStride(component.rowStride, component.pixelStride);
                            done();
                        }
                    }).catch(error => {
                        console.log(`${testNum} error:` + error)
                        expect(false).assertTrue();
                        done();
                    })
                }
            })
            expect(true).assertTrue();
        })
        if (param == JPEG) {
            var dummy = receiver.test
        } else {
            var dummy = receiver.testYUV;
        }
    }

    async function getComponentCb(done, testNum, param, checkFormat, checkStride) {
        var receiver = image.createImageReceiver(WIDTH, HEIGHT, YCBCR_422_SP, CAPACITY);
        globalreceiver = receiver;
        let once = false;
        if (receiver == undefined) {
            expect(false).assertTrue();
            done();
            return;
        }

        receiver.on('imageArrival', () => {
            if (once) {
                return;
            }
            once = true;
            receiver.readLatestImage((err, img) => {
                globalimg = img;
                if (err) {
                    expect(false).assertTrue();
                    done();
                } else {
                    expect(img.size.width == WIDTH).assertTrue();
                    expect(img.size.height == HEIGHT).assertTrue();
                    checkFormat(img.format);
                    expect(img.clipRect.size.width == WIDTH).assertTrue();
                    expect(img.clipRect.size.height == HEIGHT).assertTrue();
                    expect(img.clipRect.x == 0).assertTrue();
                    expect(img.clipRect.y == 0).assertTrue();
                    console.info(`${testNum} ${param} img.format: ${img.format}`);
                    img.getComponent(param, (err, component) => {
                        if (err) {
                            expect(false).assertTrue();
                            console.log(`${testNum} geterror: ` + err);
                            done();
                        } else {
                            expect(component != undefined).assertTrue();
                            expect(component.componentType == param).assertTrue();
                            expect(component.byteBuffer != undefined).assertTrue();
                            checkStride(component.rowStride, component.pixelStride);
                            done();
                        }
                    })
                }
            })
            expect(true).assertTrue();
        })
        if (param == JPEG) {
            console.info(`${testNum} ${param} `)
            var dummy = receiver.test
        } else {
            console.info(`${testNum} ${param} `)
            var dummy = receiver.testYUV;
        }
    }

    async function onErr(done, testNum, param) {
        var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMAT, CAPACITY);
        globalreceiver = receiver;
        expect(receiver != undefined).assertTrue();
        if (receiver == undefined) {
            expect(false).assertTrue();
            done();
        } else {
            try {
                receiver.on(param, () => {
                    expect(false).assertTrue();
                })
            } catch (error) {
                expect(error.code == 1).assertTrue();
                console.log(`${testNum} error msg: ` + error);
                done();
            }
            var dummy = receiver.test;
        }

    }

    function isString(value) {
        return typeof value === 'string';
    }

    /**
     * @tc.number    : Receiver_001
     * @tc.name      : createImageReceiver
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageReceiver
     *                 3.return ImageReceiver not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_001', 0, async function (done) {
        var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMAT, CAPACITY);
        globalreceiver = receiver;
        if (receiver == undefined) {
            expect(false).assertTrue();
            console.info('receiver_001 undefined')
            done();
        } else {
            expect(receiver.size.width == WIDTH).assertTrue();
            expect(receiver.size.height == HEIGHT).assertTrue();
            expect(receiver.capacity == CAPACITY).assertTrue();
            expect(receiver.format == FORMAT).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : Receiver_001-1
     * @tc.name      : createImageReceiver
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageReceiver
     *                 3.return ImageReceiver empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_001-1', 0, async function (done) {
        createRecriver(done, 'Receiver_001-1', WIDTH, HEIGHT, FORMAT, 'hd!')
    })

    /**
     * @tc.number    : Receiver_001-2
     * @tc.name      : createImageReceiver-wrong format
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageReceiver
     *                 3.return ImageReceiver empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_001-2', 0, async function (done) {
        createRecriver(done, 'Receiver_001-2', WIDTH, HEIGHT, null, CAPACITY)
    })

    /**
     * @tc.number    : Receiver_001-3
     * @tc.name      : createImageReceiver-wrong height
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageReceiver
     *                 3.return ImageReceiver empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_001-3', 0, async function (done) {
        createRecriver(done, 'Receiver_001-3', WIDTH, null, FORMAT, CAPACITY)
    })

    /**
     * @tc.number    : Receiver_001-4
     * @tc.name      : createImageReceiver-wrong width
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageReceiver
     *                 3.return ImageReceiver empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_001-4', 0, async function (done) {
        createRecriver(done, 'Receiver_001-4', null, HEIGHT, FORMAT, CAPACITY)
    })

    /**
     * @tc.number    : Receiver_001-5
     * @tc.name      : createImageReceiver-wrong capacity
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageReceiver
     *                 3.return ImageReceiver empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_001-5', 0, async function (done) {
        createRecriver(done, 'Receiver_001-5', WIDTH, HEIGHT, FORMAT, null)
    })

    /**
     * @tc.number    : Receiver_001-6
     * @tc.name      : createImageReceiver-wrong width
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageReceiver
     *                 3.return ImageReceiver empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_001-6', 0, async function (done) {
        createRecriver(done, 'Receiver_001-6', false, HEIGHT, FORMAT, CAPACITY)
    })

    /**
     * @tc.number    : Receiver_001-7
     * @tc.name      : createImageReceiver- wrong width
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageReceiver
     *                 3.return ImageReceiver empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_001-7', 0, async function (done) {
        createRecriver(done, 'Receiver_001-7', { a: 10 }, HEIGHT, FORMAT, CAPACITY)
    })

    /**
     * @tc.number    : Receiver_001-8
     * @tc.name      : createImageReceiver
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageReceiver
     *                 3.return ImageReceiver empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_001-8', 0, async function (done) {
        createRecriver(done, 'Receiver_001-8', WIDTH, false, FORMAT, CAPACITY)
    })

    /**
     * @tc.number    : Receiver_001-9
     * @tc.name      : createImageReceiver- wrong format
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageReceiver
     *                 3.return ImageReceiver empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_001-9', 0, async function (done) {
        createRecriver(done, 'Receiver_001-9', WIDTH, HEIGHT, 'form.', CAPACITY)
    })

    /**
     * @tc.number    : Receiver_001-10
     * @tc.name      : createImageReceiver
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageReceiver
     *                 3.return ImageReceiver not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_001-10', 0, async function (done) {
        var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMATJPEG, CAPACITY);
        globalreceiver = receiver;
        if (receiver == undefined) {
            expect(false).assertTrue();
            console.info('Receiver_001-10 undefined')
            done();
        } else {
            expect(receiver.size.width == WIDTH).assertTrue();
            expect(receiver.size.height == HEIGHT).assertTrue();
            expect(receiver.capacity == CAPACITY).assertTrue();
            expect(receiver.format == FORMATJPEG).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : Receiver_001-11
     * @tc.name      : createImageReceiver
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageReceiver
     *                 3.return ImageReceiver not empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_001-11', 0, async function (done) {
        var receiver = image.createImageReceiver(WIDTH, HEIGHT, YCBCR_422_SP, CAPACITY);
        globalreceiver = receiver;
        if (receiver == undefined) {
            expect(false).assertTrue();
            console.info('Receiver_001-11 undefined')
            done();
        } else {
            expect(receiver.size.width == WIDTH).assertTrue();
            expect(receiver.size.height == HEIGHT).assertTrue();
            expect(receiver.capacity == CAPACITY).assertTrue();
            expect(receiver.format == YCBCR_422_SP).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : Receiver_002
     * @tc.name      : getReceivingSurfaceId-promise
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call getReceivingSurfaceId
     *                 3.return SurfaceId
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_002', 0, async function (done) {
        var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMAT, CAPACITY);
        globalreceiver = receiver;
        if (receiver != undefined) {
            receiver.getReceivingSurfaceId().then(id => {
                console.info('Receiver_002 getReceivingSurfaceId [' + id + "]");
                expect(isString(id)).assertTrue();
                done();
            }).catch(error => {
                console.log('Receiver_002 error: ' + error);
                expect(false).assertTrue();
                done();
            })
        } else {
            expect(false).assertTrue();
            done()
        }
    })

    /**
     * @tc.number    : Receiver_003
     * @tc.name      : getReceivingSurfaceId-callback
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call getReceivingSurfaceId
     *                 3.return SurfaceId
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_003', 0, async function (done) {
        var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMAT, CAPACITY);
        globalreceiver = receiver;
        if (receiver != undefined) {
            receiver.getReceivingSurfaceId((err, id) => {
                console.info('Receiver_003 getReceivingSurfaceId call back [' + id + "]");
                expect(isString(id)).assertTrue();
                done();
            });
        } else {
            expect(false).assertTrue();
            console.info('Receiver_003 finished');
            done()
        }
    })

    /**
     * @tc.number    : Receiver_004
     * @tc.name      : release-promise
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call release
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_004', 0, async function (done) {
        var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMAT, CAPACITY);
        globalreceiver = receiver;
        if (receiver != undefined) {
            receiver.release().then(() => {
                console.info('Receiver_004 release ');
                expect(true).assertTrue();
                done();
            }).catch(error => {
                expect(false).assertTrue();
                done();
            })
        } else {
            expect(false).assertTrue();
            console.info('Receiver_004 finished');
            done()
        }
    })

    /**
     * @tc.number    : Receiver_005
     * @tc.name      : release-callback
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call release
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_005', 0, async function (done) {
        var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMAT, CAPACITY);
        globalreceiver = receiver;
        if (receiver != undefined) {
            receiver.release((err) => {
                if (err) {
                    expect(false).assertTrue();
                    console.info('Receiver_005 release fail');
                    done();
                } else {
                    console.info('Receiver_005 release call back');
                    expect(true).assertTrue();
                    done();
                }
            });
        } else {
            expect(false).assertTrue();
            console.info('Receiver_005 finished');
            done();
        }
    })

    /**
     * @tc.number    : Receiver_006
     * @tc.name      : readLatestImage-promise
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call readLatestImage
     *                 3.return image
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_006', 0, async function (done) {
        var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMAT, CAPACITY);
        globalreceiver = receiver;
        var dummy = receiver.test;
        if (receiver != undefined) {
            receiver.readLatestImage().then(img => {
                globalimg = img;
                console.info('Receiver_006 readLatestImage Success');
                expect(img != undefined).assertTrue();
                done();
            }).catch(error => {
                console.log('Receiver_006 error: ' + error);
                expect(false).assertTrue();
                done();
            })
        } else {
            expect(false).assertTrue();
            console.info('Receiver_006 finished');
            done();
        }
    })

    /**
     * @tc.number    : Receiver_007
     * @tc.name      : readLatestImage-callback
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call readLatestImage
     *                 3.return image
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_007', 0, async function (done) {
        var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMAT, CAPACITY);
        globalreceiver = receiver;
        var dummy = receiver.test;
        if (receiver != undefined) {
            receiver.readLatestImage((err, img) => {
                globalimg = img;
                console.info('Receiver_007 readLatestImage call back Success');
                expect(img != undefined).assertTrue();
                done();
            });
        } else {
            expect(false).assertTrue();
            console.info('Receiver_007 finished');
            done();
        }
    })

    /**
     * @tc.number    : Receiver_008
     * @tc.name      : readNextImage-promise
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call readNextImage
     *                 3.return image
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_008', 0, async function (done) {
        var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMAT, CAPACITY);
        globalreceiver = receiver;
        var dummy = receiver.test;
        expect(receiver != undefined).assertTrue();
        if (receiver != undefined) {
            receiver.readNextImage().then(img => {
                globalimg = img;
                console.info('Receiver_008 readNextImage Success');
                expect(img != undefined).assertTrue();
                done()
            }).catch(error => {
                console.log('Receiver_008 error: ' + error);
                expect(false).assertTrue();
                done();
            })
        } else {
            expect(false).assertTrue();
            console.info('Receiver_008 finished');
            done();
        }
    })

    /**
     * @tc.number    : Receiver_009
     * @tc.name      : readNextImage-callback
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call readNextImage
     *                 3.return image
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_009', 0, async function (done) {
        var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMAT, CAPACITY);
        globalreceiver = receiver;
        var dummy = receiver.test;
        if (receiver != undefined) {
            receiver.readNextImage((err, img) => {
                globalimg = img;
                if (err) {
                    expect(false).assertTrue();
                    done();
                } else {
                    console.info('Receiver_009 readNextImage call back Success');
                    expect(img != undefined).assertTrue();
                    done();
                }

            })
        } else {
            expect(false).assertTrue();
            console.info('Receiver_009 finished');
            done();
        }
    })

    /**
     * @tc.number    : Receiver_010
     * @tc.name      : getComponent-jpeg
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call on
     *                 3.readLatestImage 
     *                 4.call getComponent
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_010', 0, async function (done) {
        function checkFormat(format) {
            expect(format == 12).assertTrue();
        }
        function checkStride(rowStride, pixelStride) {
            expect(rowStride == 8192).assertTrue();
            expect(pixelStride == 1).assertTrue();
        }
        getComponentPromise(done, 'Receiver_010', JPEG, checkFormat, checkStride)
    })

    /**
     * @tc.number    : Receiver_010_1
     * @tc.name      : getComponent-YUV_U
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call on
     *                 3.readLatestImage 
     *                 4.call getComponent
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_010_1', 0, async function (done) {
        function checkFormat(format) {
            expect(format == 22).assertTrue();
        }
        function checkStride(rowStride, pixelStride) {
            expect(rowStride == 4096).assertTrue();
            expect(pixelStride == 2).assertTrue();
        }
        getComponentPromise(done, 'Receiver_010_1', YUV_U, checkFormat, checkStride)
    })

    /**
     * @tc.number    : Receiver_010_2
     * @tc.name      : getComponent-YUV_V
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call on
     *                 3.readLatestImage 
     *                 4.call getComponent
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_010_2', 0, async function (done) {
        function checkFormat(format) {
            expect(format == 22).assertTrue();
        }
        function checkStride(rowStride, pixelStride) {
            expect(rowStride == 4096).assertTrue();
            expect(pixelStride == 2).assertTrue();
        }
        getComponentPromise(done, 'Receiver_010_2', YUV_V, checkFormat, checkStride)
    })

    /**
     * @tc.number    : Receiver_010_3
     * @tc.name      : getComponent-YUV_Y
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call on
     *                 3.readLatestImage 
     *                 4.call getComponent
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_010_3', 0, async function (done) {
        function checkFormat(format) {
            expect(format == 22).assertTrue();
        }
        function checkStride(rowStride, pixelStride) {
            expect(rowStride == 8192).assertTrue();
            expect(pixelStride == 1).assertTrue();
        }
        getComponentPromise(done, 'Receiver_010_3', YUV_Y, checkFormat, checkStride)
    })

    /**
     * @tc.number    : Receiver_010_4
     * @tc.name      : getComponent-jpeg
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call on
     *                 3.readLatestImage 
     *                 4.call getComponent
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_010_4', 0, async function (done) {
        function checkFormat(format) {
            expect(format == 12).assertTrue();
        }
        function checkStride(rowStride, pixelStride) {
            expect(rowStride == 8192).assertTrue();
            expect(pixelStride == 1).assertTrue();
        }
        getComponentCb(done, 'Receiver_010_4', JPEG, checkFormat, checkStride)
    })

    /**
     * @tc.number    : Receiver_010_5
     * @tc.name      : getComponent-YUV_Y
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call on
     *                 3.readLatestImage 
     *                 4.call getComponent
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_010_5', 0, async function (done) {
        function checkFormat(format) {
            expect(format == 22).assertTrue();
        }
        function checkStride(rowStride, pixelStride) {
            expect(rowStride == 8192).assertTrue();
            expect(pixelStride == 1).assertTrue();
        }
        getComponentCb(done, 'Receiver_010_5', YUV_Y, checkFormat, checkStride)
    })

    /**
     * @tc.number    : Receiver_010_6
     * @tc.name      : getComponent-YUV_V
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call on
     *                 3.readLatestImage 
     *                 4.call getComponent
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_010_6', 0, async function (done) {
        function checkFormat(format) {
            expect(format == 22).assertTrue();
        }
        function checkStride(rowStride, pixelStride) {
            expect(rowStride == 4096).assertTrue();
            expect(pixelStride == 2).assertTrue();
        }
        getComponentCb(done, 'Receiver_010_6', YUV_V, checkFormat, checkStride)
    })
	
    /**
     * @tc.number    : Receiver_010_7
     * @tc.name      : getComponent-YUV_U
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call on
     *                 3.readLatestImage 
     *                 4.call getComponent
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_010_7', 0, async function (done) {
        function checkFormat(format) {
            expect(format == 22).assertTrue();
        }
        function checkStride(rowStride, pixelStride) {
            expect(rowStride == 4096).assertTrue();
            expect(pixelStride == 2).assertTrue();
        }
        getComponentCb(done, 'Receiver_010_7', YUV_U, checkFormat, checkStride)
    })
	
    /**
    * @tc.number    : Receiver_011
    * @tc.name      : on
    * @tc.desc      : 1.create ImageReceiver
    *                 2.call on
    * @tc.size      : MEDIUM 
    * @tc.type      : Functional
    * @tc.level     : Level 0
    */
    it('Receiver_011', 0, async function (done) {
        var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMAT, CAPACITY);
        globalreceiver = receiver;
        if (receiver == undefined) {
            expect(false).assertTrue();
            done();
        } else {
            let pass = false;
            receiver.on('imageArrival', (err) => {
                if (err) {
                    console.info('Receiver_011 on err' + err);
                    expect(false).assertTrue();
                    done();
                } else {
                    pass = true;
                    console.info('Receiver_011 on call back IN');
                }
            })

            var dummy = receiver.test
            await sleep(2000);
            expect(pass).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : Receiver_012
     * @tc.name      : release-promise
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call on
     *                 3.readLatestImage 
     *                 4.call release
     *                 5.return the operation result
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_012', 0, async function (done) {
        var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMAT, CAPACITY);
        globalreceiver = receiver;
        if (receiver == undefined) {
            expect(false).assertTrue();
            done();
            return;
        }

        receiver.on('imageArrival', () => {
            expect(true).assertTrue();
        })

        var dummy = receiver.test

        receiver.readLatestImage().then(img => {
            if (img == undefined) {
                expect(false).assertTrue();
                done();
            } else {
                expect(img.size.width == WIDTH).assertTrue();
                expect(img.size.height == HEIGHT).assertTrue();
                expect(img.format == 12).assertTrue();
                expect(img.clipRect.size.width == WIDTH).assertTrue();
                expect(img.clipRect.size.height == HEIGHT).assertTrue();
                expect(img.clipRect.x == 0).assertTrue();
                expect(img.clipRect.y == 0).assertTrue();

                img.release().then(() => {
                    expect(true).assertTrue();
                    done();
                }).catch(error => {
                    console.log('Receiver_012 err' + error);
                    expect(false).assertTrue();
                    done();
                })
            }
        }).catch(error => {
            console.log('Receiver_012 readLatestImage err' + error)
            expect(false).assertTrue();
            done();
        })
    })

    /**
     * @tc.number    : Receiver_013
     * @tc.name      : release-callback
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call on
     *                 3.readLatestImage 
     *                 4.call release
     *                 5.return the operation result
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_013', 0, async function (done) {
        var receiver = image.createImageReceiver(WIDTH, HEIGHT, FORMAT, CAPACITY);
        globalreceiver = receiver;
        if (receiver == undefined) {
            expect(false).assertTrue();
            done();
            return;
        }

        receiver.on('imageArrival', () => {
            expect(true).assertTrue();
        })

        var dummy = receiver.test

        receiver.readLatestImage((err, img) => {
            if (img == undefined) {
                expect(false).assertTrue();
                done();
                return;
            }

            expect(img.size.width == WIDTH).assertTrue();
            expect(img.size.height == HEIGHT).assertTrue();
            expect(img.format == 12).assertTrue();
            expect(img.clipRect.size.width == WIDTH).assertTrue();
            expect(img.clipRect.size.height == HEIGHT).assertTrue();
            expect(img.clipRect.x == 0).assertTrue();
            expect(img.clipRect.y == 0).assertTrue();

            img.release((err) => {
                if (err) {
                    expect(false).assertTrue();
                    done();
                } else {
                    expect(true).assertTrue();
                    done();
                }
            })
        })
    })

    /**
     * @tc.number    : Receiver_014
     * @tc.name      : getComponent-wrong format
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call on
     *                 3.readLatestImage 
     *                 4.call getComponent
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_014', 0, async function (done) {
        getComponentCbErr(done, 'Receiver_014', null)
    })

    /**
     * @tc.number    : Receiver_015
     * @tc.name      : getComponent-wrong format
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call on
     *                 3.readLatestImage 
     *                 4.call getComponent
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_015', 0, async function (done) {
        getComponentCbErr(done, 'Receiver_015', 'ab')
    })

    /**
     * @tc.number    : Receiver_016
     * @tc.name      : getComponent-wrong format
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call on
     *                 3.readLatestImage 
     *                 4.call getComponent
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_016', 0, async function (done) {
        getComponentCbErr(done, 'Receiver_016', 0.1)
    })

    /**
     * @tc.number    : Receiver_017
     * @tc.name      : getComponent-wrong format
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call on
     *                 3.readLatestImage 
     *                 4.call getComponent
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_017', 0, async function (done) {
        getComponentCbErr(done, 'Receiver_017', { a: 1 })
    })

    /**
     * @tc.number    : Receiver_018
     * @tc.name      : getComponent-wrong format
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call on
     *                 3.readLatestImage 
     *                 4.call getComponent
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_018', 0, async function (done) {
        getComponentProErr(done, 'Receiver_018', null)
    })

    /**
     * @tc.number    : Receiver_019
     * @tc.name      : getComponent-wrong format
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call on
     *                 3.readLatestImage 
     *                 4.call getComponent
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_019', 0, async function (done) {
        getComponentProErr(done, 'Receiver_019', 'ab')
    })

    /**
     * @tc.number    : Receiver_020
     * @tc.name      : getComponent-wrong format
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call on
     *                 3.readLatestImage 
     *                 4.call getComponent
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_020', 0, async function (done) {
        getComponentProErr(done, 'Receiver_020', 0.1)
    })

    /**
     * @tc.number    : Receiver_021
     * @tc.name      : getComponent-wrong format
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call on
     *                 3.readLatestImage 
     *                 4.call getComponent
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_021', 0, async function (done) {
        getComponentProErr(done, 'Receiver_021', { a: 1 })
    })

    /**
     * @tc.number    : Receiver_022
     * @tc.name      : on-1
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call on
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_022', 0, async function (done) {
        onErr(done, 'Receiver_022', 1)
    })

    /**
     * @tc.number    : Receiver_023
     * @tc.name      : on-null
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call on
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_023', 0, async function (done) {
        onErr(done, 'Receiver_023', null)
    })

    /**
     * @tc.number    : Receiver_024
     * @tc.name      : on-{a : 1}
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call on
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_024', 0, async function (done) {
        onErr(done, 'Receiver_024', { a: 1 })
    })

    /**
     * @tc.number    : Receiver_025
     * @tc.name      : on-'a'
     * @tc.desc      : 1.create ImageReceiver
     *                 2.call on
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Receiver_025', 0, async function (done) {
        onErr(done, 'Receiver_025', 'a')
    })
})
}
