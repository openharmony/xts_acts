import demo from '@ohos.bundle'

export default {
    data: {
        title: "AI",
        realHrValue: 0,
        x: 0,
        y: 100,
        d: ","
    },
    onInit() {
        this.title = this.$t('strings.world');
        console.log("BmsApplication test for ams");
        this.updateTime();
        this.timer = setInterval(this.updateTime, 17)
    },
    updateTime: function () {

    },
    onDestroy() {

        clearInterval(this.timer)

    }
}
