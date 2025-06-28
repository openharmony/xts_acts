/*
 * Copyright (c) 2021-2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Core } from './core';
import { ConfigService } from './module/config/configService';
import { AnyType } from './module/types/common';

export function getFuncWithArgsZero(func: (() => void) | (() => Promise<void>), timeout: int, isStressTest: boolean) {
  return new Promise<void>(async (resolve: (value: PromiseLike<void>) => void, reject: (value: object) => void) => {
    let timer:number;
    if (!isStressTest) {
      timer = setTimeout(() => {
        reject(new Error('execute timeout ' + timeout + 'ms'));
      }, timeout);
    }
    try {
      await (func as () => Promise<void>)();
    } catch (err: Error) {}
    if (!!timer) {
      clearTimeout(timer);
    }
    resolve(Promise.resolve());
  });
}

export function getAsyncFuncWithArgsOne(
  func: (params: () => void) => Promise<void>,
  timeout: int,
  isStressTest: boolean
) {
  return new Promise<void>(async (resolve: (value: PromiseLike<void>) => void, reject: (reason: Error) => void) => {
    let timer:number;
    if (!isStressTest) {
      timer = setTimeout(() => {
        reject(new Error('execute timeout ' + timeout + 'ms'));
      }, timeout);
    }

    const done = () => {
      if (!!timer) {
        clearTimeout(timer);
      }
      resolve(Promise.resolve());
    };

    try {
      await func(done);
    } catch (err: Error) {
      if (!!timer) {
        clearTimeout(timer);
      }
      reject(err);
    }
  });
}

export function getFuncWithArgsOne(func: (params: () => void) => void, timeout: int, isStressTest: boolean) {
  return new Promise<void>(async (resolve: (value: PromiseLike<void>) => void, reject: (reason: Error) => void) => {
    let timer:number;
    if (!isStressTest) {
      timer = setTimeout(() => {
        reject(new Error('execute timeout ' + timeout + 'ms'));
      }, timeout);
    }

    const done = () => {
      if (!!timer) {
        clearTimeout(timer);
      }
      resolve(Promise.resolve());
    };

    try {
      func(done);
    } catch (err: Error) {
      if (!!timer) {
        clearTimeout(timer);
      }
      reject(err);
    }
  });
}

export function getAsyncFuncWithArgsTwo(
  func: (param1: () => void, param2: AnyType) => Promise<void>,
  timeout: int,
  paramItem: AnyType,
  isStressTest: boolean
) {
  return new Promise<void>(async (resolve: (value: PromiseLike<void>) => void, reject: (reason: Error) => void) => {
    let timer:number;
    if (!isStressTest) {
      timer = setTimeout(() => {
        reject(new Error('execute timeout ' + timeout + 'ms'));
      }, timeout);
    }

    const done = () => {
      if (!!timer) {
        clearTimeout(timer);
      }
      resolve(Promise.resolve());
    };

    try {
      await func(done, paramItem);
    } catch (err: Error) {
      if (!!timer) {
        clearTimeout(timer);
      }
      reject(err);
    }
  });
}

export function getFuncWithArgsTwo(
  func: (param1: () => void, param2: AnyType) => void,
  timeout: int,
  paramItem: AnyType,
  isStressTest: boolean
) {
  return new Promise<void>(async (resolve: (value: PromiseLike<void>) => void, reject: (reason: Error) => void) => {
    let timer:number;
    if (!isStressTest) {
      timer = setTimeout(() => {
        reject(new Error('execute timeout ' + timeout + 'ms'));
      }, timeout);
    }

    const done = () => {
      if (!!timer) {
        clearTimeout(timer);
      }
      resolve(Promise.resolve());
    };

    try {
      func(done, paramItem);
    } catch (err: Error) {
      if (!!timer) {
        clearTimeout(timer);
      }
      reject(err);
    }
  });
}

export function processFunc(
  coreContext: Core,
  func: ((param1?: () => void) => void) | ((param1?: () => void) => Promise<void>)
) {
  const configService = coreContext.getDefaultService('config');
  if (configService !== null) {
    const config = configService as ConfigService;
    config.setSupportAsync(true);
    const timeout = config.timeout === undefined ? 5000 : Number(config.timeout);
    let isStressTest = false;
    if (coreContext.getServices('dataDriver')) {
      if (config.getStress() > 1) {
        isStressTest = true;
      } else {
        isStressTest = false;
      }
    } else {
      isStressTest = false;
    }
    return () => {
      return getFuncWithArgsZero(func, timeout as int, isStressTest);
    };
  }
  return () => {
    return getFuncWithArgsZero(func, 0, false);
  };
}

export function processAsyncFuncWithArgOne(coreContext: Core, func: (done: () => void) => Promise<void>) {
  const configService = coreContext.getDefaultService('config');
  if (configService !== null) {
    const config = configService as ConfigService;
    config.setSupportAsync(true);
    const timeout = config.timeout === undefined ? 5000 : Number(config.timeout);
    const isStressTest = coreContext.getServices('dataDriver') !== undefined || config.getStress() > 1;
    return () => {
      return getAsyncFuncWithArgsOne(func, timeout as int, isStressTest);
    };
  }
  return () => {
    return getAsyncFuncWithArgsOne(func, 0, false);
  };
}

export function processFuncWithArgOne(coreContext: Core, func: (done: () => void) => void) {
  const configService = coreContext.getDefaultService('config');
  if (configService !== null) {
    const config = configService as ConfigService;
    config.setSupportAsync(true);
    const timeout = config.timeout === undefined ? 5000 : Number(config.timeout);
    const isStressTest = coreContext.getServices('dataDriver') !== undefined || config.getStress() > 1;
    return () => {
      return getFuncWithArgsOne(func, timeout as int, isStressTest);
    };
  }
  return () => {
    return getFuncWithArgsOne(func, 0, false);
  };
}

export function processAsyncFuncWithArgTwo(
  coreContext: Core,
  func: (param1: () => void, param2: AnyType) => Promise<void>
) {
  const configService = coreContext.getDefaultService('config');
  if (configService !== null) {
    const config = configService as ConfigService;
    config.setSupportAsync(true);
    const timeout = config.timeout === undefined ? 5000 : Number(config.timeout);
    const isStressTest = coreContext.getServices('dataDriver') !== undefined || config.getStress() > 1;
    return (paramItem: AnyType) => {
      return getAsyncFuncWithArgsTwo(func, timeout as int, paramItem, isStressTest);
    };
  }
  return (paramItem: AnyType) => {
    return getAsyncFuncWithArgsTwo(func, 0, paramItem, false);
  };
}

export function processFuncWithArgTwo(coreContext: Core, func: (param1: () => void, param2: AnyType) => void) {
  const configService = coreContext.getDefaultService('config');
  if (configService !== null) {
    const config = configService as ConfigService;
    config.setSupportAsync(true);
    const timeout = config.timeout === undefined ? 5000 : Number(config.timeout);
    const isStressTest = coreContext.getServices('dataDriver') !== undefined || config.getStress() > 1;
    return (paramItem: AnyType) => {
      return getFuncWithArgsTwo(func, timeout as int, paramItem, isStressTest);
    };
  }
  return (paramItem: AnyType) => {
    return getFuncWithArgsTwo(func, 0, paramItem, false);
  };
}
