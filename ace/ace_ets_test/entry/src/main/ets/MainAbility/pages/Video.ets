/*
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
 
@Entry
@Component
struct VideoCreateComponent {
  @State srcs: string = '/resources/rawfile/video/show.mp4';
  @State previewUri: string = '/resources/image/dark.jpg';
  @State currentProgressRates: number = 1;
  @State autoPlays: boolean = false;
  @State controlsss: boolean = true;
  myVideoController: VideoController = new VideoController();
  @State startStaus: boolean = true;

  build() {
    Column() {
      Video({
        src: this.srcs,
        previewUri: this.previewUri,
        currentProgressRate: this.currentProgressRates,
        controller: this.myVideoController
      })

        .width(700)
        .height(500)
        .autoPlay(this.autoPlays)
        .muted(true)
        .controls(this.controlsss)
        .loop(true)
        .objectFit(ImageFit.Cover)
        .key('video')
      Row() {
        Button("start").onClick(() => {
          this.myVideoController.start();
        });
        Button("pause").onClick(() => {
          this.myVideoController.pause();
        });
        Button("stop").onClick(() => {
          this.myVideoController.stop();
        });
      }

      Row() {
        Button("setCurrentTime").onClick(() => {
          this.myVideoController.setCurrentTime(9);
        });
        Button("requestFullscreen").onClick(() => {
          this.myVideoController.requestFullscreen(true);
        });
        Button("exitFullscreen").onClick(() => {
          this.myVideoController.exitFullscreen();
        });
      }
    }
  }
}