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
    async function backToIndex() {
        let backToIndexPromise = new Promise((resolve, reject) => {
            setTimeout(() => {
                router.back({
                    uri: 'pages/index/index'
                });
                resolve();
            }, 500);
        });
        let clearPromise = new Promise((resolve, reject) => {
            setTimeout(() => {
                router.clear();
                resolve();
            }, 500);
        });
        await backToIndexPromise.then(() => {
            return clearPromise;
        });
    }

    /**
    * run after testcase
    */
    afterEach(async function () {
        console.info('[aceJsTest] after each called')
        await backToIndex();
        await sleep(1000)
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testButtonComponent
     * @tc.desc      ACE
     */
    it('testButtonComponent', 0, async function (done) {
        console.info('testButtonComponent START');
        let result;
        let options = {
            uri: 'pages/button/index'
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

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0200
     * @tc.name      testChartComponent
     * @tc.desc      ACE
     */
    it('testChartComponent', 0, async function (done) {
        console.info('testButtonComponent START');
        let result;
        let options = {
            uri: 'pages/chart/index'
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

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0300
     * @tc.name      testInputComponent
     * @tc.desc      ACE
     */
    it('testInputComponent', 0, async function (done) {
        console.info('testButtonComponent START');
        let result;
        let options = {
            uri: 'pages/input/index'
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

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0400
     * @tc.name      testSliderComponent
     * @tc.desc      ACE
     */
    it('testSliderComponent', 0, async function (done) {
        console.info('testSliderComponent START');
        let result;
        let options = {
            uri: 'pages/slider/index'
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

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0400
     * @tc.name      testTextComponent
     * @tc.desc      ACE
     */
    it('testTextComponent', 0, async function (done) {
        let result;
        let options = {
            uri: 'pages/text/index'
        }
        try {
            result = router.push(options)
        } catch (err) {
            result = err
        }
        await sleep(1000)
        let pages = router.getState();
        expect("pages/text/").assertEqual(pages.path);
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0400
     * @tc.name      testLabelComponent
     * @tc.desc      ACE
     */
    it('testLabelComponent', 0, async function (done) {
        console.info('testLabelComponent START');
        let result;
        let options = {
            uri: 'pages/label/index'
        }
        try {
            result = router.push(options)
        } catch (err) {
            result = err
        }
        await sleep(1000)
        let pages = router.getState();
        expect("pages/label/").assertEqual(pages.path);
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testDividerComponent
     * @tc.desc      ACE
     */
    it('testDividerComponent', 0, async function (done) {
        let result;
        let options = {
            uri: 'pages/divider/index'
        }
        try {
            result = router.push(options)
        } catch (err) {
            result = err
        }
        await sleep(1000)
        let pages = router.getState();
        expect("pages/divider/").assertEqual(pages.path);
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testGetImageComponent
     * @tc.desc      ACE
     */
    it('testGetImageComponent', 0, async function (done) {
        let result;
        let options = {
            uri: 'pages/image/index'
        }
        try {
            result = router.push(options)
        } catch (err) {
            result = err
        }
        await sleep(1000)
        let pages = router.getState();
        expect("pages/image/").assertEqual(pages.path);
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testGetMenuComponent
     * @tc.desc      ACE
     */
    it('testGetMenuComponent', 0, async function (done) {
        let result;
        let options = {
            uri: 'pages/menu/index'
        }
        try {
            result = router.push(options)
        } catch (err) {
            result = err
        }
        await sleep(1000)
        let pages = router.getState();
        expect("pages/menu/").assertEqual(pages.path);
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testRatingComponent
     * @tc.desc      ACE
     */
    it('testRatingComponent', 0, async function (done) {
        let result;
        let options = {
            uri: 'pages/rating/index'
        }
        try {
            result = router.push(options)
        } catch (err) {
            result = err
        }
        await sleep(1000)
        let pages = router.getState();
        expect("pages/rating/").assertEqual(pages.path);
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testSearchComponent
     * @tc.desc      ACE
     */
    it('testSearchComponent', 0, async function (done) {
        let result;
        let options = {
            uri: 'pages/search/index'
        }
        try {
            result = router.push(options)
        } catch (err) {
            result = err
        }
        await sleep(1000)
        let pages = router.getState();
        expect("pages/search/").assertEqual(pages.path);
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testToolbarComponent
     * @tc.desc      ACE
     */
    it('testToolbarComponent', 0, async function (done) {
        let result;
        let options = {
            uri: 'pages/toolbar/index'
        }
        try {
            result = router.push(options)
        } catch (err) {
            result = err
        }
        await sleep(1000)
        let pages = router.getState();
        expect("pages/toolbar/").assertEqual(pages.path);
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testTextareaComponent
     * @tc.desc      ACE
     */
    it('testTextareaComponent', 0, async function (done) {
        let result;
        let options = {
            uri: 'pages/textarea/index'
        }
        try {
            result = router.push(options)
        } catch (err) {
            result = err
        }
        await sleep(5000)
        let pages = router.getState();
        expect("pages/textarea/").assertEqual(pages.path);
        done();
    });
});
