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
var imageBuffer
var opts
var pubimage
var time = 1000
describe('ActsAnsPublishImageTest', function () {
    console.info("===========ActsDoNotSubscriberTest start====================>");

    //consume
    function consumeCallbackOne(err,data) {
        console.debug("==========================>consumeDoNotCallback1 data : =======================>" +err+ JSON.stringify(data));
        checkConsumeData(data)
    }
    function consumeCallbackTwo(err,data) {
        console.debug("==========================>consumeDoNotCallback2 data : =======================>" +err+ JSON.stringify(data));
        checkConsumeData(data)
    }
    function checkConsumeData(data){
        expect(typeof(data)).assertEqual("object");
        expect(data.id).assertEqual(1);
        expect(data.content.contentType).assertEqual(notify.ContentType.NOTIFICATION_CONTENT_PICTURE);
        expect(data.content.picture.title).assertEqual("image_title");
        expect(data.content.picture.text).assertEqual("image_text");
        expect(data.content.picture.additionalText).assertEqual("image_additionalText");
        expect(data.content.picture.briefText).assertEqual("image_briefText");
        expect(data.content.picture.expandedTitle).assertEqual("expandedTitle");
//        expect(typeof(data.content.picture.picture)).assertEqual();
        expect(data.slotType).assertEqual(notify.SlotType.SOCIAL_COMMUNICATION);
        expect(data.classification).assertEqual("classification1");
        expect(data.sortingKey).assertEqual("sortingKey1");
    }
    //subscribeOn
    function subscribeOnCallback(err) {
        console.debug("==========================>subscribeDoNotOnCallback=======================>");
    }
    //subscribe
    function subscribeCallback(err) {
        console.debug("==========================>subscribeDoNotCallback=======================>");
    }
    function publishCallback001(){
        console.log('ActsAnsPublishImageTest ACTS_Publish_0100 asyncCallback')
    }
    /*
     * @tc.number: ActsPublishImage_test_0100
     * @tc.name: subscribe()
     * @tc.desc: verify the function of subscribe
     */
    it('ActsPublishImage_test_0100', 0, async function (done) {
        console.debug("===============ActsDoNotSubscriber_test_0100======begin====================>");

        var subInfo ={
            onConsume:consumeCallbackOne,
            onConnecte:subscribeOnCallback,
        }
      try {
          await notify.subscribe(subInfo, subscribeCallback);
      }
        catch(err) {
            console.error('=ActsDoNotSubscriber_test_0100  订阅 subscribeDoNotCallback err:'+err);
        }
        console.debug("===============ActsSubscriber_test_0100=======end3===================>");
        done();
        setTimeout(function(){
            console.debug("====>time out ActsPublishImage_test_0100====>");
        }, time);
    })
    /*
     * @tc.number: ACTS_publishTest_0100
     * @tc.name: publish()
     * @tc.desc: verify the function of publish
     */
    it('ActsPublishImage_test_0200', 0,async function (done) {
        imageBuffer = new ArrayBuffer(32);
        opts = {alphaType: 0, editable: true, pixelFormat: 4, scaleMode: 1, size: {height: 2, width: 3}}
        const promise_Large = image.createPixelMap(imageBuffer, opts);
        promise_Large.then((data) => {
            console.debug("==========================createPixelMap_promise_Large=======================>");
            pubimage = data;
            console.debug("==========================createPixelMap_promise_Large largeIcon=======================>"+pubimage);
           notify.publish({
            id: 1,
            content: {
                contentType: notify.ContentType.NOTIFICATION_CONTENT_PICTURE,
                picture: {
                    title: "image_title",
                    text: "image_text",
                    additionalText: "image_additionalText",
                    briefText:"image_brief",
                    expandedTitle:"expandedTitle",
                    picture:pubimage
                },
            },
            slotType:notify.SlotType.SOCIAL_COMMUNICATION,
            classification:"classification1",
            sortingKey:"sortingKey1",
        },publishCallback001);
        done()
        setTimeout(function(){
            console.debug("====>time out ACTS_publishTest_0100====>");
        }, time);
    })
  })
})

