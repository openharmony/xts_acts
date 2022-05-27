import FormViewModel from './FormViewModel.ets';
import router from '@system.router';
import featureAbility from "@ohos.ability.featureAbility";
import formManager from '@ohos.application.formHost'
import commonEvent from '@ohos.commonEvent';
@Entry
@Component
struct Index {
  @State formId: number = 0;
  @State bundle: string = "com.form.formsystemtestservicea.hmservice";
  @State ability: string = "com.form.formsystemtestservicea.hmservice.MainAbility";
  @State moduleName: string = "entry";
  @State name: string = "Form_Js001";  
  @State width: number = 300;
  @State height: number = 200;  
  @State allowUpate: boolean = true;
  @State onAcquireResult: string = "";
  @State isShowing: boolean = true;
  @State canCreateForm: boolean = false;
  private dimension: FormDimension = FormDimension.Dimension_1_2;

  private deleteForm = false;
  private deleteId = "-1";
  private temporaryId="-1";
  private temporary = false;
  private mFormViewModel: FormViewModel;
  private isVisible = false;
  private mMargin = 15;
  private BTN_BG_COLOR: string = '#0D9FFB';
  private castForm = false;
  private tempFormId: number = 0;

  private formOnAcquiredEvent = "FMS_FormOnAcquired_commonEvent";
  private formCastEvent = "FMS_FormCast_commonEvent";
  private formOnErrorEvent = "FMS_FormOnError_commonEvent";

  private subscriberDel;
  private subscriberFormDeleteEvent = {
    events: ["FMS_FormDelete_commonEvent"],
  };

  private publishOnErrorCallBack() {
    this.canCreateForm = false;
    console.debug("====>formOnErrorEvent Publish CallBack ====>");
  }
  private publishOnAcquiredCallBack() {
    console.debug("====>formOnAcquiredEvent Publish CallBack ====>");
  }
  private publishCastCallBack() {
    console.debug("====>formCastEvent Publish CallBack ====>");
  }

  private deleteCallBack(err, data) {
    console.info("!!!====>formsystemhostj deleteCallBack start:====>" + JSON.stringify(data));
    if(data.bundleName && data.bundleName != "com.ohos.st.formsystemhostj") {
      return;
    }
    formManager.deleteForm(data.data)
      .then((data2) => {
        console.info('[FormComponent] deleteForm result:' + data2);
      });

    this.canCreateForm = false;
    console.info("!!!====>formsystemhostj deleteCallBack end ====>");
  }

  private unSubscribeDeleteCallback() {
      console.debug("====>formsystemhostj unSubscribeDeleteCallback_1100 CallBack====>");
  }

  private aboutToAppear() {

    const TAG = "[FormComponent.host]"

    this.mFormViewModel = FormViewModel.getInstance();  

    commonEvent.createSubscriber(this.subscriberFormDeleteEvent).then(async (data) => {
        console.info("====>formsystemhostj Subscriber FormDelete data:====>", JSON.stringify(data)); 
        this.subscriberDel = data;     
        await commonEvent.subscribe(this.subscriberDel, this.deleteCallBack);
    })

    console.error('[FormComponent] getWant');
    featureAbility.getWant()
    .then((want: any) => {
      this.formId = parseInt(want.parameters.formId);
      this.name = want.parameters.name;
      this.bundle =  want.parameters.bundle;
      this.ability = want.parameters.ability;
      this.moduleName = want.parameters.moduleName;
      if(want.parameters.temporary) {
        this.temporary = want.parameters.temporary;
      }
      console.log("formsystemhostj dimension1:" + this.dimension);
      if(want.parameters.dimension) {
        this.dimension = want.parameters.dimension;
      }      
      console.log("formsystemhostj dimension2:" + this.dimension);
      if(want.parameters.castForm) {
        this.castForm = want.parameters.castForm;
      }
      if(want.parameters.temporaryId) {
        this.temporaryId = want.parameters.temporaryId;
      }
      if(want.parameters.deleteForm) {
        this.deleteForm = want.parameters.deleteForm;
      }
      if(want.parameters.deleteId) {
        this.deleteId = want.parameters.deleteId;
      }
      setTimeout(() => {
        this.canCreateForm = want.parameters.isCreate ? true : false;
        console.error('[FormComponent] getWant canCreateForm:'+ this.canCreateForm); 
      }, 10); 
      console.error('[FormComponent] getWant end'+ JSON.stringify(want));

      if(!want.parameters.isCreate && this.deleteForm) {
        console.log("formsystemhostj deleteForm start");
        formManager.deleteForm(this.deleteId)
          .then((data) => {
          console.info('formsystemhostj deleteForm result:' + data);
          let commonEventPublishData = {
            data: data.toString(),
            parameters: {
              "formId" : this.deleteId.toString()
            }
          };
          commonEvent.publish(this.formOnErrorEvent, commonEventPublishData, this.publishOnErrorCallBack);
        })
        .catch((error) => {
          console.info('[FormComponent] deleteForm error:' + error);
          let commonEventPublishData = {
            data: error.code.toString(),
            parameters: {
              "formId" : this.deleteId.toString()
            }
          };
          commonEvent.publish(this.formOnErrorEvent, commonEventPublishData, this.publishOnErrorCallBack);
        });
        console.log("formsystemhostj deleteForm end");
      }
      if(!want.parameters.isCreate && this.castForm) {
        console.log("[FormComponent.host] castTempForm start");
        formManager.castTempForm(this.temporaryId)
            .then((data) => {
            console.info('[FormComponent] castTempForm result:' + data);
              setTimeout(() => {
              let commonEventPublishData = {
                data: data.toString(),
                parameters: {
                  "formId" : this.temporaryId.toString()
                }
              };
              commonEvent.publish(this.formCastEvent, commonEventPublishData, this.publishCastCallBack);
            }, 5);
          })
          .catch((error) => {
            console.info('[FormComponent] castTempForm error:' + error);
              setTimeout(() => {
              let commonEventPublishData = {
                data: error.code.toString(),
                parameters: {
                  "formId" : this.temporaryId.toString()
                }
              };
              commonEvent.publish(this.formCastEvent, commonEventPublishData, this.publishCastCallBack);
            }, 5);
          });               
        console.log("[FormComponent.host] castTempForm end");
      }
    })
    .catch((error: any) => {
      console.error('[FormComponent] Operation failed. Cause: ' + JSON.stringify(error));
    })
    console.log(`[FormComponent.host] aboutToAppear end`);
  }

