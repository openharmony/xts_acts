import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import formError from "@ohos.application.formError";
import Utils from './Util.test';


let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag formErrorTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function formErrorTest() {

    describe("formErrorTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        it("FormErrorTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(domain, tag, '%{public}s', 'FormErrorTest001 start');
            expect(1).assertEqual(formError.FormError.ERR_COMMON as number);
            expect(2).assertEqual(formError.FormError.ERR_PERMISSION_DENY as number);
            expect(4).assertEqual(formError.FormError.ERR_GET_INFO_FAILED as number);
            expect(5).assertEqual(formError.FormError.ERR_GET_BUNDLE_FAILED as number);
            expect(6).assertEqual(formError.FormError.ERR_GET_LAYOUT_FAILED as number);
            expect(7).assertEqual(formError.FormError.ERR_ADD_INVALID_PARAM as number);
            expect(8).assertEqual(formError.FormError.ERR_CFG_NOT_MATCH_ID as number);
            expect(9).assertEqual(formError.FormError.ERR_NOT_EXIST_ID as number);
            expect(10).assertEqual(formError.FormError.ERR_BIND_PROVIDER_FAILED as number);
            expect(11).assertEqual(formError.FormError.ERR_MAX_SYSTEM_FORMS as number);
            expect(12).assertEqual(formError.FormError.ERR_MAX_INSTANCES_PER_FORM as number);
            expect(13).assertEqual(formError.FormError.ERR_OPERATION_FORM_NOT_SELF as number);
            expect(14).assertEqual(formError.FormError.ERR_PROVIDER_DEL_FAIL as number);
            expect(15).assertEqual(formError.FormError.ERR_MAX_FORMS_PER_CLIENT as number);
            expect(16).assertEqual(formError.FormError.ERR_MAX_SYSTEM_TEMP_FORMS as number);
            expect(17).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_MODULE as number);
            expect(18).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_ABILITY as number);
            expect(19).assertEqual(formError.FormError.ERR_FORM_NO_SUCH_DIMENSION as number);
            expect(20).assertEqual(formError.FormError.ERR_FORM_FA_NOT_INSTALLED as number);
            expect(30).assertEqual(formError.FormError.ERR_SYSTEM_RESPONSES_FAILED as number);
            expect(31).assertEqual(formError.FormError.ERR_FORM_DUPLICATE_ADDED as number);
            expect(36).assertEqual(formError.FormError.ERR_IN_RECOVERY as number);
            expect(37).assertEqual(formError.FormError.ERR_DISTRIBUTED_SCHEDULE_FAILED as number);

            done();
            hilog.info(domain, tag, '%{public}s', 'FormErrorTest001 end');
        })
    })
}