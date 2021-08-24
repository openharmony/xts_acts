import file from '@system.file'
import app from '@system.app'
import device from '@system.device'
import router from '@system.router'
import {Core, Constant, ExpectExtend, ReportExtend, InstrumentLog} from 'deccjsunit/index'


export default {
    data: {
        title: ""
    },
    onInit() {
        this.title = this.$t('strings.world');
    },
    onShow() {
        console.info('onShow finish')
        const core = Core.getInstance()
        core.init()
        require('../../../test/List.test')
        core.execute()
    },
    onclick: function () {
        router.replace({
            uri: "pages/second/second"
        })
    },
    touchMove(e) {
        if (e.direction == "right") {
            this.appExit();
        }
    },
    appExit() {
        app.terminate()
    }
}


