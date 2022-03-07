import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index"


export default function abilityTest(abilityContext) {
  describe('ActsAbilityTest', function() {

     /**
         * @tc.number: SUB_AA_OpenHarmony_Context_0900
         * @tc.name: Verify that the AbilityContext gets the resourceManger object available
         * @tc.desc: Obtain the resourceManger object through ability, call the getString method, pass in the
         *           labelId of the corresponding hap package, and check whether it is the same as the configuration
         *           in the config.json file
         */
        it('SUB_AA_OpenHarmony_Context_0900', 0, async function (done) {
            console.log("SUB_AA_OpenHarmony_Context_0900 --- start");
            var result = await abilityContext.resourceManager.getString(16777218);
            console.log("SUB_AA_OpenHarmony_Context_0900 : result = " + JSON.stringify(result));
            setTimeout(function() {
                expect(JSON.stringify(result)).assertEqual("entry_MainAbility");
            }, 5000);
            done();
        });

        /**
         * @tc.number: SUB_AA_OpenHarmony_Context_1000
         * @tc.name: Verify that the AbilityStageContext gets the resourceManger object available
         * @tc.desc: First obtain the resourceManger object through AbilityStage, then call the getString method,
         *           pass in the labelId of the corresponding hap package, and check whether it is the same as the
         *           configuration in the config.json file
         */
        it('SUB_AA_OpenHarmony_Context_1000', 0, async function (done) {
            console.log("SUB_AA_OpenHarmony_Context_1000 --- start");
            var result = await globalThis.stageContext.resourceManager.getString(16777218);
            console.log("SUB_AA_OpenHarmony_Context_1000 : result = " + JSON.stringify(result));
            setTimeout(function() {
                expect(JSON.stringify(result)).assertEqual("entry_MainAbility");
            }, 5000);
            done();
        });

        /**
         * @tc.number: SUB_AA_OpenHarmony_Context_1100
         * @tc.name: Verify that the resourceManger object obtained by AbilityStageContext to obtain
         *           applicationContext is available
         * @tc.desc: First call the getApplication() method through AbilityStage to obtain the ApplicationContext,
         *           then obtain the resourceManger object through the ApplicationContext, then call the getString
         *           method, pass in the labelId of the corresponding hap package, and check whether it is the same
         *           as the configuration in the config.json file
         */
        it('SUB_AA_OpenHarmony_Context_1100', 0, async function (done) {
            console.log("SUB_AA_OpenHarmony_Context_1100 --- start");
            var result = await globalThis.stageContext.getApplicationContext().resourceManager.getString(16777218);
            console.log("SUB_AA_OpenHarmony_Context_1100 : result = " + JSON.stringify(result));
            setTimeout(function() {
                expect(JSON.stringify(result)).assertEqual("entry_MainAbility");
            }, 5000);
            done();
        });

        /**
         * @tc.number: SUB_AA_OpenHarmony_Context_1300
         * @tc.name: Verify that AbilityContext calls createBundleContext to create the specified context,
         *           passing in the wrong package name
         * @tc.desc: When the createBundleContext method is called through the context of ability, an incorrect
         *           package name is passed in, and the returned information is checked.
         */
        it('SUB_AA_OpenHarmony_Context_1300', 0, async function (done) {
            console.log("SUB_AA_OpenHarmony_Context_1300 --- start");
            var result = abilityContext.createBundleContext("com.app.os");
            console.log("SUB_AA_OpenHarmony_Context_1300 : type = " + typeof(result));
            setTimeout(function() {
                expect(typeof(result) == "undefined").assertTrue();
            }, 5000);
            done();
        });

        /**
         * @tc.number: SUB_AA_OpenHarmony_Context_1400
         * @tc.name: Verify that AbilityContext calls createBundleContext to create the specified
         *           context and passes in your own package name
         * @tc.desc: Call the createBundleContext method through the context of ability, pass in the package name
         *           of the hap package, then obtain the resourceManager object and call the getString method, pass
         *           in the corresponding labelId, and check whether the obtained resource is the same as the label
         *           resource in config.json
         */
        it('SUB_AA_OpenHarmony_Context_1400', 0, async function (done) {
            console.log("SUB_AA_OpenHarmony_Context_1400 --- start");
            var bundleContext = abilityContext.createBundleContext("ohos.acts.aafwk.pldtest.myapplication");
            var result = await bundleContext.resourceManager.getString(16777218);
            console.log("SUB_AA_OpenHarmony_Context_1400 : result = " + JSON.stringify(result));
            setTimeout(function() {
                expect(JSON.stringify(result)).assertEqual("entry_MainAbility");
            }, 5000);
            done();
        });
  })
}
