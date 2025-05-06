// worker1.ets
import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';

const parentPort = worker.workerPort;

parentPort.onmessage = (e:MessageEvents) :void => {
  let sharedBuffer: number = e.data;
  const sharedArray = new Int32Array(sharedBuffer);

  // 使用 Atomics.and 进行按位与操作
  const andResult = Atomics.and(sharedArray, 0, 0b0001); // 进行与操作
  console.log(`Worker1: Atomics.and(0b1010) - 结果=${andResult}, 当前值=${sharedArray[0]}`);

  parentPort.postMessage("Worker1 操作完成");
};