
    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_5900
     * @tc.name       : testOHVideoEncoderStop059
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop059', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_6000
     * @tc.name       : testOHVideoEncoderStop060
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop060', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_6100
     * @tc.name       : testOHVideoEncoderStop061
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop061', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_6200
     * @tc.name       : testOHVideoEncoderStop062
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop062', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_6300
     * @tc.name       : testOHVideoEncoderStop063
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop063', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_6400
     * @tc.name       : testOHVideoEncoderStop064
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop064', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_STOP_6500
     * @tc.name       : testOHVideoEncoderStop065
     * @tc.desc       : test OH_VideoEncoder_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderStop065', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderStop(0,0,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_0100
     * @tc.name       : testOHVideoEncoderFlush001
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush001', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,1,1,1,1,1);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderFlush001 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_0200
     * @tc.name       : testOHVideoEncoderFlush002
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush002', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderFlush(2,1,1,1,1,1,1);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderFlush002 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_0300
     * @tc.name       : testOHVideoEncoderFlush003
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush003', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_0400
     * @tc.name       : testOHVideoEncoderFlush004
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush004', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,1,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_0500
     * @tc.name       : testOHVideoEncoderFlush005
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush005', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_0600
     * @tc.name       : testOHVideoEncoderFlush006
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush006', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,1,0,1,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderFlush006 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_0700
     * @tc.name       : testOHVideoEncoderFlush007
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush007', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_0800
     * @tc.name       : testOHVideoEncoderFlush008
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush008', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_0900
     * @tc.name       : testOHVideoEncoderFlush009
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush009', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_1000
     * @tc.name       : testOHVideoEncoderFlush010
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush010', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_1100
     * @tc.name       : testOHVideoEncoderFlush011
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush011', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_1200
     * @tc.name       : testOHVideoEncoderFlush012
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush012', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_1300
     * @tc.name       : testOHVideoEncoderFlush013
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush013', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_1400
     * @tc.name       : testOHVideoEncoderFlush014
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush014', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_1500
     * @tc.name       : testOHVideoEncoderFlush015
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush015', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_1600
     * @tc.name       : testOHVideoEncoderFlush016
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush016', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_1700
     * @tc.name       : testOHVideoEncoderFlush017
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush017', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,1,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_1800
     * @tc.name       : testOHVideoEncoderFlush018
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush018', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,1,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_1900
     * @tc.name       : testOHVideoEncoderFlush019
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush019', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_2000
     * @tc.name       : testOHVideoEncoderFlush020
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush020', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,1,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_2100
     * @tc.name       : testOHVideoEncoderFlush021
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush021', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_2200
     * @tc.name       : testOHVideoEncoderFlush022
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush022', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,1,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_2300
     * @tc.name       : testOHVideoEncoderFlush023
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush023', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_2400
     * @tc.name       : testOHVideoEncoderFlush024
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush024', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_2500
     * @tc.name       : testOHVideoEncoderFlush025
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush025', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_2600
     * @tc.name       : testOHVideoEncoderFlush026
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush026', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_2700
     * @tc.name       : testOHVideoEncoderFlush027
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush027', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_2800
     * @tc.name       : testOHVideoEncoderFlush028
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush028', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_2900
     * @tc.name       : testOHVideoEncoderFlush029
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush029', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_3000
     * @tc.name       : testOHVideoEncoderFlush030
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush030', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_3100
     * @tc.name       : testOHVideoEncoderFlush031
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush031', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_3200
     * @tc.name       : testOHVideoEncoderFlush032
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush032', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_3300
     * @tc.name       : testOHVideoEncoderFlush033
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush033', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(1,0,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_3400
     * @tc.name       : testOHVideoEncoderFlush034
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush034', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,1,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_3500
     * @tc.name       : testOHVideoEncoderFlush035
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush035', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_3600
     * @tc.name       : testOHVideoEncoderFlush036
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush036', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,1,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_3700
     * @tc.name       : testOHVideoEncoderFlush037
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush037', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_3800
     * @tc.name       : testOHVideoEncoderFlush038
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush038', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,1,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_3900
     * @tc.name       : testOHVideoEncoderFlush039
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush039', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_4000
     * @tc.name       : testOHVideoEncoderFlush040
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush040', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_4100
     * @tc.name       : testOHVideoEncoderFlush041
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush041', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_4200
     * @tc.name       : testOHVideoEncoderFlush042
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush042', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_4300
     * @tc.name       : testOHVideoEncoderFlush043
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush043', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_4400
     * @tc.name       : testOHVideoEncoderFlush044
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush044', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_4500
     * @tc.name       : testOHVideoEncoderFlush045
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush045', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_4600
     * @tc.name       : testOHVideoEncoderFlush046
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush046', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_4700
     * @tc.name       : testOHVideoEncoderFlush047
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush047', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_4800
     * @tc.name       : testOHVideoEncoderFlush048
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush048', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_4900
     * @tc.name       : testOHVideoEncoderFlush049
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush049', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,1,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_5000
     * @tc.name       : testOHVideoEncoderFlush050
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush050', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,1,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_5100
     * @tc.name       : testOHVideoEncoderFlush051
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush051', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_5200
     * @tc.name       : testOHVideoEncoderFlush052
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush052', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,1,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_5300
     * @tc.name       : testOHVideoEncoderFlush053
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush053', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_5400
     * @tc.name       : testOHVideoEncoderFlush054
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush054', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,1,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_5500
     * @tc.name       : testOHVideoEncoderFlush055
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush055', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_5600
     * @tc.name       : testOHVideoEncoderFlush056
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush056', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_5700
     * @tc.name       : testOHVideoEncoderFlush057
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush057', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_5800
     * @tc.name       : testOHVideoEncoderFlush058
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush058', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_5900
     * @tc.name       : testOHVideoEncoderFlush059
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush059', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_6000
     * @tc.name       : testOHVideoEncoderFlush060
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush060', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_6100
     * @tc.name       : testOHVideoEncoderFlush061
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush061', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_6200
     * @tc.name       : testOHVideoEncoderFlush062
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush062', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_6300
     * @tc.name       : testOHVideoEncoderFlush063
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush063', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_6400
     * @tc.name       : testOHVideoEncoderFlush064
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush064', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_FLUSH_6500
     * @tc.name       : testOHVideoEncoderFlush065
     * @tc.desc       : test OH_VideoEncoder_Flush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderFlush065', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderFlush(0,0,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_0100
     * @tc.name       : testOHVideoEncoderReset001
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset001', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderReset(1,1,1,1,1,1,1);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderReset001 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_0200
     * @tc.name       : testOHVideoEncoderReset002
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset002', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderReset(2,1,1,1,1,1,1);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderReset002 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_0300
     * @tc.name       : testOHVideoEncoderReset003
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset003', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,1,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_0400
     * @tc.name       : testOHVideoEncoderReset004
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset004', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderReset(1,1,1,1,0,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderReset004 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_0500
     * @tc.name       : testOHVideoEncoderReset005
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset005', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,1,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_0600
     * @tc.name       : testOHVideoEncoderReset006
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset006', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderReset(1,1,1,0,1,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderReset006 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_0700
     * @tc.name       : testOHVideoEncoderReset007
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset007', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,1,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_0800
     * @tc.name       : testOHVideoEncoderReset008
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset008', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderReset(1,1,1,0,0,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderReset008 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_0900
     * @tc.name       : testOHVideoEncoderReset009
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset009', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,1,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_1000
     * @tc.name       : testOHVideoEncoderReset010
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset010', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderReset(1,1,0,1,1,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderReset010 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_1100
     * @tc.name       : testOHVideoEncoderReset011
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset011', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,1,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_1200
     * @tc.name       : testOHVideoEncoderReset012
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset012', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderReset(1,1,0,1,0,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderReset012 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_1300
     * @tc.name       : testOHVideoEncoderReset013
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset013', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,1,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_1400
     * @tc.name       : testOHVideoEncoderReset014
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset014', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderReset(1,1,0,0,1,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderReset014 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_1500
     * @tc.name       : testOHVideoEncoderReset015
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset015', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,1,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_1600
     * @tc.name       : testOHVideoEncoderReset016
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset016', 0, async (done: Function) => {
        try {
            let result: number = videoencoderndk.oHVideoEncoderReset(1,1,0,0,0,1,0);
            expect(result != null).assertTrue();
            done();
        } catch (err) {
            console.info('testOHVideoEncoderReset016 failed, error is' + err.message);
            expect(false).assertTrue();
        }
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_1700
     * @tc.name       : testOHVideoEncoderReset017
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset017', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,1,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_1800
     * @tc.name       : testOHVideoEncoderReset018
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset018', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,1,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_1900
     * @tc.name       : testOHVideoEncoderReset019
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset019', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_2000
     * @tc.name       : testOHVideoEncoderReset020
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset020', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,1,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_2100
     * @tc.name       : testOHVideoEncoderReset021
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset021', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_2200
     * @tc.name       : testOHVideoEncoderReset022
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset022', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,1,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_2300
     * @tc.name       : testOHVideoEncoderReset023
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset023', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_2400
     * @tc.name       : testOHVideoEncoderReset024
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset024', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_2500
     * @tc.name       : testOHVideoEncoderReset025
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset025', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_2600
     * @tc.name       : testOHVideoEncoderReset026
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset026', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_2700
     * @tc.name       : testOHVideoEncoderReset027
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset027', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,0,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_2800
     * @tc.name       : testOHVideoEncoderReset028
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset028', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,0,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_2900
     * @tc.name       : testOHVideoEncoderReset029
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset029', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,0,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_3000
     * @tc.name       : testOHVideoEncoderReset030
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset030', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,0,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_3100
     * @tc.name       : testOHVideoEncoderReset031
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset031', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,0,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_3200
     * @tc.name       : testOHVideoEncoderReset032
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset032', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,0,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_3300
     * @tc.name       : testOHVideoEncoderReset033
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset033', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(1,0,0,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_3400
     * @tc.name       : testOHVideoEncoderReset034
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset034', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,1,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_3500
     * @tc.name       : testOHVideoEncoderReset035
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset035', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,1,1,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_3600
     * @tc.name       : testOHVideoEncoderReset036
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset036', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,1,1,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_3700
     * @tc.name       : testOHVideoEncoderReset037
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset037', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,1,1,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_3800
     * @tc.name       : testOHVideoEncoderReset038
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset038', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,1,0,1,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_3900
     * @tc.name       : testOHVideoEncoderReset039
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset039', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,1,0,1,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_4000
     * @tc.name       : testOHVideoEncoderReset040
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset040', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,1,0,0,1,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_4100
     * @tc.name       : testOHVideoEncoderReset041
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset041', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,1,0,0,0,0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEOENCODER_OH_VIDEOENCODER_RESET_4200
     * @tc.name       : testOHVideoEncoderReset042
     * @tc.desc       : test OH_VideoEncoder_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHVideoEncoderReset042', 0, async (done: Function) => {
      let result: number = videoencoderndk.oHVideoEncoderReset(0,1,0,1,1,1,0);
      expect(result).assertEqual(0);
      done();
    });