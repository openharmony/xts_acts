/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
 //@ts-nocheck
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import testsuite from '../../test/List.test'

export class MyDataSource implements IDataSource {
  private list: number[] = []
  private listener: DataChangeListener

  constructor(list: number[]) { this.list = list }

  totalCount(): number {
    return this.list.length
}

  getData(index: number): any {
    return this.list[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener
  }

  unregisterDataChangeListener() {
  }
}

@Entry
@Component
struct SwiperTest {

  aboutToAppear(){
    var abilityDelegator: any
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    var abilityDelegatorArguments: any
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  @State flag: boolean = false;
  @State selectedItemWidth: number = 12
  @State selectedItemHeight: number = 6
  @State itemWidth: number = 6
  @State itemHeight: number = 6
  @State selectedFontColor: Color = Color.Black
  @State fontColor: Color = Color.Black
  @State selectedSize: string | number = 14;
  @State itemSize: string | number = 14;
  @State selectedWeight: FontWeight | number | string = FontWeight.Normal;
  @State itemWeight: FontWeight | number | string = FontWeight.Normal;
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource = new MyDataSource([])

  build() {
    Row() {
      Column() {
        List({ space: 5, initialIndex: 0 }) {
          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: string) => {
                Text(item)
                  .width('90%')
                  .height(160)
                  .backgroundColor(0xAFEEEE)
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, item => item)
            }
            .autoPlay(true)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key("ArkUX_Stage_Swiper_ItemHeight_0100")
            .curve(Curve.Linear)
            .indicator(Indicator.dot()
              .itemHeight(3))
            .onChange((index: number) => {
              console.info(index.toString())
            })
          }
          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: string) => {
                Text(item)
                  .width('90%')
                  .height(160)
                  .backgroundColor(0xAFEEEE)
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, item => item)
            }
            .autoPlay(true)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key("ArkUX_Stage_Swiper_ItemHeight_0200")
            .curve(Curve.Linear)
            .indicator(Indicator.dot()
              .itemHeight(""))
            .onChange((index: number) => {
              console.info(index.toString())
            })
          }
          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: string) => {
                Text(item)
                  .width('90%')
                  .height(160)
                  .backgroundColor(0xAFEEEE)
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, item => item)
            }
            .autoPlay(true)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key("ArkUX_Stage_Swiper_ItemHeight_0300")
            .curve(Curve.Linear)
            .indicator(Indicator.dot()
              .itemHeight("9999vp"))
            .onChange((index: number) => {
              console.info(index.toString())
            })
          }
          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: string) => {
                Text(item)
                  .width('90%')
                  .height(160)
                  .backgroundColor(0xAFEEEE)
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, item => item)
            }
            .autoPlay(true)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key("ArkUX_Stage_Swiper_ItemHeight_0400")
            .curve(Curve.Linear)
            .indicator(Indicator.dot()
              .itemHeight(-1))
            .onChange((index: number) => {
              console.info(index.toString())
            })
          }
          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: string) => {
                Text(item)
                  .width('90%')
                  .height(160)
                  .backgroundColor(0xAFEEEE)
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, item => item)
            }
            .autoPlay(true)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key("ArkUX_Stage_Swiper_ItemHeight_0500")
            .curve(Curve.Linear)
            .indicator(Indicator.dot()
              .itemHeight("abc"))
            .onChange((index: number) => {
              console.info(index.toString())
            })
          }
          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: string) => {
                Text(item)
                  .width('90%')
                  .height(160)
                  .backgroundColor(0xAFEEEE)
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, item => item)
            }
            .autoPlay(true)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key("ArkUX_Stage_Swiper_ItemHeight_0600")
            .curve(Curve.Linear)
            .indicator(Indicator.dot()
              .itemHeight("8fp"))
            .onChange((index: number) => {
              console.info(index.toString())
            })
          }
          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: string) => {
                Text(item)
                  .width('90%')
                  .height(160)
                  .backgroundColor(0xAFEEEE)
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, item => item)
            }
            .autoPlay(true)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key("ArkUX_Stage_Swiper_ItemHeight_0700")
            .curve(Curve.Linear)
            .indicator(Indicator.dot()
              .itemHeight("8lpx"))
            .onChange((index: number) => {
              console.info(index.toString())
            })
          }		
		ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: string) => {
                Text(item)
                  .width('90%')
                  .height(160)
                  .backgroundColor(0xAFEEEE)
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, item => item)
            }
            .autoPlay(true)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key("ArkUX_Stage_Swiper_SelectedFontColor_0100")
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .selectedFontColor(0x00ff00))
            .onChange((index: number) => {
              console.info(index.toString())
            })
          }
          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: string) => {
                Text(item)
                  .width('90%')
                  .height(160)
                  .backgroundColor(0xAFEEEE)
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, item => item)
            }
            .autoPlay(true)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key("ArkUX_Stage_Swiper_SelectedFontColor_0200")
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .selectedFontColor("#FFFF0000"))
            .onChange((index: number) => {
              console.info(index.toString())
            })
          }
          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: string) => {
                Text(item)
                  .width('90%')
                  .height(160)
                  .backgroundColor(0xAFEEEE)
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, item => item)
            }
            .autoPlay(true)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key("ArkUX_Stage_Swiper_SelectedFontColor_0300")
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .selectedFontColor("rgb(138,43,226)"))
            .onChange((index: number) => {
              console.info(index.toString())
            })
          }
          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: string) => {
                Text(item)
                  .width('90%')
                  .height(160)
                  .backgroundColor(0xAFEEEE)
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, item => item)
            }
            .autoPlay(true)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key("ArkUX_Stage_Swiper_SelectedFontColor_0400")
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .selectedFontColor(Color.Pink))
            .onChange((index: number) => {
              console.info(index.toString())
            })
          }
          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: string) => {
                Text(item)
                  .width('90%')
                  .height(160)
                  .backgroundColor(0xAFEEEE)
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, item => item)
            }
            .autoPlay(true)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key("ArkUX_Stage_Swiper_SelectedFontColor_0500")
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .selectedFontColor(""))
            .onChange((index: number) => {
              console.info(index.toString())
            })
          }
          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: string) => {
                Text(item)
                  .width('90%')
                  .height(160)
                  .backgroundColor(0xAFEEEE)
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, item => item)
            }
            .autoPlay(true)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key("ArkUX_Stage_Swiper_SelectedFontColor_0600")
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .selectedFontColor(null))
            .onChange((index: number) => {
              console.info(index.toString())
            })
          }
          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: string) => {
                Text(item)
                  .width('90%')
                  .height(160)
                  .backgroundColor(0xAFEEEE)
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, item => item)
            }
            .autoPlay(true)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key("ArkUX_Stage_Swiper_SelectedFontColor_0700")
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .selectedFontColor($r("app.color.selected_font_color_test")))
            .onChange((index: number) => {
              console.info(index.toString())
            })
          }
          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: string) => {
                Text(item)
                  .width('90%')
                  .height(160)
                  .backgroundColor(0xAFEEEE)
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, item => item)
            }
            .autoPlay(true)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key("ArkUX_Stage_Swiper_SelectedFontColor_0800")
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .selectedFontColor("bgr(138,43,226)"))
            .onChange((index: number) => {
              console.info(index.toString())
            })
          }
          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: string) => {
                Text(item)
                  .width('90%')
                  .height(160)
                  .backgroundColor(0xAFEEEE)
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, item => item)
            }
            .autoPlay(true)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key("ArkUX_Stage_Swiper_SelectedFontColor_0900")
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .selectedFontColor(undefined))
            .onChange((index: number) => {
              console.info(index.toString())
            })
          }
          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: string) => {
                Text(item)
                  .width('90%')
                  .height(160)
                  .backgroundColor(0xAFEEEE)
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, item => item)
            }
            .autoPlay(true)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key("ArkUX_Stage_Swiper_SelectedFontColor_1000")
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .selectedFontColor("rgb(138,43,226)"))
            .indicator(Indicator.digit()
              .selectedFontColor(Color.Gray))
            .onChange((index: number) => {
              console.info(index.toString())
            })
          }
          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: string) => {
                Text(item)
                  .width('90%')
                  .height(160)
                  .backgroundColor(0xAFEEEE)
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, item => item)
            }
            .autoPlay(true)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key("ArkUX_Stage_Swiper_SelectedFontColor_1100")
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .selectedFontColor(0x00ff00))
            .backgroundColor(Color.Pink)
            .onChange((index: number) => {
              console.info(index.toString())
            })
          }
          ListItem() {
            Swiper(this.swiperController) {
              LazyForEach(this.data, (item: string) => {
                Text(item)
                  .width('90%')
                  .height(160)
                  .backgroundColor(0xAFEEEE)
                  .textAlign(TextAlign.Center)
                  .fontSize(30)
              }, item => item)
            }
            .autoPlay(true)
            .interval(4000)
            .loop(true)
            .duration(1000)
            .itemSpace(0)
            .key("ArkUX_Stage_Swiper_SelectedFontColor_1200")
            .curve(Curve.Linear)
            .indicator(Indicator.digit()
              .selectedFontColor("rgb(255,0,0)"))
            .indicator(Indicator.digit()
              .selectedFontColor(undefined))
            .onChange((index: number) => {
              console.info(index.toString())
            })
          }
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}
