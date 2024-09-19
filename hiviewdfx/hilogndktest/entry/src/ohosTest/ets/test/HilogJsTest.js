/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
// @ts-ignore
import hilogndk from "libhilogndk.so"

export default function HilogJsTest() {
describe('HilogJsTest', function () {

    /**
    * run before testClass
    */
    beforeAll(function () {
        console.info('beforeAll called');
    })

    /**
    * run after testClass
    */
    afterAll(function () {
        console.info('afterAll called');
    })
	/**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_5800
     * @tc.name hilog interface test
     * @tc.desc hilog begin interface test.
     */
    it('testHilogJsApi44', 2, function () {
        console.info('testHilogJsApi44 start');
        const res = hilogndk.ohIsLoggableTest();
        expect(res).assertEqual(true);
        console.info('testHilogJsApi44 end');
    })

    /**
     * @tc.number DFX_DFT_Hiview_Libhilog_Hilog_JS_5900
     * @tc.name hilog interface test
     * @tc.desc hilog begin interface test.
     */
     it('testHilogJsApi45', 2, function () {
        console.info('testHilogJsApi45 start');
        const res = hilogndk.ohPrintTest();
        expect(res).assertEqual(true);
        console.info('testHilogJsApi45 end');
    })
    
    /**
     * @tc.number SUB_DFX_DFT_Hilog_Redirect_0100
     * @tc.name hilog interface test
     * @tc.desc 验证nativie层流水日志打印可通过回调接口重定向直自身js层.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHilogJsApi46', 2, function () {
        console.info('testHilogJsApi46 start');
        try{
            let sum = hilogndk.add(2,3)
            expect(sum).assertEqual(6);

            let msg = hilogndk.getMsg()
            expect(msg).assertContain("666666");
            console.log(`testHilogJsApi46 msg: ${msg}`)
        }catch(error){
            console.log(`testHilogJsApi46 got an error: ${JSON.stringify(error)}`)
            expect().assertFail();
        }
        console.info('testHilogJsApi46 end');
    })

    /**
     * @tc.number SUB_DFX_DFT_Hilog_Redirect_0200
     * @tc.name hilog interface test
     * @tc.desc 验证js层流水日志打印可通过回调接口重定向直自身js层.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHilogJsApi47', 2, function () {
        console.info('testHilogJsApi47 start');
        try{
            let sum = hilogndk.add(2,3)

            hilog.info(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0100')
            let msg = hilogndk.getMsg()
            expect(msg).assertContain("hilogJs0100");
            console.log(`testHilogJsApi47 msg -1: ${msg}`)

            hilog.warn(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0200')
            msg = hilogndk.getMsg()
            expect(msg).assertContain("hilogJs0200");
            console.log(`testHilogJsApi47 msg -2: ${msg}`)

            hilog.error(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0300')
            msg = hilogndk.getMsg()
            expect(msg).assertContain("hilogJs0300");
            console.log(`testHilogJsApi47 msg -3: ${msg}`)

            hilog.fatal(0x3200, "HILOGTEST", "%{public}s", 'hilogJs0400')
            msg = hilogndk.getMsg()
            expect(msg).assertContain("hilogJs0400");
            console.log(`testHilogJsApi47 msg -4: ${msg}`)

        }catch(error){
            console.log(`testHilogJsApi47 got an error: ${JSON.stringify(error)}`)
            expect().assertFail();
        }

        console.info('testHilogJsApi47 end');
    })
  })
}
