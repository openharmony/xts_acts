import prompt from '@system.prompt';
export default {
    showDialog1() {
        this.$element('simpleDialog1').show()
    },
    showDialog2() {
        this.$element('simpleDialog2').show()
    },
    showDialog3() {
        this.$element('simpleDialog3').show()
    },
    showDialog4() {
        this.$element('simpleDialog3').show()
    },
    showDialog5() {
        this.$element('simpleDialog5').show()
    },
    cancelDialog() {
        prompt.showToast({
            message: 'Dialog cancelled'
        })
    },
    cancelSchedule() {
        this.$element('simpleDialog1').close()
        this.$element('simpleDialog2').close()
        this.$element('simpleDialog3').close()
        this.$element('simpleDialog4').close()
        this.$element('simpleDialog5').close()
        prompt.showToast({
            message: 'Successfully cancelled'
        })
    },
    setSchedule() {
        this.$element('simpleDialog1').close()
        this.$element('simpleDialog2').close()
        this.$element('simpleDialog3').close()
        this.$element('simpleDialog4').close()
        this.$element('simpleDialog5').close()
        prompt.showToast({
            message: 'Successfully confirmed'
        })
    },
    doubleClick(){
        prompt.showToast({
            message: 'doubleClick'
        })
    }
}