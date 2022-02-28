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

import I18n from '@ohos.i18n'
import Intl from '@ohos.intl'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('PerfTest', function () {
    console.log('*************start PerfTest*************');

    let EXETIME = 1000;

    beforeAll(function(){
        console.log('step before all cases.');
    })

    beforeEach(function(){
        console.log('step before every case.');
    })

    afterEach(function(){
        console.log('step after every case.');
    })

    afterAll(function(){
        console.log('step after all cases.');
    })

    /* *
    * @tc.number SUB_GLOBAL_PERF_JS_0100
    * @tc.name test the performance of getSystemLanguage
    * @tc.desc check the performance of getSystemLanguage
    */
    it('perf_test_0100', 0, function () {
        console.log('perf_test_0100 ' + 'start');
        let startTime = new Date().getTime();
        let lang = 'test';
        for(let i = 0; i < EXETIME; i++){
            lang = I18n.getSystemLanguage();
        }
        let exeTime = new Date().getTime() - startTime;
        let avgTime = exeTime/EXETIME;
        console.log('perf_test_0100--' + 'lang: ' + lang + ' exeTime: ' + exeTime + ' avgTime: ' + avgTime);
        if(avgTime < 10){
            expect(true).assertTrue();
        }
        else{
            expect(false).assertTrue();
        }
    })

    console.log('*************end PerfTest*************');
})