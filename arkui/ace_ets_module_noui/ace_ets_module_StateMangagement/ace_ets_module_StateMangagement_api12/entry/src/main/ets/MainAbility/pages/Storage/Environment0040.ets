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

Environment.envProps([{ key: 'accessibilityEnabled', defaultValue: 'default' }, { key: 'languageCode',
  defaultValue: 'en' }, { key: 'propA', defaultValue: 'ha' }]);
Environment.EnvProps([{ key: 'accessibilityEnabled', defaultValue: 'default' }, { key: 'languageCode',
  defaultValue: 'en' }, { key: 'propB', defaultValue: 'hb' }]);

@Preview({
  title: 'Environment0040',
  width: undefined,
  height: undefined
})
@Entry
@Component
struct Environment0040 {
  @State envKeys: Array<string> = Environment.Keys();
  @State keys: Array<string> = Environment.keys();

  build() {
    Column() {
      Text(Array.from(this.envKeys).toString()).id('tvKeysOne').height('5%')
      Text(Array.from(this.keys).toString()).id('tvKeysTwo').height('5%')
    }
  }
}