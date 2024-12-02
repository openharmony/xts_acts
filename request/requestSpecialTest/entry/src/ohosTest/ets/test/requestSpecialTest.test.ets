/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import commonEvent from '@ohos.commonEventManager';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';

export default function requestSpecialUnitTest() {
  describe('requestSpecialJSTest', () => {
    console.info('====>################################request download Test start');
    let baseContext: common.Context;
    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll((done: Function) => {
      try {
        let context: common.Context | undefined = AppStorage.get('context');
        if (context !== undefined){
          baseContext = context;
          console.info('====>beforeAll requestDownloadTwoJSUnit baseContext:'+JSON.stringify(baseContext))
          done();
        } else {
          console.info('====>beforeAll requestDownloadTwoJSUnit baseContext is undefined')
          done();
        }
      } catch (err) {
        console.info('====>beforeAll requestDownloadTwoJSUnit catch err:'+JSON.stringify(err))
        done();
      }
    });

    /**
     * @tc.number SUB_REQUEST_Download_broadcastEvent_0200
     * @tc.name SUB_REQUEST_Download_broadcastEvent_0200
     * @tc.desc Starts a upload session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_Download_broadcastEvent_0200', 0, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_Download_broadcastEvent_0200 is starting-----------------------");
      let config: request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://xxxxxxxx/test.apk',
        title: 'createTest',
        description: 'Sample code for create task',
        mode: request.agent.Mode.FOREGROUND,
        overwrite: true,
        saveas: './SUB_REQUEST_Download_broadcastEvent_0200.txt',
        network: request.agent.Network.ANY,
      };

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>SUB_REQUEST_Download_broadcastEvent_0200 unSubscriberCallback start");
        if (err){
          console.info("====>SUB_REQUEST_Download_broadcastEvent_0200 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_REQUEST_Download_broadcastEvent_0200 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        try {
          console.info("====>SUB_REQUEST_Download_broadcastEvent_0200 subscriberCallback data:"
            + JSON.stringify(data));
          commonEvent.unsubscribe(subscriber, unSubscriberCallback);
          console.info("====>SUB_REQUEST_Download_broadcastEvent_0200 data.code: " + data.code);
          expect(data.code).assertEqual(65);
          done();
        } catch (err) {
          console.info("====>SUB_REQUEST_Download_broadcastEvent_0200 subscriberCallback error: " + JSON.stringify(err));
          done();
        }
      }
      let commonEventSubscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: [ request.agent.BroadcastEvent.COMPLETE ]
      }
      let subscriber: ESObject;
      commonEvent.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        subscriber = data;
        console.info("====>SUB_REQUEST_Download_broadcastEvent_0200 subscriber data:" + data);
        commonEvent.subscribe(subscriber, subscriberCallback);
        console.info("====>SUB_REQUEST_Download_broadcastEvent_0200 subscriber finish");
      })

      try {
        request.agent.create(baseContext, config, async (err, task) => {
          try {
            if(err){
              console.info("====>SUB_REQUEST_Download_broadcastEvent_0200 create err: " + JSON.stringify(err));
              expect().assertFail();
            }
            await task.start();
            console.info("====>SUB_REQUEST_Download_broadcastEvent_0200 task start");
          } catch (err) {
            console.info("====>SUB_REQUEST_Download_broadcastEvent_0200 catch err: " + JSON.stringify(err));
          }
        });
      } catch (err) {
        console.info("====>SUB_REQUEST_Download_broadcastEvent_0200 create catch err: " + JSON.stringify(err));
        expect().assertFail();
      }
    });

    /*
     * @tc.number: SUB_Request_Agent_ErrorDetailed_0500
     * @tc.name: SUB_Request_Agent_ErrorDetailed_0500
     * @tc.desc: incorrect error of DNS
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_Request_Agent_ErrorDetailed_0500', 0, async (done: Function) => {
      console.info('====>-----------------------SUB_Request_Agent_ErrorDetailed_0500 is starting-----------------------');
      let config:request.agent.Config = {
        action: request.agent.Action.DOWNLOAD,
        url: 'https://singnn.com',
        title: 'createTest',
        description: 'XTS download test!',
        saveas: './SUB_Request_Agent_ErrorDetailed_0500',
        network: request.agent.Network.ANY,
        overwrite: true
      };
      try {
        let task: request.agent.Task = await request.agent.create(baseContext, config);
        task.on('failed', async (pro: request.agent.Progress) => {
          try {
            task.off('failed');
            console.info('====>SUB_Request_Agent_ErrorDetailed_0500 failed pro: ' + JSON.stringify(pro));
            let info:request.agent.TaskInfo = await request.agent.show(task.tid);
            console.info('====>SUB_Request_Agent_ErrorDetailed_0500 info: ' + JSON.stringify(info));
            expect(info.faults).assertEqual(80);
            done();
          } catch (err) {
            console.info('====>SUB_Request_Agent_ErrorDetailed_0500 err: ' + JSON.stringify(err));
          }
        })
        await task.start();
        console.info('====>SUB_Request_Agent_ErrorDetailed_0500 create success');
      } catch (err) {
        console.info('====>SUB_Request_Agent_ErrorDetailed_0500 create catch err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number Download_Test_0300
     * @tc.desc Called when the current download session fails.
     * @tc.size      MEDIUMTEST
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('Download_Test_0300', 0, async (done: Function) => {
      console.info("====>---------------------Download_Test_0300 is starting---------------------");
      let downloadFilePath = `${baseContext.tempDir}/Download_Test_0300.txt`
      console.info("====>downloadFileConfig:" + `${baseContext.tempDir}/Download_Test_0300.txt`);
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://xxx.com.apk',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        filePath: downloadFilePath,
        title: 'XTS download test!',
      }
      request.downloadFile(baseContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>Download_Test_0300 downloadTask: " + downloadTask);
        try {
          if (err) {
            console.info('====>Download_Test_0300 downloadFile fail: ' + JSON.stringify(err));
            expect().assertFail();
          }
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('fail', async () => {
            try {
              downloadTask.off('fail');
              console.info('====>Download_Test_0300 fail success');
              fs.unlinkSync(downloadFilePath);
              console.info('====>Download_Test_0300 delete files success');
              await downloadTask.delete();
              console.info('====>Download_Test_0300 delete downloadTask');
              expect(true).assertTrue();
              done();
            } catch (err) {
              console.info("====>Download_Test_0300 fail error: " + JSON.stringify(err));
              done();
            }
          });
        } catch (err) {
          console.info("====>Download_Test_0300 error: " + JSON.stringify(err));
          await downloadTask.delete();
          fs.unlinkSync(downloadFilePath);
          done();
        }
      })
    });

  });
}
