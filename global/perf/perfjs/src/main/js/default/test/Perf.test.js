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

import I18n from '@ohos.i18n'
import Intl from '@ohos.intl'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

describe('PerfTest', function () {
    console.log('*************start PerfTest*************');

    let EXETIME = 1000;

    beforeAll(function(){
        console.log('step before all cases.');
    })

    beforeEach(function(){
        console.log('step before every case.');
    })

    afterEach(function(){
        console.log('step after every case.');
    })

    afterAll(function(){
        console.log('step after all cases.');
    })

    /* *
    * @tc.number SUB_GLOBAL_PERF_JS_0100
    * @tc.name test the performance of getSystemLanguage
    * @tc.desc check the performance of getSystemLanguage
    */
    it('perf_test_0100', 0, function () {
        console.log('perf_test_0100 ' + 'start');
        let startTime = new Date().getTime();
        let lang = 'test';
        for(let i = 0; i < EXETIME; i++){
            lang = I18n.getSystemLanguage();
        }
        let exeTime = new Date().getTime() - startTime;
        let avgTime = exeTime/EXETIME;
        console.log('perf_test_0100--' + 'lang: ' + lang + ' exeTime: ' + exeTime + ' avgTime: ' + avgTime);
        if(avgTime < 10){
            expect(true).assertTrue();
        }
        else{
            expect(false).assertTrue();
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_PERF_JS_0200
    * @tc.name test the performance of getSystemRegion
    * @tc.desc check the performance of getSystemRegion
    */
    it('perf_test_0200', 0, function () {
        console.log('perf_test_0200 ' + 'start');
        let startTime = new Date().getTime();
        let region = 'test';
        for(let i = 0; i < EXETIME; i++){
            region = I18n.getSystemRegion();
        }
        let exeTime = new Date().getTime() - startTime;
        let avgTime = exeTime/EXETIME;
        console.log('perf_test_0200--' + 'region: ' + region + ' exeTime: ' + exeTime + ' avgTime: ' + avgTime);
        if(avgTime < 10){
            expect(true).assertTrue();
        }
        else{
            expect(false).assertTrue();
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_PERF_JS_0300
    * @tc.name test the performance of getSystemLocale
    * @tc.desc check the performance of getSystemLocale
    */
    it('perf_test_0300', 0, function () {
        console.log('perf_test_0300 ' + 'start');
        let startTime = new Date().getTime();
        let locale = 'test';
        for(let i = 0; i < EXETIME; i++){
            locale = I18n.getSystemLocale();
        }
        let exeTime = new Date().getTime() - startTime;
        let avgTime = exeTime/EXETIME;
        console.log('perf_test_0300--' + 'locale: ' + locale + ' exeTime: ' + exeTime + ' avgTime: ' + avgTime);
        if(avgTime < 10){
            expect(true).assertTrue();
        }
        else{
            expect(false).assertTrue();
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_PERF_JS_0400
    * @tc.name test the performance of setSystemLanguage
    * @tc.desc check the performance of setSystemLanguage
    */
    it('perf_test_0400', 0, function () {
        console.log('perf_test_0400 ' + 'start');
        let startTime = new Date().getTime();
        let value = false;
        for(let i = 0; i < EXETIME; i++){
            value = I18n.setSystemLanguage('en');
        }
        let exeTime = new Date().getTime() - startTime;
        let avgTime = exeTime/EXETIME;
        console.log('perf_test_0400--' + 'value: ' + value + ' exeTime: ' + exeTime + ' avgTime: ' + avgTime);
        if(avgTime < 10){
            expect(true).assertTrue();
        }
        else{
            expect(false).assertTrue();
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_PERF_JS_0500
    * @tc.name test the performance of setSystemRegion
    * @tc.desc check the performance of setSystemRegion
    */
    it('perf_test_0500', 0, function () {
        console.log('perf_test_0500 ' + 'start');
        let startTime = new Date().getTime();
        let value = false;
        for(let i = 0; i < EXETIME; i++){
            value = I18n.setSystemRegion('US');
        }
        let exeTime = new Date().getTime() - startTime;
        let avgTime = exeTime/EXETIME;
        console.log('perf_test_0500--' + 'value: ' + value + ' exeTime: ' + exeTime + ' avgTime: ' + avgTime);
        if(avgTime < 10){
            expect(true).assertTrue();
        }
        else{
            expect(false).assertTrue();
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_PERF_JS_0600
    * @tc.name test the performance of setSystemLocale
    * @tc.desc check the performance of setSystemLocale
    */
    it('perf_test_0600', 0, function () {
        console.log('perf_test_0600 ' + 'start');
        let startTime = new Date().getTime();
        let value = false;
        for(let i = 0; i < EXETIME; i++){
            value = I18n.setSystemLocale('en-Latn-US');
        }
        let exeTime = new Date().getTime() - startTime;
        let avgTime = exeTime/EXETIME;
        console.log('perf_test_0600--' + 'value: ' + value + ' exeTime: ' + exeTime + ' avgTime: ' + avgTime);
        if(avgTime < 10){
            expect(true).assertTrue();
        }
        else{
            expect(false).assertTrue();
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_PERF_JS_0700
    * @tc.name test the performance of getSystemLanguages
    * @tc.desc check the performance of getSystemLanguages
    */
    it('perf_test_0700', 0, function () {
        console.log('perf_test_0700 ' + 'start');
        let startTime = new Date().getTime();
        let value = new Array();
        for(let i = 0; i < EXETIME; i++){
            value = I18n.getSystemLanguages();
        }
        let exeTime = new Date().getTime() - startTime;
        let avgTime = exeTime/EXETIME;
        console.log('perf_test_0700--' + 'value: ' + value + ' exeTime: ' + exeTime + ' avgTime: ' + avgTime);
        if(avgTime < 10){
            expect(true).assertTrue();
        }
        else{
            expect(false).assertTrue();
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_PERF_JS_0800
    * @tc.name test the performance of getSystemCountries
    * @tc.desc check the performance of getSystemCountries
    */
    it('perf_test_0800', 0, function () {
        console.log('perf_test_0800 ' + 'start');
        let startTime = new Date().getTime();
        let value = new Array();
        for(let i = 0; i < EXETIME; i++){
            value = I18n.getSystemCountries('en');
        }
        let exeTime = new Date().getTime() - startTime;
        let avgTime = exeTime/EXETIME;
        console.log('perf_test_0800--' + 'value: ' + value + ' exeTime: ' + exeTime + ' avgTime: ' + avgTime);
        if(avgTime < 10){
            expect(true).assertTrue();
        }
        else{
            expect(false).assertTrue();
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_PERF_JS_0900
    * @tc.name test the performance of isSuggested
    * @tc.desc check the performance of isSuggested
    */
    it('perf_test_0900', 0, function () {
        console.log('perf_test_0900 ' + 'start');
        let startTime = new Date().getTime();
        let value = false;
        for(let i = 0; i < EXETIME; i++){
            value = I18n.isSuggested('en');
        }
        let exeTime = new Date().getTime() - startTime;
        let avgTime = exeTime/EXETIME;
        console.log('perf_test_0900--' + 'value: ' + value + ' exeTime: ' + exeTime + ' avgTime: ' + avgTime);
        if(avgTime < 10){
            expect(true).assertTrue();
        }
        else{
            expect(false).assertTrue();
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_PERF_JS_1000
    * @tc.name test the performance of getDisplayCountry
    * @tc.desc check the performance of getDisplayCountry
    */
    it('perf_test_1000', 0, function () {
        console.log('perf_test_1000 ' + 'start');
        let startTime = new Date().getTime();
        let value = 'test';
        for(let i = 0; i < EXETIME; i++){
            value = I18n.getDisplayCountry('zh-Hans-CN', 'en-US', true);
        }
        let exeTime = new Date().getTime() - startTime;
        let avgTime = exeTime/EXETIME;
        console.log('perf_test_1000--' + 'value: ' + value + ' exeTime: ' + exeTime + ' avgTime: ' + avgTime);
        if(avgTime < 10){
            expect(true).assertTrue();
        }
        else{
            expect(false).assertTrue();
        }
    })

    /* *
    * @tc.number SUB_GLOBAL_PERF_JS_1100
    * @tc.name test the performance of getDisplayLanguage
    * @tc.desc check the performance of getDisplayLanguage
    */
    it('perf_test_1100', 0, function () {
        console.log('perf_test_1100 ' + 'start');
        let startTime = new Date().getTime();
        let value = 'test';
        for(let i = 0; i < EXETIME; i++){
            value = I18n.getDisplayLanguage('zh-Hans-CN', 'en-US', true);
        }
        let exeTime = new Date().getTime() - startTime;
        let avgTime = exeTime/EXETIME;
        console.log('perf_test_1100--' + 'value: ' + value + ' exeTime: ' + exeTime + ' avgTime: ' + avgTime);
        if(avgTime < 10){
            expect(true).assertTrue();
        }
        else{
            expect(false).assertTrue();
        }
    })

    console.log('*************end PerfTest*************');
})