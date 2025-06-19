import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import fileUri from '@ohos.file.fileuri';
import fileShare from "@ohos.fileshare"
import type wantConstant from '@ohos.app.ability.wantConstant';
import { AsyncCallback } from "@ohos.base"
import { BusinessError } from "@ohos.base"
let domain: number = 0x0000;
let tag: string = 'testTag';

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

    hilog.info(domain, tag, '%{public}s', 'fileuriTest end');
  })
}
