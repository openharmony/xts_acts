import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import formProvider from "@ohos.app.form.formProvider";
// import CommonEventManager from '@ohos.commonEventManager';
import Utils from './Util.test';


// const unsubscribeCallback = (tcNumber: string) => {
//     console.info(`====>${tcNumber} unsubscribeCallback====>`);
// }
// let subscriberForm: CommonEventManager.CommonEventSubscriber;

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag formProviderTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function formProviderTest() {

    describe("formProviderTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        it("FormProviderTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(domain, tag, '%{public}s', 'FormProviderTest001 start');

            // let FormProviderTest_Event: CommonEventManager.CommonEventSubscribeInfo = {
            //     events: ["XTS_FormProviderTest_commonEvent"],
            // };
            // expect(Utils.startAbility(
            //     "TestFormAbility",
            //     "com.example.helloworld",
            //     "testform/pages/XtsFormProvider"
            // )).assertTrue();

            // expect(Utils.startAbility(
            //     "TestFormProvAbility",
            //     "com.example.helloworld",
            //     "testform/pages/XtsFormProvider"
            // )).assertTrue();

            let formId: string = '3610022740'; //用hap包装好的应用的卡片id
            try {
                formProvider.setFormNextRefreshTime(formId, 2, (error: BusinessError) => {
                    if (error?.code) {
                        hilog.info(domain, tag, `FormProviderTest001 callback error, code:${error?.code}`);
                    }
                    hilog.info(domain, tag, 'FormProviderTest001 setFormNextRefreshTime callback success');
                });
                hilog.info(domain, tag, 'FormProviderTest001 setFormNextRefreshTime register success');
                expect(true).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, 'FormProviderTest001 catch error');
                expect().assertFail();
                done();
            }

            hilog.info(domain, tag, '%{public}s', 'FormProviderTest001 end');
        })

        it("FormProviderTest002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(domain, tag, '%{public}s', 'FormProviderTest002 start');
            let formId2: string = '21347330770'; //用hap包装好的应用的卡片id
            try {
                formProvider.setFormNextRefreshTime(formId2, 3).then(() => {
                    hilog.info(domain, tag, `FormProviderTest002 setFormNextRefreshTime success`);
                }).catch((error) => {
                    hilog.info(domain, tag, `FormProviderTest002 promise error, code:`);
                });
                hilog.info(domain, tag, 'FormProviderTest002 setFormNextRefreshTime register success');
                expect(true).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, `FormProviderTest002 catch error, code: `);
                expect().assertFail();
                done();
            }

            hilog.info(domain, tag, '%{public}s', 'FormProviderTest002 end');
        })
    })
}