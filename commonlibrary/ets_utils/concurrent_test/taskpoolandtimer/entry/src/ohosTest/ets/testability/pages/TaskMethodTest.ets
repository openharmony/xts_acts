/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { Calculator } from './Calculator';
import { Worker, Worker1, Worker2 } from '../pages/Calculator'
import { worker, MessageEvents, ErrorEvent } from '@kit.ArkTS';
import { HashMap, taskpool } from '@kit.ArkTS';


@Concurrent
export function printArgs1(args: number): number {
  console.info('printArgs: ' + args);
  return args;
}

@Concurrent
export async function promiseThen(index: number): Promise<number> {
  return await new Promise<number>(async (mainResolve) => {
    Promise.resolve(index).then(baseValue => {
      const result = Calculator.computeSync(baseValue);
      mainResolve(result);
    });
  });
}

@Concurrent
export async function awaitCompute(index: number): Promise<number> {
  return await Calculator.computeAsync2(index)
}

@Concurrent
export async function awaitPromise(index: number): Promise<number> {
  const res1 = await new Promise<number>(resolve => {
    setTimeout(() => resolve(10), 50);
  });
  const res2 = await Promise.resolve(res1).then(baseValue => {
    return Calculator.computeSync(index + baseValue)
  });
  return res2;
}

@Concurrent
export async function awaitFinally(index: number): Promise<number> {
  const res1 = await new Promise<number>(resolve => {
    setTimeout(() => resolve(1), 50);
  });
  let res2 = 0;
  await Promise.resolve(res1).finally(() => {
    res2 = Calculator.computeSync(index + res1)
  });
  return res2;
}

@Concurrent
export async function awaitCatch(index: number): Promise<number> {
  const res1 = await new Promise<number>(resolve => {
    setTimeout(() => resolve(index), 50);
  })

  let res2 = 0;
  res2 = await Promise.resolve(res1)
    .then(() => {
      throw new Error(`Processing-${index}`);
    })
    .catch(() => {
      return Calculator.computeSync(index + res1);
    });
  return res2;
}

@Concurrent
export async function awaitAsync(index: number): Promise<number> {
  const res1 = await new Promise<number>(resolve => {
    setTimeout(() => resolve(Calculator.computeAsync1(index)), 50);
  })

  const res2 = await Promise.resolve(res1)
    .then((res) => {
      return res + 1
    })
  return res2;
}

@Concurrent
export async function promiseCompute(index: number): Promise<number> {
  const res1 = await new Promise<number>(resolve => {
    setTimeout(() => resolve(1), 50);
  })

  const res2 = await Promise.resolve(res1)
    .then((res) => {
      return Calculator.computeSync(index + res)
    })
  return res2;
}

@Concurrent
export async function promiseAll(index: number): Promise<number> {
  const res1 = await new Promise<number>(resolve => {
    setTimeout(() => resolve(1), 50);
  })

  const res2 = Calculator.computeSync(index + res1)

  const res3 = await Promise.resolve(res2)
    .then((res) => {
      return index + res
    })
  return res3;
}

export async function callbackThen(index: number): Promise<number> {
  const res1 = await new Promise<number>(resolve => {
    setTimeout(() => resolve(index), 50);
  }).then((res) => {
    return Calculator.computeSync(res)
  })

  const res2 = await Promise.resolve(res1)
    .then((res) => {
      return Calculator.computeSync(res)
    })
  return res2;
}

export async function callbackThenFinally(index: number): Promise<number> {
  let res1 = 0;
  await new Promise<number>(resolve => {
    setTimeout(() => resolve(0), 50);
  }).finally(() => {
    res1 = Calculator.computeSync(index)
  })

  let res2 = 0;
  await Promise.resolve(1)
    .finally(() => {
      res2 = Calculator.computeSync(res1)
    })
  return res2;
}

@Concurrent
export async function concurrentTask1(index: number): Promise<number> {
  const promiseResult = await new Promise<number>((resolve) => {
    setTimeout(() => resolve(index), 50);
  });
  const computedResult = Calculator.computeSync(promiseResult);
  const finalResult = await Promise.resolve(computedResult).then((value) => {
    return value * 2;
  });
  return finalResult;
}

