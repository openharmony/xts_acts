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
import image from '@ohos.multimedia.image'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

var largeBuffer
var smallBuffer
var opts
var subInfo
var largeIcon
var smallIcon
var time = 1000

describe('ActsAnsIconTest', function () {
    console.info("===========ActsAnsIconTest start====================>");

    //consume
    function consumeCallback(err,data) {
        console.debug("==========================consumeCallback data : =======================>" +err+ JSON.stringify(data));
        console.log("==========================consumeCallback smallIcon : =======================>"+JSON.stringify(data.request.smallIcon))
        console.log("==========================consumeCallback largeIcon : =======================>"+JSON.stringify(data.request.largeIcon))
    }

    function subscribeCallback(err) {
        console.info("==========================subscribeCallback start=======================>");
        console.info("================subscribeCallback err : =======================>" + JSON.stringify(err));
        console.info("==========================subscribeCallback end=======================>");
    }

    function publishCallback(err){
        console.info("==========================publishCallback start=======================>");
        console.info("================publishCallback err : =======================>" + JSON.stringify(err));
        console.info("==========================publishCallback end=======================>");
    }
    /*
     * @tc.number: ActsAnsIconTest_0100
     * @tc.name: createPixelMap()
     * @tc.desc: verify the function of subscribe
     */
    it('ActsAnsIconTest_0100', 0, async function (done) {
        console.debug("===============ActsAnsIconTest_0100 start====================>");
        subInfo ={
            onConsume:consumeCallback,
        }
        await notify.subscribe(subInfo,subscribeCallback);

        largeBuffer = new ArrayBuffer(64);
        smallBuffer = new ArrayBuffer(32);
        opts = {alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: {height: 2, width: 3}}
        const promise_Large = image.createPixelMap(largeBuffer, opts);
        promise_Large.then((data) => {
            console.debug("==========================createPixelMap_promise_Large=======================>");
            largeIcon = data;
            console.debug("==========================createPixelMap_promise_Large largeIcon=======================>"+largeIcon);

            const promise_Small = image.createPixelMap(smallBuffer, opts);
            promise_Small.then((data) => {
                console.debug("==========================createPixelMap_promise_Small=======================>");
                smallIcon = data;
                console.debug("==========================createPixelMap_promise_Small smallIcon=======================>"+smallIcon);
                notify.publish({
                    id: 1,
                    content: {
                        contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                        normal: {
                            title: "test1_title",
                            text: "test1_text",
                            additionalText: "test1_additionalText"
                        },
                    },
                    slotType:notify.SlotType.SOCIAL_COMMUNICATION,
                    classification:"classification1",
                    sortingKey:"sortingKey1",
                    smallIcon:smallIcon,
                    largeIcon:largeIcon,
                },publishCallback);
                done();
                setTimeout(function(){
                    console.debug("====>time out ActsAnsIconTest_0100====>");
                }, time);
            });
        })
    })
});


