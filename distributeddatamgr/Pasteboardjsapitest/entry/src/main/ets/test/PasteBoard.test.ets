/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import pasteboard from '@ohos.pasteboard'
import image from '@ohos.multimedia.image';

const color = new ArrayBuffer(96);
let opts = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
export default function pasteBoardTest(){
    describe('pasteBoardTest', function() {
        console.info('start################################start');
        
		/**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_TEST_1100
         * @tc.name      Adds one record(s)
         * @tc.desc      Test pasteBoard SetProperty API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
       it('SUB_PASTEBOARD_FUNCTION_ETS_TEST_1100', 0, async function (done) {
            var pasteData = pasteboard.createHtmlData('application/xml');
			console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1100 start")
			var systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clear().then(async () => {
                let prop = pasteData.getProperty();
				prop.shareOption = pasteboard.ShareOption.InApp;
				pasteData.setProperty(prop);
                var property = pasteData.getProperty();
				expect(0).assertEqual(property.shareOption)
				console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1100 end")
            })
            done();
        })
		/**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_TEST_1200
         * @tc.name      Adds one record(s)
         * @tc.desc      Test pasteBoard SetProperty API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
       it('SUB_PASTEBOARD_FUNCTION_ETS_TEST_1200', 0, async function (done) {
            var pasteData = pasteboard.createPlainTextData("hello");
			console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1200 start")
			var systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clear().then(async () => {
                let prop = pasteData.getProperty();
				prop.shareOption = pasteboard.ShareOption.LocalDevice;
				pasteData.setProperty(prop);
                var property = pasteData.getProperty();
				expect(1).assertEqual(property.shareOption)
				console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1200 end")
            })
            done();
        })
		/**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_TEST_1300
         * @tc.name      Adds one record(s)
         * @tc.desc      Test pasteBoard SetProperty API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
       it('SUB_PASTEBOARD_FUNCTION_ETS_TEST_1300', 0, async function (done) {
            var pasteData = pasteboard.createPlainTextData("hello");
			console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1300 start")
			var systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clear().then(async () => {
                let prop = pasteData.getProperty();
				prop.shareOption = pasteboard.ShareOption.CrossDevice;
				pasteData.setProperty(prop);
                var property = pasteData.getProperty();
				expect(2).assertEqual(property.shareOption)
				console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1300 end")
            })
            done();
        })
		/**
         * @tc.number    SUB_PASTEBOARD_FUNCTION_ETS_TEST_1400
         * @tc.name      Adds one record(s)
         * @tc.desc      Test pasteBoard SetProperty API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
       it('SUB_PASTEBOARD_FUNCTION_ETS_TEST_1400', 0, async function (done) {
            var pasteData = pasteboard.createPlainTextData("hello");
			console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1400 start")
			var systemPasteBoard = pasteboard.getSystemPasteboard();
            await systemPasteBoard.clear().then(async () => {
                let prop = pasteData.getProperty();
				pasteData.setProperty(prop);
                var property = pasteData.getProperty();
				expect(2).assertEqual(property.shareOption)
				console.info("SUB_PASTEBOARD_FUNCTION_ETS_TEST_1400 end")
            })
            done();
        })
    });
}
