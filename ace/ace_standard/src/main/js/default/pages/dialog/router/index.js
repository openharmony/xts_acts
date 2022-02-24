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
    showDialog1() {
        this.$element('simpleDialog1').show()
    },
    showDialog2() {
        this.$element('simpleDialog2').show()
    },
    showDialog3() {
        this.$element('simpleDialog3').show()
    },
    showDialog4() {
        this.$element('simpleDialog3').show()
    },
    showDialog5() {
        this.$element('simpleDialog5').show()
    },
    cancelDialog() {
        prompt.showToast({
            message: 'Dialog cancelled'
        })
    },
    cancelSchedule() {
        this.$element('simpleDialog1').close()
        this.$element('simpleDialog2').close()
        this.$element('simpleDialog3').close()
        this.$element('simpleDialog4').close()
        this.$element('simpleDialog5').close()
        prompt.showToast({
            message: 'Successfully cancelled'
        })
    },
    setSchedule() {
        this.$element('simpleDialog1').close()
        this.$element('simpleDialog2').close()
        this.$element('simpleDialog3').close()
        this.$element('simpleDialog4').close()
        this.$element('simpleDialog5').close()
        prompt.showToast({
            message: 'Successfully confirmed'
        })
    },
    doubleClick(){
        prompt.showToast({
            message: 'doubleClick'
        })
    }
}