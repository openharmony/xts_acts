/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import prompt from '@system.prompt';
export default {
  onMenuSelected(e) {
    prompt.showToast({
      message: e.value
    })
  },
  onTextClick1() {
    this.$element('apiMenu1').show({x:120,y:10});
  },
  onTextClick2() {
    this.$element('apiMenu2').show({x:120,y:80});
  },
  onTextClick3() {
    this.$element('apiMenu3').show({x:120,y:150});
  },
  onTextClick4() {
    this.$element('apiMenu4').show({x:120,y:220});
  },
  onTextClick5() {
    this.$element('apiMenu5').show({x:120,y:290});
  },
  onTextClick6() {
    this.$element('apiMenu6').show({x:120,y:360});
  },
  onTextClick7() {
    this.$element('apiMenu7').show({x:120,y:650});
  }
}