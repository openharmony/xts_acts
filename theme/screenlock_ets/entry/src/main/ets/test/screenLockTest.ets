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
import screenLock from '@ohos.screenLock';
import { describe, expect, it, beforeEach} from "hypium/index";

export default function screenLockJSUnit() {
    const INTERACTIVE_STATE_END_SLEEP = 0;
    const INTERACTIVE_STATE_USERID = 2;
    const INTERACTIVE_STATE_BEGIN_SLEEP = 3;

    describe('ScreenLockServiceTest', function () {
        console.info("====>-----------------------ScreenlockTest is starting-----------------------");

        let result = false
        beforeEach(async function (done) {
            result = await screenLock.isScreenLocked();
            done();
        });       
    
       /*
        * @tc.number  SUB_MISC_THEME_screenLock_API_0012
        * @tc.name    Test unlock() to  Unlocks the screen.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('SUB_MISC_THEME_screenLock_API_0012', 0, async function (done) {
            console.info('====>-------------SUB_MISC_THEME_screenLock_API_0012 start----------------------');
            try{
                screenLock.unlock((err, data) => {
                    try{
                        if (err) {
                            console.info("====>SUB_MISC_THEME_screenLock_API_0012 failed because: " + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        }
                        let currentResult = screenLock.isLocked()
                        expect(currentResult).assertEqual(false)
                        console.info("====>SUB_MISC_THEME_screenLock_API_0012 success.");
                        console.info('====>-------------SUB_MISC_THEME_screenLock_API_0012 end----------------------');
                        done();
                    }catch(err){
                        console.info('====>SUB_MISC_THEME_screenLock_API_0012 throw_err : ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }                    
                });
            }catch(err){
                console.info('====>SUB_MISC_THEME_screenLock_API_0012 catch err : ' + JSON.stringify(err));
                expect(err.code).assertEqual(201);
                done();
            }            
        })

        /*
        * @tc.number  SUB_MISC_THEME_screenLock_API_0013
        * @tc.name    Test unlock() to  Unlocks the screen.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('SUB_MISC_THEME_screenLock_API_0013', 0, async function (done) {
           console.info('====>-------------SUB_MISC_THEME_screenLock_API_0013 start----------------------');
            try{
                screenLock.unlock().then((data) => {
                    let currentResult = screenLock.isLocked()
                    expect(currentResult).assertEqual(false)
                    console.info("====>SUB_MISC_THEME_screenLock_API_0013 success.");
                    console.info('====>-------------SUB_MISC_THEME_screenLock_API_0013 end----------------------');
                    done();
                }).catch( err => {
                    console.info("====>SUB_MISC_THEME_screenLock_API_0013 failed because: " + JSON.stringify(err));
                    expect().assertFail();
                    done();
                });
            }catch(err){
                console.info('====>SUB_MISC_THEME_screenLock_API_0013 catch err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            }            
        });

        /*
         * @tc.number    SUB_MISC_THEME_screenLock_API_0001
         * @tc.name      Set to locked screen, query the lock screen state is locked state
         * @tc.desc      Test ScreenLock API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MISC_THEME_screenLock_API_0001", 0, async function (done) {
            console.info("====>------------------start SUB_MISC_THEME_screenLock_API_0001-------------------");
            try {
                screenLock.isScreenLocked((err, data) => {
                    try{
                        if(err){
                            console.info("====>SUB_MISC_THEME_screenLock_API_0001 failed because: " + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        }
                        console.info("====>SUB_MISC_THEME_screenLock_API_0001 screen's status is " + data);
                        expect(data == result).assertTrue();
                        console.info("====>------------------end SUB_MISC_THEME_screenLock_API_0001-------------------");
                        done();
                        
                    }catch(err){
                        console.info("====>logMessage SUB_MISC_THEME_screenLock_API_0001 throw_err = " + err);
                        expect().assertFail();
                        done();
                    }
                });
            } catch (err) {
                console.info("====>logMessage SUB_MISC_THEME_screenLock_API_0001: err = " + err);
                expect().assertFail();
                done();
            }            
        });

        /*
         * @tc.number    SUB_MISC_THEME_screenLock_API_0002
         * @tc.name      Set to locked screen, query the lock screen state is locked state
         * @tc.desc      Test ScreenLock API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MISC_THEME_screenLock_API_0002", 0, async function (done) {
            console.info("====>------------------start SUB_MISC_THEME_screenLock_API_0002-------------------");
            try {
                screenLock.isScreenLocked((err, data) => {
                    try{
                        console.info("====>SUB_MISC_THEME_screenLock_API_0002 screen's status is " + data);
                        expect(data == result).assertTrue();
                        console.info("====>------------------end SUB_MISC_THEME_screenLock_API_0002-------------------");
                        done();
                    }catch(err){
                        console.info("====>logMessage SUB_MISC_THEME_screenLock_API_0002 throw_err = " + err);
                        expect().assertFail();
                        done();
                    }                    
                });
            } catch (err) {
                console.info("====>logMessage SUB_MISC_THEME_screenLock_API_0002: err = " + err);
                expect().assertFail();
                done();
            }            
        });

        /*
         * @tc.number    SUB_MISC_THEME_screenLock_API_0003
         * @tc.name      Set to locked screen, query the lock screen state is locked state
         * @tc.desc      Test ScreenLock API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MISC_THEME_screenLock_API_0003", 0, async function (done) {
            console.info("====>------------------start SUB_MISC_THEME_screenLock_API_0003-------------------");
            try {
                screenLock.isSecureMode((err, data) => {
                    try{
                        console.info("====>SUB_MISC_THEME_screenLock_API_0003 secureMode's result is " + data);
                        expect(data == false).assertTrue();
                        console.info("====>------------------end SUB_MISC_THEME_screenLock_API_0003-------------------");
                        done();
                    }catch(err){
                        console.info("====>logMessage SUB_MISC_THEME_screenLock_API_0003 throw_err = " + err);
                        expect().assertFail();
                        done();
                    }                    
                });
            } catch (err) {
                console.info("====>logMessage SUB_MISC_THEME_screenLock_API_0003: err = " + err);
                expect().assertFail();
                done();
            }            
        });

        /*
         * @tc.number    SUB_MISC_THEME_screenLock_API_0004
         * @tc.name      Set to locked screen, query the lock screen state is locked state
         * @tc.desc      Test ScreenLock API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MISC_THEME_screenLock_API_0004", 0, async function (done) {
            console.info("------------------start SUB_MISC_THEME_screenLock_API_0004-------------------");
            try {
                screenLock.unlockScreen((err) => {
                    console.info("SUB_MISC_THEME_screenLock_API_0004: send unlockScreen issue success");
                    try{
                        if (err) {
                            console.info("====>SUB_MISC_THEME_screenLock_API_0004 failed because: " + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        }
                        let currentResult = screenLock.isLocked()
                        expect(currentResult).assertEqual(false)
                        console.info("====>SUB_MISC_THEME_screenLock_API_0004 success.");
                        console.info('====>-------------SUB_MISC_THEME_screenLock_API_0004 end----------------------');
                        done();
                    }catch(err){
                        console.info('====>SUB_MISC_THEME_screenLock_API_0004 throw_err : ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    }          
                });              
            } catch (error) {
                console.info("SUB_MISC_THEME_screenLock_API_0004: error = " + error);
                expect().assertFail();
                done();
            }
        });

        /*
         * @tc.number    SUB_MISC_THEME_screenLock_API_0007
         * @tc.name      Set to locked screen, query the lock screen state is locked state
         * @tc.desc      Test ScreenLock API functionality.
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MISC_THEME_screenLock_API_0007", 0, async function (done) {
            console.info("====>------------------start SUB_MISC_THEME_screenLock_API_0007-------------------");
            try {
                screenLock.isScreenLocked((err, data) => {
                    try{
                        console.info("====>SUB_MISC_THEME_screenLock_API_0007: isScreenLocked is successful, result is " + data);
                        expect(data == result).assertTrue();
                        console.info("====>------------------end SUB_MISC_THEME_screenLock_API_0007-------------------");
                        done();
                    }catch(err){
                        console.info("====>logMessage SUB_MISC_THEME_screenLock_API_0007 throw_err = " + err);
                        expect().assertFail();
                        done();
                    }                    
                });
            } catch (err) {
                console.info("====>logMessage SUB_MISC_THEME_screenLock_API_0007: err = " + err);
                expect().assertFail();
                done();
            }
            
        }); 

        /*
        * @tc.number  SUB_MISC_THEME_screenLock_API_0010
        * @tc.name    Test isLocked() to Checks whether the screen is currently locked.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('SUB_MISC_THEME_screenLock_API_0010', 0, async function (done) {
            console.info('====>-------------SUB_MISC_THEME_screenLock_API_0010 start----------------------');
            let lock = null;
            try{
                lock = await screenLock.isLocked()
                console.info('====>SUB_MISC_THEME_screenLock_API_0010 data : ' + JSON.stringify(lock));
                expect(lock).assertEqual(result);
                console.info('====>-------------SUB_MISC_THEME_screenLock_API_0010 end----------------------');
                done()
            }catch(err){
                console.info('====>SUB_MISC_THEME_screenLock_API_0010 err : ' + JSON.stringify(err));
                expect().assertFail();
                done()
            }
        });

        /*
        * @tc.number  SUB_MISC_THEME_screenLock_API_0011
        * @tc.name    Test isSecure() to Checks whether the screen lock of the current device is secure.
        * @tc.desc    Function test
        * @tc.level   0
        */
        it('SUB_MISC_THEME_screenLock_API_0011', 0, async function (done) {
            console.info('====>-------------SUB_MISC_THEME_screenLock_API_0011 start----------------------');
            let secured = null;
            try{
                secured = screenLock.isSecure()
                console.info('====>SUB_MISC_THEME_screenLock_API_0011 data : ' + JSON.stringify(secured));
                if (secured == false) {
                    expect(true).assertTrue();
                    console.info('====>-------------SUB_MISC_THEME_screenLock_API_0011 end----------------------');
                    done()
                }else{
                    expect().assertFail();
                    done()
                }
            }catch(err){
                console.info('====>SUB_MISC_THEME_screenLock_API_0011 err : ' + JSON.stringify(err));
                expect().assertFail();
                done()
            }
        });
    });
}
