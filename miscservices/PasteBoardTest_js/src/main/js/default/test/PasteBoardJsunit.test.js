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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
import pasteboard from '@ohos.pasteboard'

describe('PasteBoardTest', function() {
    console.log('start################################start');
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_0100
     * @tc.name      Adds PlainTextData
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test1',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_0100 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.clear()
        
        var textData = 'Hello World!'
        console.log('createPlainTextData = ' + textData)
        var pasteData = pasteboard.createPlainTextData(textData)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Checks the pasteboard content')
        assert.equal(pasteData.getPrimaryText(), textData)
        
        console.log('Checks there is a MIMETYPE_TEXT_PLAIN MIME type of data')
        assert.equal(pasteData.hasMimeType(MIMETYPE_TEXT_PLAIN), true)
        assert.equal(pasteData.getPrimaryMimeType(), MIMETYPE_TEXT_PLAIN)
        
        console.log('SUB_pasteBoard_function_JS_API_0100 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_0200
     * @tc.name      Adds PlainTextData = ''
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test2',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_0200 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.clear()
        
        var textData = ''
        console.log('createPlainTextData = ' + textData)
        var pasteData = pasteboard.createPlainTextData(textData)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is no content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), false)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 0)
        
        console.log('Checks there is a MIMETYPE_TEXT_PLAIN MIME type of data')
        assert.equal(pasteData.hasMimeType(MIMETYPE_TEXT_PLAIN), false)
        
        console.log('SUB_pasteBoard_function_JS_API_0200 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_0300
     * @tc.name      Adds PlainTextData = 'Hello 中国!@#$%^&*()_+{}\?.'
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test3',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_0300 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.clear()
        
        var textData = 'Hello 中国!@#$%^&*()_+{}\?.'
        console.log('createPlainTextData = ' + textData)
        var pasteData = pasteboard.createPlainTextData(textData)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Checks the pasteboard content')
        assert.equal(pasteData.getPrimaryText(), textData)
        
        console.log('Checks there is a MIMETYPE_TEXT_PLAIN MIME type of data')
        assert.equal(pasteData.hasMimeType(MIMETYPE_TEXT_PLAIN), true)
        assert.equal(pasteData.getPrimaryMimeType(), MIMETYPE_TEXT_PLAIN)
        
        console.log('SUB_pasteBoard_function_JS_API_0300 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_0400
     * @tc.name      Adds 300K PlainTextData
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test4',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_0400 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.clear()
        
        var textData = ''
        for (var i = 0; i < (300 * 1024); i++){
            textData=textData + "A";
        }
        console.log('createPlainTextData = ' + textData)
        var pasteData = pasteboard.createPlainTextData(textData)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Checks the pasteboard content')
        assert.equal(pasteData.getPrimaryText(), textData)
        
        console.log('Checks there is a MIMETYPE_TEXT_PLAIN MIME type of data')
        assert.equal(pasteData.hasMimeType(MIMETYPE_TEXT_PLAIN), true)
        assert.equal(pasteData.getPrimaryMimeType(), MIMETYPE_TEXT_PLAIN)
        
        console.log('SUB_pasteBoard_function_JS_API_0400 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_0500
     * @tc.name      Adds 301K PlainTextData
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test5',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_0500 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.clear()
        
        var textData = ''
        var textData300 = ''
        for (var i = 0; i < (301 * 1024); i++){
            textData = textData + "A";
            if(299 == i )
            {
                textData300 = textData
            }
        }
        
        console.log('createPlainTextData = ' + textData)
        var pasteData = pasteboard.createPlainTextData(textData)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Checks the pasteboard content')
        assert.equal(pasteData.getPrimaryText(), textData300)
        
        console.log('Checks there is a MIMETYPE_TEXT_PLAIN MIME type of data')
        assert.equal(pasteData.hasMimeType(MIMETYPE_TEXT_PLAIN), true)
        assert.equal(pasteData.getPrimaryMimeType(), MIMETYPE_TEXT_PLAIN)
        
        console.log('SUB_pasteBoard_function_JS_API_0500 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_0600
     * @tc.name      Adds htmlText
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test6',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_0600 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var htmlText = '<html><head></head><body>Hello World!</body></html>'
        console.log('createHtmlData = ' + htmlText)
        var pasteData = pasteboard.createHtmlData(htmlText)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Checks the pasteboard content')
        assert.equal(pasteData.getPrimaryHtml(), htmlText)
        
        console.log('Checks there is a MIMETYPE_TEXT_HTML MIME type of data')
        assert.equal(pasteData.hasMimeType(MIMETYPE_TEXT_HTML), true)
        assert.equal(pasteData.getPrimaryMimeType(), MIMETYPE_TEXT_HTML)
        
        console.log('SUB_pasteBoard_function_JS_API_0600 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_0700
     * @tc.name      Adds htmlText = ''
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test7',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_0700 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var htmlText = ''
        console.log('createHtmlData = ' + htmlText)
        var pasteData = pasteboard.createHtmlData(htmlText)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), false)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 0)
        
        console.log('Checks there is a MIMETYPE_TEXT_HTML MIME type of data')
        assert.equal(pasteData.hasMimeType(MIMETYPE_TEXT_HTML), false)
        
        console.log('SUB_pasteBoard_function_JS_API_0700 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_0800
     * @tc.name      Adds htmlText = 'Hello 中国!@#$%^&*()_+{}\?.'
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test8',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_0800 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var htmlText = 'Hello 中国!@#$%^&*()_+{}\?.'
        console.log('createHtmlData = ' + htmlText)
        var pasteData = pasteboard.createHtmlData(htmlText)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Checks the pasteboard content')
        assert.equal(pasteData.getPrimaryHtml(), htmlText)
        
        console.log('Checks there is a MIMETYPE_TEXT_HTML MIME type of data')
        assert.equal(pasteData.hasMimeType(MIMETYPE_TEXT_HTML), true)
        assert.equal(pasteData.getPrimaryMimeType(), MIMETYPE_TEXT_HTML)
        
        console.log('SUB_pasteBoard_function_JS_API_0800 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_0900
     * @tc.name      Adds uriText
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test9',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_0900 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var uriText = 'https://www.baidu.com/'
        console.log('createUriData = ' + uriText)
        var pasteData = pasteboard.createUriData(uriText)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Checks the pasteboard content')
        assert.equal(pasteData.getPrimaryUri(), uriText)
        
        console.log('Checks there is a MIMETYPE_TEXT_URI MIME type of data')
        assert.equal(pasteData.hasMimeType(MIMETYPE_TEXT_URI), true)
        assert.equal(pasteData.getPrimaryMimeType(), MIMETYPE_TEXT_URI)
        
        console.log('SUB_pasteBoard_function_JS_API_0900 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_1000
     * @tc.name      Adds uriText = ''
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test10',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_1000 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var uriText = ''
        console.log('createUriData = ' + uriText)
        var pasteData = pasteboard.createUriData(uriText)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), false)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 0)
        
        console.log('Checks there is a MIMETYPE_TEXT_URI MIME type of data')
        assert.equal(pasteData.hasMimeType(MIMETYPE_TEXT_URI), false)
        assert.equal(pasteData.getPrimaryMimeType(), MIMETYPE_TEXT_URI)
        
        console.log('SUB_pasteBoard_function_JS_API_1000 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_1100
     * @tc.name      Set uriText = 'Hello 中国!@#$%^&*()_+{}\?.'
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test11',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_1100 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var uriText = 'Hello 中国!@#$%^&*()_+{}\?.'
        console.log('createUriData = ' + uriText)
        var pasteData = pasteboard.createUriData(uriText)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Checks the pasteboard content')
        assert.equal(pasteData.getPrimaryUri(), uriText)
        
        console.log('Checks there is a MIMETYPE_TEXT_URI MIME type of data')
        assert.equal(pasteData.hasMimeType(MIMETYPE_TEXT_URI), true)
        assert.equal(pasteData.getPrimaryMimeType(), MIMETYPE_TEXT_URI)
        
        console.log('SUB_pasteBoard_function_JS_API_1100 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_1200
     * @tc.name      Adds want
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test12',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_1200 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var want = new Want()
        console.log('createWantData = ' + want)
        var pasteData = pasteboard.createWantData(want)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Checks the pasteboard content')
        assert.equal(pasteData.getPrimaryWant(), want)
        
        console.log('Checks there is a MIMETYPE_TEXT_WANT MIME type of data')
        assert.equal(pasteData.hasMimeType(MIMETYPE_TEXT_WANT), true)
        assert.equal(pasteData.getPrimaryMimeType(), MIMETYPE_TEXT_WANT)
        
        console.log('SUB_pasteBoard_function_JS_API_1200 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_1300
     * @tc.name      Adds one record(s)
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test13',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_1300 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var textData = 'Hello World!'
        console.log('createPlainTextData = ' + textData)
        var pasteData = pasteboard.createPlainTextData(textData)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Checks the pasteboard content')
        assert.equal(pasteData.getRecordAt(0).plainText, textData)
        
        console.log('SUB_pasteBoard_function_JS_API_1300 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_1400
     * @tc.name      Adds 2 record(s)
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test14',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_1400 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var textData0 = 'Hello World0'
        console.log('createPlainTextData = ' + textData0)
        var pasteData = pasteboard.createPlainTextData(textData0)
        
        var textData1 = 'Hello World1'
        console.log('addTextRecord = ' + textData1)
        pasteData.addTextRecord(textData1)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 2)
        
        console.log('Checks the pasteboard content')
        assert.equal(pasteData.getRecordAt(0).plainText, textData0)
        assert.equal(pasteData.getRecordAt(1).plainText, textData1)
        
        console.log('SUB_pasteBoard_function_JS_API_1400 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_1500
     * @tc.name      Adds 15 record(s)
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test15',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_1500 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var textData0 = 'Hello World0'
        console.log('createPlainTextData = ' + textData0)
        var pasteData = pasteboard.createPlainTextData(textData0)
        
        var textData = ''
        for(var i = 1; i < 15; i++)
        {
            textData = 'Hello World'
            textData = textData + i
            console.log('addTextRecord = ' + textData)
            pasteData.addTextRecord(textData)
        }
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 15)
        
        console.log('Checks the pasteboard content')
        for(var i = 0; i < 15; i++)
        {
            textData = 'Hello World'
            textData = textData + i
            assert.equal(pasteData.getRecordAt(i).plainText, textData)
        }
        
        console.log('SUB_pasteBoard_function_JS_API_1500 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_1600
     * @tc.name      Adds 30 record(s)
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test16',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_1600 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var textData0 = 'Hello World0'
        console.log('createPlainTextData = ' + textData0)
        var pasteData = pasteboard.createPlainTextData(textData0)
        
        var textData = ''
        for(var i = 1; i < 30; i++)
        {
            textData = 'Hello World'
            textData = textData + i
            console.log('addTextRecord = ' + textData)
            pasteData.addTextRecord(textData)
        }
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 30)
        
        console.log('Checks the pasteboard content')
        for(var i = 0; i < 30; i++)
        {
            textData = 'Hello World'
            textData = textData + i
            assert.equal(pasteData.getRecordAt(i).plainText, textData)
        }
        
        console.log('SUB_pasteBoard_function_JS_API_1600 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_1700
     * @tc.name      Adds 31 record(s)
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test17',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_1700 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var textData0 = 'Hello World0'
        console.log('createPlainTextData = ' + textData0)
        var pasteData = pasteboard.createPlainTextData(textData0)
        
        var textData = ''
        for(var i = 1; i < 31; i++)
        {
            textData = 'Hello World'
            textData = textData + i
            console.log('addTextRecord = ' + textData)
            pasteData.addTextRecord(textData)
        }
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 30)
        
        console.log('Checks the pasteboard content')
        for(var i = 0; i < 30; i++)
        {
            textData = 'Hello World'
            textData = textData + i
            assert.equal(pasteData.getRecordAt(i).plainText, textData)
        }
        
        console.log('SUB_pasteBoard_function_JS_API_1700 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_1800
     * @tc.name      Adds PlainText,HtmlText,UriText,WantText
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test18',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_1800 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var textData = 'Hello World!'
        console.log('createPlainTextData = ' + textData)
        var pasteData = pasteboard.createPlainTextData(textData)    
        
        var htmlText = '<html><head></head><body>Hello World!</body></html>'
        console.log('addHtmlRecord = ' + htmlText)
        pasteData.addHtmlRecord(htmlText)
        
        var uriText = 'https://www.baidu.com/'
        console.log('addUriRecord = ' + uriText)
        pasteData.addUriRecord(uriText)
        
        var wantText = new Want()
        console.log('addWantRecord = ' + wantText)
        pasteData.addWantRecord(wantText)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 4)
        
        console.log('Checks the pasteboard content')
        assert.equal(pasteData.getRecordAt(0).plainText, textData)
        assert.equal(pasteData.getRecordAt(1).htmlText, htmlText)
        assert.equal(pasteData.getRecordAt(2).uri, uriText)
        assert.equal(pasteData.getRecordAt(3).want, wantText)
        
        console.log('SUB_pasteBoard_function_JS_API_1800 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_1900
     * @tc.name      Delete one PlainTextData
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test19',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_1900 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var textData = 'Hello World!'
        console.log('createPlainTextData = ' + textData)
        var pasteData = pasteboard.createPlainTextData(textData)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Removes the Record')
        assert.equal(pasteData.removeRecordAt(0), true)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 0)
        
        console.log('Checks there is  no content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), false)
        
        console.log('SUB_pasteBoard_function_JS_API_1900 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_2000
     * @tc.name      Delete one htmlText
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test20',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_2000 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var htmlText = '<html><head></head><body>Hello World!</body></html>'
        console.log('createHtmlData = ' + htmlText)
        var pasteData = pasteboard.createHtmlData(htmlText)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Removes the Record')
        assert.equal(pasteData.removeRecordAt(0), true)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 0)
        
        console.log('Checks there is  no content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), false)
        
        console.log('SUB_pasteBoard_function_JS_API_2000 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_2100
     * @tc.name      Delete one uriText
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test21',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_2100 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var uriText = 'https://www.baidu.com/'
        console.log('createUriData = ' + uriText)
        var pasteData = pasteboard.createUriData(uriText)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Removes the Record')
        assert.equal(pasteData.removeRecordAt(0), true)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 0)
        
        console.log('Checks there is  no content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), false)
        
        console.log('SUB_pasteBoard_function_JS_API_2100 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_2200
     * @tc.name      Delete one want
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test22',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_2200 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var want = new Want()
        console.log('createWantData = ' + want)
        var pasteData = pasteboard.createWantData(want)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Removes the Record')
        assert.equal(pasteData.removeRecordAt(0), true)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 0)
        
        console.log('Checks there is  no content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), false)
        
        console.log('SUB_pasteBoard_function_JS_API_2200 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_2300
     * @tc.name      Deletes 300K PlainTextData
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test23',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_2300 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.clear()
        
        var textData = ''
        for (var i = 0; i < (300 * 1024); i++){
            textData=textData + "A";
        }
        console.log('createPlainTextData = ' + textData)
        var pasteData = pasteboard.createPlainTextData(textData)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Removes the Record')
        assert.equal(pasteData.removeRecordAt(0), true)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 0)
        
        console.log('Checks there is  no content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), false)
        
        console.log('SUB_pasteBoard_function_JS_API_2300 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_2400
     * @tc.name      Deletes 30 record(s)
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test24',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_2400 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var textData0 = 'Hello World0'
        console.log('createPlainTextData = ' + textData0)
        var pasteData = pasteboard.createPlainTextData(textData0)
        
        var textData = ''
        for(var i = 1; i < 30; i++)
        {
            textData = 'Hello World'
            textData = textData + i
            console.log('addTextRecord = ' + textData)
            pasteData.addTextRecord(textData)
        }
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 30)
        
        for(var i = 0; i < 30; i++)
        {
            console.log('Removes the Record')
            assert.equal(pasteData.removeRecordAt(0), true)
        }
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 0)
        
        console.log('Checks there is  no content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), false)
        
        console.log('SUB_pasteBoard_function_JS_API_2400 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_2500
     * @tc.name      Delete one record of Muti records
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test25',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_2500 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var textData = 'Hello World!'
        console.log('createPlainTextData = ' + textData)
        var pasteData = pasteboard.createPlainTextData(textData)
        
        var htmlText = '<html><head></head><body>Hello World!</body></html>'
        console.log('addHtmlRecord = ' + htmlText)
        pasteData.addHtmlRecord(htmlText)
        
        var wantText = new Want()
        console.log('addWantRecord = ' + wantText)
        pasteData.addWantRecord(wantText)
        
        var uriText = 'https://www.baidu.com/'
        console.log('addUriRecord = ' + uriText)
        pasteData.addUriRecord(uriText)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 4)
        
        console.log('Removes the third Record')
        assert.equal(pasteData.removeRecordAt(2), true)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 3)
        
        console.log('Checks the pasteboard content')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordAt(0).plainText, textData)
        assert.equal(pasteData.getRecordAt(1).htmlText, htmlText)
        assert.equal(pasteData.getRecordAt(2).uri, uriText)
        
        console.log('SUB_pasteBoard_function_JS_API_2500 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_2600
     * @tc.name      Replace one record or a null record
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test26',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_2600 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var textData0 = 'Hello World0'
        console.log('createPlainTextData = ' + textData0)
        var pasteData = pasteboard.createPlainTextData(textData0)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)        
        
        var textData1 = 'Hello World1'
        console.log('Replaces the Record = ' + textData1)
        var pasteDataRecord = pasteboard.createPlainTextRecord(textData1)
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.replaceRecordAt(0, pasteDataRecord), true)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Checks the pasteboard content')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordAt(0).plainText, textData1)
        
        var textData2 = ''
        console.log('Replaces the Record = ' + textData2)
        pasteDataRecord = pasteboard.createPlainTextRecord(textData2)
        assert.equal(pasteData.replaceRecordAt(0, pasteDataRecord), true)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 0)
        
        console.log('SUB_pasteBoard_function_JS_API_2600 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_2700
     * @tc.name      Replace Muti records
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test27',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_2700 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var textData0 = 'Hello World!'
        console.log('createPlainTextData = ' + textData0)
        var pasteData = pasteboard.createPlainTextData(textData0)
        
        var htmlText0 = '<html><head></head><body>Hello World!</body></html>'
        console.log('addHtmlRecord = ' + htmlText0)
        pasteData.addHtmlRecord(htmlText0)
        
        var wantText0 = new Want()
        console.log('addWantRecord = ' + wantText0)
        pasteData.addWantRecord(wantText0)
        
        var uriText0 = 'https://www.baidu.com/'
        console.log('addUriRecord = ' + uriText0)
        pasteData.addUriRecord(uriText0)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 4)
        
        var textData1 = 'Hello World1'
        console.log('Replaces the PlainText = ' + textData1)
        var pasteDataRecord = pasteboard.createPlainTextRecord(textData1)
        assert.equal(pasteData.replaceRecordAt(0, pasteDataRecord), true)
        
        var htmlText1 = '<html><head></head><body>Hello World 1</body></html>'
        console.log('Replaces the htmlText = ' + htmlText1)
        pasteDataRecord = pasteboard.createHtmlTextRecord(htmlText1)
        assert.equal(pasteData.replaceRecordAt(0, pasteDataRecord), true)
        
        var wantText1 = new Want()
        console.log('Replaces the wantText = ' + wantText1)
        pasteDataRecord = pasteboard.createWantRecord(wantText1)
        assert.equal(pasteData.replaceRecordAt(0, pasteDataRecord), true)
        
        var uriText1 = 'https://www.baidu.com/'
        console.log('Replaces the uriText = ' + uriText1)
        pasteDataRecord = pasteboard.createWantRecord(uriText1)
        assert.equal(pasteData.createUriRecord(0, pasteDataRecord), true)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 4)
        
        console.log('Checks the pasteboard content')
        assert.equal(pasteData.getRecordAt(0).plainText, textData1)
        assert.equal(pasteData.getRecordAt(1).htmlText, htmlText1)
        assert.equal(pasteData.getRecordAt(2).want, wantText1)
        assert.equal(pasteData.getRecordAt(3).uri, uriText1)
        
        console.log('SUB_pasteBoard_function_JS_API_2700 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_2800
     * @tc.name      Set and Query Property
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test28',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_2800 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var textData = 'Hello World!'
        console.log('createPlainTextData = ' + textData)
        var pasteData = pasteboard.createPlainTextData(textData)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Sets the Property')
        var pasteDataProperty = pasteData.getProperty()
        console.log('timestamp = ' + pasteDataProperty.timestamp)
        pasteDataProperty.additions["one"] = "Hello"
        pasteDataProperty.tag = "Test"
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the Property')
        pasteData = systemPasteboard.getPasteData()
        pasteDataProperty = pasteData.getProperty()
        console.log('timestamp = ' + pasteDataProperty.timestamp)
        assert.equal(pasteDataProperty.additions["one"], "Hello")
        assert.equal(pasteDataProperty.tag, "Test")
        assert.equal(pasteDataProperty.tag, pasteData.getTag())
        assert.equal(pasteDataProperty.mimeTypes[0], MIMETYPE_TEXT_PLAIN)
        
        console.log('SUB_pasteBoard_function_JS_API_2800 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_2900
     * @tc.name      systemPasteboard.off:Set two PlainText records
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test29',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_2900 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.off(contentＣhanges)
        systemPasteboard.clear()
        
        var textData = 'Hello World!'
        console.log('createPlainTextData = ' + textData)
        var pasteData = pasteboard.createPlainTextData(textData)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        var uriText = 'https://www.baidu.com/'
        console.log('Adds the uriText = ' + uriText)
        var pasteDataRecord = pasteboard.createWantRecord(uriText)
        pasteData.addRecord(pasteDataRecord)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 2)
        
        console.log('SUB_pasteBoard_function_JS_API_2900 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_3000
     * @tc.name      systemPasteboard.off:Delete one record of Muti records
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test30',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_3000 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.off(contentＣhanges)
        systemPasteboard.clear()
        
        var textData = 'Hello World!'
        console.log('createPlainTextData = ' + textData)
        var pasteData = pasteboard.createPlainTextData(textData)
        
        var htmlText = '<html><head></head><body>Hello World!</body></html>'
        console.log('addHtmlRecord = ' + htmlText)
        pasteData.addHtmlRecord(htmlText)
        
        var wantText = new Want()
        console.log('addWantRecord = ' + wantText)
        pasteData.addWantRecord(wantText)
        
        var uriText = 'https://www.baidu.com/'
        console.log('addUriRecord = ' + uriText)
        pasteData.addUriRecord(uriText)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 4)
        
        console.log('Removes the third Record')
        assert.equal(pasteData.removeRecordAt(2), true)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 3)
        
        console.log('SUB_pasteBoard_function_JS_API_3000 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_3100
     * @tc.name      systemPasteboard.off:Replace Muti records
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test31',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_3100 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.off(contentＣhanges)
        systemPasteboard.clear()
        
        var textData0 = 'Hello World!'
        console.log('createPlainTextData = ' + textData0)
        var pasteData = pasteboard.createPlainTextData(textData0)
        
        var htmlText0 = '<html><head></head><body>Hello World!</body></html>'
        console.log('addHtmlRecord = ' + htmlText0)
        pasteData.addHtmlRecord(htmlText0)
        
        var wantText0 = new Want()
        console.log('addWantRecord = ' + wantText0)
        pasteData.addWantRecord(wantText0)
        
        var uriText0 = 'https://www.baidu.com/'
        console.log('addUriRecord = ' + uriText0)
        pasteData.addUriRecord(uriText0)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 4)
        
        var textData1 = 'Hello World1'
        console.log('Replaces the PlainText = ' + textData1)
        var pasteDataRecord = pasteboard.createPlainTextRecord(textData1)
        assert.equal(pasteData.replaceRecordAt(0, pasteDataRecord), true)
        
        var htmlText1 = '<html><head></head><body>Hello World 1</body></html>'
        console.log('Replaces the htmlText = ' + htmlText1)
        pasteDataRecord = pasteboard.createHtmlTextRecord(htmlText1)
        assert.equal(pasteData.replaceRecordAt(0, pasteDataRecord), true)
        
        var wantText1 = new Want()
        console.log('Replaces the wantText = ' + wantText1)
        pasteDataRecord = pasteboard.createWantRecord(wantText1)
        assert.equal(pasteData.replaceRecordAt(0, pasteDataRecord), true)
        
        var uriText1 = 'https://www.baidu.com/'
        console.log('Replaces the uriText = ' + uriText1)
        pasteDataRecord = pasteboard.createWantRecord(uriText1)
        assert.equal(pasteData.createUriRecord(0, pasteDataRecord), true)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 4)
        
        console.log('SUB_pasteBoard_function_JS_API_3100 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_3200
     * @tc.name      systemPasteboard.clear:Set two PlainText records
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test32',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_3200 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var textData = 'Hello World!'
        console.log('createPlainTextData = ' + textData)
        var pasteData = pasteboard.createPlainTextData(textData)
        
        console.log('Checks there is no content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), false)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        var uriText = 'https://www.baidu.com/'
        console.log('Adds the uriText = ' + uriText)
        var pasteDataRecord = pasteboard.createWantRecord(uriText)
        pasteData.addRecord(pasteDataRecord)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 2)
        
        console.log('Clears the pasteboard content')
        systemPasteboard.clear()
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 0)
        
        console.log('Checks there is no content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), false)
        
        console.log('SUB_pasteBoard_function_JS_API_3200 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_3300
     * @tc.name      Convert the PlainTextData = 'Hello World!' to text
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test33',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_3300 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var textData = 'Hello World!'
        console.log('createPlainTextData = ' + textData)
        var pasteData = pasteboard.createPlainTextData(textData)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Converts the PlainTextData to text')
        var pasteDataRecord = pasteData.getRecordAt(0)
        assert.equal(pasteDataRecord.convertToText(), textData)
        
        console.log('SUB_pasteBoard_function_JS_API_3300 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_3400
     * @tc.name      Convert the PlainTextData = 'Hello 中国!@#$%^&*()_+{}\?.' to text
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test34',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_3400 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var textData = 'Hello 中国!@#$%^&*()_+{}\?.'
        console.log('createPlainTextData = ' + textData)
        var pasteData = pasteboard.createPlainTextData(textData)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Converts the PlainTextData to text')
        var pasteDataRecord = pasteData.getRecordAt(0)
        assert.equal(pasteDataRecord.convertToText(), textData)
        
        console.log('SUB_pasteBoard_function_JS_API_3400 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_3500
     * @tc.name      Converts the uri = 'https://www.baidu.com/' to text
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test35',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_3500 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var uriText = 'https://www.baidu.com/'
        console.log('createUriData = ' + uriText)
        var pasteData = pasteboard.createUriData(uriText)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Converts the uri to text')
        var pasteDataRecord = pasteData.getRecordAt(0)
        assert.equal(pasteDataRecord.convertToText(), uriText)
        
        console.log('SUB_pasteBoard_function_JS_API_3500 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_3600
     * @tc.name      Converts the uri = 'Hello 中国!@#$%^&*()_+{}\?.' to text
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test36',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_3600 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var uriText = 'Hello 中国!@#$%^&*()_+{}\?.'
        console.log('createUriData = ' + uriText)
        var pasteData = pasteboard.createUriData(uriText)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Converts the uri to text')
        var pasteDataRecord = pasteData.getRecordAt(0)
        assert.equal(pasteDataRecord.convertToText(), uriText)
        
        console.log('SUB_pasteBoard_function_JS_API_3600 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_3700
     * @tc.name      Convert the PlainTextData = 'Hello World!' to text
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test37',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_3700 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var textData = 'Hello World!'
        console.log('createPlainTextRecord = ' + textData)
        var pasteDataRecord = pasteboard.createPlainTextRecord(textData)
        var pasteData = systemPasteboard.getPasteData()
        pasteData.addRecord(pasteDataRecord)
        
        console.log('Writes PasteData to the pasteboard')    
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Converts the PlainTextData to text')
        pasteDataRecord = pasteData.getRecordAt(0)
        assert.equal(pasteDataRecord.convertToText(), textData)
        
        console.log('SUB_pasteBoard_function_JS_API_3700 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_3800
     * @tc.name      Converts the uri = 'https://www.baidu.com/' to text
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test38',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_3800 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var uriText = 'https://www.baidu.com/'
        console.log('createUriRecord = ' + uriText)
        var pasteDataRecord = pasteboard.createUriRecord(uriText)
        var pasteData = systemPasteboard.getPasteData()
        pasteData.addRecord(pasteDataRecord)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Converts the uri to text')
        pasteDataRecord = pasteData.getRecordAt(0)
        assert.equal(pasteDataRecord.convertToText(), uriText)
        
        console.log('SUB_pasteBoard_function_JS_API_3800 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_3900
     * @tc.name      Converts the text,uri from Muti records
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test39',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_3900 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var textData = 'Hello World!'
        console.log('createPlainTextData = ' + textData)
        var pasteData = pasteboard.createPlainTextData(textData)
        
        var htmlText = '<html><head></head><body>Hello World!</body></html>'
        console.log('addHtmlRecord = ' + htmlText)
        pasteData.addHtmlRecord(htmlText)
        
        var wantText = new Want()
        console.log('addWantRecord = ' + wantText)
        pasteData.addWantRecord(wantText)
        
        var uriText = 'https://www.baidu.com/'
        console.log('addUriRecord = ' + uriText)
        pasteData.addUriRecord(uriText)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 4)
        
        console.log('Converts the PlainTextData to text')
        pasteDataRecord = pasteData.getRecordAt(0)
        assert.equal(pasteDataRecord.convertToText(), textData)
        
        console.log('Converts the uri to text')
        pasteDataRecord = pasteData.getRecordAt(3)
        assert.equal(pasteDataRecord.convertToText(), uriText)
        
        console.log('SUB_pasteBoard_function_JS_API_3900 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_4000
     * @tc.name      Delete one and then add another PlainTextData
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test40',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_4000 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var textData = 'Hello World!'
        console.log('createUriData = ' + textData)
        var pasteData = pasteboard.createUriData(textData)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Removes the Record')
        assert.equal(pasteData.removeRecordAt(0), true)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 0)
        
        console.log('Checks there is  no content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), false)
        
        var textDataNew = 'Hello World!-New'
        console.log('createUriData = ' + textDataNew)
        var pasteData = pasteboard.createUriData(textDataNew)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Checks the pasteboard content')
        assert.equal(pasteData.getRecordAt(0).plainText, textDataNew)
        
        console.log('SUB_pasteBoard_function_JS_API_4000 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_4100
     * @tc.name      Delete the replaced record
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test41',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_4100 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var textData0 = 'Hello World0'
        console.log('createUriData = ' + textData0)
        var pasteData = pasteboard.createUriData(textData0)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)        
        
        var textData1 = 'Hello World1'
        console.log('Replaces the Record = ' + textData1)
        var pasteDataRecord = pasteboard.createPlainTextRecord(textData1)
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.replaceRecordAt(0, pasteDataRecord), true)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Checks the pasteboard content')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordAt(0).plainText, textData1)
        
        console.log('Removes the the replaced record')
        assert.equal(pasteData.removeRecordAt(0), true)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 0)
        
        console.log('SUB_pasteBoard_function_JS_API_4100 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_4200
     * @tc.name      Delete one and then add another PlainTextData and then clear
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test42',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_4200 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var textData = 'Hello World!'
        console.log('createUriData = ' + textData)
        var pasteData = pasteboard.createUriData(textData)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Removes the Record')
        assert.equal(pasteData.removeRecordAt(0), true)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 0)
        
        console.log('Checks there is  no content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), false)
        
        var textDataNew = 'Hello World!-New'
        console.log('createUriData = ' + textDataNew)
        var pasteData = pasteboard.createUriData(textDataNew)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Checks the pasteboard content')
        assert.equal(pasteData.getRecordAt(0).plainText, textDataNew)
        
        console.log('Clears the pasteboard content')
        systemPasteboard.clear()
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 0)
        
        console.log('Checks there is  no content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), false)
        
        console.log('SUB_pasteBoard_function_JS_API_4200 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_4300
     * @tc.name      First off the changes Event and then make it on
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test43',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_4300 start')
        
        console.log('Off the content changes')
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.off(contentChanges)
        systemPasteboard.clear()
        
        var textData = 'Hello World!'
        console.log('createUriData = ' + textData)
        var pasteData = pasteboard.createUriData(textData)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('On the content changes')
        systemPasteboard.on(contentChanges)
        
        console.log('Removes the Record')
        assert.equal(pasteData.removeRecordAt(0), true)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 0)
        
        console.log('Checks there is  no content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), false)
        
        var textDataNew = 'Hello World!-New'
        console.log('createUriData = ' + textDataNew)
        var pasteData = pasteboard.createUriData(textDataNew)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Checks the pasteboard content')
        assert.equal(pasteData.getRecordAt(0).plainText, textDataNew)
        
        console.log('SUB_pasteBoard_function_JS_API_4300 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_4400
     * @tc.name      Clears 300K PlainTextData
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test44',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_4400 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.clear()
        
        var textData = ''
        for (var i = 0; i < (300 * 1024); i++){
            textData=textData + "A";
        }
        console.log('createPlainTextData = ' + textData)
        var pasteData = pasteboard.createPlainTextData(textData)
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks there is content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), true)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 1)
        
        console.log('Clears the pasteboard content')
        systemPasteboard.clear()
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 0)
        
        console.log('Checks there is no content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), false)
        
        console.log('SUB_pasteBoard_function_JS_API_4400 end');
    })
    
    /**
     * @tc.number    SUB_pasteBoard_function_JS_API_4500
     * @tc.name      Deletes 30 record(s)
     * @tc.desc      Test pasteBoard API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('pasteboard_function_test45',0, async () => {
        console.log('SUB_pasteBoard_function_JS_API_4500 start')
        
        var systemPasteboard = pasteboard.getSystemPasteboard()
        systemPasteboard.on(contentChanges)
        systemPasteboard.clear()
        
        var textData0 = 'Hello World0'
        console.log('createPlainTextData = ' + textData0)
        var pasteData = pasteboard.createPlainTextData(textData0)
        
        var textData = ''
        for(var i = 1; i < 30; i++)
        {
            textData = 'Hello World'
            textData = textData + i
            console.log('addTextRecord = ' + textData)
            pasteData.addTextRecord(textData)
        }
        
        console.log('Writes PasteData to the pasteboard')
        systemPasteboard.setPasteData(pasteData)
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 30)
        
        console.log('Clears the pasteboard content')
        systemPasteboard.clear()
        
        console.log('Checks the number of records')
        pasteData = systemPasteboard.getPasteData()
        assert.equal(pasteData.getRecordCount(), 0)
        
        console.log('Checks there is no content in the pasteboard')
        assert.equal(systemPasteboard.hasPasteData(), false)
        
        console.log('SUB_pasteBoard_function_JS_API_4500 end');
    })
    
    /**
     *  The callback function is used for pasteboard content changes
     */
    function contentChanges() {
        console.log('#EVENT: The content is changed in the pasteboard')
    }
})
