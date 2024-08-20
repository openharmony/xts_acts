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
import { routePage } from "../../common/js/general";
import router from '@system.router';

export default {
  data: {
    todolist: [
      {
        id: 0,
        title: "opacity",
        url: "pages/opacity/index"
      },
      {
        id: 1,
        title: "longpress",
        url: "pages/event/longpress/index"
      },
      {
        id: 2,
        title: "swipe(event)",
        url: "pages/event/swipe/index"
      },
      {
        id: 3,
        title: "transition",
        url: "pages/transition/index"
      },
      {
        id: 4,
        title: "list-item",
        url: "pages/list-item/item5/item5"
      },
      {
        id: 5,
        title: "swiper",
        url: "pages/swiper/SwiperA10/index"
      },
      {
        id: 6,
        title: "chart(line)",
        url: "pages/chart/line/index"
      },
      {
        id: 7,
        title: "chart(bar)",
        url: "pages/chart/bar/index"
      },
      {
        id: 8,
        title: "image-animator",
        url: "pages/image-animator/04/index"
      },
      {
        id: 9,
        title: "input",
        url: "pages/input/CheckboxImage31/index"
      },
      {
        id: 10,
        title: "marquee",
        url: "pages/marquee/marquee1/marquee1"
      },
      {
        id: 11,
        title: "picker-view",
        url: "pages/picker-view/time/index"
      },
      {
        id: 12,
        title: "progress",
        url: "pages/progress/index"
      },
      {
        id: 13,
        title: "qrcode",
        url: "pages/qrcode/index/index"
      },
      {
        id: 14,
        title: "slider",
        url: "pages/slider/index/index"
      },
      {
        id: 15,
        title: "switch",
        url: "pages/switch/index"
      },
      {
        id: 16,
        title: "返回首页",
        url: "pages/index/index"
      }
    ]
  },

  clickChange(url) {
    console.info("onclick url: " + url)
    router.replace({ uri: url });
  },

};
