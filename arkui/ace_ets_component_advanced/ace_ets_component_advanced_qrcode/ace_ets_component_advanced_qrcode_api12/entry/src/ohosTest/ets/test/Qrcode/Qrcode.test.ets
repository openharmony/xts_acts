/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import { Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

interface optionsObj {
  uri: string
}
export default function Qrcode() {
    describe('Qrcode', () => {
        beforeAll(async () => {
            console.info("beforeAll case");
        });
        beforeEach(async (done: Function) => {
            console.info("search_caret beforeEach start");
            let options: optionsObj = {
                uri: 'MainAbility/pages/Qrcode/Qrcode',
            }
            try {
                router.clear();
                let pages = router.getState();
                console.info("get Qrcode state pages: " + JSON.stringify(pages));
                if (!("Qrcode" == pages.name)) {
                    console.info("get Qrcode state pages.name: " + JSON.stringify(pages.name));
                    let result = await router.push(options);
                    await CommonFunc.sleep(2000);
                    console.info("push Qrcode page result: " + JSON.stringify(result));
                }
            } catch (err) {
                console.error("push Qrcode page error: " + err);
                expect().assertFail();
            }
            done();
        });
        afterEach(async () => {
            console.info("afterEach case");
        });
        afterAll(async () => {
            console.info("afterAll case");
        });

        /**
         * @tc.number: QrcodeJsunit_0100
         * @tc.name  : testQrcodeComponent.
         * @tc.desc  : verifyBaseFunction.
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : Level 0
         */
        it('QrcodeJsunit_0100', 0, async (done: Function) => {
            console.info('QrcodeJsunit_0100 START');
            let driver = Driver.create()
            let button = await driver.findComponent(ON.text('失效'))
            await button.click()
            await CommonFunc.sleep(2000);
            await driver.assertComponentExist(ON.text('二维码已过期，请刷新'))
            let strJson1 = getInspectorByKey('qrcode01');
            let obj1: Record<string, ESObject> = JSON.parse(strJson1);
            await CommonFunc.sleep(1000);
            console.info("[QrcodeJsunit_0100] height: " + JSON.stringify(obj1.$attrs.height));
            console.info("[QrcodeJsunit_0100] width: " + JSON.stringify(obj1.$attrs.width));
            expect(obj1.$attrs.height).assertEqual('125.00vp');
            expect(obj1.$attrs.width).assertEqual('125.00vp');
            console.info('QrcodeJsunit_0100 click success');
            console.info('[QrcodeJsunit_0100] END');
            done();
        });

        /**
         * @tc.number: QrcodeJsunit_0200
         * @tc.name  : testQrcodeComponent.
         * @tc.desc  : verifyBaseFunction.
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : Level 0
         */
        it('QrcodeJsunit_0200', 0, async (done: Function) => {
            console.info('QrcodeJsunit_0200 START');
            let driver = Driver.create()
            let button = await driver.findComponent(ON.text('失效提示'))
            await button.click()
            await CommonFunc.sleep(3000);
            await driver.assertComponentExist(ON.text('The QR code has expired, please refresh'))
            let content = await driver.findComponent(ON.text('The QR code has expired, please refresh'))
            let flag = await content.getType()
            expect(flag).assertEqual('Text')
            await driver.assertComponentExist(ON.text('The QR code has expired, please refresh'))
            console.info('QrcodeJsunit_0200 click success');
            console.info('[QrcodeJsunit_0200] END');
            done();
        });
    })
}
