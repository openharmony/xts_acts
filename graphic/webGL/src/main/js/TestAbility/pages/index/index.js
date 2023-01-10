
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import { Hypium } from '@ohos/hypium'
import testsuite from '../../../test/List.test'

export default {
    data:{
        title:""
    },
    onInit(){
        this.title = this.$t('strings.world');
    },
    onShow(){
        global.el = this.$refs.canvas1;
        global.el2 = this.$refs.canvas2;
        var abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        var abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
        console.info('start run testcase!!!')
        Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
    }
}
