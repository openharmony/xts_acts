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

import audio from '@ohos.multimedia.audio';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
export default function audioRoutingManager() {

const TAG = "[AudioRoutingManagerJsTest]";
const stringParameter = 'stringParameter';
const numberParameter = 12345678;

describe("AudioRoutingManagerJsTest", function () {

  beforeAll(async function () {

    console.info(TAG + "beforeAll called");
  })

  afterAll(function () {
    console.info(TAG + 'afterAll called')
  })

  beforeEach(function () {
    console.info(TAG + 'beforeEach called')
  })

  afterEach(function () {
    console.info(TAG + 'afterEach called')
  })

  function sleep(time) {
    return new Promise((resolve) => setTimeout(resolve, time));
  }

  
  /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0100
     *@tc.name      : Get prefer output device - promise
     *@tc.desc      : Get prefer output device - promise
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
  it("SUB_MULTIMEDIA_AUDIO_GETPREFEROUTUTDEVICEFORRENDERERINFOTEST_0100", 0, async function (done) {
    let rendererInfo = {
      content : audio.ContentType.CONTENT_TYPE_MUSIC,
      usage : audio.StreamUsage.STREAM_USAGE_MEDIA,
      rendererFlags : 0 }
    
    let routingManager = audio.getAudioManager().getRoutingManager();
    try {
      let data = await routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo);
      console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0100 SUCCESS`+JSON.stringify(data));
      expect(true).assertTrue();
      done();
    } catch(e) {
      console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0100 ERROR: ${e.message}`);
      expect().assertFail();
      done();
    }
  })

 
  /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0200
     *@tc.name      : Get prefer output device no parameter- promise
     *@tc.desc      : Get prefer output device no parameter- promise
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
  it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0200", 0, async function (done) {
      let routingManager = audio.getAudioManager().getRoutingManager();
      try {
        let data = await routingManager.getPreferOutputDeviceForRendererInfo();
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0200 parameter check ERROR: ${JSON.stringify(data)}`);
        expect().assertFail();
      } catch(e) {
        if (e.code != 401) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0200 ERROR: ${e.message}`);
          expect().assertFail();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0200 check no parameter PASS`);
        expect(true).assertTrue();
      }
      done();
  })

   /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0300
     *@tc.name      : Get prefer output device check number parameter- promise
     *@tc.desc      : Get prefer output device check number parameter- promise
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
  it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0300", 0, async function (done) {
    let routingManager = audio.getAudioManager().getRoutingManager();
    try {
      let data = await routingManager.getPreferOutputDeviceForRendererInfo(numberParameter);
      console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETPREFEROUTPUTDEVICEFORRENDERERINFOTEST_0300 parameter check ERROR: `+JSON.stringify(data));
      expect().assertFail();
    } catch(e) {
      if (e.code != 401) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0300 ERROR: ${e.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0300 check number parameter PASS`);
      expect(true).assertTrue();
    }
    done();
  })


   /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0400
     *@tc.name      : Get prefer output device check string parameter- promise
     *@tc.desc      : Get prefer output device check string parameter- promise
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
  it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0400", 0, async function (done) {
    let routingManager = audio.getAudioManager().getRoutingManager();
    try {
      let data = await routingManager.getPreferOutputDeviceForRendererInfo(stringParameter);
      console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0400 parameter check ERROR: `+JSON.stringify(data));
      expect().assertFail();
    } catch(e) {
      if (e.code != 401) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0400 ERROR: ${e.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0400 check string parameter PASS`);
      expect(true).assertTrue();
    }
    done();
  })

  /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0500
     *@tc.name      : Get prefer output device - callback
     *@tc.desc      : Get prefer output device - callback
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
  it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0500", 0, async function (done) {
    let rendererInfo = {
      content : audio.ContentType.CONTENT_TYPE_MUSIC,
      usage : audio.StreamUsage.STREAM_USAGE_MEDIA,
      rendererFlags : 0 }
    
    let routingManager = audio.getAudioManager().getRoutingManager();
      routingManager.getPreferOutputDeviceForRendererInfo(rendererInfo, (e, data)=>{
        if (e) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0500 ERROR: ${e.message}`);
          expect(false).assertTrue();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0500 SUCCESS`);
        expect(true).assertTrue();
        done();
      });
  })

   /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETPREFEROUTPUTDEVICEFORRENDERERINFOTEST_0600
     *@tc.name      : Get prefer output device check number parameter- callback
     *@tc.desc      : Get prefer output device check number parameter- callback
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
  it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0600", 0, async function (done) {
    let routingManager = audio.getAudioManager().getRoutingManager();
    try {
      routingManager.getPreferOutputDeviceForRendererInfo(numberParameter, (e, data)=>{
        if (e.code != 401) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0600 ERROR: ${e.message}`);
          expect(false).assertTrue();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0600 check number parameter fail`);
        expect(false).assertTrue();
        done();
      });
    } catch (error) {
      if (error.code != 401) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0600 ERROR: ${error.message},${error.code}`);
         expect(false).assertTrue();
        done();
      }
      console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0600 check number parameter PASS,${error.code}`);
      expect(true).assertTrue();
      done();
    }
      
  })

  /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0700
     *@tc.name      : Get prefer output device check number parameter- callback
     *@tc.desc      : Get prefer output device check number parameter- callback
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
  it("SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0700", 0, async function (done) {
    let routingManager = audio.getAudioManager().getRoutingManager();
    try {
      routingManager.getPreferOutputDeviceForRendererInfo(stringParameter, (e, data)=>{
        if (e.code != 401) {
          console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0700 ERROR: ${e.message}`);
          expect(false).assertTrue();
          done();
        }
        console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0700 check string parameter fail`);
        expect(false).assertTrue();
        done();
      });
    } catch (error) {
      if (error.code != 401) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0700 ERROR: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
      console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_GETREFEROUTPUTDEVICEFORRENDERERINFOTEST_0700 check string parameter PASS,${error.code}`);
      expect(true).assertTrue();
      done();
    }
      
  })

  /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0100
     *@tc.name      : Get prefer output device check number parameter- callback
     *@tc.desc      : Get prefer output device check number parameter- callback
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
  it("SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0100", 0, async function (done) {
    let rendererInfo = {
      content : audio.ContentType.CONTENT_TYPE_MUSIC,
      usage : audio.StreamUsage.STREAM_USAGE_MEDIA,
      rendererFlags : 0 }
    
    let routingManager = audio.getAudioManager().getRoutingManager();
    try {
      routingManager.on('preferOutputDeviceChangeForRendererInfo', rendererInfo, (data)=>{});
      expect(true).assertTrue();
      done();
    } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0100 ERROR: ${e.message}`);
        expect().assertFail();
        done();
    }
  })

   /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0200
     *@tc.name      : On prefer output device check string parameter- callback
     *@tc.desc      : On prefer output device check string parameter- callback
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
  it("SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0200", 0, async function (done) {
    let routingManager = audio.getAudioManager().getRoutingManager();
    try {
      routingManager.on('preferOutputDeviceChangeForRendererInfo', stringParameter, (data)=>{});
      console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0200 with string patameter ERROR: ${e.message}`);
      expect().assertFail();
      done();
    } catch (e) {
      if (e.code != audio.AudioErrors.ERROR_INVALID_PARAM) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0200 check string parameter ERROR: ${e.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0200 PASS: ${e.message}`);
      expect(true).assertTrue();
      done();
    }
  })

     /**
     *@tc.number    : SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0300
     *@tc.name      : On prefer output device check number parameter- callback
     *@tc.desc      : On prefer output device check number parameter- callback
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
  it("SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0300", 0, async function (done) {
    let routingManager = audio.getAudioManager().getRoutingManager();
    try {
      routingManager.on('preferOutputDeviceChangeForRendererInfo', numberParameter, (data)=>{});
      console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0300 with number patameter ERROR: ${e.message}`);
      expect().assertFail();
      done();
    } catch (e) {
      if (e.code != audio.AudioErrors.ERROR_INVALID_PARAM) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0300 check number parameter ERROR: ${e.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_ON_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0300 PASS: ${e.message}`);
      expect(true).assertTrue();
      done();
    }
  })

     /**
     *@tc.number    : s
     *@tc.name      : Off prefer output device - callback
     *@tc.desc      : Off prefer output device - callback
     *@tc.size      : MEDIUM
     *@tc.type      : Function
     *@tc.level     : Level 0
     */
  it("SUB_MULTIMEDIA_AUDIO_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0100", 0, async function (done) {
    let routingManager = audio.getAudioManager().getRoutingManager();
    try {
      routingManager.off('preferOutputDeviceChangeForRendererInfo', (data)=>{});
      console.info(`${TAG} SUB_MULTIMEDIA_AUDIO_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0100 SUCCESS`);
      expect(true).assertTrue();
      done();
    } catch (e) {
        console.error(`${TAG} SUB_MULTIMEDIA_AUDIO_OFF_REFEROUTPUTDEVICEFORRENDERERINFOTEST_0100 ERROR: ${e.message}`);
        expect().assertFail();
        done();
    }
  })

})
}