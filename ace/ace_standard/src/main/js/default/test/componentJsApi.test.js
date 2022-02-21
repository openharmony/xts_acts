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
        await sleep(5000)
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testAnimateComponent
     * @tc.desc      ACE
     */
    it('testAnimateComponent', 0, async function (done) {
        let result;
        let options = {
            uri: 'pages/animate/index'
        }
        try {
            result = router.push(options)
            console.info("push animate page success " + JSON.stringify(result));
        } catch (err) {
            console.error("push animate page error " + JSON.stringify(result));
        }
        await sleep(5000)
        let pages = router.getState();
        console.info("[router.animate] getState" + JSON.stringify(pages));
        expect("pages/animate/").assertEqual(pages.path);
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testAnimateMotionComponent
     * @tc.desc      ACE
     */
    it('testAnimateMotionComponent', 0, async function (done) {
        let result;
        let options = {
            uri: 'pages/animateMotion/index'
        }
        try {
            result = router.push(options)
            console.info("push animateMotion page success " + JSON.stringify(result));
        } catch (err) {
            console.error("push animateMotion page error " + JSON.stringify(result));
        }
        await sleep(5000)
        let pages = router.getState();
        console.info("[router.animateMotion] getState" + JSON.stringify(pages));
        expect("pages/animateMotion/").assertEqual(pages.path);
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testAnimateTransformComponent
     * @tc.desc      ACE
     */
    it('testAnimateTransformComponent', 0, async function (done) {
        let result;
        let options = {
            uri: 'pages/animateTransform/index'
        }
        try {
            result = router.push(options)
            console.info("push animateTransform page success " + JSON.stringify(result));
        } catch (err) {
            console.error("push animateTransform page error " + JSON.stringify(result));
        }
        await sleep(5000)
        let pages = router.getState();
        console.info("[router.animateTransform] getState" + JSON.stringify(pages));
        expect("pages/animateTransform/").assertEqual(pages.path);
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testTextPathComponent
     * @tc.desc      ACE
     */
    it('testTextPathComponent', 0, async function (done) {
        let result;
        let options = {
            uri: 'pages/textPath/index'
        }
        try {
            result = router.push(options)
            console.info("push textPath page success " + JSON.stringify(result));
        } catch (err) {
            console.error("push textPath page error " + JSON.stringify(result));
        }
        await sleep(5000)
        let pages = router.getState();
        console.info("[router.textPath] getState" + JSON.stringify(pages));
        expect("pages/textPath/").assertEqual(pages.path);
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testTspanComponent
     * @tc.desc      ACE
     */
    it('testTspanComponent', 0, async function (done) {
        let result;
        let options = {
            uri: 'pages/tspan/index'
        }
        try {
            result = router.push(options)
            console.info("push tspan page success " + JSON.stringify(result));
        } catch (err) {
            console.error("push tspan page error " + JSON.stringify(result));
        }
        await sleep(5000)
        let pages = router.getState();
        console.info("[router.tspan] getState" + JSON.stringify(pages));
        expect("pages/tspan/").assertEqual(pages.path);
        done();
    });
});
