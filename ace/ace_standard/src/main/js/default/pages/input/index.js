// xxx.js
import prompt from '@system.prompt'
export default {
    change(e){
        prompt.showToast({
            message: "value: " + e.value,
            duration: 3000,
        });
    },
    enterkeyClick(e){
        prompt.showToast({
            message: "enterkey clicked",
            duration: 3000,
        });
    },
    buttonClick(e){
        this.$element("input").showError({
            error: 'error text'
        });
    },
}