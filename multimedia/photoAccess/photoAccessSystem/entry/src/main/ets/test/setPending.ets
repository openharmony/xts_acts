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

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { describe, it, expect } from 'deccjsunit/index';
import fs from '@ohos.file.fs';
import {
  photoKeys,
  fetchOption,
} from '../../../../../../common';

export default function setPendingTest () {
    describe('setPendingTest', function () {
        const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext)

        async function getAllPhotoCount (testNum) : Promise<number> {
          let count: number = 0
          try {
            const predicates = new dataSharePredicates.DataSharePredicates();
            const ops : photoAccessHelper.FetchOptions = {
              fetchColumns: [],
              predicates: predicates
            };
            let fetchResult = await helper.getAssets(ops);
            count = fetchResult.getCount();
            console.info(`${testNum} getAllPhotoCount ${count}`);
            fetchResult.close();
          } catch (error) {
            console.info(`${testNum} getAllPhotoCount failed; error: ${error}`);
            throw error;
          }

          return new Promise((resolve, reject) => {
            resolve(count);
          });
        }

        async function getFileAssetByUri (testNum, uri) : Promise<photoAccessHelper.PhotoAsset> {
          let asset: photoAccessHelper.PhotoAsset = undefined;
          try {
            let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset>;
            let fetchOps = fetchOption(testNum, photoKeys.URI, uri);
            fetchResult = await helper.getAssets(fetchOps);
            console.info(`${testNum} getFileAsset fetchResult: ${fetchResult.getCount()}`);
            if (fetchResult.getCount() > 0) {
              asset = await fetchResult.getFirstObject();
            } else {
              console.info(`${testNum} can not getFileAsset by uri ${uri}`)
            }
            fetchResult.close();
          } catch (error) {
            console.info(`${testNum} getFileAssetByUri error: ${error}`);
            throw error;
          }
          return new Promise((resolve, reject) => {
            resolve(asset);
          });
        }

        async function resetPendingStatus (testNum, uri): Promise<void> {
          try {
            let photoAsset: photoAccessHelper.PhotoAsset = await getFileAssetByUri(testNum, uri);
            if (photoAsset === undefined) {
              console.info(`${testNum} can not get PhotoAsset by uri ${uri}`);
            } else {
              // @ts-ignore
              await photoAsset.setPending(false);
            }
          } catch (error) {
            console.info(`${testNum} resetPendingStatus error: ${error}`);
            throw error;
          }
          return new Promise((resolve, reject) => {
            resolve();
          });
        }

        async function setPendingCallbackTest (done, testNum, pendingStatus) {
          let photoAsset: photoAccessHelper.PhotoAsset = undefined;
          let displayName: string = '123.jpg';
          try {
            photoAsset = await helper.createAsset(displayName);
            if (photoAsset === undefined) {
              console.info(`${testNum} failed; Can not createAsset`);
              expect(false).assertTrue();
              done();
              return;
            }
            let fd: number = await photoAsset.open('rw');
            if (fd <= 0) {
              console.info(`${testNum} failed; Can not open asset ${fd}`);
              expect(false).assertTrue();
              done();
              return;
            }
            // @ts-ignore
            photoAsset.setPending(pendingStatus, async (err) => {
              try {
                if (err !== undefined) {
                  console.info(`${testNum} getAssets failed; err: ${err}`);
                  expect(false).assertTrue();
                } else {
                  await resetPendingStatus(testNum, photoAsset.uri);
                  expect(true).assertTrue();
                }
              } catch (error) {
                console.info(`${testNum} setPending failed; error: ${error}`);
                expect(false).assertTrue();
              }
              await photoAsset.close(fd);
              done();
            })
          } catch (error) {
            console.info(`${testNum} failed; error: ${error}`);
            expect(false).assertTrue();
            done();
          }
        }

        async function setPendingAbnormalCallbackTest (done, testNum, pendingStatus) {
          let photoAsset: photoAccessHelper.PhotoAsset = undefined;
          let displayName = '123.jpg';
          let fd: number = 0;
          try {
            try {
              photoAsset = await helper.createAsset(displayName);
              if (photoAsset === undefined) {
                console.info(`${testNum} failed; Can not createAsset`);
                expect(false).assertTrue();
                done();
                return;
              }
              fd = await photoAsset.open('rw');
              if (fd <= 0) {
                console.info(`${testNum} failed; Can not open asset ${fd}`);
                expect(false).assertTrue();
                done();
                return;
              }
            } catch (error) {
              console.info(`${testNum} failed; error: ${error}`);
              expect(false).assertTrue();
              done();
              return;
            }

            // @ts-ignore
            photoAsset.setPending(pendingStatus, async (err) => {
              try {
                if (err !== undefined) {
                  console.info(`${testNum} getAssets failed; err: ${err}`);
                  expect(true).assertTrue();
                } else {
                  await resetPendingStatus(testNum, photoAsset.uri);
                  expect(false).assertTrue();
                }
              } catch (error) {
                console.info(`${testNum} setPending failed; error: ${error}`);
                expect(false).assertTrue();
              }
              await photoAsset.close(fd);
              done();
            })
          } catch (error) {
            console.info(`${testNum} failed; error: ${error}`);
            expect(true).assertTrue();
            done();
          }
        }

        async function setPendingPromiseTest (done, testNum, pendingStatus) {
          let photoAsset: photoAccessHelper.PhotoAsset = undefined;
          let displayName = '123.jpg';
          let fd: number = 0;
          try {
            photoAsset = await helper.createAsset(displayName);
            if (photoAsset === undefined) {
              console.info(`${testNum} failed; Can not createAsset`);
              expect(false).assertTrue();
              done();
              return;
            }
            fd = await photoAsset.open('rw');
            if (fd <= 0) {
              console.info(`${testNum} failed; Can not open asset ${fd}`);
              expect(false).assertTrue();
              done();
              return;
            }
            // @ts-ignore
            await photoAsset.setPending(pendingStatus);
            await resetPendingStatus(testNum, photoAsset.uri);
            expect(true).assertTrue();
            await photoAsset.close(fd);
            done();
          } catch (error) {
            console.info(`${testNum} failed; error: ${error}`);
            expect(false).assertTrue();
            done();
          }
        }

        async function setPendingAbnormalPromiseTest (done, testNum, pendingStatus) {
          let photoAsset: photoAccessHelper.PhotoAsset = undefined;
          let displayName = '123.jpg';
          let fd: number = 0;
          try {
            photoAsset = await helper.createAsset(displayName);
            if (photoAsset === undefined) {
              console.info(`${testNum} failed; Can not createAsset`);
              expect(false).assertTrue();
              done();
              return;
            }
            fd = await photoAsset.open('rw');
            if (fd <= 0) {
              console.info(`${testNum} failed; Can not open asset ${fd}`);
              expect(false).assertTrue();
              done();
              return;
            }
            try {
              // @ts-ignore
              await photoAsset.setPending(pendingStatus);
            } catch (error) {
              console.info(`${testNum} failed; error: ${error}`);
              expect(true).assertTrue();
              done();
              return;
            }
            await resetPendingStatus(testNum, photoAsset.uri);
            expect(false).assertTrue();
            await photoAsset.close(fd);
            done();
          } catch (error) {
            console.info(`${testNum} failed; error: ${error}`);
            expect(false).assertTrue();
            done();
          }
        }

        async function makePendingCallbackToPromise(testNum, photoAsset, pendingStatus): Promise<void> {
          return new Promise((resolve, reject) => {
            // @ts-ignore
            photoAsset.setPending(pendingStatus, (err) => {
              if (err === undefined) {
                resolve();
              } else {
                console.info(`${testNum} makePendingCallbackToPromise failed; error: ${err}`);
                reject(err);
              }
            });
          });
        }

        /**
        * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_SETPENDING_0000
        * @tc.name      : setPending_callback_000
        * @tc.desc      : setPending true and setPending false success
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
        it('setPending_callback_000', 0, async function (done) {
          // normal setPending(true) and setPending(false) during create
          const testNum = 'setPending_callback_000';
          const pendingStatus = true;
          await setPendingCallbackTest(done, testNum, pendingStatus);
        });

        /**
        * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_SETPENDING_0100
        * @tc.name      : setPending_callback_001
        * @tc.desc      : setPending false without setPending true failed
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('setPending_callback_001', 0, async function (done) {
          // setPending(false) with never setPending(true)
          const testNum = 'setPending_callback_001';
          const pendingStatus = false;
          await setPendingAbnormalCallbackTest(done, testNum, pendingStatus);
        });

        /**
        * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_SETPENDING_0200
        * @tc.name      : setPending_callback_002
        * @tc.desc      : setPending undefined
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('setPending_callback_002', 0, async function (done) {
          // setPending(undefined)
          const testNum = 'setPending_callback_002';
          const pendingStatus = undefined;
          await setPendingAbnormalCallbackTest(done, testNum, pendingStatus);
        });

        /**
        * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_SETPENDING_0300
        * @tc.name      : setPending_callback_003
        * @tc.desc      : setPending true after write and setPending false after close
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
        it('setPending_callback_003', 0, async function (done) {
          // create -> open -> write -> pending(true) -> close -> pending(false)
          const testNum = 'setPending_callback_003';
          const displayName: string = '123.jpg';
          try {
            let oldCount: number = await getAllPhotoCount(testNum);
            let photoAsset: photoAccessHelper.PhotoAsset = await helper.createAsset(displayName);
            let newCount: number = await getAllPhotoCount(testNum);
            expect(newCount - oldCount).assertEqual(0);
            let fd: number = await photoAsset.open('rw');
            await fs.write(fd, '123');
            await makePendingCallbackToPromise(testNum, photoAsset, true);
            newCount = await getAllPhotoCount(testNum);
            expect(newCount - oldCount).assertEqual(0);
            await photoAsset.close(fd);
            newCount = await getAllPhotoCount(testNum);
            expect(newCount - oldCount).assertEqual(0);
            await makePendingCallbackToPromise(testNum, photoAsset, false);
            newCount = await getAllPhotoCount(testNum);
            expect(newCount - oldCount).assertEqual(1);
            done();
          } catch (error) {
            console.info(`${testNum} failed; error: ${error}`);
            expect(false).assertTrue();
            done();
          }
        });

        /**
        * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_SETPENDING_0400
        * @tc.name      : setPending_callback_004
        * @tc.desc      : setPending true after create and setPending false after close
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
        it('setPending_callback_004', 0, async function (done) {
          // create -> pending(true) -> open -> write -> close -> pending(false)
          const testNum = 'setPending_callback_004';
          const displayName: string = '123.jpg';
          try {
            let oldCount: number = await getAllPhotoCount(testNum);
            let photoAsset: photoAccessHelper.PhotoAsset = await helper.createAsset(displayName);
            let newCount: number = await getAllPhotoCount(testNum);
            expect(newCount - oldCount).assertEqual(0);
            await makePendingCallbackToPromise(testNum, photoAsset, true);
            newCount = await getAllPhotoCount(testNum);
            expect(newCount - oldCount).assertEqual(0);
            let fd: number = await photoAsset.open('rw');
            await fs.write(fd, '123');
            await photoAsset.close(fd);
            newCount = await getAllPhotoCount(testNum);
            expect(newCount - oldCount).assertEqual(0);
            await makePendingCallbackToPromise(testNum, photoAsset, false);
            newCount = await getAllPhotoCount(testNum);
            expect(newCount - oldCount).assertEqual(1);
            done();
          } catch (error) {
            console.info(`${testNum} failed; error: ${error}`);
            expect(false).assertTrue();
            done();
          }
        })

        /**
        * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_SETPENDING_0500
        * @tc.name      : setPending_callback_005
        * @tc.desc      : setPending true after create and setPending false before close
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
        it('setPending_callback_005', 0, async function (done) {
          // create -> pending(true) -> open -> write -> pending(false) -> close
          const testNum = 'setPending_callback_005';
          const displayName: string = '123.jpg';
          try {
            let oldCount: number = await getAllPhotoCount(testNum);
            let photoAsset: photoAccessHelper.PhotoAsset = await helper.createAsset(displayName);
            let newCount: number = await getAllPhotoCount(testNum);
            expect(newCount - oldCount).assertEqual(0);
            await makePendingCallbackToPromise(testNum, photoAsset, true);
            newCount = await getAllPhotoCount(testNum);
            expect(newCount - oldCount).assertEqual(0);
            let fd: number = await photoAsset.open('rw');
            await fs.write(fd, '123');
            await makePendingCallbackToPromise(testNum, photoAsset, false);
            newCount = await getAllPhotoCount(testNum);
            expect(newCount - oldCount).assertEqual(1);
            await photoAsset.close(fd);
            newCount = await getAllPhotoCount(testNum);
            expect(newCount - oldCount).assertEqual(1);
            done();
          } catch (error) {
            console.info(`${testNum} failed; error: ${error}`);
            expect(false).assertTrue();
            done();
          }
        })

        /**
        * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_SETPENDING_0600
        * @tc.name      : setPending_callback_006
        * @tc.desc      : setPending true and false with asset pending_time = 0
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('setPending_callback_006', 0, async function (done) {
          // setPending(true) and setPending(false) to created file
          const testNum = 'setPending_callback_006';
          let photoAsset: photoAccessHelper.PhotoAsset = undefined
          try {
            let fetchColumn = {
              fetchColumns: [],
              predicates: new dataSharePredicates.DataSharePredicates()
            };
            let fetchResult = await helper.getAssets(fetchColumn);
            photoAsset = await fetchResult.getFirstObject();
            if (photoAsset === undefined) {
              console.info(`${testNum} failed; Can not getAsset`);
              expect(false).assertTrue();
              done();
              return;
            }
          } catch (error) {
            console.info(`${testNum} failed; error: ${error}`);
            expect(false).assertTrue();
            done();
            return;
          }
          try {
            // @ts-ignore
            photoAsset.setPending(true, (err) => {
              if (err === undefined) {
                console.info(`${testNum} can not find err`);
                expect(false).assertTrue();
                done();
                return;
              }
              expect(true).assertTrue();
            });
          } catch (error) {
            expect(true).assertTrue();
          }
          try {
            // @ts-ignore
            photoAsset.setPending(false, (err) => {
              if (err !== undefined) {
                console.info(`${testNum} failed; error: ${err}`);
                expect(false).assertTrue();
                done();
                return;
              }
              expect(true).assertTrue();
            });
          } catch (error) {
            console.info(`${testNum} failed; error: ${error}`);
            expect(false).assertTrue();
            done();
          }
          done();
        })

        /**
        * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_SETPENDING_0000
        * @tc.name      : setPending_promise_000
        * @tc.desc      : setPending true and setPending false success
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
        it('setPending_promise_000', 0, async function (done) {
          // normal setPending(true) and setPending(false) during create
          const testNum = 'setPending_promise_000';
          const pendingStatus = true;
          await setPendingPromiseTest(done, testNum, pendingStatus);
        });

        /**
        * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_SETPENDING_0100
        * @tc.name      : setPending_promise_001
        * @tc.desc      : setPending false without setPending true failed
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('setPending_promise_001', 0, async function (done) {
          // setPending(false) with never setPending(true)
          const testNum = 'setPending_promise_001';
          const pendingStatus = false;
          await setPendingAbnormalPromiseTest(done, testNum, pendingStatus);
        });

        /**
        * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_SETPENDING_0200
        * @tc.name      : setPending_promise_002
        * @tc.desc      : setPending undefined
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('setPending_promise_002', 0, async function (done) {
          // setPending(undefined)
          const testNum = 'setPending_promise_002';
          const pendingStatus = undefined;
          await setPendingAbnormalPromiseTest(done, testNum, pendingStatus);
        });

        /**
        * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_SETPENDING_0300
        * @tc.name      : setPending_promise_003
        * @tc.desc      : setPending true after write and setPending false after close
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
        it('setPending_promise_003', 0, async function (done) {
          // create -> open -> write -> pending(true) -> close -> pending(false)
          const testNum = 'setPending_promise_003';
          const displayName: string = '123.jpg';
          try {
            let oldCount: number = await getAllPhotoCount(testNum);
            let photoAsset: photoAccessHelper.PhotoAsset = await helper.createAsset(displayName);
            let newCount: number = await getAllPhotoCount(testNum);
            expect(newCount - oldCount).assertEqual(0);
            let fd: number = await photoAsset.open('rw');
            await fs.write(fd, '123');
            // @ts-ignore
            await photoAsset.setPending(true);
            newCount = await getAllPhotoCount(testNum);
            expect(newCount - oldCount).assertEqual(0);
            await photoAsset.close(fd);
            newCount = await getAllPhotoCount(testNum);
            expect(newCount - oldCount).assertEqual(0);
            // @ts-ignore
            await photoAsset.setPending(false);
            newCount = await getAllPhotoCount(testNum);
            expect(newCount - oldCount).assertEqual(1);
            done();
          } catch (error) {
            console.info(`${testNum} failed; error: ${error}`);
            expect(false).assertTrue();
            done();
          }
        });

        /**
        * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_SETPENDING_0400
        * @tc.name      : setPending_promise_004
        * @tc.desc      : setPending true after create and setPending false after close
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
        it('setPending_promise_004', 0, async function (done) {
          // create -> pending(true) -> open -> write -> close -> pending(false)
          const testNum = 'setPending_promise_004';
          const displayName: string = '123.jpg';
          try {
            let oldCount: number = await getAllPhotoCount(testNum);
            let photoAsset: photoAccessHelper.PhotoAsset = await helper.createAsset(displayName);
            let newCount: number = await getAllPhotoCount(testNum);
            expect(newCount - oldCount).assertEqual(0);
            // @ts-ignore
            await photoAsset.setPending(true);
            newCount = await getAllPhotoCount(testNum);
            expect(newCount - oldCount).assertEqual(0);
            let fd: number = await photoAsset.open('rw');
            await fs.write(fd, '123');
            await photoAsset.close(fd);
            newCount = await getAllPhotoCount(testNum);
            expect(newCount - oldCount).assertEqual(0);
            // @ts-ignore
            await photoAsset.setPending(false);
            newCount = await getAllPhotoCount(testNum);
            expect(newCount - oldCount).assertEqual(1);
            done();
          } catch (error) {
            console.info(`${testNum} failed; error: ${error}`);
            expect(false).assertTrue();
            done();
          }
        })

        /**
        * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_SETPENDING_0500
        * @tc.name      : setPending_promise_005
        * @tc.desc      : setPending true after create and setPending false before close
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 0
        */
        it('setPending_promise_005', 0, async function (done) {
          // create -> pending(true) -> open -> write -> pending(false) -> close
          const testNum = 'setPending_promise_005';
          const displayName: string = '123.jpg';
          try {
            let oldCount: number = await getAllPhotoCount(testNum);
            let photoAsset: photoAccessHelper.PhotoAsset = await helper.createAsset(displayName);
            let newCount: number = await getAllPhotoCount(testNum);
            expect(newCount - oldCount).assertEqual(0);
            // @ts-ignore
            await photoAsset.setPending(true);
            newCount = await getAllPhotoCount(testNum);
            expect(newCount - oldCount).assertEqual(0);
            let fd: number = await photoAsset.open('rw');
            await fs.write(fd, '123');
            // @ts-ignore
            await photoAsset.setPending(false);
            newCount = await getAllPhotoCount(testNum);
            expect(newCount - oldCount).assertEqual(1);
            await photoAsset.close(fd);
            newCount = await getAllPhotoCount(testNum);
            expect(newCount - oldCount).assertEqual(1);
            done();
          } catch (error) {
            console.info(`${testNum} failed; error: ${error}`);
            expect(false).assertTrue();
            done();
          }
        })

        /**
        * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_SETPENDING_0600
        * @tc.name      : setPending_promise_006
        * @tc.desc      : setPending true and false with asset pending_time = 0
        * @tc.size      : MEDIUM
        * @tc.type      : Function
        * @tc.level     : Level 2
        */
        it('setPending_promise_006', 0, async function (done) {
          // setPending(true) and setPending(false) to created file
          const testNum = 'setPending_promise_006';
          let photoAsset: photoAccessHelper.PhotoAsset = undefined
          try {
            let fetchColumn = {
              fetchColumns: [],
              predicates: new dataSharePredicates.DataSharePredicates()
            };
            let fetchResult = await helper.getAssets(fetchColumn);
            photoAsset = await fetchResult.getFirstObject();
            if (photoAsset === undefined) {
              console.info(`${testNum} failed; Can not getAsset`);
              expect(false).assertTrue();
              done();
              return;
            }
          } catch (error) {
            console.info(`${testNum} failed; error: ${error}`);
            expect(false).assertTrue();
            done();
            return;
          }
          try {
            // @ts-ignore
            await photoAsset.setPending(true);
            console.info(`${testNum} can not find err`);
            expect(false).assertTrue();
            done();
            return;
          } catch (error) {
            expect(true).assertTrue();
          }
          try {
            // @ts-ignore
            await photoAsset.setPending(false);
            expect(true).assertTrue();
          } catch (error) {
            console.info(`${testNum} failed; error: ${error}`);
            expect(false).assertTrue();
            done();
          }
          done();
        })
    })
}