/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import mediaLibrary from '@ohos.multimedia.medialibrary';
import featureAbility from '@ohos.ability.featureAbility'
import fileio from '@ohos.fileio';
import {
    describe,
    it,
    expect
} from 'deccjsunit/index';

describe('fileAsset.callback.test.js', async function () {
    var context = featureAbility.getContext();
    console.info('MediaLibraryTest : getMediaLibrary IN');
    var media = mediaLibrary.getMediaLibrary(context);
    console.info('MediaLibraryTest : getMediaLibrary OUT');
    const fileKeyObj = mediaLibrary.FileKey;

    function executeAtError(testNum, bool, error, done) {
      console.info(
        `SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_CALLBACK${testNum} failed, error: ${error}`
      );
      expect(bool).assertTrue();
      if (typeof done === "function") {
        done();
      }
    }
    //======================== FILE BEGIN ==================================
 
    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_CALLBACK_005_35
     * @tc.name      : close
     * @tc.desc      : asset close the type of video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_CALLBACK_005_35', 0, async function (done) {
      const testNum = "_005_35";
        let asset;
        let fd;
        let fd1;
        try {
            let type = mediaLibrary.MediaType.VIDEO;
            let fetchOp = {
                uri: 'dataability://123456789/media/external/images/media/10',
                networkId: '123456789',
                selections: fileKeyObj.MEDIA_TYPE + '= ?',
                selectionArgs: [type.toString()],
            };
            media.getFileAssets(fetchOp, (error, fetchFileResult) => {
              try{
                console.info(`MediaLibraryTest : ==1==`);
                fetchFileResult.getAllObject((error, dataList) => {
                  console.info(`MediaLibraryTest : ==2==`);
                  try{
                    console.info(`MediaLibraryTest : ==3==`);
                    asset = dataList[0];
                    console.info(`MediaLibraryTest : ==4==`);
                    asset.open('r', (error, innerFd) => {
                      fd = innerFd;
                      try{
                        asset.close(fd, (error) => {
                          try{
                            asset.open('r', (error, innerFd1) => {
                              fd1 = innerFd1;
                              try{
                                asset.close(fd1, (error) => {
                                  try{
                                    if (fd > 0 && fd1 > 0) {
                                      console.info(`MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_CALLBACK${testNum}  success`);
                                      expect(true).assertTrue();
                                      done();
                                  } else {
                                    console.info(`MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_CALLBACK${testNum}  failed`);
                                      expect(false).assertTrue();
                                      done();
                                  }
                                  }catch(error){
                                    executeAtError(testNum, false, error, done);
                                  }
                                });
                              }catch(error){
                                executeAtError(testNum, false, error, done);
                              }
                            });
                          }catch(error){
                            executeAtError(testNum, false, error, done);
                          }
                        });
                      }catch(error){
                        executeAtError(testNum, false, error, done);
                      }
                    });
                  }catch(error){
                    executeAtError(testNum, true, error, done);
                  }
                });
              }catch(error){
                executeAtError(testNum, true, error, done);
              }
            });
        } catch (error) {
          console.info(`MediaLibraryTest : ==5==`);
          console.info(`MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_OPENANDCLOSE_ASSET_CALLBACK${testNum}  error:${error}`);
          asset.close(fd, () =>{
                  try{
                    console.info(`MediaLibraryTest : ==6==`);
                    asset1.close(fd1, () => {
                      console.info(`MediaLibraryTest : ==7==`);
                      expect(false).assertTrue();
                        done();
                    });
                  }catch(error){
                    console.info(`MediaLibraryTest : ==8==`);
                    expect(false).assertTrue();
                    done();
                  }
                });
        }
    });

    //======================== CLOSE BEGIN ================================

});