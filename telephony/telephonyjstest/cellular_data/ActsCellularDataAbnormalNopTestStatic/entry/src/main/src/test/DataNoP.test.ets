import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import data from '@ohos.telephony.data';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'DataTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

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
export default function dataNoPTest() {

    describe("DataNoPTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        /*
          * @tc.number:SUB_telephony_data_nop0100
          * @tc.name: testTelephonyDataNop_static_0100
          * @tc.desc:Using the isCellularDataEnabled (callback) method without permission
          * @tc.level:Level 0
          * @tc.type:Function
          * @tc.size:MediumTest
          */
        it("testTelephonyDataNop_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataNop_static_0100';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.isCellularDataEnabled().then((contextData: boolean) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': contextData ->'+contextData);
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
         * @tc.number:SUB_telephony_data_nop002
         * @tc.name: testTelephonyDataNop_static_0200
         * @tc.desc:Using the isCellularDataEnabled (callback) method without permission
         * @tc.level:Level 0
         * @tc.type:Function
         * @tc.size:MediumTest
         */
        it("testTelephonyDataNop_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataNop_static_0200';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.isCellularDataEnabled((err: BusinessError<void>|null, contextData: boolean| undefined) => {
                    if(err?.code != 0){
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        ExpectTrue(err?.code == 201);
                    }else{
                        hilog.info(domain, tag, '%{public}s', caseName +' get isCellularDataEnabled success ');
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

    })
}