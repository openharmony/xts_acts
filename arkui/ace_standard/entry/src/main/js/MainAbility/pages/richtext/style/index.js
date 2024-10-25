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
    data:{
        styleOne : null,
        styleTwo : null,
        styleThree : null,
        styleFour : null,
    },

    onShow(){
        this.getCommonStyleValues();
        globalThis.value = {
            styleOne : this.styleOne,
            styleTwo : this.styleTwo,
            styleThree : this.styleThree,
            styleFour : this.styleFour,
        }
    },

    getCommonStyleValues(){
        this.styleOne = this.$element("styleOne").getInspector()
        this.styleTwo = this.$element("styleTwo").getInspector()
        this.styleThree = this.$element("styleThree").getInspector()
        this.styleFour = this.$element("styleFour").getInspector()
    },

}
