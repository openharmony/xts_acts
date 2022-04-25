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
describe('ActsAnsGetAllActiveTestXts', function () {
    console.info("===========ActsAnsGetAllActiveTest  start====================>");
    function getAllCallback(err, data){
        console.log("Ans_GetAllActive_0100 getAllCallback ============>");
        var i;
        console.log("Ans_GetAllActive_0100 getAllCallback  data.length============>"+data.length);
        expect(data.length).assertEqual(2);
        console.log("Ans_GetAllActive_0100 getAllCallback  data============>"+JSON.stringify(data));
        for (i = 0; i < data.length; i++) {
            if (i == 0){
                expect(data[i].content.normal.title).assertEqual("test_title_otherApp");
                console.log("=======Ans_GetAllActive_0100 getCallback title=====>"+data[i].content.normal.title)
                expect(data[i].content.normal.text).assertEqual("test_text_otherApp");
                console.log("=======Ans_GetAllActive_0100 getCallback text========>"+data[i].content.normal.text)
                expect(data[i].content.normal.additionalText).assertEqual("test_additionalText_otherApp");
                console.log("===Ans_GetAllActive_0100 getCallback text====>"+data[i].content.normal.additionalText)
                expect(data[i].id).assertEqual(2);
                console.log("============Ans_GetAllActive_0100 getCallback id============>"+data[i].id)
                expect(data[i].label).assertEqual("otherApp");
                console.log("============Ans_GetAllActive_0100 getCallback label=====>"+data[i].label)
            }else if(i == 1){
                expect(data[i].content.normal.title).assertEqual("test_title_currentApp");
                console.log("======Ans_GetAllActive_0100 getCallback title=========>"+data[i].content.normal.title)
                expect(data[i].content.normal.text).assertEqual("test_text_currentApp");
                console.log("==========Ans_GetAllActive_0100 getCallback text=======>"+data[i].content.normal.text)
                expect(data[i].content.normal.additionalText).assertEqual("test_additionalText_currentApp");
                console.log("===Ans_GetAllActive_0100 getCallback text=====>"+data[i].content.normal.additionalText)
                expect(data[i].id).assertEqual(1);
                console.log("============Ans_GetAllActive_0100 getCallback id============>"+data[i].id)
                expect(data[i].label).assertEqual("currentApp_0100");
                console.log("============Ans_GetAllActive_0100 getCallback label=====>"+data[i].label)
            }
        }
    }

    /*
    * @tc.number: Ans_GetAllActive_xts_0100
    * @tc.name: getAllActiveNotifications(callback: AsyncCallback<Array<NotificationRequest>>): void;
    * @tc.desc: Verify: After the current app and other apps publish two notifications,
                get all active notifications in the system(callback)
    */
    it('Ans_GetAllActive_xts_0100', 0, async function (done) {
        console.debug("===============Ans_GetAllActive_0100 start==================>");
        await notify.cancelAll();
        var notificationRequestOfOtherApp = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title_otherApp",
                    text: "test_text_otherApp",
                    additionalText: "test_additionalText_otherApp"
                },
            },
            id: 2,
            label: "otherApp",
        }
        await notify.publish(notificationRequestOfOtherApp);
        console.debug("===============Ans_GetAllActive_0100 publish OtherApp notify end==================>");
        var notificationRequestOfCurrentApp = {
            content:{
                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                    title: "test_title_currentApp",
                    text: "test_text_currentApp",
                    additionalText: "test_additionalText_currentApp"
                },
            },
            id: 1,
            label: "currentApp_0100",
        }
        await notify.publish(notificationRequestOfCurrentApp);
        console.debug("===============Ans_GetAllActive_0100 publish CurrentApp notify end==================>");
        notify.getAllActiveNotifications(getAllCallback);
        console.debug("===============Ans_GetAllActive_0100 getAllActiveNotifications end==================>");
        setTimeout(function(){
            console.debug("===============Ans_GetAllActive_0100 setTimeout==================>");
            done();
        }, time);
    })
})

