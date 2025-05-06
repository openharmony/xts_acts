// worker1.ets
import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
const parentPort = worker.workerPort;

parentPort.onmessage = (e:MessageEvents) :void => {
  let sharedBuffer: number = e.data;
  const sharedArray = new Int32Array(sharedBuffer);

  // 使用 Atomics.add 增加5
  const oldValue = Atomics.add(sharedArray, 0, 5);
  console.log(`Worker1: Atomics.add(5) - 旧值=${oldValue}, 新值=${sharedArray[0]}`);

  parentPort.postMessage(sharedArray[0]);
};


