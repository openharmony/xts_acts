import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import connection from '@ohos.net.connection';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'connectionTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}
const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}

export default function ConnectionPublicNopTest() {
  describe("ConnectionPublicNopTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /*
     * @tc.number:SUB_NetMgr_Connection_GetDefaultNet_Nop_0100
     * @tc.name: testNetMgrConnectionGetDefaultNetNop_0100
     * @tc.desc: Using the getDefaultNet (callback) method without permission
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MEDIUMTEST
     */
    it("testNetMgrConnectionGetDefaultNetNop_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetDefaultNetNop_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getDefaultNet((error: BusinessError, data: connection.NetHandle) => {
          if (error.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectTrue(error.code == 201);
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +' getDefaultNet success ');
            ExpectFail();
          }
        });
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /*
     * @tc.number:SUB_NetMgr_Connection_GetDefaultNet_Nop_0200
     * @tc.name: testNetMgrConnectionGetDefaultNetNop_0200
     * @tc.desc: Using the GetDefaultNet (promise) method without permission
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MEDIUMTEST
     */
    it("testNetMgrConnectionGetDefaultNetNop_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetDefaultNetNop_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getDefaultNet().then((data: connection.NetHandle) => {
          hilog.info(domain, tag, '%{public}s', caseName +' getDefaultNet success ');
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        })
      }catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /*
     * @tc.number:SUB_NetMgr_Connection_GetDefaultNetSync_Nop_0300
     * @tc.name: testNetMgrConnectionGetDefaultNetSyncNop_0300
     * @tc.desc: Using the getDefaultNetSync method without permission
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MEDIUMTEST
     */
    it("testNetMgrConnectionGetDefaultNetSyncNop_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetDefaultNetSyncNop_0300';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let netHandle = connection.getDefaultNetSync();
        hilog.info(domain, tag, '%{public}s', caseName +' getDefaultNetSync success ');
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /*
     * @tc.number:SUB_NetMgr_Connection_GetAllNets_Nop_0100
     * @tc.name: testNetMgrConnectionGetAllNetsNop_0100
     * @tc.desc: Using the GetAllNets (callback) method without permission
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MEDIUMTEST
     */
    it("testNetMgrConnectionGetAllNetsNop_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetAllNetsNop_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getAllNets((error: BusinessError, data: connection.NetHandle[]) => {
          if (error.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectTrue(error.code == 201);
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +' getAllNets success ');
            ExpectFail();
          }
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /*
     * @tc.number:SUB_NetMgr_Connection_GetAllNets_Nop_0200
     * @tc.name: testNetMgrConnectionGetAllNetsNop_0200
     * @tc.desc: Using the GetAllNets (promise) method without permission
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MEDIUMTEST
     */
    it("testNetMgrConnectionGetAllNetsNop_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetAllNetsNop_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getAllNets().then((data: connection.NetHandle[]) => {
          hilog.info(domain, tag, '%{public}s', caseName +' getAllNets success ');
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        })
      }catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /*
     * @tc.number:SUB_NetMgr_Connection_GetAllNetsSync_Nop_0300
     * @tc.name: testNetMgrConnectionGetAllNetsSyncNop_0300
     * @tc.desc: Using the getAllNetsSync method without permission
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MEDIUMTEST
     */
    it("testNetMgrConnectionGetAllNetsSyncNop_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetAllNetsSyncNop_0300';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let netHandle = connection.getAllNetsSync();
        hilog.info(domain, tag, '%{public}s', caseName +' getAllNetsSync success ');
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

     /*
      * @tc.number:SUB_NetMgr_Connection_HasDefaultNet_Nop_0100
      * @tc.name: testNetMgrConnectionHasDefaultNetNoP_0100
      * @tc.desc: Using the hasDefaultNet (callback) method without permission
      * @tc.level: Level 2
      * @tc.type: Function
      * @tc.size: MEDIUMTEST
      */
    it("testNetMgrConnectionHasDefaultNetNoP_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionHasDefaultNetNoP_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.hasDefaultNet((error: BusinessError, data: boolean) => {
          if (error.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  hasDefaultNet error is '+JSON.stringify(error));
            ExpectTrue(error.code == 201);
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +' hasDefaultNet success ');
            ExpectFail();
          }
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /*
     * @tc.number:SUB_NetMgr_Connection_HasDefaultNet_Nop_0200
     * @tc.name: testNetMgrConnectionHasDefaultNetNop_0200
     * @tc.desc: Using the HasDefaultNet (promise) method without permission
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MEDIUMTEST
     */
    it("testNetMgrConnectionHasDefaultNetNop_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionHasDefaultNetNop_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.hasDefaultNet().then((data: boolean) => {
          hilog.info(domain, tag, '%{public}s', caseName +' hasDefaultNet success ');
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        })
      }catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /*
     * @tc.number:SUB_NetMgr_Connection_HasDefaultNetSync_Nop_0300
     * @tc.name: testNetMgrConnectionHasDefaultNetSyncNop_0300
     * @tc.desc: Using the hasDefaultNetSync method without permission
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MEDIUMTEST
     */
    it("testNetMgrConnectionHasDefaultNetSyncNop_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionHasDefaultNetSyncNop_0300';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let netHandle = connection.hasDefaultNetSync();
        hilog.info(domain, tag, '%{public}s', caseName +' hasDefaultNetSync success ');
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })
    /*
         * @tc.number:SUB_NetMgr_Connection_GetConnectionProperties_Nop_0100
         * @tc.name: testNetMgrConnectionGetConnectionProperties_0100
         * @tc.desc: Using the getConnectionProperties (callback) method without permission
         * @tc.level: Level 2
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
    it("testNetMgrConnectionGetConnectionProperties_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetConnectionProperties_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
          if (error.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectTrue(error.code == 201);
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +' getConnectionPropertiesSync success ');
            ExpectFail();
          }
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /*
     * @tc.number:SUB_NetMgr_Connection_GetConnectionProperties_Nop_0200
     * @tc.name: testNetMgrConnectionGetConnectionPropertiesNop_0200
     * @tc.desc: Using the GetConnectionProperties (promise) method without permission
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MEDIUMTEST
     */
    it("testNetMgrConnectionGetConnectionPropertiesNop_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetConnectionPropertiesNop_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
          hilog.info(domain, tag, '%{public}s', caseName +' getConnectionPropertiesSync success ');
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        })
      }catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })
    /*
       * @tc.number:SUB_NetMgr_Connection_GetConnectionPropertiesSync_Nop_0300
       * @tc.name: testNetMgrConnectionGetConnectionPropertiesSyncNop_0300
       * @tc.desc: Using the GetConnectionPropertiesSync method without permission
       * @tc.level: Level 2
       * @tc.type: Function
       * @tc.size: MEDIUMTEST
       */
    it("testNetMgrConnectionGetConnectionPropertiesSyncNop_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetConnectionPropertiesSyncNop_0300';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        let connectionProperties = connection.getConnectionPropertiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +' getConnectionPropertiesSync success ');
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /*
        * @tc.number:SUB_NetMgr_Connection_GetNetCapabilities_Nop_0100
        * @tc.name: testNetMgrConnectionGetNetCapabilities_0100
        * @tc.desc: Using the GetNetCapabilities (callback) method without permission
        * @tc.level: Level 2
        * @tc.type: Function
        * @tc.size: MEDIUMTEST
        */
    it("testNetMgrConnectionGetNetCapabilities_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetNetCapabilities_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        connection.getNetCapabilities(netHandle, (error: BusinessError, data: connection.NetCapabilities) => {
          if (error.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectTrue(error.code == 201);
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +' getNetCapabilities success ');
            ExpectFail();
          }
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /*
     * @tc.number:SUB_NetMgr_Connection_GetNetCapabilities_Nop_0200
     * @tc.name: testNetMgrConnectionGetNetCapabilitiesNop_0200
     * @tc.desc: Using the GetNetCapabilities (promise) method without permission
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MEDIUMTEST
     */
    it("testNetMgrConnectionGetNetCapabilitiesNop_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetNetCapabilitiesNop_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        connection.getNetCapabilities(netHandle).then((data: connection.NetCapabilities) => {
          hilog.info(domain, tag, '%{public}s', caseName +' getNetCapabilities success ');
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        })
      }catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /*
     * @tc.number:SUB_NetMgr_Connection_GetNetCapabilitiesSync_Nop_0300
     * @tc.name: testNetMgrConnectionGetNetCapabilitiesSyncNop_0300
     * @tc.desc: Using the GetNetCapabilitiesSync method without permission
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MEDIUMTEST
     */
    it("testNetMgrConnectionGetNetCapabilitiesSyncNop_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetNetCapabilitiesSyncNop_0300';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        let netCapabilities = connection.getNetCapabilitiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +' GetNetCapabilitiesSync success ');
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })


  })
}