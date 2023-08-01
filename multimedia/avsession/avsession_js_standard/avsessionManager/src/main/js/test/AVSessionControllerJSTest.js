/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import avSession from '@ohos.multimedia.avsession';
import featureAbility from '@ohos.ability.featureAbility';
//import image from '@ohos.multimedia.image';
//import resourceManager from '@ohos.resourceManager';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';


const TAG = "[AVSessionControllerJSTest]";
export default function AVSessionControllerJsTest() {
  describe("AVSessionControllerJsTest", function () {
    let session = null;
    let controller = null;
    let receivedCallback = false;
    let receivedCallback2 = false;
    let receivedString = null;
    let receivedString2 = null;
    let receivedParam = null;
    let receivedParam2 = null;
    let receivedExtras = null;
    let receivedExtras2 = null;
    const INVALID_STRING = "invalid string";
    const UPDATE_LYRICS_EVENT = "dynamic_lyrics";
    const UPDATE_LYRICS_WANT_PARAMS = {
      lyrics: "This is my lyrics"
    };
    const COMMON_COMMAND_STRING = "common_command";
    const COMMON_COMMAND_PARAMS = {
      command: "This is my command"
    };
    const CUSTOM_EXTRAS = {
      extrasKey: "This is custom media packet"
    };
    const QUEUE_ITEM_ID = 666;
    const QUEUE_ITEM_LENGTH = 1;
    const QUEUE_ITEM_KEY_WORD = "QUEUE_ITEM_RELATE";
    const EXTRAS = {
      "items_author": "name"
    };
    const QUEUE_ITEM_DESCRIPTION = {
      mediaId: QUEUE_ITEM_KEY_WORD,
      title: QUEUE_ITEM_KEY_WORD,
      extras: EXTRAS,
      iconUri: "iconUri",
      mediaSize: 10,
      albumTitle: "albumTitle",
      albumCoverUri: "albumCoverUri",
      lyricContent: "lyricContent",
      lyricUri: "lyricUri",
      mediaUri: "mediaUri",
      startPosition: 0,
      creditsPosition: 0,
      appName: "appName"
    };
    const QUEUE_ITEM_DESCRIPTION_ERROR = {
      mediaId: QUEUE_ITEM_KEY_WORD,
      title: QUEUE_ITEM_KEY_WORD,
      extras: EXTRAS,
      icon: undefined,
      iconUri: "iconUri",
      mediaSize: 10,
      albumTitle: "albumTitle",
      albumCoverUri: "albumCoverUri",
      lyricContent: "lyricContent",
      lyricUri: "lyricUri",
      mediaUri: "mediaUri",
      startPosition: 0,
      creditsPosition: 0,
      appName: "appName"
    };
    const QUEUE_ITEM = {
      itemId: QUEUE_ITEM_ID,
      description: QUEUE_ITEM_DESCRIPTION
    }
    const QUEUE_ITEM_ERROR = {
      itemId: QUEUE_ITEM_ID,
      description: QUEUE_ITEM_DESCRIPTION_ERROR
    }
    const ITEMS_ARRAY = [QUEUE_ITEM];
    const ITEMS_ARRAY_ERROR = [QUEUE_ITEM_ERROR];
    const QUEUE_TITLE = "title";
    const SKIP_ITEM_ID = 200;



    beforeAll(async function () {
      session = await avSession.createAVSession(featureAbility.getContext(), "AVSessionDemo", 'audio').catch((err) => {
        console.error(TAG + "Create AVSession error " + JSON.stringify(err));
        expect().assertFail();
      });
      session.activate();

      controller = await session.getController();

      console.info(TAG + "Create session and controller finished, beforeAll called");
    })

    afterAll(function () {
      controller.destroy();
      session.destroy();
      console.info(TAG + 'afterAll called');
    })

    beforeEach(function () {
      console.info(TAG + 'beforeEach called');
    })

    afterEach(function () {
      console.info(TAG + 'afterEach called');
    })

    function sleep(time) {
      return new Promise((resolve) => setTimeout(resolve, time));
    }

    function dynamicLyricsCallback1(sessionEvent, args) {
      console.log(TAG + "Callback1 received event: " + JSON.stringify(sessionEvent));
      console.log(TAG + "Callback1 received args: " + JSON.stringify(args));
      if (sessionEvent != UPDATE_LYRICS_EVENT) {
        console.error(TAG + "Callback1 lyrics event unmatch");
        expect().assertFail();
      }
      receivedCallback = true;
      receivedString = sessionEvent;
      receivedParam = args;
    }

    function dynamicLyricsCallback2(sessionEvent, args) {
      console.log(TAG + "Callback2 received event: " + JSON.stringify(sessionEvent));
      console.log(TAG + "Callback2 received args: " + JSON.stringify(args));
      if (sessionEvent != UPDATE_LYRICS_EVENT) {
        console.error(TAG + "Callback2 lyrics event unmatch");
        expect().assertFail();
      }
      receivedCallback2 = true;
      receivedString2 = sessionEvent;
      receivedParam2 = args;
    }

    function extrasChangeCallback1(extras) {
      console.log(TAG + "Callback1 received args: " + JSON.stringify(extras));
      if (extras.extrasKey != CUSTOM_EXTRAS.extrasKey) {
        console.error(TAG + "Callback1 extras unmatch");
        expect().assertFail();
      }
      receivedCallback = true;
      receivedExtras = extras;
    }

    function extrasChangeCallback2(extras) {
      console.log(TAG + "Callback2 received args: " + JSON.stringify(extras));
      if (extras.extrasKey != CUSTOM_EXTRAS.extrasKey) {
        console.error(TAG + "Callback2 extras unmatch");
        expect().assertFail();
      }
      receivedCallback2 = true;
      receivedExtras2 = extras;
    }

    function queueTitleCallback1(title) {
      console.log(TAG + "queueTitleCallback1 received Title " + JSON.stringify(title));
      if (title != QUEUE_TITLE) {
        console.error(TAG + "queueTitleCallback1 received Title unmatch");
        expect().assertFail();
      }
      receivedCallback = true;
    }

    function queueTitleCallback2(title) {
      console.log(TAG + "queueTitleCallback2 received Title " + JSON.stringify(title));
      if (title != QUEUE_TITLE) {
        console.error(TAG + "queueTitleCallback2 received Title unmatch");
        expect().assertFail();
      }
      receivedCallback2 = true;
    }

    function queueItemsCallback1(items) {
      console.log(TAG + "queueItemsCallback1 received items length: " + items.length);
      console.log(TAG + "queueItemsCallback1 received items id: " + items[0].itemId);
      console.log(TAG + "queueItemsCallback1 received items title: " + items[0].description.title);
      if (items.length != QUEUE_ITEM_LENGTH) {
        console.error(TAG + "queueItemsCallback1 received items length unmatch");
        expect().assertFail();
        return;
      }
      if (items[0].itemId != QUEUE_ITEM_ID) {
        console.error(TAG + "queueItemsCallback1 received items id unmatch");
        expect().assertFail();
        return;
      }
      if (items[0].description.title != QUEUE_ITEM_KEY_WORD) {
        console.error(TAG + "queueItemsCallback1 received items key word unmatch");
        expect().assertFail();
        return;
      }
      receivedCallback = true;
    }

    function queueItemsCallback2(items) {
      console.log(TAG + "queueItemsCallback2 received items length: " + items.length);
      console.log(TAG + "queueItemsCallback2 received items id: " + items[0].itemId);
      console.log(TAG + "queueItemsCallback2 received items title: " + items[0].description.title);
      if (items.length != QUEUE_ITEM_LENGTH) {
        console.error(TAG + "queueItemsCallback2 received items length unmatch");
        expect().assertFail();
        return;
      }
      if (items[0].itemId != QUEUE_ITEM_ID) {
        console.error(TAG + "queueItemsCallback2 received items id unmatch");
        expect().assertFail();
        return;
      }
      if (items[0].description.title != QUEUE_ITEM_KEY_WORD) {
        console.error(TAG + "queueItemsCallback2 received items key word unmatch");
        expect().assertFail();
        return;
      }
      receivedCallback2 = true;
    }

    function skipToQueueItemCallback1(itemId) {
      console.log(TAG + "skipToQueueItemCallback1 received itemid " + itemId);
      if (itemId != SKIP_ITEM_ID) {
        console.error(TAG + "skipToQueueItemCallback1 received uid unmatch");
        expect().assertFail();
      }
      receivedCallback = true;
    }

    function skipToQueueItemCallback2(itemId) {
      console.log(TAG + "skipToQueueItemCallback2 received itemid " + itemId);
      if (itemId != SKIP_ITEM_ID) {
        console.error(TAG + "skipToQueueItemCallback2 received uid unmatch");
        expect().assertFail();
      }
      receivedCallback2 = true;
    }

    /*
   * @tc.name:SUB_MULTIMEDIA_ONSESSIONEVENT_0100
   * @tc.desc:One on function - lyrics session event
   * @tc.type: FUNC
   * @tc.require: I6C6IN
   */
    it("SUB_MULTIMEDIA_ONSESSIONEVENT_0100", 0, async function (done) {
      controller.on('sessionEvent', dynamicLyricsCallback1);
      await session.dispatchSessionEvent(UPDATE_LYRICS_EVENT, UPDATE_LYRICS_WANT_PARAMS).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_ONSESSIONEVENT_0100 error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      sleep(200).then(() => {
        if (receivedCallback) {
          console.log(TAG + "SUB_MULTIMEDIA_ONSESSIONEVENT_0100 Received session event change event");
          expect(receivedString == UPDATE_LYRICS_EVENT).assertTrue();
          expect(receivedParam.lyrics == UPDATE_LYRICS_WANT_PARAMS.lyrics).assertTrue();
        } else {
          console.error(TAG + "SUB_MULTIMEDIA_ONSESSIONEVENT_0100 Session event change event not received");
          expect().assertFail();
        }
        receivedCallback = false;
        receivedString = null;
        receivedParam = null;
        done();
      })
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_ONSESSIONEVENT_0200
   * @tc.desc:Two on functions - lyrics session event
   * @tc.type: FUNC
   * @tc.require: I6C6IN
   */
    it("SUB_MULTIMEDIA_ONSESSIONEVENT_0200", 0, async function (done) {
      controller.on('sessionEvent', dynamicLyricsCallback1);
      controller.on('sessionEvent', dynamicLyricsCallback2);
      await session.dispatchSessionEvent(UPDATE_LYRICS_EVENT, UPDATE_LYRICS_WANT_PARAMS).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_ONSESSIONEVENT_0200 Set session event error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(200);
      if (receivedCallback && receivedCallback2) {
        console.log(TAG + "SUB_MULTIMEDIA_ONSESSIONEVENT_0200 Received session event change event");
        expect(receivedString == UPDATE_LYRICS_EVENT).assertTrue();
        expect(receivedParam.lyrics == UPDATE_LYRICS_WANT_PARAMS.lyrics).assertTrue();
        expect(receivedString2 == UPDATE_LYRICS_EVENT).assertTrue();
        expect(receivedParam2.lyrics == UPDATE_LYRICS_WANT_PARAMS.lyrics).assertTrue();
        expect(true).assertTrue();
      } else {
        console.error(TAG + "SUB_MULTIMEDIA_ONSESSIONEVENT_0200 Session event change event not received");
        expect().assertFail();
      }
      receivedCallback = false;
      receivedCallback2 = false;
      receivedString2 = null;
      receivedParam2 = null;
      receivedString2 = null;
      receivedParam2 = null;
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_ONSESSIONEVENT_0300
   * @tc.desc:One on functions - one param
   * @tc.type: FUNC
   * @tc.require: I6C6IN
   */
    it("SUB_MULTIMEDIA_ONSESSIONEVENT_0300", 0, async function (done) {
      try {
        controller.on('sessionEvent');
      } catch (err) {
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_ONSESSIONEVENT_0400
   * @tc.desc:One on functions - three params
   * @tc.type: FUNC
   * @tc.require: I6C6IN
   */
    it("SUB_MULTIMEDIA_ONSESSIONEVENT_0400", 0, async function (done) {
      try {
        controller.on('sessionEvent', dynamicLyricsCallback1, dynamicLyricsCallback2);
      } catch (err) {
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_ONSESSIONEVENT_0500
   * @tc.desc:One on functions - invalid type
   * @tc.type: FUNC
   * @tc.require: I6C6IN
   */
    it("SUB_MULTIMEDIA_ONSESSIONEVENT_0500", 0, async function (done) {
      try {
        controller.on('sessionEvent', INVALID_STRING);
      } catch (err) {
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_OFFSESSIONEVENT_0100
   * @tc.desc:Two on functions and one off function - lyrics session event
   * @tc.type: FUNC
   * @tc.require: I6C6IN
   */
    it("SUB_MULTIMEDIA_OFFSESSIONEVENT_0100", 0, async function (done) {
      controller.on('sessionEvent', dynamicLyricsCallback1);
      controller.on('sessionEvent', dynamicLyricsCallback2);
      controller.off('sessionEvent', dynamicLyricsCallback2);
      await session.dispatchSessionEvent(UPDATE_LYRICS_EVENT, UPDATE_LYRICS_WANT_PARAMS).catch((err) => {
        console.error(TAG + "Set session event error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(200);
      if (receivedCallback && !receivedCallback2) {
        console.log(TAG + "Received session event change event");
        expect(receivedString == UPDATE_LYRICS_EVENT).assertTrue();
        expect(receivedParam.lyrics == UPDATE_LYRICS_WANT_PARAMS.lyrics).assertTrue();
        expect(true).assertTrue();
      } else {
        console.error(TAG + "Session event change event not received");
        expect().assertFail();
      }
      receivedCallback = false;
      receivedString = null;
      receivedParam = null;
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_OFFSESSIONEVENT_0200
   * @tc.desc:Two on functions and two off function - lyrics session event
   * @tc.type: FUNC
   * @tc.require: I6C6IN
   */
    it("SUB_MULTIMEDIA_OFFSESSIONEVENT_0200", 0, async function (done) {
      controller.on('sessionEvent', dynamicLyricsCallback1);
      controller.on('sessionEvent', dynamicLyricsCallback2);
      controller.off('sessionEvent', dynamicLyricsCallback1);
      controller.off('sessionEvent', dynamicLyricsCallback2);

      await session.dispatchSessionEvent(UPDATE_LYRICS_EVENT, UPDATE_LYRICS_WANT_PARAMS).catch((err) => {
        console.error(TAG + "Set session event error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(200);
      if (!receivedCallback && !receivedCallback2) {
        console.log(TAG + "Received session event change event");
        expect(true).assertTrue();
      } else {
        console.error(TAG + "Session event change event not received");
        expect().assertFail();
      }
      receivedCallback = false;
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_OFFSESSIONEVENT_0300
   * @tc.desc:Two on functions and off all function - lyrics session event
   * @tc.type: FUNC
   * @tc.require: I6C6IN
   */
    it("SUB_MULTIMEDIA_OFFSESSIONEVENT_0300", 0, async function (done) {
      controller.on('sessionEvent', dynamicLyricsCallback1);
      controller.on('sessionEvent', dynamicLyricsCallback2);
      controller.off('sessionEvent');

      await session.dispatchSessionEvent(UPDATE_LYRICS_EVENT, UPDATE_LYRICS_WANT_PARAMS).catch((err) => {
        console.error(TAG + "Set session event error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(200);
      if (!receivedCallback && !receivedCallback2) {
        console.log(TAG + "Received session event change event");
        expect(true).assertTrue();
      } else {
        console.error(TAG + "Session event change event not received");
        expect().assertFail();
      }
      receivedCallback = false;
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_OFFSESSIONEVENT_0400
   * @tc.desc:Two on functions and off function - three params
   * @tc.type: FUNC
   * @tc.require: I6C6IN
   */
    it("SUB_MULTIMEDIA_OFFSESSIONEVENT_0400", 0, async function (done) {
      try {
        controller.on('sessionEvent', dynamicLyricsCallback1);
        controller.on('sessionEvent', dynamicLyricsCallback2);
        controller.off('sessionEvent', dynamicLyricsCallback1, dynamicLyricsCallback2);
      } catch (err) {
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_OFFSESSIONEVENT_0500
   * @tc.desc:One on functions and off all function - invalid type
   * @tc.type: FUNC
   * @tc.require: I6C6IN
   */
    it("SUB_MULTIMEDIA_OFFSESSIONEVENT_0500", 0, async function (done) {
      try {
        controller.on('sessionEvent', dynamicLyricsCallback1);
        controller.off('sessionEvent', INVALID_STRING);
      } catch (err) {
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_SENDCOMMONCOMMAND_0100
   * @tc.desc:Send common command - callback
   * @tc.type: FUNC
   * @tc.require: I6ETY6
   */
    it("SUB_MULTIMEDIA_SENDCOMMONCOMMAND_0100", 0, async function (done) {
      controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS, (err) => {
        if (err) {
          console.error(TAG + "SUB_MULTIMEDIA_SENDCOMMONCOMMAND_0100 error " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
        console.info(TAG + "SUB_MULTIMEDIA_SENDCOMMONCOMMAND_0100 finished");
        expect(true).assertTrue();
        done();
      });
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_SENDCOMMONCOMMAND_0200
   * @tc.desc:Send common command - promise
   * @tc.type: FUNC
   * @tc.require: I6ETY6
   */
    it("SUB_MULTIMEDIA_SENDCOMMONCOMMAND_0200", 0, async function (done) {
      await controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_SENDCOMMONCOMMAND_0200 error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info(TAG + "SUB_MULTIMEDIA_SENDCOMMONCOMMAND_0200 finished");
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_SENDCOMMONCOMMAND_0300
   * @tc.desc:Set common command - one param
   * @tc.type: FUNC
   * @tc.require: I6ETY6
   */
    it("SUB_MULTIMEDIA_SENDCOMMONCOMMAND_0300", 0, async function (done) {
      let errCode = 0;
      await controller.sendCommonCommand(COMMON_COMMAND_STRING).catch((err) => {
        console.info(TAG + "SUB_MULTIMEDIA_SENDCOMMONCOMMAND_0300 caught error" + err.code);
        errCode = err.code;
      });
      sleep(200).then(() => {
        expect(errCode == 401).assertTrue();
        done();
      })
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_SENDCOMMONCOMMAND_0400
   * @tc.desc:Send common command - invalid params
   * @tc.type: FUNC
   * @tc.require: I6ETY6
   */
    it("SUB_MULTIMEDIA_SENDCOMMONCOMMAND_0400", 0, async function (done) {
      let errCode = 0;
      await controller.sendCommonCommand(COMMON_COMMAND_PARAMS, COMMON_COMMAND_PARAMS).catch((err) => {
        console.info(TAG + "SUB_MULTIMEDIA_SENDCOMMONCOMMAND_0400 caught error" + err.code);
        errCode = err.code;
      });
      sleep(200).then(() => {
        expect(errCode == 401).assertTrue();
        done();
      })
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_SENDCOMMONCOMMAND_0500
   * @tc.desc:Send common command - deactive
   * @tc.type: FUNC
   * @tc.require: I6ETY6
   */
    it("SUB_MULTIMEDIA_SENDCOMMONCOMMAND_0500", 0, async function (done) {
      try {
        session.deactivate(async () => {
          await controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS);
        });
      } catch (err) {
        expect(err.code == 6600106).assertTrue();
      }
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_GETEXTRAS_0100
   * @tc.desc:Get extras - callback
   * @tc.type: FUNC
   * @tc.require: I6TD43
   */
    it("SUB_MULTIMEDIA_GETEXTRAS_0100", 0, async function (done) {
      console.info(TAG + "SUB_MULTIMEDIA_GETEXTRAS_0100 start");
      await session.setExtras(CUSTOM_EXTRAS).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_GETEXTRAS_0100 error " + JSON.stringify(err));
        expect().assertFail();
      });

      controller.getExtras((err, extras) => {
        if (err) {
          console.error(TAG + "SUB_MULTIMEDIA_GETEXTRAS_0100 error " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
        expect(extras.extrasKey == CUSTOM_EXTRAS.extrasKey).assertTrue();
        console.info(TAG + "SUB_MULTIMEDIA_GETEXTRAS_0100 finished");
        done();
      });
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_GETEXTRAS_0200
   * @tc.desc:Get extras - promise
   * @tc.type: FUNC
   * @tc.require: I6TD43
   */
    it("SUB_MULTIMEDIA_GETEXTRAS_0200", 0, async function (done) {
      console.info(TAG + "SUB_MULTIMEDIA_GETEXTRAS_0200 start");
      await session.setExtras(CUSTOM_EXTRAS).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_GETEXTRAS_0200 error " + JSON.stringify(err));
        expect().assertFail();
      });

      let extras = await controller.getExtras().catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_GETEXTRAS_0200 error " + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(extras.extrasKey == CUSTOM_EXTRAS.extrasKey).assertTrue();
      console.info(TAG + "SUB_MULTIMEDIA_GETEXTRAS_0200 finished");
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_ONEXTRASCHANGE_0100
   * @tc.desc:One on function - extras change
   * @tc.type: FUNC
   * @tc.require: I6TD43
   */
    it("SUB_MULTIMEDIA_ONEXTRASCHANGE_0100", 0, async function (done) {
      console.info(TAG + "SUB_MULTIMEDIA_ONEXTRASCHANGE_0100 start");
      controller.on('extrasChange', extrasChangeCallback1);
      await session.setExtras(CUSTOM_EXTRAS).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_ONEXTRASCHANGE_0100 error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      sleep(200).then(() => {
        if (receivedCallback) {
          console.log(TAG + "Received extras change event");
          expect(receivedExtras.extrasKey == CUSTOM_EXTRAS.extrasKey).assertTrue();
        } else {
          console.error(TAG + "SUB_MULTIMEDIA_ONEXTRASCHANGE_0100 extras change event not received");
          expect().assertFail();
        }
        receivedCallback = false;
        receivedExtras = null;
        console.info(TAG + "SUB_MULTIMEDIA_ONEXTRASCHANGE_0100 finished");
        done();
      })
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_ONEXTRASCHANGE_0200
   * @tc.desc:Two on function - extras change
   * @tc.type: FUNC
   * @tc.require: I6TD43
   */
    it("SUB_MULTIMEDIA_ONEXTRASCHANGE_0200", 0, async function (done) {
      console.info(TAG + "SUB_MULTIMEDIA_ONEXTRASCHANGE_0200 start");
      controller.on('extrasChange', extrasChangeCallback1);
      controller.on('extrasChange', extrasChangeCallback2);
      await session.setExtras(CUSTOM_EXTRAS).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_ONEXTRASCHANGE_0200 error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      sleep(200).then(() => {
        if (receivedCallback && receivedCallback2) {
          console.log(TAG + "Received extras change event");
          expect(receivedExtras.extrasKey == CUSTOM_EXTRAS.extrasKey).assertTrue();
          expect(receivedExtras2.extrasKey == CUSTOM_EXTRAS.extrasKey).assertTrue();
        } else {
          console.error(TAG + "SUB_MULTIMEDIA_ONEXTRASCHANGE_0200 extras change event not received");
          expect().assertFail();
        }
        receivedCallback = false;
        receivedCallback2 = false;
        receivedExtras = null;
        receivedExtras2 = null;
        console.info(TAG + "SUB_MULTIMEDIA_ONEXTRASCHANGE_0200 finished");
        done();
      })
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_ONEXTRASCHANGE_0300
   * @tc.desc:One on functions - one param
   * @tc.type: FUNC
   * @tc.require: I6TD43
   */
    it("SUB_MULTIMEDIA_ONEXTRASCHANGE_0300", 0, async function (done) {
      try {
        controller.on('extrasChange');
      } catch (err) {
        expect(err.code == 401).assertTrue();
      }
      console.info(TAG + "SUB_MULTIMEDIA_ONEXTRASCHANGE_0300 finished");
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_ONEXTRASCHANGE_0400
   * @tc.desc:One on functions - three params
   * @tc.type: FUNC
   * @tc.require: I6TD43
   */
    it("SUB_MULTIMEDIA_ONEXTRASCHANGE_0400", 0, async function (done) {
      try {
        controller.on('extrasChange', extrasChangeCallback1, extrasChangeCallback2);
      } catch (err) {
        expect(err.code == 401).assertTrue();
      }
      console.info(TAG + "SUB_MULTIMEDIA_ONEXTRASCHANGE_0400 finished");
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_ONEXTRASCHANGE_0500
   * @tc.desc:One on functions - invalid type
   * @tc.type: FUNC
   * @tc.require: I6TD43
   */
    it("SUB_MULTIMEDIA_ONEXTRASCHANGE_0500", 0, async function (done) {
      try {
        controller.on('extrasChange', INVALID_STRING);
      } catch (err) {
        expect(err.code == 401).assertTrue();
      }
      console.info(TAG + "SUB_MULTIMEDIA_ONEXTRASCHANGE_0500 finished");
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_OFFEXTRASCHANGE_0100
   * @tc.desc:Two on functions and one off function - extras change
   * @tc.type: FUNC
   * @tc.require: I6TD43
   */
    it("SUB_MULTIMEDIA_OFFEXTRASCHANGE_0100", 0, async function (done) {
      controller.on('extrasChange', extrasChangeCallback1);
      controller.on('extrasChange', extrasChangeCallback2);
      controller.off('extrasChange', extrasChangeCallback2);
      await session.setExtras(CUSTOM_EXTRAS).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_OFFEXTRASCHANGE_0100 error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(200);
      if (receivedCallback && !receivedCallback2) {
        console.log(TAG + "Received extras change event");
        expect(receivedExtras.extrasKey == CUSTOM_EXTRAS.extrasKey).assertTrue();
        expect(true).assertTrue();
      } else {
        console.error(TAG + "SUB_MULTIMEDIA_OFFEXTRASCHANGE_0100 Extras change event not received");
        expect().assertFail();
      }
      receivedCallback = false;
      receivedExtras = null;
      console.info(TAG + "SUB_MULTIMEDIA_OFFEXTRASCHANGE_0100 finished");
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_OFFEXTRASCHANGE_0200
   * @tc.desc:Two on functions and two off function - extras change
   * @tc.type: FUNC
   * @tc.require: I6TD43
   */
    it("SUB_MULTIMEDIA_OFFEXTRASCHANGE_0200", 0, async function (done) {
      controller.on('extrasChange', extrasChangeCallback1);
      controller.on('extrasChange', extrasChangeCallback2);
      controller.off('extrasChange', extrasChangeCallback1);
      controller.off('extrasChange', extrasChangeCallback2);
      await session.setExtras(CUSTOM_EXTRAS).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_OFFEXTRASCHANGE_0200 error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(200);
      if (!receivedCallback && !receivedCallback2) {
        console.log(TAG + "SUB_MULTIMEDIA_OFFEXTRASCHANGE_0200 Success, not received extras change event");
        expect(true).assertTrue();
      } else {
        console.error(TAG + "SUB_MULTIMEDIA_OFFEXTRASCHANGE_0200 failed, extras change event received");
        expect().assertFail();
      }
      console.info(TAG + "SUB_MULTIMEDIA_OFFEXTRASCHANGE_0200 finished");
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_OFFEXTRASCHANGE_0300
   * @tc.desc:Two on functions and off all function - extras change
   * @tc.type: FUNC
   * @tc.require: I6TD43
   */
    it("SUB_MULTIMEDIA_OFFEXTRASCHANGE_0300", 0, async function (done) {
      controller.on('extrasChange', extrasChangeCallback1);
      controller.on('extrasChange', extrasChangeCallback2);
      controller.off('extrasChange');
      await session.setExtras(CUSTOM_EXTRAS).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_OFFEXTRASCHANGE_0300 error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(200);
      if (!receivedCallback && !receivedCallback2) {
        console.log(TAG + "SUB_MULTIMEDIA_OFFEXTRASCHANGE_0300Success, not received extras change event");
        expect(true).assertTrue();
      } else {
        console.error(TAG + "SUB_MULTIMEDIA_OFFEXTRASCHANGE_0300 failed, extras change event received");
        expect().assertFail();
      }
      console.info(TAG + "SUB_MULTIMEDIA_OFFEXTRASCHANGE_0300 finished");
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_OFFEXTRASCHANGE_0400
   * @tc.desc:Two on functions and off function - three params
   * @tc.type: FUNC
   * @tc.require: I6TD43
   */
    it("SUB_MULTIMEDIA_OFFEXTRASCHANGE_0400", 0, async function (done) {
      try {
        controller.on('extrasChange', extrasChangeCallback1);
        controller.on('extrasChange', extrasChangeCallback2);
        controller.off('extrasChange', extrasChangeCallback1, extrasChangeCallback2);
      } catch (err) {
        expect(err.code == 401).assertTrue();
      }
      console.info(TAG + "SUB_MULTIMEDIA_OFFEXTRASCHANGE_0400 finished");
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_OFFEXTRASCHANGE_0500
   * @tc.desc:One on functions and off all function - invalid type
   * @tc.type: FUNC
   * @tc.require: I6TD43
   */
    it("SUB_MULTIMEDIA_OFFEXTRASCHANGE_0500", 0, async function (done) {
      try {
        controller.on('extrasChange', extrasChangeCallback1);
        controller.off('extrasChange', INVALID_STRING);
      } catch (err) {
        expect(err.code == 401).assertTrue();
      }
      console.info(TAG + "SUB_MULTIMEDIA_OFFEXTRASCHANGE_0500 finished");
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_ONQUEUEITEMSCHANGE_0100
   * @tc.desc:One on function - queue items change
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_ONQUEUEITEMSCHANGE_0100", 0, async function (done) {
      controller.on('queueItemsChange', queueItemsCallback1);
      await session.setAVQueueItems(ITEMS_ARRAY).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_ONQUEUEITEMSCHANGE_0100 setAVQueueItems error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      sleep(200).then(() => {
        if (receivedCallback) {
          console.log(TAG + "SUB_MULTIMEDIA_ONQUEUEITEMSCHANGE_0100 Received queue items change");
          expect(true).assertTrue();
        } else {
          console.error(TAG + "SUB_MULTIMEDIA_ONQUEUEITEMSCHANGE_0100 Session queue items change  not received");
          expect().assertFail();
        }
        receivedCallback = false;
        done();
      });
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_ONQUEUEITEMSCHANGE_0200
   * @tc.desc:One on function - queue items change
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_ONQUEUEITEMSCHANGE_0200", 0, async function (done) {
      controller.on('queueItemsChange', queueItemsCallback1);
      controller.on('queueItemsChange', queueItemsCallback2);
      await session.setAVQueueItems(ITEMS_ARRAY).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_ONQUEUEITEMSCHANGE_0200 error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(200);
      if (receivedCallback && receivedCallback2) {
        console.log(TAG + "SUB_MULTIMEDIA_ONQUEUEITEMSCHANGE_0200 Received queue items change");
        expect(true).assertTrue();
      } else {
        console.error(TAG + "SUB_MULTIMEDIA_ONQUEUEITEMSCHANGE_0200 Session queue items change  not received");
        expect().assertFail();
      }
      receivedCallback = false;
      receivedCallback2 = false;
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_ONQUEUEITEMSCHANGE_0300
   * @tc.desc:One on functions - one param
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_ONQUEUEITEMSCHANGE_0300", 0, async function (done) {
      try {
        controller.on('queueItemsChange');
      } catch (err) {
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_ONQUEUEITEMSCHANGE_0300
   * @tc.desc:One on functions - three params
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_ONQUEUEITEMSCHANGE_0300", 0, async function (done) {
      try {
        controller.on('queueItemsChange', queueItemsCallback1, queueItemsCallback2);
      } catch (err) {
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_ONQUEUETITLECHANGE_0100
   * @tc.desc:One on function - queue title change
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_ONQUEUETITLECHANGE_0100", 0, async function (done) {
      controller.on('queueTitleChange', queueTitleCallback1);
      await session.setAVQueueTitle(QUEUE_TITLE).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_ONQUEUETITLECHANGE_0100 setAVQueueTitle error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      sleep(200).then(() => {
        if (receivedCallback) {
          console.log(TAG + "SUB_MULTIMEDIA_ONQUEUETITLECHANGE_0100 Received queue Title change");
          expect(true).assertTrue();
        } else {
          console.error(TAG + "SUB_MULTIMEDIA_ONQUEUETITLECHANGE_0100 Session queue Title change  not received");
          expect().assertFail();
        }
        receivedCallback = false;
        done();
      });
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_ONQUEUETITLECHANGE_0200
   * @tc.desc:One on function - queue title change
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_ONQUEUETITLECHANGE_0200", 0, async function (done) {
      controller.on('queueTitleChange', queueTitleCallback1);
      controller.on('queueTitleChange', queueTitleCallback2);
      await session.setAVQueueTitle(QUEUE_TITLE).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_ONQUEUETITLECHANGE_0200 error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(200);
      if (receivedCallback && receivedCallback2) {
        console.log(TAG + "SUB_MULTIMEDIA_ONQUEUETITLECHANGE_0200 Received queue Title change");
        expect(true).assertTrue();
      } else {
        console.error(TAG + "SUB_MULTIMEDIA_ONQUEUETITLECHANGE_0200 Session queue Title change  not received");
        expect().assertFail();
      }
      receivedCallback = false;
      receivedCallback2 = false;
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_ONQUEUETITLECHANGE_0300
   * @tc.desc:One on functions - one param
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_ONQUEUETITLECHANGE_0300", 0, async function (done) {
      try {
        controller.on('queueTitleChange');
      } catch (err) {
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_ONQUEUETITLECHANGE_0400
   * @tc.desc:One on functions - three params
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_ONQUEUETITLECHANGE_0400", 0, async function (done) {
      try {
        controller.on('queueTitleChange', queueTitleCallback1, queueTitleCallback2);
      } catch (err) {
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_OFFQUEUEITEMSCHANGE_0100
   * @tc.desc:Two on functions and one off function - queue items change
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_OFFQUEUEITEMSCHANGE_0100", 0, async function (done) {
      controller.on('queueItemsChange', queueItemsCallback1);
      controller.on('queueItemsChange', queueItemsCallback2);
      controller.off('queueItemsChange', queueItemsCallback2);
      await session.setAVQueueItems(ITEMS_ARRAY).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_OFFQUEUEITEMSCHANGE_0100 setAVQueueItems error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(200);
      if (receivedCallback && !receivedCallback2) {
        console.log(TAG + "SUB_MULTIMEDIA_OFFQUEUEITEMSCHANGE_0100 Received queue items change");
        expect(true).assertTrue();
      } else {
        console.error(TAG + "SUB_MULTIMEDIA_OFFQUEUEITEMSCHANGE_0100 Session queue items change  not received");
        expect().assertFail();
      }
      receivedCallback = false;
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_OFFQUEUEITEMSCHANGE_0200
   * @tc.desc:Two on functions and two off function - queue items change
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_OFFQUEUEITEMSCHANGE_0200", 0, async function (done) {
      controller.on('queueItemsChange', queueItemsCallback1);
      controller.on('queueItemsChange', queueItemsCallback2);
      controller.off('queueItemsChange', queueItemsCallback1);
      controller.off('queueItemsChange', queueItemsCallback2);
      await session.setAVQueueItems(ITEMS_ARRAY).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_OFFQUEUEITEMSCHANGE_0200 setAVQueueItems error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(200);
      if (!receivedCallback && !receivedCallback2) {
        console.log(TAG + "SUB_MULTIMEDIA_OFFQUEUEITEMSCHANGE_0200 Received queue items change");
        expect(true).assertTrue();
      } else {
        console.error(TAG + "SUB_MULTIMEDIA_OFFQUEUEITEMSCHANGE_0200 Session queue items change  not received");
        expect().assertFail();
      }
      receivedCallback = false;
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_OFFQUEUEITEMSCHANGE_0300
   * @tc.desc:Two on functions and off all function - queue items change
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_OFFQUEUEITEMSCHANGE_0300", 0, async function (done) {
      controller.on('queueItemsChange', queueItemsCallback1);
      controller.on('queueItemsChange', queueItemsCallback2);
      controller.off('queueItemsChange');
      await session.setAVQueueItems(ITEMS_ARRAY).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_OFFQUEUEITEMSCHANGE_0300 setAVQueueItems error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(200);
      if (!receivedCallback && !receivedCallback2) {
        console.log(TAG + "SUB_MULTIMEDIA_OFFQUEUEITEMSCHANGE_0300 Received queue items change");
        expect(true).assertTrue();
      } else {
        console.error(TAG + "SUB_MULTIMEDIA_OFFQUEUEITEMSCHANGE_0300 Session queue items change  not received");
        expect().assertFail();
      }
      receivedCallback = false;
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_OFFQUEUEITEMSCHANGE_0400
   * @tc.desc:Two on functions and off function - three params
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_OFFQUEUEITEMSCHANGE_0400", 0, async function (done) {
      try {
        controller.on('queueItemsChange', queueItemsCallback1);
        controller.on('queueItemsChange', queueItemsCallback2);
        controller.off('queueItemsChange', queueItemsCallback1, queueItemsCallback2);
      } catch (err) {
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_OFFQUEUETITLECHANGE_0100
   * @tc.desc:Two on functions and one off function - queue title change
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_OFFQUEUETITLECHANGE_0100", 0, async function (done) {
      controller.on('queueTitleChange', queueTitleCallback1);
      controller.on('queueTitleChange', queueTitleCallback2);
      controller.off('queueTitleChange', queueTitleCallback2);
      await session.setAVQueueTitle(QUEUE_TITLE).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_OFFQUEUETITLECHANGE_0100 setAVQueueTitle error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(200);
      if (receivedCallback && !receivedCallback2) {
        console.log(TAG + "SUB_MULTIMEDIA_OFFQUEUETITLECHANGE_0100 Received queue Title change");
        expect(true).assertTrue();
      } else {
        console.error(TAG + "SUB_MULTIMEDIA_OFFQUEUETITLECHANGE_0100 Session queue Title change  not received");
        expect().assertFail();
      }
      receivedCallback = false;
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_OFFQUEUETITLECHANGE_0200
   * @tc.desc:Two on functions and two off function - queue title change
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_OFFQUEUETITLECHANGE_0200", 0, async function (done) {
      controller.on('queueTitleChange', queueTitleCallback1);
      controller.on('queueTitleChange', queueTitleCallback2);
      controller.off('queueTitleChange', queueTitleCallback1);
      controller.off('queueTitleChange', queueTitleCallback2);

      await session.setAVQueueTitle(QUEUE_TITLE).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_OFFQUEUETITLECHANGE_0200 setAVQueueTitle error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(200);
      if (!receivedCallback && !receivedCallback2) {
        console.log(TAG + "SUB_MULTIMEDIA_OFFQUEUETITLECHANGE_0200 Received queue Title change");
        expect(true).assertTrue();
      } else {
        console.error(TAG + "SUB_MULTIMEDIA_OFFQUEUETITLECHANGE_0200 Session queue Title change  not received");
        expect().assertFail();
      }
      receivedCallback = false;
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_OFFQUEUETITLECHANGE_0300
   * @tc.desc:Two on functions and off all function - queue title change
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_OFFQUEUETITLECHANGE_0300", 0, async function (done) {
      controller.on('queueTitleChange', queueTitleCallback1);
      controller.on('queueTitleChange', queueTitleCallback2);
      controller.off('queueTitleChange');

      await session.setAVQueueTitle(QUEUE_TITLE).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_OFFQUEUETITLECHANGE_0300 setAVQueueTitle error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(200);
      if (!receivedCallback && !receivedCallback2) {
        console.log(TAG + "SUB_MULTIMEDIA_OFFQUEUETITLECHANGE_0300 Received queue Title change");
        expect(true).assertTrue();
      } else {
        console.error(TAG + "SUB_MULTIMEDIA_OFFQUEUETITLECHANGE_0300 Session queue Title change  not received");
        expect().assertFail();
      }
      receivedCallback = false;
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_OFFQUEUETITLECHANGE_0400
   * @tc.desc:Two on functions and off function - three params
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_OFFQUEUETITLECHANGE_0400", 0, async function (done) {
      try {
        controller.on('queueTitleChange', queueTitleCallback1);
        controller.on('queueTitleChange', queueTitleCallback2);
        controller.off('queueTitleChange', queueTitleCallback1, queueTitleCallback2);
      } catch (err) {
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_SETAVQUEUEITEMS_0100
   * @tc.desc:setAVQueueItems - callback
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */

    it("SUB_MULTIMEDIA_SETAVQUEUEITEMS_0100", 0, async function (done) {
      session.setAVQueueItems(ITEMS_ARRAY, (err) => {
        if (err) {
          console.error(TAG + "SUB_MULTIMEDIA_SETAVQUEUEITEMS_0100 error " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
        console.info(TAG + "SUB_MULTIMEDIA_SETAVQUEUEITEMS_0100 finished");
        expect(true).assertTrue();
        done();
      });
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_SETAVQUEUEITEMS_0200
   * @tc.desc:setAVQueueItems - promise
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_SETAVQUEUEITEMS_0200", 0, async function (done) {
      await session.setAVQueueItems(ITEMS_ARRAY).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_SETAVQUEUEITEMS_0200 error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info(TAG + "SUB_MULTIMEDIA_SETAVQUEUEITEMS_0200 finished");
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_SETAVQUEUEITEMS_0300
   * @tc.desc:setAVQueueItems - error situation
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_SETAVQUEUEITEMS_0300", 0, async function (done) {
      await session.setAVQueueItems(ITEMS_ARRAY_ERROR).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_SETAVQUEUEITEMS_0300 error " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      });
      await sleep(2000);
      console.info(TAG + "SUB_MULTIMEDIA_SETAVQUEUEITEMS_0300 finished");
      done();
    })
    /*
   * @tc.name:SUB_MULTIMEDIA_SETAVQUEUETITLE_0100
   * @tc.desc:setAVQueueTitle - callback
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_SETAVQUEUETITLE_0100", 0, async function (done) {
      session.setAVQueueTitle(QUEUE_TITLE, (err) => {
        if (err) {
          console.error(TAG + "SUB_MULTIMEDIA_SETAVQUEUETITLE_0100 error " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
        console.info(TAG + "SUB_MULTIMEDIA_SETAVQUEUETITLE_0100 finished");
        expect(true).assertTrue();
        done();
      });
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_SETAVQUEUETITLE_0200
   * @tc.desc:setAVQueueTitle - promise
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_SETAVQUEUETITLE_0200", 0, async function (done) {
      await session.setAVQueueTitle(QUEUE_TITLE).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_SETAVQUEUETITLE_0200 error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info(TAG + "SUB_MULTIMEDIA_SETAVQUEUETITLE_0200 finished");
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_SKIPTOQUEUEITEM_0100
   * @tc.desc:SkipToQueueItem - callback
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_SKIPTOQUEUEITEM_0100", 0, async function (done) {
      controller.skipToQueueItem(QUEUE_ITEM_ID, (err) => {
        if (err) {
          console.error(TAG + "SUB_MULTIMEDIA_SKIPTOQUEUEITEM_0100 error " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
        console.info(TAG + "SUB_MULTIMEDIA_SKIPTOQUEUEITEM_0100 finished");
        expect(true).assertTrue();
        done();
      });
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_SKIPTOQUEUEITEM_0200
   * @tc.desc:SkipToQueueItem - promise
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_SKIPTOQUEUEITEM_0200", 0, async function (done) {
      await controller.skipToQueueItem(QUEUE_ITEM_ID).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_SKIPTOQUEUEITEM_0200 error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info(TAG + "SUB_MULTIMEDIA_SKIPTOQUEUEITEM_0200 finished");
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_ONSKIPTOQUEUEITEM_0100
   * @tc.desc:One on function - skip to queue items
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_ONSKIPTOQUEUEITEM_0100", 0, async function (done) {
      session.on('skipToQueueItem', skipToQueueItemCallback1);
      await controller.skipToQueueItem(SKIP_ITEM_ID).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_ONSKIPTOQUEUEITEM_0100 error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      sleep(200).then(() => {
        if (receivedCallback) {
          console.log(TAG + "SUB_MULTIMEDIA_ONSKIPTOQUEUEITEM_0100 Received skipToQueueItem ");
          expect(true).assertTrue();
        } else {
          console.error(TAG + "SUB_MULTIMEDIA_ONSKIPTOQUEUEITEM_0100 skipToQueueItem not received");
          expect().assertFail();
        }
        receivedCallback = false;
        done();
      })
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_ONSKIPTOQUEUEITEM_0200
   * @tc.desc:One on function - skip to queue items
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_ONSKIPTOQUEUEITEM_0200", 0, async function (done) {
      session.on('skipToQueueItem', skipToQueueItemCallback1);
      session.on('skipToQueueItem', skipToQueueItemCallback2);
      await controller.skipToQueueItem(SKIP_ITEM_ID).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_ONSKIPTOQUEUEITEM_0200 error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(200);
      if (receivedCallback && receivedCallback2) {
        console.log(TAG + "SUB_MULTIMEDIA_ONSKIPTOQUEUEITEM_0200 Received skipToQueueItem ");
        expect(true).assertTrue();
      } else {
        console.error(TAG + "SUB_MULTIMEDIA_ONSKIPTOQUEUEITEM_0200skipToQueueItem not received");
        expect().assertFail();
      }
      receivedCallback = false;
      receivedCallback2 = false;
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_ONSKIPTOQUEUEITEM_0300
   * @tc.desc:One on functions - one param
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_ONSKIPTOQUEUEITEM_0300", 0, async function (done) {
      try {
        session.on('skipToQueueItem');
      } catch (err) {
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_ONSKIPTOQUEUEITEM_0400
   * @tc.desc:One on functions - three params
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_ONSKIPTOQUEUEITEM_0400", 0, async function (done) {
      try {
        session.on('skipToQueueItem', skipToQueueItemCallback1, skipToQueueItemCallback2);
      } catch (err) {
        expect(err.code == 401).assertTrue();
      }
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_GETAVQUEUEITEMS_0100
   * @tc.desc:GetAVQueueItems - callback
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_GETAVQUEUEITEMS_0100", 0, async function (done) {
      session.setAVQueueItems(ITEMS_ARRAY, (err) => {
        if (err) {
          console.error(TAG + "SUB_MULTIMEDIA_GETAVQUEUEITEMS_0100 error " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
        console.info(TAG + "SUB_MULTIMEDIA_GETAVQUEUEITEMS_0100 finished");
        expect(true).assertTrue();
        done();
      });
      await sleep(200);
      controller.getAVQueueItems((err) => {
        if (err) {
          console.error(TAG + "SUB_MULTIMEDIA_GETAVQUEUEITEMS_0100 error " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
        console.info(TAG + "SUB_MULTIMEDIA_GETAVQUEUEITEMS_0100 finished");
        expect(true).assertTrue();
        done();
      });
      await sleep(200);
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_GETAVQUEUEITEMS_0200
   * @tc.desc:GetAVQueueItems - promise
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_GETAVQUEUEITEMS_0200", 0, async function (done) {
      await session.setAVQueueItems(ITEMS_ARRAY).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_GETAVQUEUEITEMS_0200 error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info(TAG + "SUB_MULTIMEDIA_GETAVQUEUEITEMS_0200 finished");
      done();
      await sleep(200);
      await controller.getAVQueueItems().catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_GETAVQUEUEITEMS_0200 error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info(TAG + "SUB_MULTIMEDIA_GETAVQUEUEITEMS_0200 finished");
      done();
      await sleep(200);
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_GETAVQUEUETITLE_0100
   * @tc.desc:GetAVQueueTitle - callback
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_GETAVQUEUETITLE_0100", 0, async function (done) {
      session.setAVQueueTitle(QUEUE_TITLE, (err) => {
        if (err) {
          console.error(TAG + "SUB_MULTIMEDIA_GETAVQUEUETITLE_0100 error " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
        console.info(TAG + "SUB_MULTIMEDIA_GETAVQUEUETITLE_0100 finished");
        expect(true).assertTrue();
        done();
      });
      await sleep(200);
      controller.getAVQueueTitle((err) => {
        if (err) {
          console.error(TAG + "SUB_MULTIMEDIA_GETAVQUEUETITLE_0100 error " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
        console.info(TAG + "SUB_MULTIMEDIA_GETAVQUEUETITLE_0100 finished");
        expect(true).assertTrue();
        done();
      });
      await sleep(200);
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_GETAVQUEUETITLE_0200
   * @tc.desc:GetAVQueueTitle - promise
   * @tc.type: FUNC
   * @tc.require: I6KTU4
   */
    it("SUB_MULTIMEDIA_GETAVQUEUETITLE_0200", 0, async function (done) {
      await session.setAVQueueTitle(QUEUE_TITLE).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_GETAVQUEUETITLE_0200 error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info(TAG + "SUB_MULTIMEDIA_GETAVQUEUETITLE_0200 finished");
      done();
      await sleep(200);
      await controller.getAVQueueTitle().catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_GETAVQUEUETITLE_0200 error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.info(TAG + "SUB_MULTIMEDIA_GETAVQUEUETITLE_0200 finished");
      done();
      await sleep(200);
    })

  })
}
