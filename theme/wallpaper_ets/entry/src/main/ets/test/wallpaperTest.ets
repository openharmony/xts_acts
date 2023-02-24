/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import wallpaper from '@ohos.wallpaper';
import image from '@ohos.multimedia.image';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';

const WALLPAPER_SYSTEM = 0;
const WALLPAPER_LOCKSCREEN = 1;
let imageSourceSystem = '/data/storage/el2/base/haps/wp.png';
let imageSourceLockscreen = '/data/storage/el2/base/haps/wp.png';

export default function wallpaperJSUnit() {
    describe('WallpaperJsunitTest', function () {

        /*
        * @tc.number  testWALLPAPER_SYSTEM
        * @tc.name    Test WALLPAPER_SYSTEM value
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testWALLPAPER_SYSTEM', 0, async function (done) {
            console.info('--------------testWALLPAPER_SYSTEM start-----------------');
            console.info('wallpaperXTS ===> testWALLPAPER_SYSTEM : ' +
            JSON.stringify(wallpaper.WallpaperType.WALLPAPER_SYSTEM));
            expect(wallpaper.WallpaperType.WALLPAPER_SYSTEM == 0).assertTrue();
            done();
            console.info('--------------testWALLPAPER_SYSTEM end-----------------');
        });

        /*
        * @tc.number  testWALLPAPER_LOCKSCREEN
        * @tc.name    Test WALLPAPER_LOCKSCREEN value
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testWALLPAPER_LOCKSCREEN', 0, async function (done) {
            console.info('--------------testWALLPAPER_LOCKSCREEN start-----------------');
            console.info('wallpaperXTS ===> testWALLPAPER_LOCKSCREEN : ' +
            JSON.stringify(wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN));
            expect(wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN == 1).assertTrue();
            done();
            console.info('--------------testWALLPAPER_LOCKSCREEN end-----------------');
        });

        /*
        * @tc.number  testGetColorsCallbackSystem101
        * @tc.name    Test getColors() to obtains the wallpaper colors for the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetColorsCallbackSystem101', 0, async function (done) {
            console.info('--------------testGetColorsCallbackSystem101 start-----------------');
            wallpaper.getColors(WALLPAPER_SYSTEM, (err, RgbaColors) => {
                let RgbaColor = {
                    red: 152,
                    green: 182,
                    blue: 211,
                    alpha: 255
                }
                try {
                    if (err) {
                        console.info('====>testGetColorsCallbackSystem101  fail: ' + JSON.stringify(err));
                        expect(null).assertFail();
                        done();
                    }
                    console.info('====>testGetColorsCallbackSystem101  succesful RgbaColors: ' + JSON.stringify(RgbaColors));
                    expect(Number.isInteger(RgbaColors[0].red)).assertTrue();
                    expect(Number.isInteger(RgbaColors[0].green)).assertTrue();
                    expect(Number.isInteger(RgbaColors[0].blue)).assertTrue();
                    expect(Number.isInteger(RgbaColors[0].alpha)).assertTrue();
                    done();
                } catch (err) {
                    console.info('====>testGetColorsCallbackSystem101  catch err: ' + JSON.stringify(err));
                    done();
                };
            });
            console.info('--------------testGetColorsCallbackSystem101 end-----------------');
        });

        /*
        * @tc.number  testGetColorsPromiseSystem101
        * @tc.name    Test getColors() to obtains the wallpaper colors for the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetColorsPromiseSystem101', 0, async function (done) {
            console.info('--------------testGetColorsPromiseSystem101 start-----------------');
            await wallpaper.getColors(WALLPAPER_SYSTEM).then((RgbaColors) => {
                console.info('====>testGetColorsPromiseSystem101  succesful RgbaColors: ' + JSON.stringify(RgbaColors));
                expect(Number.isInteger(RgbaColors[0].red)).assertTrue();
                expect(Number.isInteger(RgbaColors[0].green)).assertTrue();
                expect(Number.isInteger(RgbaColors[0].blue)).assertTrue();
                expect(Number.isInteger(RgbaColors[0].alpha)).assertTrue();
                done();
            }).catch((err) => {
                console.info('====>testGetColorsPromiseSystem101 fail: ' + JSON.stringify(err));
                expect().assertFail();
                done();
            });
            console.info('--------------testGetColorsPromiseSystem101 end-----------------');
        });

        /*
        * @tc.number  testGetColorsCallbackLock102
        * @tc.name    Test getColors() to obtains the wallpaper colors for the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetColorsCallbackLock102', 0, async function (done) {
            console.info('--------------testGetColorsCallbackLock102 start-----------------');
            wallpaper.getColors(WALLPAPER_LOCKSCREEN, (err, RgbaColors) => {
                try {
                    if (err) {
                        console.info('====>testGetColorsCallbackLock102  fail: ' + JSON.stringify(err));
                        expect(null).assertFail();
                        done();
                    }
                    console.info('====>testGetColorsCallbackLock102  succesful RgbaColors: ' + JSON.stringify(RgbaColors));
                    expect(Number.isInteger(RgbaColors[0].red)).assertTrue();
                    expect(Number.isInteger(RgbaColors[0].green)).assertTrue();
                    expect(Number.isInteger(RgbaColors[0].blue)).assertTrue();
                    expect(Number.isInteger(RgbaColors[0].alpha)).assertTrue();
                    done();
                } catch (err) {
                    console.info('====>testGetColorsCallbackLock102  catch err: ' + JSON.stringify(err));
                    done();
                };
            });
            console.info('--------------testGetColorsCallbackLock102 end-----------------');
        });

        /*
        * @tc.number  testGetColorsPromiseLock102
        * @tc.name    Test getColors() to obtains the wallpaper colors for the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetColorsPromiseLock102', 0, async function (done) {
            console.info('--------------testGetColorsPromiseLock102 start-----------------');
            await wallpaper.getColors(WALLPAPER_LOCKSCREEN).then((RgbaColors) => {
                console.info('====>testGetColorsPromiseLock102  succesful RgbaColors: ' + JSON.stringify(RgbaColors));
                expect(Number.isInteger(RgbaColors[0].red)).assertTrue();
                expect(Number.isInteger(RgbaColors[0].green)).assertTrue();
                expect(Number.isInteger(RgbaColors[0].blue)).assertTrue();
                expect(Number.isInteger(RgbaColors[0].alpha)).assertTrue();
                done();
            }).catch((err) => {
                console.info('====>testGetColorsPromiseLock102 fail: ' + JSON.stringify(err));
                expect().assertFail();
                done();
            });
            console.info('--------------testGetColorsPromiseLock102 end-----------------');
        })

        /*
        * @tc.number  testGetIdCallbackSystem101
        * @tc.name    Test getId() to the ID of the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetIdCallbackSystem101', 0, async function (done) {
            console.info('--------------testGetIdCallbackSystem101 start-----------------');
            wallpaper.getId(WALLPAPER_SYSTEM, (err, data) => {
                try {
                    if (err) {
                        console.info('====>testGetIdCallbackSystem101 err : ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testGetIdCallbackSystem101 successful data: ' + JSON.stringify(data));
                    expect(Number.isInteger(data)).assertTrue();
                    done();
                } catch (err) {
                    console.info('====>testGetIdCallbackSystem101 catch err : ' + JSON.stringify(err));
                    done();
                }
            });
            console.info('--------------testGetIdCallbackSystem101 end-----------------');
        });

        /*
        * @tc.number  testGetIdPromiseSystem101
        * @tc.name    Test getId() to the ID of the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetIdPromiseSystem101', 0, async function (done) {
            console.info('--------------testGetIdCallbackSystem101 start-----------------');
            await wallpaper.getId(WALLPAPER_SYSTEM).then((data) => {
                console.info('====>testGetIdCallbackSystem101 data : ' + JSON.stringify(data));
                expect(Number.isInteger(data)).assertTrue();
                done();
            }).catch((err) => {
                console.info('====>testGetIdCallbackSystem101 fail: ' + JSON.stringify(err));
                expect().assertFail();
                done();
            });
            console.info('--------------testGetIdCallbackSystem101 end-----------------');
        })

        /*
        * @tc.number  testGetIdCallbackLock102
        * @tc.name    Test getId() to the ID of the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetIdCallbackLock102', 0, async function (done) {
            console.info('--------------testGetIdCallbackLock102 start-----------------');
            wallpaper.getId(WALLPAPER_LOCKSCREEN, (err, data) => {
                try {
                    if (err) {
                        console.info('====>testGetIdCallbackLock102 err : ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testGetIdCallbackLock102 successful data: ' + JSON.stringify(data));
                    expect(Number.isInteger(data)).assertTrue();
                    done();
                } catch (err) {
                    console.info('====>testGetIdCallbackLock102 catch err : ' + JSON.stringify(err));
                    done();
                }
            });
            console.info('--------------testGetIdCallbackLock102 end-----------------');
        });

        /*
        * @tc.number  testGetIdPromiseLock102
        * @tc.name    Test getId() to the ID of the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetIdPromiseLock102', 0, async function (done) {
            console.info('--------------testGetIdPromiseLock102 start-----------------');
            await wallpaper.getId(WALLPAPER_LOCKSCREEN).then((data) => {
                console.info('====>testGetIdPromiseLock102 data : ' + JSON.stringify(data));
                expect(Number.isInteger(data)).assertTrue();
                done();
            }).catch((err) => {
                console.info('====>testGetIdPromiseLock102 fail: ' + JSON.stringify(err));
                expect().assertFail();
                done();
            });
            console.info('--------------testGetIdPromiseLock102 end-----------------');
        });



        /*
        * @tc.number  testGetMinHeightCallback101
        * @tc.name    Test getMinHeight() to the minimum width of the wallpaper.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetMinHeightCallback101', 0, async function (done) {
            console.info('--------------testGetMinHeightCallback101 start-----------------');
            wallpaper.getMinHeight((err, data) => {
                try {
                    if (err) {
                        console.info('====>testGetMinHeightCallback101 fail: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testGetMinHeightCallback101 successful data: ' + JSON.stringify(data));
                    expect(Number.isInteger(data)).assertTrue();
                    done();
                } catch (err) {
                    console.info('====>testGetMinHeightCallback101 catch err : ' + JSON.stringify(err));
                    done();
                }
            });
            console.info('--------------testGetMinHeightCallback101 end-----------------');
        });

        /*
        * @tc.number  testGetMinHeightPromise101
        * @tc.name    Test getMinHeight() to the minimum width of the wallpaper.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetMinHeightPromise101', 0, async function (done) {
            console.info('--------------testGetMinHeightPromise101 start-----------------');
            await wallpaper.getMinHeight().then((data) => {
                console.info('====>testGetMinHeightPromise101 successful data : ' + JSON.stringify(data));
                expect(Number.isInteger(data)).assertTrue();
                done();
            }).catch((err) => {
                console.info('====>testGetMinHeightPromise101 err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            });
            console.info('--------------testGetMinHeightPromise101 end-----------------');
        });

        /*
        * @tc.number  testGetMinWidthCallback101
        * @tc.name    Test getMinHeight() to the minimum width of the wallpaper.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetMinWidthCallback101', 0, async function (done) {
            console.info('--------------testGetMinWidthCallback101 start-----------------');
            wallpaper.getMinWidth((err, data) => {
                try {
                    if (err) {
                        console.info('====>testGetMinWidthCallback101 fail: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testGetMinWidthCallback101 successful data: ' + JSON.stringify(data));
                    expect(Number.isInteger(data)).assertTrue();
                    done();
                } catch (err) {
                    console.info('====>testGetMinWidthCallback101 catch err : ' + JSON.stringify(err));
                    done();
                }
            });
            console.info('--------------testGetMinWidthCallback101 end-----------------');
        });

        /*
        * @tc.number  testGetMinWidthPromise101
        * @tc.name    Test getMinHeight() to the minimum width of the wallpaper.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetMinWidthPromise101', 0, async function (done) {
            console.info('--------------testGetMinWidthPromise101 start-----------------');
            await wallpaper.getMinWidth().then((data) => {
                console.info('====>testGetMinWidthPromise101 successful data : ' + JSON.stringify(data));
                expect(Number.isInteger(data)).assertTrue();
                done();
            }).catch((err) => {
                console.info('====>testGetMinWidthPromise101 err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            });
            console.info('--------------testGetMinWidthPromise101 end-----------------');
        });

        /*
        * @tc.number  testIsChangePermittedCallback101
        * @tc.name    Test isChangePermitted() to checks whether to allow the application to change the
                    wallpaper for the current user.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testIsChangePermittedCallback101', 0, async function (done) {
            console.info('--------------testIsChangePermittedCallback101 start-----------------');
            wallpaper.isChangePermitted((err, data) => {
                try {
                    if (err) {
                        console.info('====>testIsChangePermittedCallback101 fail: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testIsChangePermittedCallback101 successful data: ' + JSON.stringify(data));
                    expect(typeof data == "boolean").assertTrue();
                    done();
                } catch (err) {
                    console.info('====>testIsChangePermittedCallback101 catch err : ' + JSON.stringify(err));
                    done();
                }
            })
            console.info('--------------testIsChangePermittedCallback101 end-----------------');
        });

        /*
        * @tc.number  testIsChangePermittedPromise101
        * @tc.name    Test isChangePermitted() to checks whether to allow the application to change the
                    wallpaper for the current user.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testIsChangePermittedPromise101', 0, async function (done) {
            console.info('--------------testIsChangePermittedPromise101 start-----------------');
            await wallpaper.isChangePermitted().then((data) => {
                console.info('====>testIsChangePermittedPromise101 successful data : ' + JSON.stringify(data));
                expect(typeof data == "boolean").assertTrue();
                done();
            }).catch((err) => {
                console.info('====>testIsChangePermittedPromise101 err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            });
            console.info('--------------testIsChangePermittedPromise101 end-----------------');
        });

        /*
        * @tc.number  testIsOperationAllowedCallback101
        * @tc.name    Test isOperationAllowed() to checks whether a user is allowed to set wallpapers.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testIsOperationAllowedCallback101', 0, async function (done) {
            console.info('--------------testIsOperationAllowedCallback101 start-----------------');
            wallpaper.isOperationAllowed((err, data) => {
                try {
                    if (err) {
                        console.info('====>testIsOperationAllowedCallback101 fail: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testIsOperationAllowedCallback101 successful data: ' + JSON.stringify(data));
                    expect(typeof data == "boolean").assertTrue();
                    done();
                } catch (err) {
                    console.info('====>testIsOperationAllowedCallback101 catch err : ' + JSON.stringify(err));
                    done();
                }
            })
            console.info('--------------testIsOperationAllowedCallback101 end-----------------');
        });

        /*
        * @tc.number  testIsOperationAllowedPromise101
        * @tc.name    Test isOperationAllowed() to checks whether a user is allowed to set wallpapers.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testIsOperationAllowedPromise101', 0, async function (done) {
            console.info('--------------testIsOperationAllowedPromise101 start-----------------');
            await wallpaper.isOperationAllowed().then((data) => {
                console.info('====>testIsOperationAllowedPromise101 successful data : ' + JSON.stringify(data));
                expect(typeof data == "boolean").assertTrue();
                done();
            }).catch((err) => {
                console.info('====>testIsOperationAllowedPromise101 err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            });
            console.info('--------------testIsOperationAllowedPromise101 end-----------------');
        });

        /*
        * @tc.number  testResetCallbackSystem101
        * @tc.name    Test reset() to removes a wallpaper of the specified type and restores the default one.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testResetCallbackSystem101', 0, async function (done) {
            console.info('--------------testResetCallbackSystem101 start-----------------');
            wallpaper.reset(WALLPAPER_SYSTEM, (err, data) => {
                try {
                    if (err) {
                        console.info('====>testResetCallbackSystem101 fail: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testResetCallbackSystem101 successful data: ' + JSON.stringify(data));
                    expect(true).assertTrue();
                    done();
                } catch (err) {
                    console.info('====>testResetCallbackSystem101 catch err : ' + JSON.stringify(err));
                    done();
                }
            })
            console.info('--------------testResetCallbackSystem101 end-----------------');
        });

        /*
        * @tc.number  testResetPromiseSystem101
        * @tc.name    Test reset() to removes a wallpaper of the specified type and restores the default one.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testResetPromiseSystem101', 0, async function (done) {
            console.info('--------------testResetPromiseSystem101 start-----------------');
            await wallpaper.reset(WALLPAPER_SYSTEM).then((data) => {
                console.info('====>testResetPromiseSystem101 successful data : ' + JSON.stringify(data));
                expect(true).assertTrue();
                done();
            }).catch((err) => {
                console.info('====>testResetPromiseSystem101 err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            });
            console.info('--------------testResetPromiseSystem101 end-----------------');
        });

        /*
        * @tc.number  testResetCallbackLock102
        * @tc.name    Test reset() to removes a wallpaper of the specified type and restores the default one.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testResetCallbackLock102', 0, async function (done) {
            console.info('--------------testResetCallbackLock102 start-----------------');
            wallpaper.reset(WALLPAPER_LOCKSCREEN, (err, data) => {
                try {
                    if (err) {
                        console.info('====>testResetCallbackLock102 fail: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testResetCallbackLock102 successful data: ' + JSON.stringify(data));
                    expect(true).assertTrue();
                    done();
                } catch (err) {
                    console.info('====>testResetCallbackLock102 catch err : ' + JSON.stringify(err));
                    done();
                }
            })
            console.info('--------------testResetCallbackLock102 end-----------------');
        });

        /*
        * @tc.number  testResetPromiseLock102
        * @tc.name    Test reset() to removes a wallpaper of the specified type and restores the default one.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testResetPromiseLock102', 0, async function (done) {
            console.info('--------------testResetPromiseLock102 start-----------------');
            await wallpaper.reset(WALLPAPER_LOCKSCREEN).then((data) => {
                console.info('====>testResetPromiseLock102 successful data : ' + JSON.stringify(data));
                expect(true).assertTrue();
                done();
            }).catch((err) => {
                console.info('====>testResetPromiseLock102 err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            });
            console.info('--------------testResetPromiseLock102 end-----------------');
        });

        /*
        * @tc.number  testSetWallpaperURLPromiseLock104
        * @tc.name    Test setPixelMap() to sets a wallpaper of the specified type based on the uri path from a
                    JPEG or PNG file or the pixel map of a PNG file.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testSetWallpaperURLPromiseLock104', 0, async function (done) {
            console.info('--------------------testSetWallpaperURLPromiseLock104 start------------------' );
            await wallpaper.setWallpaper(imageSourceLockscreen, WALLPAPER_LOCKSCREEN).then((data) => {
                console.info('====>testSetWallpaperURLPromiseLock104 successful data : ' + data);
                expect(true).assertTrue();
                done();
            }).catch((err) => {
                console.info('====>testSetWallpaperURLPromiseLock104 fail: ' + err);
                expect().assertFail();
                done();
            });
            console.info('--------------------testSetWallpaperURLPromiseLock104 end------------------' );
        });

        /*
        * @tc.number  testSetWallpaperURLCallbackSystem103
        * @tc.name    Test setWallpaper() to sets a wallpaper of the specified type based on the uri path from a
                    JPEG or PNG file or the pixel map of a PNG file.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testSetWallpaperURLCallbackSystem103', 0, async function (done) {
            console.info('--------------------testSetWallpaperURLCallbackSystem103 start------------------' );
            wallpaper.setWallpaper(imageSourceSystem, WALLPAPER_SYSTEM, (err, data) => {
                try{
                    if (err) {
                        console.info('====->testSetWallpaperURLCallbackSystem103 err : ' + err);
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testSetWallpaperURLCallbackSystem103 successful data: ' + data);
                    expect(true).assertTrue();
                    done();
                }catch(error){
                    console.info('testSetWallpaperURLCallbackSystem103 catch error: ' + error);
                    done();
                }
            });
            console.info('--------------------testSetWallpaperURLCallbackSystem103 end------------------' );
        });

        /*
        * @tc.number  testSetWallpaperURLPromiseSystem103
        * @tc.name    Test setWallpaper() to sets a wallpaper of the specified type based on the uri path from a
                    JPEG or PNG file or the pixel map of a PNG file.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testSetWallpaperURLPromiseSystem103', 0, async function (done) {
            console.info('--------------------testSetWallpaperURLPromiseSystem103 start------------------' );
            await wallpaper.setWallpaper(imageSourceLockscreen, WALLPAPER_LOCKSCREEN).then((data) => {
                console.info('====>testSetWallpaperURLPromiseSystem103 successful data : ' + data);
                expect(true).assertTrue();
                done();
            }).catch((err) => {
                console.info('====>testSetWallpaperURLPromiseSystem103 fail: ' + err);
                expect().assertFail();
                done();
            });
            console.info('--------------------testSetWallpaperURLPromiseSystem103 end------------------' );
        });

        /*
        * @tc.number  testSetWallpaperURLCallbackLock104
        * @tc.name    Test setWallpaper() to sets a wallpaper of the specified type based on the uri path from a
                    JPEG or PNG file or the pixel map of a PNG file.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testSetWallpaperURLCallbackLock104', 0, async function (done) {
            console.info('--------------------testSetWallpaperURLCallbackLock104 start------------------' );
            wallpaper.setWallpaper(imageSourceSystem, WALLPAPER_LOCKSCREEN, (err, data) => {
                try{
                    if (err) {
                        console.info('====->testSetWallpaperURLCallbackLock104 err : ' + err);
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testSetWallpaperURLCallbackLock104 successful data: ' + data);
                    expect(true).assertTrue();
                    done();
                }catch(error){
                    console.info('testSetWallpaperURLCallbackLock104 catch error: ' + error);
                    done();
                }
            });
            console.info('--------------------testSetWallpaperURLCallbackLock104 end------------------' );
        });

        /*
        * @tc.number  testOnCallback101
        * @tc.name    Test on_colorChange to registers a listener for wallpaper color changes to
                    receive notifications about the changes.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testOnCallback101', 0, async function (done) {
            console.info('--------------testOnCallback101 start-----------------');
            let wallpaperPath = "/data/storage/el2/base/haps/wp.png";
            await wallpaper.restore(wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN)
            try {
                wallpaper.on('colorChange', async (colors, wallpaperType) => {
                    try {
                        console.info('====>testOnCallback101 colors: ' + JSON.stringify(colors));
                        console.info('====>testOnCallback101 wallpaperType: ' + JSON.stringify(wallpaperType));
                        expect(colors != null).assertTrue();
                        expect(wallpaperType != null).assertTrue();
                        wallpaper.off('colorChange')
                        console.info('====>testOnCallback101 off');
                        done();
                    } catch (err) {
                        console.info('====>testOnCallback101 setImage or other err : ' + JSON.stringify(err));
                        done();
                    }
                });
            } catch (err) {
                console.info('====>testOnCallback101 catch err : ' + JSON.stringify(err));
                done();
            }
            await wallpaper.setImage(wallpaperPath, wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN)
            console.info('====>testOnCallback10 setImage successful');
            console.info('--------------testOnCallback101 end-----------------');
        });

        /*
        * @tc.number  testOffCallback101
        * @tc.name    Test on_colorChange to registers a listener for wallpaper color changes to
                    receive notifications about the changes.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testOffCallback101', 0, async function (done) {
            console.info('--------------testOffCallback101 start-----------------');
            let wallpaperPath = "/data/storage/el2/base/haps/wp.png";
            let callbackTimes = 0;
            await wallpaper.restore(wallpaper.WallpaperType.WALLPAPER_SYSTEM)
            try {
                wallpaper.on('colorChange', async (colors, wallpaperType) => {
                    try {
                        console.info('====>testOffCallback101 colors: ' + JSON.stringify(colors));
                        console.info('====>testOffCallback101 wallpaperType: ' + JSON.stringify(wallpaperType));
                        callbackTimes = callbackTimes + 1;
                        console.info('====>testOffCallback101 on callbackTime: ' + callbackTimes);
                        expect(callbackTimes == 1).assertTrue();
                        wallpaper.off('colorChange');
                        setTimeout(() => {
                            done();
                        }, 3000)
                    } catch (err) {
                        console.info('====>testOffCallback101 setImage or other err : ' + JSON.stringify(err));
                        done();
                    }
                });
            } catch (err) {
                console.info('====>testOffCallback101 catch err : ' + JSON.stringify(err));
                done();
            }
            await wallpaper.setImage(wallpaperPath, wallpaper.WallpaperType.WALLPAPER_SYSTEM)
            await wallpaper.restore(wallpaper.WallpaperType.WALLPAPER_SYSTEM)
            await wallpaper.setImage(wallpaperPath, wallpaper.WallpaperType.WALLPAPER_SYSTEM)
            console.info('====>testOffCallback101 setImage successful');
            console.info('--------------testOffCallback101 end-----------------');
        });

        /*
        * @tc.number  testGetFileCallback101
        * @tc.name    Obtains a file of the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetFileCallback101', 0, async function (done) {
            console.info('--------------testGetFileCallback101 start-----------------');
            wallpaper.getFile(WALLPAPER_SYSTEM, (err, data) => {
                try {
                    if (err) {
                        console.info('====>testGetFileCallback101 fail: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testGetFileCallback101 successful data: ' + JSON.stringify(data));
                    expect(Number.isInteger(data)).assertTrue();
                    done();
                } catch (err) {
                    console.info('====>testGetFileCallback101 catch err : ' + JSON.stringify(err));
                    done();
                }
            });
            console.info('--------------testGetFileCallback101 end-----------------');
        });

        /*
        * @tc.number  testGetFilePromise101
        * @tc.name    Obtains a file of the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetFilePromise101', 0, async function (done) {
            console.info('--------------testGetFilePromise101 start-----------------');
            await wallpaper.getFile(WALLPAPER_LOCKSCREEN).then((data) => {
                console.info('====>testGetFilePromise101 successful data : ' + JSON.stringify(data));
                expect(Number.isInteger(data)).assertTrue();
                done();
            }).catch((err) => {
                console.info('====>testGetFilePromise101 err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            });
            console.info('--------------testGetFilePromise101 end-----------------');
        });

        /*
        * @tc.number  testGetColorsSync101
        * @tc.name    Test getColorsSync() to obtains the wallpaper colors for the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetColorsSync101', 0, async function (done) {
            console.info('------------------testGetColorsSync101 start----------------------');
            let colors = null;
            try{
                colors = wallpaper.getColorsSync(WALLPAPER_SYSTEM)
                console.info('wallpaperXTS ===> testGetColorsSync101 data : ' + JSON.stringify(colors));
                if (colors.length >= 1) {
                    expect(true).assertTrue();
                    done()
                }else{
                    expect().assertFail();
                    done()
                }
            }catch(err){
                console.info('wallpaperXTS ===> testGetColorsSync101 err : ' + JSON.stringify(err));
                expect().assertFail();
                done()
            }
            console.info('------------------testGetColorsSync101 end----------------------');
            done()
        })

        /*
        * @tc.number  testGetColorsSync102
        * @tc.name    Test getColorsSync() to obtains the wallpaper colors for the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetColorsSync102', 0, async function (done) {
            console.info('------------------testGetColorsSync102 start----------------------');
            let colors = null;
            try{
                colors = wallpaper.getColorsSync(WALLPAPER_LOCKSCREEN)
                console.info('====>testGetColorsSync102 data : ' + JSON.stringify(colors));
                if (colors.length >= 1) {
                    expect(true).assertTrue();
                    done()
                }else{
                    expect().assertFail();
                    done()
                }
            }catch(err){
                console.info('====>testGetColorsSync102 err : ' + JSON.stringify(err));
                expect().assertFail();
                done()
            }
            console.info('------------------testGetColorsSync102 end----------------------');
        })

        /*
        * @tc.number  testGetIdSync101
        * @tc.name    Test getIdSync() to Obtains the ID of the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetIdSync101', 0, async function (done) {
            console.info('------------------testGetIdSync101 start----------------------');
            let number = null;
            try{
                number = wallpaper.getIdSync(WALLPAPER_SYSTEM)
                console.info('====>testGetIdSync101 data : ' + JSON.stringify(number));
                if (typeof number == "number") {
                    expect(true).assertTrue();
                    done()
                }else{
                    expect().assertFail();
                    done()
                }
            }catch(err){
                console.info('====>testGetIdSync101 err : ' + JSON.stringify(err));
                expect().assertFail();
                done()
            }
            console.info('------------------testGetIdSync101 end----------------------');
        })

        /*
        * @tc.number  testGetIdSync102
        * @tc.name    Test getIdSync() to Obtains the ID of the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetIdSync102', 0, async function (done) {
            console.info('------------------testGetIdSync102 start----------------------');
            let number = null;
            try{
                number = wallpaper.getIdSync(WALLPAPER_LOCKSCREEN)
                console.info('====>testGetIdSync102 data : ' + JSON.stringify(number));
                if (typeof number == "number") {
                    expect(true).assertTrue();
                    done()
                }else{
                    expect().assertFail();
                    done()
                }
            }catch(err){
                console.info('====>testGetIdSync102 err : ' + JSON.stringify(err));
                expect().assertFail();
                done()
            }
            console.info('------------------testGetIdSync102 end----------------------');
        })

        /*
        * @tc.number  testGetFileSync101
        * @tc.name    Test getFileSync() to Obtains a file of the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetFileSync101', 0, async function (done) {
            console.info('------------------testGetFileSync101 start----------------------');
            let number = null;
            try{
                number = wallpaper.getFileSync(WALLPAPER_SYSTEM)
                console.info('====>testGetFileSync101 data : ' + JSON.stringify(number));
                if (typeof number == "number") {
                    expect(true).assertTrue();
                    done()
                }else{
                    expect().assertFail();
                    done()
                }
            }catch(err){
                console.info('====>testGetFileSync101 err : ' + JSON.stringify(err));
                expect().assertFail();
                done()
            }
            console.info('------------------testGetFileSync101 end----------------------');
        })

        /*
        * @tc.number  testGetFileSync102
        * @tc.name    Test getFileSync() to Obtains a file of the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetFileSync102', 0, async function (done) {
            console.info('------------------testGetFileSync102 start----------------------');
            let number = null;
            try{
                number = wallpaper.getFileSync(WALLPAPER_LOCKSCREEN)
                console.info('====>testGetFileSync102 data : ' + JSON.stringify(number));
                if (typeof number == "number") {
                    expect(true).assertTrue();
                    done()
                }else{
                    expect().assertFail();
                    done()
                }
            }catch(err){
                console.info('====>testGetFileSync102 err : ' + JSON.stringify(err));
                expect().assertFail();
                done()
            }
            console.info('------------------testGetFileSync102 end----------------------');
        })

        /*
        * @tc.number  testGetFileSync103
        * @tc.name    Test getFileSync() to Obtains a file of the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetFileSync103', 0, async function (done) {
            console.info('------------------testGetFileSync103 start----------------------');
            let number = null;
            try{
                number = wallpaper.getFileSync(3)
                console.info('====>testGetFileSync103 data : ' + JSON.stringify(number));
                if (typeof number == "number") {
                    expect(true).assertTrue();
                    done()
                }else{
                    expect().assertFail();
                    done()
                }
            }catch(err){
                console.info('====>testGetFileSync103 err : ' + JSON.stringify(err));
                console.info('====>testGetFileSync103 (err.code : ' + err.code);
                expect(err.code == "401").assertTrue();
                done()
            }
            console.info('------------------testGetFileSync103 end----------------------');
        })

        /*
        * @tc.number  testGetMinHeightSync101
        * @tc.name    Test getMinHeightSync() to Obtains the minimum height of the wallpaper.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetMinHeightSync101', 0, async function (done) {
            console.info('------------------testGetMinHeightSync101 start----------------------');
            let number = null;
            try{
                number = wallpaper.getMinHeightSync()
                console.info('====>testGetMinHeightSync101 data : ' + JSON.stringify(number));
                if (typeof number == "number") {
                    expect(true).assertTrue();
                    done()
                }else{
                    expect().assertFail();
                    done()
                }
            }catch(err){
                console.info('====>testGetMinHeightSync101 err : ' + JSON.stringify(err));
                expect().assertFail();
                done()
            }
            console.info('------------------testGetMinHeightSync101 end----------------------');
            done()
        })

        /*
        * @tc.number  testGetMinWidthSync101
        * @tc.name    Test getMinWidthSync() to Obtains the minimum width of the wallpaper.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetMinWidthSync101', 0, async function (done) {
            console.info('------------------testGetMinWidthSync101 start----------------------');
            let number = null;
            try{
                number = wallpaper.getMinWidthSync()
                console.info('====>testGetMinWidthSync101 data : ' + JSON.stringify(number));
                if (typeof number == "number") {
                    expect(true).assertTrue();
                    done()
                }else{
                    expect().assertFail();
                    done()
                }
            }catch(err){
                console.info('====>testGetMinWidthSync101 err : ' + JSON.stringify(err));
                expect().assertFail();
                done()
            }
            console.info('------------------testGetMinWidthSync101 end----------------------');
        })

        /*
        * @tc.number  testIsChangeAllowed101
        * @tc.name    Test isChangeAllowed() to Checks whether to allow the application to change the wallpaper for the current user.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testIsChangeAllowed101', 0, async function (done) {
            console.info('------------------testIsChangeAllowed101 start----------------------');
            let allow = null;
            try{
                allow = wallpaper.isChangeAllowed()
                console.info('====>testIsChangeAllowed101 data : ' + JSON.stringify(allow));
                if (typeof allow == "boolean") {
                    expect(true).assertTrue();
                    done()
                }else{
                    expect().assertFail();
                    done()
                }
            }catch(err){
                console.info('====>testIsChangeAllowed101 err : ' + JSON.stringify(err));
                expect().assertFail();
                done()
            }
            console.info('------------------testIsChangeAllowed101 end----------------------');
        })

        /*
        * @tc.number  testIsChangeAllowed101
        * @tc.name    Test isUserChangeAllowed() to Checks whether a user is allowed to set wallpapers.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testIsUserChangeAllowed101', 0, async function (done) {
            console.info('------------------testIsUserChangeAllowed101 start----------------------');
            let allow = null;
            try{
                allow = wallpaper.isUserChangeAllowed()
                console.info('====>testIsUserChangeAllowed101 data : ' + JSON.stringify(allow));
                if (typeof allow == "boolean") {
                    expect(true).assertTrue();
                    done()
                }else{
                    expect().assertFail();
                    done()
                }
            }catch(err){
                console.info('====>testIsUserChangeAllowed101 err : ' + JSON.stringify(err));
                expect().assertFail();
                done()
            }
            console.info('------------------testIsUserChangeAllowed101 end----------------------');
            done()
        })

        /*
        * @tc.number  testRestoreCallback101
        * @tc.name    Test restore() to removes a wallpaper of the specified type and restores the default one.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testRestoreCallback101', 0, async function (done) {
            console.info('------------------testRestoreCallback101 start----------------------');
            wallpaper.restore(WALLPAPER_LOCKSCREEN, function (err, data) {
                try{
                    console.info('====>testRestoreCallback101 data : ' + data);
                    if (err) {
                        console.info('====>testRestoreCallback101 fail: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    console.info('====>testRestoreCallback101 restore success');
                    expect(true).assertTrue();
                    done();
                }catch(err){
                    console.info('====>testRestoreCallback101 catch err : ' + JSON.stringify(err));
                    done();
                }
            });
            console.info('------------------testRestoreCallback101 end----------------------');
        })

        /*
        * @tc.number  testRestorePromise101
        * @tc.name    Test restore() to removes a wallpaper of the specified type and restores the default one.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testRestorePromise101', 0, async function (done) {
            console.info('------------------testRestorePromise101 start----------------------');
            await wallpaper.restore(WALLPAPER_SYSTEM).then((data) => {
                console.info('====>testRestorePromise101 data : ' + JSON.stringify(data));
                console.info('====>testRestorePromise101 restore success');
                expect(true).assertTrue();
                done()
            }).catch((err) => {
                console.info('====>testRestorePromise101 fail: ' + JSON.stringify(err));
                expect().assertFail();
                done();
            });
            console.info('------------------testRestorePromise101 end----------------------');
        })

        /*
        * @tc.number  testSetImageCallBack101
        * @tc.name    Test setImage() to removes a wallpaper of the specified type and restores the default one.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testSetImageCallBack101', 0, async function (done) {
            console.info('------------------testSetImageCallBack101 start----------------------');
            let wallpaperPath = "/data/storage/el2/base/haps/wp.png";
            wallpaper.setImage(wallpaperPath, wallpaper.WallpaperType.WALLPAPER_SYSTEM, (error, data) => {
                try{
                    if (error) {
                        console.error(`====>testSetImageCallBack101 failed to setImage because: ` + JSON.stringify(error));
                        expect().assertFail();
                        done();
                    }
                    console.log(`====>testSetImageCallBack101 success to setImage.`);
                    expect(true).assertTrue();
                    done();
                }catch(err){
                    console.info('====>testSetImageCallBack101 catch err : ' + JSON.stringify(err));
                    done();
                }
            });
            console.info('------------------testSetImageCallBack101 end----------------------');
        })

        /*
        * @tc.number  testSetImageCallBack102
        * @tc.name    Test setImage() to removes a wallpaper of the specified type and restores the default one.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testSetImageCallBack102', 0, async function (done) {
            console.info('------------------testSetImageCallBack102 start----------------------');
            let wallpaperPath = "/data/storage/el2/base/haps/wp.png";
            wallpaper.setImage(wallpaperPath, wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN, (error, data) => {
                try{
                    if (error) {
                        console.error(`====>testSetImageCallBack102 failed to setImage because: ` + JSON.stringify(error));
                        expect().assertFail();
                        done();
                    }
                    console.log(`====>testSetImageCallBack102 success to setImage.`);
                    expect(true).assertTrue();
                    done();
                }catch(err){
                    console.info('====>testSetImageCallBack102 catch err : ' + JSON.stringify(err));
                    done();
                }
            });
            console.info('------------------testSetImageCallBack102 end----------------------');
        })

        /*
        * @tc.number  testSetImagePromise101
        * @tc.name    Test setImage() to removes a wallpaper of the specified type and restores the default one.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testSetImagePromise101', 0, async function (done) {
            console.info('------------------testSetImagePromise101 start----------------------');
            let wallpaperPath = "/data/storage/el2/base/haps/wp.png";
            await wallpaper.setImage(wallpaperPath, wallpaper.WallpaperType.WALLPAPER_SYSTEM).then((data) => {
                console.log(`====>testSetImagePromise101 success to setImage.`);
                expect(true).assertTrue();
                done();
            }).catch(err => {
                expect().assertFail();
                console.log(`====>testSetImagePromise101 promise fail: ` + JSON.stringify(err));
            });
            console.info('------------------testSetImagePromise101 end----------------------');
        })

        /*
        * @tc.number  testSetImagePromise102
        * @tc.name    Test setImage() to removes a wallpaper of the specified type and restores the default one.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testSetImagePromise102', 0, async function (done) {
            console.info('------------------testSetImagePromise102 start----------------------');
            let wallpaperPath = "/data/storage/el2/base/haps/wp.png";
            await wallpaper.setImage(wallpaperPath, wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN).then((data) => {
                console.log(`====>testSetImagePromise102 success to setImage.`);
                expect(true).assertTrue();
                done();
            }).catch(err => {
                console.log(`====>testSetImagePromise102 promise catch: ` + JSON.stringify(err));
                expect().assertFail();
                done()
            });
            console.info('------------------testSetImagePromise102 end----------------------');
        })

    });
};
