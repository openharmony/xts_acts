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
	* @tc.name      Test moveTestNegative
	* @tc.desc      Test moveTo API function test 
	* @tc.autor     hekun wx874319
	*/
	it('moveTestNegative',0,function(){
		console.log('jsunittest moveTestNegative begin')
		window.getTopwindow().then(wnd=>{
			console.log('jsunittest moveTestNegative getTopwindow wnd: ' + wnd)
			wnd.moveTo(-200,-200).then(()=>{
				console.log('moveTo(-200,-200) success')
			})
			wnd.moveTo(0,0).then(()=>{
				console.log('moveTo(0,0) success')
			})
		})
	})
