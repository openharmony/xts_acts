export default {
    data: {
        title: "Hello World"
    },
    onInit() {
        this.title = this.$t('strings.world');
    },
}
