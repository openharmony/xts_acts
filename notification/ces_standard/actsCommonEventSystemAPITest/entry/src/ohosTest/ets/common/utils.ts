/*
* Copyright (c) 2023 Huawei Device Co., Ltd.
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

export function logGenerator(tag: string): (arg1: string) => void {
  return (msg = '') => {
    console.log(tag, msg);
  };
};

export function succeedGenerator(tag: string, resolve: () => void, done: () => void): (arg1: string) => void {
  return (msg = 'succeeded') => {
    console.log(tag, msg);
    resolve();
    done();
  };
};

export function exitGenerator(tag: string, reject: (arg1: Error) => void): (arg1: string) => void {
  return (errMsg = 'exit for error') => {
    // Current xts log cannot capture error log. Do not use `console.error`.
    console.log(tag, 'error', errMsg);
    reject(new Error(errMsg));
  };
};

// Unlike testcase in `it`, current test hooks `beforeAll, beforeEach, afterEach, afterAll`
// need to call done even if reject is called.
export function exitSpecialGenerator(tag: string, reject: (arg1: Error) => void, done: () => void):
(arg1: string) => void {
  return (errMsg = 'exit for error') => {
    // Current xts log cannot capture error log. Do not use `console.error`.
    console.log(tag, 'error', errMsg);
    reject(new Error(errMsg));
    done();
  };
};

export async function sleep(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
};
