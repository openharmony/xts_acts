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

import userAuth from '@ohos.userIAM.userAuth'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
var index = require('../default/pages/index/index.js');
var waitFlag = false;

/**
 * test case
 */
describe('userAuthTest', function () {
    beforeEach(function(done) {
        let waitTime = 1000;
        if (waitFlag) {
            waitTime = 30000;
        }
        setTimeout(function() {
            done();
        }, waitTime);
    })
    afterEach(function() {
    })

    /**
    * @tc.name      execute_authentication_callback_failed
    * @tc.number    JSAPI_Function_Execute_0100
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Execute_0100', 0, function (done) {
        console.log("JSAPI_Function_Execute_0100 start");
        index.default.fileSave('JSAPI_Function_Execute_0100','1','18  0 0 0 0 0 0 0 0 0 0')
        const auth = userAuth.getAuthenticator();
        auth.execute("FACE_ONLY", "S2", function(data) {
            console.log("JSAPI_Function_Execute_0100 auth.execute:" + data);
            // COMPARE_FAILURE(1)
            expect(data).assertEqual(1);
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("JSAPI_Function_Execute_0100 end");
    })

    /**
    * @tc.name      execute_authentication_callback_timeout
    * @tc.number    JSAPI_Function_Execute_0200
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Execute_0200', 0, function (done) {
        console.log("JSAPI_Function_Execute_0200 start");
        index.default.fileSave('JSAPI_Function_Execute_0200','1','18  6 0 0 0 0 0 0 0 0 0')
        const auth = userAuth.getAuthenticator();
        auth.execute("FACE_ONLY", "S2", function(data) {
            console.log("JSAPI_Function_Execute_0200 auth.execute:" + data);
            // TIMEOUT (3)
            expect(data).assertEqual(3);
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("JSAPI_Function_Execute_0200 end");
    })

    /**
    * @tc.name      execute_authentication_callback_camera_fail
    * @tc.number    JSAPI_Function_Execute_0300
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Execute_0300', 0, function (done) {
        console.log("JSAPI_Function_Execute_0300 start");
        index.default.fileSaveB('JSAPI_Function_Execute_0300','903')
        const auth = userAuth.getAuthenticator();
        auth.execute("FACE_ONLY", "S2", function(data) {
            console.log("JSAPI_Function_Execute_0300 auth.execute:" + data);
            // CAMERA_FAIL(4)
            expect(data).assertEqual(4);
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("JSAPI_Function_Execute_0300 end");
    })

    /**
    * @tc.name      execute_authentication_callback_busy
    * @tc.number    JSAPI_Function_Execute_0400
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Execute_0400', 0, function (done) {
        console.log("JSAPI_Function_Execute_0400 start");
       waitFlag = true;
        const auth = userAuth.getAuthenticator();
        auth.execute("FACE_ONLY", "S2", function(data) {
            console.log("JSAPI_Function_Execute_0400 auth.execute1:" + data);
        })
        auth.execute("FACE_ONLY", "S2", function(data) {
            console.log("JSAPI_Function_Execute_0400 auth.execute2:" + data);
            // BUSY(5)
            expect(data).assertEqual(5);
            setTimeout(function() {
                done();
            }, 3000);
        })
        console.log("JSAPI_Function_Execute_0400 end");
    })

    /**
    * @tc.name      execute_authentication_callback_LOCKED
    * @tc.number    JSAPI_Function_Execute_0500
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Execute_0500', 0, function (done) {
        console.log("JSAPI_Function_Execute_0500 start");
        const auth = userAuth.getAuthenticator();
        // exe 1~5
        index.default.fileSave('JSAPI_Function_Execute_0500','1','18  0 0 0 0 0 0 0 0 0 0')
        new Promise(function(resolve, reject) {
            resolve();
        }).then(
            auth.execute("FACE_ONLY", "S2", function(data) {
                console.log("JSAPI_Function_Execute_0500 auth.execute1:" + data);
                index.default.fileSave('JSAPI_Function_Execute_0500','1','18  0 0 0 0 0 0 0 0 0 0')
                
                auth.execute("FACE_ONLY", "S2", function(data) {
                    console.log("JSAPI_Function_Execute_0500 auth.execute2:" + data);
                    index.default.fileSave('JSAPI_Function_Execute_0500','1','18  0 0 0 0 0 0 0 0 0 0')
                    auth.execute("FACE_ONLY", "S2", function(data) {
                        console.log("JSAPI_Function_Execute_0500 auth.execute3:" + data);
                        index.default.fileSave('JSAPI_Function_Execute_0500','1','18  0 0 0 0 0 0 0 0 0 0')
                        auth.execute("FACE_ONLY", "S2", function(data) {
                            console.log("JSAPI_Function_Execute_0500 auth.execute4:" + data);
                            index.default.fileSave('JSAPI_Function_Execute_0500','1','18  0 0 0 0 0 0 0 0 0 0')
                            auth.execute("FACE_ONLY", "S2", function(data) {
                                console.log("JSAPI_Function_Execute_0500 auth.execute5:" + data);
                                auth.execute("FACE_ONLY", "S2", function(data) {
                                    console.log("JSAPI_Function_Execute_0500 auth.execute6:" + data);
                                    // LOCKED(7)
                                    expect(data).assertEqual(7);
                                    setTimeout(function() {
                                        console.log("JSAPI_Function_Execute_0500 end wait 30m");
                                        done();
                                    }, 1);
                                })
                            })
                        })
                    })
                })
            })
        );
        console.log("JSAPI_Function_Execute_0500 end");
    })

    /**
    * @tc.name      execute_authentication_callback_NOT_ENROLLED
    * @tc.number    JSAPI_Function_Execute_0600
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Execute_0600', 0, function (done) {
        console.log("JSAPI_Function_Execute_0600 start");
       waitFlag = false;
        index.default.fileSave('JSAPI_Function_Execute_0800','1','18  9 0 0 0 0 0 0 0 0 0');
        const auth = userAuth.getAuthenticator();
        auth.execute("FACE_ONLY", "S2", function(data) {
            console.log("JSAPI_Function_Execute_0600 auth.execute:" + data);
            // NOT_ENROLLED(8)
            expect(data).assertEqual(8);
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("JSAPI_Function_Execute_0600 end");
    })

    /**
    * @tc.name      execute_authentication_callback_GENERAL_ERROR
    * @tc.number    JSAPI_Function_Execute_0700
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Execute_0700', 0, function (done) {
        console.log("JSAPI_Function_Execute_0700 start");
        index.default.fileSave('JSAPI_Function_Execute_0700','1','18  4 0 0 0 0 0 0 0 0 0')
        const auth = userAuth.getAuthenticator();
        auth.execute("FACE_ONLY", "S2", function(data) {
            console.log("JSAPI_Function_Execute_0700 auth.execute:" + data);
            // GENERAL_ERROR(100)
            expect(data).assertEqual(100);
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("JSAPI_Function_Execute_0700 end");
    })

    /**
    * @tc.name      execute_authentication_promise_COMPARE_FAILURE
    * @tc.number    JSAPI_Function_Execute_0800
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Execute_0800', 0, function (done) {
        console.log("JSAPI_Function_Execute_0800 start");
        index.default.fileSave('JSAPI_Function_Execute_0800','1','18  0 0 0 0 0 0 0 0 0 0')
        const auth = userAuth.getAuthenticator();
        auth.execute("FACE_ONLY", "S2").then(function(data) {
            console.log("JSAPI_Function_Execute_0800 auth.execute:" + data);
            // COMPARE_FAILURE(1)
            expect(data).assertEqual(1);
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("JSAPI_Function_Execute_0800 end");
    })

    /**
    * @tc.name      execute_authentication_promise_TIMEOUT
    * @tc.number    JSAPI_Function_Execute_0900
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Execute_0900', 0, function (done) {
        console.log("JSAPI_Function_Execute_0900 start");
        index.default.fileSave('JSAPI_Function_Execute_0800','1','18  6 0 0 0 0 0 0 0 0 0');
        const auth = userAuth.getAuthenticator();
        auth.execute("FACE_ONLY", "S2").then(function(data) {
            console.log("JSAPI_Function_Execute_0900 auth.execute:" + data);
            // TIMEOUT (3)
            expect(data).assertEqual(3);
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("JSAPI_Function_Execute_0900 end");
    })

    /**
    * @tc.name      execute_authentication_promise_CAMERA_FAIL
    * @tc.number    JSAPI_Function_Execute_1000
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Execute_1000', 0, function (done) {
        console.log("JSAPI_Function_Execute_1000 start");
        index.default.fileSaveB('JSAPI_Function_Execute_1000','903')
        const auth = userAuth.getAuthenticator();
        auth.execute("FACE_ONLY", "S2").then(function(data) {
            console.log("JSAPI_Function_Execute_1000 auth.execute:" + data);
            // CAMERA_FAIL(4)
            expect(data).assertEqual(4);
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("JSAPI_Function_Execute_1000 end");
    })

    /**
    * @tc.name      execute_authentication_promise_BUSY
    * @tc.number    JSAPI_Function_Execute_1100
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Execute_1100', 0, function (done) {
        console.log("JSAPI_Function_Execute_1100 start");
       waitFlag = true;
        const auth = userAuth.getAuthenticator();
        auth.execute("FACE_ONLY", "S2").then(function(data) {
            console.log("JSAPI_Function_Execute_1100 auth.execute1:" + data);
        });
        auth.execute("FACE_ONLY", "S2").then(function(data) {
            console.log("JSAPI_Function_Execute_1100 auth.execute2:" + data);
            // BUSY(5)
            expect(data).assertEqual(5);
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("JSAPI_Function_Execute_1100 end");
    })

    /**
    * @tc.name      execute_authentication_promise_LOCKED
    * @tc.number    JSAPI_Function_Execute_1200
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Execute_1200', 0, function (done) {
        console.log("JSAPI_Function_Execute_1200 start");
        index.default.fileSave('JSAPI_Function_Execute_0500','1','18  0 0 0 0 0 0 0 0 0 0')
        const auth = userAuth.getAuthenticator();
        // exe 1~5
        new Promise(function(resolve, reject) {
            resolve();
        }).then(
            auth.execute("FACE_ONLY", "S2").then(function(data) {
                console.log("JSAPI_Function_Execute_1200 auth.execute1:" + data);
                index.default.fileSave('JSAPI_Function_Execute_0500','1','18  0 0 0 0 0 0 0 0 0 0')
                auth.execute("FACE_ONLY", "S2").then(function(data) {
                    console.log("JSAPI_Function_Execute_1200 auth.execute2:" + data);
                    index.default.fileSave('JSAPI_Function_Execute_0500','1','18  0 0 0 0 0 0 0 0 0 0')
                    auth.execute("FACE_ONLY", "S2").then(function(data) {
                        console.log("JSAPI_Function_Execute_1200 auth.execute3:" + data);
                        index.default.fileSave('JSAPI_Function_Execute_0500','1','18  0 0 0 0 0 0 0 0 0 0')
                        auth.execute("FACE_ONLY", "S2").then(function(data) {
                            console.log("JSAPI_Function_Execute_1200 auth.execute4:" + data);
                            index.default.fileSave('JSAPI_Function_Execute_0500','1','18  0 0 0 0 0 0 0 0 0 0')
                            auth.execute("FACE_ONLY", "S2").then(function(data) {
                                console.log("JSAPI_Function_Execute_1200 auth.execute5:" + data);
                                auth.execute("FACE_ONLY", "S2").then(function(data) {
                                    console.log("JSAPI_Function_Execute_1200 auth.execute6:" + data);
                                    // LOCKED(7)
                                    expect(data).assertEqual(7);
                                    setTimeout(function() {
                                        done();
                                    }, 1);
                                });
                            })
                        })
                    })
                })
            })
        );
        console.log("JSAPI_Function_Execute_1200 end");
    })

    /**
    * @tc.name      execute_authentication_promise_NOT_ENROLLED
    * @tc.number    JSAPI_Function_Execute_1300
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Execute_1300', 0, function (done) {
        console.log("JSAPI_Function_Execute_1300 start");
       waitFlag = false;
        index.default.fileSave('JSAPI_Function_Execute_0800','1','18  9 0 0 0 0 0 0 0 0 0');
        const auth = userAuth.getAuthenticator();
        auth.execute("FACE_ONLY", "S2").then(function(data) {
            console.log("JSAPI_Function_Execute_1300 auth.execute:" + data);
            // NOT_ENROLLED(8)
            expect(data).assertEqual(8);
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("JSAPI_Function_Execute_1300 end");
    })

    /**
    * @tc.name      execute_authentication_promise_GENERAL_ERROR
    * @tc.number    JSAPI_Function_Execute_1400
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Execute_1400', 0, function (done) {
        console.log("JSAPI_Function_Execute_1400 start");
        index.default.fileSave('JSAPI_Function_Execute_1400','1','18  4 0 0 0 0 0 0 0 0 0')
        const auth = userAuth.getAuthenticator();
        auth.execute("FACE_ONLY", "S2").then(function(data) {
            console.log("JSAPI_Function_Execute_1400 auth.execute:" + data);
            // GENERAL_ERROR(100)
            expect(data).assertEqual(100);
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("JSAPI_Function_Execute_1400 end");
    })

    /**
    * @tc.name      execute_authentication_callback_FACE_ONLY_SUCCESS
    * @tc.number    JSAPI_Function_Execute_1600
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Execute_1600', 0, function (done) {
        console.log("JSAPI_Function_Execute_1600 start");
        const auth = userAuth.getAuthenticator();
        auth.execute("FACE_ONLY", "S1", function(data) {
            console.log("JSAPI_Function_Execute_1600 auth.execute:" + data);
            // SUCCESS(0)
            expect(data).assertEqual(0);
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("JSAPI_Function_Execute_1600 end");
    })

    /**
    * @tc.name      execute_authentication_callback_ALL_NO_SUPPORT
    * @tc.number    JSAPI_Function_Execute_1700
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Execute_1700', 0, function (done) {
        console.log("JSAPI_Function_Execute_1700 start");
        const auth = userAuth.getAuthenticator();
        auth.execute("ALL", "S2", function(data) {
            console.log("JSAPI_Function_Execute_1700 auth.execute:" + data);
            // NO_SUPPORT(-1)
            expect(data).assertEqual(-1);
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("JSAPI_Function_Execute_1700 end");
    })

    /**
    * @tc.name      execute_authentication_callback_Type_is_null
    * @tc.number    JSAPI_Function_Execute_1800
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Execute_1800', 0, function (done) {
        console.log("JSAPI_Function_Execute_1800 start");
        const auth = userAuth.getAuthenticator();
        auth.execute("", "S2", function(data) {
            console.log("JSAPI_Function_Execute_1800 auth.execute:" + data);
            // INVALID_PARAMETERS（6）
            expect(data).assertEqual(6);
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("JSAPI_Function_Execute_1800 end");
    })

    /**
    * @tc.name      execute_authentication_promise_FACE_ONLY_SUCCESS
    * @tc.number    JSAPI_Function_Execute_1900
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Execute_1900', 0, function (done) {
        console.log("JSAPI_Function_Execute_1900 start");
        const auth = userAuth.getAuthenticator();
        auth.execute("FACE_ONLY", "S2").then(function(data) {
            console.log("JSAPI_Function_Execute_1900 auth.execute:" + data);
            // SUCCESS(0)
            expect(data).assertEqual(0);
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("JSAPI_Function_Execute_1900 end");
    })

    /**
    * @tc.name      execute_authentication_promise_ALL_NO_SUPPORT
    * @tc.number    JSAPI_Function_Execute_2000
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Execute_2000', 0, function (done) {
        console.log("JSAPI_Function_Execute_2000 start");
        const auth = userAuth.getAuthenticator();
        auth.execute("ALL", "S2").then(function(data) {
            console.log("JSAPI_Function_Execute_2000 auth.execute:" + data);
            // NO_SUPPORT(-1)
            expect(data).assertEqual(-1);
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("JSAPI_Function_Execute_2000 end");
    })

    /**
    * @tc.name      execute_authentication_promise_Type_is_null
    * @tc.number    JSAPI_Function_Execute_2100
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Execute_2100', 0, function (done) {
        console.log("JSAPI_Function_Execute_2100 start");
        const auth = userAuth.getAuthenticator();
        auth.execute("", "S2").then(function(data) {
            console.log("JSAPI_Function_Execute_2100 auth.execute:" + data);
            // INVALID_PARAMETERS（6）
            expect(data).assertEqual(6);
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("JSAPI_Function_Execute_2100 end");
    })

    /**
    * @tc.name      cancel_authentication_success
    * @tc.number    JSAPI_Function_Cancel_0100
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Cancel_0100', 0, function (done) {
        console.log("JSAPI_Function_Cancel_0100 start");
        const auth = userAuth.getAuthenticator();
        let cancelCode = authenticator.cancel();
        if (cancelCode == userIAM_userAuth.Result.SUCCESS) {
            console.info("cancel auth success");
            expect(true).assertTrue();
        } else {
            console.error("cancel auth fail");
            expect().assertFail();
        }
        console.log("JSAPI_Function_Cancel_0100 end");
        done();
    })

    /**
    * @tc.name      checkAvailability_authentication_success
    * @tc.number    JSAPI_Function_CheckAvailability_0100
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level0
    */
    it('JSAPI_Function_CheckAvailability_0100', 0, function (done) {
        console.log("JSAPI_Function_CheckAvailability_0100 start");
        const auth = userAuth.getAuthenticator();
        let checkCode = authenticator.checkAvailability("FACE_ONLY", "S2");
        if (checkCode == 0) {
            console.info("checkAvailability auth success");
            expect(true).assertTrue();
        } else {
            console.error("checkAvailability auth fail");
            expect().assertFail();
        }
        console.log("JSAPI_Function_CheckAvailability_0100 end");
        done();
    })

    /**
    * @tc.name      on_authentication_success
    * @tc.number    JSAPI_Function_On_0100
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_On_0100', 0, function (done) {
        console.log("JSAPI_Function_On_0100 start");
        const auth = userAuth.getAuthenticator();
        auth.on("tip", function(tip){
            if (tip.errorCode == 1) {
                console.error("on auth fail");
                console.error("receive tip: errorCode(" + tip.errorCode + ") code(" + tip.tipCode +") event(" +
                tip.tipEvent + ") info(" + tip.tipInfo + ")");
                expect().assertFail();
            }else {
                console.info("on auth success");
                console.info("receive tip: errorCode(" + tip.errorCode + ") code(" + tip.tipCode +") event(" +
                tip.tipEvent + ") info(" + tip.tipInfo + ")");
                expect(true).assertTrue();
            }
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("JSAPI_Function_On_0100 end");
    })

    /**
    * @tc.name      off_authentication_success
    * @tc.number    JSAPI_Function_Off_0100
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Off_0100', 0, function (done) {
        console.log("JSAPI_Function_Off_0100 start");
        const auth = userAuth.getAuthenticator();
        auth.on("tip", function(tip){
            if (tip.errorCode == 1) {
                console.error("off auth fail");
                console.error("receive tip: errorCode(" + tip.errorCode + ") code(" + tip.tipCode +") event(" +
                tip.tipEvent + ") info(" + tip.tipInfo + ")");
                expect().assertFail();
                setTimeout(function() {
                    done();
                }, 1);
            }else {
                console.info("on auth success");
                auth.off("tip", function(tip){
                    if (tip.errorCode == 1) {
                        console.error("off auth fail");
                        console.error("receive tip: errorCode(" + tip.errorCode + ") code(" + tip.tipCode +") event(" +
                        tip.tipEvent + ") info(" + tip.tipInfo + ")");
                        expect().assertFail();
                        setTimeout(function() {
                            done();
                        }, 1);
                    }else {
                        console.info("off auth success");
                        console.info("receive tip: errorCode(" + tip.errorCode + ") code(" + tip.tipCode +") event(" +
                        tip.tipEvent + ") info(" + tip.tipInfo + ")");
                        expect(true).assertTrue();
                        setTimeout(function() {
                            done();
                        }, 1);
                    }
                });
            }
        });
        console.log("JSAPI_Function_On_0100 end");
    })

})