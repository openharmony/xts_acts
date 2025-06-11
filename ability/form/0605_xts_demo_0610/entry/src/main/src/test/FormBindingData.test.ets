import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import formBindingData from '@ohos.app.form.formBindingData';
import Utils from './Util.test';


let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag formBindingDataTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function formBindingDataTest() {

    describe("formBindingDataTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        it("FormBindingDataTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(domain, tag, '%{public}s', 'FormBindingDataTest001 start');

            let dataObj1: Record<string, string> = {
                'temperature': '11c',
                'time': '11:00'
            };
            let formBinding = formBindingData.createFormBindingData(dataObj1)
            expect(formBinding.data + '').assertEqual('temperature,11c,time,11:00');

            let module1ProxyData: formBindingData.ProxyData = {
                key: "123456789",
                subscriberId: "123456789"
            }
            let module2ProxyData: formBindingData.ProxyData = {
                key: "abc",
            }
            let proxyDataS: formBindingData.ProxyData[] = [];
            proxyDataS.push(module1ProxyData);
            proxyDataS.push(module2ProxyData);
            let module1Data: formBindingData.FormBindingData = {
                data: "com.example.test123",
                proxies: proxyDataS
            }
            let bindingData: formBindingData.FormBindingData = module1Data;
            expect("com.example.test123").assertEqual(bindingData.data);
            expect(bindingData.proxies?.length === 2).assertTrue();

            done();
            hilog.info(domain, tag, '%{public}s', 'FormBindingDataTest001 end');
        })
    })
}