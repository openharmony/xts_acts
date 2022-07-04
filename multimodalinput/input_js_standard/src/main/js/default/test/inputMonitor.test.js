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
import inputDevice from ' @ohos.multimodalInput.inputMonitor';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect
} from 'deccjsunit/index'

describe('MultimodalInput_test', function () {


    it("inputDevice::off-01", 0, function () {
       
        inputMonitor.on("touch",(event)=>{
            if(event){
                expect(true).assertTure();
            }else{
                expect(false).assertTrue();
            }
        })
        inputMonitor.off("touch")
    })

    it("inputDevice::off-01", 0, function () {
       
        inputMonitor.on("mouse",(event)=>{
            if(event){
                expect(true).assertTure();
            }else{
                expect(false).assertTrue();
            }
        })
        inputMonitor.off("touch")
    })

})