/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
let nextIdA: number = 0;

@ObservedV2
class Arr {
  id: number = 0;
  @Trace numberArr: number[] = [];

  constructor() {
    this.id = nextIdA++;
    this.numberArr = [0, 1, 2];
  }
}

@Entry
@Component
struct ArrayTrack {
  arr: Arr = new Arr();

  build() {
    Column() {
      Text(`length:${this.arr.numberArr.length}`)
        .id('ArrayTrack_1A')
        .height('3%')
        .fontSize(9)
      Divider()
      if (this.arr.numberArr.length >= 3) {
        Text(`${this.arr.numberArr[0]}`)
          .height('3%')
          .fontSize(9)
          .onClick(() => {
            this.arr.numberArr[0]++;
          })
        Text(`${this.arr.numberArr[1]}`)
          .height('3%')
          .fontSize(9)
          .onClick(() => {
            this.arr.numberArr[1]++;
          })
        Text(`${this.arr.numberArr[2]}`)
          .width('10%')
          .height('3%')
          .fontSize(9)
          .onClick(() => {
            this.arr.numberArr[2]++;
          })
      }

      Divider()

      ForEach(this.arr.numberArr, (item: number, index: number) => {
        Text(`${index} ${item}`)
          .width('10%')
          .height('3%')
          .fontSize(9)
      })

      Button('push')
        .id('ArrayTrack_2A')
        .width('10%')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          this.arr.numberArr.push(50);
        })

      Button('pop')
        .width('10%')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          this.arr.numberArr.pop();
        })

      Button('shift')
        .width('10%')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          this.arr.numberArr.shift();
        })

      Button('splice')
        .width('10%')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          this.arr.numberArr.splice(1, 0, 60);
        })

      Button('unshift')
        .width('10%')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          this.arr.numberArr.unshift(100);
        })

      Button('copywithin')
        .width('10%')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          this.arr.numberArr.copyWithin(0, 1, 2);
        })

      Button('fill')
        .width('10%')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          this.arr.numberArr.fill(0, 2, 4);
        })

      Button('reverse')
        .width('10%')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          this.arr.numberArr.reverse();
        })

      Button('sort')
        .width('10%')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          this.arr.numberArr.sort();
        })
    }
  }
}
