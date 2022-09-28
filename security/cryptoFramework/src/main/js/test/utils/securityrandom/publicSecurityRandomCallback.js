/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
 
import { expect } from "@ohos/hypium";
import cryptoFramework from "@ohos.security.cryptoFramework";
import { stringTouInt8Array, uInt8ArrayToShowStr, uInt8ArrayToString, } from "../common/publicDoString";

async function testSecurityRandomCallback(length) {
    var rand;
    var callbackGenerateRand;

    rand = cryptoFramework.createRandom();
    expect(rand != null).assertTrue();
    rand.generateRandom(length, (err, randData)=>{
        if(err) {
            console.error("[callback]catch err:" + err);
            expect(null).assertFail();
        } else {
            expect(randData != null).assertTrue();
            console.log("[callback] rand result first:" + uInt8ArrayToShowStr(randData.data));
        }
        rand.setSeed(randData, (err1, )=>{
            if(err1) {
                console.error("[callback]catch err1:" + err1);
                expect(null).assertFail();
            } else {
                expect(null).assertTrue();
            }
        })
    })

    rand.generateRandom(length, (err, randData)=>{
        if(err) {
            console.error("[callback]catch err:" + err);
            expect(null).assertFail();
        } else {
            expect(randData != null).assertTrue();
            console.log("[callback] rand result second:" + uInt8ArrayToShowStr(randData.data));
        }
    })
}

export { testSecurityRandomCallback };
