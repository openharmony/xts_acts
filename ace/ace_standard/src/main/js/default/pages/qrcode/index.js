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
        qrType: 'rect',
        qrSize: '300px',
        qrCol: '#87ceeb',
        colList: ['#87ceeb','#fa8072','#da70d6','#80ff00ff','#00ff00ff'],
        qrBCol: '#f0ffff',
        bColList: ['#f0ffff','#ffffe0','#d8bfd8']
    },
    setType(e) {
        if (e.checked) {
            this.qrType = 'rect'
        } else {
            this.qrType = 'circle'
        }
    },
    setvalue(e) {
        this.qrValue = e.newValue
    },
    setCol(e) {
        this.qrCol = e.newValue
    },
    setBCol(e) {
        this.qrBCol = e.newValue
    }
}