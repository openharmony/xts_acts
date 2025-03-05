    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_4200
     * @tc.name      : test requestVideo with deliveryMode: balancedMode and sourceMode: -100
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with deliveryMode: balancedMode and sourceMode: -100
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_source_mode_100_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_source_mode_100_compatible';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        sourceMode: -100,
        compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
      };
      await requestVideoRequestOptionsErrorHdr(testNum, done, requestOptions);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_4300
     * @tc.name      : test requestVideo with deliveryMode: balancedMode and sourceMode: -100
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with deliveryMode: balancedMode and sourceMode: -100
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_source_mode_100_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_source_mode_100_compatible_onprogress';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        sourceMode: -100,
        compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        mediaAssetProgressHandler: TestHandler,
      };
      await requestVideoRequestOptionsErrorHdr(testNum, done, requestOptions);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_4400
     * @tc.name      : test requestVideo with deliveryMode: -100 and sourceMode: EDITED_MODE
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with deliveryMode: -100 and sourceMode: EDITED_MODE
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_mode_100_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_mode_100_compatible';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: -100,
        sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
        compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
      };
      await requestVideoRequestOptionsErrorHdr(testNum, done, requestOptions);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_4500
     * @tc.name      : test requestVideo with deliveryMode: -100 and sourceMode: EDITED_MODE
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with deliveryMode: -100 and sourceMode: EDITED_MODE
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_mode_100_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_mode_100_compatible_onprogress';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: -100,
        sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
        compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        mediaAssetProgressHandler: TestHandler,
      };
      await requestVideoRequestOptionsErrorHdr(testNum, done, requestOptions);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_4600
     * @tc.name      : test requestVideo with photoAsset = null
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with photoAsset = null
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_null_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_null_compatible';
      let photoAsset: ESObject = null;
      await requestVideoPhotoAssetErrorCompatible(testNum, done, photoAsset);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_4700
     * @tc.name      : test requestVideo with photoAsset = null
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with photoAsset = null
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_null_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_null_compatible_onprogress';
      let photoAsset: ESObject = null;
      await requestVideoPhotoAssetErrorCompatibleOnprogress(testNum, done, photoAsset);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_4800
     * @tc.name      : test requestVideo with photoAsset = undefined
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with photoAsset = undefined
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_undefined_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_undefined_compatible';
      let photoAsset: ESObject = undefined;
      await requestVideoPhotoAssetErrorCompatible(testNum, done, photoAsset);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_4900
     * @tc.name      : test requestVideo with photoAsset = undefined
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with photoAsset = undefined
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_undefined_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_undefined_compatible_onprogress';
      let photoAsset: ESObject = undefined;
      await requestVideoPhotoAssetErrorCompatibleOnprogress(testNum, done, photoAsset);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_5000
     * @tc.name      : test requestVideo with photoAsset = 'test'
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with photoAsset = 'test'
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_test_string_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_test_string_compatible';
      let photoAsset: ESObject = 'test';
      await requestVideoPhotoAssetErrorCompatible(testNum, done, photoAsset);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_5100
     * @tc.name      : test requestVideo with photoAsset = 'test'
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with photoAsset = 'test'
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_test_string_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_test_string_compatible_onprogress';
      let photoAsset: ESObject = 'test';
      await requestVideoPhotoAssetErrorCompatibleOnprogress(testNum, done, photoAsset);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_5200
     * @tc.name      : test requestVideo with photoAsset = true
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with photoAsset = true
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_true_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_true_compatible';
      let photoAsset: ESObject = true;
      await requestVideoPhotoAssetErrorCompatible(testNum, done, photoAsset);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_5300
     * @tc.name      : test requestVideo with photoAsset = true
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with photoAsset = true
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_true_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_true_compatible_onprogress';
      let photoAsset: ESObject = true;
      await requestVideoPhotoAssetErrorCompatibleOnprogress(testNum, done, photoAsset);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_5400
     * @tc.name      : test requestVideo with photoAsset = {a: 10}
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with photoAsset = {a: 10}
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_object_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_object_compatible';
      let photoAsset: ESObject = {
        a: 10
      };
      await requestVideoPhotoAssetErrorCompatible(testNum, done, photoAsset);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_5500
     * @tc.name      : test requestVideo with photoAsset = {a: 10}
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with photoAsset = {a: 10}
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_object_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_object_compatible_onprogress';
      let photoAsset: ESObject = {
        a: 10
      };
      await requestVideoPhotoAssetErrorCompatibleOnprogress(testNum, done, photoAsset);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_5600
     * @tc.name      : test requestVideo with fileUri = null
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with fileUri = null
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_null_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_null_compatible';
      let fileUri: ESObject = null;
      let errCode = '401';
      await requestVideoDestUriErrorCompatible(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_5700
     * @tc.name      : test requestVideo with fileUri = null
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with fileUri = null
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_null_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_null_compatible_onprogress';
      let fileUri: ESObject = null;
      let errCode = '401';
      await requestVideoDestUriErrorCompatibleOnprogress(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_5800
     * @tc.name      : test requestVideo with fileUri = undefined
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with fileUri = undefined
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_undefined_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_undefined_compatible';
      let fileUri: ESObject = undefined;
      let errCode = '401';
      await requestVideoDestUriErrorCompatible(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_5900
     * @tc.name      : test requestVideo with fileUri = undefined
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with fileUri = undefined
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_undefined_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_undefined_compatible_onprogress';
      let fileUri: ESObject = undefined;
      let errCode = '401';
      await requestVideoDestUriErrorCompatibleOnprogress(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_6000
     * @tc.name      : test requestVideo with fileUri = true
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with fileUri = true
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_true_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_true_compatible';
      let fileUri: ESObject = true;
      let errCode = '401';
      await requestVideoDestUriErrorCompatible(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_6100
     * @tc.name      : test requestVideo with fileUri = true
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with fileUri = true
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_true_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_true_compatible_onprogress';
      let fileUri: ESObject = true;
      let errCode = '401';
      await requestVideoDestUriErrorCompatibleOnprogress(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_6200
     * @tc.name      : test requestVideo with fileUri = 'aaaaa.....mp4'(length = 384)
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with fileUri = 'aaaaa.....mp4'(length = 384)
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_test_string_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_test_string_compatible';
      let fileUri = '';
      for (let i = 0; i < 380; i++) {
        fileUri += 'a';
      }
      fileUri += '.mp4';
      let errCode = '401';
      await requestVideoDestUriErrorCompatible(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_6300
     * @tc.name      : test requestVideo with fileUri = 'aaaaa.....mp4'(length = 384)
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with fileUri = 'aaaaa.....mp4'(length = 384)
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_test_string_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_test_string_compatible_onprogress';
      let fileUri = '';
      for (let i = 0; i < 380; i++) {
        fileUri += 'a';
      }
      fileUri += '.mp4';
      let errCode = '401';
      await requestVideoDestUriErrorCompatibleOnprogress(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_6400
     * @tc.name      : test requestVideo with fileUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with fileUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_special_chat_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_special_chat_compatible';
      let fileUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ ';
      let errCode = '401';
      await requestVideoDestUriErrorCompatible(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_6500
     * @tc.name      : test requestVideo with fileUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with fileUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_special_chat_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_special_chat_compatible_onprogress';
      let fileUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ ';
      let errCode = '401';
      await requestVideoDestUriErrorCompatibleOnprogress(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_6600
     * @tc.name      : test requestVideo with fileUri = 'a...a'(length = 385)
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with fileUri = 'a...a'(length = 385)
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_extr_long_string_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_extr_long_string_compatible';
      let fileUri = '';
      for (let i = 0; i < 385; i++) {
        fileUri += 'a';
      }
      let errCode = '401';
      await requestVideoDestUriErrorCompatible(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_6700
     * @tc.name      : test requestVideo with fileUri = 'a...a'(length = 385)
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with fileUri = 'a...a'(length = 385)
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_extr_long_string_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_extr_long_string_compatible_onprogress';
      let fileUri = '';
      for (let i = 0; i < 385; i++) {
        fileUri += 'a';
      }
      let errCode = '401';
      await requestVideoDestUriErrorCompatibleOnprogress(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_6800
     * @tc.name      : test requestVideo with photoAsset : imageAsset
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with photoAsset : imageAsset
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photoAsset_imageAsset_compatible', 0, async (done: Function) => {
      if (!isSupportHdr) {
        console.log('device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let testNum = 'request_video_photoAsset_imageAsset_compatible';
        try {
          let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image.jpg");
          let fetchResult = await helper.getAssets(fetchOps);
          let photoAsset = await fetchResult.getFirstObject();
          let destUri: string = createSandboxFileUri(testContext, 'mp4');

          class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
            onDataPrepared(data: boolean) {
              console.info(`${testNum} succeed`);
              expect(false).assertTrue();
              done();
            }
          }

          let requestOptions: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
            sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
            compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
          };
          const handler = new MediaHandler();
          await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
          await isHdr(testNum, destUri);
        } catch (error) {
          console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
          expect(error.code).assertEqual('401');
          done();
        }
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_6900
     * @tc.name      : test requestVideo with photoAsset : imageAsset
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with photoAsset : imageAsset
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photoAsset_imageAsset_compatible_onprogress', 0, async (done: Function) => {
      if (!isSupportHdr) {
        console.log('device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let testNum = 'request_video_photoAsset_imageAsset_compatible_onprogress';
        try {
          let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image.jpg");
          let fetchResult = await helper.getAssets(fetchOps);
          let photoAsset = await fetchResult.getFirstObject();
          let destUri: string = createSandboxFileUri(testContext, 'mp4');

          class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
            onDataPrepared(data: boolean) {
              console.info(`${testNum} succeed`);
              expect(false).assertTrue();
              done();
            }
          }

          let requestOptions: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
            sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
            compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
            mediaAssetProgressHandler: TestHandler,
          };
          const handler = new MediaHandler();
          await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
          await isHdr(testNum, destUri);
        } catch (error) {
          console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
          expect(error.code).assertEqual('401');
          done();
        }
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_7000
     * @tc.name      : test requestVideo fileUri : ***.jpg
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with fileUri : ***.jpg
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_image_compatible', 0, async (done: Function) => {
      if (!isSupportHdr) {
        console.log('device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let testNum = 'request_video_fileUri_image_compatible';
        try {
          let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_video.mp4");
          let fetchResult = await helper.getAssets(fetchOps);
          let photoAsset = await fetchResult.getFirstObject();
          let destUri: string = createSandboxFileUri(testContext, 'jpg');

          class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
            onDataPrepared(data: boolean) {
              console.info(`${testNum} succeed`);
              expect(false).assertTrue();
              done();
            }
          }

          let requestOptions: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
            sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
            compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
          };
          const handler = new MediaHandler();
          await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
          await isHdr(testNum, destUri);
        } catch (error) {
          console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
          expect(error.code).assertEqual('401');
          done();
        }
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_7100
     * @tc.name      : test requestVideo fileUri : ***.jpg
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with fileUri : ***.jpg
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_image_compatible_onprogress', 0, async (done: Function) => {
      if (!isSupportHdr) {
        console.log('device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let testNum = 'request_video_fileUri_image_compatible_onprogress';
        try {
          let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_video.mp4");
          let fetchResult = await helper.getAssets(fetchOps);
          let photoAsset = await fetchResult.getFirstObject();
          let destUri: string = createSandboxFileUri(testContext, 'jpg');

          class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
            onDataPrepared(data: boolean) {
              console.info(`${testNum} succeed`);
              expect(false).assertTrue();
              done();
            }
          }

          let requestOptions: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
            sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
            compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
            mediaAssetProgressHandler: TestHandler,
          };
          const handler = new MediaHandler();
          await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
          await isHdr(testNum, destUri);
        } catch (error) {
          console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
          expect(error.code).assertEqual('401');
          done();
        }
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_7200
     * @tc.name      : test requestVideo with fileUri: ***.jpg, photoAsset: imageAsset
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with fileUri: ***.jpg, photoAsset: imageAsset
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_imageUri_photoAsset_imageAsset_compatible', 0, async (done: Function) => {
      if (!isSupportHdr) {
        console.log('device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let testNum = 'request_video_fileUri_imageUri_photoAsset_imageAsset_compatible';
        try {
          let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image.jpg");
          let fetchResult = await helper.getAssets(fetchOps);
          let photoAsset = await fetchResult.getFirstObject();
          let destUri: string = createSandboxFileUri(testContext, 'jpg');

          class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
            onDataPrepared(data: boolean) {
              console.info(`${testNum} succeed`);
              expect(false).assertTrue();
              done();
            }
          }

          let requestOptions: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
            sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
            compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
          };
          const handler = new MediaHandler();
          await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
          await isHdr(testNum, destUri);
        } catch (error) {
          console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
          expect(error.code).assertEqual('401');
          done();
        }
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_7300
     * @tc.name      : test requestVideo with fileUri: ***.jpg, photoAsset: imageAsset
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with fileUri: ***.jpg, photoAsset: imageAsset
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_imageUri_photoAsset_imageAsset_compatible_onprogress', 0, async (done: Function) => {
      if (!isSupportHdr) {
        console.log('device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let testNum = 'request_video_fileUri_imageUri_photoAsset_imageAsset_compatible_onprogress';
        try {
          let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image.jpg");
          let fetchResult = await helper.getAssets(fetchOps);
          let photoAsset = await fetchResult.getFirstObject();
          let destUri: string = createSandboxFileUri(testContext, 'jpg');

          class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
            onDataPrepared(data: boolean) {
              console.info(`${testNum} succeed`);
              expect(false).assertTrue();
              done();
            }
          }

          let requestOptions: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
            sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
            compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
            mediaAssetProgressHandler: TestHandler,
          };
          const handler = new MediaHandler();
          await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
          await isHdr(testNum, destUri);
        } catch (error) {
          console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
          expect(error.code).assertEqual('401');
          done();
        }
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_7400
     * @tc.name      : test requestVideo with fileUri = 'test.mp4'
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with fileUri = 'test.mp4'
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_empty_string_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_empty_string_compatible';
      let fileUri = '';
      let errCode = '401';
      await requestVideoDestUriErrorCompatible(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_7500
     * @tc.name      : test requestVideo with fileUri = 'test.mp4'
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with fileUri = 'test.mp4'
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_empty_string_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_empty_string_compatible_onprogress';
      let fileUri = '';
      let errCode = '401';
      await requestVideoDestUriErrorCompatibleOnprogress(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_7600
     * @tc.name      : test requestVideo with compatibleMode -100 and deliveryMode: BALANCE_MODE
     *               : and sourceMode: originalMode
     * @tc.desc      : request video with deliveryMode: BALANCE_MODE and sourceMode: originalMode
     *-              : and compatibleMode: -100 and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_fast_source_original_compatible_illegal_compatibleMode', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_fast_source_original_compatible_illegal_compatibleMode';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        compatibleMode: -100,
      };
      await requestVideoRequestOptionsErrorHdr(testNum, done, requestOptions);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_7700
     * @tc.name      : test requestVideo with compatibleMode -100 and deliveryMode: BALANCE_MODE
     *               : and sourceMode: EDITED_MODE
     * @tc.desc      : request video with deliveryMode: BALANCE_MODE and sourceMode: EDITED_MODE
     *-              : and compatibleMode: -100 and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_fast_source_original_compatible_illegal_mode', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_fast_source_original_compatible_illegal_mode';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
        compatibleMode: -100,
      };
      await requestVideoRequestOptionsErrorHdr(testNum, done, requestOptions);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_7800
     * @tc.name      : test requestVideo with compatibleMode -100 and deliveryMode: BALANCE_MODE
     *               : and sourceMode: EDITED_MODE
     * @tc.desc      : request video with deliveryMode: BALANCE_MODE and sourceMode: EDITED_MODE
     *-              : and compatibleMode: -100 and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_hdr_video_fileUri_imageUri_photoAsset_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_hdr_video_compatible_onprogress';
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "test_hdr_1.mp4");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let destUri: string = createSandboxFileUri(testContext, 'mp4');
        let status = false;

        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          onDataPrepared(data: boolean) {
            console.info(`${testNum} succeed`);
            status = true;
          }
        }

        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
          mediaAssetProgressHandler: TestHandler,
        };
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
        await sleep(3500);
        let uri = await createVideoBySandBoxUri(testNum, testContext, destUri);
        let flag = await isHdr(testNum, uri);
        expect(flag).assertEqual(0);
        expect(status).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(true).assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_7900
     * @tc.name      : test requestVideo with compatibleMode -100 and deliveryMode: BALANCE_MODE
     *               : and sourceMode: EDITED_MODE
     * @tc.desc      : request video with deliveryMode: BALANCE_MODE and sourceMode: EDITED_MODE
     *-              : and compatibleMode: -100 and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_hdr_video_fileUri_imageUri_photoAsset_compatible', 0, async (done: Function) => {
      if (!isSupportHdr) {
        console.log('device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let testNum = 'request_hdr_video_compatible';
        try {
          let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "test_hdr_1.mp4");
          let fetchResult = await helper.getAssets(fetchOps);
          let photoAsset = await fetchResult.getFirstObject();
          let destUri: string = createSandboxFileUri(testContext, 'mp4');
          let count: number = 0;
          let opsList: Array<photoAccessHelper.RequestOptions> = [];

          class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
            onDataPrepared(data: boolean) {
              console.info(`${testNum} succeed`);
              count++;
            }
          }

          let requestOptions1: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
            sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
            compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
          };

          let requestOptions2: photoAccessHelper.RequestOptions = {
            deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
            sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
            compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
          };
          opsList.push(requestOptions1, requestOptions2);

          const handler = new MediaHandler();
          
          for (let i = 0; i < opsList.length; i++) {
            await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, opsList[i], destUri, handler);
            await sleep(3000);
            let uri = await createVideoBySandBoxUri(testNum, testContext, destUri);
            let flag = await isHdr(testNum, uri);
            expect(flag).assertEqual(1);
          }
          expect(count).assertEqual(2);
          done();
        } catch (error) {
          console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
          expect(true).assertTrue();
          done();
        }
      }
    });

  });
}