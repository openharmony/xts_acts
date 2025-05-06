import { MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';


interface WorkerData {
  sharedArrayBuffer: SharedArrayBuffer;
  targetIndex: number;
  newValue: bigint;
  statusIndex: number;
}

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;
workerPort.onmessage = (e: MessageEvents) => {
  const receivedData: WorkerData = e.data;
  const sharedArrayBuffer = receivedData.sharedArrayBuffer;
  const targetIndex = receivedData.targetIndex;
  const newValue = receivedData.newValue;
  const statusIndex = receivedData.statusIndex;
  const arr: BigInt64Array = new BigInt64Array(sharedArrayBuffer);

  setTimeout(() => {
    Atomics.store(arr, targetIndex, newValue);
    Atomics.store(arr, statusIndex, 1n);
    Atomics.notify(arr, statusIndex);
  }, 3000);

  workerPort.postMessage('done');
}
