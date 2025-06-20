import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIOListfile() {
  describe('fileIO_fs_listfile', (): void => {

    /**
     * @tc.number SUB_DF_FILEIO_LISTFILE_SYNC_0000
     * @tc.name fileIO_test_listfile_sync_static_000
     * @tc.desc Test listFileSync()interfaces.
     * Only path, do not filter file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_listfile_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_listfile_sync_static_000');
      let fpath1 = dpath + '/listfile_sync_000.txt';
      let fpath2 = dpath + '/listfile_sync_000.doc';
      let fpath3 = dpath + '/listfile_sync_000.png';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath1, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath2, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpath3, FILE_CONTENT)).assertTrue();

      try {
        let dirents = fs.listFileSync(dpath);
        expect(dirents.length == 3).assertTrue();
        fs.rmdirSync(dpath);
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_listfile_sync_static_000 end error' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });
  });
}