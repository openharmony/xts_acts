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
import featureAbility from '@ohos.ability.featureAbility'
import wantconstant from '@ohos.ability.wantconstant'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'


describe('ActsFeatureAbilityTest', function () {
    //  @tc.number: ACTS_wantConstant_0100
    //  @tc.name: wantConstant : Check specific enum
    //  @tc.desc: Check the return type of the interface (by Promise)
    it('ACTS_wantConstant_0100', 0, async function (done) {
        expect(wantconstant.Action.ACTION_HOME).assertEqual("action.system.home");
        expect(wantconstant.Action.ACTION_PLAY).assertEqual("action.system.play");
        expect(wantconstant.Action.ACTION_BUNDLE_ADD).assertEqual("action.bundle.add");
        expect(wantconstant.Action.ACTION_BUNDLE_REMOVE).assertEqual("action.bundle.remove");
        expect(wantconstant.Action.ACTION_BUNDLE_UPDATE).assertEqual("action.bundle.update");
        expect(wantconstant.Action.ACTION_ORDER_TAXI).assertEqual("ability.intent.ORDER_TAXI");
        expect(wantconstant.Action.ACTION_QUERY_TRAFFIC_RESTRICTION).assertEqual("ability.intent.QUERY_TRAFFIC_RESTRICTION");
        expect(wantconstant.Action.ACTION_PLAN_ROUTE).assertEqual("ability.intent.PLAN_ROUTE");
        expect(wantconstant.Action.ACTION_BOOK_FLIGHT).assertEqual("ability.intent.BOOK_FLIGHT");
        expect(wantconstant.Action.ACTION_BOOK_TRAIN_TICKET).assertEqual("ability.intent.BOOK_TRAIN_TICKET");
        expect(wantconstant.Action.ACTION_BOOK_HOTEL).assertEqual("ability.intent.BOOK_HOTEL");
        expect(wantconstant.Action.ACTION_QUERY_TRAVELLING_GUIDELINE).assertEqual("ability.intent.QUERY_TRAVELLING_GUIDELINE");
        expect(wantconstant.Action.ACTION_QUERY_POI_INFO).assertEqual("ability.intent.QUERY_POI_INFO");
        expect(wantconstant.Action.ACTION_QUERY_CONSTELLATION_FORTUNE).assertEqual("ability.intent.QUERY_CONSTELLATION_FORTUNE");
        expect(wantconstant.Action.ACTION_QUERY_ALMANC).assertEqual("ability.intent.QUERY_ALMANC");
        expect(wantconstant.Action.ACTION_QUERY_WEATHER).assertEqual("ability.intent.QUERY_WEATHER");
        expect(wantconstant.Action.ACTION_QUERY_ENCYCLOPEDIA).assertEqual("ability.intent.QUERY_ENCYCLOPEDIA");
        expect(wantconstant.Action.ACTION_QUERY_RECIPE).assertEqual("ability.intent.QUERY_RECIPE");
        expect(wantconstant.Action.ACTION_BUY_TAKEOUT).assertEqual("ability.intent.BUY_TAKEOUT");
        expect(wantconstant.Action.ACTION_TRANSLATE_TEXT).assertEqual("ability.intent.TRANSLATE_TEXT");
        expect(wantconstant.Action.ACTION_BUY).assertEqual("ability.intent.BUY");
        expect(wantconstant.Action.ACTION_QUERY_LOGISTICS_INFO).assertEqual("ability.intent.QUERY_LOGISTICS_INFO");
        expect(wantconstant.Action.ACTION_SEND_LOGISTICS).assertEqual("ability.intent.SEND_LOGISTICS");
        expect(wantconstant.Action.ACTION_QUERY_SPORTS_INFO).assertEqual("ability.intent.QUERY_SPORTS_INFO");
        expect(wantconstant.Action.ACTION_QUERY_NEWS).assertEqual("ability.intent.QUERY_NEWS");
        expect(wantconstant.Action.ACTION_QUERY_JOKE).assertEqual("ability.intent.QUERY_JOKE");
        expect(wantconstant.Action.ACTION_WATCH_VIDEO_CLIPS).assertEqual("ability.intent.WATCH_VIDEO_CLIPS");
        expect(wantconstant.Action.ACTION_QUERY_STOCK_INFO).assertEqual("ability.intent.QUERY_STOCK_INFO");
        expect(wantconstant.Action.ACTION_LOCALE_CHANGED).assertEqual("ability.intent.LOCALE_CHANGED");

        expect(wantconstant.Entity.ENTITY_HOME).assertEqual("entity.system.home");
        expect(wantconstant.Entity.ENTITY_VIDEO).assertEqual("entity.system.video");

        console.log("wantConstant.Action.ACTION_HOME: " + wantconstant.Action.ACTION_HOME)
        console.log("wantConstant.Action.ACTION_PLAY: " + wantconstant.Action.ACTION_PLAY)
        console.log("wantConstant.Action.ACTION_BUNDLE_ADD: " + wantconstant.Action.ACTION_BUNDLE_ADD)
        console.log("wantConstant.Action.ACTION_BUNDLE_REMOVE: " + wantconstant.Action.ACTION_BUNDLE_REMOVE)
        console.log("wantConstant.Action.ACTION_BUNDLE_UPDATE: " + wantconstant.Action.ACTION_BUNDLE_UPDATE)
        console.log("wantConstant.Action.ACTION_ORDER_TAXI: " + wantconstant.Action.ACTION_ORDER_TAXI)
        console.log("wantConstant.Action.ACTION_QUERY_TRAFFIC_RESTRICTION: " + wantconstant.Action.ACTION_QUERY_TRAFFIC_RESTRICTION)
        console.log("wantConstant.Action.ACTION_PLAN_ROUTE: " + wantconstant.Action.ACTION_PLAN_ROUTE)
        console.log("wantConstant.Action.ACTION_BOOK_FLIGHT: " + wantconstant.Action.ACTION_BOOK_FLIGHT)
        console.log("wantConstant.Action.ACTION_BOOK_TRAIN_TICKET: " + wantconstant.Action.ACTION_BOOK_TRAIN_TICKET)
        console.log("wantConstant.Action.ACTION_BOOK_HOTEL: " + wantconstant.Action.ACTION_BOOK_HOTEL)
        console.log("wantConstant.Action.ACTION_QUERY_TRAVELLING_GUIDELINE: " + wantconstant.Action.ACTION_QUERY_TRAVELLING_GUIDELINE)
        console.log("wantConstant.Action.ACTION_QUERY_POI_INFO: " + wantconstant.Action.ACTION_QUERY_POI_INFO)
        console.log("wantConstant.Action.ACTION_QUERY_CONSTELLATION_FORTUNE: " + wantconstant.Action.ACTION_QUERY_CONSTELLATION_FORTUNE)
        console.log("wantConstant.Action.ACTION_QUERY_ALMANC: " + wantconstant.Action.ACTION_QUERY_ALMANC)
        console.log("wantConstant.Action.ACTION_QUERY_WEATHER: " + wantconstant.Action.ACTION_QUERY_WEATHER)
        console.log("wantConstant.Action.ACTION_QUERY_ENCYCLOPEDIA: " + wantconstant.Action.ACTION_QUERY_ENCYCLOPEDIA)
        console.log("wantConstant.Action.ACTION_QUERY_RECIPE: " + wantconstant.Action.ACTION_QUERY_RECIPE)
        console.log("wantConstant.Action.ACTION_BUY_TAKEOUT: " + wantconstant.Action.ACTION_BUY_TAKEOUT)
        console.log("wantConstant.Action.ACTION_TRANSLATE_TEXT: " + wantconstant.Action.ACTION_TRANSLATE_TEXT)
        console.log("wantConstant.Action.ACTION_BUY: " + wantconstant.Action.ACTION_BUY)
        console.log("wantConstant.Action.ACTION_QUERY_LOGISTICS_INFO: " + wantconstant.Action.ACTION_QUERY_LOGISTICS_INFO)
        console.log("wantConstant.Action.ACTION_SEND_LOGISTICS: " + wantconstant.Action.ACTION_SEND_LOGISTICS)
        console.log("wantConstant.Action.ACTION_QUERY_SPORTS_INFO: " + wantconstant.Action.ACTION_QUERY_SPORTS_INFO)
        console.log("wantConstant.Action.ACTION_QUERY_NEWS: " + wantconstant.Action.ACTION_QUERY_NEWS)
        console.log("wantConstant.Action.ACTION_QUERY_JOKE: " + wantconstant.Action.ACTION_QUERY_JOKE)
        console.log("wantConstant.Action.ACTION_WATCH_VIDEO_CLIPS: " + wantconstant.Action.ACTION_WATCH_VIDEO_CLIPS)
        console.log("wantConstant.Action.ACTION_QUERY_STOCK_INFO: " + wantconstant.Action.ACTION_QUERY_STOCK_INFO)
        console.log("wantConstant.Action.ACTION_LOCALE_CHANGED: " + wantconstant.Action.ACTION_LOCALE_CHANGED)

        console.log("wantConstant.Entity.ENTITY_HOME: " + wantconstant.Entity.ENTITY_HOME )
        console.log("wantConstant.Entity.ENTITY_VIDEO: " + wantconstant.Entity.ENTITY_VIDEO)

        done();
    })

    // @tc.number: ACTS_GetContext_0100
    // @tc.name: GetContext : Obtains the Context object
    // @tc.desc: Check the return value of the interface (by Promise)
    it('ACTS_GetContext_0100',0,async function (done) {
        var promise = featureAbility.getContext()
        expect(typeof(promise)).assertEqual("object");
        done()
    })

    // @tc.number: ACTS_GetContext_0200
    // @tc.name: GetContext : Obtains the Context object
    // @tc.desc: Check the return value of the interface (by Promise)
    it('ACTS_GetContext_0200', 0, async function (done) {
        var result = await featureAbility.getContext(
            (data) => {
                expect(typeof(data)).assertEqual("object");
                done();
            },
        );
    })

    // @tc.number: ACTS_HasWindowFocus_0100
    // @tc.name: HasWindowFocus : Checks whether the main window of this ability has window focus
    // @tc.desc: Check the return value of the interface (by Promise)
    it('ACTS_HasWindowFocus_0100', 0, async function (done) {
        var promise = featureAbility.hasWindowFocus();
        expect(typeof(promise)).assertEqual("object");
        var info = await featureAbility.hasWindowFocus();
        expect(info).assertEqual(true);
        done();
    })

    // @tc.number: ACTS_HasWindowFocus_0300
    // @tc.name: HasWindowFocus : Checks whether the main window of this ability has window focus
    // @tc.desc: Check the return value of the interface (by AsyncCallback)
    it('ACTS_HasWindowFocus_0300', 0, async function (done) {
        var result = featureAbility.hasWindowFocus(
            (err, data) => {
            console.log("hasWindowFocus asyncCallback code: " + err.code + " data: " + data)
            done()
            }
        );
            console.info('AceApplication : hasWindowFocus : ' + result);
    })


    // @tc.number: ACTS_StartAbility_0100
    // @tc.name: StartAbility : A Page or Service ability uses this method to start a specific ability.
    // @tc.desc: Check the return value of the interface (by Promise)
    it('ACTS_StartAbility_0100', 0, async function (done) {
        var promise = await featureAbility.startAbility(
            {
                    want:
                    {
                        action: "action.system.home",
                        entities: ["entity.system.home"],
                        type: "MIMETYPE",
                        options:{
                            // indicates the grant to perform read operations on the URI
                            authReadUriPermission: true,
                            // indicates the grant to perform write operations on the URI
                            authWriteUriPermission: true,
                            // support forward intent result to origin ability
                            abilityForwardResult: true,
                            // used for marking the ability start-up is triggered by continuation
                            abilityContinuation: true,
                            // specifies whether a component does not belong to ohos
                            notOhosComponent: true,
                            // specifies whether an ability is started
                            abilityFormEnabled: true,
                            // indicates the grant for possible persisting on the URI.
                            authPersistableUriPermission: true,
                            // indicates the grant for possible persisting on the URI.
                            authPrefixUriPermission: true,
                            // support distributed scheduling system start up multiple devices
                            abilitySliceMultiDevice: true,
                            // indicates that an ability using the service template is started regardless of whether the
                            // host application has been started.
                            startForegroundAbility: true,
                            // install the specified ability if it's not installed.
                            installOnDemand: true,
                            // return result to origin ability slice
                            abilitySliceForwardResult: true,
                            // install the specified ability with background mode if it's not installed.
                            installWithBackgroundMode: true
                        },
                            deviceId: "",
                            bundleName: "com.example.startabilitypromise",
                            abilityName: "com.example.startabilitypromise.MainAbility",
                            uri:""
                    },
            }
        );
        expect(promise).assertEqual(0);
        done();
    })

    // @tc.number: ACTS_StartAbility_0200
    // @tc.name: StartAbility : A Page or Service ability uses this method to start a specific ability.
    // @tc.desc: Check the return value of the interface (by Promise)
    it('ACTS_StartAbility_0200', 0, async function (done) {
        var promise = await featureAbility.startAbility(
            {
                    want:
                    {
                        action: "action.system.home",
                        entities: ["entity.system.home"],
                        type: "MIMETYPE",
                        options:{
                        // indicates the grant to perform read operations on the URI
                        authReadUriPermission: true,
                        // indicates the grant to perform write operations on the URI
                        authWriteUriPermission: true,
                        // support forward intent result to origin ability
                        abilityForwardResult: true,
                        // used for marking the ability start-up is triggered by continuation
                        abilityContinuation: true,
                        // specifies whether a component does not belong to ohos
                        notOhosComponent: true,
                        // specifies whether an ability is started
                        abilityFormEnabled: true,
                        // indicates the grant for possible persisting on the URI.
                        authPersistableUriPermission: true,
                        // indicates the grant for possible persisting on the URI.
                        authPrefixUriPermission: true,
                        // support distributed scheduling system start up multiple devices
                        abilitySliceMultiDevice: true,
                        // indicates that an ability using the service template is started regardless of whether the
                        // host application has been started.
                        startForegroundAbility: true,
                        // install the specified ability if it's not installed.
                        installOnDemand: true,
                        // return result to origin ability slice
                        abilitySliceForwardResult: true,
                        // install the specified ability with background mode if it's not installed.
                        installWithBackgroundMode: true
                        },
                        deviceId: "",
                        bundleName: "com.example.startabilitypromiseparameters",
                        abilityName: "com.example.startabilitypromiseparameters.MainAbility",
                        uri:"",
                        parameters:
                        {
                            mykey0: 1111,
                            mykey1: [1, 2, 3],
                            mykey2: "[1, 2, 3]",
                            mykey3: "xxxxxxxxxxxxxxxxxxxxxx",
                            mykey4: [1, 15],
                            mykey5: [false, true, false],
                            mykey6: ["aaaaaa", "bbbbb", "ccccccccccc"],
                            mykey7: true,
                        },
                    },
            }
        );
        expect(promise).assertEqual(0);
        done();
    })

    // @tc.number: ACTS_StartAbility_0300
    // @tc.name: StartAbility : A Page or Service ability uses this method to start a specific ability.
    // @tc.desc: Check the return value of the interface (by Promise)
    it('ACTS_StartAbility_0300', 0, async function (done) {
        var promise = await featureAbility.startAbility(
            {
                    want:
                    {
                        action: "",
                        entities: [""],
                        type: "",
                        options:{
                        // indicates the grant to perform read operations on the URI
                        authReadUriPermission: true,
                        // indicates the grant to perform write operations on the URI
                        authWriteUriPermission: true,
                        // support forward intent result to origin ability
                        abilityForwardResult: true,
                        // used for marking the ability start-up is triggered by continuation
                        abilityContinuation: true,
                        // specifies whether a component does not belong to ohos
                        notOhosComponent: true,
                        // specifies whether an ability is started
                        abilityFormEnabled: true,
                        // indicates the grant for possible persisting on the URI.
                        authPersistableUriPermission: true,
                        // indicates the grant for possible persisting on the URI.
                        authPrefixUriPermission: true,
                        // support distributed scheduling system start up multiple devices
                        abilitySliceMultiDevice: true,
                        // indicates that an ability using the service template is started regardless of whether the
                        // host application has been started.
                        startForegroundAbility: true,
                        // install the specified ability if it's not installed.
                        installOnDemand: true,
                        // return result to origin ability slice
                        abilitySliceForwardResult: true,
                        // install the specified ability with background mode if it's not installed.
                        installWithBackgroundMode: true
                        },
                        deviceId: "",
                        bundleName: "com.example.startabilitypromiseemptytest",
                        abilityName: "com.example.startabilitypromiseemptytest.MainAbility",
                        uri:""
                    },
            }
        );
        expect(promise).assertEqual(0);
        done();
    })

    // @tc.number: ACTS_StartAbility_0400
    // @tc.name: StartAbility : A Page or Service ability uses this method to start a specific ability.
    // @tc.desc: Check the return value of the interface (by AsyncCallback)
    it('ACTS_StartAbility_0400', 0, async function (done) {
        var result = featureAbility.startAbility(
            {
                    want:
                    {
                        action: "action.system.home",
                        entities: ["entity.system.home"],
                        type: "MIMETYPE",
                        options:{
                        // indicates the grant to perform read operations on the URI
                        authReadUriPermission: true,
                        // indicates the grant to perform write operations on the URI
                        authWriteUriPermission: true,
                        // support forward intent result to origin ability
                        abilityForwardResult: true,
                        // used for marking the ability start-up is triggered by continuation
                        abilityContinuation: true,
                        // specifies whether a component does not belong to ohos
                        notOhosComponent: true,
                        // specifies whether an ability is started
                        abilityFormEnabled: true,
                        // indicates the grant for possible persisting on the URI.
                        authPersistableUriPermission: true,
                        // indicates the grant for possible persisting on the URI.
                        authPrefixUriPermission: true,
                        // support distributed scheduling system start up multiple devices
                        abilitySliceMultiDevice: true,
                        // indicates that an ability using the service template is started regardless of whether the
                        // host application has been started.
                        startForegroundAbility: true,
                        // install the specified ability if it's not installed.
                        installOnDemand: true,
                        // return result to origin ability slice
                        abilitySliceForwardResult: true,
                        // install the specified ability with background mode if it's not installed.
                        installWithBackgroundMode: true
                        },
                        deviceId: "",
                        bundleName: "com.example.startabilityasynccallbacktest",
                        abilityName: "com.example.startabilityasynccallbacktest.MainAbility",
                        uri:""
                    },
            },
            (error,data) => {
               expect(data).assertEqual(0);
               console.log('featureAbilityTest startAbility asyncCallback errCode : ' + error +" data: " + data)
               done();
            },
        );
    })

    // @tc.number: ACTS_StartAbility_0500
    // @tc.name: StartAbility : A Page or Service ability uses this method to start a specific ability.
    // @tc.desc: Check the return value of the interface (by AsyncCallback)
    it('ACTS_StartAbility_0500', 0, async function (done) {
        var result = featureAbility.startAbility(
            {
                    want:
                    {
                        action: "action.system.home",
                        entities: ["entity.system.home"],
                        type: "MIMETYPE",
                        options:{
                        // indicates the grant to perform read operations on the URI
                        authReadUriPermission: true,
                        // indicates the grant to perform write operations on the URI
                        authWriteUriPermission: true,
                        // support forward intent result to origin ability
                        abilityForwardResult: true,
                        // used for marking the ability start-up is triggered by continuation
                        abilityContinuation: true,
                        // specifies whether a component does not belong to ohos
                        notOhosComponent: true,
                        // specifies whether an ability is started
                        abilityFormEnabled: true,
                        // indicates the grant for possible persisting on the URI.
                        authPersistableUriPermission: true,
                        // indicates the grant for possible persisting on the URI.
                        authPrefixUriPermission: true,
                        // support distributed scheduling system start up multiple devices
                        abilitySliceMultiDevice: true,
                        // indicates that an ability using the service template is started regardless of whether the
                        // host application has been started.
                        startForegroundAbility: true,
                        // install the specified ability if it's not installed.
                        installOnDemand: true,
                        // return result to origin ability slice
                        abilitySliceForwardResult: true,
                        // install the specified ability with background mode if it's not installed.
                        installWithBackgroundMode: true
                        },
                        deviceId: "",
                        bundleName: "com.example.startabilityasynccallbackparameterstest",
                        abilityName: "com.example.startabilityasynccallbackparameterstest.MainAbility",
                        uri:""
                        },
                        parameters:
                        {
                            mykey0: 1111,
                            mykey1: [1, 2, 3],
                            mykey2: "[1, 2, 3]",
                            mykey3: "xxxxxxxxxxxxxxxxxxxxxx",
                            mykey4: [1, 15],
                            mykey5: [false, true, false],
                            mykey6: ["aaaaaa", "bbbbb", "ccccccccccc"],
                            mykey7: true,
                        },
            },
             (error,data) => {
               expect(data).assertEqual(0);
               console.log('featureAbilityTest startAbility asyncCallback errCode : ' + error +" data: " + data)
               done()
            },
        );
    })

    // @tc.number: ACTS_StartAbility_0600
    // @tc.name: StartAbility : A Page or Service ability uses this method to start a specific ability.
    // @tc.desc: Check the return value of the interface (by AsyncCallback)
    it('ACTS_StartAbility_0600', 0, async function (done) {
        var result = featureAbility.startAbility(
            {
                    want:
                    {
                        action: "",
                        entities: [""],
                        type: "",
                        options:{
                        // indicates the grant to perform read operations on the URI
                        authReadUriPermission: true,
                        // indicates the grant to perform write operations on the URI
                        authWriteUriPermission: true,
                        // support forward intent result to origin ability
                        abilityForwardResult: true,
                        // used for marking the ability start-up is triggered by continuation
                        abilityContinuation: true,
                        // specifies whether a component does not belong to ohos
                        notOhosComponent: true,
                        // specifies whether an ability is started
                        abilityFormEnabled: true,
                        // indicates the grant for possible persisting on the URI.
                        authPersistableUriPermission: true,
                        // indicates the grant for possible persisting on the URI.
                        authPrefixUriPermission: true,
                        // support distributed scheduling system start up multiple devices
                        abilitySliceMultiDevice: true,
                        // indicates that an ability using the service template is started regardless of whether the
                        // host application has been started.
                        startForegroundAbility: true,
                        // install the specified ability if it's not installed.
                        installOnDemand: true,
                        // return result to origin ability slice
                        abilitySliceForwardResult: true,
                        // install the specified ability with background mode if it's not installed.
                        installWithBackgroundMode: true
                        },
                        deviceId: "",
                        bundleName: "com.example.startabilityasynccallbackemptytest",
                        abilityName: "com.example.startabilityasynccallbackemptytest.MainAbility",
                        uri:""
                    },
            },
             (error,data) => {
               expect(data).assertEqual(0);
               console.log('featureAbilityTest startAbility asyncCallback errCode : ' + error +" data: " + data)
               done()
            },
        );
    })


    // @tc.number: ACTS_StartAbilityForResult_0100
    // @tc.name: StartAbilityForResult : Start other ability for result.
    // @tc.desc: Check the return value of the interface (by Promise)
    it('ACTS_StartAbilityForResult_0100', 0, async function (done) {
        var promise = await featureAbility.startAbilityForResult(
            {
                    want:
                    {
                        action: "action.system.home",
                        entities: ["entity.system.home"],
                        type: "MIMETYPE",
                        options:{
                        // indicates the grant to perform read operations on the URI
                        authReadUriPermission: true,
                        // indicates the grant to perform write operations on the URI
                        authWriteUriPermission: true,
                        // support forward intent result to origin ability
                        abilityForwardResult: true,
                        // used for marking the ability start-up is triggered by continuation
                        abilityContinuation: true,
                        // specifies whether a component does not belong to ohos
                        notOhosComponent: true,
                        // specifies whether an ability is started
                        abilityFormEnabled: true,
                        // indicates the grant for possible persisting on the URI.
                        authPersistableUriPermission: true,
                        // indicates the grant for possible persisting on the URI.
                        authPrefixUriPermission: true,
                        // support distributed scheduling system start up multiple devices
                        abilitySliceMultiDevice: true,
                        // indicates that an ability using the service template is started regardless of whether the
                        // host application has been started.
                        startForegroundAbility: true,
                        // install the specified ability if it's not installed.
                        installOnDemand: true,
                        // return result to origin ability slice
                        abilitySliceForwardResult: true,
                        // install the specified ability with background mode if it's not installed.
                        installWithBackgroundMode: true
                        },
                        deviceId: "",
                        bundleName: "com.example.startabilityforresultpromisetest",
                        abilityName: "com.example.startabilityforresultpromisetest.MainAbility",
                        uri:""
                    },
                    requestCode: 2,
            },
            (error, result) => {
            checkOnAbilityResult(result);
            console.log('featureAbilityTest ACTS_StartAbilityForResult_0100 asyncCallback errCode : ' + error + " result: " + result)
            done();
            },
        );
        expect(promise).assertEqual(0);
        done();
    })

    // @tc.number: ACTS_StartAbilityForResult_0200
    // @tc.name: StartAbilityForResult : Start other ability for result.
    // @tc.desc: Check the return value of the interface (by Promise)
    it('ACTS_StartAbilityForResult_0200', 0, async function (done) {
        var promise = await featureAbility.startAbilityForResult(
            {
                    want:
                    {
                        action: "action.system.home",
                        entities: ["entity.system.home"],
                        type: "MIMETYPE",
                        options:{
                        // indicates the grant to perform read operations on the URI
                        authReadUriPermission: true,
                        // indicates the grant to perform write operations on the URI
                        authWriteUriPermission: true,
                        // support forward intent result to origin ability
                        abilityForwardResult: true,
                        // used for marking the ability start-up is triggered by continuation
                        abilityContinuation: true,
                        // specifies whether a component does not belong to ohos
                        notOhosComponent: true,
                        // specifies whether an ability is started
                        abilityFormEnabled: true,
                        // indicates the grant for possible persisting on the URI.
                        authPersistableUriPermission: true,
                        // indicates the grant for possible persisting on the URI.
                        authPrefixUriPermission: true,
                        // support distributed scheduling system start up multiple devices
                        abilitySliceMultiDevice: true,
                        // indicates that an ability using the service template is started regardless of whether the
                        // host application has been started.
                        startForegroundAbility: true,
                        // install the specified ability if it's not installed.
                        installOnDemand: true,
                        // return result to origin ability slice
                        abilitySliceForwardResult: true,
                        // install the specified ability with background mode if it's not installed.
                        installWithBackgroundMode: true
                        },
                        deviceId: "",
                        bundleName: "com.example.startabilityforresultpromiseparameterstest",
                        abilityName: "com.example.startabilityforresultpromiseparameterstest.MainAbility",
                        uri:"",
                        parameters:
                        {
                            mykey0: 1111,
                            mykey1: [1, 2, 3],
                            mykey2: "[1, 2, 3]",
                            mykey3: "xxxxxxxxxxxxxxxxxxxxxx",
                            mykey4: [1, 15],
                            mykey5: [false, true, false],
                            mykey6: ["aaaaaa", "bbbbb", "ccccccccccc"],
                            mykey7: true,
                        },
                    },
                    requestCode: 2,
            },
            (error, result) => {
                checkOnAbilityResult(result);
                console.log('featureAbilityTest ACTS_StartAbilityForResult_0200 asyncCallback errCode : ' + error + " result: " + result)
                done();
            },
        );
        expect(promise).assertEqual(0);
        done();
    })

    // @tc.number: ACTS_StartAbilityForResult_0300
    // @tc.name: StartAbilityForResult : Start other ability for result.
    // @tc.desc: Check the return value of the interface (by Promise)
    it('ACTS_StartAbilityForResult_0300', 0, async function (done) {
        var promise = await featureAbility.startAbilityForResult(
            {
                    want:
                    {
                        action: "",
                        entities: [""],
                        type: "",
                        options:{
                        // indicates the grant to perform read operations on the URI
                        authReadUriPermission: true,
                        // indicates the grant to perform write operations on the URI
                        authWriteUriPermission: true,
                        // support forward intent result to origin ability
                        abilityForwardResult: true,
                        // used for marking the ability start-up is triggered by continuation
                        abilityContinuation: true,
                        // specifies whether a component does not belong to ohos
                        notOhosComponent: true,
                        // specifies whether an ability is started
                        abilityFormEnabled: true,
                        // indicates the grant for possible persisting on the URI.
                        authPersistableUriPermission: true,
                        // indicates the grant for possible persisting on the URI.
                        authPrefixUriPermission: true,
                        // support distributed scheduling system start up multiple devices
                        abilitySliceMultiDevice: true,
                        // indicates that an ability using the service template is started regardless of whether the
                        // host application has been started.
                        startForegroundAbility: true,
                        // install the specified ability if it's not installed.
                        installOnDemand: true,
                        // return result to origin ability slice
                        abilitySliceForwardResult: true,
                        // install the specified ability with background mode if it's not installed.
                        installWithBackgroundMode: true
                        },
                        deviceId: "",
                        bundleName: "com.example.startabilityforresultpromiseemptytest",
                        abilityName: "com.example.startabilityforresultpromiseemptytest.MainAbility",
                        uri:""
                    },
                    requestCode: 2,
            },
            (error, result) => {
                checkOnAbilityResult(result);
                console.log('featureAbilityTest ACTS_StartAbilityForResult_0300 asyncCallback errCode : ' + error + " result: " + result)
                done();
            },
        );
        expect(promise).assertEqual(0);
        done();
    })

    // @tc.number: ACTS_StartAbilityForResult_0400
    // @tc.name: StartAbilityForResult : Start other ability for result.
    // @tc.desc: Check the return value of the interface (by AsyncCallback)
    it('ACTS_StartAbilityForResult_0400', 0, async function (done) {
        var result = featureAbility.startAbilityForResult(
            {
                    want:
                    {
                        action: "action.system.home",
                        entities: ["entity.system.home"],
                        type: "MIMETYPE",
                        options:{
                        // indicates the grant to perform read operations on the URI
                        authReadUriPermission: true,
                        // indicates the grant to perform write operations on the URI
                        authWriteUriPermission: true,
                        // support forward intent result to origin ability
                        abilityForwardResult: true,
                        // used for marking the ability start-up is triggered by continuation
                        abilityContinuation: true,
                        // specifies whether a component does not belong to ohos
                        notOhosComponent: true,
                        // specifies whether an ability is started
                        abilityFormEnabled: true,
                        // indicates the grant for possible persisting on the URI.
                        authPersistableUriPermission: true,
                        // indicates the grant for possible persisting on the URI.
                        authPrefixUriPermission: true,
                        // support distributed scheduling system start up multiple devices
                        abilitySliceMultiDevice: true,
                        // indicates that an ability using the service template is started regardless of whether the
                        // host application has been started.
                        startForegroundAbility: true,
                        // install the specified ability if it's not installed.
                        installOnDemand: true,
                        // return result to origin ability slice
                        abilitySliceForwardResult: true,
                        // install the specified ability with background mode if it's not installed.
                        installWithBackgroundMode: true
                        },
                        deviceId: "",
                        bundleName: "com.example.startabilityforresultasynccallbacktest",
                        abilityName: "com.example.startabilityforresultasynccallbacktest.MainAbility",
                        uri:""
                    },
                    requestCode: 2,
            },
            (error, result) => {
                checkOnAbilityResult(result);
                console.log('featureAbilityTest ACTS_StartAbilityForResult_0700 asyncCallback errCode : ' + error + " result: " + result)
                done()
            },
             (error,result) => {
               expect(result).assertEqual(0);
               console.log('featureAbilityTest ACTS_StartAbilityForResult_0700 asyncCallback errCode : ' + error + " result: " + result)
               done()
            },

        );
    })

    // @tc.number: ACTS_StartAbilityForResult_0500
    // @tc.name: StartAbilityForResult : Start other ability for result.
    // @tc.desc: Check the return value of the interface (by AsyncCallback)
    it('ACTS_StartAbilityForResult_0500', 0, async function (done) {
        var result = featureAbility.startAbilityForResult(
            {
                    want:
                    {
                        action: "action.system.home",
                        entities: ["entity.system.home"],
                        type: "MIMETYPE",
                        options:{
                        // indicates the grant to perform read operations on the URI
                        authReadUriPermission: true,
                        // indicates the grant to perform write operations on the URI
                        authWriteUriPermission: true,
                        // support forward intent result to origin ability
                        abilityForwardResult: true,
                        // used for marking the ability start-up is triggered by continuation
                        abilityContinuation: true,
                        // specifies whether a component does not belong to ohos
                        notOhosComponent: true,
                        // specifies whether an ability is started
                        abilityFormEnabled: true,
                        // indicates the grant for possible persisting on the URI.
                        authPersistableUriPermission: true,
                        // indicates the grant for possible persisting on the URI.
                        authPrefixUriPermission: true,
                        // support distributed scheduling system start up multiple devices
                        abilitySliceMultiDevice: true,
                        // indicates that an ability using the service template is started regardless of whether the
                        // host application has been started.
                        startForegroundAbility: true,
                        // install the specified ability if it's not installed.
                        installOnDemand: true,
                        // return result to origin ability slice
                        abilitySliceForwardResult: true,
                        // install the specified ability with background mode if it's not installed.
                        installWithBackgroundMode: true
                        },
                        deviceId: "",
                        bundleName: "com.example.startabilityforresultasynccallbackparameterstest",
                        abilityName: "com.example.startabilityforresultasynccallbackparameterstest.MainAbility",
                        uri:"",
                        parameters:
                        {
                            mykey0: 1111,
                            mykey1: [1, 2, 3],
                            mykey2: "[1, 2, 3]",
                            mykey3: "xxxxxxxxxxxxxxxxxxxxxx",
                            mykey4: [1, 15],
                            mykey5: [false, true, false],
                            mykey6: ["aaaaaa", "bbbbb", "ccccccccccc"],
                            mykey7: true,
                        },
                    },
                    requestCode: 2,
            },
            (error, result) => {
                checkOnAbilityResult(result);
                console.log('featureAbilityTest ACTS_StartAbilityForResult_0800 asyncCallback errCode : ' + error + " result: " + result)
                done();
            },
             (error,result) => {
                 expect(result).assertEqual(0);
                 console.log('featureAbilityTest ACTS_StartAbilityForResult_0800 asyncCallback errCode : ' + error + " result: " + result)
                 done();
            },
        );
    })

    // @tc.number: ACTS_StartAbilityForResult_0600
    // @tc.name: StartAbilityForResult : Start other ability for result.
    // @tc.desc: Check the return value of the interface (by AsyncCallback)
    it('ACTS_StartAbilityForResult_0600', 0, async function (done) {
        var result = featureAbility.startAbilityForResult(
            {
                    want:
                    {
                        action: "",
                        entities: [""],
                        type: "",
                        options:{
                        // indicates the grant to perform read operations on the URI
                        authReadUriPermission: true,
                        // indicates the grant to perform write operations on the URI
                        authWriteUriPermission: true,
                        // support forward intent result to origin ability
                        abilityForwardResult: true,
                        // used for marking the ability start-up is triggered by continuation
                        abilityContinuation: true,
                        // specifies whether a component does not belong to ohos
                        notOhosComponent: true,
                        // specifies whether an ability is started
                        abilityFormEnabled: true,
                        // indicates the grant for possible persisting on the URI.
                        authPersistableUriPermission: true,
                        // indicates the grant for possible persisting on the URI.
                        authPrefixUriPermission: true,
                        // support distributed scheduling system start up multiple devices
                        abilitySliceMultiDevice: true,
                        // indicates that an ability using the service template is started regardless of whether the
                        // host application has been started.
                        startForegroundAbility: true,
                        // install the specified ability if it's not installed.
                        installOnDemand: true,
                        // return result to origin ability slice
                        abilitySliceForwardResult: true,
                        // install the specified ability with background mode if it's not installed.
                        installWithBackgroundMode: true
                        },
                        deviceId: "",
                        bundleName: "com.example.startabilityforresultasynccallbackemptytest",
                        abilityName: "com.example.startabilityforresultasynccallbackemptytest.MainAbility",
                        uri:""
                    },
                    requestCode: 2,
            },
            (error, result) => {
                checkOnAbilityResult(result);
                console.log('featureAbilityTest ACTS_StartAbilityForResult_0900 asyncCallback errCode : ' + error + " result: " + result)
                done()
            },
             (error,result) => {
               expect(result).assertEqual(0);
               console.log('featureAbilityTest ACTS_StartAbilityForResult_0900 asyncCallback errCode : ' + error + " result: " + result)
               done()
            },
        );
    })

    function checkOnAbilityResult(data) {
        expect(typeof(data)).assertEqual("object");
        expect(typeof(data.requestCode)).assertEqual("number");
        expect(typeof(data.resultCode)).assertEqual("number");
        expect(typeof(data.want.action)).assertEqual("string");
        expect(Array.isArray(data.want.entities)).assertEqual(true);
        expect(typeof(data.want.type)).assertEqual("string");
        expect(typeof(data.want.options)).assertEqual("object");
        expect(typeof(data.want.deviceId)).assertEqual("string");
        expect(typeof(data.want.bundleName)).assertEqual("string");
        expect(typeof(data.want.abilityName)).assertEqual("string");
        expect(typeof(data.want.uri)).assertEqual("string");

        console.info('featureAbilityTest onAbilityResult asyncCallback success : *************');
        console.info('requestCode : ' + data.requestCode);
        console.info('resultCode : ' + data.resultCode);
        console.info('want.action : ' + data.want.action);
        console.info('want.entities.length : ' + data.want.entities.length);
        for(var j = 0; j < data.want.entities.length; j++) {
            console.info('want.entities : ' + data.want.entities[j]);
        }
        console.info('want.type : ' + data.want.type);
        console.info('want.options : ' + data.want.options);
        console.info('want.deviceId : ' + data.want.deviceId);
        console.info('want.options.authReadUriPermission : ' + data.want.options.authReadUriPermission);
        console.info('want.options.authWriteUriPermission : ' + data.want.options.authWriteUriPermission);
        console.info('want.options.abilityForwardResult : ' + data.want.options.abilityForwardResult);
        console.info('want.options.abilityContinuation : ' + data.want.options.abilityContinuation);
        console.info('want.options.notOhosComponent : ' + data.want.options.notOhosComponent);
        console.info('want.options.abilityFormEnabled : ' + data.want.options.abilityFormEnabled);
        console.info('want.options.authPersistableUriPermission : ' + data.want.options.authPersistableUriPermission);
        console.info('want.options.authPrefixUriPermission : ' + data.want.options.authPrefixUriPermission);
        console.info('want.options.abilitySliceMultiDevice : ' + data.want.options.abilitySliceMultiDevice);
        console.info('want.options.startForegroundAbility : ' + data.want.options.startForegroundAbility);
        console.info('want.options.installOnDemand : ' + data.want.options.installOnDemand);
        console.info('want.options.abilitySliceForwardResult : ' + data.want.options.abilitySliceForwardResult);
        console.info('want.options.installWithBackgroundMode : ' + data.want.options.installWithBackgroundMode);
        console.info('want.bundleName : ' + data.want.bundleName);
        console.info('want.abilityName : ' + data.want.abilityName);
        console.info('want.uri : ' + data.want.uri);
    }

    // @tc.number: ACTS_HasWindowFocus_0200
    // @tc.name: HasWindowFocus : Checks whether the main window of this ability has window focus
    // @tc.desc: Check the return value of the interface (by Promise)
    it('ACTS_HasWindowFocus_0200', 0, async function (done) {
        var promise = featureAbility.hasWindowFocus();
        expect(typeof(promise)).assertEqual("object");
        var info = await featureAbility.hasWindowFocus();
        expect(info).assertEqual(false);
        done();
    })

    // @tc.number: ACTS_HasWindowFocus_0400
    // @tc.name: HasWindowFocus : Checks whether the main window of this ability has window focus
    // @tc.desc: Check the return value of the interface (by Promise)
    it('ACTS_HasWindowFocus_0400', 0, async function (done) {
        var result = featureAbility.hasWindowFocus(
            (error, data) => {
                console.log("ACTS_HasWindowFocus_0400 asyncCallback code: " + error.code + " data: " + data)
                expect(data).assertEqual(false);
                done();
            }
        );
    })

    // @tc.number: ACTS_TerminateAbility_0100
    // @tc.name: TerminateAbility : Destroys ability
    // @tc.desc: Check the return value of the interface (by Promise)
    it('ACTS_TerminateAbility_0100', 0, async function (done) {
        var promise = featureAbility.startAbility(
            {
                    want:
                    {
                        action: "action.system.home",
                        entities: ["entity.system.home"],
                        type: "MIMETYPE",
                        options:{
                        // indicates the grant to perform read operations on the URI
                        authReadUriPermission: true,
                        // indicates the grant to perform write operations on the URI
                        authWriteUriPermission: true,
                        // support forward intent result to origin ability
                        abilityForwardResult: true,
                        // used for marking the ability start-up is triggered by continuation
                        abilityContinuation: true,
                        // specifies whether a component does not belong to ohos
                        notOhosComponent: true,
                        // specifies whether an ability is started
                        abilityFormEnabled: true,
                        // indicates the grant for possible persisting on the URI.
                        authPersistableUriPermission: true,
                        // indicates the grant for possible persisting on the URI.
                        authPrefixUriPermission: true,
                        // support distributed scheduling system start up multiple devices
                        abilitySliceMultiDevice: true,
                        // indicates that an ability using the service template is started regardless of whether the
                        // host application has been started.
                        startForegroundAbility: true,
                        // install the specified ability if it's not installed.
                        installOnDemand: true,
                        // return result to origin ability slice
                        abilitySliceForwardResult: true,
                        // install the specified ability with background mode if it's not installed.
                        installWithBackgroundMode: true
                        },
                        deviceId: "",
                        bundleName: "com.example.terminateabilityobjecttest",
                        abilityName: "com.example.terminateabilityobjecttest.MainAbility",
                        uri:""
                    },
            }
        );
        expect(typeof(promise)).assertEqual("object");
        done();
    })

    // @tc.number: ACTS_TerminateAbility_0200
    // @tc.name: TerminateAbility : Destroys ability
    // @tc.desc: Check the return value of the interface (by AsyncCallback)
    it('ACTS_TerminateAbility_0200', 0, async function (done) {
        var promise = featureAbility.startAbility(
            {
                    want:
                    {
                        action: "action.system.home",
                        entities: ["entity.system.home"],
                        type: "MIMETYPE",
                        flags: 2,
                        deviceId: "",
                        bundleName: "com.example.terminateabilitytest",
                        abilityName: "com.example.terminateabilitytest.MainAbility",
                        uri:""
                    },
            }
        );
        expect(typeof(promise)).assertEqual("object");
        done();
    })


    // @tc.number: ACTS_FinishWithResult_0100
    // @tc.name: FinishWithResult : Called when startAbilityForResultis called to start an ability and the result is returned.
    // @tc.desc: Check the return value of the interface
    it('ACTS_FinishWithResult_0100', 0, async function (done) {
        var promise = await featureAbility.startAbilityForResult(
            {
                want:
                {
                    action: "action.system.home",
                    entities: ["entity.system.home"],
                    type: "MIMETYPE",
                    options:{
                    // indicates the grant to perform read operations on the URI
                        authReadUriPermission: true,
                    // indicates the grant to perform write operations on the URI
                        authWriteUriPermission: true,
                    // support forward intent result to origin ability
                        abilityForwardResult: true,
                    // used for marking the ability start-up is triggered by continuation
                        abilityContinuation: true,
                    // specifies whether a component does not belong to ohos
                        notOhosComponent: true,
                    // specifies whether an ability is started
                        abilityFormEnabled: true,
                    // indicates the grant for possible persisting on the URI.
                        authPersistableUriPermission: true,
                    // indicates the grant for possible persisting on the URI.
                        authPrefixUriPermission: true,
                    // support distributed scheduling system start up multiple devices
                        abilitySliceMultiDevice: true,
                    // indicates that an ability using the service template is started regardless of whether the
                    // host application has been started.
                        startForegroundAbility: true,
                    // install the specified ability if it's not installed.
                        installOnDemand: true,
                    // return result to origin ability slice
                        abilitySliceForwardResult: true,
                    // install the specified ability with background mode if it's not installed.
                        installWithBackgroundMode: true
                    },
                    deviceId: "",
                    bundleName: "com.example.finishwithresultpromiseparameterstest",
                    abilityName: "com.example.finishwithresultpromiseparameterstest.MainAbility",
                    uri:""
                },
                requestCode: 2,
            },
            (error, result) => {
                checkOnAbilityResult(result);
                console.log('featureAbilityTest ACTS_StartAbilityForResult_0100 asyncCallback errCode : ' + error + " result: " + result)
                done();
            },
        );
        expect(promise).assertEqual(0);
        done();
    })

    // @tc.number: ACTS_FinishWithResult_0200
    // @tc.name: FinishWithResult : Called when startAbilityForResultis called to start an ability and the result is returned.
    // @tc.desc: Check the return value of the interface
    it('ACTS_FinishWithResult_0200', 0, async function (done) {
        var promise = await featureAbility.startAbilityForResult(
            {
                want:
                {
                    action: "action.system.home",
                    entities: ["entity.system.home"],
                    type: "MIMETYPE",
                    options:{
                    // indicates the grant to perform read operations on the URI
                        authReadUriPermission: true,
                    // indicates the grant to perform write operations on the URI
                        authWriteUriPermission: true,
                    // support forward intent result to origin ability
                        abilityForwardResult: true,
                    // used for marking the ability start-up is triggered by continuation
                        abilityContinuation: true,
                    // specifies whether a component does not belong to ohos
                        notOhosComponent: true,
                    // specifies whether an ability is started
                        abilityFormEnabled: true,
                    // indicates the grant for possible persisting on the URI.
                        authPersistableUriPermission: true,
                    // indicates the grant for possible persisting on the URI.
                        authPrefixUriPermission: true,
                    // support distributed scheduling system start up multiple devices
                        abilitySliceMultiDevice: true,
                    // indicates that an ability using the service template is started regardless of whether the
                    // host application has been started.
                        startForegroundAbility: true,
                    // install the specified ability if it's not installed.
                        installOnDemand: true,
                    // return result to origin ability slice
                        abilitySliceForwardResult: true,
                    // install the specified ability with background mode if it's not installed.
                        installWithBackgroundMode: true
                    },
                    deviceId: "",
                    bundleName: "com.example.finishwithresulttest",
                    abilityName: "com.example.finishwithresulttest.MainAbility",
                    uri:""
                },
                requestCode: 2,
            },
            (error, result) => {
                checkOnAbilityResult(result);
                console.log('featureAbilityTest ACTS_StartAbilityForResult_0200 asyncCallback errCode : ' + error + " result: " + result)
                done();
            },
        );
        expect(promise).assertEqual(0);
        done();
    })

    // @tc.number: ACTS_FinishWithResult_0300
    // @tc.name: FinishWithResult : Called when startAbilityForResultis called to start an ability and the result is returned.
    // @tc.desc: Check the return value of the interface
    it('ACTS_FinishWithResult_0300', 0, async function (done) {
        var promise = await featureAbility.startAbilityForResult(
            {
                want:
                {
                    action: "action.system.home",
                    entities: ["entity.system.home"],
                    type: "MIMETYPE",
                    options:{
                    // indicates the grant to perform read operations on the URI
                        authReadUriPermission: true,
                    // indicates the grant to perform write operations on the URI
                        authWriteUriPermission: true,
                    // support forward intent result to origin ability
                        abilityForwardResult: true,
                    // used for marking the ability start-up is triggered by continuation
                        abilityContinuation: true,
                    // specifies whether a component does not belong to ohos
                        notOhosComponent: true,
                    // specifies whether an ability is started
                        abilityFormEnabled: true,
                    // indicates the grant for possible persisting on the URI.
                        authPersistableUriPermission: true,
                    // indicates the grant for possible persisting on the URI.
                        authPrefixUriPermission: true,
                    // support distributed scheduling system start up multiple devices
                        abilitySliceMultiDevice: true,
                    // indicates that an ability using the service template is started regardless of whether the
                    // host application has been started.
                        startForegroundAbility: true,
                    // install the specified ability if it's not installed.
                        installOnDemand: true,
                    // return result to origin ability slice
                        abilitySliceForwardResult: true,
                    // install the specified ability with background mode if it's not installed.
                        installWithBackgroundMode: true
                    },
                    deviceId: "",
                    bundleName: "com.example.finishwithresultemptytest",
                    abilityName: "com.example.finishwithresultemptytest.MainAbility",
                    uri:""
                },
                requestCode: 2,
            },
            (error, result) => {
                checkOnAbilityResult(result);
                console.log('featureAbilityTest ACTS_StartAbilityForResult_0300 asyncCallback errCode : ' + error + " result: " + result)
                done();
            },
        );
        expect(promise).assertEqual(0);
        done();
    })

    // checkAbilityName
    function checkAbilityName(info) {
        console.log("AbilityName name : " + info);
        expect(typeof(info)).assertEqual("string");
        expect(info).assertEqual("com.example.actsfeatureabilitytest.MainAbility");
    }

    // @tc.number: ACTS_GetAbilityName_0100
    // @tc.name: GetAbilityName : Obtains the class name in this ability name, without the prefixed bundle name.
    // @tc.desc: Check the return type of the interface (by Promise)
    it('ACTS_GetAbilityName_0100', 0, async function (done) {
        var promise = featureAbility.getAbilityName();
        expect(typeof(promise)).assertEqual("object");
        var info = await featureAbility.getAbilityName();
        checkAbilityName(info);
        done();
    })

    // @tc.number: ACTS_GetAbilityName_0200
    // @tc.name: GetAbilityName : Obtains the class name in this ability name, without the prefixed bundle name.
    // @tc.desc: Check the return type of the interface (by Promise)
    it('ACTS_GetAbilityName_0200', 0, async function (done) {
        var result = featureAbility.getAbilityName(
            (err, data) => {
                checkAbilityName(data);
                done()
            }
        );
    })

    // checkApplicationInfo
    function checkApplicationInfo(info) {
        console.log("getApplicationInfo : " + info)
        console.log("name : " + info.name);
        console.log("description : " + info.description);
        console.log("descriptionId : " + info.descriptionId);
        console.log("systemApp : " + info.systemApp);
        console.log("enabled : " + info.enabled);
        console.log("label : " + info.label);
        console.log("labelId : " + info.labelId);
        console.log("icon : " + info.icon);
        console.log("iconId : " + info.iconId);
        console.log("process : " + info.process);
        console.log("supportedModes : " + info.supportedModes);

        console.log("moduleSourceDirs length : " + info.moduleSourceDirs.length);
        for(var j = 0; j < info.moduleSourceDirs.length; j++) {
            console.log("info.moduleSourceDirs[" + j + "] : " + info.moduleSourceDirs[j]);
        }
        console.log("permissions length : " + info.permissions.length);
        for(var j = 0; j < info.permissions.length; j++) {
            console.log("info.permissions[" + j + "] : " + info.permissions[j]);
        }
        console.log("moduleInfos length : " + info.moduleInfos.length);
        for(var j = 0; j < info.moduleInfos.length; j++) {
            console.log("info.moduleInfos[" + j + "].moduleName : " + info.moduleInfos[j].moduleName);
            console.log("info.moduleInfos[" + j + "].moduleSourceDir : " + info.moduleInfos[j].moduleSourceDir);
        }
        console.log("flags : " + info.flags);
        console.log("entryDir : " + info.entryDir);

        expect(typeof(info)).assertEqual("object");
        expect(typeof(info.name)).assertEqual("string");
        expect(typeof(info.description)).assertEqual("string");
        expect(typeof(info.descriptionId)).assertEqual("number");
        expect(typeof(info.systemApp)).assertEqual("boolean");
        expect(typeof(info.enabled)).assertEqual("boolean");
        expect(typeof(info.label)).assertEqual("string");
        expect(typeof(info.labelId)).assertEqual("string");
        expect(typeof(info.icon)).assertEqual("string");
        expect(typeof(info.iconId)).assertEqual("string");
        expect(typeof(info.process)).assertEqual("string");
        expect(typeof(info.supportedModes)).assertEqual("number");
        expect(Array.isArray(info.moduleSourceDirs)).assertEqual(true);
        expect(Array.isArray(info.permissions)).assertEqual(true);
        expect(Array.isArray(info.moduleInfos)).assertEqual(true);
        expect(typeof(info.flags)).assertEqual("number");
        expect(typeof(info.entryDir)).assertEqual("string");

        expect(info.name).assertEqual("com.example.actsfeatureabilitytest");
        expect(info.description).assertEqual("$string:mainability_description");
        //            expect(info.descriptionId).assertEqual(0);    //create by DevEco when building HAP.
        expect(info.systemApp).assertEqual(false);
        expect(info.enabled).assertEqual(true);
        expect(info.label).assertEqual("$string:app_name");
        //            expect(info.labelId).assertEqual(0);  //create by DevEco when building HAP.
        expect(info.icon).assertEqual("$media:icon");
        //            expect(info.iconId).assertEqual(0);   //create by DevEco when building HAP.
        expect(info.process).assertEqual("processTest");
        expect(info.supportedModes).assertEqual(0);
        expect(info.moduleSourceDirs[0]).assertEqual("/data/accounts/account_0/applications/com.example.actsfeatureabilitytest/com.example.actsfeatureabilitytest");
        expect(info.permissions[0]).assertEqual("ohos.permission.CAMERA");
        expect(info.moduleInfos[0].moduleName).assertEqual("entry");
        expect(info.moduleInfos[0].moduleSourceDir).assertEqual("/data/accounts/account_0/applications/com.example.actsfeatureabilitytest/com.example.actsfeatureabilitytest");
        expect(info.flags).assertEqual(0);
        expect(info.entryDir).assertEqual("/data/accounts/account_0/applications/com.example.actsfeatureabilitytest/com.example.actsfeatureabilitytest");
    }


    // @tc.number: ACTS_GetApplicationInfo_0100
    // @tc.name: GetApplicationInfo : Obtains information about the current application.
    // @tc.desc: Check the return type of the interface (by Promise)
    it('ACTS_GetApplicationInfo_0100', 0, async function (done) {
        var promise = featureAbility.getApplicationInfo();
        expect(typeof(promise)).assertEqual("object");
        var info = await featureAbility.getApplicationInfo();
        checkApplicationInfo(info);
        done();
    })

    // @tc.number: ACTS_GetApplicationInfo_0100
    // @tc.name: GetApplicationInfo : Obtains information about the current application.
    // @tc.desc: Check the return value of the interface (by AsyncCallback)
    it('ACTS_GetApplicationInfo_0200', 0, async function (done) {
        var result = featureAbility.getApplicationInfo(
            (err, data) => {
                checkApplicationInfo(data);
                done()
            }
        );
    })

    // checkProcessInfo
    function checkProcessInfo(info) {
        console.log("checkProcessInfo ProcessInfo: " + info);
        console.log("checkProcessInfo processName : " + info.processName);
        console.log("checkProcessInfo pid : " + info.pid);

        expect(typeof(info)).assertEqual("object");
        expect(typeof(info.processName)).assertEqual("string");
        expect(typeof(info.pid)).assertEqual("number");
        expect(info.processName).assertEqual("processTestAbility");
    }

    // @tc.number: ACTS_GetProcessInfo_0100
    // @tc.name: GetProcessInfo : Called when getting the ProcessInfo
    // @tc.desc: Check the return type of the interface (by promise)
    it('ACTS_GetProcessInfo_0100', 0, async function (done) {
        var promise = featureAbility.getProcessInfo();
        expect(typeof(promise)).assertEqual("object");
        var info = await featureAbility.getProcessInfo();
        checkProcessInfo(info);
        done();
    })

    // @tc.number: ACTS_GetProcessInfo_0200
    // @tc.name: GetProcessInfo : Called when getting the ProcessInfo
    // @tc.desc: Check the return type of the interface (by AsyncCallback)
    it('ACTS_GetProcessInfo_0200', 0, async function (done) {
        var result = featureAbility.getProcessInfo(
            (err, data) => {
                checkProcessInfo(data);
                done()
            }
        );
    })

    // checkElementName
    function checkElementName(info) {
        console.log("getElementName : " + info);
        console.log("deviceId : " + info.deviceId);
        console.log("bundleName : " + info.bundleName);
        console.log("abilityName : " + info.abilityName);
        console.log("uri : " + info.uri);
        console.log("shortName : " + info.shortName);

        expect(typeof(info)).assertEqual("object");
        expect(typeof(info.deviceId)).assertEqual("string");
        expect(typeof(info.bundleName)).assertEqual("string");
        expect(typeof(info.abilityName)).assertEqual("string");
        expect(typeof(info.uri)).assertEqual("string");
        expect(typeof(info.shortName)).assertEqual("string");

        expect(info.deviceId).assertEqual("");
        expect(info.bundleName).assertEqual("com.example.actsfeatureabilitytest");
        expect(info.abilityName).assertEqual("com.example.actsfeatureabilitytest.MainAbility");
        expect(info.uri).assertEqual("");
        expect(info.shortName).assertEqual("");
    }

    // @tc.number: ACTS_GetElementName_0100
    // @tc.name: GetElementName : Obtains the ohos.bundle.ElementName object of the current ability.
    // @tc.desc: Check the return value of the interface (by promise)
    it('ACTS_GetElementName_0100', 0, async function (done) {
        var promise = featureAbility.getElementName();
        expect(typeof(promise)).assertEqual("object");
        var info = await featureAbility.getElementName();
        checkElementName(info);
        done();
    })

    // @tc.number: ACTS_GetElementName_0200
    // @tc.name: GetElementName : Obtains the ohos.bundle.ElementName object of the current ability.
    // @tc.desc: Check the return value of the interface (by AsyncCallback)
    it('ACTS_GetElementName_0200', 0, async function (done) {
        var result = featureAbility.getElementName(
            (err, data) => {
                checkElementName(data);
                done()
            }
        );
    })

    // checkAppType
    function checkAppType(info) {
        console.log("AppType : " + info);
        expect(typeof(info)).assertEqual("string");
        expect(info).assertEqual("third-party");
    }

    // @tc.number: ACTS_GetAppType_0100
    // @tc.name: GetAppType : Obtains the type of this application.
    // @tc.desc: Check the return value of the interface (by promise)
    it('ACTS_GetAppType_0100', 0, async function (done) {
        var promise = featureAbility.getAppType();
        expect(typeof(promise)).assertEqual("object");
        var info = await featureAbility.getAppType();
        checkAppType(info);
        done();
    })

    // @tc.number: ACTS_GetAppType_0200
    // @tc.name: GetAppType : Obtains the type of this application.
    // @tc.desc: Check the return value of the interface (by AsyncCallback)
    it('ACTS_GetAppType_0200', 0, async function (done) {
        var result = featureAbility.getAppType(
            (err, data) => {
                checkAppType(data);
                done()
            }
        );
    })

    // checkAbilityInfo
    function checkAbilityInfo(data) {
        console.log("checkAbilityInfo start  " + data);
        console.log("checkAbilityInfo bundleName : " + data.bundleName);
        console.log("checkAbilityInfo name : " + data.name);
        console.log("checkAbilityInfo label : " + data.label);
        console.log("checkAbilityInfo description : " + data.description);
        console.log("checkAbilityInfo icon : " + data.icon);
        console.log("checkAbilityInfo labelId : " + data.labelId);
        console.log("checkAbilityInfo descriptionId : " + data.descriptionId);
        console.log("checkAbilityInfo iconId : " + data.iconId );
        console.log("checkAbilityInfo moduleName : " + data.moduleName );
        console.log("checkAbilityInfo process : " + data.process );
        console.log("checkAbilityInfo isVisible : " + data.isVisible );
        console.log("checkAbilityInfo type : " + data.type )
        console.log("checkAbilityInfo orientation : " + data.orientation );
        console.log("checkAbilityInfo launchMode : " + data.launchMode );
        console.log("checkAbilityInfo uri : " + data.uri);
        console.log("checkAbilityInfo promise readPermission : " + data.readPermission );
        console.log("checkAbilityInfo writePermission : " + data.writePermission);
        console.log("checkAbilityInfo formEntity : " + data.formEntity );
        console.log("checkAbilityInfo minFormHeight : " + data.minFormHeight);
        console.log("checkAbilityInfo defaultFormHeight : " + data.defaultFormHeight);
        console.log("checkAbilityInfo minFormWidth : " + data.minFormWidth );
        console.log("checkAbilityInfo defaultFormWidth : " + data.defaultFormWidth );
        console.log("checkAbilityInfo targetAbility : " + data.targetAbility );
        console.log("checkAbilityInfo backgroundModes : " + data.backgroundModes);
        console.log("checkAbilityInfo subType : " + data.subType);
        console.log("checkAbilityInfo formEnabled : " + data.formEnabled );

        console.log("checkAbilityInfo permissions length : " + data.permissions.length);
        for(var j = 0; j < data.permissions.length; j++) {
            console.log("getAbilityInfo data.permissions[" + j + "] : " + data.permissions[j]);
        }
        console.log("checkAbilityInfo deviceTypes length : " + data.deviceTypes.length);
        for(var j = 0; j < data.deviceTypes.length; j++) {
            console.log("getAbilityInfo data.deviceTypes[" + j + "] : " + data.deviceTypes[j]);
        }
        console.log("checkAbilityInfo deviceCapabilities length : " + data.deviceCapabilities.length);
        for(var j = 0; j < data.deviceCapabilities.length; j++) {
            console.log("getAbilityInfo data.deviceCapabilities[" + j + "] : " + data.deviceCapabilities[j]);
        }

        expect(typeof(data)).assertEqual("object");
        expect(typeof(data.bundleName)).assertEqual("string");
        expect(typeof(data.name)).assertEqual("string");
        expect(typeof(data.label)).assertEqual("string");
        expect(typeof(data.description)).assertEqual("string");
        expect(typeof(data.icon)).assertEqual("string");
        expect(typeof(data.labelId)).assertEqual("number");
        expect(typeof(data.descriptionId)).assertEqual("number");
        expect(typeof(data.iconId)).assertEqual("number");
        expect(typeof(data.moduleName)).assertEqual("string");
        expect(typeof(data.process)).assertEqual("string");
        expect(typeof(data.targetAbility)).assertEqual("string");
        expect(typeof(data.backgroundModes)).assertEqual("number");
        expect(typeof(data.isVisible)).assertEqual("boolean");
        expect(typeof(data.formEnabled)).assertEqual("boolean");
        expect(typeof(data.type)).assertEqual("number");
        expect(typeof(data.subType)).assertEqual("number");
        expect(typeof(data.orientation)).assertEqual("number");
        expect(typeof(data.launchMode)).assertEqual("number");
        expect(Array.isArray(data.permissions)).assertEqual(true);
        expect(Array.isArray(data.deviceTypes)).assertEqual(true);
        expect(Array.isArray(data.deviceCapabilities)).assertEqual(true);
        expect(typeof(data.readPermission)).assertEqual("string");
        expect(typeof(data.writePermission)).assertEqual("string");
        expect(typeof(data.applicationInfo)).assertEqual("object");
        expect(typeof(data.formEntity)).assertEqual("number");
        expect(typeof(data.minFormHeight)).assertEqual("number");
        expect(typeof(data.defaultFormHeight)).assertEqual("number");
        expect(typeof(data.minFormWidth)).assertEqual("number");
        expect(typeof(data.defaultFormWidth)).assertEqual("number");
        expect(typeof(data.uri)).assertEqual("string");


        expect(data.bundleName).assertEqual("com.example.actsfeatureabilitytest");
        expect(data.name).assertEqual("com.example.actsfeatureabilitytest.MainAbility");
        expect(data.label).assertEqual("$string:app_name");
        expect(data.description).assertEqual("$string:mainability_description");
        expect(data.icon).assertEqual("$media:icon");

        //        expect(data.labelId).assertEqual(16777216);   //create by DevEco when building HAP.
        //        expect(data.descriptionId).assertEqual(16777217); //create by DevEco when building HAP.
        //        expect(data.iconId).assertEqual(16777218);    //create by DevEco when building HAP.

        expect(data.moduleName).assertEqual("entry");
        expect(data.process).assertEqual("processTestAbility");
        expect(data.targetAbility).assertEqual("");
        expect(data.backgroundModes).assertEqual(0);
        expect(data.isVisible).assertEqual(true);
        expect(data.formEnabled).assertEqual(false);
        expect(data.type).assertEqual(1);
        expect(data.subType).assertEqual(0);
        expect(data.orientation).assertEqual(0);
        expect(data.launchMode).assertEqual(1);

        expect(data.permissions[0]).assertEqual("ohos.permission.ACCELEROMETER");
        expect(data.permissions[1]).assertEqual("ohos.permission.ANSWER_CALL");
        expect(data.deviceTypes[0]).assertEqual("phone");
        expect(data.deviceCapabilities[0]).assertEqual("screen_support");
        expect(data.deviceCapabilities[1]).assertEqual("audio_support");

        expect(data.readPermission).assertEqual("");
        expect(data.writePermission).assertEqual("");
        checkApplicationInfo(data.applicationInfo);
        expect(data.formEntity).assertEqual(0);
        expect(data.minFormHeight).assertEqual(0);
        expect(data.defaultFormHeight).assertEqual(0);
        expect(data.minFormWidth).assertEqual(0);
        expect(data.defaultFormWidth).assertEqual(0);
        expect(data.uri).assertEqual("uriTest");

        console.log("checkAbilityInfo end  " + data);
    }

    // @tc.number: ACTS_GetAbilityInfo_0100
    // @tc.name: GetAbilityInfo : Obtains the HapModuleInfo object of the application.
    // @tc.desc: Check the return value of the interface (by promise)
    it('ACTS_GetAbilityInfo_0100', 0, async function (done) {
        var promise = featureAbility.getAbilityInfo();
        expect(typeof(promise)).assertEqual("object");

        var info = await featureAbility.getAbilityInfo();
        checkAbilityInfo(info);
        done();
    })

    // @tc.number: ACTS_GetAbilityInfo_0200
    // @tc.name: GetAbilityInfo : Obtains the HapModuleInfo object of the application.
    // @tc.desc: Check the return value of the interface (by AsyncCallback)
    it('ACTS_GetAbilityInfo_0200', 0, async function (done) {
        var result = featureAbility.getAbilityInfo(
            (err, data) => {
                checkAbilityInfo(data);
                done()
            }
        );
    })

    // checkHapModuleInfo
    function checkHapModuleInfo(data) {
        console.log("checkHapModuleInfo start  " + data);
        console.log("checkHapModuleInfo name : " + data.name);
        console.log("checkHapModuleInfo description : " + data.description);
        console.log("checkHapModuleInfo descriptionId : " + data.descriptionId);
        console.log("checkHapModuleInfo icon : " + data.icon);
        console.log("checkHapModuleInfo label : " + data.label);
        console.log("checkHapModuleInfo labelId : " + data.labelId);
        console.log("checkHapModuleInfo iconId : " + data.iconId);
        console.log("checkHapModuleInfo backgroundImg : " + data.backgroundImg);
        console.log("checkHapModuleInfo supportedModes : " + data.supportedModes);
        console.log("checkHapModuleInfo  reqCapabilities length : " + data.reqCapabilities.length);
        for(var j = 0; j < data.reqCapabilities.length; j++) {
            console.log("getHapModuleInfo data.reqCapabilities[" + j + "] : " + data.reqCapabilities[j]);
        }
        console.log("checkHapModuleInfo  deviceTypes length : " + data.deviceTypes.length);
        for(var j = 0; j < data.deviceTypes.length; j++) {
            console.log("getHapModuleInfo data.deviceTypes[" + j + "] : " + data.deviceTypes[j]);
        }
        console.log("checkHapModuleInfo abilityInfos length : " + data.abilityInfos.length);
        console.log("checkHapModuleInfo moduleName : " + data.moduleName);
        console.log("checkHapModuleInfo mainAbilityName : " + data.mainAbilityName);
        console.log("checkHapModuleInfo installationFree : " + data.installationFree);

        expect(typeof(data)).assertEqual("object");
        expect(typeof(data.name)).assertEqual("string");
        expect(typeof(data.description)).assertEqual("string");
        expect(typeof(data.descriptionId)).assertEqual("number");
        expect(typeof(data.icon)).assertEqual("string");
        expect(typeof(data.label)).assertEqual("string");
        expect(typeof(data.labelId)).assertEqual("number");
        expect(typeof(data.iconId)).assertEqual("number");
        expect(typeof(data.backgroundImg)).assertEqual("string");
        expect(typeof(data.supportedModes)).assertEqual("number");
        expect(Array.isArray(data.reqCapabilities)).assertEqual(true);
        expect(Array.isArray(data.deviceTypes)).assertEqual(true);
        expect(Array.isArray(data.abilityInfos)).assertEqual(true);
        expect(typeof(data.moduleName)).assertEqual("string");
        expect(typeof(data.mainAbilityName)).assertEqual("string");
        expect(typeof(data.installationFree)).assertEqual("boolean");

        expect(data.name).assertEqual("com.example.actsfeatureabilitytest");
        expect(data.description).assertEqual("descriptionTest");
        expect(data.descriptionId).assertEqual(0);
        expect(data.icon).assertEqual("$media:icon");
        expect(data.label).assertEqual("$string:app_name");
        expect(data.labelId).assertEqual(0);
        expect(data.iconId).assertEqual(0);
        expect(data.backgroundImg).assertEqual("");
        expect(data.supportedModes).assertEqual(0);

        expect(data.reqCapabilities[0]).assertEqual("reqCapabilitiesTest1");
        expect(data.reqCapabilities[1]).assertEqual("reqCapabilitiesTest2");
        expect(data.deviceTypes[0]).assertEqual("phone");
        checkAbilityInfo(data.abilityInfos[0]);
        expect(data.moduleName).assertEqual("entry")
        expect(data.mainAbilityName).assertEqual("");
        expect(data.installationFree).assertEqual(false);

        console.log("checkHapModuleInfo end  " + data);
    }

    // @tc.number: ACTS_GetHapModuleInfo_0100
    // @tc.name: GetHapModuleInfo : Obtains the HapModuleInfo object of the application.
    // @tc.desc: Check the return value of the interface (by promise)
    it('ACTS_GetHapModuleInfo_0100', 0, async function (done) {
        var promise = featureAbility.getHapModuleInfo();
        expect(typeof(promise)).assertEqual("object");
        var info = await featureAbility.getHapModuleInfo();
        checkHapModuleInfo(info);
        done();
    })

    // @tc.number: ACTS_GetHapModuleInfo_0200
    // @tc.name: GetHapModuleInfo : Obtains the HapModuleInfo object of the application.
    // @tc.desc: Check the return value of the interface (by AsyncCallback)
    it('ACTS_GetHapModuleInfo_0200', 0, async function (done) {
        var result = featureAbility.getHapModuleInfo(
            (err, data) => {
                checkHapModuleInfo(data);
                done()
            }
        );
    })

    // checkProcessName
    function checkProcessName(info) {
        console.log("checkProcessName processName : " + info);
        expect(typeof(info)).assertEqual("string");
        expect(info).assertEqual("processTestAbility");
    }

    // @tc.number: ACTS_GetProcessName_0100
    // @tc.name: GetProcessName : Obtains the name of the current process.
    // @tc.desc: Check the return value of the interface (by promise)
    it('ACTS_GetProcessName_0100', 0, async function (done) {
        var promise = featureAbility.getProcessName();
        expect(typeof(promise)).assertEqual("object");
        var info = await featureAbility.getProcessName();
        checkProcessName(info);
        done();
    })

    // @tc.number: ACTS_GetProcessName_0200
    // @tc.name: GetProcessName : Obtains the name of the current process.
    // @tc.desc: Check the return value of the interface (by AsyncCallback)
    it('ACTS_GetProcessName_0200', 0, async function (done) {
        var result = featureAbility.getProcessName(
            (err, data) => {
                checkProcessName(data);
                done()
            }
        );
    })

    // @tc.number: ACTS_GetCallingBundle_0100
    // @tc.name: GetCallingBundle : Obtains the bundle name of the ability that called the current ability.
    // @tc.desc: Check the return type of the interface (by Promise)
    it('ACTS_GetCallingBundle_0100', 0, async function (done) {
        // startAbility
        var result = await featureAbility.startAbility(
            {
                want:
                {
                    bundleName: "com.example.getcallingbundlepromisetest",
                    abilityName: "com.example.getcallingbundlepromisetest.MainAbility",
                },
            }
        );
        done();
    })
})
