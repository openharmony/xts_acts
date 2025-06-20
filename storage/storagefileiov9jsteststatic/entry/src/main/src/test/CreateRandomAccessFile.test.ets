import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIOCreateRandomAccessFile() {
  describe('fileIO_create_randomAccessFile', (): void => {

    /**
     * @tc.number SUB_STORAGE_fileIO_create_randomaccessfile_sync_static_0000
     * @tc.name fileIO_create_randomaccessfile_sync_static_000
     * @tc.desc Test createRandomAccessFileSync() interface.
     * Create RandomAccessFile object to access file based on file path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_create_randomaccessfile_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_create_randomaccessfile_sync_static_000');
      expect(await Utils.prepareFile(fpath, '')).assertTrue();

      try {
        let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.READ_WRITE);
        let res = await Utils.isIntNum(randomaccessfile.fd);
        expect(res).assertTrue();
        randomaccessfile.close();
        fs.unlinkSync(fpath);
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_create_randomaccessfile_sync_static_000 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });
  });
}