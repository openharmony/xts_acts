/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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

describe('window_api_test', function() {

    beforeAll(function() {})
    beforeEach(function() {})
    afterEach(function() {})
    afterAll(function() {})

    /**
     * @tc.number    SUB_WMS_FAMODELONOFF_JSAPI_001
     * @tc.name      Test faModelOnOffTest1.
     * @tc.desc      To verify the function of enabling and disabling the monitoring function for tone change on the system bar..
     */
it('faModelOnOffTest1', 0, async function(done) {
        console.log('jsunittest faModelOnOffTest1 begin');
        var listenerStatus;
        var callback = (data) => {
            console.log('jsunittest faModelOnOffTest1 create callback ' + JSON.stringify(data));
            listenerStatus = 1;
            console.log('jsunittest faModelOnOffTest1 listenerStatus 1: ' + listenerStatus);
        }
        window.on('systemBarTintChange', callback);
        window.getTopWindow((err, data) => {
            if (err.code != 0) {
                console.log('jsunittest faModelOnOffTest1 getTopWindow callback fail ' + JSON.stringify(err.code));
                expect().assertFail();
                done();
            }
            expect(data != null).assertTrue();
            data.setLayoutFullScreen(true, (err) => {
                if (err.code != 0) {
                    console.log('jsunittest faModelOnOffTest1 setLayoutFullScreen callback fail ' + JSON.stringify(err.code));
                    expect().assertFail();
                    done();
                } else {
                    setTimeout(() => {
                        expect(listenerStatus == 1).assertTrue();
                        window.off('systemBarTintChange');
                        listenerStatus = 0;
                        data.setLayoutFullScreen(false, (err) => {
                            console.log('jsunittest faModelOnOffTest1 listenerStatus 2:' + listenerStatus);
                            if (err.code != 0 || listenerStatus == 1) {
                                console.log('jsunittest faModelOnOffTest1 setLayoutFullScreen callback fail ' + JSON.stringify(err.code));
                                expect().assertFail();
                                done();
                            } else {
                                console.log('jsunittest faModelOnOffTest1 listenerStatus 3:' + listenerStatus);
                                console.log('jsunittest faModelOnOffTest1 off callback success');
                                done();
                            }
                        })
                    }, 2000);
                }
            })
        })
    })

    /**
     * @tc.number    SUB_WMS_FAMODELONOFF_JSAPI_002
     * @tc.name      Test faModelOnOffTest2.
     * @tc.desc      To verify the function of enabling and disabling intercepting when the window size changes.
     */
    var listenerStatus; //1表示开启 其他为关闭
    function callback(data) {
        console.log('jsunittest faModelOnOffTest2 callback  ' + JSON.stringify(data));
        listenerStatus = 1;
        console.log('jsunittest faModelOnOffTest2 listenerStatus 1: ' + listenerStatus);
    }

    it('faModelOnOffTest2', 0, async function(done) {
        console.log('jsunittest faModelOnOffTest2 begin');
        window.getTopWindow((err, data) => {
            if (err.code != 0) {
                console.log('jsunittest faModelOnOffTest2 getTopWindow callback fail ' + JSON.stringify(err.code));
                expect().assertFail();
                done();
            } else {
                expect(typeof data != undefined).assertTrue();
                data.on('windowSizeChange', callback);
            }
            data.setLayoutFullScreen(true, (err) => {
                if (err.code != 0) {
                    console.log('jsunittest faModelOnOffTest2 setLayoutFullScreen callback fail ' + JSON.stringify(err.code));
                    expect().assertFail();
                } else {
                    setTimeout((async function() {
                        console.log('jsunittest faModelOnOffTest2 listenerStatus 111: ' + listenerStatus);
                        expect(listenerStatus).assertEqual(1);
                        data.off('windowSizeChange')
                        listenerStatus = 0;
                        data.setLayoutFullScreen(false, (err) => {
                            console.log('jsunittest faModelOnOffTest2 listenerStatus 2: ' + listenerStatus);
                            if (err.code != 0 || listenerStatus == 1) {
                                console.log('jsunittest faModelOnOffTest2 setLayoutFullScreen callback fail ' + JSON.stringify(err.code));
                                expect().assertFail();
                                done();
                            } else {
                                console.log('jsunittest faModelOnOffTest2 listenerStatus 3: ' + listenerStatus);
                                console.log('jsunittest faModelOnOffTest2 off callback success');
                                done();
                            }
                        })
                    }), 1000)

                }
            })
        })
    })

    function callback2(data) {
        console.log('jsunittest faModelOnOffTest3 callback  ' + JSON.stringify(data));
        listenerStatus = 1;
        console.log('jsunittest faModelOnOffTest3 listenerStatus 1: ' + listenerStatus);
    }

    /**
     * @tc.number    SUB_WMS_FAMODELONOFF_JSAPI_003
     * @tc.name      Test faModelOnOffTest3.
     * @tc.desc      To verify the function of enabling and disabling lawful interception in the system and window.
     */
    it('faModelOnOffTest3', 0, async function(done) {
        console.log('jsunittest faModelOnOffTest3 begin')
        window.getTopWindow((err, data) => {
            if (err.code != 0) {
                console.log('jsunittest faModelOnOffTest3 getTopWindow callback fail ' + JSON.stringify(err.code));
                expect().assertFail();
                done();
            } else {
                expect(typeof data != undefined).assertTrue();
                data.on('systemAvoidAreaChange', callback2);
            }
            data.setFullScreen(true, (err) => {
                if (err.code != 0) {
                    console.log('jsunittest faModelOnOffTest3 setLayoutFullScreen callback fail ' + JSON.stringify(err.code));
                    expect().assertFail();
                    done();
                } else {
                    setTimeout((async function() {
                        console.log('jsunittest faModelOnOffTest3 listenerStatus 111: ' + listenerStatus);
                        expect(listenerStatus).assertEqual(1);
                        done();
                        data.off('systemAvoidAreaChange')
                        listenerStatus = 0;
                        data.setFullScreen(false, (err) => {
                            console.log('jsunittest faModelOnOffTest3 listenerStatus 2: ' + listenerStatus);
                            if (err.code != 0 || listenerStatus == 1) {
                                console.log('jsunittest faModelOnOffTest2 setLayoutFullScreen callback fail ' + JSON.stringify(err.code));
                                expect().assertFail();
                                done();
                            } else {
                                console.log('jsunittest faModelOnOffTest3 listenerStatus 3: ' + listenerStatus);
                                console.log('jsunittest faModelOnOffTest3 off callback success');
                                done();
                            }
                        })
                    }), 1000)

                }
            })
        })
    })

    /**
     * @tc.number    SUB_WINDOW_FAMODELHIDE_SHOW_JSAPI_001
     * @tc.name      Test faModelHideOrShowTest1.
     * @tc.desc      Set the window to hide and then show.
     */
    it('faModelHideOrShowTest1', 0, async function(done) {
        console.log('jsunittest faModelHideOrShowTest1 begin');
        window.getTopWindow().then(wnd => {
            console.log('jsunittest faModelHideOrShowTest1 window.getTopWindow wnd: ' + wnd);
            expect(wnd != null).assertTrue();
            wnd.hide((err) => {
                console.log('jsunittest faModelHideOrShowTest1 window.hide callback begin' + err.code);
                if (err.code != 0) {
                    console.log('jsunittest faModelHideOrShowTest1 window.hide callback fail' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                } else {
                    expect(true).assertTrue();
                    console.log('jsunittest faModelHideOrShowTest1 window.hide callback success');
                }
                wnd.show((err) => {
                    console.log('jsunittest faModelHideOrShowTest1 window.show callback begin' + err.code);
                    if (err.code != 0) {
                        console.log('jsunittest faModelHideOrShowTest1 window.show callback fail' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    } else {
                        console.log('jsunittest faModelHideOrShowTest1 window.show callback success');
                        expect(true).assertTrue();
                        done();
                    }
                })
            })
        }).catch((err) => {
            console.log('jsunittest hideOrShowTest1 window.getTopWindow fail : ' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number    SUB_WINDOW_FAMODELGETPROPERTIES_JSAPI_001
     * @tc.name      Test faModelGetPropertiesTest1.
     * @tc.desc      Get the current application main window properties.
     */
    it('faModelGetPropertiesTest1', 0, async function(done) {
        console.log('jsunittest faModelGetPropertiesTest1 begin');
        window.getTopWindow().then(wnd => {
            console.log('jsunittest faModelGetPropertiesTest1 window.getTopWindow wnd: ' + wnd);
            expect(wnd != null).assertTrue();
            wnd.getProperties((err, data) => {
                console.log('jsunittest faModelGetPropertiesTest1 window.getProperties callback begin' + err.code);
                console.log('jsunittest faModelGetPropertiesTest1 window.getProperties callback begin' + JSON.stringify(data));
                if (err.code != 0) {
                    console.log('jsunittest faModelGetPropertiesTest1 window.getProperties callback fail' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                } else {
                    expect(data.type != null).assertTrue();
                    expect(data.windowRect != null).assertTrue();
                    console.log('jsunittest faModelGetPropertiesTest1 window.getProperties callback end');
                    done();
                }
            })
        }).catch((err) => {
            console.log('jsunittest faModelGetPropertiesTest1 window.getTopWindow fail : ' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number    SUB_WINDOW_FAMODELGETAVOIDAREA_JSAPI_001
     * @tc.name      Test faModelGetAvoidAreaTest1.
     * @tc.desc      Get SystemUI type avoidance area.
     */
    it('faModelGetAvoidAreaTest1', 0, async function(done) {
        console.log('jsunittest faModelGetAvoidAreaTest1 begin');
        window.getTopWindow().then(wnd => {
            console.log('jsunittest faModelGetAvoidAreaTest1 window.getTopWindow wnd: ' + wnd);
            expect(wnd != null).assertTrue();
            wnd.getAvoidArea(0, (err, data) => {
                console.log('jsunittest faModelGetAvoidAreaTest1 window.getAvoidArea callback begin' + err.code);
                console.log('jsunittest faModelGetAvoidAreaTest1 window.getAvoidArea callback begin' + JSON.stringify(data));
                if (err.code != 0) {
                    console.log('jsunittest faModelGetAvoidAreaTest1 window.getAvoidArea callback fail' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                } else {
                    expect(data.topRect != null).assertTrue();
                    expect(data.rightRect != null).assertTrue();
                    expect(data.bottomRect != null).assertTrue();
                    expect(data.leftRect != null).assertTrue();
                    console.log('jsunittest faModelGetAvoidAreaTest1 window.getAvoidArea callback end');
                    done();
                }
            })

        }).catch((err) => {
            console.log('jsunittest faModelGetAvoidAreaTest1 window.getTopWindow fail : ' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number    SUB_WINDOW_FAMODELGETAVOIDAREA_JSAPI_002
     * @tc.name      Test faModelGetAvoidAreaTest2.
     * @tc.desc      Get Noth type avoidance area.
     */
    it('faModelGetAvoidAreaTest2', 0, async function(done) {
        console.log('jsunittest faModelGetAvoidAreaTest2 begin');
        window.getTopWindow().then(wnd => {
            console.log('jsunittest faModelGetAvoidAreaTest2 window.getTopWindow wnd: ' + wnd);
            expect(wnd != null).assertTrue();
            wnd.getAvoidArea(1, (err, data) => {
                console.log('jsunittest faModelGetAvoidAreaTest2 window.getAvoidArea callback begin' + err.code);
                console.log('jsunittest faModelGetAvoidAreaTest2 window.getAvoidArea callback begin' + JSON.stringify(data));
                if (err.code != 0) {
                    console.log('jsunittest faModelGetAvoidAreaTest2 window.getAvoidArea callback fail' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                } else {
                    expect(data.topRect != null).assertTrue();
                    expect(data.rightRect != null).assertTrue();
                    expect(data.bottomRect != null).assertTrue();
                    expect(data.leftRect != null).assertTrue();
                    console.log('jsunittest faModelGetAvoidAreaTest2 window.getAvoidArea callback end');
                    done();
                }
            })
        }).catch((err) => {
            console.log('jsunittest faModelGetAvoidAreaTest2 window.getTopWindow fail : ' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number    SUB_WINDOW_FAMODELGETAVOIDAREA_JSAPI_003
     * @tc.name      Test faModelGetAvoidAreaTest3.
     * @tc.desc      Get system gesture type avoidance area.
     */
    it('faModelGetAvoidAreaTest3', 0, async function(done) {
        console.log('jsunittest faModelGetAvoidAreaTest3 begin');
        window.getTopWindow().then(wnd => {
            console.log('jsunittest faModelGetAvoidAreaTest3 window.getTopWindow wnd: ' + wnd);
            expect(wnd != null).assertTrue();
            wnd.getAvoidArea(3, (err, data) => {
                console.log('jsunittest faModelGetAvoidAreaTest3 window.getAvoidArea callback begin' + err.code);
                console.log('jsunittest faModelGetAvoidAreaTest3 window.getAvoidArea callback begin' + JSON.stringify(data));
                if (err.code != 0) {
                    console.log('jsunittest faModelGetAvoidAreaTest3 window.getAvoidArea callback fail' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                } else {
                    expect(data.topRect != null).assertTrue();
                    expect(data.rightRect != null).assertTrue();
                    expect(data.bottomRect != null).assertTrue();
                    expect(data.leftRect != null).assertTrue();
                    console.log('jsunittest faModeGetAvoidAreaTest3 window.getAvoidArea callback end');
                    done();
                }
            })
        }).catch((err) => {
            console.log('jsunittest faModeGetAvoidAreaTest3 window.getTopWindow fail : ' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number    SUB_WINDOW_FAMODELSETFULLSCREEN_JSAPI_001
     * @tc.name      Test faModelSetFullScreenTest1
     * @tc.desc      Set the window to be non-fullscreen first and then fullscreen.
     */
    it('faModelSetFullScreenTest1', 0, async function(done) {
        console.log('jsunittest faModelSetFullScreenTest1 begin');
        window.getTopWindow().then(wnd => {
            console.log('jsunittest faModelSetFullScreenTest1 window.getTopWindow wnd: ' + wnd);
            expect(wnd != null).assertTrue();
            console.log('jsunittest faModelSetFullScreenTest1 setFullScreen callback begin');
            wnd.setFullScreen(false, (err) => {
                console.log('jsunittest faModelSetFullScreenTest1 window.setFullScreen(false) callback begin' + err.code);
                if (err.code != 0) {
                    console.log('jsunittest faModelSetFullScreenTest1 window.setFullScreen(false) callback fail' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                console.log('jsunittest faModelSetFullScreenTest1 setFullScreen(false) callback end');
                wnd.getProperties((err, data) => {
                    console.log('jsunittest faModelSetFullScreenTest1 window.getProperties callback begin' + err.code);
                    console.log('jsunittest faModelSetFullScreenTest1 window.getProperties callback begin' + JSON.stringify(data));
                    if (err.code != 0) {
                        console.log('jsunittest faModelSetFullScreenTest1 window.getProperties callback fail' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    expect(!data.isFullScreen).assertTrue();
                    console.log('jsunittest faModelSetFullScreenTest1 window.getProperties callback end');
                    wnd.setFullScreen(true, (err) => {
                        if (err.code != 0) {
                            console.log('jsunittest faModelSetFullScreenTest1 window.setFullScreen(true) callback fail' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        }
                        console.log('jsunittest faModelSetFullScreenTest1 setFullScreen(true) callback end');
                        wnd.getProperties((err, data) => {
                            console.log('jsunittest faModelSetFullScreenTest1 window.getProperties callback begin' + err.code);
                            console.log('jsunittest faModelSetFullScreenTest1 window.getProperties callback begin' + JSON.stringify(data));
                            if (err.code != 0) {
                                console.log('jsunittest faModelSetFullScreenTest1 window.getProperties callback fail' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            }
                            expect(data.isFullScreen).assertTrue();
                            console.log('jsunittest faModelSetFullScreenTest1 window.getProperties callback end');
                            done();
                        })
                    })
                })
            })
        }).catch((err) => {
            console.log('jsunittest setFullScreenTest1 window.getTopWindow fail : ' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    });

    /**
     * @tc.number    SUB_WINDOW_FAMODELSETLAYOUTFULLSCREEN_JSAPI_001
     * @tc.name      Test faModelSetLayoutFullScreenTest1
     * @tc.desc      Set window and layout to full screen.
     */
    it('faModelSetLayoutFullScreenTest1', 0, async function(done) {
        console.log('jsunittest faModelSetLayoutFullScreenTest1 begin')
        window.getTopWindow().then(wnd => {
            console.log('jsunittest faModelSetLayoutFullScreenTest1 window.getTopWindow wnd: ' + wnd);
            expect(wnd != null).assertTrue();
            wnd.setFullScreen(true, (err) => {
                console.log('jsunittest faModelSetLayoutFullScreenTest1 wnd.setFullScreen(true) callback begin');
                if (err.code != 0) {
                    console.log('jsunittest faModelSetLayoutFullScreenTest1 window.setFullScreen callback fail' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                console.log('jsunittest faModelSetLayoutFullScreenTest1 wnd.setFullScreen(true) callback end');
                wnd.getProperties((err, data) => {
                    if (err.code != 0) {
                        console.log('jsunittest faModelSetLayoutFullScreenTest1 window.getProperties callback fail' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    expect(data.isFullScreen).assertTrue();
                    wnd.setLayoutFullScreen(true, (err) => {
                        if (err.code != 0) {
                            console.log('jsunittest faModelSetLayoutFullScreenTest1 window.setLayoutFullScreen callback fail' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        }
                        console.log('jsunittest faModelSetLayoutFullScreenTest1 wnd.setLayoutFullScreen(true) callback end');
                        wnd.getProperties((err, data) => {
                            if (err.code != 0) {
                                console.log('jsunittest faModelSetLayoutFullScreenTest1 window.getProperties callback fail' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            }
                            console.log('jsunittest faModelSetLayoutFullScreenTest1 wnd.getProperties callback end');
                            expect(data.isLayoutFullScreen).assertTrue();
                            done()
                        })
                    })
                })
            })
        }).catch((err) => {
            console.log('jsunittest faModelSetLayoutFullScreenTest1 window.getTopWindow fail : ' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number    SUB_WINDOW_FAMODELSETLAYOUTFULLSCREEN_JSAPI_002
     * @tc.name      Test faModelSetLayoutFullScreenTest2
     * @tc.desc      Set the window to full screen, the layout is not full screen.
     */
    it('faModelSetLayoutFullScreenTest2', 0, async function(done) {
        console.log('jsunittest faModelSetLayoutFullScreenTest2 begin');
        window.getTopWindow().then(wnd => {
            console.log('jsunittest faModelSetLayoutFullScreenTest2 window.getTopWindow wnd: ' + wnd);
            expect(wnd != null).assertTrue();
            wnd.setFullScreen(true, (err) => {
                console.log('jsunittest faModelSetLayoutFullScreenTest2 wnd.setFullScreen(true) callback begin');
                if (err.code != 0) {
                    console.log('jsunittest faModelSetLayoutFullScreenTest2 window.setFullScreen(true) callback fail' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                console.log('jsunittest faModelSetLayoutFullScreenTest2 wnd.setFullScreen(true) callback end');
                wnd.getProperties((err, data) => {
                    if (err.code != 0) {
                        console.log('jsunittest faModelSetLayoutFullScreenTest2 window.getProperties callback fail' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    expect(data.isFullScreen).assertTrue();
                    wnd.setLayoutFullScreen(false, (err) => {
                        if (err.code != 0) {
                            console.log('jsunittest faModelSetLayoutFullScreenTest2 window.setLayoutFullScreen(false) callback fail' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        }
                        console.log('jsunittest faModelSetLayoutFullScreenTest2 wnd.setLayoutFullScreen(false) callback end');
                        wnd.getProperties((err, data) => {
                            if (err.code != 0) {
                                console.log('jsunittest faModelSetLayoutFullScreenTest2 window.getProperties callback fail' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            }
                            console.log('jsunittest faModelSetLayoutFullScreenTest2 wnd.getProperties callback end');
                            expect(!data.isLayoutFullScreen).assertTrue();
                            done();
                        })
                    })
                })
            })
        }).catch((err) => {
            console.log('jsunittest faModelSetLayoutFullScreenTest2 window.getTopWindow fail : ' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number    SUB_WINDOW_FAMODELSETLAYOUTFULLSCREEN_JSAPI_003
     * @tc.name      Test faModelSetLayoutFullScreenTest3
     * @tc.desc      Set the window to be non-full-screen and the layout to be full-screen.
     */
    it('faModelSetLayoutFullScreenTest3', 0, async function(done) {
        console.log('jsunittest faModelSetLayoutFullScreenTest3 begin');
        window.getTopWindow().then(wnd => {
            console.log('jsunittest faModelSetLayoutFullScreenTest3 window.getTopWindow wnd: ' + wnd);
            expect(wnd != null).assertTrue();
            wnd.setFullScreen(false, (err) => {
                console.log('jsunittest faModelSetLayoutFullScreenTest3 wnd.setFullScreen(false) callback begin');
                if (err.code != 0) {
                    console.log('jsunittest faModelSetLayoutFullScreenTest3 window.setFullScreen callback fail' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                console.log('jsunittest faModelSetLayoutFullScreenTest3 wnd.setFullScreen(false) callback end');
                wnd.getProperties((err, data) => {
                    if (err.code != 0) {
                        console.log('jsunittest faModelSetLayoutFullScreenTest3 window.getProperties callback fail' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    expect(!data.isFullScreen).assertTrue();
                    wnd.setLayoutFullScreen(true, (err) => {
                        if (err.code != 0) {
                            console.log('jsunittest faModelSetLayoutFullScreenTest3 window.setLayoutFullScreen callback fail' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        }
                        console.log('jsunittest faModelSetLayoutFullScreenTest3 wnd.setLayoutFullScreen(true) callback end');
                        wnd.getProperties((err, data) => {
                            if (err.code != 0) {
                                console.log('jsunittest faModelSetLayoutFullScreenTest3 window.getProperties callback fail' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            }
                            console.log('jsunittest faModelSetLayoutFullScreenTest3 wnd.getProperties callback end');
                            expect(data.isLayoutFullScreen).assertTrue();
                            done()
                        })
                    })
                })
            })
        }).catch((err) => {
            console.log('jsunittest faModelSetLayoutFullScreenTest3 window.getTopWindow fail : ' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number    SUB_WINDOW_FAMODELSETLAYOUTFULLSCREEN_JSAPI_004
     * @tc.name      Test faModelSetLayoutFullScreenTest4
     * @tc.desc      Setting window and layouts to be non-fullscreen.
     */
    it('faModelSetLayoutFullScreenTest4', 0, async function(done) {
        console.log('jsunittest faModelSetLayoutFullScreenTest4 begin');
        window.getTopWindow().then(wnd => {
            console.log('jsunittest faModelSetLayoutFullScreenTest4 window.getTopWindow wnd: ' + wnd);
            expect(wnd != null).assertTrue();
            wnd.setFullScreen(false, (err) => {
                console.log('jsunittest faModelSetLayoutFullScreenTest4 wnd.setFullScreen(true) callback begin');
                if (err.code != 0) {
                    console.log('jsunittest faModelSetLayoutFullScreenTest4 window.setFullScreen callback fail' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                console.log('jsunittest faModelSetLayoutFullScreenTest4 wnd.setFullScreen(true) callback end');
                wnd.getProperties((err, data) => {
                    if (err.code != 0) {
                        console.log('jsunittest faModelSetLayoutFullScreenTest4 window.getProperties callback fail' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }
                    expect(!data.isFullScreen).assertTrue();
                    wnd.setLayoutFullScreen(false, (err) => {
                        if (err.code != 0) {
                            console.log('jsunittest faModelSetLayoutFullScreenTest4 window.setLayoutFullScreen callback fail' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        }
                        console.log('jsunittest faModelSetLayoutFullScreenTest4 wnd.setLayoutFullScreen(true) callback end');
                        wnd.getProperties((err, data) => {
                            if (err.code != 0) {
                                console.log('jsunittest faModelSetLayoutFullScreenTest4 window.getProperties callback fail' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            }
                            console.log('jsunittest faModelSetLayoutFullScreenTest4 wnd.getProperties callback end');
                            expect(!data.isLayoutFullScreen).assertTrue();
                            done();
                        })
                    })
                })
            })
        }).catch((err) => {
            console.log('jsunittest faModelSetLayoutFullScreenTest4 window.getTopWindow fail : ' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    });

    /**
     * @tc.number    SUB_WINDOW_FAMODELFIND_JSAPI_001
     * @tc.name      Test faModelFindTest1
     * @tc.desc      Query main window.
     */
    it('faModelFindTest1', 0, async function(done) {
        console.log('jsunittest faModelFindTest1 begin');
        window.find('main window0', (err, data) => {
            if (err) {
                console.log('jsunittest faModelFindTest1 wnd.find fail, err : ' + JSON.stringify(err));
                expect(err.code).assertEqual(120);
                done();
            } else {
                console.log('jsunittest faModelFindTest1 wnd.find fail');
                expect().assertFail();
                done();
            }
        })
    })

    /**
     * @tc.number    SUB_WINDOW_FAMODELFIND_JSAPI_002
     * @tc.name      Test faModelFindTest2
     * @tc.desc      Query for non-existing windows
     */
    it('faModelFindTest2', 0, async function(done) {
        console.log('jsunittest findTest2 begin');
        window.find('nonexist', (err, data) => {
            if (err) {
                console.log('jsunittest faModelFindTest2 wnd.find fail, err : ' + JSON.stringify(err));
                expect(err.code).assertEqual(120);
                done();
            } else {
                console.log('jsunittest faModelFindTest2 wnd.find success');
                expect().assertFail();
                done();
            }
        })
    })

    /**
     * @tc.number    SUB_WMS_FAMODELISSHOWING_JSAPI_002
     * @tc.name      Test faModelIsShowingTest2.
     * @tc.desc      To verify the function of obtaining the display status when a window is hidden and then displayed.
     */
    it('faModelIsShowingTest2', 0, async function(done) {
        console.log('jsunittest faModelIsShowingTest2 begin');
        window.getTopWindow().then(wnd => {
            console.log('jsunittest faModelIsShowingTest2 getTopWindow wnd: ' + wnd);
            expect(wnd != null).assertTrue();
            wnd.hide((err) => {
                if (err.code != 0) {
                    console.log('jsunittest faModelIsShowingTest2 window.hide fail err ' + JSON.stringify(err));
                    done();
                }
                wnd.isShowing((err, data) => {
                    if (err.code != 0) {
                        console.log('jsunittest faModelIsShowingTest2 window.isShowing fail err ' + JSON.stringify(err));
                        done();
                    }
                    expect(!data).assertTrue();
                    wnd.show((err) => {
                        if (err.code != 0) {
                            console.log('jsunittest faModelIsShowingTest2 window.show fail err ' + JSON.stringify(err));
                            done();
                        }
                        wnd.isShowing((err, data) => {
                            if (err.code != 0) {
                                console.log('jsunittest faModelIsShowingTest2 window.isShowing fail err ' + JSON.stringify(err));
                                done();
                            }
                            expect(data).assertTrue();
                            done();
                        })
                    })
                })
            })
        }).catch((err) => {
            console.log('jsunittest faModelIsShowingTest2 window.getTopWindow fail : ' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    });

    /**
     * @tc.number    SUB_WMS_FAMODELSETCOLORSPACE_JSAPI_003
     * @tc.name      Test faModelSetColorSpaceTest3.
     * @tc.desc      To verify the setting of the wide color gamut color space.
     */
    it('faModelSetColorSpaceTest3', 0, async function(done) {
        console.log('jsunittest faModelSetColorSpaceTest3 begin');
        window.getTopWindow().then(wnd => {
            console.log('jsunittest faModelSetColorSpaceTest3 wnd: ' + wnd);
            expect(wnd != null).assertTrue();
            wnd.setColorSpace(1, (err) => {
                console.log('jsunittest faModelSetColorSpaceTest3 setColorSpace callback begin' + JSON.stringify(err));
                if (err.code != 0) {
                    console.log('jsunittest faModelSetColorSpaceTest3 setColorSpace callback fail' + JSON.stringify(err.code));
                    expect().assertFail();
                    done();
                }
                wnd.getColorSpace((err, data) => {
                    console.log('jsunittest faModelSetColorSpaceTest3 getColorSpace callback begin' + JSON.stringify(err) + 'data' + JSON.stringify(data));
                    if (err.code != 0) {
                        console.log('jsunittest faModelSetColorSpaceTest3 getColorSpace callback fail ' + JSON.stringify(err.code));
                        expect().assertFail();
                        done();
                    }
                    expect(data == 1).assertTrue();
                    wnd.isSupportWideGamut((err, data) => {
                        console.log('jsunittest faModelSetColorSpaceTest3 getColorSpace callback begin ' + JSON.stringify(err) + 'data' + JSON.stringify(data));
                        if (err.code != 0) {
                            console.log('jsunittest faModelSetColorSpaceTest3 getColorSpace callback fail' + JSON.stringify(err.code));
                            expect().assertFail();
                            done();
                        }
                        expect(data).assertTrue();
                        done();
                    })
                })
            })
        }).catch((err) => {
            console.log('jsunittest faModelSetColorSpaceTest3 getTopWindow failed,err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    });

    /**
     * @tc.number    SUB_WMS_FAMODELSETCOLORSPACE_JSAPI_004
     * @tc.name      Test faModelSetColorSpaceTest4.
     * @tc.desc      To verify that the color space of invalid values is set successfully.
     */
    it('faModelSetColorSpaceTest4', 0, async function(done) {
        console.log('jsunittest faModelSetColorSpaceTest4 begin');
        window.getTopWindow().then(wnd => {
            console.log('jsunittest faModelSetColorSpaceTest4 wnd: ' + wnd);
            expect(wnd != null).assertTrue();
            wnd.setColorSpace(-5, (err) => {
                console.log('jsunittest faModelSetColorSpaceTest4 setColorSpace callback begin' + JSON.stringify(err));
                if (err.code != 0) {
                    console.log('jsunittest faModelSetColorSpaceTest4 setColorSpace callback fail' + JSON.stringify(err.code));
                    expect(err.code).assertEqual(130);
                    done();
                } else {
                    expect().assertFail();
                    done();
                }
            })
        }).catch((err) => {
            console.log('jsunittest faModelSetColorSpaceTest4 getTopWindow failed,err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    });

    /**
     * @tc.number    SUB_WMS_FAMODELGETDEFALUTDISPLAY_JSAPI_001
     * @tc.name      Test faModelGetDefaultDisplayTest2.
     * @tc.desc      To test the function if obtaining the default screen.
     */
    it('faModelGetDefaultDisplayTest2', 0, async function(done) {
        console.log('jsunittest faModelGetDefaultDisplayTest2 begin');
        display.getDefaultDisplay((err, data) => {
            if (err.code != 0) {
                console.log('jsunittest faModelGetDefaultDisplayTest2 getDefaultDisplay callback fail' + JSON.stringify(err.code));
                expect().assertFail();
                done();
            }
            console.log('jsunittest faModelGetDefaultDisplayTest2 getDefaultDisplay id :' + JSON.stringify(data));
            console.log('jsunittest faModelGetDefaultDisplayTest2 getDefaultDisplay id :' + data.id);
            console.log('jsunittest faModelGetDefaultDisplayTest2 getDefaultDisplay refreshRate :' + data.refreshRate);
            console.log('jsunittest faModelGetDefaultDisplayTest2 getDefaultDisplay width :' + data.width);
            console.log('jsunittest faModelGetDefaultDisplayTest2 getDefaultDisplay height :' + data.height);
            expect(data.id != null).assertTrue();
            expect(data.refreshRate != null).assertTrue();
            expect(data.width != null).assertTrue();
            expect(data.height != null).assertTrue();
            done();
        }).catch((err) => {
            console.log('jsunittest faModelGetDefaultDisplayTest2 getDefaultDisplay failed,err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number    SUB_WMS_FAMODELGETALLDISPLAY_JSAPI_001
     * @tc.name      Test faModelGetAllDisplayTest2.
     * @tc.desc      To test the function if obtaining the default screen.
     */
    it('faModelGetAllDisplayTest2', 0, async function(done) {
        console.log('jsunittest faModelGetAllDisplayTest2 begin');
        display.getAllDisplay((err, data) => {
            console.log('jsunittest faModelGetAllDisplayTest2 callback data' + data);
            if (err.code != 0) {
                console.log('jsunittest faModelGetAllDisplayTest2 getAllDisplay callback fail');
                expect().assertFail();
                done();
            }
            console.log('jsunittest faModelGetAllDisplayTest2 getDefaultDisplay id :' + JSON.stringify(data));
            console.log('jsunittest faModelGetAllDisplayTest2 getDefaultDisplay id :' + data[0].id);
            console.log('jsunittest faModelGetAllDisplayTest2 getDefaultDisplay refreshRate :' + data[0].refreshRate);
            console.log('jsunittest faModelGetAllDisplayTest2 getDefaultDisplay width :' + data[0].width);
            console.log('jsunittest faModelGetAllDisplayTest2 getDefaultDisplay height :' + data[0].height);
            expect(data[0].id != null).assertTrue();
            expect(data[0].refreshRate != null).assertTrue();
            expect(data[0].width != null).assertTrue();
            expect(data[0].height != null).assertTrue();
            done();
        })
    })

    /**
     * @tc.number    SUB_WMS_FAMODELCREATE_JSAPI_001
     * @tc.name      Test faModelCreateTest2.
     * @tc.desc      To verify the function of creating an application subwindow.
     */
    it('faModelCreateTest2', 0, async function(done) {
        console.log('jsunittest faModelCreateTest2 begin');
        window.create('subWindow1', 0, (err, data) => {
            console.log('jsunittest faModelCreateTest2 callback ' + data);
            if (err.code != 0) {
                console.log('jsunittest faModelCreateTest2 create callback fail' + JSON.stringify(err.code));
                expect().assertFail();
                done();
            }
            expect(data != null).assertTrue();
            console.log('jsunittest faModelCreateTest2 callback create success data' + data);
            done();
        });
    });


    /**
     * @tc.number    SUB_WMS_FAMODELDESTROY_JSAPI_002
     * @tc.name      Test faModelDestroyTest2.
     * @tc.desc      Verify that a window is destroyed after being created.
     */
    it('faModelDestroyTest2', 0, async function(done) {
        console.log('jsunittest faModelDestroyTest2 begin');
        window.create('subWindow2', 0, (err, data) => {
            console.log('jsunittest faModelDestroyTest2 create callback begin' + JSON.stringify(data));
            if (err.code != 0) {
                console.log('jsunittest faModelDestroyTest2 create callback fail' + JSON.stringify(err.code));
                expect().assertFail();
                done();
            }
            expect(data != null).assertTrue();
            data.destroy((err) => {
                console.log('jsunittest faModelDestroyTest2 destroy callback begin');
                if (err.code != 0) {
                    console.log('jsunittest faModelDestroyTest2 create callback fail' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                window.find('subWindow2', (err, data) => {
                    console.log('jsunittest faModelDestroyTest2 find callback begin' + JSON.stringify(data));
                    if (err.code != 0) {
                        console.log('jsunittest faModelDestroyTest2 find callback fail' + JSON.stringify(err.code));
                        expect(err.code).assertEqual(120);
                        done();
                    } else {
                        console.log('jsunittest faModelDestroyTest2 find suceess,err : ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }

                })
            })
        })
    })


    /**
     * @tc.number    SUB_WMS_FAMODELSETSYSTEMBARENABLE_JSAPI_002
     * @tc.name      Test faModelSetSystemBarEnableTest2.
     * @tc.desc      To verify the function of setting a scenario that is visible to the system bar.
     */
    it('faModelSetSystemBarEnableTest2', 0, async function(done) {
        console.log('jsunittest faModelSetSystemBarEnableTest2 begin');
        var names = ["status", "navigation"];
        window.getTopWindow((err, data) => {
            if (err.code != 0) {
                console.log('jsunittest faModelSetSystemBarEnableTest2 getTopWindow fail: ' + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            expect(data != null).assertTrue();
            data.setSystemBarEnable(names, (err) => {
                if (err.code != 0) {
                    console.log('jsunittest faModelSetSystemBarEnableTest2 getTopWindow fail' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                } else {
                    console.log('jsunittest faModelSetSystemBarEnableTest2 setSystemBarEnable success');
                    expect(true).assertTrue();
                    done();
                }
            })
        })
    })


    /**
     * @tc.number    SUB_WMS_FAMODELSETSYSTEMBARPROPERTIES_JSAPI_002
     * @tc.name      Test faModelSetSystemBarPropertiesTest2.
     * @tc.desc      To verify the function of setting system bar attributes.
     */
    it('faModelSetSystemBarPropertiesTest2', 0, async function(done) {
        console.log('jsunittest faModelSetSystemBarPropertiesTest2 begin');
        var SystemBarProperties = {
            statusBarColor: '#ff00ff',
            navigationBarColor: '#00ff00',
            isStatusBarLightIcon: true,
            isNavigationBarLightIcon: false,
            statusBarContentColor: '#ffffff',
            navigationBarContentColor: '#00ffff'
        };
        window.getTopWindow((err, data) => {
            if (err.code != 0) {
                console.log('jsunittest faModelSetSystemBarPropertiesTest2 getTopWindow fail: ' + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            expect(data != null).assertTrue();
            data.setSystemBarProperties(SystemBarProperties, (err) => {
                if (err.code != 0) {
                    console.log('jsunittest faModelSetSystemBarPropertiesTest2 setSystemBarProperties fail' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                console.log('jsunittest faModelSetSystemBarPropertiesTest2 setSystemBarProperties success');
                done();
            })
        })
    });

    /**
     * @tc.number    SUB_WMS_FAMODELONOFF_JSAPI_004
     * @tc.name      Test faModelOnOffTest4.
     * @tc.desc      To verify the function of enabling and disabling the listening function of the display device.
     */
    it('faModelOnOffTest4', 0, async function(done) {
        console.log('jsunittest faModelOnOffTest4 begin');
        var listenerStatus; //1表示开启,其他为关闭
        var callback = (data) => {
            listenerStatus = data;
            console.log('jsunittest faModelOnOffTest4 create callback' + JSON.stringify(data));
        }
        console.log('jsunittest faModelOnOffTest4 listenerStatus :' + listenerStatus);
        console.log('jsunittest faModelOnOffTest4 typeof listenerStatus' + typeof listenerStatus);
        display.on('add', callback);
        expect(typeof(listenerStatus)).assertEqual('undefined');
        display.off('add');
        expect(typeof(listenerStatus)).assertEqual('undefined');
        done();
    })


    /**
     * @tc.number    SUB_WINDOW_FAMODELMOVETO_JSAPI_007
     * @tc.name      Test faModelmoveTest1.
     * @tc.desc      Verify the window movement scenario.
     */
    it('faModelmoveTest1', 0, function() {
        console.log('jsunittest faModelmoveTest1 begin');
        window.getTopWindow().then(wnd => {
            console.log('jsunittest faModelmoveTest1 getTopWindow wnd' + wnd);
            wnd.moveTo(200, 200, (err) => {
                if (err.code) {
                    console.log('jsunittest faModelmoveTest1 moveTo callback fail' + JSON.stringify(err.code));
                    expect().assertFail();
                    done();
                } else {
                    console.log('jsunittest faModelmoveTest1 moveTo callback success');
                    expect(true).assertTrue();
                    done();
                }
            })
        })
    });


    /**
     * @tc.number    SUB_WINDOW_FAMODELRESETSIZETEST_JSAPI_006
     * @tc.name      Test faModelResetSizeTest6.
     * @tc.desc      To verify the function of setting the window size.
     */
    it('faModelResetSizeTest6', 0, function() {
        console.log('jsunittest faModelResetSizeTest6 begin');
        window.getTopWindow().then(wnd => {
            console.log('jsunittest faModelResetSizeTest6 getTopWindow wnd: ' + wnd);
            wnd.resetSize(200, 200, (err) => {
                if (err.code) {
                    console.log('jsunittest faModelResetSizeTest6 resetSize callback fail' + JSON.stringify(err.code));
                    expect().assertFail();
                    done();
                } else {
                    console.log('jsunittest faModelResetSizeTest6 resetSize callback success');
                    expect(true).assertTrue();
                    done();
                }
            })
        })
    });

    /**
     * @tc.number    SUB_WINDOW_FAMODELSETWINDOWTYPE_JSAPI_005
     * @tc.name      Test faModelSetWindowTypeTest5.
     * @tc.desc      To verify the function of setting the window mode to application window.
     */
    it('faModelSetWindowTypeTest5', 0, function() {
        console.log('jsunittest faModelSetWindowTypeTest5 begin');
        window.getTopWindow().then(wnd => {
            console.log('jsunittest faModelSetWindowTypeTest5 getTopWindow wnd: ' + wnd);
            wnd.setWindowType(window.WindowType.TYPE_APP, (err) => {
                if (err.code) {
                    console.log('jsunittest faModelSetWindowTypeTest5 setWindowType callback fail' + JSON.stringify(err.code));
                    expect().assertFail();
                    done();
                } else {
                    console.log('jsunittest faModelSetWindowTypeTest5 setWindowType callback success');
                    expect(true).assertTrue();
                    done();
                }
            })
        })
    });


    /**
     * @tc.number    SUB_WMS_FAMODELSETWINDOWLAYOUTMODE_JSAPI_004
     * @tc.name      Test faModelSetWindowLayoutModeTest4.
     * @tc.desc      To verify the function of setting different window modes.
     */
    it('faModelSetWindowLayoutModeTest4', 0, async function(done) {
        console.log('jsunittest faModelSetWindowLayoutModeTest4 begin');
        await display.getDefaultDisplay().then(dsp => {
            console.log('jsunittest faModelSetWindowLayoutModeTest4 getDefaultDisplay dspID :' + dsp.id);
            window.setWindowLayoutMode(0, dsp.id, (err) => {
                if (err.code) {
                    console.log('jsunittest faModelSetWindowLayoutModeTest4 setWindowLayoutMode callback fail' + JSON.stringify(err.code));
                    expect().assertFail();
                    done();
                } else {
                    console.log('jsunittest faModelSetWindowLayoutModeTest4 setWindowLayoutMode WINDOW_LAYOUT_MODE_TILE success');
                    done();
                }
            })
        }).catch((err) => {
            console.log('jsunittest faModelSetWindowLayoutModeTest4 getDefaultDisplay failed ,err : ' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    });



})