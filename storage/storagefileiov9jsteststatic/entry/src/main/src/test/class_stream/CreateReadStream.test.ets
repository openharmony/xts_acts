import { describe, it, expect, TestType, Size, Level } from "../../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from '../Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fscreateReadStream() {
  describe('fileIO_fs_create_stream', (): void => {
    hilog.info(domain, tag, '%{public}s', 'fileIO_fs_create_stream start');

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_0700
     * @tc.name fileIO_test_create_ReadStream_static_007
     * @tc.desc Test the createReadStream() interface of class Stream.
     * Invalid argument.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_create_ReadStream_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        fs.createReadStream('');
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_007 has failed for' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    })

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_0800
     * @tc.name fileIO_test_create_ReadStream_static_008
     * @tc.desc Test the createReadStream() interface of class Stream.
     * No such file or directory.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_create_ReadStream_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_ReadStream_static_008');
      try {
        let start = 1;
        let end = 11;
        let rs = fs.createReadStream(fpath, { start, end });
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_008 has failed for' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    })

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_0900
     * @tc.name fileIO_test_create_ReadStream_static_009
     * @tc.desc Test the createReadStream() interface of class Stream.
     * Invalid argument,createWriteStream
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_create_ReadStream_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        fs.createWriteStream("-1");
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_009 has failed for' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    })

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_1000
     * @tc.name fileIO_test_create_ReadStream_static_010
     * @tc.desc Test the createReadStream() interface of class Stream.
     * ReadStream reads files.bytesRead
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_create_ReadStream_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_ReadStream_static_010');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let ReadStream = fs.createReadStream(fpath);
        let rb = ReadStream.bytesRead;
        let rpath = ReadStream.path;
        expect(await Utils.isIntNum(rb)).assertTrue();
        expect(rpath == fpath).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_010 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_1100
     * @tc.name fileIO_test_create_ReadStream_static_011
     * @tc.desc Test the createReadStream() interface of class Stream.
     * ReadStream reads files.Seek
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_create_ReadStream_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_ReadStream_static_011');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let ReadStream = fs.createReadStream(fpath);
        let offset = 5;
        let curoff = ReadStream.seek(offset, fs.WhenceType.SEEK_SET);
        expect(offset == curoff).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_011 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_1200
     * @tc.name fileIO_test_create_ReadStream_static_012
     * @tc.desc Test the createWriteStream() interface of class Stream.
     * ReadStream reads files.bytesWritten, path
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_create_ReadStream_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_ReadStream_static_012');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let WriteStream = fs.createWriteStream(fpath);
        let wb = WriteStream.bytesWritten;
        let wpath = WriteStream.path;
        expect(await Utils.isIntNum(wb)).assertTrue();
        expect(wpath == fpath).assertTrue();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_012 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_1300
     * @tc.name fileIO_test_create_ReadStream_static_013
     * @tc.desc Test the createWriteStream() interface of class Stream.
     * ReadStream reads files.Seek
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_create_ReadStream_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
        let fpath = await Utils.nextFileName('fileIO_test_create_ReadStream_static_013');
        expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

        try {
          let WriteStream = fs.createWriteStream(fpath);
          let curOff = WriteStream.seek(5, fs.WhenceType.SEEK_SET);
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_013 has failed for ' + curOff);
          expect(true).assertTrue();
          fs.unlinkSync(fpath);
        } catch (e: BusinessError) {
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_013 has failed for ' + e.message + ', code: ' + e.code);
          expect(false).assertTrue();
        }
    });

    /**
     * @tc.number SUB_DF_FILEIO_CREATE_READSTREAM_1400
     * @tc.name fileIO_test_create_ReadStream_static_014
     * @tc.desc Test the createWriteStream() interface of class Stream.
     * ReadStream reads files.Seek, Invalid argument
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('fileIO_test_create_ReadStream_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_create_ReadStream_static_014');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let WriteStream = fs.createWriteStream(fpath);
        let curOff = WriteStream.seek(-1);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_create_ReadStream_static_014 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });


    hilog.info(domain, tag, '%{public}s', 'fileIO_fs_create_stream end');
  })
}
