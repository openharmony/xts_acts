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
var time = 1000
describe('ActsAnsActiveTest', function () {
    console.info("===========ActsAnsActiveTest start====================>");

    //consume
   async function consumeCallback(err, data) {
        console.debug("==========================>consumeCallback data : =======================>" + JSON.stringify(data));
        await notify.getAllActiveNotifications((error, data) => {
            console.log("==========================>getAllActiveNotifications1=======================>" + data)
            expect(typeof(data)).assertEqual('object')
            for (let i = 0; i < data.length; i++) {
                console.log("==========================>getAllActiveNotificationshashCode1=======================>" + data[i].hashCode)
                console.log("==========================>getAllActiveNotificationsid1=======================>" + data[i].id)
                console.log("==========================>getAllActiveNotificationslotType1=======================>" + data[i].slotType)
                console.log("==========================>getAllActiveNotificationclassification1=======================>" + data[i].classification)
                console.log("==========================>getAllActiveNotificationsortingKey1=======================>" + data[i].sortingKey)
                console.log("==========================>getAllActiveNotificationscontentType1=======================>" + data[i].content.contentType)
                console.log("==========================>getAllActiveNotificationstitle1=======================>" + data[i].content.normal.title)
                console.log("==========================>getAllActiveNotificationstext1=======================>" + data[i].content.normal.text)
                console.log("==========================>getAllActiveNotificationsadditionalText1=======================>" + data[i].content.normal.additionalText)
            }
        })

      var notificationInfo = await notify.getAllActiveNotifications()
           expect(typeof(notificationInfo)).assertEqual('object')
           for (let i = 0; i < notificationInfo.length; i++) {
               console.log("==========================>getAllActiveNotificationsPromisehashCode1=======================>" + notificationInfo[i].hashCode)
               console.log("==========================>getAllActiveNotificationsPromiseid1=======================>" + notificationInfo[i].id)
               console.log("==========================>getAllActiveNotificationsPromiseslotType1=======================>" + notificationInfo[i].slotType)
               console.log("==========================>getAllActiveNotificationsPromiseclassification1=======================>" + notificationInfo[i].classification)
               console.log("==========================>getAllActiveNotificationsPromisesortingKey1=======================>" + notificationInfo[i].sortingKey)
               console.log("==========================>getAllActiveNotificationsPromisecontentType1=======================>" + notificationInfo[i].content.contentType)
               console.log("==========================>getAllActiveNotificationsPromisetitle1=======================>" + notificationInfo[i].content.normal.title)
               console.log("==========================>getAllActiveNotificationsPromisetext1=======================>" + notificationInfo[i].content.normal.text)
               console.log("==========================>getAllActiveNotificationsPromiseadditionalText1=======================>" + notificationInfo[i].content.normal.additionalText)
           }
    }
    //subscribeOn
    function subscribeOnCallback(err) {
        console.debug("==========================>subscribeOnCallback=======================>");
    }
    //subscribe
    function subscribeCallback(err) {
        console.debug("==========================>subscribeCallback=======================>");
    }
    function publishCallback001(){
        console.log('ActsNotificationTest ACTS_Publish_0100 asyncCallback')
    }

    /*
    * @tc.number: ActsWantAgent_test_0100
    * @tc.name: createSubscriber(),subscribe()
    * @tc.desc: verify the function of createSubscriber,subscribe
    */
    it('ActsActiveSubscriber_test_0100', 0, async function (done) {
        console.debug("===============ActsWantAgent_test_0100======begin====================>");

        var subInfo ={
            onConsume:consumeCallback,
            onConnect:subscribeOnCallback,
        }
        try{
            await notify.subscribe(subInfo,subscribeCallback);
        }catch(err) {
            console.error('=ActsActiveSubscriber_test_0100  订阅 subscribeCallback err:'+err);
        }
        console.debug("===============ActsActiveSubscriber_test_0100=======end===================>");
        done();
        setTimeout(function(){
            console.debug("====>time out ActsActiveSubscriber_test_0100====>");
        }, time);
    })

    /*
    * @tc.number: ACTS_GetActiveNumTest_0100
    * @tc.name: getActiveNotifications(),getActiveNotificationNums()
    * @tc.desc: verify the function of getActiveNotifications,getActiveNotificationNums
    */
    it('ACTS_GetActiveNumTest_0100', 0,async function (done) {
        await notify.publish({
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
        },publishCallback001);
        await notify.publish({
            id: 2,
            content: {
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test2_title",
                    text: "test2_text",
                    additionalText: "test2_additionalText"
                },
            },
            slotType:notify.SlotType.SOCIAL_COMMUNICATION,
            classification:"classification2",
            sortingKey:"sortingKey2",
        },publishCallback001);

        await notify.getActiveNotifications(
            (error,data) => {
                console.log("============PublishgetActiveNotificationsTest1============"+data)
                expect(typeof(data)).assertEqual('object')
                for (let i = 0; i < data.length; i++) {
                    console.log("==========================>PublishgetActiveNotificationsTest1=======================>" + data[i].hashCode)
                    console.log("==========================>PublishgetActiveNotificationsTest1=======================>" + data[i].id)
                    console.log("==========================>PublishgetActiveNotificationsTest1=======================>" + data[i].classification)
                    console.log("==========================>PublishgetActiveNotificationsTest1=======================>" + data[i].sortingKey)
                    console.log("==========================>PublishgetActiveNotificationsTest1=======================>" + data[i].slotType)
                    console.log("==========================>PublishgetActiveNotificationsTest1=======================>" + data[i].content.contentType)
                    console.log("==========================>PublishgetActiveNotificationsTest1=======================>" + data[i].content.normal.title)
                    console.log("==========================>PublishgegetAllActiveNotifications1tActiveNotificationsTest1=======================>" + data[i].content.normal.text)
                    console.log("==========================>PublishgetActiveNotificationsTest1=======================>" + data[i].content.normal.additionalText)
                }
            })

        var promise = await notify.getActiveNotifications();
        expect(typeof(promise)).assertEqual('object')
        for (let i = 0; i < promise.length; i++) {
            console.log("==========================>publishgetAllActiveNotificationsPromisehashCode=======================>" + promise[i].hashCode)
            console.log("==========================>publishgetAllActiveNotificationsPromisehashCode=======================>" + promise[i].id)
            console.log("==========================>publishgetAllActiveNotificationsPromisehashCode=======================>" + promise[i].slotType)
            console.log("==========================>publishgetAllActiveNotificationsPromisehashCode=======================>" + promise[i].classification)
            console.log("==========================>publishgetAllActiveNotificationsPromisehashCode=======================>" + promise[i].sortingKey)
            console.log("==========================>publishgetAllActiveNotificationsPromisehashCode=======================>" + promise[i].content.contentType)
            console.log("==========================>publishgetAllActiveNotificationsPromisehashCode=======================>" + promise[i].content.normal.title)
            console.log("==========================>publishgetAllActiveNotificationsPromisehashCode=======================>" + promise[i].content.normal.text)
            console.log("==========================>publishgetAllActiveNotificationsPromisehashCode=======================>" + promise[i].content.normal.additionalText)
        }

        await notify.getActiveNotificationCount((error,data) => {
            console.log("============getActiveNotificationNumsTest1============"+JSON.stringify(data))
            expect(typeof(data)).assertEqual('number')
        })

       var num =  await notify.getActiveNotificationCount()
            console.log("============getActiveNotificationNumsTest1Promise============"+JSON.stringify(num))
            console.log("============ACTS_PublishTest1_0100 finished============")
            expect(typeof(num)).assertEqual('number')
        done();
        setTimeout(function(){
            console.debug("====>time out ACTS_GetActiveNumTest_0100====>");
        }, time);
    })
})

