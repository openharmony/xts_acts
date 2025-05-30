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
import { VideoModifier } from "@ohos.arkui.modifier";

class CustomModifier extends VideoModifier {
  applyVideoAttribute(instance: VideoAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.muted(true)
  }
}

@Entry
@Component
struct VideoExample {
  @State videoSrc: Resource = $rawfile('video.mp4')
  @State previewUri: Resource = $r('app.media.icon')
  @State curRate: PlaybackSpeed = PlaybackSpeed.Speed_Forward_1_00_X
  @State isAutoPlay: boolean = false

  @State customModifier: VideoModifier = new CustomModifier()
    .muted(false)
    .autoPlay(false)
    .controls(true)
    .loop(false)
    .objectFit(ImageFit.Cover)

  build() {
    Column({ space: 5 }) {
      Button("change value").onClick(() => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      Column() {
        Video({
          src: this.videoSrc,
          previewUri: this.previewUri,
          currentProgressRate: this.curRate
        })
          .width(250)
          .height(200)
          .attributeModifier(this.customModifier as CustomModifier)
          .key('video')
      }
    }
    .margin({ top: 5 })
  }
}