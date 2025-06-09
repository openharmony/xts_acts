import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach} from "../../../hypium/index";
import { Component, Driver, ON, On, MatchPattern,Point, Rect, MouseButton, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation, loadAndSetUpUiTest } from '@ohos.UiTest'
import hilog from '@ohos.hilog'
import { Utils, startAbility, stopApplication } from './Util.test';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const waitUiReadyMs : number = 1000;
const DeviceErrorCode = 17000005;

async function exitInputMethod() {
    let driver = Driver.create()
    let softKeyBoard = await driver.findComponent(ON.type('Canvas'))
    if (softKeyBoard != null) {
        await driver.pressBack()
    }
}

function sleep(numberMillis: int) {
    const exitTime = new Date().getTime() + numberMillis;
    while (new Date().getTime() < exitTime) { }
    return
}

export default function abilityTest() {

    describe("abilityTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(async (): Promise<void> => {
            hilog.info(domain, tag, "uitestComponentTest loadup start!!!!!")
            await Utils.loadAndSetUpUiTest();
            await Utils.msSleep(1000)
            hilog.info(domain, tag, "uitestComponentTest loadup over!!!!!")
        })
        beforeEach(async () => {
            await stopApplication('com.uitestScene.acts');
        })

        it("abilityTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', 'abilityTest001 start');
            await Utils.msSleep(1000)
            hilog.info(domain, tag, '%{public}s', 'abilityTest001');
            await stopApplication('com.uitestScene.acts');
            done()
            hilog.info(domain, tag, '%{public}s', 'abilityTest001 end');
        })
        it('testClearText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
            hilog.info(domain, tag, `testClearText start `);
            let driver = Driver.create();
            await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
            await driver.delayMs(1000);
            try {
                let textInput = await driver.findComponent(ON.type("TextInput"));
                hilog.info(domain, tag, `testClearText textInput, ${JSON.stringify(textInput)} `);
                await driver.delayMs(1000);
                expect(textInput != null).assertTrue()
                if (textInput != null) {
                    await textInput.clearText();
                    hilog.info(domain, tag, `testClearText clearText`);
                    await driver.delayMs(1000);
                }
                let textInput1 = await driver.findComponent(ON.type("TextInput"));
                hilog.info(domain, tag, `testClearText textInput1, ${JSON.stringify(textInput1)}`);
                await driver.delayMs(1000);
                expect(textInput1 != null).assertTrue()
                if (textInput1 != null) {
                    let text1 = await textInput1.getText();
                    hilog.info(domain, tag, `testClearText text1, ${JSON.stringify(text1)}`);
                    expect(text1).assertEqual('');
                }
            } catch(error) {
                hilog.info(domain, tag, `testClearText error, ${JSON.stringify(error)} `);
                expect().assertFail();
            }
            await stopApplication('com.uitestScene.acts');
            hilog.info(domain, tag, `testClearText end `);
        })
    })

}