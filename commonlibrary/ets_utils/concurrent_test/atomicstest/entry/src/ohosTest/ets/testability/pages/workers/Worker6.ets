// worker1.ets
import { worker } from '@kit.ArkTS';
import {SharedCounter} from '../AtomicsMultithreadUtils';

const parentPort = worker.workerPort;

parentPort.onmessage = (e) => {
  let buffer:SharedArrayBuffer = e.data;
  const counter = new SharedCounter(0); // 使用共享内存初始化

  // 执行原子操作序列
  const addResult = counter.add(5);

  parentPort.postMessage("Worker1 完成");
};




