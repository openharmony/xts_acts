/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

export function printArgs1(): number {
  console.log(`UID: ${StdProcess.uid()}`);
  return StdProcess.uid();
}

export function printArgs2(): number {
  console.log(`PID: ${StdProcess.pid()}`);
  return StdProcess.pid();
}

export function printArgs3(): number {
  console.log(`TID: ${StdProcess.tid()}`);
  return StdProcess.tid();
}

export function printArgs4(): boolean {
  const result = StdProcess.isIsolatedProcess();
  console.info(`isIsolatedProcess() = ${result}`);
  return result;
}

export function printArgs5(): boolean {
  const result = StdProcess.is64Bit();
  console.info(`isIsolatedProcess() = ${result}`);
  return result;
}

export function printArgs6(): number {
  const currentTime = StdProcess.getStartRealtime();
  console.log(`Start Realtime = ${currentTime}`);
  return currentTime;
}

export function printArgs7(): number {
  const currentTime = StdProcess.getPastCpuTime();
  console.log(`Realtime = ${currentTime}`);
  return currentTime;
}

export function printArgs8(): number {
  const currentTime = StdProcess.uptime();
  console.log(`Realtime = ${currentTime}`);
  return currentTime;
}


export function taskpoolTestFunc1(uid: number): Promise<number> {
  return new Promise<number>((resolve) => {
    let taskSuccess = 0;
    try {
      const result = new StdProcess.ProcessManager().isAppUid(uid);
      if (typeof result === 'boolean') {
        taskSuccess++;
        console.info(`taskpool call success, result: ${result}`);
      } else {
        console.error(` taskpool call failed: invalid return type`);
      }
    } catch (error: Error) {
      console.error(` taskpool call exception: ${error.message}`);
    }
    resolve(taskSuccess);
  });
};

export function taskpoolTestFunc2(uname: string): Promise<number> {
  return new Promise<number>((resolve) => {
    let taskSuccess = 0;
    try {
      const result = new StdProcess.ProcessManager().getUidForName(uname);
      if (result) {
        taskSuccess++;
        console.info(`taskpool call success, result: ${result}`);
      } else {
        console.error(` taskpool call failed: invalid return type`);
      }
    } catch (error: Error) {
      console.error(` taskpool call exception: ${error.message}`);
    }
    resolve(taskSuccess);
  });
};

export function taskpoolTestFunc3(uname: number): Promise<number> {
  return new Promise<number>((resolve) => {
    let taskSuccess = 0;
    try {
      const result = new StdProcess.ProcessManager().getThreadPriority(uname);
      if (result) {
        taskSuccess++;
        console.info(`taskpool call success, result: ${result}`);
      } else {
        console.error(` taskpool call failed: invalid return type`);
      }
    } catch (error: Error) {
      console.error(` taskpool call exception: ${error.message}`);
    }
    resolve(taskSuccess);
  });
};

export function taskpoolTestFunc4(uname: number): Promise<number> {
  return new Promise<number>((resolve) => {
    let taskSuccess = 0;
    try {
      const result = new StdProcess.ProcessManager().getSystemConfig(uname);
      if (result) {
        taskSuccess++;
        console.info(`taskpool call success, result: ${result}`);
      } else {
        console.error(` taskpool call failed: invalid return type`);
      }
    } catch (error: Error) {
      console.error(` taskpool call exception: ${error.message}`);
    }
    resolve(taskSuccess);
  });
};

export function taskpoolTestFunc5(uname: string): Promise<number> {
  return new Promise<number>((resolve) => {
    let taskSuccess = 0;
    try {
      const result = new StdProcess.ProcessManager().getEnvironmentVar(uname);
      if (result) {
        taskSuccess++;
        console.info(`taskpool call success, result: ${result}`);
      } else {
        console.error(` taskpool call failed: invalid return type`);
      }
    } catch (error: Error) {
      console.error(` taskpool call exception: ${error.message}`);
    }
    resolve(taskSuccess);
  });
};

export function taskpoolTestFunc6(uid: number): Promise<number> {
  return new Promise<number>((resolve) => {
    let taskSuccess = 0;
    try {
      let result = new StdProcess.ProcessManager().isAppUid(uid);
      if (typeof result === 'boolean') {
        taskSuccess++;
        console.info(`taskpool call success, result: ${result}`);
      } else {
        console.error(` taskpool call failed: invalid return type`);
      }
    } catch (error: Error) {
      console.error(` taskpool call exception: ${error.message}`);
    }
    resolve(taskSuccess);
  });
};

export function taskpoolTestFunc7(uname: string): Promise<number> {
  return new Promise<number>((resolve) => {
    let taskSuccess = 0;
    try {
      let result = new StdProcess.ProcessManager().getUidForName(uname);
      if (result) {
        taskSuccess++;
        console.info(`taskpool call success, result: ${result}`);
      } else {
        console.error(` taskpool call failed: invalid return type`);
      }
    } catch (error: Error) {
      console.error(` taskpool call exception: ${error.message}`);
    }
    resolve(taskSuccess);
  });
};

export function taskpoolTestFunc8(uname: number): Promise<number> {
  return new Promise<number>((resolve) => {
    let taskSuccess = 0;
    try {
      let tid = StdProcess.tid();
      let result = new StdProcess.ProcessManager().getThreadPriority(tid);
      if (result) {
        taskSuccess++;
        console.info(`taskpool call success, result: ${result}`);
      } else {
        console.error(` taskpool call failed: invalid return type`);
      }
    } catch (error: Error) {
      console.error(` taskpool call exception: ${error.message}`);
    }
    resolve(taskSuccess);
  });
};

export function taskpoolTestFunc9(uname: number): Promise<number> {
  return new Promise<number>((resolve) => {
    let taskSuccess = 0;
    try {
      let _SC_ARG_MAX = 0;
      let result = new StdProcess.ProcessManager().getSystemConfig(_SC_ARG_MAX);
      if (result) {
        taskSuccess++;
        console.info(`taskpool call success, result: ${result}`);
      } else {
        console.error(` taskpool call failed: invalid return type`);
      }
    } catch (error: Error) {
      console.error(` taskpool call exception: ${error.message}`);
    }
    resolve(taskSuccess);
  });
};

export function taskpoolTestFunc10(uname: string): Promise<number> {
  return new Promise<number>((resolve) => {
    let taskSuccess = 0;
    try {
      let result = new StdProcess.ProcessManager().getEnvironmentVar("PATH");
      if (result) {
        taskSuccess++;
        console.info(`taskpool call success, result: ${result}`);
      } else {
        console.error(` taskpool call failed: invalid return type`);
      }
    } catch (error: Error) {
      console.error(` taskpool call exception: ${error.message}`);
    }
    resolve(taskSuccess);
  });
};



export function sleep(time: number): Promise<void> {
  return new Promise<void>((re, je) => {
    setTimeout(() => {
      re(undefined)
    }, time)
  })
}