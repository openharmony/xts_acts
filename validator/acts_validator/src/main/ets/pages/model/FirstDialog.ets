import data_preferences from '@ohos.data.preferences';


export default class FirstDialog{
  static ChooseDialog = async (StepTips:string,name: string)=>{
    let Test = null;
    let context =null;
    context = globalThis.getContext();
    let preferences;

    let promise = data_preferences.getPreferences(context,'mystore');
    await promise.then((object) => {
      preferences = object;
    })
    promise = preferences.get(name, 0);
    await promise.then((data) => {
      Test = data;
      console.info("Succeeded in getting value of 'startup'. Data: " + data);
    })
    if(Test != 1) {
      AlertDialog.show(
        {
          title: '操作提示',
          message: StepTips,
          primaryButton: {
            value: '不再提醒',fontColor:Color.Grey,
            action: () => {
              let promise = preferences.put(name, 1);
              promise.then(() => {
                console.info("Succeeded in putting value of 'test'.");
              })
              promise = preferences.flush();
              promise.then(() => {
                console.info("Succeeded in flushing.");
              })
            }
          },
          secondaryButton: {
            value: '我已知晓',
            action: () => {

            }
          },
          cancel: () => {

          }
        }
      )
    }
    return
  }
}