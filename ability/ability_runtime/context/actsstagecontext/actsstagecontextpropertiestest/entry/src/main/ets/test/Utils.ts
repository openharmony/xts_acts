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
import { expect } from '@ohos/hypium'

export function checkApplicationContextDir(applicationContext) {
  expect(applicationContext.cacheDir).assertEqual("/data/storage/el2/base/cache");
  expect(applicationContext.tempDir).assertEqual("/data/storage/el2/base/temp");
  expect(applicationContext.filesDir).assertEqual("/data/storage/el2/base/files");
  expect(applicationContext.distributedFilesDir).assertEqual("/data/storage/el2/distributedfiles");
  expect(applicationContext.databaseDir).assertEqual("/data/storage/el2/database");
  expect(applicationContext.preferencesDir).assertEqual("/data/storage/el2/base/preferences");
  expect(applicationContext.bundleCodeDir).assertEqual("/data/storage/el1/bundle");
}

export function checkAbilityContextDir(abilityContext) {
  expect(abilityContext.cacheDir).assertEqual("/data/storage/el2/base/haps/entry_test/cache");
  expect(abilityContext.tempDir).assertEqual("/data/storage/el2/base/haps/entry_test/temp");
  expect(abilityContext.filesDir).assertEqual("/data/storage/el2/base/haps/entry_test/files");
  expect(abilityContext.distributedFilesDir).assertEqual("/data/storage/el2/distributedfiles");
  expect(abilityContext.databaseDir).assertEqual("/data/storage/el2/database/entry_test");
  expect(abilityContext.preferencesDir).assertEqual("/data/storage/el2/base/haps/entry_test/preferences");
  expect(abilityContext.bundleCodeDir).assertEqual("/data/storage/el1/bundle");
}

export function checkContextDirEqualA(abilityContext, abilityContext2) {
  expect(abilityContext.cacheDir).assertEqual(abilityContext2.cacheDir);
  expect(abilityContext.tempDir).assertEqual(abilityContext2.tempDir);
  expect(abilityContext.filesDir).assertEqual(abilityContext2.filesDir);
  expect(abilityContext.distributedFilesDir).assertEqual(abilityContext2.distributedFilesDir);
  expect(abilityContext.databaseDir).assertEqual(abilityContext2.databaseDir);
  expect(abilityContext.storageDir).assertEqual(abilityContext2.storageDir);
  expect(abilityContext.bundleCodeDir).assertEqual(abilityContext2.bundleCodeDir);
}

export function checkContextDirEqualB(abilityContext, abilityContext2) {
  expect(abilityContext2.cacheDir == "/data/storage/el2/base/haps/feature_assistone/cache" &&
    abilityContext2.cacheDir != abilityContext.cacheDir).assertTrue();
  expect(abilityContext2.databaseDir == "/data/storage/el2/database/feature_assistone" &&
    abilityContext2.databaseDir != abilityContext.databaseDir).assertTrue();
  expect(abilityContext2.filesDir == "/data/storage/el2/base/haps/feature_assistone/files" &&
    abilityContext2.filesDir != abilityContext.filesDir).assertTrue();
  expect(abilityContext2.preferencesDir == "/data/storage/el2/base/haps/feature_assistone/preferences" &&
    abilityContext2.preferencesDir != abilityContext.preferencesDir).assertTrue();
  expect(abilityContext2.tempDir == "/data/storage/el2/base/haps/feature_assistone/temp" &&
    abilityContext2.tempDir != abilityContext.tempDir).assertTrue();
  expect(abilityContext.distributedFilesDir).assertEqual(abilityContext2.distributedFilesDir);
  expect(abilityContext.bundleCodeDir).assertEqual(abilityContext2.bundleCodeDir);
}

export function checkContextDirEqualC(abilityContext, abilityContext2) {
  expect(abilityContext2.cacheDir == "/data/storage/el2/base/haps/entry_assisttow/cache" &&
    abilityContext2.cacheDir != abilityContext.cacheDir).assertTrue();
  expect(abilityContext2.databaseDir == "/data/storage/el2/database/entry_assisttow" &&
    abilityContext2.databaseDir != abilityContext.databaseDir).assertTrue();
  expect(abilityContext2.filesDir == "/data/storage/el2/base/haps/entry_assisttow/files" &&
    abilityContext2.filesDir != abilityContext.filesDir).assertTrue();
  expect(abilityContext2.preferencesDir == "/data/storage/el2/base/haps/entry_assisttow/preferences" &&
    abilityContext2.preferencesDir != abilityContext.preferencesDir).assertTrue();
  expect(abilityContext2.tempDir == "/data/storage/el2/base/haps/entry_assisttow/temp" &&
    abilityContext2.tempDir != abilityContext.tempDir).assertTrue();
  expect(abilityContext.distributedFilesDir).assertEqual(abilityContext2.distributedFilesDir);
  expect(abilityContext.bundleCodeDir).assertEqual(abilityContext2.bundleCodeDir);
}

export function checkAbilityStageContextDir() {
  expect(globalThis.abilityStageContext.cacheDir).assertEqual("/data/storage/el2/base/haps/entry_test/cache");
  expect(globalThis.abilityStageContext.tempDir).assertEqual("/data/storage/el2/base/haps/entry_test/temp");
  expect(globalThis.abilityStageContext.filesDir).assertEqual("/data/storage/el2/base/haps/entry_test/files");
  expect(globalThis.abilityStageContext.distributedFilesDir).assertEqual("/data/storage/el2/distributedfiles");
  expect(globalThis.abilityStageContext.databaseDir).assertEqual("/data/storage/el2/database/entry_test");
  expect(globalThis.abilityStageContext.preferencesDir)
    .assertEqual("/data/storage/el2/base/haps/entry_test/preferences");
  expect(globalThis.abilityStageContext.bundleCodeDir).assertEqual("/data/storage/el1/bundle");
}