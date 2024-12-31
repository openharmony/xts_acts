if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface Index_Params {
    message?: string;
    //获取上下文对象
    context?;
}
import type common from "@ohos:app.ability.common";
import type Want from "@ohos:app.ability.Want";
import hilog from "@ohos:hilog";
import type { BusinessError } from "@ohos:base";
class Index extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.__message = new ObservedPropertySimplePU('appA', this, "message");
        this.context = getContext(this) as common.UIAbilityContext;
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: Index_Params) {
        if (params.message !== undefined) {
            this.message = params.message;
        }
        if (params.context !== undefined) {
            this.context = params.context;
        }
    }
    updateStateVars(params: Index_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
        this.__message.purgeDependencyOnElmtId(rmElmtId);
    }
    aboutToBeDeleted() {
        this.__message.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
    private __message: ObservedPropertySimplePU<string>;
    get message() {
        return this.__message.get();
    }
    set message(newValue: string) {
        this.__message.set(newValue);
    }
    //获取上下文对象
    private context;
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create({ space: 5 });
            Column.debugLine("SpecifedProcess/src/main/ets/pages/Index.ets(13:5)", "specifedprocess");
            Column.height('100%');
            Column.width('100%');
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(this.message);
            Text.debugLine("SpecifedProcess/src/main/ets/pages/Index.ets(14:7)", "specifedprocess");
            Text.id('appA');
            Text.fontSize(50);
            Text.fontWeight(FontWeight.Bold);
            Text.alignRules({
                center: { anchor: '__container__', align: VerticalAlign.Center },
                middle: { anchor: '__container__', align: HorizontalAlign.Center }
            });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel('TestCase4');
            Button.debugLine("SpecifedProcess/src/main/ets/pages/Index.ets(22:7)", "specifedprocess");
            Button.id('TestCase4');
            Button.onClick(() => {
                let want: Want = {
                    deviceId: '',
                    bundleName: 'com.example.appb',
                    moduleName: 'assist',
                    abilityName: 'AssistAbility1',
                    parameters: {
                        processKey: 'sub'
                    }
                };
                let want1: Want = {
                    deviceId: '',
                    bundleName: 'com.example.appb',
                    moduleName: 'assist',
                    abilityName: 'AssistAbility2',
                    parameters: {
                        processKey: 'sub1'
                    }
                };
                //唤起另一个ability基于context starAbility调起UIAbility
                //返回一个promis对象
                this.context.startAbility(want)
                    .then(() => {
                    hilog.info(0x0000, 'startAbility', '%{public}s', 'success startAbility1');
                })
                    .catch((error: BusinessError) => {
                    hilog.info(0x0000, 'startAbility', '%{public}s', 'startAbility1 error');
                });
                this.context.startAbility(want1)
                    .then(() => {
                    hilog.info(0x0000, 'startAbility', '%{public}s', 'success startAbility2');
                })
                    .catch((error: BusinessError) => {
                    hilog.info(0x0000, 'startAbility', '%{public}s', 'startAbility2 error');
                });
            });
        }, Button);
        Button.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel('TestCase6');
            Button.debugLine("SpecifedProcess/src/main/ets/pages/Index.ets(62:7)", "specifedprocess");
            Button.id('TestCase6');
            Button.onClick(() => {
                let want: Want = {
                    deviceId: '',
                    bundleName: 'com.example.appb',
                    moduleName: 'assist',
                    abilityName: 'AssistAbility1',
                    parameters: {
                        processKey: 'sub'
                    }
                };
                let want1: Want = {
                    deviceId: '',
                    bundleName: 'com.example.appb',
                    moduleName: 'assist',
                    abilityName: 'AssistAbility2',
                    parameters: {
                        processKey: 'sub1'
                    }
                };
                let want2: Want = {
                    deviceId: '',
                    bundleName: 'com.example.appb',
                    moduleName: 'assist',
                    abilityName: 'AssistAbility3',
                    parameters: {
                        processKey: 'sub2'
                    }
                };
                //唤起另一个ability基于context starAbility调起UIAbility
                //返回一个promis对象
                this.context.startAbility(want)
                    .then(() => {
                    hilog.info(0x0000, 'startAbility', '%{public}s', 'success startAbility1');
                })
                    .catch((error: BusinessError) => {
                    hilog.info(0x0000, 'startAbility', '%{public}s', 'startAbility1 error');
                });
                this.context.startAbility(want1)
                    .then(() => {
                    hilog.info(0x0000, 'startAbility', '%{public}s', 'success startAbility2');
                })
                    .catch((error: BusinessError) => {
                    hilog.info(0x0000, 'startAbility', '%{public}s', 'startAbility2 error');
                });
                this.context.startAbility(want2)
                    .then(() => {
                    hilog.info(0x0000, 'startAbility', '%{public}s', 'success startAbility3');
                })
                    .catch((error: BusinessError) => {
                    hilog.info(0x0000, 'startAbility', '%{public}s', 'startAbility3 error');
                });
            });
        }, Button);
        Button.pop();
        Column.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "Index";
    }
}
registerNamedRoute(() => new Index(undefined, {}), "", { bundleName: "com.example.appa", moduleName: "SpecifedProcess", pagePath: "pages/Index", pageFullPath: "SpecifedProcess/src/main/ets/pages/Index", integratedHsp: "false" });
