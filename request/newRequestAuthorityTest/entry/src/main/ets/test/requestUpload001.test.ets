/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import request from "@ohos.request";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function requestUploadOnetJSUnitTest() {
  describe('requestUploadOneJSUnit', function () {
    let attachments = [{
      name: "uploadTest",
      value: {
        path: "./test.txt",
        filename: "test.txt",
        mimetype: "application/octet-stream"
      }
    }];

    let config = {
      action: request.agent.Action.UPLOAD,
      url: 'http://127.0.0.1',
      title: 'uploadTest',
      description: 'Sample code for event listening',
      mode: request.agent.Mode.BACKGROUND,
      overwrite: true,
      method: "POST",
      data: attachments,
      saveas: "./",
      network: request.agent.Network.CELLULAR,
      metered: false,
      roaming: true,
      retry: true,
      redirect: true,
      index: 0,
      begins: 0,
      ends: -1,
      gauge: false,
      precise: false,
      token: "it is a secret"
    };

    let sleep = function (timeout) {
      return new Promise(resolve => {
        const st = setTimeout(() => {
          resolve(null);
          clearTimeout(st);
        }, timeout);
      });
    };

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Upload_Callback_0020
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Create_Upload_Callback_0020', 0, async function (done) {
      console.info("-----------------------SUB_Misc_REQUEST_Create_Upload_Callback_0020 is starting-----------------------");
      let config_ = {};
      try {
        //@ts-ignore
        request.agent.create(globalThis.abilityContext, config_, async (err, task)=>{
          console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0020 downloadTask: " + task);
          try{
            console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0020 create err: " + JSON.stringify(err));
            expect().assertFail();
            console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0020 create success: " + task);
          }catch(error){
            console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0020 create fail: " + JSON.stringify(error));
          }
          await request.agent.remove(task.tid);
          console.info("====>-----------------------SUB_Misc_REQUEST_Create_Upload_Callback_0020 end-----------------------");
          done();
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0020 parameter create fail: " + JSON.stringify(err));
        console.info("====>-----------------------SUB_Misc_REQUEST_Create_Upload_Callback_0020 end-----------------------");
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Upload_Promise_0020
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Create_Upload_Promise_0020', 0, async function (done) {
      console.info("-----------------------SUB_Misc_REQUEST_Create_Upload_Promise_0020 is starting-----------------------");
      let config_ = {};
      try {
        console.info("====>SUB_Misc_REQUEST_Create_Upload_Promise_0020 downloadTask");
        //@ts-ignore
        let task = await request.agent.create(globalThis.abilityContext, config_);
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Create_Upload_Promise_0020 parameter create fail: " + JSON.stringify(err));
        console.info("====>------------------SUB_Misc_REQUEST_Create_Upload_Promise_0020 end-----------------------");
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Upload_Callback_0050
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Create_Upload_Callback_0050', 0, async function (done) {
      console.info("====>---------------SUB_Misc_REQUEST_Create_Upload_Callback_0050 is starting------------------");
      try {
        //@ts-ignore
        request.agent.create(config, async (err, task)=>{
          console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0050 downloadTask: " + task);
          try{
            console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0050 create err: " + JSON.stringify(err));
            expect().assertFail();
            console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0050 create success: " + task);
          }catch(error){
            console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0050 create fail: " + JSON.stringify(error));
          }
          await request.agent.remove(task.tid);
          console.info("====>-----------------------SUB_Misc_REQUEST_Create_Upload_Callback_0050 end-----------------------");
          done();
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0050 parameter create fail: " + JSON.stringify(err));
        console.info("====>-----------------------SUB_Misc_REQUEST_Create_Upload_Callback_0050 end-----------------------");
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Upload_Promise_0050
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Create_Upload_Promise_0050', 0, async function (done) {
      console.info("-----------------------SUB_Misc_REQUEST_Create_Upload_Promise_0050 is starting-----------------------");
      try {
        console.info("====>SUB_Misc_REQUEST_Create_Upload_Promise_0050 downloadTask");
        //@ts-ignore
        request.agent.create(config);
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Create_Upload_Promise_0050 parameter create fail: " + JSON.stringify(err));
        console.info("====>-----------------------SUB_Misc_REQUEST_Create_Upload_Promise_0050 end-----------------------");
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Upload_Callback_0020
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Upload_Callback_0020', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Upload_Callback_0020 is starting-----------------------");
      try {
        let task = await request.agent.create(globalThis.abilityContext, config);
        // @ts-ignore
        request.agent.remove(task.tid, 'a' ,(err) => {
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0020 remove err: " + JSON.stringify(err));
              expect().assertFail();
            }
            expect(task !== undefined).assertEqual(true);
            console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0020 remove success: " + task);
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0020 remove fail: " + JSON.stringify(err));
          }
        });
        done();
      } catch (error) {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0020 catch error: " + JSON.stringify(error));
        console.info("-----------------------SUB_Misc_REQUEST_Remove_Upload_Callback_0020 end-----------------------");
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Upload_Promise_0020
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Upload_Promise_0020', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Upload_Promise_0020 is starting-----------------------");
      try {
        let task = await request.agent.create(globalThis.abilityContext, config);
        //@ts-ignore
        await request.agent.remove(task.tid, 'a');
        expect(true).assertEqual(true);
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0020 remove success: " + task);
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0020 catch error: " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("-----------------------SUB_Misc_REQUEST_Remove_Upload_Promise_0020 end-----------------------");
      done();
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Upload_Callback_0030
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Upload_Callback_0030', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Upload_Callback_0030 is starting-----------------------");
      try {
        // @ts-ignore
        request.agent.remove(true, (err) => {
          try {
            expect().assertFail();
          }catch (err){
            console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0030 remove fail: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0030 err.message: " + err.message);
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0030 err.code: " + err.code);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Upload_Promise_0030
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Upload_Promise_0030', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Upload_Promise_0030 is starting-----------------------");
      try {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0030 remove");
        // @ts-ignore
        await request.agent.remove(true);
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0030 err.message: " + err.message);
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0030 err.code: " + err.code);
        expect(err.code).assertEqual(401);
        done();
      }
      console.info("-----------------------SUB_Misc_REQUEST_Remove_Upload_Promise_0030 end-----------------------");
      done();
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Upload_Callback_0040
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Upload_Callback_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Upload_Callback_0040 is starting-----------------------");
      try {
        // @ts-ignore
        request.agent.remove(1, (err) => {
          try {
            expect().assertFail();
          }catch (err){
            console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0040 remove fail: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0040 err.message: " + err.message);
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0040 err.code: " + err.code);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Upload_Promise_0040
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Upload_Promise_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Upload_Promise_0040 is starting-----------------------");
      try {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0040 remove");
        // @ts-ignore
        await request.agent.remove(1);
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0040 err.message: " + err.message);
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0040 err.code: " + err.code);
        expect(err.code).assertEqual(401);
        done();
      }
      console.info("-----------------------SUB_Misc_REQUEST_Remove_Upload_Promise_0040 end-----------------------");
      done();
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Upload_Callback_0050
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Upload_Callback_0050', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Upload_Callback_0050 is starting-----------------------");
      try {
        request.agent.remove('abc', (err) => {
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0050 remove fail: " + JSON.stringify(err));
              expect(err.code).assertEqual(21900006);
              done();
            }else{
              console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0050 remove abc err: " + JSON.stringify(err));
              expect().assertFail();
            }
          }catch (err){
            console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0050 remove catch fail: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0050 err.message: " + err.message);
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0050 err.code: " + err.code);
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Upload_Promise_0050
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Upload_Promise_0050', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Upload_Promise_0050 is starting-----------------------");
      try {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0050 remove");
        await request.agent.remove('abc');
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0050 err.message: " + err.message);
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0050 err.code: " + err.code);
        expect(err.code).assertEqual(21900006);
        done();
      }
      console.info("-----------------------SUB_Misc_REQUEST_Remove_Upload_Promise_0050 end-----------------------");
      done();
    });


    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Upload_Callback_0060
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Upload_Callback_0060', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Upload_Callback_0060 is starting-----------------------");
      let task = await request.agent.create(globalThis.abilityContext, config);
      request.agent.remove(task.tid, (err) => {
        try {
          if(err){
            console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0060 remove err: " + JSON.stringify(err));
            expect().assertFail();
          }
          expect(task !== undefined).assertEqual(true);
          try {
            request.agent.remove(task.tid, (err) => {
              if(err){
                console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0060 remove second err: " + JSON.stringify(err));
                expect(err.code).assertEqual(21900006);
                done();
              }else{
                console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0060 remove second: " + JSON.stringify(err));
                expect().assertFail();
              }
            });
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0060 remove second catch err: " + JSON.stringify(err));
            done();
          }
        } catch (err) {
          console.info("====>SUB_Misc_REQUEST_Remove_Upload_Callback_0060 remove fail: " + JSON.stringify(err));
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Remove_Upload_Promise_0060
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Remove_Upload_Promise_0060', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Remove_Upload_Promise_0060 is starting-----------------------");
      try {
        let task = await request.agent.create(globalThis.abilityContext, config);
        await request.agent.remove(task.tid);
        await sleep(10);
        await request.agent.remove(task.tid);
        expect().assertFail();
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0060 remove success: " + task);
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Remove_Upload_Promise_0060 catch error: " + JSON.stringify(err));
        expect(err.code).assertEqual(21900006);
      }
      console.info("-----------------------SUB_Misc_REQUEST_Remove_Upload_Promise_0060 end-----------------------");
      done();
    });

    /**
     * @tc.number SUB_Misc_REQUEST_On_Upload_Progress_0010
     * @tc.desc  download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Upload_Progress_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Upload_Progress_0010 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_progressCallback = async (pro) => {
            task.off('progress', on_progressCallback);
            console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0010 pro: " + JSON.stringify(pro));
            expect(true).assertTrue();
            await sleep(10);
            done();
          }

          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0010 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            //@ts-ignore
            task.on('progress',  on_progressCallback, 'a');
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0010 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0010 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Upload_Progress_0010
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Upload_Progress_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Upload_Progress_0010 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        let flag = true;
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_progressCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0010 on_progressCallback flag: " + flag);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0010 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('progress', on_progressCallback);
            //@ts-ignore
            task.off('progress', on_progressCallback, 'a');
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0010 offProgress success flag: " + flag);
            await task.start();
            let t = setTimeout(async () => {
              try {
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0010 offProgress success flag: " + flag);
                clearTimeout(t);
                expect(flag).assertTrue();
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0010 offProgress fail err: " + JSON.stringify(err));
              }
              done();
            }, 100)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0010 catch err: " + JSON.stringify(err));
            await sleep(10);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0010 create catch err: " + JSON.stringify(err));
        await sleep(10);
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_On_Upload_Progress_0030
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Upload_Progress_0030', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Upload_Progress_0030 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      let arr = new Array();
      let arr1 = [0, 1, 2];
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0030 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('progress', (pro1) => {
              console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0030 pro1: " + JSON.stringify(pro1));
              arr.push(0);
            });
            task.on('progress', (pro2) => {
              console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0030 pro2: " + JSON.stringify(pro2));
              arr.push(1);
            });
            task.on('progress', (pro3) => {
              console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0030 pro3: " + JSON.stringify(pro3));
              arr.push(2);
            });
            await task.start();
            await sleep(20);
            console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0030 task progress on arr: " + JSON.stringify(arr));
            task.off('progress');
            expect(arr.join()).assertEqual(arr1.join());
            done();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0030 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Upload_Progress_0030
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Upload_Progress_0030', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Upload_Progress_0030 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      let arr = new Array();
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_progressCallback1 =async (pro1) => {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0030 pro1: " + JSON.stringify(pro1));
            arr.push(1);
          }
          let on_progressCallback2 =async (pro2) => {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0030 pro2: " + JSON.stringify(pro2));
            arr.push(2);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0030 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('progress', on_progressCallback1);
            task.on('progress', on_progressCallback2);
            task.off('progress');
            await task.start();
            await sleep(10);
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0030 task progress on arr: " + JSON.stringify(arr));
            expect(arr.length).assertEqual(0);
            done();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0030 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_On_Upload_Progress_0040
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Upload_Progress_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Upload_Progress_0040 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_progressCallback = async (pro) => {
            task.off('progress', on_progressCallback);
            console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0040 pro: " +  JSON.stringify(pro));
            expect(true).assertTrue();
            await sleep(10);
            done();
          }

          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('progress', on_progressCallback);
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0040 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Upload_Progress_0040 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Upload_Progress_0040
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Upload_Progress_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Upload_Progress_0040 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        let flag = true;
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_progressCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0040 on_progressCallback flag: " + flag);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('progress', on_progressCallback);
            task.off('progress', on_progressCallback);
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0040 offProgress success flag: " + flag);
            await task.start();
            let t = setTimeout(async () => {
              try {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0040 offProgress success flag: " + flag);
                clearTimeout(t);
                expect(flag).assertTrue();
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0040 offProgress fail err: " + JSON.stringify(err));
              }
              done();
            }, 100)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0040 catch err: " + JSON.stringify(err));
            await sleep(10);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Upload_Progress_0040 create catch err: " + JSON.stringify(err));
        await sleep(10);
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_On_Upload_Completed_0010
     * @tc.desc  download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Upload_Completed_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Upload_Completed_0040 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_completedCallback =async (pro) => {
            task.off('completed', on_completedCallback);
            console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0040 pro: " + JSON.stringify(pro));
            expect(true).assertTrue();
            done();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            //@ts-ignore
            task.on('completed', on_completedCallback, 'a');
            await task.start();
            await sleep(10);
            done();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0040 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0040 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Upload_Completed_0010
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Upload_Completed_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Upload_Completed_0010 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        let flag = true;
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_offCompletedCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0010 on_offCompletedCallback flag: " + flag);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0010 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_offCompletedCallback);
            //@ts-ignore
            task.off('completed', on_offCompletedCallback, 'a');
            await task.start();
            let t = setTimeout(async () => {
              try {
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0010 offCompleted success flag: " + flag);
                clearTimeout(t);
                expect(flag).assertTrue();
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0010 offCompleted fail err: " + JSON.stringify(err));
              }
              done();
            }, 100)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0010 catch err: " + JSON.stringify(err));
            await sleep(10);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0010 create catch err: " + JSON.stringify(err));
        await sleep(10);
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_On_Upload_Completed_0030
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Upload_Completed_0030', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Upload_Completed_0030 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      let arr = new Array();
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0030 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', (pro1) => {
              console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0030 pro1: " + JSON.stringify(pro1));
              arr.push(0);
            });
            task.on('completed', (pro2) => {
              console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0030 pro2: " + JSON.stringify(pro2));
              arr.push(1);
            });
            task.on('completed', (pro3) => {
              console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0030 pro3: " + JSON.stringify(pro3));
              arr.push(2);
            });;
            await task.start();
            await sleep(10);
            console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0030 task completed on arr: " + arr);
            task.off('completed');
            expect(true).assertEqual(true);
            done();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0030 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Upload_Completed_0030
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Upload_Completed_0030', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Upload_Completed_0030 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      let arr = new Array();
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_offCompletedCallback1 =async (pro1) => {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0030 pro1: " + JSON.stringify(pro1));
            arr.push(1);
          }
          let on_offCompletedCallback2 =async (pro2) => {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0030 pro2: " + JSON.stringify(pro2));
            arr.push(2);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0030 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_offCompletedCallback1);
            task.on('completed', on_offCompletedCallback2);
            task.off('completed');
            await task.start();
            await sleep(10);
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0030 task completed on arr: " + JSON.stringify(arr));
            expect(arr.length).assertEqual(0);
            done();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0030 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_On_Upload_Completed_0040
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Upload_Completed_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Upload_Completed_0040 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_completedCallback =async (pro) => {
            task.off('completed', on_completedCallback);
            console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0040 pro: " + JSON.stringify(pro));
            expect(true).assertTrue();
            done();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_completedCallback);
            await task.start();
            await sleep(10);
            done();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0040 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Upload_Completed_0040 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Upload_Completed_0040
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Upload_Completed_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Upload_Completed_0040 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        let flag = true;
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_offCompletedCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0040 on_offCompletedCallback flag: " + flag);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_offCompletedCallback);
            task.off('completed', on_offCompletedCallback);
            await task.start();
            let t = setTimeout(async () => {
              try {
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0040 offCompleted success flag: " + flag);
                clearTimeout(t);
                expect(flag).assertTrue();
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0040 offCompleted fail err: " + JSON.stringify(err));
              }
              done();
            }, 100)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0040 catch err: " + JSON.stringify(err));
            await sleep(10);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Upload_Completed_0040 create catch err: " + JSON.stringify(err));
        await sleep(10);
        done();
      }
    });

    /**
     *
     * @tc.number SUB_Misc_REQUEST_On_Upload_Failed_0010
     * @tc.desc  download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Upload_Failed_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Upload_Failed_0010 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_failedCallback = async (pro) => {
            task.off('failed', on_failedCallback);
            console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0010 pro: " + JSON.stringify(pro));
            expect(pro.state).assertEqual(65);
            done();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0010 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            //@ts-ignore
            task.on('failed', on_failedCallback, 'a');
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0010 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0010 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Upload_Failed_0010
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Upload_Failed_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Upload_Failed_0010 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        let flag = true;
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_failedCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0010 on_failedCallback flag: " + flag);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0010 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('failed', on_failedCallback);
            //@ts-ignore
            task.off('failed', on_failedCallback, 'a');
            await task.start();
            let t = setTimeout(async () => {
              try {
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0010 offFailed success flag: " + flag);
                clearTimeout(t);
                expect(flag).assertTrue();
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0010 offFailed fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 100);
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0010 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0010 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_On_Upload_Failed_0030
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Upload_Failed_0030', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Upload_Failed_0030 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      let arr = new Array();
      let arr1 = [0, 1, 2];
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0030 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('failed', (pro1) => {
              console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0030 pro1: " + JSON.stringify(pro1));
              arr.push(0);
            });
            task.on('failed', (pro2) => {
              console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0030 pro2: " + JSON.stringify(pro2));
              arr.push(1);
            });
            task.on('failed', (pro3) => {
              console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0030 pro3: " + JSON.stringify(pro3));
              arr.push(2);
            });
            await task.start();
            await sleep(20);
            task.off('failed');
            console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0030 task progress on arr: " + JSON.stringify(arr));
            expect(arr.join()).assertEqual(arr1.join());
            done();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0030 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Upload_Failed_0030
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Upload_Failed_0030', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Upload_Failed_0030 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      let arr = new Array();
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_offCompletedCallback1 =async (pro1) => {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0030 pro1: " + JSON.stringify(pro1));
            arr.push(1);
          }
          let on_offCompletedCallback2 =async (pro2) => {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0030 pro2: " + JSON.stringify(pro2));
            arr.push(2);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0030 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('failed', on_offCompletedCallback1);
            task.on('failed', on_offCompletedCallback2);
            task.off('failed');
            await task.start();
            await sleep(10);
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0030 task failed on arr: " + JSON.stringify(arr));
            expect(arr.length).assertEqual(0);
            done();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0030 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_On_Upload_Failed_0040
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Upload_Failed_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Upload_Failed_0040 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_failedCallback = async (pro) => {
            task.off('failed', on_failedCallback);
            console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0040 pro: " + JSON.stringify(pro));
            expect(pro.state).assertEqual(65);
            done();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('failed', on_failedCallback);
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0040 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Upload_Failed_0040 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Upload_Failed_0040
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Upload_Failed_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Upload_Failed_0040 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        let flag = true;
        request.agent.create(globalThis.abilityContext, config_, async (err, task) => {
          let on_failedCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0040 on_failedCallback flag: " + flag);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('failed', on_failedCallback);
            task.off('failed', on_failedCallback);
            await task.start();
            let t = setTimeout(async () => {
              try {
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0040 offFailed success flag: " + flag);
                clearTimeout(t);
                expect(flag).assertTrue();
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0040 offFailed fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 100);
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0040 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Upload_Failed_0040 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Upload_Callback_0060
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Create_Upload_Callback_0060', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Create_Upload_Callback_0060 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      request.agent.create(globalThis.abilityContext, config_, async (err, task1)=>{
        console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0060 uploadTask: " + task1);
        try{
          if(err){
            console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0060 create err: " + JSON.stringify(err));
            expect().assertFail();
          }
          request.agent.create(globalThis.abilityContext, config_, async (err, task2)=>{
            try {
              if(err){
                console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0060 create err: " + JSON.stringify(err));
                expect().assertFail();
              }
              await task1.start();
            } catch (err) {
              console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0060 create success: " + JSON.stringify(err));
              expect(err.code).assertEqual(21900007);
              await request.agent.remove(task2.tid);
              done();
            }
          });
        }catch(error){
          console.info("====>SUB_Misc_REQUEST_Create_Upload_Callback_0060 create fail: " + JSON.stringify(error));
          done();
        }
        console.info("-----------------------SUB_Misc_REQUEST_Create_Upload_Callback_0060 end-----------------------");
      });
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Create_Upload_Promise_0060
     * @tc.desc      Starts a upload session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Create_Upload_Promise_0060', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Create_Upload_Promise_0060 is starting-----------------------");
      let config_ = config
      config_.mode = request.agent.Mode.FOREGROUND;
      try {
        let task1 = await request.agent.create(globalThis.abilityContext, config_);
        var task2 = await request.agent.create(globalThis.abilityContext, config_);
        console.info("====>SUB_Misc_REQUEST_Create_Upload_Promise_0060 task1 failed");
        await task1.start();
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Create_Upload_Promise_0060 create catch err: " + JSON.stringify(err));
        await request.agent.remove(task2.tid);
        expect(err.code).assertEqual(21900007);
        done();
      }
    });

  })
}