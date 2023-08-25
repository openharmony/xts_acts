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

import { describe, beforeAll, it, expect } from 'deccjsunit/index'
import {
  photoKeys,
  photoFetchOption,
  getFileAsset,
  getPermission,
} from '../../../../../../common'

export default function setUserCommentTest () {
  describe('setUserCommentTest', function () {

    beforeAll(async function () {
      console.info('beforeAll case')
      await getPermission()
    })

    async function setUserCommentCallback (done, testNum, fetchOps, userComment) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        asset.setUserComment(userComment, async (err) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              const newAsset = await getFileAsset(testNum, fetchOps);
              const key = photoKeys.USER_COMMENT;
              const curUserComment: string = newAsset.get(key).toString();
              console.info(`${testNum} curUserComment: ${curUserComment}`);
              expect(curUserComment).assertEqual(userComment);
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }
    
    async function setUserCommentAbnormalCallback (done, testNum, fetchOps, userComment) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        asset.setUserComment(userComment, async (err) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} err: ${err}`);
            } else {
              expect(false).assertTrue();
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        done();
      }
    }

    async function setUserCommentPromise (done, testNum, fetchOps, userComment) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        await asset.setUserComment(userComment);
        const newAsset = await getFileAsset(testNum, fetchOps);
        const key = photoKeys.USER_COMMENT;
        const curUserComment: string = newAsset.get(key).toString();
        console.info(`${testNum} curUserComment: ${curUserComment}`);
        expect(curUserComment).assertEqual(userComment);
        done()
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function setUserCommentAbnormalPromise (done, testNum, fetchOps, userComment) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        await asset.setUserComment(userComment);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        done();
      }
    }

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_SET_USER_COMMENT_0000
     * @tc.name      : setUserComment_callback_000
     * @tc.desc      : userComment is string('setUserComment_callback_000'), query by get
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setUserComment_callback_000', 0, async function (done) {
      const testNum = 'setUserComment_callback_000';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'userCommentCb01.jpg');
      const userComment = testNum;
      await setUserCommentCallback(done, testNum, fetchOps, userComment);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_SET_USER_COMMENT_0100
     * @tc.name      : setUserComment_callback_001
     * @tc.desc      : userComment is string('')
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('setUserComment_callback_001', 2, async function (done) {
      const testNum = 'setUserComment_callback_001';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'userCommentCb02.jpg');
      const userComment = '';
      await setUserCommentCallback(done, testNum, fetchOps, userComment);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_SET_USER_COMMENT_0200
     * @tc.name      : setUserComment_callback_002
     * @tc.desc      : userComment is undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('setUserComment_callback_002', 2, async function (done) {
      const testNum = 'setUserComment_callback_002';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'userCommentCb03.jpg');
      const userComment = undefined;
      await setUserCommentAbnormalCallback(done, testNum, fetchOps, userComment);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_SET_USER_COMMENT_0300
     * @tc.name      : setUserComment_callback_003
     * @tc.desc      : userComment is number(123)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('setUserComment_callback_003', 2, async function (done) {
      const testNum = 'setUserComment_callback_003';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'userCommentCb04.jpg');
      const userComment = 123;
      await setUserCommentAbnormalCallback(done, testNum, fetchOps, userComment);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_SET_USER_COMMENT_0400
     * @tc.name      : setUserComment_callback_004
     * @tc.desc      : userComment is string('aaa...aaa'(141))
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('setUserComment_callback_004', 2, async function (done) {
      const testNum = 'setUserComment_callback_004';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'userCommentCb05.jpg');
      let userComment = '';
      for (let i = 0; i < 141; i++) {
        userComment += 'a';
      }
      await setUserCommentAbnormalCallback(done, testNum, fetchOps, userComment);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_SET_USER_COMMENT_0500
     * @tc.name      : setUserComment_callback_005
     * @tc.desc      : userComment is string('setUserComment_callback_005'), query by getExif
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('setUserComment_callback_005', 2, async function (done) {
      const testNum = 'setUserComment_callback_005';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'userCommentCb06.jpg');
      const userComment = testNum;
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        asset.setUserComment(userComment, async (err) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              const newAsset = await getFileAsset(testNum, fetchOps);
              const result = await newAsset.getExif();
              const msg = JSON.parse(result);
              console.info(`${testNum} curUserComment: ${msg.UserComment}`);
              expect(msg.UserComment).assertEqual(userComment);
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_SET_USER_COMMENT_0000
     * @tc.name      : setUserComment_promise_000
     * @tc.desc      : userComment is string('setUserComment_promise_000'), query by get
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setUserComment_promise_000', 0, async function (done) {
      const testNum = 'setUserComment_promise_000';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'userCommentPro01.jpg');
      const userComment = testNum;
      await setUserCommentPromise(done, testNum, fetchOps, userComment);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_SET_USER_COMMENT_0100
     * @tc.name      : setUserComment_promise_001
     * @tc.desc      : userComment is string('')
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('setUserComment_promise_001', 2, async function (done) {
      const testNum = 'setUserComment_promise_001';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'userCommentPro02.jpg');
      const userComment = '';
      await setUserCommentPromise(done, testNum, fetchOps, userComment);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_SET_USER_COMMENT_0200
     * @tc.name      : setUserComment_promise_002
     * @tc.desc      : userComment is undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('setUserComment_promise_002', 2, async function (done) {
      const testNum = 'setUserComment_promise_002';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'userCommentPro03.jpg');
      const userComment = undefined;
      await setUserCommentAbnormalPromise(done, testNum, fetchOps, userComment);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_SET_USER_COMMENT_0300
     * @tc.name      : setUserComment_promise_003
     * @tc.desc      : userComment is number(123)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('setUserComment_promise_003', 2, async function (done) {
      const testNum = 'setUserComment_promise_003';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'userCommentPro04.jpg');
      const userComment = 123;
      await setUserCommentAbnormalPromise(done, testNum, fetchOps, userComment);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_SET_USER_COMMENT_0400
     * @tc.name      : setUserComment_promise_004
     * @tc.desc      : userComment is string('bbb...bbb'(141))
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('setUserComment_promise_004', 2, async function (done) {
      const testNum = 'setUserComment_promise_004';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'userCommentPro05.jpg');
      let userComment = '';
      for (let i = 0; i < 141; i++) {
        userComment += 'b';
      }
      await setUserCommentAbnormalPromise(done, testNum, fetchOps, userComment);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_SET_USER_COMMENT_0500
     * @tc.name      : setUserComment_promise_005
     * @tc.desc      : userComment is string('setUserComment_promise_005'), query by getExif
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('setUserComment_promise_005', 2, async function (done) {
      const testNum = 'setUserComment_promise_005';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'userCommentPro06.jpg');
      const userComment = testNum;
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        await asset.setUserComment(userComment);
        const newAsset = await getFileAsset(testNum, fetchOps);
        const result = await newAsset.getExif();
        const msg = JSON.parse(result);
        console.info(`${testNum} curUserComment: ${msg.UserComment}`);
        expect(msg.UserComment).assertEqual(userComment);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}
