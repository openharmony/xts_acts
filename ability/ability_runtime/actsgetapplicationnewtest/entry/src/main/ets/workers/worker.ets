import worker, { ThreadWorkerGlobalScope, MessageEvents } from '@ohos.worker';
import hilog from '@ohos.hilog';
import { application } from '@kit.AbilityKit';

let workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e : MessageEvents): void => {
  switch (e.data.type as number) {
    case 0:
      hilog.info(0x0000, 'testTag', 'worker start!');
        let context1 = application.getApplicationContext();
        hilog.info(0x0000, 'testTag', 'worker context1: %{public}s', JSON.stringify(context1));
  }
}