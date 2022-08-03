import AbilityStage from "@ohos.application.AbilityStage"

export default class MyAbilityStage extends AbilityStage {
    onCreate() {
        console.log("[Demo] MyAbilityStage onCreate")
        globalThis.stageOnCreateRun = 1;
        globalThis.stageContext = this.context;
    }
}
