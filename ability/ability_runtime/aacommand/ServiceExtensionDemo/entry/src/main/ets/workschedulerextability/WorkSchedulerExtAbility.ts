import WorkSchedulerExtensionAbility from '@ohos.WorkSchedulerExtensionAbility';

export default class WorkSchedulerExtension extends WorkSchedulerExtensionAbility {
    onWorkStart(workInfo) {
        console.log('WorkSchedulerExtensionAbility onWorkStart, workInfo = ' + JSON.stringify(workInfo));
    }
    onWorkStop(workInfo) {
        console.log('WorkSchedulerExtensionAbility onWorkStop, workInfo = ' + JSON.stringify(workInfo));
    }
};