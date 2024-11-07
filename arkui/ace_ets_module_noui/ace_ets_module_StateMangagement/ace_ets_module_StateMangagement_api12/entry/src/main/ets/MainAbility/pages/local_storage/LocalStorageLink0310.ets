/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

let storageLink0310 = new LocalStorage()
storageLink0310.setOrCreate('LocalStorageLink0310Set', new Set<number>([0, 0, 0]))
let storageLink0310Map: Map<string, string> = new Map()
storageLink0310Map.set('key', 'value')
let para: Record<string, number> = { 'propA': 47 };
storageLink0310.setOrCreate('LocalStorageLink0310Map', storageLink0310Map)
storageLink0310.setOrCreate('LocalStorageLink0310Date', new Date(2024, 1, 1, 8, 9, 30))
storageLink0310.setOrCreate('LocalStorageLink0310Undefined', undefined)
storageLink0310.setOrCreate('LocalStorageLink0310Null', null)
storageLink0310.setOrCreate('LocalStorageLink0310Array', [0, false, para])

@Component
struct ChildLocalStorageLink0310 {
  @LocalStorageLink('LocalStorageLink0310Set') set: Set<number> = new Set()
  @LocalStorageLink('LocalStorageLink0310Map') map: Map<string, string> = new Map()
  @LocalStorageLink('LocalStorageLink0310Date') date: Date = new Date()
  @LocalStorageLink('LocalStorageLink0310Undefined') und: undefined = undefined
  @LocalStorageLink('LocalStorageLink0310Null') nul: null = null
  @LocalStorageLink('LocalStorageLink0310Array') arr: (number | boolean | ESObject)[] = []

  build() {
    Column() {
      Text(Array.from(this.set).toString()).id('tv0310ChildSet')
      Text(this.map.get('key')).id('tv0310ChildMap')
      Text(this.date.toString()).id('tv0310ChildDate')
      Text('Hello' + this.und).id('tv0310ChildUnd')
      Text('Hello' + this.nul).id('tv0310ChildNull')
      Text('Arr' + JSON.stringify(this.arr)).id('tv0310ChildArr')
    }
  }
}


@Entry(storageLink0310)
@Component
struct LocalStorageLink0310 {
  @LocalStorageLink('LocalStorageLink0310Set') set: Set<number> = new Set()
  @LocalStorageLink('LocalStorageLink0310Map') map: Map<string, string> = new Map()
  @LocalStorageLink('LocalStorageLink0310Date') date: Date = new Date()
  @LocalStorageLink('LocalStorageLink0310Undefined') und: undefined = undefined
  @LocalStorageLink('LocalStorageLink0310Null') nul: null = null
  @LocalStorageLink('LocalStorageLink0310Array') arr: (number | boolean | ESObject)[] = []

  build() {
    Column() {
      Text(Array.from(this.set).toString()).id('tv0310ParentSet')
      Text(this.map.get('key')).id('tv0310ParentMap')
      Text(this.date.toString()).id('tv0310ParentDate')
      Text('Hello' + this.und).id('tv0310ParentUnd')
      Text('Hello' + this.nul).id('tv0310ParentNull')
      Text('Arr' + JSON.stringify(this.arr)).id('tv0310ParentArr')
      ChildLocalStorageLink0310()
      Button('Change')
        .id('btnLocalStorageLink0310')
        .onClick(() => {
          this.set.add(1)
          this.map.set('key', 'newValue')
          this.date.setTime(this.date.getTime() + 1000)
          this.und = undefined
          this.nul = null
          this.arr = [1, true, { 'propB': 48 }]
        })
    }
  }
}