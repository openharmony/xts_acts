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

import request from "@ohos.request";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function requestDownloadTwoUnitTest() {
  describe('requestDownloadTwoJSUnit', function () {
    console.info('====>################################request download Test start');
    /**
     * @tc.number    SUB_Misc_REQUEST_On_Download_Progress_0040
     * @tc.desc      download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Download_Progress_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Download_Progress_0040 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_On_Download_Progress_0040.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };

      try {
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_progressCallback = async (pro) => {
            task.off('progress', on_progressCallback);
            console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0040 pro.state: " + pro.state);
            console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0040 pro.index: " + pro.index);
            console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0040 pro.processed: " + pro.processed);
            console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0040 pro.size: " + pro.size);
            console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0040 pro.extras: " + JSON.stringify(pro.extras));
            try {
              await request.agent.remove(task.tid);
            } catch (err) {
              console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0040 task has complete: " + JSON.stringify(task.tid));
            }
            expect(true).assertTrue();
            done();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('progress', on_progressCallback);
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0040 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0040 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_On_Download_Progress_0030
     * @tc.desc      download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Download_Progress_0030', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Download_Progress_0030 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_On_Download_Progress_0030.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let flag = true
          let flag1 = true
          let on_progressCallback = async (pro) => {
            flag = false
            console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0030 pro.state: " + pro.state);
          }
          let on_progressCallback1 = async (pro) => {
            flag1 = false
            console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0030 pro.extras: " + JSON.stringify(pro.extras));
            try {
              await request.agent.remove(task.tid);
            } catch (err) {
              console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0030 task has complete: " + JSON.stringify(task.tid));
            }
            expect(!flag && !flag1).assertTrue();
            task.off('progress', on_progressCallback);
            task.off('progress', on_progressCallback1);
            done();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0030 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('progress', on_progressCallback);
            task.on('progress', on_progressCallback1);
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0030 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_On_Download_Progress_0010
     * @tc.desc      download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Download_Progress_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Download_Progress_0010 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_On_Download_Progress_0010.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };

      try {
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_progressCallback = async (pro) => {
            task.off('progress', on_progressCallback);
            console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0010 pro.state: " + pro.state);
            console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0010 pro.index: " + pro.index);
            console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0010 pro.processed: " + pro.processed);
            console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0010 pro.size: " + pro.size);
            console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0010 pro.extras: " + JSON.stringify(pro.extras));
            try {
              await request.agent.remove(task.tid);
            } catch (err) {
              console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0010 task has complete: " + JSON.stringify(task.tid));
            }
            expect(true).assertTrue();
            done();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0010 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            let a='a'
            // @ts-ignore
            task.on('progress', on_progressCallback,a);
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0010 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Download_Progress_0010 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Download_Progress_0040
     * @tc.desc      download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Download_Progress_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Download_Progress_0040 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Off_Download_Progress_0040.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };

      try {
        let flag = true;
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_progressCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0040 on_progressCallback flag: " + flag);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('progress', on_progressCallback);
            task.off('progress', on_progressCallback);
            await task.start();
            let t = setTimeout(async () => {
              try {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0040 offProgress success flag: " + flag);
                clearTimeout(t);
                expect(flag).assertTrue();
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0040 offProgress fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 5000)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0040 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0040 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Download_Progress_0030
     * @tc.desc      download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Download_Progress_0030', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Download_Progress_0030 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Off_Download_Progress_0030.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        let flag = true;
        let flag1 = true;
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_progressCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0030 on_progressCallback flag: " + flag);
          }
          let on_progressCallback1 = (pro) => {
            flag1 = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0030 on_progressCallback1 flag1: " + flag1);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0030 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('progress', on_progressCallback);
            task.on('progress', on_progressCallback1);
            task.off('progress');
            await task.start();
            let t = setTimeout(async () => {
              try {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0030 offProgress success flag: " + flag);
                console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0030 offProgress success flag1: " + flag1);
                clearTimeout(t);
                expect(flag && flag1).assertTrue();
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0030 offProgress fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 3000)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0030 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Download_Progress_0020
     * @tc.desc      download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Download_Progress_0020', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Download_Progress_0020 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Off_Download_Progress_0020.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        let flag = true;
        let flag1 = true;
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_progressCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0020 on_progressCallback flag: " + flag);
          }
          let on_progressCallback1 = (pro) => {
            flag1 = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0020 on_progressCallback1 flag1: " + flag1);
            expect(true).assertTrue();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0020 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('progress', on_progressCallback);
            task.on('progress', on_progressCallback1);
            task.off('progress',on_progressCallback);
            await task.start();
            let t = setTimeout(async () => {
              try {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0020 offProgress success flag: " + flag);
                clearTimeout(t);
                expect(flag ).assertTrue();
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0020 offProgress fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 3000)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0020 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0020 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Download_Progress_0010
     * @tc.desc      download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Download_Progress_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Download_Progress_0010 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Off_Download_Progress_0010.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };

      try {
        let flag = true;
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_progressCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0010 on_progressCallback flag: " + flag);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0010 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('progress', on_progressCallback);
            let a='a';
            // @ts-ignore
            task.off('progress', on_progressCallback,a);
            await task.start();
            let t = setTimeout(async () => {
              try {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0010 offProgress success flag: " + flag);
                clearTimeout(t);
                expect(flag).assertTrue();
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0010 offProgress fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 3000)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0010 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Download_Progress_0010 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_On_Download_Completed_0040
     * @tc.desc  download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Download_Completed_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Download_Completed_0040 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_On_Download_Completed_0040.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_completedCallback =async (pro) => {
            task.off('completed', on_completedCallback);
            console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0040 pro.state: " + pro.state);
            console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0040 pro.index: " + pro.index);
            console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0040 pro.processed: " + pro.processed);
            console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0040 pro.size: " + pro.size);
            console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0040 pro.extras: " + JSON.stringify(pro.extras));
            expect(true).assertTrue();
            done();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_completedCallback);
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0040 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0040 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_On_Download_Completed_0030
     * @tc.desc      download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Download_Completed_0030', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Download_Completed_0030 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_On_Download_Completed_0030.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };

      try {
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let flag = true
          let flag1 = true
          let on_progressCallback = async (pro) => {
            flag = false
            console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0030 pro.state: " + pro.state);
          }
          let on_progressCallback1 = async (pro) => {
            flag1 = false
            console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0030 pro.extras: " + JSON.stringify(pro.extras));
            try {
              await request.agent.remove(task.tid);
            } catch (err) {
              console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0030 task has complete: " + JSON.stringify(task.tid));
            }
            expect(!flag && !flag1).assertTrue();
            task.off('completed', on_progressCallback);
            task.off('completed', on_progressCallback1);
            done();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0030 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_progressCallback);
            task.on('completed', on_progressCallback1);
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0030 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_On_Download_Completed_0010
     * @tc.desc  download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Download_Completed_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Download_Completed_0010 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_On_Download_Completed_0010.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_completedCallback =async (pro) => {
            task.off('completed', on_completedCallback);
            console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0010 pro.state: " + pro.state);
            console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0010 pro.index: " + pro.index);
            console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0010 pro.processed: " + pro.processed);
            console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0010 pro.size: " + pro.size);
            console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0010 pro.extras: " + JSON.stringify(pro.extras));
            expect(true).assertTrue();
            done();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0010 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            let a='a'
            // @ts-ignore
            task.on('completed', on_completedCallback,a);
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0010 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Download_Completed_0010 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Off_Download_Completed_0040
     * @tc.desc  download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Download_Completed_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Download_Completed_0040 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Off_Download_Completed_0040.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };

      try {
        let flag = true;
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_offCompletedCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0040 on_offCompletedCallback flag: " + flag);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_offCompletedCallback);
            task.off('completed', on_offCompletedCallback);
            await task.start();
            let t = setTimeout(async () => {
              try {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0040 offCompleted success flag: " + flag);
                clearTimeout(t);
                expect(flag).assertTrue();
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0040 offCompleted fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 3000)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0040 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0040 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Download_Completed_0030
     * @tc.desc      download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Download_Completed_0030', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Download_Completed_0030 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Off_Download_Completed_0030.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        let flag = true;
        let flag1 = true;
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_progressCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0030 on_progressCallback flag: " + flag);
          }
          let on_progressCallback1 = (pro) => {
            flag1 = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0030 on_progressCallback1 flag1: " + flag1);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0030 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_progressCallback);
            task.on('completed', on_progressCallback1);
            task.off('completed');
            await task.start();
            let t = setTimeout(async () => {
              try {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0030 offProgress success flag: " + flag);
                console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0030 offProgress success flag1: " + flag1);
                clearTimeout(t);
                expect(flag && flag1).assertTrue();
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0030 offProgress fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 3000)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0030 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Download_Completed_0020
     * @tc.desc      download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Download_Completed_0020', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Download_Completed_0020 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Off_Download_Completed_0020.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        let flag = true;
        let flag1 = true;
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_progressCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0020 on_progressCallback flag: " + flag);
          }
          let on_progressCallback1 = (pro) => {
            flag1 = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0020 on_progressCallback1 flag1: " + flag1);
            expect(true).assertTrue();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0020 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_progressCallback);
            task.on('completed', on_progressCallback1);
            task.off('completed',on_progressCallback);
            await task.start();
            let t = setTimeout(async () => {
              try {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0020 offProgress success flag: " + flag);
                clearTimeout(t);
                expect(flag ).assertTrue();
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0020 offProgress fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 3000)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0020 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0020 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Off_Download_Completed_0010
     * @tc.desc  download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Download_Completed_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Download_Completed_0010 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Off_Download_Completed_0010.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };

      try {
        let flag = true;
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_offCompletedCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0010 on_offCompletedCallback flag: " + flag);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0010 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_offCompletedCallback);
            let a='a';
            // @ts-ignore
            task.off('completed', on_offCompletedCallback,a);
            await task.start();
            let t = setTimeout(async () => {
              try {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0010 offCompleted success flag: " + flag);
                clearTimeout(t);
                expect(flag).assertTrue();
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0010 offCompleted fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 3000)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0010 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Download_Completed_0010 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_On_Download_Failed_0040
     * @tc.desc  download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Download_Failed_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Download_Failed_0040 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/xxxxxxxxxxx/test.apk',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_On_Download_Failed_0040.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_failedCallback = async (pro) => {
            task.off('failed', on_failedCallback);
            console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0040 pro.state: " + pro.state);
            console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0040 pro.index: " + pro.index);
            console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0040 pro.processed: " + pro.processed);
            console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0040 pro.size: " + pro.size);
            console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0040 pro.extras: " + JSON.stringify(pro.extras));
            expect(true).assertTrue();
            done();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('failed', on_failedCallback);
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0040 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0040 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_On_Download_Failed_0030
     * @tc.desc      download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Download_Failed_0030', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Download_Failed_0030 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_On_Download_Failed_0030.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };

      try {
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let flag = true
          let flag1 = true
          let on_progressCallback = async (pro) => {
            flag = false
            console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0030 pro.state: " + pro.state);
          }
          let on_progressCallback1 = async (pro) => {
            flag1 = false
            console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0030 pro.extras: " + JSON.stringify(pro.extras));
            try {
              await request.agent.remove(task.tid);
            } catch (err) {
              console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0030 task has complete: " + JSON.stringify(task.tid));
            }
            expect(!flag && !flag1).assertTrue();
            task.off('completed', on_progressCallback);
            task.off('completed', on_progressCallback1);
            done();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0030 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('completed', on_progressCallback);
            task.on('completed', on_progressCallback1);
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0030 catch err: " + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_On_Download_Failed_0010
     * @tc.desc  download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_On_Download_Failed_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_On_Download_Failed_0010 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/xxxxxxxxxxx/test.apk',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_On_Download_Failed_0010.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_failedCallback = async (pro) => {
            task.off('failed', on_failedCallback);
            console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0010 pro.state: " + pro.state);
            console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0010 pro.index: " + pro.index);
            console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0010 pro.processed: " + pro.processed);
            console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0010 pro.size: " + pro.size);
            console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0010 pro.extras: " + JSON.stringify(pro.extras));
            expect(true).assertTrue();
            done();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0010 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            let a='a'
            // @ts-ignore
            task.on('failed', on_failedCallback,a);
            await task.start();
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0010 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_On_Download_Failed_0010 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Off_Download_Failed_0040
     * @tc.desc  download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Download_Failed_0040', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Download_Failed_0040 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/xxxxxxxxxxx/test.apk',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Off_Download_Failed_0040.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };

      try {
        let flag = true;
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_failedCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0040 on_failedCallback flag: " + flag);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0040 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('failed', on_failedCallback);
            task.off('failed', on_failedCallback);
            await task.start();
            let t = setTimeout(async () => {
              try {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0040 offFailed success flag: " + flag);
                clearTimeout(t);
                expect(flag).assertTrue();
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0040 offFailed fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 3000)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0040 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0040 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Download_Failed_0030
     * @tc.desc      download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Download_Failed_0030', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Download_Failed_0030 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Off_Download_Failed_0030.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        let flag = true;
        let flag1 = true;
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_progressCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0030 on_progressCallback flag: " + flag);
          }
          let on_progressCallback1 = (pro) => {
            flag1 = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0030 on_progressCallback1 flag1: " + flag1);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0030 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('failed', on_progressCallback);
            task.on('failed', on_progressCallback1);
            task.off('failed');
            await task.start();
            let t = setTimeout(async () => {
              try {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0030 offProgress success flag: " + flag);
                console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0030 offProgress success flag1: " + flag1);
                clearTimeout(t);
                expect(flag && flag1).assertTrue();
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0030 offProgress fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 3000)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0030 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0030 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number    SUB_Misc_REQUEST_Off_Download_Failed_0020
     * @tc.desc      download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Download_Failed_0020', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Download_Failed_0020 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Off_Download_Failed_0020.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };
      try {
        let flag = true;
        let flag1 = true;
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_progressCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0020 on_progressCallback flag: " + flag);
          }
          let on_progressCallback1 = (pro) => {
            flag1 = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0020 on_progressCallback1 flag1: " + flag1);
            expect(true).assertTrue();
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0020 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('failed', on_progressCallback);
            task.on('failed', on_progressCallback1);
            task.off('failed',on_progressCallback);
            await task.start();
            let t = setTimeout(async () => {
              try {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0020 offProgress success flag: " + flag);
                clearTimeout(t);
                expect(flag ).assertTrue();
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0020 offProgress fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 3000)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0020 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0020 create catch err: " + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number SUB_Misc_REQUEST_Off_Download_Failed_0010
     * @tc.desc  download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Misc_REQUEST_Off_Download_Failed_0010', 0, async function (done) {
      console.info("====>-----------------------SUB_Misc_REQUEST_Off_Download_Failed_0010 is starting-----------------------");
      let config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://gitee.com/xxxxxxxxxxx/test.apk',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Misc_REQUEST_Off_Download_Failed_0010.txt',
        network: request.agent.Network.WIFI,
        overwrite: true,
        mode:request.agent.Mode.FOREGROUND
      };

      try {
        let flag = true;
        request.agent.create(globalThis.abilityContext, config, async (err, task) => {
          let on_failedCallback = (pro) => {
            flag = false;
            console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0010 on_failedCallback flag: " + flag);
          }
          try {
            if(err){
              console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0010 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            task.on('failed', on_failedCallback);
            let a='a';
            // @ts-ignore
            task.off('failed', on_failedCallback,a);
            await task.start();
            let t = setTimeout(async () => {
              try {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0010 offFailed success flag: " + flag);
                clearTimeout(t);
                expect(flag).assertTrue();
              } catch (err) {
                console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0010 offFailed fail err: " + JSON.stringify(err));
                await request.agent.remove(task.tid);
              }
              done();
            }, 3000)
          } catch (err) {
            console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0010 catch err: " + JSON.stringify(err));
            await request.agent.remove(task.tid);
            done();
          }
        });
      } catch (err) {
        console.info("====>SUB_Misc_REQUEST_Off_Download_Failed_0010 create catch err: " + JSON.stringify(err));
        done();
      }
    });

  });
}