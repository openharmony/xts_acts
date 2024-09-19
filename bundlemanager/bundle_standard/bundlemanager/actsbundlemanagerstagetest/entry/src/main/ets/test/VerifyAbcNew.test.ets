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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import bundleManager from '@ohos.bundle.bundleManager';
import fs from '@ohos.file.fs';

const TAG = "VerifyAbcNewTest ";

const FILE_PATH = "/data/storage/el2/base/";
const RES_PATH = "/data/storage/el1/bundle/testModule/resources/resfile/";

function copyFile(src: string, dest: string) {
  try {
    fs.copyFileSync(src, dest, 0);
    console.log(TAG + `[copyFileSync] success`);
  } catch (error) {
    console.info(TAG + "[copyFileSync]  >> " + src + ">>" + dest);
    console.info(TAG + "[copyFileSync] failed" + error);
  }
}

export default function VerifyAbcNewTest() {
  describe('VerifyAbcNewTest', () => {
    beforeAll(async (done: Function) => {
      console.info(TAG + 'beforeAll case');

      copyFile(`${RES_PATH}files/2.abc`, `${FILE_PATH}files/2.abc`);
      copyFile(`${RES_PATH}files/4.abc`, `${FILE_PATH}files/4.abc`);
      copyFile(`${RES_PATH}files/5.abc`, `${FILE_PATH}files/5.abc`);

      copyFile(`${RES_PATH}haps/1.abc`, `${FILE_PATH}haps/1.abc`);
      copyFile(`${RES_PATH}haps/1.txt`, `${FILE_PATH}haps/1.txt`);
      copyFile(`${RES_PATH}haps/3.abc`, `${FILE_PATH}haps/3.abc`);
      copyFile(`${RES_PATH}haps/5.abc`, `${FILE_PATH}haps/5.abc`);
      copyFile(`${RES_PATH}haps/8.abc`, `${FILE_PATH}haps/8.abc`);
      copyFile(`${RES_PATH}haps/9.abc`, `${FILE_PATH}haps/9.abc`);
      copyFile(`${RES_PATH}haps/10.abc`, `${FILE_PATH}haps/10.abc`);
      copyFile(`${RES_PATH}haps/error.abc`, `${FILE_PATH}haps/error.abc`);
      done()
    });
    beforeEach(() => {
      console.info(TAG + 'beforeEach case');
    });
    afterEach(() => {
      console.info(TAG + 'afterEach case');
    });

    /**
     * @tc.number: Sub_Bms_Framework_Install_VerifyAbc_0200
     * @tc.name: verifyAbc
     * @tc.desc: invoke the verifyAbc
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('Sub_Bms_Framework_Install_VerifyAbc_0200', 0, async (done: Function) => {
      let abcPaths: Array<string> = [`${FILE_PATH}haps/1.abc`, `${FILE_PATH}/files/2.abc`];
      try {
        console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_0200 START');
        await bundleManager.verifyAbc(abcPaths, true);
        expect(!fs.accessSync(abcPaths[0])).assertTrue();
        expect(!fs.accessSync(abcPaths[1])).assertTrue();

        let installPaths: Array<string> = ['/data/storage/el1/bundle/abcs/data/storage/el2/base/haps/1.abc',
          '/data/storage/el1/bundle/abcs/data/storage/el2/base/files/2.abc'];
        expect(fs.accessSync(installPaths[0])).assertTrue();
        expect(fs.accessSync(installPaths[1])).assertTrue();
        done();
      } catch (err) {
        console.error(TAG + 'verifyAbc failed. Cause:', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_0200 END');
    });

    /**
     * @tc.number: Sub_Bms_Framework_Install_VerifyAbc_0300
     * @tc.name: verifyAbc
     * @tc.desc: invoke the verifyAbc
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('Sub_Bms_Framework_Install_VerifyAbc_0300', 0, async (done: Function) => {
      let abcPaths: Array<string> = [`${FILE_PATH}haps/3.abc`, `${FILE_PATH}files/4.abc`];
      try {
        console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_0300 START');
        await bundleManager.verifyAbc(abcPaths, false);
        expect(fs.accessSync(abcPaths[0])).assertTrue();
        expect(fs.accessSync(abcPaths[1])).assertTrue();

        let installPaths: Array<string> = ['/data/storage/el1/bundle/abcs/data/storage/el2/base/haps/3.abc',
          '/data/storage/el1/bundle/abcs/data/storage/el2/base/files/4.abc'];
        expect(fs.accessSync(installPaths[0])).assertTrue();
        expect(fs.accessSync(installPaths[1])).assertTrue();
        done();
      } catch (err) {
        console.error(TAG + 'verifyAbc failed. Cause:', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_0300 END');
    });

    /**
     * @tc.number: Sub_Bms_Framework_Install_VerifyAbc_0400
     * @tc.name: verifyAbc
     * @tc.desc: invoke the verifyAbc
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('Sub_Bms_Framework_Install_VerifyAbc_0400', 0, async (done: Function) => {
      let abcPaths: Array<string> = [`${FILE_PATH}haps/error.abc`];
      try {
        console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_0400 START123');
        bundleManager.verifyAbc(abcPaths, true, (err, data) => {
          if (err) {
            console.info(TAG + 'verifyAbc failed: ', JSON.stringify(err));
            expect(err.code == 17700201).assertTrue();
          } else {
            console.info(TAG + 'verifyAbc successfully');
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info(TAG + 'verifyAbc failed. Cause:', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_0400 END');
    });

    /**
     * @tc.number: Sub_Bms_Framework_Install_VerifyAbc_0500
     * @tc.name: verifyAbc
     * @tc.desc: invoke the verifyAbc
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('Sub_Bms_Framework_Install_VerifyAbc_0500', 0, async (done: Function) => {
      let abcPaths: Array<string> = [`${FILE_PATH}haps/1.txt`];
      try {
        console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_0500 START');
        bundleManager.verifyAbc(abcPaths, true, (err, data) => {
          if (err) {
            console.info(TAG + 'verifyAbc failed: ', JSON.stringify(err));
            expect(err.code == 17700201).assertTrue();
          } else {
            console.info(TAG + 'verifyAbc successfully');
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info(TAG + 'verifyAbc failed. Cause:', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_0500 END');
    });

    /**
     * @tc.number: Sub_Bms_Framework_Install_VerifyAbc_0600
     * @tc.name: verifyAbc
     * @tc.desc: invoke the verifyAbc
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('Sub_Bms_Framework_Install_VerifyAbc_0600', 0, async (done: Function) => {
      let abcPaths: Array<string> = [`${FILE_PATH}haps/5.abc`, `${FILE_PATH}files/5.abc`];
      try {
        console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_0600 START');
        await bundleManager.verifyAbc(abcPaths, false);
        expect(fs.accessSync(abcPaths[0])).assertTrue();
        expect(fs.accessSync(abcPaths[1])).assertTrue();

        let installPaths: Array<string> = ['/data/storage/el1/bundle/abcs/data/storage/el2/base/haps/5.abc',
          '/data/storage/el1/bundle/abcs/data/storage/el2/base/files/5.abc'];
        expect(fs.accessSync(installPaths[0])).assertTrue();
        expect(fs.accessSync(installPaths[1])).assertTrue();
        done();
      } catch (err) {
        console.error(TAG + 'verifyAbc failed. Cause:', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_0600 END');
    });

    /**
     * @tc.number: Sub_Bms_Framework_Install_VerifyAbc_0700
     * @tc.name: verifyAbc
     * @tc.desc: invoke the verifyAbc
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('Sub_Bms_Framework_Install_VerifyAbc_0700', 0, async (done: Function) => {
      let abcPaths: Array<string> = ['/data/storage/el2/base/haps'];
      try {
        console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_0700 START');
        bundleManager.verifyAbc(abcPaths, true, (err, data) => {
          if (err) {
            console.info(TAG + 'verifyAbc failed: ', JSON.stringify(err));
            expect(err.code == 17700201).assertTrue();
          } else {
            console.info(TAG + 'verifyAbc successfully');
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info(TAG + 'verifyAbc failed. Cause:', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_0700 END');
    });

    /**
     * @tc.number: Sub_Bms_Framework_Install_VerifyAbc_0800
     * @tc.name: verifyAbc
     * @tc.desc: invoke the verifyAbc
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('Sub_Bms_Framework_Install_VerifyAbc_0800', 0, async (done: Function) => {
      let abcPaths: Array<string> = [`${FILE_PATH}haps/8.abc`, `${FILE_PATH}files/8.abc`];
      try {
        console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_0700 START');
        bundleManager.verifyAbc(abcPaths, true, (err, data) => {
          if (err) {
            console.info(TAG + 'verifyAbc failed: ', JSON.stringify(err));
            expect(err.code == 17700201).assertTrue();
            expect(fs.accessSync(abcPaths[0])).assertTrue();
          } else {
            console.info(TAG + 'verifyAbc successfully');
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info(TAG + 'verifyAbc failed. Cause:', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_0800 END');
    });

    /**
     * @tc.number: Sub_Bms_Framework_Install_VerifyAbc_0900
     * @tc.name: verifyAbc
     * @tc.desc: invoke the verifyAbc
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('Sub_Bms_Framework_Install_VerifyAbc_0900', 0, async (done: Function) => {
      let abcPaths: Array<string> = [`${FILE_PATH}haps/9.abc`];
      try {
        console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_0900 START');
        await bundleManager.verifyAbc(abcPaths, true);
        expect(!fs.accessSync(abcPaths[0])).assertTrue();

        let installPaths: Array<string> = ['/data/storage/el1/bundle/abcs/data/storage/el2/base/haps/9.abc'];
        expect(fs.accessSync(installPaths[0])).assertTrue();
        done();
      } catch (err) {
        console.error(TAG + 'verifyAbc failed. Cause:', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_0900 END');
    });

    /**
     * @tc.number: Sub_Bms_Framework_Install_VerifyAbc_1000
     * @tc.name: verifyAbc
     * @tc.desc: invoke the verifyAbc
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('Sub_Bms_Framework_Install_VerifyAbc_1000', 0, async (done: Function) => {
      let abcPaths: Array<string> = [`${FILE_PATH}haps/10.abc`];
      try {
        console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_1000 START');
        await bundleManager.verifyAbc(abcPaths, false);

        await bundleManager.verifyAbc(abcPaths, true);
        console.error(TAG + 'verifyAbc end2');
        expect(!fs.accessSync(abcPaths[0])).assertTrue();
        done();
      } catch (err) {
        console.error(TAG + 'verifyAbc failed. Cause:', JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_1000 END');
    });

    /**
     * @tc.number: Sub_Bms_Framework_Install_VerifyAbc_1100
     * @tc.name: verifyAbc
     * @tc.desc: invoke the verifyAbc
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('Sub_Bms_Framework_Install_VerifyAbc_1100', 0, async (done: Function) => {
      let abcPaths: ESObject = null;
      try {
        console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_1100 START');
        await bundleManager.verifyAbc(abcPaths, true);
        console.info(TAG + 'verifyAbc end');
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.info(TAG + 'verifyAbc failed. Cause:', JSON.stringify(err));
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_1100 END');
    });

    /**
     * @tc.number: Sub_Bms_Framework_Install_VerifyAbc_1200
     * @tc.name: verifyAbc
     * @tc.desc: invoke the verifyAbc
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('Sub_Bms_Framework_Install_VerifyAbc_1200', 0, async (done: Function) => {
      let abcPaths: ESObject = undefined;
      try {
        console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_1200 START');
        await bundleManager.verifyAbc(abcPaths, true);
        console.info(TAG + 'verifyAbc end');
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.info(TAG + 'verifyAbc failed. Cause:', JSON.stringify(err));
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_1200 END');
    });

    /**
     * @tc.number: Sub_Bms_Framework_Install_VerifyAbc_1300
     * @tc.name: verifyAbc
     * @tc.desc: invoke the verifyAbc
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('Sub_Bms_Framework_Install_VerifyAbc_1300', 0, async (done: Function) => {
      let abcPaths: Array<string> = [`${FILE_PATH}haps/9.abc`];
      let deleteOriginalFiles: ESObject = null;
      try {
        console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_1300 START');
        await bundleManager.verifyAbc(abcPaths, deleteOriginalFiles);
        console.info(TAG + 'verifyAbc end');
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.info(TAG + 'verifyAbc failed. Cause:', JSON.stringify(err));
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_1300 END');
    });

    /**
     * @tc.number: Sub_Bms_Framework_Install_VerifyAbc_1400
     * @tc.name: verifyAbc
     * @tc.desc: invoke the verifyAbc
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('Sub_Bms_Framework_Install_VerifyAbc_1400', 0, async (done: Function) => {
      let abcPaths: Array<string> = [`${FILE_PATH}haps/9.abc`];
      let deleteOriginalFiles: ESObject = undefined;
      try {
        console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_1400 START');
        await bundleManager.verifyAbc(abcPaths, deleteOriginalFiles);
        console.info(TAG + 'verifyAbc end');
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.info(TAG + 'verifyAbc failed. Cause:', JSON.stringify(err));
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info(TAG + 'Sub_Bms_Framework_Install_VerifyAbc_1400 END');
    });
  })

}