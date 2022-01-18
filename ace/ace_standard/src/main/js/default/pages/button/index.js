export default {
    data: {
        progress: 10,
        downloadText: "进度条按钮"
    },
    setProgress(e) {
        var i=0
        var set= setInterval(()=>{
            i+=10
            this.progress=i
            this.downloadText = this.progress + "%";
            this.$element('download-btn').setProgress({ progress: this.progress });
            if(this.progress>=100){
                clearInterval(set)
                this.downloadText="完成"
            }
        },1000)
    },
}