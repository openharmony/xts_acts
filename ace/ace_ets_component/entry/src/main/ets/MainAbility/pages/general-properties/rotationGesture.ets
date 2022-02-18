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
struct RotationGestureExample {
  @State angle: number = 0
  @State eventType: string = ''
  @State isTouched: boolean = false;

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
      Text('RotationGesture angle:' + this.angle)
    }
    .height(300).width(300).padding(20).border({ width:1 })
    .margin(80).rotate({ x:1, y:2, z:3, angle: this.angle })
    .key('gesture')
    .onTouch((event: TouchEvent) => {
      this.isTouched = true
      if (event.type === TouchType.Down) {
        this.eventType = 'Down'
      }
      if (event.type === TouchType.Up) {
        this.eventType = 'Up'
      }
      if (event.type === TouchType.Move) {
        this.eventType = 'Move'
      }
      console.info('RotationGesture TouchType:' + this.eventType)
      try {
        var backData = {
          data: {
            "ACTION": this.isTouched,
            "EVENT_TYPE": this.eventType
          }
        }
        var backEvent = {
          eventId: 56,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("RotationGesture start to emit action state")
        events_emitter.emit(backEvent, backData)
      } catch (err) {
        console.info("RotationGesture emit action state err: " + JSON.stringify(err.message))
      }
    })
    .gesture(
    RotationGesture()
      .onActionStart((event: RotationGestureEvent) => {
        console.log('Rotation start')
      })
      .onActionUpdate((event: RotationGestureEvent) => {
        this.angle = event.angle
      })
      .onActionEnd(() => {
        console.log('Rotation end')
      })
    )
  }
}
