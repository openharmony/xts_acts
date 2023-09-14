/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import fileio from "@ohos.fileio";
import { describe, beforeAll, it, expect } from 'deccjsunit/index'
import {
  photoKeys,
  photoFetchOption,
  getFileAsset,
  getPermission,
  sleep,
} from '../../../../../../common'

export default function openTest() {
  describe('openTest', function () {
    beforeAll(async function () {
      console.info('beforeAll case')
      await getPermission()
    })

    async function rwOpenCallback(done, testNum, fetchOp, assetBytes) {
      let asset;
      let fd;
      try {
        asset = await getFileAsset(testNum, fetchOp);
        asset.open('rw', async (err, data) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              fd = data;
              console.info(`${testNum} fd: ${fd}`);
              let buf = new ArrayBuffer(4096);
              let res = await fileio.read(fd, buf);
              expect(res.bytesRead).assertEqual(assetBytes);

              let write = await fileio.write(fd, testNum);
              expect(write).assertEqual(testNum.length);
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        });
        await sleep(50);
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      } finally {
        if (asset) {
          await asset.close(fd);
        }
      }
    };

    async function rOpenCallback(done, testNum, fetchOp, assetBytes) {
      let asset;
      let fd;
      try {
        asset = await getFileAsset(testNum, fetchOp);
        asset.open('r', async (err, data) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              fd = data;
              console.info(`${testNum} fd: ${fd}`);
              let buf = new ArrayBuffer(4096);
              fileio.read(fd, buf).then((result) => {
                expect(result.bytesRead).assertEqual(assetBytes);
              }).catch((rErr) => {
                console.info(`${testNum} rErr: ${rErr}`);
                expect(false).assertTrue();
              })
              await sleep(50);
              fileio.write(fd, testNum).then((result) => {
                expect(false).assertTrue();
              }).catch((wErr) => {
                console.info(`${testNum} wErr: ${wErr}`);
              })
              await sleep(50);
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
            expect(false).assertTrue();
          }
          done();
        });
        await sleep(50);
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      } finally {
        if (asset) {
          await asset.close(fd);
        }
      }
    };

    async function wOpenCallback(done, testNum, fetchOp) {
      let asset;
      let fd;
      try {
        asset = await getFileAsset(testNum, fetchOp);
        asset.open('w', async (err, data) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              fd = data;
              console.info(`${testNum} fd: ${fd}`);
              fileio.write(fd, testNum).then((result) => {
                expect(result).assertEqual(testNum.length);
              }).catch((wErr) => {
                console.info(`${testNum} wErr: ${wErr}`);
                expect(false).assertTrue();
              })
              await sleep(50);
              let buf = new ArrayBuffer(4096);
              fileio.read(fd, buf).then((result) => {
                expect(false).assertTrue();
              }).catch((rErr) => {
                console.info(`${testNum} rErr: ${rErr}`);
              })
              await sleep(50);
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
            expect(false).assertTrue();
          }
          done();
        });
        await sleep(50);
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      } finally {
        if (asset) {
          await asset.close(fd);
        }
      }
    };

    async function rwOpenPromise(done, testNum, fetchOp, assetBytes) {
      let asset;
      let fd;
      try {
        asset = await getFileAsset(testNum, fetchOp);
        fd = await asset.open('rw');
        console.info(`${testNum} fd: ${fd}`);
        let buf = new ArrayBuffer(4096);
        let res = await fileio.read(fd, buf);
        expect(res.bytesRead).assertEqual(assetBytes);

        let write = await fileio.write(fd, testNum);
        expect(write).assertEqual(testNum.length);
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      } finally {
        if (asset) {
          await asset.close(fd);
        }
      }
    };

    async function rOpenPromise(done, testNum, fetchOp, assetBytes) {
      let asset;
      let fd;
      try {
        asset = await getFileAsset(testNum, fetchOp);
        fd = await asset.open('r');
        console.info(`${testNum} fd: ${fd}`);
        let buf = new ArrayBuffer(4096);
        let res = await fileio.read(fd, buf);
        expect(res.bytesRead).assertEqual(assetBytes);
        try {
          await fileio.write(fd, testNum);
          expect(false).assertTrue();
        } catch (error) {
          console.info(`${testNum} error: ${error}`);
        }
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      } finally {
        if (asset) {
          await asset.close(fd);
        }
      }
    };

    async function wOpenPromise(done, testNum, fetchOp) {
      let asset;
      let fd;
      try {
        asset = await getFileAsset(testNum, fetchOp);
        fd = await asset.open('w');
        let write = await fileio.write(fd, testNum);
        expect(write).assertEqual(testNum.length);

        try {
          let buf = new ArrayBuffer(4096);
          await fileio.read(fd, buf);
          expect(false).assertTrue();
        } catch (error) {
          console.info(`${testNum} error: ${error}`);
        }
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      } finally {
        if (asset) {
          await asset.close(fd);
        }
      }
    };

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_FILE_ASSET_OPEN_CALLBACK_0000
     * @tc.name      : open_callback_000
     * @tc.desc      : open image asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('open_callback_000', 0, async function (done) {
      const testNum = 'open_callback_000';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'openCb01.jpg');
      const bytesRead = 4096;
      await rwOpenCallback(done, testNum, fetchOps, bytesRead);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_FILE_ASSET_OPEN_CALLBACK_0100
     * @tc.name      : open_callback_001
     * @tc.desc      : open image asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('open_callback_001', 0, async function (done) {
      const testNum = 'open_callback_001';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'openCb02.jpg');
      const bytesRead = 4096;
      await rOpenCallback(done, testNum, fetchOps, bytesRead);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_FILE_ASSET_OPEN_CALLBACK_0200
     * @tc.name      : open_callback_002
     * @tc.desc      : open image asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('open_callback_002', 0, async function (done) {
      const testNum = 'open_callback_002';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'openCb03.jpg');
      await wOpenCallback(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_FILE_ASSET_OPEN_CALLBACK_0300
     * @tc.name      : open_callback_003
     * @tc.desc      : open video asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('open_callback_003', 0, async function (done) {
      const testNum = 'open_callback_003';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'openCb01.mp4');
      const bytesRead = 4096;
      await rwOpenCallback(done, testNum, fetchOps, bytesRead);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_FILE_ASSET_OPEN_CALLBACK_0400
     * @tc.name      : open_callback_004
     * @tc.desc      : open video asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('open_callback_004', 0, async function (done) {
      const testNum = 'open_callback_004';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'openCb02.mp4');
      const bytesRead = 4096;
      await rOpenCallback(done, testNum, fetchOps, bytesRead);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_FILE_ASSET_OPEN_CALLBACK_0500
     * @tc.name      : open_callback_005
     * @tc.desc      : open video asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('open_callback_005', 0, async function (done) {
      const testNum = 'open_callback_005';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'openCb03.mp4');
      await wOpenCallback(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_FILE_ASSET_OPEN_PROMISE_0000
     * @tc.name      : open_promise_000
     * @tc.desc      : open image asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('open_promise_000', 0, async function (done) {
      const testNum = 'open_promise_000';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'openPro01.jpg');
      const bytesRead = 4096;
      await rwOpenPromise(done, testNum, fetchOps, bytesRead);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_FILE_ASSET_OPEN_PROMISE_0100
     * @tc.name      : open_promise_001
     * @tc.desc      : open image asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('open_promise_001', 0, async function (done) {
      const testNum = 'open_promise_001';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'openPro02.jpg');
      const bytesRead = 4096;
      await rOpenPromise(done, testNum, fetchOps, bytesRead);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_FILE_ASSET_OPEN_PROMISE_0200
     * @tc.name      : open_promise_002
     * @tc.desc      : open image asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('open_promise_002', 0, async function (done) {
      const testNum = 'open_promise_002';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'openPro03.jpg');
      await wOpenPromise(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_FILE_ASSET_OPEN_PROMISE_0300
     * @tc.name      : open_promise_003
     * @tc.desc      : open video asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('open_promise_003', 0, async function (done) {
      const testNum = 'open_promise_003';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'openPro01.mp4');
      const bytesRead = 4096;
      await rwOpenPromise(done, testNum, fetchOps, bytesRead);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_FILE_ASSET_OPEN_PROMISE_0400
     * @tc.name      : open_promise_004
     * @tc.desc      : open video asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('open_promise_004', 0, async function (done) {
      const testNum = 'open_promise_004';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'openPro02.mp4');
      const bytesRead = 4096;
      await rOpenPromise(done, testNum, fetchOps, bytesRead);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_FILE_ASSET_OPEN_PROMISE_0500
     * @tc.name      : open_promise_005
     * @tc.desc      : open video asset
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('open_promise_005', 0, async function (done) {
      const testNum = 'open_promise_005';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'openPro03.mp4');
      await wOpenPromise(done, testNum, fetchOps);
    });
  })
}
