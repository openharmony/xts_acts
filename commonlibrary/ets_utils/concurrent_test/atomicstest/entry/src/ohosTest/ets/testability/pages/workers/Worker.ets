import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';


const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
workerPort.onmessage = (e: MessageEvents) => {
  const buffer:SharedArrayBuffer = e.data;
  console.log(`${buffer.byteLength}`)
  if (buffer.byteLength == 100){
    if (buffer instanceof SharedArrayBuffer) {
      const sharedArray = new Uint8Array(buffer);
      for (let i = 0; i < 100; i++) {
        Atomics.and(sharedArray, i, 1);
      }
      const resultArray = new Uint8Array(sharedArray);
      workerPort.postMessage(resultArray);
    }
  } else if (buffer.byteLength == 200){
    if (buffer instanceof SharedArrayBuffer) {
      const sharedArray = new Uint16Array(buffer);
      for (let i = 0; i < 100; i++) {
        const replacement = 10 + i;
        Atomics.exchange(sharedArray, i, replacement);
      }
      workerPort.postMessage(sharedArray.buffer);
    }
  }else if (buffer.byteLength == 400){
    if (buffer instanceof SharedArrayBuffer) {
      const sharedArray = new Uint32Array(buffer);
      for (let i = 0; i < 100; i++) {
        const valueToStore = 100 + i;
        Atomics.store(sharedArray, i, valueToStore);
      }
      workerPort.postMessage(sharedArray.buffer);
    }
  }else if (buffer.byteLength == 800){
    if (buffer instanceof SharedArrayBuffer) {
      const sharedArray = new BigUint64Array(buffer);
      const arrayLength = sharedArray.length;
      for (let i = 0; i < 100; i++) {
        if (i < arrayLength) {
          const subtractValue = 1n;
          Atomics.sub(sharedArray, i, subtractValue);
        }
      }
      workerPort.postMessage(sharedArray.buffer);
    }
  }

}
