import { AbilityStage, AbilityConstant, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

export default class MyAbilityStage extends AbilityStage {
  onMemoryLevel(level: AbilityConstant.MemoryLevel): void {
    // 根据系统可用内存的变化情况，释放不必要的内存
  }
  onCreate(): void {
    // 应用HAP首次加载时触发，可以在此执行该Module的初始化操作（例如资源预加载、线程创建等）。
  }

  onAcceptWant(want: Want): string {
    // 仅specified模式下触发
    return 'MyAbilityStage';
  }
  onNewProcessRequest(want: Want): string {
    return "AbilityStageProcess"
  }
  onPrepareTermination(): AbilityConstant.PrepareTermination{
    hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityStage onPrepareTermination');
    return AbilityConstant.PrepareTermination.TERMINATE_IMMEDIATELY
  }
  async onPrepareTerminationSync(): Promise<AbilityConstant.PrepareTermination>{
    hilog.info(0x0000, 'testTag', '%{public}s', 'AbilityStage onPrepareTerminationSync');
    return AbilityConstant.PrepareTermination.CANCEL
  }
}