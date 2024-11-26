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

@Observed
class MyObject {
  public id: number
  public value: string

  constructor(id: number, value: string) {
    this.id = id
    this.value = value
  }
}

@Entry
@Component
struct StateArrayObject {
  @State message: Array<MyObject> = [new MyObject(1, 'Object 1'),
    new MyObject(2, 'Object 2'),
    new MyObject(3, 'Object 3')]

  build() {
    Row() {
      Column() {
        ForEach(Array.from(this.message.entries()), (item: [number, MyObject]) => {
          Text(`Item${item[1].id}: ${item[1].value} index: ${item[0]}`).fontSize(30)
            .id('stateArrayObject_value_' + item[0])
          Divider()
        })

        Button('init array').id('stateArrayObject_init')
          .onClick(() => {
            this.message = [
              new MyObject(4, 'Object 4'),
              new MyObject(5, 'Object 5'),
              new MyObject(6, 'Object 6')
            ]
          }).margin(10)

        Button('add new object').id('stateArrayObject_add')
          .onClick(() => {
            let lastIndex = this.message.length - 1
            let newId = this.message[lastIndex].id + 1
            this.message.push(new MyObject(newId, `Object ${newId}`))
          }).margin(10)

        Button('clear').id('stateArrayObject_clear')
          .onClick(() => {
            this.message = []
            if (Array.from(this.message.entries())) {
              this.message.push(new MyObject(0, 'Object 0'))
            }
          }).margin(10)

        Button('replace the first one').id('stateArrayObject_replace')
          .onClick(() => {
            this.message[0] = new MyObject(6, 'Object 6')
          }).margin(10)

        Button('delete the first one').id('stateArrayObject_delete')
          .onClick(() => {
            this.message.shift()
          }).margin(10)
      }
      .width('100%')
    }
    .height('100%')
  }
}
