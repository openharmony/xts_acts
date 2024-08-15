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
import { Driver, ON } from '@ohos.UiTest'
import CommonFunc from '../../MainAbility/utils/Common';

interface optionsObj {
  uri: string
}

export default function ChipOnClose() {
    describe('ArcButtonClick', () => {
        beforeAll(async () => {
            console.info("beforeAll case");
        });
        beforeEach(async (done: Function) => {
            console.info("search_caret beforeEach start");
            let options: optionsObj = {
                uri: 'MainAbility/pages/ArcButton/ArcButtonClick',
            }
            try {
                router.clear();
                let pages = router.getState();
                console.info("get ArcButtonClick state pages: " + JSON.stringify(pages));
                if (!("ArcButtonClick" == pages.name)) {
                    console.info("get ArcButtonClick state pages.name: " + JSON.stringify(pages.name));
                    let result = await router.push(options);
                    await CommonFunc.sleep(2000);
                    console.info("push ArcButtonClick page result: " + JSON.stringify(result));
                }
            } catch (err) {
                console.error("push ArcButtonClick page error: " + err);
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
         * @tc.number: arcButtonJsunit_0100
         * @tc.name  : testArcButtonComponent.
         * @tc.desc  : verifyBaseFunction.
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : Level 0
         */
        it('arcButtonJsunit_0100', 0, async (done: Function) => {
            console.info('arcButtonJsunit_0100 START');
            let driver = Driver.create()
            let arcbutton = await driver.findComponent(ON.text('arcbutton1'))
            let buttonType = await arcbutton.getType()
            expect(buttonType).assertEqual('Text')
            console.info('arcButtonJsunit_0100 click success');
            console.info('[arcButtonJsunit_0100] END');
            done();
        });

        /**
         * @tc.number: arcButtonJsunit_0200
         * @tc.name  : testArcButtonComponent
         * @tc.desc  : verifyBaseFunction
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : Level 0
         */
        it('arcButtonJsunit_0200', 0, async (done: Function) => {
            console.info('arcButtonJsunit_0200 START');
            let driver = Driver.create()
            let button = await driver.findComponent(ON.text('Click Me First'))
            await button.click()
            await CommonFunc.sleep(2000);
            await driver.assertComponentExist(ON.text('白色风车'))
            let strJson1 = getInspectorByKey('button01');
            let obj1: Record<string, ESObject> = JSON.parse(strJson1);
            await CommonFunc.sleep(1000);
            expect(obj1.$attrs.height).assertEqual('5');
            console.info('arcButtonJsunit_0200 click success');
            console.info('[arcButtonJsunit_0200] END');
            done();
        });
    })
}
