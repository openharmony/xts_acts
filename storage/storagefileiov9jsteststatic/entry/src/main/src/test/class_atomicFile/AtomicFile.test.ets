import { describe, it, expect, TestType, Size, Level } from "../../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from '../Util.test';
import fs from '@ohos.file.fs';
import buffer from '@ohos.buffer';
import { BusinessError } from '@ohos.base';
import util from '@ohos.util';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const FILE_CONTENT = 'hello world';
const WAIT_ONE_SECOND = 1000;

export default function atomicFileTest() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe("fileIO_fs_atomicFile_test", (): void => {
    hilog.info(domain, tag, '%{public}s', 'fileIO_fs_atomicFile_test start');

    /**
     * @tc.number SUB_DF_ATOMIC_FILE_0000
     * @tc.name fileIO_test_atomicFile_static_000
     * @tc.desc Test the startWrite() interface of class AtomicFile
     * Create a file when file path is "", throw exception
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_atomicFile_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_000 start');
      try {
        let file1 = new fs.AtomicFile("");
        let ws1 = file1.startWrite();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_000 has failed for' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message === "No such file or directory").assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_ATOMIC_FILE_0100
     * @tc.name fileIO_test_atomicFile_static_001
     * @tc.desc Test the startWrite() interface of class AtomicFile
     * Create a file when file is exist, overwrite original file
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_atomicFile_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_atomicFile_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = new fs.AtomicFile(fpath);
        let ws = file.startWrite();
        file.finishWrite();
        let statres = fs.statSync(fpath);
        expect(statres.size == 0).assertTrue();
        file.delete();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_ATOMIC_FILE_0300
     * @tc.name fileIO_test_atomicFile_static_003
     * @tc.desc Test the startWrite() interface of class AtomicFile
     * Create a file when path is not exist, create a new file
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_atomicFile_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_003 start');
      let fpath = await Utils.nextFileName('fileIO_test_atomicFile_static_003');
      try {
        let file1 = new fs.AtomicFile(fpath);
        let ws1 = file1.readFully();
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_003 has failed for' + e.code + e.message );
        expect(e.code == 13900002 && e.message === "No such file or directory").assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_ATOMIC_FILE_0500
     * @tc.name fileIO_test_atomicFile_static_005
     * @tc.desc Test the openRead() interface of class AtomicFile
     * Open an existing file, create readStream read content
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_atomicFile_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_005 start');
      let fpath = await Utils.nextFileName('fileIO_test_atomicFile_static_005');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = new fs.AtomicFile(fpath);
        let readStream = file.openRead();
        readStream.on('readable', () => {
          let data = readStream.read();
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_005 data ' + data);
          if (!data) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_005 data is null');
            return;
          }
          expect(data === FILE_CONTENT).assertTrue();
          file.delete();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_005 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_ATOMIC_FILE_0800
     * @tc.name fileIO_test_atomicFile_static_008
     * @tc.desc Test the delete() interface of class AtomicFile
     * startWrite() create one nwe file, delete() will remove the new file
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_atomicFile_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_008 start');
      let fpath = await Utils.nextFileName('fileIO_test_atomicFile_static_008');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let file = new fs.AtomicFile(fpath);
        let ws = file.startWrite();
        file.finishWrite();
        let stat = fs.statSync(fpath);
        expect(stat.size == 0).assertTrue();

        file.delete();
        let res = fs.accessSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_008 res ' + res);
        expect(res).assertFalse();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_008 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_ATOMIC_FILE_0900
     * @tc.name fileIO_test_atomicFile_static_009
     * @tc.desc Test the getBaseFile() interface of class AtomicFile
     * AtomicFile() create one file name, getBaseFile() will get the file name
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_atomicFile_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_009 start');
      let fpath = await Utils.nextFileName('fileIO_test_atomicFile_static_009');
      try {
        let file = new fs.AtomicFile(fpath);
        let File = file.getBaseFile();
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_009 has failed for' + e.message + ', code: ' + e.code);
        expect(e.code == 13900002 && e.message === "No such file or directory").assertTrue();
      }
    });

    /**
     * @tc.number SUB_DF_ATOMIC_FILE_1000
     * @tc.name fileIO_test_atomicFile_static_010
     * @tc.desc Test the getBaseFile() interface of class AtomicFile
     * AtomicFile() create one file name, getBaseFile() will get the file name
     * @tc.size MEDIUM
     * @tc.type Functoin
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_test_atomicFile_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_010 start');
      let fpath = await Utils.nextFileName('fileIO_test_atomicFile_static_010');
      try {
        let file = new fs.AtomicFile(fpath);
        let ws = file.startWrite();
        ws.write("fileIO_test_atomicFile_static_010");
        await Utils.msSleep(WAIT_ONE_SECOND);
        file.finishWrite();
        let File = file.getBaseFile();
        expect(File.fd > 0).assertTrue();
        expect(File.path === fpath).assertTrue();
        file.delete();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_atomicFile_static_010 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

  })
  hilog.info(domain, tag, '%{public}s', 'fileIO_fs_atomicFile_test end');

}