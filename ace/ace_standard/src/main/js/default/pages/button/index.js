/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
 
export default {
    data: {
        progress: 10,
        downloadText: "进度条按钮"
    },
    setProgress(e) {
        var i=0
        var set= setInterval(()=>{
            i+=10
            this.progress=i
            this.downloadText = this.progress + "%";
            this.$element('download-btn').setProgress({ progress: this.progress });
            if(this.progress>=100){
                clearInterval(set)
                this.downloadText="完成"
            }
        },1000)
    },
}