import notify from '@ohos.notification'

export default {
    async onCreate() {
        //var subscriber;
        console.info("============== AceApplication onCreate ==============");
        //consume回调
//        async function consumeCallback(err, data) {
//            console.info("============== consumeCallback start ============== err : " + err.code);
//        }
//        //订阅回调
//        async function subscribeCallback(err, data) {
//            console.info("============== subscribeCallback start ============== err : " + err.code);
//        }
//        //发布回调
//        async function publishCallback(err) {
//            console.info("============== publishCallback start ============== err : " + err.code);
//        }
//
//        //1.创建订阅者
//        subscriber = notify.createSubscriber();
//
//        //2.绑定相关回调
//        //consume：通知更新回调
//        await subscriber.on("consume", consumeCallback);
//        //subscribe：注册订阅状态回调
//        //await subscriber.on("subscribe", subscribeCallback);
//        //consume：接收通知回调
//        //await subscriber.on("consume", consumeCallback);
//        //cancel：取消通知回调
//        //await subscriber.on("cancel", cancelCallback);
//        //unsubscribe：取消订阅状态回调
//        //await subscriber.on("unsubscribe", unsubscribeCallback);
//        //die：通知服务死亡回调
//        //await subscriber.on("die", dieCallback);
//
//        //3.注册订阅（全部订阅）
//        await notify.subscribe(subscriber, subscribeCallback);
//        //指定订阅范围
//        //var notificationSubscriberInfo = {
//        //    bundleNames:["com.example.test"],
//        //}
//        //await notify.subscribe(subscriber, notificationSubscriberInfo, subscribeCallback);
//
//        //4.构建notificationRequest
//        var notificationRequest = {
//            content:{
//                contentType: notify.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
//                normal: {
//                    title: "AceApplication_Title",
//                    text: "AceApplication_Text",
//                    additionalText: "AceApplication_AdditionalText"
//                },
//            },
//            id: 1,
//            slotType : notify.SlotType.OTHER_TYPES
//        }
//
//        //5.发布
//        await notify.publish(notificationRequest, publishCallback);
    },
    onDestroy() {
        console.info('=============AceApplication onDestroy=============');
    }
};
