/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium/index";
import dataPreferences from '@ohos.data.preferences'
import common from "@ohos.app.ability.common";
import { BusinessError } from "@ohos.base"
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

import hilog from '@ohos.hilog'
let domain: number = 0x0000;
let tag: string = 'testTag';

const NAME = 'test_preferences';
const NAME1 = "getPreferencesTest";
const KEY_TEST_INT_ELEMENT = 'key_test_int';
const KEY_TEST_LONG_ELEMENT = 'key_test_long';
const KEY_TEST_FLOAT_ELEMENT = 'key_test_float';
const KEY_TEST_BOOLEAN_ELEMENT = 'key_test_boolean';
const KEY_TEST_STRING_ELEMENT = 'key_test_string';
const KEY_TEST_NUMBER_ARRAY_ELEMENT = 'key_test_number_array';
const KEY_TEST_STRING_ARRAY_ELEMENT = 'key_test_string_array';
const KEY_TEST_BOOL_ARRAY_ELEMENT = 'key_test_bool_array';
let mPreferences: dataPreferences.Preferences;
let context: common.UIAbilityContext;

const TAG = '[PREFERENCES_CALLBACK_JSUNIT_TEST]'
export default function preferenceTest() {
    describe('preferenceTest', (): void =>  {
        beforeAll (() => {
            hilog.info(domain, tag, '%{public}s', 'beforeAll')
            hilog.info(domain, tag, '%{public}s', 'beforeAll start');
            let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
            abilityDelegator.addAbilityMonitor({
                abilityName: "EntryAbility",
                moduleName:"entry",
                onAbilityCreate: (abilitys : UIAbility) : void => {
                    context = abilitys.context
                    context.stageMode = true;
                    hilog.info(domain, tag, '%{public}s', 'onAbilityCreate end');

                },
            }, (err : BusinessError) : void => {
                if (err != null ) {
                    hilog.info(domain, tag, '%{public}s', '-----'+ err.code);
                }
                hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
            });
            await Utils.msSleep(2000)
            abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.preferences")
            await Utils.msSleep(2000)
            hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        })

        afterAll(() => {
            hilog.info(domain, tag, '%{public}s', 'afterAll')
        })

        beforeEach(() => {
            hilog.info(domain, tag, '%{public}s', 'beforeEach, stagemode is ' + context.stageMode)
            mPreferences = await dataPreferences.getPreferences(context, NAME);
        })

        afterEach(() => {
            hilog.info(domain, tag, '%{public}s', 'afterEach')
            await dataPreferences.deletePreferences(context, NAME);
        })

        /**
         * @tc.name testPreferencesGetPreferences0001
         * @tc.number SUB_DistributedData_Preference_SDK_GetSyn_strong_basis_EtsApiTest_2200
         * @tc.desc GetSyn promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesGetPreferences0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const NAME = 'getPreferencesTest'
            dataPreferences.getPreferences(context, NAME, (err : Error, preferences : dataPreferences.Preferences) :void  => {
                if(err != null){
                    hilog.info(domain, tag, '%{public}s', TAG + "Get preferences err: " + err)
                    expect(false).assertTrue();
                }else{
                    hilog.info(domain, tag, '%{public}s', TAG + "Get preferences success")
                    expect(preferences != null).assertTrue();
                }
            })
            done()
        })
        
        /**
         * @tc.name SUB_DDM_Preferences_DataGroupId_Promise_0100
         * @tc.number SUB_DistributedData_Preference_SDK_GetSyn_strong_basis_EtsApiTest_2300
         * @tc.desc GetSyn promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_DataGroupId_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const Options : dataPreferences.Options = {
                name: "test_preferences_callback",
                dataGroupId: null
            };
            try {
                dataPreferences.getPreferences(context, Options).then(async (data : Object) :  Promise<void> => {
                    hilog.info(domain, tag, '%{public}s', `getPreferences successfully.`);
                    expect(data!=null).assertTrue();
                    done();
                    dataPreferences.deletePreferences(context, Options).then(async (val : Object) :  Promise<void> => {
                        hilog.info(domain, tag, '%{public}s', `deletePreferences successfully.`);
                        expect(val).assertEqual(undefined);
                        done();
                    }).catch((err: BusinessError) : void => {
                        expect().assertFail();
                        done();
                    })
                }).catch((err: Object|null|undefined) => {
                    hilog.info(domain, tag, '%{public}s', `111 errInfo is :` + err);
                    expect().assertFail();
                    done();
                })
            } catch (errInfo : Error) {
                hilog.info(domain, tag, '%{public}s', `222 errInfo is :` + errInfo);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.name PreferencesGetSync0100
         * @tc.number SUB_DistributedData_Preference_SDK_GetSyn_strong_basis_EtsApiTest_0100
         * @tc.desc GetSyn promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesGetSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            mPreferences.clearSync();
            const ret = mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "defaultValue");
            expect('defaultValue').assertEqual(ret);
            done();
        })

        /**
         * @tc.name PreferencesPutSync0100
         * @tc.number SUB_DistributedData_Preference_SDK_PutSync_strong_basis_EtsApiTest_0200
         * @tc.desc PutSync promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesPutSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            mPreferences.clearSync();
            const stringArr = new Array<string>('1', '2', '3');
            mPreferences.putSync(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
            let fz:Array<string> = new Array<string>();
            let rc1 = mPreferences.getSync(KEY_TEST_STRING_ARRAY_ELEMENT, fz);
            let rc = rc1 as Array<string>;
            for (let i = 0; i < stringArr.length; i++) {
                hilog.info(domain, tag, '%{public}s', 'ttt  stringArr = ' + stringArr[i] + '   rc = ' + rc[i]);
                expect(stringArr[i]).assertEqual(rc[i]);
            }
            done();
        });

        /**
         * @tc.name testPreferencesPutFlushRemoveGet_0300
         * @tc.number SUB_DistributedData_Preference_SDK_Flush_strong_basis_EtsApiTest_0300
         * @tc.desc Flush promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesPutFlushRemoveGet_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', TAG + "start_test_0300");
            if (mPreferences == null) {
                hilog.info(domain, tag, '%{public}s', TAG + "mPreferences is null.");
            }
            await mPreferences.clear();
            await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 111.2).then(async () : Promise<void> => {
                hilog.info(domain, tag, '%{public}s', TAG + "put succeed");
            }).catch((err : Object|null|undefined) => {
                hilog.info(domain, tag, '%{public}s', TAG + "put failed error message = " + err);
            })

            await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 111.2).then((res1 : Object) :  Promise<void> => {
                expect(111.2).assertEqual(res1);
                hilog.info(domain, tag, '%{public}s', TAG + "res1 = " + res1 + "get res1 succeed");
            }).catch((err : Object|null|undefined) => {
                hilog.info(domain, tag, '%{public}s', TAG + "get res1 failed error message = " + err);
            })

            await mPreferences.flush().then(() => {
                hilog.info(domain, tag, '%{public}s', TAG + "flush succeed");
            }).catch((err : Object|null|undefined) => {
                hilog.info(domain, tag, '%{public}s', TAG + "flush failed error message = " + err);
            })

            await dataPreferences.removePreferencesFromCache(context, NAME).then(() :  Promise<void> => {
                hilog.info(domain, tag, '%{public}s', TAG + "remove succeed");
            }).catch((err : Object|null|undefined) => {
                hilog.info(domain, tag, '%{public}s', TAG + "remove failed error message = " + err);
            })

            mPreferences = await dataPreferences.getPreferences(context, NAME);

            await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 111.2).then((res2 : Object) :  Promise<void> => {
                expect(111.2).assertEqual(res2);
                hilog.info(domain, tag, '%{public}s', TAG + "res2 = " + res2 + "get res2 succeed. test0300end");
                done();
            }).catch((err : Object|null|undefined) => {
                hilog.info(domain, tag, '%{public}s', TAG + "get res2 failed error message = " + err);
            })
        })

        /**
         * @tc.name testPreferencesGetFloat0072
         * @tc.number SUB_DistributedData_Preference_SDK_GetFloat_strong_basis_EtsApiTest_0400
         * @tc.desc GetFloat promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesGetFloat0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await mPreferences.clear();
            await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 3.0);
            mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0, (err: Error | undefined, ret: dataPreferences.ValueType): void => {
                expect(3.0).assertEqual(ret as Number);
                done();
            })
        })

        /**
         * @tc.name testPreferencesPutInt0142
         * @tc.number SUB_DistributedData_Preference_SDK_PutInt_strong_basis_EtsApiTest_0500
         * @tc.desc PutInt promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesPutInt0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await mPreferences.clear();
            mPreferences.put(KEY_TEST_INT_ELEMENT, 4, (err: Error | undefined) :void => {
                let pre = await mPreferences.get(KEY_TEST_INT_ELEMENT, 0);
                expect('4').assertEqual(pre);
                await mPreferences.flush();
                let pre2 = await mPreferences.get(KEY_TEST_INT_ELEMENT, 0);
                expect('4').assertEqual(pre2);
                done();
            });
        })

        /**
         * @tc.name testPreferencesDelete0010
         * @tc.number SUB_DistributedData_Preference_SDK_Delete_strong_basis_EtsApiTest_0600
         * @tc.desc Delete promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it("testPreferencesDelete0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 3.0);
            let ret = await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
            expect(3.0).assertEqual(ret);

            await mPreferences.flush();
            mPreferences.delete(KEY_TEST_FLOAT_ELEMENT, (err: BusinessError<void>) => {
                if (err) {
                    hilog.info(domain, tag, '%{public}s', "Failed to delete the key KEY_TEST_STRING_ELEMENT. err =" + err);
                    expect(!err).assertTrue();
                }
                hilog.info(domain, tag, '%{public}s', "Succeeded in deleting the key KEY_TEST_STRING_ELEMENT.");
                let per = await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
                expect(0.0).assertEqual(per);
                done();
            });
        });

        /**
         * @tc.name testPreferencesHasKey0036
         * @tc.number SUB_DistributedData_Preference_SDK_HasKey_strong_basis_EtsApiTest_0700
         * @tc.desc HasKey promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesHasKey0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await mPreferences.put(KEY_TEST_BOOLEAN_ELEMENT, false);
            mPreferences.has(KEY_TEST_BOOLEAN_ELEMENT, (err: Error | undefined, ret : Object) : void => {
                expect(true).assertEqual(ret);
                done();
            })
        })

        /**
         * @tc.name testPreferencesHasKey0031
         * @tc.number SUB_DistributedData_Preference_SDK_HasKey_strong_basis_EtsApiTest_0800
         * @tc.desc HasKey promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesHasKey0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
            await mPreferences.has(KEY_TEST_STRING_ELEMENT).then((ret : Object) : Promise<void> => {
                expect(true).assertEqual(ret);
                done();
            }).catch((err : Object|null|undefined) => {
                expect(null).assertFail();
                done();
            });
        })

        /**
         * @tc.name testRemovePreferencesFromCache0001
         * @tc.number SUB_DistributedData_Preference_SDK_HasKey_strong_basis_EtsApiTest_0900
         * @tc.desc HasKey promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRemovePreferencesFromCache0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            dataPreferences.getPreferences(context, NAME, (err : Error, preferences : dataPreferences.Preferences): void => {
                if(err != null){
                    hilog.info(domain, tag, '%{public}s', TAG + "Get preferences err: " + err)
                    expect(false).assertTrue();
                }else{
                    hilog.info(domain, tag, '%{public}s', TAG + "Get preferences success")
                    expect(preferences != null).assertTrue();
                }
            })
            dataPreferences.removePreferencesFromCache(context, NAME, (err: BusinessError<void>|null, data: Object) : void => {
                if(err != null){
                    hilog.info(domain, tag, '%{public}s', TAG + "Remove preferences from cache error: " + err)
                    expect(false).assertTrue();
                }else{
                    hilog.info(domain, tag, '%{public}s', TAG + "Remove preferences from cache success")
                    expect(data==null).assertTrue();
                }
            })
            done();
        })

        /**
         * @tc.name SUB_DDM_Preferences_removePreferencesFromCacheSync_0400
         * @tc.number SUB_DistributedData_Preference_SDK_removePreferencesFromCacheSync_strong_basis_EtsApiTest_1000
         * @tc.desc removePreferencesFromCacheSync promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_removePreferencesFromCacheSync_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            hilog.info(domain, tag, '%{public}s', "SUB_DDM_Preferences_removePreferencesFromCacheSync_0100 begin.");
            const Options: dataPreferences.Options = {
                name: "test_preferences_callback",
                dataGroupId: '123456'
            };
            hilog.info(domain, tag, '%{public}s', "000000000000 .");
            try {
                mPreferences = dataPreferences.getPreferencesSync(context, Options);
            }catch (err: Error) {
                hilog.error(domain, tag, '%{public}s', "Error: " + err.message);
            }
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_STRING_ELEMENT, 'test');
            mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue");

            mPreferences.flush((err: BusinessError<void>) => {
                if (err) {
                    console.log("flush err.");
                    expect().assertFail();
                    done();
                }
                console.log("flush done.");
                dataPreferences.removePreferencesFromCacheSync(context, Options);
                let value : dataPreferences.ValueType = mPreferences!.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue");
                console.log("SUB_DDM_Preferences_removePreferencesFromCacheSync_0100 end." + value);
                expect('test').assertEqual(value);
                done();
                console.log("SUB_DDM_Preferences_removePreferencesFromCacheSync_0100 end.");
            });
            done();
        })

        /**
         * @tc.name SUB_DDM_Preferences_deleteSync_0100
         * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_strong_basis_EtsApiTest_1100
         * @tc.desc deleteSync promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_deleteSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            mPreferences.putSync(KEY_TEST_STRING_ELEMENT, "abc");
            expect("abc").assertEqual(mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "default"));
            mPreferences.deleteSync(KEY_TEST_STRING_ELEMENT);
            expect("default").assertEqual(mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "default"));
            done();
        })

        /**
         * @tc.name SUB_DDM_Preferences_GetPreferencesSync_0100
         * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_sGetPreferencesSync_basis_EtsApiTest_1200
         * @tc.desc GetPreferencesSync promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_GetPreferencesSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const Options : dataPreferences.Options = {
                name: "test_preferences_callback",
                dataGroupId: null
            };
            try {
                mPreferences = dataPreferences.getPreferencesSync(context, Options);
                expect(Options.dataGroupId).assertEqual(null);
                done();
            } catch (errInfo : Error) {
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.name PreferencesHasSync0100
         * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_HasSync_basis_EtsApiTest_1300
         * @tc.desc HasSync promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesHasSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_STRING_ELEMENT, "test");
            const ret = mPreferences.hasSync(KEY_TEST_STRING_ELEMENT);
            expect(true).assertEqual(ret);
            done();
        });

        /**
         * @tc.name SUB_DDM_Preferences_GetAllSync_0100
         * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_GetAllSync_basis_EtsApiTest_1400
         * @tc.desc GetAllSync promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('SUB_DDM_Preferences_GetAllSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            mPreferences.clearSync();
            const doubleArr = new Array<number>(11, 22, 33);
            const stringArr = new Array<string>('11', '22', '33');
            const boolArr = new Array<boolean>(true, false, false, true);
            mPreferences.putSync(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
            mPreferences.putSync(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr);
            mPreferences.putSync(KEY_TEST_NUMBER_ARRAY_ELEMENT, doubleArr);
            mPreferences.putSync(KEY_TEST_BOOLEAN_ELEMENT, false);
            mPreferences.putSync(KEY_TEST_STRING_ELEMENT, "123");
            mPreferences.putSync(KEY_TEST_FLOAT_ELEMENT, 123.1);

            await mPreferences.flush();
            let obj = mPreferences.getAllSync();
            let mapVals = obj as Record<string, dataPreferences.ValueType>;
            expect(false).assertEqual(mapVals.get(KEY_TEST_BOOLEAN_ELEMENT));
            expect("123").assertEqual(mapVals.get(KEY_TEST_STRING_ELEMENT));
            expect(123.1).assertEqual(mapVals.get(KEY_TEST_FLOAT_ELEMENT));

            let sArrObj = mapVals.get(KEY_TEST_STRING_ARRAY_ELEMENT);
            expect(sArrObj!=null).assertEqual(true);
            let sArr = sArrObj as Array<string>;
            for (let i = 0; i < sArr.length; i++) {
                expect(sArr[i]).assertEqual(stringArr[i]);
            }

            let bArrObj = mapVals.get(KEY_TEST_BOOL_ARRAY_ELEMENT);
            expect(bArrObj!=null).assertEqual(true);
            let bArr = bArrObj as Array<boolean>;
            for (let i = 0; i < bArr.length; i++) {
                expect(bArr[i]).assertEqual(boolArr[i]);
            }

            let nArrObj = mapVals.get(KEY_TEST_NUMBER_ARRAY_ELEMENT);
            expect(nArrObj!=null).assertEqual(true);
            let nArr = nArrObj as Array<number>;
            for (let i = 0; i < nArr.length; i++) {
                expect(nArr[i]).assertEqual(doubleArr[i]);
            }
            done();
        });

        /**
         * @tc.name testPreferencesClear0012
         * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_Clear_basis_EtsApiTest_1500
         * @tc.desc Clear promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesClear0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
            await mPreferences.flush();
            mPreferences.clear((err : Error | undefined) : void => {
                let pre = await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue")
                expect("defaultvalue").assertEqual(pre);
                done();
            });
        });

        /**
         * @tc.name testPreferencesClear0011
         * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_Clear_basis_EtsApiTest_1600
         * @tc.desc Clear promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesClear0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
            await mPreferences.flush();
            await mPreferences.clear().then(() : void => {
                let per = await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue");
                expect("defaultvalue").assertEqual(per);
                done();
            }).catch((err) => {
                expect(null).assertFail();
                done();
            });
        });

        /**
         * @tc.name testPreferencesDeletePreferences0001
         * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_DeletePreferences_basis_EtsApiTest_1700
         * @tc.desc DeletePreferences promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesDeletePreferences0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const NAME = 'getPreferencesTest'
            dataPreferences.getPreferences(context, NAME, (err : Error, preferences : dataPreferences.Preferences) : void => {
                if(err != null){
                    hilog.info(domain, tag, '%{public}s', TAG + "Get preferences err: " + err)
                    expect(false).assertTrue();
                }else{
                    hilog.info(domain, tag, '%{public}s', TAG + "Get preferences success")
                    expect(preferences != null).assertTrue();
                }
            })
            dataPreferences.deletePreferences(context, NAME, (err: BusinessError<void>|null, data: Object) : void => {
                if(err != null){
                    hilog.info(domain, tag, '%{public}s', TAG + "Delete preferences err: " + err)
                    expect(false).assertTrue();
                }else{
                    hilog.info(domain, tag, '%{public}s', TAG + "Delete preferences success")
                    expect(data == null).assertTrue();
                }
            })
            done()
        });

        /**
         * @tc.name testPreferencesGetPreferencesPromise0010
         * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_GetPreferences_basis_EtsApiTest_1800
         * @tc.desc GetPreferences promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it("testPreferencesGetPreferencesPromise0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            dataPreferences.getPreferences(context, NAME1).then(async (preferences : dataPreferences.Preferences) => {
                hilog.info(domain, tag, '%{public}s', TAG + "Get preferences success" + preferences);
                await preferences.put(KEY_TEST_STRING_ELEMENT, "test");
                preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err: Error, ret: Object) => {
                    expect("test").assertEqual(ret);
                });
                await dataPreferences.deletePreferences(context, NAME1).then<void, void>((): void => {});
                done();
            }).catch((err: Object|null|undefined) => {
                hilog.info(domain, tag, '%{public}s', TAG + "Get preferences err: " + err);
                expect(!err).assertTrue();
            })
        });

        /**
         * @tc.name PreferencesRemovePreferencesFromCacheSync0100
         * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_RemovePreferencesFromCacheSync_basis_EtsApiTest_1900
         * @tc.desc RemovePreferencesFromCacheSync promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('PreferencesRemovePreferencesFromCacheSync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.log("PreferencesRemovePreferencesFromCacheSync0100 begin.");
            mPreferences = await dataPreferences.getPreferences(context, NAME);
            mPreferences.clearSync();
            mPreferences.putSync(KEY_TEST_STRING_ELEMENT, 'test')
            mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue")
            mPreferences.flush((err: BusinessError<void>|null, val: Object):void => {
                if (err) {
                    console.log("flush err.");
                    expect().assertFail();
                }
                console.log("flush done.");
                dataPreferences.removePreferencesFromCacheSync(context, NAME);
                let value = mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue")
                console.log("PreferencesRemovePreferencesFromCacheSync0100 end." + value);
                expect('test').assertEqual(value);
                done();
                console.log("PreferencesRemovePreferencesFromCacheSync0100 end.");
            });
            done();
        });

        /**
         * @tc.name testPreferencesGetAllCallBackTest0001
         * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_GetAll_basis_EtsApiTest_2000
         * @tc.desc GetAll promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it("testPreferencesGetAllCallBackTest0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await mPreferences.clear();
            let doubleArr = new Array<number>(11, 22, 33);
            let stringArr = new Array<string>('11', '22', '33');
            let boolArr = new Array<boolean>(true, false, false, true);
            await mPreferences.put(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
            await mPreferences.put(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr);
            await mPreferences.put(KEY_TEST_NUMBER_ARRAY_ELEMENT, doubleArr);
            await mPreferences.put(KEY_TEST_BOOLEAN_ELEMENT, false);
            await mPreferences.put(KEY_TEST_STRING_ELEMENT, "123");
            await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 123.1);

            await mPreferences.flush();

            mPreferences.getAll((err: BusinessError | undefined, value: Object) => {
                let obj = value as Record<string, object>;
                expect(false).assertEqual(obj.get(KEY_TEST_BOOLEAN_ELEMENT));
                expect("123").assertEqual(obj.get(KEY_TEST_STRING_ELEMENT));
                expect(123.1).assertEqual(obj.get(KEY_TEST_FLOAT_ELEMENT));

                let sArrObj = obj.get(KEY_TEST_STRING_ARRAY_ELEMENT);
                expect(sArrObj!=null).assertEqual(true);
                let sArr = sArrObj as Array<string>;
                for (let i = 0; i < sArr.length; i++) {
                    expect(sArr[i]).assertEqual(stringArr[i]);
                }

                let bArrObj = obj.get(KEY_TEST_BOOL_ARRAY_ELEMENT);
                expect(bArrObj!=null).assertEqual(true);
                let bArr = bArrObj as Array<boolean>;
                for (let i = 0; i < bArr.length; i++) {
                    expect(bArr[i]).assertEqual(boolArr[i]);
                }

                let nArrObj = obj.get(KEY_TEST_NUMBER_ARRAY_ELEMENT);
                expect(nArrObj!=null).assertEqual(true);
                let nArr = nArrObj as Array<number>;
                for (let i = 0; i < nArr.length; i++) {
                    expect(nArr[i]).assertEqual(doubleArr[i]);
                }

                done();
            });
        });

        /**
         * @tc.name testPreferencesGetAllPromiseTest0001
         * @tc.number SUB_DistributedData_Preference_SDK_deleteSync_GetAll_basis_EtsApiTest_2100
         * @tc.desc GetAllPromise promise interface test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testPreferencesGetAllPromiseTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await mPreferences.clear();
            let doubleArr = new Array<number>(11, 22, 33);
            let stringArr = new Array<string>('11', '22', '33');
            let boolArr = new Array<boolean>(true, false, false, true);
            await mPreferences.put(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
            await mPreferences.put(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr);
            await mPreferences.put(KEY_TEST_NUMBER_ARRAY_ELEMENT, doubleArr);
            await mPreferences.put(KEY_TEST_BOOLEAN_ELEMENT, false);
            await mPreferences.put(KEY_TEST_STRING_ELEMENT, "123");
            await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 123.1);

            await mPreferences.flush();

            await mPreferences.getAll().then((value: Object) => {
                let obj = value as Record<string, object>;
                expect(false).assertEqual(obj.get(KEY_TEST_BOOLEAN_ELEMENT));
                expect("123").assertEqual(obj.get(KEY_TEST_STRING_ELEMENT));
                expect(123.1).assertEqual(obj.get(KEY_TEST_FLOAT_ELEMENT));

                let sArrObj = obj.get(KEY_TEST_STRING_ARRAY_ELEMENT);
                expect(sArrObj!=null).assertEqual(true);
                let sArr = sArrObj as Array<string>;
                for (let i = 0; i < sArr.length; i++) {
                    expect(sArr[i]).assertEqual(stringArr[i]);
                }

                let bArrObj = obj.get(KEY_TEST_BOOL_ARRAY_ELEMENT);
                expect(bArrObj!=null).assertEqual(true);
                let bArr = bArrObj as Array<boolean>;
                for (let i = 0; i < bArr.length; i++) {
                    expect(bArr[i]).assertEqual(boolArr[i]);
                }

                let nArrObj = obj.get(KEY_TEST_NUMBER_ARRAY_ELEMENT);
                expect(nArrObj!=null).assertEqual(true);
                let nArr = nArrObj as Array<number>;
                for (let i = 0; i < nArr.length; i++) {
                    expect(nArr[i]).assertEqual(doubleArr[i]);
                }
                done();
            }).catch((err: Object|null|undefined) => {
                expect(null).assertFail();
                done();
            })
        })
    })
}