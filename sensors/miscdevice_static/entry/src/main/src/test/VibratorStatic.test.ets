import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import vibrator from '@ohos.vibrator'
import deviceInfo from '@ohos.deviceInfo'
import { BusinessError } from '@ohos.base'

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function MiscDeviceStaticTest() {
  describe("MiscDeviceStaticTest", (): void => {

    const EFFECT_IDSUCCESS = "haptic.notice.success"
    const EFFECT_IDFAIL = "haptic.notice.fail"
    const EFFECT_IDWARNING = "haptic.notice.warning"
    let TAG = ""

    /**
     *
     * @tc.number    : UniversalVibratorJsTest01
     * @tc.name      : UniversalVibratorJsTest01
     * @tc.desc      : test EFFECT_IDSUCCESS vibrate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest01"
      let ret = vibrator.isSupportEffect(EFFECT_IDSUCCESS);
      hilog.info(0x0000, 'testTag', TAG + "ret:" + JSON.stringify(ret));
      if (ret) {
        let effect1: vibrator.VibratePreset = {
          type: "preset",
          effectId: EFFECT_IDSUCCESS,
          count: 1,
          intensity: 50,
        }
        let attr: vibrator.VibrateAttribute = {
          usage: 'unknown',
        }
        vibrator.startVibration(effect1, attr, (error: BusinessError<void> | null): void => {
          if (error?.code != 0) {
            expect(false).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDSUCCESS error:' + JSON.stringify(error));
          } else {
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDSUCCESS success');
          }
          setTimeout(() => {
            done();
          }, 500);
        });
      } else {
        console.log(TAG + ' is not supported.');
      }
      done();
    })

    /**
     *
     * @tc.number    : UniversalVibratorJsTest02
     * @tc.name      : UniversalVibratorJsTest02
     * @tc.desc      : test EFFECT_IDFAIL vibrate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest02", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest02"
      let ret1 = vibrator.isSupportEffect(EFFECT_IDFAIL);
      hilog.info(0x0000, 'testTag', TAG + "ret1:" + JSON.stringify(ret1));
      if (ret1) {
        let effect2: vibrator.VibratePreset = {
          type: "preset",
          effectId: EFFECT_IDFAIL,
          count: 1,
          intensity: 50,
        }
        let attr2: vibrator.VibrateAttribute = {
          usage: 'unknown',
        }
        vibrator.startVibration(effect2, attr2, (error: BusinessError<void> | null): void => {
          if (error?.code != 0) {
            expect(false).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDFAIL error:' + JSON.stringify(error));
          } else {
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDFAIL success');
          }
          setTimeout(() => {
            done();
          }, 500);
        });
      } else {
          console.log(TAG + ' is not supported.');
      }
      done();
    })

    /**
     *
     * @tc.number    : UniversalVibratorJsTest03
     * @tc.name      : UniversalVibratorJsTest03
     * @tc.desc      : test EFFECT_IDWARNING vibrate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest03", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest03"
      let ret2 = vibrator.isSupportEffect(EFFECT_IDWARNING);
      hilog.info(0x0000, 'testTag', TAG + "ret2:" + JSON.stringify(ret2));
      if (ret2) {
        let effect3: vibrator.VibratePreset = {
          type: "preset",
          effectId: EFFECT_IDWARNING,
          count: 1,
          intensity: 50,
        }
        let attr3: vibrator.VibrateAttribute = {
          usage: 'unknown',
        }
        vibrator.startVibration(effect3, attr3, (error: BusinessError<void> | null): void => {
          if (error?.code != 0) {
            expect(false).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDWARNING error:' + JSON.stringify(error));
          } else {
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDWARNING success');
          }
          setTimeout(() => {
            done();
          }, 500);
        });
      } else {
        console.log(TAG + ' is not supported.');
      }
      done();
    })

    /**
     *
     * @tc.number    : UniversalVibratorJsTest04
     * @tc.name      : UniversalVibratorJsTest04
     * @tc.desc      : test EFFECT_IDFAIL vibrate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest04", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest04"
      let ret2 = vibrator.isSupportEffect(EFFECT_IDWARNING);
      let ret1 = vibrator.isSupportEffect(EFFECT_IDFAIL);
      hilog.info(0x0000, 'testTag', TAG + "ret1:" + JSON.stringify(ret1) + "ret2:" + JSON.stringify(ret2));
      if (ret1 && ret2) {
        let effect4: vibrator.VibratePreset = {
          type: "preset",
          effectId: EFFECT_IDFAIL,
          count: 1,
          intensity: 50,
        }
        let effect41: vibrator.VibratePreset = {
          type: "preset",
          effectId: EFFECT_IDWARNING,
          count: 1,
          intensity: 50,
        }
        let attr4: vibrator.VibrateAttribute = {
          usage: 'unknown',
        }
        vibrator.startVibration(effect4, attr4, (error: BusinessError<void> | null): void => {
          if (error?.code != 0) {
            expect(false).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDFAIL error:' + JSON.stringify(error));
          } else {
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDFAIL success');
          }
        });
        vibrator.startVibration(effect41, attr4, (error: BusinessError<void> | null): void => {
          if (error?.code != 0) {
            expect(false).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDWARNING error:' + JSON.stringify(error));
          } else {
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDWARNING success');
          }
          setTimeout(() => {
            done();
          }, 500);
        });
      } else {
        console.log(TAG + ' is not supported.');
      }
      done();
    })

    /**
     *
     * @tc.number    : UniversalVibratorJsTest05
     * @tc.name      : UniversalVibratorJsTest05
     * @tc.desc      : test EFFECT_IDSUCCESS vibrate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest05", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest05"
      let ret2 = vibrator.isSupportEffect(EFFECT_IDWARNING);
      let ret = vibrator.isSupportEffect(EFFECT_IDSUCCESS);
      hilog.info(0x0000, 'testTag', TAG + "ret:" + JSON.stringify(ret) + "ret2:" + JSON.stringify(ret2));
      if (ret && ret2) {
        let effect5: vibrator.VibratePreset = {
          type: "preset",
          effectId: EFFECT_IDSUCCESS,
          count: 1,
          intensity: 50,
        }
        let effect51: vibrator.VibratePreset = {
          type: "preset",
          effectId: EFFECT_IDWARNING,
          count: 1,
          intensity: 50,
        }
        let attr5: vibrator.VibrateAttribute = {
          usage: 'unknown',
        }
        vibrator.startVibration(effect5, attr5, (error: BusinessError<void> | null): void => {
          if (error?.code != 0) {
            expect(false).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDSUCCESS error:' + JSON.stringify(error));
          } else {
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDSUCCESS success');
          }
        });
        vibrator.startVibration(effect51, attr5, (error: BusinessError<void> | null): void => {
          if (error?.code != 0) {
            expect(false).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDWARNING error:' + JSON.stringify(error));
          } else {
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDWARNING success');
          }
          setTimeout(() => {
            done();
          }, 500);
        });
      } else {
        console.log(TAG + ' is not supported.');
      }
      done();
    })

    /**
     *
     * @tc.number    : UniversalVibratorJsTest06
     * @tc.name      : UniversalVibratorJsTest06
     * @tc.desc      : test EFFECT_IDWARNING vibrate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest06", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest06"
      let ret2 = vibrator.isSupportEffect(EFFECT_IDWARNING);
      let ret1 = vibrator.isSupportEffect(EFFECT_IDFAIL);
      hilog.info(0x0000, 'testTag', TAG + "ret1:" + JSON.stringify(ret1) + "ret2:" + JSON.stringify(ret2));
      if (ret1 && ret2) {
        let effect6: vibrator.VibratePreset = {
          type: "preset",
          effectId: EFFECT_IDWARNING,
          count: 1,
          intensity: 50,
        }
        let effect61: vibrator.VibratePreset = {
          type: "preset",
          effectId: EFFECT_IDFAIL,
          count: 1,
          intensity: 50,
        }
        let attr6: vibrator.VibrateAttribute = {
          usage: 'unknown',
        }
        vibrator.startVibration(effect6, attr6, (error: BusinessError<void> | null): void => {
          if (error?.code != 0) {
            expect(false).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDWARNING error:' + JSON.stringify(error));
          } else {
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDWARNING success');
          }
        });
        vibrator.startVibration(effect61, attr6, (error: BusinessError<void> | null): void => {
          if (error?.code != 0) {
            expect(false).assertTrue();
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDFAIL error:' + JSON.stringify(error));
          } else {
            hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDFAIL success');
          }
          setTimeout(() => {
            done();
          }, 500);
        });
      } else {
        console.log(TAG + ' is not supported.');
      }
      done();
    })

    /**
     *
     * @tc.number    : UniversalVibratorJsTest07
     * @tc.name      : UniversalVibratorJsTest07
     * @tc.desc      : test VibrateTime vibrate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest07", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest07"
      let ret = vibrator.isHdHapticSupported();
      hilog.info(0x0000, 'testTag', TAG + "ret:" + JSON.stringify(ret));
      expect(ret).assertTrue();
      done();
    })

    /**
     *
     * @tc.number    : UniversalVibratorJsTest08
     * @tc.name      : UniversalVibratorJsTest08
     * @tc.desc      : test VibrateTime
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest08", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest08"
      let effect1: vibrator.VibrateTime = {
        type: 'time',
        duration: 10000,
      }
      let attr: vibrator.VibrateAttribute = {
        id: 1,
        usage: 'alarm',
      }
      vibrator.startVibration(effect1, attr, (error: BusinessError<void> | null): void => {
        if (error?.code != 0) {
          expect(false).assertTrue();
          hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDSUCCESS error:' + JSON.stringify(error));
        } else {
          hilog.info(0x0000, 'testTag', TAG + ' vibrator EFFECT_IDSUCCESS success');
        }
        setTimeout(() => {
          vibrator.stopVibrationSync();
          done();
        }, 500);
      });
      done();
    })

    /**
     *
     * @tc.number    : UniversalVibratorJsTest09
     * @tc.name      : UniversalVibratorJsTest09
     * @tc.desc      : test vibratePreset
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest09", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest09"
      let vibratePreset: vibrator.VibratePreset = {
        type: "preset",
        effectId: "effectId",
        count: 1,
        intensity: 50
      };
      expect(true).assertTrue();
      done();
    })

    /**
     *
     * @tc.number    : UniversalVibratorJsTest10
     * @tc.name      : UniversalVibratorJsTest10
     * @tc.desc      : test vibrateTime
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest10", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest10"
      let vibrateTime: vibrator.VibrateTime = {
        type: "time",
        duration: 10000,
      };
      expect(true).assertTrue();
      done();
    })

    /**
     *
     * @tc.number    : UniversalVibratorJsTest11
     * @tc.name      : UniversalVibratorJsTest11
     * @tc.desc      : test vibrateAttribute
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest11", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest11"
      let vibrateAttribute: vibrator.VibrateAttribute = {
        id: 1,
        usage: 'unknown',
        systemUsage: true,
      };
      expect(true).assertTrue();
      done();
    })

    /**
     *
     * @tc.number    : UniversalVibratorJsTest12
     * @tc.name      : UniversalVibratorJsTest12
     * @tc.desc      : test VibratorEvent
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest12", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest12"
      let eventType = vibrator.VibratorEventType.CONTINUOUS;
      let points: Array<vibrator.VibratorCurvePoint> = [{}];
      let events: Array<vibrator.VibratorEvent> = [
        {
          eventType: eventType,
          points: points,
        }
      ]
      let patt: vibrator.VibratorPattern = {
        events: events,
      };
      let pattern: vibrator.VibrateFromPattern = {
        type: "pattern",
        pattern: patt,
      };
      expect(true).assertTrue();
      done();
    })

    /**
     *
     * @tc.number    : UniversalVibratorJsTest13
     * @tc.name      : UniversalVibratorJsTest13
     * @tc.desc      : test vibrateFromFile
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("UniversalVibratorJsTest13", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      TAG = "UniversalVibratorJsTest13"
      let hapticFileDescriptor: vibrator.HapticFileDescriptor = {};
      let vibrateFromFile: vibrator.VibrateFromFile = {
        type: "file",
        hapticFd: hapticFileDescriptor,
      };
      expect(true).assertTrue();
      done();
    })

  })
}