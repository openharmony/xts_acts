import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import { FormLinkOptions } from "@ohos.arkui.component"
import { FormLinkAttribute } from "@ohos.arkui.component"
import CommonEventManager from '@ohos.commonEventManager';
import Utils from './Util.test';


const unsubscribeCallback = (tcNumber: string) => {
    console.info(`====>${tcNumber} unsubscribeCallback====>`);
}
let subscriberForm: CommonEventManager.CommonEventSubscriber;

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag formLinkTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function formLinkTest() {

    describe("formLinkTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        it("FormLinkTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'FormLinkTest001 start');

            let formLinkTest_Event: CommonEventManager.CommonEventSubscribeInfo = {
                events: ["XTS_FormLinkTest_commonEvent"],
            };
            let isChecked: boolean = false;
            subscriberForm = CommonEventManager.createSubscriberSync(formLinkTest_Event);
            let formLinkCallBack = (_: BusinessError | null, data: CommonEventManager.CommonEventData) => {
                isChecked = true;
                hilog.info(domain, tag, '%{public}s', 'FormLinkTest001 FormLinkCallBack' + JSON.stringify(data));
                expect(data.event).assertEqual("XTS_FormLinkTest_commonEvent");
                CommonEventManager.unsubscribe(subscriberForm, () => unsubscribeCallback("FormLinkTest001"));
            }
            CommonEventManager.subscribe(subscriberForm, formLinkCallBack);

            expect(Utils.startAbility(
                "TestFormAbility",
                "com.example.helloworld",
                "testform/pages/XtsFormLink",
            )).assertTrue();

            await Utils.msSleep(1000); // waiting for the async subscribe.
            if (!isChecked) {
                CommonEventManager.unsubscribe(subscriberForm, () => unsubscribeCallback("FormLinkTest001"));
                expect(false).assertTrue();
            }

            done();
            hilog.info(domain, tag, '%{public}s', 'FormLinkTest001 end');
        })


        it("FormLinkOptionsTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'FormLinkOptionsTest001 start');

            let formLinkOp: FormLinkOptions = {
                action: 'message',
                moduleName: 'moduleName',
                bundleName: 'bundleName',
                abilityName: 'abilityName',
                uri: 'uri',
            }
            expect('message').assertEqual(formLinkOp.action as string);
            expect('moduleName').assertEqual(formLinkOp.moduleName as string);
            expect('bundleName').assertEqual(formLinkOp.bundleName as string);
            expect('abilityName').assertEqual(formLinkOp.abilityName as string);
            expect('uri').assertEqual(formLinkOp.uri as string);

            done();
            hilog.info(domain, tag, '%{public}s', 'FormLinkOptionsTest001 end');
        })
    })
}