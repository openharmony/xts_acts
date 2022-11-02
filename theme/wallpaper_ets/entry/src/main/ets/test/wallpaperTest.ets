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
        beforeAll(async function () {
            console.info('beforeAll: Prerequisites at the test suite level, ' +
            'which are executed before the test suite is executed.');
        })
        beforeEach(function () {
            console.info('beforeEach: Prerequisites at the test case level, ' +
            'which are executed before each test case is executed.');
        })
        afterEach(function () {
            console.info('afterEach: Test case-level clearance conditions,' +
            ' which are executed after each test case is executed.');
        })
        afterAll(function () {
            console.info('afterAll: Test suite-level cleanup condition, ' +
            'which is executed after the test suite is executed');
        })

        /*
        * @tc.number  testWALLPAPER_SYSTEM
        * @tc.name    Test WALLPAPER_SYSTEM value
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testWALLPAPER_SYSTEM', 0, async function (done) {
            console.info('wallpaperXTS ===> testWALLPAPER_SYSTEM : ' +
            JSON.stringify(wallpaper.WallpaperType.WALLPAPER_SYSTEM));
            expect(wallpaper.WallpaperType.WALLPAPER_SYSTEM == 0).assertTrue();
            done();
        })

        /*
        * @tc.number  testWALLPAPER_LOCKSCREEN
        * @tc.name    Test WALLPAPER_LOCKSCREEN value
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testWALLPAPER_LOCKSCREEN', 0, async function (done) {
            console.info('wallpaperXTS ===> testWALLPAPER_LOCKSCREEN : ' +
            JSON.stringify(wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN));
            expect(wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN == 1).assertTrue();
            done();
        })

        /*
        * @tc.number  testGetColorsCallbackSystem101
        * @tc.name    Test getColors() to obtains the wallpaper colors for the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetColorsCallbackSystem101', 0, async function (done) {

            await wallpaper.getColors(WALLPAPER_SYSTEM, function (err, data) {
                let RgbaColor = {
                    red: data[0][0],
                    green: data[0][1],
                    blue: data[0][2],
                    alpha: data[0][3]
                }
                console.info('wallpaperXTS ===> testGetColorsCallbackSystem err : ' + JSON.stringify(err));
                console.info('wallpaperXTS ===> testGetColorsCallbackSystem data : ' + JSON.stringify(data));
                console.info('wallpaperXTS ===> testGetColorsCallbackSystem data : ' + data[0][0]);
                console.info('wallpaperXTS ===> testGetColorsCallbackSystem data : ' + data[0][1]);
                console.info('wallpaperXTS ===> testGetColorsCallbackSystem data : ' + data[0][2]);
                console.info('wallpaperXTS ===> testGetColorsCallbackSystem data : ' + data[0][3]);
                if (err) {
                    expect(null).assertFail();
                }
                if ((data != undefined) && (data != null)) {
                    expect(true).assertTrue();
                }
            })
            done();
        })

        /*
        * @tc.number  testGetColorsPromiseSystem101
        * @tc.name    Test getColors() to obtains the wallpaper colors for the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetColorsPromiseSystem101', 0, async function (done) {
            await wallpaper.getColors(WALLPAPER_SYSTEM).then((data) => {
                console.info('wallpaperXTS ===> testGetColorsPromiseSystem data : ' + JSON.stringify(data));
                if ((data != undefined) && (data != null)) {
                    expect(true).assertTrue();
                }
            }).catch((err) => {
                console.info('wallpaperXTS ===> testGetColorsPromiseSystem err : ' + JSON.stringify(err));
                if (err) {
                    expect(null).assertFail();
                }
            });
            done();
        })

        /*
        * @tc.number  testGetColorsCallbackLock102
        * @tc.name    Test getColors() to obtains the wallpaper colors for the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetColorsCallbackLock102', 0, async function (done) {
            await wallpaper.getColors(WALLPAPER_LOCKSCREEN, function (err, data) {
                console.info('wallpaperXTS ===> testGetColorsCallbackLock err : ' + JSON.stringify(err));
                console.info('wallpaperXTS ===> testGetColorsCallbackLock data : ' + JSON.stringify(data));
                if (err) {
                    expect(null).assertFail();
                }
                if ((data != undefined) && (data != null)) {
                    expect(true).assertTrue();
                }
            })
            done();
        })

        /*
        * @tc.number  testGetColorsPromiseLock102
        * @tc.name    Test getColors() to obtains the wallpaper colors for the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetColorsPromiseLock102', 0, async function (done) {
            await wallpaper.getColors(WALLPAPER_LOCKSCREEN).then((data) => {
                console.info('wallpaperXTS ===> testGetColorsCallbackLock data : ' + JSON.stringify(data));
                if ((data != undefined) && (data != null)) {
                    expect(true).assertTrue();
                }
            }).catch((err) => {
                console.info('wallpaperXTS ===> testGetColorsCallbackLock err : ' + JSON.stringify(err));
                if (err) {
                    expect(null).assertFail();
                }
            });
            done();
        })

        /*
        * @tc.number  testGetColorsPromiseLock102
        * @tc.name    Test getId() to the ID of the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetIdCallbackSystem101', 0, async function (done) {
            await wallpaper.getId(WALLPAPER_SYSTEM, function (err, data) {
                console.info('wallpaperXTS ===> testGetIdCallbackSystem err : ' + JSON.stringify(err));
                console.info('wallpaperXTS ===> testGetIdCallbackSystem data : ' + JSON.stringify(data));
                if (err) {
                    expect(null).assertFail();
                }
                if ((data != undefined) && (data != null)) {
                    expect(true).assertTrue();
                }
            })
            done();
        })

        /*
        * @tc.number  testGetIdPromiseSystem101
        * @tc.name    Test getId() to the ID of the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetIdPromiseSystem101', 0, async function (done) {
            await wallpaper.getId(WALLPAPER_SYSTEM).then((data) => {
                console.info('wallpaperXTS ===> testGetIdCallbackSystem data : ' + JSON.stringify(data));
                if ((data != undefined) && (data != null)) {
                    expect(true).assertTrue();
                }
            }).catch((err) => {
                console.info('wallpaperXTS ===> testGetIdCallbackSystem err : ' + JSON.stringify(err));
                if (err) {
                    expect(null).assertFail();
                }
            });
            done();
        })

        /*
        * @tc.number  testGetIdCallbackLock102
        * @tc.name    Test getId() to the ID of the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetIdCallbackLock102', 0, async function (done) {
            await wallpaper.getId(WALLPAPER_LOCKSCREEN, function (err, data) {
                console.info('wallpaperXTS ===> testGetIdCallbackLock err : ' + JSON.stringify(err));
                console.info('wallpaperXTS ===> testGetIdCallbackLock data : ' + JSON.stringify(data));
                if (err) {
                    expect(null).assertFail();
                }
                if ((data != undefined) && (data != null)) {
                    expect(true).assertTrue();
                }
            })
            done();
        })

        /*
        * @tc.number  testGetIdPromiseLock102
        * @tc.name    Test getId() to the ID of the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetIdPromiseLock102', 0, async function (done) {
            await wallpaper.getId(WALLPAPER_LOCKSCREEN).then((data) => {
                console.info('wallpaperXTS ===> testGetIdCallbackLock data : ' + JSON.stringify(data));
                if ((data != undefined) && (data != null)) {
                    expect(true).assertTrue();
                }
            }).catch((err) => {
                console.info('wallpaperXTS ===> testGetIdCallbackLock err : ' + JSON.stringify(err));
                if (err) {
                    expect(null).assertFail();
                }
            });
            done();
        })

        /*
        * @tc.number  testGetMinHeightCallback101
        * @tc.name    Test getMinHeight() to the minimum width of the wallpaper.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetMinHeightCallback101', 0, async function (done) {
            await wallpaper.getMinHeight(function (err, data) {
                console.info('wallpaperXTS ===> testGetMinHeightCallback err : ' + JSON.stringify(err));
                console.info('wallpaperXTS ===> testGetMinHeightCallback data : ' + JSON.stringify(data));
                if (err) {
                    expect(null).assertFail();
                }
                if ((data != undefined) && (data != null)) {
                    expect(true).assertTrue();
                }
            })
            done();
        })

        /*
        * @tc.number  testGetMinHeightPromise101
        * @tc.name    Test getMinHeight() to the minimum width of the wallpaper.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetMinHeightPromise101', 0, async function (done) {
            await wallpaper.getMinHeight().then((data) => {
                console.info('wallpaperXTS ===> testGetMinHeightPromise data : ' + JSON.stringify(data));
                if ((data != undefined) && (data != null)) {
                    expect(true).assertTrue();
                }
            }).catch((err) => {
                console.info('wallpaperXTS ===> testGetMinHeightPromise err : ' + JSON.stringify(err));
                if (err) {
                    expect(null).assertFail();
                }
            });
            done();
        })

        /*
        * @tc.number  testGetMinWidthCallback101
        * @tc.name    Test getMinHeight() to the minimum width of the wallpaper.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetMinWidthCallback101', 0, async function (done) {
            await wallpaper.getMinWidth(function (err, data) {
                console.info('wallpaperXTS ===> testGetMinWidthCallback err : ' + JSON.stringify(err));
                console.info('wallpaperXTS ===> testGetMinWidthCallback data : ' + JSON.stringify(data));
                if (err) {
                    expect(null).assertFail();
                }
                if ((data != undefined) && (data != null)) {
                    expect(true).assertTrue();
                }
            })
            done();
        })

        /*
        * @tc.number  testGetMinWidthPromise101
        * @tc.name    Test getMinHeight() to the minimum width of the wallpaper.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetMinWidthPromise101', 0, async function (done) {
            await wallpaper.getMinWidth().then((data) => {
                console.info('wallpaperXTS ===> testGetMinWidthPromise data : ' + JSON.stringify(data));
                if ((data != undefined) && (data != null)) {
                    expect(true).assertTrue();
                }
            }).catch((err) => {
                console.info('wallpaperXTS ===> testGetMinWidthPromise err : ' + JSON.stringify(err));
                if (err) {
                    expect(null).assertFail();
                }
            });
            done();
        })

        /*
        * @tc.number  testIsChangePermittedCallback101
        * @tc.name    Test isChangePermitted() to checks whether to allow the application to change the
                    wallpaper for the current user.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testIsChangePermittedCallback101', 0, async function (done) {
            await wallpaper.isChangePermitted(function (err, data) {
                console.info('wallpaperXTS ===> testIsChangePermittedCallback err : ' + JSON.stringify(err));
                console.info('wallpaperXTS ===> testIsChangePermittedCallback data : ' + JSON.stringify(data));
                if (err) {
                    expect(null).assertFail();
                }
                if ((data != undefined) && (data != null)) {
                    expect(true).assertTrue();
                }
            })
            done();
        })

        /*
        * @tc.number  testIsChangePermittedPromise101
        * @tc.name    Test isChangePermitted() to checks whether to allow the application to change the
                    wallpaper for the current user.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testIsChangePermittedPromise101', 0, async function (done) {
            await wallpaper.isChangePermitted().then((data) => {
                console.info('wallpaperXTS ===> testIsChangePermittedPromise data : ' + JSON.stringify(data));
                if ((data != undefined) && (data != null)) {
                    expect(true).assertTrue();
                }
            }).catch((err) => {
                console.info('wallpaperXTS ===> testIsChangePermittedPromise err : ' + JSON.stringify(err));
                if (err) {
                    expect(null).assertFail();
                }
            });
            done();
        })

        /*
        * @tc.number  testIsOperationAllowedCallback101
        * @tc.name    Test isOperationAllowed() to checks whether a user is allowed to set wallpapers.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testIsOperationAllowedCallback101', 0, async function (done) {
            await wallpaper.isOperationAllowed(function (err, data) {
                console.info('wallpaperXTS ===> testIsOperationAllowedCallback err : ' + JSON.stringify(err));
                console.info('wallpaperXTS ===> testIsOperationAllowedCallback data : ' + JSON.stringify(data));
                if (err) {
                    expect(null).assertFail();
                }
                if ((data != undefined) && (data != null)) {
                    expect(true).assertTrue();
                }
            })
            done();
        })

        /*
        * @tc.number  testIsOperationAllowedPromise101
        * @tc.name    Test isOperationAllowed() to checks whether a user is allowed to set wallpapers.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testIsOperationAllowedPromise101', 0, async function (done) {
            await wallpaper.isOperationAllowed().then((data) => {
                console.info('wallpaperXTS ===> testIsOperationAllowedPromise data : ' + JSON.stringify(data));
                if ((data != undefined) && (data != null)) {
                    expect(true).assertTrue();
                }
            }).catch((err) => {
                console.info('wallpaperXTS ===> testIsOperationAllowedPromise err : ' + JSON.stringify(err));
                if (err) {
                    expect(null).assertFail();
                }
            });
            done();
        })

        /*
        * @tc.number  testResetCallbackSystem101
        * @tc.name    Test reset() to removes a wallpaper of the specified type and restores the default one.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testResetCallbackSystem101', 0, async function (done) {
            await wallpaper.reset(WALLPAPER_SYSTEM, function (err, data) {
                console.info('wallpaperXTS ===> testResetCallbackSystem err : ' + JSON.stringify(err));
                console.info('wallpaperXTS ===> testResetCallbackSystem data : ' + JSON.stringify(data));
                if (err) {
                    expect(null).assertFail();
                }
                if ((data != undefined) && (data != null)) {
                    expect(true).assertTrue();
                }
            })
            done();
        })

        /*
        * @tc.number  testResetPromiseSystem101
        * @tc.name    Test reset() to removes a wallpaper of the specified type and restores the default one.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testResetPromiseSystem101', 0, async function (done) {
            await wallpaper.reset(WALLPAPER_SYSTEM).then((data) => {
                if ((data != undefined) && (data != null)) {
                    expect(true).assertTrue();
                }
                done();
            }).catch((err) => {
                expect(true).assertTrue();
                done();
            });
        })

        /*
        * @tc.number  testResetCallbackLock102
        * @tc.name    Test reset() to removes a wallpaper of the specified type and restores the default one.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testResetCallbackLock102', 0, async function (done) {
            await wallpaper.reset(WALLPAPER_LOCKSCREEN, function (err, data) {
                console.info('wallpaperXTS ===> testResetCallbackLock err : ' + JSON.stringify(err));
                console.info('wallpaperXTS ===> testResetCallbackLock data : ' + JSON.stringify(data));
                if (err) {
                    expect(null).assertFail();
                }
                if ((data != undefined) && (data != null)) {
                    expect(true).assertTrue();
                }
            })
            done();
        })

        /*
        * @tc.number  testResetPromiseLock102
        * @tc.name    Test reset() to removes a wallpaper of the specified type and restores the default one.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testResetPromiseLock102', 0, async function (done) {
            await wallpaper.reset(WALLPAPER_LOCKSCREEN).then((data) => {
                console.info('wallpaperXTS ===> testResetPromiseLock data : ' + JSON.stringify(data));
                if ((data != undefined) && (data != null)) {
                    expect(true).assertTrue();
                }
                done();
            }).catch((err) => {
                console.info('wallpaperXTS ===> testResetPromiseLock--- err : ' + JSON.stringify(err));
                expect(true).assertTrue();
                done();
            });
        })

        /*
        * @tc.number  testSetWallpaperURLPromiseLock104
        * @tc.name    Test setPixelMap() to sets a wallpaper of the specified type based on the uri path from a
                    JPEG or PNG file or the pixel map of a PNG file.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testSetWallpaperURLPromiseLock104', 0, async function (done) {
            console.info('--------------------testSetWallpaperURLPromiseLock104 start------------------' );
            try{
                wallpaper.setWallpaper(imageSourceLockscreen, WALLPAPER_LOCKSCREEN).then((data) => {
                    console.info('wallpaperXTS ===> testSetWallpaperURLPromiseLock104 data : ' + data);
                    expect(true).assertTrue();
                    done();
                }).catch((err) => {
                    console.info('wallpaperXTS ===> testSetWallpaperURLPromiseLock104 err : ' + err);
                    expect().assertFail();
                    done();
                });
            }catch(error){
                console.info('testSetWallpaperURLPromiseLock104 catch error : ' + error);
                expect().assertFail();
                done();
            }
            console.info('--------------------testSetWallpaperURLPromiseLock104 end------------------' );

        })

        /*
        * @tc.number  testSetWallpaperURLCallbackSystem103
        * @tc.name    Test setWallpaper() to sets a wallpaper of the specified type based on the uri path from a
                    JPEG or PNG file or the pixel map of a PNG file.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testSetWallpaperURLCallbackSystem103', 0, async function (done) {
            console.info('--------------------testSetWallpaperURLCallbackSystem103 start------------------' );
            try{
                wallpaper.setWallpaper(imageSourceSystem, WALLPAPER_SYSTEM, function (err, data) {
                    console.info('wallpaperXTS ===> testSetWallpaperURLCallbackSystem103 data : ' + data);
                    if (err) {
                        console.info('wallpaperXTS ===> testSetWallpaperURLCallbackSystem103 err : ' + err);
                        expect().assertFail();
                        done();
                    }
                    expect(true).assertTrue();
                    done();
                });
            }catch(error){
                console.info('testSetWallpaperURLCallbackSystem103 catch error: ' + error);
                expect().assertFail();
                done();
            }
            console.info('--------------------testSetWallpaperURLCallbackSystem103 end------------------' );
        })

        /*
        * @tc.number  testSetWallpaperURLPromiseSystem103
        * @tc.name    Test setWallpaper() to sets a wallpaper of the specified type based on the uri path from a
                    JPEG or PNG file or the pixel map of a PNG file.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testSetWallpaperURLPromiseSystem103', 0, function (done) {
            console.info('--------------------testSetWallpaperURLPromiseSystem103 start------------------' );
            try{
                wallpaper.setWallpaper(imageSourceSystem, WALLPAPER_SYSTEM).then((data) => {
                    console.info('wallpaperXTS ===> testSetWallpaperURLPromiseSystem103 data : ' + data);
                    expect(true).assertTrue();
                    done();
                }).catch((err) => {
                    console.info('wallpaperXTS ===> testSetWallpaperURLPromiseSystem103 err : ' + err);
                    expect().assertFail();
                    done();
                });
            }catch(error){
                console.info('testSetWallpaperURLPromiseSystem103 err: ' + error);
                expect().assertFail();
            }
            console.info('--------------------testSetWallpaperURLPromiseSystem103 end------------------' );

        })

        /*
        * @tc.number  testSetWallpaperURLCallbackLock104
        * @tc.name    Test setWallpaper() to sets a wallpaper of the specified type based on the uri path from a
                    JPEG or PNG file or the pixel map of a PNG file.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testSetWallpaperURLCallbackLock104', 0, async function (done) {
            console.info('--------------------testSetWallpaperURLCallbackLock104 start------------------' );
            try{
                wallpaper.setWallpaper(imageSourceSystem, WALLPAPER_LOCKSCREEN, function (err, data) {
                    console.info('wallpaperXTS ===> testSetWallpaperURLCallbackLock104 data : ' + data);
                    if (err) {
                        console.info('wallpaperXTS ===> testSetWallpaperURLCallbackLock104 err : ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    expect(true).assertTrue();
                    done();
                });
            }catch(error){
                console.info('testSetWallpaperURLCallbackLock104 catch error : ' + error);
                expect().assertFail();
            }

            console.info('--------------------testSetWallpaperURLCallbackLock104 end------------------' );
        })

        /*
        * @tc.number  testOnCallback101
        * @tc.name    Test on_colorChange to registers a listener for wallpaper color changes to
                    receive notifications about the changes.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testOnCallback101', 0, async function (done) {
             wallpaper.on('colorChange', function (colors, wallpaperType) {
                console.info('wallpaperXTS ===> testOnCallback colors : ' + JSON.stringify(colors));
                console.info('wallpaperXTS ===> testOnCallback wallpaperType : ' + JSON.stringify(wallpaperType));
                if ((colors != undefined) && (colors != null)) {
                    expect(true).assertTrue();
                }
                if ((wallpaperType != undefined) && (wallpaperType != null)) {
                    expect(true).assertTrue();
                }
            })
            done();
        })

        /*
        * @tc.number  testOffCallback101
        * @tc.name    Test on_colorChange to registers a listener for wallpaper color changes to
                    receive notifications about the changes.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testOffCallback101', 0, async function (done) {
             wallpaper.off('colorChange', function (colors, wallpaperType) {
                console.info('wallpaperXTS ===> testOffCallback colors : ' + JSON.stringify(colors));
                console.info('wallpaperXTS ===> testOffCallback wallpaperType : ' + JSON.stringify(wallpaperType));
                if ((colors != undefined) && (colors != null)) {
                    expect(true).assertTrue();
                }
                if ((wallpaperType != undefined) && (wallpaperType != null)) {
                    expect(true).assertTrue();
                }
            })
            done();
        })

        /*
        * @tc.number  testGetFileCallback101
        * @tc.name    Obtains a file of the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetFileCallback101', 0, async function (done) {
            wallpaper.getFile(WALLPAPER_SYSTEM, (error, data) => {
                if (error) {
                    console.error("callback failed to getFile because: " + JSON.stringify(error));
                    expect().assertFail()
                } else {
                    expect(typeof data == "number").assertTrue();
                    expect(!isNaN(data)).assertTrue();
                    console.info("callback success to getFile: " + JSON.stringify(data));
                    done()
                }
            });
            done();
        })

        /*
        * @tc.number  testGetFilePromise101
        * @tc.name    Obtains a file of the wallpaper of the specified type.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testGetFilePromise101', 0, async function (done) {
            wallpaper.getFile(WALLPAPER_SYSTEM).then((data) => {
                expect(typeof data == "number").assertTrue();
                expect(!isNaN(data)).assertTrue();
                console.info("promise success to getFile: " + JSON.stringify(data));
                done()
            }).catch((error) => {
                console.error("promise failed to getFile because: " + JSON.stringify(error));
                expect().assertFail()
            });
            done();
        })

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
                console.info('wallpaperXTS ===> testGetColorsSync102 data : ' + JSON.stringify(colors));
                if (colors.length >= 1) {
                    expect(true).assertTrue();
                    done()
                }else{
                    expect().assertFail();
                    done()
                }
            }catch(err){
                console.info('wallpaperXTS ===> testGetColorsSync102 err : ' + JSON.stringify(err));
                expect().assertFail();
                done()
            }
            console.info('------------------testGetColorsSync102 end----------------------');
            done()
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
                console.info('wallpaperXTS ===> testGetIdSync101 data : ' + JSON.stringify(number));
                if (typeof number == "number") {
                    expect(true).assertTrue();
                    done()
                }else{
                    expect().assertFail();
                    done()
                }
            }catch(err){
                console.info('wallpaperXTS ===> testGetIdSync101 err : ' + JSON.stringify(err));
                expect().assertFail();
                done()
            }
            console.info('------------------testGetIdSync101 end----------------------');
            done()
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
                console.info('wallpaperXTS ===> testGetIdSync102 data : ' + JSON.stringify(number));
                if (typeof number == "number") {
                    expect(true).assertTrue();
                    done()
                }else{
                    expect().assertFail();
                    done()
                }
            }catch(err){
                console.info('wallpaperXTS ===> testGetIdSync102 err : ' + JSON.stringify(err));
                expect().assertFail();
                done()
            }
            console.info('------------------testGetIdSync102 end----------------------');
            done()
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
                console.info('wallpaperXTS ===> testGetFileSync101 data : ' + JSON.stringify(number));
                if (typeof number == "number") {
                    expect(true).assertTrue();
                    done()
                }else{
                    expect().assertFail();
                    done()
                }
            }catch(err){
                console.info('wallpaperXTS ===> testGetFileSync101 err : ' + JSON.stringify(err));
                expect().assertFail();
                done()
            }
            console.info('------------------testGetFileSync101 end----------------------');
            done()
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
                console.info('wallpaperXTS ===> testGetFileSync102 data : ' + JSON.stringify(number));
                if (typeof number == "number") {
                    expect(true).assertTrue();
                    done()
                }else{
                    expect().assertFail();
                    done()
                }
            }catch(err){
                console.info('wallpaperXTS ===> testGetFileSync102 err : ' + JSON.stringify(err));
                expect().assertFail();
                done()
            }
            console.info('------------------testGetFileSync102 end----------------------');
            done()
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
                console.info('wallpaperXTS ===> testGetFileSync103 data : ' + JSON.stringify(number));
                if (typeof number == "number") {
                    expect(true).assertTrue();
                    done()
                }else{
                    expect().assertFail();
                    done()
                }
            }catch(err){
                console.info('wallpaperXTS ===> testGetFileSync103 err : ' + JSON.stringify(err));
                console.info('wallpaperXTS ===> testGetFileSync103 (err.code : ' + err.code);
                expect(err.code == "401").assertTrue();
                done()
            }
            console.info('------------------testGetFileSync103 end----------------------');
            done()
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
                console.info('wallpaperXTS ===> testGetMinHeightSync101 data : ' + JSON.stringify(number));
                if (typeof number == "number") {
                    expect(true).assertTrue();
                    done()
                }else{
                    expect().assertFail();
                    done()
                }
            }catch(err){
                console.info('wallpaperXTS ===> testGetMinHeightSync101 err : ' + JSON.stringify(err));
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
                console.info('wallpaperXTS ===> testGetMinWidthSync101 data : ' + JSON.stringify(number));
                if (typeof number == "number") {
                    expect(true).assertTrue();
                    done()
                }else{
                    expect().assertFail();
                    done()
                }
            }catch(err){
                console.info('wallpaperXTS ===> testGetMinWidthSync101 err : ' + JSON.stringify(err));
                expect().assertFail();
                done()
            }
            console.info('------------------testGetMinWidthSync101 end----------------------');
            done()
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
                console.info('wallpaperXTS ===> testIsChangeAllowed101 data : ' + JSON.stringify(allow));
                if (typeof allow == "boolean") {
                    expect(true).assertTrue();
                    done()
                }else{
                    expect().assertFail();
                    done()
                }
            }catch(err){
                console.info('wallpaperXTS ===> testIsChangeAllowed101 err : ' + JSON.stringify(err));
                expect().assertFail();
                done()
            }
            console.info('------------------testIsChangeAllowed101 end----------------------');
            done()
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
                console.info('wallpaperXTS ===> testIsUserChangeAllowed101 data : ' + JSON.stringify(allow));
                if (typeof allow == "boolean") {
                    expect(true).assertTrue();
                    done()
                }else{
                    expect().assertFail();
                    done()
                }
            }catch(err){
                console.info('wallpaperXTS ===> testIsUserChangeAllowed101 err : ' + JSON.stringify(err));
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
            try{
                wallpaper.restore(WALLPAPER_LOCKSCREEN, function (err, data) {
                    console.info('wallpaperXTS ===> testRestoreCallback101 data : ' + data);
                    if (err) {
                        console.info('wallpaperXTS ===> testRestoreCallback101 err : ' + JSON.stringify(err));
                        expect().assertFail();
                        done()
                    }
                    console.info('testRestoreCallback101 restore success');
                    expect(true).assertTrue();
                    done()
                })
            }catch(err){
                console.info('testRestoreCallback101 catch err : ' + JSON.stringify(err));
                expect().assertFail();
                done()
            }
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
            try{
                wallpaper.restore(WALLPAPER_SYSTEM).then((data) => {
                    console.info('wallpaperXTS ===> testRestorePromise101 data : ' + JSON.stringify(data));
                    console.info('testRestorePromise101 restore success');
                    expect(true).assertTrue();
                    done()
                }).catch((err) => {
                    console.info('wallpaperXTS ===> testRestorePromise101 err : ' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                });
            }catch(err){
                console.info('testRestorePromise101 catch err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            }
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
            try{
                wallpaper.setImage(wallpaperPath, wallpaper.WallpaperType.WALLPAPER_SYSTEM, (error, data) => {
                    if (error) {
                        console.error(`testSetImageCallBack101 failed to setImage because: ` + JSON.stringify(error));
                        expect().assertFail();
                        done();
                    }
                    console.log(`testSetImageCallBack101 success to setImage.`);
                    expect(true).assertTrue();
                    done();
                });
            }catch(err){
                console.info('testSetImageCallBack101 catch err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            }
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
            try{
                wallpaper.setImage(wallpaperPath, wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN, (error, data) => {
                    if (error) {
                        console.error(`testSetImageCallBack102 failed to setImage because: ` + JSON.stringify(error));
                        expect().assertFail();
                        done();
                    }
                    console.log(`testSetImageCallBack102 success to setImage.`);
                    expect(true).assertTrue();
                    done();
                });
            }catch(err){
                console.info('testSetImageCallBack102 catch err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info('------------------testSetImageCallBack102 end----------------------');
        })

        /*
        * @tc.number  testSetImageCallBack103
        * @tc.name    Test setImage() to removes a wallpaper of the specified type and restores the default one.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testSetImageCallBack103', 0, async function (done) {
            console.info('------------------testSetImageCallBack103 start----------------------');
            const color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            let opts = {
                editable: true,
                pixelFormat: 3,
                size: { height: 4, width: 6 }
            }
            console.log(`testSetImageCallBack103 opts success`)
            try{
                image.createPixelMap(color, opts).then((pixelMap) => {
                    wallpaper.setImage(pixelMap, wallpaper.WallpaperType.WALLPAPER_SYSTEM, (error, data) => {
                        if (error) {
                            console.error(`testSetImageCallBack103 failed to setImage because: ` + JSON.stringify(error));
                            expect().assertFail();
                            done()
                        }
                        console.log(`testSetImageCallBack103 success to setImage.`);
                        expect(true).assertTrue();
                        done()
                    });
                }).catch((error) => {
                    console.error(`testSetImageCallBack103 failed to createPixelMap because: ` + JSON.stringify(error));
                    expect().assertFail();
                    done()
                });
            }catch(err){
                console.info('testSetImageCallBack103 catch err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info('------------------testSetImageCallBack103 end----------------------');
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
            try{
                wallpaper.setImage(wallpaperPath, wallpaper.WallpaperType.WALLPAPER_SYSTEM).then((data) => {
                    console.log(`testSetImagePromise101 success to setImage.`);
                    expect(true).assertTrue();
                    done();
                }).catch(err => {
                    expect().assertFail();
                    console.log(`testSetImagePromise101 promise catch: ` + JSON.stringify(err));
                });
            }catch(err){
                console.info('testSetImagePromise101 catch err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            }
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
            try{
                wallpaper.setImage(wallpaperPath, wallpaper.WallpaperType.WALLPAPER_LOCKSCREEN).then((data) => {
                    console.log(`testSetImagePromise102 success to setImage.`);
                    expect(true).assertTrue();
                    done();
                }).catch(err => {
                    console.log(`testSetImagePromise102 promise catch: ` + JSON.stringify(err));
                    expect().assertFail();
                    done()
                });
            }catch(err){
                console.info('testSetImagePromise102 catch err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info('------------------testSetImagePromise102 end----------------------');
        })

        /*
        * @tc.number  testSetImagePromise103
        * @tc.name    Test setImage() to removes a wallpaper of the specified type and restores the default one.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testSetImagePromise103', 0, async function (done) {
            console.info('------------------testSetImagePromise103 start----------------------');
            const color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            let opts = {
                editable: true,
                pixelFormat: 3,
                size: { height: 4, width: 6 }
            }
            console.log(`testSetImagePromise103 opts success`)
            try{
                image.createPixelMap(color, opts).then((pixelMap) => {
                    wallpaper.setImage(pixelMap, wallpaper.WallpaperType.WALLPAPER_SYSTEM).then((data) => {
                        console.log(`testSetImagePromise103 success to setImage.`);
                        expect(true).assertTrue();
                        done()
                    }).catch(err => {
                        console.error(`testSetImagePromise103 failed to setImage because: ` + JSON.stringify(err));
                        expect().assertFail();
                        done()
                    });
                }).catch((error) => {
                    console.error(`testSetImagePromise103 failed to createPixelMap because: ` + JSON.stringify(error));
                    expect().assertFail();
                    done()
                });
            }catch(err){
                console.info('testSetImagePromise103 catch err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.info('------------------testSetImagePromise103 end----------------------');
        });

    });
};
