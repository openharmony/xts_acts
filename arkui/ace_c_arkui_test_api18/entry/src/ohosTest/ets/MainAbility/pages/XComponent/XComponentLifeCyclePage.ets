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

import router from '@ohos.router';
import native from 'libnativerender.so';
import {NodeContent} from '@kit.ArkUI'

@Entry
@Component
export struct CNodePage {
  @State currentStatus: string = 'init';
  @State nodeContent: NodeContent | undefined = new NodeContent();
  @State w: number = 200;
  @State f: boolean = true;
  @State flag: boolean = false;
  @State initialize_status: number = -1;
  @State finalize_status: number = -1;
  @State removecallback_status: number = -1;
  @State user_data: string = '-';

  build() {
    Column({ space : 5 }) {
      Text(this.f ? 'isAutoInitialized = true' : 'isAutoInitialized = false')
      Text(this.initialize_status.toString()).id('xcomponent_initialize_status')
      Text(this.finalize_status.toString()).id('xcomponent_finalize_status')
      Text(this.removecallback_status.toString()).id('xcomponent_removecallback_status')
      Text(this.user_data.toString()).id('xcomponent_user_data')
      Column() {
        if (this.flag) {
          ContentSlot(this.nodeContent)
        }
      }
      .width(this.w)
      .height(this.w)
      Column({ space: 5 }) {
        Button('创建CAPI XCNODE: isAutoInitialized = true')
          .onClick(()=>{
            native.XComponentCreateNativeNode(this.nodeContent, 'auto', this.getUIContext());
            this.f = true
            this.flag = true
          })
          .id('xcomponent_create')
        Button('创建CAPI XCNODE: isAutoInitialized = false')
          .onClick(()=>{
            native.XComponentCreateNativeNode(this.nodeContent, 'preCreate', this.getUIContext());
            this.f = false
            this.flag = true
          })
          .id('xcomponent_precreate')
        Row({ space: 5 }) {
          Button('上树')
            .onClick(()=>{
              native.XComponentAttachToMainTree()
            })
            .id('xcomponent_attach')
          Button('下树')
            .onClick(()=>{
              native.XComponentDetachFromMainTree()
            })
            .id('xcomponent_detach')
          Button('销毁')
            .onClick(()=>{
              native.XComponentDispose()
            })
            .id('xcomponent_dispose')
        }
        Row({ space: 5 }) {
          Button('Initialize')
            .onClick(()=>{
              this.initialize_status = native.XComponentInitialize()
            })
            .id('xcomponent_initialize')
          Button('Finalize')
            .onClick(()=>{
              this.finalize_status = native.XComponentFinalize()
            })
            .id('xcomponent_finalize')
          Button('RemoveSurfaceCallback')
            .onClick(()=>{
              this.removecallback_status = native.XComponentRemoveSurfaceCallback()
            })
            .id('xcomponent_removecallback')
        }
        Row({ space: 5 }) {
          Button('SetUserData')
            .onClick(() => {
              native.XComponentSetUserData()
            })
            .id('xcomponent_setuserdata')
          Button('GetUserData')
            .onClick(() => {
              this.user_data = native.XComponentGetUserData()
            })
            .id('xcomponent_getuserdata')
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}
