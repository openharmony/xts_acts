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
import app from '@system.app'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'
import window from '@ohos.window'

describe('window_api_test', function () {
	var windowTypeArr = [];
	var windowTypeDic = {
		'APP_WINDOW_BASE': 1,
		'APP_MAIN_WINDOW_BASE': 1,
		'WINDOW_TYPE_APP_MAIN_WINDOW': 1,
		'APP_MAIN_WINDOW_END': 1,
		'APP_SUB_WINDOW_BASE': 1000,
		'WINDOW_TYPE_MEDIA': 1000,
		'WINDOW_TYPE_APP_SUB_WINDOW': 1001,
		'APP_SUB_WINDOW_END': 1001,
		'APP_WINDOW_END': 1001,
		'SYSTEM_WINDOW_BASE': 2000,
		'BELOW_APP_SYSTEM_WINDOW_BASE': 2000,
		'WINDOW_TYPE_WALLPAPER': 2000,
		'WINDOW_TYPE_DESKTOP': 2001,
		'BELOW_APP_SYSTEM_WINDOW_END': 2001,
		'ABOVE_APP_SYSTEM_WINDOW_BASE': 2100,
		'WINDOW_TYPE_APP_LAUNCHING': 2100,
		'WINDOW_TYPE_DOCK_SLICE': 2101,
		'WINDOW_TYPE_INCOMING_CALL': 2102,
		'WINDOW_TYPE_SEARCHING_BAR': 2103,
		'WINDOW_TYPE_SYSTEM_ALARM_WINDOW': 2104,
		'WINDOW_TYPE_INPUT_METHOD_FLOAT': 2105,
		'WINDOW_TYPE_FLOAT': 2106,
		'WINDOW_TYPE_TOAST': 2107,
		'WINDOW_TYPE_STATUS_BAR': 2108,
		'WINDOW_TYPE_PANEL': 2109,
		'WINDOW_TYPE_KEYGUARD': 2110,
		'WINDOW_TYPE_VOLUME_OVERLAY': 2111,
		'WINDOW_TYPE_NAVIGATION_BAR': 2112,
		'WINDOW_TYPE_DRAGGING_EFFECT': 2113,
		'WINDOW_TYPE_POINTER': 2114,
		'WINDOW_TYPE_LAUNCHER_RECENT': 2115,
		'WINDOW_TYPE_LAUNCHER_DOCK': 2116,
		'ABOVE_APP_SYSTEM_WINDOW_END': 2116,
		'SYSTEM_WINDOW_END': 2116
	}
	var windowCount = 2022;
	var topWindow = null;
	const DELAY_TIME = 3000;
	const TRUE_FLAG = true;

	beforeAll(function (done) {
		windowTypeArr = Object.keys(windowTypeDic);
		console.log('jsunittest beforeAll begin')
		window.getTopWindow().then(wnd => {
			console.log('jsunittest beforeAll window.getTopWindow wnd: ' + wnd)
			if (wnd) {
				topWindow = wnd;
			} else {
				console.log('jsunittest beforeAll window.getTopWindow empty');
			}
		}, (err) => {
			console.log('jsunittest beforeAll window.getTopWindow failed, err : ' + JSON.stringify(err));
		})
		setTimeout(() => {
			done();
		}, 5000);
	})
	beforeEach(function (done) {
		if (topWindow) {
			topWindow.show().then(() => {
				console.log('jsunittest beforeEach wnd.show success');
			}, (err) => {
				console.log('jsunittest beforeEach wnd.show failed, err : ' + JSON.stringify(err));
			})
			topWindow.setFullScreen(false).then(() => {
				console.log('jsunittest beforeEach wnd.setFullScreen(false) success');
			}, (err) => {
				console.log('jsunittest beforeEach wnd.setFullScreen(false) failed, err : ' + JSON.stringify(err));
			})
			setTimeout(() => {
				done();
			}, DELAY_TIME);
		} else {
			done();
		}
	})
	afterEach(function () {
		windowCount++;
	})
	afterAll(function () {
	})

	/**
	 * @tc.number     SUB_WINDOW_HIDE_SHOW_JSAPI_001
	 * @tc.name       Test hideOrShowTest1
	 * @tc.desc       set window hidden
	 */
	it('hideOrShowTest1', 0, async function (done) {
		console.log('jsunittest hideOrShowTest1 begin')
		window.getTopWindow().then(wnd => {
			console.log('jsunittest hideOrShowTest1 window.getTopWindow wnd: ' + wnd)
			expect(!!wnd).assertTrue();
			wnd.hide().then(() => {
				console.log('jsunittest hideOrShowTest1 wnd.hide success');
				expect(TRUE_FLAG).assertTrue();
				done();
			}, (err) => {
				console.log('jsunittest hideOrShowTest1 wnd.hide failed, err : ' + JSON.stringify(err));
				expect(TRUE_FLAG).assertFail();
				done();
			})
		}, (err) => {
			console.log('jsunittest hideOrShowTest1 window.getTopWindow failed, err : ' + JSON.stringify(err));
			expect(TRUE_FLAG).assertFail();
			done();
		})
	})

	/**
	 * @tc.number     SUB_WINDOW_HIDE_SHOW_JSAPI_001
	 * @tc.name       Test hideOrShowTest1
	 * @tc.desc       Set the window to hide and then show
	 */
	it('hideOrShowTest2', 0, async function (done) {
		console.log('jsunittest hideOrShowTest2 begin')
		window.getTopWindow().then(wnd => {
			console.log('jsunittest hideOrShowTest2 window.getTopWindow wnd: ' + wnd)
			expect(!!wnd).assertTrue();
			wnd.hide().then(() => {
				console.log('jsunittest hideOrShowTest2 wnd.hide success');
				wnd.show().then(() => {
					console.log('jsunittest hideOrShowTest2 wnd.show success');
					expect(TRUE_FLAG).assertTrue()
					done()
				}, (err) => {
					console.log('jsunittest hideOrShowTest2 wnd.show failed, err : ' + JSON.stringify(err));
					expect(TRUE_FLAG).assertFail();
					done();
				})
			}, (err) => {
				console.log('jsunittest hideOrShowTest2 wnd.hide failed, err : ' + JSON.stringify(err));
				expect(TRUE_FLAG).assertFail();
				done();
			})
		}, (err) => {
			console.log('jsunittest hideOrShowTest2 window.getTopWindow failed, err : ' + JSON.stringify(err));
			expect(TRUE_FLAG).assertFail();
			done();
		})
	})

	/**
	 * @tc.number     SUB_WINDOW_GETPROPERTIES_JSAPI_001
	 * @tc.name       Test getPropertiesTest1
	 * @tc.desc       Get the current application main window properties
	 */
	it('getPropertiesTest1', 0, async function (done) {
		console.log('jsunittest getPropertiesTest1 begin')
		window.getTopWindow().then(wnd => {
			console.log('jsunittest getPropertiesTest1 window.getTopWindow wnd: ' + wnd)
			expect(!!wnd).assertTrue();
			wnd.getProperties().then((data) => {
				console.log('jsunittest getPropertiesTest1 wnd.getProperties success, data : ' + JSON.stringify(data));
				expect(!!data).assertTrue();
				expect(!!data.type).assertTrue();
				expect(!!data.windowRect).assertTrue();
				done()
			}, (err) => {
				console.log('jsunittest getPropertiesTest1 wnd.getProperties failed, err : ' + JSON.stringify(err));
				expect(TRUE_FLAG).assertFail();
				done();
			})
		}, (err) => {
			console.log('jsunittest getPropertiesTest1 window.getTopWindow failed, err : ' + JSON.stringify(err));
			expect(TRUE_FLAG).assertFail();
			done();
		})
	})

	/**
	 * @tc.number     SUB_WINDOW_GETAVOIDAREA_JSAPI_001
	 * @tc.name       Test getAvoidAreaTest1
	 * @tc.desc       Get SystemUI type avoidance area
	 */
	it('getAvoidAreaTest1', 0, async function (done) {
		console.log('jsunittest getAvoidAreaTest1 this.context begin');
		window.getTopWindow().then(wnd => {
			console.log('jsunittest getAvoidAreaTest1 window.getTopWindow wnd: ' + wnd);
			expect(!!wnd).assertTrue();
			wnd.getAvoidArea(0).then((data) => {
				console.log('jsunittest getAvoidAreaTest1 wnd.getAvoidArea success, data :' + JSON.stringify(data));
				expect(!!data).assertTrue();
				expect(!!data.topRect).assertTrue();
				expect(!!data.rightRect).assertTrue();
				expect(!!data.bottomRect).assertTrue();
				expect(!!data.leftRect).assertTrue();
				done()
			}, (err) => {
				console.log('jsunittest getAvoidAreaTest1 wnd.getAvoidArea failed, err : ' + JSON.stringify(err));
				expect(TRUE_FLAG).assertFail();
				done();
			})
		}, (err) => {
			console.log('jsunittest getAvoidAreaTest1 window.getTopWindow failed, err : ' + JSON.stringify(err));
			expect(TRUE_FLAG).assertFail();
			done();
		})
	})

	/**
	 * @tc.number     SUB_WINDOW_GETAVOIDAREA_JSAPI_002
	 * @tc.name       Test getAvoidAreaTest2
	 * @tc.desc       Get Notch type avoidance area
	 */
	it('getAvoidAreaTest2', 0, async function (done) {
		console.log('jsunittest getAvoidAreaTest2 pages/index/index begin');
		window.getTopWindow().then(wnd => {
			console.log('jsunittest getAvoidAreaTest2 window.getTopWindow wnd: ' + wnd);
			expect(!!wnd).assertTrue();
			wnd.getAvoidArea(1).then((data) => {
				console.log('jsunittest getAvoidAreaTest2 wnd.getAvoidArea success, data :' + JSON.stringify(data));
				expect(!!data).assertTrue();
				expect(!!data.topRect).assertTrue();
				expect(!!data.rightRect).assertTrue();
				expect(!!data.bottomRect).assertTrue();
				expect(!!data.leftRect).assertTrue();
				done()
			}, (err) => {
				console.log('jsunittest getAvoidAreaTest2 wnd.getAvoidArea failed, err : ' + JSON.stringify(err));
				expect(TRUE_FLAG).assertFail();
				done();
			})
		}, (err) => {
			console.log('jsunittest getAvoidAreaTest2 window.getTopWindow failed, err : ' + JSON.stringify(err));
			expect(TRUE_FLAG).assertFail();
			done();
		})
	})

	/**
	 * @tc.number     SUB_WINDOW_GETAVOIDAREA_JSAPI_003
	 * @tc.name       Test getAvoidAreaTest3
	 * @tc.desc       Get system gesture type avoidance area
	 */
	it('getAvoidAreaTest3', 0, async function (done) {
		console.log('jsunittest getAvoidAreaTest3 pages/index/ begin')
		window.getTopWindow().then(wnd => {
			console.log('jsunittest getAvoidAreaTest3 window.getTopWindow wnd: ' + wnd)
			expect(!!wnd).assertTrue();
			wnd.getAvoidArea(3).then((data) => {
				console.log('jsunittest getAvoidAreaTest3 wnd.getAvoidArea success, data :' + JSON.stringify(data));
				expect(!!data).assertTrue();
				expect(!!data.topRect).assertTrue();
				expect(!!data.rightRect).assertTrue();
				expect(!!data.bottomRect).assertTrue();
				expect(!!data.leftRect).assertTrue();
				done()
			}, (err) => {
				console.log('jsunittest getAvoidAreaTest3 wnd.getAvoidArea failed, err : ' + JSON.stringify(err));
				expect(TRUE_FLAG).assertFail();
				done();
			})
		}, (err) => {
			console.log('jsunittest getAvoidAreaTest3 window.getTopWindow failed, err : ' + JSON.stringify(err));
			expect(TRUE_FLAG).assertFail();
			done();
		})
	})

	/**
	 * @tc.number     SUB_WINDOW_SETFULLSCREEN_JSAPI_001
	 * @tc.name       Test setFullScreenTest1
	 * @tc.desc       Set the window to be non-fullscreen first and then fullscreen
	 */
	it('setFullScreenTest1', 0, async function (done) {
		console.log('jsunittest setFullScreenTest1 begin')
		window.getTopWindow().then(wnd => {
			console.log('jsunittest setFullScreenTest1 window.getTopWindow wnd: ' + wnd)
			expect(!!wnd).assertTrue();
			console.log('jsunittest setFullScreenTest1 setFullScreen begin')
			wnd.setFullScreen(false).then(() => {
				console.log('jsunittest setFullScreenTest1 wnd.setFullScreen(false) success');
				wnd.getProperties().then((data) => {
					console.log('jsunittest setFullScreenTest1 wnd.getProperties success, data : ' + JSON.stringify(data));
					expect(!!data).assertTrue();
					expect(!data.isFullScreen).assertTrue();
					wnd.setFullScreen(true).then(() => {
						console.log('jsunittest setFullScreenTest1 wnd.setFullScreen(true) success');
						wnd.getProperties().then((data) => {
							console.log('jsunittest setFullScreenTest1 wnd.getProperties success, data : ' + JSON.stringify(data));
							expect(!!data).assertTrue();
							expect(data.isFullScreen).assertTrue();
							done();
						}, (err) => {
							console.log('jsunittest setFullScreenTest1 wnd.getProperties failed, err : ' + JSON.stringify(err));
							expect(TRUE_FLAG).assertFail();
							done();
						})
					}, (err) => {
						console.log('jsunittest setFullScreenTest1 wnd.setFullScreen(true) failed, err : ' + JSON.stringify(err));
						expect(TRUE_FLAG).assertFail();
						done();
					})
				}, (err) => {
					console.log('jsunittest setFullScreenTest1 wnd.getProperties failed, err : ' + JSON.stringify(err));
					expect(TRUE_FLAG).assertFail();
					done();
				})
			}, (err) => {
				console.log('jsunittest setFullScreenTest1 wnd.setFullScreen(false) failed, err : ' + JSON.stringify(err));
				expect(TRUE_FLAG).assertFail();
				done();
			})
			console.log('jsunittest setFullScreenTest1 setFullScreen end')
		}, (err) => {
			console.log('jsunittest setFullScreenTest1 window.getTopWindow failed, err : ' + JSON.stringify(err));
			expect(TRUE_FLAG).assertFail();
			done();
		})
	})

	/**
	 * @tc.number     SUB_WINDOW_SETLAYOUTFULLSCREEN_JSAPI_001
	 * @tc.name       Test setLayoutFullScreenTest1
	 * @tc.desc       Set window and layout to full screen
	 */
	it('setLayoutFullScreenTest1', 0, async function (done) {
		console.log('jsunittest setLayoutFullScreenTest1 begin')
		window.getTopWindow().then(wnd => {
			console.log('jsunittest setLayoutFullScreenTest1 window.getTopWindow wnd: ' + wnd)
			expect(!!wnd).assertTrue();
			wnd.setFullScreen(true).then(() => {
				console.log('jsunittest setLayoutFullScreenTest1 wnd.setFullScreen(true) success');
				wnd.getProperties().then((data) => {
					console.log('jsunittest setLayoutFullScreenTest1 wnd.getProperties success, data : ' + JSON.stringify(data));
					expect(!!data).assertTrue();
					expect(data.isFullScreen).assertTrue();
					wnd.setLayoutFullScreen(true).then(() => {
						console.log('jsunittest setLayoutFullScreenTest1 wnd.setLayoutFullScreen(true) success');
						wnd.getProperties().then((data) => {
							console.log('jsunittest setLayoutFullScreenTest1 wnd.getProperties success, data : ' + JSON.stringify(data));
							expect(!!data).assertTrue();
							expect(data.isLayoutFullScreen).assertTrue();
							done()
						}, (err) => {
							console.log('jsunittest setLayoutFullScreenTest1 wnd.getProperties failed, err : ' + JSON.stringify(err));
							expect(TRUE_FLAG).assertFail();
							done();
						})
					}, (err) => {
						console.log('jsunittest setLayoutFullScreenTest1 wnd.setLayoutFullScreen(true) failed, err : ' + JSON.stringify(err));
						expect(TRUE_FLAG).assertFail();
						done();
					})
				}, (err) => {
					console.log('jsunittest setLayoutFullScreenTest1 wnd.getProperties failed, err : ' + JSON.stringify(err));
					expect(TRUE_FLAG).assertFail();
				})
			}, (err) => {
				console.log('jsunittest setLayoutFullScreenTest1 wnd.setFullScreen(true) failed, err : ' + JSON.stringify(err));
				expect(TRUE_FLAG).assertFail();
				done();
			})
		}, (err) => {
			console.log('jsunittest setLayoutFullScreenTest1 window.getTopWindow failed, err : ' + JSON.stringify(err));
			expect(TRUE_FLAG).assertFail();
			done();
		})
	})

	/**
	 * @tc.number     SUB_WINDOW_SETLAYOUTFULLSCREEN_JSAPI_002
	 * @tc.name       Test setLayoutFullScreenTest2
	 * @tc.desc       Set the window to full screen, the layout is not full screen
	 */
	it('setLayoutFullScreenTest2', 0, async function (done) {
		console.log('jsunittest setLayoutFullScreenTest2 begin')
		window.getTopWindow().then(wnd => {
			console.log('jsunittest setLayoutFullScreenTest2 window.getTopWindow wnd: ' + wnd)
			expect(!!wnd).assertTrue();
			wnd.setFullScreen(true).then(() => {
				console.log('jsunittest setLayoutFullScreenTest2 wnd.setFullScreen(true) success');
				wnd.getProperties().then((data) => {
					console.log('jsunittest setLayoutFullScreenTest2 wnd.getProperties success, data : ' + JSON.stringify(data));
					expect(!!data).assertTrue();
					expect(data.isFullScreen).assertTrue();
					wnd.setLayoutFullScreen(false).then(() => {
						console.log('jsunittest setLayoutFullScreenTest2 wnd.setLayoutFullScreen(false) success');
						wnd.getProperties().then((data) => {
							console.log('jsunittest setLayoutFullScreenTest2 wnd.getProperties success, data : ' + JSON.stringify(data));
							expect(!!data).assertTrue();
							expect(!data.isLayoutFullScreen).assertTrue();
							done()
						}, (err) => {
							console.log('jsunittest setLayoutFullScreenTest2 wnd.getProperties failed, err : ' + JSON.stringify(err));
							expect(TRUE_FLAG).assertFail();
							done();
						})
					}, (err) => {
						console.log('jsunittest setLayoutFullScreenTest2 wnd.setLayoutFullScreen(false) failed, err : ' + JSON.stringify(err));
						expect(TRUE_FLAG).assertFail();
						done();
					})
				}, (err) => {
					console.log('jsunittest setLayoutFullScreenTest2 wnd.getProperties failed, err : ' + JSON.stringify(err));
					expect(TRUE_FLAG).assertFail();
				})
			}, (err) => {
				console.log('jsunittest setLayoutFullScreenTest2 wnd.setFullScreen(true) failed, err : ' + JSON.stringify(err));
				expect(TRUE_FLAG).assertFail();
				done();
			})
		}, (err) => {
			console.log('jsunittest setLayoutFullScreenTest1 window.getTopWindow failed, err : ' + JSON.stringify(err));
			expect(TRUE_FLAG).assertFail();
			done();
		})
	})

	/**
	 * @tc.number     SUB_WINDOW_SETLAYOUTFULLSCREEN_JSAPI_003
	 * @tc.name       Test setLayoutFullScreenTest3
	 * @tc.desc       Set the window to be non-full-screen and the layout to be full-screen
	 */
	it('setLayoutFullScreenTest3', 0, async function (done) {
		console.log('jsunittest setLayoutFullScreenTest3 begin')
		window.getTopWindow().then(wnd => {
			console.log('jsunittest setLayoutFullScreenTest3 window.getTopWindow wnd: ' + wnd)
			expect(!!wnd).assertTrue();
			wnd.setFullScreen(false).then(() => {
				console.log('jsunittest setLayoutFullScreenTest3 wnd.setFullScreen(false) success');
				wnd.getProperties().then((data) => {
					console.log('jsunittest setLayoutFullScreenTest3 wnd.getProperties success, data : ' + JSON.stringify(data));
					expect(!!data).assertTrue();
					expect(!data.isFullScreen).assertTrue();
					wnd.setLayoutFullScreen(true).then(() => {
						console.log('jsunittest setLayoutFullScreenTest3 wnd.setLayoutFullScreen(true) success');
						wnd.getProperties().then((data) => {
							console.log('jsunittest setLayoutFullScreenTest3 wnd.getProperties success, data : ' + JSON.stringify(data));
							expect(!!data).assertTrue();
							expect(data.isLayoutFullScreen).assertTrue();
							done()
						}, (err) => {
							console.log('jsunittest setLayoutFullScreenTest3 wnd.getProperties failed, err : ' + JSON.stringify(err));
							expect(TRUE_FLAG).assertFail();
							done();
						})
					}, (err) => {
						console.log('jsunittest setLayoutFullScreenTest3 wnd.setLayoutFullScreen(true) failed, err : ' + JSON.stringify(err));
						expect(TRUE_FLAG).assertFail();
						done();
					})
				}, (err) => {
					console.log('jsunittest setLayoutFullScreenTest3 wnd.getProperties failed, err : ' + JSON.stringify(err));
					expect(TRUE_FLAG).assertFail();
				})
			}, (err) => {
				console.log('jsunittest setLayoutFullScreenTest3 wnd.setFullScreen(false) failed, err : ' + JSON.stringify(err));
				expect(TRUE_FLAG).assertFail();
				done();
			})
		}, (err) => {
			console.log('jsunittest setLayoutFullScreenTest3 window.getTopWindow failed, err : ' + JSON.stringify(err));
			expect(TRUE_FLAG).assertFail();
			done();
		})
	})

	/**
	 * @tc.number     SUB_WINDOW_SETLAYOUTFULLSCREEN_JSAPI_004
	 * @tc.name       Test setLayoutFullScreenTest4
	 * @tc.desc       Setting windows and layouts to be non-fullscreen
	 */
	it('setLayoutFullScreenTest4', 0, async function (done) {
		console.log('jsunittest setLayoutFullScreenTest4 begin')
		window.getTopWindow().then(wnd => {
			console.log('jsunittest setLayoutFullScreenTest4 window.getTopWindow wnd: ' + wnd)
			expect(!!wnd).assertTrue();
			wnd.setFullScreen(false).then(() => {
				console.log('jsunittest setLayoutFullScreenTest4 wnd.setFullScreen(false) success');
				wnd.getProperties().then((data) => {
					console.log('jsunittest setLayoutFullScreenTest4 wnd.getProperties success, data : ' + JSON.stringify(data));
					expect(!!data).assertTrue();
					expect(!data.isFullScreen).assertTrue();
					wnd.setLayoutFullScreen(false).then(() => {
						console.log('jsunittest setLayoutFullScreenTest4 wnd.setLayoutFullScreen(false) success');
						wnd.getProperties().then((data) => {
							console.log('jsunittest setLayoutFullScreenTest4 wnd.getProperties success, data : ' + JSON.stringify(data));
							expect(!!data).assertTrue();
							expect(!data.isLayoutFullScreen).assertTrue();
							done()
						}, (err) => {
							console.log('jsunittest setLayoutFullScreenTest4 wnd.getProperties failed, err : ' + JSON.stringify(err));
							expect(TRUE_FLAG).assertFail();
							done();
						})
					}, (err) => {
						console.log('jsunittest setLayoutFullScreenTest4 wnd.setLayoutFullScreen(false) failed, err : ' + JSON.stringify(err));
						expect(TRUE_FLAG).assertFail();
						done();
					})
				}, (err) => {
					console.log('jsunittest setLayoutFullScreenTest4 wnd.getProperties failed, err : ' + JSON.stringify(err));
					expect(TRUE_FLAG).assertFail();
				})
			}, (err) => {
				console.log('jsunittest setLayoutFullScreenTest4 wnd.setFullScreen(false) failed, err : ' + JSON.stringify(err));
				expect(TRUE_FLAG).assertFail();
				done();
			})
		}, (err) => {
			console.log('jsunittest setLayoutFullScreenTest4 window.getTopWindow failed, err : ' + JSON.stringify(err));
			expect(TRUE_FLAG).assertFail();
			done();
		})
	})

	/**
	 * @tc.number     SUB_WINDOW_FIND_JSAPI_001
	 * @tc.name       Test findTest1
	 * @tc.desc       Query main window
	 */
	it('findTest1', 0, async function (done) {
		console.log('jsunittest findTest1 begin')
		window.find('main window0').then((data) => {
			console.log('jsunittest findTest1 wnd.find success, data : ' + JSON.stringify(data));
			expect(!!data).assertTrue();
			done()
		}, (err) => {
			console.log('jsunittest findTest1 wnd.find failed, err : ' + JSON.stringify(err));
			expect(TRUE_FLAG).assertTrue();
			done();
		})
	})

	/**
	 * @tc.number     SUB_WINDOW_FIND_JSAPI_002
	 * @tc.name       Test findTest2
	 * @tc.desc       Query for non-existing windows
	 */
	it('findTest2', 0, async function (done) {
		console.log('jsunittest findTest2 begin')
		window.find('nonexist').then((window) => {
			console.log('jsunittest findTest2 wnd.find success, window : ' + JSON.stringify(window));
			expect(!!data).assertTrue();
			done()
		}, (err) => {
			console.log('jsunittest findTest2 wnd.find failed, err : ' + JSON.stringify(err));
			expect(TRUE_FLAG).assertTrue();
			done();
		})
	})
})
