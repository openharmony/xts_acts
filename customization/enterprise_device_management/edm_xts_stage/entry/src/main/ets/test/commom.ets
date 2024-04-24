/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import installer from '@ohos.bundle.installer';
import adminManager from '@ohos.enterprise.adminManager'
import bundleManager from '@ohos.enterprise.bundleManager'
import networkManager from '@ohos.enterprise.networkManager'
import deviceSettings from '@ohos.enterprise.deviceSettings';
import connection from '@ohos.net.connection';

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

const AUTOSTARTAPP1 = {
  bundleName: "com.example.myapplication",
  abilityName: "com.example.myapplication.MainAbility"
};

const AUTOSTARTAPP2 = {
  bundleName: "com.ohos.dlpmanager",
  abilityName: "ViewAbility"
};
const SELFHAPNAME = "com.example.myapplication"
const COMPANYNAME2 = "company2"
const DESCRIPTION2 = "edm demo2"
const NOT_EXIST_BUNDLE = "bundle.not.exist"
const PARAM_EDM_MIC_DISABLE = "persist.edm.mic_disable";

const ENTINFO2 = {
  name: "company2",
  description: "edm demo2"
};

const NETWORK_ETH_LOCAL = "lo";
const NETWORK_ETH_INVALID = "eth4";

const DEFAULT_USER_ID = 100;
let TEST_USER_ID: number = 101;
const ERR_USER_ID = 102;

const HAP_FILE_PATH = ['/data/storage/el2/base/haps/entry/testinstall/ExtensionZeroTest.hap'];
const HAP_FILE_PATH_ERROR = ['/data/storage/el2/base/haps/entry/testinstall/error/ExtensionZeroTest.hap'];
const EMPTY_HAP_FILE_PATH = ['/data/storage/el2/base/haps/entry/testinstall/'];
const INSTALL_PARAM = {
  userId: 100,
  isKeepData: false,
  installFlag: 1,
};
let INSTALL_PARAM_WITH_USER_ID: installer.InstallParam = {
  userId: 101,
  isKeepData: false,
  installFlag: 1,
};

const SUBSCRIBE_EVENTS: Array<number> = [0, 1];
const SUBSCRIBE_INVALID_EVENTS: Array<number> = [20, 21];

const TEST_APP_ID_1: string = "test_app_id_1";
const TEST_APP_ID_2: string = "test_app_id_2";
const TEST_POLICIES: string = "test_policies";
const TEST_POLICY_NAME: string = "test_policy_name";
const TEST_POLICY_VALUE: string = "\"test_policy_value\"";

let isMultipleUserEnabled: boolean = true;

function SetIsMultipleUserEnabled(isEnable: boolean) {
  isMultipleUserEnabled = isEnable;
}

function SetTestUserId(userId: number) {
  TEST_USER_ID = userId;
  INSTALL_PARAM_WITH_USER_ID.userId = userId;
}

const EDM_INSTALL_PARAM : bundleManager.InstallParam = {
  userId: 100,
  installFlag: 0,
};

const APP_IDS_1: Array<string> = [
  "ohos.sample.shopping_BNtg4JBClbl92Rgc3jm/RfcAdrHXaM8F0QOiwVEhnV5ebE5jNIYnAx+weFRT3QTyUjRNdhmc2aAzWyi+5t5CoBM=:",
  "ohos.samples.clock_BNtg4JBClbl92Rgc3jm/RfcAdrHXaM8F0QOiwVEhnV5ebE5jNIYnAx+weFRT3QTyUjRNdhmc2aAzWyi+5t5CoBM=:",
  "com.ohos.photos_BNtg4JBClbl92Rgc3jm/RfcAdrHXaM8F0QOiwVEhnV5ebE5jNIYnAx+weFRT3QTyUjRNdhmc2aAzWyi+5t5CoBM=:",
  "com.ohos.note_BMH6dE9cFOolyIVBYFocagRkVSwHaD69UCQ7aarO8LgS8dJlcAEdD1N+Y2fkbZ7DanMi/OFWGkP7hWC3rEuGVA8=:",
];

let APP_IDS_200: Array<string> = new Array<string>(200);
let APP_IDS_201: Array<string> = new Array<string>(201);

function appIdsInit(){
  for (let i = 0; i < APP_IDS_201.length; i++) {
    APP_IDS_201[i] = String(i);
    if (i < APP_IDS_200.length) {
      APP_IDS_200[i] = String(i);
    }
  }
}

export {
  WANT1, ENTINFO1, SELFWANT, SELFHAPNAME, COMPANYNAME2, DESCRIPTION2, ENTINFO2,
  DEFAULT_USER_ID, TEST_USER_ID, ERR_USER_ID, SUBSCRIBE_EVENTS, SUBSCRIBE_INVALID_EVENTS,
  HAP_FILE_PATH, HAP_FILE_PATH_ERROR, EMPTY_HAP_FILE_PATH, isMultipleUserEnabled,
  SetIsMultipleUserEnabled, SetTestUserId, appIdsInit, EDM_INSTALL_PARAM, APP_IDS_1,
  APP_IDS_200, APP_IDS_201, TEST_APP_ID_1, TEST_APP_ID_2, TEST_POLICIES, TEST_POLICY_NAME, TEST_POLICY_VALUE
}