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

import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index';



describe('aceJsTest', function () {

    async function sleep(time) {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                resolve()
            }, time)
        }).then(() => {
            console.info(`sleep ${time} over...`)
        })
    }

    /**
    * run after testcase
    */
    afterEach(async function () {
        console.info('[aceJsTest] after each called')
        router.clear();
        await sleep(1000)
    });


    it('testButtonComponent', 0, async function (done) {
        console.info('testButtonComponent START');
        let result;
        let options = {
            uri : 'pages/button/index'
        }
        try {
            result = router.push(options)
            console.info("push button page success " + JSON.stringify(result));
        } catch (err) {
            console.error("push button page error " + JSON.stringify(result));
        }
        await sleep(1000)
        let pages = router.getState();
        console.info("[router.button] getState" + JSON.stringify(pages));
        expect("pages/button/").assertEqual(pages.path);
        done();
    });

    it('testChartComponent', 0, async function (done) {
        console.info('testButtonComponent START');
        let result;
        let options = {
            uri : 'pages/chart/index'
        }
        try {
            result = router.push(options)
            console.info("push button page success " + JSON.stringify(result));
        } catch (err) {
            console.error("push button page error " + JSON.stringify(result));
        }
        await sleep(1000)
        let pages = router.getState();
        console.info("[router.chart] getState" + JSON.stringify(pages));
        expect("pages/chart/").assertEqual(pages.path);
        done();
    });

    it('testInputComponent', 0, async function (done) {
        console.info('testButtonComponent START');
        let result;
        let options = {
            uri : 'pages/input/index'
        }
        try {
            result = router.push(options)
            console.info("push button page success " + JSON.stringify(result));
        } catch (err) {
            console.error("push button page error " + JSON.stringify(result));
        }
        await sleep(1000)
        let pages = router.getState();
        console.info("[router.input] getState" + JSON.stringify(pages));
        expect("pages/input/").assertEqual(pages.path);
        done();
    });

    it('testInputComponent', 0, async function (done) {
        console.info('testButtonComponent START');
        let result;
        let options = {
            uri : 'pages/slider/index'
        }
        try {
            result = router.push(options)
            console.info("push button page success " + JSON.stringify(result));
        } catch (err) {
            console.error("push button page error " + JSON.stringify(result));
        }
        await sleep(1000)
        let pages = router.getState();
        console.info("[router.slider] getState" + JSON.stringify(pages));
        expect("pages/slider/").assertEqual(pages.path);
        done();
    });
});