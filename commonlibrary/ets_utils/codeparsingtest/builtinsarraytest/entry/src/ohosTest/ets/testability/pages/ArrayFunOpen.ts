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

export function at(arr: Array<any>, num: any) {
  return (arr as any).at(num)
}

export function atUnDefinition() {
  let array: Array<number>
  return (array as any).at(0)
}

export function lastIndexOf(arr: Array<any>, values: any) {
  return arr.lastIndexOf(values)
}

export function slice(arrayBuffer: ArrayBuffer, begin?: any, end?: any) {
  return arrayBuffer.slice(begin, end)
}

export function checkInnerCalculate1(arr: Array<any>, x: number) {
  (arr as any).at(x + x);
  (arr as any).at(x * x)
}

export function checkInnerCalculate2(arr: Array<any>, v: number) {
  (arr as any).at(Math.floor(v))
}

export function testMap(arr: Array<any>) {
  return arr.map(element => element * 2)
}

export function exportObj() {
  return {}
}

export const exportObj2 = {
  a: 1
}

export function any(obj: any) {
  return obj
}