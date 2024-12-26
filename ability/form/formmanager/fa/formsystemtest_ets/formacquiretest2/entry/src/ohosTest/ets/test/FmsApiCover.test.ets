import FormInfo from '@ohos.app.form.formInfo';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";

let formState: FormInfo.FormState;

export default function ApiCoverTest() {
  describe('ApiCoverTestTest', () => {

    /*
     * @tc.number  FMS_apiCoverTest_001
     * @tc.name    Get all FormError types.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it(`FMS_apiCoverTest_001`, 0, async (done: () => void) => {
      console.info("FMS_apiCoverTest_001 start");

      expect("ohos.extra.param.key.form_identity").assertEqual(FormInfo.FormParam.IDENTITY_KEY);
      expect("ohos.extra.param.key.bundle_name").assertEqual(FormInfo.FormParam.BUNDLE_NAME_KEY);
      expect("ohos.extra.param.key.ability_name").assertEqual(FormInfo.FormParam.ABILITY_NAME_KEY);
      expect("ohos.extra.param.key.form_launch_reason").assertEqual(FormInfo.FormParam.LAUNCH_REASON_KEY);
      expect("ohos.extra.param.key.form_customize").assertEqual(FormInfo.FormParam.PARAM_FORM_CUSTOMIZE_KEY);
      expect("ohos.extra.param.key.form_rendering_mode").assertEqual(FormInfo.FormParam.FORM_RENDERING_MODE_KEY);
      expect("ohos.extra.param.key.host_bg_inverse_color").assertEqual(FormInfo.FormParam.HOST_BG_INVERSE_COLOR_KEY);
      expect("ohos.extra.param.key.permission_name").assertEqual(FormInfo.FormParam.FORM_PERMISSION_NAME_KEY);
      expect("ohos.extra.param.key.permission_granted").assertEqual(FormInfo.FormParam.FORM_PERMISSION_GRANTED_KEY);

      expect(1).assertEqual(FormInfo.FormType.JS);
      expect(2).assertEqual(FormInfo.FormType.eTS);
      expect(1).assertEqual(FormInfo.FormShape.RECT);
      expect(2).assertEqual(FormInfo.FormShape.CIRCLE);
      expect(1).assertEqual(FormInfo.VisibilityType.FORM_VISIBLE);
      expect(2).assertEqual(FormInfo.VisibilityType.FORM_INVISIBLE);
      expect(1).assertEqual(FormInfo.LaunchReason.FORM_DEFAULT);
      expect(2).assertEqual(FormInfo.LaunchReason.FORM_SHARE);
      expect(-1).assertEqual(FormInfo.ColorMode.MODE_AUTO);
      expect(0).assertEqual(FormInfo.ColorMode.MODE_DARK);
      expect(1).assertEqual(FormInfo.ColorMode.MODE_LIGHT);

      expect(-1).assertEqual(FormInfo.FormState.UNKNOWN);
      expect(0).assertEqual(FormInfo.FormState.DEFAULT);
      expect(1).assertEqual(FormInfo.FormState.READY);

      expect(3).assertEqual(FormInfo.FormDimension.Dimension_2_4);
      expect(4).assertEqual(FormInfo.FormDimension.Dimension_4_4);
      expect(6).assertEqual(FormInfo.FormDimension.DIMENSION_1_1);
      expect(7).assertEqual(FormInfo.FormDimension.DIMENSION_6_4);
      expect(FormInfo.FormDimension.DIMENSION_2_3).assertEqual(FormInfo.FormDimension.DIMENSION_2_3);
      expect(FormInfo.FormDimension.DIMENSION_3_3).assertEqual(FormInfo.FormDimension.DIMENSION_3_3);

      console.info("FMS_apiCoverTest_001 end");
      done();
    });
  })
}