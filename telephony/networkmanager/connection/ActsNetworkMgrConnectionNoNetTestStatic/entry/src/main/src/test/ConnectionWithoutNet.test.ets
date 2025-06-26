import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import connection from '@ohos.net.connection';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'ConnectionTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err: BusinessError) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}
const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err: BusinessError) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}

export default function ConnectionWithoutNetTest() {

  describe("ConnectionWithoutNetTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_HasDefaultNet_0400
     * @tc.name       : testNetConnectionHasDefaultNet_static_0400
     * @tc.desc       : Check if the default data network is activated
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetConnectionHasDefaultNet_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetConnectionHasDefaultNet_static_0400";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.hasDefaultNet((error: BusinessError<void>|null, data: boolean| undefined) => {
          if (error?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get hasDefaultNet error is '+JSON.stringify(error));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' hasDefaultNet: data ->'+JSON.stringify(data));
            ExpectTrue(data == false);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catcherror is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_HasDefaultNet_0700
     * @tc.name       : testNetConnectionHasDefaultNet_static_0700
     * @tc.desc       : Check if the default data network is activated
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetConnectionHasDefaultNet_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetConnectionHasDefaultNet_static_0700";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.hasDefaultNet().then((data: boolean) => {
          hilog.info(domain, tag, '%{public}s', caseName +' hasDefaultNet: data ->'+JSON.stringify(data));
          ExpectTrue(data == false);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get hasDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catcherror is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_HasDefaultNetSync_0400
     * @tc.name       : testNetConnectionHasDefaultNetSync_static_0400
     * @tc.desc       : Check if the default data network is activated
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetConnectionHasDefaultNetSync_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetConnectionHasDefaultNetSync_static_0400";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let isDefaultNet: boolean = connection.hasDefaultNetSync();
        ExpectTrue(isDefaultNet != true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catcherror is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_GetDefaultNet_Callback_0400
     * @tc.name       : testNetConnectionGetDefaultNetCallback_static_0400
     * @tc.desc       : test obtain the default activated data network and use the callback method as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNetConnectionGetDefaultNetCallback_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetConnectionGetDefaultNetCallback_static_0400";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet((err: BusinessError<void> |null, data: connection.NetHandle| undefined) => {
          console.info(`${caseName} getDefaultNet callback: err->${JSON.stringify(err)} data->${JSON.stringify(data)}`);
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          } else {
            ExpectTrue(data?.netId == 0);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catcherror is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_GetDefaultNet_Promise_0200
     * @tc.name       : testNetConnectionGetDefaultNetPromise_static_0200
     * @tc.desc       : test obtain the default activated data network and use Promise as an asynchronous method
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetConnectionGetDefaultNetPromise_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetConnectionGetDefaultNetPromise_static_0200";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        connection.getDefaultNet().then((data: connection.NetHandle) => {
          hilog.info(domain, tag, '%{public}s', caseName +': getDefaultNet data ->'+JSON.stringify(data));
          ExpectTrue(data.netId == 0);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catcherror is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_Connection_GetDefaultNetSync_0200
     * @tc.name       : testNetworkMgrConnectionGetDefaultNetSync_static_0200
     * @tc.desc       : test use synchronization method to obtain default activated data network
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNetworkMgrConnectionGetDefaultNetSync_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetDefaultNetSync_static_0200";
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        ExpectTrue(netHandle.netId == 0);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catcherror is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });


    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_0400
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties_static_0400
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_0400";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle, (error: BusinessError, data: connection.ConnectionProperties) => {
            if (error.code != 0) {
              hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties error is '+JSON.stringify(error));
              ExpectTrue(error.code == 2100001);
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +': getConnectionProperties data ->'+JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catcherror is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionProperties_0500
     * @tc.name       : testNetworkMgrConnectionGetConnectionProperties_static_0500
     * @tc.desc       : Obtain the connection information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetConnectionProperties_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionProperties_static_0500";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
            hilog.info(domain, tag, '%{public}s', caseName +':getConnectionProperties  data ->'+JSON.stringify(data));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  getConnectionProperties error is '+JSON.stringify(err));
            ExpectTrue(err.code == 2100001);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catcherror is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetConnectionPropertiesSync_0400
     * @tc.name       : testNetworkMgrConnectionGetConnectionPropertiesSync_static_0400
     * @tc.desc       : Use synchronization method to obtain network information bound to the app.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetConnectionPropertiesSync_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetConnectionPropertiesSync_static_0400";
      console.info(`${caseName} test start `);
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        let connectionProperties: connection.ConnectionProperties = connection.getConnectionPropertiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +': GetConnectionPropertiesSync data ->'+JSON.stringify(connectionProperties));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catcherror is '+JSON.stringify(err));
        ExpectTrue(err.code == 2100001);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_0400
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities_static_0400
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the callback method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_0400";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getNetCapabilities(netHandle, (error: BusinessError, data: connection.NetCapabilities) => {
            if (error.code != 0) {
              console.info(`${caseName} getNetCapabilities: err->${JSON.stringify(error)}`);
              ExpectTrue(error.code == 2100001);
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            } else {
              hilog.info(domain, tag, '%{public}s', caseName +':getNetCapabilities  data ->'+JSON.stringify(data));
              ExpectFail();
              hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catcherror is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilities_0500
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilities_static_0500
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle and use the Promise method as an asynchronous method.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetNetCapabilities_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilities_static_0500";
      console.info(`${caseName} test start `);
      try {
        connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          connection.getNetCapabilities(netHandle).then((data: connection.NetCapabilities) => {
            hilog.info(domain, tag, '%{public}s', caseName +': getNetCapabilities data ->'+JSON.stringify(data));
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.info(domain, tag, '%{public}s', caseName +'  getNetCapabilities error is '+JSON.stringify(err));
            ExpectTrue(err.code == 2100001);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  getDefaultNet error is '+JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catcherror is '+JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.number     : SUB_NetworkMgr_ConnectionGetNetCapabilitiesSync_0400
     * @tc.name       : testNetworkMgrConnectionGetNetCapabilitiesSync_static_0400
     * @tc.desc       : Obtain the capability information of the network corresponding to netHandle
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNetworkMgrConnectionGetNetCapabilitiesSync_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionGetNetCapabilitiesSync_static_0400";
      console.info(`${caseName} test start `);
      try {
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        let getNetCapAbilitiesSync: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +': getNetCapabilitiesSync data ->'+JSON.stringify(getNetCapAbilitiesSync));
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catcherror is '+JSON.stringify(err));
        ExpectTrue(err.code == 2100001);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

  })
}