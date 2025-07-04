import { describe, it, expect, Level, TestType, Size } from '../../../hypium/index'
import hilog from '@ohos.hilog'
import userAuth from '@ohos.userIAM.userAuth'
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function signNormalNotAccessBiometricEnumExecute() {
    describe('signNormalNotAccessBiometricEnumExecute', (): void => {
        /*
            * @tc.number    : Security_IAM_userAuthType_Kit_Func_Static_0084
            * @tc.name      : Security_IAM_userAuthType_Kit_Func_Static_0084
            * @tc.desc      : UserAuthType parameter check
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level.LEVEL2
        */
        it('Security_IAM_userAuthType_Kit_Func_Static_0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'testFace Security_IAM_userAuthType_Kit_Func_Static_0084 start');
            expect('1').assertEqual(userAuth.UserAuthType.PIN + '');
            expect('2').assertEqual(userAuth.UserAuthType.FACE + '');
            expect('4').assertEqual(userAuth.UserAuthType.FINGERPRINT + '');
            expect('16').assertEqual(userAuth.UserAuthType.PRIVATE_PIN + '');
            hilog.info(domain, tag, '%{public}s', 'Security_IAM_userAuthType_Kit_Func_Static_0084 end');
        })

        /*
            * @tc.number    : Security_IAM_widgetNotice_Kit_Func_Static_0085
            * @tc.name      : Security_IAM_widgetNotice_Kit_Func_Static_0085
            * @tc.desc      : WindowModeType parameter check
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level.LEVEL2
        */
        it('Security_IAM_widgetNotice_Kit_Func_Static_0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'testFace Security_IAM_widgetNotice_Kit_Func_Static_0085 start');
            expect('1').assertEqual(userAuth.WindowModeType.DIALOG_BOX + '');
            expect('2').assertEqual(userAuth.WindowModeType.FULLSCREEN + '');
            hilog.info(domain, tag, '%{public}s', 'Security_IAM_widgetNotice_Kit_Func_Static_0085 end');
        })

        /*
            * @tc.number    : Security_IAM_widgetNotice_Kit_Func_Static_0086
            * @tc.name      : Security_IAM_widgetNotice_Kit_Func_Static_0086
            * @tc.desc      : NoticeType parameter check
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level.LEVEL2
        */
        it('Security_IAM_widgetNotice_Kit_Func_Static_0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'testFace Security_IAM_widgetNotice_Kit_Func_Static_0086 start');
            expect('1').assertEqual(userAuth.NoticeType.WIDGET_NOTICE + '');
            hilog.info(domain, tag, '%{public}s', 'Security_IAM_widgetNotice_Kit_Func_Static_0086 end');
        })

        /*
            * @tc.number    : Security_IAM_userAuthResultCode_Kit_Func_Static_0087
            * @tc.name      : Security_IAM_userAuthResultCode_Kit_Func_Static_0087
            * @tc.desc      : UserAuthResultCode parameter check
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level.LEVEL2
        */
        it('Security_IAM_userAuthResultCode_Kit_Func_Static_0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () : Promise<void> => {
            hilog.info(domain, tag, '%{public}s', 'testFace Security_IAM_userAuthResultCode_Kit_Func_Static_0087 start');
            expect('12500011').assertEqual(userAuth.UserAuthResultCode.CANCELED_FROM_WIDGET + '');
            hilog.info(domain, tag, '%{public}s', 'Security_IAM_userAuthResultCode_Kit_Func_Static_0087 end');
        })

    });
};