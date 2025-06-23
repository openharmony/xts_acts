import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import http from '@ohos.net.http';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HttpTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let httpRequest = http.createHttp();

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}
const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test sucess`);
  }
}
export default function httpNoPTest() {

  describe("HttpNoPTest", (): void => {

    hilog.info(domain, tag, '%{public}s', 'describe start');
    /*
      * @tc.number:SUB_NetMgr_Http_Request_Nop_0100
      * @tc.name: testNetMgrHttpRequestNop_static__0100
      * @tc.desc: Using the request (callback) method without permission
      * @tc.level: Level 1
      * @tc.type: Function
      * @tc.size: MEDIUMTEST
      */
    it("testNetMgrHttpRequestNop_static__0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrHttpRequestNop_static__0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        httpRequest.request("xxx", (err: BusinessError, data: http.HttpResponse) => {
          if (err.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectTrue(err.code == 201);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' request success ');
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        });
      }catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /*
      * @tc.number:SUB_NetMgr_Http_Request_Nop_0200
      * @tc.name: testNetMgrHttpRequestNop_static__0200
      * @tc.desc: Using the request (callback) method without permission
      * @tc.level: Level 1
      * @tc.type: Function
      * @tc.size: MEDIUMTEST
      */
    it("testNetMgrHttpRequestNop_static__0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrHttpRequestNop_static__0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        httpRequest.request("xxx", {
          method: http.RequestMethod.GET
        }, (err: BusinessError, data: http.HttpResponse) => {
          if (err.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
            ExpectTrue(err.code == 201);
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          } else {
            hilog.info(domain, tag, '%{public}s', caseName +' request success ');
            ExpectFail();
            hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
            done();
          }
        })
      }catch (err:BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue(err.code == 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /*
      * @tc.number:SUB_NetMgr_Http_Request_Nop_0300
      * @tc.name: testNetMgrHttpRequestNop_static__0300
      * @tc.desc: Using the Request (promise) method without permission
      * @tc.level: Level 1
      * @tc.type: Function
      * @tc.size: MEDIUMTEST
      */
    it("testNetMgrHttpRequestNop_static__0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrHttpRequestNop_static__0300';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        httpRequest.request("xxx", {
          method: http.RequestMethod.GET
        }).then((data:http.HttpResponse) => {
          hilog.info(domain, tag, '%{public}s', caseName +' request success ');
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectTrue(err.code == 201);
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
      * @tc.number:SUB_NetMgr_Http_Request_Nop_0400
      * @tc.name: testNetMgrHttpRequestNop_static__0400
      * @tc.desc: Using the Request (promise) method without permission
      * @tc.level: Level 1
      * @tc.type: Function
      * @tc.size: MEDIUMTEST
      */
    it("testNetMgrHttpRequestNop_static__0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrHttpRequestNop_static__0400';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        httpRequest.request("xxx").then((data:http.HttpResponse) => {
          hilog.info(domain, tag, '%{public}s', caseName +' request success ');
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectTrue(err.code == 201);
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

  })
}