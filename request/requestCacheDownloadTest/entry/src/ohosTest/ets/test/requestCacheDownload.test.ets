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

import cacheDownload from "@ohos.request.cacheDownload";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';

export default function requestCacheDownloadUnitTest() {
  describe('requestCacheDownloadJSTest', () => {
    console.info('====>requestCacheDownloadJSTest Test start');
    /**
     * @tc.number SUB_Request_cacheDownload_0100
     * @tc.name SUB_Request_cacheDownload_0100
     * @tc.desc Starts a upload session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_Request_cacheDownload_0100', 0, async (done: Function) => {
      console.info("====>-----------------------SUB_Request_cacheDownload_0100 is starting-----------------------");
      class cacheDownloadOptions implements cacheDownload.CacheDownloadOptions {
        headers?: Record<string, string> | undefined = {'Accept': '*/*'}
      }
      let url: string = 'https://gitee.com/murphy1984/download/releases/download/V1/test_picture_1.jpg';
      let num: number = 1 * 1024 * 1024 * 1024
      try {
        let downloadOptions = new cacheDownloadOptions();
        cacheDownload.setMemoryCacheSize(num);
        console.info("====>SUB_Request_cacheDownload_0100 setMemoryCacheSize success");
        cacheDownload.setFileCacheSize(num);
        console.info("====>SUB_Request_cacheDownload_0100 setFileCacheSize success");
        cacheDownload.download(url, downloadOptions);
        console.info("====>SUB_Request_cacheDownload_0100 download success url: " + url);
        cacheDownload.cancel(url);
        console.info("====>SUB_Request_cacheDownload_0100 cancel success url: " + url);
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.info("====>SUB_Request_cacheDownload_0100 catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

  });
}
