/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import featureAbility from '@ohos.ability.featureability'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'
import commonEvent from '@ohos.commonevent'

describe('ActsAmsMultiPageAppS', function () {
    console.info('----ActsAmsMultiPageAppS----');
    beforeAll(async function (done) {
        await featureAbility.startAbility(
            {
                want:
                {
                    bundleName: "com.example.actsamsmultipageappservice",
                    abilityName: "com.example.actsamsmultipageappservice.MainAbility",
                },
            },
        );
        done();

    });

    /*
     * @tc.number    : AMS_MultiApp_0200
     * @tc.name      : startAbility : start serviceAbility
     * @tc.desc      : pageAbility->ServiceAbility
     */
    it('AMS_MultiApp_0200', 0, async function (done) {
        var subscriber;
        var CommonEventSubscribeInfo = {
            events: ["ACTS_MultiAppPageService_onConnect1","ACTS_MultiAppPageService_onConnect2"],
            
        };

        commonEvent.createSubscriber(CommonEventSubscribeInfo).then(async (data) => {
            console.debug("=AMS_MultiApp_0200 createSubscriber .then(data)=======>"
                + ("json data【") + JSON.stringify(data) + (" 】")
                + " ,data=" + data);
            subscriber = data;
            commonEvent.subscribe(subscriber, async (err, data) => {
                console.debug("=AMS_MultiApp_0200 subscribe (err,data)=======>"
                    + ("json err【") + JSON.stringify(err) + (" 】")
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,err=" + err + " ,data=" + data);
                if (data.event == "ACTS_MultiAppPageService_onConnect2")
                {
                    console.debug("=======AMS_MultiApp_0200 Ontology=======");
                    expect(data.event).assertEqual("ACTS_MultiAppPageService_onConnect2");
                }
                else if (data.event == "ACTS_MultiAppPageService_onConnect1")
                {
                    console.debug("=======AMS_MultiApp_0200 Clone=======");
                    expect(data.event).assertEqual("ACTS_MultiAppPageService_onConnect1");
                }            
                unsubscribe("subscribe", subscriber);
            });
        })
        function unsubscribe(caller, subscriber) {
            commonEvent.unsubscribe(subscriber, (err, data) => {
                console.debug("=ACTS_MultiAppPageService_unsubscribe (err,data)=======>"
                    + (caller)
                    + (" , json err【") + JSON.stringify(err) + (" 】")
                    + ("json data【") + JSON.stringify(data) + (" 】")
                    + " ,err=" + err + " ,data=" + data);
                    done();
            });
        }
    })
})
