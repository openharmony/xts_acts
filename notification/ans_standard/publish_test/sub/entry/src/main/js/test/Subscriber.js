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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index';
import notify from '@ohos.notification';
var timeout = 2000;
describe('ActsAnsSubTestXts', function () {
  console.info("==ActsAnsSubscriberTest start==>");
  //ActsSubscriber_test_0100
  var subInfoa ={
        onConnect:connectCallbacka,
        onDisconnect:disconnectCallbacka,
    }
  function connectCallbacka() {
        console.debug("==>connectCallbacka code==>");
    }
  function subscribeCallbacka(err) {
        console.debug("==>subscribeCallbacka code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
  function unSubscribeCallbacka(err){
        console.debug("==>ActsSubscriber_test_xts_0100 unSubscribeCallbacka code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
  function disconnectCallbacka(){
        console.debug("==>disconnectCallbacka code==>");
    }
  //ActsSubscriber_test_0200
  function connectCallbackb() {
        console.debug("==>connectCallbackb code==>");
    }
  function subscribeCallbackb(err) {
        console.debug("==>ActsSubscriber_test_xts_0200 subscribeCallbackb code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
  function subscribeCallbackc(err) {
        console.debug("==>subscribeCallbackc code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
  function unSubscribeCallbackb(err){
        console.debug("==>ActsSubscriber_test_xts_0200 unSubscribeCallbackb code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
  function disconnectCallbackb(){
        console.debug("==>disconnectCallbackb code==>");
    }
  //ActsSubscriber_test_0300
  function connectCallbackc() {
        console.debug("==>connectCallbackc code==>");
    }
  function connectCallbackd() {
        console.debug("==>connectCallbackd code==>");
    }
  function subscribeCallbackd(err) {
        console.debug("==>ActsSubscriber_test_xts_0300 subscribeCallbackd code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
  function subscribeCallbacke(err) {
        console.debug("==>ActsSubscriber_test_xts_0300 subscribeCallbacke code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
  function unSubscribeCallbackc(err){
        console.debug("==>ActsSubscriber_test_xts_0300 unSubscribeCallbackc code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
  function unSubscribeCallbackd(err){
        console.debug("==>ActsSubscriber_test_xts_0300 unSubscribeCallbackd code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
  function disconnectCallbackc(){
        console.debug("==>disconnectCallbackc code==>");
    }
  function disconnectCallbackd(){
        console.debug("==>disconnectCallbackd code==>");
    }
  //ActsSubscriber_test_0400
  function connectCallbackf() {
        console.debug("==>connectCallbackf code==>");
    }
  function connectCallbackg() {
        console.debug("==>connectCallbackg code==>");
    }
  function subscribeCallbackg(err) {
        console.debug("==>ActsSubscriber_test_xts_0400 subscribeCallbackg code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
  function subscribeCallbackh(err) {
        console.debug("==>ActsSubscriber_test_xts_0400 subscribeCallbackh code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
  function subscribeCallbacki(err) {
        console.debug("==>ActsSubscriber_test_xts_0400 subscribeCallbacki code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
  function unSubscribeCallbackf(err){
        console.debug("==>ActsSubscriber_test_xts_0400 unSubscribeCallbackf code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
  function unSubscribeCallbackg(err){
        console.debug("==>ActsSubscriber_test_xts_0400 unSubscribeCallbackg code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
  function disconnectCallbackf(){
        console.debug("==>disconnectCallbackf code==>");
    }
  function disconnectCallbackg(){
        console.debug("==>disconnectCallbackg code==>");
    }
  //ActsSubscriber_test_0500
  var subInfob = {
        onConnect:connectCallbacki,
        onDisconnect:disconnectCallbacki,
    }
  function connectCallbacki() {
        console.debug("==>connectCallbacki code==>");
    }
  function subscribeCallbackl(err) {
        console.debug("==>ActsSubscriber_test_xts_0500 subscribeCallbackl code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
  function unSubscribeCallbacki(err){
        console.debug("==>ActsSubscriber_test_xts_0500 unSubscribeCallbacki code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
  function disconnectCallbacki(){
        console.debug("==>disconnectCallbacki code==>");
    }
  //ActsSubscriber_test_0600
  var subInfoc ={
        onConnecte:connectCallbackj,
        onDisconnect:disconnectCallbackj,
    }
  function connectCallbackj() {
        console.debug("==>connectCallbackj code==>");
    }
  function unSubscribeCallbackj(err){
        console.debug("==>ActsSubscriber_test_xts_0600 unSubscribeCallbackj code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
  function disconnectCallbackj(){
        console.debug("==>disconnectCallbackj code==>");
    }
  //ActsSubscriber_test_0700
  var subInfod ={
        onConnect:connectCallbackm,
        onDisconnect:disconnectCallbackl,
    }
  function connectCallbackm() {
        console.debug("==>connectCallbackm code==>");
    }
  function subscribeCallbackn(err) {
        console.debug("==>ActsSubscriber_test_xts_0700 subscribeCallbackn code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
  function unSubscribeCallbackl(err){
        console.debug("==>ActsSubscriber_test_xts_0700 unSubscribeCallbackl code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
  function disconnectCallbackl(){
        console.debug("==>disconnectCallbackl code==>");
    }
  //ActsSubscriber_test_0800
  var subInfoe ={
        onConnect:connectCallbackn,
        onDisconnect:disconnectCallbackm,
    }
  function connectCallbackn() {
        console.debug("==>connectCallbackn code==>");
    }
  function unSubscribeCallbackm(err){
        console.debug("==>ActsSubscriber_test_xts_0800 unSubscribeCallbackm code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
  function disconnectCallbackm(){
        console.debug("==>disconnectCallbackm code==>");
    }
  //ActsSubscriber_test_1300
  function connectCallbackl(){
        console.debug("==>connectCallbackl code==>");
    }
  function subscribeCallbacko(err){
        console.debug("==>ActsSubscriber_test_xts_1300 subscribeCallbacko code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
  function unSubscribeCallbackn(err){
        console.debug("==>ActsSubscriber_test_xts_1300 unSubscribeCallbackn code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
  function disconnectCallbackn(){
        console.debug("==>disconnectCallbackn code==>");
    }
  //ActsSubscriber_test_1400
  function connectCallbacko(){
        console.debug("==>connectCallbacko  code==>");
    }
  function subscribeCallbackp(err){
        console.debug("==>ActsSubscriber_test_xts_1400 subscribeCallbackp code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
  function unSubscribeCallbacko(err){
        console.debug("==>unSubscribeCallbacko code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
  function disconnectCallbacko(){
        console.debug("==>disconnectCallbacko code==>");
    }

  /*
  * @tc.number: ActsSubscriber_test_xts_0900
  * @tc.name: subscribe()
  * @tc.desc: verify the function of subscribe
  */
  it('ActsSubscriber_test_xts_0900', 0, async function (done) {
        console.debug("==ActsSubscriber_test_xts_0900==begin==>");
        var promise = notify.subscribe(100,{bundleNames:["com.example.actsanspublishtest"]});
        expect(promise).assertEqual(undefined);
        setTimeout((async function(){
            console.debug("==ActsSubscriber_test_xts_0900==end==>");
            done();
        }),timeout);
    })

  /*
  * @tc.number: ActsSubscriber_test_xts_1000
  * @tc.name: subscribe()
  * @tc.desc: verify the function of subscribe
  */
  it('ActsSubscriber_test_xts_1000', 0, async function (done) {
        console.debug("==ActsSubscriber_test_xts_1000==begin==>");
        var subInfo = null
        var promise = await notify.subscribe(subInfo,{bundleNames:["com.example.actsanspublishtest"]});
        expect(promise).assertEqual(undefined);
        setTimeout((async function(){
            console.debug("==ActsSubscriber_test_xts_1000==end==>");
            done();
        }),timeout);
    })

  /*
  * @tc.number: ActsSubscriber_test_xts_1100
  * @tc.name: subscribe()
  * @tc.desc: verify the function of subscribe
  */
  it('ActsSubscriber_test_xts_1100', 0, async function (done) {
        console.debug("==ActsSubscriber_test_xts_1100==begin==>");
        var subInfo = "#$#%$%$^&%^%"
        var promise = notify.subscribe(subInfo,{bundleNames:["com.example.actsanspublishtest"]});
        expect(promise).assertEqual(undefined);
        setTimeout((async function(){
            console.debug("==ActsSubscriber_test_xts_1100==end==>");
            done();
        }),timeout);
    })

  /*
  * @tc.number: ActsSubscriber_test_xts_1200
  * @tc.name: subscribe()
  * @tc.desc: verify the function of subscribe
  */
  it('ActsSubscriber_test_xts_1200', 0, async function (done) {
        console.debug("==ActsSubscriber_test_xts_1200==begin==>");
        var subInfo = ""
        var promise = await notify.subscribe(subInfo,{bundleNames:["com.example.actsanspublishtest"]});
        expect(promise).assertEqual(undefined);
        setTimeout((async function(){
            console.debug("==ActsSubscriber_test_xts_1200==end==>");
            done();
        }),timeout);
    })

  /*
  * @tc.number: ActsSubscriber_test_xts_1400
  * @tc.name: subscribe()
  * @tc.desc: verify the function of subscribe
  */
  it('ActsSubscriber_test_xts_1400', 0, async function (done) {
        console.debug("==ActsSubscriber_test_xts_1400==begin==>");
        var subInfo ={
            onConnect:connectCallbacko,
            onDisconnect:disconnectCallbacko,
        }
        try{
           await notify.subscribe(subInfo, {bundleNames: []}, subscribeCallbackp);
        }catch(err){
        console.debug("==ActsSubscriber_test_xts_1400==err==>"+err);
        }
        setTimeout((async function(){
            console.debug("==ActsSubscriber_test_xts_1400==end==>");
            done();
        }),timeout);
    })
})

