/*
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
 
import { StepperModifier } from '@kit.ArkUI'

@Entry
@Component
export default struct StepperModifierPage {
  @State currentIndex: number = 0
  @State firstState: ItemState = ItemState.Normal
  @State secondState: ItemState = ItemState.Normal
  @State thirdState: ItemState = ItemState.Normal

  private stepperModifier: StepperModifier = new StepperModifier()
    .onFinish(() => {
      this.currentIndex = 0;
      AppStorage.setOrCreate('currentIndex', this.currentIndex);
      console.info('testTag onFinish')
    })
    .onSkip(() => {
      this.currentIndex = 3;
      AppStorage.setOrCreate('currentIndex', this.currentIndex);
      console.info('testTag onSkip')
    })
    .onChange((prevIndex?: number, index?: number) => {
      console.info('testTag onChange')
      AppStorage.setOrCreate('currentIndex', index);
      if (index) {
        this.currentIndex = index
      }
    })
    .onNext((index?: number, pendingIndex?: number) => {
      console.info('testTag onNext')
      console.info('testTag onNext index: ' + index + 'onNext pendingIndex: ' + pendingIndex)
      AppStorage.setOrCreate('pendingIndex', pendingIndex);
      if (pendingIndex) {
        this.currentIndex = pendingIndex
      }
    })
    .onPrevious((index?: number, pendingIndex?: number) => {
      console.info('testTag onPreview')
      console.info('testTag onPreview index: ' + index + 'onNext pendingIndex: ' + pendingIndex)
      AppStorage.setOrCreate('pendingIndex', pendingIndex);
      if (pendingIndex) {
        this.currentIndex = pendingIndex
      }
    })

  build() {
    NavDestination(){
      Stepper({
        index: this.currentIndex
      }) {
        // 第一个步骤页
        StepperItem() {
          Column() {
            Text('Page One')
            Button('change status:' + this.firstState)
              .backgroundColor('#007dFF')
              .onClick(() => {
                this.firstState = this.firstState === ItemState.Skip ? ItemState.Normal : ItemState.Skip
              })
              .id('changeId1')
          }
        }
        .nextLabel('StepperNext1')
        .status(this.firstState)
        // 第二个步骤页
        StepperItem() {
          Column() {
            Text('Page Two')
            Button('change status:' + this.secondState)
              .backgroundColor('#007dFF')
              .onClick(() => {
                this.secondState = this.secondState === ItemState.Disabled ? ItemState.Normal : ItemState.Disabled
              })
          }
        }
        .nextLabel('Next')
        .prevLabel('StepperPrevious')
        .status(this.secondState)
        // 第三个步骤页
        StepperItem() {
          Column() {
            Text('Page Three')
            Button('change status:' + this.thirdState)
              .backgroundColor('#007dFF')
              .onClick(() => {
                this.thirdState = this.thirdState === ItemState.Waiting ? ItemState.Normal : ItemState.Waiting
              })
          }
        }
        .status(this.thirdState)
        // 第四个步骤页
        StepperItem() {
          Column() {
            Text('Page Four')
          }
        }
        .nextLabel('fourFinish')
        .prevLabel('fourPrevious')
      }
      .backgroundColor('#F1F3F5')
      .attributeModifier(this.stepperModifier)
    }
  }
}