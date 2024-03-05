/**
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
@observed
class Job1{
  @track JobName:string = "Teacher"
}
@observed
class Info1{
  @track name :string = "Tom"
  @track age :number =25
  job :Job1 =new Job1()
}
@Entry
@Component
struct NoState{
  @State info : Info1  = new Info1()
  build() {
    Column() {
      Text(`age:${this.info.age}`)
        .id('NoState_1A')
      Text(`name:${this.info.name}`)
      Text(`JobName:${this.info.job.JobName}`)
       Button("change age")
         .id('NoState_2A')
         .onClick(()=>{
         this.info.age++
       })
      Button("change job").onClick(()=>{
        this.info.job.JobName="Doctor"
      })
    }
    .width('100%')
    .margin({top:20})
  }
}