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
import app from '@system.app'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
import window from '@ohos.window'


describe('window_test', function(){
    var wnd;
    beforeAll(function(){
    })
    beforeEach(function(){
    })
    afterEach(function(){
    })
    afterAll(function(){
    })
	
	/**
	* @tc.number    GRAPHIC__FUNCTION_WINDOW_TESTWINDOW_JS_API_1900
	* @tc.name      Test moveTestNegative.
	* @tc.desc      Test window.moveTo API function test.
	*/
	it('moveTestNegative', 0,function(){
		console.log('jsunittest moveTestNegative begin')
		window.getTopwindow().then(wnd => {
			console.log('jsunittest moveTestNegative getTopwindow wnd: ' + wnd)
			wnd.moveTo(-200,-200).then(()=>{
				console.log('moveTo(-200,-200) success')
			})
			wnd.moveTo(0,0).then(()=>{
				console.log('moveTo(0,0) success')
			})
		})
	})
	
	/**
	* @tc.number    GRAPHIC__FUNCTION_WINDOW_TESTWINDOW_JS_API_2000
	* @tc.name      Test resetSizeTestLoop.
	* @tc.desc      Test window.resetSize API function test.
	*/
	it('resetSizeLoop', 0, function(){
        var width = 100;
		var height = 100;
		console.log('jsunittest resetSizeLoop begin')
		window.getTopwindow().then(wnd =>{
		    console.log('jsunittest resetSizeLoop getTopWindow wnd: ' + wnd)
		    for (let i = 1; i <= 5; i++){
			    width = width * i;
			    height = height * i;
			    wnd.resetSize(width, height).then(()=>{
				   console.log('jsunittest  resetSizeTestLoop success')
			    })
		    }
		    wnd.resetSize(0,0).then(()=>{
			console.log('jsunittest resetSizeTsetLoop wnd.resetSize(0,0) success')
		    })
	   })
    })

	/**
	* @tc.number    GRAPHIC__FUNCTION_WINDOW_TESTWINDOW_JS_API_2100
	* @tc.name      Test setWindowTypeTestZero.
	* @tc.desc      Test window.setWindowType API function test.
	*/
	it('setWindowTypeTestZero', 0, function(){
		console.log('jsunittest setWindowTypeTestZero begin')
		window.getTopwindow().then(wnd => {
			console.log('jsunittest setWindowTypeTestZero getTopWindow wnd: ' + wnd)
			wnd.setWindowType(0).then(()=>{
				console.log('jsunittest setWindowTypeTestZero wnd.setWindowType(0) success')
			})
			wnd.moveTo(200,200).then(()=>{
				console.log('jsunittest  setWindowTypeTestZero wnd.moveTo(200,200) success')
			})
			wnd.resetSize(200,200).then(()=>{
				console.log('jsunittest setWindowTypeTestZero wnd.resetSize(200,200) success')
			})
		})
	})

	/**
	* @tc.number    GRAPHIC__FUNCTION_WINDOW_TESTWINDOW_JS_API_2200
	* @tc.name      Test setWindowTypeTestThirty.
	* @tc.desc      Test window.setWindowType API function test.
	*/
	it('setWindowTypeTestThirty', 0, function(){
		console.log('jsunittest setWindowTypeTestThirty begin')
		window.getTopwindow().then(wnd => {
			console.log('jsunittest setWindowTypeTestThirty getTopwindow wnd: ' + wnd)
			wnd.setWindowType(30).then(()=>{
				console.log('jsunittest setWindowTypeTestThirty wnd.setWindowType(30) success')
			})
			wnd.moveTo(200, 200).then(()=>{
				console.log('jsunittest setWindowTypeTestThirty wnd.moveTo(200, 200) success')
			})
			wnd.resetSize(200, 200).then(()=>{
				console.log('jsunittest setWindowTypeTestThirty wnd.resetSize(200, 200) success')
			})
		})
	})

	/**
	* @tc.number    GRAPHIC__FUNCTION_WINDOW_TESTWINDOW_JS_API_2300
	* @tc.name      Test setWindowTypeTestSeventy.
	* @tc.desc      Test window.setWindowType API function test.
	*/
	it('setWindowTypeTestSeventy', 0, function(){
		console.log('jsunittest setWindowTypeTestSeventy begin')
		window.getTopwindow().then(wnd => {
			console.log('jsunittest setWindowTypeTestSeventy getTopwindow wnd: ' + wnd)
			wnd.setWindowType(70).then(()=>{
				console.log('jsunittest setWindowTypeTestSeventy wnd.setWindowType(70) success')
			})
			wnd.moveTo(200, 200).then(()=>{
				console.log('jsunittest setWindowTypeTestSeventy wnd.moveTo(200, 200) success')
			})
			wnd.resetSize(200, 200).then(()=>{
				console.log('jsunittest setWindowTypeTestSeventy wnd.resetSize(200, 200) success')
			})	
		})
	})

	/**
	* @tc.number    GRAPHIC__FUNCTION_WINDOW_TESTWINDOW_JS_API_2400
	* @tc.name      Test setWindowTypeTestNinety.
	* @tc.desc      Test window.setWindowType API function test.
	*/
	it('setWindowTypeTestNinety', 0, function(){
		console.log('jsunittest setWindowTypeTestNinety begin')
		window.getTopwindow().then(wnd => {
			console.log('jsunittest setWindowTypeTestNinety getTopwindow wnd: ' + wnd)
			wnd.setWindowType(90).then(()=>{
				console.log('jsunittest setWindowTypeTestNinety wnd.setWindowType(90) success')
			})
			wnd.moveTo(200, 200).then(()=>{
				console.log('jsunittest setWindowTypeTestNinety wnd.moveTo(200, 200) success')
			})
			wnd.resetSize(200, 200).then(()=>{
				console.log('jsunittest setWindowTypeTestNinety wnd.resetSize(200, 200) success')
			})	
		})
	})

	/**
	* @tc.number    GRAPHIC__FUNCTION_WINDOW_TESTWINDOW_JS_API_2500
	* @tc.name      Test setWindowTypeTestOrderChange.
	* @tc.desc      Test window.setWindowType API function test.
	*/
	it('setWindowTypeTestOrderChange', 0, function(){
		console.log('jsunittest setWindowTypeTestOrderChange begin')
		window.getTopwindow().then(wnd => {
			console.log('jsunittest setWindowTypeTestOrderChange getTopwindow wnd: ' + wnd)
			wnd.setWindowType(0).then(()=>{
				console.log('jsunittest setWindowTypeTestOrderChange wnd.setWindowType(0) success')
			})
			wnd.resetSize(200, 200).then(()=>{
				console.log('jsunittest setWindowTypeTestOrderChange wnd.resetSize(200, 200) success')
			})
			wnd.moveTo(200, 200).then(()=>{
				console.log('jsunittest setWindowTypeTestOrderChange wnd.moveTo(200, 200) success')
			})	
		})
	})

	/**
	* @tc.number    GRAPHIC__FUNCTION_WINDOW_TESTWINDOW_JS_API_2600
	* @tc.name      Test setWindowTypeTest15.
	* @tc.desc      Test window.setWindowType API function test.
	*/
	it('setWindowTypeTest15', 0, function(){
		console.log('jsunittest setWindowTypeTest15 begin')
		window.getTopwindow().then(wnd => {
			console.log('jsunittest setWindowTypeTest15 getTopwindow wnd: ' + wnd)
			wnd.setWindowType(30).then(()=>{
				console.log('jsunittest setWindowTypeTest15 wnd.setWindowType(30) success')
			})
			wnd.resetSize(200, 200).then(()=>{
				console.log('jsunittest setWindowTypeTest15 wnd.resetSize(200, 200) success')
			})
			wnd.moveTo(200, 200).then(()=>{
				console.log('jsunittest setWindowTypeTest15 wnd.moveTo(200, 200) success')
			})	
		})
	})

	/**
	* @tc.number    GRAPHIC__FUNCTION_WINDOW_TESTWINDOW_JS_API_2700
	* @tc.name      Test setWindowTypeTest16.
	* @tc.desc      Test window.setWindowType API function test.
	*/
	it('setWindowTypeTest16', 0, function(){
		console.log('jsunittest setWindowTypeTest16 begin')
		window.getTopwindow().then(wnd => {
			console.log('jsunittest setWindowTypeTest16 getTopwindow wnd: ' + wnd)
			wnd.setWindowType(70).then(()=>{
				console.log('jsunittest setWindowTypeTest16 wnd.setWindowType(70) success')
			})
			wnd.resetSize(200, 200).then(()=>{
				console.log('jsunittest setWindowTypeTest16 wnd.resetSize(200, 200) success')
			})
			wnd.moveTo(200, 200).then(()=>{
				console.log('jsunittest setWindowTypeTest16 wnd.moveTo(200, 200) success')
			})	
		})
	})

	/**
	* @tc.number    GRAPHIC__FUNCTION_WINDOW_TESTWINDOW_JS_API_2800
	* @tc.name      Test setWindowTypeTest17.
	* @tc.desc      Test window.setWindowType API function test.
	*/
	it('setWindowTypeTest17', 0, function(){
		console.log('jsunittest setWindowTypeTest17 begin')
		window.getTopwindow().then(wnd => {
			console.log('jsunittest setWindowTypeTest17 getTopwindow wnd: ' + wnd)
			wnd.setWindowType(90).then(()=>{
				console.log('jsunittest setWindowTypeTest17 wnd.setWindowType(90) success')
			})
			wnd.resetSize(200, 200).then(()=>{
				console.log('jsunittest setWindowTypeTest17 wnd.resetSize(200, 200) success')
			})
			wnd.moveTo(200, 200).then(()=>{
				console.log('jsunittest setWindowTypeTest17 wnd.moveTo(200, 200) success')
			})	
		})
	})

	/**
	* @tc.number    GRAPHIC__FUNCTION_WINDOW_TESTWINDOW_JS_API_2900
	* @tc.name      Test moveTest6.
	* @tc.desc      Test window.moveTo API function test.
	*/
	it('moveTest6', 0, function(){
		console.log('jsunittest moveTest6 begin')
		window.getTopwindow().then(wnd => {
			console.log('jsunittest moveTest6 getTopwindow wnd: ' + wnd)
			wnd.moveTo(-200, 200).then(()=>{
				console.log('jsunittest moveTest6 wnd.moveTo(-200, 300) success')
			})
			wnd.moveTo(200, -300).then(()=>{
				console.log('jsunittest moveTest6 wnd.moveTo(200, -300) success')
			})	
		})
	})
})