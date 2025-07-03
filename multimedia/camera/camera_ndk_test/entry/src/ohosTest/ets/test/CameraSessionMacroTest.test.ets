    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_003
     * @tc.name      : Check capture session enable macro  with promise 
     * @tc.desc      : Check capture session enable macro  with promise 
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_003', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_003--------------");
      let sessionIsMacroSupported = cameraObj.sessionIsMacroSupported(0);
      if (!sessionIsMacroSupported.isMacroSupported) {
        let ret = cameraObj.sessionEnableMacro(0,false);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_003 ret is "+ ret);
        expect(ret).assertEqual(CAMERA_OPERATION_NOT_ALLOWED);
      }
    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_003 ends here");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_004
     * @tc.name      : Check capture session enable macro  with promise 
     * @tc.desc      : Check capture session enable macro  with promise 
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_004', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_004--------------");
      let sessionIsMacroSupported = cameraObj.sessionIsMacroSupported(0);
      if (!sessionIsMacroSupported.isMacroSupported) {
        let ret = cameraObj.sessionEnableMacro(0,true);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_004 ret is "+ ret);
        expect(ret).assertEqual(CAMERA_OPERATION_NOT_ALLOWED);
    }
    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_004 ends here");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_005
     * @tc.name      : Check capture session enable macro  with promise 
     * @tc.desc      : Check capture session enable macro  with promise 
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_005', Level.LEVEL0, async () => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_005--------------");
      let sessionIsMacroSupported = cameraObj.sessionIsMacroSupported(0);
      if (sessionIsMacroSupported.isMacroSupported) {
        let ret = cameraObj.sessionEnableMacro(1,true);
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_005 ret is "+ ret);
        expect(ret).assertEqual(CAMERA_INVALID_ARGUMENT);
    }
    console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_NDK_SESSION_ENABLE_MACRO_PROMISE_005 ends here");
    });