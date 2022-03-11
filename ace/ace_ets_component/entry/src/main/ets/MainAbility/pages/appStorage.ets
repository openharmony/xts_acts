// @ts-nocheck
/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.emitter';

@Entry
@Component
struct AppStorageExp {
  @State countDownStartValue: number = 10 // 10 Nuggets default start value in a Game
  build() {
    Column() {
      Text(`Grant ${this.countDownStartValue} nuggets to play.`)
      Button() {
        Text('+1 - Nuggets in New Game')
      }.onClick(() => {
        this.countDownStartValue += 1
      })

      Button() {
        Text('-1  - Nuggets in New Game')
      }.onClick(() => {
        this.countDownStartValue -= 1
      })
      // 创建子组件时，必须在构造函数参数中提供其@Prop变量的初始值，同时初始化常规变量CostOfOneAttump（非Prop）
      CountDownComponent({ count: this.countDownStartValue, costOfOneAttempt: 2 })
    }
  }
}

@Component
struct CountDownComponent {
  @Prop count: number
  private costOfOneAttempt: number

  build() {
    Column() {
      if (this.count > 0) {
        Text(`You have ${this.count} Nuggets left`)
      } else {
        Text('Game over!')
      }

      Button() {
        Text('Try again')
      }.onClick(() => {
        this.count -= this.costOfOneAttempt
      })
    }
  }
}