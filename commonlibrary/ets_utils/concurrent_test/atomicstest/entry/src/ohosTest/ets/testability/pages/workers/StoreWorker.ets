import { MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';


const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
workerPort.onmessage = (e: MessageEvents) => {
  const buffer:SharedArrayBuffer = e.data;
  if (buffer instanceof SharedArrayBuffer) {
    const sharedArray = new BigInt64Array(buffer);
    for (let i = 0; i < 100; i++) {
      const index = i % 100;
      Atomics.store(sharedArray, index, 1000n + BigInt(index));
    }
    workerPort.postMessage(sharedArray.buffer);
  }
}
