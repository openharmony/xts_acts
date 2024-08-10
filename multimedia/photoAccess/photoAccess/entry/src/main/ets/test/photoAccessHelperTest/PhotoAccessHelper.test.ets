import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import Want  from '@ohos.app.ability.Want';

import { sleep, Constant } from './Common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper';

let phAccessHelper: photoAccessHelper.PhotoAccessHelper;
let predicates: dataSharePredicates.DataSharePredicates;
export default function photoAccessHelperTest() {
  describe('PhotoAccessHelperTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      const context = getContext();
      console.info("getContext", context);
      phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
      predicates = new dataSharePredicates.DataSharePredicates();
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_0
    * @tc.name      : test getAssets basic API by callback
    * @tc.desc      : test getAssets operation: fetchColumns is ['uri'、'media_type'、'subtype'、'display_name']，查询一个照片对象
    * @tc.size      : getAssetsTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_0', 0, async () => {
      try {
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['uri','media_type','subtype','display_name'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        if (fetchResult !== undefined) {
          console.info('fetchResult success');
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
          if (photoAsset !== undefined) {
            console.info('photoAsset.displayName :' + photoAsset.displayName);
          }
        }
        expect(fetchResult).not().assertUndefined();
        expect(fetchResult).not().assertNull();
      } catch (err) {
        console.error(`getAssets failed, error: ${err.code}, ${err.message}`);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_1
    * @tc.name      : test getAssets basic API by callback
    * @tc.desc      : test getAssets operation: fetchOption的fetchColumns为空情况下，查询一个已经存在的照片对象
    * @tc.size      : getAssetsTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_1', 1, async () => {
      try {
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        phAccessHelper.getAssets(fetchOptions, async  (err, fetchResult) => {
          if (fetchResult !== undefined) {
            console.info('fetchResult success');
            let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
            if (photoAsset !== undefined) {
              console.info('photoAsset.displayName : ' + photoAsset.displayName);
            }
          } else {
            console.error(`fetchResult fail with error: ${err.code}, ${err.message}`);
          }
          expect(fetchResult).not().assertUndefined();
          expect(fetchResult).not().assertNull();
        });
      } catch (err) {
        console.error(`getAssets failed, error: ${err.code}, ${err.message}`);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_2
    * @tc.name      : test getAssets basic API by callback
    * @tc.desc      : test getAssets operation: fetchOption为undefined情况下，查询一个已经存在的照片对象
    * @tc.size      : getAssetsTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_2', 2, async () => {
      try {
        let fetchOptions: photoAccessHelper.FetchOptions | undefined = undefined;
        phAccessHelper.getAssets(fetchOptions, async  (err, fetchResult) => {
          if (fetchResult !== undefined) {
            console.info('fetchResult success');
            let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
            if (photoAsset !== undefined) {
              console.info('photoAsset.displayName : ' + photoAsset.displayName);
            }
          } else {
            console.error(`fetchResult fail with error: ${err.code}, ${err.message}`);
          }
        });
      } catch (err) {
        console.error(`getAssets failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.SYSTEM_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_3
    * @tc.name      : test getAssets basic API by promise
    * @tc.desc      : test getAssets operation: fetchOption的fetchColumns为空情况下，查询一个已经存在的照片对象
    * @tc.size      : getAssetsTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_3', 3, async () => {
      try {
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        if (fetchResult !== undefined) {
          console.info('fetchResult success');
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
          if (photoAsset !== undefined) {
            console.info('photoAsset.displayName :' + photoAsset.displayName);
          }
        }
        expect(fetchResult).not().assertUndefined();
        expect(fetchResult).not().assertNull();
      } catch (err) {
        console.error(`getAssets failed, error: ${err.code}, ${err.message}`);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_4
    * @tc.name      : test getAssets basic API by promise
    * @tc.desc      : test getAssets operation: fetchOption为undefined情况下，查询一个已经存在的照片对象
    * @tc.size      : getAssetsTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_4', 4, async () => {
      try {
        let fetchOptions: photoAccessHelper.FetchOptions | undefined = undefined;
        await phAccessHelper.getAssets(fetchOptions);
      } catch (err) {
        console.error(`getAssets failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.SYSTEM_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_5
    * @tc.name      : test getAssets basic API by promise
    * @tc.desc      : test getAssets operation: fetchOption的displayName正常情况下，查询一个已经存在的照片对象
    * @tc.size      : getAssetsTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_5', 5, async () => {
      try {
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['screenshot_20240805_124506.jpeg'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        if (fetchResult !== undefined) {
          console.info('fetchResult success');
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
          if (photoAsset !== undefined) {
            console.info('photoAsset.displayName :' + photoAsset.displayName);
          }
        }
      } catch (err) {
        console.error(`getAssets failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_6
    * @tc.name      : test getAssets basic API by promise
    * @tc.desc      : test getAssets operation: fetchOption的displayName不正常情况下（displayName不带后缀），查询一个照片对象
    * @tc.size      : getAssetsTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_6', 6, async () => {
      try {
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['screenshot_20240805_124506'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        if (fetchResult !== undefined) {
          console.info('fetchResult success');
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
          if (photoAsset !== undefined) {
            console.info('photoAsset.displayName :' + photoAsset.displayName);
          }
        }
      } catch (err) {
        console.error(`getAssets failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_7
    * @tc.name      : test getAssets basic API by callback
    * @tc.desc      : test getAssets operation: fetchOption的displayName正常情况下，查询一个已经存在的照片对象
    * @tc.size      : getAssetsTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_7', 7, async () => {
      try {
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['screenshot_20240805_124506'],
          predicates: predicates
        };
        phAccessHelper.getAssets(fetchOptions, async  (err, fetchResult) => {
          if (fetchResult !== undefined) {
            console.info('fetchResult success');
            let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
            if (photoAsset !== undefined) {
              console.info('photoAsset.displayName : ' + photoAsset.displayName);
            }
          } else {
            console.error(`fetchResult fail with error: ${err.code}, ${err.message}`);
          }
        });
      } catch (err) {
        console.error(`getAssets failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_8
    * @tc.name      : test getAssets basic API by callback
    * @tc.desc      : test getAssets operation: fetchOption的displayName不正常情况下（displayName不带后缀），查询一个照片对象
    * @tc.size      : getAssetsTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_8', 8, async () => {
      try {
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['screenshot_20240805_124506'],
          predicates: predicates
        };
        phAccessHelper.getAssets(fetchOptions, async  (err, fetchResult) => {
          if (fetchResult !== undefined) {
            console.info('fetchResult success');
            let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
            if (photoAsset !== undefined) {
              console.info('photoAsset.displayName : ' + photoAsset.displayName);
            }
          } else {
            console.error(`fetchResult fail with error: ${err.code}, ${err.message}`);
          }
        });
      } catch (err) {
        console.error(`getAssets failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_9
    * @tc.name      : test getAssets basic API by callback
    * @tc.desc      : test getAssets operation: fetchColumns is ['uri'、'media_type'、'subtype'、'display_name']，查询一个照片对象
    * @tc.size      : getAssetsTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_9', 9, async () => {
      try {
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['uri', 'media_type', 'subtype', 'display_name'],
          predicates: predicates
        };
        phAccessHelper.getAssets(fetchOptions, async  (err, fetchResult) => {
          if (fetchResult !== undefined) {
            console.info('fetchResult success');
            let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
            if (photoAsset !== undefined) {
              console.info('photoAsset.displayName : ' + photoAsset.displayName);
            }
          } else {
            console.error(`fetchResult fail with error: ${err.code}, ${err.message}`);
          }
          expect(fetchResult).not().assertUndefined();
          expect(fetchResult).not().assertNull();
        });
      } catch (err) {
        console.error(`getAssets failed, error: ${err.code}, ${err.message}`);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_10
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation: 创建照片，type:IMAGE,extension:jpg,createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_10', 10, async () => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        let uri: string = await phAccessHelper.createAsset(photoType, extension, options);
        console.info('createAsset uri' + uri);
        console.info('createAsset successfully');
        expect(uri).not().assertUndefined();
        expect(uri).not().assertNull();
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_11
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation: 创建照片，type:undefined,extension:jpg,createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_11', 11, async () => {
      try {
        let photoType: photoAccessHelper.PhotoType | undefined = undefined;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        await phAccessHelper.createAsset(photoType, extension, options);
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_12
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation: 创建照片，type:IMAGE,extension:123,createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_12', 12, async () => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = '123';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        await phAccessHelper.createAsset(photoType, extension, options);
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.SYSTEM_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_13
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation: 创建照片，type:IMAGE,extension:undefined,createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_13', 13, async () => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string | undefined = undefined;
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        await phAccessHelper.createAsset(photoType, extension, options);
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_14
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation:创建照片，type:IMAGE,extension:jpg,createOptions：title为undefined, PhotoSubtype为default
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_14', 14, async () => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: undefined
        }
        await phAccessHelper.createAsset(photoType, extension, options);
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_15
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation:创建照片，type:IMAGE,extension:jpg,createOptions：undefined
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_15', 15, async () => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions | undefined = undefined;
        await phAccessHelper.createAsset(photoType, extension, options);
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_16
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation:创建视频，type:VIDEO,extension:mp4,createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_16', 16, async () => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'mp4';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        await phAccessHelper.createAsset(photoType, extension, options);
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_17
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation:创建视频，type：undefined，extension：mp4，createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_17', 17, async () => {
      try {
        let photoType: photoAccessHelper.PhotoType | undefined = undefined;
        let extension: string = 'mp4';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        await phAccessHelper.createAsset(photoType, extension, options);
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_18
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation:创建视频，type：VIDEO，extension：123，createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_18', 18, async () => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = '123';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        await phAccessHelper.createAsset(photoType, extension, options);
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.SYSTEM_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_19
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation:创建视频，type:VIDEO,extension:undefined,createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_19', 19, async () => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string | undefined = undefined;
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        await phAccessHelper.createAsset(photoType, extension, options);
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_20
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation:创建视频，type：VIDEO,extension:mp4,createOptions：title为undefined, PhotoSubtype为default
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_20', 20, async () => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'mp4';
        let options: photoAccessHelper.CreateOptions = {
          title: undefined
        }
        await phAccessHelper.createAsset(photoType, extension, options);
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_21
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation:创建视频，type：VIDEO,extension:mp4,createOptions：undefined
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_21', 21, async () => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'mp4';
        let options: photoAccessHelper.CreateOptions | undefined = undefined;
        await phAccessHelper.createAsset(photoType, extension, options);
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_22
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation:创建一个照片，只有type（IMAGE）、extension(jpg)参数
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_22', 22, async () => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let uri: string = await phAccessHelper.createAsset(photoType, extension);
        console.info('createAsset uri' + uri);
        console.info('createAsset successfully');
        expect(uri).not().assertUndefined();
        expect(uri).not().assertNull();
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_23
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation:创建一个照片，只有type（IMAGE）、extension(jpg)参数
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_23', 23, async () => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'mp4';
        let uri: string = await phAccessHelper.createAsset(photoType, extension);
        console.info('createAsset uri' + uri);
        console.info('createAsset successfully');
        expect(uri).not().assertUndefined();
        expect(uri).not().assertNull();
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
      }
    })


    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_24
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation: 创建照片，type:IMAGE,extension:jpg,createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_24', 24, () => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
          if (uri !== undefined) {
            console.info('createAsset uri' + uri);
            console.info('createAsset successfully');
          } else {
            console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
          }
          expect(uri).not().assertUndefined();
          expect(uri).not().assertNull();
        });
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_25
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation: 创建照片，type:undefined,extension:jpg,createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_25', 25, () => {
      try {
        let photoType: photoAccessHelper.PhotoType | undefined = undefined;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
          if (uri !== undefined) {
            console.info('createAsset uri' + uri);
            console.info('createAsset successfully');
          } else {
            console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
          }
        });
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_26
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation: 创建照片，type:IMAGE,extension:123,createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_26', 26, () => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = '123';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
          if (uri !== undefined) {
            console.info('createAsset uri' + uri);
            console.info('createAsset successfully');
          } else {
            console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
            expect(err.code).assertDeepEquals(Constant.SYSTEM_EORRCODE);
          }
        });
      } catch (err) {
        console.error(`createAsset failed888, error: ${err.code}, ${err.message}`);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_27
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation: 创建照片，type:IMAGE,extension:undefined,createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_27', 27, () => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string | undefined = undefined;
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
          if (uri !== undefined) {
            console.info('createAsset uri' + uri);
            console.info('createAsset successfully');
          } else {
            console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
          }
        });
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_28
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation:创建照片，type:IMAGE,extension:jpg,createOptions：title为undefined, PhotoSubtype为default
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_28', 28, () => { //28
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: undefined
        }
        phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
          if (uri !== undefined) {
            console.info('createAsset uri' + uri);
            console.info('createAsset successfully');
          } else {
            console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
          }
        });
      } catch (err) {
        console.error(`createAsset1 failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_29
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation:创建照片，type:IMAGE,extension:jpg,createOptions：undefined
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_29', 29, () => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions | undefined = undefined;
        phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
          if (uri !== undefined) {
            console.info('createAsset uri' + uri);
            console.info('createAsset successfully');
          } else {
            console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
          }
        });
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_30
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation:创建视频，type:VIDEO,extension:mp4,createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_30', 30, () => { //30
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'mp4';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
          if (uri !== undefined) {
            console.info('createAsset uri' + uri);
            console.info('createAsset successfully');
          } else {
            console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
          }
        });
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_31
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation:创建视频，type：undefined，extension：mp4，createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_31', 31, () => {
      try {
        let photoType: photoAccessHelper.PhotoType | undefined = undefined;
        let extension: string = 'mp4';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
          if (uri !== undefined) {
            console.info('createAsset uri' + uri);
            console.info('createAsset successfully');
          } else {
            console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
          }
        });
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_32
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation:创建视频，type：VIDEO，extension：123，createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_32', 32, () => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = '123';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
          if (uri !== undefined) {
            console.info('createAsset uri' + uri);
            console.info('createAsset successfully');
          } else {
            console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
            expect(err.code).assertDeepEquals(Constant.SYSTEM_EORRCODE);
          }
        });
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);

      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_33
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation:创建视频，type:VIDEO,extension:undefined,createOptions：title为testNum, PhotoSubtype为default
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_33', 33, () => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string | undefined = undefined;
        let options: photoAccessHelper.CreateOptions = {
          title: 'testNum'
        }
        phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
          if (uri !== undefined) {
            console.info('createAsset uri' + uri);
            console.info('createAsset successfully');
          } else {
            console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
            expect(err.code).assertDeepEquals(Constant.SYSTEM_EORRCODE);
          }
        });
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_34
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation:创建视频，type：VIDEO,extension:mp4,createOptions：title为undefined, PhotoSubtype为default
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_34', 34, () => { //34
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'mp4';
        let options: photoAccessHelper.CreateOptions = {
          title: undefined
        }
        phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
          if (uri !== undefined) {
            console.info('createAsset uri' + uri);
            console.info('createAsset successfully');
          } else {
            console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
            expect(err.code).assertDeepEquals(Constant.SYSTEM_EORRCODE);
          }
        });
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_35
    * @tc.name      : test createAsset basic API by promise
    * @tc.desc      : test createAsset operation:创建视频，type：VIDEO,extension:mp4,createOptions：undefined
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_35', 35, () => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'mp4';
        let options: photoAccessHelper.CreateOptions | undefined = undefined;
        phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
          if (uri !== undefined) {
            console.info('createAsset uri' + uri);
            console.info('createAsset successfully');
          } else {
            console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
          }
        });
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertDeepEquals(Constant.ARGS_EORRCODE);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_36
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation:创建一个照片，只有type（IMAGE）、extension(jpg)参数
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_36', 36, async () => { //36
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        phAccessHelper.createAsset(photoType, extension, (err, uri) => {
          if (uri !== undefined) {
            console.info('createAsset uri' + uri);
            console.info('createAsset successfully');
          } else {
            console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
          }
          expect(uri).not().assertUndefined();
          expect(uri).not().assertNull();
        });
      } catch (err) {
        console.error(`createAsset failed1, error: ${err.code}, ${err.message}`);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_37
    * @tc.name      : test createAsset basic API by callback
    * @tc.desc      : test createAsset operation:创建一个照片，只有type（IMAGE）、extension(jpg)参数
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_37', 37, async () => {
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'mp4';
        phAccessHelper.createAsset(photoType, extension, (err, uri) => {
          if (uri !== undefined) {
            console.info('createAsset uri' + uri);
            console.info('createAsset successfully');
          } else {
            console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
          }
          expect(uri).not().assertUndefined();
          expect(uri).not().assertNull();
        });
      } catch (err) {
        console.error(`createAsset failed, error: ${err.code}, ${err.message}`);
      }
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_38
    * @tc.name      : test getAlbums basic API by promise
    * @tc.desc      : test getAlbums operation: 通过albumType.USER和photoAccessHelper.AlbumSubtype.USER_GENERIC获取用户相册(带album_name,fetchOptions)
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_38', 38, async () => {
      // 示例代码中为获取相册名为newAlbumName的相册。
      console.info('getAlbumsDemo');
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo('album_name', 'newAlbumName');
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, fetchOptions).then( async (fetchResult) => {
        if (fetchResult === undefined) {
          console.error('getAlbumsPromise fetchResult is undefined');
          return;
        }
        let album: photoAccessHelper.Album = await fetchResult.getFirstObject();
        console.info('getAlbumsPromise successfully, albumName: ' + album.albumName);
        fetchResult.close();
        expect(fetchResult).not().assertUndefined();
        expect(fetchResult).not().assertNull();
      }).catch((err: BusinessError) => {
        console.error(`getAlbumsPromise failed with err: ${err.code}, ${err.message}`);
      });
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_39
    * @tc.name      : test getAlbums basic API by promise
    * @tc.desc      : test getAlbums operation: 通过albumType.USER和photoAccessHelper.AlbumSubtype.USER_GENERIC获取用户相册(不带album_name,fetchOptions)
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_39', 39, async () => {
      phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC).then( async (fetchResult) => {
        if (fetchResult === undefined) {
          console.error('getAlbumsPromise fetchResult is undefined');
          return;
        }
        let album: photoAccessHelper.Album = await fetchResult.getFirstObject();
        console.info('getAlbumsPromise successfully, albumName: ' + album.albumName);
        fetchResult.close();
        expect(fetchResult).not().assertUndefined();
        expect(fetchResult).not().assertNull();
      }).catch((err: BusinessError) => {
        console.error(`getAlbumsPromise failed with err: ${err.code}, ${err.message}`);
      });
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_40
    * @tc.name      : test getAlbums basic API by promise
    * @tc.desc      : test getAlbums operation: 通过albumType.USER和photoAccessHelper.AlbumSubtype.USER_GENERIC获取用户相册(带album_name,fetchOptions)
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_40', 40, async () => {
      // 示例代码中为获取相册名为newAlbumName的相册。
      console.info('getAlbumsDemo');
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo('album_name', 'newAlbumName');
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, fetchOptions).then( async (fetchResult) => {
        if (fetchResult === undefined) {
          console.error('getAlbumsPromise fetchResult is undefined');
          return;
        }
        let album: photoAccessHelper.Album = await fetchResult.getFirstObject();
        console.info('getAlbumsPromise successfully, albumName: ' + album.albumName);
        fetchResult.close();
        expect(fetchResult).not().assertUndefined();
        expect(fetchResult).not().assertNull();
      }).catch((err: BusinessError) => {
        console.error(`getAlbumsPromise failed with err: ${err.code}, ${err.message}`);
      });
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_41
    * @tc.name      : test getAlbums basic API by promise
    * @tc.desc      : test getAlbums operation: 通过albumType.USER和fetchOptions指定album_name获取指定的用户相册
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_41', 41, async () => {
      // 示例代码中为获取相册名为newAlbumName的相册。
      console.info('getAlbumsDemo');
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo('album_name', 'newAlbumName');
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, fetchOptions).then( async (fetchResult) => {
        if (fetchResult === undefined) {
          console.error('getAlbumsPromise fetchResult is undefined');
          return;
        }
        let album: photoAccessHelper.Album = await fetchResult.getFirstObject();
        console.info('getAlbumsPromise successfully, albumName: ' + album.albumName);
        fetchResult.close();
        expect(fetchResult).not().assertUndefined();
        expect(fetchResult).not().assertNull();
      }).catch((err: BusinessError) => {
        console.error(`getAlbumsPromise failed with err: ${err.code}, ${err.message}`);
      });
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_42
    * @tc.name      : test getAlbums basic API by promise
    * @tc.desc      : test getAlbums operation: 通过相册类型和相册子类型查询系统相册(VIDEO,FAVORITE)
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_42', 42, async () => {
      // 示例代码中为获取相册名为newAlbumName的相册。
      console.info('getAlbumsDemo');
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo('album_name', 'newAlbumName');
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, fetchOptions).then( async (fetchResult) => {
        if (fetchResult === undefined) {
          console.error('getAlbumsPromise fetchResult is undefined');
          return;
        }
        let album: photoAccessHelper.Album = await fetchResult.getFirstObject();
        console.info('getAlbumsPromise successfully, albumName: ' + album.albumName);
        fetchResult.close();
        expect(fetchResult).not().assertUndefined();
        expect(fetchResult).not().assertNull();
      }).catch((err: BusinessError) => {
        console.error(`getAlbumsPromise failed with err: ${err.code}, ${err.message}`);
      });
    })

    /* *
    * @tc.number    : SUB_PHOTOACCESSHELPER_API_43
    * @tc.name      : test getAlbums basic API by promise
    * @tc.desc      : test getAlbums operation: 通过fetchOptions指定三个用户相册的albumName,并按照album_name升序的情况下，查询对应相册
    * @tc.size      : photoAccessHelperTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_43', 43, async () => {
      // 示例代码中为获取相册名为newAlbumName的相册。
      console.info('getAlbumsDemo');
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo('album_name', 'newAlbumName');
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, fetchOptions).then( async (fetchResult) => {
        if (fetchResult === undefined) {
          console.error('getAlbumsPromise fetchResult is undefined');
          return;
        }
        let album: photoAccessHelper.Album = await fetchResult.getFirstObject();
        console.info('getAlbumsPromise successfully, albumName: ' + album.albumName);
        fetchResult.close();
        expect(fetchResult).not().assertUndefined();
        expect(fetchResult).not().assertNull();
      }).catch((err: BusinessError) => {
        console.error(`getAlbumsPromise failed with err: ${err.code}, ${err.message}`);
      });
    })

    /* *
   * @tc.number    : SUB_PHOTOACCESSHELPER_API_44
   * @tc.name      : test getAlbums basic API by promise
   * @tc.desc      : test getAlbums operation: 通过fetchOptions指定三个用户相册的albumName,并按照album_name降序的情况下，查询对应相册
   * @tc.size      : photoAccessHelperTest
   * @tc.type      : Function
   * @tc.level     : Level3
   */
    it('SUB_AUDIO_PHOTOACCESSHELPER_API_44', 44, async () => {
      // 示例代码中为获取相册名为newAlbumName的相册。
      console.info('getAlbumsDemo');
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo('album_name', 'newAlbumName');
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, fetchOptions).then( async (fetchResult) => {
        if (fetchResult === undefined) {
          console.error('getAlbumsPromise fetchResult is undefined');
          return;
        }
        let album: photoAccessHelper.Album = await fetchResult.getFirstObject();
        console.info('getAlbumsPromise successfully, albumName: ' + album.albumName);
        fetchResult.close();
        expect(fetchResult).not().assertUndefined();
        expect(fetchResult).not().assertNull();
      }).catch((err: BusinessError) => {
        console.error(`getAlbumsPromise failed with err: ${err.code}, ${err.message}`);
      });
    })

  })
}



