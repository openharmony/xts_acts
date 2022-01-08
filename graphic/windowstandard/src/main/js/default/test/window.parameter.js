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
	* @tc.number    SUB_WINDOW_MOVETO_JSAPI_007
	* @tc.name      Test moveTestNegative.
	* @tc.desc      Test window.moveTo API function test7.
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
	* @tc.number    SUB_WINDOW_RESETSIZE_JSAPI_006
	* @tc.name      Test resetSizeTestLoop.
	* @tc.desc      Test window.resetSize API function test6.
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
	* @tc.number    SUB_WINDOW_SETWINDOWTYPE_JSAPI_008
	* @tc.name      Test setWindowTypeTestZero.
	* @tc.desc      Test window.setWindowType API function test8.
	*/
	it('setWindowTypeTestZero', 0, function(){
		console.log('jsunittest setWindowTypeTestZero begin')
		window.getTopwindow().then(wnd => {
			console.log('jsunittest setWindowTypeTestZero getTopWindow wnd: ' + wnd)
			wnd.setWindowType(window.WindowType.TYPE_APP).then(()=>{
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
	* @tc.number    SUB_WINDOW_SETWINDOWTYPE_JSAPI_009
	* @tc.name      Test setWindowTypeTestThirty.
	* @tc.desc      Test window.setWindowType API function test9.
	*/
	it('setWindowTypeTestThirty', 0, function(){
		console.log('jsunittest setWindowTypeTestThirty begin')
		window.getTopwindow().then(wnd => {
			console.log('jsunittest setWindowTypeTestThirty getTopwindow wnd: ' + wnd)
			wnd.setWindowType(window.WindowType.TYPE_SYSTEM_ALTER).then(()=>{
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
	* @tc.number    SUB_WINDOW_SETWINDOWTYPE_JSAPI_010
	* @tc.name      Test setWindowTypeTestSeventy.
	* @tc.desc      Test window.setWindowType API function test10.
	*/
	it('setWindowTypeTestSeventy', 0, function(){
		console.log('jsunittest setWindowTypeTestSeventy begin')
		window.getTopwindow().then(wnd => {
			console.log('jsunittest setWindowTypeTestSeventy getTopwindow wnd: ' + wnd)
			wnd.setWindowType(window.WindowType.TYPE_SYSTEM_VOLUME).then(()=>{
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
	* @tc.number    SUB_WINDOW_SETWINDOWTYPE_JSAPI_012
	* @tc.name      Test setWindowTypeTestNinety.
	* @tc.desc      Test window.setWindowType API function test12.
	*/
	it('setWindowTypeTestNinety', 0, function(){
		console.log('jsunittest setWindowTypeTestNinety begin')
		window.getTopwindow().then(wnd => {
			console.log('jsunittest setWindowTypeTestNinety getTopwindow wnd: ' + wnd)
			wnd.setWindowType(window.WindowType.TYPE_SYSTEM_PANEL).then(()=>{
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
	* @tc.number    SUB_WINDOW_SETWINDOWTYPE_JSAPI_011
	* @tc.name      Test setWindowTypeTestOrderChange.
	* @tc.desc      Test window.setWindowType API function test11.
	*/
	it('setWindowTypeTestOrderChange', 0, function(){
		console.log('jsunittest setWindowTypeTestOrderChange begin')
		window.getTopwindow().then(wnd => {
			console.log('jsunittest setWindowTypeTestOrderChange getTopwindow wnd: ' + wnd)
			wnd.setWindowType(window.WindowType.TYPE_APP).then(()=>{
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
	* @tc.number    SUB_WINDOW_SETWINDOWTYPE_JSAPI_013
	* @tc.name      Test setWindowTypeTest15.
	* @tc.desc      Test window.setWindowType API function test13.
	*/
	it('setWindowTypeTest15', 0, function(){
		console.log('jsunittest setWindowTypeTest15 begin')
		window.getTopwindow().then(wnd => {
			console.log('jsunittest setWindowTypeTest15 getTopwindow wnd: ' + wnd)
			wnd.setWindowType(window.WindowType.TYPE_SYSTEM_ALTER).then(()=>{
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
	* @tc.number    SUB_WINDOW_SETWINDOWTYPE_JSAPI_014
	* @tc.name      Test setWindowTypeTest16.
	* @tc.desc      Test window.setWindowType API function test14.
	*/
	it('setWindowTypeTest16', 0, function(){
		console.log('jsunittest setWindowTypeTest16 begin')
		window.getTopwindow().then(wnd => {
			console.log('jsunittest setWindowTypeTest16 getTopwindow wnd: ' + wnd)
			wnd.setWindowType(window.WindowType.TYPE_SYSTEM_VOLUME).then(()=>{
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
	* @tc.number    SUB_WINDOW_SETWINDOWTYPE_JSAPI_015
	* @tc.name      Test setWindowTypeTest17.
	* @tc.desc      Test window.setWindowType API function test15.
	*/
	it('setWindowTypeTest17', 0, function(){
		console.log('jsunittest setWindowTypeTest17 begin')
		window.getTopwindow().then(wnd => {
			console.log('jsunittest setWindowTypeTest17 getTopwindow wnd: ' + wnd)
			wnd.setWindowType(window.WindowType.TYPE_SYSTEM_PANEL).then(()=>{
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
	* @tc.number    SUB_WINDOW_MOVETO_JSAPI_006
	* @tc.name      Test moveTest6.
	* @tc.desc      Test window.moveTo API function test6.
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