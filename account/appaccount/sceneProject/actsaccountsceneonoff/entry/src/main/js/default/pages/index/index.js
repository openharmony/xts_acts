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
import account from '@ohos.account.appAccount'
import commonevent from '@ohos.commonevent'
const injectRef = Object.getPrototypeOf(global) || global
injectRef.regeneratorRuntime = require('@babel/runtime/regenerator')

export default {
    data: {
    },
    onInit() {
        this.title = "scene on off";
    },
    onShow() {
        console.debug("====>change on off scene start====");
        var appAccountManager = account.createAppAccountManager();
        var commonEventSubscribeInfo = {
            events: ["account_on_change"]
        }
        function publishCallback(err){
            console.debug("====>publish call back scene err:" + JSON.stringify(err));
            console.debug("====>scene off start====");
            appAccountManager.off('change', function (){
                console.debug("====>scene off finish====");
            });
        }
        function changeOnExtra(data){
            console.debug("====>receive change 0100 data:" + JSON.stringify(data));
            try{
                if(data[0].owner == "com.example.actsaccountchangeonoff" && data[0].name == "changeonoff_extra"){
                    var commonEventPublishData = {
                        data: "SUCCESS"
                    }
                    commonevent.publish("account_on_change_extra", commonEventPublishData, publishCallback);
                }else{
                    var commonEventPublishData = {
                        data: "FAIL"
                    }
                    commonevent.publish("account_on_change_extra", commonEventPublishData, publishCallback);
                }
            }
            catch(err){
                var commonEventPublishData = {
                    data: "FAIL"
                }
                commonevent.publish("account_on_change_extra", commonEventPublishData, publishCallback);
            }
        }
        function changeOnAssociateData(data){
            console.debug("====>receive change 0200 data:" + JSON.stringify(data));
            try{
                if(data[0].owner == "com.example.actsaccountchangeonoff" && data[0].name == "onoff_associatedata"){
                    var commonEventPublishData = {
                        data: "SUCCESS"
                    }
                    commonevent.publish("account_on_change_associatedata", commonEventPublishData, publishCallback);
                }else{
                    var commonEventPublishData = {
                        data: "FAIL"
                    }
                    commonevent.publish("account_on_change_associatedata", commonEventPublishData, publishCallback);
                }
            }
            catch(err){
                var commonEventPublishData = {
                    data: "FAIL"
                }
                commonevent.publish("account_on_change_associatedata", commonEventPublishData, publishCallback);
            }
        }
        function changeOnCredential(data){
            console.debug("====>receive change 0300 data:" + JSON.stringify(data));
            try{
                if(data[0].owner == "com.example.actsaccountchangeonoff" && data[0].name == "onoff_credential"){
                    var commonEventPublishData = {
                        data: "SUCCESS"
                    }
                    commonevent.publish("account_on_change_credential", commonEventPublishData, publishCallback);
                }else{
                    var commonEventPublishData = {
                        data: "FAIL"
                    }
                    commonevent.publish("account_on_change_credential", commonEventPublishData, publishCallback);
                }
            }
            catch(err){
                var commonEventPublishData = {
                    data: "FAIL"
                }
                commonevent.publish("account_on_change_credential", commonEventPublishData, publishCallback);
            }
        }
        function changeOnDeleteAnother(data){
            console.debug("====>receive change 0400 data:" + JSON.stringify(data));
            try{
                if(data[0].owner == "com.example.actsaccountchangeonoff" && data[0].name == "onoff_deleteFir"){
                    var commonEventPublishData = {
                        data: "SUCCESS"
                    }
                    commonevent.publish("account_on_delete_another", commonEventPublishData, publishCallback);
                }else{
                    var commonEventPublishData = {
                        data: "FAIL"
                    }
                    commonevent.publish("account_on_delete_another", commonEventPublishData, publishCallback);
                }
            }
            catch(err){
                var commonEventPublishData = {
                    data: "FAIL"
                }
                commonevent.publish("account_on_delete_another", commonEventPublishData, publishCallback);
            }
        }
        function changeOnDelete(data){
            console.debug("====>receive change 0500 data:" + JSON.stringify(data));
            try{
                if(data.length == 0){
                    var commonEventPublishData = {
                        data: "SUCCESS"
                    }
                    commonevent.publish("account_on_change_delete", commonEventPublishData, publishCallback);
                }else{
                    var commonEventPublishData = {
                        data: "FAIL"
                    }
                    commonevent.publish("account_on_change_delete", commonEventPublishData, publishCallback);
                }
            }
            catch(err){
                var commonEventPublishData = {
                    data: "FAIL"
                }
                commonevent.publish("account_on_change_delete", commonEventPublishData, publishCallback);
            }
        }
        function changeOnDisableAnother(data){
            console.debug("====>receive change 0600 data:" + JSON.stringify(data));
            try{
                if(data[0].owner == "com.example.actsaccountchangeonoff" && data[0].name == "onoff_enableFir"){
                    var commonEventPublishData = {
                        data: "SUCCESS"
                    }
                    commonevent.publish("account_on_disable_another", commonEventPublishData, publishCallback);
                }else{
                    var commonEventPublishData = {
                        data: "FAIL"
                    }
                    commonevent.publish("account_on_disable_another", commonEventPublishData, publishCallback);
                }
            }
            catch(err){
                var commonEventPublishData = {
                    data: "FAIL"
                }
                commonevent.publish("account_on_disable_another", commonEventPublishData, publishCallback);
            }
        }
        function changeOnDisable(data){
            console.debug("====>receive change 0700 data:" + JSON.stringify(data));
            try{
                if(data.length == 0){
                    var commonEventPublishData = {
                        data: "SUCCESS"
                    }
                    commonevent.publish("account_on_change_disable", commonEventPublishData, publishCallback);
                }else{
                    var commonEventPublishData = {
                        data: "FAIL"
                    }
                    commonevent.publish("account_on_change_disable", commonEventPublishData, publishCallback);
                }
            }
            catch(err){
                var commonEventPublishData = {
                    data: "FAIL"
                }
                commonevent.publish("account_on_change_disable", commonEventPublishData, publishCallback);
            }
        }
        function subscriberCallback(err, data){
            console.debug("====>receive event err:" + JSON.stringify(err));
            console.debug("====>receive event data:" + JSON.stringify(data));
            switch(data.code){
                case 1:
                    console.debug("====>receive event 0100 event:" + data.event);
                    appAccountManager.on('change', ["com.example.actsaccountchangeonoff"], changeOnExtra);
                    break;
                case 2:
                    console.debug("====>receive event 0200 event:" + data.event);
                    appAccountManager.on('change', ["com.example.actsaccountchangeonoff"], changeOnAssociateData);
                    break;
                case 3:
                    console.debug("====>receive event 0300 event:" + data.event);
                    appAccountManager.on('change', ["com.example.actsaccountchangeonoff"], changeOnCredential);
                    break;
                case 4:
                    console.debug("====>receive event 0400 event:" + data.event);
                    appAccountManager.on('change', ["com.example.actsaccountchangeonoff"], changeOnDeleteAnother);
                    break;
                case 5:
                    console.debug("====>receive event 0500 event:" + data.event);
                    appAccountManager.on('change', ["com.example.actsaccountchangeonoff"], changeOnDelete);
                    break;
                case 6:
                    console.debug("====>receive event 0600 event:" + data.event);
                    appAccountManager.on('change', ["com.example.actsaccountchangeonoff"], changeOnDisableAnother);
                    break;
                case 7:
                    console.debug("====>receive event 0700 event:" + data.event);
                    appAccountManager.on('change', ["com.example.actsaccountchangeonoff"], changeOnDisable);
                    break;
                default:
                    console.debug("====>receive event enter default====");
                    break;
            }
        }
        var subscriber
        commonevent.createSubscriber(commonEventSubscribeInfo).then(function (data){
            subscriber = data;
            commonevent.subscribe(subscriber, subscriberCallback);
            console.debug("====>scene subscribe finish====")
        })
    },
    onReady() {
    },
}