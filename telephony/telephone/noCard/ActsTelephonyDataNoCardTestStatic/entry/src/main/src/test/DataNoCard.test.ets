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
export default function dataNoCardTest() {

    describe("DataNoCardTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        /* *
          * @tc.number: SUB_Telephony_Data_GetCellularDataState_0400
          * @tc.name  : testTelephonyDataGetCellularDataState_static_0400
          * @tc.desc  : Get the connection status of a packet switched domain (PS domain).
          * @tc.size  : MediumTest
          * @tc.type  : Function
          * @tc.level : level 3
         */
        it('testTelephonyDataGetCellularDataState_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataGetCellularDataState_static_0400';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.getCellularDataState((err: BusinessError, data: data.DataConnectState) => {
                    if (err?.code != 0) {
                        hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                        ExpectFail();
                    } else {
                        hilog.info(domain, tag, '%{public}s', caseName +': getCellularDataState ->'+JSON.stringify(data));
                        ExpectTrue(true);
                    }
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

        /* *
         * @tc.number: SUB_Telephony_Data_GetCellularDataState_0800
         * @tc.name  : testTelephonyDataGetCellularDataState_static_0800
         * @tc.desc  : Get the connection status of a packet switched domain (PS domain).
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : level 3
         */
        it('testTelephonyDataGetCellularDataState_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testTelephonyDataGetCellularDataState_static_0800';
            hilog.info(domain, tag, '%{public}s', caseName+ ' start');
            try{
                data.getCellularDataState().then((data: data.DataConnectState) => {
                    hilog.info(domain, tag, '%{public}s', caseName +': getCellularDataState ->'+JSON.stringify(data));
                    ExpectTrue(true);
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                }).catch((error: Error) => {
                    let err = error as BusinessError;
                    hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
                    ExpectFail();
                    hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
                    done();
                });
            }catch(err){
                hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
                ExpectFail();
                hilog.info(domain, tag, '%{public}s', caseName+ ' end');
                done();
            }
        })

    })

}