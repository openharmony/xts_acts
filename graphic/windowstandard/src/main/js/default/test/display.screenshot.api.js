/*
 *  * Copyright (C) 2022 Huawei Device Co., Ltd.
 *   * Licensed under the Apache License, Version 2.0 (the "License");
 *    * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *      *
 *       *     http://www.apache.org/licenses/LICENSE-2.0
 *        *
 * Unless required by applicable law or agreed to in writing, software
 *          * distributed under the License is distributed on an "AS IS" BASIS,
 *           * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *            * See the License for the specific language governing permissions and
 * limitations under the License.
 *              */
import app from '@system.app'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'
import display from '@ohos.display'
import screenshot from '@ohos.screenshot'
import image from '@ohos.multimedia.image'

describe('screenshot_test', function () {
	const TRUE_FLAG = true;
	const FALSE_FLAG = false;

	beforeAll(function () {
	})
	beforeEach(function () {
	})
	afterEach(function () {
	})
	afterAll(function () {
	})

	/**
	 * @tc.number     SUB_SCREENSHOT_SAVE_JSAPI_001
	 * @tc.name       Test screenShotSaveTest1
	 * @tc.desc       Set the screenshot area to be larger than the screen width and height
	 */
	it('screenShotSaveTest1', 0, function (done) {
		console.log('jsunittest screenShotSaveTest1 begin');
		display.getDefaultDisplay().then((dsp) => {
			console.log('jsunittest screenShotSaveTest1 display.getDefaultDisplay success, dsp :' + JSON.stringify(dsp));
			var screenshotOptions = {
				screenRect: {
					left: 0,
					top: 0,
					width: 10000,
					height: 10000,
				},
				imageSize: {
					width: 300,
					height: 300
				},
				displayId: dsp.id
			};
			screenshot.save(screenshotOptions).then((data) => {
				console.log('jsunittest screenShotSaveTest1 screenshot.save success, data :' + JSON.stringify(data));
				expect(TRUE_FLAG).assertFail();
				done();
			}, (err) => {
				console.log('jsunittest screenShotSaveTest1 screenshot.save failed, err : ' + JSON.stringify(err));
				expect(TRUE_FLAG).assertTrue();
				done();
			})
		}, (err) => {
			console.log('jsunittest screenShotSaveTest1 display.getDefaultDisplay failed, err : ' + JSON.stringify(err));
			expect(TRUE_FLAG).assertFail();
			done();
		})
	})

	/**
	 * @tc.number     SUB_SCREENSHOT_SAVE_JSAPI_002
	 * @tc.name       Test screenShotSaveTest2
	 * @tc.desc       Set the size of the screenshot area and the generated image to be larger than the screen width and height
	 */
	it('screenShotSaveTest2', 0, function (done) {
		console.log('jsunittest screenShotSaveTest2 begin');
		display.getDefaultDisplay().then((dsp) => {
			console.log('jsunittest screenShotSaveTest2 display.getDefaultDisplay success, dsp :' + JSON.stringify(dsp));
			var screenshotOptions = {
				screenRect: {
					left: 0,
					top: 0,
					width: 10000,
					height: 10000,
				},
				imageSize: {
					width: 3000,
					height: 3000
				},
				displayId: dsp.id
			};
			screenshot.save(screenshotOptions).then((data) => {
				console.log('jsunittest screenShotSaveTest2 screenshot.save success, data :' + JSON.stringify(data));
				expect(TRUE_FLAG).assertFail();
				done();
			}, (err) => {
				console.log('jsunittest screenShotSaveTest2 screenshot.save failed, err : ' + JSON.stringify(err));
				expect(TRUE_FLAG).assertTrue();
				done();
			})
		}, (err) => {
			console.log('jsunittest screenShotSaveTest2 display.getDefaultDisplay failed, err : ' + JSON.stringify(err));
			expect(TRUE_FLAG).assertFail();
			done()
		})
	})

	/**
	 * @tc.number     SUB_SCREENSHOT_SAVE_JSAPI_003
	 * @tc.name       Test screenShotSaveTest3
	 * @tc.desc       Set the screenshot area and the size of the generated image to be smaller than the screen width and height
	 */
	it('screenShotSaveTest3', 0, function (done) {
		console.log('jsunittest screenShotSaveTest3 begin');
		display.getDefaultDisplay().then((dsp) => {
			console.log('jsunittest screenShotSaveTest3 display.getDefaultDisplay success, dsp :' + JSON.stringify(dsp));
			var screenshotOptions = {
				screenRect: {
					left: 0,
					top: 0,
					width: 100,
					height: 100,
				},
				imageSize: {
					width: 300,
					height: 300
				},
				displayId: dsp.id
			};
			screenshot.save(screenshotOptions).then((data) => {
				console.log('jsunittest screenShotSaveTest3 screenshot.save success, data :' + JSON.stringify(data));
				expect(!!data).assertTrue();
				done();
			}, (err) => {
				console.log('jsunittest screenShotSaveTest3 screenshot.save failed, err : ' + JSON.stringify(err));
				expect(TRUE_FLAG).assertFail();
				done();
			})
		}, (err) => {
			console.log('jsunittest screenShotSaveTest3 display.getDefaultDisplay failed, err : ' + JSON.stringify(err));
			expect(TRUE_FLAG).assertFail();
			done();
		})
	})

	/**
	 * @tc.number     SUB_SCREENSHOT_SAVE_JSAPI_004
	 * @tc.name       Test screenShotSaveTest4
	 * @tc.desc       Set the size of the generated image to be smaller than the screen width and height
	 */
	it('screenShotSaveTest4', 0, function (done) {
		console.log('jsunittest screenShotSaveTest4 begin');
		display.getDefaultDisplay().then((dsp) => {
			console.log('jsunittest screenShotSaveTest4 display.getDefaultDisplay success, dsp :' + JSON.stringify(dsp));
			var screenshotOptions = {
				screenRect: {
					left: 0,
					top: 0,
					width: 100,
					height: 100,
				},
				imageSize: {
					width: 3000,
					height: 3000
				},
				displayId: dsp.id
			};
			screenshot.save(screenshotOptions).then((data) => {
				console.log('jsunittest screenShotSaveTest4 screenshot.save success, data :' + JSON.stringify(data));
				expect(!!data).assertTrue()
				done();
			}, (err) => {
				console.log('jsunittest screenShotSaveTest4 screenshot.save failed, err : ' + JSON.stringify(err));
				expect(TRUE_FLAG).assertFail();
				done();
			})
		}, (err) => {
			console.log('jsunittest screenShotSaveTest4 display.getDefaultDisplay failed, err : ' + JSON.stringify(err));
			expect(TRUE_FLAG).assertFail();
			done();
		})
	})

	/**
	 * @tc.number     SUB_SCREENSHOT_SAVE_JSAPI_005
	 * @tc.name       Test screenShotSaveTest5
	 * @tc.desc       Set the screenshot area to a negative value
	 */
	it('screenShotSaveTest5', 0, function (done) {
		console.log('jsunittest screenShotSaveTest5 begin');
		display.getDefaultDisplay().then((dsp) => {
			console.log('jsunittest screenShotSaveTest5 display.getDefaultDisplay success, dsp :' + JSON.stringify(dsp));
			var screenshotOptions = {
				screenRect: {
					left: -50,
					top: -50,
					width: -100,
					height: -100,
				},
				imageSize: {
					width: 300,
					height: 300
				},
				displayId: dsp.id
			};
			screenshot.save(screenshotOptions).then((data) => {
				console.log('jsunittest screenShotSaveTest5 screenshot.save success, data :' + JSON.stringify(data));
				expect(TRUE_FLAG).assertFail();
				done();
			}, (err) => {
				console.log('jsunittest screenShotSaveTest5 screenshot.save failed, err : ' + JSON.stringify(err));
				expect(TRUE_FLAG).assertTrue();
				done();
			})
		}, (err) => {
			console.log('jsunittest screenShotSaveTest5 display.getDefaultDisplay failed, err : ' + JSON.stringify(err));
			expect(TRUE_FLAG).assertFail();
			done();
		})
	})

	/**
	 * @tc.number     SUB_SCREENSHOT_SAVE_JSAPI_006
	 * @tc.name       Test screenShotSaveTest6
	 * @tc.desc       Set the screenshot area to 0
	 */
	it('screenShotSaveTest6', 0, function (done) {
		console.log('jsunittest screenShotSaveTest6 begin');
		display.getDefaultDisplay().then((dsp) => {
			console.log('jsunittest screenShotSaveTest6 display.getDefaultDisplay success, dsp :' + JSON.stringify(dsp));
			var screenshotOptions = {
				screenRect: {
					left: 0,
					top: 0,
					width: 0,
					height: 0,
				},
				imageSize: {
					width: 300,
					height: 300
				},
				displayId: dsp.id
			};
			screenshot.save(screenshotOptions).then((data) => {
				console.log('jsunittest screenShotSaveTest6 screenshot.save success, data :' + JSON.stringify(data));
				expect(!!data).assertTrue()
				done();
			}, (err) => {
				console.log('jsunittest screenShotSaveTest6 screenshot.save failed, err : ' + JSON.stringify(err));
				expect(TRUE_FLAG).assertFail();
				done()
			})
		}, (err) => {
			console.log('jsunittest screenShotSaveTest6 display.getDefaultDisplay failed, err : ' + JSON.stringify(err));
			expect(TRUE_FLAG).assertFail();
			done();
		})
	})

	/**
	 * @tc.number     SUB_SCREENSHOT_SAVE_JSAPI_007
	 * @tc.name       Test screenShotSaveTest7
	 * @tc.desc       Set the generated image size to a negative value
	 */
	it('screenShotSaveTest7', 0, function (done) {
		console.log('jsunittest screenShotSaveTest7 begin');
		display.getDefaultDisplay().then((dsp) => {
			console.log('jsunittest screenShotSaveTest7 display.getDefaultDisplay success, dsp :' + JSON.stringify(dsp));
			var screenshotOptions = {
				screenRect: {
					left: 0,
					top: 0,
					width: 100,
					height: 100,
				},
				imageSize: {
					width: -300,
					height: -300
				},
				displayId: dsp.id
			};
			screenshot.save(screenshotOptions).then((data) => {
				console.log('jsunittest screenShotSaveTest7 screenshot.save success, data :' + JSON.stringify(data));
				expect(TRUE_FLAG).assertFail();
				done();
			}, (err) => {
				console.log('jsunittest screenShotSaveTest7 screenshot.save failed, err : ' + JSON.stringify(err));
				expect(TRUE_FLAG).assertTrue();
				done();
			})
		}, (err) => {
			console.log('jsunittest screenShotSaveTest7 display.getDefaultDisplay failed, err : ' + JSON.stringify(err));
			expect(TRUE_FLAG).assertFail();
			done();
		})
	})

	/**
	 * @tc.number     SUB_SCREENSHOT_SAVE_JSAPI_008
	 * @tc.name       Test screenShotSaveTest8
	 * @tc.desc       Set the generated image size to 0
	 */
	it('screenShotSaveTest8', 0, function (done) {
		console.log('jsunittest screenShotSaveTest8 begin');
		display.getDefaultDisplay().then((dsp) => {
			console.log('jsunittest screenShotSaveTest8 display.getDefaultDisplay success, dsp :' + JSON.stringify(dsp));
			var screenshotOptions = {
				screenRect: {
					left: 0,
					top: 0,
					width: 100,
					height: 100,
				},
				imageSize: {
					width: 0,
					height: 0
				},
				displayId: dsp.id
			};
			screenshot.save(screenshotOptions).then((data) => {
				console.log('jsunittest screenShotSaveTest8 screenshot.save success, data :' + JSON.stringify(data));
				expect(!!data).assertTrue()
				done();
			}, (err) => {
				console.log('jsunittest screenShotSaveTest8 screenshot.save failed, err : ' + JSON.stringify(err));
				expect(TRUE_FLAG).assertFail();
				done();
			})
		}, (err) => {
			console.log('jsunittest screenShotSaveTest8 display.getDefaultDisplay failed, err : ' + JSON.stringify(err));
			expect(TRUE_FLAG).assertFail();
			done();
		})
	})

	/**
	 * @tc.number     SUB_SCREENSHOT_SAVE_JSAPI_009
	 * @tc.name       Test screenShotSaveTest9
	 * @tc.desc       Set the screenshot area and the size of the generated image to be equal to the screen width and height
	 */
	it('screenShotSaveTest9', 0, function (done) {
		console.log('jsunittest screenShotSaveTest9 begin');
		display.getDefaultDisplay().then((dsp) => {
			console.log('jsunittest screenShotSaveTest9 display.getDefaultDisplay success, dsp :' + JSON.stringify(dsp));
			var screenshotOptions = {
				screenRect: {
					left: 0,
					top: 0,
					width: dsp.width,
					height: dsp.height
				},
				imageSize: {
					width: dsp.width,
					height: dsp.height
				},
				displayId: dsp.id
			};
			screenshot.save(screenshotOptions).then((data) => {
				console.log('jsunittest screenShotSaveTest9 screenshot.save success, data :' + JSON.stringify(data));
				expect(!!data).assertTrue()
				done();
			}, (err) => {
				console.log('jsunittest screenShotSaveTest9 screenshot.save failed, err : ' + JSON.stringify(err));
				expect(TRUE_FLAG).assertFail();
			})
		}, (err) => {
			console.log('jsunittest screenShotSaveTest9 display.getDefaultDisplay failed, err : ' + JSON.stringify(err));
			expect(TRUE_FLAG).assertFail();
			done();
		})
	})

	/**
	 * @tc.number     SUB_SCREENSHOT_SAVE_JSAPI_010
	 * @tc.name       Test screenShotSaveTest10
	 * @tc.desc       Take a screenshot of a screen that doesn't exist
	 */
	it('screenShotSaveTest10', 0, function (done) {
		console.log('jsunittest screenShotSaveTest10 begin');
		var screenshotOptions = {
			screenRect: {
				left: 0,
				top: 0,
				width: 100,
				height: 100,
			},
			imageSize: {
				width: 300,
				height: 300
			},
			displayId: null
		};
		screenshot.save(screenshotOptions).then((data) => {
			console.log('jsunittest screenShotSaveTest10 screenshot.save success, data :' + JSON.stringify(data));
			expect(!!data).assertTrue()
			done();
		}, (err) => {
			console.log('jsunittest screenShotSaveTest10 screenshot.save failed, err : ' + JSON.stringify(err));
			expect(TRUE_FLAG).assertFail();
			done();
		})
	})

	/**
	 * @tc.number     SUB_SCREENSHOT_SAVE_JSAPI_011
	 * @tc.name       Test screenShotSaveTest11
	 * @tc.desc       Test screenshot.save API function test11.
	 */
	it('screenShotSaveTest11', 0, function (done) {
		console.log('jsunittest screenShotSaveTest11 begin');
		var screenshotOptions = {
			screenRect: {
				left: 0,
				top: 0,
				width: 100,

				height: 100,
			},
			imageSize: {
				width: 300,
				height: 300
			},
			displayId: 1000
		};
		screenshot.save(screenshotOptions).then((data) => {
			console.log('jsunittest screenShotSaveTest11 screenshot.save success, data :' + JSON.stringify(data));
			expect(TRUE_FLAG).assertFail();
			done();
		}, (err) => {
			console.log('jsunittest screenShotSaveTest11 screenshot.save failed, err : ' + JSON.stringify(err));
			expect(TRUE_FLAG).assertTrue();
			done();
		})
	})
})

