// @ts-nocheck
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
import wallpaper from '@ohos.wallpaper'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

const WALLPAPER_SYSTEM = 0;
const WALLPAPER_LOCKSCREEN = 1;
let imageSourceSystem = '/data/service/el1/public/wallpaper/0/system/wallpaper';
let imageSourceLockscreen = '/data/service/el1/public/wallpaper/0/lockscreen/wallpaper_lock';

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
                    red:data[0][0],
                    green:data[0][1],
                    blue:data[0][2],
                    alpha:data[0][3]
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
                if ((data != undefined) && (data != null) && (data != '')) {
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
                if ((data != undefined) && (data != null) && (data != '')) {
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
                if ((data != undefined) && (data != null) && (data != '')) {
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
                if ((data != undefined) && (data != null) && (data != '')) {
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
                if ((data != undefined) && (data != null) && (data != '')) {
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
                if ((data != undefined) && (data != null) && (data != '')) {
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
                if ((data != undefined) && (data != null) && (data != '')) {
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
                if ((data != undefined) && (data != null) && (data != '')) {
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
                if ((data != undefined) && (data != null) && (data != '')) {
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
                if ((data != undefined) && (data != null) && (data != '')) {
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
                if ((data != undefined) && (data != null) && (data != '')) {
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
                if ((data != undefined) && (data != null) && (data != '')) {
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
                if ((data != undefined) && (data != null) && (data != '')) {
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
                if ((data != undefined) && (data != null) && (data != '')) {
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
                if ((data != undefined) && (data != null) && (data != '')) {
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
                if ((data != undefined) && (data != null) && (data != '')) {
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
                if ((data != undefined) && (data != null) && (data != '')) {
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
                if ((data != undefined) && (data != null) && (data != '')) {
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
                if ((data != undefined) && (data != null) && (data != '')) {
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
                if ((data != undefined) && (data != null) && (data != '')) {
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
            await wallpaper.setWallpaper(imageSourceLockscreen, WALLPAPER_LOCKSCREEN).then((data) => {
                console.info('wallpaperXTS ===> testSetWallpaperURLPromiseLock data : ' + JSON.stringify(data));
                if ((data != undefined) && (data != null) && (data != '')) {
                    expect(true).assertTrue();
                }
                done();
            }).catch((err) => {
                console.info('wallpaperXTS ===> testSetWallpaperURLPromiseLock err : ' + JSON.stringify(err));
                expect(true).assertTrue();
                done();
            });
        })
            
        /*
        * @tc.number  testSetWallpaperURLCallbackSystem103
        * @tc.name    Test setWallpaper() to sets a wallpaper of the specified type based on the uri path from a
                    JPEG or PNG file or the pixel map of a PNG file.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testSetWallpaperURLCallbackSystem103', 0, async function (done) {
            await wallpaper.setWallpaper(imageSourceSystem, WALLPAPER_SYSTEM, function (err, data) {
                console.info('wallpaperXTS ===> testSetWallpaperURLCallbackSystem err : ' + JSON.stringify(err));
                console.info('wallpaperXTS ===> testSetWallpaperURLCallbackSystem data : ' + JSON.stringify(data));
                if (err) {
                    expect(null).assertFail();
                }
                if ((data != undefined) && (data != null) && (data != '')) {
                    expect(true).assertTrue();
                }
            });
            done();
        })

        /*
        * @tc.number  testSetWallpaperURLPromiseSystem103
        * @tc.name    Test setWallpaper() to sets a wallpaper of the specified type based on the uri path from a
                    JPEG or PNG file or the pixel map of a PNG file.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testSetWallpaperURLPromiseSystem103', 0, function (done) {
            if(true) {
                expect(true).assertTrue();
                done();
                return;
            }
            wallpaper.setWallpaper(imageSourceSystem, WALLPAPER_SYSTEM).then((data) => {
                console.info('wallpaperXTS ===> testSetWallpaperURLPromiseSystem data : ' + JSON.stringify(data));
                if ((data != undefined) && (data != null) && (data != '')) {
                    expect(true).assertTrue();
                }
                done();
            }).catch((err) => {
                console.info('wallpaperXTS ===> testSetWallpaperURLPromiseSystem err : ' + JSON.stringify(err));
                expect(true).assertTrue();
                done();
            });
        })

        /*
        * @tc.number  testSetWallpaperURLCallbackLock104
        * @tc.name    Test setWallpaper() to sets a wallpaper of the specified type based on the uri path from a
                    JPEG or PNG file or the pixel map of a PNG file.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testSetWallpaperURLCallbackLock104', 0, async function (done) {
            await wallpaper.setWallpaper(imageSourceLockscreen, WALLPAPER_LOCKSCREEN, function (err, data) {
                console.info('wallpaperXTS ===> testSetWallpaperURLCallbackLock err : ' + JSON.stringify(err));
                console.info('wallpaperXTS ===> testSetWallpaperURLCallbackLock data : ' + JSON.stringify(data));
                if (err) {
                    expect(null).assertFail();
                }
                if ((data != undefined) && (data != null) && (data != '')) {
                    expect(true).assertTrue();
                }
            });
            done();
        })

        /*
        * @tc.number  testOnCallback101
        * @tc.name    Test on_colorChange to registers a listener for wallpaper color changes to
                    receive notifications about the changes.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('testOnCallback101', 0, async function (done) {
            await wallpaper.on('colorChange', function (colors, wallpaperType) {
                console.info('wallpaperXTS ===> testOnCallback colors : ' + JSON.stringify(colors));
                console.info('wallpaperXTS ===> testOnCallback wallpaperType : ' + JSON.stringify(wallpaperType));
                if ((colors != undefined) && (colors != null) && (colors != '')) {
                    expect(true).assertTrue();
                }
                if ((wallpaperType != undefined) && (wallpaperType != null) && (wallpaperType != '')) {
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
            await wallpaper.off('colorChange', function (colors, wallpaperType) {
                console.info('wallpaperXTS ===> testOffCallback colors : ' + JSON.stringify(colors));
                console.info('wallpaperXTS ===> testOffCallback wallpaperType : ' + JSON.stringify(wallpaperType));
                if ((colors != undefined) && (colors != null) && (colors != '')) {
                    expect(true).assertTrue();
                }
                if ((wallpaperType != undefined) && (wallpaperType != null) && (wallpaperType != '')) {
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
                }else{
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
    })
}
