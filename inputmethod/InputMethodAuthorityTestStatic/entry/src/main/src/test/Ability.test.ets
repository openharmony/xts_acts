import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import inputMethod from '@ohos.inputMethod';
import inputMethodSubtype from '@ohos.InputMethodSubtype';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import { PanelInfo, PanelFlag, PanelType } from '@ohos.inputMethod.Panel';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;
export default function inputMethodAuthorityJSUnit() {

    describe("inputMethodAuthorityJSUnit", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(() => {
            console.info('%{public}s', 'beforeAll start');
            let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
            abilityDelegator.addAbilityMonitor({
                abilityName: "EntryAbility",
                moduleName:"entry",
                onAbilityCreate: (abilitys : UIAbility) : void => {
                    testAbilityContext = abilitys.context
                    console.info('%{public}s', 'onAbilityCreate end');

                },
            }, (err : BusinessError) : void => {
                if (err != null ) {
                    console.info('%{public}s', '-----'+ err.code);
                }
                console.info('%{public}s', 'BusinessError  end');
            });
            await Utils.msSleep(2000)
            abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.inputmethodauthority.test.static")
            await Utils.msSleep(2000)
            console.info('%{public}s', 'beforeAll end');
        })

        /**
         * @tc.number SUB_Misc_inputMethod_switchInputMethod__static_0100
         * @tc.name SUB_Misc_inputMethod_switchInputMethod__static_0100
         * @tc.desc Function test
         */
        it('SUB_Misc_inputMethod_switchInputMethod__static_0100', Level.LEVEL2, async (done: () => void)  => {
            hilog.info(domain, tag, "====>************* SUB_Misc_inputMethod_switchInputMethod__static_0100 Test start*************");
            let inputM = inputMethod.getCurrentInputMethod()
            hilog.info(domain, tag, "SUB_Misc_inputMethod_switchInputMethod__static_0100 getCurrentInputMethod: " + JSON.stringify(inputM));
            try {
                hilog.info(domain, tag, '====>SUB_Misc_inputMethod_switchInputMethod__static_0100 switchInputMethod permission fail')
                await inputMethod.switchInputMethod(inputM);
                done();
                hilog.info(domain, tag, "====>SUB_Misc_inputMethod_switchInputMethod__static_0100 end");
            } catch (err: BusinessError) {
                hilog.error(domain, tag, '====>SUB_Misc_inputMethod_switchInputMethod__static_0100 switchInputMethod catch err' + JSON.stringify(err))
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number SUB_Misc_inputMethod_switchInputMethod__static_0200
         * @tc.name SUB_Misc_inputMethod_switchInputMethod__static_0200
         * @tc.desc Function test
         */
        it('SUB_Misc_inputMethod_switchInputMethod__static_0200', Level.LEVEL2, async (done: () => void)  => {
            hilog.info(domain, tag, "====>************* SUB_Misc_inputMethod_switchInputMethod__static_0200 Test start*************");
            let inputM = inputMethod.getCurrentInputMethod()
            hilog.info(domain, tag, "SUB_Misc_inputMethod_switchInputMethod__static_0200 getCurrentInputMethod: " + JSON.stringify(inputM));
            inputMethod.switchInputMethod(inputM, (err, data) => {
                try {
                    if (err.code != 0) {
                        hilog.info(domain, tag, "====>SUB_Misc_inputMethod_switchInputMethod__static_0200 switchInputMethod permission fail: " + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '====>SUB_Misc_inputMethod_switchInputMethod__static_0200 success: ' + data);
                        done();
                    }
                } catch (err: BusinessError) {
                    hilog.error(domain, tag, "====>SUB_Misc_inputMethod_switchInputMethod__static_0200 catch err: " + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
            });
        });

        /*
         * @tc.number  inputmethodNomal_test_hideSoftKeyboard_static_001
         * @tc.name    inputmethodNomal_test_hideSoftKeyboard_static_001
         * @tc.desc    Test Indicates the input method which will hide softboard with calback.
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level2
         */
        it('inputmethodNomal_test_hideSoftKeyboard_static_001', Level.LEVEL2, async (done: () => void)  => {
            hilog.info(domain, tag, "====>*********inputmethodNomal_test_hideSoftKeyboard_static_001 start************");
            let inputMethodCtrl = inputMethod.getController()
            const ATTRIBUTE: inputMethod.TextConfig = {
                inputAttribute: {
                    textInputType: inputMethod.TextInputType.TEXT,
                    enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
                }
            }
            try {
                let data = await inputMethodCtrl.attach(true, ATTRIBUTE);
                hilog.info(domain, tag, `====>inputmethodNomal_test_hideSoftKeyboard_static_001 execution success, data: ${JSON.stringify(data)}`);
            } catch (error: BusinessError) {
                hilog.info(domain, tag, `====>inputmethodNomal_test_hideSoftKeyboard_static_001 catch error, error: [${error.code}, ${error.message}]`);
                expect().assertFail();
                done();
            }
            inputMethodCtrl.hideSoftKeyboard((err) => {
                try {
                    if (err.code != 0) {
                        hilog.info(domain, tag, "====>inputmethodNomal_test_hideSoftKeyboard_static_001 hideSoftKeyboard permission fail: " + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    } else {
                        hilog.info(domain, tag, '====>inputmethodNomal_test_hideSoftKeyboard_static_001 success: ');
                        done();
                    }
                } catch (err: BusinessError) {
                    hilog.error(domain, tag, "====>inputmethodNomal_test_hideSoftKeyboard_static_001 catch err: " + JSON.stringify(err));
                    expect().assertFail();
                    done();
                    hilog.info(domain, tag, "====>inputmethodNomal_test_hideSoftKeyboard_static_001 end");
                }
            });
        });

        /*
         * @tc.number  inputmethodNomal_test_hideSoftKeyboard_static_002
         * @tc.name    inputmethodNomal_test_hideSoftKeyboard_static_002
         * @tc.desc    Test Indicates the input method which will hide softboard with Promise.
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level2
         */
        it('inputmethodNomal_test_hideSoftKeyboard_static_002', Level.LEVEL2, async (done: () => void)  => {
            hilog.info(domain, tag, "====>*********inputmethodNomal_test_hideSoftKeyboard_static_002 start************");
            let inputMethodCtrl = inputMethod.getController()
            try {
                const ATTRIBUTE: inputMethod.TextConfig = {
                    inputAttribute: {
                        textInputType: inputMethod.TextInputType.TEXT,
                        enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
                    }
                }
                try {
                    let data = await inputMethodCtrl.attach(true, ATTRIBUTE);
                    hilog.info(domain, tag, `inputmethodNomal_test_hideSoftKeyboard_static_002 execution success, data: ${JSON.stringify(data)}`);
                } catch (error: BusinessError) {
                    hilog.info(domain, tag, `inputmethodNomal_test_hideSoftKeyboard_static_002 catch error, error: [${error.code}, ${error.message}]`);
                    expect().assertFail();
                    done();
                }
                hilog.info(domain, tag, '====>inputmethodNomal_test_hideSoftKeyboard_static_002 hideSoftKeyboard permission fail')
                await inputMethodCtrl.hideSoftKeyboard();
                done();
            } catch (err: BusinessError) {
                hilog.error(domain, tag, '====>inputmethodNomal_test_hideSoftKeyboard_static_002 hideSoftKeyboard catch err' + JSON.stringify(err))
                expect().assertFail();
                done();
                hilog.info(domain, tag, "====>inputmethodNomal_test_hideSoftKeyboard_static_002 end");
            }
        });

        /*
         * @tc.number  inputMethod_test_switchCurrentInputMethodSubtype_static_001
         * @tc.name    inputMethod_test_switchCurrentInputMethodSubtype_static_001
         * @tc.desc    Switch current input method subtype.
         * @tc.level   2
         */
        it('inputMethod_test_switchCurrentInputMethodSubtype_static_001', Level.LEVEL2, async (done: () => void) => {
            hilog.info(domain, tag, "====>************* inputMethod_test_switchCurrentInputMethodSubtype_static_001 Test start*************");
            let inputMS = inputMethod.getCurrentInputMethodSubtype()
            hilog.info(domain, tag, "inputMethod_test_switchCurrentInputMethodSubtype_static_001 getCurrentInputMethodSubtype: " + JSON.stringify(inputMS));

            inputMethod.switchCurrentInputMethodSubtype(inputMS, (err, data) => {
                try {
                    if (err.code != 0) {
                        hilog.error(domain, tag, 'inputMethod_test_switchCurrentInputMethodSubtype_static_001 err: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    };
                    hilog.info(domain, tag, "====>inputMethod_test_switchCurrentInputMethodSubtype_static_001 data: " + JSON.stringify(data));
                    expect(data != null).assertTrue();
                    done();
                } catch (error) {
                    hilog.error(domain, tag, 'inputMethod_test_switchCurrentInputMethodSubtype_static_001 catch error: ' + JSON.stringify(error));
                    done();
                }
            });
            hilog.info(domain, tag, "====>************* inputMethod_test_switchCurrentInputMethodSubtype_static_001 Test end*************");
        });

        /*
         * @tc.number  inputMethod_test_switchCurrentInputMethodSubtype_static_002
         * @tc.name    inputMethod_test_switchCurrentInputMethodSubtype_static_002
         * @tc.desc    Switch current input method subtype.
         * @tc.level   2
         */
        it('inputMethod_test_switchCurrentInputMethodSubtype_static_002', Level.LEVEL2, async (done: () => void) => {
            hilog.info(domain, tag, "====>************* inputMethod_test_switchCurrentInputMethodSubtype_static_002 Test start*************");
            let inputMS = inputMethod.getCurrentInputMethodSubtype()
            hilog.info(domain, tag, "inputMethod_test_switchCurrentInputMethodSubtype_static_002 getCurrentInputMethodSubtype: " + JSON.stringify(inputMS));
            try {
                inputMethod.switchCurrentInputMethodSubtype(inputMS).then((data: boolean) => {
                    hilog.info(domain, tag, "====>inputMethod_test_switchCurrentInputMethodSubtype_static_002 data: " + JSON.stringify(data));
                    expect(data != null).assertTrue();
                    done();
                }).catch((err: Error):void => {
                    hilog.error(domain, tag, 'inputMethod_test_switchCurrentInputMethodSubtype_static_002 err: ' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                hilog.error(domain, tag, 'inputMethod_test_switchCurrentInputMethodSubtype_static_002 catch error: ' + JSON.stringify(error));
                expect().assertFail();
                done();
            };
            hilog.info(domain, tag, "====>************* inputMethod_test_switchCurrentInputMethodSubtype_static_002 Test end*************");
        });
    })

}