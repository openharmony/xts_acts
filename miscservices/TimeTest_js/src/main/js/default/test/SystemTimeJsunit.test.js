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

// @ts-nocheck
import {
    describe,
    beforeAll,
    beforeEach,
    afterEach,
    afterAll,
    it,
    expect,
} from "deccjsunit/index";
import systemTime from "@ohos.systemTime";
import request from '@system.request';

describe("TimeTest", function () {
    console.log("start################################start");
    /**
     * @tc.number    SUB_systemTime_getRealActiveTime_JS_API_0100
     * @tc.name      Test systemTime.getRealActiveTime
     * @tc.desc      Test systemTime_getRealActiveTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_getRealActiveTime_test1", 0, async function (done) {
        console.log("SUB_systemTime_getRealActiveTime_JS_API_0100 start");

        systemTime.getRealActiveTime().then((data) => {
            console.log("f_ActiveTime1: getRealActiveTime data = " + data);
        });
        expect(true).assertTrue();
        console.log("SUB_systemTime_getRealActiveTime_JS_API_0100 end");
        done();
    });

    /**
     * @tc.number    SUB_systemTime_getRealTime_JS_API_0100
     * @tc.name      Test systemTime.getRealTime
     * @tc.desc      Test systemTime_getRealTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_getRealTime_test1", 0, async function (done) {
        console.log("SUB_systemTime_getRealTime_JS_API_0100 start");

        systemTime.getRealTime().then((data) => {
            console.log("f_RealTime1: getRealTime data = " + data);
        });
        expect(true).assertTrue();
        console.log("SUB_systemTime_getRealTime_JS_API_0100 end");
        done();
    });

    /**
    * @tc.number    SUB_systemTime_getCurrentTime_JS_API_0100
    * @tc.name      Test systemTime.getCurrentTime Invalid value
    * @tc.desc      Test systemTime_getCurrentTime API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('systemTime_getCurrentTime_test1', 0, async function (done) {
        console.info("SUB_systemTime_getCurrentTime_JS_API_0100 start");
        systemTime.getCurrentTime().then((data) => {
            expect(data != null).assertTrue();
            console.info(`systemTime.getCurrentTime success data : ` + JSON.stringify(data));
        }).catch((error) => {
            expect(true).assertTrue();
            console.info(`failed to systemTime.getCurrentTime because ` + JSON.stringify(error));
        });
        done();
    });

    /**
     * @tc.number    SUB_systemTime_getCurrentTime_JS_API_0200
     * @tc.name      Test systemTime.getCurrentTime Invalid value
     * @tc.desc      Test systemTime_getCurrentTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_getCurrentTime_test2', 0, async function (done) {
        console.info("SUB_systemTime_getCurrentTime_JS_API_0200 start");
        systemTime.getCurrentTime(true, (error, data) => {
            if (error) {
                expect(true).assertTrue();
                console.info(`failed to systemTime.getCurrentTime because ` + JSON.stringify(error));
                return;
            }
            expect(data != null).assertTrue();
            console.info(`systemTime.getCurrentTime success data : ` + JSON.stringify(data));
        });
        done();
    });

    /**
     * @tc.number    SUB_systemTime_getCurrentTime_JS_API_0200
     * @tc.name      Test systemTime.getCurrentTime Invalid value
     * @tc.desc      Test systemTime_getCurrentTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_getDate_test1', 0, async function (done) {
        console.info("SUB_systemTime_getDate_JS_API_0100 start");
        systemTime.getDate((error, data) => {
            if (error) {
                expect(true).assertTrue();
                console.info(`failed to systemTime.getDate because ` + JSON.stringify(error));
                return;
            }
            expect(data != null).assertTrue();
            console.info(`systemTime.getDate success data : ` + JSON.stringify(data));
        });
        done();
    });

    /**
    * @tc.number    SUB_systemTime_getCurrentTime_JS_API_0200
    * @tc.name      Test systemTime.getCurrentTime Invalid value
    * @tc.desc      Test systemTime_getCurrentTime API functionality.
    * @tc.size      : MEDIUM
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('systemTime_getDate_test2', 0, async function (done) {
        console.info("SUB_systemTime_getDate_JS_API_0200 start");
        systemTime.getDate().then((data) => {
            expect(data != null).assertTrue();
            console.log(`systemTime.getDate success data : ` + JSON.stringify(data));
        }).catch((error) => {
            expect(true).assertTrue();
            console.error(`failed to systemTime.getDate because ` + JSON.stringify(error));
        });
        done();
    });

    /**
     * @tc.number    SUB_systemTime_getTimezone_JS_API_0200
     * @tc.name      Test systemTime.getTimezone Invalid value
     * @tc.desc      Test systemTime_getTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_getTimezon_test1', 0, async function (done) {
        console.info("SUB_systemTime_getTimezon_JS_API_0100 start");
        systemTime.getTimezone((error, data) => {
            if (error) {
                expect(true).assertTrue();
                console.error(`failed to systemTime.getTimezone because ` + JSON.stringify(error));
                return;
            }
            expect(data != null).assertTrue();
            console.log(`systemTime.getTimezone success data : ` + JSON.stringify(data));
        });
        done();
    });

    /**
     * @tc.number    SUB_systemTime_getTimezone_JS_API_0200
     * @tc.name      Test systemTime.getTimezone Invalid value
     * @tc.desc      Test systemTime_getTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('systemTime_getTimezon_test2', 0, async function (done) {
        console.info("SUB_systemTime_getTimezon_JS_API_0200 start");
        systemTime.getTimezone().then((data) => {
            expect(data != null).assertTrue();
            console.info(`systemTime.getTimezone success data : ` + JSON.stringify(data));
        }).catch((error) => {
            expect(true).assertTrue();
            console.info(`failed to systemTime.getTimezone because ` + JSON.stringify(error));
        });
        done();
    });

    /**
     * @tc.number    SystemRequest_upload_test01
     * @tc.name      Test SystemRequest_upload Invalid value
     * @tc.desc      Test SystemRequest_upload API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SystemRequest_upload_test01', 0, async function (done) {
        console.info("SystemRequest_upload_test01 start");
        request.upload({
            url: 'http://www.path.com',
            files: [
                {
                    uri: 'internal://cache/path/to/file.txt',
                    name: 'file',
                    filename: 'file.txt',
                },
            ],
            data: [
                {
                    name: 'name1',
                    value: 'value',
                },
            ],
            success: function (data) {
                expect(data != null).assertTrue();
                console.info('upload success, code:' + data.code);
                console.info('upload success, code:' + data.data);
                console.info('upload success, code:' + data.headers);
            },
            fail: function () {
                expect(true).assertTrue();
                console.info('upload fail');
            },
            complete: null
        });
        done();
    });

    /**
     * @tc.number    SystemRequest_download_test01
     * @tc.name      Test SystemRequest_download Invalid value
     * @tc.desc      Test SystemRequest_download API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SystemRequest_download_test01', 0, async function (done) {
        console.info("SystemRequest_download_test01 start");
        request.download({
            url: 'http://www.path.com',
            success: function (data) {
                expect(data != null).assertTrue();
                console.info('call success callback success: ' + data.token);
            },
            fail: function (data, code) {
                console.info('handling fail');
            },
            filename: "文件名",
            header: null,
            description: "描述",
            complete: null
        });
        done();
    });

    /**
     * @tc.number    SystemRequest_onDownloadComplete_test01
     * @tc.name      Test SystemRequest_onDownloadComplete Invalid value
     * @tc.desc      Test SystemRequest_onDownloadComplete API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SystemRequest_onDownloadComplete_test01', 0, async function (done) {
        console.info("SystemRequest_onDownloadComplete_test01 start");
        request.onDownloadComplete({
            token: 'token-index',
            success: function (data) {
                expect(data != null).assertTrue();
                console.info('download success, uri:' + data.uri);
            },
            fail: function (data, code) {
                expect(true).assertTrue();
                console.info('download fail');
            },
            complete: null
        });
        done();
    });
});
  