    
    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETAUDIOCHANNELCOUNTRANGE_1700
     * @tc.name       : testOHAvCapabilityGetAudioChannelCountRange017
     * @tc.desc       : test OH_AVCapability_GetAudioChannelCountRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetAudioChannelCountRange017', 0, async (done: Function) => {
      let result: number = mediacodecbasexdlndk.oHAvCapabilityGetAudioChannelCountRangePnormal();
      expect(result).assertEqual(-1);
      done();
    });
    
    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETAUDIOCHANNELCOUNTRANGE_1800
     * @tc.name       : testOHAvCapabilityGetAudioChannelCountRange018
     * @tc.desc       : test OH_AVCapability_GetAudioChannelCountRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetAudioChannelCountRange018', 0, async (done: Function) => {
      let result: number = mediacodecbasexdlndk.oHAvCapabilityGetAudioChannelCountRangeQnormal();
      expect(result).assertEqual(-1);
      done();
    });
    
    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETAUDIOCHANNELCOUNTRANGE_1900
     * @tc.name       : testOHAvCapabilityGetAudioChannelCountRange019
     * @tc.desc       : test OH_AVCapability_GetAudioChannelCountRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetAudioChannelCountRange019', 0, async (done: Function) => {
      let result: number = mediacodecbasexdlndk.oHAvCapabilityGetAudioChannelCountRangeRnormal();
      expect(result).assertEqual(-1);
      done();
    });
    
    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETAUDIOCHANNELCOUNTRANGE_2000
     * @tc.name       : testOHAvCapabilityGetAudioChannelCountRange020
     * @tc.desc       : test OH_AVCapability_GetAudioChannelCountRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetAudioChannelCountRange020', 0, async (done: Function) => {
      let result: number = mediacodecbasexdlndk.oHAvCapabilityGetAudioChannelCountRangeSnormal();
      expect(result).assertEqual(-1);
      done();
    });
    
    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHALIGNMENT_0200
     * @tc.name       : testOHAvCapabilityGetVideoWidthAlignment002
     * @tc.desc       : test OH_AVCapability_GetVideoWidthAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthAlignment002', 0, async (done: Function) => {
      let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoWidthAlignmentAnormal();
      expect(result).assertEqual(-1);
      done();
    });
    
    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHALIGNMENT_0300
     * @tc.name       : testOHAvCapabilityGetVideoWidthAlignment003
     * @tc.desc       : test OH_AVCapability_GetVideoWidthAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthAlignment003', 0, async (done: Function) => {
      try {
        let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoWidthAlignmentBnormal();
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetVideoWidthAlignment003 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });
    
    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHALIGNMENT_0400
     * @tc.name       : testOHAvCapabilityGetVideoWidthAlignment004
     * @tc.desc       : test OH_AVCapability_GetVideoWidthAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthAlignment004', 0, async (done: Function) => {
      let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoWidthAlignmentCnormal();
      expect(result).assertEqual(0);
      done();
    });
    
    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHALIGNMENT_0500
     * @tc.name       : testOHAvCapabilityGetVideoWidthAlignment005
     * @tc.desc       : test OH_AVCapability_GetVideoWidthAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthAlignment005', 0, async (done: Function) => {
      let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoWidthAlignmentDnormal();
      expect(result).assertEqual(-1);
      done();
    });
    
    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHALIGNMENT_0600
     * @tc.name       : testOHAvCapabilityGetVideoWidthAlignment006
     * @tc.desc       : test OH_AVCapability_GetVideoWidthAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthAlignment006', 0, async (done: Function) => {
      try {
        let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoWidthAlignmentEnormal();
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetVideoWidthAlignment006 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });
    
    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHALIGNMENT_0700
     * @tc.name       : testOHAvCapabilityGetVideoWidthAlignment007
     * @tc.desc       : test OH_AVCapability_GetVideoWidthAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthAlignment007', 0, async (done: Function) => {
      try {
        let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoWidthAlignmentFnormal();
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOHAvCapabilityGetVideoWidthAlignment007 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });
    
    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHALIGNMENT_0800
     * @tc.name       : testOHAvCapabilityGetVideoWidthAlignment008
     * @tc.desc       : test OH_AVCapability_GetVideoWidthAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthAlignment008', 0, async (done: Function) => {
      try {
        let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoWidthAlignmentGnormal();
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoWidthAlignment008 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });
    
    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHALIGNMENT_0900
     * @tc.name       : testOHAvCapabilityGetVideoWidthAlignment009
     * @tc.desc       : test OH_AVCapability_GetVideoWidthAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthAlignment009', 0, async (done: Function) => {
      try {
        let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoWidthAlignmentHnormal();
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoWidthAlignment009 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });
    
    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHALIGNMENT_1000
     * @tc.name       : testOHAvCapabilityGetVideoWidthAlignment010
     * @tc.desc       : test OH_AVCapability_GetVideoWidthAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthAlignment010', 0, async (done: Function) => {
      try {
        let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoWidthAlignmentInormal();
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOHAvCapabilityGetVideoWidthAlignment010 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });
    
    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHALIGNMENT_1100
     * @tc.name       : testOHAvCapabilityGetVideoWidthAlignment011
     * @tc.desc       : test OH_AVCapability_GetVideoWidthAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthAlignment011', 0, async (done: Function) => {
      let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoWidthAlignmentJnormal();
      expect(result).assertEqual(-1);
      done();
    });
    
    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHALIGNMENT_1200
     * @tc.name       : testOHAvCapabilityGetVideoWidthAlignment012
     * @tc.desc       : test OH_AVCapability_GetVideoWidthAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthAlignment012', 0, async (done: Function) => {
      let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoWidthAlignmentKnormal();
      expect(result).assertEqual(-1);
      done();
    });
    
    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHALIGNMENT_1300
     * @tc.name       : testOHAvCapabilityGetVideoWidthAlignment013
     * @tc.desc       : test OH_AVCapability_GetVideoWidthAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthAlignment013', 0, async (done: Function) => {
      let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoWidthAlignmentLnormal();
      expect(result).assertEqual(0);
      done();
    });
    
    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHALIGNMENT_1400
     * @tc.name       : testOHAvCapabilityGetVideoWidthAlignment014
     * @tc.desc       : test OH_AVCapability_GetVideoWidthAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHAvCapabilityGetVideoWidthAlignment014', 0, async (done: Function) => {
      let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoWidthAlignmentMnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTALIGNMENT_0200
     * @tc.name       : testOhAvCapabilityGetVideoHeightAlignment002
     * @tc.desc       : test OH_AVCapability_GetVideoHeightAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetVideoHeightAlignment002', 0, async (done: Function) => {
      let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoHeightAlignmentAnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTALIGNMENT_0300
     * @tc.name       : testOhAvCapabilityGetVideoHeightAlignment003
     * @tc.desc       : test OH_AVCapability_GetVideoHeightAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetVideoHeightAlignment003', 0, async (done: Function) => {
      try {
        let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoHeightAlignmentBnormal();
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOhAvCapabilityGetVideoHeightAlignment003 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTALIGNMENT_0400
     * @tc.name       : testOhAvCapabilityGetVideoHeightAlignment004
     * @tc.desc       : test OH_AVCapability_GetVideoHeightAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetVideoHeightAlignment004', 0, async (done: Function) => {
      let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoHeightAlignmentCnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTALIGNMENT_0500
     * @tc.name       : testOhAvCapabilityGetVideoHeightAlignment005
     * @tc.desc       : test OH_AVCapability_GetVideoHeightAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetVideoHeightAlignment005', 0, async (done: Function) => {
      let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoHeightAlignmentDnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTALIGNMENT_0600
     * @tc.name       : testOhAvCapabilityGetVideoHeightAlignment006
     * @tc.desc       : test OH_AVCapability_GetVideoHeightAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetVideoHeightAlignment006', 0, async (done: Function) => {
      try {
        let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoHeightAlignmentEnormal();
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOhAvCapabilityGetVideoHeightAlignment006 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTALIGNMENT_0700
     * @tc.name       : testOhAvCapabilityGetVideoHeightAlignment007
     * @tc.desc       : test OH_AVCapability_GetVideoHeightAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetVideoHeightAlignment007', 0, async (done: Function) => {
      try {
        let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoHeightAlignmentFnormal();
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOhAvCapabilityGetVideoHeightAlignment007 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTALIGNMENT_0800
     * @tc.name       : testOhAvCapabilityGetVideoHeightAlignment008
     * @tc.desc       : test OH_AVCapability_GetVideoHeightAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetVideoHeightAlignment008', 0, async (done: Function) => {
      try {
        let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoHeightAlignmentGnormal();
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOhAvCapabilityGetVideoHeightAlignment008 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTALIGNMENT_0900
     * @tc.name       : testOhAvCapabilityGetVideoHeightAlignment009
     * @tc.desc       : test OH_AVCapability_GetVideoHeightAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetVideoHeightAlignment009', 0, async (done: Function) => {
      try {
        let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoHeightAlignmentHnormal();
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOhAvCapabilityGetVideoHeightAlignment009 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTALIGNMENT_1000
     * @tc.name       : testOhAvCapabilityGetVideoHeightAlignment010
     * @tc.desc       : test OH_AVCapability_GetVideoHeightAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetVideoHeightAlignment010', 0, async (done: Function) => {
      let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoHeightAlignmentInormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTALIGNMENT_1100
     * @tc.name       : testOhAvCapabilityGetVideoHeightAlignment011
     * @tc.desc       : test OH_AVCapability_GetVideoHeightAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetVideoHeightAlignment011', 0, async (done: Function) => {
      let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoHeightAlignmentJnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTALIGNMENT_1200
     * @tc.name       : testOhAvCapabilityGetVideoHeightAlignment012
     * @tc.desc       : test OH_AVCapability_GetVideoHeightAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetVideoHeightAlignment012', 0, async (done: Function) => {
      try {
        let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoHeightAlignmentKnormal();
        expect(result != null).assertTrue();
        done();
      } catch(err) {
        console.info('testOhAvCapabilityGetVideoHeightAlignment012 failed, error is' + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTALIGNMENT_1300
     * @tc.name       : testOhAvCapabilityGetVideoHeightAlignment013
     * @tc.desc       : test OH_AVCapability_GetVideoHeightAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetVideoHeightAlignment013', 0, async (done: Function) => {
      let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoHeightAlignmentLnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTALIGNMENT_1400
     * @tc.name       : testOhAvCapabilityGetVideoHeightAlignment014
     * @tc.desc       : test OH_AVCapability_GetVideoHeightAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetVideoHeightAlignment014', 0, async (done: Function) => {
      let result: number = mediacodecbasexdlndk.oHAvCapabilityGetVideoHeightAlignmentMnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERQUALITYRANGE_0100
     * @tc.name       : testOhAvCapabilityGetEncoderQualityRange001
     * @tc.desc       : test OH_AVCapability_GetEncoderQualityRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetEncoderQualityRange001', 0, async (done: Function) => {
      try {
        let result: number = mediacodecbasexdlndk.OH_AVCapability_GetEncoderQualityRange();
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOhAvCapabilityGetEncoderQualityRange001 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETENCODERCOMPLEXITYRANGE_0100
     * @tc.name       : testOhAvCapabilityGetEncoderComplexityRange001
     * @tc.desc       : test OH_AVCapability_GetEncoderComplexityRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetEncoderComplexityRange001', 0, async (done: Function) => {
      try {
        let result: number = mediacodecbasexdlndk.OH_AVCapability_GetEncoderComplexityRange();
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOhAvCapabilityGetEncoderComplexityRange001 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETAUDIOSUPPORTEDSAMPLERATES_0100
     * @tc.name       : testOhAvCapabilityGetAudioSupportedSampleRates001
     * @tc.desc       : test OH_AVCapability_GetAudioSupportedSampleRates
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetAudioSupportedSampleRates001', 0, async (done: Function) => {
      expect(mediacodecbasexdlndk.OH_AVCapability_GetAudioSupportedSampleRates()).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETAUDIOCHANNELCOUNTRANGE_0100
     * @tc.name       : testOhAvCapabilityGetAudioChannelCountRange001
     * @tc.desc       : test OH_AVCapability_GetAudioChannelCountRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetAudioChannelCountRange001', 0, async (done: Function) => {
      expect(mediacodecbasexdlndk.OH_AVCapability_GetAudioChannelCountRange()).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHALIGNMENT_0100
     * @tc.name       : testOhAvCapabilityGetVideoWidthAlignment001
     * @tc.desc       : test OH_AVCapability_GetVideoWidthAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetVideoWidthAlignment001', 0, async (done: Function) => {
      try {
        let result: number = mediacodecbasexdlndk.OH_AVCapability_GetVideoWidthAlignment();
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOhAvCapabilityGetVideoWidthAlignment001 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTALIGNMENT_0100
     * @tc.name       : testOhAvCapabilityGetVideoHeightAlignment001
     * @tc.desc       : test OH_AVCapability_GetVideoHeightAlignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetVideoHeightAlignment001', 0, async (done: Function) => {
      try {
        let result: number = mediacodecbasexdlndk.OH_AVCapability_GetVideoHeightAlignment();
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOhAvCapabilityGetVideoHeightAlignment001 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_AVCAPABILITY_OH_AVCODEC_GETCAPABILITY_0100
     * @tc.name       : testOhAvCodecGetCapability001
     * @tc.desc       : test OH_AVCodec_GetCapability
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCodecGetCapability001', 0, async (done: Function) => {
      expect(mediacodecbasexdlndk.OH_AVCodec_GetCapability()).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCODEC_GETCAPABILITYBYCATEGORY_0100
     * @tc.name       : testOhAvCodecGetCapabilityByCategory001
     * @tc.desc       : test OH_AVCodec_GetCapabilityByCategory
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCodecGetCapabilityByCategory001', 0, async (done: Function) => {
      try {
        let result: number = mediacodecbasexdlndk.OH_AVCodec_GetCapabilityByCategory();
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOhAvCodecGetCapabilityByCategory001 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOWIDTHRANGE_0100
     * @tc.name       : testOhAvCapabilityGetVideoWidthRange001
     * @tc.desc       : test OH_AVCapability_GetVideoWidthRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetVideoWidthRange001', 0, async (done: Function) => {
      try {
        let result: number = mediacodecbasexdlndk.OH_AVCapability_GetVideoWidthRange();
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOhAvCapabilityGetVideoWidthRange001 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOHEIGHTRANGE_0100
     * @tc.name       : testOhAvCapabilityGetVideoHeightRange001
     * @tc.desc       : test OH_AVCapability_GetVideoHeightRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetVideoHeightRange001', 0, async (done: Function) => {
      try {
        let result: number = mediacodecbasexdlndk.OH_AVCapability_GetVideoHeightRange();
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOhAvCapabilityGetVideoHeightRange001 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_ISVIDEOSIZESUPPORTED_0100
     * @tc.name       : testOhAvCapabilityIsVideoSizeSupported001
     * @tc.desc       : test OH_AVCapability_IsVideoSizeSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityIsVideoSizeSupported001', 0, async (done: Function) => {
      try {
        let result: number = mediacodecbasexdlndk.OH_AVCapability_IsVideoSizeSupported();
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOhAvCapabilityIsVideoSizeSupported001 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOFRAMERATERANGE_0100
     * @tc.name       : testOhAvCapabilityGetVideoFrameRateRange001
     * @tc.desc       : test OH_AVCapability_GetVideoFrameRateRange
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetVideoFrameRateRange001', 0, async (done: Function) => {
      try {
            let result: number = mediacodecbasexdlndk.OH_AVCapability_GetVideoFrameRateRange();
            expect(result != null).assertTrue();
            done();
      } catch (err) {
            console.info('testOhAvCapabilityGetVideoFrameRateRange001 failed, error is' + err.message);
            expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOFRAMERATERANGEFORSIZE_0100
     * @tc.name       : testOhAvCapabilityGetVideoFrameRateRangeForSize001
     * @tc.desc       : test OH_AVCapability_GetVideoFrameRateRangeForSize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetVideoFrameRateRangeForSize001', 0, async (done: Function) => {
      try {
        let result: number = mediacodecbasexdlndk.OH_AVCapability_GetVideoFrameRateRangeForSize();
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOhAvCapabilityGetVideoFrameRateRangeForSize001 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_AREVIDEOSIZEANDFRAMERATESUPPORTED_0100
     * @tc.name       : testOhAvCapabilityAreVideoSizeAndFrameRateSupported001
     * @tc.desc       : test OH_AVCapability_AreVideoSizeAndFrameRateSupported
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityAreVideoSizeAndFrameRateSupported001', 0, async (done: Function) => {
      expect(mediacodecbasexdlndk.OH_AVCapability_AreVideoSizeAndFrameRateSupported()).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETVIDEOSUPPORTEDPIXELFORMATS_0100
     * @tc.name       : testOhAvCapabilityGetVideoSupportedPixelFormats001
     * @tc.desc       : test OH_AVCapability_GetVideoSupportedPixelFormats
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetVideoSupportedPixelFormats001', 0, async (done: Function) => {
      try {
        let result: number = mediacodecbasexdlndk.OH_AVCapability_GetVideoSupportedPixelFormats();
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOhAvCapabilityGetVideoSupportedPixelFormats001 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETSUPPORTEDPROFILES_0100
     * @tc.name       : testOhAvCapabilityGetSupportedProfiles001
     * @tc.desc       : test OH_AVCapability_GetSupportedProfiles
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetSupportedProfiles001', 0, async (done: Function) => {
      try {
        let result: number = mediacodecbasexdlndk.OH_AVCapability_GetSupportedProfiles();
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOhAvCapabilityGetSupportedProfiles001 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCAPABILITY_OH_AVCAPABILITY_GETSUPPORTEDLEVELSFORPROFILE_0100
     * @tc.name       : testOhAvCapabilityGetSupportedLevelsForProfile001
     * @tc.desc       : test OH_AVCapability_GetSupportedLevelsForProfile
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvCapabilityGetSupportedLevelsForProfile001', 0, async (done: Function) => {
      try {
        let result: number = mediacodecbasexdlndk.OH_AVCapability_GetSupportedLevelsForProfile();
        expect(result != null).assertTrue();
	      done();
      } catch (err) {
        console.info('testOhAvCapabilityGetSupportedLevelsForProfile001 failed, error is' + err.message);
	      expect(false).assertTrue();
      }
    });

  })
}