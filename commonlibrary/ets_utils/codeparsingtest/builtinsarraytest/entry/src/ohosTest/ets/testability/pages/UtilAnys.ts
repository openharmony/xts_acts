/*
* Copyright (C) 2025 HiHope Open Source Organization.
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


function equalArrays(array1: Array<number | undefined | string>,
  array2: Array<undefined | string | number>): boolean {
  if (array1.length !== array2.length) {
    return false;
  }
  for (let i = 0; i < array1.length; i++) {
    if (array1[i] !== array2[i]) {
      return false;
    }
  }
  return true;
}


function equalObject(array1: any, array2: any): boolean {
  if (array1.length !== array2.length) {
    return false;
  }
  for (let i = 0; i < array1.length; i++) {
    const ob1 = array1[i];
    const key1 = Object.keys(ob1);
    const ob2 = array2[i];
    const key2 = Object.keys(ob2);
    if (key1.length !== key2.length) {
      return false;
    }
    for (let key of key1) {
      if (ob1[key] !== ob2[key]) {
        return false;
      }
    }
  }
  return true;
}


function equalArrayArray(array1: any, array2: any): boolean {
  if (array1.length !== array2.length) {
    return false;
  }
  for (let i = 0; i < array1.length; i++) {
    const items2 = array2[i];
    const items1 = array1[i];
    if (Array.isArray(items1) && Array.isArray(items2)) {
      if (!equalArrays(items1, items2)) {
        return false;
      }
    } else if (items2 !== items1) {
      return false;
    }
  }
  return true;
}

export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export {equalArrays as isArrayEqual, equalObject as isObjectEqual, equalArrayArray as isArrayArrayEqual}
