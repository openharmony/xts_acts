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

import { routePage } from '../../common/js/general';
import { getTxtData } from '../../common/js/saveData';
import app from '@system.app';

export default {
  changeQuit() {
    console.info('quit app');
    app.terminate();
  },
  swipeEvent(e) {
    if (e.direction === 'right') {
      console.info('swipeEvent');
      app.terminate();
    }
  },
  changeCompent: routePage('pages/second-compent/index').changePage,
  changeAPI: routePage('pages/second-api/index').changePage,
  changeSaveFile() {
    console.info('save data to json');
    getTxtData();
  },
};
