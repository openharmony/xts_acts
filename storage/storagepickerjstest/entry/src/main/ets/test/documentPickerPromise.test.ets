/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "deccjsunit/index";
import { sleep, startAbility } from "./Common"
import picker from '@ohos.file.picker'

export default function documentPickerPromise(abilityContext) {
    describe("documentPickerPromise", function () {
        afterEach(async function() {
            await sleep(500);
            await startAbility('ohos.acts.storage.picker', 'com.example.myapplication.MainAbility');
            await sleep(500);
        })

        async function select(testNum, done, dirName, fileName) {
            try {
                let documentPicker = new picker.DocumentViewPicker();
                documentPicker.select().then((result) => {
                    console.info(`${testNum}::select result: ${JSON.stringify(result)}`);
                    expect(result.length).assertEqual(1);
                    done();
                }).catch((err) => {
                    console.info(`${testNum}::select err: ${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                    done();
                    return;
                })
                expect(true).assertTrue();
                done();
            } catch (error) {
                console.info(`${testNum}::select error: ${JSON.stringify(error)}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function selectWithOption(testNum, done, option, dirName?, fileName?) {
            try {
                let documentPicker = new picker.DocumentViewPicker();
                documentPicker.select(option).then((result) => {
                    console.info(`${testNum}::selectWithOption result: ${JSON.stringify(result)}`);
                    expect(result.length).assertEqual(1);
                    done();
                }).catch((err) => {
                    console.info(`${testNum}::selectWithOption err: ${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                    done();
                    return;
                })
                expect(true).assertTrue();
                done();
            } catch (error) {
                console.info(`${testNum}::selectWithOption error: ${JSON.stringify(error)}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function saveWithoutSelect(testNum, done) {
            try {
                let documentPicker = new picker.DocumentViewPicker();
                documentPicker.save().then((result) => {
                    console.info(`${testNum}::saveWithoutSelect result: ${JSON.stringify(result)}`);
                    expect(result.length).assertEqual(0);
                    done();
                }).catch((err) => {
                    console.info(`${testNum}::saveWithoutSelect err: ${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                    done();
                    return;
                })
                expect(true).assertTrue();
                done();
            } catch (error) {
                console.info(`${testNum}::saveWithoutSelect error: ${JSON.stringify(error)}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function saveWithOption(testNum, done, option, dirName) {
            try {
                let documentPicker = new picker.DocumentViewPicker();
                documentPicker.save(option).then((result) => {
                    console.info(`${testNum}::saveWithOption result: ${JSON.stringify(result)}`);
                    expect(result.length).assertEqual(1);
                    done();
                }).catch((err) => {
                    console.info(`${testNum}::saveWithOption err: ${JSON.stringify(err)}`);
                    expect(false).assertTrue();
                    done();
                    return;
                })
                expect(true).assertTrue();
                done();
            } catch (error) {
                console.info(`${testNum}::saveWithOption error: ${JSON.stringify(error)}`);
                expect(false).assertTrue();
                done();
            }
        }

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0000
         * @tc.name 	 : documentpicker_select_promise_000
         * @tc.desc 	 : select with option
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 1
         */
        it("documentpicker_select_promise_000", 0, async function (done) {
            let testNum = "documentpicker_select_promise_000";
            let option = new picker.DocumentSelectOptions();
            let dirName = "Pictures";
            let fileName = "01.jpg";
            await selectWithOption(testNum, done, option, dirName, fileName);
        });

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0100
         * @tc.name 	 : documentpicker_select_promise_001
         * @tc.desc 	 : select without option
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 3
         */
        it("documentpicker_select_promise_001", 0, async function (done) {
            let testNum = "documentpicker_select_promise_001";
            let dirName = "Pictures";
            let fileName = "01.jpg";
            await select(testNum, done, dirName, fileName);
        });

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0200
         * @tc.name 	 : documentpicker_select_promise_002
         * @tc.desc 	 : select with option
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 1
         */
        it("documentpicker_select_promise_002", 0, async function (done) {
            let testNum = "documentpicker_select_promise_002";
            let option = new picker.DocumentSelectOptions();
            option.maxSelectNumber = 3;
            let dirName = "Pictures";
            await selectWithOption(testNum, done, option, dirName);
        });

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0300
         * @tc.name 	 : documentpicker_select_promise_003
         * @tc.desc 	 : select with option
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 1
         */
        it("documentpicker_select_promise_003", 0, async function (done) {
            let testNum = "documentpicker_select_promise_003";
            let option = new picker.DocumentSelectOptions();
            option.defaultFilePathUri = "file://media/file/8";
            let dirName = "Pictures";
            await selectWithOption(testNum, done, option, dirName);
        });

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0400
         * @tc.name 	 : documentpicker_select_promise_004
         * @tc.desc 	 : select with option
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 1
         */
        it("documentpicker_select_promise_004", 0, async function (done) {
            let testNum = "documentpicker_select_promise_004";
            let option = new picker.DocumentSelectOptions();
            option.defaultFilePathUri = "file://docs/storage/Users/currentUser/test/test1";
            let dirName = "Pictures";
            await selectWithOption(testNum, done, option, dirName);
        });

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0500
         * @tc.name 	 : documentpicker_select_promise_005
         * @tc.desc 	 : select with option
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 1
         */
        it("documentpicker_select_promise_005", 0, async function (done) {
            let testNum = "documentpicker_select_promise_005";
            let option = new picker.DocumentSelectOptions();
            option.fileSuffixFilters = ['.png', '.jpg'];
            let dirName = "Pictures";
            await selectWithOption(testNum, done, option, dirName);
        });

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0500
         * @tc.name 	 : documentpicker_select_promise_005
         * @tc.desc 	 : select with option
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 1
         */
        it("documentpicker_select_promise_005", 0, async function (done) {
            let testNum = "documentpicker_select_promise_005";
            let option = new picker.DocumentSelectOptions();
            option.fileSuffixFilters = ['.pptx', '.docx', '.xlsx', '.txt'];
            let dirName = "Documents";
            await selectWithOption(testNum, done, option, dirName);
        });

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0600
         * @tc.name 	 : documentpicker_select_promise_006
         * @tc.desc 	 : select with option
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 1
         */
        it("documentpicker_select_promise_006", 0, async function (done) {
            let testNum = "documentpicker_select_promise_006";
            let option = new picker.DocumentSelectOptions();
            option.fileSuffixFilters = ['.mp4'];
            let dirName = "Videos";
            await selectWithOption(testNum, done, option, dirName);
        });

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SELECT_PROMISE_0700
         * @tc.name 	 : documentpicker_select_promise_007
         * @tc.desc 	 : select with option
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 1
         */
        it("documentpicker_select_promise_007", 0, async function (done) {
            let testNum = "documentpicker_select_promise_007";
            let option = new picker.DocumentSelectOptions();
            option.fileSuffixFilters = ['.mp3'];
            let dirName = "Audios";
            await selectWithOption(testNum, done, option, dirName);
        });

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0000
         * @tc.name 	 : documentpicker_save_promise_000
         * @tc.desc 	 : save image in Pictures
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 0
         */
        it("documentpicker_save_promise_000", 0, async function (done) {
            let testNum = "documentpicker_save_promise_000";
            let option = new picker.DocumentSaveOptions();
            option.newFileNames = ["DocumentViewPicker01.jpg"];
            let saveDir = "Pictures";
            await saveWithOption(testNum, done, option, saveDir);
        });

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0100
         * @tc.name 	 : documentpicker_save_promise_001
         * @tc.desc 	 : save file in Documents
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 1
         */
        it("documentpicker_save_promise_001", 0, async function (done) {
            let testNum = "documentpicker_save_promise_001";
            let option = new picker.DocumentSaveOptions();
            option.newFileNames = ["DocumentViewPicker01.dat"];
            let saveDir = "Documents";
            await saveWithOption(testNum, done, option, saveDir);
        });

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0200
         * @tc.name 	 : documentpicker_save_promise_002
         * @tc.desc 	 : save mp4 in Videos
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 3
         */
        it("documentpicker_save_promise_002", 0, async function (done) {
            let testNum = "documentpicker_save_promise_002";
            let option = new picker.DocumentSaveOptions();
            option.newFileNames = ["DocumentViewPicker01.mp4"];
            let saveDir = "Videos";
            await saveWithOption(testNum, done, option, saveDir);
        });

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0300
         * @tc.name 	 : documentpicker_save_promise_003
         * @tc.desc 	 : save mp3 in Audios
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 3
         */
        it("documentpicker_save_promise_003", 0, async function (done) {
            let testNum = "documentpicker_save_promise_003";
            let option = new picker.DocumentSaveOptions();
            option.newFileNames = ["DocumentViewPicker01.mp3"];
            let saveDir = "Audios";
            await saveWithOption(testNum, done, option, saveDir);
        });

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0400
         * @tc.name 	 : documentpicker_save_promise_004
         * @tc.desc 	 : save uri in Pictures
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 3
         */
        it("documentpicker_save_promise_004", 0, async function (done) {
            let testNum = "documentpicker_save_promise_004";
            let option = new picker.DocumentSaveOptions();
            option.defaultFilePathUri = "file://media/file/8";
            let saveDir = "Pictures";
            await saveWithOption(testNum, done, option, saveDir);
        });

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0500
         * @tc.name 	 : documentpicker_save_promise_005
         * @tc.desc 	 : save png in Pictures
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 3
         */
        it("documentpicker_save_promise_005", 0, async function (done) {
            let testNum = "documentpicker_save_promise_005";
            let option = new picker.DocumentSaveOptions();
            option.defaultFilePathUri = "file://docs/storage/Users/currentUser/test/test1/202308171505.png";
            let saveDir = "Pictures";
            await saveWithOption(testNum, done, option, saveDir);
        });

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0600
         * @tc.name 	 : documentpicker_save_promise_006
         * @tc.desc 	 : save suffix in Pictures
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 3
         */
        it("documentpicker_save_promise_006", 0, async function (done) {
            let testNum = "documentpicker_save_promise_006";
            let option = new picker.DocumentSaveOptions();
            option.fileSuffixChoices = ['.png', '.jpg'];
            let saveDir = "Pictures";
            await saveWithOption(testNum, done, option, saveDir);
        });

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0700
         * @tc.name 	 : documentpicker_save_promise_007
         * @tc.desc 	 : save suffix in Documents
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 3
         */
        it("documentpicker_save_promise_007", 0, async function (done) {
            let testNum = "documentpicker_save_promise_007";
            let option = new picker.DocumentSaveOptions();
            option.fileSuffixChoices = ['.pptx', '.docx', '.xlsx', '.txt'];
            let saveDir = "Documents";
            await saveWithOption(testNum, done, option, saveDir);
        });

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0800
         * @tc.name 	 : documentpicker_save_promise_008
         * @tc.desc 	 : save mp4 in Videos
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 3
         */
        it("documentpicker_save_promise_008", 0, async function (done) {
            let testNum = "documentpicker_save_promise_008";
            let option = new picker.DocumentSaveOptions();
            option.fileSuffixChoices = ['.mp4'];
            let saveDir = "Videos";
            await saveWithOption(testNum, done, option, saveDir);
        });

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SAVE_PROMISE_0900
         * @tc.name 	 : documentpicker_save_promise_009
         * @tc.desc 	 : save mp3 in Audios
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 3
         */
        it("documentpicker_save_promise_009", 0, async function (done) {
            let testNum = "documentpicker_save_promise_009";
            let option = new picker.DocumentSaveOptions();
            option.fileSuffixChoices = ['.mp3'];
            let saveDir = "Audios";
            await saveWithOption(testNum, done, option, saveDir);
        });
    });
}
