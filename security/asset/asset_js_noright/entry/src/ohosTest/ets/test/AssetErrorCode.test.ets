import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import asset from '@ohos.security.asset';
import { BusinessError } from '@kit.BasicServicesKit';
import { util } from '@kit.ArkTS';
import * as aw from './aw/AssetAw';

function StringToArray(str: string): Uint8Array {
  let textEncoder = new util.TextEncoder();
  return textEncoder.encodeInto(str);
}

export default function AssetErrorCodeTest() {
  describe('AssetErrorCodeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await aw.cleanData();
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

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_JS_wraptype_0100
     * @tc.name test wraptype
     * @tc.desc 数据库允许导出字段测试
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_JS_wraptype_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SECRET, StringToArray('demo_pwd1'));
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias1'));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_FIRST_UNLOCKED);
      attr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToArray('demo_label1'));
      attr.set(asset.Tag.WRAP_TYPE, asset.WrapType.TRUSTED_ACCOUNT)
      try {
        await asset.add(attr);
        console.info(`SUB_Security_DataSecurity_Asset_JS_wraptype_0100 added successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_JS_wraptype_0100 Failed to add Asset. Code is ${err.code}, message is ${err.message}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_JS_wraptype_0200
     * @tc.name test wraptype
     * @tc.desc 数据库不允许导出字段测试
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_JS_wraptype_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SECRET, StringToArray('demo_pwd'));
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias'));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_FIRST_UNLOCKED);
      attr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToArray('demo_label'));
      attr.set(asset.Tag.WRAP_TYPE, asset.WrapType.NEVER)
      try {
        await asset.add(attr);
        console.info(`SUB_Security_DataSecurity_Asset_JS_wraptype_0200 added successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_JS_wraptype_0200 Failed to add Asset. Code is ${err.code}, message is ${err.message}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_add_0300_0100
     * @tc.name test add
     * @tc.desc 存在同名资产时新增数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_add_0300_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SECRET, StringToArray('demo_pwd2'));
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias2'));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_FIRST_UNLOCKED);
      attr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToArray('demo_label2'));

      let attr1: asset.AssetMap = new Map();
      attr1.set(asset.Tag.SECRET, StringToArray('demo_pwd2'));
      attr1.set(asset.Tag.ALIAS, StringToArray('demo_alias2'));
      attr1.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_FIRST_UNLOCKED);
      attr1.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToArray('demo_label2'));
      try {
        await asset.add(attr);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_add_0300_0100 added first successfully`);
        await asset.add(attr1);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_add_0300_0100 added Second successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_add_0300_0100 Failed to add Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(24000003);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_add_401_0100
     * @tc.name test add
     * @tc.desc 参数异常时新增数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_add_401_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias2'));
      try {
        await asset.add(attr);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_add_401_0100 added  successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_add_401_0100 Failed to add Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_postQuerySync_401_0100
     * @tc.name test postQuerySync
     * @tc.desc 参数异常时使用postQuerySync接口，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_postQuerySync_401_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias2'));
      try {
        asset.postQuerySync(attr);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_postQuerySync_401_0100 postQuerySync  successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_postQuerySync_401_0100 Failed to postQuerySync Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_postQuery_401_0100
     * @tc.name test postQuery
     * @tc.desc 参数异常时使用postQuery接口，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_postQuery_401_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias2'));
      try {
        asset.postQuery(attr);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_postQuery_401_0100 postQuerySync  successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_postQuery_401_0100 Failed to postQuerySync Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_removeSync_02_0100
     * @tc.name test removeSync
     * @tc.desc 调用removeSync接口，删除不存在的数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_removeSync_02_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, StringToArray('0000000000'));
      try {
        asset.removeSync(attr);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_removeSync_02_0100 removeSync successfully`);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_removeSync_02_0100 Failed to remove Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(24000002);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_remove_02_0100
     * @tc.name test remove
     * @tc.desc 调用remove接口，删除不存在的数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_remove_02_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.ALIAS, StringToArray('0000000000'));
      try {
        asset.remove(attr).then(() => {
          console.info(`SUB_Security_DataSecurity_Asset_errorCode_remove_02_0100 Asset removed successfully.`);
        }).catch((err: BusinessError) => {
          console.error(`SUB_Security_DataSecurity_Asset_errorCode_remove_02_0100 Failed to remove1 Asset. Code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(24000002);
        });
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_remove_02_0100 Failed to remove2 Asset. Code is ${err.code}, message is ${err.message}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_016_0100
     * @tc.name test preQuerySync
     * @tc.desc 反复调用preQuerySync接口，不释放缓存返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_016_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SECRET, StringToArray('123456789'));
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias'));
      attr.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      await asset.add(attr)
      let attr2: asset.AssetMap = new Map();
      for (let index=0; index < 20; index++) {
        try {
          asset.preQuerySync(attr2);
          console.info(`SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_016_0100 Asset preQuerySync SUCCESS. `);
        } catch (error) {
          let err = error as BusinessError;
          console.error(`SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_016_0100 Failed to pre-query Asset. Code is ${err.code}, message is ${err.message}`);
          expect(error.code).assertEqual(24000016);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_017_0100
     * @tc.name test preQuerySync
     * @tc.desc 调用preQuerySync接口，查询不支持的功能，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_017_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SECRET, StringToArray('123456789'));
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias1'));
      attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_UNLOCKED);
      attr.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.SECRET, StringToArray('123456789'));
      attr2.set(asset.Tag.ALIAS, StringToArray('demo_alias2'));
      attr2.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_FIRST_UNLOCKED);
      attr2.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      await asset.add(attr);
      await asset.add(attr2);
      let attr3: asset.AssetMap = new Map();
      try {
        asset.preQuerySync(attr3);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_017_0100 Asset preQuery SUCCESS. `);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_017_0100 Failed to pre-query Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(24000017);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_02_0100
     * @tc.name test preQuerySync
     * @tc.desc 调用preQuerySync接口，查询不存在的数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_02_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SECRET, StringToArray('123456789'));
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias'));
      attr.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      await asset.add(attr)
      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.ALIAS, StringToArray('00000000000'));
      try {
        asset.preQuerySync(attr2);
        console.info(`SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_02_0100 Asset preQuerySync SUCCESS. `);
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_preQuerySync_02_0100 Failed to pre-query Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(24000002);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_DataSecurity_Asset_errorCode_preQuery_02_0100
     * @tc.name test preQuery
     * @tc.desc 调用preQuery接口，查询不存在的数据，返回错误码检查
     * @tc.size MediumTest
     * @tc.level Level3
     * @tc.type Function
     */
    it('SUB_Security_DataSecurity_Asset_errorCode_preQuery_02_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let attr: asset.AssetMap = new Map();
      attr.set(asset.Tag.SECRET, StringToArray('123456789'));
      attr.set(asset.Tag.ALIAS, StringToArray('demo_alias'));
      attr.set(asset.Tag.AUTH_TYPE, asset.AuthType.ANY);
      await asset.add(attr)
      let attr2: asset.AssetMap = new Map();
      attr2.set(asset.Tag.ALIAS, StringToArray('0000000000'));
      try {
        asset.preQuery(attr2).then((challenge: Uint8Array) => {
          console.info(`SUB_Security_DataSecurity_Asset_errorCode_preQuery_02_0100 Asset preQuery SUCCESS. `);
        }).catch ((err: BusinessError) => {
          console.error(`SUB_Security_DataSecurity_Asset_errorCode_preQuery_02_0100 Failed to pre-query1 Asset. Code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      } catch (error) {
        let err = error as BusinessError;
        console.error(`SUB_Security_DataSecurity_Asset_errorCode_preQuery_02_0100 Failed to pre-query2 Asset. Code is ${err.code}, message is ${err.message}`);
        expect(error.code).assertEqual(24000002);
      }
      done();
    });
  })
}