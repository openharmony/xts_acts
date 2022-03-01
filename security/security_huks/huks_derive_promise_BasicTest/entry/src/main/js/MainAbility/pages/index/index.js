import {Core, ExpectExtend} from 'deccjsunit/index'

export default {
    data: {
        title: ""
    },
    onInit() {
        this.title = this.$t('strings.world');
    },
    onShow() {
        const core = Core.getInstance();
        const expectExtend = new ExpectExtend({
        'id': 'extend'
        });
        core.addService('expect', expectExtend);
        core.init();
        const configService = core.getDefaultService('config');
        this.timeout = 1500000;
        configService.setConfig(this)
        console.log("test start")
        require('../../../test/List.test')
        core.execute()
    },
    onReady() {
    },
}
