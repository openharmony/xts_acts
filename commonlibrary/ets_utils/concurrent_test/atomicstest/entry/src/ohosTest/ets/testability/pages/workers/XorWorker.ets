import { MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';


const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
workerPort.onmessage = (e: MessageEvents) => {
  const buffer:SharedArrayBuffer = e.data;
  console.log(`${buffer.byteLength}`)
  if (buffer instanceof SharedArrayBuffer) {
    const sharedArray = new BigInt64Array(buffer);
    for (let i = 0; i < 100; i++) {
      const index = i % 100;
      Atomics.xor(sharedArray, index, 2n);
    }
    workerPort.postMessage(sharedArray.buffer);
  }
}
