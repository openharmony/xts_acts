import Ability from '@ohos.app.ability.UIAbility'

export default class MainAbility7 extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] MainAbility7 onCreate")
        globalThis.abilityWant = want;
    }

    onDestroy() {
        console.log("[Demo] MainAbility7 onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility7 onWindowStageCreate")
        globalThis.ability7context = this.context;
        windowStage.setUIContent(this.context, "MainAbility/pages/MainAbility7_pages", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility7 onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] MainAbility7 onForeground")

        globalThis.mainAbility7ListKey = [];
        var abilityName = "";
        let AbilityLifecycleCallback = {
            onAbilityCreate(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityCreate")
                globalThis.mainAbility7ListKey.push(abilityName + " onAbilityCreate");
            },
            onWindowStageCreate(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageCreate")
                globalThis.mainAbility7ListKey.push(abilityName + " onWindowStageCreate");
            },
            onWindowStageActive(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageActive")
            },
            onWindowStageInactive(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageInactive")
            },
            onAbilityForeground(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityForeground")
                globalThis.mainAbility7ListKey.push(abilityName + " onAbilityForeground");
            },
            onAbilityBackground(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityBackground")
                globalThis.mainAbility7ListKey.push(abilityName + " onAbilityBackground");
            },
            onWindowStageDestroy(ability, windowStage) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onWindowStageDestroy")
                globalThis.mainAbility7ListKey.push(abilityName + " onWindowStageDestroy");
            },
            onAbilityDestroy(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityDestroy")
                globalThis.mainAbility7ListKey.push(abilityName + " onAbilityDestroy");
            },
            onAbilityContinue(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityContinue")
                globalThis.mainAbility7ListKey.push(abilityName + " onAbilityContinue");
            }
        }
        globalThis.ApplicationContext7 = globalThis.ability7context.getApplicationContext();
        globalThis.mainAbility7CallBackId = globalThis.ApplicationContext7.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
        setTimeout(() => {
            globalThis.testEvent.push('MainAbility7onForeground');
        }, 1500);
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility7 onBackground")
    }
};
