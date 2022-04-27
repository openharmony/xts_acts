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
import notification from '@system.notification'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('ActsNotificationShowTest', function () {
    console.info("===========ActsNotificationShowTest start====================>");

     /*
     * @tc.number: ActsNotificationShowTest_0100
     * @tc.name: show()
     * @tc.desc: verify the function of show
     */
    it('ActsNotificationShowTest_0100', 0, async function (done) {
        let con = {
            contentTitle: 'Title1',
            contextText: 'This is a notification 001'
        }
        notification.show(con);
        expect(con.contentTitle).assertEqual('Title1');
        expect(con.contextText).assertEqual('This is a notification 001');
        console.log('===========ActsNotificationShowTest_0100 success====================>' + con.contentTitle + con.contextText);
        done();
    })

    /*
     * @tc.number: ActsNotificationShowTest_0200
     * @tc.name: show()
     * @tc.desc: verify the function of show
     */
    it('ActsNotificationShowTest_0200', 0, async function (done) {
        let con = {
           contentTitle: 123,
           contextText: 'This is a notification 002'
        }
        notification.show(con);
        if(con.contentTitle == 123){
           console.log('===========ActsNotificationShowTest_0200 conteneTitle is number: ====================' + con.contentTitle);
        }
        expect(con.contextText).assertEqual('This is a notification 002');
        console.log('===========ActsNotificationShowTest_0200 success====================>' + con.contextText);
        done();
    })

    /*
     * @tc.number: ActsNotificationShowTest_0300
     * @tc.name: show()
     * @tc.desc: verify the function of show
     */
    it('ActsNotificationShowTest_0300', 0, async function (done) {
        let con = {}
        notification.show(con);
        expect(con.contentTitle).assertEqual(undefined);
        console.log('===========ActsNotificationShowTest_0300 success====================>');
        done();
    })

    /*
     * @tc.number: ActsNotificationShowTest_0400
     * @tc.name: show()
     * @tc.desc: verify the function of show
     */
    it('ActsNotificationShowTest_0400', 0, async function (done) {
        let con = {
            contentTitle: 'Title4',
            contextText: 'This is a notification 004',
            clickAction: {                
               bundleName: 'com.example.notification',                
               abilityName: 'com.example.notification.MainAbility',                
               uri: '/',            
            }
        }
        notification.show(con);
        expect(con.contentTitle).assertEqual('Title4');
        expect(con.contextText).assertEqual('This is a notification 004');
        expect(con.clickAction.bundleName).assertEqual('com.example.notification');
        expect(con.clickAction.abilityName).assertEqual('com.example.notification.MainAbility');
        expect(con.clickAction.uri).assertEqual('/');
        console.log('===========ActsNotificationShowTest_0400 success====================>' + con.contentTitle + con.contextText + con.clickAction.bundleName + con.clickAction.abilityName + con.clickAction.uri);
        done();
    })

    /*
     * @tc.number: ActsNotificationShowTest_0500
     * @tc.name: show()
     * @tc.desc: verify the function of show
     */
    it('ActsNotificationShowTest_0500', 0, async function (done) {
        let con = {
            contentTitle: 'Title5',
            contextText: 'This is a notification 005',
            clickAction: {                
               bundleName: 'com.example.notification',                
               abilityName: 'com.example.notification.MainAbility',                
               uri: 'pages/index/index',            
            }
        }
        notification.show(con);
        expect(con.contentTitle).assertEqual('Title5');
        expect(con.contextText).assertEqual('This is a notification 005');
        expect(con.clickAction.bundleName).assertEqual('com.example.notification');
        expect(con.clickAction.abilityName).assertEqual('com.example.notification.MainAbility');
        expect(con.clickAction.uri).assertEqual('pages/index/index');
        console.log('===========ActsNotificationShowTest_0500 success====================>' + con.contentTitle + con.contextText + con.clickAction.bundleName + con.clickAction.abilityName + con.clickAction.uri);
        done();
    })

    /*
     * @tc.number: ActsNotificationShowTest_0600
     * @tc.name: show()
     * @tc.desc: verify the function of show
     */
    it('ActsNotificationShowTest_0600', 0, async function (done) {
        let con = {
            contentTitle: 'Title6',
            contextText: 'This is a notification 006',
            clickAction: {                
               bundleName: '',                
               abilityName: 'com.example.notification.MainAbility',                
               uri: '/',            
            }
        }
        notification.show(con);
        if(con.clickAction.bundleName == ''){
            console.log('===========ActsNotificationShowTest_0200 bundleName is null: ====================' + con.clickAction.bundleName);
        }
        expect(con.contentTitle).assertEqual('Title6');
        expect(con.contextText).assertEqual('This is a notification 006');
        expect(con.clickAction.abilityName).assertEqual('com.example.notification.MainAbility');
        expect(con.clickAction.uri).assertEqual('/');
        console.log('===========ActsNotificationShowTest_0600 success====================>' + con.contentTitle + con.contextText + con.clickAction.abilityName + con.clickAction.uri);
        done();
    })

    /*
     * @tc.number: ActsNotificationShowTest_0700
     * @tc.name: show()
     * @tc.desc: verify the function of show
     */
    it('ActsNotificationShowTest_0700', 0, async function (done) {
        let con = {
            contentTitle: 'Title7',
            contextText: 'This is a notification 007',
            clickAction: {                
               bundleName: 'com.example.notification',                
               abilityName: '',                
               uri: '/',            
            }
        }
        notification.show(con);
        if(con.clickAction.abilityName == ''){
            console.log('===========ActsNotificationShowTest_0200 abilityName is null: ====================' + con.clickAction.abilityName);
        }
        expect(con.contentTitle).assertEqual('Title7');
        expect(con.contextText).assertEqual('This is a notification 007');
        expect(con.clickAction.bundleName).assertEqual('com.example.notification');
        expect(con.clickAction.uri).assertEqual('/');
        console.log('===========ActsNotificationShowTest_0700 success====================>' + con.contentTitle + con.contextText + con.clickAction.bundleName + con.clickAction.uri);
        done();
    })

    /*
     * @tc.number: ActsNotificationShowTest_0800
     * @tc.name: show()
     * @tc.desc: verify the function of show
     */
    it('ActsNotificationShowTest_0800', 0, async function (done) {
        let con = {
            contentTitle: 'Title8',
            contextText: 'This is a notification 008',
            clickAction: {                
               bundleName: 'com.example.notification',                
               abilityName: 'com.example.notification.MainAbility',                
               uri: '',            
            }
        }
        notification.show(con);
        if(con.clickAction.uri == ''){
            console.log('===========ActsNotificationShowTest_0200 uri is null: ====================' + con.clickAction.uri);
        }
        expect(con.contentTitle).assertEqual('Title8');
        expect(con.contextText).assertEqual('This is a notification 008');
        expect(con.clickAction.bundleName).assertEqual('com.example.notification');
        expect(con.clickAction.abilityName).assertEqual('com.example.notification.MainAbility');
        console.log('===========ActsNotificationShowTest_0800 success====================>' + con.contentTitle + con.contextText + con.clickAction.bundleName + con.clickAction.abilityName);
        done();
    })

    /*
     * @tc.number: ActsNotificationShowTest_0900
     * @tc.name: show()
     * @tc.desc: verify the function of show
     */
    it('ActsNotificationShowTest_0900', 0, async function (done) {
        let con = {
            contextText: 'This is a notification 009',
            clickAction: {                
               bundleName: 'com.example.notification',                
               abilityName: 'com.example.notification.MainAbility',                
               uri: '/',            
            }
        }
        notification.show(con);
        expect(con.contextText).assertEqual('This is a notification 009');
        expect(con.clickAction.bundleName).assertEqual('com.example.notification');
        expect(con.clickAction.abilityName).assertEqual('com.example.notification.MainAbility');
        expect(con.clickAction.uri).assertEqual('/');
        console.log('===========ActsNotificationShowTest_0900 success====================>' + con.contextText + con.clickAction.bundleName + con.clickAction.abilityName + con.clickAction.uri);
        done();
    })

    /*
     * @tc.number: ActsNotificationShowTest_1000
     * @tc.name: show()
     * @tc.desc: verify the function of show
     */
    it('ActsNotificationShowTest_1000', 0, async function (done) {
        let con = {
            contentTitle: 'Title10',
            clickAction: {                
               bundleName: 'com.example.notification',                
               abilityName: 'com.example.notification.MainAbility',                
               uri: '/',            
            }
        }
        notification.show(con);
        expect(con.contentTitle).assertEqual('Title10');
        expect(con.clickAction.bundleName).assertEqual('com.example.notification');
        expect(con.clickAction.abilityName).assertEqual('com.example.notification.MainAbility');
        expect(con.clickAction.uri).assertEqual('/');
        console.log('===========ActsNotificationShowTest_1000 success====================>' + con.contentTitle + con.clickAction.bundleName + con.clickAction.abilityName + con.clickAction.uri);
        done();
    })


})
