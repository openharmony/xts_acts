import { describe, it, expect, TestType, Size, Level} from "../../../hypium/index";
import hilog from '@ohos.hilog';
import Want from '@ohos.app.ability.Want';
import formInfo from "@ohos.app.form.formInfo";
import Utils from './Util.test';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag formInfoTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function formInfoTest() {

    describe("formInfoTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');

        it("FormInfoTest001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(domain, tag, '%{public}s', 'FormInfoTest001 start');

            expect(0).assertEqual(formInfo.RenderingMode.AUTO_COLOR as number);
            expect(1).assertEqual(formInfo.RenderingMode.FULL_COLOR as number);
            expect(2).assertEqual(formInfo.RenderingMode.SINGLE_COLOR as number);

            expect(1).assertEqual(formInfo.FormType.JS as number);
            expect(2).assertEqual(formInfo.FormType.eTS as number);

            expect(-1).assertEqual(formInfo.ColorMode.MODE_AUTO as number);
            expect(0).assertEqual(formInfo.ColorMode.MODE_DARK as number);
            expect(1).assertEqual(formInfo.ColorMode.MODE_LIGHT as number);

            expect(-1).assertEqual(formInfo.FormState.UNKNOWN as number);
            expect(0).assertEqual(formInfo.FormState.DEFAULT as number);
            expect(1).assertEqual(formInfo.FormState.READY as number);

            expect('ohos.extra.param.key.form_identity').assertEqual(formInfo.FormParam.IDENTITY_KEY as string);
            expect('ohos.extra.param.key.form_dimension').assertEqual(formInfo.FormParam.DIMENSION_KEY as string);
            expect('ohos.extra.param.key.form_name').assertEqual(formInfo.FormParam.NAME_KEY as string);
            expect('ohos.extra.param.key.module_name').assertEqual(formInfo.FormParam.MODULE_NAME_KEY as string);
            expect('ohos.extra.param.key.form_width').assertEqual(formInfo.FormParam.WIDTH_KEY as string);
            expect('ohos.extra.param.key.form_height').assertEqual(formInfo.FormParam.HEIGHT_KEY as string);
            expect('ohos.extra.param.key.form_temporary').assertEqual(formInfo.FormParam.TEMPORARY_KEY as string);
            expect('ohos.extra.param.key.bundle_name').assertEqual(formInfo.FormParam.BUNDLE_NAME_KEY as string);
            expect('ohos.extra.param.key.ability_name').assertEqual(formInfo.FormParam.ABILITY_NAME_KEY as string);
            expect('ohos.extra.param.key.form_is_theme').assertEqual(formInfo.FormParam.THEME_KEY as string);
            expect('ohos.extra.param.key.device_id').assertEqual(formInfo.FormParam.DEVICE_ID_KEY as string);
            expect('ohos.extra.param.key.form_launch_reason').assertEqual(formInfo.FormParam.LAUNCH_REASON_KEY as string);
            expect('ohos.extra.param.key.form_customize').assertEqual(formInfo.FormParam.PARAM_FORM_CUSTOMIZE_KEY as string);
            expect('ohos.extra.param.key.form_location').assertEqual(formInfo.FormParam.FORM_LOCATION_KEY as string);
            expect('ohos.extra.param.key.form_rendering_mode').assertEqual(formInfo.FormParam.FORM_RENDERING_MODE_KEY as string);
            expect('ohos.extra.param.key.host_bg_inverse_color').assertEqual(formInfo.FormParam.HOST_BG_INVERSE_COLOR_KEY as string);
            expect('ohos.extra.param.key.permission_name').assertEqual(formInfo.FormParam.FORM_PERMISSION_NAME_KEY as string);
            expect('ohos.extra.param.key.permission_granted').assertEqual(formInfo.FormParam.FORM_PERMISSION_GRANTED_KEY as string);

            expect(1).assertEqual(formInfo.FormDimension.Dimension_1_2 as number);
            expect(2).assertEqual(formInfo.FormDimension.Dimension_2_2 as number);
            expect(3).assertEqual(formInfo.FormDimension.Dimension_2_4 as number);
            expect(4).assertEqual(formInfo.FormDimension.Dimension_4_4 as number);
            expect(5).assertEqual(formInfo.FormDimension.Dimension_2_1 as number);
            expect(6).assertEqual(formInfo.FormDimension.DIMENSION_1_1 as number);
            expect(7).assertEqual(formInfo.FormDimension.DIMENSION_6_4 as number);
            expect(8).assertEqual(formInfo.FormDimension.DIMENSION_2_3 as number);
            expect(9).assertEqual(formInfo.FormDimension.DIMENSION_3_3 as number);
            expect(10).assertEqual(formInfo.FormDimension.DIMENSION_3_4 as number);

            expect(1).assertEqual(formInfo.FormShape.RECT as number);
            expect(2).assertEqual(formInfo.FormShape.CIRCLE as number);

            expect(0).assertEqual(formInfo.VisibilityType.UNKNOWN as number);
            expect(1).assertEqual(formInfo.VisibilityType.FORM_VISIBLE as number);
            expect(2).assertEqual(formInfo.VisibilityType.FORM_INVISIBLE as number);

            expect(1).assertEqual(formInfo.LaunchReason.FORM_DEFAULT as number);
            expect(2).assertEqual(formInfo.LaunchReason.FORM_SHARE as number);

            expect(0).assertEqual(formInfo.PublishFormErrorCode.SUCCESS as number);
            expect(1).assertEqual(formInfo.PublishFormErrorCode.NO_SPACE as number);
            expect(2).assertEqual(formInfo.PublishFormErrorCode.PARAM_ERROR as number);
            expect(3).assertEqual(formInfo.PublishFormErrorCode.INTERNAL_ERROR as number);

            expect(0).assertEqual(formInfo.FormUsageState.USED as number);
            expect(1).assertEqual(formInfo.FormUsageState.UNUSED as number);

            expect(-1).assertEqual(formInfo.FormLocation.OTHER as number);
            expect(0).assertEqual(formInfo.FormLocation.DESKTOP as number);
            expect(1).assertEqual(formInfo.FormLocation.FORM_CENTER as number);
            expect(2).assertEqual(formInfo.FormLocation.FORM_MANAGER as number);
            expect(3).assertEqual(formInfo.FormLocation.NEGATIVE_SCREEN as number);
            expect(4).assertEqual(formInfo.FormLocation.FORM_CENTER_NEGATIVE_SCREEN as number);
            expect(5).assertEqual(formInfo.FormLocation.FORM_MANAGER_NEGATIVE_SCREEN as number);
            expect(6).assertEqual(formInfo.FormLocation.SCREEN_LOCK as number);
            expect(7).assertEqual(formInfo.FormLocation.AI_SUGGESTION as number);

            done();
            hilog.info(domain, tag, '%{public}s', 'FormInfoTest001 end');
        })

        it("FormInfoTest002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(domain, tag, '%{public}s', 'FormInfoTest002 start');

            let formInfoFo: formInfo.FormInfo = {
                bundleName: 'bundleName',
                moduleName: 'moduleName',
                abilityName: 'abilityName',
                name: 'name',
                displayName: 'displayName',
                displayNameId: 123,
                description: 'description',
                descriptionId: 123,
                type: formInfo.FormType.eTS,
                jsComponentName: 'jsComponentName',
                colorMode: formInfo.ColorMode.MODE_AUTO,
                isDefault: true,
                updateEnabled: true,
                formVisibleNotify: true,
                scheduledUpdateTime: 'scheduledUpdateTime',
                formConfigAbility: 'formConfigAbility',
                updateDuration: 123,
                defaultDimension: 123,
                supportDimensions: [1,2,3],
                customizeData: {},
                isDynamic: true,
                transparencyEnabled: true,
                supportedShapes: [1,2,3],
                previewImages: [1,2,3],
                enableBlurBackground: true,
                renderingMode: formInfo.RenderingMode.AUTO_COLOR,
            }
            expect('bundleName').assertEqual(formInfoFo.bundleName as string);
            expect('moduleName').assertEqual(formInfoFo.moduleName as string);
            expect('abilityName').assertEqual(formInfoFo.abilityName as string);
            expect('name').assertEqual(formInfoFo.name as string);
            expect('displayName').assertEqual(formInfoFo.displayName as string);
            expect(123).assertEqual(formInfoFo.displayNameId as number);
            expect('description').assertEqual(formInfoFo.description as string);
            expect(123).assertEqual(formInfoFo.descriptionId as number);
            expect(2).assertEqual(formInfoFo.type as number);
            expect('jsComponentName').assertEqual(formInfoFo.jsComponentName as string);
            expect(-1).assertEqual(formInfoFo.colorMode as number);
            expect(formInfoFo.isDefault).assertTrue();
            expect(formInfoFo.updateEnabled).assertTrue();
            expect(formInfoFo.formVisibleNotify).assertTrue();
            expect('scheduledUpdateTime').assertEqual(formInfoFo.scheduledUpdateTime as string);
            expect('formConfigAbility').assertEqual(formInfoFo.formConfigAbility as string);
            expect(123).assertEqual(formInfoFo.updateDuration as number);
            expect(123).assertEqual(formInfoFo.defaultDimension as number);
            expect(JSON.stringify([1,2,3])).assertEqual(JSON.stringify(formInfoFo.supportedShapes));
            expect(JSON.stringify({} as Object)).assertEqual(JSON.stringify(formInfoFo.customizeData));
            expect(formInfoFo.isDynamic).assertTrue();
            expect(formInfoFo.transparencyEnabled).assertTrue();
            expect(JSON.stringify([1,2,3])).assertEqual(JSON.stringify(formInfoFo.previewImages));
            expect(formInfoFo.enableBlurBackground).assertTrue();
            expect(0).assertEqual(formInfo.RenderingMode.AUTO_COLOR as number);
            // let isCo: number = 0;
            // if (formInfoFo.enableBlurBackground) {
            //     isCo = isCo + 1; //1
            // }
            // if (formInfoFo.renderingMode === formInfo.RenderingMode.AUTO_COLOR) {
            //     isCo = isCo + 1; //2
            // }
            // expect(isCo === 2).assertTrue();

            done();
            hilog.info(domain, tag, '%{public}s', 'FormInfoTest002 end');
        })

        it("FormInfoTest003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            await Utils.msSleep(1000);
            hilog.info(domain, tag, '%{public}s', 'FormInfoTest003 start');

            let formStateFo: formInfo.FormStateInfo = {
                formState: formInfo.FormState.UNKNOWN,
                want: { bundleName: 'bundleName' },
            }
            expect(-1).assertEqual(formStateFo.formState as number);
            expect('bundleName').assertEqual(formStateFo.want.bundleName as string);

            let formInfoFilterFo: formInfo.FormInfoFilter = {
                bundleName: 'bundleName',
                moduleName: 'moduleName',
                supportedDimensions: [1,2,3],
                supportedShapes: [1,2,3],
            }
            expect('bundleName').assertEqual(formInfoFilterFo.bundleName as string);
            expect('moduleName').assertEqual(formInfoFilterFo.moduleName as string);
            expect(JSON.stringify([1,2,3])).assertEqual(JSON.stringify(formInfoFilterFo.supportedDimensions));
            expect(JSON.stringify([1,2,3])).assertEqual(JSON.stringify(formInfoFilterFo.supportedShapes));

            let publishFormResultFo: formInfo.PublishFormResult = {
                code: formInfo.PublishFormErrorCode.SUCCESS,
                message: 'message',
            }
            expect(0).assertEqual(publishFormResultFo.code as number);
            expect('message').assertEqual(publishFormResultFo.message as string);

            let formProviderFilterFo: formInfo.FormProviderFilter = {
                bundleName: 'bundleName',
                formName: 'formName',
                moduleName: 'moduleName',
                abilityName: 'abilityName',
                isUnusedIncluded: true,
            }
            expect('bundleName').assertEqual(formProviderFilterFo.bundleName as string);
            expect('formName').assertEqual(formProviderFilterFo.formName as string);
            expect('moduleName').assertEqual(formProviderFilterFo.moduleName as string);
            expect('abilityName').assertEqual(formProviderFilterFo.abilityName as string);
            expect(true).assertEqual(formProviderFilterFo.isUnusedIncluded as boolean);

            let runningFormInfoFo: formInfo.RunningFormInfo = {
                formId: 'formId',
                bundleName: 'bundleName',
                hostBundleName: 'hostBundleName',
                formLocation: formInfo.FormLocation.DESKTOP,
                visibilityType: formInfo.VisibilityType.FORM_VISIBLE,
                moduleName: 'moduleName',
                abilityName: 'abilityName',
                formName: 'formName',
                dimension: 123,
                formUsageState: formInfo.FormUsageState.UNUSED,
                formDescription: 'formDescription',
                extraData: {},
            }
            expect('formId').assertEqual(runningFormInfoFo.formId as string);
            expect('bundleName').assertEqual(runningFormInfoFo.bundleName as string);
            expect('hostBundleName').assertEqual(runningFormInfoFo.hostBundleName as string);
            expect(0).assertEqual(runningFormInfoFo.formLocation as number);
            expect(1).assertEqual(runningFormInfoFo.visibilityType as number);
            expect('moduleName').assertEqual(runningFormInfoFo.moduleName as string);
            expect('abilityName').assertEqual(runningFormInfoFo.abilityName as string);
            expect('formName').assertEqual(runningFormInfoFo.formName as string);
            expect(123).assertEqual(runningFormInfoFo.dimension as number);
            expect(1).assertEqual(runningFormInfoFo.formUsageState as number);
            expect('formDescription').assertEqual(runningFormInfoFo.formDescription as string);
            expect(JSON.stringify({} as Object)).assertEqual(JSON.stringify(runningFormInfoFo.extraData));

            done();
            hilog.info(domain, tag, '%{public}s', 'FormInfoTest003 end');
        })
    })
}