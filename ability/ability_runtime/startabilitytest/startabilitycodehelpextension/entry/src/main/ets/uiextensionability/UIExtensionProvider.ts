/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
// 扩展入口文件UIExtensionProvider.ts
import { EmbeddedUIExtensionAbility, UIExtensionContentSession, Want } from '@kit.AbilityKit';

const TAG: string = '[UIExtensionProvider]';

export default class ExampleEmbeddedAbility extends EmbeddedUIExtensionAbility {
  onCreate(): void {
    console.log(TAG, `UIExtensionProvider onCreate`);
  }

  onForeground(): void {
    console.log(TAG, `UIExtensionProvider onForeground`);
  }

  onBackground(): void {
    console.log(TAG, `UIExtensionProvider onBackground`);
  }

  onDestroy(): void {
    console.log(TAG, `UIExtensionProvider onDestroy`);
  }

  onSessionCreate(want: Want, session: UIExtensionContentSession): void {
    console.log(TAG, `UIExtensionProvider onSessionCreate, want: ${JSON.stringify(want)}`);
    let param: Record<string, UIExtensionContentSession> = {
      'session': session
    };
    let storage: LocalStorage = new LocalStorage(param);
    session.loadContent('pages/extension', storage);
  }

  onSessionDestroy(session: UIExtensionContentSession): void {
    console.log(TAG, `UIExtensionProvider onSessionDestroy`);
  }
}
