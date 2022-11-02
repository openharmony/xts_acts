/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import enterpriseDeviceManager from '@ohos.enterpriseDeviceManager'

const WANT1 = {
    bundleName: "com.example.extensionzerotest",
    abilityName: "com.example.extensionzerotest.EnterpriseAdminAbility"
};
const ENTINFO1 = {
    name: "company",
    description: "edm demo"
};

const SELFWANT = {
    bundleName: "com.example.myapplication",
    abilityName: "com.example.myapplication.EnterpriseAdminAbility"
};
const SELFHAPNAME = "com.example.myapplication"
const COMPANYNAME2 = "company2"
const DESCRIPTION2 = "edm demo2"

const ENTINFO2 = {
    name: "company2",
    description: "edm demo2"
};

const DEFAULT_USER_ID = 100;
const TEST_USER_ID = 101;
const ERR_USER_ID = 102;

const SUBSCRIBE_EVENTS: Array<enterpriseDeviceManager.ManagedEvent> = [
    enterpriseDeviceManager.ManagedEvent.MANAGED_EVENT_BUNDLE_ADDED,
    enterpriseDeviceManager.ManagedEvent.MANAGED_EVENT_BUNDLE_REMOVED
];
const SUBSCRIBE_INVALID_EVENTS: Array<number> = [20,21];

export {
    WANT1, ENTINFO1, SELFWANT, SELFHAPNAME, COMPANYNAME2, DESCRIPTION2, ENTINFO2,
    DEFAULT_USER_ID, TEST_USER_ID, ERR_USER_ID, SUBSCRIBE_EVENTS, SUBSCRIBE_INVALID_EVENTS
}