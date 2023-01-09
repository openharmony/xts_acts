
/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
const START_ABILITY_TIMEOUT = 4000;

export default function abilityTest() {
    describe('ActsGetAbilityStateStageTest', function () {

        /*
         * @tc.number  : ACTS_GetAbilityState_0200
         * @tc.name    : The test framework needs to provide the following query-related functions
         * @tc.desc    : Get the status of the Ability in the BACKGROUND state
         */
        it('ACTS_GetAbilityState_0200', 0, async function (done) {
            console.debug('====>start ACTS_GetAbilityState_0200====');
            var flag = true;
            var ability;
            var abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
            function onAbilityForegroundCallback2(){
                console.debug("====>onAbilityForegroundCallback2====");
                abilityDelegator.getCurrentTopAbility((err, data)=>{
                    console.debug("====>getCurrentTopAbility_0200 err:" + JSON.stringify(err) + " data:" + JSON.stringify(data));
                    ability = data;
                    abilityDelegator.doAbilityBackground(ability, (err)=>{
                        console.debug("====>doAbilityBackground_0200 data:" + JSON.stringify(err));
                        expect(err.code).assertEqual(0);
                    })
                })
            }
            function onAbilityBackgroundCallback2(){
                console.debug("====>onAbilityBackgroundCallback2====");
                var state = abilityDelegator.getAbilityState(ability);
                console.debug("====>ACTS_GetAbilityState_0200 state:" + state);
                expect(state).assertEqual(AbilityDelegatorRegistry.AbilityLifecycleState.BACKGROUND);
                console.debug("====>ACTS_GetAbilityState_0200 end====");
                flag=false;
                done();
            }


            abilityDelegator.addAbilityMonitor(
                {abilityName: 'MainAbility2',
                    onAbilityForeground:onAbilityForegroundCallback2,
                    onAbilityBackground:onAbilityBackgroundCallback2
                }
            ).then(()=>{
                console.debug("====>addAbilityMonitor_0200 finish====");
                globalThis.abilityContext.startAbility(
                    {
                        bundleName: 'com.example.actsgetabilitystatestagetest',
                        abilityName: 'MainAbility2',
                    }, (err)=>{
                    console.debug("====>startAbility_0200 err:" + JSON.stringify(err));
                })
            })

            setTimeout(()=>{
                if(flag==true){
                    console.debug("====>in timeout 0200====");
                    expect().assertFail();
                    done();
                }
            },START_ABILITY_TIMEOUT)

        })

        /*
         * @tc.number  : ACTS_GetAbilityState_0300
         * @tc.name    : The test framework needs to provide the following query-related functions
         * @tc.desc    : Get the status of the Ability in the FOREGROUND state
         */
        it('ACTS_GetAbilityState_0300', 0, async function (done) {
            console.debug('====>start ACTS_GetAbilityState_0300====');
            var flag = true;
            var ability;
            var abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
            function onAbilityForegroundCallback3(){
                console.debug("====>onAbilityForegroundCallback3====");
                abilityDelegator.getCurrentTopAbility((err, data)=>{
                    console.debug("====>getCurrentTopAbility_0300 err:" + JSON.stringify(err) + "data:" + JSON.stringify(data));
                    ability = data;
                    var state = abilityDelegator.getAbilityState(ability);
                    console.debug("====>ACTS_GetAbilityState_0300 state:" + state);
                    expect(state).assertEqual(AbilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
                    expect(state != AbilityDelegatorRegistry.AbilityLifecycleState.CREATE).assertTrue()
                    expect(state != AbilityDelegatorRegistry.AbilityLifecycleState.DESTROY).assertTrue()
                    abilityDelegator.doAbilityBackground(ability, (err)=>{
                        console.debug("====>doAbilityBackground_0300 data:" + JSON.stringify(err));
                        expect(err.code).assertEqual(0);
                        console.debug("====>ACTS_GetAbilityState_0300 end====");
                        flag=false;
                        done();
                    })
                })
            }
            setTimeout(()=>{
                if(flag==true){
                    console.debug("====>in timeout 0300====");
                    expect().assertFail();
                    done();
                }
            },START_ABILITY_TIMEOUT)
            abilityDelegator.addAbilityMonitor(
                {abilityName: 'MainAbility3',
                    onAbilityForeground:onAbilityForegroundCallback3}).then(()=>{
                console.debug("====>addAbilityMonitor_0300 finish====");
                globalThis.abilityContext.startAbility(
                    {
                        bundleName: 'com.example.actsgetabilitystatestagetest',
                        abilityName: 'MainAbility3',
                    }, (err)=>{
                    console.debug("====>startAbility_0300 err:" + JSON.stringify(err));
                })
            })
        })

        /*
         * @tc.number  : ACTS_GetAbilityState_0500
         * @tc.name    : The test framework needs to provide the following query-related functions
         * @tc.desc    : Get the status of an inactive or nonexistent Ability
         */
        it('ACTS_GetAbilityState_0500', 0, async function (done) {
            console.debug('====>start ACTS_GetAbilityState_0500====');
            var ability = Object.create(null);
            var abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
            var state = abilityDelegator.getAbilityState(ability);
            console.debug("====>ACTS_GetAppState_0500 state:" + state);
            expect(state).assertEqual(undefined);
            console.debug("====>ACTS_GetAbilityState_0500 end====");
            done();
        })

        /*
         * @tc.number  : ACTS_GetAbilityState_0600
         * @tc.name    : The test framework needs to provide the following query-related functions
         * @tc.desc    : Get the status of the Ability in the uninitialized state
         */
        it('ACTS_GetAbilityState_0600', 0, async function (done) {
            console.debug('====>start ACTS_GetAbilityState_0600====')
            var flag = true;
            var ability;
            var abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
            function onAbilityForegroundCallback6(){
                console.debug("====>onAbilityForegroundCallback6====");
                abilityDelegator.getCurrentTopAbility((err, data)=>{
                    console.debug("====>getCurrentTopAbility_0600 err:" + JSON.stringify(err) + "data:" + JSON.stringify(data));
                    ability = data;
                    globalThis.ability4Context.terminateSelf();
                })
            }
            function onAbilityDestroyCallback6(){
                console.debug("====>onAbilityDestroyCallback6====");
                var state = abilityDelegator.getAbilityState(ability);
                console.debug("====>ACTS_GetAbilityState_0600 data:" + state);
                console.debug("====>UNINITIALIZED:"+ AbilityDelegatorRegistry.AbilityLifecycleState.UNINITIALIZED);
                expect(state).assertEqual(AbilityDelegatorRegistry.AbilityLifecycleState.UNINITIALIZED);
                console.debug("====>ACTS_GetAbilityState_0600 end====");
                flag=false;
                done();
            }
            setTimeout(()=>{
                if(flag==true){
                    console.debug("====>in timeout 0600===");
                    expect().assertFail();
                    done();
                }
            },START_ABILITY_TIMEOUT)
            abilityDelegator.addAbilityMonitor(
                {abilityName: 'MainAbility4',
                    onAbilityForeground:onAbilityForegroundCallback6,
                    onAbilityDestroy:onAbilityDestroyCallback6}).then(()=>{
                console.debug("====>addAbilityMonitor_0600 finish====");
                globalThis.abilityContext.startAbility(
                    {
                        bundleName: 'com.example.actsgetabilitystatestagetest',
                        abilityName: 'MainAbility4',
                    }, (err)=>{
                    console.debug("====>startAbility_0600 err:" + JSON.stringify(err));
                })
            })

        })
    })
}