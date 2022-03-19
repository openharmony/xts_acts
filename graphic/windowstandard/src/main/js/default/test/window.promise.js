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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'
import window from '@ohos.window'
import display from '@ohos.display'
import screen from '@ohos.screen'


describe('window_test', function() {
    var wnd;
    const FALSE_FLAG = false;
    beforeAll(function() {})
    beforeEach(function() {})
    afterEach(function() {})
    afterAll(function() {})

    /**
     * @tc.number      SUB_WMS_FAMODELSETCOLORSPACE_JSAPI_001
     * @tc.name        Test  faModelSetColorSpaceTest1.
     * @tc.desc        To verify the setting of the wide color gamut color space.
     */
    it('faModelSetColorSpaceTest1', 0, async function(done) {
        console.log('jsunittest faModelSetColorSpaceTest1 begin')
        window.getTopWindow().then(wnd => {
            console.log('jsunittest faModelSetColorSpaceTest1 wnd: ' + wnd);
            expect(wnd != null).assertTrue();
            wnd.setColorSpace(1).then(() => {
                console.log('jsunittest faModelSetColorSpaceTest1 setColorSpace WIDE_GAMUT');
                wnd.getColorSpace().then(res => {
                    expect(res == 1).assertTrue();
                    console.log('jsunittest faModelSetColorSpaceTest1 setColorSpace WIDE_GAMUT success');
                    wnd.isSupportWideGamut().then(data => {
                        expect(!!data).assertTrue();
                        console.log('ColorSpace WIDE_GAMUT SupportWideGamut');
                        done();
                    }).catch((err) => {
                        console.log('jsunittest faModelSetColorSpaceTest1 wnd.isSupportWideGamut failed, err :' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }).catch((err) => {
                    console.log('jsunittest faModelSetColorSpaceTest1 wnd.getColorSpace failed, err :' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }).catch((err) => {
                console.log('jsunittest faModelSetColorSpaceTest1 wnd.setColorSpace failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        }).catch((err) => {
            console.log('jsunittest faModelSetColorSpaceTest1 getTopWindow failed, err :' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number      SUB_WMS_FAMODELSETCOLORSPACE_JSAPI_002
     * @tc.name        Test  faModelSetColorSpaceTest2.
     * @tc.desc        To verify that the color space of invaild values is set successfully.
     */
    it('faModelSetColorSpaceTest2', 0, async function(done) {
        console.log('jsunittest faModelSetColorSpaceTest2 begin');
        window.getTopWindow().then(wnd => {
            console.log('jsunittest faModelSetColorSpaceTest2 wnd: ' + wnd);
            expect(wnd != null).assertTrue();
            wnd.setColorSpace(-5).then(() => {
                console.log('jsunittest faModelSetColorSpaceTest2 setColorSpace -5');
                expect().assertFail();
                done();
            }).catch((err) => {
                console.log('jsunittest faModelSetColorSpaceTest2 wnd.setColorSpace failed, err :' + JSON.stringify(err));
                expect(err.code).assertEqual(130);
                done();
            })
        }).catch((err) => {
            console.log('jsunittest faModelSetColorSpaceTest2 wnd.getTopWindow failed, err :' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number      SUB_WMS_FAMODELSETWINDOWLAYOUTMODE_JSAPI_001
     * @tc.name        Test  faModelSetWindowLayoutModeTest1.
     * @tc.desc        To verify the function of setting different window modes.
     */
    it('faModelSetWindowLayoutModeTest1', 0, async function(done) {
        console.log('jsunittest faModelSetWindowLayoutModeTest1 begin');
        await display.getDefaultDisplay().then(dsp => {
            console.log('jsunittest faModelSetWindowLayoutModeTest1 getDefaultDisplay dspID :' + dsp.id);
            window.setWindowLayoutMode(0, dsp.id).then(() => {
                console.log('jsunittest faModelSetWindowLayoutModeTest1 setWindowLayoutMode WINDOW_LAYOUT_MODE_CASCADE success');
                window.setWindowLayoutMode(1, dsp.id).then(() => {
                    console.log('jsunittest faModelSetWindowLayoutModeTest1 setWindowLayoutMode WINDOW_LAYOUT_MODE_TILE success');
                    done();
                }).catch((err) => {
                    console.log('jsunittest faModelSetWindowLayoutModeTest1 setWindowLayoutMode failed, err :' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }).catch((err) => {
                console.log('jsunittest faModelSetWindowLayoutModeTest1 setWindowLayoutMode failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        }).catch((err) => {
            console.log('jsunittest faModelSetWindowLayoutModeTest1 getDefaultDisplay failed, err :' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number      SUB_WMS_FAMODELSETWINDOWLAYOUTMODE_JSAPI_002
     * @tc.name        Test  faModelSetWindowLayoutModeTest2.
     * @tc.desc        To verify the function of setting the invalied window mode.
     */
    it('faModelSetWindowLayoutModeTest2', 0, async function(done) {
        console.log('jsunittest faModelSetWindowLayoutModeTest2 begin');
        display.getDefaultDisplay().then(dsp => {
            console.log('jsunittest faModelSetWindowLayoutModeTest2 getDefaultDisplay dspID :' + dsp.id);
            window.setWindowLayoutMode(-5, dsp.id).then(() => {
                console.log('jsunittest faModelSetWindowLayoutModeTest2 setWindowLayoutMode -5 success');
                expect().assertFail();
                done();
            }).catch((err) => {
                console.log('jsunittest faModelSetWindowLayoutModeTest2 setWindowLayoutMode failed, err :' + JSON.stringify(err));
                expect(err.code).assertEqual(130);
                done();
            })
        }).catch((err) => {
            console.log('jsunittest faModelSetWindowLayoutModeTest2 getDefaultDisplay failed, err :' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number      SUB_WMS_FAMODELSETWINDOWLAYOUTMODE_JSAPI_003
     * @tc.name        Test  faModelSetWindowLayoutModeTest3.
     * @tc.desc        To verify the scenario where the screen ID is invaild when the window mode is set.
     */
    it('faModelSetWindowLayoutModeTest3', 0, async function(done) {
        console.log('jsunittest faModelSetWindowLayoutModeTest3 begin');
        window.setWindowLayoutMode(-5, -100).then(() => {
            console.log('jsunittest faModelSetWindowLayoutModeTest3 setWindowLayoutMode (-5,-100) success');
            expect().assertFail();
            done();
        }).catch((err) => {
            console.log('jsunittest faModelSetWindowLayoutModeTest3 setWindowLayoutMode failed, err :' + JSON.stringify(err));
            expect(err.code).assertEqual(120);
            done();
        })
    })

    /**
     * @tc.number      SUB_WMS_FAMODELSETSCREENACTIVEMODE_JSAPI_001
     * @tc.name        Test  faModelSetScreenActiveModeTest1.
     * @tc.desc        To test the function of setting screen parameters.
     */
    it('faModelSetScreenActiveModeTest1', 0, async function(done) {
        console.log('jsunittest setScreenActiveModeTest1 begin');
        screen.getAllScreen().then(scr => {
            console.log('jsunittest faModelSetScreenActiveModeTest1 getAllScreen scr' + scr);
            expect(scr[0] != null).assertTrue();
            let screen1 = scr[0];
            screen1.setScreenActiveMode(0).then(res1 => {
                console.log('jsunittest faModelSetScreenActiveModeTest1 setScreenActiveMode 0 res1 :' + res1);
                expect(res1).assertTrue();
                done();
            }).catch((err) => {
                console.log('jsunittest faModelSetScreenActiveModeTest1 setScreenActiveMode 0 failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        }).catch((err) => {
            console.log('jsunittest faModelSetScreenActiveModeTest1 getAllScreen failed, err :' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number      SUB_WMS_FAMODELSETSCREENACTIVEMODE_JSAPI_002
     * @tc.name        Test  faModelSetScreenActiveModeTest2.
     * @tc.desc        To set the function of setting screen parameters to abnormal values.
     */
    it('faModelSetScreenActiveModeTest2', 0, async function(done) {
        console.log('jsunittest faModelSetScreenActiveModeTest2 begin');
        screen.getAllScreen().then(scr => {
            console.log('jsunittest faModelSetScreenActiveModeTest2 getAllScreen scr' + scr);
            expect(scr[0] != null).assertTrue();
            let screen1 = scr[0];
            screen1.setScreenActiveMode(-5).then(res => {
                console.log('jsunittest faModelSetScreenActiveModeTest2 setScreenActiveMode -5 res :' + res);
                expect(!!res).assertFalse();
                done();
            }).catch((err) => {
                console.log('jsunittest faModelSetScreenActiveModeTest2 setScreenActiveMode -5 failed, err :' + JSON.stringify(err));
                expect(err.code).assertEqual(0);
                done();
            })
        })
    })

    /**
     * @tc.number      SUB_WMS_FAMODELISSHOWING_JSAPI_001
     * @tc.name        Test  faModelIsShowingTest1.
     * @tc.desc        To verify the function of obtaining the display status when a window is hidden and then displayed.
     */
    it('faModelIsShowingTest1', 0, async function(done) {
        console.log('jsunittest faModelIsShowingTest1 begin');
        window.getTopWindow().then(wnd => {
            console.log('jsunittest faModelIsShowingTest1 getTopWindow wnd: ' + wnd)
            expect(wnd != null).assertTrue();
            wnd.hide().then(() => {
                console.log('jsunittest faModelIsShowingTest1 wnd.hide success')
                wnd.isShowing().then(data => {
                    console.log('jsunittest faModelIsShowingTest1 wnd.isShowing data: ' + data)
                    expect(!data).assertTrue();
                    wnd.show().then(() => {
                        console.log('jsunittest faModelIsShowingTest1 wnd.show success')
                        wnd.isShowing().then(res => {
                            console.log('jsunittest faModelIsShowingTest1 wnd.isShowing res: ' + res)
                            expect(res).assertTrue();
                            done();
                        }).catch((err) => {
                            console.log('jsunittest faModelIsShowingTest1 wnd.isShowing failed, err :' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }).catch((err) => {
                        console.log('jsunittest faModelIsShowingTest1 wnd.show failed, err :' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }).catch((err) => {
                    console.log('jsunittest faModelIsShowingTest1 wnd.isShowing failed, err :' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }).catch((err) => {
                console.log('jsunittest faModelIsShowingTest1 wnd.hide failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        }).catch((err) => {
            console.log('jsunittest faModelIsShowingTest1 getTopWindow failed, err :' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number		SUB_WMS_FAMODELGETDEFALUTDISPLAY_JSAPI_001
     * @tc.name			Test getDefaultDisplayTest1.
     * @tc.desc			To test the function of obtaining the default screen.
     */
    it('faModelGetDefaultDisplayTest1', 0, async function(done) {
        console.log('jsunittest faModelGetDefaultDisplayTest1 begin')
        display.getDefaultDisplay().then(dsp => {
            console.log('jsunittest faModelGetDefaultDisplayTest1 getDefaultDisplay id :' + dsp.id)
            console.log('jsunittest faModelGetDefaultDisplayTest1 getDefaultDisplay refreshRate :' + dsp.refreshRate)
            console.log('jsunittest faModelGetDefaultDisplayTest1 getDefaultDisplay width :' + dsp.width)
            console.log('jsunittest faModelGetDefaultDisplayTest1 getDefaultDisplay height :' + dsp.height)
            expect(dsp.id != null).assertTrue();
            expect(dsp.refreshRate != null).assertTrue();
            expect(dsp.width != null).assertTrue();
            expect(dsp.height != null).assertTrue();
            done();
        }).catch((err) => {
            console.log('jsunittest faModelGetDefaultDisplayTest1 getDefaultDisplay failed, err :' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number		SUB_WMS_FAMODELGETALLDISPLAY_JSAPI_001
     * @tc.name			Test faModeGetAllDisplayTest1.
     * @tc.desc			To verify the function of obtaining all screens.
     */
    it('faModelGetAllDisplayTest1', 0, async function(done) {
        console.log('jsunittest faModelGetAllDisplayTest1 begin')
        display.getAllDisplay().then(dsp => {
            console.log('jsunittest faModelGetAllDisplayTest1 getDefaultDisplay id :' + JSON.stringify(dsp))
            console.log('jsunittest faModelGetAllDisplayTest1 getDefaultDisplay id :' + dsp[0].id)
            console.log('jsunittest faModelGetAllDisplayTest1 getDefaultDisplay refreshRate :' + dsp[0].refreshRate)
            console.log('jsunittest faModelGetAllDisplayTest1 getDefaultDisplay width :' + dsp[0].width)
            console.log('jsunittest faModelGetAllDisplayTest1 getDefaultDisplay height :' + dsp[0].height)
            expect(dsp[0].id != null).assertTrue();
            expect(dsp[0].refreshRate != null).assertTrue();
            expect(dsp[0].width != null).assertTrue();
            expect(dsp[0].height != null).assertTrue();
            done();
        }).catch((err) => {
            console.log('jsunittest faModelGetDefaultDisplayTest1 getDefaultDisplay failed, err :' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number		SUB_WMS_FAMODELCREATE_JSAPI_001
     * @tc.name			Test faModelGetAllDisplayTest1.
     * @tc.desc			To verify the function of creating an application subwindow.
     */
    it('faModelCreateTest1', 0, async function(done) {
        console.log('jsunittest faModelCreateTest1 begin')
        window.create('subWindow', 0).then(wnd => {
            expect(wnd != null).assertTrue();
            console.log('jsunittest faModelCreateTest1 create success wnd' + wnd);
            done();
        }).catch((err) => {
            console.log('jsunittest faModelCreateTest1 create failed, err :' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number		SUB_WMS_FAMODELDESTROY_JSAPI_001
     * @tc.name			Test faModelDestroyTest1.
     * @tc.desc			Verify that a window is destroyed after being created.
     */
    it('faModelDestroyTest1', 0, async function(done) {
        console.log('jsunittest faModelDestroyTest1 begin')
        window.create('subWindow2', 0).then(wnd => {
            expect(wnd != null).assertTrue();
            console.log('jsunittest faModelDestroyTest1 create success wnd' + wnd);
            wnd.destroy().then(() => {
                console.log('jsunittest faModelDestroyTest1 destroy success ');
                window.find('subWindow2').then((data) => {
                    console.log('jsunittest faModelDestroyTest1 window.find success, window :' + JSON.stringify(data));
                    expect().assertFail();
                    done();
                }).catch((err) => {
                    console.log('jsunittest faModelDestroyTest1 find failed, err :' + JSON.stringify(err));
                    expect(err.code).assertEqual(120);
                    done();
                })
            }).catch((err) => {
                console.log('jsunittest faModelCreateTest1 destroy failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        }).catch((err) => {
            console.log('jsunittest faModelCreateTest1 create failed, err :' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number		SUB_WMS_FAMODELSETSYSTEMBARENABLE_JSAPI_001
     * @tc.name			Test faModelSetSystemBarEnableTest1.
     * @tc.desc			To verify the function of setting a scenario that is visible to the system bar.
     */
    it('faModelSetSystemBarEnableTest1', 0, async function(done) {
        console.log('jsunittest faModelSetSystemBarEnableTest1 begin')
        var names = ["status", "navigation"];
        window.getTopWindow().then(wnd => {
            expect(wnd != null).assertTrue();
            wnd.setLayoutFullScreen(true).then(() => {
                console.log('jsunittest faModelSetSystemBarEnableTest1 setLayoutFullScreen(true) success ');
                wnd.setSystemBarEnable(names).then(() => {
                    console.log('jsunittest faModelSetSystemBarEnableTest1 setSystemBarEnable success');
                    done();
                }).catch((err) => {
                    console.log('jsunittest faModelSetSystemBarEnableTest1 setSystemBarEnable failed, err :' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }).catch((err) => {
                console.log('jsunittest faModelSetSystemBarEnableTest1 setLayoutFullScreen failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })

        }).catch((err) => {
            console.log('jsunittest faModelSetSystemBarEnableTest1 getTopWindow failed, err :' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number		SUB_WMS_FAMODELSETSYSTEMBARPROPERTIES_JSAPI_001
     * @tc.name			Test faModelSetSystemBarPropertiesTest1.
     * @tc.desc			To verify the function of setting system bar attributes.
     */
    it('faModelSetSystemBarPropertiesTest1', 0, async function(done) {
        console.log('jsunittest faModelSetSystemBarPropertiesTest1 begin')
        var SystemBarProperties = {
            statusBarColor: '#ff00ff',
            navigationBarColor: '#00ff00',
            isStatusBarLightIcon: true,
            isNavigationBarLightIcon: false,
            statusBarContentColor: '#ffffff',
            navigationBarContentColor: '#00ffff'
        };
        window.getTopWindow().then(wnd => {
            expect(wnd != null).assertTrue();
            wnd.setSystemBarProperties(SystemBarProperties).then(() => {
                console.log('jsunittest faModelSetSystemBarPropertiesTest1 setSystemBarProperties success ')
                done();
            }).catch((err) => {
                console.log('jsunittest faModelSetSystemBarPropertiesTest1 setSystemBarProperties failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        }).catch((err) => {
            console.log('jsunittest faModelSetSystemBarPropertiesTest1 getTopWindow failed, err :' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number		SUB_WMS_FAMODELMINIMIZEALL_JSAPI_001
     * @tc.name			Test faModelMinimizeAllTest1.
     * @tc.desc			To verify the function of minimizing all windows on the default screen.
     */
    it('faModelMinimizeAllTest1', 0, async function(done) {
        console.log('jsunittest faModelMinimizeAllTest1 begin')
        window.getTopWindow().then(wnd => {
            expect(wnd != null).assertTrue();
            display.getDefaultDisplay().then(dsp => {
                console.log('jsunittest faModelMinimizeAllTest1 getDefaultDisplay dspID :' + dsp.id);
                window.minimizeAll(dsp.id).then(() => {
                    console.log('jsunittest faModelMinimizeAllTest1 minimizeAll success');
                    setTimeout(() => {
                        window.getTopWindow().then((wnd) => {
                            console.log('jsunittest faModelMinimizeAllTest1 getTopWindow success');
                            expect().assertFail();
                            done();
                        }).catch((err) => {
                            console.log('jsunittest faModelMinimizeAllTest1 getTopWindow failed, err :' + JSON.stringify(err));
                            expect(err.code).assertEqual(120);
                            wnd.show().then(() => {
                                console.log('jsunittest faModelMinimizeAllTest1 show success');
                                expect(true).assertTrue();
                                done();
                            }).catch((err) => {
                                console.log('jsunittest faModelMinimizeAllTest1 show failed, err :' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            })
                        })
                    }, 3000)
                }).catch((err) => {
                    console.log('jsunittest faModelMinimizeAllTest1 minimizeAll failed, err :' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }).catch((err) => {
                console.log('jsunittest faModelMinimizeAllTest1 getDefaultDisplay failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        }).catch((err) => {
            console.log('jsunittest faModelMinimizeAllTest1 getTopWindow failed, err :' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number		SUB_WMS_FAMODELMINIMIZEALL_JSAPI_002
     * @tc.name			Test faModelMinimizeAllTest2.
     * @tc.desc			To verify the function of minimizing all windows on an invalid screen.
     */
    it('faModelMinimizeAllTest2', 0, async function(done) {
        console.log('jsunittest faModelMinimizeAllTest2 begin')
        window.minimizeAll(-100).then(() => {
            console.log('jsunittest faModelMinimizeAllTest2 minimizeAll success');
            expect().assertFail();
            done();
        }).catch((err) => {
            console.log('jsunittest faModelMinimizeAllTest2 minimizeAll failed, err :' + JSON.stringify(err));
            expect(err.code).assertEqual(130);
            done();
        })
    })

})