/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import testapi from 'libavrecorderndk.so'
import fs from '@ohos.file.fs'
import Utils from './Utils';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import { BusinessError } from '@ohos.base';
import AVRecorderNdkTestBase from './AVRecorderNdkTestBase';

const Tag = 'OHAVRecorderNdk_test:';
let avRecorderNdkTestBase = new AVRecorderNdkTestBase();
let fdObject: ESObject;
let fdPath: string;


export default function OhAVRecorderNDKTest() { // L2
  describe('OhAVRecorderNDKTest', () => {

    beforeAll(async () => {
      let permissionNames: Array<Permissions> =
        ['ohos.permission.MEDIA_LOCATION', 'ohos.permission.READ_MEDIA', 'ohos.permission.WRITE_MEDIA',
          'ohos.permission.CAMERA', 'ohos.permission.MICROPHONE'];
      await avRecorderNdkTestBase.getPermission(permissionNames);
      await avRecorderNdkTestBase.msleepAsync(200);
      await avRecorderNdkTestBase.driveFn(4);
      await avRecorderNdkTestBase.msleepAsync(200);
    });
    beforeEach(async () => {

    });
    afterEach(async () => {

    });
    afterAll(() => {

    });

    /**
     * @tc.number     : testOhAvRecorder_errorevent_001
     * @tc.name       : testOhAvRecorder_errorevent_001
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_errorevent_001', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_errorevent_001 test start `);
      let fileName:string = avRecorderNdkTestBase.resourceMP4Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        videoFrameWidth: 3264,
        videoFrameHeight: 2448,
        videoFrameRate: 180,
        videoOrientation: 180
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //prepare camera recorder
        avRecorderNdkTestBase.PREPARE_CAMERA_EVENT,
        //stop err recorder
        avRecorderNdkTestBase.STOP_RECORDER_ERR_EVENT,
        //pause err recorder
        avRecorderNdkTestBase.PAUSE_RECORDER_ERR_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        //2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //stop recorder
        avRecorderNdkTestBase.STOP_RECORDER_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_errorevent_001 test end `);
    });
    it('testOhAvRecorder_errorevent_001', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_errorevent_001 test start `);
      let fileName:string = avRecorderNdkTestBase.resourceMP4Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        videoFrameWidth: 3264,
        videoFrameHeight: 2448,
        videoFrameRate: 180,
        videoOrientation: 180
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //prepare camera recorder
        avRecorderNdkTestBase.PREPARE_CAMERA_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        //2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //pause recorder
        avRecorderNdkTestBase.PAUSE_RECORDER_EVENT,
        //start err recorder
        avRecorderNdkTestBase.START_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_errorevent_001 test end `);
    });
    it('testOhAvRecorder_errorevent_001', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_errorevent_001 test start `);
      let fileName:string = avRecorderNdkTestBase.resourceMP4Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        videoFrameWidth: 3264,
        videoFrameHeight: 2448,
        videoFrameRate: 180,
        videoOrientation: 180
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //prepare camera recorder
        avRecorderNdkTestBase.PREPARE_CAMERA_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        //2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //pause recorder
        avRecorderNdkTestBase.PAUSE_RECORDER_EVENT,
        //resume recorder
        avRecorderNdkTestBase.RESUME_RECORDER_EVENT,
        //start err recorder
        avRecorderNdkTestBase.START_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_errorevent_001 test end `);
    });
    it('testOhAvRecorder_errorevent_001', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_errorevent_001 test start `);
      let fileName:string = avRecorderNdkTestBase.resourceMP4Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        videoFrameWidth: 3264,
        videoFrameHeight: 2448,
        videoFrameRate: 180,
        videoOrientation: 180
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //prepare camera recorder
        avRecorderNdkTestBase.PREPARE_CAMERA_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        //2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //stop recorder
        avRecorderNdkTestBase.STOP_RECORDER_EVENT,
        //start err recorder
        avRecorderNdkTestBase.START_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_errorevent_001 test end `);
    });
    it('testOhAvRecorder_errorevent_001', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_errorevent_001 test start `);
      let fileName:string = avRecorderNdkTestBase.resourceMP4Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        videoFrameWidth: 3264,
        videoFrameHeight: 2448,
        videoFrameRate: 180,
        videoOrientation: 180
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //prepare camera recorder
        avRecorderNdkTestBase.PREPARE_CAMERA_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        //2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //reset recorder
        avRecorderNdkTestBase.RESET_RECORDER_EVENT,
        //start err recorder
        avRecorderNdkTestBase.START_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_errorevent_001 test end `);
    });
    it('testOhAvRecorder_errorevent_001', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_errorevent_001 test start `);
      let fileName:string = avRecorderNdkTestBase.resourceMP4Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        videoFrameWidth: 3264,
        videoFrameHeight: 2448,
        videoFrameRate: 180,
        videoOrientation: 180
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //prepare camera recorder
        avRecorderNdkTestBase.PREPARE_CAMERA_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        //2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //reset recorder
        avRecorderNdkTestBase.RESET_RECORDER_EVENT,
        //start err recorder
        avRecorderNdkTestBase.START_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
      );
      let loopTimes = 3;
      for (let i = 0; i < loopTimes; i++) {
        mySteps.push(
          //start recorder
          avRecorderNdkTestBase.START_RECORDER_EVENT,
          //prepare recorder
          avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
          //prepare camera recorder
          avRecorderNdkTestBase.PREPARE_CAMERA_EVENT,
          //start recorder
          avRecorderNdkTestBase.START_RECORDER_EVENT,
          //2s
          avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
          //reset recorder
          avRecorderNdkTestBase.RESET_RECORDER_EVENT,
          //prepare recorder
          avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
          //prepare camera recorder
          avRecorderNdkTestBase.PREPARE_CAMERA_EVENT,
        )
      }
      mySteps.push(
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      )
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_errorevent_001 test end `);
    });
    it('testOhAvRecorder_errorevent_002', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_errorevent_002 test start `);
      let fileName:string = avRecorderNdkTestBase.resourceMP4Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        videoFrameWidth: 3264,
        videoFrameHeight: 2448,
        videoFrameRate: 180,
        videoOrientation: 180
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //prepare camera recorder
        avRecorderNdkTestBase.PREPARE_CAMERA_EVENT,
        //pause err recorder
        avRecorderNdkTestBase.PAUSE_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_errorevent_002 test end `);
    });
    it('testOhAvRecorder_errorevent_002', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_errorevent_002 test start `);
      let fileName:string = avRecorderNdkTestBase.resourceMP4Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        videoFrameWidth: 3264,
        videoFrameHeight: 2448,
        videoFrameRate: 180,
        videoOrientation: 180
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //prepare camera recorder
        avRecorderNdkTestBase.PREPARE_CAMERA_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        //prepare err recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_errorevent_002 test end `);
    });
    it('testOhAvRecorder_errorevent_002', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_errorevent_002 test start `);
      let fileName:string = avRecorderNdkTestBase.resourceMP4Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        videoFrameWidth: 3264,
        videoFrameHeight: 2448,
        videoFrameRate: 180,
        videoOrientation: 180
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //prepare camera recorder
        avRecorderNdkTestBase.PREPARE_CAMERA_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        //pause recorder
        avRecorderNdkTestBase.PAUSE_RECORDER_EVENT,
        //prepare err recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_errorevent_002 test end `);
    });
    it('testOhAvRecorder_errorevent_002', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_errorevent_002 test start `);
      let fileName:string = avRecorderNdkTestBase.resourceMP4Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        videoFrameWidth: 3264,
        videoFrameHeight: 2448,
        videoFrameRate: 180,
        videoOrientation: 180
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //prepare camera recorder
        avRecorderNdkTestBase.PREPARE_CAMERA_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        //pause recorder
        avRecorderNdkTestBase.PAUSE_RECORDER_EVENT,
        //resume recorder
        avRecorderNdkTestBase.RESUME_RECORDER_EVENT,
        //prepare err recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_errorevent_002 test end `);
    });
    it('testOhAvRecorder_errorevent_002', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_errorevent_002 test start `);
      let fileName:string = avRecorderNdkTestBase.resourceMP4Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        videoFrameWidth: 3264,
        videoFrameHeight: 2448,
        videoFrameRate: 180,
        videoOrientation: 180
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //prepare camera recorder
        avRecorderNdkTestBase.PREPARE_CAMERA_EVENT,
        //prepare err recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_errorevent_002 test end `);
    });
    it('testOhAvRecorder_errorevent_002', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_errorevent_002 test start `);
      let fileName:string = avRecorderNdkTestBase.resourceMP4Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        videoFrameWidth: 3264,
        videoFrameHeight: 2448,
        videoFrameRate: 180,
        videoOrientation: 180
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //prepare camera recorder
        avRecorderNdkTestBase.PREPARE_CAMERA_EVENT,
        //prepare err recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_ERR_EVENT,
        //prepare err recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_errorevent_002 test end `);
    });


    /**
     * @tc.number     : testOhAvRecorder_errorevent_001
     * @tc.name       : testOhAvRecorder_errorevent_001
     * @tc.desc       : Prepare the playback environment and asynchronously cache media data.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOhAvRecorder_errorevent_002', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_errorevent_002 test start `);
      let fileName:string = avRecorderNdkTestBase.resourceMP4Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        videoFrameWidth: 3264,
        videoFrameHeight: 2448,
        videoFrameRate: 180,
        videoOrientation: 180
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //prepare camera recorder
        avRecorderNdkTestBase.PREPARE_CAMERA_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        //start error recorder
        avRecorderNdkTestBase.START_RECORDER_ERR_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_errorevent_002 test end `);
    });
    it('testOhAvRecorder_errorevent_003', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_errorevent_002 test start `);
      let fileName:string = avRecorderNdkTestBase.resourceMP4Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        videoFrameWidth: 3264,
        videoFrameHeight: 2448,
        videoFrameRate: 180,
        videoOrientation: 180
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //prepare camera recorder
        avRecorderNdkTestBase.PREPARE_CAMERA_EVENT,
        //stop error recorder
        avRecorderNdkTestBase.STOP_RECORDER_ERR_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        //2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //stop recorder
        avRecorderNdkTestBase.STOP_RECORDER_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_errorevent_002 test end `);
    });
    it('testOhAvRecorder_errorevent_004', 0, async (done: Function) => {
      console.info(`testOhAvRecorder_errorevent_002 test start `);
      let fileName:string = avRecorderNdkTestBase.resourceMP4Name();
      fdObject = await avRecorderNdkTestBase.getFd(fileName);
      fdPath = "fd://" + fdObject.fdNumber;
      let config: ESObject = {
        fdNumber: fdObject.fdNumber,
        avOutName: fileName,
        videoFrameWidth: 3264,
        videoFrameHeight: 2448,
        videoFrameRate: 180,
        videoOrientation: 180
      }
      let mySteps = new Array(
        //create recorder
        avRecorderNdkTestBase.CREATE_RECORDER_EVENT,
        //prepare recorder
        avRecorderNdkTestBase.PREPARE_RECORDER_EVENT,
        //prepare camera recorder
        avRecorderNdkTestBase.PREPARE_CAMERA_EVENT,
        //stop error recorder
        avRecorderNdkTestBase.STOP_RECORDER_ERR_EVENT,
        //start recorder
        avRecorderNdkTestBase.START_RECORDER_EVENT,
        //2s
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        avRecorderNdkTestBase.WAIT_RECORDER_EVENT,
        //stop recorder
        avRecorderNdkTestBase.STOP_RECORDER_EVENT,
        //release recorder
        avRecorderNdkTestBase.RELEASE_RECORDER_EVENT,
        //done recorder
        avRecorderNdkTestBase.END_EVENT
      );
      await avRecorderNdkTestBase.toNextStep(config, fdPath, mySteps, done);
      console.info(`testOhAvRecorder_errorevent_002 test end `);
    });



  });
}