@Concurrent
export async function concurrentTask2(index: number): Promise<number> {
  const promiseResult = await new Promise<number>((resolve) => {
    setTimeout(() => resolve(index), 50);
  });
  const computedResult = Calculator.computeAsync1(promiseResult);
  const finalResult = await Promise.resolve(computedResult).then((value) => {
    return value * 2;
  });
  return finalResult;
}

@Concurrent
export async function concurrentTask3(index: number): Promise<number> {
  throw new Error(`Task ${index} execution failed.`);
}

export async function callbackAll(index: number): Promise<number> {
  const res1 = await new Promise<number>(resolve => {
    setTimeout(() => resolve(1), 50);
  })

  const res2 = Calculator.computeSync(index + res1);

  const res3 = await Promise.resolve(res2)
    .then((res) => {
      return 1 + res;
    })
  return res3;
}

export async function callbackAllAsync(index: number): Promise<number> {
  const res1 = await new Promise<number>(resolve => {
    setTimeout(() => resolve(1), 50);
  })

  const res2 = await Calculator.computeAsync1(index + res1);

  const res3 = await Promise.resolve(res2)
    .then((res) => {
      return 1 + res;
    })
  return res3;
}

export async function callbackCompute(index: number): Promise<number> {
  const res1 = await new Promise<number>(resolve => {
    setTimeout(() => resolve(index), 50);
  })
    .then((res) => {
      return Calculator.computeSync(res);
    })

  const res2 = Promise.resolve(res1)
    .then((res) => {
      return res + 1;
    })
  return res2;
}

export async function callbackAsync(index: number): Promise<number> {
  const res1 = await new Promise<number>(resolve => {
    setTimeout(() => resolve(index), 50);
  })
    .then(async (res) => {
      return await Calculator.computeAsync1(res);
    })

  const res2 = await Promise.resolve(res1)
    .then((res) => {
      return res + 1;
    })
  return res2;
}

@Concurrent
export function failTask(args: number): HashMap<string, number> {
  let t = Date.now();
  while ((Date.now() - t) < 100) {
    continue;
  }
  let hashMap1: HashMap<string, number> = new HashMap();
  hashMap1.set('a', args);
  return hashMap1;
}

export async function callbackPromiseSync(index: number): Promise<number> {
  const res1 = await new Promise<number>(resolve => {
    setTimeout(() => resolve(index), 50);
  })

  const res2 = await Promise.resolve(res1)
    .then((res) => {
      return Calculator.computeSync(res);
    })
  return res2;
}

export async function callbackPromiseAsync(index: number): Promise<number> {
  const res1 = await new Promise<number>(resolve => {
    setTimeout(() => resolve(index), 50);
  })

  const res2 = await Promise.resolve(res1)
    .then(async (res) => {
      return await Calculator.computeAsync1(res);
    })
  return res2;
}

export async function callbackCatchSync(index: number): Promise<number> {
  const res1 = await new Promise<number>(resolve => {
    setTimeout(() => resolve(index), 50);
  })

  let res2 = 0;
  res2 = await Promise.resolve(res1)
    .then(() => {
      throw new Error(`Processing-${index}`); // 强制进入catch流程
    })
    .catch(() => {
      return Calculator.computeSync(index + res1);
    });
  return res2;
}

export async function callbackCatchAsync(index: number): Promise<number> {
  const res1 = await new Promise<number>(resolve => {
    setTimeout(() => resolve(index), 50);
  })

  let res2 = 0;
  res2 = await Promise.resolve(res1)
    .then(() => {
      throw new Error(`Processing-${index}`); // 强制进入catch流程
    })
    .catch(async () => {
      return await Calculator.computeAsync1(index + res1);
    });
  return res2;
}

@Concurrent
export function sendTaskData(num: number): number {
  let res: number = num * 10;
  taskpool.Task.sendData(res);
  return num;
}

export async function callbackFinallyAsync(index: number): Promise<number> {
  const res1 = await new Promise<number>(resolve => {
    setTimeout(() => resolve(index), 50);
  })

  let res2 = 0;
  await Promise.resolve(res1)
    .finally(async () => {
      res2 = await Calculator.computeAsync1(index) + res1;
    });
  return res2;
}

export async function callbackAsyncPromise(index: number): Promise<number> {
  const res = await new Promise<number>(resolve => {
    setTimeout(() => resolve(Calculator.computePromise(index)), 50);
  })
  return res;
}

