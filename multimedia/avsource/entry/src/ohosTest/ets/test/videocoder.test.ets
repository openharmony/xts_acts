
        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_0200
         * @tc.name       : testOHVideoDecoderFlush002
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush002', 0, async (done: Function) => {
            try { 
                let result: number = videodecoderndk.oHVideoDecoderFlush(2, 1, 1, 1, 1, 1, 1);
                expect(result != null).assertTrue();
                done();
            } catch (err) {
                console.info('testOHVideoDecoderFlush002 failed, error is' + err.message);
                expect(false).assertTrue();
            }
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_0300
         * @tc.name       : testOHVideoDecoderFlush003
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush003', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 1, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_0400
         * @tc.name       : testOHVideoDecoderFlush004
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush004', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 1, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_0500
         * @tc.name       : testOHVideoDecoderFlush005
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush005', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 1, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_0600
         * @tc.name       : testOHVideoDecoderFlush006
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush006', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 1, 0, 1, 1, 0);
            expect(result).assertEqual(-1);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_0700
         * @tc.name       : testOHVideoDecoderFlush007
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush007', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 1, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_0800
         * @tc.name       : testOHVideoDecoderFlush008
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush008', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 1, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_0900
         * @tc.name       : testOHVideoDecoderFlush009
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush009', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 1, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_1000
         * @tc.name       : testOHVideoDecoderFlush010
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush010', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 0, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_1100
         * @tc.name       : testOHVideoDecoderFlush011
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush011', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 0, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_1200
         * @tc.name       : testOHVideoDecoderFlush012
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush012', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 0, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_1300
         * @tc.name       : testOHVideoDecoderFlush013
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush013', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 0, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_1400
         * @tc.name       : testOHVideoDecoderFlush014
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush014', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 0, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_1500
         * @tc.name       : testOHVideoDecoderFlush015
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush015', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 0, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_1600
         * @tc.name       : testOHVideoDecoderFlush016
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush016', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 0, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_1700
         * @tc.name       : testOHVideoDecoderFlush017
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush017', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 1, 0, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_1800
         * @tc.name       : testOHVideoDecoderFlush018
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush018', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 1, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_1900
         * @tc.name       : testOHVideoDecoderFlush019
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush019', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 1, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_2000
         * @tc.name       : testOHVideoDecoderFlush020
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush020', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 1, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_2100
         * @tc.name       : testOHVideoDecoderFlush021
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush021', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 1, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_2200
         * @tc.name       : testOHVideoDecoderFlush022
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush022', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 1, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_2300
         * @tc.name       : testOHVideoDecoderFlush023
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush023', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 1, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_2400
         * @tc.name       : testOHVideoDecoderFlush024
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush024', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 1, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_2500
         * @tc.name       : testOHVideoDecoderFlush025
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush025', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 1, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_2600
         * @tc.name       : testOHVideoDecoderFlush026
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush026', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 0, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_2700
         * @tc.name       : testOHVideoDecoderFlush027
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush027', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 0, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_2800
         * @tc.name       : testOHVideoDecoderFlush028
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush028', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 0, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_2900
         * @tc.name       : testOHVideoDecoderFlush029
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush029', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 0, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_3000
         * @tc.name       : testOHVideoDecoderFlush030
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush030', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 0, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_3100
         * @tc.name       : testOHVideoDecoderFlush031
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush031', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 0, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_3200
         * @tc.name       : testOHVideoDecoderFlush032
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush032', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 0, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_3300
         * @tc.name       : testOHVideoDecoderFlush033
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush033', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(1, 0, 0, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_3400
         * @tc.name       : testOHVideoDecoderFlush034
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush034', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 1, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_3500
         * @tc.name       : testOHVideoDecoderFlush035
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush035', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 1, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_3600
         * @tc.name       : testOHVideoDecoderFlush036
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush036', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 1, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_3700
         * @tc.name       : testOHVideoDecoderFlush037
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush037', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 1, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_3800
         * @tc.name       : testOHVideoDecoderFlush038
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush038', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 1, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_3900
         * @tc.name       : testOHVideoDecoderFlush039
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush039', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 1, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_4000
         * @tc.name       : testOHVideoDecoderFlush040
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush040', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 1, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_4100
         * @tc.name       : testOHVideoDecoderFlush041
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush041', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 1, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_4200
         * @tc.name       : testOHVideoDecoderFlush042
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush042', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 0, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_4300
         * @tc.name       : testOHVideoDecoderFlush043
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush043', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 0, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_4400
         * @tc.name       : testOHVideoDecoderFlush044
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush044', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 0, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_4500
         * @tc.name       : testOHVideoDecoderFlush045
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush045', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 0, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_4600
         * @tc.name       : testOHVideoDecoderFlush046
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush046', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 0, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_4700
         * @tc.name       : testOHVideoDecoderFlush047
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush047', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 0, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_4800
         * @tc.name       : testOHVideoDecoderFlush048
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush048', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 0, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_4900
         * @tc.name       : testOHVideoDecoderFlush049
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush049', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 1, 0, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_5000
         * @tc.name       : testOHVideoDecoderFlush050
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush050', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 1, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_5100
         * @tc.name       : testOHVideoDecoderFlush051
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush051', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 1, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_5200
         * @tc.name       : testOHVideoDecoderFlush052
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush052', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 1, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_5300
         * @tc.name       : testOHVideoDecoderFlush053
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush053', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 1, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_5400
         * @tc.name       : testOHVideoDecoderFlush054
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush054', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 1, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_5500
         * @tc.name       : testOHVideoDecoderFlush055
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush055', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 1, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_5600
         * @tc.name       : testOHVideoDecoderFlush056
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush056', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 1, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_5700
         * @tc.name       : testOHVideoDecoderFlush057
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush057', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 1, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_5800
         * @tc.name       : testOHVideoDecoderFlush058
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush058', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 0, 1, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_5900
         * @tc.name       : testOHVideoDecoderFlush059
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush059', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 0, 1, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_6000
         * @tc.name       : testOHVideoDecoderFlush060
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush060', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 0, 1, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_6100
         * @tc.name       : testOHVideoDecoderFlush061
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush061', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 0, 1, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_6200
         * @tc.name       : testOHVideoDecoderFlush062
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush062', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 0, 0, 1, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_6300
         * @tc.name       : testOHVideoDecoderFlush063
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush063', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 0, 0, 1, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_6400
         * @tc.name       : testOHVideoDecoderFlush064
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush064', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 0, 0, 0, 1, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FLUSH_6500
         * @tc.name       : testOHVideoDecoderFlush065
         * @tc.desc       : test OH_VideoDecoder_Flush
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFlush065', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFlush(0, 0, 0, 0, 0, 0, 0);
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_RESET_0100
         * @tc.name       : testOHVideoDecoderReset001
         * @tc.desc       : test OH_VideoDecoder_Reset
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderReset001', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderReset();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_GETOUTPUTDESCRIPTION_0100
         * @tc.name       : testOHVideoDecoderGetOutputDescription001
         * @tc.desc       : test OH_VideoDecoder_GetOutputDescription
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderGetOutputDescription001', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderGetOutputDescription();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_SETPARAMETER_0100
         * @tc.name       : testOHVideoDecoderSetParameter001
         * @tc.desc       : test OH_VideoDecoder_SetParameter
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderSetParameter001', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderSetParameter();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_ISVALID_0100
         * @tc.name       : testOHVideoDecoderIsValid001
         * @tc.desc       : test OH_VideoDecoder_IsValid
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderIsValid001', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderIsValid();
            expect(result).assertEqual(0);
            done();
        });

        /**
        * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_PUSHINPUTBUFFER_0100
        * @tc.name       : testOHVideoDecoderPushInputBuffer001
        * @tc.desc       : test OH_VideoDecoder_PushInputBuffer
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 1
        */
        it('testOHVideoDecoderPushInputBuffer001', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderPushInputBuffer();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_FREEOUTPUTBUFFER_0100
         * @tc.name       : testOHVideoDecoderFreeOutputBuffer001
         * @tc.desc       : test OH_VideoDecoder_FreeOutputBuffer
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderFreeOutputBuffer001', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderFreeOutputBuffer();
            expect(result).assertEqual(0);
            done();
        });

        /**
         * @tc.number     : SUB_MULTIMEDIA_AV_CODEC_NATIVE_AVCODEC_VIDEODECODER_OH_VIDEODECODER_RENDEROUTPUTBUFFER_0100
         * @tc.name       : testOHVideoDecoderRenderOutputBuffer001
         * @tc.desc       : test OH_VideoDecoder_RenderOutputBuffer
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it('testOHVideoDecoderRenderOutputBuffer001', 0, async (done: Function) => {
            let result: number = videodecoderndk.oHVideoDecoderRenderOutputBuffer();
            expect(result).assertEqual(0);
            done();
        });
    })
}