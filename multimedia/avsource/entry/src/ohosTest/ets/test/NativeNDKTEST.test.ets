
    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_0500
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported005
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported005', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 1, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_0600
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported006
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported006', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 0, 1, 1, 6);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported006 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_0700
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported007
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported007', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 1, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_0800
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported008
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported008', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 0, 1, 1, 7);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported008 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_0900
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported009
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported009', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 1, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_1000
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported010
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported010', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 0, 1, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_1100
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported011
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported011', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 0, 1, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_1200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported012
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported012', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 1, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_1300
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported013
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported013', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 0, 1, 1, 7);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported013 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_1400
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported014
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported014', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 1, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_1500
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported015
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported015', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 0, 1, 1, 8);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported015 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_1600
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported016
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported016', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 1, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_1700
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported017
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported017', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 0, 1, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_1800
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported018
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported018', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 0, 1, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_1900
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported019
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported019', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 1, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2000
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported020
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported020', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 0, 1, 1, 8);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported020 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2100
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported021
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported021', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 1, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported022
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported022', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 0, 0, 1, 6);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported022 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported023
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported023', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 0, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported024
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported024', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 0, 0, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported025
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported025', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 1, 0, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported026
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported026', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 0, 0, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported027
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported027', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 0, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported028
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported028', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 0, 0, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported029
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported029', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 0, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported030
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported030', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 1, 0, 1, 6);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported030 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported031
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported031', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 1, 0, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported032
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported032', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 1, 0, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported033
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported033', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 1, 0, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported034
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported034', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 1, 0, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported035
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported035', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 1, 0, 1, 6);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported035 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported036
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported036', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 1, 0, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported037
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported037', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 0, 0, 1, 7);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported037 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported038
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported038', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 0, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported039
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported039', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 0, 0, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported040
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported040', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 0, 0, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported041
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported041', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 0, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported042
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported042', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 0, 0, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported043
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported043', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 0, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported044
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported044', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 1, 0, 1, 7);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported044 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported045
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported045', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 1, 0, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported046
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported046', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 1, 0, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported047
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported047', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 1, 0, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported048
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported048', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 1, 0, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported049
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported049', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 1, 0, 1, 7);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported049 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported050
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported050', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 1, 0, 1, 7);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported051
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported051', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 0, 0, 1, 8);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported051 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported052
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported052', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 0, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });


    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported055
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported055', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 0, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported056
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported056', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 0, 0, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported057
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported057', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 0, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported058
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported058', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 1, 0, 1, 8);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported058 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported059
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported059', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 1, 0, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported060
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported060', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 1, 0, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported061
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported061', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 1, 0, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported062
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported062', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 1, 0, 1, 8);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_2200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported063
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported063', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 1, 0, 1, 8);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityIsEncoderBitrateModeSupported063 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_0200
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight002
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight002', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 1, 0, 1, 9);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetVideoWidthRangeForHeight002 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_0300
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight003
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight003', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 1, 0, 1, 9);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetVideoWidthRangeForHeight003 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_0400
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight004
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight004', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 1, 0, 1, 9);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_0500
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight005
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight005', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 0, 1, 0, 1, 9);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_0600
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight006
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight006', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 0, 1, 0, 1, 9);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoWidthRangeForHeight006 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_0700
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight007
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight007', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 0, 1, 0, 1, 9);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_0800
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight008
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight008', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 0, 0, 1, 9);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoWidthRangeForHeight008 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_0900
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight009
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight009', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 0, 0, 1, 9);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_1000
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight010
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight010', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 0, 1, 9);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_1100
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight011
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight011', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 0, 0, 0, 1, 9);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoWidthRangeForHeight011 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_1200
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight012
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight012', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(7, 0, 0, 0, 1, 9);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoWidthRangeForHeight012 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_1300
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight013
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight013', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 0, 0, 0, 1, 10);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_1400
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight014
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight014', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 0, 1, 1, 9);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetVideoWidthRangeForHeight014 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_1500
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight015
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight015', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 0, 1, 1, 9);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetVideoWidthRangeForHeight015 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_1600
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight016
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight016', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 1, 1, 9);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_1700
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight017
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight017', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 0, 0, 1, 1, 9);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_1800
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight018
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight018', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 0, 0, 1, 1, 9);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoWidthRangeForHeight018 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_1900
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight019
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight019', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(7, 0, 0, 1, 1, 9);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoWidthRangeForHeight019 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGEFORHEIGHT_2000
     * @tc.name       : testOHAvCapabilityGetVideoWidthRangeForHeight020
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRangeForHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthRangeForHeight020', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 0, 0, 1, 1, 10);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_0200
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth002
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth002', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 1, 0, 1, 11);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetVideoHeightRangeForWidth002 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_0300
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth003
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth003', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 1, 0, 1, 11);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetVideoHeightRangeForWidth003 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_0400
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth004
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth004', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 1, 0, 1, 11);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_0500
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth005
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth005', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 0, 1, 0, 1, 11);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_0600
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth006
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth006', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 0, 1, 0, 1, 11);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoHeightRangeForWidth006 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_0700
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth007
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth007', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 0, 1, 0, 1, 11);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_0800
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth008
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth008', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 0, 0, 0, 1, 11);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetVideoHeightRangeForWidth008 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_0900
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth009
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth009', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 0, 0, 0, 1, 11);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoHeightRangeForWidth009 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_1000
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth010
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth010', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(7, 0, 0, 0, 1, 11);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoHeightRangeForWidth010 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_1100
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth011
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth011', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 0, 0, 1, 11);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoHeightRangeForWidth011 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_1200
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth012
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth012', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 0, 0, 1, 11);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_1300
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth013
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth013', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 0, 1, 11);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_1400
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth014
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth014', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 0, 1, 1, 11);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetVideoHeightRangeForWidth014 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_1500
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth015
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth015', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 1, 1, 11);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_1600
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth016
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth016', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 0, 0, 1, 1, 11);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_1700
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth017
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth017', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 0, 0, 1, 1, 11);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoHeightRangeForWidth017 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_1800
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth018
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth018', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(7, 0, 0, 1, 1, 11);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoHeightRangeForWidth018 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_1900
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth019
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth019', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(1, 0, 0, 1, 1, 12);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGEFORWIDTH_2000
     * @tc.name       : testOHAvCapabilityGetVideoHeightRangeForWidth020
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRangeForWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoHeightRangeForWidth020', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 0, 1, 12);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_0200
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported002
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported002', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1,1,0,1,1,13);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityAreProfileAndLevelSupported002 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_0300
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported003
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported003', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2,1,0,1,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_0400
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported004
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported004', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3,1,0,1,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_0500
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported005
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported005', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4,1,0,1,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_0600
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported006
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported006', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5,1,0,1,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_0700
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported007
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported007', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6,1,0,1,1,13);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityAreProfileAndLevelSupported007 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_0800
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported008
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported008', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7,1,0,1,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_0900
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported009
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported009', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4,0,0,1,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_1000
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported010
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported010', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2,0,0,1,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_1100
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported011
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported011', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3,0,0,1,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_1200
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported012
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported012', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5,0,0,1,1,13);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_1300
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported013
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported013', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6,0,0,1,1,13);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityAreProfileAndLevelSupported013 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_1400
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported014
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported014', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(7,0,0,1,1,13);
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityAreProfileAndLevelSupported014 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_1500
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported015
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported015', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1,1,0,1,1,14);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityAreProfileAndLevelSupported015 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREPROFILEANDLEVELSUPPORTED_1600
     * @tc.name       : testOHAvCapabilityAreProfileAndLevelSupported016
     * @tc.desc       : test OH_AVCapability_AreProfileAndLevelSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityAreProfileAndLevelSupported016', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2,1,0,1,1,14);
      expect(result).assertEqual(-1);
      done();
    });