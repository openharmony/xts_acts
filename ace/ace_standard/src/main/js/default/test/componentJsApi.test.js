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
     * @tc.name      testSwiperComponent
     * @tc.desc      ACE
     */
    it('testSwiperComponent', 0, async function (done) {
        let result;
        let options = {
            uri: 'pages/swiper/index'
        }
        try {
            result = router.push(options)
            console.info("push swiper page success " + JSON.stringify(result));
        } catch (err) {
            console.error("push swiper page error " + JSON.stringify(result));
        }
        await sleep(5000)
        let pages = router.getState();
        console.info("[router.swiper] getState" + JSON.stringify(pages));
        expect("pages/swiper/").assertEqual(pages.path);
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testMarqueeComponent
     * @tc.desc      ACE
     */
    it('testMarqueeComponent', 0, async function (done) {
        let result;
        let options = {
            uri: 'pages/marquee/index'
        }
        try {
            result = router.push(options)
            console.info("push marquee page success " + JSON.stringify(result));
        } catch (err) {
            console.error("push marquee page error " + JSON.stringify(result));
        }
        await sleep(5000)
        let pages = router.getState();
        console.info("[router.marquee] getState" + JSON.stringify(pages));
        expect("pages/marquee/").assertEqual(pages.path);
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testStepperComponent
     * @tc.desc      ACE
     */
    it('testStepperComponent', 0, async function (done) {
        let result;
        let options = {
            uri: 'pages/stepper/index'
        }
        try {
            result = router.push(options)
            console.info("push stepper page success " + JSON.stringify(result));
        } catch (err) {
            console.error("push stepper page error " + JSON.stringify(result));
        }
        await sleep(5000)
        let pages = router.getState();
        console.info("[router.stepper] getState" + JSON.stringify(pages));
        expect("pages/stepper/").assertEqual(pages.path);
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testRefreshComponent
     * @tc.desc      ACE
     */
    it('testRefreshComponent', 0, async function (done) {
        let result;
        let options = {
            uri: 'pages/refresh/index'
        }
        try {
            result = router.push(options)
            console.info("push refresh page success " + JSON.stringify(result));
        } catch (err) {
            console.error("push refresh page error " + JSON.stringify(result));
        }
        await sleep(5000)
        let pages = router.getState();
        console.info("[router.refresh] getState" + JSON.stringify(pages));
        expect("pages/refresh/").assertEqual(pages.path);
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testImageAnimatorComponent
     * @tc.desc      ACE
     */
    it('testImageAnimatorComponent', 0, async function (done) {
        let result;
        let options = {
            uri: 'pages/imageAnimator/index'
        }
        try {
            result = router.push(options)
            console.info("push imageAnimator page success " + JSON.stringify(result));
        } catch (err) {
            console.error("push imageAnimator page error " + JSON.stringify(result));
        }
        await sleep(5000)
        let pages = router.getState();
        console.info("[router.imageAnimator] getState" + JSON.stringify(pages));
        expect("pages/imageAnimator/").assertEqual(pages.path);
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testTabsComponent
     * @tc.desc      ACE
     */
    it('testTabsComponent', 0, async function (done) {
        let result;
        let options = {
            uri: 'pages/tabs/index'
        }
        try {
            result = router.push(options)
            console.info("push tabs page success " + JSON.stringify(result));
        } catch (err) {
            console.error("push tabs page error " + JSON.stringify(result));
        }
        await sleep(5000)
        let pages = router.getState();
        console.info("[router.tabs] getState" + JSON.stringify(pages));
        expect("pages/tabs/").assertEqual(pages.path);
        done();
    });
});
