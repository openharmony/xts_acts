import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import fileUri from '@ohos.file.fileuri';
import fileShare from "@ohos.fileshare";
import fs from '@ohos.file.fs';
import type wantConstant from '@ohos.app.ability.wantConstant';
import { AsyncCallback } from "@ohos.base"
import { BusinessError } from "@ohos.base"
let domain: number = 0x0000;
let tag: string = 'testTag';

export const CONTENT = "Hello World!";

export default function fileuriTest() {
  describe('fileuriTest', (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    /**
     * @tc.number SUB_STORAGE_FileUri_GetUriFromPath_0000
     * @tc.name test_FileUri_GetUriFromPath_static_000
     * @tc.desc Function of API, get Uri from Path. Test normal function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('test_FileUri_GetUriFromPath_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        let path = "/data/storage/el2/base/haps/entry/files/sync.jpg";
        let uri = fileUri.getUriFromPath(path);
        let result = "file://ohos.acts.storage.fileuri.static/data/storage/el2/base/haps/entry/files/sync.jpg"
        hilog.info(domain, tag, "test_FileUri_GetUriFromPath_static_000 uri: %{public}s", uri);
        hilog.info(domain, tag, "test_FileUri_GetUriFromPath_static_000 result: %{public}s", result);
        expect(uri != "").assertTrue();
        expect(uri == result).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, `test_FileUri_GetUriFromPath_static_000 has failed for ${JSON.stringify(e)}`);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_FileUri_GetUriFromPath_0100
     * @tc.name test_FileUri_GetUriFromPath_static_001
     * @tc.desc Function of API, get Uri from Path. Test path is empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('test_FileUri_GetUriFromPath_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        let uri = fileUri.getUriFromPath("");
        let result = "file://ohos.acts.storage.fileuri.static"
        hilog.info(domain, tag, "test_FileUri_GetUriFromPath_static_001 uri: %{public}s", uri);
        hilog.info(domain, tag, "test_FileUri_GetUriFromPath_static_001 result: %{public}s", result);
        expect(uri != "").assertTrue();
        expect(uri == result).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, `test_FileUri_GetUriFromPath_static_001 has failed for ${JSON.stringify(e)}`);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_STORAGE_FileUri_Parameter_0000
     * @tc.name test_FileUri_Parameter_Name_static_000
     * @tc.desc Get the FileURI object through 'path' and validates the properties of the FileURI object.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('test_FileUri_Parameter_Name_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        let name = 'sync_000.txt';
        let path = '/data/storage/el2/base/haps/sync_000.txt';
        let uri = fileUri.getUriFromPath(path);
        let fileFromPath = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        fs.writeSync(fileFromPath.fd, CONTENT);
        let fileUriObject = new fileUri.FileUri(fileFromPath.path);
        expect(name === fileUriObject.name).assertTrue();
        expect(path === fileUriObject.path).assertTrue();
        expect(uri === fileUriObject.toString()).assertTrue();
        fs.closeSync(fileFromPath);
        let fileFromUri = fs.openSync(fileUriObject.toString(), fs.OpenMode.READ_ONLY);
        let readLen = fs.readSync(fileFromUri.fd, new ArrayBuffer(32), { offset: 0 });
        expect(readLen === CONTENT.length).assertTrue();
        fs.closeSync(fileFromUri);
        fs.unlinkSync(path);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, `test_FileUri_Parameter_Name_static_000 has failed for ${JSON.stringify(e)}`);
        expect(false).assertTrue();
      }
    });

    hilog.info(domain, tag, '%{public}s', 'fileuriTest end');
  })
}
