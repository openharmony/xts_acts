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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

describe('ImageCreator', function () {

    const JPEG = 4;
    const WIDTH = 8192;
    const HEIGHT = 8;
    const FORMAT = 4;
    const CAPACITY = 8;

    beforeAll(function () {
        console.info('beforeAll case');
    })

    beforeEach(function () {
        console.info('beforeEach case');
    })

    afterEach(function () {
        console.info('afterEach case');
    })

    afterAll(function () {
        console.info('afterAll case');
    })

    function createCreator(done, testNum, wid, hei, fmt, cap) {
        try {
            image.createImageCreator(wid, hei, fmt, cap);
            expect(false).assertTrue();
            done();
        } catch (error) {
            expect(error.code == 1).assertTrue();
            console.info(`${testNum} err message` + error);
            done();
        }
    }

    async function onErr(done, testNum, param) {
        var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY)
        if (creator == undefined) {
            expect(false).assertTrue();
            done();
        } else {
            try {
                creator.on(param, (err) => {
                    expect(false).assertTrue();
                    done();
                });
            } catch (error) {
                expect(error.code == 1).assertTrue();
                console.log(`${testNum} error msg: ` + error);
                done();
            }
        }
    }

    async function queueImageError(done, testNum, param) {
        var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
        if (creator != undefined) {
            creator.dequeueImage().then(img => {
                if (img == undefined) {
                    expect(false).assertTrue();
                    done();
                    return
                }
                img.getComponent(JPEG, async (err, component) => {
                    if (err) {
                        expect(false).assertTrue();
                        console.log(`${testNum} getComponent err:` + err);
                        done();
                        return;
                    }
                    expect(component.componentType == JPEG).assertTrue();
                    expect(component.byteBuffer != undefined).assertTrue();
                    var bufferArr = new Uint8Array(component.byteBuffer);

                    for (var i = 0; i < bufferArr.length; i += 4) {
                        bufferArr[i] = 0; //B
                        bufferArr[i + 1] = 0; //G
                        bufferArr[i + 2] = 255; //R
                        bufferArr[i + 3] = 255; //A
                    }

                    try {
                        await creator.queueImage(param);
                        expect(false).assertTrue();
                        done();
                    } catch (error) {
                        expect(error.code == 1).assertTrue();
                        console.log(`${testNum} error msg: ` + error);
                        done();
                    }
                })
            }).catch(error => {
                console.log(`${testNum} dequeue error:` + error);
                expect(false).assertTrue();
                done();
            })
        } else {
            console.log(`${testNum} createImageCreator: failed `);
            expect(false).assertTrue();
            done();
        }
    }

    async function queueImageCbError(done, testNum, param) {
        var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
        if (creator != undefined) {
            creator.dequeueImage().then(img => {
                if (img == undefined) {
                    expect(false).assertTrue();
                    done()
                } else {
                    img.getComponent(JPEG, (err, component) => {
                        if (err) {
                            expect(false).assertTrue();
                            console.log(`${testNum} getComponent error:` + err);
                            done();
                            return;
                        }
                        expect(component.componentType == JPEG).assertTrue();
                        expect(component.byteBuffer != undefined).assertTrue();
                        var bufferArr = new Uint8Array(component.byteBuffer);

                        for (var i = 0; i < bufferArr.length; i += 4) {
                            bufferArr[i] = 0; //B
                            bufferArr[i + 1] = 0; //G
                            bufferArr[i + 2] = 255; //R
                            bufferArr[i + 3] = 255; //A
                        }

                        try {
                            creator.queueImage(param, (err) => {
                                expect(false).assertTrue();
                                done();
                            })
                        } catch (error) {
                            expect(error.code == 1).assertTrue();
                            console.log(`${testNum} error msg: ` + error);
                            done();
                        }
                    })
                }
            }).catch(error => {
                console.log(`${testNum} dequeue error:` + error);
                expect(false).assertTrue();
                done();
            })
        } else {
            console.log(`${testNum} createImageCreator: failed `);
            expect(false).assertTrue();
            done();
        }
    }

    /**
    * @tc.number    : Creator_001
    * @tc.name      : createImageCreator
    * @tc.desc      : 1.set width,height,format,capacity
    *                 2.create ImageCreator
    *                 3.return ImageCreator not empty
    * @tc.size      : MEDIUM 
    * @tc.type      : Functional
    * @tc.level     : Level 0
    */
    it('Creator_001', 0, async function (done) {
        var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
        if (creator == undefined) {
            expect(false).assertTrue();
            console.info('creator_001 undefined')
            done();
        } else {
            expect(creator.size.width == WIDTH).assertTrue();
            expect(creator.size.height == HEIGHT).assertTrue();
            expect(creator.capacity == CAPACITY).assertTrue();
            expect(creator.format == FORMAT).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : Creator_001-1
     * @tc.name      : createImageCreator
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageCreator
     *                 3.return ImageCreator empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_001-1', 0, async function (done) {
        createCreator(done, 'Creator_001-1', WIDTH, HEIGHT, FORMAT, 'hd!');
    })

    /**
     * @tc.number    : Creator_001-2
     * @tc.name      : createImageCreator
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageCreator
     *                 3.return ImageCreator empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_001-2', 0, async function (done) {
        createCreator(done, 'Creator_001-2', WIDTH, HEIGHT, null, CAPACITY);
    })

    /**
     * @tc.number    : Creator_001-3
     * @tc.name      : createImageCreator
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageCreator
     *                 3.return ImageCreator empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_001-3', 0, async function (done) {
        createCreator(done, 'Creator_001-3', WIDTH, null, FORMAT, CAPACITY);
    })

    /**
     * @tc.number    : Creator_001-4
     * @tc.name      : createImageCreator
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageCreator
     *                 3.return ImageCreator empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_001-4', 0, async function (done) {
        createCreator(done, 'Creator_001-4', null, HEIGHT, FORMAT, CAPACITY);
    })

    /**
     * @tc.number    : Creator_001-5
     * @tc.name      : createImageCreator
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageCreator
     *                 3.return ImageCreator empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_001-5', 0, async function (done) {
        createCreator(done, 'Creator_001-5', WIDTH, HEIGHT, FORMAT, null);
    })

    /**
     * @tc.number    : Creator_001-6
     * @tc.name      : createImageCreator
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageCreator
     *                 3.return ImageCreator empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_001-6', 0, async function (done) {
        createCreator(done, 'Creator_001-6', false, HEIGHT, FORMAT, CAPACITY);
    })

    /**
     * @tc.number    : Creator_001-7
     * @tc.name      : createImageCreator
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageCreator
     *                 3.return ImageCreator empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_001-7', 0, async function (done) {
        createCreator(done, 'Creator_001-7', { a: 10 }, HEIGHT, FORMAT, CAPACITY);
    })

    /**
     * @tc.number    : Creator_001-8
     * @tc.name      : createImageCreator
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageCreator
     *                 3.return ImageCreator empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_001-8', 0, async function (done) {
        createCreator(done, 'Creator_001-8', WIDTH, false, FORMAT, CAPACITY);
    })

    /**
     * @tc.number    : Creator_001-9
     * @tc.name      : createImageCreator
     * @tc.desc      : 1.set width,height,format,capacity
     *                 2.create ImageCreator
     *                 3.return ImageCreator empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_001-9', 0, async function (done) {
        createCreator(done, 'Creator_001-9', WIDTH, HEIGHT, 'form.', CAPACITY);
    })


    /**
     * @tc.number    : Creator_002
     * @tc.name      : release-promise
     * @tc.desc      : 1.create ImageCreator
     *                 2.call release
     *                 3.return empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_002', 0, async function (done) {
        var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
        if (creator != undefined) {
            creator.release().then(() => {
                console.info('Creator_002 release ');
                expect(true).assertTrue();
                done();
            }).catch(error => {
                expect(false).assertTrue();
                done();
            })
        } else {
            expect(false).assertTrue();
            console.info('Creator_002 finished');
            done()
        }
    })

    /**
     * @tc.number    : Creator_003
     * @tc.name      : release-callback
     * @tc.desc      : 1.create ImageCreator
     *                 2.call release
     *                 3.return empty
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_003', 0, async function (done) {
        var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
        if (creator != undefined) {
            creator.release((err) => {
                if (err) {
                    console.info('Creator_003 release call back' + err);
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info('Creator_003 release call back');
                expect(true).assertTrue();
                done();
            });
        } else {
            expect(false).assertTrue();
            console.info('Creator_003 finished');
            done()
        }
    })

    /**
     * @tc.number    : Creator_004
     * @tc.name      : dequeueImage-promise
     * @tc.desc      : 1.create ImageCreator
     *                 2.call dequeueImage
     *                 3.return image
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_004', 0, async function (done) {
        var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
        if (creator != undefined) {
            creator.dequeueImage().then(img => {
                console.info('Creator_004 dequeueImage Success');
                expect(img != undefined).assertTrue();
                done();
            }).catch(error => {
                console.log('Creator_004 error: ' + error);
                expect(false).assertTrue();
                done();
            })
        } else {
            expect(false).assertTrue();
            console.info('Creator_004 finished');
            done();
        }
    })

    /**
     * @tc.number    : Creator_005
     * @tc.name      : dequeueImage-callback
     * @tc.desc      : 1.create ImageCreator
     *                 2.call dequeueImage
     *                 3.return image
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_005', 0, async function (done) {
        var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
        if (creator != undefined) {
            creator.dequeueImage((err, img) => {
                if (err) {
                    console.info('Creator_005 err:' + err);
                    expect(false).assertTrue();
                    done();
                    return;
                }
                console.info('Creator_005 dequeueImage call back Success');
                expect(img != undefined).assertTrue();
                done();
            });
        } else {
            expect(false).assertTrue();
            console.info('Creator_005 finished');
            done()
        }
    })

    /**
     * @tc.number    : Creator_006
     * @tc.name      : queueImage-promise
     * @tc.desc      : 1.create ImageCreator
     *                 2.call dequeueImage
     *                 3.call queueImage
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_006', 0, async function (done) {
        var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
        if (creator != undefined) {
            creator.dequeueImage().then(img => {
                if (img == undefined) {
                    expect(false).assertTrue();
                    done();
                    return;
                }
                img.getComponent(JPEG, (err, component) => {
                    if (err) {
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    expect(component.componentType == JPEG).assertTrue();
                    expect(component.byteBuffer != undefined).assertTrue();
                    var bufferArr = new Uint8Array(component.byteBuffer);

                    for (var i = 0; i < bufferArr.length; i += 4) {
                        bufferArr[i] = 0; //B
                        bufferArr[i + 1] = 0; //G
                        bufferArr[i + 2] = 255; //R
                        bufferArr[i + 3] = 255; //A
                    }
                    console.info("this is img " + img);

                    creator.queueImage(img).then(() => {
                        console.info('Creator_006 queueImage Success');
                        var dummy = creator.test;
                        expect(true).assertTrue();
                        done();
                    }).catch(error => {
                        console.info('Creator_006 queueImage error: ' + error);
                        expect(false).assertTrue();
                        done();
                    })
                })
            })
        } else {
            expect(false).assertTrue();
            console.info('Creator_006 createImageCreator failed');
            done()
        }
    })

    /**
     * @tc.number    : Creator_006-1
     * @tc.name      : queueImage-promise-1
     * @tc.desc      : 1.create ImageCreator
     *                 2.call queueImage
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_006-1', 0, async function (done) {
        queueImageError(done, 'Creator_006-1', 1);
    })

    /**
     * @tc.number    : Creator_006-2
     * @tc.name      : queueImage-promise-null
     * @tc.desc      : 1.create ImageCreator
     *                 2.call queueImage
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_006-2', 0, async function (done) {
        queueImageError(done, 'Creator_006-2', null);
    })

    /**
     * @tc.number    : Creator_006-3
     * @tc.name      : queueImage-promise-'a'
     * @tc.desc      : 1.create ImageCreator
     *                 2.call queueImage
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_006-3', 0, async function (done) {
        queueImageError(done, 'Creator_006-3', 'a');
    })

    /**
     * @tc.number    : Creator_006-4
     * @tc.name      : on-{a : 1}
     * @tc.desc      : 1.create ImageCreator
     *                 2.call queueImage
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_006-4', 0, async function (done) {
        queueImageError(done, 'Creator_006-4', { a: 1 });
    })

    /**
     * @tc.number    : Creator_007
     * @tc.name      : queueImage-callback
     * @tc.desc      : 1.create ImageCreator
     *                 2.call dequeueImage
     *                 3.call queueImage
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */

    it('Creator_007', 0, async function (done) {
        var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY);
        if (creator != undefined) {
            creator.dequeueImage((err, img) => {
                if (err || img == undefined) {
                    console.log('Creator_007 dequeueImage error:' + err);
                    expect(false).assertTrue();
                    done();
                    return;
                }

                img.getComponent(JPEG, (err, component) => {
                    if (err) {
                        expect(false).assertTrue();
                        console.log('Creator_007 getComponent error:' + err);
                        done();
                        return;
                    }
                    expect(component.componentType == JPEG).assertTrue();
                    expect(component.byteBuffer != undefined).assertTrue();
                    var bufferArr = new Uint8Array(component.byteBuffer);

                    for (var i = 0; i < bufferArr.length; i += 4) {
                        bufferArr[i] = 0; //B
                        bufferArr[i + 1] = 0; //G
                        bufferArr[i + 2] = 255; //R
                        bufferArr[i + 3] = 255; //A
                    }
                    console.info("this is img " + img);
                    creator.queueImage(img, (err) => {
                        if (err) {
                            console.info('Creator_007 queueImage err: ' + err);
                            expect(false).assertTrue();
                            done();
                        }
                        console.info('Creator_007 queueImage Success');
                        var dummy = creator.test;
                        expect(true).assertTrue();
                        done();
                    })
                })
            })
        } else {
            expect(false).assertTrue();
            console.info('Creator_007 createImageCreator failed');
            done();
        }
    })

    /**
     * @tc.number    : Creator_007-1
     * @tc.name      : queueImage-callback
     * @tc.desc      : 1.create ImageCreator
     *                 2.call dequeueImage
     *                 3.call queueImage
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_007-1', 0, async function (done) {
        queueImageCbError(done, 'Creator_007-1', 1);
    })

    /**
     * @tc.number    : Creator_007-2
     * @tc.name      : queueImage-callback
     * @tc.desc      : 1.create ImageCreator
     *                 2.call dequeueImage
     *                 3.call queueImage
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_007-2', 0, async function (done) {
        queueImageCbError(done, 'Creator_007-2', null);
    })

    /**
     * @tc.number    : Creator_007-3
     * @tc.name      : queueImage-callback
     * @tc.desc      : 1.create ImageCreator
     *                 2.call dequeueImage
     *                 3.call queueImage
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_007-3', 0, async function (done) {
        queueImageCbError(done, 'Creator_007-3', 'a');
    })

    /**
     * @tc.number    : Creator_007-4
     * @tc.name      : queueImage-callback
     * @tc.desc      : 1.create ImageCreator
     *                 2.call dequeueImage
     *                 3.call queueImage
     *                 4.return undefined
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_007-4', 0, async function (done) {
        queueImageCbError(done, 'Creator_007-4', { a: 1 });
    })

    /**
        * @tc.number    : Creator_008
        * @tc.name      : on
        * @tc.desc      : 1.create ImageCreator
        *                 2.call on
        *                 3.return image
        * @tc.size      : MEDIUM 
        * @tc.type      : Functional
        * @tc.level     : Level 0
        */
    it('Creator_008', 0, async function (done) {
        var creator = image.createImageCreator(WIDTH, HEIGHT, FORMAT, CAPACITY)
        expect(creator != undefined).assertTrue();
        if (creator == undefined) {
            done()
            return;
        }
        creator.on('imageRelease', (err) => {
            if (err) {
                console.info('Creator_008 on release faild' + err);
                expect(false).assertTrue();
                done();
                return;
            }
            console.info('Creator_008 on call back IN');
            expect(true).assertTrue();
            done();
        })
        creator.dequeueImage((err, img) => {
            if (err || img == undefined) {
                console.info('Creator_008 dequeueImage fail: ' + err);
                expect(false).assertTrue();
                done();
                return;
            }
            img.getComponent(JPEG, (err, component) => {
                if (err || component == undefined) {
                    console.info('Creator_008 getComponent err:' + err);
                    expect(false).assertTrue();
                    done();
                    return;
                }
                expect(component.componentType == JPEG).assertTrue();
                expect(component.byteBuffer != undefined).assertTrue();
                var bufferArr = new Uint8Array(component.byteBuffer);
                for (var i = 0; i < bufferArr.length; i += 4) {
                    bufferArr[i] = 0; //B
                    bufferArr[i + 1] = 0; //G
                    bufferArr[i + 2] = 255; //R
                    bufferArr[i + 3] = 255; //A
                }
                creator.queueImage(img, (err) => {
                    if (err) {
                        console.info('Creator_008 queueImage failerr: ' + err);
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info('Creator_008 queueImage Success');
                    expect(true).assertTrue();
                    var dummy = creator.test;
                })
            })
        })
    })

    /**
     * @tc.number    : Creator_008-1
     * @tc.name      : on-1
     * @tc.desc      : 1.create ImageCreator
     *                 2.call on
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_008-1', 0, async function (done) {
        onErr(done, 'Creator_008-1', 1);
    })

    /**
     * @tc.number    : Creator_008-2
     * @tc.name      : on-null
     * @tc.desc      : 1.create ImageCreator
     *                 2.call on
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_008-2', 0, async function (done) {
        onErr(done, 'Creator_008-2', null);
    })

    /**
     * @tc.number    : Creator_008-3
     * @tc.name      : on-{a : 1}
     * @tc.desc      : 1.create ImageCreator
     *                 2.call on
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_008-3', 0, async function (done) {
        onErr(done, 'Creator_008-3', { a: 1 });
    })

    /**
     * @tc.number    : Creator_008-4
     * @tc.name      : on-'a'
     * @tc.desc      : 1.create ImageCreator
     *                 2.call on
     * @tc.size      : MEDIUM 
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('Creator_008-4', 0, async function (done) {
        onErr(done, 'Creator_008-4', 'a');
    })
})