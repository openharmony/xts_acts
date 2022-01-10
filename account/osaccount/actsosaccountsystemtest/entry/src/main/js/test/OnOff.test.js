/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import osaccount from '@ohos.account.osAccount'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

const TIMEOUTHALF = 500;
const TIMEOUT = 1000;
describe('ActsOsAccountSystemTest', function () {
    function sleep(delay) {
        var start = (new Date()).getTime();
        while((new Date()).getTime() - start < delay) {
            continue;
        }
    }

    /*
     * @tc.number  : ActsOsAccountOnOff_0500
     * @tc.name    : Subscribe and unsubscribing local multi-user
     * @tc.desc    : Verification cannot cancel activating type not subscribed
     */
    it('ActsOsAccountOnOff_0500', 0, async function (done) {
        console.debug("====>ActsOsAccountOnOff_0500 start====");
        var osAccountManager = osaccount.getAccountManager();
        var notOnName = "nameNotSubscribeActivatingTest";
        console.debug("====>get AccountManager finish====");
        function offCallback(){
            console.debug("====>wrongly enter off callback====");
            expect().assertFail();
            done();
        }
        osAccountManager.off("activating", notOnName, offCallback);
        setTimeout(()=>{
            console.debug("====>ActsOsAccountOnOff_0500 end====");
            done();
        }, TIMEOUT); 
    });

    /*
     * @tc.number  : ActsOsAccountOnOff_0600
     * @tc.name    : Subscribe and unsubscribing local multi-user
     * @tc.desc    : Verification cannot cancel activate type not subscribed
     */
    it('ActsOsAccountOnOff_0600', 0, async function (done) {
        console.debug("====>ActsOsAccountOnOff_0600 start====");
        var osAccountManager = osaccount.getAccountManager();
        var notOnName = "nameNotSubscribeActivateTest";
        console.debug("====>get AccountManager finish====");
        function offCallback(){
            console.debug("====>wrongly enter off callback====");
            expect().assertFail();
            done();
        }
        osAccountManager.off("activate", notOnName, offCallback);
        setTimeout(()=>{
            console.debug("====>ActsOsAccountOnOff_0600 end====");
            done();
        }, TIMEOUT);
    });

    /*
     * @tc.number  : ActsOsAccountOnOff_1700
     * @tc.name    : Subscribe and unsubscribing local multi-user
     * @tc.desc    : Validate unsubscribe with parameter type as empty string
     */
    it('ActsOsAccountOnOff_1700', 0, async function (done) {
        console.debug("====>ActsOsAccountOnOff_1700 start====");
        var osAccountManager = osaccount.getAccountManager();
        console.debug("====>get AccountManager finish====");
        function offCallback(){
            console.debug("====>wrongly enter off callback====");
            expect().assertFail();
            done();
        }
        osAccountManager.off("", "osAccountOnOffNameN", offCallback);
        setTimeout(()=>{
            console.debug("====>ActsOsAccountOnOff_1700 end====");
            done();
        }, TIMEOUT); 
    });

    /*
     * @tc.number  : ActsOsAccountOnOff_1800
     * @tc.name    : Subscribe and unsubscribing local multi-user
     * @tc.desc    : Validate unsubscribe with parameter type as other string
     */
    it('ActsOsAccountOnOff_1800', 0, async function (done) {
        console.debug("====>ActsOsAccountOnOff_1800 start====");
        var osAccountManager = osaccount.getAccountManager();
        console.debug("====>get AccountManager finish====");
        function offCallback(){
            console.debug("====>wrongly enter off callback====");
            expect().assertFail();
            done();
        }
        osAccountManager.off("Abc", "osAccountOnOffNameO", offCallback);
        setTimeout(()=>{
            console.debug("====>ActsOsAccountOnOff_1800 end====");
            done();
        }, TIMEOUT); 
    });

    /*
     * @tc.number  : ActsOsAccountOnOff_1900
     * @tc.name    : Subscribe and unsubscribing local multi-user
     * @tc.desc    : Validate unsubscribe with parameter type as undefined
     */
    it('ActsOsAccountOnOff_1900', 0, async function (done) {
        console.debug("====>ActsOsAccountOnOff_1900 start====");
        var osAccountManager = osaccount.getAccountManager();
        console.debug("====>get AccountManager finish====");
        function offCallback(){
            console.debug("====>wrongly enter off callback====");
            expect().assertFail();
            done();
        }
        osAccountManager.off(undefined, "osAccountOnOffNameP", offCallback);
        setTimeout(()=>{
            console.debug("====>ActsOsAccountOnOff_1900 end====");
            done();
        }, TIMEOUT); 
    });

})