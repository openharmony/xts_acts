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

// @ts-nocheck
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'
import pasteboard from '@ohos.pasteboard'

describe('PasteBoardTest2', function () {
    console.log('start################################start');

    /**
    * @tc.number    SUB_pasteBoard_function_JS_API_7100
    * @tc.name      复制文本、uri格式
    * @tc.desc      Test pasteBoard API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('pasteboard_function_test71', 0, async function (done) {
        console.info('SUB_pasteBoard_function_JS_API_7100 start')

        var record = pasteboard.createUriRecord("dataability:///com.example.myapplication1?user.txt");
        record.convertToText((err, data) => {
            if (err) {
                expect(true).assertTrue();
                console.info('convertToText failed because ' + JSON.stringify(err));
                return;
            }
            expect(data != null).assertTrue();
            console.info('convertToText success data : ' + JSON.stringify(data));
        });
        console.info('SUB_pasteBoard_function_JS_API_7100 end');
        done();

    })

    /**
    * @tc.number    SUB_pasteBoard_function_JS_API_7200
    * @tc.name      复制文本、uri格式
    * @tc.desc      Test pasteBoard API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('pasteboard_function_test72', 0, async function (done) {
        console.info('SUB_pasteBoard_function_JS_API_7200 start')
        var html = "<!DOCTYPE html>\n" + "<html>\n" + "<head>\n" + "<meta charset=\"utf-8\">\n" + "<title>HTML-PASTEBOARD_HTML</title>\n" + "</head>\n" + "<body>\n" + "    <h1>HEAD</h1>\n" + "    <p></p>\n" + "</body>\n" + "</html>";
        var pasteData = pasteboard.createHtmlData(html);
        var htmlText = pasteData.getPrimaryHtml();
        expect(htmlText != null).assertTrue();
        console.info('SUB_pasteBoard_function_JS_API_7200 end');
        done();
    })

    /**
    * @tc.number    SUB_pasteBoard_function_JS_API_7300
    * @tc.name      复制文本、uri格式
    * @tc.desc      Test pasteBoard API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('pasteboard_function_test73', 0, async function (done) {
        console.info('SUB_pasteBoard_function_JS_API_7300 start')
        var record = pasteboard.createUriRecord("dataability:///com.example.myapplication1?user.txt");
        record.convertToText().then((data) => {
            expect(data != null).assertTrue();
            console.info('convertToText success data : ' + JSON.stringify(data));
        }).catch((error) => {
            expect(true).assertTrue();
            console.info('convertToText failed because ' + JSON.stringify(error));
        });
        console.info('SUB_pasteBoard_function_JS_API_7300 end');
        done();
    })
})