  build() {
      Column() {
        Text('form component test begin')
        Column() {
          if (this.canCreateForm) {
            FormComponent({
            id: this.formId,
            name: this.name,
            bundle: this.bundle,
            ability: this.ability,
            module: this.moduleName,
            dimension: this.dimension,
            temporary: this.temporary,
          })
            .allowUpdate(this.allowUpate)
            .visibility(this.isShowing ? Visibility.Visible : Visibility.Hidden)
            .onAcquired((form) => {
              console.log("[FormComponent.host] get form, form id:" + form.id);
              this.formId = form.id;
              if(this.castForm) {
                console.log("[FormComponent.host] castTempForm start");
                formManager.castTempForm(this.temporaryId)
                    .then((data) => {
                    console.info('[FormComponent] castTempForm result:' + data);
                     setTimeout(() => {
                      let commonEventPublishData = {
                        data: data.toString(),
                        parameters: {
                          "formId" : this.formId.toString()
                        }
                      };
                      commonEvent.publish(this.formCastEvent, commonEventPublishData, this.publishCastCallBack);
                    }, 5);
                  })
                  .catch((error) => {
                    console.info('[FormComponent] castTempForm error:' + error);
                      setTimeout(() => {
                      let commonEventPublishData = {
                        data: error.code.toString(),
                        parameters: {
                          "formId" : this.temporaryId.toString()
                        }
                      };
                      commonEvent.publish(this.formCastEvent, commonEventPublishData, this.publishCastCallBack);
                    }, 5);
                  });               
                console.log("[FormComponent.host] castTempForm end");
              } else if(this.deleteForm) {
                console.log("[FormComponent.host] deleteForm start");
                if(this.deleteId == "self") {
                  this.deleteId = this.formId.toString();
                }
                setTimeout(() => {
                  formManager.deleteForm(this.deleteId)
                    .then((data) => {
                    console.info('[FormComponent] deleteForm result:' + data);
                    let commonEventPublishData = {
                      data: data.toString(),
                      parameters: {
                        "formId" : this.deleteId.toString()
                      }
                    };
                    commonEvent.publish(this.formOnErrorEvent, commonEventPublishData, this.publishOnErrorCallBack);
                  })
                  .catch((error) => {
                    console.info('[FormComponent] deleteForm error:' + error);
                    let commonEventPublishData = {
                      data: error.code.toString(),
                      parameters: {
                        "formId" : this.deleteId.toString()
                      }
                    };
                    commonEvent.publish(this.formOnErrorEvent, commonEventPublishData, this.publishOnErrorCallBack);
                  });
               
                  console.log("[FormComponent.host] deleteForm end");
                }, 1000);                
              } else {
                let commonEventPublishData = {
                    data: this.formId.toString(),
                      parameters: {
                        "formId" : this.deleteId.toString()
                      }
                };
                commonEvent.publish(this.formOnAcquiredEvent, commonEventPublishData, this.publishOnAcquiredCallBack);
              }
            })
            // .onUninstall((info) => {
            //   console.log("[FormComponent] onUninstall:" + JSON.stringify(info));
            // })
            .onError((error) => {
              console.log("[FormComponent.host] error code:" + error.errcode);
              console.log("[FormComponent.host] error msg:" + error.msg);
              this.onAcquireResult += error.errcode;
              this.onAcquireResult += " ";
              this.onAcquireResult += error.msg;
              if(this.deleteForm && this.deleteId) {
                let commonEventPublishData = {
                    data: error.msg,
                    parameters: {
                      "formId" : this.formId.toString()
                    }
                };
                commonEvent.publish(this.formOnErrorEvent, commonEventPublishData, this.publishOnErrorCallBack);
              } else {
                let commonEventPublishData = {
                    data: error.msg
                };
                commonEvent.publish(this.formOnErrorEvent, commonEventPublishData, this.publishOnErrorCallBack);
              }
            })
          }
        }
        .backgroundColor(Color.White)
        Text('form component test end')
      }
      .backgroundColor(Color.White)
  }
}