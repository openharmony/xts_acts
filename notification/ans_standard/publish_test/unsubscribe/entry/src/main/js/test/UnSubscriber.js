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
import notify from '@ohos.notification'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
var time = 500
describe('ActsAnsUnSubscriberTest', function () {
    console.debug("===============ActsAnsUnSubscriberTest start=================>");
    function onConnecteOne() {
        console.debug("===============Ans_UnSubscriber_0100 onConnecte=================>");
    }
    function onDisconnectOne() {
        console.debug("===============Ans_UnSubscriber_0100 onDisconnect=================>");
    }

    function onDisconnectTestNine() {
        console.debug("=======Ans_UnSubscriber_0900 onDisconnectTestNine =================>");
        expect().assertFail();
    }

    /*
     * @tc.number: Ans_UnSubscriber_0900
     * @tc.name: unsubscribe(subscriber: NotificationSubscriber, callback: AsyncCallback<void>): void;
     * @tc.desc: Verify that after the subscribe fails, the unsubscribe fails(callback)
     */
    it('Ans_UnSubscriber_0900', 0, async function (done) {
        console.info("===========Ans_UnSubscriber_0900 start=============>");
        var subscriber ={
            onConnect:"",
            onDisconnect:onDisconnectTestNine
        }
        notify.subscribe(subscriber, (err)=>{
            console.debug("Ans_UnSubscriber_0900 subscribeCallbackNine err.code=================>"+err.code);
            expect(err.code != 0).assertEqual(true);
            notify.unsubscribe(subscriber, (err)=>{
                console.debug("Ans_UnSubscriber_0900 unsubscribe err.code=================>"+err.code);
                expect(err.code != 0).assertEqual(true);
            });
        });
        setTimeout(function(){
            console.debug("===========Ans_UnSubscriber_0900 setTimeout=============>");
            done();
        }, time);
    })

    function onDisconnectTestTen() {
        console.debug("=======Ans_UnSubscriber_1000 onDisconnectTestTen =================>");
        expect().assertFail();
    }

    /*
     * @tc.number: Ans_UnSubscriber_1000
     * @tc.name: unsubscribe(subscriber: NotificationSubscriber): Promise<void>;
     * @tc.desc: Verify that after the subscribe fails, the unsubscribe fails(promise)
     */
    it('Ans_UnSubscriber_1000', 0, async function (done) {
        console.info("===========Ans_UnSubscriber_1000 start=============>");
        var subscriber = {
            onConnect:"",
            onDisconnect:onDisconnectTestTen
        }
        notify.subscribe(subscriber, (err)=>{
            notify.unsubscribe(subscriber).then((err)=>{
                console.debug("=======Ans_UnSubscriber_1000 subscribe then err=================>"+err.code);
            }).catch((err)=>{
                console.debug("=======Ans_UnSubscriber_1000 subscribe catch err=================>"+err.code);
                expect(err.code != 0).assertEqual(true);
            });
        });
        setTimeout(function(){
            console.debug("===========Ans_UnSubscriber_1000 setTimeout=============>");
            done();
        }, time);
    })
})

