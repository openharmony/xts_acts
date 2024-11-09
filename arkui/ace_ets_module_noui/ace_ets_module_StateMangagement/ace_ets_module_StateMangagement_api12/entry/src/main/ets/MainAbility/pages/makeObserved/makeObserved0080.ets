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
import { collections } from '@kit.ArkTS';
import { UIUtils } from '@kit.ArkUI';
import { LengthMetrics } from '@kit.ArkUI';

@Entry
@ComponentV2
struct makeObserved0080 {
  private arr: Array<number> = new Array(5).fill(0).fill(0)
  private scroller: ListScroller = new ListScroller()
  listSpace: number = 10
  listChildrenSize: ChildrenMainSize = UIUtils.makeObserved(new ChildrenMainSize(30))

  build() {
    Column() {
      Button('change Default').onClick(() => {
        this.listChildrenSize.childDefaultSize += 10
      }).id('buttonChangeDefault')
      Button('splice 5').onClick(() => {
        this.listChildrenSize.splice(0, 2, [50, 50, 50])
      }).id('buttonSplice')
      Button('update 5').onClick(() => {
        this.listChildrenSize.update(0, 60)
      }).id('buttonUpdate')
      List({ space: this.listSpace, scroller: this.scroller }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('item-' + item)
          }.backgroundColor(Color.Pink)
        })
      }.id('listTest')
      .childrenMainSize(this.listChildrenSize) // 10
    }
  }
}
