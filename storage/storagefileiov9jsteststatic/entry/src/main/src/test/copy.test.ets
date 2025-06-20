import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import fileUri from '@ohos.file.fileuri';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';
export const CONTENT = 'hello!!!';

export function prepare2GFile(fpath: string) {
  try {
    let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE)
    fs.truncateSync(file.fd)
    let bf = new ArrayBuffer(1024 * 1024 * 20);
    for (let i = 0; i < 100; i++) {
      let offset = bf.byteLength * i;
      let writeLen = fs.writeSync(file.fd, bf, { offset: offset, length: bf.byteLength, encoding: 'utf-8' });
    }
    fs.fsyncSync(file.fd)
    fs.closeSync(file)
    return true
  }
  catch (e: BusinessError) {
    hilog.info(domain, tag, '%{public}s', 'prepare2GFile end error' + JSON.stringify(e));
    return false
  }
}

export default function fileIOCopy() {
  describe('fileIO_fs_copy', (): void => {

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_0100
     * @tc.name fileIO_copy_async_static_001
     * @tc.desc Test copy() interfaces.Promise.
     * Test file copied successfully by path.Contains progressListener, processedSize, and totalSize parameters.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_copy_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_001');
      let fpathTarget = await Utils.nextFileName('dst');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpathTarget, CONTENT)).assertTrue();

      let srcDirUriLocal = fileUri.getUriFromPath(fpath);
      let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

      let progressListener = (progress: fs.Progress) => {
      hilog.info(domain, tag, '%{public}s', `progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
      };
      let options: fs.CopyOptions = {
        "progressListener" : progressListener
      }
      try {
        await fs.copy(srcDirUriLocal, dstDirUriLocal, options);
        let stat1 = fs.statSync(fpath);
        let stat2 = fs.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fs.unlinkSync(fpath);
        fs.unlinkSync(fpathTarget);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_0200
     * @tc.name fileIO_copy_async_static_002
     * @tc.desc Test copy() interfaces.Promise.
     * Test file copied successfully by path.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_copy_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_002');
      let fpathTarget = fpath + 'dst';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpathTarget, CONTENT)).assertTrue();
      let srcDirUriLocal = fileUri.getUriFromPath(fpath);
      let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

      try {
        await fs.copy(srcDirUriLocal, dstDirUriLocal);
        let stat1 = fs.statSync(fpath);
        let stat2 = fs.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fs.unlinkSync(fpath);
        fs.unlinkSync(fpathTarget);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_002 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_0300
     * @tc.name fileIO_copy_async_static_003
     * @tc.desc Test copy() interfaces.Promise.
     * The path point to nothing, no such file.Contains progressListener, processedSize, and totalSize parameters.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_copy_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_003');
      let fpathTarget = fpath + 'dst';
      let srcDirUriLocal = fileUri.getUriFromPath(fpath);
      let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

      let progressListener = (progress: fs.Progress) => {
        console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
      };
      let options: fs.CopyOptions = {
        "progressListener" : progressListener
      }

      try {
        await fs.copy(srcDirUriLocal, dstDirUriLocal, options);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_003 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_0400
     * @tc.name fileIO_copy_async_static_004
     * @tc.desc Test copy() interfaces.Promise.
     * The path point to nothing, no such file.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_copy_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_004');
      let fpathTarget = fpath + 'dst';
      let srcDirUriLocal = fileUri.getUriFromPath(fpath);
      let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

      try {
        await fs.copy(srcDirUriLocal, dstDirUriLocal);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_004 end error' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
  });
}