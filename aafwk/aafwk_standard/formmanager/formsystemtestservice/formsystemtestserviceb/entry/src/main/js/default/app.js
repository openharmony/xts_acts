import Subscriber from '@ohos.commonevent'
var JSON_DATA_COUNT = 200;
export default {
    constructor(obj) {
        console.log('formSystemTestServiceB: constructor ok, time stamp:'+ Date.parse(new Date()));

        // Subscriber.publish(
        //     "fms_serviceA_constructor",
        //     (err,data) => {
        //         console.log("formSystemTestServiceB: constructor publish callback return! ")
        //     }
        // );
    },

    updateData(obj) {
        console.log('formSystemTestServiceB: updateData ok, time stamp:'+ Date.parse(new Date()));

        // Subscriber.publish(
        //     "fms_serviceA_updateData",
        //     (err,data) => {
        //         console.log("formSystemTestServiceB: updateData publish callback return! ")
        //     }
        // );
    },

    getDataString() {
        console.log('formSystemTestServiceB: getDataString ok, time stamp:'+ Date.parse(new Date()));

        // Subscriber.publish(
        //     "fms_serviceA_getDataString",
        //     (err,data) => {
        //         console.log("formSystemTestServiceB: getDataString publish callback return! ")
        //     }
        // );
        return "dataString";
    },

    addImageData(name, data){
        console.log('formSystemTestServiceB: addImageData ok, time stamp:'+ Date.parse(new Date()));

        // Subscriber.publish(
        //     "fms_serviceA_addImageData",
        //     (err,data) => {
        //         console.log("formSystemTestServiceB: addImageData publish callback return! ")
        //     }
        // );
    },

    removeImageData(name){
        console.log('formSystemTestServiceB: removeImageData ok, time stamp:'+ Date.parse(new Date()));

        // Subscriber.publish(
        //     "fms_serviceA_removeImageData",
        //     (err,data) => {
        //         console.log("formSystemTestServiceB: removeImageData publish callback return! ")
        //     }
        // );
    },

    onCreate(para) {
        console.log('formSystemTestServiceB: onCreate ok, para：'+ para + ', time stamp:'+ Date.parse(new Date()));

        // Subscriber.publish(
        //     "fms_serviceA_onCreate",
        //     (err,data) => {
        //         console.log("formSystemTestServiceB: onCreate publish callback return! ")
        //     }
        // );
        // return {"city":"beijing","city2":"beijing2","city3":"beijing3","city4":"beijing4","city5":"beijing5",
        //         "city6":"beijing6","city7":"beijing7","city8":"beijing8","city9":"beijing9","city10":"beijing10",
        //         "city12":"beijing12","city13":"beijing13","city14":"beijing14","city15":"beijing15",
        //         "city22":"beijing22","city23":"beijing23","city24":"beijing24","city25":"beijing25",
        //         "city32":"beijing32","city33":"beijing33","city34":"beijing34","city35":"beijing35",
        //         "city42":"beijing42","city43":"beijing43","city44":"beijing44","city45":"beijing45",
        //         "city52":"beijing52","city53":"beijing53","city54":"beijing54","city55":"beijing55",
        //         "city62":"beijing62","city63":"beijing63","city64":"beijing64","city65":"beijing65",
        //         "city72":"beijing72","city73":"beijing73","city74":"beijing74","city75":"beijing75",
        //         "city82":"beijing82","city83":"beijing83","city84":"beijing84","city85":"beijing85",
        //         "city92":"beijing92","city93":"beijing93","city94":"beijing94","city95":"beijing95",
        //         "city11":"beijing16","city17":"beijing18","city19":"beijing110","city11":"beijing111",
        //         "city21":"beijing26","city27":"beijing28","city29":"beijing210","city211":"beijing211",
        //         "city31":"beijing36","city37":"beijing38","city39":"beijing310","city311":"beijing311",
        //         "city41":"beijing46","city47":"cdbeijing48","city49":"beijing410","city11":"beijing411"
        //     };
        var jsonData = "{";
         for (var iJsonDataCount = 0; iJsonDataCount < JSON_DATA_COUNT; iJsonDataCount++) {
            jsonData = jsonData + "city" + iJsonDataCount + ":" + "beijingB"+iJsonDataCount;
            if ( iJsonDataCount != JSON_DATA_COUNT - 1) {
                jsonData = jsonData + ", ";
            }
        }
        jsonData = jsonData + "}";
        return jsonData;
    },

    onDestroy(para) {
        console.log('formSystemTestServiceB: onDestroy para：'+ para + ', time stamp:'+ Date.parse(new Date()));

        // Subscriber.publish(
        //     "fms_serviceA_onDestroy",
        //     (err,data) => {
        //         console.log("formSystemTestServiceB: onDestroy publish callback return! ")
        //     }
        // );
    },

    onDelete(formId) {
        console.log('formSystemTestServiceB:  onDelete ok, formId:' + formId + ', time stamp:'+ Date.parse(new Date()));

        // Subscriber.publish(
        //     "fms_serviceA_onDelete",
        //     (err,data) => {
        //         console.log("formSystemTestServiceB: onDelete publish callback return! ")
        //     }
        // );
    },

    onTriggerEvent(formId, message) {
        console.log('formSystemTestServiceB:  onTriggerEvent ok, formId:' + formId + 'message:' + message + ', time stamp:'+ Date.parse(new Date()));

        // Subscriber.publish(
        //     "fms_serviceA_onTriggerEvent",
        //     (err,data) => {
        //         console.log("formSystemTestServiceB: onTriggerEvent publish callback return! ")
        //     }
        // );
    },

    onUpdate(formId) {
        console.log('formSystemTestServiceB:  onUpdate ok, formId:' + formId + ', time stamp:'+ Date.parse(new Date()));

        // Subscriber.publish(
        //     "fms_serviceA_onUpdate",
        //     (err,data) => {
        //         console.log("formSystemTestServiceB: onUpdate publish callback return! ")
        //     }
        // );
    },

    onCastTemp(formId) {
        console.log('formSystemTestServiceB:  onCastTemp ok, formId:' + formId + ', time stamp:'+ Date.parse(new Date()));

        // Subscriber.publish(
        //     "fms_serviceA_onCastTemp",
        //     (err,data) => {
        //         console.log("formSystemTestServiceB: onCastTemp publish callback return! ")
        //     }
        // );
    },

    onVisibilityChanged(formEventsMap) {
        console.log('formSystemTestServiceB:  OnVisibilityChanged ok, map:'+ formEventsMap + ', time stamp:'+ Date.parse(new Date()));

        // Subscriber.publish(
        //     "fms_serviceA_onVisibilityChanged",
        //     (err,data) => {
        //         console.log("formSystemTestServiceB: onVisibilityChanged publish callback return! ")
        //     }
        // );
    },

    onAcquireState(want) {
        console.log('formSystemTestServiceB:  OnAcquireState ok, '+ 'want.abilityName:' + want.abilityName + ', want.bundleName:' + want.bundleName + ', time stamp:'+ Date.parse(new Date()));

        // Subscriber.publish(
        //     "fms_serviceA_onAcquireState",
        //     (err,data) => {
        //         console.log("formSystemTestServiceB: onAcquireState publish callback return! ")
        //     }
        // );
    }
};