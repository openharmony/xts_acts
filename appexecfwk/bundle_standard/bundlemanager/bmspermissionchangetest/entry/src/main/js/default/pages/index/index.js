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

import router from '@system.router';
const injectRef = Object.getPrototypeOf(global) || global
injectRef.regeneratorRuntime = require('@babel/runtime/regenerator')

const ITEM_ZERO = 0;
const ITEM_ONE = 1;
const ITEM_TWO = 2;
const ITEM_THREE = 3;
const ITEM_FOUR = 4;
const ITEM_FIVE = 5;
const ITEM_SIX = 6;
const ITEM_SEVEN = 7;
const ITEM_EIGHT = 8;
const ITEM_NINE = 9;
const ITEM_TEN = 10;
const ITEM_ELEVEN = 11;
const ITEM_TWELVE = 12;
const ITEM_THIRTEEN = 13;
const ITEM_FOURTEEN = 14;
const ITEM_FIFTEEN = 15;
const ITEM_SIXTEEN = 16;
const ITEM_SEVENTEEN = 17;

export default {
    data: {
        title: "BmsSystemTest",
        testcase: [

            /**
            * @tc.number: bms_permissionChange_0100
            * @tc.name: on(permissionChange, uids, callback) : register permission change
            *           off(permissionChange, uids, callback) : unregister permission change
            * @tc.desc: 1.Register permission changes to monitor the permission changes of an application
            *           2.Request permissions
            *           3.Unregister permission changes
            */
            {
                caseName: "bms_permissionChange_0100",
                num: "_0100",
                item: ITEM_ZERO
            },

            /**
            * @tc.number: bms_permissionChange_0200
            * @tc.name: on(permissionChange, uids, callback) : register permission change
            *           off(permissionChange, uids, callback) : unregister permission change
            * @tc.desc: 1.Register permission changes to monitor the permission changes of an application
            *           2.Request a permission that does not exist
            *           3.Unregister permission changes
            */
            {
                caseName: "bms_permissionChange_0200",
                num: "_0200",
                item: ITEM_ONE
            },

            /**
            * @tc.number: bms_permissionChange_0300
            * @tc.name: on(permissionChange, uids, callback) : register permission change
            *           off(permissionChange, uids, callback) : unregister permission change
            * @tc.desc: 1.Register permission changes to monitor the permission changes of three applications
            *           2.Start other application to request permissions
            *           3.Unregister permission changes
            */
            {
                caseName: "bms_permissionChange_0300",
                num: "_0300",
                item: ITEM_TWO
            },

            /**
            * @tc.number: bms_permissionChange_0400
            * @tc.name: on(permissionChange, uids, callback) : register permission change
            *           off(permissionChange, uids, callback) : unregister permission change
            * @tc.desc: 1.Register error permission changes to monitor the permission changes of an application
            *           2.Request permissions
            */
            {
                caseName: "bms_permissionChange_0400",
                num: "_0400",
                item: ITEM_THREE
            },

            /**
            * @tc.number: bms_permissionChange_0500
            * @tc.name: on(permissionChange, uids, callback) : register permission change
            *           off(permissionChange, uids, callback) : unregister permission change
            * @tc.desc: 1.Repeatedly register permission changes to monitor the permission changes
            *              of an application
            *           2.Request permissions
            *           3.Unregister permission changes
            */
            {
                caseName: "bms_permissionChange_0500",
                num: "_0500",
                item: ITEM_FOUR
            },

            /**
            * @tc.number: bms_permissionChange_0600
            * @tc.name: on(permissionChange, uids, callback) : register permission change
            *           off(permissionChange, uids, callback) : unregister permission change
            * @tc.desc: 1.Repeatedly register three different permission changes to monitor the permission changes
            *              of an application
            *           2.Request permissions
            *           3.Unregister those permission changes
            */
            {
                caseName: "bms_permissionChange_0600",
                num: "_0600",
                item: ITEM_FIVE
            },

            /**
            * @tc.number: bms_permissionChange_0700
            * @tc.name: on(permissionChange, uids, callback) : register permission change
            *           off(permissionChange, uids, callback) : unregister permission change
            * @tc.desc: 1.Repeatly register permission changes to monitor the permission changes of an application
            *           2.Request permissions
            *           3.Unregister permission changes without callback
            */
            {
                caseName: "bms_permissionChange_0700",
                num: "_0700",
                item: ITEM_SIX
            },

            /**
            * @tc.number: bms_permissionChange_0800
            * @tc.name: on(permissionChange, uids, callback) : register permission change
            *           off(permissionChange, uids, callback) : unregister permission change
            * @tc.desc: 1.Register three permission changes events to monitor the permission changes of an application
            *           2.Request permissions
            *           3.Unregister permission changes without callback
            */
            {
                caseName: "bms_permissionChange_0800",
                num: "_0800",
                item: ITEM_SEVEN
            },

            /**
            * @tc.number: bms_permissionChange_0900
            * @tc.name: on(permissionChange, uids, callback) : register permission change
            *           off(permissionChange, uids, callback) : unregister permission change
            * @tc.desc: 1.Register permission changes to monitor the permission changes of an application
            *           2.Request permissions
            *           3.Unregister error permission changes
            */
            {
                caseName: "bms_permissionChange_0900",
                num: "_0900",
                item: ITEM_SIXTEEN
            },

            /**
            * @tc.number: bms_anyPermissionChange_0100
            * @tc.name: on(anyPermissionChange, callback) : register all permission change
            *           off(anyPermissionChange, callback) : unregister all permission change
            * @tc.desc: 1.Register any permission changes to monitor the permission changes of all applications
            *           2.Request permissions
            *           3.Unregister any permission changes
            */
            {
                caseName: "bms_anyPermissionChange_0100",
                num: "_0100",
                item: ITEM_EIGHT
            },

            /**
            * @tc.number: bms_anyPermissionChange_0200
            * @tc.name: on(anyPermissionChange, callback) : register all permission change
            *           off(anyPermissionChange, callback) : unregister all permission change
            * @tc.desc: 1.Register any permission changes to monitor the permission changes of all applications
            *           2.Request a permission that does not exist
            *           3.Unregister any permission changes
            */
            {
                caseName: "bms_anyPermissionChange_0200",
                num: "_0200",
                item: ITEM_NINE
            },

            /**
            * @tc.number: bms_anyPermissionChange_0300
            * @tc.name: on(anyPermissionChange, callback) : register all permission change
            *           off(anyPermissionChange, callback) : unregister all permission change
            * @tc.desc: 1.Register any permission changes to monitor the permission changes of all applications
            *           2.Start other abilities to request permissions
            *           3.Unregister any permission changes
            */
            {
                caseName: "bms_anyPermissionChange_0300",
                num: "_0300",
                item: ITEM_TEN
            },

            /**
            * @tc.number: bms_anyPermissionChange_0400
            * @tc.name: on(anyPermissionChange, callback) : register all permission change
            *           off(anyPermissionChange, callback) : unregister all permission change
            * @tc.desc: 1.Register any error permission changes to monitor the permission changes
            *              of all applications
            *           2.Request permissions
            */
            {
                caseName: "bms_anyPermissionChange_0400",
                num: "_0400",
                item: ITEM_ELEVEN
            },

            /**
            * @tc.number: bms_anyPermissionChange_0500
            * @tc.name: on(anyPermissionChange, callback) : register all permission change
            *           off(anyPermissionChange, callback) : unregister all permission change
            * @tc.desc: 1.Repeatedly register any permission changes to monitor the permission changes
            *              of all applications
            *           2.Request permissions
            *           3.Unregister any permission changes
            */
            {
                caseName: "bms_anyPermissionChange_0500",
                num: "_0500",
                item: ITEM_TWELVE
            },

            /**
            * @tc.number: bms_anyPermissionChange_0600
            * @tc.name: on(anyPermissionChange, callback) : register all permission change
            *           off(anyPermissionChange, callback) : unregister all permission change
            * @tc.desc: 1.Repeatedly register three different any permission changes to monitor the permission changes
            *              of all applications
            *           2.Request permissions
            *           3.Unregister those any permission changes callback
            */
            {
                caseName: "bms_anyPermissionChange_0600",
                num: "_0600",
                item: ITEM_THIRTEEN
            },

            /**
            * @tc.number: bms_anyPermissionChange_0700
            * @tc.name: on(anyPermissionChange, callback) : register all permission change
            *           off(anyPermissionChange, callback) : unregister all permission change
            * @tc.desc: 1.Repeatedly register any permission changes to monitor the permission changes
            *              of all applications
            *           2.Request permissions
            *           3.Unregister any permission changes without callback
            */
            {
                caseName: "bms_anyPermissionChange_0700",
                num: "_0700",
                item: ITEM_FOURTEEN
            },

            /**
            * @tc.number: bms_anyPermissionChange_0800
            * @tc.name: on(anyPermissionChange, callback) : register all permission change
            *           off(anyPermissionChange, callback) : unregister all permission change
            * @tc.desc: 1.Register three any permission changes events to monitor the permission changes of
            *               all applications
            *           2.Request permissions
            *           3.Unregister any permission changes without callback
            */
            {
                caseName: "bms_anyPermissionChange_0800",
                num: "_0800",
                item: ITEM_FIFTEEN
            },

            /**
            * @tc.number: bms_anyPermissionChange_0900
            * @tc.name: on(permissionChange, uids, callback) : register permission change
            *           off(permissionChange, uids, callback) : unregister permission change
            * @tc.desc: 1.Register permission changes to monitor the permission changes of  of all applications
            *           2.Request permissions
            *           3.Unregister error any permission changes
            */
            {
                caseName: "bms_anyPermissionChange_0900",
                num: "_0900",
                item: ITEM_SEVENTEEN
            },
        ]
    },
    onInit() {
        this.title = "Bms PermissionChange Test";
    },
    onShow() {
    },
    onReady() {
        console.info('onReady finish')
    },
    onBackPress() {
    },
    jumpPermission(caseNum, caseItem) {
        console.info('===========clickAction===========')
        router.replace({
            uri: 'pages/permissionchange/permissionchange',
            params: {
                num: caseNum,
                item: caseItem
            }
        })
    },
}