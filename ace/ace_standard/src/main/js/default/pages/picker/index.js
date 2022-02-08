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
    data: {
        selectList:["text","data","time","datetime","multitext"],
        rangetext:['15', "20", "25"],
        multitext:[["a", "b", "c"], ["e", "f", "g"], ["h", "i"], ["k", "l", "m"]],
        textvalue:'default textvalue',
        datevalue:'default datevalue',
        timevalue:'default timevalue',
        datetimevalue:'default datetimevalue',
        multitextvalue:'default multitextvalue',
        containsecond:true,
        multitextselect:[1,2,0],
        datetimeselect:'2012-5-6-11-25',
        timeselect:'11:22:30',
        dateselect:'2021-3-2',
        textselect:'2'
    },
    selectChange(e){
        for(let i = 0;i<this.selectList.length;i++){
            if(e.newValue == this.selectList[i]){
                this.$element("picker"+i).show();
            }
        }
    },
    textonchange(e) {
        this.textvalue = e.newValue;
        prompt.showToast({ message:"text:"+e.newValue+",newSelected:"+e.newSelected })
    },
    textOnCancel(e) {
        prompt.showToast({ message:"text: textOnCancel" })
    },
    dateOnchange(e) {
        this.datevalue = e.year + "-" + e.month + "-" + e.day;
        prompt.showToast({ message:"date:"+e.year+"-"+(e.month+1)+"-"+e.day })
    },
    dateOnCancel() {
        prompt.showToast({ message:"date: dateOnCancel" })
    },
    timeOnchange(e) {
        if(this.containsecond){
            this.timevalue=e.hour+":"+e.minute+":"+e.second;
            prompt.showToast({ message:"Time:" + e.hour + ":" + e.minute + ":" + e.second })
        } else {
            this.timevalue=e.hour+":"+e.minute;
            prompt.showToast({ message:"Time:" + e.hour + ":" + e.minute })
        }},
    timeOnCancel() {
        prompt.showToast({ message:"timeOnCancel" })
    },
    datetimeOnchange(e) {
        this.datetimevalue=e.year+"-"+e.month+"-"+e.day+" "+e.hour+":"+e.minute;
        prompt.showToast({ message:"Time:"+(e.month+1)+"-"+e.day+" "+e.hour+":"+e.minute })
    },
    datetimeOnCancel() {
        prompt.showToast({ message:"datetimeOnCancel" })
    },
    multiTextOnchange(e) {
        this.multitextvalue=e.newValue;
        prompt.showToast({ message:"Multi-column text change" + e.newValue })
    },
    multiTextOnCancel() {
        prompt.showToast({ message:"multiTextOnCancel" })
    },
}