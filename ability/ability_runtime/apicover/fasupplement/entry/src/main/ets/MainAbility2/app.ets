import ability_featureAbility from '@ohos.ability.featureAbility';
import commonEvent from '@ohos.commonEvent';

var printLog1 = "Fa:MainAbility2:";
var listPush1 = "Fa_MainAbility2_";
export default {
  onCreate() {
    console.info(printLog1 + 'onCreate');

    let list = ["ohos.permission.CAMERA"]
    ability_featureAbility.getContext().requestPermissionsFromUser(list, 1).then((permissionRequestResult) => {
      console.info(printLog1 + "requestPermissionsFromUser data = " + JSON.stringify(permissionRequestResult));
      var CommonEventPublishData = {
        parameters: {
          permissionRequestResult: permissionRequestResult
        }
      }
      commonEvent.publish(listPush1 + "onCreate", CommonEventPublishData, (err) => {
        console.info(printLog1 + listPush1 + "onCreate");
      });
    }).catch((err) => {
      console.info(printLog1 + "requestPermissionsFromUser err = " + JSON.stringify(err));
    });

    setTimeout(()=>{
      ability_featureAbility.terminateSelf().then((data) => {
        console.info(printLog1 + "terminateSelf data = " + JSON.stringify(data));
      }).catch((err) => {
        console.info(printLog1 + "terminateSelf err = " + JSON.stringify(err));
      });
    }, 3000)
  },
  onDestroy() {
    console.info(printLog1 + 'onDestroy');

    commonEvent.publish(listPush1 + "onDestroy", (err) => {
      console.info(printLog1 + listPush1 + "onDestroy");
    });
  },
  onActive() {
    console.info(printLog1 + 'onActive');
  },
  onInactive() {
    console.info(printLog1 + 'onInactive');
  },
  onShow() {
    console.info(printLog1 + 'onShow');
  },
  onHide() {
    console.info(printLog1 + 'onHide');
  }
}