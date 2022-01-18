// xxx.js
export default {
    data: {
        value: 0,
        startValue: 0,
        currentValue: 0,
        endValue: 0,
    },
    setvalue(e) {
        if (e.mode == "start") {
            this.value = e.value;
            this.startValue = e.value;
        } else if (e.mode == "move") {
            this.value = e.value;
            this.currentValue = e.value;
        } else if (e.mode == "end") {
            this.value = e.value;
            this.endValue = e.value;
        }
    }
}