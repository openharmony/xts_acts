
    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1200
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange012
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange012', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 0, 0, 1, 4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1300
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange013
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange013', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(6, 1, 0, 0, 1, 4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1400
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange014
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange014', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 0, 1, 4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1500
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange015
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange015', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 0, 0, 1, 5);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1600
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange016
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange016', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(1, 1, 1, 1, 1, 4);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetEncoderBitrateRange016 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1700
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange017
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange017', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 1, 1, 1, 4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1800
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange018
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange018', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 1, 1, 1, 4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_1900
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange019
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange019', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 1, 1, 1, 4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_2000
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange020
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange020', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(5, 1, 1, 1, 1, 4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_2100
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange021
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange021', 0, async (done: Function) => {
      try {
        let result: number = native.decodeMainProcess(6, 1, 1, 1, 1, 4);
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetEncoderBitrateRange021 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_2200
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange022
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange022', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 1, 1, 1, 4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERBITRATERANGE_2300
     * @tc.name       : testOHAvCapabilityGetEncoderBitrateRange023
     * @tc.desc       : test OH_AVCapability_GetEncoderBitrateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetEncoderBitrateRange023', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(7, 1, 1, 1, 1, 5);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_0200
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported002
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported002', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(2, 1, 0, 1, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_0300
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported003
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported003', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(3, 1, 0, 1, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISENCODERBITRATEMODESUPPORTED_0400
     * @tc.name       : testOHAvCapabilityIsEncoderBitrateModeSupported004
     * @tc.desc       : test OH_AVCapability_IsEncoderBitrateModeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityIsEncoderBitrateModeSupported004', 0, async (done: Function) => {
      let result: number = native.decodeMainProcess(4, 1, 0, 1, 1, 6);
      expect(result).assertEqual(-1);
      done();
    });

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
      let result: number = native.decodeMainProcess(1, 1, 0, 1, 1, 8);
      expect(result).assertEqual(-1);
      done();
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
      let result: number = native.decodeMainProcess(6, 1, 0, 1, 1, 8);
      expect(result).assertEqual(-1);
      done();
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
      let result: number = native.decodeMainProcess(1, 1, 0, 0, 1, 6);
      expect(result).assertEqual(-1);
      done();
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
      let result: number = native.decodeMainProcess(1, 1, 0, 0, 1, 7);
      expect(result).assertEqual(-1);
      done();
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
      let result: number = native.decodeMainProcess(1, 1, 0, 0, 1, 8);
      expect(result).assertEqual(-1);
      done();
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