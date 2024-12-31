import UIAbility from "@ohos:app.ability.UIAbility";
import type AbilityConstant from "@ohos:app.ability.AbilityConstant";
import type Want from "@ohos:app.ability.Want";
import hilog from "@ohos:hilog";
import type window from "@ohos:window";
import commonEventManager from "@ohos:commonEventManager";
const Tag: string = 'SpecifedProcess';
export default class SpecifedProcessAbility extends UIAbility {
    //创建ability时
    onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
        hilog.info(0x0000, Tag, '%{public}s', 'SpecifedProcessAbility onCreate');
    }
    //销毁ability时
    onDestroy(): void {
        hilog.info(0x0000, Tag, '%{public}s', 'SpecifedProcessAbility onDestroy');
    }
    //创建舞台（页面）时
    onWindowStageCreate(windowStage: window.WindowStage): void {
        // Main window is created, set main page for this ability
        hilog.info(0x0000, Tag, '%{public}s', 'SpecifedProcessAbility onWindowStageCreate');
        windowStage.loadContent('pages/Index', (err) => {
            if (err.code) {
                hilog.error(0x0000, Tag, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
                return;
            }
            hilog.info(0x0000, Tag, 'Succeeded in loading the content.');
        });
    }
    onWindowStageDestroy(): void {
        // Main window is destroyed, release UI related resources
        hilog.info(0x0000, Tag, '%{public}s', 'SpecifedProcessAbility onWindowStageDestroy');
    }
    //切换到前台时
    onForeground(): void {
        // Ability has brought to foreground
        let applicationContext = this.context.getApplicationContext();
        applicationContext.getRunningProcessInformation((err, data) => {
            if (err) {
                console.error(`getRunningProcessInformation fail, error: ${JSON.stringify(err)}`);
            }
            else {
                console.log(`The process running information is: ${JSON.stringify(data)}`);
                for (let i = 0; i < data.length; i++) {
                    const processInfo = data[i];
                    console.log('Process state:', processInfo.state);
                }
            }
        });
        hilog.info(0x0000, Tag, '%{public}s', 'SpecifedProcessAbility onForeground');
    }
    //切换到后台时
    onBackground(): void {
        // Ability has back to background
        hilog.info(0x0000, Tag, '%{public}s', 'SpecifedProcessAbility onBackground');
        hilog.info(0x0000, 'testTag', `onBackground`);
        let commonEventPublishData: commonEventManager.CommonEventPublishData = {
            parameters: {
                data: "111"
            }
        };
        commonEventManager.publish('AbilityOnBackgroundA', commonEventPublishData, async (error) => {
            hilog.info(0x0000, 'testTag1', '%{public}s', `onForeground publish: ${JSON.stringify(error)}`);
        });
    }
}
