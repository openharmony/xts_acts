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

export default {
    data: {
        qr_type: 'rect',
        qr_size: '300px',
        qr_col: '#87ceeb',
        col_list: ['#87ceeb','#fa8072','#da70d6','#80ff00ff','#00ff00ff'],
        qr_bcol: '#f0ffff',
        bcol_list: ['#f0ffff','#ffffe0','#d8bfd8']
    },
    settype(e) {
        if (e.checked) {
            this.qr_type = 'rect'
        } else {
            this.qr_type = 'circle'
        }
    },
    setvalue(e) {
        this.qr_value = e.newValue
    },
    setcol(e) {
        this.qr_col = e.newValue
    },
    setbcol(e) {
        this.qr_bcol = e.newValue
    }
}