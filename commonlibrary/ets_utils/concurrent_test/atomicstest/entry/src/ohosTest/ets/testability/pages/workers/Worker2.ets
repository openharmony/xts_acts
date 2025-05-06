import { MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';


const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
workerPort.onmessage = (e: MessageEvents) => {
  const buffer:SharedArrayBuffer = e.data;
  console.log(`${buffer.byteLength}`)
  if (buffer instanceof SharedArrayBuffer) {
    const sharedArray = new BigUint64Array(buffer);
    const arrayLength = sharedArray.length;
    for (let i = 0; i < 100; i++) {
      if (i < arrayLength) {
        const index = i % arrayLength;
        if (i % 3 === 0) {
          Atomics.add(sharedArray, index, 1n);
        } else if (i % 3 === 1) {
          Atomics.sub(sharedArray, index, 1n);
        } else {
          Atomics.xor(sharedArray, index, 2n);
        }
      } else {
        console.error(`索引 ${i} 超出数组长度 ${arrayLength}，跳过操作`);
      }
    }
    workerPort.postMessage(sharedArray.buffer);
  }

}
